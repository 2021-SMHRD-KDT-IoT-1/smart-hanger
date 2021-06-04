
<%@page import="com.Model.MemberDTO"%>
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
	width: 20%;
	height: 100%;
	float: left;
}

/* ==============여기는 오른쪽 화면 스타일 ==================== */
#right {
	overflow-y: scroll;
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

#my_infor{
 top: 30px;
}

#board_post{

 top: 40px;
}

#board_comment {

 top: 50px;
}

h1{
 font-size : 20px;
}
</style>

</head>

<body class="is-preload">


<%MemberDTO dto = (MemberDTO) session.getAttribute("userInfo"); %>


	<script type="text/javascript">
	
		function oneDelete(num){
	        $.ajax({
	            url : 'ClothesOneDeleteServicCon.do',
	            type : 'post',
	            data : {num : num},
	            success: function(data) {
	                alert('삭제성공');
	                $(location).attr('href', 'Main.jsp');
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


		<div id="main">
			<form action="ClothesUpdateServiceCon.do" method="post" enctype="multipart/form-data">



				<!-- 왼쪽 영역 -->
				<div id="left">


				
						
					<div id="pickbutten">

						

						<input id="my_infor" type="button" style="position: relative; width:120pt ;height:45pt;" value="개인정보수정" onclick="location.href='MemberUpdate.jsp';">
						<input id="board_post" type="button" style="position: relative; width:120pt ;height:45pt;" value="게시글" onclick="history.back();">
						<input id="board_comment" type="button" style="position: relative; width:120pt ;height:45pt;" value="댓글" onclick="history.back();">

					</div>
				</div>



				<!-- 오른쪽 영역 -->
				<div id="right">
					<div id="input_tag_div">
						<ol style="list-style: none;">
						
						
						
						
					<!--  오른쪽 내부 영역 -->
						
						

							
							
				 			<li>사용자 이름<li>
							
							<h1><%=dto.getUserName()%></h1>
							
							<li>사용자 나이<li>
							
							<h1><%=dto.getUserAge()%>세</h1>
							
							<li>소개<li>
							
							<h1>스마트 행거를 이용해주셔서 감사합니다.</h1>
							
							
								
								
					<!--  오른쪽 내부 영역 여기까지-->			
								
								
								
								
								
						</ol>


					</div>

				</div>

			</form>

		</div>

		<input type="button" value="뒤로가기" onclick="location.href='Main.jsp#work'" />
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