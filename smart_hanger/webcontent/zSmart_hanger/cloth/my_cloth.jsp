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
<!-- 

	<script type="text/javascript">
		var ver = Math.floor((Math.random() * 1000));
		document.write('<link rel="stylesheet" href="assets/css/my_cloth.css?ver=' + ver + '">');
	</script>
 -->

</head>
<body>
	<script src="./js/jquery-3.6.0.min.js"></script>

	<%
	MemberDTO userInfo = (MemberDTO) session.getAttribute("userInfo");

	ArrayList<My_clothesDTO> clothes_list = null;

	if (userInfo != null) {

		String userId = (userInfo).getUserId();

		My_clothesDAO clothesdao = new My_clothesDAO();
		clothes_list = clothesdao.My_clothes_All_Select(userId);

	}
	%>



	<%	if (clothes_list != null) { %>
	<header id="cloth_header">
		<h2><%=userInfo.getUserName()%>
			님의 옷장
		</h2>
		<input type="button" id="cloth_uqpdate" value="옷 등록" onclick="location.href = 'zSmart_hanger/cloth/addCloth.jsp'">
	<br>
	
	<p>“허름한 옷을 입으면 사람들은 옷을 기억하고 흠잡을데 없이 옷을 입으면 사람들은 그 여자를 기억한다” - 코코 샤넬</p>
	</header>
	<section>
		<div id="img_box" class="row">


			<!-- 여기가 옷장에 있는 이미지 불러오는곳  -->
			
				<% for (int row = 0; row < clothes_list.size(); row++) { %>
						<div class="col-3">
							<a href="zSmart_hanger/cloth/viewCloth.jsp?num=<%=clothes_list.get(row).getMy_clothes_num()%>" class="image fit"> 
							<img class="cloth_imgs" src="cloth_img/<%=clothes_list.get(row).getClothespath()%>" alt=""></a>
						</div>

				<%	} %>

		</div>
	</section>
			
	<% }  %>

</body>
</html>