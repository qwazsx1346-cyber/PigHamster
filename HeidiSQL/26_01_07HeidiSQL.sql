/* p.193 update문. 기존에 존재하는 row의 컬럼을 수정하는 문법

update 테이블명
set 컬럼명 = 수정값
(, 컬럼명 = 수정값
...이런식으로 수정값 계속 추가 가능)
where 조건문

update문에 where절이 없으면 굉장히 위험한 쿼리가 된다.
where절은 보통 pk가 들어간다.
*/

-- customer 고객번호가 5인 고객의 주소를 '대한민국 부산'으로 변경
UPDATE customer
SET address = '대한민국 부산'
, NAME = '박세리'
WHERE custid = 5;

-- Q1) book 테이블에서 14번 '스포츠 의학'의 출판사를
-- imported_book 테이블에 있는 21번 책의 출판사와 동일하게 변경
UPDATE book
SET publisher = (SELECT publisher FROM imported_book WHERE bookid = 21)
WHERE bookid = 14;

/* p.197 delete - row 삭제
delete from 테이블명 where 조건
where절 먼저 적어주고 시작하거나 백업부터 하고 진행하기
*/
-- book테이블에서 도서번호가 11인 도서 삭제
DELETE FROM book
WHERE bookid = 11;

-- 모든 고객을 삭제
DELETE FROM customer;

-- 오토커밋, 자동으로 커밋, 커밋은 쿼리 결과 적용!!!!

-- 오토커밋 확인(1: 적용, 0: 해제)
SELECT @@autocommit;

-- 오토커밋 해제 => ROLLBACK으로 오토커밋해제 후 진행한 내용 되돌리기 가능
SET autocommit = 0;

-- 오토커밋 적용
SET autocommit = 1;

DELETE FROM customer WHERE custid = 5;

ROLLBACK; -- 적용하지 않겠다.
COMMIT; -- 적용하겠다!

/* 외래키란 참조하는 테이블에 있는 값만 넣을 수 있다. */
-- orders 테이블에 orderid 7번인 row의 bookid를 20번으로 수정
UPDATE orders
SET bookid = 20
WHERE orderid = 7;

-- DML 완료
-- sakila DB import

-- film_category는 영화별 장르가 저장되어 있는 테이블
-- 한 영화가 장르가 2개 이상인 영화id를 찾고 싶다.
SELECT film_id
FROM film_category
GROUP BY film_id
HAVING COUNT(film_id) > 1;

-- Q1) 최소 일주일 동안 대여할 수 있는 G등급(rating)의 영화를 찾고 싶다. rental_duration (대여가능기간)

SELECT title
FROM film
WHERE rating = 'G' AND rental_duration >= 7;

-- Q2) 최소 일주일 동안 대여할 수 있는 G등급(rating)의 영화이거나 PG-13등급이면서
-- 3일 이하로만 대여할 수 있는 영화의 정보 rental_duration(대여가능 기간)

SELECT title
FROM film
WHERE (rating = 'G' AND rental_duration >= 7)
OR (rating = 'PG-13' AND rental_duration <= 3);

/* Q3) 40편 이상의 영화를 대여한 모든 고객의 정보
표시 컬럼: 이름, 성, 대여 갯수
7rows
고객: customer
대여: rental */

SELECT c.first_name, c.last_name, COUNT(*) -- group by에서 r.customer_id를 이미 묶은상태이기 
														-- 때문에, count안에 * 또는 r.rental_id를 넣어도
														-- 값은 똑같이 나옴
FROM customer c
JOIN rental r
ON c.customer_id = r.customer_id
GROUP BY r.customer_id, c.first_name, c.last_name
HAVING COUNT(r.customer_id) >= 40;

/* 날짜, 시간 (일시) 다루기
DATE 함수 날짜를 리턴한다. 함수(값) 을 
 */
SELECT payment_date, DATE(payment_date) -- DATE함수를 이렇게쓰면 성능이 안좋아짐
FROM payment;

SELECT payment_date
FROM payment
WHERE payment_date = DATE('2005-10-10 12:12:00'); -- 차라리 이렇게 적어주면 훨씬 효율이 좋음

SELECT * FROM payment
WHERE payment_date > '2005-06-16';

SELECT payment_date FROM payment
WHERE payment_date BETWEEN '2005-06-16' AND '2005-06-19';

-- Q4) 2005년 06월 14일에 대여한 모든 고객 정보

SELECT c.first_name, c.last_name, r.rental_date
FROM rental r
JOIN customer c
ON r.customer_id = c.customer_id 
WHERE r.rental_date BETWEEN '2005-06-14' AND '2005-06-14 23:59:59';

-- Q5) 모든 배우의 배우 ID, 이름 및 성을 검색
-- 성 기준으로 정렬한 다음 이름 기준으로 정렬합니다.
SELECT actor_id, last_name, first_name
FROM actor
ORDER BY last_name, first_name;

-- Q6) 성이 'WILLIAMS' 또는 'DAVIS'인 모든 배우의 배우 ID,
-- 이름 및 성을 검색합니다.
SELECT actor_id, last_name, first_name
FROM actor
WHERE last_name = 'WILLIAMS'
OR last_name = 'DAVIS';

/* Q7) rental 테이블에서 2005년 7월 5일 영화를 대여한 고객의 ID를
반환하는 쿼리를 작성합니다.(rental.rental_date 열을 사용)
각 고객ID는 하나의 행을 포함합니다.
*/
SELECT customer_id
FROM rental 
WHERE rental_date BETWEEN '2005-07-05' AND '2005-07-05 23:59:59';

/* Q8) 2005년 6월 14일 이외의 날짜에 대여한 영화에 대한
모든 고객의 이메일 주소를 반환(중복제거)*/
SELECT c.email
FROM customer c
JOIN rental r
ON c.customer_id = r.customer_id
WHERE r.rental_date NOT BETWEEN '2005-06-14' AND '2005-06-14 23:59:59';

/* */













