<%@page import="com.Model.Cody_board_commentsDTO"%>
<%@page import="com.Model.Cody_board_commentsDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.Model.Board_commentsDTO"%>
<%@page import="com.Model.Cody_Board_DTO"%>
<%@page import="com.Model.Cody_Board_DAO"%>
<%@page import="com.Model.My_clothesDTO"%>
<%@page import="com.Model.My_clothesDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Astral by HTML5 UP</title>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="../../assets/css/main.css" />

<link rel="stylesheet" href="../../assets/css/cody_view.css" />

</head>

<!-- =====================================����� �ڵ� �� ������ ======================================================== -->
<body class="is-preload">

	<%
	Cookie cookie = null;

	Cody_Board_DAO dao = new Cody_Board_DAO();

	String num = request.getParameter("num");

	Cody_Board_DTO cody_info = dao.Cody_Board_One_Select(num);

	// ����ھ��̵� �������� ���� �ۼ��� �͵��� ������
	// �׷��� ����� ���̵�� ������ ���ļ� ���̺� �ø�
	// �̰� dao ���� ����� ������ ����� �˴ϴ�
	
	
	Cody_board_commentsDAO comment_dao = new Cody_board_commentsDAO();
	
	ArrayList<Cody_board_commentsDTO> commemtLists = comment_dao.Board_comments_All_Select();
	
	
	
	
	%>

	<!-- Wrapper-->
	<div id="wrapper">

		<!-- Main -->
		<!-- red == ����� �� ���� ���  -->

		<div id="main">





			<!-- ���� ���� -->
			<div id="left">


				<div id="camera">

					<img id="cloth_imgs" src="../../cody_img/<%=cody_info.getClothespath()%>" alt=#>

				</div>



			</div>




			<!-- ������ ���� -->
			<div id="right" style="overflow-y: scroll;">
				<form action="CodyCommentsInsertCon.do" id="input_tag" method="post">
					<input type="hidden" name="num" value="<%=num%>">
					<ul id="my_content">
						<li><%=cody_info.getUserid()%></li>
						<li><%=cody_info.getContent()%></li>
						<li><p>���ƿ� : <%=cody_info.getLike_num()%></p>
							<p>��ȸ�� : <%=cody_info.getView_num()%></p></li>
						<li><%=cody_info.getUpload_date()%></li>
						<li>
							<ul style="list-style:none">
							<% for(int row = 0 ; row < commemtLists.size(); row++){ %> 
								<li>
									<p> <%= commemtLists.get(row).getUserId() %>	</p> 
									<p> <%= commemtLists.get(row).getUpload_date() %> </p>
									<p> <%= commemtLists.get(row).getComments() %> </p>
								</li>	
								<% } %>
								<li id = "line"><textarea class="chat" name="comment" style="resize : none" placeholder="��� �Է�"></textarea><input class="chat2" type="submit" value="���"></li>
							</ul>
							
						</li>
						
						

					</ul>
				</form>

			</div>







			<input type="button" value="�ڷΰ���" onclick="location.href='Main.jsp#Stylist'" >
			<!-- style="color:black" -->
			<!-- Footer -->
			<div id="footer">
				<ul class="copyright">
					<li>&copy; Untitled.</li>
					<li>Design: <a href="http://html5up.net">HTML5 UP</a></li>
				</ul>
			</div>

		</div>
	</div>

	<!-- Scripts -->
	<script src="../../assets/js/jquery.min.js"></script>
	<script src="../../assets/js/browser.min.js"></script>
	<script src="../../assets/js/breakpoints.min.js"></script>
	<script src="../../assets/js/util.js"></script>
	<script src="../../assets/js/main.js"></script>
</body>
</html>