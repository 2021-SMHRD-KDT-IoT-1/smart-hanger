<%@page import="java.util.ArrayList"%>
<%@page import="com.Model.Board_commentsDTO"%>
<%@page import="com.Model.Board_commentsDAO"%>
<%@page import="com.Model.MemberDTO"%>
<%@page import="com.Model.CommunityDTO"%>
<%@page import="com.Model.CommunityDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Astral by HTML5 UP</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="../../assets/css/main.css" />



<link rel="stylesheet" href="../../assets/css/community_view2.css" />
</head>

<!-- =====================================여기는 코디 상세 페이지 ======================================================== -->
<body class="is-preload">


	<%
	// get 방식으로 보낸 num받아오기
	String num = request.getParameter("board_num");

	// String -> int 형변환

	CommunityDAO dao = new CommunityDAO();
	CommunityDTO communityInfo = dao.showOne(num);

	Cookie cookie = null;

	dao.Board_upView(num);

	Board_commentsDAO comment_dao = new Board_commentsDAO();
	ArrayList<Board_commentsDTO> commemtLists = comment_dao.Board_comments_All_Select(num);

	MemberDTO userInfo = (MemberDTO) session.getAttribute("userInfo");

	int btn_state = 0;
	String userId = null;

	if (userInfo != null) {
		userId = userInfo.getUserId();
		btn_state = dao.Community_Board_Like_view(num, userId);
	}
	%>







	<script type="text/javascript" src="../../js/jquery-3.6.0.min.js"></script>
	<script type="text/javascript">
		// 좋아요 이미지 변경용   
		
	


		
		function like_btn(in_num, userId) {
			
			var check = 'insert';
			
			var className = $('#like_icon').attr('class');


			// 좋아요 취소
			if (className === 'icon solid far fa-heart  fa-2x') {

				$('#like_icon').attr('class', 'icon Regular far fa-heart  fa-2x');
				$('#like_num').text(Number($('#like_num').text()) - 1);

				// 좋아요
			} else {
				$('#like_icon').attr('class', 'icon solid far fa-heart  fa-2x');
				$('#like_num').text(Number($('#like_num').text()) + 1);

			}

			$.ajax({
				url : '../../CommunityBoardLikeUpdate',
				type : 'post',
				data : {
					'num' : in_num,
					'userId' : userId,
					'check' : check
				},
				success : function(data) {
					//alert('좋아요');

				},
				error : function() {
					alert('통신실패');
				}
			});

		}
	</script>



	<!-- Wrapper-->
	<div id="wrapper">

		<!-- Main -->
		<!-- red == 여기는 옷 사진 출력  -->

		<div id="main">


			<!-- 왼쪽 영역 -->
			<div id="left">


				<div id="camera">
					<a id="home_img_penal" href="../../Main.jsp#Community" class="jumplink pic" style="z-index: 2;"> <span
						class="arrow icon solid fas fa-angle-double-left fa-2x " style="z-index: 1; color: white;"></span>
					</a> <img id="cloth_imgs" src="../../clothespath/<%=communityInfo.getClothespath()%>" alt="">

				</div>



			</div>



			<!-- 오른쪽 영역 -->
			<div id="right" style="overflow-y: scroll;">
				<form action="CommunityCommentsInsertCon.do" id="input_tag" method="post">
					<input type="hidden" name="num" value="<%=num%>">
					<ul id="my_content">
						<li><%=communityInfo.getUserid()%> (<%=communityInfo.getTitle()%>)</li>
						<li><%=communityInfo.getContent()%></li>
						<li>
							<p id="like_icon" class="icon Regular far fa-heart  fa-2x" onclick="like_btn('<%=num%>','<%=userId%>')" style="cursor: pointer;"></p>
							<p>좋아요 : <span id="like_num"><%=communityInfo.getLike_num()%></span></p>
							<p>조회수 : <span id="view_num"><%=communityInfo.getView_num()%></span></p>
						</li>
						<li id="update_date"><%=communityInfo.getUpload_date()%></li>
						<li>
							<ul style="list-style: none">
								<%
								for (int row = 0; row < commemtLists.size(); row++) {
								%>
								<li>
									<p><%=commemtLists.get(row).getUserId()%></p>
									<p><%=commemtLists.get(row).getUpload_date()%></p>
									<p><%=commemtLists.get(row).getComments()%></p>
								</li>
								<%
								}
								%>
								<li id="line">
								<textarea class="chat"  name="comment" style="resize: none" placeholder="댓글 입력"></textarea>
								<input class="chat2" type="submit" value="등록">
								</li>

							</ul>
						</li>
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

	<script type="text/javascript">
	
	$('#view_num').text(Number($('#view_num').text()) + 1);
	
	if ('<%=btn_state%>' == '1') {
			$('#like_icon').attr('class', 'icon solid far fa-heart  fa-2x');
		} else {
			$('#like_icon').attr('class', 'icon Regular far fa-heart  fa-2x');
		}
	</script>



</body>
</html>