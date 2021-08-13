@extends('zshop.layouts.main')

@section('title', 'ZShop - 購物金')

@section('main-content')
<div class="container">
    <div class="card shadow mb-4">
        <div class="row">
            <div class="col-md-12">
                @include('backend.layouts.notification')
            </div>
        </div>
        <div class="card-header py-3">
            {{-- <h4 class=" font-weight-bold">Profile</h4> --}}



            <ul class="nav nav-tabs nav-fill">
                <li class="nav-item">
                    <a class="nav-link" href="{{ route('zshop-user-home') }}">個人中心</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link active" href="#">購物金</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="{{ route('zshop-user-orders') }}">訂單查詢</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="{{ route('zshop-user-returned') }}">退貨查詢</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="{{ route('zshop-user-wishlist') }}">收藏清單</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="{{ route('zshop-user-qa-center') }}">問答中心</a>
                </li>
            </ul>



            <ul class="breadcrumbs">
                <li><a href="{{ route('admin') }}" style="color:#999">會員中心</a></li>
                <li><a href="" class="active text-primary">購物金</a></li>
            </ul>
        </div>
        <div class="card-body">
            <div class="row d-flex justify-content-center">
                <div class="col-10">
                    <h5 class="card-title text-left my-4"><small><i class="ti-wallet"></i>
                            現有購物金： {{ $profile->reward_money }}</small>
                    </h5>
                </div>
            </div>
        </div>
    </div>
</div>


@endsection

<style>
.breadcrumbs {
    list-style: none;
}

.breadcrumbs li {
    float: left;
    margin-right: 10px;
}

.breadcrumbs li a:hover {
    text-decoration: none;
}

.breadcrumbs li .active {
    color: red;
}

.breadcrumbs li+li:before {
    content: "/\00a0";
}

i {
    font-size: 14px;
    padding-right: 8px;
}

</style>
