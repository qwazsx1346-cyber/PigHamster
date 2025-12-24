/* ma_mission01.js */

const arr = [ 3, 88, 76, 9, 34, 65 ];
const myArr = {
  '0': 3,
  '1': 88,
  '2': 76,
  '3': 9,
  '4': 34,
  '5': 65,
  'length': 6,
  'forEach': function(fn) {
    for(let i=0; i<this.length; i++) {
        fn(this[i],i);
    }
  }
};


myArr.forEach((item,idx) => { //여기서 .forEach에 뒤에 객체들의 주소값들이 자기네 집이 어딘줄 알고 들어가냐하면
                              //myArr 안에 forEach라고 이름지어준 곳에 만들어놓은 함수 집 으로 저장됨
                              // 만약  myArr.fff의 주소값을 복사해서 보내주려면 myArr안에 fff라고 이름지어놓은곳에 있는 함수 방이 있어야 보낼 수 있음.
  console.log(`arr[${idx}]: ${item}`);
} );
//함수의 주소값을 알면 >> 함수를 호출할 수 있다.