package com.tramit.bbs.dao;

import java.sql.*;
import java.util.ArrayList;

import com.tramit.bbs.vo.Question;

public class QuestionDao {

    private Connection conn;
    private PreparedStatement pstmt;
    private ResultSet rs;

    public int getQuestionCount(String type, String keyword) {
        int count = 0;
        String sql = "SELECT COUNT(*) FROM questionboard";
        if (type != null && keyword != null && !type.isEmpty() && !keyword.isEmpty()) {
            sql += " WHERE " + type + " LIKE '%' || ? || '%'";
        }
        try {
            conn = DBManager.getConnection();
            pstmt = conn.prepareStatement(sql);
            if (type != null && keyword != null && !type.isEmpty() && !keyword.isEmpty()) {
                pstmt.setString(1, keyword);
            }
            rs = pstmt.executeQuery();
            if (rs.next()) {
                count = rs.getInt(1);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBManager.close(conn, pstmt, rs);
        }

        return count;
    }

    // 게시글 목록 조회 (페이징 + 검색 포함)
    public ArrayList<Question> getQuestionList(String type, String keyword, int startRow, int endRow) {
        ArrayList<Question> list = new ArrayList<>();

        String sql = "SELECT * FROM ("
                   + "  SELECT ROWNUM rnum, q.* FROM ("
                   + "    SELECT * FROM questionboard";

        if (type != null && keyword != null && !type.isEmpty() && !keyword.isEmpty()) {
            sql += " WHERE " + type + " LIKE ? ";
        }

        sql += " ORDER BY reg_date DESC"
             + "  ) q"
             + ") WHERE rnum BETWEEN ? AND ?";

        try {
            conn = DBManager.getConnection();
            pstmt = conn.prepareStatement(sql);

            int idx = 1;
            if (type != null && keyword != null && !type.isEmpty() && !keyword.isEmpty()) {
                pstmt.setString(idx++, "%" + keyword + "%");
            }
            pstmt.setInt(idx++, startRow);
            pstmt.setInt(idx, endRow);

            rs = pstmt.executeQuery();
            while (rs.next()) {
                Question q = new Question();
                q.setId(rs.getInt("id"));
                q.setTitle(rs.getString("title"));
                q.setWriter(rs.getString("writer"));
                q.setContent(rs.getString("content"));
                q.setPassword(rs.getString("password"));
                q.setRegDate(rs.getTimestamp("reg_date"));
                q.setReadCount(rs.getInt("read_count"));
                list.add(q);
            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBManager.close(conn, pstmt, rs);
        }

        return list;
    }

    // 게시글 상세 조회
    public Question getQuestion(int id) {
        Question q = null;
        String sql = "SELECT * FROM questionboard WHERE id = ?";

        try {
            conn = DBManager.getConnection();
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, id);
            rs = pstmt.executeQuery();

            if (rs.next()) {
                q = new Question();
                q.setId(rs.getInt("id"));
                q.setTitle(rs.getString("title"));
                q.setWriter(rs.getString("writer"));
                q.setContent(rs.getString("content"));
                q.setPassword(rs.getString("password"));
                q.setRegDate(rs.getTimestamp("reg_date"));
            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBManager.close(conn, pstmt, rs);
        }

        return q;
    }

    // 게시글 등록
    public int insertQuestion(Question q) {
        int result = 0;
        String sql = "INSERT INTO questionboard (id, title, writer, content, password, reg_date) "
                   + "VALUES (questionboard_seq.NEXTVAL, ?, ?, ?, ?, SYSDATE)";

        try {
            conn = DBManager.getConnection();
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, q.getTitle());
            pstmt.setString(2, q.getWriter());
            pstmt.setString(3, q.getContent());
            pstmt.setString(4, q.getPassword());

            result = pstmt.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBManager.close(conn, pstmt, null);
        }

        return result;
    }

    // 비밀번호 확인
    public boolean checkPassword(int id, String password) {
        boolean result = false;
        String sql = "SELECT password FROM questionboard WHERE id = ?";

        try {
            conn = DBManager.getConnection();
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, id);
            rs = pstmt.executeQuery();

            if (rs.next()) {
                result = rs.getString("password").equals(password);
            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBManager.close(conn, pstmt, rs);
        }

        return result;
    }
}
