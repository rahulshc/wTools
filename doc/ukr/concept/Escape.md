# Ескейпінг

Ескейпінг - процес маскування певного значення. Реалізується рутинами і засобами, щоб вирішити проблему обмеженості значень.
Неймспейс <code>_.escape</code> містить засоби для створення, перевірки та маніпулювання таких значень.

### Приклад - створення копії масиву із замаскованими елементами
```
let _ = require( '../..' );

function makeEscapedCopy( arr )
{
  let copy = new Array( arr.length );

  for( let i = 0; i < arr.length; i++ )
  {
    copy[ i ] = _.escape.make( arr[ i ] );
  }

  return copy;
}


let arr1 = [ 1, 2, 3, '4', '5' ];
let arr2 = makeEscapedCopy( arr1 );
let arr3 = arr2.map( ( el ) => _.escape.right( el ) );

console.log( arr1 );
/* log : [ 1, 2, 3, '4', '5' ] */

console.log( arr2 );
/* log : [ Escape( 1 ), Escape( 2 ), Escape( 3 ), Escape( 4 ), Escape( 5 ) ] */

console.log( arr3 );
/* log : [ 1, 2, 3, '4', '5' ] */

```

### Приклад - додавання константного поля об'єкту.
```
let _ = require( '../..' );

/*
null serves as an identifier, that we should not change object property's value, but make it constant.
*/

function objectSetValue( object, field, value )
{
  if( _.escape.is( value ) )
  {
    Object.defineProperty
    (
      object,
      field,
      {
        enumerable : true,
        configurable : false,
        writable : false,
        value : _.escape.right( value )
      }
    );
  }
  else if( value === null )
  {
    Object.defineProperty
    (
      object,
      field,
      {
        enumerable : true,
        configurable : false,
        writable : false,
        value : object[ field ]
      }
    );
  }
  else
  {
    Object.defineProperty
    (
      object,
      field,
      {
        enumerable : true,
        configurable : false,
        writable : false,
        value
      }
    );
  }
  return object;
}

var src = { 'fieldToBeRemained' : 1 };
objectSetValue( src, 'fieldToBeRemained', null );
console.log( 'src1 : ', Object.getOwnPropertyDescriptors( src ) );
/*
log :

src1 :
{
  fieldToBeRemained:
  {
    value: 1,
    writable: false,
    enumerable: true,
    configurable: false
  }
}
*/

var src2 = { 'fieldToBeChanged' : 1 };
objectSetValue( src2, 'fieldToBeChanged', 'changed' );
console.log( 'src2 : ', Object.getOwnPropertyDescriptors( src2 ) );
/*
log :

src1 :
{
  fieldToBeChanged:
  {
    value: 'changed',
    writable: false,
    enumerable: true,
    configurable: false
  }
}
*/

var src3 = { 'fieldToBeChangedWithNull' : 1 };
objectSetValue( src3, 'fieldToBeChangedWithNull', _.escape.make( null ) );
console.log( 'src3 : ', Object.getOwnPropertyDescriptors( src3 ) );
/*
log :

src1 :
{
  fieldToBeChangedWithNull:
  {
    value: null,
    writable: false,
    enumerable: true,
    configurable: false
  }
}
*/

```

<!-- ### Рутина `_.escape.make` використовується для cтворення обгортки зі значенням.
```
var left = _.escape.make( null );
console.log( left.val === null );
/* log : true */

var left = _.escape.make( 12 );
console.log( left.val === 12 );
/* log : true */
```

### Рутина `_.escape.left` використовується для cтворення обгортки для спеціальних значень : <code>null</code>, <code>undefined</code>, <code>_.nothing</code>.
Виклик з не спеціальним значенням повертає вхідне значення.
```
var left = _.escape.left( null );
console.log( left === _.null );
/* log : true */

var left = _.escape.left( undefined );
console.log( left === _.undefined );
/* log : true */

var left = _.escape.left( _.nothing );
console.log( left === _.escape.nothing );
/* log : true */

var left = _.escape.left( 1 );
console.log( left === 1 );
/* log : true */

```

## Приклад задачі, яка вирішується ескейпінгом
Існує об'єкт з певними полями. Задача - додати поле константу з певним значенням або зробити константним існуюче поле.<br>
Рутина, що використовується для вирішення задачі має 3 аргументи :<br>
- Об'єкт - вхідний об'єкт, що буде модифікуватися. ( Тип - <code>Object</code> )
- Поле - назва поля, що буде модифікуватися. ( Тип - <code>String</code> )
- Значення - значення, яке буде присвоєне полю. ( Тип - будь-який )

### Варіанти :
Рутина, яка вирішує таку задачу, має розрізняти перший і другий варіант на основі параметру.<br>

1. Поле існує, потрібно переписати новим значення та зробити константою.
2. Поле існує, потрібно залишити значення та зробити поле константою.
3. Поля не існує, потрібно присвоїти значення та зробити поле константою.

### Можливі декілька реалізацій, але також припустимо, що на рутину накладені такі обмеження :
- Відсутність контролю нам назвами полів.
- Інтерфейс не змінюється.
- Значення визначено вхідними даними.
- Семантика аргументів : об'єкт і поле має бути збережена.

### В цьому випадку залишається один варіант :
При використанні в якості третього аргументу певного значення ( <code>null</code>, <code>'notRewrite'</code>, <code>false</code>, ... ), поле не буде переписано, а буде взято значення із об'єкта і поле стане константним.

Припустимо, що при третьому аргументі - <code>null</code>, значення буде взято з об'єкта.
При такій реалізації виникає проблема обмеженості значень : <code>null</code> - неможливо буде присвоїти полю, тому що воно зарезервоване для вибору алгоритму модифікації. Це стосується будь-якого значення. 

### Ескейпінг вирішує цю проблему :
- Третій аргумент : <code>null</code> - значення буде взято із об'єкта
- Третій аргумент : <code>_.escape.make( null )</code> - значення <code>null</code> буде присвоєно об'єкту. -->
