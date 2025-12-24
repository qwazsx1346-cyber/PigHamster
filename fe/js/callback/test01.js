/* test01.js */

const n1 = 10;

function sum(n1, n2) {
  console.log(n1 + n2);
}

sum(num1, 20)

const fn = () => { console.log('안녕'); } //함수를 정의하면 함수의 주소값이 리턴됨

function test(cb) {
  cb();
}

test(fn);
test(function() { console.log('ㅋㅋㅋ');})