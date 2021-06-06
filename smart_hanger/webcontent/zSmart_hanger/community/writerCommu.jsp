<%@page import="java.nio.file.Paths"%>
<%@page import="java.nio.file.Files"%>
<%@page import="java.io.InputStream"%>
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
<link rel="stylesheet" href="../../assets/css/main.css" />
<link rel="stylesheet" href="../../assets/css/addBoard.css" />

</head>

<body class="is-preload">


	<script type="text/javascript" src="../../js/jquery-3.6.0.min.js"></script>
	<script type="text/javascript" src="../../webcamjs/webcam.min.js"></script>
	<script type="text/javascript" src="../../js/html2canvas.js"></script>
	<script type="text/javascript">
	

		window.onload = function() {

			// 등록 이미지 등록 미리보기
			function readInputFile(input) {
				if (input.files && input.files[0]) {
					var reader = new FileReader();
					reader.onload = function(e) {
						$('#pick_div').html(
								"<img id='img_preview' style='width : 100%;' src="
										+ e.target.result + ">");
					}
					reader.readAsDataURL(input.files[0]);
				}

			}

			var upload = document.querySelector('#img_file');

			upload.addEventListener('change', function(e) {
				readInputFile(this);
				document.getElementById('img_bt').style.display = 'block';
			});

			

		}


	</script>

	<!-- Wrapper-->
	<div id="wrapper">

		<!-- Main -->
		<!-- red == 여기는 옷 사진 출력  -->


		<div id="main">
			<!-- <button onclick="downImg()">사진 저장</button> -->
			
			<form action="WriteCommuCon.do" method="post" enctype="multipart/form-data">



				<!-- 왼쪽 영역 -->
				<div id="left">

					<div id="pick_div">
						<div id="pickcloth">


							<div id="results"></div>

							<!-- Webcam.min.js -->





							<img id="cloth_imgs" src="" alt="" style="width: 105%; position: relative; right: 2.5%;">
						</div>
					</div>

					<div id="pickbutten">



						<input type="file" name="img_file" id="img_file" accept=".gif, .jpg, .png" style="display: none;">
						<input type="button" id="img_upload" value="사진 업로드" onClick="file_upLoad()" accept="image/*" onchange="setThumbnail(event)">

					</div>
				</div>


				<!-- img_bt : 사진, memo : 내용, title : 제목 -->
				
				
				
				<!-- 오른쪽 영역 -->
				<div id="right">
					<div id="input_tag_div">
						<ol style="list-style: none;">

							<li></li>

							<li>제목
							<li>
							<li><input type="text" name="title" placeholder="제목을 입력해주세요"> <!-- 사용자에게 히든 값을 저장해서 넘겨줌-->
							<li><br></li>
							<li><textarea rows="68" cols="60" name="memo" placeholder="내용을 입력해주세요"></textarea>
							<input type="hidden" name="img_type" value="upload">
							<input type="hidden" name="community_Insert">
							</li>

							<li><input id="img_bt" class="cr_pick" type="submit" value="등록" style="display: none;">
						</ol>


					</div>

				</div>

			</form>

		</div>

		<input type="button" value="뒤로가기" onclick="history.back();" />
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
	<script src="../../assets/js/jquery.min.js"></script>
	<script src="assets/js/browser.min.js"></script>
	<script src="assets/js/breakpoints.min.js"></script>
	<script src="assets/js/util.js"></script>
	<script src="assets/js/main.js"></script>
	
	<script type="text/javascript" src="../../js/jquery-3.6.0.min.js"></script>
	<script type="text/javascript" src="webcamjs/webcam.min.js"></script>
	<script src="js/html2canvas.js"></script>

	<!-- Configure a few settings and attach camera -->
	<script language="JavaScript">
	
	
	
	// 사진 업로드 버튼
	function file_upLoad() {
		document.getElementById("img_file").click();

	}
	
	</script>

		
	<script src="../../assets/js/browser.min.js"></script>
	<script src="../../assets/js/breakpoints.min.js"></script>
	<script src="../../assets/js/util.js"></script>
	<script src="../../assets/js/main.js"></script>
 
</body>
</html>
