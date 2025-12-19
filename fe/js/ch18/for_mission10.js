/* for_mission10.js */
const star = parseInt(Math.random() * 5.0) + 3; //3~7사이 랜덤값
console.log('star', star);


// str를 반복문 안에서 초기화 하면 매번 같은 값을 적용해줌
// 삼각형 형식을 랜덤값만큼 반복하기위해 사용


// let str = ''   
//     for (let i=0; i<star; i++) {
//       str += '*';
//       console.log(str);
//     } 



//방법 1
for(let i=star; i>0; i--) {
    let str = '';
    for(let k=1; k<=star; k++) {
        str += k<i ? '_' : '*';        
    }
    console.log(str);
}

console.log('----------');

//방법 2
for(let i=1; i<=star; i++) {
    let str = '';
    for(let k=star; k>0; k--) {
        if(k>i) {
            str += '_';
        } else {
            str += '*';
        }
    }
    console.log(str);
}

console.log('----------');

//방법3
let aster_risk = '';
for(let i=1; i<=star; i++) {
    aster_risk += '*';
    
    let space = '';
    for(let k=star; k>i; k--) {
        space += '_';
    }
    console.log(space+aster_risk);
}