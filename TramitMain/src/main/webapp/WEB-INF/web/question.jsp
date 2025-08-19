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
               <div class="desc">고객센터</div>
             </div>
           </div>
         <div class="tab_menu">
           <ul class="tabs">
            <li><a href="boardList.mvc">공지사항</a></li>
            <li><a href="reviewBoardList.mvc">리뷰 게시판</a></li>
            <li  class="active"><a href="question.mvc">고객센터</a></li>
          </ul>
        </div>
      </div>

<div class="container">
<!-- content -->
<div class="row my-5" id="global-content">
	<div class="col">
		<div class="row text-center">
			<div class="col">
				<h2 class="fs-3 fw-bold" style="margin-bottom: 50px;">자주 찾는 질문</h2>
			</div>
		</div>  		
		
		<div class="row my-3">
			<div class="col">
				<table class="table table-hover">
					<thead>
						<tr class="table-dark">
							<th>NO</th>
							<th>제목</th>
							<th>작성자</th>
							<th>작성일</th>
						</tr>		
					</thead>
					<tbody>
					
						<tr data-bs-toggle="collapse" data-bs-target="#detail5"
								style="cursor: pointer;">
								<td>05</td>
								<td>회원가입은 어떻게 하나요</td>
								<td>관리자</td>
								<td>2024-05-01 13:00:00</td>
							</tr>
							<tr class="collapse" id="detail5">
								<td colspan="5" class="py-4 ps-4"><b>회원가입은 홈페이지 오른쪽 상단의 '회원가입' 버튼을 클릭한 후, 양식을
									작성하시면 됩니다.</b></td>
							</tr>

							<!-- 게시글 4 -->
							<tr data-bs-toggle="collapse" data-bs-target="#detail4"
								style="cursor: pointer;">
								<td>04</td>
								<td>비밀번호를 잊어버렸어요</td>
								<td>관리자</td>
								<td>2024-05-01 12:00:00</td>
							</tr>
							<tr class="collapse" id="detail4">
								<td colspan="5" class="py-4 ps-4"><b>로그인 화면 아래의 '비밀번호 찾기' 링크를 클릭해 이메일로 초기화 링크를
									받으세요.</b></td>
							</tr>

							<!-- 게시글 3 -->
							<tr data-bs-toggle="collapse" data-bs-target="#detail3"
								style="cursor: pointer;">
								<td>03</td>
								<td>이메일 인증이 되지 않아요</td>
								<td>관리자</td>
								<td>2024-05-01 11:00:00</td>
							</tr>
							<tr class="collapse" id="detail3">
								<td colspan="5" class="py-4 ps-4"><b>이메일 인증 메일이 도착하지 않았다면 스팸함을 확인하거나, 이메일 주소를 다시
									확인해 주세요.</b></td>
							</tr>

							<!-- 게시글 2 -->
							<tr data-bs-toggle="collapse" data-bs-target="#detail2"
								style="cursor: pointer;">
								<td>02</td>
								<td>예약 취소는 어떻게 하나요?</td>
								<td>관리자</td>
								<td>2024-05-01 10:00:00</td>
							</tr>
							<tr class="collapse" id="detail2">
								<td colspan="5" class="py-4 ps-4"><b>관리자가 예약 내역을 확인한 뒤 '예약 취소' 버튼을 클릭하면 즉시
									처리됩니다.</b></td>
							</tr>

							<!-- 게시글 1 -->
							<tr data-bs-toggle="collapse" data-bs-target="#detail1"
								style="cursor: pointer;">
								<td>01</td>
								<td>환불은 얼마나 걸리나요?</td>
								<td>관리자</td>
								<td>2024-05-01 10:00:00</td>
							</tr>
							<tr class="collapse" id="detail1">
								<td colspan="5" class="py-4 ps-4"><b>환불은 요청일로부터 영업일 기준 3~5일 이내에 처리됩니다.</b></td>
							</tr>
					</tbody>					
				</table>
			</div>			
		</div>
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
