# Ескейпінг

Ескейпінг - процес маскування певного значення. Реалізується рутинами і засобами, щоб вирішити проблему обмеженості значень.
Неймспейс <code>_.escape</code> містить засоби для створення, перевірки та маніпулювання таких значень.

<details>
  <summary>
    <b>Приклад - створення рутини <code>objectSetValue</code>.</b>
  </summary><br>
  Рутина присвоює значення <code>value</code> ( якщо <code>value !== null</code> ) полю <code>field</code> об'єкта <code>obj</code>.<br><br>
  <code>

    function objectSetValue( obj, field, value )
    {
      if( value === null )
      return;
      else
      obj[ field ] = value;
    }

    module.exports = objectSetValue;

  </code>
</details>

<details>
  <summary>
    <b>Приклад - використання рутини <code>objectSetValue</code>.</b>
  </summary><br>
  Проблема : неможливо присвоїти значення <code>null</code>, так як воно використовується в рутині, як спеціальне.<br><br>
  <code>

    let objectSetValue = require( './0_Implementation.s' );

    let obj = {};

    objectSetValue( obj, 'field1', 1 );
    objectSetValue( obj, 'field2', 2 );
    objectSetValue( obj, 'field3', null );

    console.log( obj );
    /* log : { field1: 1, field2: 2 } */

  </code>
</details>

<details>
  <summary>
    <b>Приклад - створення рутини <code>objectSetValueWith4Params</code>.</b>
  </summary><br>
  Рутина присвоює значення <code>value</code> ( якщо <code>skip !== null</code> ) полю <code>field</code> об'єкта <code>obj</code>.<br><br>
  <code>

    function objectSetValueWith4Params( obj, field, value, skip )
    {
      if( skip === true )
      return;
      else
      obj[ field ] = value;
    }
    module.exports = objectSetValueWith4Params;

  </code>
</details>

<details>
  <summary>
    <b>Приклад - використання рутини <code>objectSetValueWith4Params</code>.</b>
  </summary><br>
  Проблема :triangular_flag_on_post: : наявність додаткового 4 параметра<br><br>
  <code>

    let objectSetValueWith4Params = require( './1_ImplementationWith4Arguments.s' );

    let obj = {};

    objectSetValueWith4Params( obj, 'field1', 1 );
    objectSetValueWith4Params( obj, 'field2', 2 );
    objectSetValueWith4Params( obj, 'field3', null );
    objectSetValueWith4Params( obj, 'field4', null, true );

    console.log( obj );
    /* log : { field1: 1, field2: 2, field3: null } */

  </code>
</details>


<!-- 
### Приклад - створення рутини для додавання поля об'єкту з опціональним четвертим параметром.
```js
let _ = require( '../..' );

/*
  A fourth argument can be provided to use as identifier whether to assign value or not
*/

function objectSetValue( obj, field, value, skip )
{
  if( skip === true )
  return;
  else
  obj[ field ] = value;
}

let obj = {};

objectSetValue( obj, 'field1', 1 );
objectSetValue( obj, 'field2', 2 );
objectSetValue( obj, 'field3', null );
objectSetValue( obj, 'field4', null, true );

console.log( obj );
/* log : { field1: 1, field2: 2, field3: null } */

```

### Приклад - створення рутини для додавання поля об'єкту з використанням мапи з полями `skip` та `src` в якості першого аргументу.
```js
let _ = require( '../..' );

/*
  A map can be provided as a first argument whether to assign value or not
*/

function objectSetValue( objectDescriptor, field, value )
{
  if( objectDescriptor.skip === true )
  return;
  else
  objectDescriptor.src[ field ] = value;
}

let obj = {};

objectSetValue( { src : obj, skip : false }, 'field1', 1 );
objectSetValue( { src : obj, skip : false }, 'field2', 2 );
objectSetValue( { src : obj, skip : false }, 'field3', null );
objectSetValue( { src : obj, skip : true }, 'field4', null );

console.log( obj );
/* log : { field1: 1, field2: 2, field3: null } */

```

### Приклад - створення рутини для додавання поля об'єкту з використанням мапи з полями `skip` та `name` в якості другого аргументу.
```js
let _ = require( '../..' );

/*
  A map can be provided as a second argument whether to assign value or not
*/

function objectSetValue( obj, fieldDescriptor, value )
{
  if( fieldDescriptor.skip === true )
  return;
  else
  obj[ fieldDescriptor.name ] = value;
}

let obj = {};

objectSetValue( obj, { name : 'field1', skip : false }, 1 );
objectSetValue( obj, { name : 'field2', skip : false }, 2 );
objectSetValue( obj, { name : 'field3', skip : false }, null );
objectSetValue( obj, { name : 'field4', skip : true }, null );

console.log( obj );
/* log : { field1: 1, field2: 2, field3: null } */

```

### Приклад - створення рутини для додавання поля об'єкту з використанням мапи з полями `skip` та `value` в якості третього аргументу.
```js
let _ = require( '../..' );

/*
  A map can be provided as a third argument whether to assign value or not
*/

function objectSetValue( obj, field, valueDescriptor )
{
  if( valueDescriptor.skip === true )
  return;
  else
  obj[ field ] = valueDescriptor.value;
}

let obj = {};

objectSetValue( obj, 'field1', { value : 1, skip : false } );
objectSetValue( obj, 'field2', { value : 2, skip : false } );
objectSetValue( obj, 'field3', { value : null, skip : false } );
objectSetValue( obj, 'field4', { value : null, skip : true } );

console.log( obj );
/* log : { field1: 1, field2: 2, field3: null } */

```

### Приклад - створення рутини для додавання константного поля об'єкту без використання `_.escape` неймспейсу.
```js
let _ = require( '../..' );

/*
  Add/convert to a constant field
  What if we want to add `null` as the value ?
*/

function objectSetValue( object, field, value )
{
  if( value === null )
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
}

let obj = { fieldToBeRemained : 1, fieldToBeChanged : 2 };

objectSetValue( obj, 'field1', 1 );
objectSetValue( obj, 'fieldToBeChanged', 'changed' );
objectSetValue( obj, 'fieldToBeRemained', null );

console.log( Object.getOwnPropertyDescriptors( obj ) );
/*
log :
{
  fieldToBeRemained:
  {
    value: 1,
    writable: false,
    enumerable: true,
    configurable: false
  },
  fieldToBeChanged:
  {
    value: 'changed',
    writable: false,
    enumerable: true,
    configurable: false
  },
  field1:
  {
    value: 1,
    writable: false,
    enumerable: true,
    configurable: false
  }
}
*/

```

### Приклад - створення рутини для додавання константного поля об'єкту з використанням `_.escape` неймспейсу.
```js
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
```js

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

``` -->