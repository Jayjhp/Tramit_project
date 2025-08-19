<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    String userId = (String) session.getAttribute("userId");

    if (userId == null) {
        response.sendRedirect("loginForm.jsp"); // 로그인 상태가 아니면 로그인 페이지로 이동
    } else {
%>
    <p>현재 로그인 중입니다. 사용자 ID: <%= userId %></p>
<%
    }
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>