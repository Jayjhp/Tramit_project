package com.tramit.bbs.service;

import java.util.ArrayList;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import com.tramit.bbs.dao.BoardDao;
import com.tramit.bbs.vo.Board;

public class BoardListService  implements CommandProcess {

	private static final int PAGE_SIZE = 5;

	private static final int PAGE_GROUP = 10;
	
	public String requestProcess(
			HttpServletRequest request, HttpServletResponse response)
					throws ServletException {
		
		String pageNum = request.getParameter("pageNum");
		String type = request.getParameter("type");	
		String keyword = request.getParameter("keyword");	

		if(pageNum == null) {
			pageNum = "1";
		}

		int currentPage = Integer.parseInt(pageNum);
 
		int startRow = currentPage * PAGE_SIZE - (PAGE_SIZE - 1);

		int endRow = startRow + PAGE_SIZE - 1;
				
		int listCount = 0;
		ArrayList<Board> boardList = null;

		BoardDao dao = new BoardDao();

		boolean searchOption = (type == null || type.equals("") 
				|| keyword == null || keyword.equals("")) ? false : true; 
		
		if(! searchOption) {
			listCount = dao.getBoardCount();
			
			boardList = dao.boardList(startRow, endRow);
			
		} else {
			
			listCount = dao.getBoardCount(type, keyword);
			
			
			boardList = dao.searchList(type, keyword, startRow, endRow);
		}
		System.out.println("listCount : " + listCount);
		
		int pageCount = listCount / PAGE_SIZE 
							+ (listCount % PAGE_SIZE == 0 ? 0 : 1);
		
		 int startPage = (currentPage / PAGE_GROUP) * PAGE_GROUP + 1
			- (currentPage % PAGE_GROUP == 0 ? PAGE_GROUP : 0);
		
		int endPage = startPage + PAGE_GROUP - 1;
		
		if(endPage > pageCount) {
			endPage = pageCount;
		}	
		
		request.setAttribute("currentPage", currentPage);
		request.setAttribute("pageCount", pageCount);
		request.setAttribute("startPage", startPage);
		request.setAttribute("endPage", endPage);
		request.setAttribute("pageGroup", PAGE_GROUP);
		request.setAttribute("listCount", listCount);
		request.setAttribute("boardList", boardList);
		request.setAttribute("searchOption", searchOption);
		
		
		if(searchOption) {			
			request.setAttribute("type", type);			
			request.setAttribute("keyword", keyword);
		}

		return "board/boardList";		
	}
}
