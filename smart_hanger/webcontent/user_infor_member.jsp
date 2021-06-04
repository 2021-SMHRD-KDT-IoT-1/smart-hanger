
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
<link rel="stylesheet" href="assets/css/userInfo_member.css" />


</head>

<body class="is-preload">


	<%
	MemberDTO dto = (MemberDTO) session.getAttribute("userInfo");
	%>


	<script type="text/javascript">
		function oneDelete(num) {
			$.ajax({
				url : 'ClothesOneDeleteServicCon.do',
				type : 'post',
				data : {
					num : num
				},
				success : function(data) {
					alert('삭제성공');
					$(location).attr('href', 'Main.jsp');
				},
				error : function() {
					alert('삭제실패');
				}
			});

		}
	</script>

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
</body>
</html>