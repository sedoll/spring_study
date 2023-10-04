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