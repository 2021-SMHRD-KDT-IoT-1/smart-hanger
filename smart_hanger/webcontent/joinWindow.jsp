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

	<!-- div 요소 불러오는 jq -->
	<script src="./js/jquery-3.6.0.min.js"></script>
	<script type="text/javascript">
		/* 페이지 불러오기 (바꿀 div id입력 , 가져올 파일) */
		function btnclick(inner) {
	                $('#'+inner).css("display","none");

		}
		
		
		/* 로그인 연결 */
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
					$('#loginFrame').text('회원가입 실패');
				}
			});
		}
	</script>

		

	<h2>회원가입</h2>
		<ul>
			<li><input class="Login_input" type="text"
				placeholder="Email을 입력하세요" id="email"></li>
		</ul>
		<ul>
			<li><input class="Login_input" type="password"
				placeholder="PW를 입력하세요" id="pw"></li>
		</ul>
		<ul>
			<li><input class="Login_input" type="text"
				placeholder="이름을 입력하세요" id="name"></li>
		</ul>
		<ul>
			<li><input class="Login_input" type="text"
				placeholder="나이를 입력하세요" id="age"></li>
		</ul>
		<table>
			<tr>

				<td><a id="real-join" onclick="join_click()" class="button fit">join</a>
				
				
				<td><a id="home" onclick="btnclick('loginWindow')" class="button fit">home</a>
			</tr>
		</table>

</body>
</html>