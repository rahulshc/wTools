# Векторизація рутин

Як використовувати рутину <code>vectorize</code> для векторизації скалярних рутин.

Рутини, що здійснюють операції зі скалярними даними можна автоматично векторизувати з допомогою рутини `vectorize`. Векторизована рутина може оброблювати передані дані в вигляді [векторів](../concept/Vector.md).

<details>
  <summary><u>Структура файлів</u></summary>

```
vectorize
   ├── Sum.js
   └── package.json

```

</details>

Створіть приведену конфігурацію для дослідження векторизації скалярних рутин з допомогою `vectorize`.

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

Рутина `vectorize` належить до модуля `Tools`. Скопіюйте приведений вище код в файл `package.json` та встановіть залежності з допомогою команди `npm install`. Після встановлення залежностей модуль буде готовий до роботи.

### Векторизація рутини з налаштуваннями за замовчуванням

Для демонстрації можливості рутини `vectorize` розв'яжемо задачу. Потрібно попарно просумувати числа з двох векторів. Припустимо, що реалізація для сумування скалярних величин вже існує:

```js
function sum( a, b )
{
  return Number( a ) + Number( b );
}
```

Код рутини `sum` показує, що вона повертає суму двох чисел, а при передачі інших типів даних, в тому числі, векторів даних - `NaN`.

<details>
  <summary><u>Код файла <code>Sum.js</code></u></summary>

```js
let _ = require( 'wTools' );

function sum( a, b )
{
  return Number( a ) + Number( b );
}

let a = [ 1, 3, 4, 6, 9 ];
let b = [ 4, 1, 0, 7, 3 ];

// routine vectorize() is no used
function sum_v1( a, b )
{
  let result = [];
  for( let i = 0; i < a.length; i++ )
  {
    result[ i ] = sum( a[ i ], b[ i ] );
  }
  return result;
}

// use routine vectorize()
let sum_v2 = _.vectorize( sum, 2 );

// log results

console.log( sum_v1( a, b ) );
console.log( sum_v2( a, b ) );
```

</details>

Внесіть приведений код в файл `Sum.js`.
