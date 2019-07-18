# Array routines call conventions: naming

Принципи найменування рутин сімейства <code>Array</code>.

Рутини `array*` призначені для виконання операцій над масивами. Серед всіх можливих операцій можна виділити п'ять -`Append`, `Prepend`, `Remove`, `Flatten`, `Replace`, котрі утворюють сімейства рутин.

### Призначення сімейств рутин `array*`

Рутини сімейства `Append` призначені для додавання елементів з другого аргумента в кінець масиву `dstArray`, що переданий в першому аргументі.

Рутини сімейства `Prepend` призначені для додавання елементів з другого аргумента в початок масиву `dstArray`, що переданий в першому аргументі.

Рутини сімейства `Remove` призначені для видалення елементів з масиву `dstArray`, котрі присутні в другому аргументі.

Рутини сімейства `Flatten` призначені для розгортання масивів до масивів першого порядку. Рутини можуть приймати один або два масиви. Якщо використовується два масиви, то вони об'єднуються.

Рутини сімейства `Replace` призначені для заміщення елементів з масиву `dstArray`, елементами заданими в другому аргументі.

### Патерн найменування рутин

Загальний патерн найменування рутин модуля складається з двох частин:

```
[object][action]
```

`object` - об'єкт, тип даних з яким працює рутина. Наприклад, може бути `array`, `map`, `number`, `str` та інші.
`action` - дія, котру виконує рутина. Наприклад, дія `Make` створює об'єкт відповідного типу, відповідно `arrayMake( 1 )` створить порожній масив з довжиною `3`, а дія `Is` перевіряє істинність умови - виклик `mapIs( 1 )` поверне `false`.

Назва рутини може містити інші частини, що уточнюють її призначення і механізм виконання.

### Патерн найменування рутин сімейств `Append`, `Prepend`, `Remove`, `Flatten`, `Replace`

Оскільки, вказані рутини утворюють сімейства, для них виділено власний патерн найменування. Він складається з чотирьох частин:

```
array[action][second][how many]
```

- `array` - незмінна частина для позначення того, що рутини виконують операції з масивами;
- `action` - дія, яка буде виконана над масивом переданим в першому аргументі.
  - Згідно назви сімейства може бути `Append`, `Prepend`, `Replace`, `Flatten` i `Replace`, при цьому рутина поверне масив.
  - Назва може містити приставку `ed` - `Appended`, `Prepended`, `Replaced`, `Flattened` i `Replaced` - в залежності від реалізації рутини може повертатись індекс, кількість елементів або сам елемент;
- `second` - дає зрозуміти як розглядати другий аргумент, що передається рутині.
  - Якщо `second` відсутній, то рутина розглядає переданий аргумент як `Element`, тобто, скаляр.
  - `Array` - масив в якому ведеться перебір окремих елементів.
  - `Arrays` - переданий масив розглядається як масив з вкладеними масивами.
- `how many` - дає зрозуміти скільки раз виконувати дію.
  - Якщо в назві рутини `how many` відсутній, то рутина виконує дію для кожного елементу згідно визначення в `second`.
  - Якщо назва містить `Once` - рутина виконає дію принаймні один раз для кожного елемента визначеного через `second`,
  - `OnceStrictly` - рутина виконає дію тільки один раз або викине помилку. Якщо другий елемент розглядається як масив або масиви, то дія виконується по одному разу для кожного елемента переданих масивах.

### Приклади використання

<details>
  <summary><u>Структура файлів</u></summary>

```
arrayFamily
    ├── ArrayFamily.js
    └── package.json
```

</details>

Для дослідження особливостей найменування сімейств рутин `array*` створіть приведену вище конфігурацію файлів.

В прикладах використовується модуль `Tools`. Тому, скопіюйте приведений нижче код в файл `package.json`.

<details>
    <summary><u>Код файла <code>package.json</code></u></summary>

```json    
{
  "dependencies": {
    "wTools": ""
  }
}
```

</details>

Для встановлення залежностей скористуйтесь командою `npm install`. Після встановлення залежностей модуль готовий до роботи.

#### Рутини, що містять `ed`

<details>
    <summary><u>Приклад рутини з приставкою <code>ed</code> та без неї</u></summary>

```js
// array[action]
var result = _.arrayAppend( [ 1, 2 ], [ 3, 4 ] );
console.log( 'Without ed' );
console.log( result );
// returns [ 1, 2, [ 3, 4 ] ] - dstArray

// array[action]ed
var result = _.arrayAppended( [ 1, 2 ], [ 3, 4 ] );
console.log( 'With ed' );
console.log( result );
// returns 2 - index

// array[action]
var result = _.arrayPrepend( [ 1, 2 ], [ 3, 4 ] );
console.log( 'Without ed' );
console.log( result );
// returns [ [ 3, 4 ], 1, 2 ] - dstArray

// array[action]ed
var result = _.arrayPrepended( [ 1, 2 ], [ 3, 4 ] );
console.log( 'With ed' );
console.log( result );
// returns 0 - index
```

</details>

Рутина `arrayAppend` розглядає другий аргумент як скаляр, тому результуючий масив `dstArray` буде містити елемент в вигляді масиву `[ 3, 4 ]`. Якщо в назві рутини є приставка `ed`, то рутина виконує ту ж дію, а повертає індекс, елемент, або кількість елементів. Тому при використанні рутини `arrayAppended` рутина виведе індекс доданого елемента.

#### Рутини, що містять в назві `Once`, `OnceStrictly`

<details>
    <summary><u>Приклади рутин з <code>Once</code> i <code>OnceStrictly</code></u></summary>

```js
// array[action][second]
var result = _.arrayRemoveElement( [ 1, 2, 2, 4, 2, 5 ], 2 );
console.log( 'Without [how many]' );
console.log( result );
// returns [ 1, 4, 5 ]

// array[action][second]Once
var result = _.arrayRemoveElementOnce( [ 1, 2, 2, 4, 2, 5 ], 2 );
console.log( 'With [Once]' );
console.log( result );
// returns [ 1, 2, 4, 2, 5 ]

// array[action][second]OnceStrictly
var result = _.arrayReplaceElementOnceStrictly( [ 1, 4, 2, 5 ], 2, 3 );
console.log( 'With [OnceStrictly]' );
console.log( result );
// returns [ 1, 4, 3, 5 ]
```

</details>

Рутина `arrayRemoveElement` видаляє з масиву `dstArray` елемент, що заданий в другому аргументі. В першому прикладі немає обмеження `how many`, тому рутина видалила всі елементи `2`.

Рутина `arrayRemoveElementOnce` видаляє переданий елемент тільки один раз, тому в `dstArray` залишиться два елементи `2` - `[ 1, 2, 4, 2 ]`.

Рутина `arrayReplaceElementOnceStrictly` замінює елемент з масиву `dstArray` на переданий елемент тільки один раз, а якщо в `dstArray` їх більше, то рутина викине помилку.

#### Рутини, назва яких містить `Array` i `Arrays`

<details>
    <summary><u>Приклади рутин з <code>Once</code> i <code>OnceStrictly</code></u></summary>

```js
// array[action]Element
var result = _.arrayRemoveElement( [ 1, 2, 2, 4, 2, 5 ], [ 2, [ 4 ] ] );
console.log( 'second as element' );
console.log( result );
// returns [ 1, 2, 2, 4, 2, 5 ], routine treats element [ 2, [ 4 ] ] as scalar

// array[action]Array
var result = _.arrayRemoveArray( [ 1, 2, 2, 4, 2, 5 ], [ 2, [ 4 ] ] );
console.log( 'second as array' );
console.log( result );
// returns [ 1, 4, 5 ], routine treats inner array [ 4 ] as scalar

// array[action]Arrays
var result = _.arrayRemoveArrays( [ 1, 2, 2, 4, 2, 5 ], [ 2, [ 4 ] ] );
console.log( 'second as arrays' );
console.log( result );
// returns [ 1, 5 ]

// array[action]
var result = _.arrayFlatten( [ 1, 2, 2, 4, 2, 5 ], [ 2, [ 4 ] ] );
console.log( 'arrayFlatten' );
console.log( result );
// returns [ 1, 2, 2, 4, 2, 5, 2, 4 ]
```

</details>

Рутина `arrayRemoveElement` розглядає другий елемент як скаляр, тому в переданому масиві `dstArray` не знайдено жодного елементу `[ 2, [ 4 ] ]`.

Якщо другий аргумент розглядається як масив, то вкладені в нього масиви вважаються скалярними величинами. Тому в другому прикладі рутина поверне масив `[ 1, 4, 5 ]`.

Якщо другий аргумент розглядається як масив з масивами, то рутина шукає всі елементи, що є в другому аргументі. Таким чином, рутина `arrayRemoveArrays` видалить всі елементи `2` i `4` з масиву `dstArray`.

Сімейство рутин `Flatten` завжди розглядає другий аргумент як масив з масивами. Тому рутина об'єднала два масиви в один плоский.

<details>
    <summary><u>Код файла <code>ArrayFamily.js</code></u></summary>

```js
let _ = require( 'wTools' );

//

// array[action]
var result = _.arrayAppend( [ 1, 2 ], [ 3, 4 ] );
console.log( 'Without ed' );
console.log( result );
// returns [ 1, 2, [ 3, 4 ] ] - dstArray

// array[action]ed
var result = _.arrayAppended( [ 1, 2 ], [ 3, 4 ] );
console.log( 'With ed' );
console.log( result );
// returns 2 - index

// array[action]
var result = _.arrayPrepend( [ 1, 2 ], [ 3, 4 ] );
console.log( 'Without ed' );
console.log( result );
// returns [ [ 3, 4 ], 1, 2 ] - dstArray

// array[action]ed
var result = _.arrayPrepended( [ 1, 2 ], [ 3, 4 ] );
console.log( 'With ed' );
console.log( result );
// returns 0 - index

//

// array[action][second]
var result = _.arrayRemoveElement( [ 1, 2, 2, 4, 2, 5 ], 2 );
console.log( 'Without [how many]' );
console.log( result );
// returns [ 1, 4, 5 ]

// array[action][second]Once
var result = _.arrayRemoveElementOnce( [ 1, 2, 2, 4, 2, 5 ], 2 );
console.log( 'With [Once]' );
console.log( result );
// returns [ 1, 2, 4, 2, 5 ]

// array[action][second]OnceStrictly
var result = _.arrayRemoveElementOnceStrictly( [ 1, 4, 2, 5 ], 2 );
console.log( 'With [OnceStrictly]' );
console.log( result );
// returns [ 1, 4, 5 ]

//

// array[action]Element
var result = _.arrayRemoveElement( [ 1, 2, 2, 4, 2, 5 ], [ 2, [ 4 ] ] );
console.log( 'second as element' );
console.log( result );
// returns [ 1, 2, 2, 4, 2, 5 ], routine treats element [ 2, [ 4 ] ] as scalar

// array[action]Array
var result = _.arrayRemoveArray( [ 1, 2, 2, 4, 2, 5 ], [ 2, [ 4 ] ] );
console.log( 'second as array' );
console.log( result );
// returns [ 1, 4, 5 ], routine treats inner array [ 4 ] as scalar

// array[action]Arrays
var result = _.arrayRemoveArrays( [ 1, 2, 2, 4, 2, 5 ], [ 2, [ 4 ] ] );
console.log( 'second as arrays' );
console.log( result );
// returns [ 1, 5 ]

// array[action]
var result = _.arrayFlatten( [ 1, 2, 2, 4, 2, 5 ], [ 2, [ 4 ] ] );
console.log( 'arrayFlatten' );
console.log( result );
// returns [ 1, 2, 2, 4, 2, 5, 2, 4 ]
```

</details>

Внесіть приведений вище код в файл `ArrayFamily.js`. Запустіть виконання командою `node ArrayFamily.js` та порівняйте з виводом нижче

<details>
  <summary><u>Вивід команди <code>node ArrayFamily.js</code></u></summary>

```
$ node ArrayFamily.js
Without ed
[ 1, 2, [ 3, 4 ] ]
With ed
2
Without ed
[ [ 3, 4 ], 1, 2 ]
With ed
0
Without [how many]
[ 1, 4, 5 ]
With [Once]
[ 1, 2, 4, 2, 5 ]
With [OnceStrictly]
[ 1, 4, 5 ]
second as element
[ 1, 2, 2, 4, 2, 5 ]
second as array
[ 1, 4, 5 ]
second as arrays
[ 1, 5 ]
arrayFlatten
[ 1, 2, 2, 4, 2, 5, 2, 4 ]
```

</details>

Результати відповідають очікуваним. Щоб дізнатись перелік і призначення сімейств рутин прогляньте таблиці нижче.

### Перелік рутин в табличній формі

В першій колонці указано назви рутин в форматі `array[action][second]`, а в наступних додається приставка `how many`. На перетині цих значень указано, що повертає рутина.

<details>
  <summary><u>Таблиця рутин сімейства <code>Prepend</code></u></summary>

| array[action][second]      | -                   | Once                | OnceStrictly               |
|----------------------------|---------------------|---------------------|----------------------------|
| arrayPrepend               | dstArray            | dstArray            | dstArray                   |
| arrayPrependElement        | dstArray            | dstArray            | dstArray                   |
| arrayPrependArray          | dstArray            | dstArray            | dstArray                   |
| arrayPrependArrays         | dstArray            | dstArray            | dstArray                   |
| arrayPrepended             | index               | index               | index                      |
| arrayPrependedElement      | index               | element             | element / index            |
| arrayPrependedArray        | number              | number              | number                     |
| arrayPrependedArrays       | number              | number              | number                     |

</details>
<details>
  <summary><u>Таблиця рутин сімейства <code>Append</code></u></summary>

| array[action][second]     | -                   | Once                | OnceStrictly               |
|---------------------------|---------------------|---------------------|----------------------------|
| arrayAppend               | dstArray            | dstArray            | dstArray                   |
| arrayAppendElement        | dstArray            | dstArray            | dstArray                   |
| arrayAppendArray          | dstArray            | dstArray            | dstArray                   |
| arrayAppendArrays         | dstArray            | dstArray            | dstArray                   |
| arrayAppended             | index               | index               | index                      |
| arrayAppendedElement      | index               | element             | element / index            |
| arrayAppendedArray        | number              | number              | number                     |
| arrayAppendedArrays       | number              | number              | number                     |

</details>

Рутини сімейств `Prepend` i `Append` приймають від двох до чотирьох аргументів. Не містять додаткових рутин поведінка яких би відрізнялась від описаної в алгоритмі вище.

<details>
  <summary><u>Таблиця рутин сімейства <code>Remove</code></u></summary>

| array[action][second]     | -                   | Once                | OnceStrictly               |
|---------------------------|---------------------|---------------------|----------------------------|
| arrayRemove               | dstArray            | dstArray            | dstArray                   |
| arrayRemoveElement        | dstArray            | dstArray            | dstArray                   |
| arrayRemoveArray          | dstArray            | dstArray            | dstArray                   |
| arrayRemoveArrays         | dstArray            | dstArray            | dstArray                   |
| arrayRemoved              | number              | index               | index                      |
| arrayRemovedElement       | number              | index               | element                    |
| arrayRemovedArray         | number              | number              | number                     |
| arrayRemovedArrays        | number              | number              | number                     |
| arrayRemoveDuplicates     | dstArray            | -                   | -                          |

</details>

Рутина `arrayRemoveDuplicates`, що входить до сімейства `Remove` видаляє з переданого масиву елементи, що повторюються та повертає оновлений масив `dstArray`.

<details>
  <summary><u>Таблиця рутин сімейства <code>Flatten</code></u></summary>

| array[action][second]     | -                   | Once                | OnceStrictly               |
|---------------------------|---------------------|---------------------|----------------------------|
| arrayFlatten              | dstArray            | dstArray            | dstArray                   |
| arrayFlattenDefined       | dstArray            | dstArray            | dstArray                   |
| arrayFlattened            | number / dstArray   | number / dstArray   | number / dstArray          |
| arrayFlattenedDefined     | number / dstArray   | number / dstArray   | number / dstArray          |

</details>

Рутини сімейства `Flatten`, котрі містять приставку `Defined` викидають помилку, якщо другий аргумент містить значення `undefined`.

<details>
  <summary><u>Таблиця рутин сімейства <code>Replace</code></u></summary>

| array[action][second]     | -                   | Once                | OnceStrictly               |
|---------------------------|---------------------|---------------------|----------------------------|
| arrayReplace              | dstArray            | dstArray            | dstArray                   |
| arrayReplaceElement       | dstArray            | dstArray            | dstArray                   |
| arrayReplaceArray         | dstArray            | dstArray            | dstArray                   |
| arrayReplaceArrays        | dstArray            | dstArray            | dstArray                   |
| arrayReplaced             | number              | index               | index                      |
| arrayReplacedElement      | number              | element             | element                    |
| arrayReplacedArray        | number              | number              | number                     |
| arrayReplacedArrays       | number              | number              | number                     |

</details>

Рутини сімейства `Replace` приймають не менше трьох параметрів - масив призначення `dstArray`, елемент, що потрібно замінити `ins`, елемент, що буде додано `sub`.

Рутини, що виконують операції з масивами можуть містити додаткові [фільтри-колбеки в вигляді еквалайзера або евалуатора](ConventionCallbecksInArray.md).

### Підсумок

- Загальний патерн в найменуванні рутин - `[object][action]`.
- Рутини, що виконують операції з масивами містять п'ять сімейств рутин - `Append`, `Prepend`, `Remove`, `Flatten`, `Replace`. Вони мають власний патерн найменування - `array[action][second][how many]`.
- `action` визначається за назвою сімейства рутин, може містити приставку `ed`. Дає зрозуміти який результат буде повернено рутиною. Якщо рутина не містить приставку, вона повертає масив `dstArray`, інакше індекс, або елемент чи кількість елементів.
- `second` дає зрозуміти як розглядати другий аргумент переданий рутині - як скаляр, чи як вектор.
- `how many` дає зрозуміти скільки раз буде виконуватись процедура - за кількістю знайдених елементів чи один раз.
