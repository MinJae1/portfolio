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
						<h2>공지사항 수정</h2>
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
						<form action="modifyNotice" method="post">
							<input type="hidden" name="userId" value="${member.id}">
							<input type="hidden" name="no" value="${notice.no}">
							<table class="table table-bordered">
								<tbody>
									<tr>
										<th>제목</th>
										<td><input type="text" style="width: 100%;"
											class="form-control" name="title" id="title"
											value="${notice.title}"></td>
									</tr>
									<tr>
										<th colspan="2">내용</th>
									</tr>
									<tr>
										<td colspan="2"><textarea rows="20" style="width: 100%;"
												class="form-control" name="content" id="content">${notice.content}</textarea></td>
									</tr>
								</tbody>
							</table>
							<div style="text-align: center;">
								 <a class="btn btn-default" role="button" href="noticeMng">목록</a> 
								 <input type="submit" class="btn btn-default" value="등록">
							</div>
						</form>
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