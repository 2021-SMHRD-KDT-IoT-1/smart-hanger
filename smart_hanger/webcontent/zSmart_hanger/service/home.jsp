<%@page import="com.Model.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" href="assets/css/home.css" />
</head>
<body>


	<%
		MemberDTO userInfo = (MemberDTO) session.getAttribute("userInfo");

	String userId = null;
	String userPw = null;
	String userName = null;
	String userAge = null;

	if (userInfo != null) {
		userId = userInfo.getUserId();
		userPw = userInfo.getUserPw();
		userName = userInfo.getUserName();
		userAge = userInfo.getUserAge();
	}
	%>


	<div id="left_page">


		<div id="left_page_info">

			
			<header id="home_header">
				
				<%	if (userId != null) { %>
					<p id = "welcome" ><%=userId %>(<%=userName%>)님 환영합니다!</p>
									
				<% }else { %>
					<p id = "welcome" >SmartHanger에 오신것을 환영합니다!</p>
			
				<% } %>

			</header>

		</div>
	</div>



	<a id="home_img_penal" href="#work" class="jumplink pic"> <span class="arrow icon solid fa-chevron-right"> <span>See my work</span></span> <img
		src="assets/css/images/newyork.jpg" alt="" />
	</a>

</body>
</html>