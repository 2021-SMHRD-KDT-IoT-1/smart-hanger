<%@page import="com.Model.MemberDTO"%>
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

<!-- =====================================����� �ڵ� �� ������ ======================================================== -->
<body class="is-preload">


	<%
	// get ������� ���� num�޾ƿ���
	String num = request.getParameter("board_num");

	// String -> int ����ȯ

	CommunityDAO dao = new CommunityDAO();
	CommunityDTO communityInfo = dao.showOne(num);
	

	Cookie cookie = null;


	dao.Board_upView(num);
	
	
	

	
	MemberDTO userInfo = (MemberDTO) session.getAttribute("userInfo");
	
	
	
	int btn_state = 0;
	String userId = null;

	
	if(userInfo != null){
		userId = userInfo.getUserId(); 
		//btn_state = dao.Cody_Board_Like_view(num, userId);
	}
	

	%>







	<script type="text/javascript" src="../../js/jquery-3.6.0.min.js"></script>
	<script type="text/javascript">
		// ���ƿ� �̹��� �����   
		
	


		
		function like_btn(in_num, userId) {
			
			var check = 'insert';
			
			var className = $('#like_icon').attr('class');


			// ���ƿ� ���
			if (className === 'icon solid far fa-heart  fa-2x') {

				$('#like_icon').attr('class', 'icon Regular far fa-heart  fa-2x');
				$('#like_num').text(Number($('#like_num').text()) - 1);

				// ���ƿ�
			} else {
				$('#like_icon').attr('class', 'icon solid far fa-heart  fa-2x');
				$('#like_num').text(Number($('#like_num').text()) + 1);

			}

			$.ajax({
				url : '../../CodyBoardLikeUpdate',
				type : 'post',
				data : {
					'num' : in_num,
					'userId' : userId,
					'check' : check
				},
				success : function(data) {
					//alert('���ƿ�');

				},
				error : function() {
					alert('��Ž���');
				}
			});

		}
	</script>



	<!-- Wrapper-->
	<div id="wrapper">

		<!-- Main -->
		<!-- red == ����� �� ���� ���  -->

		<div id="main">






			<!-- ���� ���� -->
			<div id="left">


				<div id="camera">

					<img id="cloth_imgs" src="../../clothespath/<%=communityInfo.getClothespath()%>" alt="">

				</div>



			</div>



			<!-- ������ ���� -->
			<div id="right">
				<form action="CommunityCommentsInsertCon.do" id="input_tag">
					<ul id="my_content">
						<li><p><%=communityInfo.getUserid()%></p>
							<p><%=communityInfo.getTitle()%></p></li>
						<li><%=communityInfo.getContent()%></li>
						<li><p>
								���ƿ� :
								<%=communityInfo.getLike_num()%></p>
							<p>
								��ȸ�� :
								<%=communityInfo.getView_num()%></p></li>
						<li><%=communityInfo.getUpload_date()%></li>
						
						
						
						
						<li>���� ��� ���� ���� ����</li>
						
						
						
						<li>
						<textarea name="comment" placeholder="��� �Է�">
						</textarea><input type="submit" value="���"></li>

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
	
	
	if ('<%=btn_state%>' == '1') {
			$('#like_icon').attr('class', 'icon solid far fa-heart  fa-2x');
		} else {
			$('#like_icon').attr('class', 'icon Regular far fa-heart  fa-2x');
		}
	</script>



</body>
</html>