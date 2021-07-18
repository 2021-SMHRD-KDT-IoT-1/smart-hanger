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
	
	
	// ���õ� ��
	var checkBoxArr = [];
	
	
		// ������ ��ȯ�� ����
		/* ������ �ҷ����� (�ٲ� div id�Է� , ������ ����) */

		function btnclick(inner, _url) {
			$.ajax({
				url : _url,
				type : 'post',
				success : function(data) {
					$('#' + inner).html(data);
				},
				error : function() {
					$('#' + inner).text('������ ������ �Դϴ�.');
				}
			});
		}

		function back_page() {
			window.history.back();
		}

		window.onload = function() {

			// ��� �̹��� ��� �̸�����
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
								// ������ �����ϸ� ���ε� ��ư ���
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
		<!-- red == ����� �� ���� ���  -->

		<div id="main2" style="display: none">
			<div style="padding: 30px;">


				<input type="button" id="cody_add" value="�ڵ� ���" onclick="img_select()"> <br>

				<div id="img_box" class="row">


					<!-- ���Ⱑ ���忡 �ִ� �̹��� �ҷ����°�  -->
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



			<!-- <button onclick="downImg()">���� ����</button> -->
			<form action="MyCodyAddformServiceCon2.do" method="post" enctype="multipart/form-data">



				<!-- ���� ���� -->
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
							<li><input type="button" id="take_picture" value="���� ���" onClick="take_snapshot()">
							<li>
							<li><input type="button" id="img_upload" value="���� ���ε�" onclick="file_upLoad()" accept="image/*" onchange="setThumbnail(event)">
						</ul>

					</div>
				</div>



				<!-- ������ ���� -->
				<div id="right">
					<input id="back_btn" type="button" value="�ڷΰ���" onclick="back_page()" /> 
					<input id="cloth_add_btn" type="button" value="�� �߰�" onclick="add_close()" />
					<div id="input_tag_div">
						<ol style="list-style: none; z-index: 2;">

							<li></li>

							<li>�� �̸�
							<li>
							<li><input type="text" id="title" name="title" placeholder="�ڵ� �̸��� �Է����ּ���"> <!-- ����ڿ��� ���� ���� �����ؼ� �Ѱ���-->
							<li>�� �޸�</li>
							<li><textarea rows="68" cols="60" id="memo" name="memo" placeholder="�ڵ� �޸� �Է����ּ���"></textarea> <input type="hidden" name="img_type" id="img_type"
								value="upload"></li>

							<li><input id="img_bt" class="cr_pick" type="submit" value="���" style="display: none;">
							<input id="cloth_num" class="cr_pick" type="hidden" value="" name="cloth_num" >
						</ol>


					</div>

				</div>

				<button onclick="upLoadImage()" id="pic_img_bt" class="cr_pick" style="display: none;">���</button>

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
		// ���� ���ε� ��ư
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

		// div ���� ĸ�� 
		//�̹�������
		function downImg() {

		}

		// url ������ ���Ϸ� ��ȯ
		function saveImage(imgDataUrl) {

			var blobBin = atob(imgDataUrl.split(',')[1]); // base64 ������ ���ڵ�
			var array = [];
			for (var i = 0; i < blobBin.length; i++) {
				array.push(blobBin.charCodeAt(i));
			}
			var file = new Blob([ new Uint8Array(array) ], {
				type : 'image/png'
			}); // Blob ����
			var formdata = new FormData(); // formData ����
			formdata.append("file", file); // file data �߰�

			$.ajax({
				type : 'post',
				url : 'MyCodySaveServiceCon.do',
				data : formdata,
				processData : false, // data �Ķ���� ���� string ��ȯ ����!!
				contentType : false, // application/x-www-form-urlencoded; ����!!
				success : function(data) {
				}
			});

		}

		// ������ ����
		function upLoadImage(imgDataUrl) {
			
			//console.log(checkBoxArr);

			var fileValue = $("#img_file").val().split("\\");
			var fileName = fileValue[fileValue.length - 1]; // ���ϸ�
		
			
			
			
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
					//alert("����");
					$(location).attr('href', data);

				},
				error : function() {
					alert("����");
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