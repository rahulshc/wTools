if( typeof module !== 'undefined' )
require( 'wTools' );

var _ = wTools;

//var arr = _.arrayRange([ 2,10 ]);

//console.log( 'arr :',arr );

//returns '', must { routine add }
console.log(_.toStrMethods((function add(){}),{} ));

//returns { routine add }
console.log(_.toStrFine((function add(){}),{onlyRoutines:0 } ));

//returns '', must { routine add }
console.log(_.toStrFine((function add(){}),{onlyRoutines:1 } ));
