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

Використовуючи мапу опцій можна задати додаткові параметри, які без офікації, створювали би надмірну кількість вхідних даних (4), що часто може призводити до помилок при роботі з аргументами:
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
    // line[ 1 ] = _.strBut( line[ 1 ], 0, '*' );
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
  <summary><u>Перевіряє що об'єкт <code>o.src</code> має якнайменше одну пару ключ-значення, яка представлена у <code>o.template</code></u></summary>

```javascript
/**
 * Checks if object( o.src ) has at least one key/value pair that is represented in( o.template ).
 * Also works with ( o.template ) as routine that check( o.src ) with own rules.
 * @param {wTools.objectSatisfyOptions} o - Default options {@link wTools.objectSatisfyOptions}.
 * @returns { boolean } Returns true if( o.src ) has same key/value pair(s) with( o.template )
 * or result if ( o.template ) routine call is true.
 *
 * @example
 * _.objectSatisfy( {a : 1, b : 1, c : 1 }, { a : 1, b : 2 } );
 * // returns true
 *
 * @example
 * _.objectSatisfy( { template : {a : 1, b : 1, c : 1 }, src : { a : 1, b : 2 } } );
 * // returns true
 *
 * @example
 * function routine( src ){ return src.a === 12 }
 * _.objectSatisfy( { template : routine, src : { a : 1, b : 2 } } );
 * // returns false
 *
 * @function objectSatisfy
 * @throws {exception} If( arguments.length ) is not equal to 1 or 2.
 * @throws {exception} If( o.template ) is not a Object.
 * @throws {exception} If( o.template ) is not a Routine.
 * @throws {exception} If( o.src ) is undefined.
 * @namespace Tools
*/

function objectSatisfy( o )
{

  if( arguments.length === 2 )
  o = { template : arguments[ 0 ], src : arguments[ 1 ] };

  _.assert( arguments.length === 1 || arguments.length === 2 );
  _.assert( _.objectIs( o.template ) || _.routineIs( o.template ) );
  _.assert( o.src !== undefined );
  _.routineOptions( objectSatisfy, o );

  return _objectSatisfy( o.template, o.src, o.src, o.levels, o.strict );

  /**/

  function _objectSatisfy( template, src, root, levels, strict )
  {

    if( !strict && src === undefined )
    return true;

    if( template === src )
    return true;

    if( levels === 0 )
    {
      if( _.objectIs( template ) && _.objectIs( src ) && _.routineIs( template.identicalWith ) && src.identicalWith === template.identicalWith )
      return template.identicalWith( src );
      else
      return template === src;
    }
    else if( levels < 0 )
    {
      return false;
    }

    if( _.routineIs( template ) )
    return template( src );

    if( !_.objectIs( src ) )
    return false;

    if( _.objectIs( template ) )
    {
      for( let t in template )
      {
        let satisfy = false;
        satisfy = _objectSatisfy( template[ t ], src[ t ], root, levels-1, strict );
        if( !satisfy )
        return false;
      }
      return true;
    }

    debugger;

    return false;
  }

}

objectSatisfy.defaults =
{
  template : null,
  src : null,
  levels : 1,
  strict : 1,
}
```

</details>

<details>
  <summary><u>Конвертує і повертає переданий об'єкт <code>{-srcMap-}</code> як строку</u></summary>

```javascript
/**
 * The mapToStr() routine converts and returns the passed object {-srcMap-} to the string.
 *
 * It takes an object and two strings (keyValSep) and (tupleSep),
 * checks if (keyValSep and tupleSep) are strings.
 * If false, it assigns them defaults ( ' : ' ) to the (keyValSep) and
 * ( '; ' ) to the tupleSep.
 * Otherwise, it returns a string representing the passed object {-srcMap-}.
 *
 * @param { objectLike } src - The object to convert to the string.
 * @param { string } [ keyValSep = ' : ' ] keyValSep - colon.
 * @param { string } [ tupleSep = '; ' ] tupleSep - semicolon.
 *
 * @example
 * _.mapToStr( { a : 1, b : 2, c : 3, d : 4 }, ' : ', '; ' );
 * // returns 'a : 1; b : 2; c : 3; d : 4'
 *
 * @example
 * _.mapToStr( [ 1, 2, 3 ], ' : ', '; ' );
 * // returns '0 : 1; 1 : 2; 2 : 3';
 *
 * @example
 * _.mapToStr( 'abc', ' : ', '; ' );
 * // returns '0 : a; 1 : b; 2 : c';
 *
 * @returns { string } Returns a string (result) representing the passed object {-srcMap-}.
 * @function mapToStr
 * @namespace Tools
 */

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
