CREATE TABLE neworders (
	orderid INT AUTO_INCREMENT,
	custid INT NOT NULL,
	bookid INT NOT NULL,
	saleprice INT NOT NULL,
	orderdate DATE NOT NULL,
	PRIMARY KEY (orderid),
	FOREIGN KEY (custid) REFERENCES newcustomer(custid),
	FOREIGN KEY (bookid) REFERENCES newbook(bookid)
);

ALTER TABLE neworders
MODIFY COLUMN orderdate DATE NOT NULL DEFAULT (CURRENT_DATE);

ALTER TABLE neworders ADD isdn VARCHAR(13) NOT NULL;



-- newcustomer에 custid가 1번이 있고, newbook에 bookid가 1번인 책이 있기 때문에
-- insert가 가능한것 bookid가 2번인 책도 있기때문에 아래 쿼리문도 성립 가능.
INSERT INTO neworders
SET custid = 1,
bookid = 2,
saleprice = 20000;

-- exam 데이터베이스 만들기
CREATE DATABASE exam;

CREATE TABLE dept (
	deptno INT NOT NULL AUTO_INCREMENT,
	dname VARCHAR(14) NOT NULL,
	loc VARCHAR(13),
	PRIMARY KEY (deptno)
);

CREATE TABLE emp(
	empno INT NOT NULL AUTO_INCREMENT,
	PRIMARY KEY (empno),
	ename VARCHAR(10) COMMENT '사원명',
	job VARCHAR(9) COMMENT '업무',
	mgr INT COMMENT '직속상사번호',
	hiredate DATE NOT NULL,
	sal INT NOT NULL COMMENT '월급여',
	comm INT COMMENT '판매수당',
	deptno INT COMMENT '부서번호',
	FOREIGN KEY (deptno) REFERENCES dept(deptno)
);

INSERT INTO dept(dname, loc)
VALUES('ACCOUNTING', 'NEW YORK'),
		('RESEARCH', 'DALLAS'),
		('SALES', 'CHICAGO'),
		('OPERATIONS', 'BOSTON');

INSERT INTO emp(ename, job, mgr, hiredate, sal, comm, deptno)
VALUES('SMITH', 'CLERK', 7902, '1920-12-17 00:00:00', 800, NULL, 2),
		('ALLEN', 'SALESMAN', 7698, '1981-02-20 00:00:00', 1600, 300, 3),
		('WARD', 'SALESMAN', 7698, '1981-02-22 00:00:00', 1250, 500, 3),
		('JONES', 'MANAGER', 7839, '1981-04-02 00:00:00', 2975, NULL, 2);


INSERT INTO emp(ename, job, mgr, hiredate, sal, comm, deptno)
VALUES('MARTIN', 'SALESMAN', 7698, '1981-09-28', 1250, 1400, 3);

-- 사원이름, 부서지역 출력
SELECT e.ename, d.loc
FROM dept d
JOIN emp e
ON d.deptno = e.deptno;

-- 2, 3번 근로자의 mgr는 martin이 되도록 해주세요.


UPDATE emp
SET mgr = 5
WHERE empno = 2 OR empno = 3;

-- 근로자의 매니저 이름을 출력하자
SELECT e1.ename AS emp_name, e2.ename AS mgr_name
FROM emp e1 -- 사원
JOIN emp e2 -- 매니저
ON e1.mgr = e2.empno;

UPDATE emp
SET mgr = NULL
WHERE empno IN(1, 4, 5);

/* p.243 뷰 view

*/                                                       
USE sakila;
-- 이 쿼리를 view로 만든다.
CREATE VIEW v_customer_info
AS
SELECT c.last_name, c.first_name, a.address, ct.city
FROM customer c
JOIN address a
ON c.address_id = a.address_id
JOIN city ct
ON ct.city_id = a.city_id;

-- 뷰 삭제
DROP VIEW v_customer_info;

-- 위에서 v_customer_info라는 뷰를 만들었기 때문에 뷰 네임만 적으면
-- 위 쿼리문과 동일하게 출력됨
SELECT * FROM v_customer_info
WHERE last_name >= 'S';

/* P.250 인덱스
select 속도 향상을 위해 주로 사용한다.
내부적으로 인덱스 컬럼을 정렬을 한다.

장점: select 속도 증가
단점: insert, update, delete 속도 감소, 용량 증가
		남발하면 오히려 select 속도 감소
		
순차 read, 랜덤 read

인덱스를 통한 read => 랜덤 read -- 데이터 양이 작으면,인덱스가 훨 더 빠름
전수 read => 순차 read
*/



/* p.325 데이터 모델링(설계, 디자인)

1. 요구사항 수집 및 분석
2. 설계 ( 개념적, 논리적, 물리적 모델링 )
3. 구현
4. 운영
5. 유지보수

p.342 테이블 관계
1:1 일대일
회사의 사원당 컴퓨터 1대씩 사용한다면
사원과 컴퓨터의 관계는 1:1이 된다.

1:N 일대다
회사의 컴퓨터 1대를 여러명의 사원이 돌려쓴다면
컴퓨터와 사원의 관계는 1:N가 된다.

N:N 다대다
한 사람이 여러개의 취미를 가질 수 있다.
하나의 취미는 여러 사람의 취미일 수 있다.

사람과 취미
사람1 - 축구
사람1 - 농구
사람1 - 배구
사람2 - 축구
사람3 - 축구

ERD를 무료로 사용할 수 있는 사이트
https://www.erdcloud.com


FK설정시
식별 관계: FK가 PK 컬럼
비식별 관계: FK가 일반 컬럼


복합키: 컬럼 2개 이상이 PK (컬럼값 끼리 겹치지만 않으면 된다) => 식별관계

p.395 정규화
- 무결성 구조를 위한 작업.
- 1~3 정규형과 BC 정규형
- 정규형을 하는 이유는 이상현상(anomaly)을 없애기 위함
- insert, update, delete 후 데이터 상태가 이상하게 되는 현상: 이상현상
p.396~397 내용 확인

DB는 정보가 많아지면 세로로 길어져야한다. 항상. always.
가로로 늘어나는 경우는 없다.
정규화 => 테이블을 쪼갠다

*/





















/* 데이터베이스 새로 생성에 조합들 구분

이모지 저장할수있냐없냐 차이
mb3안됨, mb4는 된다
bin은 대소문자 구분 - 속도가 더 빠름
*/