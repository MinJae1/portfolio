<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>자전거 관리</title>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>

<%@include file="../../script.jsp"%>

<script type="text/javascript">
function modify(no) {
	document.location.href = "bikeModifyPage?no="+no;

}

</script>

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
						<h1>자전거 리스트</h1>
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
					<div style="text-align: right;">
						<a class="btn btn-default" href="bikeAddPage"> 추가</a>
					</div>
					<div>
						<table class="table table-bordered">
							<thead>
								<tr>
									<th>No.</th>
									<th>자전거 코드</th>
									<th>상태</th>
								</tr>
							</thead>
							<tbody>
								<c:choose>
									<c:when test="${empty bikeList}">
										<tr>
											<td colspan="3" style="text-align: center;">내용이없습니다.</td>
										</tr>

									</c:when>
									<c:otherwise>
										<c:forEach var="bikeList" items="${bikeList}">

											<tr onclick="modify(${bikeList.no})">
												<td>${bikeList.no}</td>
												<td>${bikeList.code}</td>
												<td><c:choose>
														<c:when test="${bikeList.state eq 0}">대기</c:when>
														<c:when test="${bikeList.state eq 1}">사용중</c:when>
														<c:when test="${bikeList.state eq 2}">수리중</c:when>
													</c:choose></td>
											</tr>
										</c:forEach>

									</c:otherwise>
								</c:choose>
							</tbody>
						</table>
						<div style="text-align: center;">
							<%@ include file="../../paging.jsp"%>
						</div>
					</div>

				</div>

				<!-- /.card -->
			</div>


		</section>
		<!-- /.content -->
	</div>
	<!-- /.content-wrapper -->

	<!-- ./wrapper -->
	<%@include file="../../main_footer.jsp"%>
</body>
</html>