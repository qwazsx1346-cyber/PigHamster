const users = [
  { id: 1, name: 'Kim', age: 25, isActive: true },
  { id: 2, name: 'Lee', age: 32, isActive: false },
  { id: 3, name: 'Park', age: 28, isActive: true },
  { id: 4, name: 'Choi', age: 40, isActive: true },
  { id: 5, name: 'Jung', age: 22, isActive: false },
];

//true는 활성, false는 비활성 유저. 그러므로 활성유저 먼저 뽑아줌
const act = users.filter( user => user.isActive);

//그 중에서 30세 미만인 사람의 이름만 뽑기
const yname = act
.filter(user.age < 30)
.map(user => user.name);

//마지막으로 출력은 forEach로
yname.forEach( name => {
  console.log(`활성 사용자: ${name}`);
} );