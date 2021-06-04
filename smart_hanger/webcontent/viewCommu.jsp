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
	
	
	CommunityDAO dao = new CommunityDAO();
	CommunityDTO dto = dao.showOne(get_num);
	
		
	%>
	<%System.out.println("clothespath" + dto.getClothespath()); %>
	<%System.out.println(dto+"==="); %>
<div id="wrapper">
<article id="Community" class="panel"> <header>
<h2>여기는 커뮤니티 사용자가 쓴 곳을 들어온 페이지</h2>
</header> 

<div id = "board">

				<form>
				<table bgcolor = "white" border = 1px>
                    <tr>
					    <td>번호</td>
					    <td ><%= dto.getBoard_num() %> </td>
						<td>공감</td>
						<td><%= dto.getLike_num() %> </td>
						<td>조회수</td>
						<td><%= dto.getView_num() %> </td>
					</tr>
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
						<img src="clothespath/<%= dto.getClothespath() %>">
						<%= dto.getContent() %>
							
								
						</td>
					</tr>
					
					<tr>
					<td colspan="2"><a href="Main.jsp"><button>뒤로가기</button></a></td>
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