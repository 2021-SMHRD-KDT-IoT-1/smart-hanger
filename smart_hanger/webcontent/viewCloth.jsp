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
</head>

<body class="is-preload">





	<!-- Wrapper-->
	<div id="wrapper">

		<!-- Main -->
		<!-- red == ����� �� ���� ���  -->

		<div id="main" style="height: 500px">


			<!-- ���� ���� -->
			<div id="left" style="width: 50%; height: 100%; float: left;">


				<div id="container_div" >
						
						<div id="container">
						
						
						    <video autoplay="true" id="videoElement">	
						    	<script type="text/javascript">
									var video = document.querySelector("#videoElement");
								 
									if (navigator.mediaDevices.getUserMedia) {
										navigator.mediaDevices.getUserMedia({ video: true }).then(function (stream) {
											video.srcObject = stream;
								    })
									    .catch(function (err0r) {
									      console.log("Something went wrong!");
								    	});
									}
								</script>
						    </video>
					</div>
					
				</div>

				<div style="position: relative; top: 20px; left: 20px;">
					<input type="button" style="position: relative;" value="�������"
						onclick="history.back();">

				</div>
			</div>


			<!-- ������ ���� -->
			<div id="right" style="width: 50%; height: 100%; float: left;">
				<div id="input_tag_div"
					style="position: relative; top: 37px; width: 91%; height: 115px;">
					<form action="#">
						<ol style="list-style: none;">
							<div>
								<input type="submit" value="����"
									style="float: right; height: 50%; width: 30%;">
							</div>

							<li>�� �̸�></li>
							<li><input type="text"></li>
							<li>�ʿ� ���� ����ڰ� ���� ��</li>
							<li><textarea rows="68" cols="60"
									style="resize: none; height: 215px;">
							</textarea></li>
							<li><input type="submit" value="����" style=" margin: auto; width: 49%;">
								<input type="submit" value="����" style=" margin: auto; width: 49%;"></li>
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