**Array Prepend**

|                            | -                   | Once                | OnceStrictly               |
|----------------------------|---------------------|---------------------|----------------------------|
| arrayPrependUnrolling      | dstArray            | -                   | -                          |
| arrayPrepend               | dstArray            | dstArray            | dstArray                   |
| arrayPrependElement        | dstArray            | dstArray            | dstArray                   |
| arrayPrependArray          | dstArray            | dstArray            | dstArray                   |
| arrayPrependArrays         | dstArray            | dstArray            | dstArray                   |
| arrayPrepended             | return 0            | return 0; or return -1 | return 0; or return -1  |
| arrayPrependedElement      | return 0            | first element of dstArray; or return undefined | first element of dstArray; or return undefined; if( !Config.debug) => return 0 |
| arrayPrependedArray        | insArray.length     | number of prepended elements <= insArray.length |number of prepended elements === insArray.length  |
| arrayPrependedArrays       | length of insArray elements | number of prepended elements <= insArray.length | number of appended elements === length of all elements in insArray |


**Array Append**

|                           | -                   | Once                | OnceStrictly               |
|---------------------------|---------------------|---------------------|----------------------------|
| arrayAppendUnrolling      | dstArray            | -                   | -                          |
| arrayAppend               | dstArray            | dstArray            | dstArray                   |
| arrayAppendElement        | dstArray            | dstArray            | dstArray                   |
| arrayAppendArray          | dstArray            | dstArray            | dstArray                   |
| arrayAppendArrays         | dstArray            | dstArray            | dstArray                   |
| arrayAppended             | dstArray.length - 1 | dstArray.length - 1 | dstArray.length - 1; or -1 |
| arrayAppendedElement      | dstArray.length - 1 | last element of dstArray; or return false | last element of dstArray; or return false; if( !Config.debug) => dstArray.length - 1                  |
| arrayAppendedArray        | insArray.length     | number of appended elements <= insArray.length | number of appended elements === insArray.length; if( !Config.debug ) => insArray.length  |
| arrayAppendedArrays       | number of appended elements => length of all elements in insArray | number of appended elements <= length of all elements in insArray | number of appended elements === length of all elements in insArray |


**Array Remove**

|                           | -                          | Once                | OnceStrictly               |
|---------------------------|----------------------------|---------------------|----------------------------|
| arrayRemove               | dstArray                   | dstArray            | dstArray                   |
| arrayRemoveElement        | dstArray                   | dstArray            | dstArray                   |
| arrayRemoveArray          | dstArray                   | dstArray            | dstArray                   |
| arrayRemoveArrays         | dstArray                   | dstArray            | dstArray                   |
| arrayRemoveed             | number of removed element  | number of no removed element | number of removed element === 1 |
| arrayRemoveedElement      | number of removed elements | number of no removed elements | removed elements itself |
| arrayRemovedArray         | number of removed elements | number of removed element <= insArray.length | number of removed element === insArray.length; or if( !Config.debug ) => number of removed elements  |
| arrayRemovedArrays        | number of removed elements | number of removed elements <= insArray.length | number of removed elements == insArray.length; if( !Config.debug ) => number of removed elements |
| arrayRemoveAll            | dstArray                   | -                   | -                          |
| arrayRemovedAll           | number of removed elements | -                   | -                          |
| arrayRemoveDuplicates     | dstArray                   | -                   | -                          |


**Array Flatten**

|                            | -                          | Once                | OnceStrictly               |
|----------------------------|----------------------------|---------------------|----------------------------|
| arrayFlatten               | dstArray                   | dstArray            | dstArray                   |
| arrayFlattenDefined        | dstArray                   | dstArray            | dstArray                   |
| arrayFlattened             | if( arguments.length === 1 ) dstArray; or number of flattened elements in dstArray and insArray  | if( arguments.length === 1 ) dstArray; number of flattened elements <= insArray.length; | if( arguments.length === 1 ) dstArray; number of flattened elements === insArray.length; |
| arrayFlattenedDefined      | if( arguments.length === 1 ) dstArray; or total number of elements dstArray and insArray | if( arguments.length ===1 ) dstArray; number of flattened elements <= total length of elements in insArray |  if( arguments.length ===1 ) dstArray;  number of flattened elements == total length of elements in insArray |


**Array Replace**

|                            | -                           | Once                | OnceStrictly               |
|----------------------------|-----------------------------|---------------------|----------------------------|
| arrayReplace               | dstArray                    | dstArray            | dstArray                   |
| arrayReplaceElement        | dstArray                    | dstArray            | dstArray                   |
| arrayReplaceArray          | dstArray                    | dstArray            | dstArray                   |
| arrayReplaceArrays         | dstArray                    | dstArray            | dstArray                   |
| arrayReplaced              | number of replaced elements | number of no replaced elements | number of replaced elements === 1 |
| arrayReplaceedElement      | number of replaced elements | ins or undefined    | ins or undefined           |
| arrayReplacedArray         | number of replaced elements | number of replaced elements <= insArray.length | number of replaced elements === insArray.length |
| arrayReplacedArrays        | number of replaced elements | number of replaced elements <= insArray.length | number of replaced elements === insArray.length |
| arrayReplaceAll            | dstArray                    | -                   | -                          |
| arrayReplacedAll           | number of replaced elements | -                   | -                          |
| arrayUpdate                | dstArray.length             | -                   | -                          |
