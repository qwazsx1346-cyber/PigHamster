const updateUser = (user) => {
  return {
    ...user,
    age: 40
  };
};

let user = {
  name: "지훈",
  age: 20
};

const newUser = updateUser(user);

console.log(user.age);    // 20 (원본 유지)
console.log(newUser.age); // 40
