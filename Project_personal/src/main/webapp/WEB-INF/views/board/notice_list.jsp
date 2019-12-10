<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Notice</title>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>

<%@include file="../script.jsp"%>
<script type="text/javascript">
function detail(no) {
	document.location.href = "noticeDetail?no="+no;
}
</script>

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
						<h2>공지사항</h2>
					</div>
					<div class="col-sm-6">
						<ol class="breadcrumb float-sm-right">
							<li class="breadcrumb-item"><a href="#">Home</a></li>
							<li class="breadcrumb-item"><a href="#">board</a></li>
							<li class="breadcrumb-item active">notice</li>
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
					<div style="text-align: right; padding: 10px;"
						class="col-sm-12 form-inline">
						<input class="form-control" name="searchKeyword" type="text"
							value="" size="25" title="검색" onkeypress="press();"> <a
							class="btn btn-default" role="button" href="#LINK"
							onclick="javascript:fncSelectRoleList('1')"
							style="selector-dummy: expression(this.hideFocus = false);">검색</a>
						<a class="btn btn-default" role="button" href="newNotice"
							onclick="javascript:fncSelectRoleList('1')"
							style="selector-dummy: expression(this.hideFocus = false);">추가</a>
					</div>
					<div>
						<table class="table table-bordered">
							<thead>
								<tr>
									<th>No.</th>
									<th>제목</th>
									<th>작성자</th>
									<th>작성일</th>
									<th>최근 수정일</th>
								</tr>
							</thead>
							<tbody>

								<c:choose>
									<c:when test="${!empty notlist}">
										<c:forEach var="notlist" items="${notlist}">
											<tr onclick="detail(${notlist.no})">
												<td>${notlist.no}</td>
												<td>${notlist.title}</td>
												<td>${notlist.userName}</td>
												<td>${notlist.insertDate}</td>
												<td>${notlist.modifyDate}</td>
											</tr>
										</c:forEach>
									</c:when>
									<c:otherwise>
										<tr>
											<td colspan="5" style="text-align: center;">내용이없습니다.</td>
										</tr>
									</c:otherwise>
								</c:choose>

							</tbody>
						</table>
					</div>
				</div>
				<div style="text-align: center;">
				<%@ include file="../paging.jsp"%>
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