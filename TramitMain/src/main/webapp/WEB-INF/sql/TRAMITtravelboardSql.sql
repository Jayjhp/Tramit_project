DROP TABLE TRAVEL;

CREATE TABLE TRAVEL (
    id NUMBER PRIMARY KEY,
    name VARCHAR2(100),
    description VARCHAR2(200),
    category VARCHAR2(20),
    image_url VARCHAR2(200),
    rating NUMBER(2,1)
); 

-- 서울 카테고리 (24개)
INSERT INTO TRAVEL (id, name, description, category, image_url, rating) VALUES (201, '창덕궁', '아름다운 비원과 함께 조선의 정취를 느낄 수 있는 궁궐입니다.', '서울', 'images/서울/서울01.jpg', 4.6);
INSERT INTO TRAVEL (id, name, description, category, image_url, rating) VALUES (202, '국립중앙박물관', '다양한 역사 유물을 통해 한국 문화를 깊이 있게 이해할 수 있습니다.', '서울', 'images/서울/서울02.jpg', 4.5);
INSERT INTO TRAVEL (id, name, description, category, image_url, rating) VALUES (203, '이태원', '다양한 문화와 음식을 경험할 수 있는 서울의 국제적인 거리입니다.', '서울', 'images/서울/서울03.jpg', 4.2);
INSERT INTO TRAVEL (id, name, description, category, image_url, rating) VALUES (204, '홍대', '젊음과 활력이 넘치는 거리! 다양한 공연과 쇼핑을 즐길 수 있어요.', '서울', 'images/서울/서울04.jpg', 4.3);
INSERT INTO TRAVEL (id, name, description, category, image_url, rating) VALUES (205, '올림픽공원', '넓은 잔디밭과 산책로가 있어 시민들의 휴식 공간으로 사랑받고 있습니다.', '서울', 'images/서울/서울05.jpg', 4.4);
INSERT INTO TRAVEL (id, name, description, category, image_url, rating) VALUES (206, '동대문 디자인 플라자 (DDP)', '독특한 건축 디자인과 다양한 전시, 행사가 열리는 복합 문화 공간입니다.', '서울', 'images/서울/서울06.jpg', 4.3);
INSERT INTO TRAVEL (id, name, description, category, image_url, rating) VALUES (207, '남산골한옥마을', '조선 시대 한옥의 아름다움을 그대로 느낄 수 있는 전통 가옥 마을입니다.', '서울', 'images/서울/서울07.jpg', 4.5);
INSERT INTO TRAVEL (id, name, description, category, image_url, rating) VALUES (208, '서촌', '아기자기한 골목길과 개성 있는 상점들이 매력적인 동네입니다.', '서울', 'images/서울/서울08.jpg', 4.4);
INSERT INTO TRAVEL (id, name, description, category, image_url, rating) VALUES (209, '북악산', '서울 도심을 한눈에 조망할 수 있는 아름다운 산입니다.', '서울', 'images/서울/서울09.jpg', 4.6);
INSERT INTO TRAVEL (id, name, description, category, image_url, rating) VALUES (210, '예술의전당', '다양한 공연과 전시를 즐길 수 있는 서울의 대표적인 문화 예술 공간입니다.', '서울', 'images/서울/서울10.jpg', 4.3);
INSERT INTO TRAVEL (id, name, description, category, image_url, rating) VALUES (211, '국립민속박물관', '한국인의 생활 모습과 전통 문화를 엿볼 수 있는 박물관입니다.', '서울', 'images/서울/서울11.jpg', 4.4);
INSERT INTO TRAVEL (id, name, description, category, image_url, rating) VALUES (212, '성수동', '개성 넘치는 카페와 맛집, 공장형 공간이 조화로운 트렌디한 동네입니다.', '서울', 'images/서울/서울12.jpg', 4.5);
INSERT INTO TRAVEL (id, name, description, category, image_url, rating) VALUES (213, '여의도', '한강을 끼고 있는 금융 중심지이자 벚꽃 명소로도 유명합니다.', '서울', 'images/서울/서울13.jpg', 4.2);
INSERT INTO TRAVEL (id, name, description, category, image_url, rating) VALUES (214, '신사동 가로수길', '세련된 카페와 편집숍들이 즐비한 서울의 대표적인 패션 거리입니다.', '서울', 'images/서울/서울14.jpg', 4.3);
INSERT INTO TRAVEL (id, name, description, category, image_url, rating) VALUES (215, '잠실 석촌호수', '도심 속에서 여유로운 산책을 즐길 수 있는 아름다운 호수입니다.', '서울', 'images/서울/서울15.jpg', 4.1);
INSERT INTO TRAVEL (id, name, description, category, image_url, rating) VALUES (216, '경희궁', '서울의 5대 궁궐 중 하나로 아름다운 건축미를 자랑합니다.', '서울', 'images/서울/서울16.jpg', 4.4);
INSERT INTO TRAVEL (id, name, description, category, image_url, rating) VALUES (217, '세종문화회관', '다양한 공연 예술을 만날 수 있는 서울의 대표적인 공연장입니다.', '서울', 'images/서울/서울17.jpg', 4.3);
INSERT INTO TRAVEL (id, name, description, category, image_url, rating) VALUES (218, '낙산공원', '서울의 아름다운 야경을 감상하며 산책하기 좋은 곳입니다.', '서울', 'images/서울/서울18.jpg', 4.5);
INSERT INTO TRAVEL (id, name, description, category, image_url, rating) VALUES (219, '광화문 광장', '서울의 중심부에 위치한 넓은 광장으로 다양한 행사가 열립니다.', '서울', 'images/서울/서울19.jpg', 4.2);
INSERT INTO TRAVEL (id, name, description, category, image_url, rating) VALUES (220, '용산 아이파크몰', '다양한 쇼핑과 엔터테인먼트를 즐길 수 있는 복합 쇼핑몰입니다.', '서울', 'images/서울/서울20.jpg', 4.1);
INSERT INTO TRAVEL (id, name, description, category, image_url, rating) VALUES (221, '노량진 수산시장', '싱싱한 해산물을 저렴하게 맛볼 수 있는 활기 넘치는 시장입니다.', '서울', 'images/서울/서울21.jpg', 4.4);
INSERT INTO TRAVEL (id, name, description, category, image_url, rating) VALUES (222, '선정릉', '조선 왕릉의 아름다움을 느낄 수 있는 역사적인 공간입니다.', '서울', 'images/서울/서울22.jpg', 4.3);
INSERT INTO TRAVEL (id, name, description, category, image_url, rating) VALUES (223, '봉은사', '도심 속에서 고즈넉한 분위기를 느낄 수 있는 천년 고찰입니다.', '서울', 'images/서울/서울23.jpg', 4.5);
INSERT INTO TRAVEL (id, name, description, category, image_url, rating) VALUES (224, '인왕산', '서울의 아름다운 자연을 만끽하며 등산하기 좋은 산입니다.', '서울', 'images/서울/서울24.jpg', 4.4);

-- 경기 카테고리 (24개)
INSERT INTO TRAVEL (id, name, description, category, image_url, rating) VALUES (301, '수원 화성 행궁', '정조대왕의 숨결이 느껴지는 아름다운 궁궐입니다.', '경기', 'images/경기/경기01.jpg', 4.5);
INSERT INTO TRAVEL (id, name, description, category, image_url, rating) VALUES (302, '한국민속촌', '우리나라 전통 가옥과 문화를 체험할 수 있는 테마마을입니다.', '경기', 'images/경기/경기02.jpg', 4.4);
INSERT INTO TRAVEL (id, name, description, category, image_url, rating) VALUES (303, '광명동굴', '신기하고 아름다운 광산 동굴을 탐험할 수 있습니다.', '경기', 'images/경기/경기03.jpg', 4.3);
INSERT INTO TRAVEL (id, name, description, category, image_url, rating) VALUES (304, '안산 대부도', '서해 바다와 아름다운 해안 풍경을 즐길 수 있는 섬입니다.', '경기', 'images/경기/경기04.jpg', 4.2);
INSERT INTO TRAVEL (id, name, description, category, image_url, rating) VALUES (305, '파주 헤이리 예술마을', '다양한 예술 작품과 전시 공간이 있는 문화 예술 마을입니다.', '경기', 'images/경기/경기05.jpg', 4.4);
INSERT INTO TRAVEL (id, name, description, category, image_url, rating) VALUES (306, '용인 에버랜드', '스릴 넘치는 놀이기구와 아름다운 정원을 자랑하는 테마파크입니다.', '경기', 'images/경기/경기06.jpg', 4.7);
INSERT INTO TRAVEL (id, name, description, category, image_url, rating) VALUES (307, '가평 아침고요수목원', '사계절 아름다운 꽃과 나무를 감상할 수 있는 정원입니다.', '경기', 'images/경기/경기07.jpg', 4.6);
INSERT INTO TRAVEL (id, name, description, category, image_url, rating) VALUES (308, '양평 두물머리', '아름다운 강과 자연 경관을 감상하며 산책하기 좋은 곳.', '경기', 'images/경기/경기08.jpg', 4.2);
INSERT INTO TRAVEL (id, name, description, category, image_url, rating) VALUES (309, '남양주 다산유적지', '정약용 선생의 발자취를 따라 역사 공부를 할 수 있는 곳입니다.', '경기', 'images/경기/경기09.jpg', 4.3);
INSERT INTO TRAVEL (id, name, description, category, image_url, rating) VALUES (310, '성남 판교테크노밸리', '첨단 산업의 중심지이자 현대적인 건축물을 감상할 수 있습니다.', '경기', 'images/경기/경기10.jpg', 4.1);
INSERT INTO TRAVEL (id, name, description, category, image_url, rating) VALUES (311, '안양 예술공원', '자연과 예술 작품이 조화롭게 어우러진 아름다운 공원입니다.', '경기', 'images/경기/경기11.jpg', 4.2);
INSERT INTO TRAVEL (id, name, description, category, image_url, rating) VALUES (312, '오산 오색시장', '다양한 먹거리와 볼거리가 있는 활기 넘치는 전통 시장입니다.', '경기', 'images/경기/경기12.jpg', 4.0);
INSERT INTO TRAVEL (id, name, description, category, image_url, rating) VALUES (313, '의왕 백운호수', '아름다운 호수와 주변 경관을 즐기며 휴식을 취할 수 있습니다.', '경기', 'images/경기/경기13.jpg', 4.3);
INSERT INTO TRAVEL (id, name, description, category, image_url, rating) VALUES (314, '고양 행주산성', '임진왜란의 격전지로 역사적인 의미가 깊은 곳입니다.', '경기', 'images/경기/경기14.jpg', 4.4);
INSERT INTO TRAVEL (id, name, description, category, image_url, rating) VALUES (315, '부천 아인스월드', '세계 각국의 유명 건축물 미니어처를 한눈에 볼 수 있습니다.', '경기', 'images/경기/경기15.jpg', 4.1);
INSERT INTO TRAVEL (id, name, description, category, image_url, rating) VALUES (316, '화성 제부도', '썰물 때 바닷길이 열리는 신비로운 섬으로 유명합니다.', '경기', 'images/경기/경기16.jpg', 4.5);
INSERT INTO TRAVEL (id, name, description, category, image_url, rating) VALUES (317, '이천 테르메덴', '다양한 온천과 물놀이 시설을 즐길 수 있는 휴양 시설입니다.', '경기', 'images/경기/경기17.jpg', 4.2);
INSERT INTO TRAVEL (id, name, description, category, image_url, rating) VALUES (318, '여주 세종대왕릉', '조선 4대 왕 세종대왕의 업적을 기리는 웅장한 능입니다.', '경기', 'images/경기/경기18.jpg', 4.4);
INSERT INTO TRAVEL (id, name, description, category, image_url, rating) VALUES (319, '파주 임진각', '분단의 아픔을 느낄 수 있는 역사적인 장소입니다.', '경기', 'images/경기/경기19.jpg', 4.0);
INSERT INTO TRAVEL (id, name, description, category, image_url, rating) VALUES (320, '포천 아트밸리', '폐채석장을 아름다운 문화 예술 공간으로 탈바꿈시킨 곳입니다.', '경기', 'images/경기/경기20.jpg', 4.3);
INSERT INTO TRAVEL (id, name, description, category, image_url, rating) VALUES (321, '하남 스타필드', '쇼핑, 레저, 외식을 한 곳에서 즐길 수 있는 복합 문화 공간입니다.', '경기', 'images/경기/경기21.jpg', 4.1);
INSERT INTO TRAVEL (id, name, description, category, image_url, rating) VALUES (322, '구리 동구릉', '조선 왕릉 중 가장 큰 규모를 자랑하는 웅장한 능입니다.', '경기', 'images/경기/경기22.jpg', 4.2);
INSERT INTO TRAVEL (id, name, description, category, image_url, rating) VALUES (323, '군포 철쭉동산', '봄이면 아름다운 철쭉꽃으로 뒤덮이는 장관을 연출합니다.', '경기', 'images/경기/경기23.jpg', 4.5);
INSERT INTO TRAVEL (id, name, description, category, image_url, rating) VALUES (324, '안성 팜랜드', '넓은 초원에서 다양한 동물과 체험 활동을 즐길 수 있습니다.', '경기', 'images/경기/경기24.jpg', 4.3);

-- 경상도 카테고리 (24개)
INSERT INTO TRAVEL (id, name, description, category, image_url, rating) VALUES (401, '경주 불국사와 석굴암', '신라 천년의 역사와 아름다움을 느낄 수 있는 대표 유적지입니다.', '경상도', 'images/경상도/경상도01.jpg', 4.7);
INSERT INTO TRAVEL (id, name, description, category, image_url, rating) VALUES (402, '부산 해운대 해수욕장', '넓은 백사장과 푸른 바다가 아름다운 한국의 대표 해변입니다.', '경상도', 'images/경상도/경상도02.jpg', 4.5);
INSERT INTO TRAVEL (id, name, description, category, image_url, rating) VALUES (403, '안동 하회마을', '한국의 전통 가옥과 문화를 고스란히 간직한 아름다운 마을입니다.', '경상도', 'images/경상도/경상도03.jpg', 4.4);
INSERT INTO TRAVEL (id, name, description, category, image_url, rating) VALUES (404, '대구 팔공산', '웅장한 산세와 아름다운 자연 경관을 자랑하는 명산입니다.', '경상도', 'images/경상도/경상도04.jpg', 4.3);
INSERT INTO TRAVEL (id, name, description, category, image_url, rating) VALUES (405, '통영 동피랑 벽화마을', '알록달록 아름다운 벽화가 그려진 언덕 위의 예쁜 마을입니다.', '경상도', 'images/경상도/경상도05.jpg', 4.2);
INSERT INTO TRAVEL (id, name, description, category, image_url, rating) VALUES (406, '포항 호미곶', '해돋이 명소로 유명하며 상생의 손 조형물이 인상적인 곳입니다.', '경상도', 'images/경상도/경상도06.jpg', 4.4);
INSERT INTO TRAVEL (id, name, description, category, image_url, rating) VALUES (407, '거제 외도 보타니아', '아름다운 해상 정원으로 다양한 식물과 조각 작품을 감상할 수 있습니다.', '경상도', 'images/경상도/경상도07.jpg', 4.6);
INSERT INTO TRAVEL (id, name, description, category, image_url, rating) VALUES (408, '울산 간절곶', '새해 해맞이 명소로 아름다운 동해 바다를 조망할 수 있습니다.', '경상도', 'images/경상도/경상도08.jpg', 4.3);
INSERT INTO TRAVEL (id, name, description, category, image_url, rating) VALUES (409, '합천 해인사', '팔만대장경을 보관하고 있는 유서 깊은 천년 고찰입니다.', '경상도', 'images/경상도/경상도09.jpg', 4.5);
INSERT INTO TRAVEL (id, name, description, category, image_url, rating) VALUES (410, '경주 첨성대', '신라 시대의 천문 관측소로 역사적인 가치가 높은 유적입니다.', '경상도', 'images/경상도/경상도10.jpg', 4.2);
INSERT INTO TRAVEL (id, name, description, category, image_url, rating) VALUES (411, '부산 감천문화마을', '알록달록한 집들이 계단식으로 이루어진 독특한 풍경을 자랑합니다.', '경상도', 'images/경상도/경상도11.jpg', 4.4);
INSERT INTO TRAVEL (id, name, description, category, image_url, rating) VALUES (412, '영주 부석사', '아름다운 목조 건축물로 유명한 천년 고찰입니다.', '경상도', 'images/경상도/경상도12.jpg', 4.3);
INSERT INTO TRAVEL (id, name, description, category, image_url, rating) VALUES (413, '문경새재', '옛 과거길의 아름다움을 느낄 수 있는 역사적인 고갯길입니다.', '경상도', 'images/경상도/경상도13.jpg', 4.1);
INSERT INTO TRAVEL (id, name, description, category, image_url, rating) VALUES (414, '상주 경천대', '아름다운 자연 경관을 자랑하는 낙동강변의 명소입니다.', '경상도', 'images/경상도/경상도14.jpg', 4.2);
INSERT INTO TRAVEL (id, name, description, category, image_url, rating) VALUES (415, '김천 직지사', '신라 시대에 창건된 오랜 역사와 아름다움을 간직한 사찰입니다.', '경상도', 'images/경상도/경상도15.jpg', 4.3);
INSERT INTO TRAVEL (id, name, description, category, image_url, rating) VALUES (416, '구미 금오산', '기암괴석과 아름다운 자연을 자랑하는 도립공원입니다.', '경상도', 'images/경상도/경상도16.jpg', 4.0);
INSERT INTO TRAVEL (id, name, description, category, image_url, rating) VALUES (417, '창원 진해군항제', '봄이면 벚꽃으로 아름답게 물드는 한국의 대표적인 벚꽃 축제입니다.', '경상도', 'images/경상도/경상도17.jpg', 4.5);
INSERT INTO TRAVEL (id, name, description, category, image_url, rating) VALUES (418, '안동 월영교', '아름다운 야경을 자랑하는 한국에서 가장 긴 목책 인도교입니다.', '경상도', 'images/경상도/경상도18.jpg', 4.4);
INSERT INTO TRAVEL (id, name, description, category, image_url, rating) VALUES (419, '영덕 블루로드', '아름다운 동해안 해안선을 따라 걷는 트레킹 코스입니다.', '경상도', 'images/경상도/경상도19.jpg', 4.3);
INSERT INTO TRAVEL (id, name, description, category, image_url, rating) VALUES (420, '울진 덕구온천', '자연 용출 온천수로 유명한 건강 휴양지입니다.', '경상도', 'images/경상도/경상도20.jpg', 4.2);
INSERT INTO TRAVEL (id, name, description, category, image_url, rating) VALUES (421, '의성 고운사', '신라 시대에 창건된 아름다운 고찰로 조용하고 평화로운 분위기입니다.', '경상도', 'images/경상도/경상도21.jpg', 4.1);
INSERT INTO TRAVEL (id, name, description, category, image_url, rating) VALUES (422, '청도 프로방스', '아름다운 조명과 다양한 포토존이 있는 낭만적인 테마파크입니다.', '경상도', 'images/경상도/경상도22.jpg', 4.3);
INSERT INTO TRAVEL (id, name, description, category, image_url, rating) VALUES (423, '밀양 영남루', '아름다운 누각으로 주변 경관과 어우러져 멋진 풍경을 자랑합니다.', '경상도', 'images/경상도/경상도23.jpg', 4.4);
INSERT INTO TRAVEL (id, name, description, category, image_url, rating) VALUES (424, '창녕 우포늪', '다양한 동식물이 서식하는 아름다운 자연 습지입니다.', '경상도', 'images/경상도/경상도24.jpg', 4.2);

-- 충청도 카테고리 (24개)
INSERT INTO TRAVEL (id, name, description, category, image_url, rating) VALUES (501, '공주 백제문화단지', '백제 시대의 역사와 문화를 체험할 수 있는 테마파크입니다.', '충청도', 'images/충청도/충청도01.jpg', 4.4);
INSERT INTO TRAVEL (id, name, description, category, image_url, rating) VALUES (502, '청주 상당산성', '아름다운 자연과 역사가 어우러진 힐링 명소입니다.', '충청도', 'images/충청도/충청도02.jpg', 4.3);
INSERT INTO TRAVEL (id, name, description, category, image_url, rating) VALUES (503, '대전 오월드', '동물원, 플라워랜드, 놀이시설을 갖춘 종합 테마공원입니다.', '충청도', 'images/충청도/충청도03.jpg', 4.2);
INSERT INTO TRAVEL (id, name, description, category, image_url, rating) VALUES (504, '보령 대천해수욕장', '넓은 백사장과 다양한 해양 액티비티를 즐길 수 있는 곳입니다.', '충청도', 'images/충청도/충청도04.jpg', 4.1);
INSERT INTO TRAVEL (id, name, description, category, image_url, rating) VALUES (505, '단양 팔경', '도담삼봉, 석문 등 아름다운 자연 경관을 자랑하는 8곳입니다.', '충청도', 'images/충청도/충청도05.jpg', 4.5);
INSERT INTO TRAVEL (id, name, description, category, image_url, rating) VALUES (506, '제천 청풍호반 케이블카', '아름다운 청풍호와 주변 산세를 감상할 수 있는 케이블카입니다.', '충청도', 'images/충청도/충청도06.jpg', 4.4);
INSERT INTO TRAVEL (id, name, description, category, image_url, rating) VALUES (507, '서산 해미읍성', '잘 보존된 조선 시대 읍성으로 역사적인 가치가 높습니다.', '충청도', 'images/충청도/충청도07.jpg', 4.3);
INSERT INTO TRAVEL (id, name, description, category, image_url, rating) VALUES (508, '논산 탑정호', '넓고 잔잔한 호수와 아름다운 주변 경관을 자랑합니다.', '충청도', 'images/충청도/충청도08.jpg', 4.2);
INSERT INTO TRAVEL (id, name, description, category, image_url, rating) VALUES (509, '부여 백마강', '백제 시대의 역사를 품고 흐르는 아름다운 강입니다.', '충청도', 'images/충청도/충청도09.jpg', 4.1);
INSERT INTO TRAVEL (id, name, description, category, image_url, rating) VALUES (510, '태안 안면도', '아름다운 해변과 자연 휴양림을 즐길 수 있는 서해안의 보석입니다.', '충청도', 'images/충청도/충청도10.jpg', 4.5);
INSERT INTO TRAVEL (id, name, description, category, image_url, rating) VALUES (511, '진천 농다리', '독특한 모양의 오래된 돌다리로 아름다움을 자랑합니다.', '충청도', 'images/충청도/충청도11.jpg', 4.3);
INSERT INTO TRAVEL (id, name, description, category, image_url, rating) VALUES (512, '예산 수덕사', '아름다운 고찰로 대웅전의 건축미가 뛰어납니다.', '충청도', 'images/충청도/충청도12.jpg', 4.4);
INSERT INTO TRAVEL (id, name, description, category, image_url, rating) VALUES (513, '아산 온양온천', '오랜 역사를 자랑하는 국내 대표적인 온천 휴양지입니다.', '충청도', 'images/충청도/충청도13.jpg', 4.2);
INSERT INTO TRAVEL (id, name, description, category, image_url, rating) VALUES (514, '옥천 장령산자연휴양림', '울창한 숲과 맑은 계곡이 있는 힐링 명소입니다.', '충청도', 'images/충청도/충청도14.jpg', 4.1;
INSERT INTO TRAVEL (id, name, description, category, image_url, rating) VALUES (515, '금산 태고사', '조용하고 아늑한 분위기의 아름다운 사찰입니다.', '충청도', 'images/충청도/충청도15.jpg', 4.3);
INSERT INTO TRAVEL (id, name, description, category, image_url, rating) VALUES (516, '괴산 산막이옛길', '아름다운 호수와 숲길을 따라 걷는 트레킹 코스입니다.', '충청도', 'images/충청도/충청도16.jpg', 4.4);
INSERT INTO TRAVEL (id, name, description, category, image_url, rating) VALUES (517, '보은 속리산', '웅장한 산세와 아름다운 자연 경관을 자랑하는 국립공원입니다.', '충청도', 'images/충청도/충청도17.jpg', 4.5);
INSERT INTO TRAVEL (id, name, description, category, image_url, rating) VALUES (518, '서천 국립생태원', '다양한 생태계를 체험하고 학습할 수 있는 교육적인 공간입니다.', '충청도', 'images/충청도/충청도18.jpg', 4.2);
INSERT INTO TRAVEL (id, name, description, category, image_url, rating) VALUES (519, '증평 보강천 미루나무숲', '아름다운 미루나무들이 줄지어 서 있는 멋진 숲길입니다.', '충청도', 'images/충청도/충청도19.jpg', 4.1);
INSERT INTO TRAVEL (id, name, description, category, image_url, rating) VALUES (520, '청양 천장호 출렁다리', '아찔하고 스릴 넘치는 호수 위를 걷는 출렁다리입니다.', '충청도', 'images/충청도/충청도20.jpg', 4.3);
INSERT INTO TRAVEL (id, name, description, category, image_url, rating) VALUES (521, '홍성 남당항', '싱싱한 해산물을 맛볼 수 있는 서해안의 대표적인 항구입니다.', '충청도', 'images/충청도/충청도21.jpg', 4.2);
INSERT INTO TRAVEL (id, name, description, category, image_url, rating) VALUES (522, '음성 봉학골 산림욕장', '울창한 숲 속에서 상쾌한 공기를 마시며 힐링할 수 있습니다.', '충청도', 'images/충청도/충청도22.jpg', 4.4);
INSERT INTO TRAVEL (id, name, description, category, image_url, rating) VALUES (523, '옥천 용암사', '아름다운 운해를 감상할 수 있는 멋진 사찰입니다.', '충청도', 'images/충청도/충청도23.jpg', 4.3);
INSERT INTO TRAVEL (id, name, description, category, image_url, rating) VALUES (524, '계룡산 국립공원', '아름다운 자연 경관과 다양한 등산 코스를 자랑합니다.', '충청도', 'images/충청도/충청도24.jpg', 4.5);

-- 전라도 카테고리 (24개)
INSERT INTO TRAVEL (id, name, description, category, image_url, rating) VALUES (601, '전주 한옥마을', '한국 전통 가옥의 아름다움을 느낄 수 있는 대표적인 곳입니다.', '전라도', 'images/전라도/전라도01.jpg', 4.6);
INSERT INTO TRAVEL (id, name, description, category, image_url, rating) VALUES (602, '담양 죽녹원', '푸른 대나무 숲길을 걸으며 힐링할 수 있는 아름다운 곳입니다.', '전라도', 'images/전라도/전라도02.jpg', 4.5);
INSERT INTO TRAVEL (id, name, description, category, image_url, rating) VALUES (603, '여수 오동도', '동백꽃과 푸른 바다가 아름다운 남해안의 대표적인 섬입니다.', '전라도', 'images/전라도/전라도03.jpg', 4.4);
INSERT INTO TRAVEL (id, name, description, category, image_url, rating) VALUES (604, '순천만 습지', '아름다운 갈대밭과 다양한 철새를 관찰할 수 있는 자연 생태 공간입니다.', '전라도', 'images/전라도/전라도04.jpg', 4.3);
INSERT INTO TRAVEL (id, name, description, category, image_url, rating) VALUES (605, '군산 근대역사박물관', '근대 시대의 역사와 문화를 엿볼 수 있는 교육적인 공간입니다.', '전라도', 'images/전라도/전라도05.jpg', 4.2);
INSERT INTO TRAVEL (id, name, description, category, image_url, rating) VALUES (606, '목포 해상케이블카', '아름다운 다도해와 목포 시내를 한눈에 조망할 수 있습니다.', '전라도', 'images/전라도/전라도06.jpg', 4.4);
INSERT INTO TRAVEL (id, name, description, category, image_url, rating) VALUES (607, '보성 녹차밭', '푸른 녹차 밭이 펼쳐진 아름다운 풍경을 감상할 수 있습니다.', '전라도', 'images/전라도/전라도07.jpg', 4.5);
INSERT INTO TRAVEL (id, name, description, category, image_url, rating) VALUES (608, '광주 국립아시아문화전당', '아시아 문화 예술의 허브 역할을 하는 복합 문화 공간입니다.', '전라도', 'images/전라도/전라도08.jpg', 4.3);
INSERT INTO TRAVEL (id, name, description, category, image_url, rating) VALUES (609, '남원 광한루원', '춘향전의 배경이 된 아름다운 전통 정원입니다.', '전라도', 'images/전라도/전라도09.jpg', 4.2);
INSERT INTO TRAVEL (id, name, description, category, image_url, rating) VALUES (610, '고창 고인돌 유적', '청동기 시대의 거석 문화를 보여주는 세계문화유산입니다.', '전라도', 'images/전라도/전라도10.jpg', 4.1);
INSERT INTO TRAVEL (id, name, description, category, image_url, rating) VALUES (611, '진도 신비의 바닷길', '썰물 때 바다가 갈라지는 신비로운 현상을 볼 수 있습니다.', '전라도', 'images/전라도/전라도11.jpg', 4.3);
INSERT INTO TRAVEL (id, name, description, category, image_url, rating) VALUES (612, '영광 백수해안도로', '아름다운 서해 바다를 따라 드라이브하기 좋은 해안 도로입니다.', '전라도', 'images/전라도/전라도12.jpg', 4.4);
INSERT INTO TRAVEL (id, name, description, category, image_url, rating) VALUES (613, '무주 덕유산 국립공원', '사계절 아름다운 자연을 자랑하는 덕유산 국립공원입니다.', '전라도', 'images/전라도/전라도13.jpg', 4.2);
INSERT INTO TRAVEL (id, name, description, category, image_url, rating) VALUES (614, '정읍 내장산 국립공원', '가을 단풍이 아름답기로 유명한 국립공원입니다.', '전라도', 'images/전라도/전라도14.jpg', 4.5);
INSERT INTO TRAVEL (id, name, description, category, image_url, rating) VALUES (615, '해남 땅끝마을', '한반도의 최남단에 위치한 상징적인 장소입니다.', '전라도', 'images/전라도/전라도15.jpg', 4.3);
INSERT INTO TRAVEL (id, name, description, category, image_url, rating) VALUES (616, '강진 가우도', '아름다운 출렁다리와 해안 산책로가 있는 섬입니다.', '전라도', 'images/전라도/전라도16.jpg', 4.1);
INSERT INTO TRAVEL (id, name, description, category, image_url, rating) VALUES (617, '구례 화엄사', '지리산 자락에 위치한 아름다운 고찰입니다.', '전라도', 'images/전라도/전라도17.jpg', 4.4);
INSERT INTO TRAVEL (id, name, description, category, image_url, rating) VALUES (618, '순창 강천산 군립공원', '아름다운 계곡과 폭포를 감상할 수 있는 곳입니다.', '전라도', 'images/전라도/전라도18.jpg', 4.2);
INSERT INTO TRAVEL (id, name, description, category, image_url, rating) VALUES (619, '김제 금산사', '아름다운 건축물과 역사를 자랑하는 사찰입니다.', '전라도', 'images/전라도/전라도19.jpg', 4.3);
INSERT INTO TRAVEL (id, name, description, category, image_url, rating) VALUES (620, '완도 청산도', '아름다운 자연 경관과 슬로시티로 유명한 섬입니다.', '전라도', 'images/전라도/전라도20.jpg', 4.5);
INSERT INTO TRAVEL (id, name, description, category, image_url, rating) VALUES (621, '부안 채석강', '기암괴석과 해식 동굴이 아름다운 해안 절벽입니다.', '전라도', 'images/전라도/전라도21.jpg', 4.2);
INSERT INTO TRAVEL (id, name, description, category, image_url, rating) VALUES (622, '영암 월출산 국립공원', '기암괴석과 아름다운 능선이 장관인 산입니다.', '전라도', 'images/전라도/전라도22.jpg', 4.4);
INSERT INTO TRAVEL (id, name, description, category, image_url, rating) VALUES (623, '장성 백양사', '아름다운 단풍과 고즈넉한 분위기가 매력적인 사찰입니다.', '전라도', 'images/전라도/전라도23.jpg', 4.3);
INSERT INTO TRAVEL (id, name, description, category, image_url, rating) VALUES (624, '신안 증도', '때묻지 않은 자연과 아름다운 해변을 간직한 섬입니다.', '전라도', 'images/전라도/전라도24.jpg', 4.5);

-- 제주 카테고리 (24개)
INSERT INTO TRAVEL (id, name, description, category, image_url, rating) VALUES (701, '성산일출봉', '웅장한 자연 경관을 자랑하는 제주도의 대표적인 명소입니다.', '제주', 'images/제주/제주01.jpg', 4.8);
INSERT INTO TRAVEL (id, name, description, category, image_url, rating) VALUES (702, '섭지코지', '아름다운 해안 절벽과 초원이 어우러진 그림 같은 곳입니다.', '제주', 'images/제주/제주02.jpg', 4.7);
INSERT INTO TRAVEL (id, name, description, category, image_url, rating) VALUES (703, '한라산 국립공원', '한국에서 가장 높은 산으로 아름다운 자연을 만끽할 수 있습니다.', '제주', 'images/제주/제주03.jpg', 4.6);
INSERT INTO TRAVEL (id, name, description, category, image_url, rating) VALUES (704, '제주 올레길', '제주의 아름다운 해안과 마을을 따라 걷는 트레킹 코스입니다.', '제주', 'images/제주/제주04.jpg', 4.5);
INSERT INTO TRAVEL (id, name, description, category, image_url, rating) VALUES (705, '협재해수욕장', '하얀 백사장과 에메랄드빛 바다가 아름다운 해변입니다.', '제주', 'images/제주/제주05.jpg', 4.4);
INSERT INTO TRAVEL (id, name, description, category, image_url, rating) VALUES (706, '월정리해변', '아름다운 해변과 감성적인 카페들이 있는 인기 명소입니다.', '제주', 'images/제주/제주06.jpg', 4.5);
INSERT INTO TRAVEL (id, name, description, category, image_url, rating) VALUES (707, '만장굴', '세계적으로 긴 용암 동굴로 신비로운 내부를 탐험할 수 있습니다.', '제주', 'images/제주/제주07.jpg', 4.3);
INSERT INTO TRAVEL (id, name, description, category, image_url, rating) VALUES (708, '에코랜드 테마파크', '곶자왈 숲 속에서 기차를 타고 다양한 체험을 할 수 있습니다.', '제주', 'images/제주/제주08.jpg', 4.4);
INSERT INTO TRAVEL (id, name, description, category, image_url, rating) VALUES (709, '천지연폭포', '웅장한 물줄기가 쏟아지는 아름다운 폭포입니다.', '제주', 'images/제주/제주09.jpg', 4.2);
INSERT INTO TRAVEL (id, name, description, category, image_url, rating) VALUES (710, '오설록 티 뮤지엄', '녹차밭과 함께 다양한 차 문화를 경험할 수 있는 곳입니다.', '제주', 'images/제주/제주10.jpg', 4.3);
INSERT INTO TRAVEL (id, name, description, category, image_url, rating) VALUES (711, '카멜리아힐', '다양한 종류의 동백꽃을 감상할 수 있는 아름다운 정원입니다.', '제주', 'images/제주/제주11.jpg', 4.6);
INSERT INTO TRAVEL (id, name, description, category, image_url, rating) VALUES (712, '비자림', '오래된 비자나무 숲길을 걸으며 힐링할 수 있는 곳입니다.', '제주', 'images/제주/제주12.jpg', 4.4);
INSERT INTO TRAVEL (id, name, description, category, image_url, rating) VALUES (713, '성읍민속마을', '제주 전통 가옥과 생활 모습을 엿볼 수 있는 곳입니다.', '제주', 'images/제주/제주13.jpg', 4.3);
INSERT INTO TRAVEL (id, name, description, category, image_url, rating) VALUES (714, '주상절리대', '자연이 만든 신비로운 육각형 돌기둥을 감상할 수 있습니다.', '제주', 'images/제주/제주14.jpg', 4.5);
INSERT INTO TRAVEL (id, name, description, category, image_url, rating) VALUES (715, '애월 해안도로', '아름다운 제주 서쪽 해안을 따라 드라이브하기 좋은 코스입니다.', '제주', 'images/제주/제주15.jpg', 4.4);
INSERT INTO TRAVEL (id, name, description, category, image_url, rating) VALUES (716, '함덕해수욕장', '수심이 얕고 물이 맑아 가족 단위 피서객에게 인기 있는 해변입니다.', '제주', 'images/제주/제주16.jpg', 4.3);
INSERT INTO TRAVEL (id, name, description, category, image_url, rating) VALUES (717, '용두암', '용의 머리 모양을 닮은 독특한 바위입니다.', '제주', 'images/제주/제주17.jpg', 4.2);
INSERT INTO TRAVEL (id, name, description, category, image_url, rating) VALUES (718, '이호테우해변', '빨간색과 흰색 말 모양 등대가 있는 아름다운 해변입니다.', '제주', 'images/제주/제주18.jpg', 4.3);
INSERT INTO TRAVEL (id, name, description, category, image_url, rating) VALUES (719, '선녀와 나무꾼 테마공원', '옛 추억을 떠올리게 하는 다양한 볼거리가 있는 곳입니다.', '제주', 'images/제주/제주19.jpg', 4.1);
INSERT INTO TRAVEL (id, name, description, category, image_url, rating) VALUES (720, '제주민속촌', '제주의 옛 생활 모습을 재현한 민속 테마 공원입니다.', '제주', 'images/제주/제주20.jpg', 4.4);

commit;

select * from TRAVEL;