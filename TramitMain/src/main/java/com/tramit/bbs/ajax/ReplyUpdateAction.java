package com.tramit.bbs.ajax;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.tramit.bbs.dao.BoardDao;
import com.tramit.bbs.dao.ReviewBoardDao;
import com.tramit.bbs.vo.Reply;

public class ReplyUpdateAction implements AjaxProcess {

	@Override
	public void ajaxProcess(
			HttpServletRequest request, HttpServletResponse response)
					throws ServletException, IOException {		

		String rbNo = request.getParameter("rbNo");
		String replyNo = request.getParameter("replyNo");
		String replyContent = request.getParameter("replyContent");	
		 
		Reply reply = new Reply(Integer.parseInt(replyNo), 
				Integer.parseInt(rbNo), replyContent, null, null);

		ReviewBoardDao rdao = new ReviewBoardDao();
		rdao.updateReply(reply);

		ArrayList<Reply> replyList = rdao.getReplyList(Integer.parseInt(rbNo));

		Gson gson = new Gson();
		
		String result = gson.toJson(replyList);							
		System.out.println("ReplyUpdateAction - result : " + result);

		response.setContentType("application/json; charset=utf-8");
		PrintWriter out = response.getWriter();
		out.println(result);
	}
}
