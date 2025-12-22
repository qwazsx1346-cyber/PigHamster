/* primitive_ref.js

프라머티브타입(일반타입) vs 레퍼런스타입(참조타입)
                              ㄴ주소값
*/

const changeNum = (num) => {
    num = 20;
}

let num = 10;
changeNum(num);
console.log('num:', num);

console.log('------------------------');
const changeBoxNum = (box) => {
  box = {
      num: 30
  }
  box.num = 20;
}

let box = {
    num: 10
};
console.log('box.num:', box.num);
changeBoxNum(box);
console.log('box.num:', box.num);
