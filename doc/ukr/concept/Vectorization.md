# Векторизація

Це процес перетворення скалярної рутини у векторизовану.

Векторизована рутина - це рутина, яка може виконувати операції над масивом вхідних даних,
переданих у вигляді [вектора](./Vector.md). Векторизована рутина не повинна втрачати здатність обробляти
скалярні дані.

## Автоматична векторизація

Може бути виконати з домопогою рутини [vectorize](../tutorial/Vectorize.md).

Нехай маємо рутину, у яку передається об'єкт user, а повертається його повне імя.
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

## Ручна векторизація

Операції над даними можуть бути найрізноманітнішими і не завжди можна скористатись автоматичним способом векторизації, 
оскільки він апріорі не може покривати всі можливі випадки.
В такому разі необхідно виконати векторизацію в ручну.

Для прикладу розглянемо попередню рутину. 
```js
function getFullName( user )
{
  return `${user.firstName} ${user.lastName}`;
}
```
Задача полягає у тому, щоб зробити можливим опрацювання рутиною як одного об'єкту user, так і масиву об'єктів user.
Для цього можемо додати перевірку вхідного параметру з метою встановлення чи це скаляр, чи вектор.
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
Як видно з коду, тепер рутина `getFullName` може повертати рядок із повним іменем одного об'єкта user, 
а також масив рядків із повним іменем кожного об'єкта user вхідного вектору даних.

[Повернутись до змісту](../README.md#Концепції)