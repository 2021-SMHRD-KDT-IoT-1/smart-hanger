<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="assets/css/loginFrame.css" />
<style>

h1{
	padding-right: 63px;
}

#welcom{
	padding-right: 230px;
}

#start{
	padding-right: 200px;
}

</style>
</head>
<body>

	<!-- div ��� �ҷ����� jq -->
	<script src="./js/jquery-3.6.0.min.js"></script>
	<script type="text/javascript">
		/* ������ �ҷ����� (�ٲ� div id�Է� , ������ ����) */
		function btnclick(inner) {
	                $('#'+inner).css("display","none"); 
	    }
	</script>

	<div style="position: relative; left: 127px;">

		<ul class="actions vertical">
			<li style="margin-top: 30%"><h1>�˼��մϴ�.</h1></li><br>
			<li id="welcom">ȸ�������� �����߽��ϴ�.</li><br>
			<li id="start"><button onclick='location.href="Main.jsp"'>Main</button></li>
		</ul>
		
	</div>

</body>
</html>