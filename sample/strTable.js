if( typeof module !== 'undefined' )
require( 'wTools' );

var _ = wTools;

var data =
[
  [ 1, 2, 3 ],
  [ 4, 5, 6 ],
  [ 7, 8, 9 ],
]
console.log( _.strTable( data ) );