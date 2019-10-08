( function _iType_s_() {

'use strict';

let _global = _realGlobal_;
let _ = _global_.wTools;

if( _global_ !== _realGlobal_ && _realGlobal_.wTools.containerAdapter )
{
  let _ = _global_.wTools;
  _.assert( _.containerAdapter === undefined );
  _.containerAdapter = _realGlobal_.wTools.containerAdapter;
  if( typeof module !== 'undefined' && module !== null )
  module[ 'exports' ] = _.containerAdapter;
  return;
}

// --
// type test
// --

function is( src )
{
  return ContainerAdapterAbstract.Is( src );
}

//

function make( container )
{
  if( container )
  container = this.toOriginal( container );

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
      dsts[ s ] = this.toOriginal( dsts[ s ] );
      // dsts[ s ] = _.toOriginal( dsts[ s ] );
      return dsts;
    }
    return this.toOriginal( dsts );
    // return _.toOriginal( dsts );
  }
  else
  {
    if( dsts === null )
    dsts = [];

    if( _.arrayIs( dsts ) )
    {
      if( _.arrayLike( srcs ) )
      {
        for( let e of srcs )
        dsts.push( this.toOriginal( e ) );
        return dsts;
      }
      else
      dsts.push( this.toOriginal( srcs ) );
      return dsts;
    }
    else
    {
      if( _.arrayLike( srcs ) )
      {
        let result = [];
        result.push( this.toOriginal( dsts ) );
        for( let e of srcs )
        result.push( this.toOriginal( e ) );
        return result;
      }
      return this.toOriginals( [], arguments );
    }
    // _.assert( 0, 'not implemented' );
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
  Is( src )
  {
    return this.constructor.Is( src );
  }
  static IsContainer( src )
  {
    if( _.setLike( src ) )
    return true;
    if( _.longLike( src ) )
    return true;
    return false;
  }
  IsContainer( src )
  {
    return this.constructor.IsContainer( src );
  }
  static From( src )
  {
    if( src instanceof ContainerAdapterAbstract )
    return src;
    if( _.setLike( src ) )
    return new SetContainerAdapter( src );
    if( _.longLike( src ) )
    return new ArrayContainerAdapter( src );
    _.assert( 0, 'Cant get adapter' );
  }
  From( src )
  {
    return this.constructor.From( src );
  }
  _filterArguments( dst, onEach )
  {
    if( _.routineIs( arguments[ 0 ] ) )
    {
      _.assert( onEach === undefined );
      onEach = dst;
      dst = null;
    }
    if( dst === null || ( !dst && !onEach ) )
    dst = this.MakeEmpty();
    else if( dst === _.self )
    dst = this;
    else
    dst = this.From( dst );
    return [ dst, onEach ];
  }
  _onlyArguments( dst, src2, onEvaluate1, onEvaluate2 )
  {
    if( _.routineIs( src2 ) )
    {
      if( dst === undefined )
      dst = null;
      onEvaluate2 = onEvaluate1;
      onEvaluate1 = src2;
    }

    if( dst === _.self )
    dst = this;
    else if( dst !== undefined )
    dst = this.From( dst );
    else
    dst = this.MakeEmpty();

    if( src2 === _.self )
    src2 = this;
    else if( src2 !== undefined )
    src2 = this.From( src2 );
    else
    src2 = this.MakeEmpty();
    
    return [ dst, src2, onEvaluate1, onEvaluate2 ];
  }
  // _onlyArguments( dst, src2, onEach )
  // {
  //   if( _.routineIs( arguments[ 2 ] ) )
  //   {
  //   }
  //   else if( _.routineIs( arguments[ 1 ] ) )
  //   {
  //     onEach = arguments[ 1 ];
  //     src2 = dst;
  //     dst = null;
  //   }
  //   if( dst === null )
  //   dst = this.MakeEmpty();
  //   else if( dst === _.self )
  //   dst = this;
  //   else
  //   dst = this.From( dst );
  //   src2 = this.From( src2 );
  //   return [ dst, src2, onEach ];
  // }
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
  removedContainer( src )
  {
    debugger;
    _.assert( 0, 'not tested' );
    let result = 0;
    let self = this;
    src = this.From( src )
    src.each( ( e ) => result += self.removed( e ) );
    return result;
  }
  removedContainerOnce( src )
  {
    debugger;
    _.assert( 0, 'not tested' );
    let result = 0;
    let self = this;
    src = this.From( src )
    src.each( ( e ) => result += self.removedOnce( e ) );
    return result;
  }
  removedContainerOnceStrictly( src )
  {
    debugger;
    _.assert( 0, 'not tested' );
    let self = this;
    src = this.From( src )
    let result = src.length;
    src.each( ( e ) =>
    {
      let removed = self.removed( e );
      _.assert( removed === 1 );
    })
    return result;
  }
  removeContainer( src )
  {
    debugger;
    _.assert( 0, 'not tested' );
    let self = this;
    src = this.From( src )
    src.each( ( e ) => self.remove( e ) );
    return self;
  }
  removeContainerOnce( src )
  {
    // debugger;
    // _.assert( 0, 'not tested' );
    let result = 0;
    let self = this;
    src = this.From( src )
    src.each( ( e ) => self.removeOnce( e ) );
    return self;
  }
  removeContainerOnceStrictly( src )
  {
    debugger;
    _.assert( 0, 'not tested' );
    let self = this;
    src = this.From( src )
    src.each( ( e ) =>
    {
      let removed = self.removed( e );
      _.assert( removed === 1 );
    })
    return self;
  }

  min( onEach ) /* qqq : implement good coverage, make sure it works without onEach | Dmytro : covered, works without onEach, onEach returns value that sets to previusElement */
  {
    let self = this;
    if( onEach )
    return self.reduce( +Infinity, ( a, e ) => Math.min( a, onEach( e ) ) );
    else
    return self.reduce( +Infinity, ( a, e ) => Math.min( a, e ) );
  }

  max( onEach ) /* qqq : implement good coverage, make sure it works without onEach | Dmytro : covered, works without onEach */
  {
    let self = this;
    if( onEach )
    return self.reduce( -Infinity, ( a, e ) => Math.max( a, onEach( e ) ) );
    else
    return self.reduce( -Infinity, ( a, e ) => Math.max( a, e ) );
  }

  least( dst, onEach ) /* qqq : implement good coverage, make sure it works without onEach | Dmytro : covered, works without onEach */
  {
    let self = this;
    [ dst, onEach ] = this._filterArguments( ... arguments );
    let min = self.min( onEach );
    if( onEach )
    return self.filter( dst, ( e ) => onEach( e ) === min ? e : undefined );
    else
    return self.filter( dst, ( e ) => e === min ? e : undefined );
  }

  most( dst, onEach ) /* qqq : implement good coverage, make sure it works without onEach, comparator | Dmytro : covered, works without onEach */
  {
    let self = this;
    [ dst, onEach ] = this._filterArguments( ... arguments );
    let max = self.max( onEach );
    if( onEach )
    return self.filter( dst, ( e ) => onEach( e ) === max ? e : undefined );
    else
    return self.filter( dst, ( e ) => e === max ? e : undefined );
  }

  only( dst, src2, onEvaluate1, onEvaluate2 ) /* qqq : teach to accept comparator, 1 evaluator, 2 avaluators, comparator */
  // only( dst, src2, onEach )
  {
    let self = this;
    let container = self.original;
    [ dst, src2, onEvaluate1 ] = self._onlyArguments( ... arguments );
    // [ dst, src2, onEach ] = self._onlyArguments( ... arguments );

    if( self._same( src2 ) )
    {
      debugger; // xxx
      return self;
    }

    if( self._same( dst ) )
    {
      // _.assert( 0, 'not tested' );
      self.filter( self, ( e ) =>
      {
        if( !src2.has( e ) )
        dst.remove( e, onEvaluate1 );
        // dst.remove( e, onEach );
      });
    }
    else
    {
      src2.each( ( e ) =>
      {
        if( self.has( e ) )
        dst.append( e, onEvaluate1 );
        // dst.append( e, onEach );
      });
    }

    return dst;
  }

  but( dst, src2, onEach ) /* qqq : teach to accept comparator, 1 evluator, 2 avaluators */
  {
    let self = this;
    let container = self.original;
    [ dst, src2, onEach ] = self._onlyArguments( ... arguments );

    if( self._same( src2 ) )
    {
      debugger; // xxx
      self.empty();
      return self;
    }

    if( self._same( dst ) )
    {
      src2.each( ( e ) => dst.remove( e, onEach ) );
    }
    else
    {
      debugger;
      self.each( ( e ) =>
      {
        debugger;
        if( !src2.has( e ) )
        dst.append( e, onEach )
      });
    }

    return dst;
  }

  select( selector )
  {
    let self = this;
    let container = self.original;
    return _.select( container, selector );
  }
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
    _.assert( arguments.length === 1 );
    let r = this.original.delete( e );
    return e;
  }
  popStrictly( e )
  {
    debugger;
    _.assert( arguments.length === 1 );
    _.assert( this.original.has( e ), 'Set does not have such an element' );
    let r = this.original.delete( e );
    return e;
  }
  removed( e )
  {
    debugger;
    return this.original.delete( e ) ? 1 : 0;
  }
  removedOnce( e )
  {
    return this.original.delete( e ) ? 1 : 0;
  }
  removedOnceStrictly( e )
  {
    _.assert( this.original.has( e ), 'Set does not have such an element' );
    return this.original.delete( e );
  }
  remove( e )
  {
    this.original.delete( e );
    return this;
  }
  removeOnce( e )
  {
    this.original.delete( e );
    return this;
  }
  removeOnceStrictly( e )
  {
    _.assert( this.original.has( e ), 'Set does not have such an element' );
    this.original.delete( e );
    return this;
  }
  empty()
  {
    this.original.clear();
  }
  map( dst, onEach )
  {
    let self = this;
    let container = this.original;
    [ dst, onEach ] = this._filterArguments( ... arguments );
    if( this._same( dst ) )
    {
      let temp = new Set( container );
      container.clear();

      for( let e of temp )
      {
        let e2 = onEach( e, undefined, container );

        container.delete( e );
        if( e2 !== undefined && e !== e2 )
        container.add( e2 );
        else
        container.add( e );
      }
    }
    else
    {
      for( let e of container )
      {
        let e2 = onEach( e, undefined, self );
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
    let self = this;
    let container = this.original;
    [ dst, onEach ] = this._filterArguments( ... arguments );
    if( this._same( dst ) )
    {
      debugger; // xxx
      let temp = new Set( container );
      container.clear();

      for( let e of temp )
      {
        let e2 = onEach( e, undefined, container );

        if( e2 === undefined || e !== e2 )
        {
          if( e2 !== undefined )
          container.add( e2 );
          container.delete( e );
        }
        else
        container.add( e );
      }
    }
    else
    {
      for( let e of container )
      {
        let e2 = onEach( e, undefined, self );
        if( e2 !== undefined )
        dst.append( e2 );
      }
    }
    return dst;
  }
  flatFilter( dst, onEach )
  {
    let self = this;
    let container = self.original;
    [ dst, onEach ] = self._filterArguments( ... arguments );
    if( self._same( dst ) )
    {
      _.assert( 0, 'not implemented' );
      let length = container.size;
      for( let e of container )
      {
        if( length === 0 )
        break;
        length--;

        let e2 = onEach( e, undefined, self );
        if( e2 === undefined || e !== e2 )
        {
          if( e2 !== undefined )
          container.add( e2 );
          container.delete( e );
        }
        else
        container.add( e );
      }
    }
    else
    {
      for( let e of container )
      {
        let e2 = onEach( e, undefined, self );
        if( e2 !== undefined )
        if( self.IsContainer( e2 ) || self.Is( e2 ) )
        dst.appendContainer( e2 );
        else
        dst.append( e2 );
      }
    }
    return dst;
  }
  once( dst, onEval )
  {
    let container = this.original;
    [ dst, onEval ] = this._filterArguments( ... arguments );
    if( this._same( dst ) )
    {
      /* already once */
      if( onEval )
      {
        let temp = [ ... container ];
        _.arrayRemoveDuplicates( temp, onEval );
        if( temp.length !== container.size )
        {
          container.clear();

          for( let e of temp )
          container.add( e );
        }
      }
    }
    else
    {
      debugger; // xxx
      if( onEval )
      {
        let temp = [ ... container ];
        _.arrayRemoveDuplicates( temp, onEval );
        container.clear();
        for( let e of temp )
        dst.original.add( e );
      }
      else
      dst.appendContainer( container );
    }
    return dst;
  }
  first( onEach )
  {
    let self = this;
    let container = this.original;
    if( !container.size )
    return undefined;
    if( onEach )
    for( let e of container )
    {
      return onEach( e, undefined, self );
    }
    else
    {
      for( let e of container )
      return e;
    }
    return e;
  }
  last( onEach )
  {
    let self = this;
    let container = this.original;
    if( !container.size )
    return undefined;
    if( onEach )
    {
      return onEach( [ ... container ][ container.size-1 ], undefined, self );
    }
    else
    {
      return [ ... container ][ container.size-1 ];
    }
  }
  each( onEach )
  {
    return this.eachLeft( onEach );
  }
  eachLeft( onEach )
  {
    let self = this;
    let container = this.original;
    for( let e of container )
    onEach( e, undefined, self );
    return this;
  }
  eachRight( onEach )
  {
    debugger;
    let self = this;
    let container = this.original;
    let reversedContainer = new Set( [ ... container ].reverse() );
    for( let e of reversedContainer )
    onEach( e, undefined, self );
    return this;
  }
  reduce( accumulator, onEach )
  {
    let self = this;
    let container = this.original;
    if( arguments[ 1 ] === undefined )
    {
      onEach = arguments[ 0 ];
      accumulator = undefined;
    }
    for( let e of container )
    accumulator = onEach( accumulator, e, undefined, self );
    return accumulator;
  }
  all( onEach )
  {
    let self = this;
    let container = this.original;
    for( let e of container )
    {
      let r = onEach( e, undefined, self );
      if( !r )
      return r;
    }
    return true;
  }
  any( onEach )
  {
    let self = this;
    let container = this.original;
    for( let e of container )
    {
      let r = onEach( e, undefined, self );
      if( r )
      return r;
    }
    return false;
  }
  none( onEach )
  {
    let self = this;
    debugger;
    let container = this.original;
    for( let e of container )
    {
      let r = onEach( e, undefined, self );
      if( r )
      return false;
    }
    return true;
  }
  join( delimeter )
  {
    let container = this.original;
    return [ ... container ].join( delimeter );
  }
  toArray()
  {
    let container = this.original;
    return new ArrayContainerAdapter([ ... container ]);
  }
  [ Symbol.iterator ]()
  {
    debugger;
    let container = this.original;
    return container[ Symbol.iterator ]();
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
    _.arrayAppendOnce( this.original, e );
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
    // debugger;
    var poped = this.original.pop();
    _.assert( e === undefined || poped === e );
    return poped;
  }
  popStrictly( e )
  {
    debugger;
    _.assert( arguments.length === 1 );
    _.assert( this.original[ this.original.length - 1 ] === e, 'Container does not have such element' );
    var poped = this.original.pop();
    return poped;
  }
  removed( e )
  {
    debugger;
    return _.arrayRemoved( this.original, e );
  }
  removedOnce( e )
  {
    debugger;
    return _.arrayRemovedOnce( this.original, e );
  }
  removedOnceStrictly( e )
  {
    return _.arrayRemovedOnceStrictly( this.original, e );
  }
  remove( e )
  {
    _.arrayRemove( this.original, e );
    return this;
  }
  removeOnce( e )
  {
    _.arrayRemoveOnce( this.original, e );
    return this;
  }
  removeOnceStrictly( e )
  {
    _.arrayRemovedOnceStrictly( this.original, e );
    return this;
  }
  empty()
  {
    debugger;
    this.original.splice( 0, this.original.length );
  }
  map( dst, onEach )
  {
    let self = this;
    let container = this.original;
    [ dst, onEach ] = this._filterArguments( ... arguments );
    if( this._same( dst ) )
    {
      debugger;
      for( let k in container )
      {
        let e2 = onEach( container[ k ], undefined, self );
        if( e2 !== undefined )
        {
          container[ k ] = e2;
        }
      }
    }
    else
    {
      for( let e of container )
      {
        let e2 = onEach( e, undefined, self );
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
    let self = this;
    let container = this.original;
    [ dst, onEach ] = this._filterArguments( ... arguments );
    if( this._same( dst ) )
    {
      debugger; // xxx
      for( let k = container.length - 1 ; k >= 0 ; k-- )
      {
        let e = container[ k ];
        let e2 = onEach( e, undefined, self );
        if( e !== e2 || e2 === undefined )
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
        let e2 = onEach( e, undefined, self );
        if( e2 !== undefined )
        dst.append( e2 );
      }
    }
    return dst;
  }
  flatFilter( dst, onEach )
  {
    let self = this;
    let container = self.original;
    [ dst, onEach ] = self._filterArguments( ... arguments );
    if( self._same( dst ) )
    {
      _.assert( 0, 'not implemented' );
      for( let k = container.length - 1 ; k >= 0 ; k-- )
      {
        let e = container[ k ];
        let e2 = onEach( e, undefined, self );
        if( e !== e2 || e2 === undefined )
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
        let e2 = onEach( e, undefined, self );
        if( e2 === undefined )
        {}
        if( self.IsContainer( e2 ) || self.Is( e2 ) )
        dst.appendContainer( e2 )
        else
        dst.append( e2 );
      }
    }
    return dst;
  }
  once( dst, onEval )
  {
    let container = this.original;
    [ dst, onEval ] = this._filterArguments( ... arguments );
    if( this._same( dst ) )
    {
      _.longOnce( container, onEval );
    }
    else
    {
      debugger; // xxx
      _.arrayAppendArrayOnce( dst.original, container, onEval );
    }
    return dst;
  }
  first( onEach )
  {
    let self = this;
    let container = this.original;
    if( onEach )
    {
      if( !container.length )
      return undefined;
      return onEach( container[ 0 ], 0, self );
    }
    else
    {
      return container[ 0 ];
    }
  }
  last( onEach )
  {
    let self = this;
    let container = this.original;
    let l = container.length-1;
    if( onEach )
    {
      if( !container.length )
      return undefined;
      return onEach( container[ l ], l, self );
    }
    else
    {
      return container[ l ];
    }
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
    let self = this;
    let container = this.original;
    for( let k = container.length - 1 ; k >= 0 ; k-- )
    onEach( container[ k ], k, self );
    return this;
  }
  reduce( accumulator, onEach )
  {
    let self = this;
    let container = this.original;
    if( arguments[ 1 ] === undefined )
    {
      onEach = arguments[ 0 ];
      accumulator = undefined;
    }
    for( let k = 0, l = container.length ; k < l ; k++ )
    {
      let e = container[ k ];
      accumulator = onEach( accumulator, e, k, self );
    }
    return accumulator;
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

  /* qqq : requires good tests | Dmytro : covered */

  is, /* qqq : cover please | Dmytro : covered */
  make, /* qqq : cover please | Dmytro : covered */
  from, /* qqq : cover please | Dmytro : covered */

  toOriginal, /* qqq : cover please | Dmytro : covered */
  toOriginals, /* qqq : cover please | Dmytro : covered, routine has not implemented branch */

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

if( _global_ !== _realGlobal_ )
{
  _.assert( 0, 'not tested' );
  let _ = _global_.wTools;
  _.assert( _.containerAdapter === undefined );
  _.containerAdapter = _realGlobal_.wTools.containerAdapter;
  if( typeof module !== 'undefined' && module !== null )
  module[ 'exports' ] = _.containerAdapter;
}

// var array = _.containerAdapter.make( [ 1, 2, 3 ] );
// var set = _.containerAdapter.make( new Set([ 1, 2, 3 ]) );
//
// array.append( 'x' );
// set.append( 'x' );
//
// var got = array.map( ( e ) => e+3 );
// var is = got === array; /* false */
//
// var got = array.map( null, ( e ) => e+3 );
// var is = got === array; /* false */
//
// var dst = [ 'x' ];
// var got = array.map( dst, ( e ) => e+3 );
// var is = got === array; /* false */
// var is = got === dst; /* true */
//
// var got = array.map( got, ( e ) => e+3 );
// var is = got === array; /* true */

})();
