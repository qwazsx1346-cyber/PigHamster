/* fn05.js
화살표 함수(Arrow Function)

function 키워드를 쓰는 문법이 ES5까지 문법
화살표 함수는 ES6 이후에 나온 문법

*/

function sum(n1, n2) {
    console.log('sum:', n1 + n2);
}

sum(40, 50);

//정의 방법이 기존과 달라진다.
const arrowSum = (n1, n2) => {
    console.log('arrowSum:', n1 + n2);
}
//호출 방법은 똑같다.
arrowSum(40, 50);

/*
화살표 함수는 A. ()를 생략할 수 있는 조건이 있다. 파라미터가 1개일 때만 가능.
            B. {}를 생략할 수 있는 조건이 있다. 코드가 1줄 일 때.
                C. (리턴 함수를 정의할 때 {}생략하면 return 키워드도 생략가능하다.)

*/

function pow(num) {
    console.log('pow:', num * num);
}
pow(10);
// A, B 상황만 적용
const pow2 = num => console.log('pow:', num * num);
pow2(10);

console.log('------------------A, B, C 상황')
function returnPow(num) {
  return num * num;
}
const returnPow2 = num => num * num; //return 함수
const returnPow3 = num => { num * num }; //void 함수
const returnPow4 = num => { return num * num }; //중괄호가 쓰고싶으면 return함수를 꼭 써야함

console.log('returnPow(20):', returnPow(20));
console.log('returnPow2(20):', returnPow2(20));
console.log('returnPow3(20):', returnPow3(20));