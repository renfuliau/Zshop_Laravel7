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
use App\Models\Settings;
use App\Models\Wishlist;
use App\Models\UserLevel;
use Illuminate\Http\Request;
use App\Rules\MatchOldPassword;
use Illuminate\Support\Facades\Hash;

class ZshopController extends Controller
{
    public function index(){
        $category = Category::getAllParentWithChild();
        $banners=Banner::where('status','active')->limit(3)->orderBy('id','DESC')->get();
        return view('zshop.layouts.index')
                ->with('banners',$banners)
                ->with('category', $category);
    }

    public function login(){
        $category = Category::getAllParentWithChild();
        return view('zshop.layouts.pages.login-register')->with('category', $category);
    }

    public function loginSubmit(Request $request){
        $data= $request->all();
        if(Auth::attempt(['email' => $data['email'], 'password' => $data['password'],'status'=>'active'])){
            Session::put('user',$data['email']);
            request()->session()->flash('success','Successfully login');
            return redirect()->route('zshop-index');
        }
        else{
            request()->session()->flash('error','Invalid email and password pleas try again!');
            return redirect()->back();
        }
    }

    public function registerSubmit(Request $request){
        // return $request->all();
        $this->validate($request,[
            'email'=>'string|required|unique:users,email',
            'password'=>'required|min:6|confirmed',
        ]);
        $data=$request->all();
        // $data['user_level_id'] = 1;
        // dd($data);
        $check=$this->create($data);
        Session::put('user',$data['email']);
        if($check){
            request()->session()->flash('success','Successfully registered');
            return redirect()->route('zshop-login-register');
        }
        else{
            request()->session()->flash('error','Please try again!');
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

    public function forgetPassword(){
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



    // 購物車
    protected $product=null;
    public function __construct(Product $product){
        $this->product=$product;
    }

    public function cart()
    {
        $category = Category::getAllParentWithChild();
        return view('zshop.layouts.pages.cart')->with('category', $category);
    }

    public function checkout()
    {
        $category = Category::getAllParentWithChild();
        return view('zshop.layouts.pages.checkout')->with('category', $category);
    }

    public function addToCart(Request $request){
        // dd($request->all());
        if (empty($request->slug)) {
            request()->session()->flash('error','Invalid Products');
            return back();
        }
        $product = Product::where('slug', $request->slug)->first();
        // return $product;
        if (empty($product)) {
            request()->session()->flash('error','Invalid Products');
            return back();
        }

        $already_cart = Cart::where('user_id', auth()->user()->id)->where('order_id',null)->where('product_id', $product->id)->first();
        // return $already_cart;
        if($already_cart) {
            // dd($already_cart);
            $already_cart->quantity = $already_cart->quantity + 1;
            $already_cart->amount = $product->price+ $already_cart->amount;
            // return $already_cart->quantity;
            if ($already_cart->product->stock < $already_cart->quantity || $already_cart->product->stock <= 0) return back()->with('error','Stock not sufficient!.');
            $already_cart->save();

        }else{

            $cart = new Cart;
            $cart->user_id = auth()->user()->id;
            $cart->product_id = $product->id;
            $cart->price = ($product->price-($product->price*$product->discount)/100);
            $cart->quantity = 1;
            $cart->amount=$cart->price*$cart->quantity;
            if ($cart->product->stock < $cart->quantity || $cart->product->stock <= 0) return back()->with('error','Stock not sufficient!.');
            $cart->save();
            $wishlist=Wishlist::where('user_id',auth()->user()->id)->where('cart_id',null)->update(['cart_id'=>$cart->id]);
        }
        request()->session()->flash('success','Product successfully added to cart');
        return back();
    }



    // 會員中心
    public function home(){
        $category = Category::getAllParentWithChild();
        $profile=Auth()->user();
        // dd($profile);
        $user_level = UserLevel::getUserLevelName($profile->user_level_id);
        // dd($user_level);
        // return $profile;
        return view('zshop.user.users.profile')
        ->with('category',$category)
        ->with('profile',$profile)
        ->with('user_level', $user_level);
    }

    public function profileUpdate(Request $request,$id){
        // return $request->all();
        $user=User::findOrFail($id);
        // dd($user);
        $data=$request->all();
        $status=$user->fill($data)->save();
        if($status){
            request()->session()->flash('success','Successfully updated your profile');
        }
        else{
            request()->session()->flash('error','Please try again!');
        }
        return redirect()->back();
    }

    public function changePassword(){
        $category = Category::getAllParentWithChild();
        $profile=Auth()->user();
        return view('zshop.user.users.change-password')
        ->with('category',$category)
        ->with('profile',$profile);
        // return view('zshop.user.users.change-password');
    }
    public function changPasswordStore(Request $request)
    {
        $request->validate([
            'current_password' => ['required', new MatchOldPassword],
            'new_password' => ['required'],
            'new_confirm_password' => ['same:new_password'],
        ],
        [
            'same' => '確認密碼錯誤，請重新輸入!'
        ]);

        User::find(auth()->user()->id)->update(['password'=> Hash::make($request->new_password)]);

        return redirect()->route('zshop-user-home')->with('success','Password successfully changed');
    }

    public function rewardMoney(){
        $category = Category::getAllParentWithChild();
        $profile=Auth()->user();
        // return $profile;
        return view('zshop.user.users.reward-money')
        ->with('category',$category)
        ->with('profile',$profile);
    }

    public function orders(){
        $category = Category::getAllParentWithChild();
        $profile=Auth()->user();
        // return $profile;
        return view('zshop.user.users.orders')
        ->with('category',$category)
        ->with('profile',$profile);
    }

    public function returned(){
        $category = Category::getAllParentWithChild();
        $profile=Auth()->user();
        // return $profile;
        return view('zshop.user.users.returned')
        ->with('category',$category)
        ->with('profile',$profile);
    }

    public function wishlist(){
        $category = Category::getAllParentWithChild();
        $profile=Auth()->user();
        // return $profile;
        return view('zshop.user.users.wishlist')
        ->with('category',$category)
        ->with('profile',$profile);
    }

    public function qaCenter(){
        $category = Category::getAllParentWithChild();
        $profile=Auth()->user();
        // return $profile;
        return view('zshop.user.users.qa-center')
        ->with('category',$category)
        ->with('profile',$profile);
    }
}
