package com.tramit.bbs.ajax;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.tramit.bbs.dao.BoardDao;
import com.tramit.bbs.dao.ReviewBoardDao;

public class RecommendAction implements AjaxProcess {
	
	public void ajaxProcess(
			HttpServletRequest request, HttpServletResponse response)
					throws ServletException, IOException {
		
		String recommend = request.getParameter("recommend");
		String no = request.getParameter("no");		
				
		HashMap<String, Integer> map = null;
		ReviewBoardDao dao = new ReviewBoardDao();
		map = dao.getRecommend(Integer.parseInt(no), recommend);

		Gson gson = new Gson();

		String result = gson.toJson(map);
							
		System.out.println("RecommendAction - result : " + result);

		response.setContentType("text/html; charset=utf-8");		
		PrintWriter out = response.getWriter();
		out.println(result);
	}
}
