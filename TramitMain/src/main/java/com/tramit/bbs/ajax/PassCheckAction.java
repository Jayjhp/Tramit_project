package com.tramit.bbs.ajax;

import java.io.IOException;
import java.io.PrintWriter;

import com.tramit.bbs.dao.MemberDao;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class PassCheckAction implements AjaxProcess {

	@Override
	public void ajaxProcess(
			HttpServletRequest request, HttpServletResponse response)
					throws ServletException, IOException {
		
		String id = request.getParameter("id");
		String pass = request.getParameter("pass");

		response.setContentType("application/json; charset=utf-8");
		PrintWriter out = response.getWriter();

		StringBuilder sb = new StringBuilder();
		
		if(id == null || pass == null) {
			
			sb.append("<script>");
			sb.append("	alert('정상적인 접근이 아닙니다.');");
			sb.append("</script>");
	
			out.println(sb.toString());
			return;
		}

		MemberDao dao = new MemberDao();		
		int result = dao.checkMember(id, pass);
		
		sb.append("{ \"result\" : \"" + result + "\" }");		
		out.println(sb.toString());
	}
}
