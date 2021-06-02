
<%@page import="java.net.URLEncoder"%>
<%@page import="com.Model.My_clothesDTO"%>
<%@page import="com.Model.My_clothesDAO"%>
<%@page import="com.Model.MemberDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Astral by HTML5 UP</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="assets/css/main.css" />
<noscript>
	<link rel="stylesheet" href="assets/css/noscript.css" />
</noscript>


</head>

<body class="is-preload">



	<!-- div ��� �ҷ����� jq -->
	<script src="./js/jquery-3.6.0.min.js"></script>
	<script type="text/javascript">
		/* ������ �ҷ����� (�ٲ� div id�Է� , ������ ����) */
		function btnclick(inner, _url) {
			$.ajax({
				url : _url,
				type : 'post',
				success : function(data) {
					$('#' + inner).html(data);
					//$('#' + inner).css("display", "block");
				},
				error : function() {
					$('#' + inner).text('������ ������ �Դϴ�.');
				}
			});
		}
		
		
		
		// �ڵ�
		btnclick("Stylist", "cody.jsp");
	</script>



	<%
	My_clothesDAO clothesdao = new My_clothesDAO();
	ArrayList<My_clothesDTO> clothes_list = clothesdao.My_clothes_All_Select();

	MemberDTO dto = (MemberDTO) session.getAttribute("dto");
	
	String email = null;
	String pw = null;
	String name = null;
	String age = null;
	
	if(dto != null){
		email = dto.getEmail(); 
		pw = dto.getPw(); 
		name = dto.getName(); 
		age = dto.getAge(); 
		
	}
	
	
	%>

	<!-- Wrapper-->
	<%
	if (dto != null) {
	%>
	<h1 style="margin-left: 760px; font-size: 30px; color: white">
		Welcome to
		<%=dto.getEmail()%>!
	</h1>
	<button class="btn_logout" onClick="location.href='LogoutServiceCon.do'" style="position: absolute; left: 74%; top: 10%; ntop: 50%;">�α׾ƿ�</button>
	<%
	} else {
	%>
	<button class="btn_login" onclick="btnclick('loginWindow','loginWindow.jsp')" style="position: absolute; left: 74%; top: 10%; ntop: 50%;">�α���</button>
	<%
	}
	%>






	<div id="wrapper">

		<!-- Nav -->
		<nav id="nav"> 
			<a href="#" class="icon solid fa-home"><span>Home</span></a> 
		
		
		<a href="#work" class="icon solid fas fa-tshirt"><span>Closet</span></a> 
		<a href="#Stylist" class="icon solid fas fa-user-tie"><span>Stylist</span></a> 
		<a href="#Community" class="icon solid fas fa-clipboard-list"><span>Community</span></a>
		<a href="#contact" class="icon solid fas fa-phone"><span>������</span></a> </nav>

		<!-- �α��� ���̾� �˾� -->
		<div id="loginWindow"></div>













		<!-- Main -->
		<div id="main">

			<!-- Me -->
			<article id="home" class="panel intro"> <header>
			<h1>
				<%if (dto != null) {%><%= email%><%}else{} %>
			</h1>
			<h1>
				<%if (dto != null) {%><%= name%><%}else{} %>
			</h1>
			<h1>
				<%if (dto != null) {%><%= age%><%}else{} %>
			</h1>
			<p>SmartHanger�� ���Ű��� ȯ���մϴ�!</p>
			</header> <a href="#work" class="jumplink pic"> <span class="arrow icon solid fa-chevron-right"><span>See my work</span></span> <img src="images/me.jpg" alt="" />
			</a> </article>

			<!-- Work -->
			<article id="work" class="panel">
			<div>
				<input type="submit" value="�� ���" style="float: right;" onClick="location.href='picture.html'">
			</div>
			<header>
			<h2 Style="position: relative; top: 10px;">���� : ���� �����ؾ���</h2>
			</header>
			<p>���� �̹��� ���°� ������ ���߿� �ٲ�</p>


			<section>

			<div class="row" style="overflow-y: scroll; width: 750px; height: 400px;">

				<!-- ���Ⱑ ���忡 �ִ� �̹��� �ҷ����°�  -->
				<%
				for (int row = 0; row < clothes_list.size(); row++) {
				%>
				<div class="col-4 col-6-medium col-12-small">
					<a href="viewCloth.jsp?num=<%=clothes_list.get(row).getMy_clothes_num()%>" class="image fit"> <img class="cloth_imgs"
						src="cloth_img/<%=clothes_list.get(row).getClothesName()%>" alt=""></a>
				</div>
				<%
				}
				%>


			</div>

			</section> </article>

			<!-- ����� �ڵ� -->
			<article id="Stylist" class="panel"> 
			
			</article>


			<!-- Community -->
			<article id="Community" class="panel"> <header>
			<h2>Ŀ�´�Ƽ �Խ���</h2>
			</header> <input type="submit" value="���ۼ�" style="position: relative; left: 85%;">
			<div style="border: 1px solid; width: 100%; height: 20%;">


				<table id="commtitle">
					<tr>
						<th class="co5" id=c1>��ȣ</th>
						<!-- <th class= "co5" id = c2>���Ӹ�</th> -->
						<th class="co5" id=c3>����</th>
						<th class="co5" id=c4>�۾���</th>
						<th class="co5" id=c5>�ۼ���</th>
						<!-- <th class= "co5">��ȸ</th>
                      <th class= "co5">��õ</th> -->
					</tr>
					<tr onClick="location.href='CommunityLink.jsp'" style="border: 1px solid;">
						<th class="co5" id=c1>1</th>
						<!-- <th class= "co5" id = c2>���Ӹ�</th> -->
						<th class="co5" id=c3>������ ��û���� ��Ծ��ٸ� �̷��� �þ</th>
						<th class="co5" id=c4>ȫ����</th>
						<th class="co5" id=c5>2021-05-30</th>
						<!-- <th class= "co5">��ȸ</th>
                      <th class= "co5">��õ</th> -->
					</tr>
				</table>
			</article>

			<!-- ������ -->
			<article id="contact" class="panel"> <script>
				btnclick("contact", "service.jsp");
			</script> </article>


		</div>

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
	<script src="assets/js/breakpoints.min.js"></script>
	<script src="assets/js/util.js"></script>
	<script src="assets/js/main.js"></script>











</body>
</html>