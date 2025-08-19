package com.tramit.bbs.service;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class LogoutService implements CommandProcess {

	@Override
	public String requestProcess(
			HttpServletRequest request, HttpServletResponse response)
					throws ServletException, IOException {

		HttpSession session = request.getSession();	
		session.invalidate();
	
		return "r:home.mvc";
	}
}
