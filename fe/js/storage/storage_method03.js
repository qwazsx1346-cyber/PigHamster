const arr = [
    { id: 'abc', name: '홍길동1' },
    { id: 'bcd', name: '홍길동2' },
    { id: 'cde', name: '홍길동3' }
];
const obj = {};
for (let i=0; i<arr.length; i++) {
  const key = arr[i].id;
  obj[key] = arr[i];
};
console.log(obj);

// const obj = {
//     abc: { id: 'abc', name: '홍길동1' },
//     bcd: { id: 'bcd', name: '홍길동2' },
//     cde: { id: 'cde', name: '홍길동3' }
// };
