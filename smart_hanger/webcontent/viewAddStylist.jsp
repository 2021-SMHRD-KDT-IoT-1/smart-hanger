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
	width: 50%;
	height: 100%;
	float: left;
}

#pickcloth {
	position: relative;
	width: 80%;
	height: 350px;
	top: 20px;
	left: 20px;
	border: 1px solid;
	overflow: hidden;
}

#cloth_imgs {
	height: 100;
}

#pickbutten {
	position: relative;
	top: 20px;
	left: 20px;
}

/* ==============����� ������ ȭ�� ��Ÿ�� ==================== */
#right {
	overflow-y: scroll;
	width: 50%;
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

</style>

</head>

<body class="is-preload">




	<script type="text/javascript">
	
		
		
	</script>

	<!-- Wrapper-->
	<div id="wrapper">

		<!-- Main -->
		<!-- red == ����� �� ���� ���  -->


		<div id="main">
			<form action="CodyAddServiceCon.do" method="post" enctype="multipart/form-data">



				<!-- ���� ���� -->
				<div id="left">


					<div id="pickcloth">

	
	
    <div id="results" ></div>
	
	<!-- Webcam.min.js -->
    <script type="text/javascript" src="webcamjs/webcam.min.js"></script>

	<!-- Configure a few settings and attach camera -->
	<script language="JavaScript">
		Webcam.set({
			width: 320,
			height: 240,
			image_format: 'jpeg',
			jpeg_quality: 90
		});
		Webcam.attach( '#pickcloth' );
	</script>
	<!-- A button for taking snaps -->
	
	<!-- Code to handle taking the snapshot and displaying it locally -->
	<script language="JavaScript">

		function take_snapshot() {
			
			// take snapshot and get image data
			Webcam.snap( function(data_uri) {
				Webcam.reset();
				// display results in page
				document.getElementById('pickcloth').innerHTML = 
					'<img src="'+data_uri+'"/>';
				document.getElementById('Take Snapshot').innerHTML = 
					'<img src="'+data_uri+'"/>';
			} );
		}
	</script>
						<img id="cloth_imgs" src="" alt="" style="width: 105%; position: relative; right: 2.5%;">
					</div>
						
					<div id="pickbutten">

					<input type="file" name="img_file">

						<input type=button value="Take Snapshot" onClick="take_snapshot()">

					</div>
				</div>



				<!-- ������ ���� -->
				<div id="right">
					<div id="input_tag_div">
						<ol style="list-style: none;">

							<li></li>
							
				 		
							
							
							
							<!-- ����ڿ��� ���� ���� �����ؼ� �Ѱ���-->
							<li>�ڵ� �Խñۿ� �ø� ����</li>
							<li><textarea rows="68" cols="60" name="memo" placeholder="�̿��� �Բ� �� ������ �Է����ּ���"></textarea></li>

							<li><input class="cr_pick" type="submit" value="���">

						</ol>


					</div>

				</div>

			</form>

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