<%@page import="com.Model.My_codyDAO"%>
<%@page import="com.Model.My_codyDTO"%>
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

<!-- 
   <script type="text/javascript">
      var ver = Math.floor((Math.random() * 1000));
      document.write('<link rel="stylesheet" href="../../assets/css/viewCloth.css?ver=' + ver + '">');
   </script>

 -->
</head>

<body class="is-preload">


   <%
      Cookie cookie = null;


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

   
   My_codyDAO dao = new My_codyDAO();
   My_codyDTO cody_info = dao.My_cody_One_Select(num);
   
   %>



      
      <script type="text/javascript" src="../../js/jquery-3.6.0.min.js"></script>
      <script type="text/javascript" src="../../webcamjs/webcam.min.js"></script>
      <script type="text/javascript" src="../../js/html2canvas.js"></script>
		<script type="text/javascript">
   
   
   
   
   // 아두이노 통신용
   
   
 		function arduino(in_num){
	   		var num = in_num;
	   		
	   		console.log(num);

	           $.ajax({
	               url : 'Arduino',
	               type : 'post',
	               data : {num : num},
	               success: function(data) {
	                   alert('전송성공');
	                   
	               },
	                  error: function() {
	                   alert('통신실패');
	               }
	           });
	      
	      }
      
   
  
   
   
   
   
   
   
      function oneDelete(num){
           $.ajax({
               url : 'ClothesOneDeleteServicCon.do',
               type : 'post',
               data : {num : num},
               success: function(data) {
                   alert('삭제성공');
                   $(location).attr('href', '../../Main.jsp#work');
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
            document.getElementById('update_btn').style.display = 'inline';
            document.getElementById('update_btn_fake').style.display = 'none';
            
            
            document.getElementById('back_btn').style.display = 'none';
            document.getElementById('clothespick').setAttribute('value','삭제');
          	document.getElementById('clothespick').setAttribute('onclick','oneDelete("<%=num%>")');
          	document.getElementById('update_ol').style.padding = '25px';
          	document.getElementById('memo_text').style.height = '268px';
            

          	
            

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


							        <img id="cloth_imgs" src="../../myCody/<%=URLEncoder.encode(cody_info.getClothespath(), "EUC-KR")%>" alt="">
						</div>


					<div id="pickbutten">
						<ul>
							<li><input type="file" name="img_file" id="img_file" accept=".gif, .jpg, .png" style="display: none;"> 
							<li><input id = "take_picture" type="button" style="position: relative; display: none; left:7px; "  value="사진찍기" onclick="history.back();">
							<li>
							<li><input type="button" id="img_upload" value="사진 업로드" onclick="file_upLoad()" accept="image/*" onchange="setThumbnail(event)" style="display: none;">
						</ul>
						
					</div>
				</div>
				
				



            <!-- 오른쪽 영역 -->
            <div id="right">
               <div id="input_tag_div">
                  <ol id="update_ol">

					<li><input id="back_btn" type="button" value="뒤로가기" onclick="location.href='../../Main.jsp#work'" />



                     <li>코디 이름
                     <li>
                     <li><input type="text" name="title" value=" <%=cody_info.getClothesname()%>"> <input type="hidden" name="num" value="<%=num%>"><input
                        type="hidden" name="old_img_path" value="<%=cody_info.getClothespath() %>"
                     ></li>
                     <!-- 사용자에게 히든 값을 저장해서 넘겨줌-->
                     <li>코디 메모</li>
                     <li><textarea id="memo_text" rows="68" cols="60" name="memo"><%=cody_info.getMemo() %>
                     </textarea></li>


                     <li>
                        <input id = "update_btn" style = "display :none;" class="cr_pick" type="submit" value="수정" >
                        <input id = "update_btn_fake" class="cr_pick" type="button" value="수정">
                        <input type="button" id="clothespick" class="cr_pick" value="꺼내기" onclick="arduino(<%=num%>)">
                     </li>
                  </ol>


               </div>

            </div>

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

   <!-- Scripts -->
   <script src="../../assets/js/jquery.min.js"></script>
   <script src="../../assets/js/browser.min.js"></script>
   <script src="../../assets/js/breakpoints.min.js"></script>
   <script src="../../assets/js/util.js"></script>
   <script src="../../assets/js/main.js"></script>

</body>
</html>