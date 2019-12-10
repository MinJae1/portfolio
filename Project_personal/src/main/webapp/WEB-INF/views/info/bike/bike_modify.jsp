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
						<h2>자전거 수정</h2>
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
						<form action="modBike" method="post">
							<input type="hidden" value="${bikeinfo.no}" name="no">
							<table class="table table-bordered">
								<tbody>
									<tr>
										<th style="width: 15%">자전거 코드</th>
										<td style="width: 35%"><input type="text" class="form-control" name="code" id="code"
											value="${bikeinfo.code}"></td>
										<th style="width: 15%">상태</th>
										<td style="width: 35%"><select name="state" size="1" class="form-control select2">
												<option value="">선택</option>
												<option value="0">대기</option>
												<option value="2">수리</option>
										</select></td>

									</tr>
								</tbody>
							</table>
							<div style="text-align: center;">
								<a class="btn btn-default" role="button" href="bikeList">목록</a> <input type="submit"
									class="btn btn-default" value="수정">
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
	<script>
		$(document).ready(function() {
			$("select option").each(function() {

				if ($(this).val() == "${bikeinfo.state}") {
					$(this).attr("selected", "selected"); // attr적용안될경우 prop으로 

				}
			});
		});
	</script>

	<!-- ./wrapper -->
	<%@include file="../../main_footer.jsp"%>
</body>
</html>