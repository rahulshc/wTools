## Mechanisms of catching errors

There are 4 mechanisms of catching an error in JS depending on the source of an error.

- Synchronous catching
- Asynchronous catching
- Synchronous unattended catching
- Asynchronous unattended catching

### Synchronous error

The first mechanism is straightforward, `try block` catches a synchronous error, and its corresponding `catch block` handle the error.

``` js
try
{
  throw _.err( 'Error!' );
}
catch( err )
{
  console.log( err );
}
```

Nothing special about the code. Routine `_.err` constructs an error.

### Asynchronous error

Asynchronous catching takes place in asynchronous code.

``` js
consequence
.then( function decrement( arg )
{
  if( arg <= 0 )
  throw _.err( 'negative!' );
  return arg-1;
})
.then( function divide( arg )
{
  if( arg % 2 === 1 )
  throw _.err( 'odd!' );
  return arg*2;
})
.catch( ( err ) =>
{
  console.log( err );
})
```

In this example, errors are thrown by either `callback decrement` or `callback divide` of `Consequence`/`Promise`. This error is handled by `catch callback`.

### Unhandled synchronous error

Both browser and Nodejs, as well as most programming environments, provide a mechanism to handle the unattended error. If `try blocks` fail to process it and there is no `try block` left in the stack, then the error will become unhandled.

``` js
process.on( 'uncaughtException', function( err )
{
})
```

Nodejs let developers catch such errors with code above.

``` js
window.onerror = function( err )
{
}
```

Browser let developer catch such errors with code above.

```
------------------------------- unhandled error ------------------------------->

 = Application
    Current path : /
    Exec path : /bin/node /Once.js

 = Message of error#1
    negative!
    Failed to decrement
    Failed to divide

 = Beautified calls stack
    at decrement (/Once.js:7:13)
    at divide (/Once.js:25:12)
    at Object.<anonymous> (/Once.js:36:1)

 = Throws stack
    caught at decrement @ /Once.js:7
    caught at decrement @ /Once.js:12
    caught at divide @ /Once.js:29
    caught at handleError @ /Setup.s:148

------------------------------- unhandled error -------------------------------<
```

Above, you may see the log of unhandled error. Such a report may be complemented by extra information such as process arguments, current path, and other useful for debugging data.

### Unhandled asynchronous error

Similar to unhandled synchronous errors, unhandled asynchronous errors are that which was not handled by `try block`. In the case of asynchronous error, `try block` can be asynchronous too. Mechanism of synchronous unhandled error handling is built in the language. Unlike synchronous variant asynchronous mechanism of synchronous unhandled error handling is done by implementation of `Promise`/`Consequence`.

### Unattended error

Unattended error is one that didn't get proper handling yet. An unhandled error is one that was caught in handler catching unhandled errors. Unattended error is not the same as an unhandled error.

``` js
try
{
  throw _.err( 'Simplest error sample' );
}
catch( err )
{
  _.errAttend( err );
}
```

xxx.

Don't confuse unattended errors and unhandled errors. One of the possible strategies of handing of unhandled errors is halting an application. Another viable and recommended strategy of handling of unhandled errors is halting it only if the error is also unattended.

### Summary

xxx.
