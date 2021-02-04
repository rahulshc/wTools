let _ = require( '../..' );

var left = _.escape.left( null );
console.log( left === _.null );
/* log : true */
