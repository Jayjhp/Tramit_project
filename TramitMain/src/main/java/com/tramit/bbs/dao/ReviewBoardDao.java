package com.tramit.bbs.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;

import com.tramit.bbs.vo.Reply;
import com.tramit.bbs.vo.ReviewBoard;

public class ReviewBoardDao {

	private Connection conn;

	private PreparedStatement pstmt;

	private ResultSet rs;

	public int getReviewBoardCount(String type, String keyword) {
		System.out.println(type + " - " + keyword);
		
		String sqlCount = "SELECT COUNT(*) FROM reviewboard WHERE " 	
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

	public ArrayList<ReviewBoard> searchList(
			String type, String keyword, int startRow, int endRow) {
		
		String sqlSearchList = "SELECT * FROM (SELECT ROWNUM num, r_no, r_title,"
			    + " r_writer, r_content, r_reg_date, r_read_count, r_pass, r_file1, r_rating, r_category, recommend,"
			    + " thank FROM"
				+ " (SELECT * FROM reviewboard WHERE " + type + " LIKE ?"
				+ " ORDER BY r_no DESC)) WHERE num >= ? AND num <= ?";
		
		ArrayList<ReviewBoard> reviewBoardList = null;
		
		try{			
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sqlSearchList);			
			pstmt.setString(1, "%" + keyword + "%");
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				
				reviewBoardList = new ArrayList<ReviewBoard>();
				
				do {					
					ReviewBoard rb = new ReviewBoard();
					rb.setNo(rs.getInt("r_no"));
					rb.setTitle(rs.getString("r_title"));
					rb.setContent(rs.getString("r_content"));
					rb.setWriter(rs.getString("r_writer"));							
					rb.setRegDate(rs.getTimestamp("r_reg_date"));
					rb.setReadCount(rs.getInt("r_read_count"));
					rb.setPass(rs.getString("r_pass"));
					rb.setFile1(rs.getString("r_file1"));
					rb.setRating(rs.getInt("r_rating"));
					rb.setCategory(rs.getString("r_category"));
					rb.setRecommend(rs.getInt("recommend"));
					rb.setThank(rs.getInt("thank"));
					
					reviewBoardList.add(rb);
					
				} while(rs.next());
			}
		} catch(Exception e) {			
			e.printStackTrace();
			
		} finally {
			DBManager.close(conn, pstmt, rs);
		}
		return reviewBoardList;
	}

	public int getReviewBoardCount() {
		
		String sqlCount = "SELECT COUNT(*) FROM reviewboard";
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

	public ArrayList<ReviewBoard> reviewBoardList(int startRow, int endRow) {
		
		String sqlBoardList = "SELECT * FROM (SELECT ROWNUM num,"
				+ " r_no, r_title, r_writer, r_content, r_reg_date, r_read_count, r_pass, r_file1,"
				+ " r_rating, r_category, recommend, thank FROM"
				+ " (SELECT * FROM reviewboard ORDER BY r_no DESC)) "
				+ " WHERE num >= ? AND num <= ?";
		
		ArrayList<ReviewBoard> reviewBoardList = null;
		
		try{			
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sqlBoardList);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				
				reviewBoardList = new ArrayList<ReviewBoard>();
				
				do {					
					ReviewBoard rb = new ReviewBoard();
					rb.setNo(rs.getInt("r_no"));
					rb.setTitle(rs.getString("r_title"));
					rb.setContent(rs.getString("r_content"));
					rb.setWriter(rs.getString("r_writer"));							
					rb.setRegDate(rs.getTimestamp("r_reg_date"));
					rb.setReadCount(rs.getInt("r_read_count"));
					rb.setPass(rs.getString("r_pass"));
					rb.setFile1(rs.getString("r_file1"));
					rb.setRating(rs.getInt("r_rating"));
					rb.setCategory(rs.getString("r_category"));
					rb.setRecommend(rs.getInt("recommend"));
					rb.setThank(rs.getInt("thank"));
					
					reviewBoardList.add(rb);
					
				} while(rs.next());
			}
		} catch(Exception e) {			
			e.printStackTrace();
			
		} finally {			
			DBManager.close(conn, pstmt, rs);
		}
		return reviewBoardList;
	}

	public ReviewBoard getReviewBoard(int no, boolean state) {
		String boardSql = "SELECT * FROM reviewboard WHERE r_no=?";
		String countSql = "UPDATE reviewboard set r_read_count = r_read_count + 1 "
				+ "WHERE r_no = ?";
		ReviewBoard rb = null;
		
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
				rb = new ReviewBoard();				
				rb.setNo(rs.getInt("r_no"));
				rb.setTitle(rs.getString("r_title"));
				rb.setContent(rs.getString("r_content"));
				rb.setWriter(rs.getString("r_writer"));
				rb.setRegDate(rs.getTimestamp("r_reg_date"));
				rb.setReadCount(rs.getInt("r_read_count"));
				rb.setPass(rs.getString("r_pass"));
				rb.setFile1(rs.getString("r_file1"));
				rb.setRating(rs.getInt("r_rating"));
				rb.setCategory(rs.getString("r_category"));
				rb.setRecommend(rs.getInt("recommend"));
				rb.setThank(rs.getInt("thank"));
			}
			
			DBManager.commit(conn);
			
		} catch(Exception e) {
			DBManager.rollback(conn);
			
			System.out.println("ReviewBoardDao - getReviewBoard(r_no, state)");
			e.printStackTrace();			
		} finally {			

			DBManager.close(conn, pstmt, rs);
		}		

		return rb;
	}

	public void insertReviewBoard(ReviewBoard rb) {

	    String sqlInsert = "INSERT INTO reviewboard(r_no, r_title, r_writer, r_content,"
	            + " r_reg_date, r_read_count, r_pass, r_file1, r_rating, r_category) "
	            + " VALUES(reviewboard_seq.NEXTVAL, ?, ?, ?, SYSDATE, 0, ?, ?, ?, ?)";

	    try {
	        conn = DBManager.getConnection();
	        pstmt = conn.prepareStatement(sqlInsert);
	        pstmt.setString(1, rb.getTitle());
	        pstmt.setString(2, rb.getWriter());
	        pstmt.setString(3, rb.getContent());
	        pstmt.setString(4, rb.getPass());
	        pstmt.setString(5, rb.getFile1());
	        pstmt.setInt(6, rb.getRating());
	        pstmt.setString(7, rb.getCategory());
	        pstmt.executeUpdate();

	    } catch(Exception e) {
	        e.printStackTrace();
	    } finally {
	        DBManager.close(conn, pstmt, rs);
	    }
	}

	public boolean isPassCheck(int no, String pass) {
		boolean isPass = false;
		String sqlPass = "SELECT r_pass FROM reviewboard WHERE r_no=?";
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

	public void updateReviewBoard(ReviewBoard rb) {
		
		String fileUpdate = rb.getFile1() != null ? ", r_file1=?" : "";
		String sqlUpdate = "UPDATE reviewboard set r_title=?, r_writer=?, r_content=?,"				
				+ " r_reg_date=SYSDATE" + fileUpdate + " WHERE r_no=?";
		
		try {			
			conn = DBManager.getConnection();			
			pstmt = conn.prepareStatement(sqlUpdate);
			pstmt.setString(1, rb.getTitle());
			pstmt.setString(2, rb.getWriter());			
			pstmt.setString(3, rb.getContent());

			if(rb.getFile1() != null) {
				pstmt.setString(4, rb.getFile1());
				pstmt.setInt(5, rb.getNo());
			} else {
				pstmt.setInt(4,  rb.getNo());
			}
			
			pstmt.executeUpdate();
			
		} catch(Exception e) {
			e.printStackTrace();			
		} finally {			
			DBManager.close(conn, pstmt);
		}
	}
	
	public void deleteReviewBoard(int no) {
		
		String sqlDelete = "DELETE FROM reviewboard WHERE r_no=?"; 
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
	
	
	public ArrayList<Reply> getReplyList(int bbsNo) {
		
		String replyListSql = "SELECT * FROM reply WHERE reviewB_no = ?"
				+ " ORDER BY no DESC";
		
		Reply reply = null;
		ArrayList<Reply> replyList = null;
		
		try {			
	
			conn = DBManager.getConnection();
			
			pstmt = conn.prepareStatement(replyListSql);			
			pstmt.setInt(1, bbsNo);			
			rs = pstmt.executeQuery();
			
			replyList = new ArrayList<Reply>();
			
			while(rs.next()) {

				reply = new Reply();				
				reply.setNo(rs.getInt("no"));
				reply.setReviewBno(rs.getInt("reviewB_no"));
				reply.setReplyContent(rs.getString("reply_content"));
				reply.setReplyWriter(rs.getString("reply_writer"));
				reply.setRegDate(rs.getTimestamp("reg_date"));				
				replyList.add(reply);
			}			
		} catch(Exception e) {
			System.out.println("ReviewBoardDao - replyList(no)");
			e.printStackTrace();				
		} finally {				
			DBManager.close(conn, pstmt, rs);
		}			
		return replyList;
	}
	
	public HashMap<String, Integer> getRecommend(int no, String strThank) {		
		
		HashMap<String, Integer> map = null;
		
		String addRecommendSql = "UPDATE reviewboard set"
				+ " recommend=recommend + 1 WHERE r_no=?";		
		String addThankSql ="UPDATE reviewboard set thank=thank + 1 WHERE r_no=?";		
		String selectResultSql = "SELECT recommend, thank FROM reviewboard WHERE r_no=?";
		
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
			System.out.println("ReviewBoardDao - getRecommend(r_no, isThank)");
			e.printStackTrace();
			
		} finally {

			DBManager.close(conn, pstmt, rs);
		}		
		return map;
	}

	public void addReply(Reply reply) {
		
		String replyInsertSql = "INSERT INTO reply"
				+ " VALUES(reply_seq.NEXTVAL, ?, ?, ?, SYSDATE)";
		
		try {			

			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(replyInsertSql);
			
			pstmt.setInt(1, reply.getReviewBno());
			pstmt.setString(2, reply.getReplyContent());
			pstmt.setString(3, reply.getReplyWriter());			

			pstmt.executeUpdate();
		} catch(Exception e) {
			System.out.println("ReviewBoardDao - addReply(reply)");
			e.printStackTrace();	
		} finally {			

			DBManager.close(conn, pstmt, rs);
		}
	}	

	public void updateReply(Reply reply) {
		
		String replyUpdateSql = "UPDATE reply SET reply_content=?,"
				+ " reg_date=SYSDATE WHERE no=?";
		
		try {			

			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(replyUpdateSql);

			pstmt.setString(1, reply.getReplyContent());
			pstmt.setInt(2, reply.getNo());			

			pstmt.executeUpdate();
		} catch(Exception e) {
			System.out.println("ReviewBoardDao - updateReply(reply)");
			e.printStackTrace();			
		} finally {			

			DBManager.close(conn, pstmt, rs);
		}
	}

	public void deleteReply(Reply reply) {
		
		String replyDeleteSql = "DELETE FROM reply WHERE no = ?";
		
		try {			
		
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(replyDeleteSql);
		
			pstmt.setInt(1, reply.getNo());					
		
			pstmt.executeUpdate();
		} catch(Exception e) {
			System.out.println("ReviewBoardDao - deleteReply(reply)");
			e.printStackTrace();			
		} finally {			
		
			DBManager.close(conn, pstmt);
		}
	}	
}






