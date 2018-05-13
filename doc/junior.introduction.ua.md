#  Мануал початківця wTools
***
## Зміст
1. [Репозиторій](#repository)
2. [Клонування репозиторію](#repository-cloning)
3. [Встановлення пакету](#package-installation)
4. [Способи запуска тестів](#way-of-test-running)
5. [Кількість вихідної інформації](#verbosity)
6. [Підказка по параметрам скрипта](#getting-parameters-help)
7. [Опції тестера](#tester-options)
8. [Структурні одиниці тестування](#testing-structure-units)
9. [Розташуванння окремих тест рутин та їх реалізацій](#test-routines-location)

<a name="repository"/>

## Репозиторій
***
Репозіторій розташовано за адресою  [https://github.com/Wandalen/wTools](https://github.com/Wandalen/wTools)

<a name="repository-cloning"/>

## Клонування репозиторію
***
Для клонування репозіторію використовувати команду `git clone https://github.com/Wandalen/wTools.git`

<a name="package-installation"/>

## Встановлення пакету
***
Для встановлення пакету глобально використовуйте
`npm install`
`npm install -g wTesting`
відповідно перейшовши в директорію (теку) проекту

<a name="way-of-test-running"/>

## Способи запуска тестів
***
 Існують три способа запуска тестів з наступними командами

| Спосіб запуску               | Команда                                         |
|:-----------------------------|:------------------------------------------------|
| Безпосередньо через npm      | `npm test`                                      |
| Альтернативний спосіб запуску| `wtest staging`                                 |
| Використовуючи тест сюіти    | `wtest staging\dwtools\abase\z.test\Map.test.s` |

Экран терміналу `npm test` в операційній системі Linux буде виглядати наступним образом:

![Результат команди npm test](https://imgur.com/a/Jm3Tn5u)

<a name="verbosity"/>

## Кількість вихідної інформації
***

Кількість інформації, яка буде видаватися скриптом, можно регулювати наступним чином:
використовуючи параметр `verbosity`, який регулює багатослівність.

| Параметр      | Кількість отриманої інформації |
|:--------------|:-------------------------------|
| verbosity:0   | Жодної інформації              |
| verbosity:1   | Один рядок                     |
| verbosity:2   | Багато рядків                  |
| verbosity:9   | Максимум                       |

Наприклад: `wtest staging verbosity:2`

<a name="getting-parameters-help"/>

## Підказка по параметрам скрипта
***
 Для отримання підказки по параметрам використовуйте 
 `wtest staging scenario:help`

| Сценарії      | Виконувана дія                            |
|:--------------|:------------------------------------------|
| test          | Запустити тести, сценарій за замовчуванням|
| help          | Отримати допомогу                         |
| options.list  | Перелік наявних опцій                     |
| scenarios.list| Перелік наявних сценаріїв                 |
| suits.list    | Перелік наявних сютів                     |

<a name="tester-options"/>

## Опції тестера
***
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
***

> Тест сюіт - це набір тест кейсів, які поєднанні тим, що відносяться до одного тестуємого модуля, функціональності,
приоритету або одному типу тестування. Кожний тест сюіт містить більш ніж один тест кейс та виконується загалом усією "пачкою" в процесі тестування.

> Тест кейси поєднують в тест сюіти для більшого зручності при проходженні тестів, проходячи їх послідовно від модуля до модуля, а не сумбурно, залишив не перевіренною більшу частину модуля або загальну функціональность.  

| Структурна одиниця      | Кількість в пакеті wTools|
|:------------------------|:-------------------------|
| Тест сюіт               | 14                       |
| Тест рутина             | 184                      |
| Тест кейс               | 1332                     |
| Тест перевірка          | 2296                     |

<a name="test-routines-location"/>

## Розташуванння окремих тест рутин та їх реалізацій
***
Окремі тест рутини розташовані в директорії `wTools/staging/dwtools/abase`

Вони мають вигляд (на прикладі Тест рутини mapIdentical):

```javascript
var Self =
{

  name : 'MapTest',
  silencing : 1,

  tests :
  {

    // map tester

    mapIs : mapIs,

    // map move

    mapClone : mapClone,

    mapExtendConditional : mapExtendConditional,
    mapExtend : mapExtend,
    mapSupplement : mapSupplement,
    mapComplement : mapComplement,

    mapCopy : mapCopy,

    // map convert

    mapFirstPair : mapFirstPair,

    mapToArray : mapToArray,
    mapValWithIndex : mapValWithIndex,
    mapKeyWithIndex : mapKeyWithIndex,
    mapToStr : mapToStr,

    // map properties

    mapKeys : mapKeys,
    mapOwnKeys : mapOwnKeys,
    mapAllKeys : mapAllKeys,

    mapVals : mapVals,
    mapOwnVals : mapOwnVals,
    mapAllVals : mapAllVals,

    mapPairs : mapPairs,
    mapOwnPairs : mapOwnPairs,
    mapAllPairs : mapAllPairs,

    mapProperties : mapProperties,
    mapOwnProperties : mapOwnProperties,
    mapAllProperties : mapAllProperties,

    mapRoutines : mapRoutines,
    mapOwnRoutines : mapOwnRoutines,
    mapAllRoutines : mapAllRoutines,

    mapFields : mapFields,
    mapOwnFields : mapOwnFields,
    mapAllFields : mapAllFields,

    mapOnlyAtomics : mapOnlyAtomics,

    // map logic

    mapBut : mapBut,

    mapOwnBut : mapOwnBut,

    mapButConditional : mapButConditional,

    mapScreens : mapScreens,
    mapScreen : mapScreen,
    _mapScreen : _mapScreen,

    mapIdentical : mapIdentical,
    mapContain : mapContain,

    mapOwnKey : mapOwnKey,

    mapHasAll : mapHasAll,
    mapHasAny : mapHasAny,
    mapHasNone : mapHasNone,

    mapOwnAll : mapOwnAll,
    mapOwnAny : mapOwnAny,
    mapOwnNone : mapOwnNone,

    // mapGroup : mapGroup,

  }

}
```

Їх реалізаціі мают наступний вигляд:

```javascript
/**
 * The mapIdentical() returns true, if the second object (src2)
 * has the same values as the first object(src1).
 *
 * It takes two objects (scr1, src2), checks
 * if both object have the same length and [key, value] return true
 * otherwise it returns undefined.
 *
 * @param { objectLike } src1 - First object.
 * @param { objectLike } src2 - Target object.
 * Objects to compare values.
 *
 * @example
 * // returns true
 * mapIdentical( { a : 7, b : 13 }, { a : 7, b : 13 } );
 *
 * @example
 * returns false
 * _.mapIdentical( { a : 7, b : 13 }, { a : 33, b : 13 } );
 *
 * @example
 * returns false
 * _.mapIdentical( { a : 7, b : 13, c : 33 }, { a : 7, b : 13 } );
 *
 * @returns { boolean } Returns true, if the second object (src2)
 * has the same values as the first object(src1).
 * @function mapIdentical
 * @throws Will throw an error if ( arguments.length !== 2 ).
 * @memberof wTools
 */

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