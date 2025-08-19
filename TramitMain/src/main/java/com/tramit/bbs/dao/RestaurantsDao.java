package com.tramit.bbs.dao;

import java.sql.*;
import java.util.*;

import com.tramit.bbs.vo.Restaurants;

/**
 * RestaurantsDao 클래스는 데이터베이스와의 상호작용을 담당합니다.
 * 맛집 정보를 조회하고 페이징을 적용하여 데이터를 반환하는 역할을 합니다.
 */
public class RestaurantsDao {

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

    public List<Restaurants> getRestaurantsByCategory(String category, int page, int pageSize) {
        List<Restaurants> list = new ArrayList<>();
        int start = (page - 1) * pageSize + 1;
        int end = page * pageSize;

        try (Connection conn = DriverManager.getConnection(URL, USER, PASSWORD)) {
            String sql = "SELECT * FROM (" +
                         " SELECT ROWNUM rnum, a.* FROM (" +
                         "   SELECT * FROM restaurants WHERE category = ? ORDER BY id ASC" +
                         " ) a WHERE ROWNUM <= ?" +
                         ") WHERE rnum >= ?";
            PreparedStatement pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, category); // 카테고리 필터링 적용
            pstmt.setInt(2, end);
            pstmt.setInt(3, start);
            ResultSet rs = pstmt.executeQuery();

            while (rs.next()) {
                list.add(new Restaurants(
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
    
    public List<Restaurants> searchRestaurantsByName(String name) {
        List<Restaurants> list = new ArrayList<>();
        String sql = "SELECT * FROM restaurants WHERE name LIKE ? ORDER BY id ASC";

        try (Connection conn = DriverManager.getConnection(URL, USER, PASSWORD);
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setString(1, "%" + name + "%");
            ResultSet rs = pstmt.executeQuery();

            while (rs.next()) {
                list.add(new Restaurants(
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
        int count = 0; // 총 개수 변수 초기화
        try (Connection conn = DriverManager.getConnection(URL, USER, PASSWORD)) {
            String sql = (category == null || category.isEmpty()) 
                       ? "SELECT COUNT(*) FROM restaurants"  // 전체 데이터 개수 조회
                       : "SELECT COUNT(*) FROM restaurants WHERE category = ?"; // 특정 카테고리 개수 조회
            
            PreparedStatement pstmt = conn.prepareStatement(sql);
            if (category != null && !category.isEmpty()) {
                pstmt.setString(1, category); // 특정 카테고리 필터링 적용
            }
            
            ResultSet rs = pstmt.executeQuery();
            if (rs.next()) {
                count = rs.getInt(1); // 첫 번째 컬럼 값을 가져와 count에 저장
            }
        } catch (Exception e) {
            e.printStackTrace(); // 오류 발생 시 출력
        }
        return count;
    }
}