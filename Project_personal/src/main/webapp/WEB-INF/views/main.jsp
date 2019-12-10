<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Main</title>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>

<%@include file="script.jsp"%>

</head>
<body class="hold-transition sidebar-mini">
	<%@include file="main_header.jsp"%>
	<!-- Navbar -->
	<%@include file="main_left_column.jsp"%>
	<!-- Side bar -->
	<div class="content-wrapper">
		<!-- Content Header (Page header) -->
		<section class="content-header">
			<div class="container-fluid">
				<div class="row mb-2">
					<div class="col-sm-6">
						<h1>Blank Page</h1>
					</div>
					<div class="col-sm-6">
						<ol class="breadcrumb float-sm-right">
							<li class="breadcrumb-item"><a href="#">Home</a></li>
						</ol>
					</div>
				</div>
			</div>
			<!-- /.container-fluid -->
		</section>

		<!-- Main content -->
		<section class="content">

			<!-- Default box -->
			<div class="card">
				<div class="card-header">
					<h3 class="card-title">Title</h3>

					<div class="card-tools">
						
					</div>
					<div id="map" style="width: 500px; height: 400px;"></div>
					<script type="text/javascript"
						src="//dapi.kakao.com/v2/maps/sdk.js?appkey=062e0584bb20b9bac0b74c6a16f19e68"></script>
					<script>
						var container = document.getElementById('map');
						var options = {
							center : new kakao.maps.LatLng(36.344974,
									127.381665),
							level : 3
						};

						var map = new kakao.maps.Map(container, options);
					</script>
				</div>
				<div class="card-body">Start creating your amazing
					application!</div>
				<!-- /.card-body -->
				<div class="card-footer"></div>
				<!-- /.card-footer-->
			</div>
			<!-- /.card -->

		</section>
		<!-- /.content -->
	</div>
	<!-- /.content-wrapper -->

	<!-- ./wrapper -->
	<%@include file="main_footer.jsp"%>
</body>
</html>