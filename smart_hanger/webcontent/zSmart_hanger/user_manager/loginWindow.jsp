<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="assets/css/loginFrame.css" />
<link rel="stylesheet" href="assets/css/main.css" />
<style>
</style>
</head>
<body>

	<!-- div 요소 불러오는 jq -->
	<script src="./js/jquery-3.6.0.min.js"></script>
	<script type="text/javascript">
		/* 페이지 불러오기 (바꿀 div id입력 , 가져올 파일) */
		function btnclick(inner, _url) {
			$.ajax({
				url : _url,
				type : 'post',
				success : function(data) {
					if (data == 'goMainPage') {
						console.log(data);
						$(location).attr('href', 'Main.jsp');
					} else {
						$('#' + inner).html(data);
					}
				},
				error : function() {
					$('#' + inner).text('페이지 점검중 입니다.');
				}
			});
		}

		/* 로그인 기능 */
		function login_check(inner, _url) {

			var userId = $('#userId').val();
			var userPw = $('#userPw').val();

			$.ajax({
				url : _url,
				type : 'post',
				data : {
					'userId' : userId,
					'userPw' : userPw
				},
				success : function(data) {
					if (data === 'goMainPage') {
						console.log(data);
						$(location).attr('href', 'Main.jsp')
					}
					$('#' + inner).html(data);
				},
				error : function() {
					$('#' + inner).text('페이지 점검중 입니다.');
				}
			});
		}
	</script>



	<div id="loginFrame_back">
		<div id="loginFrame">

			<form>
			<h2 style="left: 0px">로그인</h2>
			<ul id="login_ul">
				<li><input id="userId" class="Login_input" type="text" placeholder="Email을 입력하세요" name="userId"></li>
				<li></li>
				<li><input id="userPw" class="Login_input" type="password" placeholder="PW를 입력하세요" name="userPw"></li>
				<li></li>
				<li><input id="login-btn" type="button" value="LogIn" class="button fit" onclick="login_check('loginFrame', 'LoginServiceCon')"> <a
					id="join-btn" onclick="btnclick('loginFrame','zSmart_hanger/user_manager/joinWindow.jsp')" class="button fit">join</a></li>
			</ul>

			</form>
		</div>
	</div>
</body>
</html>