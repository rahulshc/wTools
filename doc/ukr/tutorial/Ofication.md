# Офікація рутин

### Офікація - процес перетворення списку вхідних параметрів рутини або методу в мапу опцій 'о'.

**Переваги** 
* Покращення читабельності коду
* Зручність виклику (порядок не має значення)
* Уніфікація коду - один аргумент всюди
* Можливість поєднання: виклик зі списком аргументів (вузький діапазон дій) або виклик із мапою опцій (широкий діапазон дій).

**Приклад офікованого методу:**

Метод `strStrShort` повертає строку параметр з обмеженою (`limit` або `o.limit`) кількістю літер. Приймає мапу опцій, але також дає можливість передати аргументи списком.

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

Виклик відбувається 2-ма способами: 
* `strStrShort( 'string', 4 )` // result -> ''st'...'ng''
* `strStrShort( { src : 'string', limit : 4 } )` // result -> ''st'...'ng''

Обов'язково виконуються перевірки вхідних даних, при помилці можна завжди дізнатися про невідповідність типів даних.
Якщо не виконувати перевірку, то через слабку динамічну типізацію в JavaScript, можуть виникати помилки загального характеру, які важко піддаються усуненню.
```javascript
_.assert( _.strIs( o.src ) );
_.assert( _.numberIs( o.limit ) );
```

Використовуючи мапу опцій можна задати додаткові параметри, які без офікації, створювали б надмірну кількість вхідних даних (4), що часто може призводити до помилок при роботі з аргументами:
```javascript
/*
 * @param {string} [ o.wrap='\'' ] - String wrapper. Use zero or false to disable.
 * @param {string} [ o.escaping=1 ] - Escaping characters appears in output.
 */
```
При офікації повинен відбуватися виклик:
```javascript
_.routineOptions( strStrShort, o );
```
з назвою рутини/методу та мапою даних.

*Мапа опцій дефолтних значень* -  призначена для зберігання налаштувань за замовчуванням:
```javascript
strStrShort.defaults =
{
  src : null,
  limit : 40,
  wrap : '\'',
  escaping : 1
}
```

### Приклад офікації рутини

**Маємо рутину:**
Конвертує об'єкт у строку.
```javascript
function mapToStr( src, keyValDelimeter, entryDelimeter)
{
  let result = '';
  for( let s in src )
  {
    result += s + keyValDelimeter + src[ s ] + entryDelimeter;
  }

  result = result.substr( 0, result.length-entryDelimeter.length );

  return result
}
```
*Для офікації потрібно:*
* Створити єдиний параметр `o`
* Додати мапу дефолтних опцій
* Додати перевірки типів даних( в цьому випадку на строку для одного аргумента, та на кількість аргументів)
* Додати виклик `_.routineOptions( mapToStr, o );`
* В тілі рутини працювати з параметрами через ключі `o`: `o.src` і т.д.

**Офікована рутина:**
```javascript
function mapToStr( o )
{

  if( _.strIs( o ) )
  o = { src : o }

  _.routineOptions( mapToStr, o );
  _.assert( arguments.length === 1, 'Expects single argument' );

  let result = '';
  for( let s in o.src )
  {
    result += s + o.keyValDelimeter + o.src[ s ] + o.entryDelimeter;
  }

  result = result.substr( 0, result.length-o.entryDelimeter.length );

  return result
}

mapToStr.defaults =
{
  src : null,
  keyValDelimeter : ':',
  entryDelimeter : ';',
}
```