( function _fSorted_s_() {

'use strict';

//

let _global = _global_;
let _ = _global_.wTools;
let Self = _.sorted = _.sorted || Object.create( null );

// --
// implementation
// --

function searchFirstIndex( srcArr, ins )
{
  let l = 0;
  let r = srcArr.length;
  let m;
  if( srcArr.length )
  debugger;

  do
  {
    m = Math.floor( ( l + r ) / 2 );
    if( srcArr[ m ] < ins )
    l = m+1;
    else if( srcArr[ m ] > ins )
    r = m;
    else
    return m;
  }
  while( l < r );
  if( srcArr[ m ] < ins )
  return m+1;

  return m;
}

// --
// declare
// --

let Proto =
{

  searchFirstIndex,
  // searchFirst,

}

_.mapExtend( Self, Proto );

// --
// export
// --

if( typeof module !== 'undefined' && module !== null )
module[ 'exports' ] = Self;

})();
