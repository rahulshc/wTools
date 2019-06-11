require( 'wTools' );

// without equalizer or evalutor

let arr1 = [ 1, 2, 'a', 'b', true, 6, 1 ];
let elem1 = 1;

console.log( wTools.arrayCountElement( arr1, elem1 ) );

// with equilizer

let arr2 = [ 'a', 'b', 'c', 1, 2, true, 'd', 3, false ];
let elem2 =  'str';
let equalizer = ( elem2, arr2 ) => typeof elem2 === typeof arr2;

console.log( wTools.arrayCountElement( arr2, elem2, equalizer ) );

// with evalutor

let arr3 = [ [ 0, 'a' ], [ 'b', 0 ], [ 2, 0 ], [ 0, true ], [ 4, 'a', 0 ] ];
let elem3 =  0;
let evalutor1 = ( arr3 ) => arr3[ 0 ];
let evalutor2 = ( elem3 ) => elem3;

console.log( wTools.arrayCountElement( arr3, elem3, evalutor1, evalutor2 ) );