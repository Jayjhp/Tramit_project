package com.tramit.bbs.service;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import com.tramit.bbs.dao.BoardDao;
import com.tramit.bbs.vo.Board;
import com.tramit.bbs.vo.Reply;

public class BoardDetailService implements CommandProcess {
	
	public String requestProcess(
			HttpServletRequest request, HttpServletResponse response)
					throws ServletException, IOException {

		HttpSession session = request.getSession();
		
		boolean isLogin = session.getAttribute("isLogin") != null ? 
				(Boolean) session.getAttribute("isLogin") : false;
		
		if(! isLogin) {
		
			response.setContentType("text/html; charset=utf-8");
			PrintWriter out = response.getWriter();
			
			out.println("<script>");
			out.println("	alert('회원 전용 서비스입니다.\\n회원 로그인을 해 주세요');");
			out.println("	location.href='loginForm.mvc';");
			out.println("</script>");
		
			return null;
		}
		
		String no = request.getParameter("no");	
		String pageNum = request.getParameter("pageNum");
		String type = request.getParameter("type");	
		String keyword = request.getParameter("keyword");	
		
		if(no == null || no.equals("") || pageNum == null || pageNum.equals("")) {
		
			response.setContentType("text/html; charset=utf-8");
			PrintWriter out = response.getWriter();
			
			out.println("<script>");
			out.println("	alert('정상적인 접근이 아닙니다.');");
			out.println("	history.back();");
			out.println("</script>");
		
			return null;
		}
		
		boolean searchOption = (type == null || type.equals("") 
				|| keyword == null || keyword.equals("")) ? false : true; 		
		
		BoardDao dao = new BoardDao();
		Board board = dao.getBoard(Integer.valueOf(no), true);
				
		request.setAttribute("board", board);
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("searchOption", searchOption);
		
		if(searchOption) {			
			request.setAttribute("type", type);			
			request.setAttribute("keyword", keyword);
		}
		
		return "board/boardDetail";
	}
}
