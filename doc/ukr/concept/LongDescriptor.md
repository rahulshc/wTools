# Дескриптор типу <code>longDescriptor</code> і дефолтний <code>long</code> тип

<code>longDescriptor</code> - дескриптор, що визначає тип контейнеру при створенні лонгу, якщо тип не вказано явно.

### Дескриптори

Доступні дескриптори зберігаються в мапі `LongDescriptors`. До них належать:

- `Array` - дескриптор за замовчуванням, створює масиви.
- `Unroll` - створення `unroll` масивів.
- `ArgumentsArray` - створення типу `ArgumentsArray`.
- `U8x` - створення типізованого буферу `Uint8Array`.
- `U16x` - створення типізованого буферу `Uint16Array`.
- `U32x` - створення типізованого буферу `Uint32Array`.
- `Ux` - створення типізованого буферу `Uint32Array`.
- `I8x` - створення типізованого буферу `Int8Array`.
- `I16x` - створення типізованого буферу `Int16Array`.
- `I32x` - створення типізованого буферу `Int32Array`.
- `Ix` - створення типізованого буферу `Int32Array`.
- `F32x` - створення типізованого буферу `Float32Array`.
- `F64x` - створення типізованого буферу `Float64Array`.
- `Fx` - створення типізованого буферу `Float32Array`.

### Збірний тип `long` і створення `long`-контейнеру

Модуль містить [збірний тип `long`]( './TypeIndexed.md' ) та рутини, що працюють з цим типом. Назва таких рутин починається з `long`. Більшість вказаних рутин при обробці `long`-у не змінює тип контейнеру. Виключення становить тип `ArgumentsArray`, котрий завжди перетворюється на інший тип. Новий тип контейнеру, визначає дескриптор `longDescriptor`.

```js
var argumentsArray = _.argumentsArrayMake( [ 1, 2, 3 ] );
_.argumentsArrayIs( argumentsArray ); // returns true
var newContainer = _.longMake( argumentsArray, 2 );
_.argumentsArrayIs( newContainer ); // returns false
_.arrayIs( newContainer ); // returns true
```

В останньому рядку перевіряється чи являється отриманий контейнер масивом. Перевірка проходить, бо дефолтний дескриптор - `Array`. Тобто, створюється звичайний масив. Для того, щоб змінити тип дескриптору на інший використовується спеціальне поле `withDefaultLong`.

```js
var argumentsArray = _.argumentsArrayMake( [ 1, 2, 3 ] );
var newContainer = _.withDefaultLong.U8x.longMake( argumentsArray, 2 );
_.argumentsArrayIs( newContainer ); // returns false
_.BufferTypedIs( newContainer ); // returns true
```

Повний виклик з позначенням дескриптору виглядає як приведено вище: `wTools.withDefaultLong.[ name of descriptor ].routine( [ arguments ] )`. 

Зміна типу контейнеру також можлива, якщо рутині явно не вказано тип вихідного контейнеру. Наприклад, рутина `longMake` приймає два параметри. Перший - тип контейнеру і вміст, другий довжину. Якщо передано лише один аргумент, то тип задається через `longDescriptor`

```js
var u8x = new U8x( [ 1, 2, 3 ] );
var newContainer1 = _.longMake( u8x );
_.bufferTypedIs( newContainer1 ); // returns false
_.arrayIs( newContainer1 ); // returns true

var i16x = new I16x( [ 1, 2, 3 ] );
var newContainer2 = _.longMake( i16x, 2 );
_.bufferTypedIs( newContainer2 ); // returns true
_.arrayIs( newContainer2 ); // returns false
```

В першому випадку рутина `longMake` не могла визначити тип вихідного масиву, тому створила дефолтний. В другому випадку тип вихідного контейнеру указаний явно.

### Підсумок

- `longDescriptor` - дескриптор типу для створення нового `long`-контейнеру.
- Рутини створюють новий контейнеру з типом визначеним в `longDescriptor` якщо рутина не може визначити тип вихідного контейнеру.
- Рутини створюють новий контейнеру з типом визначеним в `longDescriptor` якщо рутина приймає аргументом `ArgumentsArray` контейнер.

[Повернутись до змісту](../README.md#Концепції)

