/* promise.js

new Promise(함수 주소값);

new는 객체 생성할 때 사용하는 키워드
Promise: 생성자 함수

우리가 기존에 만들었던 객체는 틀이 없음.(일회용) 구조가 다른 객체를 여러개 만들 때 유리
생성자 함수는 틀이 있음(설계도) 여러개를 만들 때 유리

보내는 함수는 파라미터가 2개를 사용할 수 있다.

(resolve, reject) => {
    resolve, reject도 콜백함수(함수주소값이 넘어온다.)
    resolve(); 호출할 수 있고
    reject(); 호출할 수 있다.
    그러나 둘 중 하나만 호출해야 한다.
    보통 resolve는 성공했을 때 호출
    reject는 실패했을 때 호출
}
*/
let val = 9;
const p1 = new Promise( (resolve, reject) => { //파라미터안에 resolve, reject는
                                                //이름을 아무거나 해도 상관이없다.
  if(val % 2) { //홀수
      resolve('홀수'); //then메소드에 전달된 콜백함수가 호출, 아규먼트값이 넘어간다.
  } else { //짝수
      reject('짝수'); //catch메소드에 전달된 콜백함수가 호출, 아규먼트값이 넘어간다.
  }
}); //p1에는 Promise객체 주소값 저장

p1 //then과 catch는 Promise의 객체인 (a, b)에서 then은 a, catch는 b와 짝꿍
    //즉 괄호안에 순서와 상관이있음.
.then( item => console.log('then-item:', item) )
.catch( item => console.log('catch-item:', item) );