# Тип ```Stream```

<code>Stream</code> - абстрактний інтерфейс для роботи з потоковими даними.

```stream``` модуль дає доступ до API для реалізації інтерфейсу.

```javascript
const stream = require('stream');
```

**Потоки можуть бути:**
* Читабельними(Readable) - потоки, з яких можна прочитати дані(``` fs.createReadStream()```).
* Записуючими(Writable) - потоки, у які можна записати дані(```fs.createWriteStream()```).
* Дуплексними(Duplex) - потоки, з яких можна прочитати та у які можна записати(```net.Socket```).
* Трансформуючими(Transform) - потоки, які можуть модифікувати або трансформувати дані, які записуються або читаються(```zlib.createDeflate()```).

Всі потоки - екземпляри ```EventEmitter```

Чимало потокових об'єктів доступні в ```Node.js```. Наприклад, запит до HTTP серверу та ```process.stdout``` обидва екземпляри ```stream```.

**Приклад записуючого потоку:**
```javascript
let fs = require('fs');
 
let writer = fs.createWriteStream('helloworld.txt');
 
writer.write('hello world');
writer.write('!');
writer.end(); // creates file if not exists and writes content into it
```