/* cb03_mission01.js */

const arr = [ 3, 88, 76, 9, 34, 65 ];

// arr배열에서 70이하 값들만 있는 새로운 배열을 만들어 주세요.
const arr2 = arr.filter( (item) => {
    return item < 70;
} );
console.log(arr2);

// arr배열에서 3, 88, 76, 9만 살린 새로운 배열을 만들어 주세요.
const arr3 = arr.filter ((item,i) => i < 4);
console.log(arr3);

//회색으로 뜨는 이유는 형식상 식에 넣어주긴하지만 사실상 필요는 없는 친구라
//인식하지 않음