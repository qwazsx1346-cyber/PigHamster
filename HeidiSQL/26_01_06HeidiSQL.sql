/* distinct는 현재 보이는 컬럼을 조합하여  row별로 중복을 제거 
어차피 중복될 일이 없다면 굳이 distinct를 적을 이유가 없다.
성능저하때문.*/
SELECT DISTINCT bookname, publisher
FROM book;

-- distinct는 내부적으로 group by를 이용한다.
SELECT bookname, publisher
FROM book
GROUP BY bookname, publisher;

-- 도서를 도서명 오름차순으로 정렬하여 검색
SELECT * FROM book ORDER BY bookname;

-- 도서를 도서명 내림차순으로 정렬하여 검색
SELECT * FROM book ORDER BY bookname DESC;

-- 도서를 출판사 이름을 오름차순으로 정렬하여 검색(,price까지 하면 1차로 출판사를 오름차순으로 정렬하고 2차로 price까지 오름차순으로 정렬
SELECT * FROM book ORDER BY publisher, price;

/* 집계 함수(그룹 함수)
sum: 그룹에서 전부더한 값
min: 그룹에서 최소값
max: 그룹에서 최대값
count: 그룹 row 수 count뒤에는 * 또는 1 또는 price를 주던 아무거나 적어도 상관 없음. 보통 * 을 많이 씀. NULL은 카운팅하지 않는다.
avg: sum / count

group by로 그룹을 지정하지 않으면 전체 row가 한 그룹이 된다.
*/
SELECT sum(price), MAX(price), MIN(price),
		COUNT(*), AVG(price),
		SUM(price) / COUNT(*)
	FROM book; -- 144,500

-- orders 테이블의 row수는?
SELECT COUNT(*) FROM orders;

-- count 함수는 null은 카운팅하지 않는다.
SELECT COUNT(phone), COUNT(*) FROM customer;
						-- COUNT(custid)와 같음
-- 출판사 별로 가장 비싼 책의 가격과 저렴한 책의 가격을 검색
SELECT publisher, MAX(price), MIN(price), COUNT(*)
FROM book
GROUP BY publisher;


-- Q1) 고객이 주문한 도서의 총판매액을 구하시오.
-- AS: alias 알리아스, 별명(출력 시 컬럼명 바꿀 때 사용) 없어도되고 양쪽에 홑따옴표가 없어도 작동은 됨
SELECT SUM(saleprice) AS 'total_sale_price' FROM orders;

SELECT SUM(saleprice) total_sale_price FROM orders;

-- Q2) 김연아 고객이 주문한 도서의 총판매액을 구하시오.
SELECT SUM(saleprice) FROM orders WHERE custid = 2;

SELECT c.`name`, SUM(saleprice)
FROM orders o
JOIN customer c
ON o.custid = c.custid
WHERE o.custid = 2
GROUP BY c.`name`;


-- Q3) 마당서점의 도서 판매 건수를 구하시오.
SELECT COUNT(*) FROM orders;

-- Q4) 고객별로 주문한 도서의 총수량과 총판매액을 구하시오.
SELECT custid, COUNT(bookid) AS '도서수량', SUM(saleprice) AS'총액' FROM orders GROUP BY custid;

/* 가격이 8,000원 이상인 도서를 구매한 고객에 대하여 - WHERE절
고객별 주문 도서의 총수량을 구하시오.
단, 2권 이상 구매한 고객에 대해서만 구하시오. - HAVING절
*/

SELECT * FROM orders
WHERE saleprice >= 8000;

SELECT custid, COUNT(*) FROM orders -- 누가 구매했냐-> select custid,
WHERE saleprice >= 8000
GROUP BY custid
HAVING COUNT(*) >= 2 -- 조건으로 출력된 값(COUNT)중에서 2(권)이상 => count(*) >= 2
;

-- having절에서 alias 사용할 수 있다.
SELECT custid, COUNT(*) AS cnt FROM orders
WHERE saleprice >= 8000
GROUP BY custid
HAVING cnt >= 2
;

-- Q5) 출판사별 출판한 도서가격의 평균가격이 20000원 
-- 이상인 출판사 알고 싶다.
-- where절은 가격 하나하나에 조건을 거는것.
-- having절은 전체에 조건을 거는것.
SELECT publisher, AVG(price) AS avg_price
FROM book
GROUP BY publisher
HAVING avg_price >= 20000;

/* 조인, 두 테이블간의 설정된 관계를 연결하여
	원하는 컬럼의 내용을 검색할 때 사용
	
	(INNER) JOIN: 너도 있고 나도 있는 데이터만 검색하자(교집합)
	LEFT (OUTER) JOIN: 왼쪽에 있는 데이터는 검색되는걸
							무조건 보장, 우측은 연결될 데이터가 있다면
							연결한다. 없으면 null표시
	위 둘은 항상 ON절과 함께 사용. on은 테이블과 테이블끼리 연결고리를 만들어 주는것(중요).
*/
SELECT c.name, c.address, c.phone, o.orderid
FROM customer AS c -- AS는 생략가능
JOIN orders AS o -- AS는 생략가능
ON o.custid = c.custid; -- customer에는 5번 박세리가 있지만
								-- orders에는 5번 박세리가 없기때문에 출력은 5번이 없음

-- left outer join
SELECT c.name, c.address, c.phone, o.orderid, o.saleprice
FROM customer AS c -- AS는 생략가능
LEFT JOIN orders AS o -- AS는 생략가능
ON o.custid = c.custid; -- LEFT JOIN에서 왼쪽(customer)에는 5번 박세리가 있기때문에 출력됨

-- Q1) 고객번호, 고객이름, 고객주소, 주문번호, 판매금액, 판매날짜를 검색해 주세요.
-- 주문번호 기준 오름차순 정렬
SELECT c.custid, c.name, c.address, o.orderid, o.saleprice, o.orderdate
FROM customer c 
JOIN orders o
ON c.custid = o.custid
ORDER BY o.orderid ASC; -- order by절에서 asc는 생략가능
-- ON o.custid = c.custid; 똑같은 말임

-- Q2) 고객별로 주문한 도서의 총판매액을 구하고,
-- 고객별로 정렬하시오.
SELECT c.custid, c.name, SUM(saleprice) -- select와 from사이에 들어가는건 group by에 적힌것만 적을 수 있다.
FROM customer c
JOIN orders o
ON c.custid = o.custid
GROUP BY c.custid, c.name
ORDER BY c.name;

--	Q3) 주문번호, 고객의 이름, 책이름 출력
SELECT o.orderid, c.name, b.bookname
FROM customer c
JOIN orders o
ON c.custid = o.custid
JOIN book b
ON b.bookid = o.custid;

-- Q4) 가격이 20,000원인 도서를 주문한 고객의 이름과 도서의 이름을 구하시오
SELECT c.`name`, b.bookname
FROM book b
JOIN orders o
ON o.bookid = b.bookid
JOIN customer c
ON c.custid = o.custid
WHERE b.price = 20000;

-- Q5) 고객의 이름과 고객이 주문한 도서의 이름과 판매가격을 검색
-- 도서를 구매하지 않은 고객도 포함(null)
SELECT c.`name`, b.bookname, o.saleprice
FROM customer c
LEFT JOIN orders o
ON o.custid = c.custid
LEFT JOIN book b
ON b.bookid = o.custid;

/* 서브쿼리 (subquery)
select in select, 서브쿼리가 아닌 다른 방법으로 해결이 가능하다면
사용을 지양하는게 좋다. 왜냐하면 성능이 좋지 않음.(항상x)

*/

-- 가장 비싼 책의 가격
SELECT MAX(price) FROM book;

-- 35,000원의 책의 정보를 검색
SELECT * FROM book
WHERE price = 35000;

SELECT * FROM book
WHERE price = (SELECT MAX(price) FROM book);

/* where절 에서 equal값 사용할 때는 스칼라값만 사용 가능,
스칼라값은 row 1줄, column 1개를 스칼라값이라고 하며
위의 서브쿼리를 스칼라 서브쿼리라고 부른다.
*/

-- column 하나에 여러 row인 경우 where절에서 in과 함께 사용가능. in절은 column 몇개라도 상관없음
SELECT custid FROM orders;

SELECT NAME FROM customer
WHERE custid IN (SELECT custid FROM orders);

-- Q6) 대한미디어 출판사에서 출판한 도서를 구매한 고객의 이름 검색

-- 1) 대한 미디어에서 출간한 책의 id를 구하시오. (3, 4)
SELECT bookid FROM book WHERE publisher = '대한미디어';

-- 2) 3, 4번 책 거래 정보 구하시오.
SELECT custid FROM orders WHERE bookid IN (3, 4);

-- 3) 1번 고객의 이름을 출력하시오.
SELECT NAME FROM customer WHERE custid IN(1);

-- 1~3번 합체
SELECT NAME FROM customer
WHERE custid IN(SELECT custid FROM orders
						WHERE bookid IN (SELECT bookid FROM book
												WHERE publisher = '대한미디어'));

SELECT c.name
FROM book b
JOIN orders o
ON o.bookid = b.bookid
JOIN customer c
ON c.custid = o.custid
WHERE b.publisher = '대한미디어';

-- 출판사별로 출판사의 평균 도서 가격보다 비싼 도서를 구하시오.
SELECT b1.publisher, b1.bookname
FROM book b1
WHERE b1.price > (SELECT AVG(b2.price) FROM book b2
							WHERE b2.publisher = b1.publisher ); 
													
/* union(중복제거), union all(중복 허용)
여러 select 결과를 합칠 때 사용. 성능은 좋지 않다.
컬럼수, 타입이 맞아야한다.

*/
SELECT * FROM book WHERE publisher = '굿스포츠'
UNION ALL
SELECT * FROM book WHERE publisher = '대한미디어';

-- 책번호 1~5 가져오는 쿼리
-- 책번호 3~8 가져오는 쿼리
SELECT * FROM book WHERE bookid <=5
UNION ALL
SELECT * FROM book WHERE bookid between 3 AND 8;

-- Q7) 대한민국에 거주하는 고객의 이름과 도서를 주문한 고객의
-- 이름을 모두 나타내시오.(중복허용)

SELECT NAME
FROM customer
WHERE address LIKE '대한민국%'

UNION ALL

SELECT DISTINCT c.`name`
FROM orders o
JOIN customer c
ON o.custid = c.custid;

/* insert row 추가
insert into 테이블이름
( 컬럼들 )
values
( 값들 )

insert into 테이블이름
set 컬럼명 = 값
, 컬럼명 = 값
*/

-- 오로지 1row insert 가능
INSERT INTO book
SET
bookid = 12,
bookname = '스포츠 의학',
publisher = '한솔의학서적',
price = 90000;

-- 1row or 멀티 row 가능
INSERT INTO book
( bookid, bookname, publisher, price )
VALUES
( 11, '스포츠 의학', '한솔의학서적', 90000 );

INSERT INTO book
( bookid, bookname, publisher, price )
VALUES
( 14, '스포츠 의학', '한솔의학서적', 90000 ),
( 15, '스포츠 의학', '한솔의학서적', 90000 );


INSERT INTO book
( bookid, bookname, publisher, price )
SELECT 13, bookname, publisher, price
FROM book
WHERE bookid = 12;
-- 위 내용은 13번이라는 bookid를 insert하고 12번의 bookname, publisher, price을 그대로 사용하여 삽입











