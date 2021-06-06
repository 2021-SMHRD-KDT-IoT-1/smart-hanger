<%@page import="java.util.ArrayList"%>
<%@page import="com.Model.CommunityDAO"%>
<%@page import="com.Model.CommunityDTO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" href="assets/css/community.css">

</head>
<body>
	<%
	CommunityDTO commudto = (CommunityDTO) session.getAttribute("userId");
	CommunityDAO commudao = new CommunityDAO();
	ArrayList<CommunityDTO> main_list = new ArrayList<CommunityDTO>();
	ArrayList<CommunityDTO> community_list = commudao.Community_Show();
	%>
	<header>

		<h2>커뮤니티 게시판</h2>



		<div style="border: 1px solid; width: 100%; height: 20%;"></div>


		<table id="commtitle">
			<thead>
				<tr>
					<th scope="col">번호</th>
					<th scope="col">제목</th>
					<th scope="col">ID</th>
					<th scope="col">Day</th>
					<th scope="col">Like</th>
					<th scope="col">View</th>
				</tr>
			</thead>


			<%
			for (int i = 0; i < community_list.size(); i++) {
			%>
			<tbody>
				<tr>
					<td><%=i + 1%></td>
					<td  onclick="location.href='zSmart_hanger/community/viewCommu.jsp?board_num=<%=community_list.get(i).getBoard_num()%>'">
							<%=community_list.get(i).getUserid()%>
					</td>
					<td><%=community_list.get(i).getTitle()%></td>
					<td><%=community_list.get(i).getUpload_date()%></td>
					<td><%=community_list.get(i).getLike_num()%></td>
					<td><%=community_list.get(i).getView_num()%></td>
				</tr>
			</tbody>
			<%
			}
			%>
		</table>
	</header>
	<button onclick="location.href='zSmart_hanger/community/writerCommu.jsp'" id="writer"
		style="position: relative; left: 75%;">작성하러가기</button>

</body>
</html>