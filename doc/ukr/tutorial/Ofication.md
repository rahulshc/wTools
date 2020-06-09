# Офікація рутин

### Офікація - процес перетворення списку вхідних параметрів рутини або методу в мапу опцій 'о'.

**Переваги** 
* Покращення читабельності коду
* Зручність виклику (порядок не має значення)
* Уніфікація коду - один аргумент всюди
* Можливість поєднання: виклик зі списком аргументів (вузький діапазон дій) або виклик із мапою опцій (широкий діапазон дій).

**Приклад офікованого методу:**

Метод `strStrShort` повертає строку параметр з обмеженою (`limit` або `o.limit`) кількістю літер. Приймає мапу опцій, але також дає можливість передати аргументи списком.

```javascript
function strStrShort( o )
{
  _.assert( arguments.length === 1 || arguments.length === 2 );

  if( arguments.length === 2 )
  o = { src : arguments[ 0 ], limit : arguments[ 1 ] };
  else if( arguments.length === 1 )
  if( _.strIs( o ) )
  o = { src : arguments[ 0 ] };

  _.routineOptions( strStrShort, o );
  _.assert( _.strIs( o.src ) );
  _.assert( _.numberIs( o.limit ) );

  let str = o.src;
  
  // ...

}
```

Виклик відбувається 2-ма способами: 
* `strStrShort( 'string', 4 )` // result -> ''st'...'ng''
* `strStrShort( { src : 'string', limit : 4 } )` // result -> ''st'...'ng''

Обов'язково виконуються перевірки вхідних даних, при помилці можна завжди дізнатися про невідповідність типів даних.
Якщо не виконувати перевірку, то через слабку динамічну типізацію в JavaScript, можуть виникати помилки загального характеру, які важко піддаються усуненню.
```javascript
_.assert( _.strIs( o.src ) );
_.assert( _.numberIs( o.limit ) );
```

Використовуючи мапу опцій можна задати додаткові параметри, які без офікації, створювали б надмірну кількість вхідних даних (4), що часто може призводити до помилок при роботі з аргументами:
```javascript
/*
 * @param {string} [ o.wrap='\'' ] - String wrapper. Use zero or false to disable.
 * @param {string} [ o.escaping=1 ] - Escaping characters appears in output.
 */
```
При офікації повинен відбуватися виклик:
```javascript
_.routineOptions( strStrShort, o );
```
з назвою рутини/методу та мапою даних.

*Мапа опцій дефолтних значень* -  призначена для зберігання налаштувань за замовчуванням:
```javascript
strStrShort.defaults =
{
  src : null,
  limit : 40,
  wrap : '\'',
  escaping : 1
}
```

### Приклад офікації рутини

**Маємо рутину:**
Конвертує об'єкт у строку.
```javascript
function mapToStr( src, keyValDelimeter, entryDelimeter)
{
  let result = '';
  for( let s in src )
  {
    result += s + keyValDelimeter + src[ s ] + entryDelimeter;
  }

  result = result.substr( 0, result.length-entryDelimeter.length );

  return result
}
```
*Для офікації потрібно:*
* Створити єдиний параметр `o`
* Додати мапу дефолтних опцій
* Додати перевірки типів даних( в цьому випадку на строку для одного аргумента, та на кількість аргументів)
* Додати виклик `_.routineOptions( mapToStr, o );`
* В тілі рутини працювати з параметрами через ключі `o`: `o.src` і т.д.

**Офікована рутина:**
```javascript
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
```

### Додаткові приклади офікованих рутин/методів

<details>
  <summary><u>Метод повертає діапазон <code>o.range</code> строк зі <code>o.src</code> строки. Приймає до 9 аргументів.</u></summary>

```javascript
/**
 * Selects range( o.range ) of lines from source string( o.src ).
 * If( o.range ) is not specified and ( o.line ) is provided function uses it with ( o.selectMode ) option to generate new range.
 * If( o.range ) and ( o.line ) are both not provided function generates range by formula: [ 0, n + 1 ], where n: number of ( o.delimteter ) in source( o.src ).
 * Returns selected lines range as string or empty string if nothing selected.
 * Can be called in three ways:
 * - First by passing all parameters in one options map( o ) ;
 * - Second by passing source string( o.src ) and range( o.range ) as array or number;
 * - Third by passing source string( o.src ), range start and end position.
 *
 * @param {Object} o - Options.
 * @param {String} [ o.src=null ] - Source string.
 * @param {Array|Number} [ o.range=null ] - Sets range of lines to select from( o.src ) or single line number.
 * @param {Number} [ o.zero=1 ] - Sets base value for a line counter.
 * @param {Number} [ o.number=0 ] - If true, puts line counter before each line by using o.range[ 0 ] as initial value of a counter.
 * @param {String} [ o.delimteter='\n' ] - Sets new line character.
 * @param {String} [ o.line=null ] - Sets line number from which to start selecting, is used only if ( o.range ) is null.
 * @param {Number} [ o.numberOfLines=3 ] - Sets maximal number of lines to select, is used only if ( o.range ) is null and ( o.line ) option is specified.
 * @param {String} [ o.selectMode='center' ] - Determines in what way funtion must select lines, works only if ( o.range ) is null and ( o.line ) option is specified.
 * Possible values:
 * - 'center' - uses ( o.line ) index as center point and selects ( o.numberOfLines ) lines in both directions.
 * - 'begin' - selects ( o.numberOfLines ) lines from start point ( o.line ) in forward direction;
 * - 'end' - selects ( o.numberOfLines ) lines from start point ( o.line ) in backward direction.
 * @returns {string} Returns selected lines as new string or empty if nothing selected.
 *
 * @example
 * // selecting single line
 * _.strLinesSelect( 'a\nb\nc', 1 );
 * // returns 'a'
 *
 * @example
 * // selecting first two lines
 * _.strLinesSelect( 'a\nb\nc', [ 1, 3 ] );
 * // returns
 * // 'a
 * // b'
 *
 * @example
 * // selecting first two lines, second way
 * _.strLinesSelect( 'a\nb\nc', 1, 3 );
 * // returns
 * // 'a
 * // b'
 *
 * @example
 * // custom new line character
 * _.strLinesSelect({ src : 'a b c', range : [ 1, 3 ], delimteter : ' ' });
 * // returns 'a b'
 *
 * @example
 * // setting preferred number of lines to select, line option must be specified
 * _.strLinesSelect({ src : 'a\nb\nc', line : 2, numberOfLines : 1 });
 * // returns 'b'
 *
 * @example
 * // selecting 2 two next lines starting from second
 * _.strLinesSelect({ src : 'a\nb\nc', line : 2, numberOfLines : 2, selectMode : 'begin' });
 * // returns
 * // 'b
 * // c'
 *
 * @example
 * // selecting 2 two lines starting from second in backward direction
 * _.strLinesSelect({ src : 'a\nb\nc', line : 2, numberOfLines : 2, selectMode : 'end' });
 * // returns
 * // 'a
 * // b'
 *
 * @method strLinesSelect
 * @throws { Exception } Throw an exception if no argument provided.
 * @throws { Exception } Throw an exception if( o.src ) is not a String.
 * @throws { Exception } Throw an exception if( o.range ) is not a Array or Number.
 * @throws { Exception } Throw an exception if( o ) is extended by unknown property.
 * @namespace Tools
 */

function strLinesSelect( o )
{

  if( arguments.length === 2 )
  {

    if( _.arrayIs( arguments[ 1 ] ) )
    o = { src : arguments[ 0 ], range : arguments[ 1 ] };
    else if( _.numberIs( arguments[ 1 ] ) )
    o = { src : arguments[ 0 ], range : [ arguments[ 1 ], arguments[ 1 ]+1 ] };
    else _.assert( 0, 'unexpected argument', _.strType( range ) );

  }
  else if( arguments.length === 3 )
  {
    o = { src : arguments[ 0 ], range : [ arguments[ 1 ], arguments[ 2 ] ] };
  }

  _.routineOptions( strLinesSelect, o );
  _.assert( arguments.length <= 3 );
  _.assert( _.strIs( o.src ) );
  _.assert( _.boolLike( o.highlighting ) || _.longHas( [ '*' ], o.highlighting ) );

  if( _.boolLike( o.highlighting ) && o.highlighting )
  o.highlighting = '*';

  /* range */

  if( !o.range )
  {
    if( o.line !== null )
    {
      if( o.selectMode === 'center' )
      o.range = [ o.line - Math.ceil( ( o.numberOfLines + 1 ) / 2 ) + 1, o.line + Math.floor( ( o.numberOfLines - 1 ) / 2 ) + 1 ];
      else if( o.selectMode === 'begin' )
      o.range = [ o.line, o.line + o.numberOfLines ];
      else if( o.selectMode === 'end' )
      o.range = [ o.line - o.numberOfLines+1, o.line+1 ];
    }
    else
    {
      o.range = [ 0, _.strCount( o.src, o.delimteter )+1 ];
    }
  }

  if( o.line === null )
  {
    if( o.selectMode === 'center' )
    o.line = Math.floor( ( o.range[ 0 ] + o.range[ 1 ] ) / 2 );
    else if( o.selectMode === 'begin' )
    o.line = o.range[ 0 ];
    else if( o.selectMode === 'end' )
    o.line = o.range[ 1 ] - 1;
  }

  _.assert( _.longIs( o.range ) );
  _.assert( _.intIs( o.line ) );

  /* */

  let f = 0;
  let counter = o.zeroLine;
  while( counter < o.range[ 0 ] )
  {
    f = o.src.indexOf( o.delimteter, f );
    if( f === -1 )
    return '';
    f += o.delimteter.length;
    counter += 1;
  }

  /* */

  let l = f-1;
  while( counter < o.range[ 1 ] )
  {
    l += 1;
    l = o.src.indexOf( o.delimteter, l );
    if( l === -1 )
    {
      l = o.src.length;
      break;
    }
    counter += 1;
  }

  /* */

  let result = f < l ? o.src.substring( f, l ) : '';

  /* numbering */

  if( o.numbering )
  result = _.strLinesNumber
  ({
    src : result,
    zeroLine : o.range[ 0 ],
    onLine : lineHighlight,
  });

  return result;

  /* */

  function lineHighlight( line, l )
  {
    if( !o.highlighting )
    return line.join( '' );
    if( l === o.line )
    line[ 0 ] = '* ' + line[ 0 ];
    else
    line[ 0 ] = '  ' + line[ 0 ];
    return line.join( '' );
  }

  /* */

}

strLinesSelect.defaults =
{

  src : null,
  range : null,

  line : null,
  numberOfLines : 3,
  selectMode : 'center',
  highlighting : '*',

  numbering : 0,
  zeroLine : 1,
  delimteter : '\n',

}

```

</details>

<details>
  <summary><u>Повертає об'єкт заповнений унікальними <code>[ key, value ]</code> парами з інших об'єктів</u></summary>

```javascript
/**
 * The _mapOnly() returns an object filled by unique [ key, value]
 * from others objects.
 *
 * The _mapOnly() checks whether there are the keys of
 * the (screenMap) in the list of (srcMaps).
 * If true, it calls a provided callback function(filter)
 * and adds to the (dstMap) all the [ key, value ]
 * for which callback function returns true.
 *
 * @param { function } [options.filter = filter.bypass()] options.filter - The callback function.
 * @param { objectLike } options.srcMaps - The target object.
 * @param { objectLike } options.screenMaps - The source object.
 * @param { Object } [options.dstMap = Object.create( null )] options.dstMap - The empty object.
 *
 * @example
 * let options = Object.create( null );
 * options.dstMap = Object.create( null );
 * options.screenMaps = { 'a' : 13, 'b' : 77, 'c' : 3, 'name' : 'Mikle' };
 * options.srcMaps = { 'a' : 33, 'd' : 'name', 'name' : 'Mikle', 'c' : 33 };
 * _mapOnly( options );
 * // returns { a : 33, c : 33, name : "Mikle" };
 *
 * @example
 * let options = Object.create( null );
 * options.dstMap = Object.create( null );
 * options.screenMaps = { a : 13, b : 77, c : 3, d : 'name' };
 * options.srcMaps = { d : 'name', c : 33, a : 'abc' };
 * _mapOnly( options );
 * // returns { a : "abc", c : 33, d : "name" };
 *
 * @returns { Object } Returns an object filled by unique [ key, value ]
 * from others objects.
 * @function _mapOnly
 * @throws { Error } Will throw an Error if (options.dstMap or screenMap) are not objects,
 * or if (srcMaps) is not an array
 * @namespace Tools
 */

function _mapOnly( o )
{

  let dstMap = o.dstMap || Object.create( null );
  let screenMap = o.screenMaps;
  let srcMaps = o.srcMaps;

  if( !_.arrayIs( srcMaps ) )
  srcMaps = [ srcMaps ];

  if( !o.filter )
  o.filter = _.field.mapper.bypass;

  if( Config.debug )
  {

    _.assert( o.filter.functionFamily === 'field-mapper' );
    _.assert( arguments.length === 1, 'Expects single argument' );
    _.assert( _.objectLike( dstMap ), 'Expects object-like {-dstMap-}' );
    _.assert( !_.primitiveIs( screenMap ), 'Expects not primitive {-screenMap-}' );
    _.assert( _.arrayIs( srcMaps ), 'Expects array {-srcMaps-}' );
    _.assertMapHasOnly( o, _mapOnly.defaults );

    for( let s = srcMaps.length - 1 ; s >= 0 ; s-- )
    _.assert( !_.primitiveIs( srcMaps[ s ] ), 'Expects {-srcMaps-}' );

  }

  if( _.longIs( screenMap ) )
  {
    for( let k in screenMap )
    {

      if( screenMap[ k ] === undefined )
      continue;

      let s;
      for( s = srcMaps.length-1 ; s >= 0 ; s-- )
      {
        if( !_.mapIs( screenMap[ k ] ) && screenMap[ k ] in srcMaps[ s ] )
        {
          k = screenMap[ k ];
          break;
        }
        if( k in srcMaps[ s ] )
        {
          break;
        }
      }

      if( s === -1 )
      continue;

      o.filter.call( this, dstMap, srcMaps[ s ], k );

    }
  }
  else
  {
    for( let k in screenMap )
    {
      if( screenMap[ k ] === undefined )
      continue;

      for( let s in srcMaps )
      if( k in srcMaps[ s ] )
      o.filter.call( this, dstMap, srcMaps[ s ], k );
    }
  }

  return dstMap;
}

_mapOnly.defaults =
{
  dstMap : null,
  srcMaps : null,
  screenMaps : null,
  filter : null,
}
```

</details>

<details>
  <summary><u>Конкатенація елементів масиву<code>srcs</code>. Приймає аргумент <code>srcs</code> та мапу опцій <code>o</code></u></summary>

```javascript
/**
 * The routine strConcat() provides the concatenation of array elements
 * into a string. Returned string can be formatted by using options in options map.
 *
 * @param { ArrayLike|* } srcs - ArrayLike container with elements or single element to make string.
 * If {-srcs-} is not ArrayLike, routine converts to string provided value.
 * @param { Object } o - Options map.
 * @param { String } o.lineDelimter - The line delimeter. Default value is new line symbol '\n'.
 * If string element of array has not delimeter in the end or next element has not delimeter in the begin, routine insert one space between this elements.
 * @param { String } o.linePrefix - The prefix that adds to every line. Default value is empty string.
 * @param { String } o.linePostfix - The postfix that adds to every line. Default value is empty string.
 * @param { Object } o.optionsForToStr - The options for routine _.toStr that uses for convertion to string. Default value is null.
 * @param { Routine } o.onToStr - The callback, which uses for convertion to string. Default value is null.
 *
 * @example
 * _.strConcat( 'str' );
 * // returns 'str '
 *
 * @example
 * _.strConcat( 11 );
 * // returns '11 '
 *
 * @example
 * _.strConcat( { a : 'a' } );
 * // returns '[object Object] '
 *
 * @example
 * _.strConcat( [ 1, 2, 'str', [ 3, 4 ] ] );
 * // returns '1 2 str 3,4 '
 *
 * @example
 * let options =
 * {
 *   linePrefix : '** ',
 *   linePostfix : ' **'
 * };
 * _.strConcat( [ 1, 2, 'str', [ 3, 4 ] ], options );
 * // returns '** 1 2 str 3,4 **'
 *
 * @example
 * let options =
 * {
 *   linePrefix : '** ',
 *   linePostfix : ' **'
 * };
 * _.strConcat( [ 'a\n', 'b\n', 'c\n', 'd\n' ], options );
 * // returns '** a **
 *             ** b **
 *             ** c **
 *             ** d **'
 *
 * @example
 * let onToStr = ( src ) => String( src ) + '*';
 * let options = { onToStr };
 * _.strConcat( [ 'a', 'b', 'c', 'd' ], options );
 * // returns 'a* b* c* d* '
 *
 * @returns { String } - Returns string, which is concatenated from {-srcs-}.
 * @function strConcat
 * @throws { Error } If arguments.length is less then one or more than two arguments.
 * @throws { Error } If routine strConcat does not belong module Tools.
 * @namespace Tools
 */

function strConcat( srcs, o )
{

  o = _.routineOptions( strConcat, o || Object.create( null ) );
  _.assert( arguments.length === 1 || arguments.length === 2 );
  _.assert( this.strConcat === strConcat );

  if( o.onToStr === null )
  o.onToStr = function onToStr( src, op )
  {
    return _.toStr( src, op.optionsForToStr );
  }

  let defaultOptionsForToStr =
  {
    stringWrapper : '',
  }

  o.optionsForToStr = _.mapSupplement( o.optionsForToStr, defaultOptionsForToStr, strConcat.defaults.optionsForToStr );

  if( _.routineIs( srcs ) )
  srcs = srcs();

  if( !_.arrayLike( srcs ) )
  srcs = [ srcs ];

  let result = '';
  if( !srcs.length )
  return result;

  /* */

  for( let a = 0 ; a < srcs.length ; a++ )
  {
    let src = srcs[ a ];

    src = o.onToStr( src, o );

    result = result.replace( /[^\S\n]\s*$/, '' ); 

    if( !result )
    {
      result = src;
    }

    else if( _.strEnds( result, o.lineDelimter ) || _.strBegins( src, o.lineDelimter ) )
    {
      result = result + src;
    }
    else
    {
      result = result + ' ' + src.replace( /^\s+/, '' );
    }

  }

  /* */

  if( o.linePrefix || o.linePostfix )
  {
    result = result.split( o.lineDelimter );
    result = o.linePrefix + result.join( o.linePostfix + o.lineDelimter + o.linePrefix ) + o.linePostfix;
  }

  /* */

  return result;
}

strConcat.defaults =
{
  linePrefix : '',
  linePostfix : '',
  lineDelimter : '\n',
  optionsForToStr : null,
  onToStr : null,
}
```
