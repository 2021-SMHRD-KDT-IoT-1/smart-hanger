<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="assets/css/joinFrame.css" />

</head>
<body>

	<!-- div ��� �ҷ����� jq -->
	<script src="./js/jquery-3.6.0.min.js"></script>
	<script type="text/javascript">
		/* ������ �ҷ����� (�ٲ� div id�Է� , ������ ����) */
		function btnclick(inner) {
	                $('#'+inner).css("display","none");

		}
		
		
		/* �α��� ���� */
		function join_click() {

			
			userId = $('#email').val();
			userPw = $('#pw').val();
			userName = $('#name').val();
			userAge = $('#age').val();
			
			
			
			
			$.ajax({
				url : 'JoinServiceCon.do',
				type : 'post',
				data : {userId : userId, userPw : userPw, userName : userName, userAge : userAge},
				success : function(data) {
					$('#loginFrame').html(data);
				},
				error : function() {
					$('#loginFrame').text('ȸ������ ����');
				}
			});
		}
	</script>

		

	<h2>ȸ������</h2>
		<ul>
			<li><input class="Login_input" type="text"
				placeholder="Email�� �Է��ϼ���" id="email"></li>
		</ul>
		<ul>
			<li><input class="Login_input" type="password"
				placeholder="PW�� �Է��ϼ���" id="pw"></li>
		</ul>
		<ul>
			<li><input class="Login_input" type="text"
				placeholder="�̸��� �Է��ϼ���" id="name"></li>
		</ul>
		<ul>
			<li><input class="Login_input" type="text"
				placeholder="���̸� �Է��ϼ���" id="age"></li>
		</ul>
		<table>
			<tr>

				<td><a id="real-join" onclick="join_click()" class="button fit">join</a>
				
				
				<td><a id="home" onclick="btnclick('loginWindow')" class="button fit">home</a>
			</tr>
		</table>

</body>
</html>