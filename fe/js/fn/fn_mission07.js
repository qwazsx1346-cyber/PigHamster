/* fn_mission07.js */

//함수 정의


const arr = [ 10, 8 ,4, 88, 65, 3, 99 ];
function sumArr(arr) {
    let sum = 0;
    for (const item of arr) {
        sum += item;
    }
    return sum;
} 
const sum = sumArr(arr); //배열의 모든 값을 더한 값을 리턴하는 함수
console.log('sum:', sum);