<?php

use App\Http\Controllers\ZshopController;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Auth::routes(['register' => false]);

Route::get('user/login', 'FrontendController@login')->name('login.form');
Route::post('user/login', 'FrontendController@loginSubmit')->name('login.submit');
Route::get('user/logout', 'FrontendController@logout')->name('user.logout');

Route::get('user/register', 'FrontendController@register')->name('register.form');
Route::post('user/register', 'FrontendController@registerSubmit')->name('register.submit');

// Reset password
Route::get('password-reset', 'FrontendController@showResetForm')->name('password.reset');

// Socialite
Route::get('login/{provider}/', 'Auth\LoginController@redirect')->name('login.redirect');
Route::get('login/{provider}/callback/', 'Auth\LoginController@Callback')->name('login.callback');

Route::get('/', 'FrontendController@home')->name('home');

// Frontend Routes
Route::get('/home', 'FrontendController@index');
Route::get('/about-us', 'FrontendController@aboutUs')->name('about-us');
Route::get('/contact', 'FrontendController@contact')->name('contact');
Route::post('/contact/message', 'MessageController@store')->name('contact.store');
Route::get('product-detail/{slug}', 'FrontendController@productDetail')->name('product-detail');
Route::post('/product/search', 'FrontendController@productSearch')->name('product.search');
Route::get('/product-cat/{slug}', 'FrontendController@productCat')->name('product-cat');
Route::get('/product-sub-cat/{slug}/{sub_slug}', 'FrontendController@productSubCat')->name('product-sub-cat');
Route::get('/product-brand/{slug}', 'FrontendController@productBrand')->name('product-brand');

// Cart section
Route::get('/add-to-cart/{slug}', 'CartController@addToCart')->name('add-to-cart')->middleware('user');
Route::post('/add-to-cart', 'CartController@singleAddToCart')->name('single-add-to-cart')->middleware('user');
Route::get('cart-delete/{id}', 'CartController@cartDelete')->name('cart-delete');
Route::post('cart-update', 'CartController@cartUpdate')->name('cart.update');

Route::get('/cart', function () {
    return view('frontend.pages.cart');
})->name('cart');
Route::get('/checkout', 'CartController@checkout')->name('checkout')->middleware('user');

// Wishlist
Route::get('/wishlist', function () {
    return view('frontend.pages.wishlist');
})->name('wishlist');
Route::get('/wishlist/{slug}', 'WishlistController@wishlist')->name('add-to-wishlist')->middleware('user');
Route::get('wishlist-delete/{id}', 'WishlistController@wishlistDelete')->name('wishlist-delete');
Route::post('cart/order', 'OrderController@store')->name('cart.order');
Route::get('order/pdf/{id}', 'OrderController@pdf')->name('order.pdf');
Route::get('/income', 'OrderController@incomeChart')->name('product.order.income');

// Route::get('/user/chart','AdminController@userPieChart')->name('user.piechart');
Route::get('/product-grids', 'FrontendController@productGrids')->name('product-grids');
Route::get('/product-lists', 'FrontendController@productLists')->name('product-lists');
Route::match(['get', 'post'], '/filter', 'FrontendController@productFilter')->name('shop.filter');

// Order Track
Route::get('/product/track', 'OrderController@orderTrack')->name('order.track');
Route::post('product/track/order', 'OrderController@productTrackOrder')->name('product.track.order');

// Blog
Route::get('/blog', 'FrontendController@blog')->name('blog');
Route::get('/blog-detail/{slug}', 'FrontendController@blogDetail')->name('blog.detail');
Route::get('/blog/search', 'FrontendController@blogSearch')->name('blog.search');
Route::post('/blog/filter', 'FrontendController@blogFilter')->name('blog.filter');
Route::get('blog-cat/{slug}', 'FrontendController@blogByCategory')->name('blog.category');
Route::get('blog-tag/{slug}', 'FrontendController@blogByTag')->name('blog.tag');

// NewsLetter
Route::post('/subscribe', 'FrontendController@subscribe')->name('subscribe');

// Product Review
Route::resource('/review', 'ProductReviewController');
Route::post('product/{slug}/review', 'ProductReviewController@store')->name('review.store');

// Post Comment
Route::post('post/{slug}/comment', 'PostCommentController@store')->name('post-comment.store');
Route::resource('/comment', 'PostCommentController');
// Coupon
Route::post('/coupon-store', 'CouponController@couponStore')->name('coupon-store');
// Payment
Route::get('payment', 'PayPalController@payment')->name('payment');
Route::get('cancel', 'PayPalController@cancel')->name('payment.cancel');
Route::get('payment/success', 'PayPalController@success')->name('payment.success');



// Backend section start

Route::group(['prefix' => '/admin', 'middleware' => ['auth', 'admin']], function () {
    Route::get('/', 'AdminController@index')->name('admin');
    Route::get('/file-manager', function () {
        return view('backend.layouts.file-manager');
    })->name('file-manager');

    // user route
    Route::resource('users', 'UsersController');
    // Banner
    Route::resource('banner', 'BannerController');
    // Brand
    Route::resource('brand', 'BrandController');
    // Profile
    Route::get('/profile', 'AdminController@profile')->name('admin-profile');
    Route::post('/profile/{id}', 'AdminController@profileUpdate')->name('profile-update');
    // Category
    Route::resource('/category', 'CategoryController');
    // Product
    Route::resource('/product', 'ProductController');
    // Ajax for sub category
    Route::post('/category/{id}/child', 'CategoryController@getChildByParent');
    // POST category
    Route::resource('/post-category', 'PostCategoryController');
    // Post tag
    Route::resource('/post-tag', 'PostTagController');
    // Post
    Route::resource('/post', 'PostController');
    // Message
    Route::resource('/message', 'MessageController');
    Route::get('/message/five', 'MessageController@messageFive')->name('messages.five');

    // Order
    Route::resource('/order', 'OrderController');
    // Shipping
    Route::resource('/shipping', 'ShippingController');
    // Coupon
    Route::resource('/coupon', 'CouponController');
    // Settings
    Route::get('settings', 'AdminController@settings')->name('settings');
    Route::post('setting/update', 'AdminController@settingsUpdate')->name('settings.update');

    // Notification
    Route::get('/notification/{id}', 'NotificationController@show')->name('admin.notification');
    Route::get('/notifications', 'NotificationController@index')->name('all.notification');
    Route::delete('/notification/{id}', 'NotificationController@delete')->name('notification.delete');

    // Password Change
    Route::get('change-password', 'AdminController@changePassword')->name('change.password.form');
    Route::post('change-password', 'AdminController@changPasswordStore')->name('change.password');
});










// User section start
Route::group(['prefix' => '/user', 'middleware' => ['user']], function () {
    Route::get('/', 'HomeController@index')->name('user');
    // Profile
    Route::get('/profile', 'HomeController@profile')->name('user-profile');
    Route::post('/profile/{id}', 'HomeController@profileUpdate')->name('user-profile-update');
    //  Order
    Route::get('/order', "HomeController@orderIndex")->name('user.order.index');
    Route::get('/order/show/{id}', "HomeController@orderShow")->name('user.order.show');
    Route::delete('/order/delete/{id}', 'HomeController@userOrderDelete')->name('user.order.delete');
    // Product Review
    Route::get('/user-review', 'HomeController@productReviewIndex')->name('user.productreview.index');
    Route::delete('/user-review/delete/{id}', 'HomeController@productReviewDelete')->name('user.productreview.delete');
    Route::get('/user-review/edit/{id}', 'HomeController@productReviewEdit')->name('user.productreview.edit');
    Route::patch('/user-review/update/{id}', 'HomeController@productReviewUpdate')->name('user.productreview.update');

    // Post comment
    Route::get('user-post/comment', 'HomeController@userComment')->name('user.post-comment.index');
    Route::delete('user-post/comment/delete/{id}', 'HomeController@userCommentDelete')->name('user.post-comment.delete');
    Route::get('user-post/comment/edit/{id}', 'HomeController@userCommentEdit')->name('user.post-comment.edit');
    Route::patch('user-post/comment/udpate/{id}', 'HomeController@userCommentUpdate')->name('user.post-comment.update');

    // Password Change
    Route::get('change-password', 'HomeController@changePassword')->name('user.change.password.form');
    Route::post('change-password', 'HomeController@changPasswordStore')->name('change.password');
});

Route::group(['prefix' => 'laravel-filemanager', 'middleware' => ['web', 'auth']], function () {
    \UniSharp\LaravelFilemanager\Lfm::routes();
});






// ZShop

Route::group(['prefix' => 'zshop'], function () {
    Route::get('/', 'ZshopController@index')->name('zshop-index');

    // ???????????? ?????? ???????????? ????????????
    Route::get('/login-register', 'ZshopController@login')->name('zshop-login-register');
    Route::post('/login', 'ZshopController@loginSubmit')->name('zshop-login-submit');
    Route::post('/register', 'ZshopController@registerSubmit')->name('zshop-register-submit');
    Route::get('/forget-password', 'ZshopController@forgetPassword')->name('zshop-forget-password');
    Route::get('/contact', 'ZshopController@contact')->name('zshop-contact');
    // Route::post('/contact/message', 'MessageController@store')->name('contact.store');

    // ???????????? ???????????? ????????????
    Route::get('/productlist', 'ZshopController@productlist')->name('zshop-productlist');
    Route::get('/productlist-category/{slug}', 'ZshopController@productlistByCategory')->name('zshop-productlist-category');
    Route::get('/productlist-category/{slug}/{sub_slug}', 'ZshopController@productSubcategory')->name('zshop-productlist-subcategory');
    Route::get('/product-detail/{slug}', 'ZshopController@productDetail')->name('zshop-product-detail');
    Route::post('/product/search', 'ZshopController@productSearch')->name('product.search');
    Route::get('/product-brand/{slug}', 'ZshopController@productBrand')->name('product-brand');

    // ?????????
    Route::get('/cart', 'ZshopController@cart')->name('zshop-cart');
    Route::get('/checkout', 'ZshopController@checkout')->name('zshop-checkout')->middleware('user');
    Route::post('/checkout/store', 'ZshopController@checkoutStore')->name('zshop-checkoutStore');
    Route::get('/add-to-cart/{slug}', 'ZshopController@addToCart')->name('zshop-add-to-cart')->middleware('user');
    Route::post('/add-to-cart', 'ZshopController@singleAddToCart')->name('zshop-single-add-to-cart')->middleware('user');
    Route::get('cart-delete/{id}', 'ZshopController@cartDelete')->name('zshop-cart-delete');
    Route::post('cart-update', 'ZshopController@cartUpdate')->name('zshop-cart.update');
});

Route::group(['prefix' => 'zshop/user'], function () {
    // ???????????? ????????? ???????????? ???????????? ???????????? ????????????
    Route::get('/home', 'ZshopController@home')->name('zshop-user-home');
    Route::post('/profile/{id}', 'ZshopController@profileUpdate')->name('zshop-user-profile-update');
    Route::get('/change-password', 'ZshopController@changePassword')->name('zshop-user-change-password');
    Route::post('/change-password', 'ZshopController@changPasswordStore')->name('zshop-user-change-password-update');

    Route::get('/reward-money', 'ZshopController@rewardMoney')->name('zshop-user-reward-money');

    Route::get('/orders', 'ZshopController@orders')->name('zshop-user-orders');

    Route::get('/returned', 'ZshopController@returned')->name('zshop-user-returned');

    Route::get('/wishlist', 'ZshopController@wishlist')->name('zshop-user-wishlist');
    Route::get('/wishlist/{slug}', 'ZshopController@addToWishlist')->name('zshop-add-to-wishlist')->middleware('user');
    Route::get('/wishlist-delete/{id}', 'ZshopController@wishlistDelete')->name('zshop-wishlist-delete');

    Route::get('/qa-center', 'ZshopController@qaCenter')->name('zshop-user-qa-center');
});
