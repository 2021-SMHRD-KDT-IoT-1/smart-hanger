
<%@page import="com.Model.MemberDTO"%>
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
<link rel="stylesheet" href="assets/css/main.css" />
<!-- <link rel="stylesheet" href="assets/css/.css" /> -->


</head>

<body class="is-preload">

어떤폰트요?? 아아 폰트가 아니고 그 폰트 사이즈요 
	<%
	MemberDTO dto = (MemberDTO) session.getAttribute("userInfo");
	%>


	<script type="text/javascript">
		function oneDelete(num) {
			$.ajax({
				url : 'ClothesOneDeleteServicCon.do',
				type : 'post',
				data : {
					num : num
				},
				success : function(data) {
					alert('삭제성공');
					$(location).attr('href', 'Main.jsp');
				},
				error : function() {
					alert('삭제실패');
				}
			});

		}
	</script>

여기다 바로 작성 여기는 댓글

</body>
</html>