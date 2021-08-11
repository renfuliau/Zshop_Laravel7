<?php

namespace App\Http\Controllers;

use App\Models\Post;
use App\Models\Banner;
use App\Models\Product;
use App\Models\Category;
use Illuminate\Http\Request;
use Auth;
use Session;

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
        return view('zshop.layouts.pages.login-register');
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
            'name'=>'string|required|min:2',
            'email'=>'string|required|unique:users,email',
            'password'=>'required|min:6|confirmed',
        ]);
        $data=$request->all();
        // dd($data);
        $check=$this->create($data);
        Session::put('user',$data['email']);
        if($check){
            request()->session()->flash('success','Successfully registered');
            return redirect()->route('zshop-index');
        }
        else{
            request()->session()->flash('error','Please try again!');
            return back();
        }
    }

    public function forgetPassword(){
        return view('zshop.auth.passwords.forget-password');
    }



    // 商品呈現
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

    public function productSubCat(Request $request)
    {
        $products = Category::getProductBySubCat($request->sub_slug);
        // return $products;
        $recent_products = Product::where('status', 'active')->orderBy('id', 'DESC')->limit(3)->get();

        // if (request()->is('e-shop.loc/product-grids')) {
        //     return view('frontend.pages.product-grids')->with('products', $products->sub_products)->with('recent_products', $recent_products);
        // } else {
            return view('frontend.pages.product-lists')->with('products', $products->sub_products)->with('recent_products', $recent_products);
        // }
    }



    // 會員中心
    public function home(){
        $category = Category::getAllParentWithChild();
        $profile=Auth()->user();
        // return $profile;
        return view('zshop.user.users.profile')
        ->with('category',$category)
        ->with('profile',$profile);
    }

    public function zshopMoney(){
        $category = Category::getAllParentWithChild();
        $profile=Auth()->user();
        // return $profile;
        return view('zshop.user.users.zshop-money')
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
