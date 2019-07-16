# Array routines call conventions: callbacks

Як використовувати <code>callback</code>-и в рутинах сімейства <code>Array</code>.

На прикладі рутини `arrayCountElement`, котра виконує підрахунок кількості входжень указаного елемента в переданому масиві, буде показано як використовувати `callback`-и в рутинах сімейства `Array`.

Рутини, що використовують `callback`-и приймають до чотирьох аргументів. Серед яких:

- `srcArray` або `dstArray` - масив елементів, в якому ведеться пошук визначеного елемента;
- `element` - елемент для порівняння. Якщо рутина не має `callback`-ів, то значення `element` по черзі порівнюється зі значенням елементів масиву;
- `onEvaluate1` - `callback`, який може виконувати функції [еквалайзера](../concept/Equalizer.md) або [евалуатора](../concept/Evaluator.md);
- `onEvaluate2` - `callback`. При використанні евалуатора, що складається з двох частин в аргумент `onEvaluate1` передається рутина, що виконує операцію над елементом масиву, а в аргумент `onEvaluate2` - рутина, що перетворює аргумент `element` до потрібного вигляду.

Аргументи `srcArray` ( `dstArray` ) i `element` обов'язкові, а `onEvaluate1` i `onEvaluate2` використовуються опціонально. Якщо в рутину передається лише аргумент `onEvaluate1` - він може бути як еквалайзером, так і евалуатором, а якщо `onEvaluate1` i `onEvaluate2` - виключно частинами евалуатора.

### Використання `callback`-ів в рутинах `Array`

<details>
  <summary><u>Структура файлів</u></summary>

```
callbacks
    ├── ArrayCountElement.js
    └── package.json
```

</details>

Створіть приведену конфігурацію для дослідження `callback`-ів - еквалайзера та евалуатора.

Для використання рутини треба підключити модуль `Tools`. Скопіюйте приведений нижче код в файл `package.json`.

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

### Використання рутини без `callback`-ів

<details>
  <summary><u>Код при використанні рутини <code>ArrayCountElement.js</code> без <code>callback</code>-ів</u></summary>

```js
let arr1 = [ 1, 2, 'a', 'b', true, 6,  [ 1 ] ];
let elem1_1 = 1;
let elem1_2 = [ 1 ];

console.log( 'The number of elements 1 in the array arr1:' );
console.log( wTools.arrayCountElement( arr1, elem1_1 ) );
// returns 1
console.log( 'The number of elements [ 1 ] in the array arr1:' );
console.log( wTools.arrayCountElement( arr1, elem1_2 ) );
// returns 0
```

</details>

Прогляньте приведений вище код.

Змінна `arr1` позначає масив, в якому буде вестись пошук, в ньому сім елементів. Змінна `elem1` - елемент порівняння, має числове значення `1`. В масиві `arr1` є один елемент зі значенням `1`. Змінна `elem2` - другий елемент порівняння, це масив `[ 1 ]`. В масиві `arr1` також є елемент `[ 1 ]`, проте при строгому порівнянні складних типів вони не будуть однаковими, а тому результат - `0`.

### Використання еквалайзера в рутинах `Array`

<details>
  <summary><u>Код при використанні рутини <code>ArrayCountElement.js</code> з еквалайзером</u></summary>

```js
let arr2 = [ 'a', 4, 6, 1, 3, true, 'd', [ 'str' ] ];
let elem2_1 = 'str';
let elem2_2 = [ 'str' ];
let equalizer = ( elem, arrEl ) => typeof elem !== typeof arrEl;

console.log( "The number of elements 'str' in the array arr2:" );
console.log( wTools.arrayCountElement( arr2, elem2_1, equalizer ) );
// returns 6
console.log( "The number of elements [ 'str' ] in the array arr2:" );
console.log( wTools.arrayCountElement( arr2, elem2_2, equalizer ) );
// returns 7
```

</details>

Масив `arr2` складається з елементів різного типу. Якщо рутині передати тільки аргументи `arr2` i `elem2_1` чи `elem2_2`, то кількість входжень буде рівною нулю. Це викликано тим, що рутина безпосередньо порівнює значення елемента масиву і елементу для порівняння.

В еквалайзер завжди передається два аргумента. Перший з них - елемент для порівняння, а другий - елемент масиву. В коді еквалайзер має вигляд

```js
let equalizer = ( elem, arrEl ) => typeof elem !== typeof arrEl;
```
Вказана функція порівнює типи даних елемента порівняння і елементу масиву, лічильник рутини збільшується, якщо отримані значення не співпадають. Відповідно, в першому випадку еквалайзер поверне `true` для елементів, що не відносяться до типу `String`, а в другому - що не відносяться до типу `Object`.

### Використання евалуатора з однією функцією

<details>
  <summary><u>Код при використанні рутини <code>ArrayCountElement.js</code> з еквалайзером</u></summary>

```js
let arr3 = [ { v : 1 }, { v : 2 }, { v : 'str' }, { v : 2, e : 'str' } ];
let elem3 =  { v : 2 };
let evalutor = ( elem ) => elem.v;

console.log( "The number of elements with pair 'v : 2' in the array arr3:" );
console.log( wTools.arrayCountElement( arr3, elem3, evalutor ) );
// returns 2
```

</details>

Масив `arr3` містить чотири мапи. Пряме порівняння мап завжди повертає `false`, тому використовується евалуатор. Оскільки евалуатор має лише одну функцію, то вона по черзі застосовується до елементу масива та до елементу для порівняння. Якщо отримані значення співпадають, то евалуатор повертає `true`. Відповідно, приведений евалуатор

```js
let evalutor = ( elem ) => elem.v;
```

шукає однакові значення в мапах за ключем `v`. Масив `arr3` містить дві мапи з відповідними парами `ключ-значення`.

### Використання евалуатора з двома функціями

Якщо потрібно застосувати окремі перетворення до елементу порівняння та елементу масиву використовується евалуатор з двома окремими функціями.

<details>
  <summary><u>Код при використанні рутини <code>ArrayCountElement.js</code> з еквалайзером</u></summary>

```js
let arr4 = [ { v : 1 }, { v : 2 }, { v : 'str' }, { v : 2, e : 'str' } ];
let elem4 =  'str';
let evalutor1 = ( arrEl ) => arrEl.v;
let evalutor2 = ( elem ) => elem;

console.log( "The number of elements, which has value 'str' in the array arr4:" );
console.log( wTools.arrayCountElement( arr3, elem4, evalutor1, evalutor2 ) );
// returns 1
```

</details>

Масив `arr4` складається з чотирьох мап. Тож, порівняння `elem4`, що має тип `String` з елементами масиву не поверне жодного результату `true`. Застосування евалуатора з однією функцією матиме такий же результат оскільки буде перетворено і елемент масиву, і елемент для порівняння. Тому, використовується евалуатор з двома функціями.

Перша застосовується до елементу масиву

```js
let evalutor1 = ( arrEl ) => arrEl.v;
```

Тобто, шукає значення елементів мапи за ключем `v`.

Друга вказує як має бути перетворений елемент порівняння

```js
let evalutor2 = ( elem ) => elem;
```

Дана функція не змінює форми елемента порівняння.

Таким чином, рутина `arrayCountElement` має знайти одне включення в масиві `arr4`.

### Виконання файла

<details>
  <summary><u>Код файла <code>ArrayCountElement.js</code></u></summary>

```js
require( 'wTools' );

// without equalizer or evalutor

let arr1 = [ 1, 2, 'a', 'b', true, 6,  [ 1 ] ];
let elem1_1 = 1;
let elem1_2 = [ 1 ];

console.log( 'The number of element 1 in the array arr1:' );
console.log( wTools.arrayCountElement( arr1, elem1_1 ) );
// returns 1
console.log( 'The number of element [ 1 ] in the array arr1:' );
console.log( wTools.arrayCountElement( arr1, elem1_2 ) );
// returns 0

// with equilizer

let arr2 = [ 'a', 4, 6, 1, 3, true, 'd', [ 'str' ] ];
let elem2_1 = 'str';
let elem2_2 = [ 'str' ];
let equalizer = ( elem, arrEl ) => typeof elem !== typeof arrEl;

console.log( "The number of element 'str' in the array arr2:" );
console.log( wTools.arrayCountElement( arr2, elem2_1, equalizer ) );
// returns 6
console.log( "The number of element [ 'str' ] in the array arr2:" );
console.log( wTools.arrayCountElement( arr2, elem2_2, equalizer ) );
// returns 7

// with evalutor, one function

let arr3 = [ { v : 1 }, { v : 2 }, { v : 'str' }, { v : 2, e : 'str' } ];
let elem3 =  { v : 2 };
let evalutor = ( elem ) => elem.v;

console.log( "The number of elements with pair 'v : 2' in the array arr3:" );
console.log( wTools.arrayCountElement( arr3, elem3, evalutor ) );

// with evalutor, one function

let arr4 = [ { v : 1 }, { v : 2 }, { v : 'str' }, { v : 2, e : 'str' } ];
let elem4 =  'str';
let evalutor1 = ( arrEl ) => arrEl.v;
let evalutor2 = ( elem ) => elem;

console.log( "The number of elements, which has value 'str' in the array arr4:" );
console.log( wTools.arrayCountElement( arr3, elem4, evalutor1, evalutor2 ) );
// returns 1
```

</details>

Внесіть приведений вище код в файл `ArrayCountElement.js`.

Для того, щоб перевірити роботу рутини запустіть виконання файла в інтерпретаторі `NodeJS`.

<details>
  <summary><u>Вивід команди <code>node ArrayCountElement.js</code></u></summary>

```
[user@user ~]$ node ArrayCountElement.js
The number of element 1 in the array arr1:
1
The number of element [ 1 ] in the array arr1:
0
The number of element 'str' in the array arr2:
6
The number of element [ 'str' ] in the array arr2:
7
The number of elements with pair 'v : 2' in the array arr3:
2
The number of elements, which has value 'str' in the array arr4:
1
```

</details>

Виконайте команду `node ArrayCountElement.js` в директорії модуля та порівняйте вивід консолі.

Указаний вивід підтверджує, що описана функціональність еквалайзера і евалуаторів дозволяє вибирати з масиву потрібні елементи.

### Підсумок

- Рутини `Array` можна запустити лише з двома аргументами - масивом і елементом за яким здійснюється вибірка.
- Рутини `Array` приймають чотири аргумента. Два обов'язкових - масив і елемент для порівняння, та два за необхідністю - `callback`-и для фільтрування елементів з масиву.
- Рутини `Array` приймають два вида `callback`-ів - евалуатор і еквалайзер.
- Еквалайзер використовуєтся, якщо потрібно довільним чином порівняти елемент масиву і елементу для порівняння. Якщо умова виконується, то еквалайзер повертає `true` і елемент з масиву входить в вибірку, інакше `false` і елемент пропускається.
- В рутинах `Array` використовуються евалуатори. Евалуатор може складатись з однієї обо двох функцій.
- Евалуатор з однією функцією порівнює результат виконання однієї функції над елементом масиву і елементом для порівняння. Якщо результат співпадає, евалуатор повертає `true`, якщо ні - `false`.
- Евалуатор з двома функціями має окремі функції для елемента масива і елемента для порівняння. Результати виконання функцій порівнюються, якщо результати співпадають, евалуатор повертає `true`, якщо ні - `false`.

[Повернутись до змісту](../README.md#Туторіали)
