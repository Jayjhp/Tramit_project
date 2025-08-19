<%-- 회원가입 폼 요청 처리 결과를 출력할 View 페이지 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<head>
  <meta charset="UTF-8">
  <title>TRAMIT - 회원가입</title>
  <link rel="stylesheet" href="css/member.css">
</head>
<div class="join-page">
  <div class="join-container">
    <h2>회원가입</h2>
    
    <form action="joinResult.mvc" name="joinForm" method="post" id="joinForm" class="joinForm">
    <input type="hidden" name="isIdCheck" id="isIdCheck" value="false"/>
      <div class="input-button-wrapper">
  <input type="text" placeholder="아이디" name="id" id="userId" />
  <button type="button" id="btnOverlapId">중복확인</button>
	</div>
      <input type="password" placeholder="비밀번호" required name="pass1" id="pass1">
      
      <input type="password" placeholder="비밀번호 확인" required name="pass2" id="pass2">
      
      <input type="text" placeholder="이름" required name="name" id="name">
      
      <div class="row mb-3 align-items-center">
      <div class="col-md-4">
        <input type="text" class="form-control" name="emailId" id="emailId" placeholder="이메일 아이디">
      </div>
      <div class="col-auto">@</div>
      <div class="col-md-4">
        <input type="text" class="form-control" name="emailDomain" id="emailDomain" >
      </div>
      <div class="col-md-3">
        <select class="form-select" name="selectDomain" id="selectDomain">
          <option value="">직접입력</option>
          <option value="naver.com">naver.com</option>
          <option value="daum.net">daum.net</option>
          <option value="hanmail.net">hanmail.net</option>
          <option value="gmail.com">gmail.com</option>
        </select>
      </div>
    </div>

    <div class="row align-items-center">
      <div class="col-md-3">
        <select class="form-select" name="mobile1" id="mobile1">
          <option>010</option>
          <option>011</option>
          <option>016</option>
          <option>017</option>
          <option>018</option>
          <option>019</option>
        </select>
      </div>
      <div class="col-auto">-</div>
      <div class="col-md-4">
        <input type="text" class="form-control" name="mobile2" id="mobile2" maxlength="4" >
      </div>
      <div class="col-auto">-</div>
      <div class="col-md-4">
        <input type="text" class="form-control" name="mobile3" id="mobile3" maxlength="4" >
      </div>
    </div><br>
      <div class="options">
        <a href="loginForm.mvc ">이미 계정이 있으신가요?</a><br><br><br>
      </div>
      <button class="join-btn" type="submit" value="가입하기">회원가입</button>
    </form>
  </div>
</div>