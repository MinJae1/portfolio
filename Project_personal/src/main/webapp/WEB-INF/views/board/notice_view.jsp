<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Notice</title>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>

<%@include file="../script.jsp"%>
<script type="text/javascript">
function modify(no) {
	document.location.href = "modifyNoticePage?no="+no;

}

function del(no) {
	document.location.href = "noticeDelete?no="+no;
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
					<div>
						<table class="table table-bordered">
							<tbody>
								<tr>
									<th>제목</th>
									<td>${notice.title}</td>
								</tr>
								<tr>
									<th colspan="2">내용</th>
								</tr>
								<tr>
									<td colspan="2"><pre style="border: none; background-color: white;">${notice.content}</pre><%-- <textarea rows="20"
											style="width: 100%; border: none; background-color: white;"
											disabled="disabled">${notice.content}</textarea> --%></td>
								</tr>
							</tbody>
						</table>
						<div style="text-align: center;">
							<c:if test="${notice.userId eq member.id}">
								<a class="btn btn-default" role="button" href="#"
									onclick="del(${notice.no})">삭제</a>
							</c:if>
							<a class="btn btn-default" role="button" href="noticeMng">목록</a>
							<c:if test="${notice.userId eq member.id}">
								<a class="btn btn-default" role="button" href="#"
									onclick="modify(${notice.no})">수정</a>
							</c:if>
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
	<%@include file="../main_footer.jsp"%>
</body>
</html>