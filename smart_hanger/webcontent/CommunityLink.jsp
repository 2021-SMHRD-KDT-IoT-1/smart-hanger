<%@page import="com.Model.CommunityDTO"%>
<%@page import="com.Model.CommunityDAO"%>
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
	// get 방식으로 보낸 num받아오기
	String get_num = request.getParameter("board_num");
	
	// String -> int 형변환
	int num = Integer.parseInt(get_num);
	
	CommunityDAO dao = new CommunityDAO();
	CommunityDTO dto = dao.showOne(num);
	
		
	%>
<div id="wrapper">
<article id="Community" class="panel"> <header>
<h2>여기는 커뮤니티 사용자가 쓴 곳을 들어온 페이지</h2>
</header> 

<div id = "board">
				<form action="WriteCommuCon.do" method="post" enctype="multipart/form-data">
				<table id="list">
					<tr>
						<td>제목</td>
						<td><%= dto.getTitle() %> </td>
					</tr>
					<tr>
						<td>작성자</td>
						<td><%= dto.getUserid() %> </td>
					</tr>
					<tr>
						<td colspan="2">내용</td>
					</tr>
					<tr>
						<td colspan="2">
						<%= dto.getContent() %>
							<input name="fileName" type="file" style="float: right;">
							<textarea name="content" rows="10" style="resize: none;"></textarea>			
						</td>
					</tr>
					<tr>
						<td colspan="2">
							<input type="reset" value="초기화">
							<input type="submit" value="작성하기">
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