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
<link rel="stylesheet" href="../../assets/css/viewCloth.css" />
<style type="text/css">
#main {
	height: 500px;

	/* =================여기는 왼쪽 화면 스타일 ======================= */
}

#left {
	width: 50%;
	height: 100%;
	float: left;
}

#pickcloth {
	position: relative;
	overflow: hidden;
}

#pick_div {
	position: relative;
	width: 80%;
	height: 350px;
	top: 20px;
	left: 20px;
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

/* ==============여기는 오른쪽 화면 스타일 ==================== */
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

/* 전송 버튼 */
#pic_img_bt{
position: absolute;
    display: block;
    right: 10%;
    top: 80%;
    width: 20%;
    height: 10%;
    font-size: 17px;
}

#img_upload{
	font-family: "Gmarket Sans";
	font-weight: bold;
	border-radius: 15px;
	background-color: gray;
}

#take_picture{
	font-family: "Gmarket Sans";
	font-weight: bold;
	border-radius: 15px;
	background-color: gray;
}

#back_btn{
	font-family: "Gmarket Sans";
	font-weight: bold;
	border-radius: 15px;
	background-color: gray;
}

#pic_img_bt{
	font-family: "Gmarket Sans";
	font-weight: bold;
	border-radius: 15px;
	background-color: gray;
}

</style>

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
				document.getElementById('take_picture').style.display = 'none';
				document.getElementById('img_bt').style.display = 'block';
			});

			$('#take_picture').click(function() {
				// 사진을 전송하면 업로드 버튼 출력
				document.getElementById('pic_img_bt').style.display = 'block';
				document.getElementById('take_picture').style.display = 'none';
				document.getElementById('img_upload').style.display = 'none';
				document.getElementById('img_type').value = 'take_picture';

			});

		}
	</script>

	<!-- Wrapper-->
	<div id="wrapper">

		<!-- Main -->
		<!-- red == 여기는 옷 사진 출력  -->


		<div id="main">



			<!-- <button onclick="downImg()">사진 저장</button> -->
			<button id="img_upload" onclick="file_upLoad()" accept="image/*" onchange="setThumbnail(event)">사진 업로드</button>
			<form action="CodyAddformServiceCon2.do" method="post" enctype="multipart/form-data">



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
						<input type="button" id="take_picture" value="사진 찍기" onClick="take_snapshot()">

					</div>
				</div>



				<!-- 오른쪽 영역 -->
				<div id="right">
					<div id="input_tag_div">
						<ol style="list-style: none;">

							<li></li>

							<li>옷 이름
							<li>
							<li><input type="text" id="title" name="title" placeholder="옷 이름을 입력해주세요"> <!-- 사용자에게 히든 값을 저장해서 넘겨줌-->
							<li>옷 메모</li>
							<li><textarea rows="68" cols="60" id="memo" name="memo" placeholder="옷 이름을 입력해주세요"></textarea> 
							<input type="hidden" name="img_type" id="img_type" value="upload"></li>

							<li><input id="img_bt" class="cr_pick" type="submit" value="등록" style="display: none;">
						</ol>


					</div>

				</div>

			</form>
			<button onclick="upLoadImage()" id="pic_img_bt" class="cr_pick" style="display: none;">등록</button>
		</div>

		<input id = "back_btn" type="button" value="뒤로가기" onclick="location.href='../../Main.jsp#Stylist'" />
		<!-- style="color:black" -->
		<!-- Footer -->
		<div id="footer">
			<ul class="copyright">
				<li>&copy; Untitled.</li>
				<li>Design: <a href="http://html5up.net">HTML5 UP</a></li>
			</ul>
		</div>

	</div>



	<!-- Configure a few settings and attach camera -->
	<script language="JavaScript">
		// 사진 업로드 버튼
		function file_upLoad() {
			document.getElementById("img_file").click();
			Webcam.reset();

		}

		Webcam.set({
			width : 640,
			height : 360,
			image_format : 'jpeg',
			jpeg_quality : 100
		});
		Webcam.attach('#pickcloth');

		$('video').css('position', 'relative');
		$('video').css('right', '25%');

		function take_snapshot() {

			// take snapshot and get image data
			Webcam
					.snap(function(data_uri) {
						Webcam.reset();
						// display results in page
						document.getElementById('pickcloth').innerHTML = '<img src="'+data_uri+'"/>';

						$('img').css('position', 'relative');
						$('img').css('right', '12.5%');
						$('img').css('width', '75%');
						$('img').css('height', '100%');
					});
			
			
			html2canvas($("#pick_div")[0]).then(function(canvas) {
				var myImage = canvas.toDataURL();
				// downloadURI(myImage, "cloth_img.png") 
				saveImage(myImage)

			});
			
			
			
		}

		// div 영역 캡쳐 
		//이미지전송
		function downImg() {

		}

		// url 데이터 파일로 변환
		function saveImage(imgDataUrl) {

			var blobBin = atob(imgDataUrl.split(',')[1]); // base64 데이터 디코딩
			var array = [];
			for (var i = 0; i < blobBin.length; i++) {
				array.push(blobBin.charCodeAt(i));
			}
			var file = new Blob([ new Uint8Array(array) ], {
				type : 'image/png'
			}); // Blob 생성
			var formdata = new FormData(); // formData 생성
			formdata.append("file", file); // file data 추가

			$.ajax({
				type : 'post',
				url : 'CodySaveServiceCon.do',
				data : formdata,
				processData : false, // data 파라미터 강제 string 변환 방지!!
				contentType : false, // application/x-www-form-urlencoded; 방지!!
				success : function(data) {
				}
			});

		}
		
		
		// 데이터 전송
		function upLoadImage(imgDataUrl) {

			var fileValue = $("#img_file").val().split("\\");
			var fileName = fileValue[fileValue.length-1]; // 파일명

			
			
			$.ajax({
				type : 'post',
				url : 'CodyAddServiceCon.do',
				data : {
					'title' : $('#title').val(),
					'memo' : $('#memo').val(),
					'img_type' : $('#img_type').val(),
					'img_file' : fileName
				},
				success : function(data) {
					//alert("성공");
					$(location).attr('href', data);

				},
				error : function() {
					alert("실패");
				}
			});

		}
		
		
		
		
		
		
		
	</script>

		
	<script src="../../assets/js/browser.min.js"></script>
	<script src="../../assets/js/breakpoints.min.js"></script>
	<script src="../../assets/js/util.js"></script>
	<script src="../../assets/js/main.js"></script>

	
</body>
</html>
