if( typeof module !== 'undefined' )
require( 'wTools' );

var _ = wTools;

//returns '', must { routine add }
console.log(_.toStrMethods((function add(){}),{} ));

//returns { routine add }
console.log(_.toStrFine((function add(){}),{onlyRoutines:0 } ));

//returns '', must { routine add }
console.log(_.toStrFine((function add(){}),{onlyRoutines:1 } ));
