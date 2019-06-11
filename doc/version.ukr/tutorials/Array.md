**Array Prepend**

|                            | -                   | Once                | OnceStrictly               |
|----------------------------|---------------------|---------------------|----------------------------|
| arrayPrependUnrolling      | dstArray            | -                   | -                          |
| arrayPrepend               | dstArray            | dstArray            | dstArray                   |
| arrayPrependElement        | dstArray            | dstArray            | dstArray                   |
| arrayPrependArray          | dstArray            | dstArray            | dstArray                   |
| arrayPrependArrays         | dstArray            | dstArray            | dstArray                   |
| arrayPrepended             | index               | index <br> if not element was prepended <br> then -1 | index <br> if not element was prepended <br> then -1 |
| arrayPrependedElement      | index               | element <br> if not element was prepended <br> then undefined | element if not element was prepended <br> then undefined; <br> if !Config.debug <br> then index |
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
| arrayAppendedArrays       | number              | number              | number                     |


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
| arrayReplaced             | number              | number of no replaced | number                     |
| arrayReplaceedElement     | number              | ins <br> if not element was replaced <br> then undefined | ins <br> if not element was replaced <br> then undefined |
| arrayReplacedArray        | number              | number              | number                     |
| arrayReplacedArrays       | number              | number              | number                     |
| arrayReplaceAll           | dstArray            | -                   | -                          |
| arrayReplacedAll          | number              | -                   | -                          |
| arrayUpdate               | dstArray.length     | -                   | -                          |
