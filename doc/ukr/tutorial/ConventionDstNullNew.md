# Call conventions: dst - null

Передача значення <code>null</code> в параметр <code>dst</code>.

Рутини модуля, котрі містять параметр `dst` можуть приймати аргументом `null`. 
Це особливий випадок в якому створюється новий контейнер і в нього поміщається результат виконання рутини.

### Використання `null`аргумента 

```js
var dst = [ 1, 2, 3 ];
var src = [ 3, 4, 5 ];

var resultDst = _.arrayAppendArray( dst, src );
var resultNew = _.arrayAppendArray( null, src );

console.log( dst ); // log [ 1, 2, 3, 3, 4, 5 ]
console.log( src ); // log [ 3, 4, 5 ]
console.log( resultDst ); // log [ 1, 2, 3, 3, 4, 5 ]
console.log( resultNew ); // log [ 3, 4, 5 ]

console.log( dst === resultDst ); // log true 
console.log( src === resultNew ); // log false
```

Для прикладу використовується рутина `arrayAppendArray`, котра приймає до 4 параметрів - `dst`, `src`, `onEvaluate1`, `onEvaluate2`. Значення парметрів `dst` i `src` описані в [ конвенції щодо найменування параметрів ]( './ConventionCallbecksInArray.md' ), а призначення `onEvaluate1` i `onEvaluate2` в туторіалі про [ колбеки ]( './ConventionCallbecksInArray.md' ). Рутина `arrayAppendArray` додає елементи з масиву `src` в кінець масиву `dst`. Відповідно до конвенції, змінні `dst` i `resultDst` мають однаковий вміст і є посиланнями на один і той же масив. 
У другому випадку замість масиву в параметр `dst` було передано `null`. Рутина `arrayAppendArray` створила новий контейнер і помістила в нього результат. А тому, масив `src` i `resultNew` мають однаковий вміст і є різними масивами.

### Підсумок

- Рутини, що мають параметр `dst` можуть створювати новий порожній контейнер, в який поміщається результат виконання.
- Щоб створити новий контейнер в параметр `dst` потрібно передати `null`.

[Повернутись до змісту](../README.md#Туторіали)
