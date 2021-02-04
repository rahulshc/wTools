let _ = require( '../..' );

var left = _.escape.left( _.nothing );
console.log( left === _.escape.nothing );
/* log : true */
