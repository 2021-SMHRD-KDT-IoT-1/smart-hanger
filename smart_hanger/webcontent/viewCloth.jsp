<%@page import="java.util.ArrayList"%>
<%@page import="Model.WebClothesDTO"%>
<%@page import="Model.WebClothesDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Astral by HTML5 UP</title>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="assets/css/main.css" />
<link rel="stylesheet" href="assets/css/viewCloth.css" />
<style type="text/css">

#main {
height: 500px;

/* =================여기는 왼쪽 화면 스타일 ======================= */
}
#left {
width: 50%; height: 100%; float: left;
}
#pickcloth{
position: relative; width: 80%; height: 70%; top: 20px; left: 20px; border: 1px solid;
}
#pickbutten{
position: relative; top: 20px; left: 20px;
}

/* ==============여기는 오른쪽 화면 스타일 ==================== */
#right {
 overflow-y:scroll; width: 50%; height: 100%; float: left;
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
}

</style>

</head>

<body class="is-preload">

<<<<<<< HEAD
<%
   WebClothesDAO dao = new WebClothesDAO();
   
   String num = request.getParameter("num");
   
   WebClothesDTO cloth_info = dao.SearchOneClothes(num);

%>
=======



>>>>>>> branch 'main' of https://github.com/2021-SMHRD-KDT-IoT-1/smart-hanger.git

	<!-- Wrapper-->
	<div id="wrapper">

		<!-- Main -->
		<!-- red == 여기는 옷 사진 출력  -->

<<<<<<< HEAD
		<div id="main">
=======
		<div id="main" style="height: 500px">
>>>>>>> branch 'main' of https://github.com/2021-SMHRD-KDT-IoT-1/smart-hanger.git


			<!-- 왼쪽 영역 -->
			<div id="left" >

<<<<<<< HEAD
				<div id="pickcloth">
								
				<img class="cloth_imgs" src="cloth_img/<%= cloth_info.getClothesPath() %>" alt="" style="width: 100%">				
				
=======

				<div id="container_div" >
						
						<div id="container">
						
						
						    <video autoplay="true" id="videoElement">	
						    	<script type="text/javascript">
									var video = document.querySelector("#videoElement");
								 
									if (navigator.mediaDevices.getUserMedia) {
										navigator.mediaDevices.getUserMedia({ video: true }).then(function (stream) {
											video.srcObject = stream;
								    })
									    .catch(function (err0r) {
									      console.log("Something went wrong!");
								    	});
									}
								</script>
						    </video>
					</div>
					
>>>>>>> branch 'main' of https://github.com/2021-SMHRD-KDT-IoT-1/smart-hanger.git
				</div>

<<<<<<< HEAD
				<div id ="pickbutten">
=======
				<div style="position: relative; top: 20px; left: 20px;">
>>>>>>> branch 'main' of https://github.com/2021-SMHRD-KDT-IoT-1/smart-hanger.git
					<input type="button" style="position: relative;" value="사진찍기"
						onclick="history.back();">

				</div>
			</div>


<<<<<<< HEAD

=======
>>>>>>> branch 'main' of https://github.com/2021-SMHRD-KDT-IoT-1/smart-hanger.git
			<!-- 오른쪽 영역 -->
			<div id="right"  >
				<div id="input_tag_div">
					<form action="">
						<ol style="list-style: none;">
							<div>
								<input id ="del" type="submit" value="삭제">
							</div>
							
							<li><%=cloth_info.getClothesname()%></li>
							
							<li><input type="text" nema ="Clothtext"></li>
							<li>옷에 대한 사용자가 적을 것</li>
							<li><textarea rows="68" cols="60">
							</textarea></li>
							<li><input class ="cr_pick" type="submit" value="수정" >
								<input class ="cr_pick" type="submit" value="선택" ></li>
						</ol>

					</form>
				</div>

			</div>

<<<<<<< HEAD


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