/* p.625 for_array02.js


*/

const arr = [ 5, 10, 15, 20, 25, 30, 35, 40 ];
for(const item of arr) { // for-of문, arr가 가지고있는 값들을 item쪽으로 순차적으로 넣어줌
  console.log(item);        //읽기만 하려면 for-of문을 사용해주는게 빠르고 좋음
}