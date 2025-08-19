package com.tramit.bbs.vo;

public class Travel {

    // 맛집 고유 ID
    private int id;

    // 맛집 이름
    private String name;

    // 맛집 설명
    private String description;

    // 맛집 카테고리 (한식, 중식, 양식 등)
    private String category;

    // 맛집 이미지 URL
    private String imageUrl;

    // 맛집 평점
    private double rating;

    public Travel(int id, String name, String description, String category, String imageUrl, double rating) {
        this.id = id;
        this.name = name;
        this.description = description;
        this.category = category;
        this.imageUrl = imageUrl;
        this.rating = rating;
    }

    public int getId() { return id; }

    public String getName() { return name; }

    public String getDescription() { return description; }

    public String getCategory() { return category; }

    public String getImageUrl() { return imageUrl; }

    public double getRating() { return rating; }
}