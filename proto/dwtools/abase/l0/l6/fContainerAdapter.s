( function _iType_s_() {

'use strict';

let _global = _global_;
let _ = _global_.wTools;

// --
// type test
// --

function is( src )
{
  return ContainerAdapterAbstract.Is( src );
}

//

// function make( dst )
// {
//   if( dst )
//   dst = this.toOriginal( toOriginal );
function make( container )
{
  // if( container )
  // container = this.toOriginal( toOriginal ); // routine returns value as routine, need improvment
  _.assert( arguments.length === 1 );
  if( _.setIs( container ) )
  {
    return new SetContainerAdapter( container );
  }
  else if( _.arrayIs( container ) )
  {
    return new ArrayContainerAdapter( container );
  }
  else _.assert( 0, 'Unknown type of container' );
}

//

function from( container )
{
  _.assert( arguments.length === 1 );
  if( container instanceof ContainerAdapterAbstract )
  {
    return container;
  }
  else if( _.setIs( container ) )
  {
    return new SetContainerAdapter( container );
  }
  else if( _.arrayIs( container ) )
  {
    return new ArrayContainerAdapter( container );
  }
  else _.assert( 0, 'Unknown type of container' );
}

//

function toOriginal( dst )
{
  if( !dst )
  return dst;
  if( dst instanceof ContainerAdapterAbstract )
  return dst.original;
  return dst;
}

//

function toOriginals( dsts, srcs )
{
  if( srcs === undefined )
  srcs = dsts;
  if( srcs === dsts )
  {
    if( _.arrayLike( dsts ) )
    {
      for( let s = 0 ; s < dsts.length ; s++ )
      dsts[ s ] = _.toOriginal( dsts[ s ] );
      return dsts;
    }
    return _.toOriginal( dsts );
  }
  else
  {
    _.assert( 0, 'not implemented' );
  }
}

// function originalsFromAdapters( dsts )
// {
//   let dsts2;
//   if( _.arrayLike( dsts ) )
//   {
//     for( let d = 0 ; d < dsts.length ; d++ )
//     {
//       let dst = dsts[ d ];
//       let dst2 = _.toOriginal( dst );
//       if( dst !== dst2 )
//       {
//         if( !dsts2 )
//         dsts2 = [ ... dsts ];
//         dsts2[ d ] = dst2;
//       }
//     }
//     return dsts;
//   }
//   let result = _.toOriginal( dsts );
//   if(  )
// }

// --
//
// --

class ContainerAdapterAbstract
{
  constructor( container )
  {
    _.assert( arguments.length === 1 );
    this.original = container;
  }
  static OriginalOf( container )
  {
    if( container instanceof ContainerAdapterAbstract )
    return container.original;
    return container;
  }
  OriginalOf( container )
  {
    return this.constructor.OriginalOf( container );
  }
  static Is( src )
  {
    if( !src )
    return false;
    return src instanceof ContainerAdapterAbstract;
  }
  static AdapterFrom( src )
  {
    if( !src )
    return;
    if( src instanceof this )
    return src;
    debugger;
    return new this( src );
  }
  static _FilterArguments( dst, onEach )
  {
    if( _.routineIs( dst ) || dst === undefined )
    {
      _.assert( onEach === undefined );
      onEach = dst;
      dst = null;
    }
    if( dst === null )
    dst = this.MakeEmpty();
    else
    dst = this.AdapterFrom( dst );
    return [ dst, onEach ];
  }
  _FilterArguments( dst, onEach )
  {
    return this.constructor._FilterArguments( dst, onEach );
  }
  _same( src )
  {
    return src.original === this.original;
  }
  same( src )
  {
    if( !src )
    return false;
    if( src instanceof ContainerAdapterAbstract )
    return this._same( src );
    return this.original === src.original;
  }
  // original = null; // Dmytro : need clarification
}

// --
//
// --

class SetContainerAdapter extends ContainerAdapterAbstract
{
  constructor( container )
  {
    super( container );
    _.assert( arguments.length === 1 );
    _.assert( _.setIs( container ) );
  }
  make()
  {
    _.assert( arguments.length === 0 );
    return new SetContainerAdapter( new Set( this.original ) );
  }
  static MakeEmpty()
  {
    _.assert( arguments.length === 0 );
    return new SetContainerAdapter( new Set );
  }
  MakeEmpty()
  {
    debugger;
    return this.constructor.MakeEmpty();
  }
  has( e )
  {
    return this.original.has( e );
  }
  count( e )
  {
    return this.original.has( e ) ? 1 : 0;
  }
  append( e )
  {
    this.original.add( e );
    return this;
  }
  appendOnce( e )
  {
    this.original.add( e );
    return this;
  }
  appendOnceStrictly( e )
  {
    _.assert( !this.original.has( e ), 'Set already has such element' );
    this.original.add( e );
    return this;
  }
  push( e )
  {
    this.original.add( e );
    return this.original.size;
  }
  appendContainer( container )
  {
    container = this.OriginalOf( container );
    if( _.longIs( container ) )
    for( let k = 0, l = container.length ; k < l ; k++ )
    this.original.add( container[ k ] );
    else if( _.setIs( container ) )
    for( let e of container )
    this.original.add( e );
    else _.assert( 0, 'Unexpected data type' );
    return this;
  }
  appendContainerOnce( container )
  {
    return this.appendContainer( container );
  }
  pop( e )
  {
    debugger;
    _.assert( arguments.length === 1 );
    let r = this.original.delete( e );
    return e;
  }
  removedOnce( e )
  {
    debugger;
    return this.original.delete( e );
  }
  removedOnceStrictly( e )
  {
    // debugger;
    _.assert( this.original.has( e ), 'Set did not have such element' );
    return this.original.delete( e );
  }
  empty()
  {
    debugger;
    this.original.clear();
  }
  map( dst, onEach )
  {
    let container = this.original;
    [ dst, onEach ] = this.constructor._FilterArguments( ... arguments );
    if( this._same( dst ) )
    {
      debugger;
      let temp = [ ... container ];
      container.clear();

      for( let e of temp )
      {
        let e2 = onEach( e, undefined, container );

        if( e2 !== undefined && e !== e2 )
        container.add( e2 );
        else
        container.add( e );
      }
      // Dmytro : this code makes cycled loop because add method append elements
      // for( let e of container )
      // {
      //   let e2 = onEach( e, undefined, container );
      //
      //   if( e2 !== undefined && e !== e2 )
      //   {
      //     container.delete( e );
      //     // container.remove( e ); // Set constructor has not this method
      //     container.add( e2 );
      //   }
      // }
    }
    else
    {
      debugger;
      for( let e of container )
      {
        let e2 = onEach( e, undefined, container );
        if( e2 !== undefined )
        dst.append( e2 );
        else
        dst.append( e );
      }
    }
    return dst;
  }
  filter( dst, onEach )
  {
    let container = this.original;
    [ dst, onEach ] = this.constructor._FilterArguments( ... arguments );
    if( this._same( dst ) )
    {
      debugger; xxx
      for( let e of container )
      {
        let e2 = onEach( e, undefined, container );
        if( e !== e2 )
        {
          container.remove( e );
          if( e2 !== undefined )
          container.add( e2 );
        }
      }
    }
    else
    {
      for( let e of container )
      {
        let e2 = onEach( e, undefined, container );
        if( e2 !== undefined )
        dst.append( e2 );
      }
    }
    return dst;
  }
  once( dst, onEval )
  {
    let container = this.original;
    [ dst, onEval ] = this.constructor._FilterArguments( ... arguments );
    if( this._same( dst ) )
    {
      /* already once */
    }
    else
    {
      debugger; xxx
      dst.appendContainer( container );
    }
    return dst;
  }
  each( onEach )
  {
    return this.eachLeft( onEach );
  }
  eachLeft( onEach )
  {
    for( let e of this.original )
    onEach( e, undefined, this.original );
    return this;
  }
  eachRight( onEach )
  {
    debugger;
    let reversedContainer = new Set( [ ... this.original ].reverse() );
    for( let e of reversedContainer )
    onEach( e, undefined, this.original );
    return this;
  }
  all( onEach )
  {
    for( let e of this.original )
    {
      let r = onEach( e, undefined, this.original );
      if( !r )
      return r;
    }
    return true;
  }
  any( onEach )
  {
    debugger;
    for( let e of this.original )
    {
      let r = onEach( e, undefined, this.original );
      if( r )
      return r;
    }
    return false;
  }
  none( onEach )
  {
    debugger;
    for( let e of this.original )
    {
      let r = onEach( e, undefined, this.original );
      if( r )
      return false;
    }
    return true;
  }
  join( delimeter )
  {
    return [ ... this.original ].join( delimeter );
  }
  toArray()
  {
    return new ArrayContainerAdapter([ ... this.original ]);
  }
  [ Symbol.iterator ]()
  {
    debugger;
    return this.original[ Symbol.iterator ]();
  }
  get length()
  {
    return this.original.size;
  }
}

//

class ArrayContainerAdapter extends ContainerAdapterAbstract
{
  constructor( container )
  {
    super( container );
    _.assert( arguments.length === 1 );
    _.assert( _.arrayIs( container ) );
  }
  make()
  {
    debugger;
    _.assert( arguments.length === 0 );
    return new ArrayContainerAdapter( this.original.slice() );
  }
  static MakeEmpty()
  {
    _.assert( arguments.length === 0 );
    return new ArrayContainerAdapter( new Array );
  }
  MakeEmpty()
  {
    debugger;
    return this.constructor.MakeEmpty();
  }
  has( e )
  {
    return this.original.includes( e );
  }
  count( e )
  {
    return _.arrayCountElement( this.original, e );
  }
  append( e )
  {
    this.original.push( e );
    return this;
  }
  appendOnce( e )
  {
    debugger;
    _.arrayAppendOnce( this.original, e )
    return this;
  }
  appendOnceStrictly( e )
  {
    debugger;
    _.arrayAppendOnceStrictly( this.original, e )
    return this;
  }
  push( e )
  {
    return this.original.push( e );
  }
  appendContainer( container )
  {
    container = this.OriginalOf( container );
    if( _.longIs( container ) )
    _.arrayAppendArray( this.original, container );
    else if( _.setIs( container ) )
    for( let e of container )
    this.original.push( e );
    else _.assert( 0, 'Unexpected data type' );
    return this;
  }
  appendContainerOnce( container )
  {
    container = this.OriginalOf( container );
    if( _.longIs( container ) )
    _.arrayAppendArrayOnce( this.original, container );
    else if( _.setIs( container ) )
    _.arrayAppendArrayOnce( this.original, [ ... container ] );
    else _.assert( 0, 'Unexpected data type' );
    return this;
  }
  pop( e )
  {
    debugger;
    var poped = this.original.pop();
    _.assert( e === undefined || poped === e );
    return poped;
  }
  removedOnce( e )
  {
    debugger;
    return _.arrayRemovedOnce( this.original, e );
  }
  removedOnceStrictly( e )
  {
    // debugger;
    return _.arrayRemovedOnce( this.original, e );
  }
  empty()
  {
    debugger;
    this.original.splice( 0, this.original.length );
  }
  map( dst, onEach )
  {
    debugger; // xxx
    let container = this.original;
    [ dst, onEach ] = this.constructor._FilterArguments( ... arguments );
    if( this._same( dst ) )
    {
      debugger;
      // for( let e of container )
      // {
      //   let e2 = onEach( e, undefined, container );
      //   if( e !== e2 || e2 !== undefined )
      //   {
      //     container[ k ] = e2;
      //   }
      // }
      for( let k in container )
      {
        let e2 = onEach( container[ k ], undefined, container );
        if( e2 !== undefined )
        {
          container[ k ] = e2;
        }
      }
    }
    else
    {
      debugger;
      for( let e of container )
      // for( let [ k, e ] of container )
      {
        let e2 = onEach( e, undefined, container );
        if( e2 !== undefined )
        dst.push( e2 );
        else
        dst.push( e );
      }
    }
    return dst;
  }
  filter( dst, onEach )
  {
    let container = this.original;
    [ dst, onEach ] = this.constructor._FilterArguments( ... arguments );
    if( this._same( dst ) )
    {
      debugger; // xxx
      for( let k in container )
      {
        let e2 = onEach( container[ k ], undefined, container );
        if( container[ k ] !== e2 || e2 === undefined )
        {
          if( e2 !== undefined )
          container[ k ] = e2;
          else
          container.splice( k, 1 );
        }
      }
    }
    else
    {
      for( let k = 0, l = container.length ; k < l ; k++ )
      {
        let e = container[ k ];
        let e2 = onEach( e, undefined, container );
        if( e2 !== undefined )
        dst.push( e2 );
      }
    }
    return dst;
  }
  once( dst, onEval )
  {
    let container = this.original;
    [ dst, onEval ] = this.constructor._FilterArguments( ... arguments );
    if( this._same( dst ) )
    {
      _.longOnce( container, onEval );
      // _.longOnce( container );
    }
    else
    {
      debugger; // xxx
      _.arrayAppendArrayOnce( dst.original, container, onEval );
      // dst.appendContainerOnce( container );
    }
    return dst;
  }
  each( onEach )
  {
    return this.eachLeft( onEach );
  }
  eachLeft( onEach )
  {
    this.original.forEach( onEach );
    return this;
  }
  eachRight( onEach )
  {
    let container = this.original;
    for( let k = container.length - 1 ; k >= 0 ; k-- )
    onEach( container[ k ], k, container );
    return this;
  }
  all( onEach )
  {
    return this.original.every( onEach );
  }
  any( onEach )
  {
    debugger;
    return this.original.some( onEach );
  }
  none( onEach )
  {
    debugger;
    return !this.original.some( onEach );
  }
  join( delimeter )
  {
    return this.original.join( delimeter );
  }
  toArray()
  {
    return this;
  }
  [ Symbol.iterator ]()
  {
    return this.original[ Symbol.iterator ]();
  }
  get length()
  {
    return this.original.length;
  }
}

// --
// declare
// --

class ContainerAdapterNamespace
{
  static experiment(){};
  static [ Symbol.hasInstance ]( instance )
  {
    return is( instance );
  }
}

let Handler =
{
  construct( original, args )
  {
    return ContainerAdapterNamespace.make( ... args );
  }
};

let Self = new Proxy( ContainerAdapterNamespace, Handler );
Self.original = ContainerAdapterNamespace;

//

var Fields =
{

  Abstract : ContainerAdapterAbstract,
  Set : SetContainerAdapter,
  Array : ArrayContainerAdapter,

}

//

var Routines =
{

  /* qqq : requires good tests */

  is,
  make,
  from,

  toOriginal,
  toOriginals,
  // originalsFromAdapters,

}

//

Object.assign( Self, Routines );
Object.assign( Self, Fields );
_.assert( _.containerAdapter === undefined );
_.containerAdapter = Self;

// --
// export
// --

if( typeof module !== 'undefined' && module !== null )
module[ 'exports' ] = Self;

})();
