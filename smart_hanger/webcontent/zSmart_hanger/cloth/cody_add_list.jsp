<%@page import="com.Model.My_codyDTO"%>
<%@page import="com.Model.My_codyDAO"%>
<%@page import="java.net.URLEncoder"%>
<%@page import="java.net.URLDecoder"%>
<%@page import="com.Model.MemberDTO"%>
<%@page import="com.Model.My_clothesDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" href="assets/css/my_cloth.css">
<!-- 

	<script type="text/javascript">
		var ver = Math.floor((Math.random() * 1000));
		document.write('<link rel="stylesheet" href="assets/css/my_cloth.css?ver=' + ver + '">');
	</script>
 -->

</head>
<body>


	<%
	MemberDTO userInfo = (MemberDTO) session.getAttribute("userInfo");

	ArrayList<My_codyDTO> cody_list = null;

	if (userInfo != null) {

		String userId = (userInfo).getUserId();

		My_codyDAO cody_dao = new My_codyDAO();
		cody_list = cody_dao.My_cody_All_Select(userId);

	}

	
	if (cody_list != null) { %>
	<header id="cloth_header">
		<h2><%=userInfo.getUserName()%>
			���� �ڵ���
		</h2>
		<input type="button" id="cloth_uqpdate" value="�ڵ� ���" onclick="location.href = 'zSmart_hanger/cloth/cody_add.jsp'">
	<br>
	
	<p>���㸧�� ���� ������ ������� ���� ����ϰ� �������� ���� ���� ������ ������� �� ���ڸ� ����Ѵ١� - ���� ����</p>
	</header>
	<section>
		<div id="img_box" class="row">


			<!-- ���Ⱑ ���忡 �ִ� �̹��� �ҷ����°�  -->
			
				<% for (int row = 0; row < cody_list.size(); row++) { %>
						<div class="col-3">
							<a href="zSmart_hanger/cloth/viewCody.jsp?num=<%=cody_list.get(row).getMy_cody_num()%>" class="image fit"> 
							<img class="cloth_imgs" src="myCody/<%=cody_list.get(row).getClothespath()%>" alt=""></a>
						</div>

				<%	} %>

		</div>
	</section>
			
	<% }  %>

</body>
</html>