## Errors handling done right: stateful exceptions

### Abstract

This article shows the state of the art techniques of handling errors. Poor error reporting technique slows down a software development. Asynchronous errors complicates the problem of generating readable and informative error report.

### Error

There are several things thrown error could possibly communicate to an engineer:

- Calls stack
- Arguments
- Asynchronous calls stack
- Catches stack
- Source code
- Message
- Is brief
- Was it logged
- Was it attended
- ID

### Constructing an error

Use routine `_.err` to construct an error object. Source code of the most straightforward example you may see below.

``` js

try
{
  throw _.err( 'Simplest error sample' );
}
catch( err )
{
  console.log( err );
  throw err;
}

```

Such a source code outputs the log below.

```
= Message of error#1
   Simplest error sample

= Beautified calls stack
   at Object.<anonymous> (/Simplest.js:4:11)

= Throws stack
   caught at Object.? @ /Simplest.js:4
```

Routine `_.err` constructs an error. This routine expects any number of arguments. Routine `_.err` concatenates all input arguments into one error. If it finds an error object in arguments, it reuses the error instead of making a new one.

### Calls stack

Hardly possible to find a programming language which ships that from the box. Stack of calls in the error report is useful to locate the location in source code where the error was thrown.

In our implementation, calls stack is stored in the `callsStack` field of an error.

### Stack with arguments

Just knowing which functions were called is good. Knowing what arguments were used gives much more information about the state. There are two obstacles to include such information in an error report. It’s challenging to implement the feature in JS without dramatical performance overhead. Another challenge is formatting text derived from the arguments which have arbitrary data structure.

![Calls stack with arguments](../../img/callsStackArguments/CallsStackArguments.png)

On the diagram above you may see how stack with embedded arguments could look like comparing to ordinary stack.

Our implementation does not include arguments of calls in an error report.

### Asynchronous calls stack

Most programs are asynchronous. That’s why knowing the current state of the call stack could be not quite useful. Gathering information about asynchronous calls decreases performance.

``` js
function program()
{
  let consequence = new _.Consequence();
  consequence.then( function asyncCallback( arg )
  {
    if( arg >= 0 )
    return arg-1;
    else
    throw _.err( 'Example' );
  });
  consequence.take( -1 );
}
```

It would be useful to have in the report of error thrown from `routine asyncCallback` calls stack of `routine program`.

```

 = Message of error#1
    Example

 = Beautified calls stack
    at wConsequence.asyncCallback (AsyncStack2.js:16:13)
    at wConsequence.take (Consequence.s:2900:8)
    at program (AsyncStack2.js:18:15)
    at Object.<anonymous> (AsyncStack2.js:6:1)
    at Module._compile (internal/modules/cjs/loader.js:777:30)
    at Object.Module._extensions..js (internal/modules/cjs/loader.js:788:10)
    at Module.load (internal/modules/cjs/loader.js:643:32)
    at Function.Module._load (internal/modules/cjs/loader.js:556:12)
    at Function.Module.runMain (internal/modules/cjs/loader.js:840:10)
    at internal/main/run_main_module.js:17:11

    at program (AsyncStack2.js:11:15)
    at Object.<anonymous> (AsyncStack2.js:6:1)
    at Module._compile (internal/modules/cjs/loader.js:777:30)
    at Object.Module._extensions..js (internal/modules/cjs/loader.js:788:10)
    at Module.load (internal/modules/cjs/loader.js:643:32)
    at Function.Module._load (internal/modules/cjs/loader.js:556:12)
    at Function.Module.runMain (internal/modules/cjs/loader.js:840:10)
    at internal/main/run_main_module.js:17:11

 = Throws stack
    thrown at wConsequence.asyncCallback @ AsyncStack2.js:16
    thrown at attend @ abase\l0\l9\Setup.s:94
    thrown at errLog @ abase\l0\l9\Setup.s:57
    thrown at errLog @ abase\l0\l9\Setup.s:59

 = Process
    Current path : C:\example
    Exec path : C:\Program Files\nodejs\node.exe AsyncStack2.js

 = Source code from AsyncStack2.js:16
      14 :     return arg-1;
      15 :     else
    * 16 :     throw _.err( 'Example' );
      17 :   });
      18 :   consequence.take( -1 );

```

That code produces such error report. Asynchronous calls stack goes just after synchronous calls stack. Top of asynchronous stack is `at program (AsyncStack2.js:11:15)`.

Our implementation has limited and experimental support of asynchronous calls stack in error reports.

### Throws stack

Throws stack gives information about order and locations in code of throws of an error. `Try block` catches thrown error from the code in the block. Catching an error `try block` puts a record about its location in the throws stack and throws it. The next `try block` can catch it again. It can either rethrow it or log it. Routine `_.err` is helpful to either rethrow error or log it. The routine appends the stack of throws with the new location. That's how we get a stack of throws. It could be useful to track chain of `try blocks`. Its length is always shorter or equal than calls stack. The first element of the stack is the location where the error was thrown initially, and each other locations were rethrown.

``` js

function decrement( i )
{
  try
  {
    if( i <= 0 )
    throw _.err( 'negative!' );
    return i-1;
  }
  catch( err )
  {
    throw _.err( err, '\nFailed to decrement' );
  }
}

function divide( i )
{
  try
  {
    if( i % 2 === 1 )
    throw _.err( 'odd!' );
    return decrement( i / 2 );
  }
  catch( err )
  {
    throw _.err( err, '\nFailed to divide' );
  }
}

divide( 0 );

```

This example throws error at line `throw _.err( 'odd!' )`. Line `throw _.err( err, '\nFailed to decrement' )` rethrow the error. Information about that is added to error by routine `_.err`. Same thing happen at line `throw _.err( err, '\nFailed to divide' )`.

```
= Message of error#1
   negative!
   Failed to decrement
   Failed to divide

= Beautified calls stack
   at decrement (ThrowsStack.js:6:13)
   at divide (ThrowsStack.js:21:12)
   at Object.<anonymous> (ThrowsStack.js:29:1)
   at Module._compile (internal/modules/cjs/loader.js:777:30)
   at Object.Module._extensions..js (internal/modules/cjs/loader.js:788:10)
   at Module.load (internal/modules/cjs/loader.js:643:32)
   at Function.Module._load (internal/modules/cjs/loader.js:556:12)
   at Function.Module.runMain (internal/modules/cjs/loader.js:840:10)
   at internal/main/run_main_module.js:17:11

= Throws stack
   thrown at decrement @ ThrowsStack.js:6
   thrown at decrement @ ThrowsStack.js:11
   thrown at divide @ ThrowsStack.js:25
   thrown at attend @ abase\l0\l9\Setup.s:94
   thrown at errLog @ abase\l0\l9\Setup.s:57
   thrown at errLog @ abase\l0\l9\Setup.s:59
```

Above, you may see throws stack of the sample.

Our implementation collects throws into a stack. In current implementation throws stacks has its own section. But in smarter implementation throws stack could be integrated in calls stack. It's possible to decrease length of error report merging information of two stack into one section.

### Message

A developer can communicate information about the expected behavior of an algorithm writing explanation in the message of an error. A developer can add extra dynamic information, which is not included in the error report automatically. Most often, a chain of `try block` rethrow the same error multiple times, appending a message with extra information in the same manner as throws stack is appended by the location where the error is rethrown. It does not happen automatically, a developer should define a new message explicitly. However, a developer can get assistance in concatenating a message from substring or entities of different types.

In our implementation routine `_.err` produces an error from arguments, and if any of the arguments were an error, then the routine reuse the error instead of creating new error, amending it.

Here you may see example of proper message amending.

``` js
function decrement( i )
{
  try
  {
    if( i <= 0 )
    throw _.err( 'negative!' );
    return i-1;
  }
  catch( err )
  {
    throw _.err( err, '\nFailed to decrement' );
  }
}

function divide( i )
{
  try
  {
    if( i % 2 === 1 )
    throw _.err( 'odd!' );
    return decrement( i / 2 );
  }
  catch( err )
  {
    throw _.err( err, '\nFailed to divide' );
  }
}

divide( 0 );

```

Line `throw _.err( 'negative!' )` throws an error. Line `throw _.err( err, '\nFailed to decrement' )` rethrows it amending the message with `Failed to decrement`, and the line `throw _.err( err, '\nFailed to divide' )` rethrows it amending the message with `Failed to divide`. In the log, a developer sees a multiline message which mimics stack of throws.

```
= Message of error#1
   negative!
   Failed to decrement
   Failed to divide
```

### Statefulness of an error

Nobody wants to see duplicates of an error in a log. Right? If a program has chains of `try blocks` it can happen. How to avoid it? The handy technique is the statefulness of an error object. Changing a field of an error logging will make it possible to get a clear and confident answer on the question: "was the error logged?"

``` js

function decrement( i )
{
  try
  {
    if( i <= 0 )
    throw _.err( 'negative!' );
    return i-1;
  }
  catch( err )
  {
    err = _.err( err, '\nFailed to decrement' );
    if( _.errOnce( err ) )
    console.log( err );
    throw err;
  }
}

function divide( i )
{
  try
  {
    if( i % 2 === 1 )
    throw _.err( 'odd!' );
    return decrement( i / 2 );
  }
  catch( err )
  {
    err = _.err( err, '\nFailed to divide' );
    if( _.errOnce( err ) )
    console.log( err );
    throw err;
  }
}

divide( 0 );

```

In the sample above, you may see that both `catch blocks` tries to log error. But only the first executed `catch block` does it because the error has a state which is changed by routine `_.errOnce`. In the output, you will see only one error, no duplicates.

In practice, the field `logged` is not enough. In our implementation, we also have a field `attended`. Accessors of an error help to detect a moment of logging an error.

### Command-line user interface

Implementing a command-line user interface ( CLI ) developer often needs to solve the problem of reporting bad input data. A sound error reporting system helps a developer to differentiate errors caused by the mistake of a user and errors caused by the mistake of a developer. End-user doesn't want to see stacks and extra information which are appreciated by the developer.

``` js

function decrement( i )
{
  try
  {
    if( i <= 0 )
    throw _.errBrief( 'Please, specify positive number.' );
    return i-1;
  }
  catch( err )
  {
    console.log( err );
    throw err;
  }
}

decrement( 0 );

```

Above, you may see a sample. It throws the error constructed with routine `_.errBrief`. The routine set field of the error indicating that the log of the error should have no stack or other extra information.

Brief errors are other manifestations of the technique explained in section `Statefulness of an error`.

### Tracking of errors

Tracking of an error is easy if code is synchronous. But if the program becomes complicated and asynchronous, it is often not easy to understand which error where goes. To make tracking of errors more comfortable, let's add a field ID to error object. Let's log the ID with other diagnostic information. If the ID of an error stays the same from a run to a run of a program, then the developer may use the id to track it.

Brief errors are other manifestations of the technique explained in section `Statefulness of an error`.

### Mechanisms of catching an error

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

Don't confuse unattended errors and unhandled errors. One of the possible strategies of handing of unhandled errors is halting an application. Another viable and recommended strategy of handling of unhandled errors is haling only if the error is also unattended.

### Unhandled asynchronous error

Similar to unhandled synchronous errors, unhandled asynchronous errors are that which was not handled by `try block`. In the case of asynchronous error, `try block` can be asynchronous too. Mechanism of synchronous unhandled error handling is built in the language. Unlike synchronous variant asynchronous mechanism of synchronous unhandled error handling is done by implementation of `Promise`/`Consequence`.

Don't confuse unattended errors and unhandled errors. One of the possible strategies of handing of unhandled errors is halting an application. Another viable and recommended strategy of handling of unhandled errors is haling only if the error is also unattended.

### Unattended error

Unattended error is one that didn't get proper handling yet. An unhandled error is one that was caught in handler catching unhandled errors. Unattended error is not the same as an unhandled error.

### Release mode

Performance overhead should be minimized in release mode. Collecting arguments, asynchronous calls stack, and other information which can decrease performance should be off in release mode.

### Summary

Statefulness of error is preferable because that technique lets solve problems

- Of removing duplicates
- Of differentiation of user errors and developer errors
- Of tracking error

An error object can have such fields

- Calls stack
- Arguments
- Asynchronous calls stack
- Catches stack
- Source code
- Message
- Is brief
- Was logged
- Was attended
- ID

Despite the fact, the article is about JS, these techniques are applicable to other languages.
