
<%@page import="com.Model.MemberDTO"%>
<%@page import="java.net.URLEncoder"%>
<%@page import="com.Model.My_clothesDTO"%>
<%@page import="com.Model.My_clothesDAO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Astral by HTML5 UP</title>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="assets/css/main.css" />
<link rel="stylesheet" href="assets/css/viewCloth.css" />
<style type="text/css">
#main {
	height: 500px;

	/* =================����� ���� ȭ�� ��Ÿ�� ======================= */
}

#left {
	width: 20%;
	height: 100%;
	float: left;
}

/* ==============����� ������ ȭ�� ��Ÿ�� ==================== */
#right {
	overflow-y: scroll;
	width: 80%;
	height: 500px;
	float: left;
}

#input_tag_div {
	position: relative;
	top: 37px;
	width: 91%;
	height: 115px;
}

#del {
	float: right;
	height: 50%;
	width: 30%;
}

li>textarea {
	resize: none;
	height: 215px;
}

ol>li>.cr_pick {
	margin: auto;
	width: 49%;
}

#clothespick {
	margin: auto;
	width: 49%;
	height: 59px;
}

#my_infor{
 top: 30px;
}

#board_post{

 top: 40px;
}

#board_comment {

 top: 50px;
}

h1{
 font-size : 20px;
}
</style>

</head>

<body class="is-preload">


<%MemberDTO dto = (MemberDTO) session.getAttribute("userInfo"); %>


	<script type="text/javascript">
	
		function oneDelete(num){
	        $.ajax({
	            url : 'ClothesOneDeleteServicCon.do',
	            type : 'post',
	            data : {num : num},
	            success: function(data) {
	                alert('��������');
	                $(location).attr('href', 'Main.jsp');
	            },
	            	error: function() {
	                alert('��������');
	            }
	        });
		
		}
		
		
		
	</script>

	<!-- Wrapper-->
	<div id="wrapper">

		<!-- Main -->
		<!-- red == ����� �� ���� ���  -->


		<div id="main">
			<form action="ClothesUpdateServiceCon.do" method="post" enctype="multipart/form-data">



				<!-- ���� ���� -->
				<div id="left">


				
						
					<div id="pickbutten">

						

						<input id="my_infor" type="button" style="position: relative; width:120pt ;height:45pt;" value="������������" onclick="location.href='MemberUpdate.jsp';">
						<input id="board_post" type="button" style="position: relative; width:120pt ;height:45pt;" value="�Խñ�" onclick="history.back();">
						<input id="board_comment" type="button" style="position: relative; width:120pt ;height:45pt;" value="���" onclick="history.back();">

					</div>
				</div>



				<!-- ������ ���� -->
				<div id="right">
					<div id="input_tag_div">
						<ol style="list-style: none;">
						
						
						
						
					<!--  ������ ���� ���� -->
						
						

							
							
				 			<li>����� �̸�<li>
							
							<h1><%=dto.getUserName()%></h1>
							
							<li>����� ����<li>
							
							<h1><%=dto.getUserAge()%>��</h1>
							
							<li>�Ұ�<li>
							
							<h1>����Ʈ ��Ÿ� �̿����ּż� �����մϴ�.</h1>
							
							
								
								
					<!--  ������ ���� ���� �������-->			
								
								
								
								
								
						</ol>


					</div>

				</div>

			</form>

		</div>

		<input type="button" value="�ڷΰ���" onclick="location.href='Main.jsp#work'" />
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