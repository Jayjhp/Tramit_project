package com.tramit.bbs.service;

import java.util.List;

import com.tramit.bbs.dao.RestaurantsDao;
import com.tramit.bbs.vo.Restaurants;

public class RestaurantsService {

    private RestaurantsDao dao = new RestaurantsDao();

    public List<Restaurants> getPagedRestaurantsByCategory(String category, int page, int pageSize) {
        return dao.getRestaurantsByCategory(category, page, pageSize);
    }

    public List<Restaurants> searchRestaurantsByName(String name) {
        return dao.searchRestaurantsByName(name);
    }

    public int getTotalPages(String category, int pageSize) {
        int totalCount = dao.getTotalCount(category); // 카테고리에 따라 개수 조회
        return (int) Math.ceil((double) totalCount / pageSize);
    }
    
    
}