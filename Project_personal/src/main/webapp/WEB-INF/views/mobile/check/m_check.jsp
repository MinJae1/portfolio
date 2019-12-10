<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>

</head>
<body>
	<h1>지도api</h1>
	<a href="back"><img class="m_btn" alt=""
		src="${pageContext.request.contextPath}/resources/image/icon_back_32_32_wh.png"></a>

	<div id="map" style="width: 500px; height: 400px;"></div>
	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=062e0584bb20b9bac0b74c6a16f19e68"></script>
	<script>
		//function getLocationConstant() {
		//		document.getElementById('gps').style.display = "none";
		//		if (navigator.geolocation) {

		//위치 정보를 얻기
		navigator.geolocation.getCurrentPosition(function(pos) {

			var container = document.getElementById('map');
			var options = {
				center : new kakao.maps.LatLng(pos.coords.latitude,
						pos.coords.longitude),
				level : 3
			};

			var map = new kakao.maps.Map(container, options);
		});
		//	} else {
		//		alert("No GPS support");
		//	}
		//}
	</script>
	<hr>
</body>
</html>