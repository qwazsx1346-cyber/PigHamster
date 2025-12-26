/* ma_mission03.js */

const arr = [ 3, 88, 76, 9, 34, 65 ];
const myArr = {
  '0': 3,
  '1': 88,
  '2': 76,
  '3': 9,
  '4': 34,
  '5': 65,
  '6': 76,
  'length': 7,
  'forEach': function(fn) {
    for(let i=0; i<this.length; i++) {
        fn(this[i],i);
    }
  },
  'filter': function(fn) {
      const temp = []; //true값만 배열에 담기

      for(let i=0; i<this.length; i++) {
        const result = fn(this[i], i);
        if(result) {
          temp.push(this[i]);
        }
      }
      return temp;
  },
  'map': function(fn) {
    const temp = [];
    for( let i=0; i<this.length; i++ ) {
      const val = fn(this[i], i);
      temp.push( val );
    }
    return temp;
  }
};

const arr2 = myArr.map( (item,i) => {
  return item + 2;
} );

console.log(arr2); //[ 5, 90, 78, 11, 36, 67, 79 ]