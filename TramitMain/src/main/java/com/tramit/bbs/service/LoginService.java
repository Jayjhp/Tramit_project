package com.tramit.bbs.service;

import java.io.IOException;
import java.io.PrintWriter;

import com.tramit.bbs.dao.MemberDao;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class LoginService implements CommandProcess {

	@Override
	public String requestProcess(
			HttpServletRequest request, HttpServletResponse response)
					throws ServletException, IOException {
		
		String id = request.getParameter("id");
		String pass = request.getParameter("pass");
 
		MemberDao dao = new MemberDao();
		int checkLogin = dao.checkMember(id, pass);

		if(checkLogin == -1) { 		

			response.setContentType("text/html; charset=utf-8");
			PrintWriter out = response.getWriter();	
			out.println("<script>");
			out.println("	alert('" + id + "는 가입되지 않은 아이디 입니다.');");
			out.println("	window.history.back();");
			out.println("</script>");
			return null;
		
		
		} else if(checkLogin == 0) {	
			response.setContentType("text/html; charset=utf-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("	alert('비밀번호가 맞지 않습니다.');");
			out.println("	window.history.back();");
			out.println("</script>");
			return null;		
		
		} else if(checkLogin == 1) {
			HttpSession session = request.getSession();
			session.setAttribute("id", id);
			session.setAttribute("isLogin", true);
		}

		return "r:home.mvc";
	}
}
