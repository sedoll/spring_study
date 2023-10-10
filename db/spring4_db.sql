-- pro04

CREATE DATABASE haebeop;

USE haebeop

CREATE TABLE test(
	num INT,
	title VARCHAR(200)
);

INSERT test VALUES(1, '제목1');
INSERT test VALUES(2, '제목2');
INSERT test VALUES(3, '제목3');
INSERT test VALUES(4, '제목4');
INSERT test VALUES(5, '제목5');

-- 회원(아이디, 비밀번호, 이름, 이메일, 전화번호, 주소1, 주소2, 우편번호, 가입일, 생년월일, 점수, 방문횟수, 직업)
CREATE TABLE member(
	id VARCHAR(20) PRIMARY KEY, -- 아이디
	pw VARCHAR(350) NOT NULL, -- 비밀번호
	NAME VARCHAR(50) NOT NULL, -- 이름
	email VARCHAR(150), -- 이메일
	tel VARCHAR(20), -- 전화번호
	addr1 VARCHAR(200), -- 주소1
	addr2 VARCHAR(200), -- 주소2
	postcode VARCHAR(20), -- 우편번호
	resdate DATETIME DEFAULT CURRENT_TIME, -- 가입일
	birth DATE DEFAULT CURRENT_TIME, -- 생년월일
	pt INT DEFAULT 0, -- 점수
	cnt INT DEFAULT 0, -- 방문횟수,
	job INT -- 직업
);

-- 공지사항(순번, 제목, 내용, 작성자, 작성일, 읽은 횟수)
create table notice(
	no int primary KEY AUTO_INCREMENT, -- notice 글 번호
	title varchar(200) not NULL,	-- 제목
	content varchar(1000), -- 내용
	id VARCHAR(20), -- 작성자
	resdate TIMESTAMP DEFAULT CURRENT_TIMESTAMP(), -- 작성일
	cnt int DEFAULT 0 -- 조회수
);


-- 자료실(순번, 제목, 내용, 파일1, 파일2, 파일3, 작성일, 작성자, 읽은 횟수)
CREATE TABLE FILE(
	NO INT PRIMARY KEY AUTO_INCREMENT,
	title VARCHAR(200) NOT null,
	content VARCHAR(1000),
	FILE1 VARCHAR(1000),
	FILE2 VARCHAR(1000),
	FILE3 VARCHAR(1000),
	resdate TIMESTAMP DEFAULT CURRENT_TIMESTAMP(), -- 작성일
	id VARCHAR(20),
	cnt INT DEFAULT 0
);

-- 과목(과목코드(PK), 과목명, 과목단가)
CREATE TABLE SUBJECT(
	NO INT PRIMARY KEY AUTO_INCREMENT,
	title VARCHAR(200) NOT NULL,
	cost INT NOT NULL
	);

-- 강사(강사코드(PK), 강사명, 연락처, 이메일)
CREATE TABLE instructor(
	NO INT PRIMARY KEY AUTO_INCREMENT,
	NAME VARCHAR(10),
	tel VARCHAR(20),
	email VARCHAR(100)
	);

-- 강의(강의코드(PK), 강의명,  강의파일, 과목코드(FK), 강사코드(FK), 수강인원)
CREATE TABLE lecture(
	NO INT PRIMARY KEY AUTO_INCREMENT,
	title VARCHAR(200) NOT NULL,
	sfile VARCHAR(1000),
	sno INT,
	ino INT,
	cnt INT DEFAULT 0,
	FOREIGN KEY(sno) REFERENCES subject(no), 
	FOREIGN KEY(ino) REFERENCES instructor(no)
	);
	

-- 수강(수강코드(PK), 강의코드(FK), 학생아이디(FK), 수강총시간, 수강완료 여부)
CREATE TABLE course(
	NO INT PRIMARY KEY AUTO_INCREMENT,
	lec_no INT,
	sid VARCHAR(20),
	ctime INT DEFAULT 0,
	CHECK1 VARCHAR(10),
	FOREIGN KEY(lec_no) REFERENCES lecture(no), 
	FOREIGN KEY(sid) REFERENCES member(id)
	);

-- 교재(교재코드(PK), 교재명, 교재목차, 출판사, 출판일, 저자, 가격, 기타메모)
CREATE TABLE textbook(
	NO INT PRIMARY KEY AUTO_INCREMENT,
	bookname VARCHAR(100),
	contents VARCHAR(1000),
	company VARCHAR(50),
	resdate TIMESTAMP DEFAULT CURRENT_TIMESTAMP(), -- 출판일
	author VARCHAR(50),
	cost INT DEFAULT 0,
	memo VARCHAR(1000)
	);