# How to measure time 

Measurement of algorithms performance to choose the best solution.

A problem can have more than one solution and measurement of execution time is a tool for choosing the best solution.

### Time measurement

Measure the current time with the routine `_.time.now ()` or alternatively `Date.now ()` before running the algorithm.

``` js
var time = _.time.now();
```

Save the result to a variable or a constant. Get the time difference with the routine `_.time.spent` after running the algorithm.

```js
_.time.spent( time );
```

Also, it is possible to call `_.time.now ()` again and find the difference between the two measurements, but then it needs the manual transformation of the units.

### Example

To demonstrate the time measurement technique, create a file `Performance.js` with the following content.

<details>
<summary><u>Code of the file <code>Performance.js</code></u></summary>

``` js
let _ = require( 'wTools' );
let times = 100;
let size = 2000000;
let array = new U8x( size );

var counter = 0;
var time = _.time.now();
for( let i = times ; i > 0; i-- )
var result = forLoop( array, () => counter += 1 );
console.log( `For loop took ${_.time.spent( time )} on Njs ${process.version}` );
console.info( `Output ${counter} to avoid unwanted optimization` );

var counter = 0;
var time = _.time.now();
for( let i = times ; i > 0; i-- )
var result = forEach( array, () => counter += 1 );
console.log( `For each took ${_.time.spent( time )} on Njs ${process.version}` );
console.info( `Output ${counter} to avoid unwanted optimization` );

function forLoop( src, onEach )
{
  for( let k = 0 ; k < src.length ; k++ )
  onEach( src[ k ], k, src );
  return src
}

function forEach( src, onEach )
{
  src.forEach( ( e, k, src ) => onEach( e, k, src ) );
  return src;
}

```

</details>

The above code has 2 implementations of the iteration of array elements. It is `forLoop` and` forEach`. The program measures the time it takes to iterate for elements of the array with a length of 2,000,000 elements. To minimize the error introduced by the dynamic environment, the iteration is done 100 times in both ways.

### Measurement results

The test results should be compiled into a table indicating the interpreter and its version. The results can vary greatly from interpreter to interpreter, version to version.

| Interpretor  | forLoop | forEach |
|--------------|---------|---------|
| Njs v10.16.0 | 4.240 s | 7.195 s |
| Njs v11.3.0  | 4.359 s | 7.212 s |
| Njs v12.7.0  | 4.982 s | 8.850 s |
| Njs v13.3.0  | 4.978 s | 8.756 s |

The report shows that the `for` loop works twice as fast as the` forEach` loop. On this basis, it should be recommended to use the 1st variant of the algorithm implementation.

### Reliability and Error

It is difficult to guarantee the reliability of the test results, but it is possible to avoid some of the common mistakes. The received data of time measurement results are reliable if it is possible to make predictions about the performance of the algorithm.

The impact of the environment must be minimized. Difficult tasks that are performing in the background on your machine can significantly distort the result. The results cannot be compared if they were obtained under different conditions. If the environment changes, then the result changes. The results measured on the different machines cannot be compared. And no matter how hard you try, there is still the impact of the case and the uncontrollable factors. So, you need to do the measurement several times and take the average or total value.

The measurement cannot be accurate if the time interval is measured in just a millisecond. Finger rule: The interval should be at least one second.

Another mistake that can be made is when the total time includes  test data generation time. Test data generation takes time. The data should be prepared before the start of time measurement and used when needed.

Interpreter optimization is another pitfall. The interpreter may throw away some of the code if it notices that it is not being used. So the tested algorithm should have valid arguments and the result of the execution should be used somehow.

### Summary

- Time can be measured with a couple of routines `_.time.now` and `_.time.spent`.
- To ensure the reliability of the results, it is need to minimize the environment influence.
- To minimize the error, run the experiment multiple times and use the average or total time.
- The duration of one experiment should be such as to eliminate the possibility of significant errors.
- Data generation must be separate from algorithm performance testing.
- The runtime dynamic introduces an error into the measurement, so the algorithm should be executed several times to obtain an average value.
- Dynamic environment impact should be minimized: equal load, same versions, one machine.
- The performance of an algorithm in one interpreter may differ from the performance of the algorithm in another interpreter. The report should include information about the interpreter and its version.
- Щоб уникнути небажаної оптимізації використайте результат виконання алгоритму що досліджується і передайте коректні вхідні аргументи.

[Back to content](../README.md#Tutorials)
