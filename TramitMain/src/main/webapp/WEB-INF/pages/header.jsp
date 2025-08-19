<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 

<head>
  <!-- 문자 인코딩 및 모바일 반응형 설정 -->
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <!-- 페이지 설명 및 제작자 정보 -->
  <meta name="description" content="">
  <meta name="author" content="">
  
  <!-- 웹 폰트 로드 (Poppins 글꼴 사용) -->
  
  <link href="https://fonts.googleapis.com/css?family=Poppins:100,200,300,400,500,600,700,800,900&display=swap" rel="stylesheet">

  <!-- 페이지 제목 -->
  <title>Sixteen Clothing HTML Template</title>

  <!-- 부트스트랩 CSS (반응형 지원) -->
  <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

  <!-- 추가 CSS 파일 -->
  <link rel="stylesheet" href="assets/css/fontawesome.css">
  <link rel="stylesheet" href="assets/css/templatemo-sixteen.css">
  <link rel="stylesheet" href="assets/css/owl.css">
 
  <!-- bootstrap4 icon 사용 -->
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">


</head>

<body>

 <!-- ***** 헤더 영역 ***** -->
 <header class="">
  <nav class="navbar navbar-expand-lg">
      <div class="container">
      	  <a class="navbar-brand" href="home.mvc"><img src="images/main_logo.png"></a>
          <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive">
              <span class="navbar-toggler-icon"></span>
          </button>

          <div class="collapse navbar-collapse justify-content-center" id="navbarResponsive" >
              <ul class="navbar-nav mx-auto"> 
                  <li class="nav-item active"><a class="nav-link" href="home.mvc">HOME</a></li>
                  <li class="nav-item active"><a class="nav-link" href="koreanFood.mvc">맛집</a></li>
                  <li class="nav-item active"><a class="nav-link" href="seoul.mvc">여행지</a></li>
                  <li class="nav-item active"><a class="nav-link" href="boardList.mvc">소식</a></li>
              </ul>
          </div>
<div>
    <ul class="nav justify-content-end">
        <!-- 로그인하지 않은 경우 -->
        <c:if test="${ not sessionScope.isLogin }">
            <form class="form-inline my-2 my-lg-0 ml-auto align-items-center"><a class="custom-btn ml-2" href="loginForm.mvc">로그인</a></form>
            <form class="form-inline my-2 my-lg-0 ml-auto align-items-center"><a class="custom-btn ml-2" href="joinForm.mvc">회원가입</a></form>
        </c:if>

        <!-- 로그인한 경우 -->
        <c:if test="${ sessionScope.isLogin }">
        	<form class="form-inline my-2 my-lg-0 ml-auto align-items-center"><a class="custom-btn ml-2" href="logout.mvc">로그아웃</a></form>
            <form class="form-inline my-2 my-lg-0 ml-auto align-items-center"><a class="custom-btn ml-2" href="memberUpdateForm.mvc">${sessionScope.id}님</a></form>
        </c:if>
    </ul>
</div>

      </div>
  </nav>
</header>
