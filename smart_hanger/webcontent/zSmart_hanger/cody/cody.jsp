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
<style type="text/css">
#cody_sc{
overflow-y: scroll; width: 750px; height: 400px;
}

#head_h2{
	display: inline-block;
}

#cody_uqpdate{

 background: gray;
 font-family: "Gmarket Sans";
 font-weight: bold;
 border-radius: 15px;

}


</style>
</head>
<body>



	<%
	Cody_Board_DAO codydao = new Cody_Board_DAO();
	ArrayList<Cody_Board_DTO> cody_list = codydao.Cody_Board_All_Select();
	%>


	<div>
		<input id = "cody_uqpdate" type="button" value="�ڵ� ���" style="float: right;" onclick="location.href='zSmart_hanger/cody/addCody.jsp'">
	</div>
	<header>
		<h2 id="head_h2" Style = "position: relative; top: 10px;">���� : ���� �����ؾ���</h2>
	</header>
	
	
	<p>���� �̹��� ���°� ������ ���߿� �ٲ�</p>


	<section>

		<div id="cody_sc" class="row">

			<!-- ���Ⱑ �ڵ�  �̹��� �ҷ����°�  -->

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