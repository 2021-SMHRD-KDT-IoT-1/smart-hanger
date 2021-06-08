<%@page import="com.Model.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
 <header>

 <%
 
 	MemberDTO userInfo = (MemberDTO)session.getAttribute("userInfo");
 
 
 
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
 
           
 			
 				
			<h1>
				<%if (userId != null) {%><%= userId%><%}else{} %>
			</h1>
			<h1>
				<%if (userName != null) {%><%= userName%><%}else{} %>
			</h1>
			<h1>
				<%if (userAge != null) {%><%= userAge%><%}else{} %>
			</h1>
			
			
			
			
			<p>SmartHanger에 오신것을 환영합니다!</p>
			
		
			</header> <a href="#work" class="jumplink pic"> <span class="arrow icon solid fa-chevron-right"><span>See my work</span></span> <img src="images/me.jpg" alt="" />
			</a>
</body>
</html>