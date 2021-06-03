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
		function btnclick(inner, _url) {
			$.ajax({
				url : _url,
				type : 'post',
				success : function(data) {
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


			<h2>로그인</h2>
			<form action="LoginServiceCon.do" method="post">
				<ul>
					<li><input class="Login_input" type="text" placeholder="Email을 입력하세요" name="userId"></li>
				</ul>
				<ul>
					<li><input class="Login_input" type="password" placeholder="PW를 입력하세요" name="userPw"></li>
				</ul>
				<table>
					<tr>
						<td><input id="login-btn" type="submit" value="LogIn" class="button fit"></td>


						<td><a id="join-btn" onclick="btnclick('loginFrame','joinWindow.jsp')" class="button fit">join</a>


						
					</tr>
				</table>
			</form>


		</div>
	</div>
</body>
</html>