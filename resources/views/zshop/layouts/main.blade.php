<!DOCTYPE html>
<html lang="zxx">
<head>
	@include('zshop.layouts.head')
</head>
<body class="js">

	<!-- Preloader -->
	<div class="preloader">
		<div class="preloader-inner">
			<div class="preloader-icon">
				<span></span>
				<span></span>
			</div>
		</div>
	</div>
	<!-- End Preloader -->

	@include('zshop.layouts.notification')
	<!-- Header -->
	@include('zshop.layouts.header')
	<!--/ End Header -->
	@yield('main-content')

	@include('zshop.layouts.footer')

</body>
</html>
