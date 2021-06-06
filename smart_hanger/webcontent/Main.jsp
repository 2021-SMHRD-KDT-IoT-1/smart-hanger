
<%@page import="com.Model.CommunityDAO"%>
<%@page import="com.Model.CommunityDTO"%>
<%@page import="java.beans.Encoder"%>
<%@page import="javax.sound.sampled.AudioFormat.Encoding"%>
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
<style>

button{
	
	background-color: gray;
	font-weight: bold ;
	font-family: "Gmarket Sans";

}

</style>


</head>

<body class="is-preload" style="height: auto;">


	<%
	MemberDTO userInfo = (MemberDTO) session.getAttribute("userInfo");
	
	String userId = null;
	String userPw = null;
	String userName = null;
	String userAge = null;
	
	if(userInfo != null){
		userId = userInfo.getUserId(); 
		userPw = userInfo.getUserPw(); 
		userName = userInfo.getUserName(); 
		userAge = userInfo.getUserAge(); 
	}
	%>
	<!-- div ��� �ҷ����� jq -->
	<script src="./js/jquery-3.6.0.min.js"></script>
	<script type="text/javascript">
	
	
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
		
		
		// ����ȭ��
		btnclick("home", "zSmart_hanger/service/home.jsp");
		
		// ����
		btnclick("work", "zSmart_hanger/cloth/my_cloth.jsp");
	
		// �ڵ�
		btnclick("Stylist", "zSmart_hanger/cody/cody.jsp");
	
		// Ŀ�´�Ƽ �Խ���
		btnclick("Community", "zSmart_hanger/community/Community.jsp");

		// ������
		btnclick("contact", "zSmart_hanger/service/service.jsp");


	</script>

	<!-- Wrapper-->
	<% if (userId != null) { %>
	<button class="btn_logout" onClick="location.href='LogoutServiceCon.do'" style="position: absolute; left: 74%; top: 10%; ntop: 50%;">�α׾ƿ�</button>
	<button class="btn_logout" onClick="location.href='../../user_infor.jsp'" style="position: absolute; left: 84%; top: 10%; ntop: 50%;">����������</button>
	<% } else {	%>
	<button class="btn_login" onclick="btnclick('loginWindow','zSmart_hanger/user_manager/loginWindow.jsp')" style="position: absolute; left: 74%; top: 10%; ntop: 50%;">�α���</button>
	<% } %>






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

			<article id="home" class="panel intro">
			
			</article>






			<!-- ����!!! -->
			<article id="work" class="panel">
				
			</article>

			<!-- ����� �ڵ� -->
			<article id="Stylist" class="panel"> 
			
			</article>


			<!-- Community -->
			<article id="Community" class="panel"> <header>
			

			</article>
			  

			<!-- ������ -->
			<article id="contact" class="panel"> 
			
			 </article>


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