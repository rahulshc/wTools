# Ескейпінг

Ескейпінг - процес маскування певного значення. Реалізується рутинами і засобами, щоб вирішити проблему обмеженості значень.
Неймспейс <code>_.escape</code> містить засоби для створення, перевірки та маніпулювання таких значень.

### Приклад - створення рутини для додавання константного поля об'єкту.
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

module.exports = objectSetValue;

```

### Приклад - використання рутини для додавання константного поля об'єкту.
```

let _ = require( '../..' );
let objectSetValue = require( './SampleImplementation.s' )

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