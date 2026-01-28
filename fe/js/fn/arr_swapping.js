/* arr_swapping.js

0번방 값과 1번방 값을 교체하는 작업
*/

const arr = [ 10, 20 ];
// -- start    start와 end사이에는 10, 20 리터럴 사용 금지!!
const temp = arr[0]; //temp라는 변수에 0번방의 값을 복사해놓은 뒤 1번방값을 0번방으로,
                      // 0번방의값(temp)을 1번방으로 이동.
arr[0] = arr[1];
arr[1] = temp;

// -- end

console.log(arr); // [ 20, 10 ]