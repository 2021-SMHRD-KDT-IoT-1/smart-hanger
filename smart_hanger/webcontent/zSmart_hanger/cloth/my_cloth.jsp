<%@page import="java.net.URLEncoder"%>
<%@page import="java.net.URLDecoder"%>
<%@page import="com.Model.MemberDTO"%>
<%@page import="com.Model.My_clothesDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.Model.My_clothesDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" href="assets/css/my_cloth.css">
</head>
<body>

	<%
		String userId = ((MemberDTO) session.getAttribute("userInfo")).getUserId();

	My_clothesDAO clothesdao = new My_clothesDAO();
	ArrayList<My_clothesDTO> clothes_list = new ArrayList<My_clothesDTO>();

	if (userId != null) {
		clothes_list = clothesdao.My_clothes_All_Select(userId);
	}
	%>
	
	
	
	
	<div>
		<button style="float: left; height: 50px;" onclick="location.href = 'zSmart_hanger/cloth/addCloth.jsp'">�� ���</button>
	</div>
	
	
	<header>
		<h2 Style="position: relative; top: 10px; display: inline-block;">���� : ���� �����ؾ���</h2>
	</header>
	
	
	<p>���� �̹��� ���°� ������ ���߿� �ٲ�</p>


	<section>
		<div  id="img_box" class="row">

			<%	if (userId != null) {
				clothes_list = clothesdao.My_clothes_All_Select(userId);	%>

	
				<!-- ���Ⱑ ���忡 �ִ� �̹��� �ҷ����°�  -->
				<%	for (int row = 0; row < clothes_list.size(); row++) {	%>
				<div class="col-3">
					<a href="zSmart_hanger/cloth/viewCloth.jsp?num=<%=clothes_list.get(row).getMy_clothes_num()%>" class="image fit"> <img class="cloth_imgs"
						src="cloth_img/<%=clothes_list.get(row).getClothespath()%>" alt=""></a>
				</div>
				<%	}	%>

			<%	}	%>

		</div>
	</section>



</body>
</html>