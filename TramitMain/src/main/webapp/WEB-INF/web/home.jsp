<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<html lang="ko">
<%@ page import="com.tramit.bbs.service.RestaurantsService" %>
<%@ page import="com.tramit.bbs.vo.Restaurants" %>
<%@ page import="java.util.List" %>

<%
    String name = request.getParameter("search");
    String category = request.getParameter("category");
    if (category == null) category = "한식";

    int pageNum = request.getParameter("pageNum") != null ? Integer.parseInt(request.getParameter("pageNum")) : 1;
    int pageSize = 6;

    RestaurantsService restaurantService = new RestaurantsService();

    List<Restaurants> restaurants;

    if (name != null && !name.isEmpty()) {
        restaurants = restaurantService.searchRestaurantsByName(name);
    } else {
        restaurants = restaurantService.getPagedRestaurantsByCategory(category, pageNum, pageSize);
    }

    int totalPages = restaurantService.getTotalPages(category, pageSize);
%>


  <!-- ***** 배너 영역 ***** -->
  <div class="banner header-text position-relative">

    <!-- 배너 위 중앙 텍스트 -->
    <div class="banner-overlay-text">
      <h1>여행도 맛집도, 지금 검색해 보세요!</h1>
      <form class="search-bar-custom mt-4 d-flex justify-content-center" method="GET" action="koreanFood.mvc">
        <div class="input-group custom-search-group">
          <div class="input-group-prepend">
            <span class="input-group-text bg-white border-0">
              <i class="bi bi-search"></i>
            </span>
          </div>
          <input type="text" class="form-control border-0" placeholder="여행지, 음식점, 즐길거리 등" name="search">

        </div>
        <div class="input-group-append">
          <button class="btn btn-success custom-search-btn" type="submit">검색</button>
        </div>
      </form>
    </div>
    <!-- 배너 -->
    <div>
      <div class="index">
        <div class="text-content"></div>
      </div>
    </div>
  </div>
  <!-- ***** 배너 종료 ***** -->

  <!-- ***** 최신 상품 영역 ***** -->
  <div class="latest-products">	
    <div class="container">
      <div class="row">
        <!-- 섹션 제목 -->
        <div class="col-md-12">
          <div class="section-heading">
            <h2 style="font-weight: bold;">인기 여행지</h2>
            <a href="allTravel.mvc">여행지 전체 보기 <i class="fa fa-angle-right"></i></a>
          </div>
        </div>


        <!-- 상품 카드 반복 (각 상품마다 col-md-4 사용) -->

        <!-- 상품 1 -->
       <div class="row">
        <div class="col-md-4">
          <div class="product-item">
            <a href="#"><img src="images/제주/제주01.jpg" alt=""></a>
            <div class="down-content">
              <a href="#"><h4>성산일출봉</h4></a>
              <p>웅장한 자연 경관을 자랑하는 제주도의 대표적인 명소입니다.</p>
              <!-- 별점 표시 -->
              <ul class="stars">
                <li>⭐</li>
                <li>⭐</li>
                <li>⭐</li>
                <li>⭐</li>
                <li>⭐</li>
              </ul>
            </div>
          </div>
        </div>

        <!-- 상품 2 -->
        <div class="col-md-4">
          <div class="product-item">
            <a href="#"><img src="images/서울/서울01.jpg" alt=""></a>
            <div class="down-content">
              <a href="#"><h4>창덕궁</h4></a>
              <p>아름다운 비원과 함께 조선의 정취를 느낄 수 있는 궁궐입니다.</p>
              <!-- 별점 표시 -->
              <ul class="stars">
                <li>⭐</li>
                <li>⭐</li>
                <li>⭐</li>
                <li>⭐</li>
                <li>⭐</li>
              </ul>
            </div>
          </div>
        </div>
        <!-- 상품 3 -->
        <div class="col-md-4">
          <div class="product-item">
            <a href="#"><img src="images/경기/경기01.jpg" alt=""></a>
            <div class="down-content">
              <a href="#"><h4>수원 화성 행궁</h4></a>
              <p>정조대왕의 숨결이 느껴지는 아름다운 궁궐입니다.</p>
              <!-- 별점 표시 -->
              <ul class="stars">
                <li>⭐</li>
                <li>⭐</li>
                <li>⭐</li>
                <li>⭐</li>
                <li>⭐</li>
              </ul>
            </div>
          </div>
        </div>
         <!-- 상품 4 -->
        <div class="col-md-4">
          <div class="product-item">
            <a href="#"><img src="images/충청도/충청도01.jpg" alt=""></a>
            <div class="down-content">
              <a href="#"><h4>공주 백제문화단지</h4></a>
              <p>백제 시대의 역사와 문화를 체험할 수 있는 테마파크입니다.</p>
              <!-- 별점 표시 -->
              <ul class="stars">
                <li>⭐</li>
                <li>⭐</li>
                <li>⭐</li>
                <li>⭐</li>
                <li>⭐</li>
              </ul>
            </div>
          </div>
        </div>
            <!-- 상품 5 -->
        <div class="col-md-4">
          <div class="product-item">
            <a href="#"><img src="images/경상도/경상도01.jpg" alt=""></a>
            <div class="down-content">
              <a href="#"><h4>경주 불국사와 석굴암</h4></a>
              <p>신라 천년의 역사와 아름다움을 느낄 수 있는 대표 유적지입니다.</p>
              <!-- 별점 표시 -->
              <ul class="stars">
                <li>⭐</li>
                <li>⭐</li>
                <li>⭐</li>
                <li>⭐</li>
                <li>⭐</li>
              </ul>
            </div>
          </div>
        </div>
            <!-- 상품 6 -->
        <div class="col-md-4">
          <div class="product-item">
            <a href="#"><img src="images/전라도/전라도01.jpg" alt=""></a>
            <div class="down-content">
              <a href="#"><h4>전주 한옥마을</h4></a>
              <p>한국 전통 가옥의 아름다움을 느낄 수 있는 대표적인 곳입니다.</p>
              <!-- 별점 표시 -->
              <ul class="stars">
                <li>⭐</li>
                <li>⭐</li>
                <li>⭐</li>
                <li>⭐</li>
                <li>⭐</li>
              </ul>
            </div>
          </div>
        </div>
        <!-- ...생략 가능 (코드 동일)... -->
      </div>
    </div>
  </div>
  </div>


   <!-- ***** 최신 상품 영역 ***** -->
  <div class="latest-products">
    <div class="container">
      <div class="row">
        <!-- 섹션 제목 -->
        <div class="col-md-12">
          <div class="section-heading">
            <h2 style="font-weight: bold;">인기 맛집</h2>
            <a href="allFood.mvc">맛집 전체 보기 <i class="fa fa-angle-right"></i></a>
          </div>
        </div>


        <!-- 상품 카드 반복 (각 상품마다 col-md-4 사용) -->

        <!-- 상품 1 -->
       <div class="row">
        <div class="col-md-4">
          <div class="product-item">
            <a href="#"><img src="images/한식/한식01.jpg" alt=""></a>
            <div class="down-content">
              <a href="#"><h4>광장시장 순희네빈대떡</h4></a>
              <p>도심 속 힐링 공간, 조용한 분위기에서 한식을 즐길 수 있어요.</p>
              <!-- 별점 표시 -->
              <ul class="stars">
                <li>⭐</li>
                <li>⭐</li>
                <li>⭐</li>
                <li>⭐</li>
                <li>⭐</li>
              </ul>
            </div>
          </div>
        </div>

        <!-- 상품 2 -->
        <div class="col-md-4">
          <div class="product-item">
            <a href="#"><img src="images/양식/양식01.jpg" alt=""></a>
            <div class="down-content">
              <a href="#"><h4>서가앤쿡</h4></a>
              <p>도심 속 힐링 공간, 조용한 분위기에서 양식을 즐길 수 있어요.</p>
              <!-- 별점 표시 -->
              <ul class="stars">
                <li>⭐</li>
                <li>⭐</li>
                <li>⭐</li>
                <li>⭐</li>
                <li>⭐</li>
              </ul>
            </div>
          </div>
        </div>
        <!-- 상품 3 -->
        <div class="col-md-4">
          <div class="product-item">
            <a href="#"><img src="images/일식/일식01.jpg" alt=""></a>
            <div class="down-content">
              <a href="#"><h4>스시효</h4></a>
              <p>도심 속 힐링 공간, 조용한 분위기에서 한식을 즐길 수 있어요.</p>
              <!-- 별점 표시 -->
              <ul class="stars">
                <li>⭐</li>
                <li>⭐</li>
                <li>⭐</li>
                <li>⭐</li>
                <li>⭐</li>
              </ul>
            </div>
          </div>
        </div>
         <!-- 상품 4 -->
        <div class="col-md-4">
          <div class="product-item">
            <a href="#"><img src="images/중식/중식01.jpg" alt=""></a>
            <div class="down-content">
              <a href="#"><h4>홍반장중국집</h4></a>
              <p>도심 속 힐링 공간, 조용한 분위기에서 한식을 즐길 수 있어요.</p>
              <!-- 별점 표시 -->
              <ul class="stars">
                <li>⭐</li>
                <li>⭐</li>
                <li>⭐</li>
                <li>⭐</li>
                <li>⭐</li>
              </ul>
            </div>
          </div>
        </div>
            <!-- 상품 5 -->
        <div class="col-md-4">
          <div class="product-item">
            <a href="#"><img src="images/커피,디저트/커피,디저트01.jpg" alt=""></a>
            <div class="down-content">
              <a href="#"><h4>스타벅스</h4></a>
              <p>도심 속 힐링 공간, 조용한 분위기에서 한식을 즐길 수 있어요.</p>
              <!-- 별점 표시 -->
              <ul class="stars">
                <li>⭐</li>
                <li>⭐</li>
                <li>⭐</li>
                <li>⭐</li>
                <li>⭐</li>
              </ul>
            </div>
          </div>
        </div>
            <!-- 상품 6 -->
        <div class="col-md-4">
          <div class="product-item">
            <a href="#"><img src="images/퓨전/퓨전01.jpg" alt=""></a>
            <div class="down-content">
              <a href="#"><h4>온더보더</h4></a>
              <p>도심 속 힐링 공간, 조용한 분위기에서 퓨전음식을 즐길 수 있어요.</p>
              <!-- 별점 표시 -->
              <ul class="stars">
                <li>⭐</li>
                <li>⭐</li>
                <li>⭐</li>
                <li>⭐</li>
                <li>⭐</li>
              </ul>
            </div>
          </div>
        </div>
        <!-- ...생략 가능 (코드 동일)... -->
      </div>
    </div>
  </div>
  </div>

  <!-- ***** 스크립트 로딩 ***** -->
  <!-- jQuery 및 부트스트랩 -->
  <script src="vendor/jquery/jquery.min.js"></script>
  <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

  <!-- 기타 기능성 JS -->
  <script src="assets/js/custom.js"></script>
  <script src="assets/js/owl.js"></script>
  <script src="assets/js/slick.js"></script>
  <script src="assets/js/isotope.js"></script>
  <script src="assets/js/accordions.js"></script>

  <!-- 입력 필드 초기화 스크립트 -->
  <script language="text/Javascript"> 
    cleared[0] = cleared[1] = cleared[2] = 0; // 입력 초기화 여부 설정
    function clearField(t){
      if (!cleared[t.id]) {
        cleared[t.id] = 1;
        t.value = '';
        t.style.color = '#fff';
      }
    }
  </script>

</html>