@extends('zshop.layouts.main')
@section('title', 'ZShop - 聯絡客服')
@section('main-content')
<!-- Breadcrumbs -->
<div class="breadcrumbs">
    <div class="container">
        <div class="row">
            <div class="col-12">
                <div class="bread-inner">
                    <ul class="bread-list">
                        <li><a href="{{ route('zshop-index') }}">首頁<i class="ti-arrow-right"></i></a></li>
                        <li class="active"><a href="javascript:void(0);">聯絡客服</a></li>
                    </ul>
                </div>
            </div>
        </div>
        <div class="row d-flex justify-content-center">
            <div class="col-8">
                <div class="row">
                    <div class="col-lg-6 col-md-6 col-12 my-4">
                        <div class="card">
                            <div class="card-body">
                                <form class="form-contact form contact_form" method="post"
                                    action="{{ route('contact.store') }}" id="contactForm" novalidate="novalidate">
                                    @csrf
                                    <div class="row">
                                        <div class="col-12">
                                            <div class="form-group">
                                                <label>姓名<span>*</span></label>
                                                <input name="name" id="name" type="text" placeholder="Enter your name">
                                            </div>
                                        </div>
                                        <div class="col-12">
                                            <div class="form-group">
                                                <label>Email<span>*</span></label>
                                                <input name="email" type="email" id="email"
                                                    placeholder="Enter email address">
                                            </div>
                                        </div>
                                        <div class="col-12">
                                            <div class="form-group message">
                                                <label>留言<span>*</span></label>
                                                <textarea name="message" id="message" cols="30" rows="4"
                                                    placeholder="Enter Message"></textarea>
                                            </div>
                                        </div>
                                        <div class="col-12">
                                            <div class="form-group button">
                                                <button type="submit" class="btn ">送出</button>
                                            </div>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-6 col-md-6 col-12 my-4">
                        <div class="card">
                            <img class="card-img-top" src="{{ $photo_path }}" alt="{{ $photo_path }}">
                            <div class="card-body text-center">
                                <h5 class="card-title">加入 ZShop 與客服線上互動</h5>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

{{-- @include('frontend.layouts.newsletter') --}}
<!-- End Shop Newsletter -->
<!--================Contact Success  =================-->
<div class="modal fade" id="success" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h2 class="text-success">感謝您的寶貴意見!</h2>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <p class="text-success">您的問題已經成功送出，客服人員將會盡快回覆，請耐心等候</p>
            </div>
        </div>
    </div>
</div>

<!-- Modals error -->
<div class="modal fade" id="error" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h2 class="text-warning">系統錯誤!</h2>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <p class="text-warning">請掃描加入 Line 官方帳號，線上客服將盡快回覆您</p>
            </div>
        </div>
    </div>
</div>

@endsection
@push('styles')
<style>
	.modal-dialog .modal-content .modal-header{
		position:initial;
		padding: 10px 20px;
		border-bottom: 1px solid #e9ecef;
	}
	.modal-dialog .modal-content .modal-body{
		height:100px;
		padding:10px 20px;
	}
	.modal-dialog .modal-content {
		width: 50%;
		border-radius: 0;
		margin: auto;
	}
</style>
@endpush
@push('scripts')
<script src="{{ asset('frontend/js/jquery.form.js') }}"></script>
<script src="{{ asset('frontend/js/jquery.validate.min.js') }}"></script>
<script src="{{ asset('z-frontend/js/contact.js') }}"></script>
@endpush
