const users = [
  { id: 1, name: 'Kim', age: 25, isActive: true },
  { id: 2, name: 'Lee', age: 32, isActive: false },
  { id: 3, name: 'Park', age: 28, isActive: true },
  { id: 4, name: 'Choi', age: 40, isActive: true },
  { id: 5, name: 'Jung', age: 22, isActive: false },
];

function proc(item) { users.filter ( item => item.name < 30);
  console.log(item);
}
users.forEach(proc)