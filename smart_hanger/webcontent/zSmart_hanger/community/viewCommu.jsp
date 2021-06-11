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
	String get_num = request.getParameter("board_num");

	// String -> int ����ȯ

	CommunityDAO dao = new CommunityDAO();
	CommunityDTO communityInfo = dao.showOne(get_num);
	%>

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
</body>
</html>