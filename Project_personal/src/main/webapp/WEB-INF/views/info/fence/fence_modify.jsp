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
	//Row 추가
	function insRow() {
		oTbl = document.getElementById("addTable");
		var oRow = oTbl.insertRow();
		oRow.onmouseover = function() {
			oTbl.clickedRowIndex = this.rowIndex
		}; //clickedRowIndex - 클릭한 Row의 위치를 확인;
		var oCell = oRow.insertCell();

		//삽입될 Form Tag
		var frmTag = "<label> point </label><input name='latitude' type='text'placeholder='위도'> <input name='logitude' type='text' placeholder='경도'> ";
		frmTag += "<input type=button value='삭제' onClick='removeRow()' style='cursor:hand' name='del'>";
		oCell.innerHTML = frmTag;
	}

	//Row 삭제
	function removeRow() {
		oTbl.deleteRow(oTbl.clickedRowIndex);

		newPath.splice(oTbl.clickedRowIndex, 1);

		polygon.setPath(newPath);

		console.log(newPath);
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
						<h2>전자울타리 수정</h2>
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
						<form action="modFence" method="post">
							<input type="hidden" name="no" value="${detail.no}"> <input id="latitude"
								type="hidden" value="${detail.latitude}"> <input id="logitude" type="hidden"
								value="${detail.logitude}">

							<table class="table table-bordered">
								<tbody>
									<tr>
										<th>울타리명</th>
										<td><input type="text" style="width: 100%;" class="form-control" name="name"
											value="${detail.name}"></td>
									</tr>
									<tr>

										<th>요약</th>
										<td><input type="text" style="width: 100%;" class="form-control" name="summary"
											id="summary" value="${detail.summary}"></td>
									</tr>
									<tr>

										<th>지정일</th>
										<td><input type="text" style="width: 100%;" class="form-control" name="wdate"
											id="wdate" disabled="disabled" value="${detail.wDate}"></td>
									</tr>
									<tr>

										<th>상세주소</th>
										<td><input type="text" style="width: 100%;" class="form-control"
											value="${detail.summary}"></td>
									</tr>
									<tr>
										<th colspan="2">위치</th>
									</tr>
									<tr>
										<td colspan="2"><div id="map"
												style="width: 500px; height: 400px; display: inline-block;"></div>
											<div style="display: inline-block;">
												<table id="addTable">
												</table>
											</div></td>

									</tr>
								</tbody>
							</table>
							<div style="text-align: center;">
								<a class="btn btn-default" role="button" href="fenceList">목록</a> <input
									class="btn btn-default" type="submit" value="수정">
							</div>

						</form>

						<script>
							$(document)
									.ready(
											function() {

												var lat_val = document
														.getElementById('latitude').value
														.split(',');
												var lon_val = document
														.getElementById('logitude').value
														.split(',');

												var latlnglen = lat_val.length;

												oTbl = document
														.getElementById("addTable");
												//var oRow = oTbl.insertRow();
												//oRow.onmouseover = function() {
												//		oTbl.clickedRowIndex = this.rowIndex
												//	}; //clickedRowIndex - 클릭한 Row의 위치를 확인;
												//var oCell = oRow.insertCell();

												var frmTag = ""
												//삽입될 Form Tag
												for (var i = 0; i < latlnglen; i++) {
													frmTag = "<label> point </label><input name='latitude' type='text'placeholder='위도' value='"+lat_val[i]+"'> "
															+ "<input name='logitude' type='text' placeholder='경도' value='"+lon_val[i]+"'>"
															+ "<input type=button value='삭제' onClick='removeRow()' style='cursor:hand' name='del'>";
													oTbl.insertRow(i)
															.insertCell().innerHTML = frmTag;
												}

												frmTag = "<label> point </label><input name='latitude' type='text'placeholder='위도'> <input name='logitude' type='text' placeholder='경도'>"
														+ "<input type=button value='삭제' onClick='removeRow()' style='cursor:hand' name='del'> ";
												oTbl.insertRow(latlnglen)
														.insertCell().innerHTML = frmTag;
											});
						</script>

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
							map
									.addOverlayMapTypeId(kakao.maps.MapTypeId.BICYCLE);

							var polygonPath = [];
							var newPath = [];

							var lat_val = document.getElementById('latitude').value
									.split(',');
							var lon_val = document.getElementById('logitude').value
									.split(',');

							var latlnglen = lat_val.length;

							for (var i = 0; i < latlnglen; i++) {
								polygonPath.push(new kakao.maps.LatLng(
										lat_val[i], lon_val[i]));
								newPath.push(new kakao.maps.LatLng(lat_val[i],
										lon_val[i]));

							}

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

							kakao.maps.event
									.addListener(
											map,
											'click',
											function(mouseEvent) {

												// 클릭한 위도, 경도 정보를 가져옵니다 
												var latlng = mouseEvent.latLng;

												var len = document
														.getElementsByName('latitude').length;

												document
														.getElementsByName('latitude')[len - 1].value = latlng
														.getLat().toFixed(4);
												document
														.getElementsByName('logitude')[len - 1].value = latlng
														.getLng().toFixed(4);

												// 다각형을 구성하는 좌표 배열입니다. 이 좌표들을 이어서 다각형을 표시합니다

												newPath
														.push(new kakao.maps.LatLng(
																document
																		.getElementsByName('latitude')[len - 1].value,
																document
																		.getElementsByName('logitude')[len - 1].value));

												polygon.setPath(newPath);

												insRow();

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