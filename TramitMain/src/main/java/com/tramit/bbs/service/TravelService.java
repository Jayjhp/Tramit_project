package com.tramit.bbs.service;

import java.util.List;

import com.tramit.bbs.dao.TravelDao;
import com.tramit.bbs.vo.Restaurants;
import com.tramit.bbs.vo.Travel;

public class TravelService {

    private TravelDao dao = new TravelDao();

    public List<Travel> getPagedTravelByCategory(String category, int page, int pageSize) {
        return dao.getTravelByCategory(category, page, pageSize);
    }

    public List<Travel> searchTravelByName(String name) {
        return dao.searchTravelByName(name);
    }

    public int getTotalPages(String category, int pageSize) {
        int totalCount = dao.getTotalCount(category); // 카테고리에 따라 개수 조회
        return (int) Math.ceil((double) totalCount / pageSize);
    }
}