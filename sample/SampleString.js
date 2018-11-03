if( typeof module !== 'undefined' )
require( 'wTools' );
require( 'wPathFundamentals' );
var _ = wTools;



let str = 'exexample';
let ins = 'ex';
let sub = '1';


//returns [ 'sample', 'string' ]
let s1 = _.strIsolateBeginOrAll( { src : 'sample,string', delimeter : [ '+' ] } );
logger.log( s1 )
//returns [ 'sample', 'string' ]
let s2 = _.strIsolateBeginOrAll( { src : 'sample , string', delimeter : ' st' } )
logger.log( s2 )
//returns [ 'sample string,name', 'string' ]
let s3 = _.strIsolateBeginOrAll( 'sample, string,name string', ',' )
logger.log( s3 )
//returns [ 'sample', 'string' ]
let s4 = _.strIsolateEndOrAll( { src : 'sample,string', delimeter : [ ',' ] } );
logger.log( s4 )
//returns [ 'sample', 'string' ]
let s5 = _.strIsolateEndOrAll( { src : 'sample , string', delimeter : [ 's' , 't'] } )
logger.log( s5 )
//returns [ 'sample string,name', 'string' ]
let s6 = _.strIsolateEndOrAll( 'sample, string,name string', 'x' )
logger.log( s6 )
