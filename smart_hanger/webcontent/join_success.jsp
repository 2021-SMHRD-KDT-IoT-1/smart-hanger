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

	<!-- div ��� �ҷ����� jq -->
	<script src="./js/jquery-3.6.0.min.js"></script>
	<script type="text/javascript">
		/* ������ �ҷ����� (�ٲ� div id�Է� , ������ ����) */
		function btnclick(inner) {
	                $('#'+inner).css("display","none"); 
	    }
	</script>

	
	
	<div id="wrapper">
				<!-- Menu -->
					<nav id="Update">	
						<ul class="actions vertical">
							<li><h1>ȯ���մϴ�!</h1></li>
							<li>ȸ�������� �����մϴ�.</li>
							<!-- request������ ����� ȸ������ �� �̸����� ����Ͻÿ�. -->
							<%-- <li>�޼����ý����� ���ο� �̸����� <%=email %>�Դϴ�.</li> --%>
							<li><button onclick='location.href="Main.jsp"'>�����ϱ�</button></li>
						</ul>
					</nav>			
			</div>

</body>
</html>