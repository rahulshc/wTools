**Array Prepend**

|                            | -                   | Once                | OnceStrictly               |
|----------------------------|---------------------|---------------------|----------------------------|
| arrayPrependUnrolling      | dstArray            | -                   | -                          |
| arrayPrepend               | dstArray            | dstArray            | dstArray                   |
| arrayPrependElement        | dstArray            | dstArray            | dstArray                   |
| arrayPrependArray          | dstArray            | dstArray            | dstArray                   |
| arrayPrependArrays         | dstArray            | dstArray            | dstArray                   |
| arrayPrepended             | index               | index <br> if not element was prepended <br> then -1 | index <br> if not element was prepended <br> then -1 |
| arrayPrependedElement      | index               | element <br> if not element was prepended <br> then undefined | element <br> if not element was prepended <br> then undefined; <br> if !Config.debug <br> then index |
| arrayPrependedArray        | number              | number              | number                     |
| arrayPrependedArrays       | number              | number              | number                     |


**Array Append**

|                           | -                   | Once                | OnceStrictly               |
|---------------------------|---------------------|---------------------|----------------------------|
| arrayAppendUnrolling      | dstArray            | -                   | -                          |
| arrayAppend               | dstArray            | dstArray            | dstArray                   |
| arrayAppendElement        | dstArray            | dstArray            | dstArray                   |
| arrayAppendArray          | dstArray            | dstArray            | dstArray                   |
| arrayAppendArrays         | dstArray            | dstArray            | dstArray                   |
| arrayAppended             | index               | index               | index <br> if no element was appended <br> then -1 |
| arrayAppendedElement      | index               | element <br> if not element was appended <br> then false | element <br> if not element was appended <br> then false; <br> if !Config.debug <br> then index |
| arrayAppendedArray        | number              | number              | number                     |
| arrayAppendedArrays       | number              | number <br> if dstArray === undefined <br> then insArray  | number                     |


**Array Remove**

|                           | -                   | Once                | OnceStrictly               |
|---------------------------|---------------------|---------------------|----------------------------|
| arrayRemove               | dstArray            | dstArray            | dstArray                   |
| arrayRemoveElement        | dstArray            | dstArray            | dstArray                   |
| arrayRemoveArray          | dstArray            | dstArray            | dstArray                   |
| arrayRemoveArrays         | dstArray            | dstArray            | dstArray                   |
| arrayRemoved              | number              | number of not removed | number                   |
| arrayRemovedElement       | number              | number of not removed | element                  |
| arrayRemovedArray         | number              | number              | number                     |
| arrayRemovedArrays        | number              | number              | number                     |
| arrayRemoveAll            | dstArray            | -                   | -                          |
| arrayRemovedAll           | number              | -                   | -                          |
| arrayRemoveDuplicates     | dstArray            | -                   | -                          |


**Array Flatten**

|                           | -                   | Once                | OnceStrictly               |
|---------------------------|---------------------|---------------------|----------------------------|
| arrayFlatten              | dstArray            | dstArray            | dstArray                   |
| arrayFlattenDefined       | dstArray            | dstArray            | dstArray                   |
| arrayFlattened            | number <br> if arguments.length === 1 <br> then dstArray | number <br> if arguments.length === 1 <br> then dstArray | number <br> if arguments.length === 1 <br> then dstArray |
| arrayFlattenedDefined     | number <br> if arguments.length === 1 <br> then dstArray | number <br> if arguments.length === 1 <br> then dstArray | number <br> if arguments.length === 1 <br> then dstArray |


**Array Replace**

|                           | -                   | Once                | OnceStrictly               |
|---------------------------|---------------------|---------------------|----------------------------|
| arrayReplace              | dstArray            | dstArray            | dstArray                   |
| arrayReplaceElement       | dstArray            | dstArray            | dstArray                   |
| arrayReplaceArray         | dstArray            | dstArray            | dstArray                   |
| arrayReplaceArrays        | dstArray            | dstArray            | dstArray                   |
| arrayReplaced             | number              | number of not replaced | number                  |
| arrayReplacedElement      | number              | ins <br> if not element was replaced <br> then undefined | ins <br> if not element was replaced <br> then undefined |
| arrayReplacedArray        | number              | number              | number                     |
| arrayReplacedArrays       | number              | number              | number                     |
| arrayReplaceAll           | dstArray            | -                   | -                          |
| arrayReplacedAll          | number              | -                   | -                          |
| arrayUpdate               | dstArray.length     | -                   | -                          |

### Array Prepend

arrayPrependUnrolling - \_arrayPrependUnrolling

arrayPrepend - arrayPrepended ( 2 arg )
arrayPrependOnce - arrayPrependedOnce ( 2-4 arg )
arrayPrependOnceStrictly - arrayPrependedOnceStrictly ( 2-4 arg )

arrayPrependElement - arrayPrependedElement ( 2 arg ) - copy of arrayPrepended
arrayPrependElementOnce - arrayPrependedElementOnce ( 2-4 arg ) - copy of arrayPrependedOnce, difference (return -1 and return undefined)
arrayPrependElementOnceStrictly - arrayPrependedElementOnceStrictly - ( 2-4 arg ) - copy of arrayPrependedOnceStrictly, difference (return -1 and return undefined)

arrayPrependArray - arrayPrependedArray ( 2 arg )
arrayPrependArrayOnce - arrayPrependedArrayOnce ( 2-4 arg )
arrayPrependArrayOnceStrictly - arrayPrependedArrayOnce ( 2-4 arg ) - two routines have similar code

arrayPrependArrays - arrayPrependedArrays ( 2 arg )
arrayPrependArraysOnce - arrayPrependedArraysOnce ( 2-4 arg )
arrayPrependArraysOnceStrictly - arrayPrependedArraysOnce ( 2-4 arg ) - two routines have similar code

### Array Append

arrayAppendUnrolling - \_arrayAppendUnrolling

arrayAppend - arrayAppended ( 2 arg )
arrayAppendOnce - arrayAppendedOnce ( 2-4 arg )
arrayAppendOnceStrictly - arrayAppendedOnceStrictly ( 2-4 arg ) - two routines have similar code

arrayAppendElement - arrayAppendedElement ( 2 arg ) - copy of arrayAppended
arrayAppendElementOnce - arrayAppendedElementOnce ( 2-4 arg ) - copy of arrayAppendedOnce, difference in returned value, but better make one
arrayAppendElementOnceStrictly - arrayAppendedElementOnceStrictly - ( 2-4 arg ) - copy of arrayAppendedOnceStrictly, difference in assetion message

arrayAppendArray - arrayAppendedArray ( 2 arg )
arrayAppendArrayOnce - arrayAppendedArrayOnce ( 2-4 arg )
arrayAppendArrayOnceStrictly - arrayAppendedArrayOnce ( 2-4 arg ) - two routines have similar code

arrayAppendArrays - arrayAppendedArrays ( 2 arg )
arrayAppendArraysOnce - arrayAppendedArraysOnce ( 2-4 arg )
arrayAppendArraysOnceStrictly - arrayAppendedArraysOnce ( 2-4 arg ) - two routines have similar code

### Array Remove

arrayRemove - arrayRemoved = arrayRemovedElement ( 3-4 arg )
arrayRemoveOnce - arrayRemovedOnce ( 3-4 arg )
arrayRemoveOnceStrictly - arrayRemovedOnceStrictly ( 3-4 arg )

arrayRemoveElement - arrayRemovedElement ( 3-4 arg ) - arrayRemoved use this routine
arrayRemoveElementOnce - arrayRemovedElementOnce ( 3-4 arg ) - copy of arrayRemovedOnce
arrayRemoveElementOnceStrictly - arrayRemovedElementOnceStrictly - ( 3-4 arg ) - copy of arrayRemovedOnceStrictly difference in a few description of values

arrayRemoveArray - arrayRemovedArray ( 3-4 arg )
arrayRemoveArrayOnce - arrayRemovedArrayOnce ( 3-4 arg )
arrayRemoveArrayOnceStrictly - arrayRemovedArrayOnce ( 3-4 arg ) - two routines have similar code

arrayRemoveArrays - arrayRemovedArrays ( 3-4 arg )
arrayRemoveArraysOnce - arrayRemovedArraysOnce ( 3-4 arg )
arrayRemoveArraysOnceStrictly - arrayRemovedArraysOnce ( 3-4 arg ) - two routines have similar code

arrayRemoveAll - arrayRemoveAll ( 3-4 arg ) - copy of arrayRemoveElement, difference in cycles
arrayRemoveDuplicates

### Array flatten

arrayFlatten - arrayFlattened ( 1-4 arg )
arrayFlattenOnce - arrayFlattenedOnce ( 1-4 arg )
arrayFlattenOnceStrictly - arrayFlattenedOnceStrictly ( 1-4 arg )

arrayFlattenDefined - arrayFlattenedDefined ( 1-4 arg ) - copy of arrayFlattened, difference in a few lines with checks
arrayFlattenDefinedOnce - arrayFlattenedDefinedOnce ( 1-4 arg ) - copy of arrayFlattenedOnce
arrayFlattenDefinedOnceStrictly - arrayFlattenedDefinedOnceStrictly - ( 1-4 arg ) - copy of arrayFlattenedOnceStrictly difference in a few checks and asserts

### Array Replaced

arrayReplace - arrayReplaced = arrayReplacedElement ( 3-5 arg ) - two routines have similar code
arrayReplaceOnce - arrayReplacedOnce ( 3-5 arg )
arrayReplaceOnceStrictly - arrayReplacedOnceStrictly ( 3-5 arg ) - two routines have similar code

arrayReplaceElement - arrayReplacedElement ( 3-5 arg ) - copy of arrayReplaced
arrayReplaceElementOnce - arrayReplacedElementOnce ( 3-5 arg ) - copy of arrayReplacedOnce but has difference in returned values ( a mistake ins )
arrayReplaceElementOnceStrictly - arrayReplacedElementOnceStrictly - ( 3-5 arg ) - copy of arrayReplacedOnceStrictly but has difference in returned values ( a mistake ins )

arrayReplaceArray - arrayReplacedArray ( 3-5 arg)
arrayReplaceArrayOnce - arrayReplacedArrayOnce ( 3-5 arg)
arrayReplaceArrayOnceStrictly - arrayReplacedArrayOnce ( 3-5 arg) - two routines have similar code

arrayReplaceArrays - arrayReplacedArrays ( 3-5 arg)
arrayReplaceArraysOnce - arrayReplacedArraysOnce ( 3-5 arg)
arrayReplaceArraysOnceStrictly - arrayReplacedArraysOnce ( 3-5 arg) - two routines have similar code

arrayReplaceAll - arrayReplaceAll ( 3-5 arg ) - copy of arrayReplacedElement
arrayReplaceUpdate

### Analysis on arrayPrepend family as example of mistakes in each family

 arrayPrependElement is a copy of arrayPrepend. Difference between them contains in used routine. arrayPrependElement uses arrayPrependedElement, arrayPrepend uses arrayPrepended. But the last routines is identical in functions and returned values.

 Examples:

 ```js
 function arrayPrepend( dstArray, ins )
 {
   if( dstArray === null )
   {
     dstArray = [];
     arguments[ 0 ] = dstArray;
   }

   arrayPrepended.apply( this, arguments );
   return dstArray;
 }

 function arrayPrependElement( dstArray, ins )
 {
   if( dstArray === null )
   {
     dstArray = [];
     arguments[ 0 ] = dstArray;
   }

   arrayPrependedElement.apply( this, arguments );
   return dstArray;
 }

 //

 function arrayPrepended( dstArray, ins )
 {
   _.assert( arguments.length === 2  );
   _.assert( _.arrayIs( dstArray ) );

   dstArray.unshift( ins );
   return 0;
 }

 function arrayPrependedElement( dstArray, ins )
 {
   _.assert( arguments.length === 2  );
   _.assert( _.arrayIs( dstArray ) );

   dstArray.unshift( ins );
   return 0;
 }
 ```

 arrayPrependElementOnce is a copy of arrayPrependOnce. Difference between them contains in used routine. arrayPrependElementOnce uses arrayPrependedElementOnce, arrayPrependOnce uses arrayPrependedOnce. So, the last routines is different in returned values. arrayPrependElementOnce returns undefined if ins argument contains in dstArray, arrayPrependOnce - returns -1. It may be standardized.

 In arrayPrependElementOnceStrictly and arrayPrependOnceStrictly is the same situation.

 arrayPrependArrayOnceStrictly and arrayPrependedArrayOnce have similar code. This means that working code is identical but returned values is different. arrayPrependArrayOnceStrictly returns dstArray, arrayPrependedArrayOnce returns number. At the same time, routine arrayPrependArrayOnce uses code of arrayPrependedArrayOnce and it returns different values also. Returned values is dstArray and number.

 arrayPrependArraysOnceStrictly and arrayPrependedArraysOnce is the same situation.

### Summary
- Routines arrayPrepend* should transform to arrayPrependElement*;
- Routines arrayAppend* should transform to arrayAppendElement*;
- Routines arrayRemove* should transform to arrayRemoveElement*;
- Routines arrayRemoveAll should transform to arrayRemoveElement;
- Routines arrayFlattenDefined* should transform to arrayFlatten*;
- Routines arrayReplce* should transform to arrayReplaceElement*;
- Routines arrayReplceAll should transform to arrayReplaceElement;
- Similar code in routines with Array and Arrays in destination can contains in one routine.
