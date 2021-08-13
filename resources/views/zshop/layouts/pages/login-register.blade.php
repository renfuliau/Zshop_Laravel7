@extends('zshop.layouts.main')

@section('title', 'ZShop - 登入 / 註冊')

@section('main-content')
<!-- Breadcrumbs -->
<div class="breadcrumbs">
    <div class="container">
        <div class="row">
            <div class="col-12">
                <div class="bread-inner">
                    <ul class="bread-list">
                        <li><a href="{{ route('zshop-index') }}">首頁<i class="ti-arrow-right"></i></a></li>
                        <li class="active"><a href="javascript:void(0);">登入 / 註冊</a></li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- End Breadcrumbs -->

<!-- Shop Login -->
<section class="shop login section">
    <div class="container">
        <div class="row">
            <div class="col-lg-6 offset-lg-3 col-12">
                <div class="login-form">

                    <ul class="nav nav-tabs nav-fill" role="tablist">
                        <li class="nav-item">
                            <a class="nav-link active" data-toggle="tab" href="#tabs-1" role="tab">登入</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" data-toggle="tab" href="#tabs-2" role="tab">註冊</a>
                        </li>

                    </ul><!-- Tab panes -->
                    <div class="tab-content">
                        <div class="tab-pane active" id="tabs-1" role="tabpanel">
                            <h2 class="mt-3">登入</h2>
                            <!-- Form -->
                            <form class="form" method="post" action="{{ route('zshop-login-submit') }}">
                                @csrf
                                <div class="row">
                                    <div class="col-12">
                                        <div class="form-group">
                                            <input type="email" name="email" placeholder="請輸入 Email" required="required"
                                                value="{{ old('email') }}">
                                            @error('email')
                                                <span class="text-danger">{{ $message }}</span>
                                            @enderror
                                        </div>
                                    </div>
                                    <div class="col-12">
                                        <div class="form-group">
                                            <input type="password" name="password" placeholder="請輸入密碼" required="required"
                                                value="{{ old('password') }}">
                                            @error('password')
                                                <span class="text-danger">{{ $message }}</span>
                                            @enderror
                                        </div>
                                    </div>
                                    <div class="col-12 d-flex justify-content-center">
                                        <div class="form-group login-btn">
                                            <button class="btn" type="submit">登入</button>
                                        </div>
                                    </div>
                                    <div class="col-12 d-flex justify-content-between align-item-center">
                                        <div class="checkbox">
                                            <label class="checkbox-inline" for="2"><input name="news" id="2"
                                                    type="checkbox" class="my-auto">記住我</label>
                                        </div>
                                        @if (Route::has('password.request'))
                                            <a class="lost-pass my-auto" href="{{ route('zshop-forget-password') }}">
                                                忘記密碼?
                                            </a>
                                        @endif
                                    </div>
                                </div>
                            </form>
                        </div>
                        <div class="tab-pane" id="tabs-2" role="tabpanel">
                            <h2 class="mt-3">註冊</h2>
                            <!-- Form -->
                            <form class="form" method="post" action="{{ route('zshop-register-submit') }}">
                                @csrf
                                <div class="row">
                                    <div class="col-12">
                                        <div class="form-group">
                                            <input type="text" name="email" placeholder="請輸入 Email" required="required"
                                                value="{{ old('email') }}">
                                            @error('email')
                                                <span class="text-danger">{{ $message }}</span>
                                            @enderror
                                        </div>
                                    </div>
                                    <div class="col-12">
                                        <div class="form-group">
                                            <input type="password" name="password" placeholder="請輸入密碼（至少8個字元）" required="required"
                                                value="{{ old('password') }}">
                                            @error('password')
                                                <span class="text-danger">{{ $message }}</span>
                                            @enderror
                                        </div>
                                    </div>
                                    <div class="col-12">
                                        <div class="form-group">
                                            <input type="password" name="password_confirmation" placeholder="請再輸入一次密碼"
                                                required="required" value="{{ old('password_confirmation') }}">
                                            @error('password_confirmation')
                                                <span class="text-danger">{{ $message }}</span>
                                            @enderror
                                        </div>
                                    </div>
                                    <div class="col-12 d-flex justify-content-center">
                                        <div class="form-group login-btn">
                                            <button class="btn" type="submit">立即註冊</button>
                                        </div>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!--/ End Login -->
@endsection
@push('styles')
<style>
    .shop.login .form .btn {
        margin-right: 0;
    }

    .btn-facebook {
        background: #39579A;
    }

    .btn-facebook:hover {
        background: #073088 !important;
    }

    .btn-github {
        background: #444444;
        color: white;
    }

    .btn-github:hover {
        background: black !important;
    }

    .btn-google {
        background: #ea4335;
        color: white;
    }

    .btn-google:hover {
        background: rgb(243, 26, 26) !important;
    }

</style>
@endpush
