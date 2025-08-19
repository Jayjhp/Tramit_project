package com.tramit.bbs.service;

import java.io.IOException;

import com.tramit.bbs.dao.MemberDao;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class OverlapIdCheckService implements CommandProcess {
	
	public String requestProcess(
			HttpServletRequest request, HttpServletResponse response) 
					throws ServletException, IOException {
		
		String id = request.getParameter("id");
 
		MemberDao dao = new MemberDao();	
		boolean overlap = dao.overlapIdCheck(id);
 
		request.setAttribute("id", id);
		request.setAttribute("overlap", overlap);

		return "f:/WEB-INF/member/overlapIdCheck.jsp";
	}
}
