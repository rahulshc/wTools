# Впорядковані типи даних

Комплексні типи даних, що містять множину елементів котрі ідентифікуються за індексом.

### Перелік масивоподібних типів

`Array` - тип даних, структура якого складається з послідовності елементів, котрі ідентифікуються за індексом ( індексами ).

```js
let array1 = [ 1, 2, 'str' ];
let array2 = new Array( [ 1, 2, 'str' ] );
console.log( _.arrayIs( array1 ) ); // true
console.log( _.arrayIs( array2 ) ); // true
```

`Unroll` - особливий масивоподібний тип даних, що здатний розгортатись в іншому масиві, анролі чи елементі типу `ArgumentsArray`.

```js
let unroll1 = _.unrollMake( [ 1, 2, 'str' ] );
let unroll2 = _.unrollsFrom( [ 1, 2, 'str' ] );
console.log( _.unrollIs( unroll1 ) ); // true
console.log( _.arrayIs( unroll1 ) ); // false
console.log( _.unrollIs( unroll2 ) ); // true
```

`ArgumentsArray` - незалежний масивоподібний тип даних, що позначає вхідні дані рутини, як і тип `Unroll` може розгортатись в інших масивах та анролах.

```js
let argumentsArray1 = _.argumentsArrayMake( [ 1, 2, 'str' ] );
let argumentsArray2 = _.argumentsArrayFrom( [ 1, 2, 'str' ] );
console.log( _.argumentsArrayIs( argumentsArray1 ) ); // true
console.log( _.arrayIs( argumentsArray1 ) ); // false
console.log( _.argumentsArrayIs( argumentsArray2 ) ); // true
```

`Long` - збірний тип, що збирає в собі всі інші типи, властивостями котрих є  довжина і елементи. Включає: `Array`, `Unroll`, `ArgumentsArray`, `BufferTyped`.

```js
let array = [ 1, 2, 'str' ];
let unroll = _.unrollMake( [ 1, 2, 'str' ] );
let argumentsArray = _.argumentsArrayFrom( [ 1, 2, 'str' ] );
let bufferTyped = new U8x( 10 );
console.log( _.longIs( array ) ); // true
console.log( _.longIs( unroll ) ); // true
console.log( _.longIs( argumentsArray ) ); // true
console.log( _.longIs( bufferTyped ) ); // true
```

### Перелік буферів

`BufferRaw` - послідовність сирих двійкових даних для представлення іншими буферами. Двійкові дані в буферi `BufferRaw` зберігаються в байтах. Тип `BufferRaw` включає буфери: `ArrayBuffer`, `SharedArrayBuffer`.

```js
let arrayBuffer = new ArrayBuffer( 10 );
let sharedArrayBuffer = new SharedArrayBuffer( 10 ) );
console.log( _.bufferRawIs( arrayBuffer ) ); // true
console.log( _.bufferRawIs( sharedArrayBuffer ) ); // true
```

`BufferView` - буфер для представлення даних буферу `BufferRaw`, який не містить елементів. Може змінювати представлення динамічно - для того щоб по-різному інтерпретувати одні й ті ж дані достатньо використати інший метод доступу.

```js
let buffer = new ArrayBuffer( 20 );
let bufferView = new DataView( buffer );
console.log( _.bufferRawIs( buffer ) ); // true
console.log( _.bufferViewIs( bufferView ) ); // true
console.log( _.bufferViewIs( buffer ) ); // false
```

`BufferNode` - буфер інтерпретатора `NodeJS`. Подібно буферу `BufferView` не має визначених елементів та використовується для динамічного представлення двійкових даних. Одночасно з цим має властивості `BufferTyped` i `BufferRaw`.

```js
let bufferNode2 = Buffer.alloc( 20 );
let bufferNode2 = Buffer.from( [ 1, 2 ] );
console.log( _.bufferNodeIs( bufferNode1 ) ); // true
console.log( _.bufferNodeIs( bufferNode2 ) ); // true
```

`BufferTyped` - збірний тип даних, що збирає в собі сукупність типів для представлення послідовності двійкових даних у обраному числовому форматі - у вигляді беззнакових чисел, чисел зі знаком, та чисел з плаваючою комою. Включає наступні типи: `U32x`, `U16x`, `U8x`, `U8ClampedArrayx`, `Ux`, `I32x`, `I16x`, `I8x`, `Ix`, `F64x`, `F32x`, `Fx`.

`BufferBytes` - альтернативна назва для типізованого буферу `U8x`. Конструктора на має.

`BufferAny` - збірний тип, що збирає в собі всі типи `Buffer*` включно із типами, які не є підтипами `Long`. Включає: `BufferNode`, `BufferRaw`, `BufferView`, `BufferTyped`.

```js
let bufferRaw = new ArrayBuffer( 20 );
let bufferView = new DataView( bufferRaw );
let bufferNode = Buffer.alloc( 100 );
let bufferTyped = new U8x( bufferRaw );
console.log( _.bufferAnyIs( bufferRaw ) ); // true
console.log( _.bufferAnyIs( bufferView ) ); // true
console.log( _.bufferAnyIs( bufferNode ) ); // true
console.log( _.bufferAnyIs( bufferTyped ) ); // true
```

### Типізовані буфери

- `U32x` - представлення буферу `BufferRaw` у вигляді послідовності 4-байтних беззнакових чисел.
- `U16x` - представлення буферу `BufferRaw` у вигляді послідовності 2-байтних беззнакових чисел.
- `U8x` - представлення буферу `BufferRaw` у вигляді послідовності 1-байтних беззнакових чисел
- `U8ClampedX` - представлення буферу `BufferRaw` у вигляді послідовності 1-байтних беззнакових чисел. Значення передані в буфер обмежені значеннями від 0 до 255.
- `Ux` - альтернативний тип даних для `U32x`.
- `I32x` - представлення буферу `BufferRaw` у вигляді послідовності 4-байтних чисел зі знаком.
- `I16x` - представлення буферу `BufferRaw` у вигляді послідовності 2-байтних чисел зі знаком.
- `I8x` - представлення буферу `BufferRaw` у вигляді послідовності 1-байтних чисел зі знаком.
- `Ix` - альтернативний тип даних для `І32x`.
- `F64x` - представлення буферу `BufferRaw` у вигляді послідовності 8-байтних чисел з плаваючою комою.
- `F32x` - представлення буферу `BufferRaw` у вигляді послідовності 4-байтних чисел з плаваючою комою.
- `Fx` - альтернативний тип даних для `F32x`.

```js
let u32x = new U32x( [ 1, 2, 100 ] );
let i16x = new I16x( [ 1, 2, 15 ] );
let f32x = new Fx( [ 1, 2, 34 ] );
console.log( _.bufferTypedIs( u32x ) ); // true
console.log( _.bufferTypedIs( I16x ) ); // true
console.log( _.bufferTypedIs( Fx ) ); // true
```

[Повернутись до змісту](../README.md#Концепції)
