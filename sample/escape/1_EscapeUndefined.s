let _ = require( '../..' );

var left = _.escape.left( undefined );
console.log( left === _.undefined );
/* log : true */
