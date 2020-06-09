# Офікація рутин

**Офікація** - процес перетворення списку вхідних параметрів рутини або методу в мапу опцій 'о'.

Використовується для покращення читабельності коду, зручності виклику (порядок не має значення), можливе поєднання: виклик зі списком аргументів (вузький діапазон дій) або виклик із мапою опцій (широкий діапазон дій).

**Приклад офікованого методу:**

```javascript
function strStrShort( o )
{
  _.assert( arguments.length === 1 || arguments.length === 2 );

  if( arguments.length === 2 )
  o = { src : arguments[ 0 ], limit : arguments[ 1 ] };
  else if( arguments.length === 1 )
  if( _.strIs( o ) )
  o = { src : arguments[ 0 ] };

  _.routineOptions( strStrShort, o );
  _.assert( _.strIs( o.src ) );
  _.assert( _.numberIs( o.limit ) );

  let str = o.src;
  
  // ...

}
```

Метод `strStrShort` повертає строку параметр з обмеженою (`limit` або `o.limit`) кількістю літер. Приймає мапу опцій, але також дає можливість передати аргументи списком.

Він може викликатися 2-ма способами: 
* `strStrShort( 'string', 4 )` // result -> ''st'...'ng''
* `strStrShort( { src : 'string', limit : 4 } )` // result -> ''st'...'ng''

Також обов'язково виконуються перевірки вхідних даних, при помилці можна завжди дізнатися про невідповідність типів даних.
```javascript
_.assert( _.strIs( o.src ) );
_.assert( _.numberIs( o.limit ) );
```

Використовуючи мапу опцій можна задати додаткові параметри, які без офікації, створювали би надмірну кількість вхідних даних (4), що часто може призводити до помилок при роботі з аргументами:
```javascript
/*
 * @param {string} [ o.wrap='\'' ] - String wrapper. Use zero or false to disable.
 * @param {string} [ o.escaping=1 ] - Escaping characters appears in output.
 */
```
Також при офікації викликається:
```javascript
_.routineOptions( strStrShort, o );
```
з назвою рутини/методу та мапою даних.

*Дефолтні значення* -  використовуються, якщо відповідні не були передані при виклику:
```javascript
strStrShort.defaults =
{
  src : null,
  limit : 40,
  wrap : '\'',
  escaping : 1
}
```