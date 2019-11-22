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

_.assert( _.routineIs( _.longLeft ) );

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
    if( _.routineIs( src2 ) || src2 === undefined )
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
    return this.original === src;
    /*
    qqq : was not appropriate. add good coverage
    Dmytro : new coverage implemented
    */
  }
  removedContainer( src )
  {
    let result = 0;
    let self = this;

    if( self._same( src ) )
    src = self.From( [ ... src.original ] );
    else
    src = self.From( src );

    src.each( ( e ) => result += self.removed( e ) );
    return result;
  }
  removedContainerOnce( src, onEvaluate1, onEvaluate2 )
  {
    let result = 0;
    let self = this;

    if( self._same( src ) )
    src = self.From( [ ... src.original ] );
    else
    src = self.From( src );

    src.each( ( e ) =>
    {
      let r = self.removedOnce( e, onEvaluate1, onEvaluate2 );
      if( r !== -1 )
      result++;
    });
    return result;
  }
  removedContainerOnceStrictly( src, onEvaluate1, onEvaluate2 )
  {
    let self = this;

    if( self._same( src ) )
    src = self.From( [ ... src.original ] );
    else
    src = self.From( src );

    let result = src.length;
    src.each( ( e ) => self.removeOnceStrictly( e, onEvaluate1, onEvaluate2 ) );
    
    return result;
  }
  removeContainer( src )
  {
    let self = this;
    self.removedContainer.apply( self, arguments );
    return self;
  }
  removeContainerOnce( src, onEvaluate1, onEvaluate2 )
  {
    let self = this;
    self.removedContainerOnce.apply( self, arguments );
    return self;
  }
  removeContainerOnceStrictly( src, onEvaluate1, onEvaluate2 )
  {
    let self = this;
    self.removedContainerOnceStrictly.apply( self, arguments );
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
  {
    _.assert( 1 <= arguments.length && arguments.length <= 4 );

    let self = this;
    let container = self.original;
    let dst2;
    if( dst && src2 && !_.routineIs( src2 ) )
    dst2 = dst;

    [ dst, src2, onEvaluate1, onEvaluate2 ] = self._onlyArguments( ... arguments );

    if( self._same( src2 ) )
    {
      return self;
    }

    if( self._same( dst ) )
    {
      let temp = [ ... container ];

      for( let i = 0; i < temp.length; i++ )
      {
        if( !src2.has( temp[ i ], onEvaluate1, onEvaluate2 ) )
        dst.removeOnce( temp[ i ] );
      }
    }
    else
    {
      src2.each( ( e ) =>
      {
        if( self.has( e, onEvaluate1, onEvaluate2 ) )
        dst.appendOnce( e );
      });
    }
    
    if( dst2 !== undefined )
    return dst2;
    return dst;
  }
  but( dst, src2, onEvaluate1, onEvaluate2 ) /* qqq : teach to accept comparator, 1 evaluator, 2 avaluators | Dmytro : implemented, covered */
  {
    _.assert( 1 <= arguments.length && arguments.length <= 4 );

    let self = this;
    let container = self.original;
    let dst2;
    if( dst && src2 && !_.routineIs( src2 ) )
    dst2 = dst;

    [ dst, src2, onEvaluate1, onEvaluate2 ] = self._onlyArguments( ... arguments );

    if( self._same( src2 ) )
    {
      self.empty();
      return self;
    }

    if( self._same( dst ) )
    {
      let temp = [ ... container ];

      for( let i = 0; i < temp.length; i++ )
      {
        if( src2.has( temp[ i ], onEvaluate1, onEvaluate2 ) )
        dst.removeOnce( temp[ i ] );
      }
    }
    else
    {
      self.each( ( e ) =>
      {
        if( !src2.has( e, onEvaluate1, onEvaluate2 ) )
        dst.appendOnce( e );
      });
    }

    if( dst2 !== undefined )
    return dst2;
    return dst;
  }
  select( selector )
  {
    let self = this;
    let container = self.original;

    let result = [];
    for( let e of container )
    {
      if( _.select( e, selector ) )
      result.push( e )
    }

    return result;
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
    if( src === undefined || src === null )
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
      Dmytro : covered, all test cases are taken into account
    */
  }
  has( e, onEvaluate1, onEvaluate2 )
  {
    _.assert( onEvaluate2 === undefined || _.routineIs( onEvaluate2 ) );

    let fromIndex = 0;
    if( _.numberIs( onEvaluate1 ) )
    {
      fromIndex = onEvaluate1;
      onEvaluate1 = onEvaluate2;
      onEvaluate2 = undefined;
    }

    if( _.routineIs( onEvaluate1 ) )
    {
      if( onEvaluate1.length === 2 )
      {
        _.assert( !onEvaluate2 );

        for( let el of this.original )
        {
          if( fromIndex === 0 )
          {
            if( onEvaluate1( el, e ) )
            return true;
          }
          else
          {
            fromIndex -= 1;
          }
        }

        return false;
      }
      else if( onEvaluate1.length === 1 )
      {
        _.assert( !onEvaluate2 || onEvaluate2.length === 1 );

        if( onEvaluate2 )
        e = onEvaluate2( e );
        else
        e = onEvaluate1( e );

        for( let el of this.original )
        {
          if( fromIndex === 0 )
          {
            if( onEvaluate1( el ) === e )
            return true;
          }
          else
          {
            fromIndex -= 1;
          }
        }

        return false;
      }
      else _.assert( 0 );
    }
    else if( onEvaluate1 === undefined || onEvaluate1 === null )
    {
      return this.original.has( e );
    }
    else _.assert( 0 );
  }
  count( e, onEvaluate1, onEvaluate2 )
  {
    let container = this.original;

    if( _.routineIs( onEvaluate1 ) )
    return _.longCountElement( [ ... container ], e, onEvaluate1, onEvaluate2 );
    else
    return container.has( e ) ? 1 : 0;
  }
  copyFrom( src )
  {
    let self = this;
    let container = self.original;

    /*
    qqq : poor coverage!
    Dmytro : coverage extended
    */

    if( self.same( src ) )
    return self;

    if( !self.IsContainer( src ) && !self.Is( src ) )
    _.assert( 0, '{-src-} should be container' );

    if( self.length <= ( src.length || src.size ) )
    {
      self.empty();
      for( let e of src )
      self.append( e )
    }
    else
    {
      let temp = [ ... container ];

      self.empty();
      for( let e of src )
      self.append( e );
      for( let i = self.length; i < temp.length; i++ )
      self.append( temp[ i ] );
    }

    return self;
  }
  append( e )
  {
    this.original.add( e );
    return this;
  }
  appendOnce( e, onEvaluate1, onEvaluate2 )
  {
    let container = this.original;

    /* qqq : ask | Dmytro : used iterative method has */
    if( onEvaluate1 || _.routineIs( onEvaluate2 ) )
    {
      if( !this.has( e, onEvaluate1, onEvaluate2 ) )
      container.add( e );
    }
    else
    {
      container.add( e );
    }

    return this;
  }
  appendOnceStrictly( e, onEvaluate1, onEvaluate2 )
  {
    let container = this.original;

    if( onEvaluate1 || _.routineIs( onEvaluate2 ) )
    {
      if( !this.has( e, onEvaluate1, onEvaluate2 ) )
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

      if( _.longIs( container ) )
      {
        for( let i = 0; i < container.length; i++ )
        if( !this.has( container[ i ], onEvaluate1, onEvaluate2 ) )
        this.append( container[ i ] );
      }
      else if( _.setIs( container ) )
      {
        for( let e of container )
        if( !this.has( e, onEvaluate1, onEvaluate2 ) )
        this.append( e );
      }
      
      return this;
    }
    else
    {
      return this.appendContainer( container );
    }
  }
  appendContainerOnceStrictly( container, onEvaluate1, onEvaluate2 )
  { 
    container = this.ToOriginal( container );

    if( _.longIs( container ) )
    {
      for( let i = 0; i < container.length; i++ )
      {
        _.assert( !this.has( container[ i ], onEvaluate1, onEvaluate2 ) );
        this.append( container[ i ] );
      }
    }
    else if( _.setIs( container ) )
    {
      for( let e of container )
      {
        _.assert( !this.has( e, onEvaluate1, onEvaluate2 ) );
        this.append( e );
      }
    }
    else _.assert( 0, 'Unexpected data type' );

    return this;
  }
  push( e )
  {
    this.original.add( e );
    return this.original.size;
  }
  pop( e, onEvaluate1, onEvaluate2 )
  {
    let self = this;
		let container = this.original;
    // qqq2 : ?? | Dmytro : I'v got it
    // _.assert( arguments.length === 1 );
    // let last = this.last();

    if( !onEvaluate1 || e === undefined )
    {
      if( e === undefined )
      e = self.last();
      let r = container.delete( e );
      _.assert( r === true );
      return e;
    }
    else
    {
      // qqq2 : use _.arraySetLeft instead of the workaround
			// Dmytro : _.arraySetLeft returns index, it not usable for Sets or it need one more iteration
      // let e2 = _.longLeft( [ ... container ], e, onEvaluate1, onEvaluate2 ).element;
      // _.assert( e2 !== undefined );

      let last = _.nothing;
			self.reduce( ( a, e2 ) => _.entityEntityEqualize( e2, e, onEvaluate1, onEvaluate2 ) ? last = e2 : undefined );
			_.assert( last !== _.nothing );
			container.delete( last );
			return last;

    }

    // qqq2 : ?? | Dmytro : I'v got it
    // if( _.routineIs( onEvaluate1 ) && _.longLeftIndex( [ last ], e, onEvaluate1, onEvaluate2 ) !== -1 )
    // return last;
  }
  popStrictly( e, onEvaluate1, onEvaluate2 )
  {
    let last = this.last();
    _.assert( 1 <= arguments.length && arguments.length <= 3 );
    _.assert( _.entityEntityEqualize( last, e, onEvaluate1, onEvaluate2 ), 'Set does not have such an element' );

    this.original.delete( last );
    return last;
  }
  removed( e, onEvaluate1, onEvaluate2 )
  {
    if( onEvaluate1 || _.routineIs( onEvaluate2 ) )
    {
      let from = 0, result = 0;
      if( _.numberIs( onEvaluate1 ) )
      {
        from = onEvaluate1;
        onEvaluate1 = onEvaluate2;
        onEvaluate2 = undefined;
      }

      for( let v of this.original )
      {
        if( from === 0 )
        {
          if( _.entityEntityEqualize( v, e, onEvaluate1, onEvaluate2 ) )
          {
            this.original.delete( v );
            result++;
          }
        }
        else
        {
          from--;
        }
      }

      return result;
    }
    else
    {
      return this.original.delete( e ) ? 1 : 0;
    }
  }
  removedOnce( e, onEvaluate1, onEvaluate2 ) /* qqq2 : implement left, right versions of the method | Dmytro : implemented and covered */
  {
    let from = 0;
    let index = -1;

    if( _.numberIs( onEvaluate1 ) )
    {
      from = onEvaluate1;
      onEvaluate1 = onEvaluate2;
      onEvaluate2 = undefined;
    }

    for( let v of this.original )
    {
      if( from === 0 )
      {
        if( _.entityEntityEqualize( v, e, onEvaluate1, onEvaluate2 ) )
        {
          this.original.delete( v );
          return ++index;
        }
      }
      else
      {
        from--;
      }
      index++;
    }
    return -1;
  }
  removedOnceLeft( e, onEvaluate1, onEvaluate2 ) 
  {
    return this.removedOnce.apply( this, arguments );
  }
  removedOnceRight( e, onEvaluate1, onEvaluate2 ) 
  {
    let temp = [ ... this.original ];
    let to = this.length;
    if( _.numberIs( onEvaluate1 ) )
    {
      to = onEvaluate1;
      onEvaluate1 = onEvaluate2;
      onEvaluate2 = undefined;
    }

    for( let i = to - 1; i >= 0; i-- )
    {
      if( _.entityEntityEqualize( temp[ i ], e, onEvaluate1, onEvaluate2 ) )
      {
        this.original.delete( temp[ i ] );
        return i;
      }
    }
    return -1;
  }
  removedOnceStrictly( e, onEvaluate1, onEvaluate2 )  /* qqq2 : implement left, right versions of the method | Dmytro : implemented and covered */
  {
    let from = 0;
    let index = -1;
    let result;

    if( _.numberIs( onEvaluate1 ) )
    {
      from = onEvaluate1;
      onEvaluate1 = onEvaluate2;
      onEvaluate2 = undefined;
    }

    for( let v of this.original )
    {
      if( from === 0 )
      {
        if( _.entityEntityEqualize( v, e, onEvaluate1, onEvaluate2 ) )
        {
          if( result === undefined )
          {
            this.original.delete( v );
            result = index + 1;
          }
          else
          {
            _.assert( 0, () => 'The element ' + _.toStrShort( e ) + ' is several times in dstArray' );
          }
        }
      }
      else
      {
        from--;
      }
      index++;
    }

    _.assert( result !== undefined, 'Container does not have such an element' );
    return result;
  }
  removedOnceStrictlyLeft( e, onEvaluate1, onEvaluate2 )  
  {
    return this.removedOnceStrictly.apply( this, arguments );
  }
  removedOnceStrictlyRight( e, onEvaluate1, onEvaluate2 )
  {
    let to = this.length;
    let temp = [ ... this.original ];
    let result;

    if( _.numberIs( onEvaluate1 ) )
    {
      to = onEvaluate1;
      onEvaluate1 = onEvaluate2;
      onEvaluate2 = undefined;
    }

    for( let i = to - 1; i >= 0; i-- )
    {
      if( _.entityEntityEqualize( temp[ i ], e, onEvaluate1, onEvaluate2 ) )
      {
        if( result === undefined )
        {
          this.original.delete( temp[ i ] );
          result = i;
        }
        else
        {
          _.assert( 0, () => 'The element ' + _.toStrShort( e ) + ' is several times in dstArray' )
        }
      }
    }
    _.assert( result !== undefined, 'Container does not have such an element' );
    return result;
  }
  remove( e, onEvaluate1, onEvaluate2 )
  {
    this.removed.apply( this, arguments );
    return this;
  }
  removeOnce( e, onEvaluate1, onEvaluate2 )  /* qqq2 : implement left, right versions of the method | Dmytro : implemented and covered */
  {
    this.removedOnce.apply( this, arguments );
    return this;
  }
  removeOnceLeft( e, onEvaluate1, onEvaluate2 )  
  {
    this.removedOnceLeft.apply( this, arguments );
    return this;
  }
  removeOnceRight( e, onEvaluate1, onEvaluate2 )  
  {
    this.removedOnceRight.apply( this, arguments );
    return this;
  }
  removeOnceStrictly( e, onEvaluate1, onEvaluate2 )  /* qqq2 : implement left, right versions of the method | Dmytro : implemented and covered */
  {
    this.removedOnceStrictly.apply( this, arguments );
    return this;
  }
  removeOnceStrictlyLeft( e, onEvaluate1, onEvaluate2 )
  {
    this.removedOnceStrictlyLeft.apply( this, arguments );
    return this;
  }
  removeOnceStrictlyRight( e, onEvaluate1, onEvaluate2 )
  {
    this.removedOnceStrictlyRight.apply( this, arguments );
    return this;
  }
  empty()
  {
    this.original.clear();
  }
  map( dst, onEach ) /* qqq2 : implement and cover left, right versions | Dmytro : implemented and covered */
  {
    let self = this;
    let container = self.original;
    [ dst, onEach ] = self._filterArguments( ... arguments );
    let length = self.length;
    let index = -1;

    if( self._same( dst ) )
    {
      /*
      qqq : not optimal. why copy??
      Dmytro : it was previus recomendation. Now, the counter is used.
      */
      // let temp = new Set( container );
      // container.clear();

      /* qqq : cover all cases and arguments ( including key! ) | Dmytro : test routine extended */
      for( let e of container )
      {
        index += 1;
        if( index === length )
        break;

        let e2 = onEach( e, index, container );
        container.delete( e );
        if( e2 !== undefined && e !== e2 )
        container.add( e2 );
        else
        container.add( e );
      }
    }
    else
    {
      /* qqq : cover all cases and arguments ( including key! ) | Dmytro : test routine extended */

      for( let e of container )
      {
        index += 1;
        let e2 = onEach( e, index, self );
        if( e2 !== undefined )
        dst.append( e2 );
        else
        dst.append( e );
      }
    }

    return dst;
  }
  mapLeft( dst, onEach )
  {
    return this.map.apply( this, arguments );
  }
  mapRight( dst, onEach )
  {
    let self = this;
    let container = self.original;
    let temp = [ ... container ];
    [ dst, onEach ] = self._filterArguments( ... arguments );

    if( this._same( dst ) )
    {
      for( let i = temp.length - 1; i >= 0; i-- )
      {
        let e2 = onEach( temp[ i ], i, container );
        if( e2 !== undefined && temp[ i ] !== e2 )
        temp[ i ] = e2;
      }
      self.empty();
      temp.forEach( ( e ) => self.push( e ) )
    }
    else
    {
      for( let i = temp.length - 1; i >= 0; i-- )
      {
        let e2 = onEach( temp[ i ], i, self );
        if( e2 !== undefined )
        dst.append( e2 );
        else
        dst.append( temp[ i ] );
      }
    }

    return dst;
  }
  filter( dst, onEach ) /* qqq2 : implement and cover left, right versions | Dmytro : implemented and covered */
  {
    let self = this;
    let container = self.original;
    [ dst, onEach ] = self._filterArguments( ... arguments );
    let length = self.length;
    let index = -1;

    if( self._same( dst ) )
    {
      /*
      qqq : not optimal. why copy??
      Dmytro : it was previus recomendation. Now, counter is used */
      // let temp = new Set( container );
      // container.clear();

      /* qqq : cover all cases and arguments ( including key! ) | Dmytro : test routine extended */
      for( let e of container )
      {
        index += 1;
        if( index === length )
        break;

        let e2 = onEach( e, index, container );

        if( e2 === undefined )
        {
          container.delete( e );
        }
        else if( e !== e2 )
        {
          container.add( e2 );
          container.delete( e );
        }
        else
        {
          container.add( e );
        }
      }
    }
    else
    {
      /* qqq : cover all cases and arguments ( including key! ) | Dmytro : test routine extended */
      for( let e of container )
      {
        index += 1;
        let e2 = onEach( e, index, self );
        if( e2 !== undefined )
        dst.append( e2 );
      }
    }

    return dst;
  }
  filterLeft( dst, onEach )
  {
    return this.filter.apply( this, arguments );
  }
  filterRight( dst, onEach )
  {
    let self = this;
    let container = self.original;
    let temp = [ ... container ];
    [ dst, onEach ] = self._filterArguments( ... arguments );

    if( self._same( dst ) )
    {
      for( let i = temp.length - 1; i >= 0; i-- )
      {
        let e2 = onEach( temp[ i ], i, container );
        if( e2 === undefined )
        temp.splice( i, 1 );
        else if( temp[ i ] !== e2 )
        temp[ i ] = e2;

        self.empty();
        temp.forEach( ( e ) => self.push( e ) );
      }
    }
    else
    {
      for( let i = temp.length - 1; i >= 0; i-- )
      {
        let e2 = onEach( temp[ i ], i, self );
        if( e2 !== undefined )
        dst.append( e2 );
      }
    }

    return dst;
  }
  flatFilter( dst, onEach ) /* qqq2 : implement and cover left, right versions | Dmytro : implemented and covered */
  {
    let self = this;
    let container = self.original;
    [ dst, onEach ] = self._filterArguments( ... arguments );
    let length = container.size;
    let index = -1;

    if( self._same( dst ) )
    {
      /* qqq : should have index! cover please | Dmytro : covered */
      /* qqq : cover all cases and arguments ( including key! ) | Dmytro : covered */
      for( let e of container )
      {
        index += 1;
        if( index === length )
        break;

        let e2 = onEach( e, index, self );
        self.remove( e );

        if( self.IsContainer( e2 ) || self.Is( e2 ) )
        self.appendContainer( e2 );
        else if( e2 !== undefined )
        self.append( e2 )
        else if( e2 === e && e !== undefined )
        self.append( e );          
      }
    }
    else
    {
      /* qqq : cover all cases and arguments ( including key! ) | Dmytro : covered */
      for( let e of container )
      {
        index += 1;
        let e2 = onEach( e, index, self );

        if( self.IsContainer( e2 ) || self.Is( e2 ) )
        dst.appendContainer( e2 );
        else if( e2 !== undefined )
        dst.append( e2 );
      }
    }
    return dst;
  }
  flatFilterLeft( dst, onEach )
  {
    return this.flatFilter.apply( this, arguments );
  }
  flatFilterRight( dst, onEach )
  {
    let self = this;
    let container = self.original;
    let temp = [ ... container ];
    [ dst, onEach ] = self._filterArguments( ... arguments );
    let length = container.size;
    let index = -1;

    if( self._same( dst ) )
    {
      for( let i = temp.length - 1; i >= 0; i-- )
      {
        let e2 = onEach( temp[ i ], i, self );
        
        if( self.IsContainer( e2 ) || self.Is( e2 ) )
        temp.splice( i, 1, ... e2 );
        else if( e2 !== undefined && e2 !== temp[ i ] )
        temp[ i ] = e2;
        else if( e2 === undefined )
        temp.splice( i, 1 );
        self.empty();
        temp.forEach( ( e ) => self.push( e ) );          
      }
    }
    else
    {
      for( let i = temp.length - 1; i >= 0; i-- )
      {
        let e2 = onEach( temp[ i ], i, self );

        if( self.IsContainer( e2 ) || self.Is( e2 ) )
        dst.appendContainer( e2 );
        else if( e2 !== undefined )
        dst.append( e2 );
      }
    }
    return dst; 
  }
  once( dst, onEvaluate1, onEvaluate2 ) /* qqq2 : implement and cover left, right versions | Dmytro : implemented and covered */
  {
    let self = this;
    let container = self.original;
    [ dst, dst, onEvaluate1, onEvaluate2 ] = self._onlyArguments( null, dst, onEvaluate1, onEvaluate2 );
    if( self._same( dst ) )
    {
      if( onEvaluate1 || _.routineIs( onEvaluate2 ) )
      {
        let temp = []; // Dmytro : to prevent cycled loop uses copies
        self.each( ( e ) => _.arrayAppendOnce( temp, e, onEvaluate1, onEvaluate2 ) );
        self.empty();
        for( let i = 0; i < temp.length; i++ )
        self.append( temp[ i ] );
      }
    }
    else
    {
      dst.appendContainerOnce( container, onEvaluate1, onEvaluate2 );
    }

    return dst;
  }
  onceLeft( dst, onEvaluate1, onEvaluate2 )
  {
    return this.once.apply( this, arguments );
  }
  onceRight( dst, onEvaluate1, onEvaluate2 ) 
  {
    let self = this;
    let container = self.original;
    let temp = [ ... container ];
    [ dst, dst, onEvaluate1, onEvaluate2 ] = self._onlyArguments( null, dst, onEvaluate1, onEvaluate2 );
    if( self._same( dst ) )
    {
      if( onEvaluate1 || _.routineIs( onEvaluate2 ) )
      {
        temp = _.longOnce( temp, onEvaluate1, onEvaluate2 );
        self.empty();
        for( let i = 0; i < temp.length; i++ )
        self.append( temp[ i ] );
      }
    }
    else
    {
      for( let i = temp.length - 1; i >= 0; i-- )
      dst.appendOnce( temp[ i ], onEvaluate1, onEvaluate2 );
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
      /* qqq : cover all cases and arguments ( including key! ) | Dmytro : covered */
      return onEach( e, 0, self );
    }
    else
    {
      for( let e of container )
      return e;
    }
  }
  last( onEach )
  {
    // let self = this;
    // let container = this.original;
    // if( !container.size )
    // return undefined;
    // if( onEach )
    // {
    //   return onEach( [ ... container ][ container.size-1 ], container.size-1, self );
    // }
    // else
    // {
    //   return [ ... container ][ container.size-1 ];
    // }

    /* qqq : ask */
    /* Dmytro : alternative variant which use iterations has better performance. Please, see test routine setAdapterLastTimeExperiment */

    /* qqq : cover all cases and arguments ( including key! ) | Dmytro : covered */
    let last = this.reduce( ( a, e ) => e );
    if( onEach )
    return onEach( last, this.length - 1, this );
    else
    return last;
  }
  each( onEach )
  {
    return this.eachLeft( onEach );
  }
  eachLeft( onEach )
  {
    let self = this;
    let container = self.original;
    let index = -1;
    /* qqq : cover all cases and arguments ( including key! ) | Dmytro : covered */
    for( let e of container )
    {
      index += 1;
      onEach( e, index, self );
    }
    return self;
  }
  eachRight( onEach )
  {
    let self = this;
    let container = this.original;
    // let reversedContainer = new Set( [ ... container ].reverse() ); /* Dmytro : double transformation has no sense */
    // for( let e of reversedContainer )
    // onEach( e, undefined, self );
    /* qqq2 : add extra test routine for each *Right method checking ordering is correct, ask how to */
    /* qqq2 : left and right iterating should be different */
    let temp = [ ... container ];
    for( let i = temp.length - 1; i >= 0; i-- )
    onEach( temp[ i ], i, self );
    return self;
  }
  reduce( accumulator, onEach ) // Dmytro : maybe, it's lost "qqq2 : implement and cover left, right versions" | Dmytro : implemented and covered
  {
    let self = this;
    let container = this.original;
    if( arguments[ 1 ] === undefined )
    {
      onEach = arguments[ 0 ];
      accumulator = undefined;
    }
    let index = -1;
    /* qqq : cover all cases and arguments ( including key! ) | Dmytro : covered */
    for( let e of container )
    {
      index += 1;
      accumulator = onEach( accumulator, e, index, self );
    }
    return accumulator;
  }
  reduceLeft( accumulator, onEach )
  {
    return this.reduce.apply( this, arguments );
  }
  reduceRight( accumulator, onEach )
  {
    let self = this;
    let container = this.original;
    let temp = [ ... container ];
    if( arguments[ 1 ] === undefined )
    {
      onEach = arguments[ 0 ];
      accumulator = undefined;
    }
    for( let i = temp.length - 1; i >= 0; i-- )
    {
      accumulator = onEach( accumulator, temp[ i ], i, self );
    }
    return accumulator;
  }
  all( onEach )
  {
    return this.allLeft( onEach );
  }
  allLeft( onEach )
  {
    let self = this;
    let container = this.original;
    let index = -1;
    /* qqq : cover all cases and arguments ( including key! ) | Dmytro : covered */
    for( let e of container )
    {
      index += 1;
      let r = onEach( e, index, self );
      if( !r )
      return false;
    }
    return true;
  }
  allRight( onEach )
  {
    let self = this;
    let container = this.original;
    // let index = container.size;
    /* qqq : cover all cases and arguments ( including key! ) */
    /* qqq2 : left and right iterating should be different */
    // for( let e of container )
    let temp = [ ... container ];
    for( let k = temp.length - 1; k >= 0; k-- )
    {
      let e = temp[ k ];
      let r = onEach( e, k, self );
      if( !r )
      return false;
    }
    return true;
  }
  any( onEach )
  {
    return this.anyLeft( onEach );
  }
  anyLeft( onEach )
  {
    let self = this;
    let container = this.original;
    let index = -1;
    /* qqq : cover all cases and arguments ( including key! ) | Dmytro : covered */
    for( let e of container )
    {
      index += 1;
      let r = onEach( e, index, self );
      if( r )
      return true;
    }
    return false;
  }
  anyRight( onEach )
  {
    let self = this;
    let container = this.original;
    // let index = container.size;
    /* qqq : cover all cases and arguments ( including key! ) */
    /* qqq2 : left and right iterating should be different */
    // for( let e of container )
    // {
    //   index -= 1;
    let temp = [ ... container ];
    for( let k = temp.length - 1; k >= 0; k-- )
    {
      let e = temp[ k ];
      let r = onEach( e, k, self );
      if( r )
      return true;
    }
    return false;
  }
  none( onEach )
  {
    return this.noneLeft( onEach );
  }  
  noneLeft( onEach )
  {
    let self = this;
    let container = this.original;
    let index = -1;
    /* qqq : cover all cases and arguments ( including key! ) | Dmytro : covered */
    for( let e of container )
    {
      index += 1;
      let r = onEach( e, index, self );
      if( r )
      return false;
    }
    return true;
  }
  noneRight( onEach )
  {
    let self = this;
    let container = this.original;
    // let index = container.size;
    /* qqq : cover all cases and arguments ( including key! ) */
    /* qqq2 : left and right iterating should be different */
    // for( let e of container )
    // {
    //   index -= 1;
    let temp = [ ... container ];
    for( let k = temp.length - 1; k >= 0; k-- )
    {
      let e = temp[ k ];
      let r = onEach( e, k, self );
      if( r )
      return false;
    }
    return true;
  }
  left( element, fromIndex, onEvaluate1, onEvaluate2 ) /* qqq2 : cover please | Dmytro : covered */
  {
    /* qqq2 : make optimal implementation, please | Dmytro : implemented with iterative search in original */
    // return _.longLeft( [ ... this.original ], element, fromIndex, onEvaluate1, onEvaluate2 );
   _.assert( 1 <= arguments.length && arguments.length <= 4 );
   return _.arraySetLeft( this.original, element, fromIndex, onEvaluate1, onEvaluate2 );
  }
  right( element, fromIndex, onEvaluate1, onEvaluate2 ) /* qqq2 : cover please | Dmytro : covered */
  {
    /* qqq2 : make optimal implementation, please | Dmytro : copy of container is better if container has searched element in the end, then algorithm will find it faster */
    // return _.longRight( [ ... this.original ], element, fromIndex, onEvaluate1, onEvaluate2 );
    _.assert( 1 <= arguments.length && arguments.length <= 4 );
    return _.arraySetRight( this.original, element, fromIndex, onEvaluate1, onEvaluate2 );
  }
  reverse( dst )
  {
    // if( !dst )
    // {
    //   debugger;
    //   dst = this.make( this );
    // }
    // else
    // {
    //   debugger;
    //   dst = this.From( dst );
    //   dst.copyFrom( this ); /* qqq : implement and cover copyFrom | Dmytro : implemented and covered */
    // }

    let self = this;
    let container = self.original;
    let temp = [ ... container ];

    if( !dst )
    dst = this.MakeEmpty();
    else
    dst = this.From( dst );

    /* qqq : same and _same are 2 different routines. don't confuse! | Dmytro : thanks, I'v got it */
    // if( this.same( dst ) )
    if( self._same( dst ) )
    {
      self.empty();
      for( let i = temp.length - 1; i >= 0; i-- )
      self.append( temp[ i ] );
    }
    else
    {
      for( let i = temp.length - 1; i >= 0; i-- )
      dst.append( temp[ i ] );
    }

    return dst;
  }
  join( delimeter )
  {
    return [ ... this.original ].join( delimeter );
  }
  toArray()
  {
    let container = this.original;
    return new ArrayContainerAdapter( [ ... container ] );
  }
  toSet() /* qqq : cover please | Dmytro : covered */
  {
    return this;
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
    if( src === undefined || src === null )
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
      Dmytro : covered, all test cases are taken into account
    */
  }
  has( e, onEvaluate1, onEvaluate2 )
  {
    if( _.routineIs( onEvaluate1 ) || _.routineIs( onEvaluate2 ) )
    {
      if( _.longLeftIndex( this.original, e, onEvaluate1, onEvaluate2 ) !== -1 )
      return true;
      return false;
    }
    return this.original.includes( e );
  }
  count( e, onEvaluate1, onEvaluate2 )
  {
    return _.longCountElement( this.original, e, onEvaluate1, onEvaluate2 );
  }
  copyFrom( src )
  {
    let self = this;
    let container = self.original;

    if( self.same( src ) )
    return self;

    if( !self.IsContainer( src ) && !self.Is( src ) )
    _.assert( 0, '{-src-} should be container' );

    let i = 0;
    for( let e of src )
    {
      container[ i ] = e;
      i++;
    }

    return self;
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
    _.arrayAppendArrayOnce( this.original, [ ... container ], onEvaluate1, onEvaluate2 );
    else _.assert( 0, 'Unexpected data type' );
    return this;
  }
  appendContainerOnceStrictly( container, onEvaluate1, onEvaluate2 )
  {
    container = this.ToOriginal( container );
    if( _.longIs( container ) )
    _.arrayAppendArrayOnceStrictly( this.original, container, onEvaluate1, onEvaluate2 );
    else if( _.setIs( container ) )
    _.arrayAppendArrayOnceStrictly( this.original, [ ... container ], onEvaluate1, onEvaluate2 );
    else _.assert( 0, 'Unexpected data type' );
    return this;
  }
  pop( e, onEvaluate1, onEvaluate2 )
  {
    var poped = this.original.pop();

    // qqq2 : ?? | Dmytro : I'v got it
    // if( _.routineIs( onEvaluate1 ) && _.longLeftIndex( [ poped ], e, onEvaluate1, onEvaluate2 ) !== -1 )
    // return poped;

    _.assert( e === undefined || _.entityEntityEqualize( poped, e, onEvaluate1, onEvaluate2 ) );
    return poped;
  }
  popStrictly( e, onEvaluate1, onEvaluate2 )
  {
    _.assert( 1 <= arguments.length && arguments.length <= 3 );
    _.assert( _.entityEntityEqualize( this.last(), e, onEvaluate1, onEvaluate2 ), 'Container does not have such element' );

    var poped = this.original.pop();
    return poped;
  }
  removed( e, onEvaluate1, onEvaluate2 )
  {
    return _.arrayRemoved( this.original, e, onEvaluate1, onEvaluate2 );
  }
  removedOnce( e, onEvaluate1, onEvaluate2 ) /* qqq2 : implement left, right versions of the method | Dmytro : implemented and covered */
  {
    return _.arrayRemovedOnce( this.original, e, onEvaluate1, onEvaluate2 );
  }
  removedOnceLeft( e, onEvaluate1, onEvaluate2 )
  {
    return _.arrayRemovedOnce( this.original, e, onEvaluate1, onEvaluate2 );
  }
  removedOnceRight( e, onEvaluate1, onEvaluate2 )
  {
    let index = _.longRightIndex( this.original, e, onEvaluate1, onEvaluate2 );
    if( index !== -1 )
    this.original.splice( index, 1 );
    return index;
  }
  removedOnceStrictly( e, onEvaluate1, onEvaluate2 ) /* qqq2 : implement left, right versions of the method | Dmytro : implemented and covered*/
  {
    return _.arrayRemovedOnceStrictly( this.original, e, onEvaluate1, onEvaluate2 );
  }
  removedOnceStrictlyLeft( e, onEvaluate1, onEvaluate2 )
  {
    return _.arrayRemovedOnceStrictly( this.original, e, onEvaluate1, onEvaluate2 );
  }
  removedOnceStrictlyRight( e, onEvaluate1, onEvaluate2 )
  {
    let container = this.original;
    let index = _.longRightIndex( container, e, onEvaluate1, onEvaluate2 );
    _.assert( index !== -1, () => 'Container has not element ' + _.toStrShort( e ) );
    container.splice( index, 1 );
    if( _.numberIs( onEvaluate1 ) )
    onEvaluate1--;
    _.assert( _.longRightIndex( container, e, onEvaluate1, onEvaluate2 ) === -1, () => 'The element ' + _.toStrShort( e ) + ' is several times in dstArray' );
    return index;
  }
  remove( e, onEvaluate1, onEvaluate2 )
  {
    _.arrayRemove( this.original, e, onEvaluate1, onEvaluate2 );
    return this;
  }
  removeOnce( e, onEvaluate1, onEvaluate2 ) /* qqq2 : implement left, right versions of the method | Dmytro : implemented and covered */
  {
    _.arrayRemoveOnce( this.original, e, onEvaluate1, onEvaluate2 );
    return this;
  }
  removeOnceLeft( e, onEvaluate1, onEvaluate2 )
  {
    _.arrayRemoveOnce( this.original, e, onEvaluate1, onEvaluate2 );
    return this;
  }
  removeOnceRight( e, onEvaluate1, onEvaluate2 )
  {
    this.removedOnceRight( e, onEvaluate1, onEvaluate2 );
    return this;
  }
  removeOnceStrictly( e, onEvaluate1, onEvaluate2 ) /* qqq2 : implement left, right versions of the method | Dmytro : implemented and covered */
  {
    _.arrayRemovedOnceStrictly( this.original, e, onEvaluate1, onEvaluate2 );
    return this;
  }
  removeOnceStrictlyLeft( e, onEvaluate1, onEvaluate2 ) 
  {
    _.arrayRemovedOnceStrictly( this.original, e, onEvaluate1, onEvaluate2 );
    return this;
  }
  removeOnceStrictlyRight( e, onEvaluate1, onEvaluate2 )
  {
    this.removedOnceStrictlyRight( e, onEvaluate1, onEvaluate2 );
    return this;
  }
  empty()
  {
    this.original.splice( 0, this.original.length );
  }
  map( dst, onEach ) /* qqq2 : implement and cover left, right versions | Dmytro : implemented and covered */
  {
    let self = this;
    let container = this.original;
    [ dst, onEach ] = this._filterArguments( ... arguments );
    if( this._same( dst ) )
    {
      /* qqq : cover all cases and arguments | Dmytro : covered */
      /* qqq : not optimal! no in for arrays! | Dmytro : thanks, I'v got it */
      // for( let k in container )
      for( let k = 0 ; k < container.length ; k++ )
      {
        let e = container[ k ];
        let e2 = onEach( e, k, self );
        // let e2 = onEach( e, undefined, self ); /* qqq : where was key?? | Dmytro : it's mistake */
        if( e2 !== undefined )
        {
          container[ k ] = e2;
        }
      }
    }
    else
    {
      // debugger;
      /* qqq : cover all cases and arguments | Dmytro : covered */
      /* qqq : not optimal! no in for arrays! | Dmytro : I'v got it */
      // for( let k in container )
      for( let k = 0 ; k < container.length ; k++ )
      {
        let e = container[ k ];
        let e2 = onEach( e, k, self );
        // let e2 = onEach( e, undefined, self ); /* qqq : where was key?? | Dmytro : it's mistake, covered */
        if( e2 !== undefined )
        dst.append( e2 );
        else
        dst.append( e );
      }
    }
    return dst;
  }
  mapLeft( dst, onEach )
  {
    return this.map.apply( this, arguments );
  }
  mapRight( dst, onEach )
  {
    let container = this.original;
    [ dst, onEach ] = this._filterArguments( ... arguments );
    if( this._same( dst ) )
    {
      for( let k = container.length - 1; k >= 0; k-- )
      {
        let e2 = onEach( container[ k ], k, this );
        if( e2 !== undefined )
        container[ k ] = e2;
      }
    }
    else
    {
      for( let k = container.length - 1; k >= 0; k-- )
      {
        let e2 = onEach( container[ k ], k, this );
        if( e2 !== undefined )
        dst.append( e2 );
        else
        dst.append( container[ k ] );
      }
    }
    return dst;
  }
  filter( dst, onEach ) /* qqq2 : implement and cover left, right versions | Dmytro : implemented and covered */
  {
    let self = this;
    let container = this.original;
    [ dst, onEach ] = this._filterArguments( ... arguments );

    if( this._same( dst ) )
    {
      for( let k = 0; k < container.length; k++ )
      {
        let e = container[ k ];
        // let e2 = onEach( e, undefined, container ); /* qqq : where was key?? | Dmytro : it's mistake, covered */
        let e2 = onEach( e, k, container );
        if( e !== e2 || e2 === undefined )
        {
          if( e2 !== undefined )
          {
            container[ k ] = e2;
          }
          else
          {
            container.splice( k, 1 );
            k--;
          }
        }
      }
    }
    else
    {
      for( let k = 0; k < container.length; k++ )
      {
        let e = container[ k ];
        // let e2 = onEach( e, undefined, container );  /* qqq : where was key?? | Dmytro : it's mistake, covered */
        let e2 = onEach( e, k, container );
        if( e2 !== undefined )
        dst.append( e2 );
      }
    }

    return dst;
  }
  filterLeft( dst, onEach )
  {
    return this.filter.apply( this, arguments );
  }
  filterRight( dst, onEach )
  {
    let self = this;
    let container = this.original;
    [ dst, onEach ] = this._filterArguments( ... arguments );

    if( this._same( dst ) )
    {
      for( let k = container.length - 1; k >= 0; k-- )
      {
        let e2 = onEach( container[ k ], k, container );
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
      for( let k = container.length - 1; k >= 0; k-- )
      {
        let e2 = onEach( container[ k ], k, container );
        if( e2 !== undefined )
        dst.append( e2 );
      }
    }

    return dst;
  }
  flatFilter( dst, onEach ) /* qqq2 : implement and cover left, right versions | Dmytro : implemented and covered */
  {
    let self = this;
    let container = self.original;
    [ dst, onEach ] = self._filterArguments( ... arguments );

    if( self._same( dst ) )
    {
      for( let k = 0; k < container.length; k++ )
      {
        let e = container[ k ];
        // let e2 = onEach( e, undefined, self ); /* qqq : where was key?? | Dmytro : it's mistake, covered */
        let e2 = onEach( e, k, self );
        if( e2 === undefined )
        {
          container.splice( k, 1 )
          k--;
        }
        else if( self.IsContainer( e2 ) || self.Is( e2 ) )
        {
          k += e2.length - 1;
          container.splice( k, 1, ... e2 );
        }
        else if( e2 !== e )
        {
          container[ k ] = e2;
        }
      }
    }
    else
    {
      for( let k = 0; k < container.length; k++ )
      {
        let e = container[ k ];
        // let e2 = onEach( e, undefined, container ); /* qqq : where was key?? | Dmytro : it's mistake, covered */
        let e2 = onEach( e, k, container );

        if( self.IsContainer( e2 ) || self.Is( e2 ) )
        dst.appendContainer( e2 )
        else if( e2 !== undefined )
        dst.append( e2 );
      }
    }

    return dst;
  }
  flatFilterLeft( dst, onEach )
  {
    return this.flatFilter.apply( this, arguments );
  }
  flatFilterRight( dst, onEach )
  {
    let self = this;
    let container = self.original;
    [ dst, onEach ] = self._filterArguments( ... arguments );

    if( self._same( dst ) )
    {
      for( let k = container.length - 1; k >= 0; k-- )
      {
        let e = container[ k ];
        let e2 = onEach( e, k, self );

        if( e2 === undefined )
        container.splice( k, 1 );
        else if( self.IsContainer( e2 ) || self.Is( e2 ) )
        container.splice( k, 1, ... e2 );
        else if( e2 !== e )
        container[ k ] = e2;
      }
    }
    else
    {
      for( let k = container.length - 1; k >= 0; k-- )
      {
        let e = container[ k ];
        let e2 = onEach( e, k, container );

        if( self.IsContainer( e2 ) || self.Is( e2 ) )
        dst.appendContainer( e2 )
        else if( e2 !== undefined )
        dst.append( e2 );
      }
    }

    return dst;
  }
  once( dst, onEvaluate1, onEvaluate2 ) /* qqq2 : implement and cover left, right versions | Dmytro : implemented and covered */
  {
    let container = this.original;
    [ dst, dst, onEvaluate1, onEvaluate2 ] = this._onlyArguments( null, dst, onEvaluate1, onEvaluate2 );

    if( this._same( dst ) )
    _.longOnce( container, onEvaluate1, onEvaluate2 );
    else
    dst.appendContainerOnce( container, onEvaluate1, onEvaluate2 );

    return dst;
  }
  onceLeft( dst, onEvaluate1, onEvaluate2 )
  {
    return this.once.apply( this, arguments );
  }
  onceRight( dst, onEvaluate1, onEvaluate2 )
  {
    let container = this.original;
    [ dst, dst, onEvaluate1, onEvaluate2 ] = this._onlyArguments( null, dst, onEvaluate1, onEvaluate2 );

    if( this._same( dst ) )
    _.longOnce( container, onEvaluate1, onEvaluate2 );
    else
    for( let i = container.length - 1; i >= 0; i-- )
    dst.appendOnce( container[ i ], onEvaluate1, onEvaluate2 );

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
    onEach( container[ i ], i, this );
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
  reduce( accumulator, onEach ) // Dmytro : maybe it's lost "qqq2 : implement and cover left, right versions" | Dmytro : implemented and covered
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
  reduceLeft( accumulator, onEach )
  {
    return this.reduce.apply( this, arguments );
  }
  reduceRight( accumulator, onEach )
  {
    let self = this;
    let container = this.original;
    if( arguments[ 1 ] === undefined )
    {
      onEach = arguments[ 0 ];
      accumulator = undefined;
    }
    for( let k = container.length - 1; k >= 0; k-- )
    {
      let e = container[ k ];
      accumulator = onEach( accumulator, e, k, self );
    }
    return accumulator;
  }
  all( onEach )
  {
    return this.allLeft( onEach );
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
    for( let i = container.length - 1; i >= 0; i-- )
    {
      let r = onEach( container[ i ], i, container );
      if( !r )
      return false;
    }
    return true;
  }
  any( onEach )
  {
    return this.anyLeft( onEach );
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
  none( onEach )
  {
    return this.noneLeft( onEach );
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
    for( let i = container.length - 1; i >= 0; i-- )
    {
      let r = onEach( container[ i ], i, container );
      if( r )
      return false;
    }
    return true;
  }
  left( element, fromIndex, onEvaluate1, onEvaluate2 ) /* qqq2 : cover please | Dmytro : covered */
  {
    _.assert( 1 <= arguments.length && arguments.length <= 4 );
    return _.longLeft( this.original, element, fromIndex, onEvaluate1, onEvaluate2 );
  }
  right( element, fromIndex, onEvaluate1, onEvaluate2 ) /* qqq2 : cover please | Dmytro : covered */
  {
    _.assert( 1 <= arguments.length && arguments.length <= 4 );
    return _.longRight( this.original, element, fromIndex, onEvaluate1, onEvaluate2 );
  }
  reverse( dst )
  {
    let srcContainer = this.original;

    if( !dst )
    {
      // dst = this.MakeEmpty(); /* qqq : ask please | Dmytro : I'v got it */
      dst = this.Make( this.length ); /* adjust routine Make to accept length */
      let dstContainer = dst.original;
      for( let i1 = srcContainer.length - 1, i2 = 0; i1 >= 0; i1--, i2++ )
      {
        dstContainer[ i1 ] = srcContainer[ i2 ];
      }
    }
    else
    {
      dst = this.From( dst );
      let dstContainer = dst.original;
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
        for( let i = srcContainer.length - 1; i >= 0; i-- )
        {
          dst.append( srcContainer[ i ] );
        }
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
  toSet() /* qqq : cover please | Dmytro : covered */
  {
    return this.From( new Set([ ... this.original ]) );
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
  isContainer, /* qqq : cover please | Dmytro : covered */
  make,
  from,

  toOriginal,
  toOriginals,

  /*
    qqq : cover please
    Dmytro : covered, routine has not implemented branch
    qqq : implement please :)
    Dmytro : implemented and covered
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
