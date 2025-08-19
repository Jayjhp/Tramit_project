package com.tramit.bbs.service;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;
import java.util.UUID;

import com.tramit.bbs.dao.BoardDao;
import com.tramit.bbs.vo.Board;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

public class UpdateService  implements CommandProcess {
	
	public String requestProcess(
			HttpServletRequest request, HttpServletResponse response) 
					throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
			
		String sNo = request.getParameter("no");		
		String pass = request.getParameter("pass");
		String pageNum = request.getParameter("pageNum");

		if(sNo == null || sNo.equals("") || pass == null || pass.equals("")
			|| pageNum == null || pageNum.equals("")) {				
			response.setContentType("text/html; charset=utf-8");
			PrintWriter out = response.getWriter();				
			out.println("<script>");
			out.println("	alert('잘못된 접근입니다.');");
			out.println("	history.back();");
			out.println("</script>");
			return null;
		}		

		BoardDao dao = new BoardDao();	
		
		boolean isPassCheck = dao.isPassCheck(Integer.parseInt(sNo), pass);
		if(! isPassCheck) {

			StringBuilder sb = new StringBuilder();
			sb.append("<script>");
			sb.append("	alert('비밀번호가 맞지 않습니다.');");
			sb.append("	history.back();");
			sb.append("</script>");

			response.setContentType("text/html; charset=utf-8");
			PrintWriter out = response.getWriter();
			out.println(sb.toString());			
			return null;
		}

		Board board = new Board();
		String title = request.getParameter("title");
		String writer = request.getParameter("writer");		
		String content = request.getParameter("content");
		
		board.setNo(Integer.parseInt(sNo));
		board.setTitle(title);
		board.setWriter(writer);
		board.setPass(pass);
		board.setContent(content);

		Part part = request.getPart("file1");

		if(part.getSize() > 0) {

			UUID uid = UUID.randomUUID();
			String saveName = uid.toString() + "_" + part.getSubmittedFileName();

			File parentFile = 
					(File) request.getServletContext().getAttribute("parentFile");
			String savePath = parentFile.getAbsolutePath() + File.separator + saveName;

			part.write(savePath);

			part.delete();
			
			board.setFile1(saveName);
			
		} else {
			System.out.println("파일이 업로드 되지 않음");
		}
		
		dao.updateBoard(board);
		
		String type = request.getParameter("type");	
		String keyword = request.getParameter("keyword");

		boolean searchOption = (type == null || type.equals("") 
				|| keyword == null || keyword.equals("")) ? false : true; 	

		String url = "boardList.mvc?pageNum=" + pageNum;

		if(searchOption) {

			keyword = URLEncoder.encode(keyword, "utf-8");
			url += "&type=" + type + "&keyword=" + keyword;
		}
		System.out.println("keyword : " + keyword);
		System.out.println("url : " + url);

		return "r:" + url;	
	}
}