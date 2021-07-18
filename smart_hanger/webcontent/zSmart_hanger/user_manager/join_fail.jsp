<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="assets/css/loginFrame.css" />
<style>


#start button:nth-last-of-type(1){
    
       margin-left: 40px;
}


</style>
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

	<div style="position: relative;  top: 75px;">

		<ul class="actions vertical" id="logins_ul">
			<li style="margin-top: 4%"><h1>죄송합니다.</h1></li>
			<li></li>
			<li id="welcom">회원가입을 실패했습니다.</li>
			<li></li>
			<li id="start"><button onclick='location.href="Main.jsp"'>Main</button></li>
		</ul>
		
	</div>

</body>
</html>