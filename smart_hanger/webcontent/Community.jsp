<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<header>
			<h2>커뮤니티 게시판</h2>
			</header> <input type="submit" value="글작성" style="position: relative; left: 85%;">
			<div style="border: 1px solid; width: 100%; height: 20%;">


				<table id="commtitle">
					<tr>
						<th class="co5" id=c1>번호</th>
						<!-- <th class= "co5" id = c2>말머리</th> -->
						<th class="co5" id=c3>제목</th>
						<th class="co5" id=c4>글쓴이</th>
						<th class="co5" id=c5>작성일</th>
						<!-- <th class= "co5">조회</th>
                      <th class= "co5">추천</th> -->
					</tr>
					<tr onClick="location.href='CommunityLink.jsp'" style="border: 1px solid;">
						<th class="co5" id=c1>1</th>
						<!-- <th class= "co5" id = c2>말머리</th> -->
						<th class="co5" id=c3>제목을 엄청나게 길게쓴다면 이렇게 늘어남</th>
						<th class="co5" id=c4>홍진석</th>
						<th class="co5" id=c5>2021-05-30</th>
						<!-- <th class= "co5">조회</th>
                      <th class= "co5">추천</th> -->
					</tr>
				</table>
</body>
</html>