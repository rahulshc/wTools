## Концепції

<details><summary><a href="./concept/MapOptions.md#Масив-аргументів">
      Масив аргументів
  </a></summary>
  Це сукупність параметрів рутини, котрі сформовано в псевдомасив <code>arguments</code>.
</details>
<details><summary><a href="./concept/MapOptions.md#Мапа-опцій">
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
  Це рутина або декілька рутини, котрі здійснюють співставлення значень елемента масиву та елемента порівняння після виконання над ними деякої операції. Евалуатор викликається зовнішньою рутиною, якщо значення після перетворень еквівалентні, то зовнішня рутина може виконати дію над елементом масиву.
</details>
<details><summary><a href="./concept/Equalizer.md">
      Еквалайзер
  </a></summary>
  Це рутина, котра використовує логічну умову для управління доступом зовнішньої рутини до елементу масиву. Еквалайзер викликається зовнішньою рутиною, він відкриває доступ до елементу масиву, якщо умова виконується.
</details>
<details><summary><a href="./concept/TypePrimitive.md">
      Тип primitive
  </a></summary>
  Усі типи даних, що передають незмінювані величини називають простими або примітивними.
</details>
<details><summary><a href="./concept/TypePrimitive.md#Тип-string">
      Тип string
  </a></summary>
  Примітивний тип JavaScript для представлення текстових даних. Це послідовність елементів з 16-бітних беззнакових цілих чисел, де кожен елемент займає визначену позицію.
</details>
<details><summary><a href="./concept/TypeUnroll.md">
      Тип <code>unroll</code>
  </a></summary>
  <code>Unroll</code> - тип даних - особливий вид масиву, здатний розготатись в іншому масиві при виконанні операції над ним.
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

<details><summary><a href="./tutorial/ArrayCountElement.md">
      Рутина arrayCountElement
  </a></summary>
  Рутина для підрахунку кількості входжень елемента в масив.
</details>
<details><summary><a href="./tutorial/RoutineFromPreAndBody.md">
      Рутина routineFromPreAndBody
  </a></summary>
  Автоматичне об'єднання рутини підготовки даних і рутини для їх обробки.
</details>
<details><summary><a href="./tutorial/Vectorize.md">
      Векторизація рутин
  </a></summary>
  Як використовувати рутину vectorize для векторизації скалярних рутин.
</details>
