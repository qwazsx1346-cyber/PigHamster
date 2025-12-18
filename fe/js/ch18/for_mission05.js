/* for_mission05.js */

const dan = parseInt(Math.random() * 8.0) + 2;
console.log('dan:', dan);

for(let i=1; i<10; i++) {
    console.log(`${dan} x ${i} = ${dan * i}`);
}

// 5가나오면 5단만, 6이 나오면 6단만....9가 나오면 9단만 나오게하기
// 식에서 5<i<=9를 적으려고 한다면 앤드문을 사용하여 
// 5<i && i<=9로 표기해야함


//5 x 1 = 5
//5 x 2 = 10
//...
//5 x 9 = 45

