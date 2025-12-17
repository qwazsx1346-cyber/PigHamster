/* p.613 if.js
조건문(분기문, if문)

if(식 - 결과타입은 boolean) {
    만약 식이 true라면 {} 중괄호 사이에 있는 모든 코드가 실행이 된다.
    false라면 실행이 되지 않는다.
}
*/
//const rVal = ???; //1~25까지 랜덤숫자 나올 수 있도록 작성해 주세요.
//Math.random()은 0.000~0.999사이 숫자이니

let rVal = parseInt(Math.random() * 25.0) + 1;
console.log('rVal:', rVal);

//짝수였을 때만 "짝수입니다." 출력 // rVal % 2 == 0 이게 짝수라는 식
if( rVal % 2 == 0 ) {
  console.log('짝수입니다.')
}

// if(식) { //식이 true인 경우 실행되는 {}

// } else { //식이 false인 경우 실행되는 {}

// }

console.log('-----------')

//rVal값이 15미만이면 "15보다 작습니다." 가 출력되고 아니면 "15이상입니다."
if( rVal < 15 ) {
  console.log('15보다 작습니다.')
} else { console.log('15이상입니다.') }
