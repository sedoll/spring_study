-- pro04

-- 핵심기능 : 공지사항, 자료실, 회원, 자유게시판, 강의별 댓글, 교재와 시범강의

-- 부가기능 : 파일업로드, 채팅 및 쪽지, 타계정 또는 SNS로 로그인, 수강평, 달력
-- 가입시 축하 메일 보내기, 비밀번호 변경시 이메일 보내기
-- 온라인 평가, 진도 관리 등


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

-- 강의(강의코드(PK), 강의명,  강의동영상파일, 과목코드(FK), 강사코드(FK), 수강인원, 최대수강인원)
DROP TABLE lecture;

CREATE TABLE lecture(
	NO INT PRIMARY KEY AUTO_INCREMENT,
	title VARCHAR(200) NOT NULL,
	sfile VARCHAR(1000),
	sno INT,
	ino INT,
	cnt INT DEFAULT 0,
	max_cnt INT,
	FOREIGN KEY(sno) REFERENCES subject(no), 
	FOREIGN KEY(ino) REFERENCES instructor(no)
	);
	

-- 수강(수강코드(PK), 강의코드(FK), 학생아이디(FK), 수강총시간, 수강완료 여부)
DROP table course;

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

-- 강의 배정
-- 과목, 강사, 교재 정보를 강의 테이블에 등록하는 행위
-- 하나의 과목당 여러 강의를 모두 등록해야한다.


-- 수강 신청
-- 강의 정보를 보고, 학생이 수강 신청을 하는 행위,
-- 학생별로 모든 강의 정보가 등록되어야 하며, 
-- 만약 수강신청시 수강인원이 초과될 경우 수강신청을 할 수 없다.