
<%@page import="com.Model.CommunityDAO"%>
<%@page import="com.Model.CommunityDTO"%>
<%@page import="java.beans.Encoder"%>
<%@page import="javax.sound.sampled.AudioFormat.Encoding"%>
<%@page import="java.net.URLEncoder"%>
<%@page import="com.Model.My_clothesDTO"%>
<%@page import="com.Model.My_clothesDAO"%>
<%@page import="com.Model.MemberDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Astral by HTML5 UP</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="assets/css/main.css" />
<noscript>
<link rel="stylesheet" href="assets/css/noscript.css" />
</noscript>
<style>

button{
	
	background-color: gray;
	font-weight: bold ;
	font-family: "Gmarket Sans";

}

</style>


</head>

<body class="is-preload" style="height: auto;">


	<%
	MemberDTO userInfo = (MemberDTO) session.getAttribute("userInfo");
	
	String userId = null;
	String userPw = null;
	String userName = null;
	String userAge = null;
	
	if(userInfo != null){
		userId = userInfo.getUserId(); 
		userPw = userInfo.getUserPw(); 
		userName = userInfo.getUserName(); 
		userAge = userInfo.getUserAge(); 
	}
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
		
		
		// 메인화면
		btnclick("home", "zSmart_hanger/service/home.jsp");
		
		// 옷장
		btnclick("work", "zSmart_hanger/cloth/my_cloth.jsp");
	
		// 코디
		btnclick("Stylist", "zSmart_hanger/cody/cody.jsp");
	
		// 커뮤니티 게시판
		btnclick("Community", "zSmart_hanger/community/Community.jsp");

		// 고객센터
		btnclick("contact", "zSmart_hanger/service/service.jsp");


	</script>

	<!-- Wrapper-->
	<% if (userId != null) { %>
	<button class="btn_logout" onClick="location.href='LogoutServiceCon.do'" style="position: absolute; left: 74%; top: 10%; ntop: 50%;">로그아웃</button>
	<button class="btn_logout" onClick="location.href='../../user_infor.jsp'" style="position: absolute; left: 84%; top: 10%; ntop: 50%;">내정보관리</button>
	<% } else {	%>
	<button class="btn_login" onclick="btnclick('loginWindow','zSmart_hanger/user_manager/loginWindow.jsp')" style="position: absolute; left: 74%; top: 10%; ntop: 50%;">로그인</button>
	<% } %>






	<div id="wrapper">

		<!-- Nav -->
		<nav id="nav"> 
			<a href="#" class="icon solid fa-home"><span>Home</span></a> 
		
		
		<a href="#work" class="icon solid fas fa-tshirt"><span>Closet</span></a> 
		<a href="#Stylist" class="icon solid fas fa-user-tie"><span>Stylist</span></a> 
		<a href="#Community" class="icon solid fas fa-clipboard-list"><span>Community</span></a>
		<a href="#contact" class="icon solid fas fa-phone"><span>고객센터</span></a> </nav>

		<!-- 로그인 레이어 팝업 -->
		<div id="loginWindow"></div>













		<!-- Main -->
		<div id="main">

			<!-- Me -->

			<article id="home" class="panel intro">
			
			</article>






			<!-- 옷장!!! -->
			<article id="work" class="panel">
				
			</article>

			<!-- 여기는 코디 -->
			<article id="Stylist" class="panel"> 
			
			</article>


			<!-- Community -->
			<article id="Community" class="panel"> <header>
			

			</article>
			  

			<!-- 고객센터 -->
			<article id="contact" class="panel"> 
			
			 </article>


		</div>

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
	<script src="assets/js/breakpoints.min.js"></script>
	<script src="assets/js/util.js"></script>
	<script src="assets/js/main.js"></script>











</body>
</html>