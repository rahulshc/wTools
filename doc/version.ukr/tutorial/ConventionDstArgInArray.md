# Array routines call conventions: dst argument

Про що свідчить використання аргумента <code>dst</code>.

Рутини модуля, що виконують операції з масивами та мапами можуть містити аргументи, котрі містять приставки `src` i `dst`.

### Використання рутин з аргументами `src` i `dst`

<details>
  <summary><u>Структура файлів</u></summary>

```
argument
    ├── SrcAndDst.js
    └── package.json
```

</details>

Створіть приведену конфігурацію для порівняння рутин, що використовують в аргументах `src` i `dst`.

Для використання рутин треба підключити модуль `Tools`. Скопіюйте приведений нижче код в файл `package.json`.

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

На прикладі рутин `arrayAppend` i `arrayCountElement` розглянемо підходи в використанні аргументів. Рутина `arrayAppend` в якості першого аргумента приймає `dstArray` - масив призначення, а другим `ins` - елемент, що буде додано. Рутина `arrayCountElement` в якості першого аргументу приймає `srcArray`, а другим - `element`, елемент для порівняння.

<details>
  <summary><u>Код файла <code>SrcAndDst.js</code></u></summary>

```js
require( 'wTools' );

// original array

let origin = [ 1, 2, 'a', 'b', true, 1,  [ 1 ] ];

// second argument in the routines

let elem = 1;

// routine uses argument srcArray

let srcArray = wTools.longSlice( origin );

let result = wTools.arrayCountElement( srcArray, elem );

console.log( 'The result is:' );
console.log( result );
console.log( 'The original array is:');
console.log( origin );
console.log( 'srcArray changed to:' );
console.log( srcArray );

// routine uses argument dstArray

let dstArray = wTools.longSlice( origin );

let result1 = wTools.arrayAppend( dstArray, elem );

console.log( 'The result is:' );
console.log( result1 );
console.log( 'The original array is:');
console.log( origin );
console.log( 'dstArray changed to:' );
console.log( dstArray );
```

</details>

Внесіть в файл `SrcAndDst.js` приведений код.

На початку файла приведені спільні змінні для обох рутин. Змінна `origin` - початковий масив для передачі в рутини. Змінна `elem` використовується в якості другого аргумента рутин `arrayAppend` та `arrayCountElement`.

Для створення копій масиву `origin` використовується рутина `longSlice`. Якщо не задати початок і кінець масиву для копіювання, рутина `longSlice` копіює весь масив від початку до кінця.

<details>
  <summary><u>Вивід команди <code>node SrcAndDst.js</code></u></summary>

```
$ node SrcAndDst.js
The result is:
2
The original array is:
[ 1, 2, 'a', 'b', true, 1, [ 1 ] ]
srcArray changed to:
[ 1, 2, 'a', 'b', true, 1, [ 1 ] ]
The result is:
[ 1, 2, 'a', 'b', true, 1, [ 1 ], 1 ]
The original array is:
[ 1, 2, 'a', 'b', true, 1, [ 1 ] ]
dstArray changed to:
[ 1, 2, 'a', 'b', true, 1, [ 1 ], 1 ]
```

</details>

Запустіть виконання файла командою `node SrcAndDst.js`. Порівняйте вивід з приведеним вище.

Рутина `arrayCountElement` повернула кількість входження елементу `1` в масиві `srcArray`. При цьому копія і оригінал масиву ідентичні. А рутина `arrayAppend`, котра використовує аргумент `dstArray` повернула новий масив `result`, що має значення `[ 1, 2, 'a', 'b', true, 1, [ 1 ], 1 ]`. При порівнянні оригіналу масиву і копії в `dstArray` видно, що рутина `arrayAppend` змінила копію.

### Підсумок

- Опис аргументів рутини визначає її поведінку.
- Якщо аргумент в своїй назві містить `dst`, це означає що аргумент буде змінено згідно алгоритму рутини.
- Якщо рутина містить аргумент з приставкою `dst`, то вона може повернути як змінений аргумент так і інше значення, визначене її призначенням.
- Аргументи, що містять в своїй назві `src` використовуються рутиною як джерело даних та не змінюються в процесі виконання рутини.
