let _ = require( '../..' );

var left = _.escape.left( null );
console.log( left === _.null );
/* log : true */

var left = _.escape.left( undefined );
console.log( left === _.undefined );
/* log : true */

var left = _.escape.left( _.nothing );
console.log( left === _.escape.nothing );
/* log : true */

var left = _.escape.left( 1 );
console.log( left === 1 );
/* log : true */
