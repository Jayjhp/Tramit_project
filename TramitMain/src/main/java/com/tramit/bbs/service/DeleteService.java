package com.tramit.bbs.service;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;

import com.tramit.bbs.dao.BoardDao;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class DeleteService  implements CommandProcess {
	public String requestProcess(
			HttpServletRequest request, HttpServletResponse response) 
					throws ServletException, IOException {	
		
		String sNo = request.getParameter("no");
		String pass = request.getParameter("pass");
		String pageNum = request.getParameter("pageNum");
		String type = request.getParameter("type");
		String keyword = request.getParameter("keyword");

		if(sNo == null || sNo.equals("") || pass == null || pass.equals("")
			|| pageNum == null || pageNum.equals("")) {
			
			response.setContentType("text/html; charset=utf-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("	alert('정상적인 접근이 아닙니다.');");
			out.println("	history.back();");
			out.println("</script>");
			return null;
		}
		
		BoardDao dao = new BoardDao();
		int no = Integer.parseInt(sNo);
		boolean isPassCheck = dao.isPassCheck(no, pass);
		
		if(! isPassCheck) {

			response.setContentType("text/html; charset=utf-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("	alert('비밀번호가 맞지 않습니다.');");
			out.println("	history.back();");
			out.println("</script>");
			return null;
		}
		
		dao.deleteBoard(no);	
		
		boolean searchOption = (type == null || type.equals("") 
				|| keyword == null || keyword.equals("")) ? false : true; 	
		
		String url = "boardList.mvc?pageNum=" + pageNum;

		if(searchOption) {
		
			keyword = URLEncoder.encode(keyword, "utf-8");			
			url += "&type=" + type + "&keyword=" + keyword; 
		}

		return "r:" + url;
	}
}
