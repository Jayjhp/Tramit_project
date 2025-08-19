<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<html lang="ko">


  <!-- ***** 페이지 상단 배너 텍스트 ***** -->
 <div class="banner header-text position-relative">

    </div>
        <div class="board">
         <div class="board_header">
        <div class="tit">
          <h1>소식</h1>
          <div class="desc">소식을 만나보세요.</div>
        </div>
       </div>
        <div class="tab_menu">
          <ul class="tabs">
            <li><a href="boardList.mvc">공지사항</a></li>
            <li><a href="review.mvc">리뷰 게시판</a></li>
            <li><a href="inquiry.mvc">고객센터</a></li>
          </ul>
        </div>
        </div>

  <!-- ***** 글 쓰기 폼 ***** -->
<div class="row">
  <div class="col">
    <div class="row my-5 text-center">
      <div class="col">
        <h4 >글쓰기</h4>
      </div>
    </div>
      <hr class="mt-2 mb-3 short-hr">
        <form class="row">
          <div class="col-6 offset-3">
            <label for="title" class="form-label">제 목</label>
              <input type="text" class="form-control" id="title" name="title" placeholder="제목을 적어주세요.">
            </div>
              <div class="col-6 offset-3">
                <label for="content" class="form-label">내 용</label>
                  <textarea class="form-control" id="content" name="content" rows="10" placeholder="내용을 입력해주세요."></textarea>
                </div>
                  <div class="col-6 offset-3">
                    <input type="file" class="form-control" id="file1" name="file1">
                  </div>
                  <div class="col-6 offset-3 text-right mt-3">
                    <button type="submit" class="btn btn-secondary">등록하기</button>
                    <a href="writing.jsp" id="resetButton" class="btn btn-secondary">다시쓰기</a>
                  </div>
                </form>
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

</html>
