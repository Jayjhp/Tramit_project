<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- ***** 배너 영역 ***** -->
<div class="banner header-text position-relative"></div>
    
<div class="container">
<!-- content -->
<div class="row my-5" id="global-content">
	<div class="col">
		<div class="row text-center">
			<div class="col">
				<h2 class="fs-3 fw-bold">게시글 수정하기</h2>
			</div>
		</div>  
		<!-- 파일 업로드 폼을 만들때 enctype을 아래와 같이 지정한다. -->
		<form name="updateForm" action="updateProcess.mvc" id="updateForm" 
			class="row g-3 border-primary" method="post"
			enctype="multipart/form-data">

			<input type="hidden" name="no" value="${board.no}">
			<input type="hidden" name="pageNum" value="${ pageNum }" />			

			<c:if test="${ searchOption }">
				<input type="hidden" name="type" value="${ type }" />
				<input type="hidden" name="keyword" value="${ keyword }" />
			</c:if>		
		  	<div class="col-4 offset-md-2">
			    <label for="writer" class="form-label">글쓴이</label>
			    <input type="text" class="form-control" name="writer"  id="writer" 
			    	placeholder="작성자를 입력해 주세요" value="${ board.writer }">
	  		</div>
	  		<div class="col-4 ">
			    <label for="pass" class="form-label">비밀번호</label>
			    <input type="password" class="form-control" name="pass"  
			    	id="pass">
	  		</div>
	  		<div class="col-8 offset-md-2">
			    <label for="title" class="form-label">제 목</label>
			    <input type="text" class="form-control" name="title"  
			    	id="title" value="${board.title}">
	  		</div>
			<div class="col-8 offset-md-2">
			    <label for="content" class="form-label">내 용</label>
			    <textarea class="form-control" name="content" id="content" 
			    	rows="10">${ board.content }</textarea>
	  		</div>
	  		<div class="col-8 offset-md-2">
			    <label for="file1" class="form-label">파 일</label>
			    <input type="file" class="form-control" name="file1"  id="file1">
	  		</div>		
	  		<div class="col-8 offset-md-2 text-center mt-5">
			   <input type="submit" value="수정하기" class="btn btn-primary"/>

				<c:if test="${ not searchOption }">	
				&nbsp;&nbsp;<input class="btn btn-primary" type="button" value="목록보기" 
						onclick="location.href='boardList.mvc?pageNum=${pageNum}'"/>
				</c:if>

				<c:if test="${ searchOption }">	
				&nbsp;&nbsp;<input class="btn btn-primary" type="button" value="목록보기" 
						onclick="location.href=
						'boardList.mvc?pageNum=${pageNum}&type=${ type }&keyword=${ keyword }'"/>
				</c:if>	
	  		</div>	
		</form>
	</div>
</div>    
</div>
    