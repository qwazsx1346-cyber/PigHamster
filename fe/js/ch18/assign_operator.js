/* assign_operator.js
대입 연산자

*/
let n1 = 10;
n1 = n1 + 5;
//1) n1 = 10 + 5;
//1) n1 = 15;
console.log('n1:', n1);

/* 변수에 들어있는 값이 변경이 되려면 = (대입연산자)
    를 이용하여 변경해야 합니다. 유일하게 대입연산자 없이
    숫자 변수의 값을 변경할 수 있는 연산자 증가연산자, 감소연산자
    1씩 증가또는 감소
*/
let n3 = 50;
n3++; //증가연산자
++n3; //증가연산자
console.log('n3', n3)

--n3; //감소연산자
n3--; //감소연산자
n3--; //감소연산자
console.log('n3', n3)


let n4 = 10;
let result4 = n4++; //읽기 -> 쓰기

let n5 = 10;
let result5 = ++n5; //쓰기 -> 읽기

console.log('result4', result4); //10, 컴퓨터가 result4에 n4를 먼저 저장하여 최초는 10, 그 이후 +1되어 11로 출력 
console.log('result5', result5); //11
console.log('n4', n4);
console.log('n5', n5);

console.log('------------------------');
let n6 = 10;
n6++; //쓰기
console.log('n6', n6); //읽기

let n7 = 10;
console.log('n7++', n7++); //10
console.log('n7', n7); //11

let n8 = 10;
console.log('++n8', ++n8); //11
console.log('n8', n8); //11

let n9 = 11;
console.log('n9--', n9--); //11
console.log('n9', n9); //10

// 2025 12 28 23:31  노트북으로 첫 풀당긴 후 푸시테스트