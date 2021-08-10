    <header class="header shop">
        <!-- Topbar -->
        <div class="topbar">
            <div class="container">
                <div class="row">
                    {{-- <div class="col-lg-6 col-md-12 col-12">
                        <!-- Top Left -->
                        <div class="top-left">
                            <ul class="list-main">
                                @php
                                    $settings = DB::table('settings')->get();
                                    
                                @endphp
                                <li><i class="ti-headphone-alt"></i>
                                    @foreach ($settings as $data) {{ $data->phone }}
                                    @endforeach
                                </li>
                                <li><i class="ti-email"></i>
                                    @foreach ($settings as $data) {{ $data->email }}
                                    @endforeach
                                </li>
                            </ul>
                        </div>
                        <!--/ End Top Left -->
                    </div> --}}
                    <div class="col-lg-12 col-md-12 col-12 text-right">
                        <!-- Top Right -->
                        <div class="right-content">
                            <ul class="list-main">
                                {{-- <li><i class="ti-location-pin"></i> <a href="{{route('order.track')}}">繁體中文</a></li> --}}
                                {{-- <li><i class="ti-alarm-clock"></i> <a href="#">Daily deal</a></li> --}}
                                @auth

                                    <li><i class="ti-user"></i> <a href="{{ route('user') }}" target="_blank">會員中心</a>
                                    </li>
                                    <li><a href="{{ route('cart') }}" class="single-icon"><i class="ti-bag"></i> <span
                                                class="total-count">{{ Helper::cartCount() }}</span></a></li>
                                    <li><i class="ti-power-off"></i> <a href="{{ route('user.logout') }}">登出</a></li>

                                @else
                                    <li><i class="ti-location-pin"></i><a href="{{ route('login.form') }}">English</a>
                                    </li>
                                    <li><i class="ti-power-off"></i><a href="{{ route('zshop-login-register') }}">登入 / 註冊</a></li>
                                @endauth
                            </ul>
                        </div>
                        <!-- End Top Right -->
                    </div>
                </div>
            </div>
        </div>
        <!-- End Topbar -->
        <div class="middle-inner">
            <div class="container">
                <div class="row">
                    <div class="col-lg-2 col-md-2 col-12">
                        <!-- Logo -->
                        <div class="logo">
                            @php
                                $settings = DB::table('settings')->get();
                            @endphp
                            <a href="{{ route('home') }}"><img src="@foreach ($settings as
                                    $data) {{ $data->logo }} @endforeach" alt="logo"></a>
                        </div>
                        <!--/ End Logo -->
                        <!-- Search Form -->
                        <div class="search-top">
                            <div class="top-search"><a href="#0"><i class="ti-search"></i></a></div>
                            <!-- Search Form -->
                            <div class="search-top">
                                <form class="search-form">
                                    <input type="text" placeholder="Search here..." name="search">
                                    <button value="search" type="submit"><i class="ti-search"></i></button>
                                </form>
                            </div>
                            <!--/ End Search Form -->
                        </div>
                        <!--/ End Search Form -->
                        <div class="mobile-nav"></div>
                    </div>
                    <div class="col-lg-8 col-md-7 col-12">
                        <div class="search-bar-top">
                            {{-- <div class="search-bar">
                            <select>
                                <option >All Category</option>
                                @foreach (Helper::getAllCategory() as $cat)
                                    <option>{{$cat->title}}</option>
                                @endforeach
                            </select>
                            <form method="POST" action="{{route('product.search')}}">
                                @csrf
                                <input name="search" placeholder="Search Products Here....." type="search">
                                <button class="btnn" type="submit"><i class="ti-search"></i></button>
                            </form>
                        </div> --}}

                            <div class="menu-area">
                                <!-- Main Menu -->
                                <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
                                    <div class="navbar-collapse">
                                        <div class="nav-inner">
                                            <ul class="nav main-menu menu navbar-nav">
                                                <li class="{{ Request::path() == 'home' ? 'active' : '' }}"><a
                                                        href="{{ route('home') }}">Home</a></li>
                                                <li class="{{ Request::path() == 'about-us' ? 'active' : '' }}"><a
                                                        href="{{ route('about-us') }}">About Us</a></li>
                                                <li class="@if (Request::path()=='product-grids'
                                                    || Request::path()=='product-lists' ) active @endif"><a
                                                        href="{{ route('product-grids') }}">Products</a><span
                                                        class="new">New</span></li>
                                                {{ Helper::getHeaderCategory() }}
                                                <li class="{{ Request::path() == 'blog' ? 'active' : '' }}"><a
                                                        href="{{ route('blog') }}">Blog</a></li>

                                                <li class="{{ Request::path() == 'contact' ? 'active' : '' }}"><a
                                                        href="{{ route('contact') }}">Contact Us</a></li>
                                            </ul>
                                        </div>
                                    </div>
                                </nav>
                                <!--/ End Main Menu -->
                            </div>

                        </div>
                    </div>
                    <div class="col-lg-2 col-md-3 col-12">
                        <div class="right-bar">
                            <!-- Search Form -->
                            <form class="form-inline my-2 my-lg-0">
                                <input class="form-control mr-sm-2" type="search" placeholder="Search"
                                    aria-label="Search">
                                <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Header Inner -->
        <div class="header-inner">
            <div class="container">
                <div class="cat-nav-head">
                    <div class="row">
                        <div class="col-lg-12 col-12">
                            {{-- <div class="menu-area">
                                <!-- Main Menu -->
                                <nav class="navbar navbar-expand-lg">
                                    <div class="navbar-collapse">
                                        <div class="nav-inner">
                                            <ul class="nav main-menu menu navbar-nav">
                                                <li class="{{ Request::path() == 'home' ? 'active' : '' }}"><a
                                                        href="{{ route('home') }}">Home</a></li>
                                                <li class="{{ Request::path() == 'about-us' ? 'active' : '' }}"><a
                                                        href="{{ route('about-us') }}">About Us</a></li>
                                                <li class="@if (Request::path() == 'product-grids' || Request::path() == 'product-lists') active @endif"><a
                                                        href="{{ route('product-grids') }}">Products</a><span
                                                        class="new">New</span></li>
                                                {{ Helper::getHeaderCategory() }}
                                                <li class="{{ Request::path() == 'blog' ? 'active' : '' }}"><a
                                                        href="{{ route('blog') }}">Blog</a></li>

                                                <li class="{{ Request::path() == 'contact' ? 'active' : '' }}"><a
                                                        href="{{ route('contact') }}">Contact Us</a></li>
                                            </ul>
                                        </div>
                                    </div>
                                </nav>
                                <!--/ End Main Menu -->
                            </div> --}}
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!--/ End Header Inner -->
    </header>
    {{-- @push('styles')
        <style>
            .form-inline .form-control {
                width: 80%;
            }

            .mx-sm-2 {
                margin-right: 0rem !important;
            }

            .btn {
                padding: 8px 0px;
                width: 20%;
            }
        </style>
    @endpush --}}