# Конвенції рутин _.array*: callbacks

Як використовувати <code>callback</code>-и в рутинах сімейства <code>Array</code>.

Рутини `array*` приймають до п'яти аргументів:

- `srcArray` або `dstArray` - оброблюваний масив;
- `element` - елемент для порівняння;
- `offset` - числове значення зміщення ( початкового індексу ) масиву. Використовується як з `callback`-ами так без.
- `onEvaluate1` - `callback`, який може виконувати функції [еквалайзера](../concept/Equalizer.md) або [евалуатора](../concept/Evaluator.md);
- `onEvaluate2` - `callback`. При використанні евалуатора, що складається з двох частин в аргумент `onEvaluate1` передається рутина, що виконує операцію над елементом масиву, а в аргумент `onEvaluate2` - рутина, що перетворює аргумент `element` до потрібного вигляду.

Аргументи `srcArray` ( `dstArray` ) i `element` - обов'язкові, а `offset`, `onEvaluate1` i `onEvaluate2` використовуються опціонально.

### Виклик без `callback`-ів

```js
let arr = [ 1, 2, 'a', 'b', true, 6,  [ 1 ] ];
let result = _.longCountElement( arr, 1 );
console.log( `The number of elements 1 : ${ result }` );
// log : The number of elements 1 : 1
```

Рутина `longCountElement` знайшла одне включення примітиву `1`.

```js
let arr = [ 1, 2, 'a', 'b', true, 6,  [ 1 ] ];
let result = _.longCountElement( arr, [ 1 ] );
console.log( `The number of elements [ 1 ] : ${ result }` );
// log : The number of elements [ 1 ] : 0
```

Комплексні типи даних при однаковій формі запису - різні сутності, тому рутина при пошуку не знайшла масив `[ 1 ]` в масиві `arr`. Для порівняння комплексних типів даних використовуються колбеки.

### Виклик з еквалайзером

```js
let arr = [ 1, 2, 'a', 'b', true, 6,  [ 1 ] ];
let equalizer = ( elem, arrEl ) => elem[ 0 ] === arrEl[ 0 ];
let result = _.longCountElement( arr, [ 1 ], equalizer );
console.log( `The number of elements [ 1 ] : ${ result }` );
// log : The number of elements [ 1 ] : 1
```

В еквалайзер завжди передається два аргумента: елемент для порівняння та поточний елемент масиву. Указаний еквалайзер `equalizer` порівнює перший елемент масиву `[ 1 ]` та поточний елемент масиву `arr`, при співпадінні значень колбек повертає `true` i значення лічильника збільшується. В масиві `arr` знайдено один масив в якому за індексом `0` знаходиться значення `1`.

### Використання евалуатора з однією функцією

```js
let arr = [ { v : 1 }, { v : 2 }, { v : 'str' }, { v : 2, e : 'str' } ];
let evalutor = ( elem ) => elem.v;
let result = _.longCountElement( arr3, { v : 2 }, evalutor ) );
console.log( `The number of elements with pair 'v : 2' : ${ result }` );
// log : The number of elements with pair 'v : 2' : 2
```

Евалуатор має лише одну функцію, вона по черзі застосовується до елементу масива та до елементу для порівняння. Якщо отримані значення співпадають, то евалуатор повертає `true`. Відповідно, приведений евалуатор шукає однакові значення в мапах за ключем `v`. Масив `arr` містить дві мапи з відповідними парами `ключ-значення`.

### Використання евалуатора з двома функціями

```js
let arr = [ { v : 1 }, { v : 2 }, { v : 'str' }, { v : 2, e : 'str' } ];
let evalutor1 = ( arrEl ) => arrEl.v;
let evalutor2 = ( elem ) => elem;
let result = _.longCountElement( arr, 'str', evalutor1, evalutor2 ) );
console.log( `The number of elements with pair "v : 'str'" : ${ result }` );
//  log : The number of elements with pair "v : 'str'" : 1
```

Перший евалуатор `evalutor1` застосовується до елемента масива, а другий - `evalutor2` - до елемента для порівняння. Використання двох окремих колбеків може спростити обробку елементів, що потребують перетворень.
В приведеному масиві знайдено лише одну мапу що містить пару `v : 'str'`.

### Виклик рутини з заданим зміщенням

```js
let arr = [ 1, 1, 'a', 'b', true, 6,  [ 1 ] ];
let result = _.longCountElement( arr, 1, 2 );
console.log( `The number of elements 1 : ${ result }` );
// log : The number of elements 1 : 0
```

Рутина `longCountElement` не знайшла жодного числа `1`, бо пошук ведеться починаючи з індекса `2`. Індекс задано третім аргументом. Після указання зміщення можна передати колбеки `equalizer` або `evalutor`-и.

```js
let arr = [ 1, [ 1 ], 'a', 'b', true, 6,  [ 1 ] ];
let equalizer = ( elem, arrEl ) => elem === arrEl[ 0 ];
let result = _.longCountElement( arr, 1, 2, equalizer );
console.log( `The number of elements 1 : ${ result }` );
// log : The number of elements 1 : 1
```

Використовуючи колбек `equalizer`, рутина `longCountElement` знайшла один масив, першим елементом якого є `1`.

### Підсумок

- Рутини `_.array*` можна запустити лише з двома аргументами - масивом і елементом за яким здійснюється вибірка.
- Рутини `_.array*` приймають два вида `callback`-ів - евалуатор і еквалайзер.
- Еквалайзер використовуєтся, якщо потрібно довільним чином порівняти елемент масиву і елементу для порівняння. Якщо умова виконується, то еквалайзер повертає `true` і елемент з масиву входить в вибірку, інакше `false` і елемент пропускається.
- Евалуатор - це рутина або пара рутин, які дозволяють довільним чином перетворити елементи масиву перед їх порівнянням. Якщо результат співпадає, евалуатор повертає `true`, якщо ні - `false`.

[Повернутись до змісту](../README.md#Туторіали)
