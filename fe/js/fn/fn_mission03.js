/* fn_mission03.js


*/

function random(num) {
    let dan = parseInt(Math.random() * num);
    return dan;
    //return parseInt(Math.random() * num); 으로 줄일 수 있음
}
const randomValue = random(9); // 0~8 랜덤값을 리턴하는 함수를 만들어 주세요.

console.log('random:', randomValue )