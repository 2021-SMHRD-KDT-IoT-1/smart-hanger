<%@page import="com.Model.Cody_Board_DTO"%>
<%@page import="com.Model.Cody_Board_DAO"%>
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
<link rel="stylesheet" href="assets/css/cody.css">
</head>
<body>



	<%
	Cody_Board_DAO codydao = new Cody_Board_DAO();
	ArrayList<Cody_Board_DTO> cody_list = codydao.Cody_Board_All_Select();
	%>


	<div>
		<input id = "cody_uqpdate" type="button" value="코디 등록" onclick="location.href='zSmart_hanger/cody/addCody.jsp'">
	</div>
	<header>
		<h2 id="head_h2">옷장 : 여기 수정해야함</h2>
	</header>
	
	
	<p>옷장 이미지 띄우는곳 설명은 나중에 바꿈</p>


	<section>

		<div id="cody_sc" class="row">

			<!-- 여기가 코디  이미지 불러오는곳  -->

			<% for (int row = 0; row < cody_list.size(); row++) { %>
			<div class="col-4 col-6-medium col-12-small">
				<a href="zSmart_hanger/cody/viewStylist.jsp?num=<%=cody_list.get(row).getCody_board_num()%>" class="image fit">
				<img class="cody_imgs" src="./cody_img/<%=cody_list.get(row).getClothespath()%>" alt=""></a>
			</div>
			<% } %>







		</div>

	</section>

</body>
</html>