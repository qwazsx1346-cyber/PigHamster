const arr = [
  { id: 'abc', name: '홍길동1' },
  { id: 'bcd', name: '홍길동2' },
  { id: 'cde', name: '홍길동3' },
];
const obj = {};
// for (let i=0; i<arr.length; i++) {
//   obj[arr[i].id] = arr[i];
// };
// console.log(obj);

arr.forEach( item => {
  obj[item.id] = item
});
console.log(obj);

// const obj = {
//     abc: { id: 'abc', name: '홍길동1' },
//     bcd: { id: 'bcd', name: '홍길동2' },
//     cde: { id: 'cde', name: '홍길동3' }
// };

//forEach함수에서 forEach(a,b)에서 b는 방번호, a는 객체가 나오는건 약속된 함수임.