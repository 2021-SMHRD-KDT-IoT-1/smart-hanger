<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
					
							
								<header>
									<h2>문의사항</h2>
								</header>
								<form action="UserServiceCon.do" method="post">
									<div>
										<div class="row">
											
											<div class="col-6 col-12-medium">
												<input type="text" name="UserId" placeholder="UserId" />
											</div>
											<div class="col-12">
												<input type="text" name="Title" placeholder="Title" />
											</div>
											<div class="col-12">
												<textarea name="Content" placeholder="Content" rows="6"></textarea>
											</div>
											<div class="col-12">
												<input type="submit" value="Send Message" />
											</div>
										</div>
									</div>
								</form>
</body>
</html>