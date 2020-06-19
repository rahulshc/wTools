# Тип ```Stream```

<code>Stream</code> - абстрактний інтерфейс для роботи з потоковими даними.

**"Streaming"** включає в себе ділення ресурсу, який потрібно отримати або відправити, на малі частини та опрацювання їх одна за одною. Дані можуть бути об'ємними, використання потоків дозволяє прочитати/записати перші частини даних та розпочати обробку набагато швидше. Також можливе використання декількох типів потоків, наприклад можна брати дані з читаючого потоку та передавати їх у записуючий.

**Потокові інтерфейси:**
* Читаючі потоки: 
  * [ReadableStream](https://developer.mozilla.org/en-US/docs/Web/API/ReadableStream)
  * [ReadableStreamDefaultReader](https://developer.mozilla.org/en-US/docs/Web/API/ReadableStreamDefaultReader)
  * [ReadableStreamDefaultController](https://developer.mozilla.org/en-US/docs/Web/API/ReadableStreamDefaultController)
* Записуючі потоки:
  * [WritableStream](https://developer.mozilla.org/en-US/docs/Web/API/WritableStream)
  * [WritableStreamDefaultWriter](https://developer.mozilla.org/en-US/docs/Web/API/WritableStreamDefaultWriter)
  * [WritableStreamDefaultController](https://developer.mozilla.org/en-US/docs/Web/API/WritableStreamDefaultController)

```stream``` модуль дає доступ до API для реалізації інтерфейсу.

```javascript
const stream = require('stream');
```

**Потоки в NodeJS:**
* Читаючі(Readable) - потоки, з яких можна прочитати дані(```process.stdin```).
* Записуючі(Writable) - потоки, у які можна записати дані(```process.stdout```).
* Дуплексні(Duplex) - потоки, з яких можна прочитати та у які можна записати(```net.Socket```).
* Трансформуючі(Transform) - потоки, які можуть модифікувати або трансформувати дані, які записуються або читаються(```zlib.createDeflate()```).

**Приклад читаючого потоку:**
```javascript
const { Readable } = require('stream'); 

const inStream = new Readable({
  read(size) {
    this.push(String.fromCharCode(this.currentCharCode++));
    if (this.currentCharCode > 90) {
      this.push(null);
    }
  }
});

inStream.currentCharCode = 65;

inStream.pipe(process.stdout);
```

**Ресурси:**
* [Node.js документація](https://nodejs.org/api/stream.html)
* [Стаття mozilla.org](https://developer.mozilla.org/en-US/docs/Web/API/Streams_API)
* [Додаткові приклади](https://www.codota.com/code/javascript/modules/stream)
* [Огляд потоків в NodeJS](https://www.freecodecamp.org/news/node-js-streams-everything-you-need-to-know-c9141306be93/)