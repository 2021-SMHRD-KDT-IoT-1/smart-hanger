<%@page import="com.Model.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<title>Forty by HTML5 UP</title>
		<meta charset="utf-8" />
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<!--[if lte IE 8]><script src="assets/js/ie/html5shiv.js"></script><![endif]-->
		<link rel="stylesheet" href="assets/css/main.css" />
		<!--[if lte IE 9]><link rel="stylesheet" href="assets/css/ie9.css" /><![endif]-->
		<!--[if lte IE 8]><link rel="stylesheet" href="assets/css/ie8.css" /><![endif]-->
		
	</head>
	<style>
	
	</style>
	<body style="text-align: center;">
	
	<%
		MemberDTO dto = (MemberDTO)session.getAttribute("userInfo");
	%>

		<!-- Wrapper -->
			<div id="wrapper">
				<!-- Menu -->
					<nav id="Update">	
						<ul class="actions vertical">
							<li><h5>회원정보수정</h5></li>
								<form action = "MemberUpdateServiceCon.do" method = "post">
								
									<%if(dto != null) {%>
										<li>접속한 Id : <%=dto.getUserId() %></li><br>
									<%}else { %>
										<li>접속한 UserId : 세션영역에 저장된 email을 출력하시오.</li>
									<%} %>
									
									<li><input type="password" name = "userPw" placeholder="PW를 입력하세요" style="width: 500px; margin: 0 auto;"></li>
									<li><input type="text" name = "userName" placeholder="이름를 입력하세요" style="width: 500px; margin: 0 auto;"></li>
									<li><input type="text" name = "userAge" placeholder="나이를 입력하세요" style="width: 500px; margin: 0 auto;"></li>
									<li><input type="submit" value="업데이트" class="button fit" style="width: 500px; margin: 0 auto;"></li>
								</form>
						</ul>
					</nav>			
			</div>
		
			
	</body>
</html>

