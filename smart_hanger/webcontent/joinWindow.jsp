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
		
		
		/* �α��� ���� */
		function join_click() {
			$.ajax({
				url : 'JoinServiceCon.do',
				type : 'post',
				data : {userId : $('#email').val(), userPw : $('#pw').val(), userName : $('#name').val(), userAge : $('#age').val()},
				success : function(data) {
					//$('#loginWindow').html(data);
					$('#loginWindow').text('���� ����');
				},
				error : function() {
					$('#loginWindow').text('ȸ������ ����');
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
				<!-- <td><input type="submit" value="Join" class="button fit"></td> -->

				<td><a onclick="join_click()" class="button fit">join</a>
				
				
				<td><a onclick="btnclick('loginWindow')" class="button fit">Loginhome</a>
			</tr>
		</table>

</body>
</html>