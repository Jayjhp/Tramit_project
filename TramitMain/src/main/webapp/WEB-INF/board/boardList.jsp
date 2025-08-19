<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
    
  <!-- ***** 페이지 상단 배너 텍스트 ***** -->
 <div class="banner header-text position-relative">
  </div>
        <div class="board">
          <div class="board_header">
           <div class="tit">
             <h1>소식</h1>
               <div class="desc">공지 사항</div>
             </div>
           </div>
         <div class="tab_menu">
           <ul class="tabs">
            <li class="active"><a href="boardList.mvc">공지사항</a></li>
            <li><a href="reviewBoardList.mvc">리뷰 게시판</a></li>
            <li><a href="question.mvc">고객센터</a></li>
          </ul>
        </div>
      </div>

<div class="container">
	<!-- content -->
	<div class="row my-5" id="global-content">
		<div class="col">
			<div class="row text-center">
				<div class="col">
					<h2 class="fs-3 fw-bold">공지사항</h2>
				</div>
			</div>  		
			<form name="searchForm" id="searchForm"
				class="row justify-content-center my-3">
				<div class="col-auto">
					<select name="type" class="form-select">
						<option value="title">제목</option>
						<option value="writer">작성자</option>
						<option value="content">내용</option>
					</select>
				</div>
				<div class="col-4">
					<input type="text" name="keyword" class="form-control" id="keyword"/>
				</div>
				<div class="col-auto">
					<input type="submit" value="검 색" class="btn btn-secondary"/>
				</div>
			</form>
				
			<!-- 검색 요청일 경우 아래를 화면에 표시 -->	
			<c:if test="${ searchOption }">			
				<div class="row my-3">
					<div class="col text-center">
						"${ keyword  }" 검색 결과
					</div>
				</div> 
				
				<%-- 검색 요청일 경우 일반 게시글 리스트로 이동할 수 있도록 링크를 설정했다. --%>
				<div class="row my-3">
					<div class="col-6">
						<a href="boardList.mvc" class="btn btn-outline-dark">리스트</a>
					</div>
					<div class="col-6 text-end">
						<a href="writeForm.mvc" class="btn btn-outline-dark">글쓰기</a>
					</div>
				</div>
			</c:if>
			
			<!-- 검색 요청이 아닐 경우 아래를 화면에 표시 -->
			<c:if test="${ not searchOption }">
				<div class="row my-3">
					<div class="col text-end">
						<a href="writeForm.mvc" class="btn btn-outline-dark">글쓰기</a>
					</div>
				</div>
			</c:if>
			
			<div class="row my-3">
				<div class="col">
					<table class="table table-hover">
						<thead>
							<tr class="table-secondary">
								<th>NO</th>
								<th>제목</th>
								<th>작성자</th>
								<th>작성일</th>
								<th>조회수</th>
							</tr>		
						</thead>
						<tbody class="text-secondary">

						<c:if test="${ searchOption and not empty boardList }">
							<c:forEach var="b" items="${boardList}" varStatus="status">
							<tr>
								<td>${ b.no }</td>
								<td>
									<a href="boardDetail.mvc?no=${b.no}&pageNum=${currentPage}
									&type=${ type }&keyword=${ keyword }" 
									class="text-decoration-none link-secondary">${ b.title }</a>
								</td>
								<td>${ b.writer }</td>
								<td>${ b.regDate }</td>
								<td>${ b.readCount }</td>
							</tr>
							</c:forEach>
						</c:if>

						<c:if test="${ not searchOption and not empty boardList }">
							<c:forEach var="b" items="${boardList}" varStatus="status">
							<tr>
								<td>${ b.no }</td>
								<td><a href="boardDetail.mvc?no=${b.no}&pageNum=${currentPage}" 
									class="text-decoration-none link-secondary">${ b.title }</a></td>
								<td>${ b.writer }</td>
								<td>${ b.regDate }</td>
								<td>${ b.readCount }</td>
							</tr>
							</c:forEach>
						</c:if>
						<%-- 검색 요청이면서 검색된 리스트가 존재하지 않을 경우 --%>
						<c:if test="${ searchOption and empty boardList }">
							<tr>
								<td colspan="5" class="text-center">
									"${ keyword }"가 포함된 게시글이 존재하지 않습니다.
								</td>
							</tr>
						</c:if>
						
						<%-- 일반 게시글 리스트 요청이면서 게시글 리스트가 존재하지 않을 경우 --%>
						<c:if test="${ not searchOption and empty boardList }">
							<tr>
								<td colspan="5" class="text-center">게시글이 존재하지 않습니다.</td>
							</tr>
						</c:if>
						</tbody>					
					</table>
				</div>			
			</div>
			
			<!-- 검색 요청이면서 검색된 리스트가 존재할 경우 페이지네이션  -->
			<c:if test="${ searchOption and not empty boardList }">
				<div class="row">
					<div class="col">
						<nav aria-label="Page navigation">
						  <ul class="pagination justify-content-center">

						  	<c:if test="${ startPage > pageGroup }">
							    <li class="page-item">
							      <a class="page-link" href="boardList.mvc?pageNum=${ startPage - pageGroup }
							      &type=${ type }&keyword=${ keyword }">Pre</a>
							    </li>
						    </c:if>
	
						    <c:forEach var="i" begin="${startPage}" end="${endPage}">
						    	<c:if test="${i == currentPage }">
						    	<li class="page-item active" aria-current="page">
						    		<span class="page-link">${i}</span>
						    	</li>
						    	</c:if>
						    	<c:if test="${i != currentPage }">
							    	<li class="page-item">
							    		<a class="page-link" href="boardList.mvc?pageNum=${ i }&type=${ type }&keyword=${ keyword }">${i}</a>
							    	</li>
							    </c:if>					    
						    </c:forEach>

							<c:if test="${ endPage < pageCount }">
							    <li class="page-item">
							      <a class="page-link" href="boardList.mvc?pageNum=${ startPage + pageGroup }
							      &type=${ type }&keyword=${ keyword }">Next</a>
							    </li>
						  	</c:if>
						  </ul>
						</nav>
					</div>
				</div>
			</c:if>
			
			<!-- 일반 게시글 요청이면서 검색된 리스트가 존재할 경우 페이지네이션  -->
			<c:if test="${ not searchOption and not empty boardList }">
				<div class="row">
					<div class="col">
						<nav aria-label="Page navigation">
						  <ul class="pagination justify-content-center">

						  	<c:if test="${ startPage > pageGroup }">
							    <li class="page-item">
							      <a class="page-link" href="boardList.mvc?pageNum=${ startPage - pageGroup }">Pre</a>
							    </li>
						    </c:if>

						    <c:forEach var="i" begin="${startPage}" end="${endPage}">
						    	<c:if test="${i == currentPage }">
						    	<li class="page-item active" aria-current="page">
						    		<span class="page-link">${i}</span>
						    	</li>
						    	</c:if>
						    	<c:if test="${i != currentPage }">
							    	<li class="page-item"><a class="page-link" href="boardList.mvc?pageNum=${ i }">${i}</a></li>
							    </c:if>					    
						    </c:forEach>

							<c:if test="${ endPage < pageCount }">
							    <li class="page-item">
							      <a class="page-link" href="boardList.mvc?pageNum=${ startPage + pageGroup }">Next</a>
							    </li>
						  	</c:if>
						  </ul>
						</nav>
					</div>
				</div>
			</c:if>
			
		</div>
	</div>
</div>

  <!-- ***** 자바스크립트 로딩 ***** -->
  <!-- 기본 jQuery 및 Bootstrap -->
  <script src="vendor/jquery/jquery.min.js"></script>
  <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

  <!-- 추가 스크립트 -->
  <script src="assets/js/custom.js"></script>
  <script src="assets/js/owl.js"></script>
  <script src="assets/js/slick.js"></script>
  <script src="assets/js/isotope.js"></script>
  <script src="assets/js/accordions.js"></script>

  <!-- 입력 필드 초기화용 스크립트 -->
  <script language="text/Javascript"> 
    cleared[0] = cleared[1] = cleared[2] = 0;
    function clearField(t){
      if(!cleared[t.id]){
        cleared[t.id] = 1;
        t.value = '';
        t.style.color = '#fff';
      }
    }
  </script>
