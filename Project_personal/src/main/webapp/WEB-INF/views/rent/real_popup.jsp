<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<script type="text/javascript">
	function usingStart() {
		opener.location.href = "pop_cnt_start";
	}

	function usingStop() {
		window.opener.$("#timer").attr("action", "/pop_cnt_stop");
		//alert(window.opener.$("#timer").serializeArray());
		var usingList = new Array();

		var size = window.opener.$('input[name="no"]').length;

		for (var i = 0; i < size; i++) {
			var obj = new Object();
			obj.no = window.opener.$('input[name="no"]').eq(i).val();
			obj.state = window.opener.$('input[name="state"]').eq(i).val();
			obj.code = window.opener.$('input[name="code"]').eq(i).val();
			obj.userId = window.opener.$('input[name="userId"]').eq(i).val();
			obj.time = window.opener.$('input[name="time"]').eq(i).val();
			usingList.push(obj);
		}
		
		
		/* 	$.ajax({
            url: "/pop_cnt_stop",
            type: "POST",
            data: {
            	'get' : usingList
            },
            success: function(data) {
            	alert(usingList);
            },
            error:function(data){
            }
        });
 */

		window.opener.$("#timer").submit();
	}
</script>
<meta charset="utf-8">
<title>Insert title here</title>
</head>
<body>
	<div class="col-sm-12 form-inline">
		<a class="btn btn-default" role="button" href="#LINK"
			onclick="usingStart()"
			style="selector-dummy: expression(this.hideFocus = false);">사용시작</a>

		<a class="btn btn-default" role="button" href="#LINK"
			onclick="usingStop()"
			style="selector-dummy: expression(this.hideFocus = false);">사용종료</a>
	</div>
</body>
</html>