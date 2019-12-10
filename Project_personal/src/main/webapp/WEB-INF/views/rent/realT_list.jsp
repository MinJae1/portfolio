<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>RealTime</title>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>


<%@include file="../script.jsp"%>

<script type="text/javascript">
	function pad(n, width) {
		n = n + '';
		return n.length >= width ? n : new Array(width - n.length + 1)
				.join('0')
				+ n;
	}

	function moving() {

		//초기값
		var size = document.getElementsByName('state').length;
		var sttm = $('#time').val().split(':');

		var ss = Number(sttm[sttm.length - 1]);
		var mm = Number(sttm[sttm.length - 2]);
		var hh = 0;
		var time = "";

		var timer = setInterval(function() {
			var st_ss = pad(ss, 2);
			var st_mm = pad(mm, 2);
			var st_hh = pad(hh, 2);

			time = st_hh + ":" + st_mm + ":" + st_ss;

			for (var i = 0; i < size; i++) {

				if (document.getElementsByName('state')[i].value == 1) {
					document.getElementsByName('time')[i].value = time;

					if (ss < 59) {
						ss += 1;
					} else {
						if (mm < 59) {
							ss = 0;
							mm += 1;
						} else {
							mm = 0;
							hh += 1;
						}
					}
				} else {
					continue;
					clearInterval(timer); /* 타이머 종료 */
				}
			}

		}, 1000); /* millisecond 단위의 인터벌 */

	}
</script>

</head>
<body class="hold-transition sidebar-mini" onload="moving();">
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
						<h2>실시간 이용 내역</h2>
					</div>
					<div class="col-sm-6">
						<ol class="breadcrumb float-sm-right">
							<li class="breadcrumb-item"><a href="#">Home</a></li>
							<li class="breadcrumb-item"><a href="#">rent</a></li>
							<li class="breadcrumb-item active">realT</li>
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
						<form id="timer" name="timer" method="post">
							<table class="table table-bordered" id="timetable">
								<thead>
									<tr>
										<th>No.</th>
										<th>자전거 코드</th>
										<th>이용유저</th>
										<th>이용시간</th>
										<th>현재위치</th>
									</tr>
								</thead>
								<tbody>

									<c:choose>
										<c:when test="${!empty usingList}">
											<c:forEach var="usingList" items="${usingList}" varStatus="list">
												<tr>
													<td>${usingList.no}</td>
													<td>${usingList.code}</td>
													<td>${usingList.userName}</td>
													<td><input id="time" name="time" value="${usingList.time}" type="text"
														readonly="readonly" style="border: none;"></td>
													<td><input name="no" value="${usingList.no}" type="hidden"> <input
														name="state" value="${usingList.state}" type="hidden"> <input name="bikeId"
														value="${usingList.bikeId}" type="hidden"> <input name="userId"
														value="${usingList.userId}" type="hidden"> <input name="realtime"
														value="${usingList.realtime}" type="hidden">
														<p style="color: #81BEF7;">위치확인</p></td>
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
						</form>
					</div>
				</div>
				<script>
					// 버튼 클릭시 Row 값 가져오기
					$("p")
							.click(
									function() {

										var str = ""
										var tdArr = new Array(); // 배열 선언
										var checkBtn = $(this);

										// checkBtn.parent() : checkBtn의 부모는 <td>이다.
										// checkBtn.parent().parent() : <td>의 부모이므로 <tr>이다.
										var tr = checkBtn.parent().contents();

										var no = tr
												.filter('input[name=bikeId]')
												.val()
										var id = tr
												.filter('input[name=userId]')
												.val()
										var realT = tr.filter(
												'input[name=realtime]').val()

										var url = "position_popup?no=" + no
												+ "&id=" + id + "&realT="
												+ realT;
										var name = "popup";
										var option = "width = 520, height = 420, top = 100, left = 200, location = no"
										window.open(url, name, option);

									});
					/*function popup(tr) {
						var row = tr.parent();
						
						console.log(row);
						var url = "position_popup?no=" + no + "&id=" + id + "&returnT="
								+ returnT;
						var name = "popup";
						var option = "width = 520, height = 420, top = 100, left = 200, location = no"
						window.open(url, name, option);
					}*/
				</script>


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