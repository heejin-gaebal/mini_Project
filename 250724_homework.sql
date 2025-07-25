DROP SEQUENCE SEQ_BOARD;
DROP SEQUENCE SEQ_CATEGORY;
DROP TABLE BOARD;
DROP TABLE CATEGORY;

CREATE SEQUENCE SEQ_BOARD NOCACHE NOCYCLE;
CREATE SEQUENCE SEQ_CATEGORY NOCACHE NOCYCLE;

CREATE TABLE BOARD (
  NO            NUMBER           PRIMARY KEY,
  TITLE         VARCHAR2(100)    NOT NULL,
  CONTENT       CLOB             NOT NULL,
  CATEGORY_NO   NUMBER           NOT NULL,
  CREATED_AT    TIMESTAMP     DEFAULT SYSDATE NOT NULL,
  MODIFIED_AT   TIMESTAMP,
  DEL_YN        CHAR(1)          DEFAULT 'N' CHECK (DEL_YN IN ('Y', 'N'))
);
ALTER TABLE BOARD
    ADD CONSTRAINT FK_BOARD_CATEGORY
FOREIGN KEY (CATEGORY_NO)
REFERENCES CATEGORY (CATEGORY_NO);

CREATE TABLE CATEGORY (
  CATEGORY_NO       NUMBER           PRIMARY KEY,
  CATEGORY_NAME     VARCHAR2(100)    NOT NULL
);

INSERT INTO CATEGORY (CATEGORY_NO, CATEGORY_NAME) VALUES (SEQ_CATEGORY.nextval, '코믹');
INSERT INTO CATEGORY (CATEGORY_NO, CATEGORY_NAME) VALUES (SEQ_CATEGORY.nextval, '로맨스');
INSERT INTO CATEGORY (CATEGORY_NO, CATEGORY_NAME) VALUES (SEQ_CATEGORY.nextval, '액션');
INSERT INTO CATEGORY (CATEGORY_NO, CATEGORY_NAME) VALUES (SEQ_CATEGORY.nextval, '공포');
INSERT INTO CATEGORY (CATEGORY_NO, CATEGORY_NAME) VALUES (SEQ_CATEGORY.nextval, '전쟁');

INSERT INTO BOARD (NO, TITLE, CONTENT, CATEGORY_NO)VALUES (SEQ_BOARD.nextval, '극한직업', '최근 본 코믹 영상 추천해요. 진짜 빵 터짐!', 1);
INSERT INTO BOARD (NO, TITLE, CONTENT, CATEGORY_NO)VALUES (SEQ_BOARD.nextval, '로마의 휴일', '로맨스 영화 중 이 장면 정말 감동적이에요.', 2);
INSERT INTO BOARD (NO, TITLE, CONTENT, CATEGORY_NO)VALUES (SEQ_BOARD.nextval, '분노의 질주', '이번에 개봉한 액션 영화 최고였음. 카 체이싱 장면이 대박!', 3);
INSERT INTO BOARD (NO, TITLE, CONTENT, CATEGORY_NO)VALUES (SEQ_BOARD.nextval, '곡성', '공포 영화 보다가 잠 못 잠… 효과음이 완전 현실적!', 4);
INSERT INTO BOARD (NO, TITLE, CONTENT, CATEGORY_NO)VALUES (SEQ_BOARD.nextval, '덩케르크', '전쟁 영화 추천해요. 역사적 사실도 잘 녹아있음.', 5);
INSERT INTO BOARD (NO, TITLE, CONTENT, CATEGORY_NO)VALUES (SEQ_BOARD.nextval, '기생충', '사회적 메시지가 강하면서도 스릴 넘치는 전개가 인상 깊어요.', 1);
INSERT INTO BOARD (NO, TITLE, CONTENT, CATEGORY_NO)VALUES (SEQ_BOARD.nextval, '어벤져스: 엔드게임', '마블 팬이라면 눈물 없이는 못 봄... 마지막 전투 최고!', 3);
INSERT INTO BOARD (NO, TITLE, CONTENT, CATEGORY_NO)VALUES (SEQ_BOARD.nextval, '라라랜드', '음악과 색감 모두 아름다움 그 자체. OST가 머릿속에 맴도네요.', 2);
INSERT INTO BOARD (NO, TITLE, CONTENT, CATEGORY_NO)VALUES (SEQ_BOARD.nextval, '컨저링', '심장이 덜컥... 소름 돋는 장면들이 많아서 밤에 못 봄ㅠㅠ', 4);
INSERT INTO BOARD (NO, TITLE, CONTENT, CATEGORY_NO)VALUES (SEQ_BOARD.nextval, '국제시장', '부모님 세대 이야기라 더 뭉클했어요. 가족 생각나게 하는 영화.', 5);
INSERT INTO BOARD (NO, TITLE, CONTENT, CATEGORY_NO)VALUES (SEQ_BOARD.nextval, '극장판 귀멸의 칼날', '애니메이션인데 연출과 감정선이 진짜 영화급이에요.', 1);
INSERT INTO BOARD (NO, TITLE, CONTENT, CATEGORY_NO)VALUES (SEQ_BOARD.nextval, '미션 임파서블', '톰 크루즈 액션은 믿고 보는 수준! 헬기 추격신 짱!', 3);
INSERT INTO BOARD (NO, TITLE, CONTENT, CATEGORY_NO)VALUES (SEQ_BOARD.nextval, '뷰티 인사이드', '사랑에 대한 색다른 시선... 연기력도 정말 좋았어요.', 2);
INSERT INTO BOARD (NO, TITLE, CONTENT, CATEGORY_NO)VALUES (SEQ_BOARD.nextval, '셔터 아일랜드', '반전의 반전… 보고 나서도 계속 생각나는 스릴러.', 4);
INSERT INTO BOARD (NO, TITLE, CONTENT, CATEGORY_NO)VALUES (SEQ_BOARD.nextval, '인셉션', '꿈 속의 꿈 속의 꿈… 뭐가 현실인지 계속 생각하게 돼요.', 4);
INSERT INTO BOARD (NO, TITLE, CONTENT, CATEGORY_NO)VALUES (SEQ_BOARD.nextval, '노트북', '평생 사랑을 지키는 그들의 이야기에 눈물이 줄줄…', 2);
INSERT INTO BOARD (NO, TITLE, CONTENT, CATEGORY_NO)VALUES (SEQ_BOARD.nextval, '탑건: 매버릭', '전투기 액션이 압도적이고 감동까지 있는 반전!', 3);
INSERT INTO BOARD (NO, TITLE, CONTENT, CATEGORY_NO)VALUES (SEQ_BOARD.nextval, '1917', '원테이크 전쟁 영화의 압도적인 몰입감… 숨 쉴 틈이 없어요.', 5);
INSERT INTO BOARD (NO, TITLE, CONTENT, CATEGORY_NO)VALUES (SEQ_BOARD.nextval, '범죄도시', '마동석 액션은 역시 믿고 보는 맛이 있어요!', 3);
INSERT INTO BOARD (NO, TITLE, CONTENT, CATEGORY_NO)VALUES (SEQ_BOARD.nextval, '겟 아웃', '소름 끼치는 심리 공포… 사회적 메시지도 날카로워요.', 4);
INSERT INTO BOARD (NO, TITLE, CONTENT, CATEGORY_NO)VALUES (SEQ_BOARD.nextval, '주토피아', '아이들도 어른들도 빠져드는 귀엽고 똑똑한 애니!', 1);
INSERT INTO BOARD (NO, TITLE, CONTENT, CATEGORY_NO)VALUES (SEQ_BOARD.nextval, '인턴', '유쾌하면서 따뜻한 직장 이야기. 로버트 드니로 최고!', 5);
INSERT INTO BOARD (NO, TITLE, CONTENT, CATEGORY_NO)VALUES (SEQ_BOARD.nextval, '트와일라잇', '판타지 로맨스의 대표작! 늑대와 뱀파이어의 삼각관계가 흥미로워요.', 2);
INSERT INTO BOARD (NO, TITLE, CONTENT, CATEGORY_NO)VALUES (SEQ_BOARD.nextval, '마녀', '한국형 초능력 액션! 긴장감 넘치는 전개가 인상적이에요.', 3);
INSERT INTO BOARD (NO, TITLE, CONTENT, CATEGORY_NO)VALUES (SEQ_BOARD.nextval, '인시디어스', '정말 깜짝 놀람 주의… 공포영화 덕후라면 추천!', 4);
INSERT INTO BOARD (NO, TITLE, CONTENT, CATEGORY_NO)VALUES (SEQ_BOARD.nextval, '모아나', '모험과 음악이 어우러진 디즈니 애니, 감동적이에요!', 1);
INSERT INTO BOARD (NO, TITLE, CONTENT, CATEGORY_NO)VALUES (SEQ_BOARD.nextval, '엘리멘탈', '불과 물의 캐릭터가 사랑을 나누는 감동적인 애니!', 1);
INSERT INTO BOARD (NO, TITLE, CONTENT, CATEGORY_NO)VALUES (SEQ_BOARD.nextval, '유전', '보는 내내 심장 조이던 심리적 공포... 결말 충격적이에요.', 4);
INSERT INTO BOARD (NO, TITLE, CONTENT, CATEGORY_NO)VALUES (SEQ_BOARD.nextval, '헌트', '80년대 첩보 스릴러, 전개도 치밀하고 연기도 짱!', 5);

COMMIT;