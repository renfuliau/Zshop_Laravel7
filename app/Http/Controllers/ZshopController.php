<?php

namespace App\Http\Controllers;

use Auth;
use Session;
use App\User;
use App\Models\Cart;
use App\Models\Post;
use App\Models\Banner;
use App\Models\Product;
use App\Models\Category;
use App\Models\Coupon;
use App\Models\Order;
use App\Models\RewardMoneyHistory;
use App\Models\Settings;
use App\Models\Wishlist;
use App\Models\UserLevel;
use Illuminate\Http\Request;
use App\Rules\MatchOldPassword;
use Illuminate\Support\Facades\Auth as FacadesAuth;
use Illuminate\Support\Facades\Hash;

class ZshopController extends Controller
{
    public function index()
    {
        $category = Category::getAllParentWithChild();
        $banners = Banner::where('status', 'active')->limit(3)->orderBy('id', 'DESC')->get();
        return view('zshop.layouts.index')
            ->with('banners', $banners)
            ->with('category', $category);
    }

    public function login()
    {
        $category = Category::getAllParentWithChild();
        return view('zshop.layouts.pages.login-register')->with('category', $category);
    }

    public function loginSubmit(Request $request)
    {
        $data = $request->all();
        if (Auth::attempt(['email' => $data['email'], 'password' => $data['password'], 'status' => 'active'])) {
            Session::put('user', $data['email']);
            request()->session()->flash('success', '成功登入');
            return redirect()->route('zshop-index');
        } else {
            request()->session()->flash('error', '帳號或密碼錯誤，請確認後再試!');
            return redirect()->back();
        }
    }

    public function registerSubmit(Request $request)
    {
        // return $request->all();
        $this->validate($request, [
            'email' => 'string|required|unique:users,email',
            'password' => 'required|min:6|confirmed',
        ]);
        $data = $request->all();
        // $data['user_level_id'] = 1;
        // dd($data);
        $check = $this->create($data);
        Session::put('user', $data['email']);
        if ($check) {
            request()->session()->flash('success', '註冊成功');
            return redirect()->route('zshop-login-register');
        } else {
            request()->session()->flash('error', '系統錯誤，請聯繫客服!');
            return back();
        }
    }

    public function create(array $data)
    {
        return User::create([
            'email' => $data['email'],
            'password' => Hash::make($data['password']),
            'status' => 'active',
            'user_level_id' => 1
        ]);
    }

    public function forgetPassword()
    {
        return view('zshop.auth.passwords.forget-password');
    }

    public function contact()
    {
        $category = Category::getAllParentWithChild();
        $photo_path = Settings::getPhoto()->photo;
        // dd($photo_path);
        return view('zshop.layouts.pages.contact')
            ->with('photo_path', $photo_path)
            ->with('category', $category);
    }



    // 商品呈現
    public function productlist()
    {
        $products = Product::query();
        $category = Category::getAllParentWithChild();

        if (!empty($_GET['category'])) {
            $slug = explode(',', $_GET['category']);
            // dd($slug);
            $cat_ids = Category::select('id')->whereIn('slug', $slug)->pluck('id')->toArray();
            // dd($cat_ids);
            $products->whereIn('cat_id', $cat_ids);
            // return $products;
        }

        if (!empty($_GET['sortBy'])) {
            if ($_GET['sortBy'] == 'title') {
                $products = $products->where('status', 'active')->orderBy('title', 'ASC');
            }
            if ($_GET['sortBy'] == 'price') {
                $products = $products->orderBy('price', 'ASC');
            }
        }

        if (!empty($_GET['price'])) {
            $price = explode('-', $_GET['price']);
            // return $price;
            // if(isset($price[0]) && is_numeric($price[0])) $price[0]=floor(Helper::base_amount($price[0]));
            // if(isset($price[1]) && is_numeric($price[1])) $price[1]=ceil(Helper::base_amount($price[1]));

            $products->whereBetween('price', $price);
        }

        $recent_products = Product::where('status', 'active')->orderBy('id', 'DESC')->limit(3)->get();
        // Sort by number
        if (!empty($_GET['show'])) {
            $products = $products->where('status', 'active')->paginate($_GET['show']);
        } else {
            $products = $products->where('status', 'active')->paginate(9);
        }
        // Sort by name , price, category


        return view('zshop.layouts.pages.productlist-all')
            ->with('products', $products)
            ->with('recent_products', $recent_products)
            ->with('category', $category);
    }

    public function productlistByCategory(Request $request)
    {
        $category = Category::getAllParentWithChild();
        $title = $request->title;
        $products = Category::getProductByCat($request->slug);
        // dd($request->title);
        // return $request->slug;
        $recent_products = Product::where('status', 'active')->orderBy('id', 'DESC')->limit(3)->get();

        // if (request()->is('e-shop.loc/product-grids')) {
        //     return view('frontend.pages.product-grids')->with('products', $products->products)->with('recent_products', $recent_products);
        // } else {
        return view('zshop.layouts.pages.productlist')
            ->with('products', $products->products)
            ->with('recent_products', $recent_products)
            ->with('category', $category)
            ->with('title', $title);
        // }
    }

    public function productSubcategory(Request $request)
    {
        $category = Category::getAllParentWithChild();
        $products = Category::getProductBySubCat($request->sub_slug);
        $title = $request->title;
        $subtitle = $request->subtitle;
        // return $products;
        // dd($request->subtitle);
        $recent_products = Product::where('status', 'active')->orderBy('id', 'DESC')->limit(3)->get();

        // if (request()->is('e-shop.loc/product-grids')) {
        //     return view('frontend.pages.product-grids')->with('products', $products->sub_products)->with('recent_products', $recent_products);
        // } else {
        return view('zshop.layouts.pages.productlist')
            ->with('products', $products->sub_products)
            ->with('recent_products', $recent_products)
            ->with('category', $category)
            ->with('title', $title)
            ->with('subtitle', $subtitle);
        // }
    }

    public function productDetail($slug)
    {
        $category = Category::getAllParentWithChild();
        $product_detail = Product::getProductBySlug($slug);
        // dd($product_detail->cat_info);
        return view('zshop.layouts.pages.product-detail')
            ->with('category', $category)
            ->with('product_detail', $product_detail);
    }



    // 購物車
    protected $product = null;
    public function __construct(Product $product)
    {
        $this->product = $product;
    }

    public function cart()
    {
        $category = Category::getAllParentWithChild();
        $user = Auth()->user();
        // dd($user);
        $cart = Cart::with('product')->where('user_id', $user->id)->where('order_id', null)->get();
        // $products = $cart->product;
        // dd($cart);
        $total_amount = 0;
        foreach ($cart as $key => $value) {
            $total_amount += $value->amount;
        }

        $coupon1 = Coupon::where([
            ['coupon_line', '=', Coupon::where([
                ['coupon_line', '<', $total_amount],
                ['coupon_type', '=', 1]
            ])->get()->max('coupon_line')],
            ['coupon_type', '=', 1]
        ])->first();
        // dd($coupon1);

        $coupon2 = Coupon::where([
            ['coupon_line', '=', Coupon::where([
                ['coupon_line', '<', $total_amount],
                ['coupon_type', '=', 2]
            ])->get()->max('coupon_line')],
            ['coupon_type', '=', 2]
        ])->first();
        // dd($coupon2);

        return view('zshop.layouts.pages.cart')
            ->with('category', $category)
            ->with('cart', $cart)
            ->with('coupon1', $coupon1)
            ->with('coupon2', $coupon2);
    }

    public function checkout()
    {
        $category = Category::getAllParentWithChild();
        return view('zshop.layouts.pages.checkout')->with('category', $category);
    }

    public function checkoutStore(Request $request)
    {
        $this->validate($request, [
            'first_name' => 'string|required',
            'phone' => 'required',
            'post_code' => 'string|required',
            'address1' => 'string|required',
        ]);
        // return $request->all();

        if (empty(Cart::where('user_id', auth()->user()->id)->where('order_id', null)->first())) {
            request()->session()->flash('error', '購物車為空，請確認購物車商品!');
            return back();
        }
        $order = new Order();
        $order_data = $request->all();
        $order_data['order_number'] = 'ORD-' . strtoupper(Str::random(10));
        $order_data['user_id'] = $request->user()->id;
        $order_data['shipping_id'] = $request->shipping;
        $shipping = Shipping::where('id', $order_data['shipping_id'])->pluck('price');
        // return session('coupon')['value'];
        $order_data['sub_total'] = Helper::totalCartPrice();
        $order_data['quantity'] = Helper::cartCount();
        if (session('coupon')) {
            $order_data['coupon'] = session('coupon')['value'];
        }
        if ($request->shipping) {
            if (session('coupon')) {
                $order_data['total_amount'] = Helper::totalCartPrice() + $shipping[0] - session('coupon')['value'];
            } else {
                $order_data['total_amount'] = Helper::totalCartPrice() + $shipping[0];
            }
        } else {
            if (session('coupon')) {
                $order_data['total_amount'] = Helper::totalCartPrice() - session('coupon')['value'];
            } else {
                $order_data['total_amount'] = Helper::totalCartPrice();
            }
        }
        // return $order_data['total_amount'];
        $order_data['status'] = "new";
        if (request('payment_method') == 'paypal') {
            $order_data['payment_method'] = 'paypal';
            $order_data['payment_status'] = 'paid';
        } else {
            $order_data['payment_method'] = 'cod';
            $order_data['payment_status'] = 'Unpaid';
        }
        $order->fill($order_data);
        $status = $order->save();
        if ($order)
            // dd($order->id);
            $users = User::where('role', 'admin')->first();
        $details = [
            'title' => 'New order created',
            'actionURL' => route('order.show', $order->id),
            'fas' => 'fa-file-alt'
        ];
        Notification::send($users, new StatusNotification($details));
        if (request('payment_method') == 'paypal') {
            return redirect()->route('payment')->with(['id' => $order->id]);
        } else {
            session()->forget('cart');
            session()->forget('coupon');
        }
        Cart::where('user_id', auth()->user()->id)->where('order_id', null)->update(['order_id' => $order->id]);

        // dd($users);
        request()->session()->flash('success', '訂單已成功送出，感謝您的支持');
        return redirect()->route('home');
    }

    public function addToCart(Request $request)
    {
        // dd($request->all());
        if (empty($request->slug)) {
            request()->session()->flash('error', '商品不存在，請聯繫客服！');
            return back();
        }
        $product = Product::where('slug', $request->slug)->first();
        // return $product;
        if (empty($product)) {
            request()->session()->flash('error', '商品不存在，請聯繫客服！');
            return back();
        }

        $already_cart = Cart::where('user_id', auth()->user()->id)->where('order_id', null)->where('product_id', $product->id)->first();
        // return $already_cart;
        if ($already_cart) {
            // dd($already_cart);
            $already_cart->quantity = $already_cart->quantity + 1;
            $already_cart->amount = ($product->price * (100 - $product->discount) * 0.01) + $already_cart->amount;
            // return $already_cart->quantity;
            if ($already_cart->product->stock < $already_cart->quantity || $already_cart->product->stock <= 0) return back()->with('error', 'Stock not sufficient!.');
            $already_cart->save();
        } else {

            $cart = new Cart;
            $cart->user_id = auth()->user()->id;
            $cart->product_id = $product->id;
            $cart->price = ($product->price - ($product->price * $product->discount) / 100);
            $cart->quantity = 1;
            $cart->amount = $cart->price * $cart->quantity;
            if ($cart->product->stock < $cart->quantity || $cart->product->stock <= 0) return back()->with('error', 'Stock not sufficient!.');
            $cart->save();
            $wishlist = Wishlist::where('user_id', auth()->user()->id)->where('cart_id', null)->update(['cart_id' => $cart->id]);
        }
        request()->session()->flash('success', '商品成功加入購物車');
        return back();
    }



    // 會員中心
    public function home()
    {
        $category = Category::getAllParentWithChild();
        $profile = Auth()->user();
        // dd($profile);
        $user_level = UserLevel::getUserLevelName($profile->user_level_id);
        // dd($user_level);
        // return $profile;
        return view('zshop.user.users.profile')
            ->with('category', $category)
            ->with('profile', $profile)
            ->with('user_level', $user_level);
    }

    public function profileUpdate(Request $request, $id)
    {
        // return $request->all();
        $user = User::findOrFail($id);
        // dd($user);
        $data = $request->all();
        $status = $user->fill($data)->save();
        if ($status) {
            request()->session()->flash('success', '個人資料已更新');
        } else {
            request()->session()->flash('error', '發生錯誤，請稍後再試!');
        }
        return redirect()->back();
    }

    public function changePassword()
    {
        $category = Category::getAllParentWithChild();
        $profile = Auth()->user();
        return view('zshop.user.users.change-password')
            ->with('category', $category)
            ->with('profile', $profile);
        // return view('zshop.user.users.change-password');
    }
    public function changPasswordStore(Request $request)
    {
        $request->validate(
            [
                'current_password' => ['required', new MatchOldPassword],
                'new_password' => ['required'],
                'new_confirm_password' => ['same:new_password'],
            ],
            [
                'same' => '確認密碼錯誤，請重新輸入!'
            ]
        );

        User::find(auth()->user()->id)->update(['password' => Hash::make($request->new_password)]);

        return redirect()->route('zshop-user-home')->with('success', 'Password successfully changed');
    }

    public function rewardMoney()
    {
        $category = Category::getAllParentWithChild();
        $profile = Auth()->user();
        $reward_money_history = RewardMoneyHistory::where('user_id', $profile->id)
            ->orderBy('id', 'desc')
            ->take(10)
            ->get();
        // dd($reward_money_history);
        // return $profile;
        return view('zshop.user.users.reward-money')
            ->with('category', $category)
            ->with('profile', $profile)
            ->with('reward_money_history', $reward_money_history);
    }

    public function orders()
    {
        $category = Category::getAllParentWithChild();
        $profile = Auth()->user();
        $orders = Order::where('user_id', $profile->id)->get();
        // return $profile;
        return view('zshop.user.users.orders')
            ->with('category', $category)
            ->with('profile', $profile)
            ->with('orders', $orders);
    }

    public function returned()
    {
        $category = Category::getAllParentWithChild();
        $profile = Auth()->user();
        $orders = Order::where('user_id', $profile->id)->get();
        // return $profile;
        return view('zshop.user.users.returned')
            ->with('category', $category)
            ->with('profile', $profile)
            ->with('orders', $orders);
    }

    public function wishlist()
    {
        $category = Category::getAllParentWithChild();
        $profile = Auth()->user();
        // return $profile;
        return view('zshop.user.users.wishlist')
            ->with('category', $category)
            ->with('profile', $profile);
    }

    public function addToWishlist(Request $request)
    {
        // dd($request->all());
        if (empty($request->slug)) {
            request()->session()->flash('error', '未知的產品，請聯絡客服');
            return back();
        }
        $product = Product::where('slug', $request->slug)->first();
        // return $product;
        if (empty($product)) {
            request()->session()->flash('error', '未知的產品，請聯絡客服');
            return back();
        }

        $already_wishlist = Wishlist::where('user_id', auth()->user()->id)->where('cart_id', null)->where('product_id', $product->id)->first();
        // return $already_wishlist;
        if ($already_wishlist) {
            request()->session()->flash('error', '此商品已經存在於收藏清單');
            return back();
        } else {

            $wishlist = new Wishlist;
            $wishlist->user_id = auth()->user()->id;
            $wishlist->product_id = $product->id;
            $wishlist->price = ($product->price - ($product->price * $product->discount) / 100);
            $wishlist->quantity = 1;
            $wishlist->amount = $wishlist->price * $wishlist->quantity;
            if ($wishlist->product->stock < $wishlist->quantity || $wishlist->product->stock <= 0) return back()->with('error', 'Stock not sufficient!.');
            $wishlist->save();
        }
        request()->session()->flash('success', '商品已加入收藏清單');
        return back();
    }

    public function wishlistDelete(Request $request)
    {
        $wishlist = Wishlist::find($request->id);
        if ($wishlist) {
            $wishlist->delete();
            request()->session()->flash('success', '商品已經移出收藏清單');
            return back();
        }
        request()->session()->flash('error', '發生錯誤，請聯絡客服');
        return back();
    }

    public function qaCenter()
    {
        $category = Category::getAllParentWithChild();
        $profile = Auth()->user();
        // return $profile;
        return view('zshop.user.users.qa-center')
            ->with('category', $category)
            ->with('profile', $profile);
    }
}
