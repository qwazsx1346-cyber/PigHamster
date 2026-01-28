/* cb03.js 배열의 filter, 배열에서 필요한 아이템들만 쏙 뽑아서
새로운 배열을 만들 때 사용
*/

const arr = [ 3, 88, 76, 9, 34, 65 ];

// const oddArr = arr.filter(item => item % 2);
const oddArr = arr.filter( (item) => {
    return item % 2 === 1;
} );
console.log(oddArr);
console.log(arr);

//함수앞에 = 이 붙어있으면 return함수 없으면 void함수
// 예) const oddArr = arr.filter( (item) => ... 에서 = 앞에 const oddArr가 붙어있음