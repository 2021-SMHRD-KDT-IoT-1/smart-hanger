
<%@page import="com.Model.MemberDTO"%>
<%@page import="com.Model.MemberDTO"%>
<%@page import="java.net.URLEncoder"%>
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
	width: 20%;
	height: 100%;
	float: left;
}

/* ==============여기는 오른쪽 화면 스타일 ==================== */
#right {
	overflow-y: auto;
	width: 80%;
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

#my_infor {
	top: 30px;
}

#board_post {
	top: 40px;
}

#board_comment {
	top: 50px;
}

h1 {
	font-size: 31px;
}

#my_infor{
	border-radius: 15px;
	background-color: gray;
	font-weight: bold ;
	font-family: "Gmarket Sans";
}

#board_post{
	border-radius: 15px;
	background-color: gray;
	font-weight: bold ;
	font-family: "Gmarket Sans";
}

#board_comment{
	border-radius: 15px;
	background-color: gray;
	font-weight: bold ;
	font-family: "Gmarket Sans";
}

#back_btn{
	background-color: gray;
	font-weight: bold ;
	font-family: "Gmarket Sans";
	border-radius: 10px;
}

</style>

</head>

<body class="is-preload">


	<%
	MemberDTO userInfo = (MemberDTO) session.getAttribute("userInfo");
	%>

	<!-- div 요소 불러오는 jq -->
	<script src="./js/jquery-3.6.0.min.js"></script>
	<script type="text/javascript">
		// 페이지 전환용 변수
		/* 페이지 불러오기 (바꿀 div id입력 , 가져올 파일) */
		function btnclick(inner, _url) {
			

			$.ajax({
				url : _url,
				type : 'post',
				success : function(data) {
					$('#' + inner).html(data);
				},
				error : function() {
					$('#' + inner).text('페이지 점검중 입니다.');
				}
			});
		}

		// 사용 방법 btnclick('contact', 'service.jsp');

	
	</script>






	<!-- Wrapper-->
	<div id="wrapper">

		<!-- Main -->
		<!-- red == 여기는 옷 사진 출력  -->


		<div id="main">



			<!-- 왼쪽 영역 -->
			<div id="left">




				<div id="pickbutten">

					<input id="my_infor" type="button" style="position: relative; width: 120pt; height: 45pt;" value="개인정보수정" onclick="btnclick('right', 'user_infor_member.jsp')"> 
					<input id="board_post" type="button" style="position: relative; width: 120pt; height: 45pt;" value="게시글" onclick="btnclick('right', 'user_infor_community.jsp')"> 
					<input id="board_comment" type="button" style="position: relative; width: 120pt; height: 45pt;" value="댓글" onclick="btnclick('right', 'user_infor_comment.jsp')">

				</div>
			</div>



			<!-- 오른쪽 영역 -->
			<div id="right">


				<div id="input_tag_div">
					<ol style="list-style: none;">




						<!--  오른쪽 내부 영역 -->



						

						<li>사용자 이름
						<li>

							<h1><%=userInfo.getUserName()%></h1><br>
						<li>사용자 나이
						<li>

							<h1><%=userInfo.getUserAge()%>세</h1><br>
						<li>소개
						<li>

							<h1>스마트 행거를 이용해주셔서 감사합니다.</h1> <!--  오른쪽 내부 영역 여기까지-->
					</ol>


				</div>



			</div>

		</div>

		<input id = "back_btn" type="button" value="뒤로가기" onclick="location.href='Main.jsp#work'" />
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