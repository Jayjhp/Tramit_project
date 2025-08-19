package com.tramit.bbs.service;

import java.io.File;
import java.io.IOException;
import java.util.Collection;
import java.util.UUID;

import com.tramit.bbs.dao.BoardDao;
import com.tramit.bbs.vo.Board;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

public class BoardWriteService  implements CommandProcess {
	
	public String requestProcess(HttpServletRequest request, 
			HttpServletResponse response) throws ServletException, IOException {
		 
		Board board = new Board();

		System.out.println(System.getProperty("java.io.tmpdir"));

		request.setCharacterEncoding("UTF-8");
		String contentType = request.getContentType();

		if(contentType != null && contentType.toLowerCase().startsWith("multipart/")) {
 
			Collection<Part> parts = request.getParts();
			
			for(Part part : parts) {

				String partHeader = part.getHeader("Content-Disposition");
				System.out.println(partHeader);
				System.out.printf("파라미터 : %s, contentType : %s, size : %dByte, \n", 
						part.getName(), part.getContentType(), part.getSize());
				
				if(partHeader.contains("filename=")) {
					
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
					
				} else {
					String paramName = part.getName();
					String paramValue = request.getParameter(paramName);
 
					if(paramName.equals("title")) {
						board.setTitle(paramValue);
						
					} else if(paramName.equals("writer")) {
						board.setWriter(paramValue);
						
					} else if(paramName.equals("pass")) {
						board.setPass(paramValue);
						
					} else if(paramName.equals("content")) {
						board.setContent(paramValue);						
					}					
				}
			}			
			System.out.println(board.getTitle() + ", " + board.getWriter());			
			
		} else {
			System.out.println("폼에서 전송된 요청이 mutipart/form-data가 아님");
		}	
		
		BoardDao dao = new BoardDao();
		dao.insertBoard(board);
	
		return "r:boardList.mvc";		
	}
}
