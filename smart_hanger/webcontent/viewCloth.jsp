<%@page import="com.Model.My_clothesDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Model.WebClothesDTO"%>
<%@page import="Model.WebClothesDAO"%>
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
<style type="text/css">

#main {
height: 500px;

/* =================����� ���� ȭ�� ��Ÿ�� ======================= */
}
#left {
width: 50%; height: 100%; float: left;
}
#pickcloth{
position: relative; width: 80%; height: 70%; top: 20px; left: 20px; border: 1px solid;
}
#pickbutten{
position: relative; top: 20px; left: 20px;
}

/* ==============����� ������ ȭ�� ��Ÿ�� ==================== */
#right {
 overflow-y:scroll; width: 50%; height: 100%; float: left;
}
#input_tag_div {
position: relative; top: 37px; width: 91%; height: 115px;
}
#del{
float: right; height: 50%; width: 30%;
}
li > textarea {
resize: none; height: 215px;
}
 ol > li > .cr_pick {
 margin: auto; width: 49%;
}

</style>

</head>

<body class="is-preload">


<%
	My_clothesDAO dao = new My_clothesDAO();
   
   String num = request.getParameter("num");
   
   WebClothesDTO cloth_info = dao.SearchOneClothes(num);

%>


	<!-- Wrapper-->
	<div id="wrapper">

		<!-- Main -->
		<!-- red == ����� �� ���� ���  -->


		<div id="main">



			<!-- ���� ���� -->
			<div id="left" >


				<div id="pickcloth">
								
				<img class="cloth_imgs" src="cloth_img/<%= cloth_info.get %>" alt="" style="width: 100%">				
				

				</div>


				<div id ="pickbutten">

					<input type="button" style="position: relative;" value="�������"
						onclick="history.back();">

				</div>
			</div>



			<!-- ������ ���� -->
			<div id="right"  >
				<div id="input_tag_div">
					<form action="">
						<ol style="list-style: none;">
							<div>
								<input id ="del" type="submit" value="����">
							</div>
							
							<li><%=cloth_info.getClothesname()%></li>
							
							<li><input type="text" nema ="Clothtext"></li>
							<li>�ʿ� ���� ����ڰ� ���� ��</li>
							<li><textarea rows="68" cols="60">
							</textarea></li>
							<li><input class ="cr_pick" type="submit" value="����" >
								<input class ="cr_pick" type="submit" value="����" ></li>
						</ol>

					</form>
				</div>

			</div>


		</div>

		<input type="button" value="�ڷΰ���" onclick="history.back();" />
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