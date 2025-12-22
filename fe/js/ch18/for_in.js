/* for_in.js
객체가 가지고 있는 '상수 key(속성명)'를 순차적으로 준다.


*/
const person1 = {
    name: '김철수',
    age: 25,
    married: false
};

// for(const key in person1) {
//     console.log('key: ', key);
// }

// console.log(person1.name)이렇게해서 불러왔을 경우
// 객체명이 변경되면 값이 나오지 않게됨
// for_in을 사용해주면 그런걸 방지해줌


for(const key in person1) {
    console.log(person1[key]);
}