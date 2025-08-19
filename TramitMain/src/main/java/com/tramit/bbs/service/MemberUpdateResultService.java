package com.tramit.bbs.service;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import com.tramit.bbs.dao.MemberDao;
import com.tramit.bbs.vo.Member;

public class MemberUpdateResultService implements CommandProcess {
	
	public String requestProcess(
			HttpServletRequest request, HttpServletResponse response) 
					throws ServletException, IOException {		

		request.setCharacterEncoding("utf-8");
		String id = request.getParameter("id");
		String name = request.getParameter("name");		
		String pass = request.getParameter("pass1");
		String emailId = request.getParameter("emailId");
		String mobile1 = request.getParameter("mobile1");		
		String mobile2 = request.getParameter("mobile2");
		String mobile3 = request.getParameter("mobile3");
	
		Member member = new Member();
		member.setId(id);
		member.setName(name);
		member.setPass(pass);
		member.setEmail(emailId);
		member.setMobile(mobile1 + "-" + mobile2 + "-" + mobile3);
 
		MemberDao dao = new MemberDao();
		dao.updateMember(member);	
		
		return "r:boardList.mvc";
	}
}
