/* for_mission08.js */

const star = parseInt(Math.random() * 5.0) + 3; //3~7사이 랜덤값
console.log('star', star);
let str = ''
    for (let i=0; i<star; i++) {
      str += '*';
    }
      console.log(str); //여기까지가 가로로 별 n개를 만드는것 (1)
    for(let u=1; u<star; u++) {
      console.log(str); // 여기에 (1)값을 넣어줌으로서 세로로 그 값이 그대로 출력
    }


/* 다른 방법 1
console.log('------------')
let str2 = '';
for(let i=1; i<=star*star; i++) {
  str2 += '*';
  if(i % star === 0) {
    str2 += '\n';
  }
}
console.log(str2);
*/

/* 다른 방법 2
let a = ''
for(let j=0; j<star; j++){
    for(let i=0; i<star; i++){
        a = a + '*'
    }
    a = a + '\n';
    }
    console.log(a);
*/