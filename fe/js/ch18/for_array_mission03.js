/* for_array_mission03.js
      배열에 있는 값들을 홀수는 홀수대로 짝수는 짝수대로 모두 더하여
      출력해 주시오.
*/
const arr = [ 3, 8, 11, 86, 43, 22, 27 ]; 
const result = [0, 0]; //[짝수를 더한값을 저장하는공간, 홀수를 더한값을 저장하는 공간]
                        // [0, 0]은 기본 초기화를 해놓은것. 왼쪽방은 짝수를 더한 값, 오른쪽방은 홀수를 더한 값.
                        // 만약 왼쪽방을 홀수를 더한값을 넣고싶으면 if문이 들어가야됨.
const resultStr = ['짝수', '홀수'];

for(let i=0; i<arr.length; i++) {
      const item = arr[i]; //0번방에있는 3이 item값에 저장됨 //값 변경이 되지않으려면 const(계산이 더 빠름)
                              // let대신 const쓰는 이유는 어차피 값이 안바뀌어야하기 때문(안전빵)
      result[item % 2] += item;
}

for(let i=0; i<result.length; i++) {
      console.log(`${resultStr[i]}: ${result[i]}`);
}