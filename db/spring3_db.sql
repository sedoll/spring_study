CREATE DATABASE teaspoon;

USE teaspoon;

CREATE TABLE sample(
	NO INT PRIMARY KEY AUTO_INCREMENT,
	NAME VARCHAR(100)
);

INSERT INTO sample VALUES(DEFAULT, '홍길동');
INSERT INTO sample VALUES(DEFAULT, '강감찬');
INSERT INTO sample VALUES(DEFAULT, '이순신');
INSERT INTO sample VALUES(DEFAULT, '오세훈');
INSERT INTO sample VALUES(DEFAULT, '김철수');

CREATE TABLE member(
	id VARCHAR(16) PRIMARY KEY, -- 아이디
	pw VARCHAR(330) NOT NULL, -- 비밀번호
	NAME VARCHAR(100) NOT NULL, -- 이름
	email VARCHAR(100) NOT NULL, -- 이메일
	tel VARCHAR(13), -- 전화 번호
	regdate TIMESTAMP DEFAULT CURRENT_TIMESTAMP(), -- 가입일
	POINT INT DEFAULT 0, -- 포인트
	job INT NOT NULL -- 직업 학생: 1, 선생님: 2
);

-- 관리자
INSERT INTO member(id, pw, NAME, email, tel, job) 
	VALUES('admin', '1234', '관리자', 'admin@edu.com', '010-1234-5678', 0);

-- 학부모
INSERT INTO member(id, pw, NAME, email, tel, job) 
	VALUES('hong', 'h5678', '홍길동', 'hong@edu.com', '010-1111-2222', 1);
INSERT INTO member(id, pw, NAME, email, tel, job) 
	VALUES('kang', 'kang12', '강감찬', 'kang@edu.com', '010-3333-4444', 1);

-- 선생
INSERT INTO member(id, pw, NAME, email, tel, job) 
	VALUES('son', 'sony1234', '손흥민', 'son@edu.com', '010-5555-6666', 2);
INSERT INTO member(id, pw, NAME, email, tel, job) 
	VALUES('lee', 'lee4885', '이순신', 'lee@edu.com', '010-8765-4321', 2);

DROP TABLE board;

CREATE TABLE board(
	bno INT PRIMARY KEY AUTO_INCREMENT, -- qna 글 번호
	title VARCHAR(200) NOT NULL, -- 제목
	content VARCHAR(1000), -- 내용
	author VARCHAR(16), -- 작성자
	resdate TIMESTAMP DEFAULT CURRENT_TIMESTAMP(), -- 작성일
	cnt INT DEFAULT 0, -- 조회수
	lev INT DEFAULT 0, -- 게시글 0, 답글 1 이상
	par INT, -- 부모 게시글 번호
	FOREIGN KEY(author) REFERENCES member(id) ON DELETE 		
		CASCADE -- 작성자를 member id를 이용해 외래키로 사용
);

INSERT INTO board(title, content, author) VALUES('본문 제목1', '본문 내용1', 'admin');
UPDATE board SET par=bno WHERE bno=1;

INSERT INTO board(title, content, author) VALUES('본문 제목2', '본문 내용2', 'hong'); 
UPDATE board SET par=bno WHERE bno=2;

INSERT INTO board(title, content, author) VALUES('본문 제목3', '본문 내용3', 'kang');
UPDATE board SET par=bno WHERE bno=3;

INSERT INTO board(title, content, author) VALUES('본문 제목4', '본문 내용4', 'lee');
UPDATE board SET par=bno WHERE bno=4;

INSERT INTO board(title, content, author) VALUES('본문 제목5', '본문 내용5', 'son');
UPDATE board SET par=bno WHERE bno=5;

INSERT INTO board(title, content, author) VALUES('본문 제목6', '본문 내용6', 'hong');
UPDATE board SET par=bno WHERE bno=6; 