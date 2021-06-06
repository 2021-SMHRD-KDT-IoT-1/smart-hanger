<%@page import="com.Model.MemberDTO"%>
<%@page import="com.Model.CommunityDAO"%>
<%@page import="com.Model.CommunityDTO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<title>Astral by HTML5 UP</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="assets/css/main.css" />
<noscript>
	<link rel="stylesheet" href="assets/css/noscript.css" />
</noscript>


</head>
<body>
<%
	MemberDTO dto = (MemberDTO)session.getAttribute("userInfo");
	%>
<div id="wrapper">
<article id="Community" class="panel"> <header>

</header> 


<div id = "board">
				<form action="WriteCommuCon.do" method="post" enctype="multipart/form-data">
				<table id="list">
					<tr>
						<td>제목</td>
						<td><input type="text" name="title"> </td>
					</tr>
			
					<tr>
						<td>ID</td>
						<td><%=dto.getUserId() %> </td>
					</tr>
					<tr>
						<td colspan="2">내용</td>
					</tr>
					<tr>
						<td colspan="2">
							<input name="fileName" type="file" style="float: right;">
							<textarea name="content" rows="10" style="resize: none;"></textarea>			
						</td>
					</tr>
					<tr>
						<td colspan="3">
							<input type="reset" value="초기화">
							<input type="submit" value="작성하기">
							<button onclick="location.href='Main.jsp'" id="home"  style="position: relative; left: 85%;">이전</button>
						</td>
					</tr>
				</table>
				</form>
			</div>
</article>

</div>

 
<!-- Scripts -->
	<script src="assets/js/jquery.min.js"></script>
	<script src="assets/js/breakpoints.min.js"></script>
	<script src="assets/js/util.js"></script>
	<script src="assets/js/main.js"></script>

</body>
</html>