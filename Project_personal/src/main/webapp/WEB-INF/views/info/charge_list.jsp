<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Charge</title>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>

<%@include file="../script.jsp"%>

</head>
<body class="hold-transition sidebar-mini">
	<%@include file="../main_header.jsp"%>
	<!-- Navbar -->
	<%@include file="../main_left_column.jsp"%>
	<!-- Side bar -->
	<div class="content-wrapper">
		<!-- Content Header (Page header) -->
		<section class="content-header">
			<div class="container-fluid">
				<div class="row mb-2">
					<div class="col-sm-6">
						<h1>대여금액관리</h1>
					</div>
					<div class="col-sm-6">
						<ol class="breadcrumb float-sm-right">
							<li class="breadcrumb-item"><a href="#">Home</a></li>
							<li class="breadcrumb-item"><a href="#">basic</a></li>
							<li class="breadcrumb-item active">Charge Page</li>
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
					<div style="text-align: right;">
						<button class="btn btn-default">추가</button>
					</div>
					<div>
						<table class="table table-bordered">
							<thead>
								<tr>
									<th>구분</th>
									<th>시간(분)</th>
									<th>요금</th>
								</tr>
							</thead>
							<tbody>
								<c:choose>
									<c:when test="${chargeList eq null}">
										<tr>
											<td colspan="3" style="text-align: center;">내용이없습니다.</td>
										</tr>

									</c:when>
									<c:otherwise>
										<tr>
											<td></td>
											<td></td>
											<td></td>
										</tr>
									</c:otherwise>
								</c:choose>
							</tbody>
						</table>
					</div>
				</div>
				<!-- /.card -->
			</div>
		</section>
		<!-- /.content -->
	</div>
	<!-- /.content-wrapper -->

	<!-- ./wrapper -->
	<%@include file="../main_footer.jsp"%>
</body>
</html>