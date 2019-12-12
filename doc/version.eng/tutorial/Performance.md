# How to measure the performance of the algorithm 

Measuring the performance of an algorithm to choose the optimal solution.

Any task can have more than one solution. Each of the solution algorithms has its advantages and disadvantages and therefore needs a reasonable choice. Among the indicators by which the solution is chosen is the reduced amount of RAM usage, and the reduced execution time by the algorithm. So, let's determine how to evaluate the execution time of an algorithm, in other words, the algorithm performance.

### Features of measurement of algorithm performance

The main rule of the performance testing of an algorithm is: obtained data should have high accuracy. The following rules must be followed to ensure the accuracy of the data::

- Separate algorithms should have separate implementations.
- Access to individual algorithms should be the same.
- The generation of data and measurement of algorithm performance are two different steps, so their execution should be separated.
- Testing should be performed on one machine. If more than one machine is used, a complete test cycle should be performed on each machine. In this case, it analyzes the overall trend, relative values, not specific measurements.
- It is necessary to limit the influence of random factors. For example, postpone operating system tasks scheduled on testing time, stop unnecessary processes and tasks.
- To confirm the received data, at least 5 measurements of time on each algorithm are required. It is allowed to find the average time of passage and is allowed to trace the influence of random factors.
- The amount of work that the algorithm performs must be sufficient to ensure that the time measurements are not random. For example, the execution time of testing for simple routines should be about 10s or more.

### Stages of performance testing

In general, the procedure is as follows

- Preparation of data for testing.
- Measuring of start time.
- The execution of an algorithm.
- Test completion time measurement.

### Performance testing of iterative algorithms of NodeJS interpreter 

<details>
  <summary><u>File structure</u></summary>

```
performance
    ├── PerformanceTesting.js
    └── package.json
```

</details>

To determine the performance of NodeJS iterative algorithms, create the above file structure.

<details>
    <summary><u>Code of the file <code>PerformanceTesting.js</code></u></summary>

```js
let _ = require( 'wTools' );

/* */

var srcArray = new U8x( 500000000 );

testTime( eachLongsFor, 20, srcArray, onEach );
// testTime( eachLongsForEach, 20, srcArray, onEach );

/* */

function testTime( func, times, data, callback )
{
  var timeStart = _.time.now();
  for( let i = times; i > 0; i-- )
  var result = func( data, callback );
  var spentTime = _.time.spent( timeStart );
  console.log( spentTime );
}

var onEach = ( e, k, src ) => e;

function eachLongsFor( src, onEach )
{
  for( let k = 0 ; k < src.length ; k++ )
  onEach( src[ k ], k, src );
  return src
}

function eachLongsForEach( src, onEach )
{
  src.forEach( onEach );
  return src;
}
```

</details>

Enter the code in the file `Performance.js`.

In the test file compares the execution time of the iteration of array or typed arrays by `for` loop and the` forEach` method.

#### Preparation of the data

In this case, an initialized typed array of single-byte integers is created

```js
var srcArray = new U8x( 500000000 );
```

After generation, a typed array `srcArray` is available for iteration.

#### Algorithm testing

- `func` - a routine that implements an algorithm.
- `times` - restarting the algorithm `times` times. Increases the execution time of the algorithm to ensure the accuracy of the data, and allows the use of less amount of generated data.
- `data` - data for the algorithm.
- `callback` - algorithm callback.

The `testTime` routine measures the start time by using routine `_.time.now ()`

```js
var timeStart = _.time.now();
```

and after execution determines the execution time

```js
var spentTime = _.time.spent( timeStart );
```

Then outputs the data to the console.

In the above code

```js
testTime( entityEachLongsFor, 20, srcArray, onEach );
// testTime( entityEachLongsForEach, 20, srcArray, onEach );
```

one routine is commented on in order not to affect the runtime of another. After conducting experiments with one routine, it is necessary to comment on the first and uncomment on the second.

### Measurement results for NodeJS v10

| Loop for | Method forEach |
| -------- | -------------  |
| 12,8 s   | 137,1 s        |
| 13,0 s   | 137,8 s        |
| 12,9 s   | 138,8 s        |
| 12,5 s   | 137,9 s        |
| 13,1 s   | 138,5 s        |

Testing shows that the built-in `forEach` method works up to 10 times longer than the `for` loop. Based on this, we can say that to increase the performance of the program in the iteration of arrays elements, it is better to use the loop `for`.

### Summary

- The choice of a specific algorithm for solving the problem depends on the conditions. In general, they focus on the amount of RAM used and the execution time of an algorithm.
- The most important factor of the performance testing is the accuracy of the data obtained.
- Random factors should be eliminated to ensure the accuracy of the test data.
- It takes at least 5 measurements of time to determine the characteristic of the algorithm.
- The duration of one experiment should be such as to eliminate the possibility of significant errors.
- Data generation must be separate from algorithm performance testing.

[Back to content](../README.md#Tutorials)
