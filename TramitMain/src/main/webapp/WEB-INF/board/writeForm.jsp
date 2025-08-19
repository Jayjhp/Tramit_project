<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <!-- ***** 배너 영역 ***** -->
<div class="banner header-text position-relative"></div>

<div class="container">
<!-- content -->
<div class="row my-5" id="global-content">
	<div class="col">
		<div class="row text-center">
			<div class="col">
				<h2 class="fs-3 fw-bold">게시글 쓰기</h2> 
			</div>
		</div>  
		<form name="writeForm" action="reviewwriteProcess.mvc" id="writeForm" 
			class="row g-3 border-primary" method="post" enctype="multipart/form-data">
		  	<div class="col-4 offset-md-2">
			    <label for="writer" class="form-label">글쓴이</label>
			    <input type="text" class="form-control" name="writer"  id="writer" 
			    	placeholder="작성자를 입력해 주세요">
	  		</div>
	  		<div class="col-4 ">
			    <label for="pass" class="form-label">비밀번호</label>
			    <input type="password" class="form-control" name="pass"  id="pass" >
	  		</div>
	  		<div class="col-8 offset-md-2">
			    <label for="title" class="form-label">제 목</label>
			    <input type="text" class="form-control" name="title"  id="title" >
	  		</div>
			<div class="col-8 offset-md-2">
			    <label for="content" class="form-label">내 용</label>
			    <textarea class="form-control" name="content" id="content" rows="10"></textarea>
	  		</div>
	  	<div class="col-8 offset-md-2">
				<label for="category" class="form-label">카테고리</label>
				<select class="form-select" id="category" name="category">
					<option selected>필수 선택입니다.</option>
					<option value="여행">여행</option>
					<option value="맛집">맛집</option>
				</select>
			</div>
			<div class="col-8 offset-md-2 mt-3">
				<label class="form-label">별점</label>
				<div>
					<input type="radio" class="btn-check" name="rating" id="star1" autocomplete="off" value="1">
					<label class="btn btn-outline-warning" for="star1">★</label>

					<input type="radio" class="btn-check" name="rating" id="star2" autocomplete="off" value="2">
					<label class="btn btn-outline-warning" for="star2">★★</label>

					<input type="radio" class="btn-check" name="rating" id="star3" autocomplete="off" value="3">
					<label class="btn btn-outline-warning" for="star3">★★★</label>

					<input type="radio" class="btn-check" name="rating" id="star4" autocomplete="off" value="4">
					<label class="btn btn-outline-warning" for="star4">★★★★</label>

					<input type="radio" class="btn-check" name="rating" id="star5" autocomplete="off" value="5">
					<label class="btn btn-outline-warning" for="star5">★★★★★</label>
				</div>
			</div>
	  		<div class="col-8 offset-md-2">
			    <label for="file1" class="form-label">파 일</label>
			    <input type="file" class="form-control" name="file1"  id="file1" >
	  		</div>	
	  		<div class="col-8 offset-md-2 text-center mt-5">
			   <input type="submit" value="등록하기" class="btn btn-dark"/>
					&nbsp;&nbsp;<input type="button" value="목록보기" 
						onclick="location.href='boardList.mvc'" class="btn btn-dark"/>
	  		</div>	
		</form>
	</div>
</div>    
</div>    
    