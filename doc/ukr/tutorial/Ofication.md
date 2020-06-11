# Офікація рутин

Офікація - процес перетворення списку вхідних параметрів рутини або методу в мапу опцій 'о'.

**Переваги** 
* Покращення читабельності коду.
* Перевірка вхідних даних.
* Зручність виклику (порядок не має значення).
* Уніфікація коду - один аргумент всюди.
* Можливість поєднання: виклик зі списком аргументів (вузький діапазон дій) або виклик із мапою опцій (широкий діапазон дій).

### Приклад офікації рутини

**Маємо рутину:**
```javascript
function mapToStr( src, keyValDelimeter, entryDelimeter)
{
  let result = '';
  for( let s in src )
  result += s + keyValDelimeter + src[ s ] + entryDelimeter;
  result = result.substr( 0, result.length-entryDelimeter.length );

  return result
}
```
Рутина `mapToStr` конвертує об'єкт(`src`) у рядок, розділяючи ключ та значення через `keyValDelimeter`, а пари ключ-значення через `entryDelimeter`.

Аргументи:
* `src` - вхідний об'єкт.
* `keyValDelimeter` - сепаратор між ключем і значенням.
* `entryDelimeter` - сепаратор між парами ключ-значення.

*Для офікації потрібно:*
* Створити єдиний параметр `o`.
* Додати мапу дефолтних опцій `mapToStr.defaults`.
* Додати виклик `_.routineOptions( mapToStr, o );`.
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
  result += s + o.keyValDelimeter + o.src[ s ] + o.entryDelimeter;
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
Рутина `mapToStr` конвертує об'єкт(`o.src`) у рядок, розділяючи ключ та значення через `o.keyValDelimeter`, а пари ключ значення через `o.entryDelimeter`. Виклик до `_.routineOptions` виконує перевірку вхідних значень.

*Аргументи:*
* `o` - мапа опцій, яка має 3 пари ключ-значення:
  * `src` - вхідний об'єкт.
  * `keyValDelimeter` - сепаратор між ключем і значенням.
  * `entryDelimeter` - сепаратор між парами ключ-значення.

Використовуючи мапу опцій, можна задати додаткові параметри, які без офікації, створювали б надмірну кількість вхідних даних, що часто може призводити до помилок при роботі з аргументами:

*Мапа дефолтних значень* -  призначена для зберігання налаштувань за замовчуванням:
```javascript
mapToStr.defaults =
{
  src : null,
  keyValDelimeter : ':',
  entryDelimeter : ';',
}
```
При відсутності `keyValDelimeter` або `entryDelimeter` будуть застосовуватися дефолтні значення.


*Перевірка вхідних значень* - `_.routineOptions` виконує перевірку вхідних даних: перевіряє, що `mapToStr` є рутиною і у неї наявна мапа дефолтних значень `mapToStr.defaults` та мапа опцій `o`, яка є об'єктом і не містить `undefined` значень. Також, `_.routineOptions` може приймати масив аргументів замість мапи опцій.
```javascript
_.routineOptions( mapToStr, o )
```
При помилці, повідомлення помилки відображає конкретну причину (невідповідність типів даних, відсутність мапи дефолтних значень і тд).