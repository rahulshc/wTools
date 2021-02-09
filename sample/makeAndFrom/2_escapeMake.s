if( typeof module !== 'undefined' )
require( 'wTools' );
let _ = wTools;

let src = _.null;
let got = _.escape.make( src );

console.log( got )
console.log( got === src );
console.log( got === _.escape.null );
