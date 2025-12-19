/* continue_break.js
continue키워드와 break키워드 사용법 학습

break: 나를 감싸고 있는 반복문 바로 빠져 나오기
continue: for문인 경우 증감식 순서로 바로 가고, while문 이었으면 조건식 순서로 바로 간다.

*/

//1~10까지 세로로 출력하는 반복문을 만들어 주세요.

for(let i=1; i<11; i++) {
  if(i == 5) { break; } // 지정값 도달하면 그 값은 박살내고 바로 빠져나옴
                        // 특정 조건을 충족했을 때 해당 반복문 전체를 종료
    console.log(i);
}
console.log('----끝----');

for(let i=1; i<11; i++) {
  if(i === 5 ) { continue; } // 그 값을 만나면 실행하지않고 건너뛰고 다음으로 넘어감
                 // 반복문 실행 시 어떤 반복문을 건너뛸 때 사용, or수식어(||)를 주면 중복으로도 실행가능
    console.log(i);
}
console.log('----끝----');

for(let i=0; i<10; i++) {
  for(let k=0;  ; k++) {
    if(k == 5) { break; }
    console.log(`i:${i}, k:${k}`)
  }
}

console.log('----------반복문에 레이블 지정, 별명 지정');

outerloop:
for(let i=0; i<10; i++) {
  for(let k=0;  ; k++) {
    if(k == 5) { break outerloop; } //outerloop(임의의 이름)를 주고 break+(임의의 이름)을 주면 
                                    //지정값에 도달하였을 때 가까운 반복문을 박살내는게 아닌 임의의 이름을 준곳이 박살남
    console.log(`i:${i}, k:${k}`)
  }
}
console.log('----- continue');

outerloop:
for(let i=0; i<10; i++) {
  for(let k=0; k<10 ; k++) {
    if(k == 5) { continue outerloop; //break;랑 같다.
    } //break; 안쪽 for문 뒤에 내용이 없다면 같은데 내용이 있다면 다를 수 있다.
    console.log(`i:${i}, k:${k}`)
  }
  console.log('ㅋㅋㅋ')
}