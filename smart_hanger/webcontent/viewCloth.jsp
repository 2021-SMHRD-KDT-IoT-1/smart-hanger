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
		// 5. 쿠키 저장 조회
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
	                alert('삭제성공');
	                $(location).attr('href', 'Main.jsp');
	            },
	            	error: function() {
	                alert('삭제실패');
	            }
	        });
		
		}
		
		
		
	</script>

	<!-- Wrapper-->
	<div id="wrapper">

		<!-- Main -->
		<!-- red == 여기는 옷 사진 출력  -->


		<div id="main">
			<form action="ClothesUpdateServiceCon.do" method="post" enctype="multipart/form-data">



				<!-- 왼쪽 영역 -->
				<div id="left">


					<div id="pickcloth">

						<img id="cloth_imgs" src="cloth_img/<%=cloth_info.getClothespath()%>" alt="">
					</div>

					<div id="pickbutten">

						<input type="file" class="cr_pick" name="img_file"> <input type="button" style="position: relative;" value="사진찍기" onclick="history.back();">

					</div>
				</div>



				<!-- 오른쪽 영역 -->
				<div id="right">
					<div id="input_tag_div">
						<ol style="">

							<li><input type="button" id="del"class="cr_pick" value="삭제" onclick="oneDelete(<%=num%>)"></li>

							<li>옷 이름
							<li>
							<li><input type="text" name="title" value=" <%=cloth_info.getClothesName()%>"> <input type="hidden" name="num" value="<%=num%>"><input
								type="hidden" name="old_img_path" value="<%=cloth_info.getClothespath() %>"
							></li>
							<!-- 사용자에게 히든 값을 저장해서 넘겨줌-->
							<li>옷에 대한 사용자가 적을 것</li>
							<li><textarea rows="68" cols="60" name="memo"><%=cloth_info.getMemo() %>
							</textarea></li>


							<li><input class="cr_pick" type="submit" value="수정">

								<button id="clothespick" class="cr_pick">선택</button></li>
						</ol>


					</div>

				</div>

			</form>

		</div>

		<input type="button" value="뒤로가기" onclick="location.href='Main.jsp#work'" />
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