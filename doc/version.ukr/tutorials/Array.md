# Результати виконання рутин

Назва рутини складається з чотирьох частин:

- array - об'єкт над яким проводиться дія;
- action - дія, що виконується з об'єктами. Може бути Append, Prepend, Replace, Flatten i Replace, при цьому повертається масив. Або Appended, Prepended, Replaced, Flattened i Replaced - може повертатись індекс, кількість елементів або сам елемент;
- second - дає зрозуміти як розглядати другий аргумент. Може бути відсутнім, або ж Element, Array i Arrays.
- how many - дає зрозуміти скільки раз виконувати дію. Може бути відсутнім - рутина виконає дію для кожного елемента масиву, Once - рутина виконає дію принаймні один раз для кожного елемента масиву, OnceStrictly - рутина виконає дію тільки один раз або поверне помилку. Якщо другий елемент - масив або масиви, то дія виконується по одному разу для кожного елемента масиву.

Таким чином рутина

```js
arrayRemoveArrayOnceStrictly
```
Видалить з початкового масиву всі елементи, що є в другому масиві один раз. Якщо в першому масиві буде менше, або більше елементів, то рутина поверне помилку.

### Значення, що повертаються рутинами сімейства arrayPrepend

Прогляньте таблицю зі значеннями, що повертають рутини сімейства arrayPrepend. В першій колонці указано рутини, а в наступних приставки how many.

|                            | -                   | Once                | OnceStrictly               |
|----------------------------|---------------------|---------------------|----------------------------|
| arrayPrependUnrolling      | dstArray            | -                   | -                          |
| arrayPrepend               | dstArray            | dstArray            | dstArray                   |
| arrayPrependElement        | dstArray            | dstArray            | dstArray                   |
| arrayPrependArray          | dstArray            | dstArray            | dstArray                   |
| arrayPrependArrays         | dstArray            | dstArray            | dstArray                   |
| arrayPrepended             | index               | index <br> if not element was prepended <br> then -1 | index <br> if not element was prepended <br> then -1 |
| arrayPrependedElement      | index               | element <br> if not element was prepended <br> then undefined | element <br> if not element was prepended <br> then undefined; <br> if !Config.debug <br> then index |
| arrayPrependedArray        | number              | number              | number                     |
| arrayPrependedArrays       | number              | number              | number                     |


### Значення, що повертаються рутинами сімейства arrayAppend

Прогляньте таблицю зі значеннями, що повертають рутини сімейства arrayAppend.

|                           | -                   | Once                | OnceStrictly               |
|---------------------------|---------------------|---------------------|----------------------------|
| arrayAppendUnrolling      | dstArray            | -                   | -                          |
| arrayAppend               | dstArray            | dstArray            | dstArray                   |
| arrayAppendElement        | dstArray            | dstArray            | dstArray                   |
| arrayAppendArray          | dstArray            | dstArray            | dstArray                   |
| arrayAppendArrays         | dstArray            | dstArray            | dstArray                   |
| arrayAppended             | index               | index               | index <br> if no element was appended <br> then -1 |
| arrayAppendedElement      | index               | element <br> if not element was appended <br> then false | element <br> if not element was appended <br> then false; <br> if !Config.debug <br> then index |
| arrayAppendedArray        | number              | number              | number                     |
| arrayAppendedArrays       | number              | number <br> if dstArray === undefined <br> then insArray  | number                     |


### Значення, що повертаються рутинами сімейства arrayRemove

Прогляньте таблицю зі значеннями, що повертають рутини сімейства arrayRemove.

|                           | -                   | Once                | OnceStrictly               |
|---------------------------|---------------------|---------------------|----------------------------|
| arrayRemove               | dstArray            | dstArray            | dstArray                   |
| arrayRemoveElement        | dstArray            | dstArray            | dstArray                   |
| arrayRemoveArray          | dstArray            | dstArray            | dstArray                   |
| arrayRemoveArrays         | dstArray            | dstArray            | dstArray                   |
| arrayRemoved              | number              | index               | index                      |
| arrayRemovedElement       | number              | index               | element                    |
| arrayRemovedArray         | number              | number              | number                     |
| arrayRemovedArrays        | number              | number              | number                     |
| arrayRemoveAll            | dstArray            | -                   | -                          |
| arrayRemovedAll           | number              | -                   | -                          |
| arrayRemoveDuplicates     | dstArray            | -                   | -                          |


### Значення, що повертаються рутинами сімейства arrayFlatten

Прогляньте таблицю зі значеннями, що повертають рутини сімейства arrayFlatten.

|                           | -                   | Once                | OnceStrictly               |
|---------------------------|---------------------|---------------------|----------------------------|
| arrayFlatten              | dstArray            | dstArray            | dstArray                   |
| arrayFlattenDefined       | dstArray            | dstArray            | dstArray                   |
| arrayFlattened            | number <br> if arguments.length === 1 <br> then dstArray | number <br> if arguments.length === 1 <br> then dstArray | number <br> if arguments.length === 1 <br> then dstArray |
| arrayFlattenedDefined     | number <br> if arguments.length === 1 <br> then dstArray | number <br> if arguments.length === 1 <br> then dstArray | number <br> if arguments.length === 1 <br> then dstArray |


### Значення, що повертаються рутинами сімейства arrayReplace

Прогляньте таблицю зі значеннями, що повертають рутини сімейства arrayReplace.

|                           | -                   | Once                | OnceStrictly               |
|---------------------------|---------------------|---------------------|----------------------------|
| arrayReplace              | dstArray            | dstArray            | dstArray                   |
| arrayReplaceElement       | dstArray            | dstArray            | dstArray                   |
| arrayReplaceArray         | dstArray            | dstArray            | dstArray                   |
| arrayReplaceArrays        | dstArray            | dstArray            | dstArray                   |
| arrayReplaced             | number              | index               | index                      |
| arrayReplacedElement      | number              | ins <br> if not element was replaced <br> then undefined | ins <br> if not element was replaced <br> then undefined |
| arrayReplacedArray        | number              | number              | number                     |
| arrayReplacedArrays       | number              | number              | number                     |
| arrayReplaceAll           | dstArray            | -                   | -                          |
| arrayReplacedAll          | number              | -                   | -                          |
| arrayUpdate               | dstArray.length     | -                   | -                          |

# Особливості коду в рутинах array*

Розглядається код рутин array*, наявність однакового функціоналу і опису.

### Таблиця з особливостями коду рутин сімейства arrayPrepend

|                            | -                   | Once                | OnceStrictly               |
|----------------------------|---------------------|---------------------|----------------------------|
| arrayPrependUnrolling      | -                   | -                   | -                          |
| arrayPrepend               | -                   | -                   | -                          |
| arrayPrependElement        | copy of arrayPrepend | copy of arrayPrependOnce |  copy of arrayPrependOnceStrictly |
| arrayPrependArray          | -                   | -                   | has similar code to arrayPrependedArrayOnceStrictly |
| arrayPrependArrays         | -                   | -                   | has similar code to arrayPrependedArraysOnceStrictly |
| arrayPrepended             | -                   | if dstArray contains ins <br> then return -1  | if dstArray contains ins <br> then return -1 |
| arrayPrependedElement      | copy of arrayPrepended | copy of arrayPrependedOnce <br> difference <br> if dstArray conteins ins <br> then return undefined |  copy of arrayPrependedOnceStrictly <br> difference <br> if dstArray conteins ins <br> then return undefined |
| arrayPrependedArray        | -                   | -                   | has similar code to arrayPrependArrayOnceStrictly |
| arrayPrependedArrays       | -                   | -                   | has similar code to arrayPrependArraysOnceStrictly |

В таблицях позначено:
- copy of - позначає, що рутина копіює код з указної далі рутини;
- has similar code - позначає, що рутина має частину коду, подібну до вказаної;
- return - якщо рутини подібні і незначно відрізняються, то указуються значення, що вони повертають.

### Таблиця з особливостями коду рутин сімейства arrayAppend

|                            | -                   | Once                | OnceStrictly               |
|----------------------------|---------------------|---------------------|----------------------------|
| arrayAppendUnrolling       | -                   | -                   | -                          |
| arrayAppend                | -                   | -                   | has similar code to arrayAppendedOnceStrictly |
| arrayAppendElement         | copy of arrayAppend | copy of arrayAppendOnce |  copy of arrayAppendOnceStrictly |
| arrayAppendArray           | -                   | -                   | has similar code to arrayAppendedArrayOnceStrictly |
| arrayAppendArrays          | -                   | -                   | has similar code to arrayAppendedArraysOnceStrictly |
| arrayAppended              | -                   | -                   | has similar code to arrayAppendOnceStrictly |
| arrayAppendedElement       | copy of arrayAppended | copy of arrayAppendedOnce | copy of arrayAppendedOnceStrictly <br> difference in assertion message |
| arrayAppendedArray         | -                   | -                   | has similar code to arrayAppendArrayOnceStrictly |
| arrayAppendedArrays        | -                   | -                   | has similar code to arrayAppendArraysOnceStrictly |

### Таблиця з особливостями коду рутин сімейства arrayRemove

|                            | -                   | Once                | OnceStrictly               |
|----------------------------|---------------------|---------------------|----------------------------|
| arrayRemove                | -                   | -                   | -                          |
| arrayRemoveElement         | copy of arrayRemove | copy of arrayRemoveOnce | copy of arrayRemoveOnceStrictly |
| arrayRemoveArray           | -                   | -                   | has similar code to arrayRemovedArrayOnceStrictly |
| arrayRemoveArrays          | -                   | -                   | has similar code to arrayRemovedArraysOnceStrictly |
| arrayRemoved               | -                   | -                   | -                          |
| arrayRemovedElement        | arrayRemoved uses this routine | copy of arrayRemovedOnce | copy of arrayRemovedOnceStrictly <br> difference in assertion message |
| arrayRemovedArray          | -                   | -                   | has similar code to arrayRemoveArrayOnceStrictly |
| arrayRemovedArrays         | -                   | -                   | has similar code to arrayRemoveArraysOnceStrictly |
| arrayRemoveAll             | copy of arrayRemoveElement  | -                   | -                          |
| arrayRemoveDuplicates      | -                   | -                   | -                          |

### Таблиця з особливостями коду рутин сімейства arrayReplaced

|                            | -                   | Once                | OnceStrictly               |
|----------------------------|---------------------|---------------------|----------------------------|
| arrayReplace               | has similar code to arrayReplaced | -                   | has similar code to arrayReplacedOnceStrictly |
| arrayReplaceElement        | copy of arrayReplace | copy of arrayReplaceOnce |  copy of arrayReplaceOnceStrictly |
| arrayReplaceArray          | -                   | -                   | has similar code to arrayReplacedArrayOnceStrictly |
| arrayReplaceArrays         | -                   | -                   | has similar code to arrayReplacedArraysOnceStrictly |
| arrayReplaced              | has similar code to arrayReplace | return index | has similar code to arrayReplaceOnceStrictly <br> return index |
| arrayReplacedElement       | copy of arrayReplaceed | copy of arrayReplacedOnce <br> difference <br> routine return ins | copy of arrayReplacedOnceStrictly <br> difference <br> routine return ins |
| arrayReplacedArray         | -                   | -                   | has similar code to arrayReplaceArrayOnceStrictly |
| arrayReplacedArrays        | -                   | -                   | has similar code to arrayReplaceArraysOnceStrictly |
| arrayReplaceAll            | copy of arrayReplacedElement | -                   | -                          |
| arrayReplaceUpdate      | -                   | -                   | -                          |


# Пояснення щодо вмісту таблиць з особливостями коду на прикладі сімейства рутин arrayPrepend

### Рутини, що мають однаковий функціонал

Рутина arrayPrependElement копіює рутину arrayPrepend. Відмінність між ними в виклику різних рутин:
- рутина arrayPrependElement використовує рутину arrayPrependedElement;
- arrayPrepend - arrayPrepended.

В свою чергу, рутини arrayPrependedElement i arrayPrepended ідентичні:
- вони однаково обробляють аргументи;
- повертають однаковий результат.

Кількість рядків і структура коду однакова у всіх рутинах.

<details>
  <summary><u>Код рутин arrayPrepend і arrayPrependElement</u></summary>

 ```js
 function arrayPrepend( dstArray, ins )
 {
   if( dstArray === null )
   {
     dstArray = [];
     arguments[ 0 ] = dstArray;
   }

   arrayPrepended.apply( this, arguments );
   return dstArray;
 }

 //

 function arrayPrependElement( dstArray, ins )
 {
   if( dstArray === null )
   {
     dstArray = [];
     arguments[ 0 ] = dstArray;
   }

   arrayPrependedElement.apply( this, arguments );
   return dstArray;
 }
```

</details>
<details>
  <summary><u>Код рутин arrayPrepended і arrayPrependedElement</u></summary>

```js
 function arrayPrepended( dstArray, ins )
 {
   _.assert( arguments.length === 2  );
   _.assert( _.arrayIs( dstArray ) );

   dstArray.unshift( ins );
   return 0;
 }

 //

 function arrayPrependedElement( dstArray, ins )
 {
   _.assert( arguments.length === 2  );
   _.assert( _.arrayIs( dstArray ) );

   dstArray.unshift( ins );
   return 0;
 }
 ```

 </details>

 Рутини arrayPrependElementOnce і arrayPrependOnce відрізняються рутинами, які вони викликають:
 - рутина arrayPrependElementOnce використовує arrayPrependedElementOnce;
 - arrayPrependOnce - arrayPrependedOnce.

 В свою чергу останні мають схожий код. Рутини arrayPrependedElementOnce і arrayPrependedOnce відрізняються поверненим значенням у випадку, якщо масив призначення dstArray включає елемент вставки ins:
 - arrayPrependElementOnce повертає undefined;
 - arrayPrependOnce повертає -1.
 Якщо співпадінь немає, то повернене значення однакове - індекс.

 Кількість рядків коду і його структура однакова.

 <details>
   <summary><u>Код рутин arrayPrependOnce і arrayPrependOnceElement</u></summary>

```js
function arrayPrependOnce( dstArray, ins, evaluator1, evaluator2 )
{
  if( dstArray === null )
  {
    dstArray = [];
    arguments[ 0 ] = dstArray;
  }

  arrayPrependedOnce.apply( this, arguments );
  return dstArray;
}

//

function arrayPrependElementOnce( dstArray, ins, evaluator1, evaluator2 )
{
  if( dstArray === null )
  {
    dstArray = [];
    arguments[ 0 ] = dstArray;
  }

  arrayPrependedElementOnce.apply( this, arguments );
  return dstArray;
}
```

</details>
<details>
  <summary><u>Код рутин arrayPrependedOnce і arrayPrependedOnceElement</u></summary>

```js
function arrayPrependedOnce( dstArray, ins, evaluator1, evaluator2 )
{
  _.assert( _.arrayIs( dstArray ) );

  let i = _.arrayLeftIndex.apply( _, arguments );

  if( i === -1 )
  {
    dstArray.unshift( ins );
    return 0;
  }
  return -1;
}

//

function arrayPrependedElementOnce( dstArray, ins, evaluator1, evaluator2 )
{
  _.assert( _.arrayIs( dstArray ) );

  let i = _.arrayLeftIndex.apply( _, arguments );

  if( i === -1 )
  {
    dstArray.unshift( ins );
    return dstArray[ 0 ];
  }
  return undefined;
}
```

</details>

Рутини arrayPrependElementOnceStrictly і arrayPrependOnceStrictly мають аналогічну ситуацію до попередньої, вони використовуть рутини arrayPrependElementOnce і arrayPrependOnce, відповідно.

### Рутини, що мають однаковий код

Рутини arrayPrependArrayOnceStrictly і arrayPrependedArrayOnceStrictly мають однаковий робочий код, але повертають різні значення:
- arrayPrependArrayOnceStrictly повертає dstArray;
- arrayPrependedArrayOnce повертає number, тобто кількість доданих елементів.

<details>
  <summary><u>Код рутин arrayPrependArrayOnceStrictly і arrayPrependedArrayOnceStrictly</u></summary>

```js
function arrayPrependArrayOnceStrictly( dstArray, insArray, evaluator1, evaluator2 )
{
  if( dstArray === null )
  {
    dstArray = [];
    arguments[ 0 ] = dstArray;
  }

  let result;
  if( Config.debug )
  {
    result = arrayPrependedArrayOnce.apply( this, arguments );
    _.assert( result === insArray.length );
  }
  else
  {
    result = arrayPrependedArray.apply( this, [ dstArray, insArray ] );
  }

  return dstArray;
}

//

function arrayPrependedArrayOnceStrictly( dstArray, insArray, evaluator1, evaluator2 )
{
 let result;
 if( Config.debug )
 {
   result = arrayPrependedArrayOnce.apply( this, arguments );
   _.assert( result === insArray.length );
 }
 else
 {
   result = arrayPrependedArray.apply( this, [ dstArray, insArray ] );
 }

 return result;
}
```

</details>

Частина коду arrayPrependArrayOnceStrictly повторюється arrayPrependedArrayOnceStrictly.

Разом з цим, рутина arrayPrependArrayOnce, яка має схожий функціонал, використовує код з рутини arrayPrependedArrayOnce. Обидві рутини повертають вони різні значення - dstArray і number, відповідно.

<details>
  <summary><u>Код рутин arrayPrependArrayOnceStrictly і arrayPrependedArrayOnceStrictly</u></summary>

```js
function arrayPrependArrayOnce( dstArray, insArray, evaluator1, evaluator2 )
{
  if( dstArray === null )
  {
    dstArray = [];
    arguments[ 0 ] = dstArray;
  }

  arrayPrependedArrayOnce.apply( this, arguments );
  return dstArray;
}

//

function arrayPrependedArrayOnce( dstArray, insArray, evaluator1, evaluator2 )
{
  _.assert( _.arrayIs( dstArray ) );
  _.assert( _.longIs( insArray ) );
  _.assert( dstArray !== insArray );
  _.assert( 2 <= arguments.length && arguments.length <= 4 );

  let result = 0;

  for( let i = insArray.length - 1; i >= 0; i-- )
  {
    if( _.arrayLeftIndex( dstArray, insArray[ i ], evaluator1, evaluator2 ) === -1 )
    {
      dstArray.unshift( insArray[ i ] );
      result += 1;
    }
  }

  return result;
}

```

</details>

Для рутин arrayPrependArraysOnceStrictly і arrayPrependedArraysOnceStrictly ситуація аналогічна до arrayPrependArrayOnceStrictly і arrayPrependedArrayOnce.

### Підсумок
- Рутини arrayPrepend* можуть використовувати код рутин arrayPrependElement* ( замість * - нічого, або Once OnceStrictly). Або видалити їх.
- Рутини arrayAppend* можуть використовувати код рутин arrayAppendElement*. Або видалити їх.
- Рутини arrayRemove* можуть використовувати код рутин arrayRemoveElement*. Або видалити їх.
- Рутина arrayRemoveAll може використовувати код рутини arrayRemoveElement. Краще її видалити.
- Рутини arrayReplce* можуть використовувати код рутин arrayReplaceElement*. Або видалити їх.
- Рутина arrayReplceAll може використовувати код рутини arrayReplaceElement. Краще її видалити.
- Однаковий код може бути поміщений в одну із рутин, так же як і в багатьох інших.
