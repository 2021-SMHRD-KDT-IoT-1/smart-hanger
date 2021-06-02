<%@page import="java.net.URLEncoder"%>
<%@page import="com.Model.My_clothesDTO"%>
<%@page import="com.Model.My_clothesDAO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Astral by HTML5 UP</title>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="assets/css/main.css" />
<link rel="stylesheet" href="assets/css/viewCloth.css" />
<style type="text/css">
#main {
	height: 500px;

	/* =================여기는 왼쪽 화면 스타일 ======================= */
}

#left {
	width: 50%;
	height: 100%;
	float: left;
}

#pickcloth {
	position: relative;
	width: 80%;
	height: 350px;
	top: 20px;
	left: 20px;
	border: 1px solid;
	overflow: hidden;
}

#cloth_imgs {
	height: 100;
}

#pickbutten {
	position: relative;
	top: 20px;
	left: 20px;
}

/* ==============여기는 오른쪽 화면 스타일 ==================== */
#right {
	overflow-y: scroll;
	width: 50%;
	height: 500px;
	float: left;
}

#input_tag_div {
	position: relative;
	top: 37px;
	width: 91%;
	height: 115px;
}

#del {
	float: right;
	height: 50%;
	width: 30%;
}

li>textarea {
	resize: none;
	height: 215px;
}

ol>li>.cr_pick {
	margin: auto;
	width: 49%;
}

#clothespick {
	margin: auto;
	width: 49%;
	height: 59px;
}
</style>

</head>

<body class="is-preload">


	<%
		Cookie cookie = null;

	My_clothesDAO dao = new My_clothesDAO();

	String num = request.getParameter("num");

	if (num != null) {
		cookie = new Cookie("my_clothes_num", num);
		cookie.setMaxAge(60 * 60 * 30);
	} else {
		// 5. 쿠키 저장 조회
		Cookie[] cookies = request.getCookies();

		for (Cookie cookie_info : cookies) {
			if (cookie_info.getName().equals("num")) {
		num = cookie_info.getValue();
			}
		}
	}

	My_clothesDTO cloth_info = dao.My_clothes_One_Select(num);
	%>




	<script type="text/javascript">
	
		function oneDelete(num){
	        $.ajax({
	            url : 'ClothesOneDeleteServicCon.do',
	            type : 'post',
	            data : {num : num},
	            success: function(data) {
	                alert('삭제성공');
	                alert(data);
	                window.location.href = data;
	            },
	            	error: function() {
	                alert('삭제실패');
	            }
	        });
		
		}
		
		
		
	</script>

	<!-- Wrapper-->
	<div id="wrapper">

		<!-- Main -->
		<!-- red == 여기는 옷 사진 출력  -->

		<div id="main" style="height: 500px">
		<form action = "addClothServiceCon.do" method = "post" enctype="multipart/form-data">





			<!-- 왼쪽 영역 -->
			<div id="left" style="width: 50%; height: 100%; float: left;">


				<div
					style="position: relative; width: 80%; height: 64%; top: 10%; left: 10%; border: 1px solid;">
				</div>


				<div style="position: relative; top: 20px; left: 20px;">
					<input type="button" style="position: absolute; margin-left: 29%; margin-top: 10%" value="사진찍기" 
						onclick="history.back();" >
						<input type="file" name="img_file">

				</div>
			</div>










			<!-- 오른쪽 영역 -->
			<div id="right" style="width: 50%; height: 100%; float: left;">
				<div id="input_tag_div"  style = "position: relative; top : 37px; width: 91%; height : 115px;" >
					<form action="#">
						<ol style="list-style: none;">
							<li>옷 이름></li>
							<li><input type="text"></li>
							<li>옷에 대한 사용자가 적을 것</li>
							<li>
							<textarea rows="68" cols="60" style = "resize: none; height : 215px;">
							</textarea> 
							</li>
							<li><input type="submit" value ="등록완료" onClick="location.href='main.jsp'" style = "margin-left: 30%; "></li>
						</ol>

					</form>
				</div>

			</div>










		</div>

		<input type="button" value="뒤로가기" onclick="history.back();" />
		<!-- style="color:black" -->
		<!-- Footer -->
		<div id="footer">
			<ul class="copyright">
				<li>&copy; Untitled.</li>
				<li>Design: <a href="http://html5up.net">HTML5 UP</a></li>
			</ul>
		</div>

	</div>

	<!-- Scripts -->
	<script src="assets/js/jquery.min.js"></script>
	<script src="assets/js/browser.min.js"></script>
	<script src="assets/js/breakpoints.min.js"></script>
	<script src="assets/js/util.js"></script>
	<script src="assets/js/main.js"></script>

</body>
</html>