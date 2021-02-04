let _ = require( '../..' );

var left = _.escape.make( null );
console.log( left.val === null );
/* log : true */

var left = _.escape.make( 12 );
console.log( left.val === 12 );
/* log : true */
