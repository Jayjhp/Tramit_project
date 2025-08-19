<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>TRAMIT - 로그인</title>
<link rel="stylesheet" href="css/member.css">
<link rel="text/javascript" href="js/member.js">
 <script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
</head>
<div class="member-page">
	<div class="login-container">
		<a style="text-decoration: none;" href="home.mvc"><img src="images/로그인로고.png"></a>
		<form class="login-form mt-5" action="login.mvc" method="post">
			<%-- 로그인 처리 URL 설정 --%>
			<input type="text" placeholder="아이디" name="id" required>
			<%-- name 속성 추가 --%>
			<input type="password" placeholder="비밀번호" name="pass" required><br>
			<%-- name 속성 추가 --%>
			<div class="options">
				<a href="joinForm.mvc">회원가입</a><br> <br> <br>
				<%-- 회원가입 링크 수정 --%>
			</div>
			<button class="login-btn" type="submit">로그인</button>

		</form>
	</div>
</div>
</html>