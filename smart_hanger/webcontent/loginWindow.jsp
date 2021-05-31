<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<style type="text/css">
#loginFrame_back {
	width: 100%;
	height: 100%;
	text-align: center;
	position: relative;
	top: 0;
	left: 0;
	z-index: 1;
    display: flex;
    flex-direction: row;
    justify-content: center;
    align-content: flex-end;
    align-items: flex-start;
}

#loginFrame_back::after{
	width: 100%;
	height: 100%;
	content: "";
	background: url("./assets/css/images/bg.jpg");
	background-size : 100% 100%;
	position: fixed;
	top: 0;
	left: 0;
	z-index: -1;
	opacity: 0.5;
}

#loginFrame{
width: 450px;
    height: 500px;
    margin: 0px;
    top: 206px;
    background-color: red;
    position: fixed;
}

</style>
</head>
<body>


	<!-- 가상 요소를 만들고 그 가상요소에 투명도를 지정해서 투명하게 만듬  -->

	<div id="loginFrame_back">
		<div id="loginFrame"></div>
	</div>
</div>
</body>
</html>