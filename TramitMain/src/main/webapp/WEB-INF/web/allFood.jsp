<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="com.tramit.bbs.service.RestaurantsService" %>
<%@ page import="com.tramit.bbs.vo.Restaurants" %>
<%@ page import="java.util.List" %>

<%
    // URL에서 카테고리 값 받기 (예: koreanFood.jsp → category=한식)
    String category = request.getParameter("category");
    if (category == null) category = "한식"; // 기본값 설정

    int pageNum = request.getParameter("pageNum") != null ? Integer.parseInt(request.getParameter("pageNum")) : 1;
    int pageSize = 6;

    RestaurantsService service = new RestaurantsService();
    List<Restaurants> restaurants = service.getPagedRestaurantsByCategory(category, pageNum, pageSize);
    int totalPages = service.getTotalPages(category, pageSize);
%>

<html lang="ko">
<head>
  <meta charset="UTF-8">
  <title>맛집 리스트</title>
  <link rel="stylesheet" href="your-styles.css">
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
      <div class="custom-search-group-small d-flex align-items-center">
        <input type="text" class="form-control border-0" placeholder="맛집 검색..." />
        <button class="btn btn-outline-secondary border-0" type="button">
          <i class="bi bi-search"></i>
        </button>
      </div>
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
          <a href="<%= r.getImageUrl() %>">
            <img src="<%= r.getImageUrl() %>" alt="<%= r.getName() %>">
          </a>
          <div class="down-content">
            <h4><%= r.getName() %></h4>
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
