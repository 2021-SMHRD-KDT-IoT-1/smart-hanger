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
<<<<<<< HEAD
#pickcloth{
position: relative; width: 80%; height: 70%; top: 20px; left: 20px; border: 1px solid; overflow: hidden;
=======

#pickcloth {
	position: relative;
	width: 80%;
	height: 350px;
	top: 20px;
	left: 20px;
	border: 1px solid;
	overflow: hidden;
>>>>>>> branch 'main' of https://github.com/2021-SMHRD-KDT-IoT-1/smart-hanger.git
}
<<<<<<< HEAD
#cloth_imgs{
	height: 100;
}

#pickbutten{
position: relative; top: 20px; left: 20px;
=======

#cloth_imgs {
	height: 100;
}

#pickbutten {
	position: relative;
	top: 20px;
	left: 20px;
>>>>>>> branch 'main' of https://github.com/2021-SMHRD-KDT-IoT-1/smart-hanger.git
}

/* ==============여기는 오른쪽 화면 스타일 ==================== */
#right {
<<<<<<< HEAD
 overflow-y:scroll; width: 50%; height: 500px; float: left;
}
#input_tag_div {
position: relative; top: 37px; width: 91%; height: 115px;
}
#del{
float: right; height: 50%; width: 30%;
}
li > textarea {
resize: none; height: 215px;
}
 ol > li > .cr_pick {
 margin: auto; width: 49%;
=======
	overflow-y: scroll;
	width: 50%;
	height: 500px;
	float: left;
>>>>>>> branch 'main' of https://github.com/2021-SMHRD-KDT-IoT-1/smart-hanger.git
}
#clothespick {
margin: auto; width: 49%; height: 59px;
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


	<!-- Wrapper-->
	<div id="wrapper">

		<!-- Main -->
		<!-- red == 여기는 옷 사진 출력  -->


		<div id="main">
<<<<<<< HEAD
					<form action="ClothesUpdateServiceCon.do" method="post" enctype="multipart/form-data">

=======
			<form action="ClothesUpdateServiceCon.do" method="post" enctype="multipart/form-data">
>>>>>>> branch 'main' of https://github.com/2021-SMHRD-KDT-IoT-1/smart-hanger.git


<<<<<<< HEAD
			<!-- 왼쪽 영역 -->
			<div id="left" >


				<div id="pickcloth">
								
				<img id="cloth_imgs" src="cloth_img/<%= cloth_info.getClothespath()%>" alt="" style="width: 105%; position: relative; right: 2.5%;">			
				<input type="file" name="img_file">
=======

				<!-- 왼쪽 영역 -->
				<div id="left">


					<div id="pickcloth">

						<img id="cloth_imgs" src="cloth_img/<%=cloth_info.getClothespath()%>" alt="" style="width: 105%; position: relative; right: 2.5%;">
					</div>
						
					<div id="pickbutten">

					<input type="file" name="img_file">

						<input type="button" style="position: relative;" value="사진찍기" onclick="history.back();">

					</div>
>>>>>>> branch 'main' of https://github.com/2021-SMHRD-KDT-IoT-1/smart-hanger.git
				</div>


<<<<<<< HEAD
				<div id ="pickbutten">

					<input type="button" style="position: relative;" value="사진찍기"
						onclick="history.back();">

				</div>
			</div>
=======
>>>>>>> branch 'main' of https://github.com/2021-SMHRD-KDT-IoT-1/smart-hanger.git

<<<<<<< HEAD


			<!-- 오른쪽 영역 -->
			<div id="right"  >
				<div id="input_tag_div">
=======

				<!-- 오른쪽 영역 -->
				<div id="right">
					<div id="input_tag_div">
>>>>>>> branch 'main' of https://github.com/2021-SMHRD-KDT-IoT-1/smart-hanger.git
						<ol style="list-style: none;">

<<<<<<< HEAD
							<li><input id ="del" type="submit" value="삭제"></li>

							
=======
							<li><input id="del" type="submit" value="삭제"></li>


>>>>>>> branch 'main' of https://github.com/2021-SMHRD-KDT-IoT-1/smart-hanger.git
							<li><%=cloth_info.getClothesName()%></li>
<<<<<<< HEAD
							
							<li><input type="text" name ="Clothtext">
							<input type="hidden" name ="num" value="<%=num %>"></li> 
=======

							<li><input type="text" name="title"> <input type="hidden" name="num" value="<%=num%>"></li>
>>>>>>> branch 'main' of https://github.com/2021-SMHRD-KDT-IoT-1/smart-hanger.git
							<!-- 사용자에게 히든 값을 저장해서 넘겨줌-->
							<li>옷에 대한 사용자가 적을 것</li>
<<<<<<< HEAD
							<li><textarea rows="68" cols="60" name = "Clothtextarea">
=======
							<li><textarea rows="68" cols="60" name="memo">
>>>>>>> branch 'main' of https://github.com/2021-SMHRD-KDT-IoT-1/smart-hanger.git
							</textarea></li>
<<<<<<< HEAD
							
							
							<li><input class ="cr_pick" type="submit" value="수정" >
							
								<button id ="clothespick" class ="cr_pick" >선택</button> </li>
=======


							<li><input class="cr_pick" type="submit" value="수정">

								<button id="clothespick" class="cr_pick">선택</button></li>
>>>>>>> branch 'main' of https://github.com/2021-SMHRD-KDT-IoT-1/smart-hanger.git
						</ol>

<<<<<<< HEAD
					
=======

					</div>

>>>>>>> branch 'main' of https://github.com/2021-SMHRD-KDT-IoT-1/smart-hanger.git
				</div>

			</form>

<<<<<<< HEAD
					</form>

=======
>>>>>>> branch 'main' of https://github.com/2021-SMHRD-KDT-IoT-1/smart-hanger.git
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