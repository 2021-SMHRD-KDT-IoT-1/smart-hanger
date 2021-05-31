<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@page import="Model.WebStylistDTO"%>
<%@page import="Model.WebStylistDAO"%>
<%@page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>

          
         
          
          
    <%
     WebStylistDAO codydao = new WebStylistDAO();
     ArrayList<WebStylistDTO> cody_list = codydao.SearchStylise();
    %>     
          

                  <div> <input type="submit" value="코디 등록" style="float: right;">  </div>
                     <header>
                        <h2>옷장 : 나중에 이거 바꿈</h2>
                     </header>
                     <p>
                        옷장 이미지 띄우는곳 설명은 나중에 바꿈
                     </p>
                     
                     
                     <section>
                     
                        <div class="row" style="overflow-y :scroll; width:750px; height:400px; "  >
                        
                        <!-- 여기가 코디  이미지 불러오는곳  -->
                        
                        <%for(int row = 0; row <cody_list.size(); row++) { %>
                        <div class="col-4 col-6-medium col-12-small">
                         <a href ="viewStylist.jsp?num="<%=cody_list.get(row).getNum() %> class="image fit">
                        <img class="cody_imgs" src="cody_img/<%=cody_list.get(row).getClothespath()%>" alt=""></a>
                       </div>
                        <%} %>
                        
                       
                            
                            
            
                        
                        
                        </div>
                        
                     </section>

</body>
</html>