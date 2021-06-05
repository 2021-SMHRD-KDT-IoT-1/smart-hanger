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
<link rel="stylesheet" href="assets/css/viewClothiadd.css" />

<style type="text/css">












</style>


</head>

<body class="is-preload">


	<%
		Cookie cookie = null;

	My_clothesDAO dao = new My_clothesDAO();

	String num = request.getParameter("num");

	if (num != null) {
		cookie = new Cookie("my_clothes_num", num);
		cookie.setMaxAge(60 * 60 * 30);
	} else {
		// 5. ��Ű ���� ��ȸ
		Cookie[] cookies = request.getCookies();

		for (Cookie cookie_info : cookies) {
			if (cookie_info.getName().equals("num")) {
		num = cookie_info.getValue();
			}
		}
	}

	My_clothesDTO cloth_info = dao.My_clothes_One_Select(num);
	%>




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


					<div id="pickcloth">

						<img id="cloth_imgs" src="cloth_img/<%=cloth_info.getClothespath()%>" alt="">
					</div>

					<div id="pickbutten">

						<input type="file" class="cr_pick" name="img_file"> <input type="button" style="position: relative;" value="�������" onclick="history.back();">

					</div>
				</div>



				<!-- ������ ���� -->
				<div id="right">
					<div id="input_tag_div">
						<ol style="">

							<li><input type="button" id="del"class="cr_pick" value="����" onclick="oneDelete(<%=num%>)"></li>

							<li>�� �̸�
							<li>
							<li><input type="text" name="title" value=" <%=cloth_info.getClothesName()%>"> <input type="hidden" name="num" value="<%=num%>"><input
								type="hidden" name="old_img_path" value="<%=cloth_info.getClothespath() %>"
							></li>
							<!-- ����ڿ��� ���� ���� �����ؼ� �Ѱ���-->
							<li>�ʿ� ���� ����ڰ� ���� ��</li>
							<li><textarea rows="68" cols="60" name="memo"><%=cloth_info.getMemo() %>
							</textarea></li>


							<li><input class="cr_pick" type="submit" value="����">

								<button id="clothespick" class="cr_pick">����</button></li>
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