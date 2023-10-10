CREATE DATABASE haebeop;

USE haebeop;

DROP TABLE test;

-- study3
CREATE TABLE test(
	num INT,
	title VARCHAR(200)
);

INSERT test VALUES(1, '제목1');
INSERT test VALUES(2, '제목2');
INSERT test VALUES(3, '제목3');
INSERT test VALUES(4, '제목4');
INSERT test VALUES(5, '제목5');


-- study4
CREATE TABLE emp(
	emp_no INT PRIMARY KEY AUTO_INCREMENT,
	first_name VARCHAR(200)
);

INSERT emp(first_name) VALUES('kim');
INSERT emp(first_name) VALUES('lee');
INSERT emp(first_name) VALUES('park');
INSERT emp(first_name) VALUES('choi');
INSERT emp(first_name) VALUES('oh');


DROP TABLE user;

-- study6
CREATE TABLE USER(
	id VARCHAR(20) PRIMARY KEY,
	pw VARCHAR(350) NOT NULL,
	NAME VARCHAR(50) NOT NULL,
	email VARCHAR(150),
	tel VARCHAR(20),
	addr1 VARCHAR(200),
	addr2 VARCHAR(200),
	postcode VARCHAR(20),
	regdate DATETIME DEFAULT CURRENT_TIME,
	birth DATE DEFAULT CURRENT_TIME,
	pt INT DEFAULT 0,
	visited INT DEFAULT 0
);

INSERT INTO user(id, pw, NAME) VALUES('admin', '$2a$10$3zl8fmNyd1IsP1Ru0TNVee9AMtpM9E7yz5ZR9Qiofbj8zqqjJiqIi', '관리자');
INSERT INTO user(id, pw, NAME) VALUES('hong', '$2a$10$3zl8fmNyd1IsP1Ru0TNVee9AMtpM9E7yz5ZR9Qiofbj8zqqjJiqIi', '홍길동');