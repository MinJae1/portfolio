<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>전자울타리 관리</title>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>

<%@include file="../../script.jsp"%>

<script type="text/javascript">
function detail(no) {
	document.location.href = "fenceDetail?no="+no;
}

function positionPopup(no) {
    var url = "popup_fance?no="+no;
    var name = "popup";
    var option = "width = 520, height = 420, top = 100, left = 200, location = no"
    window.open(url, name, option);
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
						<h1>전자울타리 리스트</h1>
					</div>
					<div class="col-sm-6">
						<ol class="breadcrumb float-sm-right">
							<li class="breadcrumb-item"><a href="#">Home</a></li>
							<li class="breadcrumb-item"><a href="#">info</a></li>
							<li class="breadcrumb-item active">fence</li>
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
						<a class="btn btn-default" href="fenceAddPage"> 추가</a>
					</div>
					<div>
						<table class="table table-bordered">
							<thead>
								<tr>
									<th>No.</th>
									<th>울타리 명</th>
									<th>요약</th>
									<th>지정일</th>
									<th>상세보기</th>
								</tr>
							</thead>
							<tbody>
								<c:choose>
									<c:when test="${empty fenceList}">
										<tr>
											<td colspan="5" style="text-align: center;">내용이없습니다.</td>
										</tr>

									</c:when>
									<c:otherwise>
										<c:forEach var="fenceList" items="${fenceList}">

											<tr onclick="detail(${fenceList.no})">
												<td>${fenceList.no}</td>
												<td>${fenceList.name}</td>
												<td>${fenceList.summary}</td>
												<td>${fenceList.wDate}</td>
												<td><a href="" onclick="positionPopup(${fenceList.no})">위치확인</a></td>
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