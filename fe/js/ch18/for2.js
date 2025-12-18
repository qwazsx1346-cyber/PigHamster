/* for2.js
중첩 for문 ( for in for )

시계(시간/분 관계)
*/

// 첫번째 for문에서 h=0으로 시작했는데 또 두번째 for문을 만남. 두번째 for문에서 m이29가 될 때 까지
// 첫번째 for문인 h++로 넘어갈 수 없음.
for(let h=0; h<6; h++) {
    for(let m=0; m<30; m++) {
      for(let s=0; s<30; s++) {
        console.log(`${h}:${m}:${s}`);
      }
    }
}