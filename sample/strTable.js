if( typeof module !== 'undefined' )
{
  require( '../staging/dwtools/Base.s' );
  require( 'wLogger' );
  require( 'wColor' );
}


var _ = wTools;

var currentCellOutput;
var silentLogger = new wLogger
({
  output : null,
  onWrite : ( o ) => { currentCellOutput = o; }
});

function onCellAfter( cellStr )
{
  var cellStr = _.toStr( cellStr, {} );
  silentLogger.log( _.strColor.fg( cellStr, 'yellow' ) );
  return currentCellOutput.outputForTerminal[ 0 ];
}

var data = [ 1,2,3,4,5,6,7,8,9 ];
var table = _.strTable
({
  data : data,
  head : ['A','B','C'],
  colsNumber : 3,
  rowsNumber : 3,
  colWidths : { 1 : 10 },
  onCellAfter : onCellAfter
});
console.log( table );