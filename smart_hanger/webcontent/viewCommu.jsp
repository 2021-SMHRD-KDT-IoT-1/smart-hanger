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
	// get ������� ���� num�޾ƿ���
	String get_num = request.getParameter("board_num");
	
	// String -> int ����ȯ
	
	
	CommunityDAO dao = new CommunityDAO();
	CommunityDTO dto = dao.showOne(get_num);
	
		
	%>
	<%System.out.println("clothespath" + dto.getClothespath()); %>
	<%System.out.println(dto+"==="); %>
<div id="wrapper">
<article id="Community" class="panel"> <header>
<h2>����� Ŀ�´�Ƽ ����ڰ� �� ���� ���� ������</h2>
</header> 

<div id = "board">

				<form>
				<table bgcolor = "white" border = 1px>
                    <tr>
					    <td>��ȣ</td>
					    <td ><%= dto.getBoard_num() %> </td>
						<td>����</td>
						<td><%= dto.getLike_num() %> </td>
						<td>��ȸ��</td>
						<td><%= dto.getView_num() %> </td>
					</tr>
					<tr>
						<td>����</td>
						<td><%= dto.getTitle() %> </td>
					</tr>
					<tr>
						<td>�ۼ���</td>
						<td><%= dto.getUserid() %> </td>
					</tr>
					<tr>
						<td colspan="2">����</td>
					</tr>
					<tr>
						<td colspan="2">
						<img src="clothespath/<%= dto.getClothespath() %>">
						<%= dto.getContent() %>
							
								
						</td>
					</tr>
					
					<tr>
					<td colspan="2"><a href="Main.jsp"><button>�ڷΰ���</button></a></td>
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