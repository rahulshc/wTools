let _ = require( '../..' );

function makeEscapedCopy( arr )
{
  let copy = new Array( arr.length );

  for( let i = 0; i < arr.length; i++ )
  {
    copy[ i ] = _.escape.make( arr[ i ] );
  }

  return copy;
}


let arr1 = [ 1, 2, 3, '4', '5' ];
let arr2 = makeEscapedCopy( arr1 );
let arr3 = arr2.map( ( el ) => _.escape.right( el ) );

console.log( arr1 );
/* log : [ 1, 2, 3, '4', '5' ] */

console.log( arr2 );
/* log : [ Escape( 1 ), Escape( 2 ), Escape( 3 ), Escape( 4 ), Escape( 5 ) ] */

console.log( arr3 );
/* log : [ 1, 2, 3, '4', '5' ] */
