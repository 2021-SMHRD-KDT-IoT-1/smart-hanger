
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
      <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
      <link rel="stylesheet" href="assets/css/main.css" />
      <noscript><link rel="stylesheet" href="assets/css/noscript.css" /></noscript>
      
    
</head>

<body class="is-preload">



      <!-- div 요소 불러오는 jq -->
      <script src = "./js/jquery-3.6.0.min.js"></script>
      <script type="text/javascript">
      
      /* 페이지 불러오기 (바꿀 div id입력 , 가져올 파일) */
	    function btnclick(inner, _url){
	        $.ajax({
	            url : _url,
	            type : 'post',
	            success: function(data) {
	                $('#'+inner).html(data);
	            },
	                error: function() {
	                $('#'+inner).text('페이지 점검중 입니다.');
	            }
	        });
	    }
		
	    
	    </script>



<%
   WebClothesDAO dao = new WebClothesDAO();
   ArrayList<WebClothesDTO> cloth_list = dao.SearchClothes();
   
   
   
%>

   <!-- Wrapper-->
   
   <button onclick="btnclick('loginWindow','loginWindow.jsp')" style="position: absolute; left: 74%; top:10%;ntop: 50%;">로그인</button>

      <div id="wrapper">
      
         <!-- Nav -->
            <nav id="nav">
               <a href="#" class="icon solid fa-home"><span>Home</span></a>
               <a href="#work" class="icon solid fas fa-tshirt"><span>Closet</span></a>
               <a href="#Stylist" class="icon solid fas fa-user-tie"><span>Stylist</span></a>
               <a href="#Community" class="icon solid fas fa-clipboard-list"><span>Community</span></a>
               <a href="#contact" class="icon solid fas fa-phone"><span>고객센터</span></a>
            
            </nav>
            
            <!-- 로그인 레이어 팝업 -->
            <div id="loginWindow"></div>
            

            
            
            
         <!-- Main -->
            <div id="main">
                          
               <!-- Me -->
                  <article id="home" class="panel intro">
                     <header>
                        <h1>메인창</h1>
                       
                     </header>
                     
                  </article>

               <!-- Work -->
                  <article id="work" class="panel">
                  <div> <input type="submit"  value="옷 등록" style="float: right;" onClick="location.href='picture.html'"> >  </div>
                     <header>
                        <h2 Style = "position: relative; top: 10px;">옷장 : 여기 수정해야함</h2>
                     </header>
                     <p>
                        옷장 이미지 띄우는곳 설명은 나중에 바꿈
                     </p>
                     
                     
                     <section>
                     
                        <div class="row" style="overflow-y: scroll; width:750px; height:400px; "  >
                        
                        <!-- 여기가 옷장에 있는 이미지 불러오는곳  -->
                        <%for(int row = 0; row < cloth_list.size(); row++){ %>   
                           <div class="col-4 col-6-medium col-12-small">
                              <a href="viewCloth.jsp?num=<%= cloth_list.get(row).getNum() %>" class="image fit">
                              <img class="cloth_imgs" src="cloth_img/<%= cloth_list.get(row).getClothesPath() %>" alt=""></a>                           
                        </div>
                        <% } %>
                        
                        
                        </div>
                        
                     </section>
                  </article>
                  
                  <!-- 여기는 코디 -->
                  <article id="Stylist" class="panel">
 					<script>
 						btnclick("Stylist", "cody.jsp");
 					</script>
                  </article>
                  

               <!-- Community -->
                  <article id="Community" class="panel">
                     <header>
                        <h2>커뮤니티 게시판</h2>
                     </header>
                     <input type = "submit" value ="글작성" style="position: relative; left: 85%;" >
                     <div style = "border: 1px solid;  width:100%; height: 20%; " >  
                     
                     
                     <table id = "commtitle">
                     <tr>
                      <th class= "co5" id = c1>번호</th>
                      <!-- <th class= "co5" id = c2>말머리</th> -->
                      <th class= "co5" id = c3>제목</th>
                      <th class= "co5" id = c4>글쓴이</th>
                      <th class= "co5" id = c5>작성일</th>
                      <!-- <th class= "co5">조회</th>
                      <th class= "co5">추천</th> -->
                     </tr>
                     <tr onClick="location.href='CommunityLink.jsp'" style = "border: 1px solid;">
                      <th class= "co5" id = c1>1</th>
                      <!-- <th class= "co5" id = c2>말머리</th> -->
                      <th class= "co5" id = c3>제목을 엄청나게 길게쓴다면 이렇게 늘어남</th>
                      <th class= "co5" id = c4>홍진석</th>
                      <th class= "co5" id = c5>2021-05-30</th>
                      <!-- <th class= "co5">조회</th>
                      <th class= "co5">추천</th> -->
                     </tr>
                     </table>
                     
                     
                     
                  </article>
                  
                  <!-- 고객센터 -->
							<article id="contact" class="panel">
							
							<script>
 								btnclick("contact", "service.jsp");
 							</script>
							  
							</article>
                  

            </div>

         <!-- Footer -->
            <div id="footer">
               <ul class="copyright">
                  <li>&copy; Untitled.</li><li>Design: <a href="http://html5up.net">HTML5 UP</a></li>
               </ul>
            </div>

      </div>

   <!-- Scripts -->
      <script src="assets/js/jquery.min.js"></script>
      <script src="assets/js/breakpoints.min.js"></script>
      <script src="assets/js/util.js"></script>
      <script src="assets/js/main.js"></script>
      
      
      




      
      
      

</body>
</html>