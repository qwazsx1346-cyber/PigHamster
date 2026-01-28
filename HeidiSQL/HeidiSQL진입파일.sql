/* p.148 데이터 조작어 - 검색
DML (Data Manipulation Language)
C - INSERT - 저장
R - SELECT - 읽기
U - UPDATE - 수정
D - DELETE - 삭제

SELECT 컬럼명(여러개 작성가능 구분은 콤마)
FROM 테이블명
*/ 
SELECT bookid, bookname, publisher, price
FROM book; -- 명령어의 끝은 항상 세미콜론.

SELECT bookid, bookname FROM book;

SELECT * FROM book;

-- 도서(book) 테이블에 있는 모든 출판사를 검색
-- *은 전체라는 뜻. select * 은 select의 전체

SELECT distinct publisher FROM book;

/*
FROM절 이후에
WHERE절을 입력할 수 있다. 부분 검색시 사용
*/

-- 가격이 20,000원 미만인 도서를 검색
SELECT * FROM book WHERE price < 20000 AND bookid < 5;

SELECT *, price < 20000, bookid < 5 FROM book;

-- 가격이 20,000원 이상인 도서를 검색
SELECT * FROM book WHERE price >= 20000;

-- Q1) 도서 가격이 10,000원 이상 20,000원 이하인 도서를 검색
SELECT * FROM book WHERE price >= 10000 AND price <= 20000;
SELECT * FROM book WHERE price BETWEEN 10000 AND 20000;
-- 이상 이하만 between적용 가능. 초과 미만을 사용해야하면 숫자를 9999 또는 20001로 수정하여 사용하면됨

-- 출판사가 '굿스포츠' 혹은 '대한미디어'인 도서를 검색
SELECT * FROM book
WHERE publisher = '굿스포츠'
OR publisher = '대한미디어';

SELECT * FROM book WHERE publisher IN ('굿스포츠', '대한미디어');

-- 출판사가 '굿스포츠' 와 '대한미디어'가 아닌  도서를 검색
SELECT * FROM book WHERE publisher NOT IN ('굿스포츠', '대한미디어');

-- 출판사가 '굿스포츠' 와 '대한미디어'가 아닌  도서를 검색
/*
SELECT * FROM book
WHERE !(publisher = '굿스포츠'
OR publisher = '대한미디어');
*/

-- '축구의 역사'를 출간한 출판사를 검색하시오.
SELECT publisher FROM book WHERE bookname = '축구의 역사'; 

-- like 패턴 검색 equal찾을 때는 = 이 낫다.
-- LIKE 문법은 column명 LIKE '원하는값' 으로 적어야함 
-- %의미는 문자가 여러개 있어도 되고 없어도 상관없다.
SELECT publisher FROM book WHERE bookname LIKE '축구%';
-- like 축구%는 축구로 시작하는 모든 내용을 다 출력
SELECT * FROM book WHERE bookname LIKE '%해';
-- like %해는 해로 끝나는 모든 내용을 다 출력

SELECT * FROM book WHERE publisher LIKE '%미디%';
-- like %미디%는 중간에 미디 라는 글자가 들어가는 모든 내용을 다 출력

-- LIKE 패턴 검색 때 '_'(언더바)는 자리차지를 꼭 해야한다.
-- 도서명의 왼쪽 두 번째 위치에 '구'라는 문자열을 가진 도서 검색
-- 첫번째는 뭐가있던 상관없고 두번째자리가 구 로 시작하는 단어를 검색하는 기능
SELECT * FROM book where bookname LIKE '_구%';

-- Q2) 축구와 관련된 도서 중 가격이 20,000원 이상인 도서를 검색

SELECT * FROM book WHERE price >= 20000 AND bookname LIKE '%축구%';

SELECT * FROM book WHERE bookname LIKE '%축구%' AND price >= 20000;

-- Q3) 출판사가 '굿스포츠' 혹은 '대한미디어'인 도서를 검색
SELECT * FROM book WHERE publisher = '굿스포츠' OR publisher = '대한미디어';

-- ROW의 순서를 조정 할 때 order by 절을 사용합니다.
-- 도서를 이름순으로 검색
-- ASC: 오름차순(아무것도 안적으면 기본으로 세팅됨)
-- DESC: 내림차순
SELECT * FROM book ORDER BY bookname DESC;


