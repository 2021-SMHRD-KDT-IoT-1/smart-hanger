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

	<!-- div ��� �ҷ����� jq -->
	<script src="./js/jquery-3.6.0.min.js"></script>
	<script type="text/javascript">
		/* ������ �ҷ����� (�ٲ� div id�Է� , ������ ����) */
		function btnclick(inner) {
	                $('#'+inner).css("display","none"); 
	    }
	</script>

	<div style="position: relative;  top: 75px;">

		<ul class="actions vertical" id="logins_ul">
			<li style="margin-top: 4%"><h1>�˼��մϴ�.</h1></li>
			<li></li>
			<li id="welcom">ȸ�������� �����߽��ϴ�.</li>
			<li></li>
			<li id="start"><button onclick='location.href="Main.jsp"'>Main</button></li>
		</ul>
		
	</div>

</body>
</html>