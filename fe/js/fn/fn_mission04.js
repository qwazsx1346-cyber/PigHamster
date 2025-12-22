/* fn_mission04.js




*/

function random(n1, n2) {
    let dan = parseInt(Math.random() * (n2-n1)) + n1;
    return dan;

    //return parseInt(Math.random() * num); 으로 줄일 수 있음
}


const randomValue = random(3, 9); // 3~8 랜덤값을 리턴하는 함수를 만들어 주세요.
console.log('random:', randomValue )

const randomValue2 = random(10, 15); // 10~14 랜덤값을 리턴하는 함수를 만들어 주세요.
console.log('random2:', randomValue2 );