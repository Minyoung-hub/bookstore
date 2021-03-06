<%@ page language='java' contentType='text/html; charset=UTF-8'
	pageEncoding='UTF-8'%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="leehyun.book.user.service.UserService"%>
<%@ page import="leehyun.book.user.service.UserServiceImpl"%>
<%@ page import="leehyun.book.user.domain.User"%>
<%@ page import="java.util.List, java.util.ArrayList"%>
<%@ page import="leehyun.book.img.service.ImgService"%>
<%@ page import="leehyun.book.img.service.ImgServiceImpl"%>
<%@ page import="leehyun.book.img.domain.Img"%>

<%
	request.setCharacterEncoding("utf-8");
	UserService userService = new UserServiceImpl();
	List<User> users = userService.listUsers();
	ImgService imgService = new ImgServiceImpl();
	Img img = imgService.findImg(1);
%>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>북적북적</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.css">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<style>
label, p {
	font-size: large;
}

.logoimg {
	color: #2f5597;
	background-color: white;
	width: 600px;
	margin-right: auto;
	margin-left: auto;
	margin-top: 50px;
}

.div_top {
	margin-top: 10px;
	color: white;
	height: 20px;
	float: right;
}

.div_logo {
	height: 180px;
	text-align: center;
}

.footer {
	text-align: center;
	height: 100px;
	margin-top: 100px;
	padding-top: 20px;
}

.footertext {
	font-size: small;
}

.footerHr {
	border: solid 0.8px #2f5597;
}

hr {
	border: solid 0.5px #2f5597;
}

.find_btn {
	width: 150px;
	height: 50px;
	margin-top: 30px;
	margin-left: 44%;
	font-size: 17px;
}

.blk40 {
	height: 40px;
}

.blk15 {
	height: 15px;
}

.input_form {
	width: 400px;
	height: 45px;
	margin: 0 auto;
	display: block;
}
</style>
</head>
<body>
	<div class="container">
		<div class="div_top">
			<a href="loginIn.jsp">로그인</a> / <a href="addUserIn.jsp">회원가입</a> / <a href="loginIn.jsp">마이페이지</a>
			/ <a href="loginIn.jsp">장바구니</a>
		</div>
	</div>
	<div class="div_logo">
		<div class="logoimg">
			<a href='../main.jsp' style="text-decoration: none;"><img src='../img/<%=img.getImgUrl()%>' width="450"></a>
		</div>
	</div>

	<div class="container">
		<h2>비밀번호 찾기</h2>
		<hr>
		<br>
		<div class='container'>
			<c:choose>
				<c:when test='${!empty param.msgId}'>
					<jsp:include page='msg.jsp'/>
				</c:when>
			</c:choose>
		</div>
		<br>
		<div class="sign_form">
			<form class="form-horizontal" action="pwFindProc.jsp">
				<div class="form-group">
					<label class="col-lg-4 control-label">아이디: </label>
					<div class="col-lg-2">
						<input class="input_form" name="userId" type="text"
							placeholder='아이디' maxlength='12' required>
					</div>
				</div>
				<div class="blk15"></div>
				<div class="form-group">
					<label class="col-lg-4 control-label">비밀번호 질문: </label>
					<div class="col-lg-2">
						<input class="input_form" name="userQ" type="text"
							value='당신의 보물 제 1호는?' disabled>
					</div>
				</div>
				<div class="blk15"></div>
				<div class="form-group">
					<label class="col-lg-4 control-label">답변: </label>
					<div class="col-lg-2">
						<input class="input_form" name="userA" type="text" placeholder='답'
							required>
					</div>
				</div>
				<div>
					<button class="find_btn btn btn-primary" type="submit">비밀번호
						찾기</button>
				</div>
			</form>
		</div>
	</div>

	<div class=footer>
		<hr class='footerHr'>
		<p class='footertext'>
			대표이사 이 현 | 대표 전화 02 – 0000 – 0000<br> 본사 서울시 마포구 서교동 | 주소 서울시
			마포구 서교동<br> 고객센터 02 – 1234 - 1234
		</p>

	</div>
</body>
</html>