/* cb04_mission02.js
arr에서 짝수만 골라내고 나누기 2한 배열을 만들어 주세요.

*/

const arr = [ 3, 88, 76, 9, 34, 65 ];

// 방법 1
const arr2 = arr.filter ( (item) => {
  return item % 2 === 0;
} );
const arr3 = arr2.map ( (item) => {
  return item/2
})
console.log(arr3);

//방법 2
// const arr2 = arr.filter( item => !(item % 2) );
// const arr3 = arr2.map( item => item / 2 );
// console.log(arr3);