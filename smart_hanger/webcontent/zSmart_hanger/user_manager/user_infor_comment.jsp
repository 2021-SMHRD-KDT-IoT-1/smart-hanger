
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

���Ʈ��?? �ƾ� ��Ʈ�� �ƴϰ� �� ��Ʈ ������� 
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
					alert('��������');
					$(location).attr('href', 'Main.jsp');
				},
				error : function() {
					alert('��������');
				}
			});

		}
	</script>

����� �ٷ� �ۼ� ����� ���

</body>
</html>