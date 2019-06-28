# Рутина routineFromPreAndBody

Автоматичне об'єднання рутини підготовки даних і рутини для їх обробки.

Рутина `routineFromPreAndBody` повертає рутину складену з двох інших - `pre` i `body`.

Рутина `pre` призначена для підготовки [мапи опцій](../concept/MapOptions.md), котра передається в рутину `body`. В рутині `body` виконується обробка даних, вона приймає мапу опцій. Із мапою опцій працювати зручніше ніж із масивом аргументів так як кожна опція мапи опцій має ім'я, тоді як в масиві аргументів ідентифікації опції здійснюється по порядковому номеру, всі опції мають йти в такому масиві послідовно тому передача значень по замовчуванню ускладнюється.

Таке розділення функцій зручне з декількох сторін:

- кожна з рутин забезпечує виконання лише однієї функціональності;
- в рутині `pre` виконується підготовка мапи опцій, зокрема перевірка наявності зайвих або відсутність неопціональних опцій;
- рутина `pre` можливо повторно використати в подібних рутина рутинах;
- зміною опцій за замовчуванням можливо створити нові рутини на основі рутини `body`;
- поведінка рутини `body` може сильно залежати від мапи опцій підготовленої в рутині `pre`;

### Створення рутин з допомогою `routineFromPreAndBody`

<details>
  <summary><u>Структура модуля</u></summary>

```
routineFromPreAndBody
        ├── Name.js
        └── package.json
```

</details>

Створіть приведену конфігурацію файлів для дослідження рутини `routineFromPreAndBody`.

<details>
  <summary><u>Рутини <code>name_pre</code> i <code>name_body</code> в файлі <code>Name.js</code></u></summary>

```js
function name_pre( routine, args )
{
  let o = args[ 0 ];
  if( _.strIs( o ) )
  o = { path : o };

  _.routineOptions( routine, o );
  _.assert( o && _.strIs( o.path ), 'Expects strings {-o.path-}' );
  _.assert( args.length === 1 );
  _.assert( arguments.length === 2 );

  return o;
}

function name_body( o )
{
  let i = o.path.lastIndexOf( '/' );
  if( i !== -1 )
  o.path = o.path.substr( i+1 );

  if( !o.full )
  {
    let i = o.path.lastIndexOf( '.' );
    if( i !== -1 ) o.path = o.path.substr( 0, i );
  }

  return o.path;
}

name_body.defaults =
{
  path : null,
  full : 0,
}
```

</details>

Прогляньте код рутин `name_pre` i `name_body`.

Як вже вказувалось, рутина `pre` готує мапу опцій для рутини `body`. Одним аргументом їй передається `routine` - поточна рутина, її налаштування, а другим - масив аргументів `args`. В рутині `name_pre` приймається тільки один аргумент, котрий одразу поміщається в мапу опцій за ключем `path`

```js
let o = args[ 0 ];
if( _.strIs( o ) )
o = { path : o };
```

Для кожної рутини, що будується з допомогою `routineFromPreAndBody` встановлюються опції за замовчуванням, котрі поміщені в рутину `body`. Щоб мапа опцій, котра створюється рутиною `name_pre` містила налаштування з рутини `name_body`, використовується рутина `routineOptions`. Рутина `routineOptions` перевіряє мапу опцій створену з аргументів `args` і за необхідності додає опції з налаштувань за замовчуванням `name_body.defaults`.

Ще однією важливою складовою рутини `pre` є ассерти. Ассерти перевіряють вхідні дані, щоб сформована мапа опцій містила коректні значення. Наприклад, ассерт

```js
_.assert( args.length === 1 );
```

перевіряє, що переданий масив аргументів `args` містить тільки один елемент. Якщо значення відрізнятиметься від `1`, то рутина завершить своє виконання, викинувши помилку.

Рутина `name_body` складається з двох частин - власне рутини і її налаштувань. Рутина `name_body` приймає мапу опцій та повертає ім'я файла з переданого їй шляху. Для коректного виводу, шлях повинен формуватись в форматі `posix`-систем, тобто, зі звичайним слешем `/` ( перетворення шляхів тут не розглядається ). З допомогою методу `substr` рутина виділяє повне ім'я від останнього символу `/` до кінця рядка. Крім цього, в тілі рутини використовується опція `full`, якщо вона не встановлена, то з повної назви виділяється назва до останнього розширення.

В налаштуваннях за замовчуванням - мапі опцій `name_body.defaults` - вказуються всі опції, що приймає рутина. Для рутини `name_body` це `path` i `full`.

Рутина `routineFromPreAndBody` може об'єднати рутини `name_pre` i `name_body` в одну, котра буде приймати шлях, а повертати ім'я файла.

<details>
  <summary><u>Код файла <code>Name.js</code></u></summary>

```js
let _ = require( 'wTools' );

//

function name_pre( routine, args )
{
  let o = args[ 0 ];
  if( _.strIs( o ) )
  o = { path : o };

  _.routineOptions( routine, o );
  _.assert( o && _.strIs( o.path ), 'Expects strings {-o.path-}' );
  _.assert( args.length === 1 );
  _.assert( arguments.length === 2 );

  return o;
}

function name_body( o )
{
  let i = o.path.lastIndexOf( '/' );
  if( i !== -1 )
  o.path = o.path.substr( i+1 );

  if( !o.full )
  {
    let i = o.path.lastIndexOf( '.' );
    if( i !== -1 ) o.path = o.path.substr( 0, i );
  }

  return o.path;
}

name_body.defaults =
{
  path : null,
  full : 0,
}

let name = _.routineFromPreAndBody( name_pre, name_body );

let nameFull = _.routineFromPreAndBody( name_pre, name_body );
nameFull.defaults.full = 1;

console.log( name( './a/b/c/File.js' ) );
console.log( nameFull( './a/b/c/File.js' ) );
```

</details>

Внесіть в файл `Name.js` код, що приведений вище.

Для використання рутини `routineFromPreAndBody` треба підключити модуль `Tools`. Скопіюйте приведений нижче код в файл `package.json`.

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

В кінці коду файла `Name.js`, ви знайдете рядки з об'явленням рутин `name` i `nameFull`. Вони вказуються як звичайні змінні, яким присвоєно результат виконання рутини `routineFromPreAndBody`:

```js
let name = _.routineFromPreAndBody( name_pre, name_body );

let nameFull = _.routineFromPreAndBody( name_pre, name_body );
```

Рутина `routineFromPreAndBody` першим аргументом приймає рутину `pre`, а другим - `body`.

Рутина `name` використовує налаштування за замовчуванням, що встановлені в рутині `name_body`, тому вона не перевизначає опції. Рутина `nameFull` повинна повертати повне ім'я файла, тому в ній потрібно встановити опцію `full`:

```js
nameFull.defaults.full = 1;
```

Рядки з виводом в консоль, наприклад, `console.log( name( './a/b/c/File.js' ) )`, показують, що для виклику рутин утворених рутиною `routineFromPreAndBody` потрібно указати назву змінної і в дужках передати аргументи.

Запустіть виконання файла `Name.js` в інтерпретаторі `NodeJS`, для цього введіть команду `node Name.js`. Порівняйте вивід з приведеним:

<details>
  <summary><u>Вивід команди <code>node Name.js</code></u></summary>

```
[user@user ~]$ node Name.js
File
File.js
```

</details>

Рутини `name` i `nameFull` виконали операції з рядком `./a/b/c/File.js`, виділивши ім'я файлу. Кожна з указаних рутин має власну реалізацію зі складових `pre` i `body`. Тобто, рутини незалежні одна від одної, а тому вони більш надійні.

### Назва і звернення до рутини утвореної `routineFromPreAndBody`

З попереднього прикладу очевидно, що звернення до рутини, утвореної з допомогою `routineFromPreAndBody`, здійснюється за назвою змінної. Тим не менше, назва рутини формується по-іншому. За замовчуванням назва утвореної рутини визначається назвою другого аргументу, тобто, аргументу `body`. Якщо в назві цієї рутини міститься приставка `_body`, то вона відкидається.

Замініть останні два рядки файла `Name.js` на приведений:

```js
console.log( nameFull.name );
```

Після збереження файла, повторіть ввід команди `node Name.js`.

<details>
  <summary><u>Вивід команди <code>node Name.js</code></u></summary>

```
[user@user ~]$ node Name.js
name
```

</details>

В консолі з'явився рядок, що утворений відкиданням приставки з `name_body`. Якщо в коді важливо, щоб назва створеної рутини і її фактичний виклик збігались, то в рутину `routineFromPreAndBody` можна передати третій аргумент - назву рутини.

Замініть рядок

```js
let nameFull = _.routineFromPreAndBody( name_pre, name_body);
```

на

```js
let nameFull = _.routineFromPreAndBody( name_pre, name_body, 'nameFull' );
```

Після збереження файла, запустіть виконання файла `Name.js`. Звірте вивід консолі з приведеним

<details>
  <summary><u>Вивід команди <code>node Name.js</code></u></summary>

```
[user@user ~]$ node Name.js
nameFull
```

</details>

Тепер ім'я рутини і змінна, якою вона позначена, збігаються. Це дозволить уникнути помилок в коді, що використовує назву рутини.

### Підсумок

- Рутина `routineFromPreAndBody` повертає рутину, що утворюється з двох складових - рутини для підготовки мапи опцій `pre` та рутини для обробки мапи опцій - `body`.
- Розділення функцій підвищує надійність і безпеку використання створеної рутини.
- Рутина `routineFromPreAndBody` полегшує процес розширення функціоналу.
- Рутина `routineFromPreAndBody` дозволяє багатократно використовувати код.
- Назва новоутвореної рутини формується за назвою рутини з аргумента `body`, або може бути передана третім аргументом в рутину `routineFromPreAndBody`.

[Повернутись до змісту](../README.md#Туторіали)
