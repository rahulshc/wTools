( function _l3_ArgumentsArray_s_()
{

'use strict';

let _global = _global_;
let _ = _global_.wTools;
let Self = _global_.wTools.argumentsArray = _global_.wTools.argumentsArray || Object.create( null );

// --
// implementation
// --

function is( src )
{
  return Object.prototype.toString.call( src ) === '[object Arguments]';
}


function make( src )
{
  _.assert( arguments.length === 0 || arguments.length === 1 );
  if( src === undefined || src === null )
  src = 0;
  _.assert( _.numberIs( src ) || _.longLike( src ) );
  if( _.numberIs( src ) )
  return _.argumentsArray._make.apply( _, Array( src ) );
  else
  return _.argumentsArray._make.apply( _, src );
}

//

function _make()
{
  return arguments;
}

//

function from( src )
{
  _.assert( arguments.length === 1, 'Expects single argument' );
  if( _.argumentsArray.is( src ) )
  return src;
  return _.argumentsArray.make( src );
}


// --
// extension
// --

var Extension =
{
  is,
  make,
  _make,
  from

}

//

var ExtensionTools =
{
  argumentsArrayIs : is,
  argumentsArrayMake : make,
  _argumentsArrayMake : _make,
  argumentsArrayFrom : from,
}

//

Object.assign( Self, Extension );
Object.assign( _, ExtensionTools );

// --
// export
// --

if( typeof module !== 'undefined' )
module[ 'exports' ] = _;

})();
