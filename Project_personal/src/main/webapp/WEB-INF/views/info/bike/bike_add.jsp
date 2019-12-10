<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>자전거 관리</title>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>

<%@include file="../../script.jsp"%>

</head>
<body class="hold-transition sidebar-mini">
	<%@include file="../../main_header.jsp"%>
	<!-- Navbar -->
	<%@include file="../../main_left_column.jsp"%>
	<!-- Side bar -->
	<div class="content-wrapper">
		<!-- Content Header (Page header) -->
		<section class="content-header">
			<div class="container-fluid">
				<div class="row mb-2">
					<div class="col-sm-6">
						<h2>자전거 추가</h2>
					</div>
					<div class="col-sm-6">
						<ol class="breadcrumb float-sm-right">
							<li class="breadcrumb-item"><a href="#">Home</a></li>
							<li class="breadcrumb-item"><a href="#">info</a></li>
							<li class="breadcrumb-item active">bike</li>
						</ol>
					</div>
				</div>
			</div>
			<!-- /.container-fluid -->
		</section>

		<!-- Main content -->
		<section class="content">
			<div class="box box-default">
				<!-- Default box -->
				<div class="box-body">
					<div>
						<form action="addBike" method="post">
							<table class="table table-bordered">
								<tbody>
									<tr>
										<th>자전거 코드</th>
										<td><input type="text" class="form-control" name="code" id="code" value="bik_"></td>

									</tr>
								</tbody>
							</table>
							<div style="text-align: center;">
								<a class="btn btn-default" role="button" href="bikeList">목록</a> <input type="submit"
									class="btn btn-default" value="등록">
							</div>
						</form>

					</div>
					<!-- /.card -->
				</div>
			</div>
		</section>
		<!-- /.content -->
	</div>
	<!-- /.content-wrapper -->

	<!-- ./wrapper -->
	<%@include file="../../main_footer.jsp"%>
</body>
</html>