# Array routines call conventions: naming

Принципи найменування рутин сімейства <code>Array</code>.

Рутини `array*` призначені для виконання операцій над масивами. Серед всіх можливих операцій можна виділити п'ять -`Append`, `Prepend`, `Remove`, `Flatten`, `Replace`, котрі утворюють сімейства рутин.

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
- `action` - дія, яка буде виконана над масивом переданим в першому аргументі. Згідно назви сімейства може бути `Append`, `Prepend`, `Replace`, `Flatten` i `Replace`, при цьому рутина поверне масив. Назва може містити приставку `ed` - `Appended`, `Prepended`, `Replaced`, `Flattened` i `Replaced` - в залежності від реалізації рутини може повертатись індекс, кількість елементів або сам елемент;
- `second` - дає зрозуміти як розглядати другий аргумент, що передається рутині. Якщо `second` відсутній, то рутина розглядає переданий аргумент як `Element`, також, `second` може бути позначений `Array` i `Arrays`.
- `how many` - дає зрозуміти скільки раз виконувати дію. Якщо в назві рутини `how many` відсутній, то рутина виконує дію для кожного елементу згідно визначення в `second`. Якщо назва містить `Once` - рутина виконає дію принаймні один раз для кожного елемента визначеного через `second`, `OnceStrictly` - рутина виконає дію тільки один раз або викине помилку. Якщо другий елемент розглядається як масив або масиви, то дія виконується по одному разу для кожного елемента переданих масивів.

### Призначення рутин сімейства `arrayAppend`

Рутини призначені для додавання елементів з другого аргумента в кінець першого.

Прогляньте таблицю зі значеннями, що повертають рутини сімейства arrayAppend.

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

Таким чином, рутина

```js
arrayAppend( [ 1, 2 ], [ 1, 2 ] );
// returns [ 1, 2, [ 1, 2 ] ]
```

не має приставок `second` i `how many`, а тому розглядає другий масив як елемент. Рутина `arrayAppend` додасть другий масив в кінець першого. Якщо

### Призначення рутин сімейства arrayPrepend

Рутини призначені для додавання елементів з другого аргумента в початок першого.

Прогляньте таблицю зі значеннями, що повертають рутини сімейства arrayPrepend. В першій колонці указано рутини, а в наступних приставки how many.

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

### Призначення рутин сімейства arrayRemove

Рутини призначені для видалення елементів з першого масиву, котрі присутні в другому аргументі.

Прогляньте таблицю зі значеннями, що повертають рутини сімейства arrayRemove.

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


### Призначення рутин сімейства arrayFlatten

Рутини призначені для розгортання масивів до масивів першого порядку. Якщо використовується два масиви, то вони об'єднуються.

Прогляньте таблицю зі значеннями, що повертають рутини сімейства arrayFlatten.

| array[action][second]     | -                   | Once                | OnceStrictly               |
|---------------------------|---------------------|---------------------|----------------------------|
| arrayFlatten              | dstArray            | dstArray            | dstArray                   |
| arrayFlattenDefined       | dstArray            | dstArray            | dstArray                   |
| arrayFlattened            | number / dstArray   | number / dstArray   | number / dstArray          |
| arrayFlattenedDefined     | number / dstArray   | number / dstArray   | number / dstArray          |


### Призначення рутин сімейства arrayReplace

Рутини призначені для заміщення елементів з першого масиву, елементами другого аргумента.

Прогляньте таблицю зі значеннями, що повертають рутини сімейства arrayReplace.

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
