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
<link rel="stylesheet" href="../../assets/css/viewClothiadd.css" />


   <!-- <script type="text/javascript">
      var ver = Math.floor((Math.random() * 1000));
      document.write('<link rel="stylesheet" href="../../assets/css/viewCloth.css?ver=' + ver + '">');
   </script> -->


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
	                $(location).attr('href', '../../Main.jsp');
	            },
	            	error: function() {
	                alert('삭제실패');
	            }
	        });
		
		}
		
		
		function file_upLoad() {
			document.getElementById("img_file").click();
			Webcam.reset();
		}  
		
		</script>
		
		
		<script type="text/javascript" src="../../js/jquery-3.6.0.min.js"></script>
		<script type="text/javascript" src="../../webcamjs/webcam.min.js"></script>
		<script type="text/javascript" src="../../js/html2canvas.js"></script>
		<script type="text/javascript">
		
			
		
			
		// 페이지 로딩이 끝나면 실행되는 메서드
		window.onload = function() {
			
			
			// 등록 이미지 등록 미리보기
			function readInputFile(input) {
				if (input.files && input.files[0]) {
					var reader = new FileReader();
					reader.onload = function(e) {
						$('#pick_div').html("<img id='img_preview' style='width : 100%;' src=" + e.target.result + ">");
					}
					reader.readAsDataURL(input.files[0]);
				}

			}
			
			var upload = document.querySelector('#img_file');

			upload.addEventListener('change', function(e) {
				readInputFile(this);
				document.getElementById('take_picture').style.display = 'block'; 
			});

			$('#update_btn_fake').click(function() {
				// fake수정버튼을 누르면 fake수정버튼을 없애고 진짜수정버튼 사진업로드, 사진 찍기, 삭제 버튼 출력
				document.getElementById('img_upload').style.display = 'block';
				document.getElementById('take_picture').style.display = 'block';
				document.getElementById('del').style.display = 'block';
				document.getElementById('update_btn').style.display = 'inline';
				document.getElementById('update_btn_fake').style.display = 'none';

			});

		}
		
		
		
		
	</script> 

	<!-- Wrapper-->
	<div id="wrapper">

		<!-- Main -->
		<!-- red == 여기는 옷 사진 출력  -->


		<div id="main">
			<!-- <button id="img_upload" onclick="file_upLoad()" accept="image/*" onchange="setThumbnail(event)" style="display: none;">사진 업로드</button>  -->
			<form id="update_form" action="ClothesUpdateServiceCon.do" method="post" enctype="multipart/form-data">



				<!-- 왼쪽 영역 -->
				<div id="left">


					<div id="pickcloth">

						<img id="cloth_imgs" src="../../cloth_img/<%=URLEncoder.encode(cloth_info.getClothespath(), "EUC-KR")%>" alt="">
						
					</div>

					<div id="pickbutten">

						<input type="file" class="cr_pick" name="img_file" id="img_file" accept=".gif, .jpg, .png" style="display: none">
						<input id = "take_picture" type="button" style="position: relative; display: none; left:20px; "  value="사진찍기" onclick="history.back();">
						<input id = "img_upload" type="button" value="사진업로드" onclick="file_upLoad()" accept="image/*" onchange="setThumbnail(event)" style="position: fixed; display: none; left:280px; bottom:116px;" >
					    
					</div>
				</div>



				<!-- 오른쪽 영역 -->
				<div id="right">
					<div id="input_tag_div">
						<ol id="update_ol">

							<li><input type="button" id="del"class="cr_pick" style="display: none;" value="삭제" onclick="oneDelete(<%=num%>)"></li>

							<li>옷 이름
							<li>
							<li><input type="text" name="title" value=" <%=cloth_info.getClothesName()%>"> <input type="hidden" name="num" value="<%=num%>"><input
								type="hidden" name="old_img_path" value="<%=cloth_info.getClothespath() %>"
							></li>
							<!-- 사용자에게 히든 값을 저장해서 넘겨줌-->
							<li>옷에 대한 사용자가 적을 것</li>
							<li><textarea rows="68" cols="60" name="memo"><%=cloth_info.getMemo() %>
							</textarea></li>


							<li>
								<input id = "update_btn" style = "display :none;" class="cr_pick" type="submit" value="수정" >
								<input id = "update_btn_fake" class="cr_pick" type="button" value="수정">
								<button id="clothespick" class="cr_pick">꺼내기</button>
							</li>
						</ol>


					</div>

				</div>

			</form>

		</div>

		<input type="button" value="뒤로가기" onclick="location.href='../../Main.jsp#work'" />
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
	<script src="../../assets/js/browser.min.js"></script>
	<script src="../../assets/js/breakpoints.min.js"></script>
	<script src="../../assets/js/util.js"></script>
	<script src="../../assets/js/main.js"></script>

</body>
</html>