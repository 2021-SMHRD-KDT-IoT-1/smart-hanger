<%@page import="com.Model.CommunityDTO"%>
<%@page import="com.Model.CommunityDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<title>Astral by HTML5 UP</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="../../assets/css/main.css" />



<link rel="stylesheet" href="../../assets/css/community_view.css" />

</head>

<!-- =====================================여기는 코디 상세 페이지 ======================================================== -->
<body class="is-preload">


	<%
	// get 방식으로 보낸 num받아오기
	String get_num = request.getParameter("board_num");

	// String -> int 형변환

	CommunityDAO dao = new CommunityDAO();
	CommunityDTO communityInfo = dao.showOne(get_num);
	%>

	<!-- Wrapper-->
	<div id="wrapper">

		<!-- Main -->
		<!-- red == 여기는 옷 사진 출력  -->

		<div id="main">






			<!-- 왼쪽 영역 -->
			<div id="left">


				<div id="camera">

					<img id="cloth_imgs" src="../../clothespath/<%=communityInfo.getClothespath()%>" alt="">

				</div>



			</div>










			<!-- 오른쪽 영역 -->
			<div id="right">
				<form action="CommunityCommentsInsertCon.do" id="input_tag">
					<ul id="my_content">
						<li><p><%=communityInfo.getUserid()%></p>
							<p><%=communityInfo.getTitle()%></p></li>
						<li><%=communityInfo.getContent()%></li>
						<li><p>
								좋아요 :
								<%=communityInfo.getLike_num()%></p>
							<p>
								조회수 :
								<%=communityInfo.getView_num()%></p></li>
						<li><%=communityInfo.getUpload_date()%></li>
						
						
						
						
						<li>여기 댓글 영역 수정 예정</li>
						
						
						
						<li>
						<textarea name="comment" placeholder="댓글 입력">
						</textarea><input type="submit" value="등록"></li>

					</ul>
				</form>

			</div>


		</div>





		
		<!-- style="color:black" -->
		<!-- Footer -->
		<div id="footer">
			<ul class="copyright">
				<li>&copy; Untitled.</li>
				<li>Design: <a href="http://html5up.net">HTML5 UP</a></li>
			</ul>
		</div>
	</div>

	<!-- Scripts -->
	<script src="../../assets/js/jquery.min.js"></script>
	<script src="../../assets/js/browser.min.js"></script>
	<script src="../../assets/js/breakpoints.min.js"></script>
	<script src="../../assets/js/util.js"></script>
	<script src="../../assets/js/main.js"></script>
</body>
</html>