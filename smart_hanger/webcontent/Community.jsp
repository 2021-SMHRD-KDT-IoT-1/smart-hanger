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
</head>
<body>
	<%
	CommunityDTO commudto = (CommunityDTO)session.getAttribute("dto");
	CommunityDAO commudao = new CommunityDAO();
	ArrayList<CommunityDTO> main_list =new ArrayList<CommunityDTO>();
	ArrayList<CommunityDTO> community_list = commudao.Community_Show();
	
	%>
<header>

			<h2>커뮤니티 게시판</h2>
			</header> <button onclick="location.href='writerCommu.jsp'" id="writer"  style="position: relative; left: 85%;">작성하러가기</button>
			<div style="border: 1px solid; width: 100%; height: 20%;"></div>

<%
System.out.println(community_list);

%>
				<table id="commtitle">
					
					<%
			for (int i = 0; i < community_list.size(); i++) {
			%>
			<tr>
				<td><%=i + 1%></td>
				<td><a href="CommunityLink.jsp?board_num=<%=community_list.get(i).getBoard_num()%>">
						<%=community_list.get(i).getTitle()%>
				</a></td>
				<td><%=community_list.get(i).getUserid()%></td>
				<td><%=community_list.get(i).getUpload_date()%></td>
				<td><%=community_list.get(i).getLike_num()%></td>
				<td><%=community_list.get(i).getView_num()%></td>
				
			</tr>
			<%
			}
			%>
				</table>
				
</body>
</html>