<%@page import="com.Model.Cody_clothesDTO"%>
<%@page import="com.Model.Cody_clothesDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<style type="text/css">
#cody_sc{
overflow-y: scroll; width: 750px; height: 400px;
}
</style>
</head>
<body>




    
	<%
	Cody_clothesDAO codydao = new Cody_clothesDAO();
	ArrayList<Cody_clothesDTO> cody_list = codydao.Cody_clothes_All_Select();
	%>


	<div>
		<input type="submit" value="�ڵ� ���" style="float: right;">
	</div>
	<header>
		<h2 Style = "position: relative; top: 10px;">���� : ���� �����ؾ���</h2>
	</header>
	
	
	<p>���� �̹��� ���°� ������ ���߿� �ٲ�</p>


	<section>

		<div id="cody_sc" class="row">

			<!-- ���Ⱑ �ڵ�  �̹��� �ҷ����°�  -->

			<% for (int row = 0; row < cody_list.size(); row++) { %>
			<div class="col-4 col-6-medium col-12-small">
				<a href="viewStylist.jsp?num=" <%=cody_list.get(row).getCody_num()%> class="image fit">
				<img class="cody_imgs" src="./cody_img/<%=cody_list.get(row).getClothesPath()%>" alt=""></a>
			</div>
			<% } %>







		</div>

	</section>

</body>
</html>