<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
<style type="text/css">
.m_input {
	border: 2px solid #f7941e;
	height: 30px;
	width: 225px;
	border-radius: 3.5px;
}
</style>

<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css">


<script type="text/javascript">
	function pad(n, width) {
		n = n + '';
		return n.length >= width ? n : new Array(width - n.length + 1)
				.join('0')
				+ n;
	}

	function msg() {
		alert('자전거 코드를 입력해 주세요');
	}

	function runningUpdate() {
		var updatedata = {};

		$.each($("#rent_form").serializeArray(), function(index, o) {

			updatedata[o.name] = o.value

		})

		$.ajax({
			url : "runningtime",
			type : "POST",
			dataType : "json", // ajax 통신으로 받는 타입
			contentType : "application/json", // ajax 통신으로 보내는 타입
			data : JSON.stringify(updatedata)
		})

	}
</script>

<script>
	function chkBoxToBWS() {

		if ($('input:checkbox[id="chkbox"]').is(":checked") == true) {
			$('#bws').val(1);
		} else {
			$('#bws').val(0);
		}
		console.log($('#bws').val());
	}

	function timeCheck(when) {
		var curDate = new Date();
		var curTime = curDate.getFullYear() + "-" + (curDate.getMonth() + 1)
				+ "-" + curDate.getDate() + " " + curDate.getHours() + ":"
				+ curDate.getMinutes();
		var realTime = curTime + ":" + curDate.getSeconds();

		console.log(when);

		$('#real_time').val(realTime);

		if (when == 1) {
			$('#rent_time').val(curTime);
			console.log($('#rent_time').val());

		} else if (when == 0) {
			$('#return_time').val(curTime);
			console.log($('#retrun_time').val());

		} else if (when == 2) {
			return;
		}
		console.log($('#real_time').val());
	}
</script>
</head>
<body>

	<div style="text-align: center;">
		<div style="width: 45%; height: 45%; display: inline-block;">

			<form action="" id="rent_form">

				<hr>
				<div class="row">
					<div class="col-xs-12 col-sm-12 col-md-12">
						<div class="wrap">
							<div class="tit">
								<h2>
									<span class="fsize30"><strong>자전거 대여</strong></span>
								</h2>
								<br> <br>
							</div>
							<div>
								<div>
									<h4>자전거 선택</h4>
									<select name="bike_id" size="1" class="form-control select2" id="bike_id">
										<option value="">선택</option>
										<c:forEach var="bikeList" items="${bikeList}" varStatus="status">
											<option value="${status.count}" <c:if test="${bikeList.state eq 2}">disabled</c:if>>${bikeList.code}<c:if
													test="${bikeList.state eq 2}">(수리중)</c:if></option>
										</c:forEach>
									</select>
								</div>

								<div class="form-group">
									<h4>위치</h4>
									<input id="latitude" name="latitude" type="text" placeholder="위도"> <input
										id="longitude" name="longitude" type="text" placeholder="경도">
								</div>
								<div class="form-group">
									<br> <br> <label></label> <input id="chkbox" name="chkbox" type="checkbox">
									후방감지센서(check=ON)</label> <br>
								</div>
							</div>
						</div>
						<br> <br> <input id="running_time" name="running_time" type="text" value="00:00"
							readonly="readonly" style="border: none; text-align: center; font-size: 30px;"> <br>
						<br>
						<button id="rent_btn" class="btn btn-default btn-lg btn-block">대여</button>
						<button id="return_btn" class="btn btn-primary btn-lg btn-block">반납</button>
					</div>
					<br> <br> <a href="back">이전</a>
				</div>

				<!-- 숨김처리 -------------------------------------------->
				<input id="lock_state" name="lock_state" type="hidden"> <input id="rent_time"
					name="rent_time" value="00:00" type="hidden"> <input id="return_time"
					name="return_time" value="00:00" type="hidden"> <input id="bws" name="bws"
					type="hidden" value=0> <input id="member_id" name="member_id" value="${user.memberId}"
					type="hidden"> <input id="member_no" name="member_no" value="${user.id}" type="hidden">
				<input id="real_time" name="real_time" type="hidden">
				<!------------------------------------------------------->
			</form>
		</div>
	</div>

	<script>
		$(function() {
			// Geolocation API에 액세스할 수 있는지를 확인
			if (navigator.geolocation) {
				//위치 정보를 얻기
				navigator.geolocation.getCurrentPosition(function(pos) {
					$('#latitude').val(pos.coords.latitude); // 위도
					$('#longitude').val(pos.coords.longitude); // 경도
				});
			} else {
				alert("이 브라우저에서는 Geolocation이 지원되지 않습니다.")
			}
		});
	</script>

	<script>
		$("#rent_form").submit(function(event) {

			event.preventDefault();

			// JSON으로 요청

			var data = {};

			$.each($(this).serializeArray(), function(index, o) {

				data[o.name] = o.value

			})

			if ($("#bike_id").val() == "") {
				msg();
			} else {

				if (data['lock_state'] == 1) {
					$.ajax({
						url : "rent_now",
						type : "POST",
						dataType : "json", // ajax 통신으로 받는 타입
						contentType : "application/json", // ajax 통신으로 보내는 타입
						data : JSON.stringify(data),
						success : function(result) {
							console.log(result);
							// ajax 통신 성공 시 로직 수행
						}

					})

				} else {
					$.ajax({
						url : "return",
						type : "POST",
						dataType : "json", // ajax 통신으로 받는 타입
						contentType : "application/json", // ajax 통신으로 보내는 타입
						data : JSON.stringify(data),
						success : function(result) {
							console.log(result);
							// ajax 통신 성공 시 로직 수행
						}
					})
				}
			}

		});
	</script>


	<script>
		$('#rent_btn').click(function() {

			$('#lock_state').val(1);
			chkBoxToBWS();
			timeCheck(1);

			var sttm = $('#running_time').val().split(':');

			var ss = Number(sttm[1]);
			var mm = Number(sttm[0]);
			var hh = 0;
			var running_time = "";

			var cnt = 0;

			if ($('#bike_id').val() != "") {

				var timer = setInterval(function() {
					var st_ss = pad(ss, 2);
					var st_mm = pad(mm, 2);
					var st_hh = pad(hh, 2);

					var lat = $('#latitude').val();
					var lon = $('#longitude').val();

					running_time = st_hh + ":" + st_mm + ":" + st_ss;

					$('#running_time').val(running_time);

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
					$("#return_btn").click(function() {
						chkBoxToBWS();
						timeCheck(0);
						$('#lock_state').val(0);
						clearInterval(timer);

					});

					cnt++;

					if (cnt % 5 == 0) {
						lat = (lat - 0.010).toFixed(4);
						lon = (lon - 0.010).toFixed(4);
						$('#latitude').val(lat);
						$('#longitude').val(lon);

						chkBoxToBWS();
						timeCheck(2);

						runningUpdate();
					}

				}, 1000); /* millisecond 단위의 인터벌 */
			}
		});
	</script>
</body>
</html>