# Ескейпінг

Ескейпінг - процес маскування певного значення. Реалізується рутинами і засобами, щоб вирішити проблему обмеженості значень.
Неймспейс <code>_.escape</code> містить засоби для створення, перевірки та маніпулювання таких значень.

## План презентації
* Пояснити проблему обмеженості значень на прикладі семплу 0 ( якщо значення зарезервоване в рутині для вибору алгоритму, воно не може бути використане, як звичайне )
* Показати можливі рішення цієї проблеми на прикладі семплів 1 - 4
* Відтворити семпл 5, як ускладнена варіація першої проблеми
* Відтворити семпл 6 - вирішення проблеми з використанням `_.escape` неймспейсу.
* Висновки : проблема може бути вирішена декількома способами, але ескейпінг дає універсальний метод. Не потрібно змінювати інтерфейс, код стає уніфікованим, а виконання очікуваним.

<details>
  <summary>
    <b>Проблема обмеженості значень</b>
  </summary></br>
  
<em><b>Приклад</b> - створення рутини <code>objectSetField</code>.</em><br><br>
Рутина присвоює значення <code>value</code> ( якщо <code>value !== null</code> ) полю <code>field</code> об'єкта <code>obj</code>.</br></br>
<pre><code>function objectSetField( obj, field, value )
{
  if( value === null )
  return;
  else
  obj[ field ] = value;
}

module.exports = objectSetField;</code></pre>

  <br>

  <em><b>Приклад</b> - використання рутини <code>objectSetField</code>.</em><br><br>
  ❌ Проблема : неможливо присвоїти значення <code>null</code>, так як воно використовується в рутині, як спеціальне.<br><br>
  <pre><code>let objectSetField = require( './0_Implementation.s' );

  let obj = {};

  objectSetField( obj, 'field1', 1 );
  objectSetField( obj, 'field2', 2 );
  objectSetField( obj, 'field3', null );

  console.log( obj );
  /* log : { field1: 1, field2: 2 } */</code></pre>

</details>

<br>

<details>
  <summary>
    <b>Вирішення проблеми обмеженості значень : додавання 4 параметра</b>
  </summary></br>
  
<em><b>Приклад</b> - створення рутини <code>objectSetFieldWith4Params</code>.</em><br><br>
Рутина присвоює значення <code>value</code> ( якщо <code>skip !== trueLike</code> ) полю <code>field</code> об'єкта <code>obj</code>.<br><br>
<pre><code>function objectSetFieldWith4Params( obj, field, value, skip )
{
  if( skip === true )
  return;
  else
  obj[ field ] = value;
}
module.exports = objectSetFieldWith4Params;</code></pre>

  <br>

  <em><b>Приклад</b> - використання рутини <code>objectSetFieldWith4Params</code>.</em><br><br>
  ❌ Проблема : наявність додаткового 4 параметра<br><br>
  <pre><code>let objectSetFieldWith4Params = require( './1_ImplementationWith4Arguments.s' );

let obj = {};

objectSetFieldWith4Params( obj, 'field1', 1 );
objectSetFieldWith4Params( obj, 'field2', 2 );
objectSetFieldWith4Params( obj, 'field3', null );
objectSetFieldWith4Params( obj, 'field4', null, true );

console.log( obj );
/* log : { field1: 1, field2: 2, field3: null } */</code></pre>

</details>

<br>

<details>
  <summary>
    <b>Вирішення проблеми обмеженості значень : перший аргумент - <code>objectDescriptor</code></b>
  </summary></br>
  
<em><b>Приклад</b> - створення рутини <code>objectSetFieldWithObjectDescriptor</code>.</em><br><br>
Рутина присвоює значення <code>value</code> ( якщо <code>objectDescriptor.skip !== trueLike</code> ) полю <code>field</code> об'єкта <code>objectDescriptor.src</code>.<br><br>
<pre><code>function objectSetFieldWithObjectDescriptor( objectDescriptor, field, value )
{
  if( objectDescriptor.skip === true )
  return;
  else
  objectDescriptor.src[ field ] = value;
}

module.exports = objectSetFieldWithObjectDescriptor;</code></pre>

  <br>

  <em><b>Приклад</b> - використання рутини <code>objectSetFieldWithObjectDescriptor</code>.</em><br><br>
  ❌ Проблема : необхідність змінювати інтерфейс, перший параметр - мапа з об'єктом <code>src</code> та полем <code>skip</code><br><br>
  <pre><code>let objectSetFieldWithObjectDescriptor = require( './2_ImplementationWithObjectDescriptor.s' );

let obj = {};

objectSetFieldWithObjectDescriptor( { src : obj, skip : false }, 'field1', 1 );
objectSetFieldWithObjectDescriptor( { src : obj, skip : false }, 'field2', 2 );
objectSetFieldWithObjectDescriptor( { src : obj, skip : false }, 'field3', null );
objectSetFieldWithObjectDescriptor( { src : obj, skip : true }, 'field4', null );

console.log( obj );
/* log : { field1: 1, field2: 2, field3: null } */</code></pre>

</details>


<!-- <details>
<br>

<br>

<details>
  <summary>
    <b>Приклад - створення рутини <code>objectSetFieldWithFieldDescriptor</code>.</b>
  </summary><br>
  Рутина присвоює значення <code>value</code> ( якщо <code>fieldDescriptor.skip !== trueLike</code> ) полю <code>fieldDescriptor.name</code> об'єкта <code>obj</code>.<br><br>
  <pre><code>function objectSetFieldWithFieldDescriptor( obj, fieldDescriptor, value )
{
  if( fieldDescriptor.skip === true )
  return;
  else
  obj[ fieldDescriptor.name ] = value;
}

module.exports = objectSetFieldWithFieldDescriptor;</code></pre>
</details>


<details>
  <summary>
    <b>Приклад - використання рутини <code>objectSetFieldWithFieldDescriptor</code>.</b>
  </summary><br>
  ❌ Проблема : необхідність змінювати інтерфейс, другий параметр - мапа з полями <code>skip</code> та <code>name</code><br><br>

  <pre><code>let objectSetFieldWithFieldDescriptor = require( './3_ImplementationWithFieldDescriptor.s' );

let obj = {};

objectSetFieldWithFieldDescriptor( obj, { name : 'field1', skip : false }, 1 );
objectSetFieldWithFieldDescriptor( obj, { name : 'field2', skip : false }, 2 );
objectSetFieldWithFieldDescriptor( obj, { name : 'field3', skip : false }, null );
objectSetFieldWithFieldDescriptor( obj, { name : 'field4', skip : true }, null );

console.log( obj );
/* log : { field1: 1, field2: 2, field3: null } */</code></pre>
</details>

<br>

<details>
  <summary>
    <b>Приклад - створення рутини <code>objectSetFieldWithValueDescriptor</code>.</b>
  </summary><br>
  Рутина присвоює значення <code>valueDescriptor.value</code> ( якщо <code>valueDescriptor.skip !== trueLike</code> ) полю <code>field</code> об'єкта <code>obj</code>.<br><br>
  <pre><code>function objectSetFieldWithValueDescriptor( obj, field, valueDescriptor )
{
  if( valueDescriptor.skip === true )
  return;
  else
  obj[ field ] = valueDescriptor.value;
}

module.exports = objectSetFieldWithValueDescriptor;</code></pre>
</details>


<details>
  <summary>
    <b>Приклад - використання рутини <code>objectSetFieldWithValueDescriptor</code>.</b>
  </summary><br>
  ❌ Проблема : необхідність змінювати інтерфейс, третій параметр - мапа з полями <code>skip</code> та <code>value</code><br><br>

  <pre><code>let objectSetFieldWithValueDescriptor = require( './4_ImplementationWithValueDescriptor.s' );

let obj = {};

objectSetFieldWithValueDescriptor( obj, 'field1', { value : 1, skip : false } );
objectSetFieldWithValueDescriptor( obj, 'field2', { value : 2, skip : false } );
objectSetFieldWithValueDescriptor( obj, 'field3', { value : null, skip : false } );
objectSetFieldWithValueDescriptor( obj, 'field4', { value : null, skip : true } );

console.log( obj );
/* log : { field1: 1, field2: 2, field3: null } */</code></pre>
</details>

<br>

<details>
  <summary>
    <b>Приклад - створення рутини <code>objectSetFieldConstant</code>.</b>
  </summary><br>
  Ускладнена версія <code>objectSetField</code>, яка додає константне поле об'єкту <code>object</code>, якщо <code>value === null</code> - перетворює поле <code>field</code> на константне.</br></br>
  <pre><code>function objectSetFieldConstant( object, field, value )
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

module.exports = objectSetFieldConstant;</code></pre>
</details>


<details>
  <summary>
    <b>Приклад - використання рутини <code>objectSetFieldConstant</code>.</b>
  </summary><br>
  ❌ Проблема : та ж що і у <code>objectSetField</code>.<br><br>

  <pre><code>let objectSetFieldConstant = require( './5_ImplementationAddConstantField.s' );

let obj = { fieldToBeRemained : 1, fieldToBeChanged : 2 };

objectSetFieldConstant( obj, 'field1', 1 );
objectSetFieldConstant( obj, 'fieldToBeChanged', 'changed' );
objectSetFieldConstant( obj, 'fieldToBeRemained', null );

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
*/</code></pre>
</details>

<br>

<details>
  <summary>
    <b>Приклад - створення рутини <code>objectSetFieldConstantWithEscape</code>.</b>
  </summary><br>
  Рутина додає константне поле об'єкту <code>object</code>, якщо <code>value === null</code> - перетворює поле <code>field</code> на константне.<br><br>

  <pre><code>let _ = require( '../..' );

function objectSetFieldConstantWithEscape( object, field, value )
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

module.exports = objectSetFieldConstantWithEscape;

</code></pre>
</details>


<details>
  <summary>
    <b>Приклад - використання рутини <code>objectSetFieldConstantWithEscape</code>.</b>
  </summary><br>
  ✅  Переваги : інтерфейс не змінюється, уніфікація коду, вирішена проблема обмеженності значень.<br><br>

  <pre><code>let _ = require( '../..' );
let objectSetFieldConstantWithEscape = require( './6_ImplementationAddConstantFieldWithEscape.s' )

var src = { 'fieldToBeRemained' : 1 };
objectSetFieldConstantWithEscape( src, 'fieldToBeRemained', null );
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
objectSetFieldConstantWithEscape( src2, 'fieldToBeChanged', 'changed' );
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
objectSetFieldConstantWithEscape( src3, 'fieldToBeChangedWithNull', _.escape.make( null ) );
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
*/</code></pre>
</details>
 -->
