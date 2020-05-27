# Векторизація

Це процес перетворення скалярної рутини у векторизовану.

Векторизована рутина - це рутина, яка може виконувати операції над масивом вхідних даних,
переданих у вигляді [вектора](./Vector.md). Векторизована рутина не повинна втрачати здатність обробляти
скалярні дані.

### Автоматична векторизація

Може бути виконати з домопогою рутини [vectorize](../tutorial/Vectorize.md).

Маємо рутину, у яку передається об'єкт user, а повертається його повне імя.
```js
function getFullName( user )
{
  return `${user.firstName} ${user.lastName}`;
}

let user = { firstName: 'John', lastName: 'Smith', age: 30 }
console.log( getFullName( user ) );
// John Smith
```
Після виконання автоматичної векторизації рутини `getFullName`, вона здатна обробляти також вектор із даними.

```js
let _ = require( 'wTools' );

function getFullName( user )
{
  return `${user.firstName} ${user.lastName}`;
}

let getFullName2 = _.vectorize( getFullName, 1 );
let user = { firstName: 'John', lastName: 'Smith', age: 30 }
let users = [
  { firstName: 'John', lastName: 'Smith', age: 30 },
  { firstName: 'Samantha', lastName: 'Blum', age: 25 },
  { firstName: 'Edvard', lastName: 'Pitt', age: 33 }
];
console.log( getFullName2( user ) );
// John Smith
console.log( getFullName2( users ) );
// [ 'John Smith', 'Samantha Blum', 'Edvard Pitt' ]
```  

### Ручна векторизація

Операції над даними можуть бути складними і не піддаватись автоматизації або робити її недоцільною.
В такому разі необхідно виконати векторизацію рутини в ручну.

Для прикладу розглянемо рутину, яку, насправді, можна легко автоматизувати, проте вона гарно демонструє 
ручну векторизацію. 
```js
function getFullName( user )
{
  return `${user.firstName} ${user.lastName}`;
}
```
Необхідно зробити можливим опрацювання рутиною як одного об'єкту user, так і масиву об'єктів user.
Для цього змінимо операції над вхідними даними наступним чином.
```js
function getFullName( user )
{
  if( Array.isArray( user ) )
  {
    const fullNames = [];
    user.forEach( u => fullNames.push( `${u.firstName} ${u.lastName}` ) )
    return fullNames;
  }
  else
  {
    return `${user.firstName} ${user.lastName}`; 
  }
}
```

[Повернутись до змісту](../README.md#Концепції)