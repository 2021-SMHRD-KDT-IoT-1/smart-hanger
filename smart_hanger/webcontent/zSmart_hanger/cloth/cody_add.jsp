<%@page import="com.Model.MemberDTO"%>
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
<link rel="stylesheet" href="../../assets/css/cody_add.css" />

</head>

<body class="is-preload">


	<%
		MemberDTO userInfo = (MemberDTO) session.getAttribute("userInfo");

	ArrayList<My_clothesDTO> clothes_list = null;

	if (userInfo != null) {

		String userId = (userInfo).getUserId();

		My_clothesDAO clothesdao = new My_clothesDAO();
		clothes_list = clothesdao.My_clothes_All_Select(userId);

	}
	%>
















	<script type="text/javascript" src="../../js/jquery-3.6.0.min.js"></script>
	<script type="text/javascript" src="../../webcamjs/webcam.min.js"></script>
	<script type="text/javascript" src="../../js/html2canvas.js"></script>
	<script type="text/javascript">
	
	
	// 선택된 옷
	var checkBoxArr = [];
	
	
		// 페이지 전환용 변수
		/* 페이지 불러오기 (바꿀 div id입력 , 가져올 파일) */

		function btnclick(inner, _url) {
			$.ajax({
				url : _url,
				type : 'post',
				success : function(data) {
					$('#' + inner).html(data);
				},
				error : function() {
					$('#' + inner).text('페이지 점검중 입니다.');
				}
			});
		}

		function back_page() {
			window.history.back();
		}

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
				document.getElementById('img_upload').style.display = 'none';

				document.getElementById('pic_img_bt').style.display = 'block';
				document.getElementById('pic_img_bt').setAttribute('onclick',
						'');
				document.getElementById('pic_img_bt').setAttribute('type',
						'submit');
			});

			$('#take_picture')
					.click(
							function() {
								// 사진을 전송하면 업로드 버튼 출력
								document.getElementById('pic_img_bt').style.display = 'block';
								document.getElementById('pic_img_bt')
										.setAttribute('onclick',
												'upLoadImage()');
								document.getElementById('pic_img_bt')
										.setAttribute('type', 'button');

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

		<div id="main2" style="display: none">
			<div style="padding: 30px;">


				<input type="button" id="cody_add" value="코디 등록" onclick="img_select()"> <br>

				<div id="img_box" class="row">


					<!-- 여기가 옷장에 있는 이미지 불러오는곳  -->
					<%
						for (int row = 0; row < clothes_list.size(); row++) {
					%>
						<div class="col-3">
								
							<input type="checkbox" value="<%=clothes_list.get(row).getMy_clothes_num()%>" name="img_check" id="img_check<%=row%>">	
							
							<img id="img_<%=row%>" onclick="img_btn('<%=row%>')" class="cloth_imgs" src="../../cloth_img/<%=clothes_list.get(row).getClothespath()%>" alt=""
								style="width: 100%; height: auto;">

						</div>
					<%
						}
					%>

				</div>

			</div>
		</div>






















		<div id="main" style="display: block;">



			<!-- <button onclick="downImg()">사진 저장</button> -->
			<form action="MyCodyAddformServiceCon2.do" method="post" enctype="multipart/form-data">



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
						<ul>
							<li><input type="file" name="img_file" id="img_file" accept=".gif, .jpg, .png" style="display: none;">
							<li><input type="button" id="take_picture" value="사진 찍기" onClick="take_snapshot()">
							<li>
							<li><input type="button" id="img_upload" value="사진 업로드" onclick="file_upLoad()" accept="image/*" onchange="setThumbnail(event)">
						</ul>

					</div>
				</div>



				<!-- 오른쪽 영역 -->
				<div id="right">
					<input id="back_btn" type="button" value="뒤로가기" onclick="back_page()" /> 
					<input id="cloth_add_btn" type="button" value="옷 추가" onclick="add_close()" />
					<div id="input_tag_div">
						<ol style="list-style: none; z-index: 2;">

							<li></li>

							<li>옷 이름
							<li>
							<li><input type="text" id="title" name="title" placeholder="코디 이름을 입력해주세요"> <!-- 사용자에게 히든 값을 저장해서 넘겨줌-->
							<li>옷 메모</li>
							<li><textarea rows="68" cols="60" id="memo" name="memo" placeholder="코디 메모를 입력해주세요"></textarea> <input type="hidden" name="img_type" id="img_type"
								value="upload"></li>

							<li><input id="img_bt" class="cr_pick" type="submit" value="등록" style="display: none;">
							<input id="cloth_num" class="cr_pick" type="hidden" value="" name="cloth_num" >
						</ol>


					</div>

				</div>

				<button onclick="upLoadImage()" id="pic_img_bt" class="cr_pick" style="display: none;">등록</button>

			</form>
		</div>

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
				url : 'MyCodySaveServiceCon.do',
				data : formdata,
				processData : false, // data 파라미터 강제 string 변환 방지!!
				contentType : false, // application/x-www-form-urlencoded; 방지!!
				success : function(data) {
				}
			});

		}

		// 데이터 전송
		function upLoadImage(imgDataUrl) {
			
			//console.log(checkBoxArr);

			var fileValue = $("#img_file").val().split("\\");
			var fileName = fileValue[fileValue.length - 1]; // 파일명
		
			
			
			
			$.ajax({
				type : 'post',
				url : '../../MyCodyAddServieceCon2',
				traditional : true,
				data : {
					'title' : $('#title').val(),
					'memo' : $('#memo').val(),
					'img_type' : $('#img_type').val(),
					'img_file' : fileName,
					'cloth_num' : checkBoxArr
					
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

	<script type="text/javascript">
		function img_btn(num) {

			var img_scc = $('#img_' + num).css('border');

			if (img_scc === '0px none rgb(119, 119, 119)') {
				$('#img_' + num).css('border', '8px solid darkgrey');
				$('#img_' + num).css('border-radius', '20px');
				$("input:checkbox[id='img_check" + num +"']").prop("checked", true);

			} else {
				$('#img_' + num).css('border', 'none');
				$("input:checkbox[id='img_check" + num +"']").prop("checked", false);
			}			
		}
		
		
		function img_select() {
			
			
			$("input[name=img_check]:checked").each(function(i){

			checkBoxArr.push($(this).val());
			
			
			$('#main').css('display','block');
			$('#cloth_num').val(checkBoxArr);


			});
	
			//console.log(checkBoxArr);
			
			$('#main').css('display','block');
			$('#main2').css('display','none');
			$('#cloth_add_btn').css('display','none');
			
		} 
		
		
		
		function add_close() {
			$('#main').css('display','none');
			$('#main2').css('display','block');
		}
		
		
		
		
		
	</script>







</body>
</html>
