/* fn_mission02.js 

abs를 리턴함수로 만들고
콘솔에는 "절대값: 리턴한 값" 출력해 주세요.


리턴값이 10이면

"절대값: 10" 콘솔에 출력해 주세요.
*/

function returnAdd(num) {
    let val = num;
    if(val < 0) {val = -val;}
    return val;
}
const val = returnAdd(10);

console.log('절대값:', val);