#  Мануал початківця wTools

## Зміст
- [Модульне тестування](#unit-testing)
- [Анатомія модульного теста](#unit-testing-anatomy)
- [Репозиторій](#repository)
- [Клонування репозиторію](#repository-cloning)
- [Встановлення пакету](#package-installation)
- [Способи запуска тестів](#way-of-test-running)
- [Кількість вихідної інформації](#verbosity)
- [Підказка по параметрам скрипта](#getting-parameters-help)
- [Сценарії тестера](#tester-scenarios)
- [Опції тестера](#tester-options)
- [Структурні одиниці тестування](#testing-structure-units)
- [Розташуванння окремих тест рутин та їх реалізацій](#test-routines-location)

<a name="unit-testing"/>

## Модульне тестування

Модульні тести (юніт тести), пишуться для того, щоб протестувати чи працює данний модуль(юніт). 
Усі залежності виключаються, а це значить, що ми надаємо підроблені залежності (фейки) для модуля.

<a name="unit-testing-anatomy"/>

## Анатомія модульного теста

Кожний модульний тест має наступну структуру :

1. Налаштування теста

2. Виклик тестуємого метода

3. Твердження

В кожному модульному тесті повинна перевірятися тільки одна проблема. (Звичайно це не означає, що можно добавляти тільки одне твердження).

<a name="repository"/>

## Репозиторій

Репозіторій розташовано за адресою  [https://github.com/Wandalen/wTools](https://github.com/Wandalen/wTools)

<a name="repository-cloning"/>

## Клонування репозиторію

Для клонування репозіторію використовувати команду `git clone https://github.com/Wandalen/wTools.git`

<a name="package-installation"/>

## Встановлення пакету

Для встановлення пакету перейдіть в сколоновану теку проекту та виконайте
`npm install`
Для встановлення пакету для тестування глобально використайте
`npm install -g wTesting`

<a name="way-of-test-running"/>

## Способи запуска тестів

[//]: # ( xxx : не правильно, треба розбити на 4-ри пункти )

 Існують три способа запуска тестів з наступними командами

|N п/п      | Спосіб запуску                                              | Команда                                              |
|:----------|:------------------------------------------------------------|:-----------------------------------------------------|
|[1](#1)    | Безпосередньо через npm                                     | `npm test`                                           |
|[2.1](#2.1)| Альтернативний спосіб запуску                               | `wtest staging`                                      |
|[2.2](#2.2)| Альтернативний спосіб запуску використовуючи файл тест сюіта| `wtest staging/dwtools/abase/layer1.test/Map.test.s` |
|[3](#3)    | Використовуючи файл тест сюіта                              | `node staging/dwtools/abase/layer1.test/Map.test.s`  |

Спосіб [1](#1) та [2.1](#2.1) виконує усі наявні тест сюіти, в той час коли можно виконувати окремі тест сюіти за допомогою [2.2](#2.2) та [3](#3) 

Экран терміналу вищовказаних команд в операційній системі Linux буде виглядати наступним образом:

<a name="1"/>

Результат команди 1

![Результат команди 1](./reference/img/1.png)

<a name="2.1"/>

Результат команди 2.1

![Результат команди 2.1](./reference/img/2.1.png)

<a name="2.2"/>

Результат команди 2.2 див.визначення [Тест сюіт](#test-suit)

![Результат команди 2.2](./reference/img/2.2.png)

<a name="3"/>

Результат команди 3 див.визначення [Тест сюіт](#test-suit)

![Результат команди 3](./reference/img/3.png)

<a name="verbosity"/>

## Кількість вихідної інформації

Кількість інформації, яка буде видаватися скриптом, можно регулювати наступним чином:
використовуючи параметр `verbosity`, який регулює багатослівність.

| Параметр      | Кількість отриманої інформації |
|:--------------|:-------------------------------|
| verbosity:0   | Жодної інформації              |
| verbosity:1   | Один рядок                     |
| verbosity:2   | Багато рядків                  |
| verbosity:9   | Максимум інформації            |

Наприклад: `wtest staging verbosity:2`

<a name="getting-parameters-help"/>

## Підказка по параметрам скрипта

Для отримання підказки по опціям пакету для тестування використовуйте
`wtest scenario:help`

<a name="tester-scenarios"/>

## Сценарії тестера

| Сценарії      | Виконувана дія                            |
|:--------------|:------------------------------------------|
| test          | Запустити тести, сценарій за замовчуванням|
| help          | Отримати допомогу                         |
| options.list  | Перелік наявних опцій                     |
| scenarios.list| Перелік наявних сценаріїв                 |
| suits.list    | Перелік наявних сютів                     |

<a name="tester-options"/>

## Опції тестера

В наявності наступні опції:

| Опція             | Виконувана дія                                                        |
|:------------------|:----------------------------------------------------------------------|
| scenario          | Ім'я сценарію для запуску                                             |
| sanitareTime      | Затримка перед запуском наступного тест сюіта                         |
| usingBeep         | дзвінок після закінчення тесту                                        |
| routine           | Iм'я рутини для виконання                                             |
| fails             | Максимальне число хибних тестів перед тим, як закінчити               |
| silencing         | Дозволяє ловити вихід консолі, який виникає під час тестового запуску |
| testRoutineTimeOut| Лімітує час,який кожна рутина має працювати                           |
| concurrent        | Виконання тест сюітів параллельно з іншими тест сюітами               |
| verbosity         | Кількість вихідної інформації                                         |

<a name="testing-structure-units"/>

## Структурні одиниці тестування

[//]: # ( xxx : трохи не точно )

<a name="test-suit"/>

> `Тест сюіт` (тест комлект,тестовий набір) - це набір тест рутин, та тестових данних, необхідних для максимально повного тестування окремих частин задачі.

> `Тест рутина`( функція, метод ) - це набір тест кейсів, що виконуються послідовно одна за одною та поєднанні тим, що відносяться до одного модуля, що тестується або функціональності. Рутина завершує своє виконання на першій викинутій помилці тож тест кейси, які йдуть пізніше можуть лишитися не виконаними, проте це не вплине на результат тестування - він буде `failed`.

> `Тест кейс` - це одна або декілька перевірок поєднаних із супровідним кодом для виявлення несправності лише одного аспекту об'єкту, що тестується. Тест кейси описуються в тест рутині кодом та мають текстовий опис, що пояснює обставини тестування та очікуваний результат в даному тест кейсі.

> `Тест перевірка` - це найменша структурна одиниця тестування. Тест кейс складається із одної або декількох перевірок. Достатньо лише одного перевірки із результатом `failed` щоб увесь об'єкт, що тестується вважався таким, що не пройшов його.

| Структурна одиниця      | Кількість в пакеті wTools|
|:------------------------|:-------------------------|
| Тест сюіт               | 14                       |
| Тест рутина             | 184                      |
| Тест кейс               | 1332                     |
| Тест перевірка          | 2296                     |

<a name="test-routines-location"/>

## Розташуванння окремих тест рутин та їх реалізацій

Окремі тест рутини розташовані в директорії `wTools/staging/dwtools/abase`

Вони мають вигляд (на прикладі Тест рутини mapIdentical):

```javascript
var Self =
{

  /* options of the test suit */
  name : 'MapTest',
  silencing : 1,

  /* map of test routines available in the test suit */
  tests :
  {

    mapIdentical : mapIdentical,

  }

}
```

Тест рутина `mapIdentical` має таку реалізацію:

```javascript

function mapIdentical( test )
{

  test.description = 'same values';
  var got = _.mapIdentical( { a : 7, b : 13 }, { a : 7, b : 13 } );
  var expected = true;
  test.identical( got, expected );

  test.description = 'not the same values in'
  var got = _.mapIdentical( { 'a' : 7, 'b' : 13 }, { 'a' : 7, 'b': 14 } );
  var expected = false;
  test.identical( got, expected );

  test.description = 'different number of keys, more in the first argument'
  var got = _.mapIdentical( { 'a' : 7, 'b' : 13, 'с' : 15 }, { 'a' : 7, 'b' : 13 } );
  var expected = false;
  test.identical( got, expected );

  test.description = 'different number of keys, more in the second argument'
  var got = _.mapIdentical( { 'a' : 7, 'b' : 13 }, { 'a' : 7, 'b' : 13, 'с' : 15 } );
  var expected = false;
  test.identical( got, expected );

  /* special cases */

  test.description = 'empty maps, standrard'
  var got = _.mapIdentical( {}, {} );
  var expected = true;
  test.identical( got, expected );

  test.description = 'empty maps, pure'
  var got = _.mapIdentical( Object.create( null ), Object.create( null ) );
  var expected = true;
  test.identical( got, expected );

  test.description = 'empty maps, one standard another pure'
  var got = _.mapIdentical( {}, Object.create( null ) );
  var expected = true;
  test.identical( got, expected );

  /* bad arguments */

  if( !Config.debug )
  return;

  test.description = 'no arguments';
  test.shouldThrowError( function()
  {
    _.mapIdentical();
  });

  test.description = 'not object-like arguments';
  test.shouldThrowError( function()
  {
    _.mapIdentical( [ 'a', 7, 'b', 13 ], [ 'a', 7, 'b', 14 ] );
  });
  test.shouldThrowError( function()
  {
    _.mapIdentical( 'a','b' );
  });
  test.shouldThrowError( function()
  {
    _.mapIdentical( 1,3 );
  });
  test.shouldThrowError( function()
  {
    _.mapIdentical( null,null );
  });
  test.shouldThrowError( function()
  {
    _.mapIdentical( undefined,undefined );
  });

  test.description = 'too few arguments';
  test.shouldThrowError( function()
  {
    _.mapIdentical( {} );
  });

  test.description = 'too much arguments';
  test.shouldThrowError( function()
  {
    _.mapIdentical( {}, {}, 'redundant argument' );
  });

}

```
Тест рутина `mapIdentical` прокиває ( тестує ) рутину із аналогічною назвою `mapIdentical` та такою реалізацією:

```javascript

function mapIdentical( src1,src2 )
{

  _.assert( arguments.length === 2 );

  if( Object.keys( src1 ).length !== Object.keys( src2 ).length )
  return fale;

  for( var s in src1 )
  {
    if( src1[ s ] !== src2[ s ] )
  return false;
  }

  return true;
}

```