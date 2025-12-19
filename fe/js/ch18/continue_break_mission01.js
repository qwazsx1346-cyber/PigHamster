/* continue_break_mission01.js
*/


//짝수만 출력되게
for(let i=1; i<11; i++) {
  if(i % 2 === 1) {continue;} // ==은 숫자와 문자가 같아도 같다고 표시
                            // ===은 양쪽의 타입이 똑같아야 같다고 표시
  console.log(i);
}
