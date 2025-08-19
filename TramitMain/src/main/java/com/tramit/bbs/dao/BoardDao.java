package com.tramit.bbs.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;

import com.tramit.bbs.vo.Board;
import com.tramit.bbs.vo.Reply;


public class BoardDao {
	
	private Connection conn;
	
	private PreparedStatement pstmt;

	private ResultSet rs;

	public int getBoardCount(String type, String keyword) {
		System.out.println(type + " - " + keyword);		
		
		String sqlCount = "SELECT COUNT(*) FROM tramitboard WHERE " 	
					+ type + " LIKE '%' || ? || '%'";

		int count = 0;
		
		try{			
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sqlCount);
			pstmt.setString(1,  keyword);			

			rs = pstmt.executeQuery();
			if(rs.next()) {
				count = rs.getInt(1);
			}			
		} catch(Exception e) {			
			e.printStackTrace();
		} finally {			
			DBManager.close(conn, pstmt, rs);
		}
		return count;
	}
	
	public ArrayList<Board> searchList(
		String type, String keyword, int startRow, int endRow) {
	
		String sqlSearchList = "SELECT * FROM (SELECT ROWNUM num, no, title,"
			    + " writer, content, reg_date, read_count, pass, file1, recommend,"
			    + " thank FROM"
				+ " (SELECT * FROM tramitboard WHERE " + type + " LIKE ?"
				+ " ORDER BY no DESC)) WHERE num >= ? AND num <= ?";
		
		ArrayList<Board> boardList = null;
		
		try{			
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sqlSearchList);			
			pstmt.setString(1, "%" + keyword + "%");
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				
				boardList = new ArrayList<Board>();
				
				do {					
					Board board = new Board();
					board.setNo(rs.getInt("no"));
					board.setTitle(rs.getString("title"));
					board.setContent(rs.getString("content"));
					board.setWriter(rs.getString("writer"));							
					board.setRegDate(rs.getTimestamp("reg_date"));
					board.setReadCount(rs.getInt("read_count"));
					board.setPass(rs.getString("pass"));
					board.setFile1(rs.getString("file1"));
					board.setRecommend(rs.getInt("recommend"));
					board.setThank(rs.getInt("thank"));
					
					boardList.add(board);
					
				} while(rs.next());
			}
		} catch(Exception e) {			
			e.printStackTrace();
			
		} finally {
			DBManager.close(conn, pstmt, rs);
		}
		return boardList;
	}

	public int getBoardCount() {
		
		String sqlCount = "SELECT COUNT(*) FROM tramitboard";
		int count = 0;
		
		try{			
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sqlCount);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				count = rs.getInt(1);
			}			
		} catch(Exception e) {			
			e.printStackTrace();
		} finally {			
			DBManager.close(conn, pstmt, rs);
		}
		return count;
	}

	public ArrayList<Board> boardList(int startRow, int endRow) {
	
		String sqlBoardList = "SELECT * FROM (SELECT ROWNUM num,"
				+ " no, title, writer, content, reg_date, read_count, pass, file1,"
				+ " recommend, thank FROM"
				+ " (SELECT * FROM tramitboard ORDER BY no DESC)) "
				+ " WHERE num >= ? AND num <= ?";
		
		ArrayList<Board> boardList = null;
		
		try{			
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sqlBoardList);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				
				boardList = new ArrayList<Board>();
				
				do {					
					Board board = new Board();
					board.setNo(rs.getInt("no"));
					board.setTitle(rs.getString("title"));
					board.setContent(rs.getString("content"));
					board.setWriter(rs.getString("writer"));							
					board.setRegDate(rs.getTimestamp("reg_date"));
					board.setReadCount(rs.getInt("read_count"));
					board.setPass(rs.getString("pass"));
					board.setFile1(rs.getString("file1"));
					board.setRecommend(rs.getInt("recommend"));
					board.setThank(rs.getInt("thank"));
					
					boardList.add(board);
					
				} while(rs.next());
			}
		} catch(Exception e) {			
			e.printStackTrace();
			
		} finally {			
			DBManager.close(conn, pstmt, rs);
		}
		return boardList;
	}

	public Board getBoard(int no, boolean state) {
		String boardSql = "SELECT * FROM tramitboard WHERE no=?";
		String countSql = "UPDATE tramitboard set read_count = read_count + 1 "
				+ "WHERE no = ?";
		Board board = null;
		
		try{
			
			conn = DBManager.getConnection();
			
			DBManager.setAutoCommit(conn, false);

			if(state) {

				pstmt = conn.prepareStatement(countSql);

				pstmt.setInt(1, no);	
				
				pstmt.executeUpdate();				
			}

			pstmt = conn.prepareStatement(boardSql);

			pstmt.setInt(1, no);

			rs = pstmt.executeQuery();
		
			if(rs.next()) {
				board = new Board();				
				board.setNo(rs.getInt("no"));
				board.setTitle(rs.getString("title"));
				board.setContent(rs.getString("content"));
				board.setWriter(rs.getString("writer"));
				board.setRegDate(rs.getTimestamp("reg_date"));
				board.setReadCount(rs.getInt("read_count"));
				board.setPass(rs.getString("pass"));
				board.setFile1(rs.getString("file1"));
				board.setRecommend(rs.getInt("recommend"));
				board.setThank(rs.getInt("thank"));
			}
			
			DBManager.commit(conn);
			
		} catch(Exception e) {

			DBManager.rollback(conn);
			
			System.out.println("BoardDao - getBoard(no, state)");
			e.printStackTrace();			
		} finally {			

			DBManager.close(conn, pstmt, rs);
		}		

		return board;
	}

	public void insertBoard(Board board) {
		
		String sqlInsert = "INSERT INTO tramitboard(no, title, writer, content,"
				+ " reg_date, read_count, pass, file1) "
				+ " VALUES(tramitboard.NEXTVAL, ?, ?, ?, SYSDATE, 0, ?, ?)";
		
		try {			
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sqlInsert);
			pstmt.setString(1, board.getTitle());
			pstmt.setString(2, board.getWriter());			
			pstmt.setString(3, board.getContent());
			pstmt.setString(4, board.getPass());
			pstmt.setString(5, board.getFile1());
			pstmt.executeUpdate();
			
		} catch(Exception e) {
			e.printStackTrace();			
		} finally {			
			DBManager.close(conn, pstmt, rs);
		}
	}

	public boolean isPassCheck(int no, String pass) {
		boolean isPass = false;
		String sqlPass = "SELECT pass FROM tramitboard WHERE no=?";
		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sqlPass);
			pstmt.setInt(1, no);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				isPass = rs.getString(1).equals(pass); 
			}
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn, pstmt, rs);
		} 
		return isPass;
	}

	public void updateBoard(Board board) {
		
		String fileUpdate = board.getFile1() != null ? ", file1=?" : "";
		String sqlUpdate = "UPDATE tramitboard set title=?, writer=?, content=?,"				
				+ " reg_date=SYSDATE" + fileUpdate + " WHERE no=?";
		
		try {			
			conn = DBManager.getConnection();			
			pstmt = conn.prepareStatement(sqlUpdate);
			pstmt.setString(1, board.getTitle());
			pstmt.setString(2, board.getWriter());			
			pstmt.setString(3, board.getContent());

			if(board.getFile1() != null) {
				pstmt.setString(4, board.getFile1());
				pstmt.setInt(5, board.getNo());
			} else {
				pstmt.setInt(4,  board.getNo());
			}
			
			pstmt.executeUpdate();
			
		} catch(Exception e) {
			e.printStackTrace();			
		} finally {			
			DBManager.close(conn, pstmt);
		}
	}

	public void deleteBoard(int no) {
		
		String sqlDelete = "DELETE FROM tramitboard WHERE no=?"; 
		try {			
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sqlDelete);
			pstmt.setInt(1, no);
			pstmt.executeUpdate();
			
		} catch(Exception e) {
			e.printStackTrace();			
		} finally {			
			DBManager.close(conn, pstmt, rs);
		}
	}

	public HashMap<String, Integer> getRecommend(int no, String strThank) {		
		
		HashMap<String, Integer> map = null;
		
		String addRecommendSql = "UPDATE tramitboard set"
				+ " recommend=recommend + 1 WHERE no=?";		
		String addThankSql ="UPDATE tramitboard set thank=thank + 1 WHERE no=?";		
		String selectResultSql = "SELECT recommend, thank FROM tramitboard WHERE no=?";
		
		try {

			conn = DBManager.getConnection();

			DBManager.setAutoCommit(conn, false);

			if(strThank.equals("commend")) {
			
				pstmt = conn.prepareStatement(addRecommendSql);

			} else if(strThank.equals("thank")){

				pstmt = conn.prepareStatement(addThankSql);
			}

			pstmt.setInt(1, no);
			pstmt.executeUpdate();

			pstmt = conn.prepareStatement(selectResultSql);
			pstmt.setInt(1, no);
			rs = pstmt.executeQuery();
			

			if(rs.next()) {
				map = new HashMap<String, Integer>();
				map.put("recommend", rs.getInt(1));
				map.put("thank", rs.getInt(2));
			}

			DBManager.commit(conn);
		} catch(Exception e) {			
 
			DBManager.rollback(conn);
			System.out.println("BoardDao - getRecommend(no, isThank)");
			e.printStackTrace();
			
		} finally {

			DBManager.close(conn, pstmt, rs);
		}		
		return map;
	}	
	
}






