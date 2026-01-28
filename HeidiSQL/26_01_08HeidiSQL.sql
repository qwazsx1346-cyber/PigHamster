/* select * from 테이블
	where 아이디 = 값; 일 때 나올 수 있는 경우의 수는 2가지
	1 또는 값이없음
*/

/* Q1) 2006년 1월 1일 이후에 기록이 생성(create_date)된 고객 중에,
이름이 (Steven이거나 Young인) 사람이 아닌 고객 정보 조회 */

SELECT *
FROM customer
WHERE first_name NOT IN  ('Steven', 'Young')
AND create_date > '2006-01-01 23:59:59';


/* Q2) 2005년에 렌탈한 고객의 이름, 성 조회(중복제거) */
SELECT DISTINCT c.first_name, c.last_name
FROM customer c
JOIN rental r
ON c.customer_id = r.customer_id
WHERE r.rental_date BETWEEN '2005-01-01' AND '2005-12-31 23:59:59';

/* Q3) 10달러에서 11.99달러 사이의 모든 결제 정보를 조회.
표시 컬럼: 고객 번호, 결제날짜, 금액*/
SELECT customer_id, payment_date, amount
FROM payment
WHERE amount BETWEEN 10.00 AND 11.99;

/* Q4) FA와 FR 사이에 성이 속하는 고객을 조회
성 기준으로 내림차순 정렬
표시컬럼: 성, 이름  */
SELECT last_name, first_name
FROM customer
WHERE last_name >= 'FA' AND last_name < 'FS'
ORDER BY last_name DESC;

/* Q5) 영화 제목에 'PET'이 포함된 영화의 등급과 같은 영화들의
제목과 등급을 표시해 주세요. 372row
완성된 커리문 제일 앞에 explain analyze을 쓰면 이 쿼리문을 실행하는데
걸린 시간을 보여준다.*/
SELECT title, rating
FROM film
WHERE rating IN (SELECT rating FROM film WHERE title LIKE '%PET%');
-- 위 서브쿼리문의 뜻은 film테이블안에 title에 pet이 포함된 영화의
-- rating을 구한다는 뜻
-- 그 다음 서브쿼리문에서 구한 rating이 포함된 영화제목(title)과
-- 등급(rating)을 구한다는게 위 전체쿼리문.

-- 쿼리문을 쓰지 않아도 되면 최대한 안쓰는게 좋음
SELECT DISTINCT f1.title, f1.rating
FROM film f1
JOIN film f2
ON f2.rating = f1.rating
WHERE f2.title LIKE '%PET%';


/* Q6) 성이 Q로 시작하는 고객 조회*/
SELECT *
FROM customer
WHERE last_name LIKE 'Q%';

SELECT *
FROM customer
WHERE last_name >= 'Q'
AND last_name < 'R'; 
-- 또는 --
SELECT *
FROM customer
WHERE LEFT(last_name, 1) = 'Q';

SELECT LEFT('abcdef', 2);
/*
Vue3, React >>> SPA  화면 만드는 작업 , 최대단점 => SEO(검색 엔진 최적화)가 전혀 안됨
특징 Client Side Rendering
반대 Server side Rendering 
*/
/* NULL을 찾고 싶을 때 방법 => IS NULL */
SELECT * FROM staff
WHERE !(picture IS NULL);


/* Q7) 대여를 반납하지 않은 정보를 조회
표시컬럼: 대여ID, 고객ID */
SELECT rental_id, customer_id
FROM rental
WHERE return_date IS NULL;

/* Q8) madang_db 사용, 한번도 주문을 한 적이 없는 고객 찾기*/
USE madangdb;

SELECT c.`name`
FROM customer c
LEFT JOIN orders o
ON o.custid = c.custid
WHERE o.custid IS NULL; -- where다음 o.어떤컬럼명을 넣어도 상관없음 
								-- 이미 orders테이블에는 박세리 관련된 내용이 아에 없기때문

/* Q9) 고객번호가 5가 아니면서

(결제날짜가 '2005-08-23'이거나 결제금액이 8달러 이상)인
payment_id를 조회하시오. 1418 rows */ 
SELECT payment_id
FROM payment
WHERE customer_id != 5 
AND (payment_date BETWEEN '2005-08-23' AND '2005-08-23 23:59:59'
OR amount >= 8.00); 

/* Q10) payment 테이블에서 금액이 1.98, 7.98 또는 9.98인 모든행을 조회 */
SELECT *
FROM payment 
WHERE amount = 1.98
OR amount = 7.98
OR amount = 9.98;

/* Q11) 성의 두 번째 위치에 A가 있고 A 다음에 W가 있는 모든 고객을 조회*/
SELECT *
FROM customer
WHERE last_name LIKE '_AW%';

/* Q12) 모든 고객의 성, 이름, 주소 조회*/
SELECT c.last_name, c.first_name, a.address
FROM customer c
JOIN address a
ON c.address_id = a.address_id;

/* Q13) 모든 고객의 성, 이름, 주소, 살고있는도시 조회 */
SELECT c.last_name, c.first_name, a.address, ct.city
FROM customer c
JOIN address a
ON c.address_id = a.address_id
JOIN city ct
ON ct.city_id = a.city_id;


/* Q14) 캘리포니아에 거주하는 모든 고객의
이름, 성, 주소 및 도시 조회  */
SELECT c.last_name, c.first_name, a.address, ct.city
FROM address a
JOIN customer c
ON a.address_id = c.address_id
JOIN city ct
ON ct.city_id = a.city_id
WHERE a.district = 'California'; -- 왜 599개?

SELECT c.last_name, c.first_name, a.address, ct.city
FROM address a
JOIN customer c
ON a.address_id = c.address_id
AND a.district = 'California'
JOIN city ct
ON ct.city_id = a.city_id; -- 왜9개?


/* Q15) Cate McQueen 또는 Cuba Birch가
출연한 모든 영화를 조회  */
SELECT DISTINCT f.title
FROM actor a
JOIN film_actor fa
ON fa.actor_id = a.actor_id
JOIN film f
ON fa.film_id = f.film_id
WHERE (a.first_name = 'cate' AND a.last_name = 'mcqueen')
OR (a.first_name = 'cuba' AND a.last_name = 'birch');
-- 또는
SELECT DISTINCT f.title
FROM actor a
JOIN film_actor fa
ON fa.actor_id = a.actor_id
JOIN film f
ON fa.film_id = f.film_id
WHERE (a.first_name, a.last_name)
IN(('cate', 'mcqueen'),('cuba', 'birch'));


/* Q16) Cate McQueen와 Cuba Birch가 동반출연한 모든 영화를 조회 */
SELECT fa.film_id, f.title
FROM actor a
JOIN film_actor fa
ON fa.actor_id = a.actor_id
JOIN film f
ON fa.film_id = f.film_id
WHERE (a.first_name, a.last_name)
IN(('cate', 'mcqueen'),('cuba', 'birch'))
GROUP BY f.film_id, f.title
HAVING COUNT(*) > 1;
-- 또는
SELECT f.film_id, f.title
FROM film f
JOIN film_actor fa1
ON f.film_id = fa1.film_id
JOIN actor a1
ON fa1.actor_id = a1.actor_id
JOIN film_actor fa2
ON f.film_id = fa2.film_id
JOIN actor a2
ON fa2.actor_id = a2.actor_id
WHERE a1.first_name = 'CATE' AND a1.last_name = 'MCQUEEN'
  AND a2.first_name = 'CUBA' AND a2.last_name = 'BIRCH';


/* p.182 DDL 데이터 정의어, 테이블 생성, 수정, 삭제
생성 - create문
수정 - alter문
삭제 - drop문

1) create문
create table 테이블명 (
	컬럼명 컬럼타입 제약조건
	[..., 컬럼명 컬럼타입 제약조건]
)
2) alter문
3) drop문
-- 테이블 삭제
-- DROP TABLE newbook;
-- DROP 후에는 쿼리문 무조건 지워주는게 좋음
*/
CREATE TABLE newbook (
	-- auto_increment 자동 대리키 생성(INT, BIGINT 타입에서 가능)
	-- PK(기본키) 중복없음(Unique), NOT NULL, ROW를 대표한다.
	bookid INT PRIMARY KEY AUTO_INCREMENT,
	-- not null은 값을 무조건 삽입해줘야함
	bookname VARCHAR(20) NOT NULL,
	-- 뒤에 not null을 적지않으면 자동으로 null이 적힌거와 같음 (null 허용)
	publisher VARCHAR(20),
	-- CHECK 조건에 맞지 않는 값은 막기 위해
	price INT NOT NULL CHECK (price >= 1000),
	-- default는 값을 넣지 않으면 기본적으로 들어가는 디폴트 값
	-- current_timestamp, current_timestamp()는 현재일시값이 들어간다.
	created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
	-- ON UPDATE는 업데이트가 되었을 때 현재일시값(current_timestamp) 들어간다.
	updated_at DATETIME ON UPDATE CURRENT_TIMESTAMP
);

INSERT INTO newbook
SET bookname = '준이가 준이했다.',
publisher = '그린출판사',
price = 50000;

INSERT INTO newbook
SET bookname = '아무꺼나',
publisher = '가은출판사',
price = 80000;

-- 책의 가격을 60000원으로 수정
UPDATE newbook
SET price = 60000
WHERE bookid = 1;

CREATE TABLE newcustomer(
	custid INT auto_increment PRIMARY KEY,
	customer_name VARCHAR(5) NOT NULL,
	address VARCHAR(40) NOT NULL,
	phone VARCHAR(13),
	created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
	updated_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
								ON UPDATE CURRENT_TIMESTAMP);

INSERT INTO newcustomer
SET customer_name = '김그린',
address = '대구중구';

UPDATE newcustomer
SET address = '대구 남구',
customer_name = '김블루',
phone = '010-0000-0000'
WHERE custid = 1;


















/* Q10) */
SELECT
FROM
WHERE