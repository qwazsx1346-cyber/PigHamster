/* ma_mission02.js */

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
        fn(this[i],i);
    }
  },
  'filter': function (fn) {
      const temp = []; //true값만 배열에 담기

      for(let i=0; i<this.length; i++) {
        const result = fn(this[i], i);
        if(result) {
          temp.push(this[i]);
        }
      }
      return temp;
  }
};

const arr2 = myArr.filter( (item, i) => item <= 70 ); // filter의 파라미터는 1개, fn이 받은 파라미터는 2개. 
                                                      // 사실상 i는 쓰지않아서 안적어도 무방함
console.log(arr2); // [ 3, 9, 34, 65 ]