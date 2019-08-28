## Концепції

<details><summary><a href="./concept/RoutineInput.md#Масив-аргументів">
      Масив аргументів
  </a></summary>
  Це сукупність параметрів рутини, котрі сформовано в псевдомасив <code>arguments</code>.
</details>
<details><summary><a href="./concept/RoutineInput.md#Мапа-опцій">
      Мапа опцій
  </a></summary>
  Це контейнер, що призначений для передачі даних в рутину та управління її поведінкою.
</details>
<details><summary><a href="./concept/Vector.md">
      Вектор
  </a></summary>
  Це контейнер, що призначений для передачі даних в рутину, містить впорядкований скінченний набір елементів (даних).
</details>
<details><summary><a href="./concept/Evaluator.md">
      Евалуатор
  </a></summary>
  Це одна або дві функції, які дозволяють довільним чином перетворити елементи масиву перед їх порівнянням. Якщо отримані значення співпадають евалуатор повертає <code>true</code>, інакше - <code>false</code>. Евалуатор, в якості колбека, передається в рутини роботи із масивами.
</details>
<details><summary><a href="./concept/Equalizer.md">
      Еквалайзер
  </a></summary>
  Це функція, котра порівнюючи два елементи масиву повертає <code>true</code> у випадку, якщо умова порівняння виконується, інакше - <code>false</code>. Еквалайзер, в якості колбека, передається в рутини роботи із масивами.
</details>
<details><summary><a href="./concept/TypePrimitive.md">
      Тип <code>primitive</code>
  </a></summary>
  В <code>JavaScript</code> усі типи даних, що є цілісними і не мають змінюваних елементів називають примітивними.
</details>
<details><summary><a href="./concept/TypePrimitive.md#Тип-string">
      Тип <code>string</code>
  </a></summary>
  Примітивний тип даних для представлення текстових даних.
</details>
<details><summary><a href="./concept/TypeIndexed.md">
      Впорядковані типи даних
  </a></summary>
  Комплексні типи даних, що містять множину елементів котрі ідентифікуються за індексом.
</details>
<details><summary><a href="./concept/TypeUnroll.md">
      Тип <code>unroll</code>
  </a></summary>
  <code>Unroll</code> - тип даних - особливий вид масиву, здатний розготатись в іншому масиві при виконанні операції над ним.
</details>
<details><summary><a href="./concept/Buffer.md">
      Буфер
  </a></summary>
  В  <code>JavaScript</code>, це спеціальний об'єкт, що призначений для зберігання та обробки необроблених бінарних даних.
</details>

## Туторіали

<!-- <details><summary><a href="./tutorial/Abstract.md">
      Загальна інформація
  </a></summary>
  Загальна інформація про модуль Tools.
</details>
<details><summary><a href="./tutorial/Installation.md">
      Встановлення
  </a></summary>
  Процедура встановлення модуль Tools.
</details> -->

<details><summary><a href="./tutorial/ConventionNamingInArray.md">
      Array routines call conventions: naming
  </a></summary>
  Принципи найменування рутин сімейства <code>Array</code>.
</details>
<details><summary><a href="./tutorial/ConventionCallbecksInArray.md">
      Array routines call conventions: callbacks
  </a></summary>
  Як використовувати <code>callback</code>-и в рутинах сімейства <code>Array</code>.
</details>
<details><summary><a href="./tutorial/ConventionDstArgInArray.md">
      Array routines call conventions: dst argument
  </a></summary>
  Про що свідчить використання аргумента <code>dst</code>.
</details>
<details><summary><a href="./tutorial/ConventionDefaultsMapInRoutine.md">
      Routines call convention: routine defaults map
  </a></summary>
  Як зберігаються та змінюються налаштування за замовчуванням в рутинах.
</details>
<details><summary><a href="./tutorial/RoutineFromPreAndBody.md">
      Рутина routineFromPreAndBody
  </a></summary>
  Автоматичне об'єднання рутини підготовки даних і рутини для їх обробки.
</details>
<details><summary><a href="./tutorial/Vectorize.md">
      Векторизація рутин
  </a></summary>
  Як використовувати рутину <code>vectorize</code> для векторизації скалярних рутин.
</details>
<details><summary><a href="./tutorial/VectorizeOptions.md">
      Налаштування рутин при векторизації
  </a></summary>
  Як використовувати опції рутини <code>vectorize</code> при створенні векторизованої рутини.
</details>
