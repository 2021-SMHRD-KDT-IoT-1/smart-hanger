<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="assets/css/loginFrame.css" />

</head>
<body>

	<!-- div 요소 불러오는 jq -->
	<script src="./js/jquery-3.6.0.min.js"></script>
	<script type="text/javascript">
		/* 페이지 불러오기 (바꿀 div id입력 , 가져올 파일) */
		function btnclick(inner) {
	                $('#'+inner).css("display","none"); 
	    }
	</script>

	<div style="text-align: center;">

		<ul class="actions vertical">
			<li style="margin-top: 30%"><h1>환영합니다!</h1></li>
			<li>회원가입을 축하합니다.</li>
			<li><button onclick='location.href="Main.jsp"'>시작하기</button></li>
		</ul>
	</div>

</body>
</html>