<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
h2 {
	margin-left: 80px;
	margin-top: 50px;
}

table {
	margin-left : 80px;
}
</style>

</head>
<body>

	<header>
		<h2>로그인</h2>
	</header>
	<form action="#" method="post">
		<ul>
			<input type="text" placeholder="Email을 입력하세요" name="email">
		</ul>
		<ul>
			<input type="password" placeholder="PW를 입력하세요" name="pw">
		</ul>
		<table>
			<tr>
				<td><input type="submit" value="LogIn" class="button fit"></td>
			</tr>
		</table>
	</form>
	
	<header>
		<h2>회원가입</h2>
	</header>
	<form action="#" method="post">
		<ul>
			<input type="text" placeholder="Email을 입력하세요" name="email">
		</ul>
		<ul>
			<input type="password" placeholder="PW를 입력하세요" name="pw">
		</ul>
		<table2>
			<tr>
				<td><input type="submit" value="LogIn" class="button fit"></td>
				<td><input type="submit" value="Join" class="button fit"></td>
			</tr>
		</table2>
	</form>


</body>
</html>