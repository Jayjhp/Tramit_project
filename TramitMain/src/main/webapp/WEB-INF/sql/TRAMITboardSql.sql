-- 게시글 번호, 제목, 내용, 글쓴이, 날짜, 조회수, 비밀번호, 파일정보,
-- no, title, writer, content, reg_date, read_count, pass, file1

DROP TABLE tramitboard;

-- 공지사항 게시판
CREATE TABLE tramitboard(
  no NUMBER PRIMARY KEY,
  title VARCHAR2(50 CHAR) NOT NULL,
  writer VARCHAR2(20 CHAR) NOT NULL,
  content VARCHAR2(1000 CHAR) NOT NULL,
  reg_date TIMESTAMP NOT NULL,
  read_count NUMBER(5) NOT NULL,
  pass VARCHAR2(20 CHAR) NOT NULL,
  file1 VARCHAR2(100 CHAR),
  recommend NUMBER DEFAULT 0,
  thank NUMBER DEFAULT 0
);

DROP SEQUENCE tramitboard_seq;
CREATE SEQUENCE tramitboard_seq;

DROP TABLE member;

-- 회원 정보
CREATE TABLE member (
    id VARCHAR2(20) PRIMARY KEY,
	name VARCHAR2(50 CHAR) NOT NULL,
	pass VARCHAR2(15) NOT NULL,
	email VARCHAR2(30) NOT NULL,
	mobile VARCHAR2(13) NOT NULL,
	reg_date TIMESTAMP NOT NULL
);

-- 리뷰게시판
-- 기존 리뷰게시판 테이블 삭제 (필요시)
DROP TABLE reviewboard;

-- 리뷰게시판 테이블 생성
CREATE TABLE reviewboard (
    r_no NUMBER PRIMARY KEY,                      -- 게시글 번호
    r_title VARCHAR2(50 CHAR) NOT NULL,           -- 리뷰 제목
    r_writer VARCHAR2(20 CHAR) NOT NULL,          -- 작성자
    r_content VARCHAR2(1000 CHAR) NOT NULL,       -- 리뷰 내용
    r_reg_date TIMESTAMP NOT NULL,                -- 작성일
    r_read_count NUMBER(5) DEFAULT 0 NOT NULL,    -- 조회수
    r_pass VARCHAR2(20 CHAR) NOT NULL,            -- 비밀번호 (수정/삭제용)
    r_file1 VARCHAR2(100 CHAR),                   -- 첨부파일
    r_rating NUMBER(2,1),                         -- ★ 평점 (선택사항, 0.0 ~ 5.0)
    r_category VARCHAR2(20)                       -- 카테고리 (예: 음식, 여행, 제품 등)
);

ALTER TABLE reviewboard ADD (
    recommend NUMBER DEFAULT 0,
    thank NUMBER DEFAULT 0
);

-- 시퀀스 생성
DROP SEQUENCE reviewboard_seq;
CREATE SEQUENCE reviewboard_seq;


DROP TABLE reply;
-- 리뷰 게시판의 댓글 정보
CREATE TABLE reply(
	no NUMBER(7) PRIMARY KEY,
	reviewB_no NUMBER(7) NOT NULL,
	reply_content VARCHAR2(500 CHAR),
	reply_writer VARCHAR2(20 CHAR) NOT NULL,
	reg_date TIMESTAMP NOT NULL,	
	CONSTRAINT reply_fk FOREIGN KEY(reviewB_no) REFERENCES reviewboard(r_no)
);

-- 자주 찾는 질문 게시판
CREATE TABLE questionboard (
  id NUMBER PRIMARY KEY,
  title VARCHAR2(50 CHAR) NOT NULL,
  writer VARCHAR2(20 CHAR) NOT NULL,
  content VARCHAR2(1000 CHAR) NOT NULL,
  password VARCHAR2(20 CHAR) NOT NULL,
  regDate TIMESTAMP NOT NULL
);

CREATE SEQUENCE questionboard_seq;

-- 댓글 테이블의 시퀀스
DROP SEQUENCE reply_seq;
CREATE SEQUENCE reply_seq
      MAXVALUE 9999999
      INCREMENT BY 1      
      NOCACHE
      NOORDER
      NOCYCLE;

-- 회원 정보
INSERT INTO member VALUES('midas', '홍길동', '1234', 
	'midastop@naver.com', '010-1234-5678', '2023-06-06 12:10:30');
INSERT INTO member VALUES('admin', '이순신', '1234', 
	'midastop1@naver.com', '010-4321-8765', '2023-05-11 11:20:50');
INSERT INTO member VALUES('servlet', '강감찬', '1234', 
	'midas@daum.net', '010-5687-5678', '2023-06-05 12:10:30');

commit;
SELECT * FROM member;


-- 아래 SQL 쿼리를 COMMIT까지 1번 실행해 테이블에 데이터를 추가한다. 
INSERT INTO tramitboard (no,title,writer,content,reg_date,read_count,pass,file1) VALUES (tramitboard_seq.NEXTVAL,'공지 사항 입니다.','관리자','안녕하세요' || CHR(13) || CHR(10) || '이번에 어쩌구 저쩌구 해서리...' || CHR(13) || CHR(10) || CHR(13) || CHR(10) || '\r\n\r\n이렇게 운영계획과 약관을 바꾸게 되었습니다.' || CHR(13) || CHR(10) || CHR(13) || CHR(10) || '회원님들의 양해를 구하며 사이트 이용해 참고 하시기 바랍니다.' || CHR(13) || CHR(10) || CHR(13) || CHR(10),'2023-04-27 01:44:58',15,'1234',null);
INSERT INTO tramitboard (no,title,writer,content,reg_date,read_count,pass,file1) VALUES (tramitboard_seq.NEXTVAL,'공지 사항 잘 읽었습니다.','회원1','아~ 관리자님~' || CHR(13) || CHR(10) || CHR(13) || CHR(10) || '공지사항 잘 읽었습니다.' || CHR(13) || CHR(10) || CHR(13) || CHR(10) || '그런데 궁금한 것이 있어 게시글 남깁니다.' || CHR(13) || CHR(10) || CHR(13) || CHR(10) || '이렇게 저렇게 해서리... 궁금합니다.' || CHR(13) || CHR(10) || CHR(13) || CHR(10) || '답변 부탁 드립니다.','2023-04-27 05:43:38',53,'1234',null);
INSERT INTO tramitboard (no,title,writer,content,reg_date,read_count,pass,file1) VALUES (tramitboard_seq.NEXTVAL,'관심을 가져 주셔서...','관리자','안녕하세요' || CHR(13) || CHR(10) || CHR(13) || CHR(10) || '관리자 입니다.' || CHR(13) || CHR(10) || CHR(13) || CHR(10) || '이번에 변경된 회원 약관에 대해 관심을 가져 주셔서 감사합니다.' || CHR(13) || CHR(10) || CHR(13) || CHR(10) || '사이트를 운영하다 보니.. ' || CHR(13) || CHR(10) || CHR(13) || CHR(10) || '어쩔수 없이 어쩌구 저쩌구 해서 약관이 변경되었습니다.' || CHR(13) || CHR(10) || CHR(13) || CHR(10) || '그럼 좋은 하루 되시길 바랍니다.','2023-04-27 05:44:32',35,'1234',null);
INSERT INTO tramitboard (no,title,writer,content,reg_date,read_count,pass,file1) VALUES (tramitboard_seq.NEXTVAL,'저두 궁금했었는데','회원2','안녕하세요' || CHR(13) || CHR(10) || CHR(13) || CHR(10) || '저두 궁금했었는데...' || CHR(13) || CHR(10) || CHR(13) || CHR(10) || '님께서 질문을 해 주셔서 고맙습니다.' || CHR(13) || CHR(10) || CHR(13) || CHR(10) || '즐공하시고 행복한 하루 되세요..^_^','2023-04-27 05:44:32',103,'1234',null);
INSERT INTO tramitboard (no,title,writer,content,reg_date,read_count,pass,file1) VALUES (tramitboard_seq.NEXTVAL,'당연히 회원이면 관심을 가져야죠^_^','회원1','안녕하세요' || CHR(13) || CHR(10) || CHR(13) || CHR(10) || '당연히 회원이니까 약관 변경에 관심을 가져야죠' || CHR(13) || CHR(10) || CHR(13) || CHR(10) || '아무튼 오늘도 좋은 하루 보내세요','2023-04-27 05:44:32',42,'1234',null);
INSERT INTO tramitboard (no,title,writer,content,reg_date,read_count,pass,file1) VALUES (tramitboard_seq.NEXTVAL,'많은 회원님들께서 관심을 가져주셔서 감사합니다.','관리자','안녕하세요' || CHR(13) || CHR(10) || '관리자 입니다.' || CHR(13) || CHR(10) || CHR(13) || CHR(10) || '많은 회원분들께서 이번 약관 변경에 관심을 가져 주셔서 정말 고맙습니다.' || CHR(13) || CHR(10) || CHR(13) || CHR(10) || '앞으로 더욱 발전하는 사이트가 되겠습니다.' || CHR(13) || CHR(10) || CHR(13) || CHR(10) || '그럼 언제나 행복하세요.^_^','2023-04-27 16:30:41',36,'1234',null);
INSERT INTO tramitboard (no,title,writer,content,reg_date,read_count,pass,file1) VALUES (tramitboard_seq.NEXTVAL,'사이트 발전에 관심이 많은 사람입니다.','회원3','안녕하삼~ 관리자님~' || CHR(13) || CHR(10) || CHR(13) || CHR(10) || '사이트 발전에 관심이 많은 사람으로서 지금 보다 나은 사이트를 위해' || CHR(13) || CHR(10) || '운영계획과 약관을 변경하는 것은 잘 된 일이라 생각합니다.' || CHR(13) || CHR(10) || CHR(13) || CHR(10) || '그럼 수고 많이 하삼~','2023-04-27 05:03:52',82,'1234',null);
INSERT INTO tramitboard (no,title,writer,content,reg_date,read_count,pass,file1) VALUES (tramitboard_seq.NEXTVAL,'정말 정말 감사합니다.','관리자','안녕하세요' || CHR(13) || CHR(10) || CHR(13) || CHR(10) || '관리자 입니다.' || CHR(13) || CHR(10) || CHR(13) || CHR(10) || '회원님의 많은 관심에 몸둘바를 모르겠습니다.' || CHR(13) || CHR(10) || CHR(13) || CHR(10) || '언제나 해복하고 건강하시기 바라겠습니다.','2023-04-27 05:44:32',132,'1234',null);
INSERT INTO tramitboard (no,title,writer,content,reg_date,read_count,pass,file1) VALUES (tramitboard_seq.NEXTVAL,'네 잘 알겠습니다.','회원4','안녕하세요...' || CHR(13) || CHR(10) || CHR(13) || CHR(10) || '역쉬~ 관리자님은 부지런 하십니다.' || CHR(13) || CHR(10) || CHR(13) || CHR(10) || '하하하~ 사이트가 팍팍 발전해 나가는 것이 보이는 것 같습니다.' || CHR(13) || CHR(10) || CHR(13) || CHR(10) || '관리자님의 끊임없는 노력에 박수를 보냅니다.' || CHR(13) || CHR(10) || CHR(13) || CHR(10) || '그럼 수고하세요','2023-04-27 03:37:44',97,'1234',null);
INSERT INTO tramitboard (no,title,writer,content,reg_date,read_count,pass,file1) VALUES (tramitboard_seq.NEXTVAL,'내용을 줄 바꿈하지 않아서...','관리자','안녕하세요..' || CHR(13) || CHR(10) || CHR(13) || CHR(10) || '님께서 작성한 글이 줄 바꿈되지 않아서..' || CHR(13) || CHR(10) || CHR(13) || CHR(10) || '테이블이 늘어나내요' || CHR(13) || CHR(10) || CHR(13) || CHR(10) || 'ㅋㅋㅋ','2023-04-27 05:04:23',64,'1234',null);
INSERT INTO tramitboard (no,title,writer,content,reg_date,read_count,pass,file1) VALUES (tramitboard_seq.NEXTVAL,'저두요~','회원5','저두 그게 궁금했는데...' || CHR(13) || CHR(10) || CHR(13) || CHR(10) || 'ㅋㅋㅋ 님께서 대신 해주시네요...^_^','2023-04-27 05:44:32',15,'1234',null);
INSERT INTO tramitboard (no,title,writer,content,reg_date,read_count,pass,file1) VALUES (tramitboard_seq.NEXTVAL,'당연하죠~','회원6','안녕하세요 관리자님~' || CHR(13) || CHR(10) || CHR(13) || CHR(10) || '회원이니까 관심을 갖는건 당연하죠..' || CHR(13) || CHR(10) || CHR(13) || CHR(10) || '아무튼 수고가 많으시네요..','2023-04-27 05:44:32',9,'1234',null);
INSERT INTO tramitboard (no,title,writer,content,reg_date,read_count,pass,file1) VALUES (tramitboard_seq.NEXTVAL,'별 말씀을 다하시네요','회원1','안녕하세요 관리자님~' || CHR(13) || CHR(10) || CHR(13) || CHR(10) || '회원이면 당연히... 관심을 가져야져..' || CHR(13) || CHR(10) || CHR(13) || CHR(10) || '헤헤헤' || CHR(13) || CHR(10) || CHR(13) || CHR(10) || '수고하세요','2023-04-27 05:44:32',79,'1234',null);
INSERT INTO tramitboard (no,title,writer,content,reg_date,read_count,pass,file1) VALUES (tramitboard_seq.NEXTVAL,'회원이면 당연한 것을...','회원3','ㅋㅋㅋ' || CHR(13) || CHR(10) || CHR(13) || CHR(10) || '님들도 다 같은 생각을 가지고 계시군요' || CHR(13) || CHR(10) || CHR(13) || CHR(10) || '뭐 같은 회원이니...' || CHR(13) || CHR(10) || CHR(13) || CHR(10) || '아무튼 모두들 행복하삼~','2023-04-27 05:44:32',38,'1234',null);
INSERT INTO tramitboard (no,title,writer,content,reg_date,read_count,pass,file1) VALUES (tramitboard_seq.NEXTVAL,'그러게요','회원3','아~ ' || CHR(13) || CHR(10) || CHR(13) || CHR(10) || '줄 바꿈 하지 않아도 자동으로 될 줄 알았죠..^_^' || CHR(13) || CHR(10) || CHR(13) || CHR(10) || '관리자님이 프로그램 잘 해주셔서... 줄 바꿈 해주삼~' || CHR(13) || CHR(10) || CHR(13) || CHR(10) || '그럼 이만','2023-04-27 04:59:15',46,'1234',null);
INSERT INTO tramitboard (no,title,writer,content,reg_date,read_count,pass,file1) VALUES (tramitboard_seq.NEXTVAL,'감사합니다.','관리자','안녕하세요' || CHR(13) || CHR(10) || CHR(13) || CHR(10) || '답변글 감사합니다.\r\n\r\n\r\n그럼','2023-04-27 03:40:43',16,'1234',null);
INSERT INTO tramitboard (no,title,writer,content,reg_date,read_count,pass,file1) VALUES (tramitboard_seq.NEXTVAL,'아 줄 바꿈 문제 해결 했습니다.','관리자','안녕하세요 관리자 입니다.' || CHR(13) || CHR(10) || CHR(13) || CHR(10) || '먼저 엔터키를 치지않고 글 을 입력하면 줄 바꿈 되지 않는 문제가 발생했는데.. ' || CHR(13) || CHR(10) || CHR(13) || CHR(10) || '어제 해결 했습니다.' || CHR(13) || CHR(10) || CHR(13) || CHR(10) || '그럼 모두들 즐공 하삼~' || CHR(13) || CHR(10) || CHR(13) || CHR(10) || '','2023-04-27 04:58:45',35,'1234',null);
INSERT INTO tramitboard (no,title,writer,content,reg_date,read_count,pass,file1) VALUES (tramitboard_seq.NEXTVAL,'저두 궁금했는데','회원7','안녕하세요' || CHR(13) || CHR(10) || CHR(13) || CHR(10) || '저두 궁금한 점이 해결 되었습니다.' || CHR(13) || CHR(10) || CHR(13) || CHR(10) || '감사합니다.' || CHR(13) || CHR(10) || CHR(13) || CHR(10) || '그럼 모두 수고하삼~','2023-04-27 05:44:32',81,'1234',null);
INSERT INTO tramitboard (no,title,writer,content,reg_date,read_count,pass,file1) VALUES (tramitboard_seq.NEXTVAL,'궁금한게 해결 되었네요','회원8','안녕하세요' || CHR(13) || CHR(10) || CHR(13) || CHR(10) || '님 덕분에 궁금한점이 해결 되었습니다.' || CHR(13) || CHR(10) || CHR(13) || CHR(10) || '감사합니다.' || CHR(13) || CHR(10) || CHR(13) || CHR(10) || '그럼 이만...^_^','2023-04-27 05:50:21',77,'1234',null);
INSERT INTO tramitboard (no,title,writer,content,reg_date,read_count,pass,file1) VALUES (tramitboard_seq.NEXTVAL,'감사합니다.','회원1','제 덕분에 궁금한게 해결 되었다니...' || CHR(13) || CHR(10) || CHR(13) || CHR(10) || '다행입니다.' || CHR(13) || CHR(10) || CHR(13) || CHR(10) || '즐공하삼~','2023-04-27 05:44:32',162,'1234',null);
COMMIT;
SELECT * FROM tramitboard ORDER BY no DESC;

INSERT INTO reviewboard (r_no, r_title, r_writer, r_content, r_reg_date, r_read_count, r_pass, r_file1, r_rating, r_category)
VALUES (1, '서울 맛집 탐방', 'kimfoodie', '강남역 근처 XX고기집 정말 맛있어요!', TO_TIMESTAMP('2025-05-01 12:30:00', 'YYYY-MM-DD HH24:MI:SS'), 120, 'pass123', 'seoul_meat.jpg', 4.5, '음식');
INSERT INTO reviewboard (r_no, r_title, r_writer, r_content, r_reg_date, r_read_count, r_pass, r_file1, r_rating, r_category)
VALUES (2, '제주도 여행 후기', 'parktrip', '한라산 등반과 성산일출봉에서의 일출 최고였습니다!', TO_TIMESTAMP('2025-04-28 09:00:00', 'YYYY-MM-DD HH24:MI:SS'), 85, 'jeju321', 'hallasan.png', 5.0, '여행');
INSERT INTO reviewboard (r_no, r_title, r_writer, r_content, r_reg_date, r_read_count, r_pass, r_file1, r_rating, r_category)
VALUES (3, '무선 이어폰 솔직 리뷰', 'techguy', '가격 대비 음질이 아쉽네요. 노이즈캔슬은 괜찮습니다.', TO_TIMESTAMP('2025-04-30 14:15:00', 'YYYY-MM-DD HH24:MI:SS'), 67, 'ear2025', NULL, 3.2, '제품');
INSERT INTO reviewboard (r_no, r_title, r_writer, r_content, r_reg_date, r_read_count, r_pass, r_file1, r_rating, r_category)
VALUES (4, '부산 해운대 카페', 'cafelover', '뷰도 좋고 커피도 맛있었어요~', TO_TIMESTAMP('2025-05-02 10:00:00', 'YYYY-MM-DD HH24:MI:SS'), 42, 'busan987', 'haeundae.jpg', 4.7, '음식');
INSERT INTO reviewboard (r_no, r_title, r_writer, r_content, r_reg_date, r_read_count, r_pass, r_file1, r_rating, r_category)
VALUES (5, '제주 렌터카 이용 팁', 'triphelper', '조기 예약이 중요하고, 보험 포함 확인 필수입니다.', TO_TIMESTAMP('2025-04-25 11:45:00', 'YYYY-MM-DD HH24:MI:SS'), 55, 'rentcar88', NULL, 4.0, '여행');
INSERT INTO reviewboard (r_no, r_title, r_writer, r_content, r_reg_date, r_read_count, r_pass, r_file1, r_rating, r_category)
VALUES (6, '에어프라이어 추천 제품', 'cookmom', '간편하고 요리 잘됩니다. 고구마 굽기 최고!', TO_TIMESTAMP('2025-04-29 08:50:00', 'YYYY-MM-DD HH24:MI:SS'), 78, 'aircook11', 'airfryer.jpg', 4.8, '제품');
INSERT INTO reviewboard (r_no, r_title, r_writer, r_content, r_reg_date, r_read_count, r_pass, r_file1, r_rating, r_category)
VALUES (7, '서울 야경 명소', 'nightwalker', '남산타워와 한강 야경이 멋져요.', TO_TIMESTAMP('2025-05-03 19:00:00', 'YYYY-MM-DD HH24:MI:SS'), 96, 'namsan123', NULL, 4.6, '여행');
INSERT INTO reviewboard (r_no, r_title, r_writer, r_content, r_reg_date, r_read_count, r_pass, r_file1, r_rating, r_category)
VALUES (8, '가성비 라면 추천', 'ramenfan', '마트에서 파는 OO라면 진짜 맛있어요!', TO_TIMESTAMP('2025-05-01 13:20:00', 'YYYY-MM-DD HH24:MI:SS'), 150, 'noodle321', 'ramen.jpg', 4.9, '음식');
INSERT INTO reviewboard (r_no, r_title, r_writer, r_content, r_reg_date, r_read_count, r_pass, r_file1, r_rating, r_category)
VALUES (9, '스마트워치 사용기', 'techlife', '운동 기록 정확하고 알림도 편해요.', TO_TIMESTAMP('2025-04-27 16:45:00', 'YYYY-MM-DD HH24:MI:SS'), 60, 'watch111', NULL, 4.1, '제품');
INSERT INTO reviewboard (r_no, r_title, r_writer, r_content, r_reg_date, r_read_count, r_pass, r_file1, r_rating, r_category)
VALUES (10, '전주 한옥마을 여행기', 'joonhyuk', '조용하고 분위기 있는 여행지였어요.', TO_TIMESTAMP('2025-05-04 15:10:00', 'YYYY-MM-DD HH24:MI:SS'), 102, 'hanok555', 'hanok.jpg', 4.4, '여행');
COMMIT;
SELECT * FROM reviewboard ORDER BY r_no DESC;

-- 자주 찾는 질문 게시판
INSERT INTO questionboard (id, title, writer, content, regDate, password) VALUES (questionboard_seq.NEXTVAL, '회원가입은 어떻게 하나요?', '관리자', '회원가입은 우측 상단의 회원가입 버튼을 클릭 후 정보를 입력하시면 됩니다.', TO_DATE('2024-05-01 09:00:00', 'YYYY-MM-DD HH24:MI:SS'), '1234');
INSERT INTO questionboard (id, title, writer, content, regDate, password) VALUES (questionboard_seq.NEXTVAL, '비밀번호를 잊어버렸어요', '관리자', '로그인 화면 하단의 비밀번호 찾기를 통해 재설정할 수 있습니다.', TO_DATE('2024-05-01 10:00:00', 'YYYY-MM-DD HH24:MI:SS'), '1234');
INSERT INTO questionboard (id, title, writer, content, regDate, password) VALUES (questionboard_seq.NEXTVAL, '이메일 인증이 되지 않아요', '관리자', '스팸 메일함을 확인하거나 고객센터에 문의해주세요.', TO_DATE('2024-05-01 11:00:00', 'YYYY-MM-DD HH24:MI:SS'), '1234');
INSERT INTO questionboard (id, title, writer, content, regDate, password) VALUES (questionboard_seq.NEXTVAL, '예약 취소는 어떻게 하나요?', '관리자', '마이페이지 > 예약 내역에서 취소 가능한 예약을 선택 후 취소하실 수 있습니다.', TO_DATE('2024-05-01 12:00:00', 'YYYY-MM-DD HH24:MI:SS'), '1234');
INSERT INTO questionboard (id, title, writer, content, regDate, password) VALUES (questionboard_seq.NEXTVAL, '환불은 얼마나 걸리나요?', '관리자', '결제 수단에 따라 약 3~7일 소요됩니다.', TO_DATE('2024-05-01 13:00:00', 'YYYY-MM-DD HH24:MI:SS'), '1234');
INSERT INTO questionboard (id, title, writer, content, regDate, password) VALUES (questionboard_seq.NEXTVAL, '여권 정보는 왜 입력하나요?', '관리자', '해외 여행 상품 예약 시 항공권 발권을 위해 필요합니다.', TO_DATE('2024-05-01 14:00:00', 'YYYY-MM-DD HH24:MI:SS'), '1234');
INSERT INTO questionboard (id, title, writer, content, regDate, password) VALUES (questionboard_seq.NEXTVAL, '현금영수증 발급 가능한가요?', '관리자', '마이페이지 > 결제내역에서 현금영수증 발급 요청이 가능합니다.', TO_DATE('2024-05-01 15:00:00', 'YYYY-MM-DD HH24:MI:SS'), '1234');
INSERT INTO questionboard (id, title, writer, content, regDate, password) VALUES (questionboard_seq.NEXTVAL, '포인트는 어디서 확인하나요?', '관리자', '로그인 후 마이페이지 > 포인트 메뉴에서 확인할 수 있습니다.', TO_DATE('2024-05-01 16:00:00', 'YYYY-MM-DD HH24:MI:SS'), '1234');
INSERT INTO questionboard (id, title, writer, content, regDate, password) VALUES (questionboard_seq.NEXTVAL, '회원 탈퇴는 어떻게 하나요?', '관리자', '마이페이지 > 회원정보 관리에서 회원 탈퇴가 가능합니다.', TO_DATE('2024-05-01 17:00:00', 'YYYY-MM-DD HH24:MI:SS'), '1234');
INSERT INTO questionboard (id, title, writer, content, regDate, password) VALUES (questionboard_seq.NEXTVAL, '여행자 보험은 필수인가요?', '관리자', '권장사항이며 일부 상품은 가입이 필수일 수 있습니다.', TO_DATE('2024-05-01 18:00:00', 'YYYY-MM-DD HH24:MI:SS'), '1234');
INSERT INTO questionboard (id, title, writer, content, regDate, password) VALUES (questionboard_seq.NEXTVAL, '예약 확정은 언제 되나요?', '관리자', '결제 완료 후 영업일 기준 1일 이내에 확정됩니다.', TO_DATE('2024-05-02 09:00:00', 'YYYY-MM-DD HH24:MI:SS'), '1234');
INSERT INTO questionboard (id, title, writer, content, regDate, password) VALUES (questionboard_seq.NEXTVAL, '동반자 정보는 어디서 입력하나요?', '관리자', '마이페이지 > 예약 상세보기에서 입력 가능합니다.', TO_DATE('2024-05-02 10:00:00', 'YYYY-MM-DD HH24:MI:SS'), '1234');
INSERT INTO questionboard (id, title, writer, content, regDate, password) VALUES (questionboard_seq.NEXTVAL, '아이디를 변경할 수 있나요?', '관리자', '아이디는 변경이 불가능하며 탈퇴 후 재가입해야 합니다.', TO_DATE('2024-05-02 11:00:00', 'YYYY-MM-DD HH24:MI:SS'), '1234');
INSERT INTO questionboard (id, title, writer, content, regDate, password) VALUES (questionboard_seq.NEXTVAL, '상품 상세정보는 어디서 보나요?', '관리자', '각 상품 클릭 시 상세 페이지에서 확인할 수 있습니다.', TO_DATE('2024-05-02 12:00:00', 'YYYY-MM-DD HH24:MI:SS'), '1234');
INSERT INTO questionboard (id, title, writer, content, regDate, password) VALUES (questionboard_seq.NEXTVAL, '모바일로도 예약 가능한가요?', '관리자', '모바일 앱과 모바일 웹을 통해 예약이 가능합니다.', TO_DATE('2024-05-02 13:00:00', 'YYYY-MM-DD HH24:MI:SS'), '1234');
INSERT INTO questionboard (id, title, writer, content, regDate, password) VALUES (questionboard_seq.NEXTVAL, '아이디 중복 확인은 어떻게 하나요?', '관리자', '회원가입 시 아이디 입력 후 중복 확인 버튼을 누르시면 됩니다.', TO_DATE('2024-05-02 14:00:00', 'YYYY-MM-DD HH24:MI:SS'), '1234');
INSERT INTO questionboard (id, title, writer, content, regDate, password) VALUES (questionboard_seq.NEXTVAL, '여행 일정은 어떻게 확인하나요?', '관리자', '예약 완료 후 마이페이지 > 일정 확인 메뉴에서 확인 가능합니다.', TO_DATE('2024-05-02 15:00:00', 'YYYY-MM-DD HH24:MI:SS'), '1234');
INSERT INTO questionboard (id, title, writer, content, regDate, password) VALUES (questionboard_seq.NEXTVAL, '추천 여행지는 어떻게 정하나요?', '관리자', '사용자 취향 기반과 인기순으로 자동 추천됩니다.', TO_DATE('2024-05-02 16:00:00', 'YYYY-MM-DD HH24:MI:SS'), '1234');
INSERT INTO questionboard (id, title, writer, content, regDate, password) VALUES (questionboard_seq.NEXTVAL, '쿠폰은 어디서 사용하나요?', '관리자', '결제 단계에서 보유한 쿠폰을 선택하여 사용 가능합니다.', TO_DATE('2024-05-02 17:00:00', 'YYYY-MM-DD HH24:MI:SS'), '1234');
INSERT INTO questionboard (id, title, writer, content, regDate, password) VALUES (questionboard_seq.NEXTVAL, '가이드 정보는 언제 확인되나요?', '관리자', '여행 출발 하루 전 마이페이지에서 확인 가능합니다.', TO_DATE('2024-05-02 18:00:00', 'YYYY-MM-DD HH24:MI:SS'), '1234');
commit;

-- 댓글 데이터 추가하기 - 1번만 실행 한다. --
INSERT INTO reply(no, reviewB_no, reply_content, reply_writer, reg_date) VALUES(reply_seq.NEXTVAL, 10, '항상 감사합니다.' || CHR(13) || CHR(10) || ' 땡큐!~', 'midas', '2023-05-08 13:44:32');
INSERT INTO reply(no, reviewB_no, reply_content, reply_writer, reg_date) VALUES(reply_seq.NEXTVAL, 10, '저두 감사드립니다.', 'servlet', '2023-05-09 05:24:57');
INSERT INTO reply(no, reviewB_no, reply_content, reply_writer, reg_date) VALUES(reply_seq.NEXTVAL, 10, '저두요~ ^_^', 'midas', '2023-05-09 09:19:23');
INSERT INTO reply(no, reviewB_no, reply_content, reply_writer, reg_date) VALUES(reply_seq.NEXTVAL, 10, '나두 관심이 많은뎅~', 'servlet', '2023-05-09 11:54:45');
INSERT INTO reply(no, reviewB_no, reply_content, reply_writer, reg_date) VALUES(reply_seq.NEXTVAL, 199, '헤헷~ 감사 합니다.', 'admin', '2023-05-09 12:16:51');
INSERT INTO reply(no, reviewB_no, reply_content, reply_writer, reg_date) VALUES(reply_seq.NEXTVAL, 199, '아~ 다들 이 사이트가 잘되길 바라는 군요', 'midas', '2023-05-09 13:34:11');
INSERT INTO reply(no, reviewB_no, reply_content, reply_writer, reg_date) VALUES(reply_seq.NEXTVAL, 199, '관리자님께서 워낙 신경을 쓰시니...' || CHR(13) || CHR(10) || '잘될 겁니다. ', 'servlet', '2023-05-09 14:03:37');
INSERT INTO reply(no, reviewB_no, reply_content, reply_writer, reg_date) VALUES(reply_seq.NEXTVAL, 200, '저두 사이트 발전에 관심이 많습니다.' || CHR(13) || CHR(10) || '감사합니다.' , 'midas', '2023-05-09 14:39:29');
INSERT INTO reply(no, reviewB_no, reply_content, reply_writer, reg_date) VALUES(reply_seq.NEXTVAL, 200, '와~ 대단하네요 우리 사이트~' || CHR(13) || CHR(10) || 'ㅋㅋㅋ~', 'servlet', '2023-05-09 14:41:18');
INSERT INTO reply(no, reviewB_no, reply_content, reply_writer, reg_date) VALUES(reply_seq.NEXTVAL, 200, '우리 관리자님이 워낙 열심이시라~' || CHR(13) || CHR(10) || '그리고 회원님들도 열성으로 사이트에 충성 접속하시니...'|| CHR(13) || CHR(10) ||' 않될 수가 있나요...^_^', 'admin', '2023-05-09 14:52:48');
INSERT INTO reply(no, reviewB_no, reply_content, reply_writer, reg_date) VALUES(reply_seq.NEXTVAL, 200, '네 맞아요~', 'admin', '2023-05-10 15:42:12');
INSERT INTO reply(no, reviewB_no, reply_content, reply_writer, reg_date) VALUES(reply_seq.NEXTVAL, 200, '그렇죠 그렇고 말구요', 'servlet', '2023-05-11 15:44:57');
INSERT INTO reply(no, reviewB_no, reply_content, reply_writer, reg_date) VALUES(reply_seq.NEXTVAL, 200, '항상 감사합니다.', 'midas', '2023-05-15 16:19:23');
INSERT INTO reply(no, reviewB_no, reply_content, reply_writer, reg_date) VALUES(reply_seq.NEXTVAL, 200, '땡큐!~', 'servlet', '2023-05-16 17:31:45');
INSERT INTO reply(no, reviewB_no, reply_content, reply_writer, reg_date) VALUES(reply_seq.NEXTVAL, 199, '저두요~ 땡큐!~', 'servlet', '2023-05-19 18:16:51');
INSERT INTO reply(no, reviewB_no, reply_content, reply_writer, reg_date) VALUES(reply_seq.NEXTVAL, 199, '모두들 열성이네요~' || CHR(13) || CHR(10) || '헤헤~' || CHR(13) || CHR(10) || '땡큐!~', 'admin', '2023-05-20 10:34:11');
INSERT INTO reply(no, reviewB_no, reply_content, reply_writer, reg_date) VALUES(reply_seq.NEXTVAL, 199, '땡큐~ 여기 붙어라~ ^_^', 'midas', '2023-05-20 11:33:27');
INSERT INTO reply(no, reviewB_no, reply_content, reply_writer, reg_date) VALUES(reply_seq.NEXTVAL, 199, '땡큐~ 붙었어요~', 'admin', '2023-05-20 13:19:59');
INSERT INTO reply(no, reviewB_no, reply_content, reply_writer, reg_date) VALUES(reply_seq.NEXTVAL, 200, '당연 회원이면 관심 가져야죠~', 'servlet', '2023-06-10 13:41:17');
INSERT INTO reply(no, reviewB_no, reply_content, reply_writer, reg_date) VALUES(reply_seq.NEXTVAL, 200, '동감 합니다.' || CHR(13) || CHR(10) ||' 땡큐!~', 'midas', '2023-06-12 14:52:48');

commit;
SELECT * FROM reply;


