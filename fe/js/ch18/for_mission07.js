/* for_mission07.js */


//const star = ??; //3~7사이 랜덤값

// //*이 세로로 출력
const star = parseInt(Math.random() * 5.0) + 3;
console.log('star', star);
for(let i=0; i<star; i++) {
    console.log('*');
}

// *이 가로로 출력
// let str = ''
// for (let i=0; i<star; i++) {
//   str += '*';  // str += '+' 는 str = str + '+' 라는 뜻과 같다.
// }
// console.log(str);