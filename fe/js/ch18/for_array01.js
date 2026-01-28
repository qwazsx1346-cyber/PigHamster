/* for_array01.js

*/

const arr = [ 5, 10, 15, 20, 25, 30, 35, 40 ];
for(let i=0; i<arr.length; i++) { //arr.length는 배열의 길이값이 들어있음(총 5개니까 5라는 값이 들어있음)
    console.log(`arr[${i}] : ${arr[i]}`); //$[]로 감싼 부분은 변수or상수에 저장된값을 가져와서 저기에 집어넣겠다는 뜻
}
console.log('-----끝-----')