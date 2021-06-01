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
	<div id="loginFrame_back">
		<div id="loginFrame">
		
			

				<h2>로그인</h2>
			<form action="LoginServiceCon.do" method="post">
				<ul>
					<input class="Login_input"  type="text" placeholder="Email을 입력하세요" name="email">
				</ul>
				<ul>
					<input  class="Login_input" type="password" placeholder="PW를 입력하세요" name="pw">
				</ul>
				<table2>
				<tr>
					<td><input type="submit" value="LogIn" class="button fit"></td>
					<td><input type="submit" value="Join" class="button fit"></td>
				</tr>
				</table2>
			</form>
		</div>
	</div>
</body>
</html>