<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="com.tramit.bbs.service.KakaoLogin" %>
<%@ page import="org.json.JSONObject" %>

<%
    String userId = request.getParameter("userId"); // 로그인 성공 후 사용자 ID
    if (userId != null) {
        session.setAttribute("userId", userId); // 세션에 사용자 ID 저장
        response.sendRedirect("welcome.jsp"); // 로그인 성공 시 리다이렉트
    } else {
        response.sendRedirect("loginForm.jsp?error=1"); // 로그인 실패 시 다시 로그인 페이지로
    }
%>