( function _fErr_s_() {

'use strict';

let _global = _global_;
let _ = _global_.wTools;
let Self = _global_.wTools;

// --
// implementation
// --

/* xxx : cover it */
function error_functor( name, onMake )
{

  if( _.strIs( onMake ) || _.arrayIs( onMake ) )
  {
    let prepend = onMake;
    onMake = function onErrorMake()
    {
      debugger;
      let arg = _.arrayAppendArrays( [], [ prepend, arguments ] );
      return args;
    }
  }
  else if( !onMake )
  onMake = function onErrorMake()
  {
    return arguments;
  }

  let Error =
  {
    [ name ] : function()
    {
      if( !( this instanceof ErrorConstructor ) )
      {
        let err1 = new ErrorConstructor();
        let args1 = onMake.apply( err1, arguments );
        _.assert( _.arrayLike( args1 ) );
        let args2 = _.arrayAppendArrays( [], [ [ err1, ( arguments.length ? '\n' : '' ) ], args1 ] );
        let err2 = _._err({ args : args2, level : 3 });

        _.assert( err1 === err2 );
        _.assert( err2 instanceof _global.Error );
        _.assert( err2 instanceof ErrorConstructor );
        // _.assert( !!err2.stack );

        return err2;
      }
      else
      {
        _.assert( arguments.length === 0 );
        return this;
      }
    }
  }

  let ErrorConstructor = Error[ name ];

  _.assert( ErrorConstructor.name === name, 'Looks like your interpreter does not support dynamice naming of functions. Please use ES2015 or later interpreter.' );

  ErrorConstructor.prototype = Object.create( _global.Error.prototype );
  ErrorConstructor.prototype.constructor = ErrorConstructor;
  ErrorConstructor.constructor = ErrorConstructor;

  return ErrorConstructor;
}

// --
// routines
// --

let NamespaceExtension =
{
  error_functor,
}

//

Object.assign( Self, NamespaceExtension );

// --
// export
// --

if( typeof module !== 'undefined' && module !== null )
module[ 'exports' ] = Self;

})();
