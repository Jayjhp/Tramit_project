package com.tramit.bbs.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.tramit.bbs.vo.Member;

public class MemberDao {

	private Connection conn;

	private PreparedStatement pstmt;

	private ResultSet rs;

	public int checkMember(String id, String pass) {
		
		String loginSql = "SELECT pass FROM member WHERE id = ?";

		int result = -1;
		String password = "";
		
		try {

			conn = DBManager.getConnection();
			
			pstmt = conn.prepareStatement(loginSql);

			pstmt.setString(1, id);

			rs = pstmt.executeQuery();

			if(rs.next()) {

				password = rs.getString("pass");
			} else {
				return result;
			}

			if(password.equals(pass)) {
				result = 1;				
			} else {
				result = 0;
			}			
		} catch(Exception e) {				
			e.printStackTrace();			
		} finally {		
			DBManager.close(conn, pstmt, rs);
		}		
		return result;
	}

	public void joinMember(Member member) {
		
		String joinSql = 
					"INSERT INTO member VALUES(?, ?, ?, ?, ?, SYSDATE)";
		
		try {

			conn = DBManager.getConnection();
			
			pstmt = conn.prepareStatement(joinSql);

			pstmt.setString(1, member.getId());
			pstmt.setString(2, member.getName());
			pstmt.setString(3, member.getPass());
			pstmt.setString(4, member.getEmail());
			pstmt.setString(5, member.getMobile());

			pstmt.executeUpdate();
			
		} catch(Exception e) {			
			e.printStackTrace();
			
		} finally {

			DBManager.close(conn, pstmt);
		}
	}

	public boolean overlapIdCheck(String id) {
		
		String overlapSql = "SELECT id FROM member Where id = ?";	
		boolean result = false;
		
		try{

			conn = DBManager.getConnection();
			
			pstmt = conn.prepareStatement(overlapSql);

			pstmt.setString(1, id);

			rs = pstmt.executeQuery();

			if(rs.next()) {
				result = true;
			}			
			System.out.println("overlapIdCheck(String id)");
			
		} catch(Exception e) {			
			e.printStackTrace();
			
		} finally{

			DBManager.close(conn, pstmt, rs);
		}
		
		return result;
	}

	public Member getMember(String id) {
		String selectMember = "SELECT * FROM member WHERE id = ?";
		Member member = null;		
		
		try {

			conn = DBManager.getConnection();
			
			pstmt = conn.prepareStatement(selectMember);

			pstmt.setString(1, id);

			rs = pstmt.executeQuery();

			if(rs.next()) {				
				member = new Member();
				member.setId(rs.getString("id"));
				member.setName(rs.getString("name"));
				member.setPass(rs.getString("pass"));
				member.setEmail(rs.getString("email"));
				member.setMobile(rs.getString("mobile"));
				member.setRegDate(rs.getTimestamp("reg_date"));
			}
		} catch(Exception e) {				
			e.printStackTrace();
			
		} finally {			

			DBManager.close(conn, pstmt, rs);
		}		
		return member;
	}
	
	public void updateMember(Member member) {
		
		String joinSql = "UPDATE member SET name=?, pass=?, email=?, mobile=?,"
				+ " reg_date=SYSDATE WHERE id=?";
		
		try {
			conn = DBManager.getConnection();
			
			pstmt = conn.prepareStatement(joinSql);
			
			pstmt.setString(1, member.getName());
			pstmt.setString(2, member.getPass());
			pstmt.setString(3, member.getEmail());
			pstmt.setString(4, member.getMobile());
			pstmt.setString(10, member.getId());

			pstmt.executeUpdate();
			
		} catch(Exception e) {			
			e.printStackTrace();
			
		} finally {
			
			DBManager.close(conn, pstmt);
		}
	}
}
