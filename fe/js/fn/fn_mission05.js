/* fn_mission05.js

*/

//함수 정의
function printStarLine(num) {
    let str = '';
    for(let i=0; i<num; i++) {
        str += '*';
    }
    console.log(str);
}

//함수 호출
printStarLine(5);
//*****

printStarLine(3);
//***

console.log('-------------------square')

function printStarSquare(num){
    for(let u=0; u<num; u++) {
    printStarLine(num);
    }
    
}

printStarSquare(5);
//*****
//*****
//*****
//*****
//*****

printStarSquare(3);
//***
//***
//***

console.log('-------------------triangle');

function printStarTriangle(num) {
    for(let k=1; k<=num; k++)
    printStarLine(k)
}

printStarTriangle(5);


//*
//**
//***
//****
//*****

printStarTriangle(3);

//*
//**
//***