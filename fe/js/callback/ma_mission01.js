/* ma_mission01.js */

const arr = [ 3, 88, 76, 9, 34, 65 ];
const myArr = {
  '0': 3,
  '1': 88,
  '2': 76,
  '3': 9,
  '4': 34,
  '5': 65,
  'length': 6,
  'forEach': function(fn) {
    for(let i=0; i<this.length; i++) {
        fn(myArr[i],i);
    }
  }
};

myArr.forEach((item,idx) => {
  console.log(`arr[${idx}]: ${item}`);
});