( function _fEvent_s_() {

'use strict';

let _global = _global_;
let _ = _global_.wTools;
let Self = _.event = _.event || Object.create( null );

// --
// implementation
// --

function on_pre( routine, args )
{
  let o;

  _.assert( _.longIs( args ) );
  _.assert( arguments.length === 2 );

  if( args.length > 1 )
  {
    o = Object.create( null );
    o.callbackMap = Object.create( null );

    let chain = [];

    if( _.mapIs( args[ args.length-1 ] ) )
    {
      let opt = args[ args.length-1 ];
      _.mapExtend( o, _.mapBut( opt, { name : null } ) );
    }

    for( let a = 0 ; a < args.length-2 ; a++ ) (function( a )
    {
      let e1 = args[ a ];
      let e2 = args[ a+1 ];
      chain.push([ e1, on ]);
      function on()
      {
        let next = chain[ a+1 ];
        this.on( next[ 0 ], next[ 1 ] );
      }
    })( a );

    chain.push([ args[ args.length-2 ], args[ args.length-1 ] ]);

    _.assert( _.routineIs( args[ args.length-1 ] ) );

    let first = chain[ 0 ];

    if( _.strIs( first[ 0 ] ) )
    {
      o.callbackMap[ first[ 0 ] ] = first[ 1 ];
    }
    else
    {
      _.assert( _.strIs( first[ 0 ].name ) )
      o.callbackMap[ first[ 0 ].name ] = first[ 1 ];
    }

  }
  else
  {
    o = args[ 0 ]
  }

  _.assert( _.mapIs( o ) );

  return o;
}

//

function on( o )
{

  _.routineOptions( off, arguments );
  _.assert( _.mapIs( o.callbackMap ) );
  _.assert( _.objectIs( o.registeredCallbackMap ) );
  _.assertMapHasOnly( o.callbackMap, o.registeredCallbackMap );
  _.assert( arguments.length === 1 );

  for( let c in o.callbackMap )
  {
    let callback = o.callbackMap[ c ];
    _.assert( _.routineIs( callback ) );
    if( o.first )
    _.arrayPrepend( o.registeredCallbackMap[ c ], callback );
    else
    _.arrayAppend( o.registeredCallbackMap[ c ], callback );
  }

  return o;
}

on.pre = on_pre;
on.defaults =
{
  callbackMap : null,
  registeredCallbackMap : null,
  first : 0,
}

//

function off_pre( routine, args )
{

  _.assert( _.longIs( args ) );
  _.assert( arguments.length === 2 );
  _.assert( args.length === 1 || args.length === 2 );

  let o = args[ 0 ];
  if( args.length === 2 )
  o = { callbackMap : { [ args[ 0 ] ] : args[ 1 ] } }
  else if( _.strIs( args[ 0 ] ) )
  o = { callbackMap : { [ args[ 0 ] ] : null } }

  _.assert( _.mapIs( o ) );

  return o;
}

//

function off( o )
{

  _.routineOptions( off, arguments );
  _.assert( _.mapIs( o.callbackMap ) );
  _.assert( _.objectIs( o.registeredCallbackMap ) );
  _.assertMapHasOnly( o.callbackMap, o.registeredCallbackMap );
  _.assert( arguments.length === 1 );

  for( let c in o.callbackMap )
  {
    if( o.callbackMap[ c ] === null )
    _.arrayEmpty( o.registeredCallbackMap[ c ] );
    else
    _.arrayRemoveOnceStrictly( o.registeredCallbackMap[ c ], o.callbackMap[ c ] );
  }

  return o;
}

off.pre = off_pre;
off.defaults =
{
  callbackMap : null,
  registeredCallbackMap : null,
}

// --
// declaration
// --

let Extension =
{

  on,
  off,

}

Object.assign( Self, Extension );

// --
// export
// --

if( typeof module !== 'undefined' && module !== null )
module[ 'exports' ] = _;

})();
