<%@page import="com.Model.MemberDTO"%>
<%@page import="com.Model.Cody_board_commentsDTO"%>
<%@page import="com.Model.Cody_board_commentsDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.Model.Board_commentsDTO"%>
<%@page import="com.Model.Cody_Board_DTO"%>
<%@page import="com.Model.Cody_Board_DAO"%>
<%@page import="com.Model.My_clothesDTO"%>
<%@page import="com.Model.My_clothesDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Astral by HTML5 UP</title>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="../../assets/css/main.css" />

<link rel="stylesheet" href="../../assets/css/cody_view.css" />

</head>

<!-- =====================================����� �ڵ� �� ������ ======================================================== -->
<body class="is-preload">

	<%
	Cookie cookie = null;

	Cody_Board_DAO dao = new Cody_Board_DAO();

	String num = request.getParameter("num");

	dao.Cody_Board_upView(num);
	
	
	

	Cody_Board_DTO cody_info = dao.Cody_Board_One_Select(num);

	// ����ھ��̵� �������� ���� �ۼ��� �͵��� ������
	// �׷��� ����� ���̵�� ������ ���ļ� ���̺� �ø�
	// �̰� dao ���� ����� ������ ����� �˴ϴ�

	Cody_board_commentsDAO comment_dao = new Cody_board_commentsDAO();

	ArrayList<Cody_board_commentsDTO> commemtLists = comment_dao.Board_comments_Select(num);
	
	
	
	MemberDTO userInfo = (MemberDTO) session.getAttribute("userInfo");
	
	
	
	int btn_state = 0;
	String userId = null;

	
	if(userInfo != null){
		userId = userInfo.getUserId(); 
		btn_state = dao.Cody_Board_Like_view(num, userId);
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
					<a id="home_img_penal" href="../../Main.jsp#Stylist" class="jumplink pic" style="z-index: 2;"> <span
						class="arrow icon solid fas fa-angle-double-left fa-2x " style="z-index: 1; color: white;"></span></a> 
						<img id="cloth_imgs"	src="../../cody_img/<%=cody_info.getClothespath()%>" alt="">

				</div>



			</div>




			<!-- ������ ���� -->
			<div id="right" style="overflow-y: scroll;">
				<form action="CodyCommentsInsertCon.do" id="input_tag" method="post">
					<input type="hidden" name="num" value="<%=num%>">
					<ul id="my_content">
						<li><%=cody_info.getTitle()%> (<%=cody_info.getUserid()%>)</li>
						<li><%=cody_info.getContent()%></li>
						<li>
							<p id="like_icon" class="icon Regular far fa-heart  fa-2x" onclick="like_btn('<%=num%>','<%=userId %>')" style="cursor: pointer;"></p>
							<p>��ȸ�� : <span id="view_num"><%=cody_info.getView_num()%></span></p>
							<p>���ƿ� : <span id="like_num"><%=cody_info.getLike_num()%></span></p>
						</li>
						<li id="update_date"><%=cody_info.getUpload_date()%></li>
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
								<li id="line"><textarea class="chat" name="comment" style="resize: none" placeholder="��� �Է�"></textarea> <input class="chat2" type="submit"
									value="���"></li>
							</ul>

						</li>



					</ul>
				</form>

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
	}else{
		$('#like_icon').attr('class', 'icon Regular far fa-heart  fa-2x');
	}
	
	</script>
	
	
	
</body>
</html>