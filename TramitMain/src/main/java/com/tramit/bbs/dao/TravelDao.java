package com.tramit.bbs.dao;

import java.sql.*;
import java.util.*;

import com.tramit.bbs.vo.Restaurants;
import com.tramit.bbs.vo.Travel;

/**
 * TravelDao 클래스는 데이터베이스와의 상호작용을 담당합니다.
 * 여행지 정보를 조회하고 페이징을 적용하여 데이터를 반환하는 역할을 합니다.
 */
public class TravelDao {

    private static final String URL = "jdbc:oracle:thin:@localhost:1521:xe";
    private static final String USER = "tramit"; // DB 사용자 이름
    private static final String PASSWORD = "1234"; // DB 비밀번호

    static {
        try {
            Class.forName("oracle.jdbc.OracleDriver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }

    public List<Travel> getTravelByCategory(String category, int page, int pageSize) {
        List<Travel> list = new ArrayList<>();
        int start = (page - 1) * pageSize + 1;
        int end = page * pageSize;

        try (Connection conn = DriverManager.getConnection(URL, USER, PASSWORD)) {
            String sql = "SELECT * FROM ("
                       + " SELECT ROWNUM rnum, a.* FROM ("
                       + "   SELECT * FROM TRAVEL WHERE category = ? ORDER BY id ASC"
                       + " ) a WHERE ROWNUM <= ?"
                       + ") WHERE rnum >= ?";
            PreparedStatement pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, category); // 카테고리 필터링 적용
            pstmt.setInt(2, end);
            pstmt.setInt(3, start);
            ResultSet rs = pstmt.executeQuery();

            while (rs.next()) {
                list.add(new Travel(
                    rs.getInt("id"),
                    rs.getString("name"),
                    rs.getString("description"),
                    rs.getString("category"),
                    rs.getString("image_url"),
                    rs.getDouble("rating")
                ));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
    
    public List<Travel> searchTravelByName(String name) {
        List<Travel> list = new ArrayList<>();
        String sql = "SELECT * FROM TRAVEL WHERE name LIKE ? ORDER BY rating DESC";

        try (Connection conn = DriverManager.getConnection(URL, USER, PASSWORD);
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setString(1, "%" + name + "%");
            ResultSet rs = pstmt.executeQuery();

            while (rs.next()) {
                list.add(new Travel(
                    rs.getInt("id"),
                    rs.getString("name"),
                    rs.getString("description"),
                    rs.getString("category"),
                    rs.getString("image_url"),
                    rs.getDouble("rating")
                ));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;

    }

    public int getTotalCount(String category) {
        int count = 0;
        try (Connection conn = DriverManager.getConnection(URL, USER, PASSWORD)) {
            String sql = (category == null || category.isEmpty())
                       ? "SELECT COUNT(*) FROM TRAVEL"
                       : "SELECT COUNT(*) FROM TRAVEL WHERE category = ?";
            
            PreparedStatement pstmt = conn.prepareStatement(sql);
            if (category != null && !category.isEmpty()) {
                pstmt.setString(1, category);
            }
            
            ResultSet rs = pstmt.executeQuery();
            if (rs.next()) {
                count = rs.getInt(1);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return count;
    }
}