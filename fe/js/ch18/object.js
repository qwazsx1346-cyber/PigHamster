/* object.js
자바스크립트에서 객체를 만드는 방법

객체는 (속성), (메소드(Method)) 로 이루어질 수 있다.
속성만있을 수도, 메소드만 있을수도 아에 없을 수 도 있음.
키: 값
key: value(속성값 or 함수(Function))

person1에 저장되는 값은 객체의 주소값 하나이다!!

객체의 주소값을 알면 속성값 읽기/쓰기, 메소드 호출할 수 있다.
주소값.  주소값쩜!!
*/
// person1은 가방(주소값,객체). 하나밖에 저장안됨 (상수)
// 그 아래 name, age, married는 속성이며 필기구, 연필, 지갑 등 여러 정보들
// 김철수3, 25, false들은 속성에 들어있는 값들.
// run은 메소드(Method), 객체안에 들어있는 함수가 메소드
// 객체와 주소값등을 눈으로 볼 수는 없다.
const person1 = {
    name: '김철수3',
    age: 25,
    married: false,
    run: function() { console.log('나는 뛴다.!!!'); }
};

function run() { console.log('나는 뛴다.!!!'); }
run();

person1.run();

const person2 = person1; //shallow copy (얕은 복사, 주소값 복사)
console.log('person1.name:', person1.name);
console.log('person2.name:', person2.name);
person1.name = '홍길동';
person2.age = 30;
console.log('person1.name:', person1.name);
console.log('person2.name:', person2.name);
console.log('person1.age:', person1.age);
console.log('person2.age:', person2.age);


// 객체 자체를 복사하는 것은 deep copy (깊은 복사, 객체 복사)

const person3 = {
    name: '김철수',
    age: 25,
    married: false
};
//동등성, 동일성 (도플갱어로 비유. 도플갱어는 동등성, 동일성은x)
//주소값이 같으면 동일하다고 함
