package com.tramit.bbs.service;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import com.tramit.bbs.dao.MemberDao;
import com.tramit.bbs.vo.Member;

public class MemberUpdateFormService implements CommandProcess {
	
	public String requestProcess(
			HttpServletRequest request, HttpServletResponse response) 
					throws ServletException, IOException {

		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("id");
 
		MemberDao dao = new MemberDao();
		Member member = dao.getMember(id);

		session.setAttribute("member", member);
		
		return "member/memberUpdateForm";
	}
}
