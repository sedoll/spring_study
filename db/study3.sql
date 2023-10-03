CREATE DATABASE haebeop;

USE haebeop;

DROP TABLE test;

-- study3
CREATE TABLE test(
	num INT PRIMARY KEY AUTO_INCREMENT,
	title VARCHAR(200)
);

INSERT test(title) VALUES('제목1');
INSERT test(title) VALUES('제목2');
INSERT test(title) VALUES('제목3');
INSERT test(title) VALUES('제목4');
INSERT test(title) VALUES('제목5');


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