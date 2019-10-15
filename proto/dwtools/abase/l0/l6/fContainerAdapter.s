( function _fContainerAdapter_s_() {

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
  if( !src )
  return false;
  return src instanceof ContainerAdapterAbstract;
  // return ContainerAdapterAbstract.Is( src );
}

//

function isContainer( src )
{
  if( _.setLike( src ) )
  return true;
  if( _.longLike( src ) )
  return true;
  return false;
  // return ContainerAdapterAbstract.IsContainer( src );
}

//

function make( container )
{

  // xxx : this is not wanted behavior
  // if( container )
  // container = this.toOriginal( container );

  _.assert( arguments.length === 1 );

  if( _.setIs( container ) )
  {
    return new SetContainerAdapter( container );
  }
  else if( _.arrayIs( container ) )
  {
    return new ArrayContainerAdapter( container );
  }
  else if( this.is( container ) )
  {
    return container.make();
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
      return dsts;
    }
    return this.toOriginal( dsts );
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
  static ToOriginal( container )
  {
    if( container instanceof ContainerAdapterAbstract )
    return container.original;
    return container;
  }
  ToOriginal( container )
  {
    return this.constructor.ToOriginal( container );
  }
  static Is( src )
  {
    return _.containerAdapter.is( src );
    // if( !src )
    // return false;
    // return src instanceof ContainerAdapterAbstract;
  }
  Is( src )
  {
    return this.constructor.Is( src );
  }
  static IsContainer( src )
  {
    return _.containerAdapter.isContainer( src );
    // if( _.setLike( src ) )
    // return true;
    // if( _.longLike( src ) )
    // return true;
    // return false;
  }
  IsContainer( src )
  {
    return this.constructor.IsContainer( src );
  }
  static Make( src )
  {
    return _.containerAdapter.make( ... arguments );
  }
  Make( src )
  {
    return this.constructor.Make( ... arguments );
  }
  static From( src )
  {
    return _.containerAdapter.from( src );
    // if( src instanceof ContainerAdapterAbstract )
    // return src;
    // if( _.setLike( src ) )
    // return new SetContainerAdapter( src );
    // if( _.longLike( src ) )
    // return new ArrayContainerAdapter( src );
    // _.assert( 0, 'Cant get adapter' );
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
      src2 = dst;
      dst = null;
    }

    if( dst === _.self )
    dst = this;
    else if( dst )
    dst = this.From( dst );
    else
    dst = this.MakeEmpty();

    if( src2 === _.self )
    src2 = this;
    else if( src2 )
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
    debugger;
    _.assert( 0, 'not tested' );
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

  only( dst, src2, onEvaluate1, onEvaluate2 ) /* qqq : teach to accept comparator, 1 evaluator, 2 avaluators, comparator | Dmytro : implemented, covered */
  // only( dst, src2, onEach )
  {
    let self = this;
    let container = self.original;
    [ dst, src2, onEvaluate1, onEvaluate2 ] = self._onlyArguments( ... arguments );
    // [ dst, src2, onEach ] = self._onlyArguments( ... arguments );

    if( self._same( src2 ) )
    {
      return self;
    }

    if( self._same( dst ) )
    {
      let temp = [ ... container ];

      if( onEvaluate1 )
      {
        let tempSrc2 = _.setIs( src2.original ) ? [ ... src2.original ] : src2.original;

        for( let i = temp.length - 1; i >= 0; i-- )
        {
          if( _.arrayLeftIndex( tempSrc2, temp[ i ], onEvaluate1, onEvaluate2 ) === -1 )
          dst.remove( temp[ i ] );
        }
      }
      else
      // self.filter( self, ( e ) =>
      temp.forEach( ( e ) =>
      {
        if( !src2.has( e ) )
        dst.removeOnce( e );
        // dst.remove( e, onEach );
      });

    }
    else
    {

      if( onEvaluate1 )
      {
        let temp = _.setIs( container ) ? [ ... container ] : container;

        src2.each( ( e ) =>
        {
          if( _.arrayLeftIndex( temp, e, onEvaluate1, onEvaluate2 ) !== -1 )
          dst.appendOnce( e );
        });
      }
      else
      src2.each( ( e ) =>
      {
        if( self.has( e ) )
        dst.appendOnce( e );
      });

      // src2.each( ( e ) =>
      // {
      //   if( self.has( e ) )
      //   dst.append( e, onEach );
      // });

    }

    return dst;
  }

  but( dst, src2, onEvaluate1, onEvaluate2 ) /* qqq : teach to accept comparator, 1 evluator, 2 avaluators | Dmytro : implemented, covered */
  {
    let self = this;
    let container = self.original;
    [ dst, src2, onEvaluate1, onEvaluate2 ] = self._onlyArguments( ... arguments );

    if( self._same( src2 ) )
    {
      self.empty();
      return self;
    }

    if( self._same( dst ) )
    {
      let temp = [ ... container ];

      if( onEvaluate1 )
      {
        let tempSrc2 = _.setIs( src2.original ) ? [ ... src2.original ] : src2.original;

        for( let i = temp.length - 1; i >= 0; i-- )
        {
          if( _.arrayLeftIndex( tempSrc2, temp[ i ], onEvaluate1, onEvaluate2 ) !== -1 )
          dst.remove( temp[ i ] );
        }
      }
      else
      temp.forEach( ( e ) =>
      {
        if( src2.has( e ) )
        dst.removeOnce( e );
      });
      // src2.each( ( e ) => dst.remove( e, onEach ) );
    }
    else
    {
      if( onEvaluate1 )
      {
        let temp = _.setIs( container ) ? [ ... container ] : container;

        src2.each( ( e ) =>
        {
          if( _.arrayLeftIndex( temp, e, onEvaluate1, onEvaluate2 ) === -1 )
          dst.append( e );
        });
      }
      else
      self.each( ( e ) =>
      {
        debugger;
        if( !src2.has( e ) )
        dst.append( e )
        // dst.append( e, onEach )
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
  static Make( src )
  {
    if( src === undefined )
    return this.MakeEmpty();
    else if( _.numberIs( src ) )
    return new SetContainerAdapter( new Set );
    else if( this.IsContainer( src ) )
    return new SetContainerAdapter( new Set( src ) );
    else if( this.Is( src ) )
    return new SetContainerAdapter( new Set( src.original ) );
    /* qqq : cover please
            take into account cases
            src is adapter with array
            src is adapter with set
            src is array
            src is set
    */
  }
  has( e )
  {
    return this.original.has( e );
  }
  count( e, onEvaluate1, onEvaluate2 )
  {
    let container = this.original;

    if( _.routineIs( onEvaluate1 ) )
    return _.arrayCountElement( [ ... container ], e, onEvaluate1, onEvaluate2 );
    else
    return container.has( e ) ? 1 : 0;
  }
  append( e )
  {
    this.original.add( e );
    return this;
  }
  appendOnce( e, onEvaluate1, onEvaluate2 )
  {
    let container = this.original;

    if( onEvaluate1 || _.routineIs( onEvaluate2 ) )
    {
      if( _.arrayLeftIndex( [ ... container ], e, onEvaluate1, onEvaluate2 ) === -1 )
      container.add( e );
    }
    else
    container.add( e );

    return this;
  }
  appendOnceStrictly( e, onEvaluate1, onEvaluate2 )
  {
    let container = this.original;

    if( onEvaluate1 || _.routineIs( onEvaluate2 ) )
    {
      if( _.arrayLeftIndex( [ ... container ], e, onEvaluate1, onEvaluate2 ) === -1 )
      container.add( e );
      else
      _.assert( 0, 'Set already has such element' );
    }
    else
    {
      _.assert( !this.original.has( e ), 'Set already has such element' );
      container.add( e );
    }
    return this;
  }
  push( e )
  {
    this.original.add( e );
    return this.original.size;
  }
  appendContainer( container )
  {
    container = this.ToOriginal( container );
    if( _.longIs( container ) )
    for( let k = 0, l = container.length ; k < l ; k++ )
    this.original.add( container[ k ] );
    else if( _.setIs( container ) )
    for( let e of container )
    this.original.add( e );
    else _.assert( 0, 'Unexpected data type' );
    return this;
  }
  appendContainerOnce( container, onEvaluate1, onEvaluate2 )
  {
    if( onEvaluate1 || _.routineIs( onEvaluate2 ) )
    {
      container = this.ToOriginal( container );
      container = _.longIs( container ) ? container : [ ... container ];

      let temp = _.arrayAppendArrayOnce( [ ... this.original ], container, onEvaluate1, onEvaluate2 )

      this.empty();

      for( let i = 0; i < temp.length; i++ )
      this.append( temp[ i ] );

      return this;
    }
    else
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
  remove( e, onEvaluate1, onEvaluate2 )
  {
    if( onEvaluate1 || _.routineIs( onEvaluate2 ) )
    {
      let count = 0;
      if( _.numberIs( onEvaluate1 ) )
      {
        count = onEvaluate1;
        onEvaluate1 = onEvaluate2;
      }

      for( let v of this.original )
      {
        if( count === 0 )
        {
          if( _.arrayLeftIndex( [ v ], e, onEvaluate1, onEvaluate2 ) !== -1 )
          this.original.delete( v );
        }
        else
        count--;
      }
    }
    else
    this.original.delete( e );

    return this;
  }
  removeOnce( e, onEvaluate1, onEvaluate2 )
  {
    if( onEvaluate1 || _.routineIs( onEvaluate2 ) )
    {
      let count = 0;
      if( _.numberIs( onEvaluate1 ) )
      {
        count = onEvaluate1;
        onEvaluate1 = onEvaluate2;
      }

      for( let v of this.original )
      {
        if( count === 0 )
        {
          if( _.arrayLeftIndex( [ v ], e, onEvaluate1, onEvaluate2 ) !== -1 )
          {
            this.original.delete( v );
            break;
          }
        }
        else
        count--;
      }
    }
    else
    this.original.delete( e );

    return this;
  }
  removeOnceStrictly( e, onEvaluate1, onEvaluate2 )
  {
    if( onEvaluate1 || _.routineIs( onEvaluate2 ) )
    {
      let count = 0;
      let length = this.length;

      if( _.numberIs( onEvaluate1 ) )
      {
        count = onEvaluate1;
        onEvaluate1 = onEvaluate2;
      }

      for( let v of this.original )
      {
        if( count === 0 )
        {
          if( _.arrayLeftIndex( [ v ], e, onEvaluate1, onEvaluate2 ) !== -1 )
          {
            this.original.delete( v );
            if( this.length < length - 1 )
            _.assert( 0, () => 'The element ' + _.toStrShort( e ) + ' is several times in dstArray' );
          }
        }
        else
        count--;
      }
      _.assert( this.length !== length, 'Set does not have such an element' );
      this.original.delete( e );

    }
    else
    {
      _.assert( this.original.has( e ), 'Set does not have such an element' );
      this.original.delete( e );
    }
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
      // _.assert( 0, 'not implemented' );
      let length = container.size;
      for( let e of container )
      {
        if( length === 0 )
        break;
        length--;

        let e2 = onEach( e, undefined, self );
        self.remove( e );

        if( e2 === undefined || e !== e2 )
        {
          if( e2 !== undefined )
          {
            if( self.IsContainer( e2 ) || self.Is( e2 ) )
            self.appendContainer( e2 );
            else
            self.append( e2 )
          }
          // if( e2 !== undefined )
          // container.add( e2 );
          // container.delete( e );
        }
        else
        self.append( e );
      }
    }
    else
    {
      for( let e of container )
      {
        let e2 = onEach( e, undefined, self );
        if( e2 !== undefined )
        {
          if( self.IsContainer( e2 ) || self.Is( e2 ) )
          dst.appendContainer( e2 );
          else
          dst.append( e2 );
        }
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
  allLeft( onEach )
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
  allRight( onEach )
  {
    return this.allLeft( onEach );
  }
  all( onEach )
  {
    return this.allLeft( onEach );
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
  reverse( dst )
  {
    if( !dst )
    {
      debugger;
      dst = this.make( this );
    }
    else
    {
      debugger;
      dst = this.From( dst );
      dst.copyFrom( this ); /* qqq : implement and cover copyFrom */
    }
    return dst;
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
  static Make( src )
  {
    if( src === undefined )
    return this.MakeEmpty();
    else if( _.numberIs( src ) )
    return new ArrayContainerAdapter( new Array( src ) );
    else if( this.IsContainer( src ) )
    return new ArrayContainerAdapter( [ ... src ] );
    else if( this.Is( src ) )
    return new ArrayContainerAdapter( [ ... src.original ] );
    /* qqq : cover please
            take into account cases
            src is adapter with array
            src is adapter with set
            src is array
            src is set
    */
  }
  has( e )
  {
    return this.original.includes( e );
  }
  count( e, onEvaluate1, onEvaluate2 )
  {
    return _.arrayCountElement( this.original, e, onEvaluate1, onEvaluate2 );
  }
  append( e )
  {
    this.original.push( e );
    return this;
  }
  appendOnce( e, onEvaluate1, onEvaluate2 )
  {
    _.arrayAppendOnce( this.original, e, onEvaluate1, onEvaluate2 );
    return this;
  }
  appendOnceStrictly( e, onEvaluate1, onEvaluate2 )
  {
    debugger;
    _.arrayAppendOnceStrictly( this.original, e, onEvaluate1, onEvaluate2 )
    return this;
  }
  push( e )
  {
    return this.original.push( e );
  }
  appendContainer( container )
  {
    container = this.ToOriginal( container );
    if( _.longIs( container ) )
    _.arrayAppendArray( this.original, container );
    else if( _.setIs( container ) )
    for( let e of container )
    this.original.push( e );
    else _.assert( 0, 'Unexpected data type' );
    return this;
  }
  appendContainerOnce( container, onEvaluate1, onEvaluate2 )
  {
    container = this.ToOriginal( container );
    if( _.longIs( container ) )
    _.arrayAppendArrayOnce( this.original, container, onEvaluate1, onEvaluate2 );
    else if( _.setIs( container ) )
    _.arrayAppendArrayOnce( this.original, [ ... container ] );
    else _.assert( 0, 'Unexpected data type' );
    return this;
  }
  pop( e )
  {
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
  remove( e, onEvaluate1, onEvaluate2 )
  {
    _.arrayRemove( this.original, e, onEvaluate1, onEvaluate2 );
    return this;
  }
  removeOnce( e, onEvaluate1, onEvaluate2 )
  {
    _.arrayRemoveOnce( this.original, e, onEvaluate1, onEvaluate2 );
    return this;
  }
  removeOnceStrictly( e, onEvaluate1, onEvaluate2 )
  {
    _.arrayRemovedOnceStrictly( this.original, e, onEvaluate1, onEvaluate2 );
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
        let e2 = onEach( e, undefined, container );
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
        let e2 = onEach( e, undefined, container );
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
      for( let k = container.length - 1 ; k >= 0 ; k-- )
      {
        let e = container[ k ];
        let e2 = onEach( e, undefined, self );
        if( e !== e2 || e2 === undefined )
        {
          if( e2 !== undefined )
          {
            if( self.IsContainer( e2 ) || self.Is( e2 ) )
            container.splice( k, 1, ... e2 );
            else
            container[ k ] = e2;
          }
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
        {
          if( self.IsContainer( e2 ) || self.Is( e2 ) )
          dst.appendContainer( e2 )
          else
          dst.append( e2 );
        }
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
    let container = this.original;
    for( let i = 0; i < container.length; i++ )
    onEach( container[ i ], i, container );
    return this;
  }
  eachRight( onEach )
  {
    let self = this;
    let container = this.original;
    for( let k = container.length - 1 ; k >= 0 ; k-- )
    onEach( container[ k ], k, container );
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
  allLeft( onEach )
  {
    let container = this.original;
    for( let i = 0; i < container.length; i++ )
    {
      let r = onEach( container[ i ], i, container );
      if( !r )
      return false;
    }
    return true;
  }
  allRight( onEach )
  {
    let container = this.original;
    for( let i = container.length-1; i >= 0; i-- )
    {
      let r = onEach( container[ i ], i, container );
      if( !r )
      return false;
    }
    return true;
  }
  all( onEach )
  {
    return this.allLeft( onEach );
  }
  anyLeft( onEach )
  {
    let container = this.original;
    for( let i = 0; i < container.length; i++ )
    {
      let r = onEach( container[ i ], i, container );
      if( r )
      return true;
    }
    return false;
  }
  anyRight( onEach )
  {
    let container = this.original;
    for( let i = container.length-1; i >= 0; i-- )
    {
      let r = onEach( container[ i ], i, container );
      if( r )
      return true;
    }
    return false;
  }
  any( onEach )
  {
    return this.anyLeft( onEach );
  }
  noneLeft( onEach )
  {
    let container = this.original;
    for( let i = 0; i < container.length; i++ )
    {
      let r = onEach( container[ i ], i, container );
      if( r )
      return false;
    }
    return true;
  }
  noneRight( onEach )
  {
    let container = this.original;
    for( let i = container.length-1; i >= 0; i-- )
    {
      let r = onEach( container[ i ], i, container );
      if( r )
      return false;
    }
    return true;
  }
  none( onEach )
  {
    return this.noneLeft( onEach );
  }
  reverse( dst )
  {
    if( !dst )
    debugger;
    if( !dst )
    dst = this.Make( this.length ); /* adjust routine Make to accept length */
    else
    dst = this.From( dst );
    let dstContainer = dst.original;
    let srcContainer = this.original;
    if( srcContainer === dstContainer )
    {
      let last2 = ( srcContainer.length - srcContainer.length % 2 ) / 2;
      let last1 = ( srcContainer.length % 2 ? last2 : last2-1 );
      for( let i1 = last1, i2 = last2; i1 >= 0; i1--, i2++ )
      {
        let e = srcContainer[ i1 ];
        srcContainer[ i1 ] = srcContainer[ i2 ];
        srcContainer[ i2 ] = e;
      }
    }
    else
    {
      debugger;
      for( let i1 = srcContainer.length-1, i2 = 0; i1 >= 0; i1--, i2++ )
      {
        dstContainer[ i1 ] = srcContainer[ i2 ];
      }
    }
    return dst;
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

  is,
  isContainer, /* qqq : cover please */
  make,
  from,

  toOriginal,
  toOriginals,

  /*
    qqq : cover please
    Dmytro : covered, routine has not implemented branch
    qqq : implement please :)
  */

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
  let _ = _global_.wTools;
  _.assert( _realGlobal_.wTools.containerAdapter === undefined );
  _realGlobal_.wTools.containerAdapter = _.containerAdapter;
  if( typeof module !== 'undefined' && module !== null )
  module[ 'exports' ] = _.containerAdapter;
  return;
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
