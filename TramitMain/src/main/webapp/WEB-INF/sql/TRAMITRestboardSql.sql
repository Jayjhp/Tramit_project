drop table restaurants;

CREATE TABLE restaurants (
    id NUMBER PRIMARY KEY,
    name VARCHAR2(100),
    description VARCHAR2(200),
    category VARCHAR2(20),
    image_url VARCHAR2(200),
    rating NUMBER(2,1)
);


--한식 
INSERT INTO restaurants (id, name, description, category, image_url, rating) VALUES (1, '광장시장 순희네빈대떡', '도심 속 힐링 공간, 조용한 분위기에서 한식을 즐길 수 있어요.', '한식', 'images/한식/한식01.jpg', 4.3);
INSERT INTO restaurants (id, name, description, category, image_url, rating) VALUES (2, '을지면옥', '웰빙 식단 제공, 담백한 맛과 건강한 재료로 인기를 끌고 있어요.', '한식', 'images/한식/한식02.jpg', 4.1);
INSERT INTO restaurants (id, name, description, category, image_url, rating) VALUES (3, '삼청동수제비', '가족 외식에 적합한 공간, 다양한 메뉴가 있어 모두가 만족해요.', '한식', 'images/한식/한식03.jpg', 4.4);
INSERT INTO restaurants (id, name, description, category, image_url, rating) VALUES (4, '명동교자', '서울의 숨은 맛집, 깔끔한 분위기에서 전통의 맛을 느낄 수 있어요.', '한식', 'images/한식/한식04.jpg', 4.0);
INSERT INTO restaurants (id, name, description, category, image_url, rating) VALUES (5, '진주회관', '지하철역 인근 위치, 가성비 좋은 메뉴와 빠른 서비스가 마음에 들어요.', '한식', 'images/한식/한식05.jpg', 4.2);
INSERT INTO restaurants (id, name, description, category, image_url, rating) VALUES (6, '연남서서갈비', '한옥 스타일의 분위기, 오랜 역사와 함께하는 든든한 한 끼를 맛보세요.', '한식', 'images/한식/한식06.jpg', 4.6);
INSERT INTO restaurants (id, name, description, category, image_url, rating) VALUES (7, '성수족발', 'SNS에서 화제인 맛집, 정갈한 한식과 감성적인 공간이 인상적이에요.', '한식', 'images/한식/한식07.jpg', 4.8);
INSERT INTO restaurants (id, name, description, category, image_url, rating) VALUES (8, '피양옥', '50년 전통의 곰탕집, 깊고 진한 국물 맛이 일품이라 계속 찾게 돼요.', '한식', 'images/한식/한식08.jpg', 5.0);
INSERT INTO restaurants (id, name, description, category, image_url, rating) VALUES (9, '배꼽집', '도심 속 힐링 공간, 조용한 분위기에서 한식을 즐길 수 있어요.', '한식', 'images/한식/한식09.jpg', 4.8);
INSERT INTO restaurants (id, name, description, category, image_url, rating) VALUES (10, '창신육회', '웰빙 식단 제공, 담백한 맛과 건강한 재료로 인기를 끌고 있어요.', '한식', 'images/한식/한식10.jpg', 4.5);
INSERT INTO restaurants (id, name, description, category, image_url, rating) VALUES (11, '보승회관', '가족 외식에 적합한 공간, 다양한 메뉴가 있어 모두가 만족해요.', '한식', 'images/한식/한식11.jpg', 4.0);
INSERT INTO restaurants (id, name, description, category, image_url, rating) VALUES (12, '중림장', '서울의 숨은 맛집, 깔끔한 분위기에서 전통의 맛을 느낄 수 있어요.', '한식', 'images/한식/한식12.jpg', 4.9);
INSERT INTO restaurants (id, name, description, category, image_url, rating) VALUES (13, '호수삼계탕', '지하철역 인근 위치, 가성비 좋은 메뉴와 빠른 서비스가 마음에 들어요.', '한식', 'images/한식/한식13.jpg', 4.2);
INSERT INTO restaurants (id, name, description, category, image_url, rating) VALUES (14, '황소곱창', '한옥 스타일의 분위기, 오랜 역사와 함께하는 든든한 한 끼를 맛보세요.', '한식', 'images/한식/한식14.jpg', 4.4);
INSERT INTO restaurants (id, name, description, category, image_url, rating) VALUES (15, '한옥집', 'SNS에서 화제인 맛집, 정갈한 한식과 감성적인 공간이 인상적이에요.', '한식', 'images/한식/한식15.jpg', 4.7);
INSERT INTO restaurants (id, name, description, category, image_url, rating) VALUES (16, '강강술래', '50년 전통의 곰탕집, 깊고 진한 국물 맛이 일품이라 계속 찾게 돼요.', '한식', 'images/한식/한식16.jpg', 4.8);
INSERT INTO restaurants (id, name, description, category, image_url, rating) VALUES (17, '토속촌삼계탕', '도심 속 힐링 공간, 조용한 분위기에서 한식을 즐길 수 있어요.', '한식', 'images/한식/한식17.jpg', 4.1);
INSERT INTO restaurants (id, name, description, category, image_url, rating) VALUES (18, '깡통만두', '웰빙 식단 제공, 담백한 맛과 건강한 재료로 인기를 끌고 있어요.', '한식', 'images/한식/한식18.jpg', 4.5);
INSERT INTO restaurants (id, name, description, category, image_url, rating) VALUES (19, '서울육개장', '가족 외식에 적합한 공간, 다양한 메뉴가 있어 모두가 만족해요.', '한식', 'images/한식/한식19.jpg', 4.9);
INSERT INTO restaurants (id, name, description, category, image_url, rating) VALUES (20, '도동집', '서울의 숨은 맛집, 깔끔한 분위기에서 전통의 맛을 느낄 수 있어요.', '한식', 'images/한식/한식20.jpg', 4.8);
INSERT INTO restaurants (id, name, description, category, image_url, rating) VALUES (21, '장충동왕족발', '지하철역 인근 위치, 가성비 좋은 메뉴와 빠른 서비스가 마음에 들어요.', '한식', 'images/한식/한식21.jpg', 4.5);
INSERT INTO restaurants (id, name, description, category, image_url, rating) VALUES (22, '황소막창', '한옥 스타일의 분위기, 오랜 역사와 함께하는 든든한 한 끼를 맛보세요.', '한식', 'images/한식/한식22.jpg', 4.6);
INSERT INTO restaurants (id, name, description, category, image_url, rating) VALUES (23, '마포갈매기', 'SNS에서 화제인 맛집, 정갈한 한식과 감성적인 공간이 인상적이에요.', '한식', 'images/한식/한식23.jpg', 4.4);
INSERT INTO restaurants (id, name, description, category, image_url, rating) VALUES (24, '교동짬뽕', '50년 전통의 곰탕집, 깊고 진한 국물 맛이 일품이라 계속 찾게 돼요.', '한식', 'images/한식/한식24.jpg', 4.7);



--중식
INSERT INTO restaurants (id, name, description, category, image_url, rating) VALUES (25, '홍반장중국집', '도심 속 힐링 공간, 조용한 분위기에서 한식을 즐길 수 있어요.', '중식', 'images/중식/중식01.jpg', 4.1);
INSERT INTO restaurants (id, name, description, category, image_url, rating) VALUES (26, '차이나팩토리', '웰빙 식단 제공, 담백한 맛과 건강한 재료로 인기를 끌고 있어요.', '중식', 'images/중식/중식02.jpg', 4.4);
INSERT INTO restaurants (id, name, description, category, image_url, rating) VALUES (27, '팔선', '가족 외식에 적합한 공간, 다양한 메뉴가 있어 모두가 만족해요.', '중식', 'images/중식/중식03.jpg', 4.4);
INSERT INTO restaurants (id, name, description, category, image_url, rating) VALUES (28, '자금성', '서울의 숨은 맛집, 깔끔한 분위기에서 전통의 맛을 느낄 수 있어요.', '중식', 'images/중식/중식04.jpg', 5.0);
INSERT INTO restaurants (id, name, description, category, image_url, rating) VALUES (29, '홍명', '지하철역 인근 위치, 가성비 좋은 메뉴와 빠른 서비스가 마음에 들어요.', '중식', 'images/중식/중식05.jpg', 4.3);
INSERT INTO restaurants (id, name, description, category, image_url, rating) VALUES (30, '일일향', '한옥 스타일의 분위기, 오랜 역사와 함께하는 든든한 한 끼를 맛보세요.', '중식', 'images/중식/중식06.jpg', 4.6);
INSERT INTO restaurants (id, name, description, category, image_url, rating) VALUES (31, '금룡', 'SNS에서 화제인 맛집, 정갈한 한식과 감성적인 공간이 인상적이에요.', '중식', 'images/중식/중식07.jpg', 4.1);
INSERT INTO restaurants (id, name, description, category, image_url, rating) VALUES (32, '진진', '50년 전통의 곰탕집, 깊고 진한 국물 맛이 일품이라 계속 찾게 돼요.', '중식', 'images/중식/중식08.jpg', 4.4);
INSERT INTO restaurants (id, name, description, category, image_url, rating) VALUES (33, '만리장성', '도심 속 힐링 공간, 조용한 분위기에서 한식을 즐길 수 있어요.', '중식', 'images/중식/중식09.jpg', 4.6);
INSERT INTO restaurants (id, name, description, category, image_url, rating) VALUES (34, '딘타이펑', '웰빙 식단 제공, 담백한 맛과 건강한 재료로 인기를 끌고 있어요.', '중식', 'images/중식/중식10.jpg', 4.3);
INSERT INTO restaurants (id, name, description, category, image_url, rating) VALUES (35, '서래향', '가족 외식에 적합한 공간, 다양한 메뉴가 있어 모두가 만족해요.', '중식', 'images/중식/중식11.jpg', 4.8);
INSERT INTO restaurants (id, name, description, category, image_url, rating) VALUES (36, '홍보각', '서울의 숨은 맛집, 깔끔한 분위기에서 전통의 맛을 느낄 수 있어요.', '중식', 'images/중식/중식12.jpg', 4.4);
INSERT INTO restaurants (id, name, description, category, image_url, rating) VALUES (37, '시추안하우스', '지하철역 인근 위치, 가성비 좋은 메뉴와 빠른 서비스가 마음에 들어요.', '중식', 'images/중식/중식13.jpg', 4.7);
INSERT INTO restaurants (id, name, description, category, image_url, rating) VALUES (38, '화상손짜장', '한옥 스타일의 분위기, 오랜 역사와 함께하는 든든한 한 끼를 맛보세요.', '중식', 'images/중식/중식14.jpg', 4.9);
INSERT INTO restaurants (id, name, description, category, image_url, rating) VALUES (39, '미각', 'SNS에서 화제인 맛집, 정갈한 한식과 감성적인 공간이 인상적이에요.', '중식', 'images/중식/중식15.jpg', 4.1);
INSERT INTO restaurants (id, name, description, category, image_url, rating) VALUES (40, '심양반점', '50년 전통의 곰탕집, 깊고 진한 국물 맛이 일품이라 계속 찾게 돼요.', '중식', 'images/중식/중식16.jpg', 4.2);
INSERT INTO restaurants (id, name, description, category, image_url, rating) VALUES (41, '천진반점', '도심 속 힐링 공간, 조용한 분위기에서 한식을 즐길 수 있어요.', '중식', 'images/중식/중식17.jpg', 4.2);
INSERT INTO restaurants (id, name, description, category, image_url, rating) VALUES (42, '리틀차이나', '웰빙 식단 제공, 담백한 맛과 건강한 재료로 인기를 끌고 있어요.', '중식', 'images/중식/중식18.jpg', 4.6);
INSERT INTO restaurants (id, name, description, category, image_url, rating) VALUES (43, '강가중식', '가족 외식에 적합한 공간, 다양한 메뉴가 있어 모두가 만족해요.', '중식', 'images/중식/중식19.jpg', 4.5);
INSERT INTO restaurants (id, name, description, category, image_url, rating) VALUES (44, '공리', '서울의 숨은 맛집, 깔끔한 분위기에서 전통의 맛을 느낄 수 있어요.', '중식', 'images/중식/중식20.jpg', 4.3);
INSERT INTO restaurants (id, name, description, category, image_url, rating) VALUES (45, '중식당 동보성', '지하철역 인근 위치, 가성비 좋은 메뉴와 빠른 서비스가 마음에 들어요.', '중식', 'images/중식/중식21.jpg', 4.6);
INSERT INTO restaurants (id, name, description, category, image_url, rating) VALUES (46, '금성루', '한옥 스타일의 분위기, 오랜 역사와 함께하는 든든한 한 끼를 맛보세요.', '중식', 'images/중식/중식22.jpg', 4.6);
INSERT INTO restaurants (id, name, description, category, image_url, rating) VALUES (47, '사천성', 'SNS에서 화제인 맛집, 정갈한 한식과 감성적인 공간이 인상적이에요.', '중식', 'images/중식/중식23.jpg', 4.3);
INSERT INTO restaurants (id, name, description, category, image_url, rating) VALUES (48, '미스터차이나', '50년 전통의 곰탕집, 깊고 진한 국물 맛이 일품이라 계속 찾게 돼요.', '중식', 'images/중식/중식24.jpg', 5.0);


--일식
INSERT INTO restaurants (id, name, description, category, image_url, rating) VALUES (49, '스시효', '도심 속 힐링 공간, 조용한 분위기에서 한식을 즐길 수 있어요.', '일식', 'images/일식/일식01.jpg', 4.2);
INSERT INTO restaurants (id, name, description, category, image_url, rating) VALUES (50, '스시조', '웰빙 식단 제공, 담백한 맛과 건강한 재료로 인기를 끌고 있어요.', '일식', 'images/일식/일식02.jpg', 4.9);
INSERT INTO restaurants (id, name, description, category, image_url, rating) VALUES (51, '초밥왕', '가족 외식에 적합한 공간, 다양한 메뉴가 있어 모두가 만족해요.', '일식', 'images/일식/일식03.jpg', 4.4);
INSERT INTO restaurants (id, name, description, category, image_url, rating) VALUES (52, '우오', '서울의 숨은 맛집, 깔끔한 분위기에서 전통의 맛을 느낄 수 있어요.', '일식', 'images/일식/일식04.jpg', 4.7);
INSERT INTO restaurants (id, name, description, category, image_url, rating) VALUES (53, '스시카이', '지하철역 인근 위치, 가성비 좋은 메뉴와 빠른 서비스가 마음에 들어요.', '일식', 'images/일식/일식05.jpg', 4.7);
INSERT INTO restaurants (id, name, description, category, image_url, rating) VALUES (54, '토리카츠', '한옥 스타일의 분위기, 오랜 역사와 함께하는 든든한 한 끼를 맛보세요.', '일식', 'images/일식/일식06.jpg', 4.4);
INSERT INTO restaurants (id, name, description, category, image_url, rating) VALUES (55, '텐동요츠야', 'SNS에서 화제인 맛집, 정갈한 한식과 감성적인 공간이 인상적이에요.', '일식', 'images/일식/일식07.jpg', 4.8);
INSERT INTO restaurants (id, name, description, category, image_url, rating) VALUES (56, '우미노미', '50년 전통의 곰탕집, 깊고 진한 국물 맛이 일품이라 계속 찾게 돼요.', '일식', 'images/일식/일식08.jpg', 4.6);
INSERT INTO restaurants (id, name, description, category, image_url, rating) VALUES (57, '미소야', '도심 속 힐링 공간, 조용한 분위기에서 한식을 즐길 수 있어요.', '일식', 'images/일식/일식09.jpg', 4.3);
INSERT INTO restaurants (id, name, description, category, image_url, rating) VALUES (58, '이자카야토모', '웰빙 식단 제공, 담백한 맛과 건강한 재료로 인기를 끌고 있어요.', '일식', 'images/일식/일식10.jpg', 4.7);
INSERT INTO restaurants (id, name, description, category, image_url, rating) VALUES (59, '스시히로바', '가족 외식에 적합한 공간, 다양한 메뉴가 있어 모두가 만족해요.', '일식', 'images/일식/일식11.jpg', 4.9);
INSERT INTO restaurants (id, name, description, category, image_url, rating) VALUES (60, '겐로쿠우동', '서울의 숨은 맛집, 깔끔한 분위기에서 전통의 맛을 느낄 수 있어요.', '일식', 'images/일식/일식12.jpg', 4.9);
INSERT INTO restaurants (id, name, description, category, image_url, rating) VALUES (61, '스시마이우', '지하철역 인근 위치, 가성비 좋은 메뉴와 빠른 서비스가 마음에 들어요.', '일식', 'images/일식/일식13.jpg', 4.1);
INSERT INTO restaurants (id, name, description, category, image_url, rating) VALUES (62, '모모야', '한옥 스타일의 분위기, 오랜 역사와 함께하는 든든한 한 끼를 맛보세요.', '일식', 'images/일식/일식14.jpg', 4.2);
INSERT INTO restaurants (id, name, description, category, image_url, rating) VALUES (63, '하루스시', 'SNS에서 화제인 맛집, 정갈한 한식과 감성적인 공간이 인상적이에요.', '일식', 'images/일식/일식15.jpg', 4.5);
INSERT INTO restaurants (id, name, description, category, image_url, rating) VALUES (64, '멘야산다이메', '50년 전통의 곰탕집, 깊고 진한 국물 맛이 일품이라 계속 찾게 돼요.', '일식', 'images/일식/일식16.jpg', 4.9);
INSERT INTO restaurants (id, name, description, category, image_url, rating) VALUES (65, '이치란', '도심 속 힐링 공간, 조용한 분위기에서 한식을 즐길 수 있어요.', '일식', 'images/일식/일식17.jpg', 4.1);
INSERT INTO restaurants (id, name, description, category, image_url, rating) VALUES (66, '돈카츠정', '웰빙 식단 제공, 담백한 맛과 건강한 재료로 인기를 끌고 있어요.', '일식', 'images/일식/일식18.jpg', 5.0);
INSERT INTO restaurants (id, name, description, category, image_url, rating) VALUES (67, '하카타분코', '가족 외식에 적합한 공간, 다양한 메뉴가 있어 모두가 만족해요.', '일식', 'images/일식/일식19.jpg', 4.4);
INSERT INTO restaurants (id, name, description, category, image_url, rating) VALUES (68, '라멘81번옥', '서울의 숨은 맛집, 깔끔한 분위기에서 전통의 맛을 느낄 수 있어요.', '일식', 'images/일식/일식20.jpg', 4.6);
INSERT INTO restaurants (id, name, description, category, image_url, rating) VALUES (69, '고고야', '지하철역 인근 위치, 가성비 좋은 메뉴와 빠른 서비스가 마음에 들어요.', '일식', 'images/일식/일식21.jpg', 4.8);
INSERT INTO restaurants (id, name, description, category, image_url, rating) VALUES (70, '카츠신', '한옥 스타일의 분위기, 오랜 역사와 함께하는 든든한 한 끼를 맛보세요.', '일식', 'images/일식/일식22.jpg', 4.8);
INSERT INTO restaurants (id, name, description, category, image_url, rating) VALUES (71, '텐카츠', 'SNS에서 화제인 맛집, 정갈한 한식과 감성적인 공간이 인상적이에요.', '일식', 'images/일식/일식23.jpg', 4.2);
INSERT INTO restaurants (id, name, description, category, image_url, rating) VALUES (72, '스시도쿄', '50년 전통의 곰탕집, 깊고 진한 국물 맛이 일품이라 계속 찾게 돼요.', '일식', 'images/일식/일식24.jpg', 4.2);


--양식
INSERT INTO restaurants (id, name, description, category, image_url, rating) VALUES (73, '서가앤쿡', '도심 속 힐링 공간, 조용한 분위기에서 한식을 즐길 수 있어요.', '양식', 'images/양식/양식01.jpg', 4.2);
INSERT INTO restaurants (id, name, description, category, image_url, rating) VALUES (74, '빕스', '웰빙 식단 제공, 담백한 맛과 건강한 재료로 인기를 끌고 있어요.', '양식', 'images/양식/양식02.jpg', 4.7);
INSERT INTO restaurants (id, name, description, category, image_url, rating) VALUES (75, '애슐리', '가족 외식에 적합한 공간, 다양한 메뉴가 있어 모두가 만족해요.', '양식', 'images/양식/양식03.jpg', 4.2);
INSERT INTO restaurants (id, name, description, category, image_url, rating) VALUES (76, '파파존스', '서울의 숨은 맛집, 깔끔한 분위기에서 전통의 맛을 느낄 수 있어요.', '양식', 'images/양식/양식04.jpg', 4.6);
INSERT INTO restaurants (id, name, description, category, image_url, rating) VALUES (77, '써브웨이', '지하철역 인근 위치, 가성비 좋은 메뉴와 빠른 서비스가 마음에 들어요.', '양식', 'images/양식/양식05.jpg', 4.3);
INSERT INTO restaurants (id, name, description, category, image_url, rating) VALUES (78, '마이너스투', '한옥 스타일의 분위기, 오랜 역사와 함께하는 든든한 한 끼를 맛보세요.', '양식', 'images/양식/양식06.jpg', 4.8);
INSERT INTO restaurants (id, name, description, category, image_url, rating) VALUES (79, '이태리부대찌개', 'SNS에서 화제인 맛집, 정갈한 한식과 감성적인 공간이 인상적이에요.', '양식', 'images/양식/양식07.jpg', 4.8);
INSERT INTO restaurants (id, name, description, category, image_url, rating) VALUES (80, '도미노피자', '50년 전통의 곰탕집, 깊고 진한 국물 맛이 일품이라 계속 찾게 돼요.', '양식', 'images/양식/양식08.jpg', 4.7);
INSERT INTO restaurants (id, name, description, category, image_url, rating) VALUES (81, '피자헛', '도심 속 힐링 공간, 조용한 분위기에서 한식을 즐길 수 있어요.', '양식', 'images/양식/양식09.jpg', 4.2);
INSERT INTO restaurants (id, name, description, category, image_url, rating) VALUES (82, '블루베리', '웰빙 식단 제공, 담백한 맛과 건강한 재료로 인기를 끌고 있어요.', '양식', 'images/양식/양식10.jpg', 4.2);
INSERT INTO restaurants (id, name, description, category, image_url, rating) VALUES (83, '르쁘띠푸', '가족 외식에 적합한 공간, 다양한 메뉴가 있어 모두가 만족해요.', '양식', 'images/양식/양식11.jpg', 4.4);
INSERT INTO restaurants (id, name, description, category, image_url, rating) VALUES (84, '그릴타이거', '서울의 숨은 맛집, 깔끔한 분위기에서 전통의 맛을 느낄 수 있어요.', '양식', 'images/양식/양식12.jpg', 4.2);
INSERT INTO restaurants (id, name, description, category, image_url, rating) VALUES (85, '써니네키친', '지하철역 인근 위치, 가성비 좋은 메뉴와 빠른 서비스가 마음에 들어요.', '양식', 'images/양식/양식13.jpg', 4.9);
INSERT INTO restaurants (id, name, description, category, image_url, rating) VALUES (86, '버거킹', '한옥 스타일의 분위기, 오랜 역사와 함께하는 든든한 한 끼를 맛보세요.', '양식', 'images/양식/양식14.jpg', 4.8);
INSERT INTO restaurants (id, name, description, category, image_url, rating) VALUES (87, '맥도날드', 'SNS에서 화제인 맛집, 정갈한 한식과 감성적인 공간이 인상적이에요.', '양식', 'images/양식/양식15.jpg', 4.7);
INSERT INTO restaurants (id, name, description, category, image_url, rating) VALUES (88, '아웃백', '50년 전통의 곰탕집, 깊고 진한 국물 맛이 일품이라 계속 찾게 돼요.', '양식', 'images/양식/양식16.jpg', 4.9);
INSERT INTO restaurants (id, name, description, category, image_url, rating) VALUES (89, 'TGI프라이데이', '도심 속 힐링 공간, 조용한 분위기에서 한식을 즐길 수 있어요.', '양식', 'images/양식/양식17.jpg', 4.4);
INSERT INTO restaurants (id, name, description, category, image_url, rating) VALUES (90, '베니건스', '웰빙 식단 제공, 담백한 맛과 건강한 재료로 인기를 끌고 있어요.', '양식', 'images/양식/양식18.jpg', 4.4);
INSERT INTO restaurants (id, name, description, category, image_url, rating) VALUES (91, '올리브가든', '가족 외식에 적합한 공간, 다양한 메뉴가 있어 모두가 만족해요.', '양식', 'images/양식/양식19.jpg', 4.0);
INSERT INTO restaurants (id, name, description, category, image_url, rating) VALUES (92, '피자몰', '서울의 숨은 맛집, 깔끔한 분위기에서 전통의 맛을 느낄 수 있어요.', '양식', 'images/양식/양식20.jpg', 4.8);
INSERT INTO restaurants (id, name, description, category, image_url, rating) VALUES (93, '엘본더테이블', '지하철역 인근 위치, 가성비 좋은 메뉴와 빠른 서비스가 마음에 들어요.', '양식', 'images/양식/양식21.jpg', 5.0);
INSERT INTO restaurants (id, name, description, category, image_url, rating) VALUES (94, '한스델리', '한옥 스타일의 분위기, 오랜 역사와 함께하는 든든한 한 끼를 맛보세요.', '양식', 'images/양식/양식22.jpg', 4.8);
INSERT INTO restaurants (id, name, description, category, image_url, rating) VALUES (95, '미스터피자', 'SNS에서 화제인 맛집, 정갈한 한식과 감성적인 공간이 인상적이에요.', '양식', 'images/양식/양식23.jpg', 4.9);
INSERT INTO restaurants (id, name, description, category, image_url, rating) VALUES (96, '스테이크하우스', '50년 전통의 곰탕집, 깊고 진한 국물 맛이 일품이라 계속 찾게 돼요.', '양식', 'images/양식/양식24.jpg', 4.7);


--카페/디저트
INSERT INTO restaurants (id, name, description, category, image_url, rating) VALUES (97, '스타벅스', '도심 속 힐링 공간, 조용한 분위기에서 한식을 즐길 수 있어요.', '커피/디저트', 'images/커피/디저트/커피/디저트01.jpg', 4.5);
INSERT INTO restaurants (id, name, description, category, image_url, rating) VALUES (98, '투썸플레이스', '웰빙 식단 제공, 담백한 맛과 건강한 재료로 인기를 끌고 있어요.', '커피/디저트', 'images/커피/디저트/커피/디저트02.jpg', 4.2);
INSERT INTO restaurants (id, name, description, category, image_url, rating) VALUES (99, '이디야커피', '가족 외식에 적합한 공간, 다양한 메뉴가 있어 모두가 만족해요.', '커피/디저트', 'images/커피/디저트/커피/디저트03.jpg', 4.7);
INSERT INTO restaurants (id, name, description, category, image_url, rating) VALUES (100, '빽다방', '서울의 숨은 맛집, 깔끔한 분위기에서 전통의 맛을 느낄 수 있어요.', '커피/디저트', 'images/커피/디저트/커피/디저트04.jpg', 4.7);
INSERT INTO restaurants (id, name, description, category, image_url, rating) VALUES (101, '커피빈', '지하철역 인근 위치, 가성비 좋은 메뉴와 빠른 서비스가 마음에 들어요.', '커피/디저트', 'images/커피/디저트/커피/디저트05.jpg', 4.4);
INSERT INTO restaurants (id, name, description, category, image_url, rating) VALUES (102, '할리스', '한옥 스타일의 분위기, 오랜 역사와 함께하는 든든한 한 끼를 맛보세요.', '커피/디저트', 'images/커피/디저트/커피/디저트06.jpg', 4.6);
INSERT INTO restaurants (id, name, description, category, image_url, rating) VALUES (103, '파스쿠찌', 'SNS에서 화제인 맛집, 정갈한 한식과 감성적인 공간이 인상적이에요.', '커피/디저트', 'images/커피/디저트/커피/디저트07.jpg', 4.3);
INSERT INTO restaurants (id, name, description, category, image_url, rating) VALUES (104, '폴바셋', '50년 전통의 곰탕집, 깊고 진한 국물 맛이 일품이라 계속 찾게 돼요.', '커피/디저트', 'images/커피/디저트/커피/디저트08.jpg', 4.7);
INSERT INTO restaurants (id, name, description, category, image_url, rating) VALUES (105, '카페베네', '도심 속 힐링 공간, 조용한 분위기에서 한식을 즐길 수 있어요.', '커피/디저트', 'images/커피/디저트/커피/디저트09.jpg', 4.4);
INSERT INTO restaurants (id, name, description, category, image_url, rating) VALUES (106, '탐앤탐스', '웰빙 식단 제공, 담백한 맛과 건강한 재료로 인기를 끌고 있어요.', '커피/디저트', 'images/커피/디저트/커피/디저트10.jpg', 4.3);
INSERT INTO restaurants (id, name, description, category, image_url, rating) VALUES (107, '달콤커피', '가족 외식에 적합한 공간, 다양한 메뉴가 있어 모두가 만족해요.', '커피/디저트', 'images/커피/디저트/커피/디저트11.jpg', 4.4);
INSERT INTO restaurants (id, name, description, category, image_url, rating) VALUES (108, '앤티앤스', '서울의 숨은 맛집, 깔끔한 분위기에서 전통의 맛을 느낄 수 있어요.', '커피/디저트', 'images/커피/디저트/커피/디저트12.jpg', 4.6);
INSERT INTO restaurants (id, name, description, category, image_url, rating) VALUES (109, '설빙', '지하철역 인근 위치, 가성비 좋은 메뉴와 빠른 서비스가 마음에 들어요.', '커피/디저트', 'images/커피/디저트/커피/디저트13.jpg', 4.6);
INSERT INTO restaurants (id, name, description, category, image_url, rating) VALUES (110, '옥루몽', '한옥 스타일의 분위기, 오랜 역사와 함께하는 든든한 한 끼를 맛보세요.', '커피/디저트', 'images/커피/디저트/커피/디저트14.jpg', 4.5);
INSERT INTO restaurants (id, name, description, category, image_url, rating) VALUES (111, '카페노티드', 'SNS에서 화제인 맛집, 정갈한 한식과 감성적인 공간이 인상적이에요.', '커피/디저트', 'images/커피/디저트/커피/디저트15.jpg', 4.1);
INSERT INTO restaurants (id, name, description, category, image_url, rating) VALUES (112, '도레도레', '50년 전통의 곰탕집, 깊고 진한 국물 맛이 일품이라 계속 찾게 돼요.', '커피/디저트', 'images/커피/디저트/커피/디저트16.jpg', 4.9);
INSERT INTO restaurants (id, name, description, category, image_url, rating) VALUES (113, '베이커리카페', '도심 속 힐링 공간, 조용한 분위기에서 한식을 즐길 수 있어요.', '커피/디저트', 'images/커피/디저트/커피/디저트17.jpg', 4.3);
INSERT INTO restaurants (id, name, description, category, image_url, rating) VALUES (114, '크로플하우스', '웰빙 식단 제공, 담백한 맛과 건강한 재료로 인기를 끌고 있어요.', '커피/디저트', 'images/커피/디저트/커피/디저트18.jpg', 4.6);
INSERT INTO restaurants (id, name, description, category, image_url, rating) VALUES (115, '아티제', '가족 외식에 적합한 공간, 다양한 메뉴가 있어 모두가 만족해요.', '커피/디저트', 'images/커피/디저트/커피/디저트19.jpg', 4.8);
INSERT INTO restaurants (id, name, description, category, image_url, rating) VALUES (116, '쥬씨', '서울의 숨은 맛집, 깔끔한 분위기에서 전통의 맛을 느낄 수 있어요.', '커피/디저트', 'images/커피/디저트/커피/디저트20.jpg', 4.1);
INSERT INTO restaurants (id, name, description, category, image_url, rating) VALUES (117, '망고식스', '지하철역 인근 위치, 가성비 좋은 메뉴와 빠른 서비스가 마음에 들어요.', '커피/디저트', 'images/커피/디저트/커피/디저트21.jpg', 4.9);
INSERT INTO restaurants (id, name, description, category, image_url, rating) VALUES (118, '커피리브레', '한옥 스타일의 분위기, 오랜 역사와 함께하는 든든한 한 끼를 맛보세요.', '커피/디저트', 'images/커피/디저트/커피/디저트22.jpg', 4.7);
INSERT INTO restaurants (id, name, description, category, image_url, rating) VALUES (119, '펠트커피', 'SNS에서 화제인 맛집, 정갈한 한식과 감성적인 공간이 인상적이에요.', '커피/디저트', 'images/커피/디저트/커피/디저트23.jpg', 4.3);
INSERT INTO restaurants (id, name, description, category, image_url, rating) VALUES (120, '클레어', '50년 전통의 곰탕집, 깊고 진한 국물 맛이 일품이라 계속 찾게 돼요.', '커피/디저트', 'images/커피/디저트/커피/디저트24.jpg', 4.9);


--퓨전
INSERT INTO restaurants (id, name, description, category, image_url, rating) VALUES (121, '온더보더', '도심 속 힐링 공간, 조용한 분위기에서 한식을 즐길 수 있어요.', '퓨전', 'images/퓨전/퓨전01.jpg', 4.3);
INSERT INTO restaurants (id, name, description, category, image_url, rating) VALUES (122, '매드포갈릭', '웰빙 식단 제공, 담백한 맛과 건강한 재료로 인기를 끌고 있어요.', '퓨전', 'images/퓨전/퓨전02.jpg', 4.8);
INSERT INTO restaurants (id, name, description, category, image_url, rating) VALUES (123, '더플레이스', '가족 외식에 적합한 공간, 다양한 메뉴가 있어 모두가 만족해요.', '퓨전', 'images/퓨전/퓨전03.jpg', 4.7);
INSERT INTO restaurants (id, name, description, category, image_url, rating) VALUES (124, '샐러디', '서울의 숨은 맛집, 깔끔한 분위기에서 전통의 맛을 느낄 수 있어요.', '퓨전', 'images/퓨전/퓨전04.jpg', 4.6);
INSERT INTO restaurants (id, name, description, category, image_url, rating) VALUES (125, '슬로우캘리', '지하철역 인근 위치, 가성비 좋은 메뉴와 빠른 서비스가 마음에 들어요.', '퓨전', 'images/퓨전/퓨전05.jpg', 4.1);
INSERT INTO restaurants (id, name, description, category, image_url, rating) VALUES (126, '정돈', '한옥 스타일의 분위기, 오랜 역사와 함께하는 든든한 한 끼를 맛보세요.', '퓨전', 'images/퓨전/퓨전06.jpg', 4.3);
INSERT INTO restaurants (id, name, description, category, image_url, rating) VALUES (127, '서가앤쿡퓨전', 'SNS에서 화제인 맛집, 정갈한 한식과 감성적인 공간이 인상적이에요.', '퓨전', 'images/퓨전/퓨전07.jpg', 4.4);
INSERT INTO restaurants (id, name, description, category, image_url, rating) VALUES (128, '봉추찜닭', '50년 전통의 곰탕집, 깊고 진한 국물 맛이 일품이라 계속 찾게 돼요.', '퓨전', 'images/퓨전/퓨전08.jpg', 4.2);
INSERT INTO restaurants (id, name, description, category, image_url, rating) VALUES (129, '요리하는남자', '도심 속 힐링 공간, 조용한 분위기에서 한식을 즐길 수 있어요.', '퓨전', 'images/퓨전/퓨전09.jpg', 4.6);
INSERT INTO restaurants (id, name, description, category, image_url, rating) VALUES (130, '철판마을', '웰빙 식단 제공, 담백한 맛과 건강한 재료로 인기를 끌고 있어요.', '퓨전', 'images/퓨전/퓨전10.jpg', 4.7);
INSERT INTO restaurants (id, name, description, category, image_url, rating) VALUES (131, '히노아지', '가족 외식에 적합한 공간, 다양한 메뉴가 있어 모두가 만족해요.', '퓨전', 'images/퓨전/퓨전11.jpg', 5.0);
INSERT INTO restaurants (id, name, description, category, image_url, rating) VALUES (132, '브루클린버거조인트', '서울의 숨은 맛집, 깔끔한 분위기에서 전통의 맛을 느낄 수 있어요.', '퓨전', 'images/퓨전/퓨전12.jpg', 4.9);
INSERT INTO restaurants (id, name, description, category, image_url, rating) VALUES (133, '미즈컨테이너', '지하철역 인근 위치, 가성비 좋은 메뉴와 빠른 서비스가 마음에 들어요.', '퓨전', 'images/퓨전/퓨전13.jpg', 4.1);
INSERT INTO restaurants (id, name, description, category, image_url, rating) VALUES (134, '맛찬들', '한옥 스타일의 분위기, 오랜 역사와 함께하는 든든한 한 끼를 맛보세요.', '퓨전', 'images/퓨전/퓨전14.jpg', 4.9);
INSERT INTO restaurants (id, name, description, category, image_url, rating) VALUES (135, '달인의찜닭', 'SNS에서 화제인 맛집, 정갈한 한식과 감성적인 공간이 인상적이에요.', '퓨전', 'images/퓨전/퓨전15.jpg', 4.2);
INSERT INTO restaurants (id, name, description, category, image_url, rating) VALUES (136, '봉산집', '50년 전통의 곰탕집, 깊고 진한 국물 맛이 일품이라 계속 찾게 돼요.', '퓨전', 'images/퓨전/퓨전16.jpg', 4.3);
INSERT INTO restaurants (id, name, description, category, image_url, rating) VALUES (137, '육첩반상', '도심 속 힐링 공간, 조용한 분위기에서 한식을 즐길 수 있어요.', '퓨전', 'images/퓨전/퓨전17.jpg', 4.8);
INSERT INTO restaurants (id, name, description, category, image_url, rating) VALUES (138, '세컨드키친', '웰빙 식단 제공, 담백한 맛과 건강한 재료로 인기를 끌고 있어요.', '퓨전', 'images/퓨전/퓨전18.jpg', 4.3);
INSERT INTO restaurants (id, name, description, category, image_url, rating) VALUES (139, '뚝배기하우스', '가족 외식에 적합한 공간, 다양한 메뉴가 있어 모두가 만족해요.', '퓨전', 'images/퓨전/퓨전19.jpg', 4.8);
INSERT INTO restaurants (id, name, description, category, image_url, rating) VALUES (140, '한스카레', '서울의 숨은 맛집, 깔끔한 분위기에서 전통의 맛을 느낄 수 있어요.', '퓨전', 'images/퓨전/퓨전20.jpg', 4.5);
INSERT INTO restaurants (id, name, description, category, image_url, rating) VALUES (141, '라비옥', '지하철역 인근 위치, 가성비 좋은 메뉴와 빠른 서비스가 마음에 들어요.', '퓨전', 'images/퓨전/퓨전21.jpg', 4.1);
INSERT INTO restaurants (id, name, description, category, image_url, rating) VALUES (142, '히노스시', '한옥 스타일의 분위기, 오랜 역사와 함께하는 든든한 한 끼를 맛보세요.', '퓨전', 'images/퓨전/퓨전22.jpg', 4.0);
INSERT INTO restaurants (id, name, description, category, image_url, rating) VALUES (143, '이자카야혼', 'SNS에서 화제인 맛집, 정갈한 한식과 감성적인 공간이 인상적이에요.', '퓨전', 'images/퓨전/퓨전23.jpg', 4.3);
INSERT INTO restaurants (id, name, description, category, image_url, rating) VALUES (144, '철든놈', '50년 전통의 곰탕집, 깊고 진한 국물 맛이 일품이라 계속 찾게 돼요.', '퓨전', 'images/퓨전/퓨전24.jpg', 4.5);

commit;