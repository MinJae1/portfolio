<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>전자울타리 관리</title>
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
						<h2>전자울타리 상세</h2>
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
									<th>울타리명</th>
									<td>${detail.name}</td>
								</tr>
								<tr>

									<th>요약</th>
									<td>${detail.summary}</td>
								</tr>
								<tr>

									<th>지정일</th>
									<td>${detail.wDate}</td>
								</tr>
								<tr>

									<th>상세주소</th>
									<td>${detail.summary}</td>
								</tr>
								<tr>
									<th colspan="2">위치</th>
								</tr>
								<tr>
									<td colspan="2"><div id="map"
											style="width: 500px; height: 400px; display: inline-block;"></div>
										<div style="display: inline-block;">
											<input id="latitude" type="hidden" value="${detail.latitude}"> <input
												id="logitude" type="hidden" value="${detail.logitude}">
											<table id="addTable">
												<c:forTokens var="coo" items="${coordinate}" delims=",">
													<tr>
														<td><label>Point</label> ${coo}</td>
													</tr>
												</c:forTokens>
											</table>
										</div></td>

								</tr>
							</tbody>
						</table>
						<div style="text-align: center;">
							<a class="btn btn-default" role="button" href="fenceList">목록</a> <a class="btn btn-default"
								role="button" href="fenceModPage?no=${detail.no}">수정</a>
						</div>



						<script type="text/javascript"
							src="//dapi.kakao.com/v2/maps/sdk.js?appkey=062e0584bb20b9bac0b74c6a16f19e68"></script>
						<script>
							var lat_val = document.getElementById('latitude').value
									.split(',');
							var lon_val = document.getElementById('logitude').value
									.split(',');

							var maxlat = Math.max.apply(null, lat_val);
							var minlat = Math.min.apply(null, lat_val);

							var maxlon = Math.max.apply(null, lon_val);
							var minlon = Math.min.apply(null, lon_val);

							var centerlat = minlat + ((maxlat - minlat) / 2);
							var centerlon = minlon + ((maxlon - minlon) / 2);

							var container = document.getElementById('map');
							var options = {
								center : new kakao.maps.LatLng(centerlat,
										centerlon),
								level : 3
							};

							var map = new kakao.maps.Map(container, options);
							map.setDraggable(false);
							map
									.addOverlayMapTypeId(kakao.maps.MapTypeId.BICYCLE);

							var polygonPath = [];

							var latlnglen = lat_val.length;

							for (var i = 0; i < latlnglen; i++) {
								polygonPath.push(new kakao.maps.LatLng(
										lat_val[i], lon_val[i]));

							}

							console.log(polygonPath);

							// 지도에 표시할 다각형을 생성합니다
							var polygon = new kakao.maps.Polygon({
								path : polygonPath, // 그려질 다각형의 좌표 배열입니다
								strokeWeight : 3, // 선의 두께입니다
								strokeColor : '#39DE2A', // 선의 색깔입니다
								strokeOpacity : 0.8, // 선의 불투명도 입니다 1에서 0 사이의 값이며 0에 가까울수록 투명합니다
								strokeStyle : 'longdash', // 선의 스타일입니다
								fillColor : '#A2FF99', // 채우기 색깔입니다
								fillOpacity : 0.7
							// 채우기 불투명도 입니다
							});

							// 지도에 다각형을 표시합니다
							polygon.setMap(map);
						</script>

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