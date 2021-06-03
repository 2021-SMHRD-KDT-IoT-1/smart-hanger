<%@page import="com.Model.Cody_Board_DTO"%>
<%@page import="com.Model.Cody_Board_DAO"%>
<%@page import="com.Model.My_clothesDTO"%>
<%@page import="com.Model.My_clothesDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Astral by HTML5 UP</title>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="assets/css/main.css" />
<link rel="stylesheet" href="assets/css/viewCloth.css" />
<STYLE TYPE="text/css">
table {
	font-size: 8pt;
}
</STYLE>
<style type="text/css">
#main {
	height: 500px
}

/* ----------���ʿ��� */
#left {
	width: 50%;
	height: 100%;
	float: left;
}

#camera {
	position: relative;
	width: 95%;
	height: 90%;
	top: 20px;
	left: 20px;
	border: 1px solid;
}

/* ------------�����ʿ��� */
#right {
	width: 50%;
	height: 100%;
	float: left;
}

#input_tag_div {
	position: relative;
	top: 37px;
	width: 91%;
	height: 115px;
	overflow: scroll;
	height: 100%;
}

#my_content {
	border: 1px solid;
	padding: 5%;
	width: 100%;
	height: 20%;
}

#comments {
	border: 1px solid;
	padding: 1%;
	width: 100%;
	height: 20%;
}
</style>
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
	%>

	<!-- Wrapper-->
	<div id="wrapper">

		<!-- Main -->
		<!-- red == ����� �� ���� ���  -->

		<div id="main">






			<!-- ���� ���� -->
			<div id="left">


				<div id="camera">
				
					<img id="cloth_imgs" src="cody_img/<%=cody_info.getClothespath()%>" alt="">
				
				</div>



			</div>










			<!-- ������ ���� -->
			<div id="right">
				<div id="input_tag_div">
					<form action="#">
						<ol style="list-style: none;">


							<div id="my_content"><%=cody_info.getContent()%></div>


							<!-- <div id="comments"> -->

							<ul id="comments" Style="list-style: none">
								<div>
									<li>
									<table>
											<tr style="border: 1px solid; margin: auto; text-align: center;">
												<th class="co5" id=c1>1</th>

												<th class="co5" id=c4><%=cody_info.getUserid() %></th>
												<th class="co5" id=c5><%=cody_info.getUpload_date() %></th>
											</tr>
									</table>
									
									</li>
						
								</div>
							</ul>

							<!-- </div> -->

							<li><input type="button" value="�̰Ŵ� ����������"
								style="margin: auto; width: 49%;"> <input type="button"
								value="�̰Ŵ� ����������" style="margin: auto; width: 49%;"></li>


							<div>
								<input type="text" value="����� ��� ���°�" style="width: 75%;">
								<input type="button" value="�ۼ� "
									Style="width: 23%; text-align: center;">
							</div>


						</ol>

					</form>
				</div>

			</div>










		</div>

		<input type="button" value="�ڷΰ���" onclick="location.href='Main.jsp#Stylist'" />
		<!-- style="color:black" -->
		<!-- Footer -->
		<div id="footer">
			<ul class="copyright">
				<li>&copy; Untitled.</li>
				<li>Design: <a href="http://html5up.net">HTML5 UP</a></li>
			</ul>
		</div>

	</div>

	<!-- Scripts -->
	<script src="assets/js/jquery.min.js"></script>
	<script src="assets/js/browser.min.js"></script>
	<script src="assets/js/breakpoints.min.js"></script>
	<script src="assets/js/util.js"></script>
	<script src="assets/js/main.js"></script>

</body>
</html>