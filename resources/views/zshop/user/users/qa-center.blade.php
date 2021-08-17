@extends('zshop.layouts.main')

@section('title', 'ZShop - 問答中心')

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
                    <a class="nav-link" href="{{ route('zshop-user-home')}}">個人中心</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="{{ route('zshop-user-reward-money')}}">購物金</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="{{ route('zshop-user-orders')}}">訂單查詢</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="{{ route('zshop-user-returned')}}">退貨查詢</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="{{ route('zshop-user-wishlist')}}">收藏清單</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link active" href="#">問答中心</a>
                </li>
            </ul>



            <ul class="breadcrumbs">
                <li><a href="{{ route('admin') }}" style="color:#999">會員中心</a></li>
                <li><a href="" class="active text-primary">問答中心</a></li>
            </ul>
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

.image {
    background: url('{{ asset('backend/img/background.jpg') }}');
    height: 150px;
    background-position: center;
    background-attachment: cover;
    position: relative;
}

.image img {
    position: absolute;
    top: 55%;
    left: 35%;
    margin-top: 30%;
}

i {
    font-size: 14px;
    padding-right: 8px;
}

</style>

@push('scripts')
<script src="/vendor/laravel-filemanager/js/stand-alone-button.js"></script>
<script>
    $('#lfm').filemanager('image');
</script>
@endpush
