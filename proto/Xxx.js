
//

function streamsJoin( o )
{
  let streams2 = [];
  let joining = false;
  let pipesCount;

  if( _.longIs( o ) )
  o = { streams : o }

  _.routineOptions( streamsJoin );

  if( o.highWaterMark == null )
  o.highWaterMark = 64 * 1024

  let o2 =
  {
    objectMode : o.objectMode,
    highWaterMark : o.highWaterMark,
  }

  let resultStream = Stream.PassThrough( o2 );
  resultStream.joined = o;

  resultStream.setMaxListeners( 0 )
  resultStream.add = join1
  resultStream.on( 'unpipe', function ( stream )
  {
    for( let i = 0 ; i < o.streams.length ; i++ )
    {
      stream = o.streams[ i ];
      stream.emit( 'unpipe2' );
    }
  });

  join1( ... o.streams )

  return resultStream;

  /* */

  function join1()
  {
    for( let i = 0, len = arguments.length; i < len; i++ )
    streams2.push( streamPause( arguments[ i ] ) )
    join2();
    return this;
  }

  /* */

  function join2()
  {
    if( joining )
    return;

    joining = true;

    let streams = streams2.shift();
    if( !streams )
    {
      _.time.begin( 0, end );
      return
    }

    streams = _.arrayAs( streams );
    pipesCount = streams.length + 1;

    for( let i = 0; i < streams.length; i++ )
    pipe( streams[ i ] )

    next()
  }

  /* */

  function next()
  {
    if( --pipesCount > 0 )
    return;
    joining = false;
    join2();
  }

  /* */

  function pipe( stream )
  {
    if( stream._readableState.endEmitted )
    return next();

    stream.on( 'unpipe2', onEnd );
    stream.on( 'end', onEnd );

    if( o.pipingError )
    stream.on( 'error', onError );

    stream.pipe( resultStream, { end : false } );
    stream.resume();
  }

  /* */

  function onEnd()
  {
    debugger;
    _.assert( 0, 'not tested' );
    stream.removeListener( 'unpipe2', onEnd );
    stream.removeListener( 'end', onEnd );
    if( o.pipingError )
    stream.removeListener( 'error', onError );
    next();
  }

  /* */

  function onError( err )
  {
    debugger;
    _.assert( 0, 'not tested' );
    resultStream.emit( 'error', err )
  }

  /* */

  function end()
  {
    joining = false
    resultStream.emit( 'streams.join.end' )
    if( o.ending )
    resultStream.end()
  }

  /* */

  function streamPause( streams )
  {
    _.assert( _.streamIs( stream ) );
    if( !stream._readableState && stream.pipe )
    stream = stream.pipe( PassThrough( o2 ) );
    if( !stream._readableState || !stream.pause || !stream.pipe )
    throw _.err( 'Cant join streams which are not readable.' )
    stream.pause();
    return stream;
  }

  /* */

}

streamsJoin.defaults =
{
  streams : null,
  ending : 1,
  pipingError : 1,
  highWaterMark : null,
  objectMode : 1,
}
