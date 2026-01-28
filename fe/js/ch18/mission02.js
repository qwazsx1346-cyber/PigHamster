// 4~12 랜덤값 나올 수 있는 값 
// 0~8 + 4

let rVal = parseInt((Math.random()) * 9.0 + 4); // 실수는 실수끼리 모양 맞춰주고
                                                // 정수는 정수끼리 맞춰주기
                                                // 그렇지않으면 형변환이 일어남
console.log('rVal:', rVal);