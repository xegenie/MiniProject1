DROP TABLE IF EXISTS `rental_list`;

CREATE TABLE `rental_list` (
	`no`		INT	NOT NULL	PRIMARY KEY	COMMENT 'PK',
	`id`		VARCHAR(100)	NOT NULL	COMMENT '회원ID',
	`book_id`	INT				NOT NULL	COMMENT '도서 ID',
	`stock_id`	INT				NOT NULL	COMMENT '재고 ID',
	`state`		VARCHAR(30)		NOT NULL	COMMENT '상태(대출, 반납, 예약, 연체)',
	`rental_date`	TIMESTAMP	NOT NULL	DEFAULT CURRENT_TIMESTAMP	COMMENT '대출 일자',
	`return_date`	TIMESTAMP	NULL		COMMENT '반납 일자',
	`over_date`	INT	NULL COMMENT '연체 기간',

	CONSTRAINT state_ck CHECK(state IN('대출', '반납', '예약', '연체'))
);

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
	`id`	VARCHAR(100)	NOT NULL PRIMARY KEY	COMMENT '회원ID',
	`password`	VARCHAR(100)	NOT NULL	COMMENT '비밀번호',
	`name`	VARCHAR(20)	NOT NULL	COMMENT '이름',
	`email`	VARCHAR(100)	NOT NULL	COMMENT '이메일',
	`tel_number`	VARCHAR(20)	NOT NULL	COMMENT '전화번호'
);

DROP TABLE IF EXISTS `book`;

CREATE TABLE `book` (
	`id`	INT	NOT NULL	PRIMARY KEY	COMMENT '도서 ID',
	`isbn`	VARCHAR(100)	NOT NULL	COMMENT 'ISBN',
	`title`	VARCHAR(100)	NOT NULL	COMMENT '제목',
	`author`	VARCHAR(25)	NOT NULL	COMMENT '저자 명',
	`publisher`	VARCHAR(30)	NOT NULL	COMMENT '출판사 명',
	`outline`	TEXT	NULL	COMMENT '책 개요'
);

DROP TABLE IF EXISTS `comments`;

CREATE TABLE `comments` (
	`board_id`	INT	NOT NULL	COMMENT '게시판 ID',
	 `comment_id` INT NOT NULL AUTO_INCREMENT COMMENT '댓글 ID',
	`content`	VARCHAR(200)	NOT NULL	COMMENT '댓글 내용',
	`writer`	VARCHAR(100)	NOT NULL	COMMENT '작성자ID',
	`reg_date`	TIMESTAMP	NOT NULL	DEFAULT CURRENT_TIMESTAMP	COMMENT '등록 일자'
);

DROP TABLE IF EXISTS `board`;

CREATE TABLE `board` (
	`board_id`	INT	NOT NULL	PRIMARY KEY	COMMENT '게시판 ID',
	`title`		VARCHAR(100)	NOT NULL	COMMENT '게시글 제목',
	`content`	VARCHAR(1000)	NOT NULL	COMMENT '게시글 내용',
	`writer`	VARCHAR(100)	NOT NULL	COMMENT '작성자ID',
	`reg_date`	TIMESTAMP	NOT NULL	DEFAULT CURRENT_TIMESTAMP	COMMENT '등록 일자',
	`upd_date`	TIMESTAMP	NOT NULL	DEFAULT CURRENT_TIMESTAMP	COMMENT '수정 일자',
	`b_type`	VARCHAR(30)	NOT NULL	COMMENT '타입(게시판, 공지사항)',
	
	CONSTRAINT b_type_ck CHECK(b_type IN('게시판', '공지사항'))
);

DROP TABLE IF EXISTS `hope_book`;

CREATE TABLE `hope_book` (
	`no`	INT	NOT NULL	AUTO_INCREMENT PRIMARY KEY 	COMMENT 'PK',
	`id`	VARCHAR(100)	NOT NULL	COMMENT '회원ID',
	`book_name`	VARCHAR(100)	NOT NULL	COMMENT '도서명',
	`author`	VARCHAR(25)	NOT NULL	COMMENT '저자명',
	`publisher`	VARCHAR(30)	NOT NULL	COMMENT '출판사명'
);

DROP TABLE IF EXISTS `book_stock`;

CREATE TABLE `book_stock` (
	`stock_id`	INT	NOT NULL	PRIMARY KEY COMMENT '재고 ID',
	`book_id`	INT	NOT NULL	COMMENT '도서 ID',
	`status`	VARCHAR(30)	NOT NULL	DEFAULT '대출 가능'	COMMENT '상태(대출 가능, 대출 불가, 예약 중)',
	
	CONSTRAINT status_ck CHECK(status IN('대출 가능', '대출 불가', '예약 중'))
);

DROP TABLE IF EXISTS `wish_list`;

CREATE TABLE `wish_list` (
	`no`	INT	NOT NULL	AUTO_INCREMENT	PRIMARY KEY COMMENT 'PK',
	`id`	VARCHAR(100)	NOT NULL	COMMENT '회원ID',
	`book_id`	INT	NOT NULL	COMMENT '도서 ID'
);

DROP TABLE IF EXISTS `user_auth`;

CREATE TABLE `user_auth` (
	`no`	INT	NOT NULL AUTO_INCREMENT PRIMARY KEY	COMMENT 'PK',
	`username`	VARCHAR(100)	NOT NULL	COMMENT '회원ID',
	`auth`	VARCHAR(100)	NOT NULL	COMMENT '회원권한(ROLE_USER, ROLE_ADMIN)',
	`created_at`	TIMESTAMP	NOT NULL	DEFAULT CURRENT_TIMESTAMP	COMMENT '등록일자',
	
	CONSTRAINT auth_ck CHECK(auth IN('ROLE_USER', 'ROLE_ADMIN'))
);

DROP TABLE IF EXISTS `files`;

CREATE TABLE `files` (
	`no`	INT	NOT NULL	PRIMARY KEY	COMMENT 'PK',
	`p_table`	VARCHAR(100)	NOT NULL	COMMENT '부모테이블 book',
	`file_type`	ENUM('MAIN','SUB')	NULL	DEFAULT 'MAIN'	COMMENT '파일 종류(MAIN:대표or썸네일, SUB:일반or하위)',
	`file_name`	TEXT	NOT NULL	COMMENT '파일명',
	`file_path`	TEXT	NOT NULL	COMMENT '파일 경로',
	`file_size`	BIGINT	NULL	COMMENT '파일용량(Byte)',
	`create_at`	TIMESTAMP	NOT NULL	DEFAULT CURRENT_TIMESTAMP	COMMENT '등록일자',
	`updated_at`	TIMESTAMP	NOT NULL	DEFAULT CURRENT_TIMESTAMP	COMMENT '수정일자',
	`bb_type`	VARCHAR(30)	NOT NULL	COMMENT '부모테이블(board, book)',
	
	CONSTRAINT bb_type_ck CHECK(bb_type IN('board', 'book'))
);



--ALTER TABLE `rental list` ADD CONSTRAINT `PK_RENTAL LIST` PRIMARY KEY (
--	`no`
--);
--
--ALTER TABLE `users` ADD CONSTRAINT `PK_USERS` PRIMARY KEY (
--	`id`
--);
--
--ALTER TABLE `book` ADD CONSTRAINT `PK_BOOK` PRIMARY KEY (
--	`id`
--);
--
--ALTER TABLE `board` ADD CONSTRAINT `PK_BOARD` PRIMARY KEY (
--	`board_id`
--);
--
--ALTER TABLE `book stock` ADD CONSTRAINT `PK_BOOK STOCK` PRIMARY KEY (
--	`stock_id`
--);
--
--ALTER TABLE `wish list` ADD CONSTRAINT `PK_WISH LIST` PRIMARY KEY (
--	`no`
--);
--
--ALTER TABLE `user_auth` ADD CONSTRAINT `PK_USER_AUTH` PRIMARY KEY (
--	`no`
--);
--
--ALTER TABLE `files` ADD CONSTRAINT `PK_FILES` PRIMARY KEY (
--	`no`
--);

