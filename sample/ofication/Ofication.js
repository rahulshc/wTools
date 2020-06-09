let _ = require( 'wTools' );

/**
 * Ofication example
 * Got: function mapToStr( src, keyValDelimeter, entryDelimeter) { ... }
 * The mapToStr() routine converts and returns the passed object {-srcMap-} to the string.
 */

function mapToStr( src, keyValDelimeter, entryDelimeter )
{
  let result = '';
  for( let s in src )
  {
    result += s + keyValDelimeter + src[ s ] + entryDelimeter;
  }

  result = result.substr( 0, result.length-entryDelimeter.length );

  return result
}
/**
 * To oficate routine we need:
 *  - Create 1 parameter 'o'
 *  - Add default values map
 *  - Add checks (Here: check for one string argument and the amount of parameters)
 *  - Add call to '_.routineOptions( mapToStr, o )'
 *  - In the routine's body work with parameters through keys - o.src, etc.
 */

// Oficated routine
function mapToStr( o )
{

  if( _.strIs( o ) )
  o = { src : o }

  _.routineOptions( mapToStr, o );
  _.assert( arguments.length === 1, 'Expects single argument' );

  let result = '';
  for( let s in o.src )
  {
    result += s + o.keyValDelimeter + o.src[ s ] + o.entryDelimeter;
  }

  result = result.substr( 0, result.length-o.entryDelimeter.length );

  return result
}

mapToStr.defaults =
{
  src : null,
  keyValDelimeter : ':',
  entryDelimeter : ';',
}


// OFICATED ROUTINE'S GENERAL EXAMPLE:

function example( o )
{
  // Check types, can add strings to return in case of inconsistency, or callbacks
  _.assert( arguments.length === 1, 'Expects single argument' );
  _.assert( _.objectIs( o ) );
  _.assert( _.intIs( o.a ), 'Expects integer' );
  _.assert( _.strIs( o.b ), 'Expects string' );
  _.assert( _.boolLike( o.c ), 'Expects bool-like value' );
  _.assert( _.objectLike( o.d ), 'Expects object-like value' );
  _.assert( _.arrayIs( o.e ), 'Expects array' );
  _.assert( _.arrayLike( o.f ), () => 'Expects an array of strings, but got ' + _.strType( o.f ) );

  _.routineOptions( example, o );

  // Write main routine code below
  // ...
}

example.defaults =
{
  //integer
  a : 3,
  //string
  b : 'center',
  // boolean
  c : true,
  // object
  d : {},
  // array
  e : [],
  // array of strings
  f : [ 'a', 'b' ]
}
