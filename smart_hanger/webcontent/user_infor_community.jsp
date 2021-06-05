
<%@page import="com.Model.CommunityDAO"%>
<%@page import="com.Model.CommunityDTO"%>
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
<!-- <link rel="stylesheet" href="assets/css/.css" /> -->


</head>

<body class="is-preload">



	<%
	MemberDTO userInfo = (MemberDTO) session.getAttribute("userInfo");

	String userId = null;
	String userPw = null;
	String userName = null;
	String userAge = null;
	
	ArrayList<CommunityDTO> community_list = null;

	if (userInfo != null) {
		userId = userInfo.getUserId();
		userPw = userInfo.getUserPw();
		userName = userInfo.getUserName();
		userAge = userInfo.getUserAge();
		
		
		CommunityDAO commudao = new CommunityDAO();
		community_list = commudao.Community_Select_Show(userId);
	}

	%>
	<header>

	<h2>�� �Խñ�</h2>



	<div style="border: 1px solid; width: 100%; height: 20%;"></div>

	<%
	System.out.println(userId);
	%>
	<table id="commtitle">
		<thead>
			<tr>
				<th scope="col">��ȣ</th>
				<th scope="col">����</th>
				<th scope="col">ID</th>
				<th scope="col">Day</th>
				<th scope="col">Like</th>
				<th scope="col">View</th>
			</tr>
		</thead>

		<% if (userId != null) {
			for (int i = 0; i < community_list.size(); i++) { %>
		<tbody>
			<tr>
				<td><%=i + 1%></td>
				<td onclick="location.href='viewCommu.jsp?board_num=<%=community_list.get(i).getBoard_num()%>'"><%=community_list.get(i).getUserid()%></td>
				<td><%=community_list.get(i).getTitle()%></td>
				<td><%=community_list.get(i).getUpload_date()%></td>
				<td><%=community_list.get(i).getLike_num()%></td>
				<td><%=community_list.get(i).getView_num()%></td>
			</tr>
		</tbody>
		<%}%>
	</table>
	</header>
	<%} else {%>
		<li>������ Email : ���ǿ����� ����� email�� ����Ͻÿ�.</li>
	<%}%>

	<button onclick="location.href='writerCommu.jsp'" id="writer" style="position: relative; left: 75%;">�ۼ��Ϸ�����</button>






	<script type="text/javascript">
		function oneDelete(num) {
			$.ajax({
				url : 'ClothesOneDeleteServicCon.do',
				type : 'post',
				data : {
					num : num
				},
				success : function(data) {
					alert('��������');
					$(location).attr('href', 'Main.jsp');
				},
				error : function() {
					alert('��������');
				}
			});

		}
	</script>




</body>
</html>