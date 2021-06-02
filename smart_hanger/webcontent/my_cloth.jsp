<%@page import="com.Model.My_clothesDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.Model.My_clothesDAO"%>
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
	My_clothesDAO clothesdao = new My_clothesDAO();
	ArrayList<My_clothesDTO> clothes_list = clothesdao.My_clothes_All_Select();


%>
			<div>
				<input type="submit" value="옷 등록" style="float: right;" onClick="location.href='addCloth.jsp'">
			</div>
			<header>
			<h2 Style="position: relative; top: 10px;">옷장 : 여기 수정해야함</h2>
			</header>
			<p>옷장 이미지 띄우는곳 설명은 나중에 바꿈</p>


			<section>

			<div class="row" style="overflow-y: scroll; width: 750px; height: 400px;">

				<!-- 여기가 옷장에 있는 이미지 불러오는곳  -->
				<%
				for (int row = 0; row < clothes_list.size(); row++) {
				%>
				<div class="col-4 col-6-medium col-12-small">
					<a href="viewCloth.jsp?num=<%=clothes_list.get(row).getMy_clothes_num()%>" class="image fit"> <img class="cloth_imgs"
						src="cloth_img/<%=clothes_list.get(row).getClothesName()%>" alt=""></a>
				</div>
				<%
				}
				%>


			</div>

			</section> 
			

</body>
</html>