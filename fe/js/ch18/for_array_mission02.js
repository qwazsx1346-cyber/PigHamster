/* for_array_mission02.js 
      반복문을 사용하여 배열에 들어있는 모든값을 더하여 더한값을 출력해 주세요

*/

const arr = [ 3, 8, 11, 86, 43, 22 ];
let sum = 0;
for (let i=0; i<arr.length; i++) {
      sum += arr[i]; //sum은 0 + arr0번방부터...5번방까지 더하기
}
console.log(sum);
