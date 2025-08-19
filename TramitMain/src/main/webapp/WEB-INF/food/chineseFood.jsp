<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="com.tramit.bbs.service.RestaurantsService" %>
<%@ page import="com.tramit.bbs.vo.Restaurants" %>
<%@ page import="java.util.List" %>

<%
    // 검색어 및 카테고리 값 받기
    String name = request.getParameter("search");
    String category = request.getParameter("category");
    if (category == null) category = "중식"; // 기본 카테고리 설정

    int pageNum = request.getParameter("pageNum") != null ? Integer.parseInt(request.getParameter("pageNum")) : 1;
    int pageSize = 6;

    RestaurantsService service = new RestaurantsService();
    List<Restaurants> restaurants;

    if (name != null && !name.isEmpty()) {
        restaurants = service.searchRestaurantsByName(name);
    }
 else {
        // 검색어가 없을 경우, 기존 카테고리 기반 페이징 처리
        restaurants = service.getPagedRestaurantsByCategory(category, pageNum, pageSize);
    }

    int totalPages = service.getTotalPages(category, pageSize);
%>

<html lang="ko">
<head>
  <meta charset="UTF-8">
  <title>맛집 리스트</title>
  <link rel="stylesheet" href="your-styles.css">
    <style>
  .image-button {
    border: none;          /* 테두리 제거 */
    background: none;      /* 배경 제거 */
    padding: 0;            /* 여백 제거 */
    cursor: pointer;       /* 커서 변경 (선택사항) */
  }
  </style>
</head>
<body>

<!-- 배너 영역 -->
<div class="banner header-text position-relative">
  <div class="banner-overlay-text">
    <h1>" 맛집 "</h1>
    <h3 style="margin-top: 15px;">나만 알고 싶은 맛집, 공유해볼까요?</h3>
  </div>
</div>

<!-- 맛집 리스트 영역 -->
<div class="products">
  <div class="container">
    <!-- 상단 타이틀과 검색창 -->
    <div class="col-md-12 mb-4 d-flex justify-content-between align-items-center">
      <div>
        <h2 style="margin-bottom: 5px;">맛집 리스트</h2>
        <span>카테고리를 선택하여 다양한 맛집을 둘러보세요!</span>
      </div>
      <form method="GET" action="chineseFood.mvc">
      <div class="custom-search-group-small d-flex align-items-center">
    <input type="text" class="form-control border-0"  name="search" placeholder="맛집 검색..." />
    <button class="btn btn-outline-secondary border-0"  type="submit">
          <i class="bi bi-search"></i>
        </button>
        </div>
		</form>
    </div>

    <!-- 필터 카테고리 -->
    <div class="col-md-12 mb-4">
      <div class="filters text-center">
        <ul class="list-inline">
          <li class="list-inline-item"><a href="koreanFood.mvc">한식</a></li>
          <li class="list-inline-item"><a href="westernFood.mvc">양식</a></li>
          <li class="list-inline-item"><a href="japaneseFood.mvc">일식</a></li>
          <li class="list-inline-item"><a href="chineseFood.mvc">중식</a></li>
          <li class="list-inline-item"><a href="cafe.mvc">카페/디저트</a></li>
          <li class="list-inline-item"><a href="fusion.mvc">퓨전</a></li>
        </ul>
      </div>
    </div>

    <!-- 맛집 목록 출력 -->
    <div class="col-md-12">
      <div class="filters-content">
        <div class="row grid">
           <% for (Restaurants r : restaurants) { %>
      <div class="col-lg-4 col-md-4 all">
        <div class="product-item">
          <button onclick="location.href='chineseFood2.mvc'" class="image-button">
  			<img src="<%= r.getImageUrl() %>" alt="<%= r.getName() %>">
		  </button>
          <div class="down-content">
            <button onclick="location.href='chineseFood2.mvc'" class="image-button"><h4><%= r.getName() %></h4></button>
            <p><%= r.getDescription() %></p>
            <p><strong>카테고리:</strong> <%= r.getCategory() %></p>
            <p><strong>평점:</strong> ⭐ <%= r.getRating() %>/5</p>
          </div>
        </div>
      </div>
    <% } %>
        </div>
      </div>
    </div>

    <!-- 페이지네이션 -->
<div class="col-md-12">
  <div class="pagination">
    <ul class="pages">
      <% if (pageNum > 1) { %>
        <li ><a id=pre-btn href="?category=<%= category %>&pageNum=<%= pageNum - 1 %>"><i class="fa fa-angle-double-left"></i></a></li>
      <% } %>
      <% for (int i = 1; i <= totalPages; i++) { %>
        <li <%= (i == pageNum) ? "class='active'" : "" %>>
          <a href="?category=<%= category %>&pageNum=<%= i %>"><%= i %></a>
        </li>
      <% } %>
      <% if (pageNum < totalPages) { %>
        <li><a  id="next-btn" href="?category=<%= category %>&pageNum=<%= pageNum + 1 %>"><i class="fa fa-angle-double-right"></i></a></li>
      <% } %>
    </ul>
  </div>
</div>
  </div>
</div>

<!-- 스크립트 -->
<script src="vendor/jquery/jquery.min.js"></script>
<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
<script src="assets/js/custom.js"></script>

</body>
</html>
