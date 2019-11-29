program();

function program()
{

  let _ = require( '../../Tools.s' );
  _.include( 'wFiles' );
  _.include( 'wConsequence' );

  var con = _.Consequence();

  con.then( function callback1( arg )
  {
    console.log( 'sourcePath::callback1 ' + _.procedure.activeProcedure._sourcePath ); debugger;
    return 'callback1';
  })

  _.time.out( 100, function timeOut1()
  {
    console.log( 'sourcePath::timeout ' + _.procedure.activeProcedure._sourcePath ); debugger;
    con.take( 'timeout1' );
  });

  con.deasyncWait();
  debugger;

  console.log( 'sourcePath::program ' + _.procedure.activeProcedure._sourcePath );
}

/*
  Deasync pause current procedure and resule it only after consequence get a resource.
*/
