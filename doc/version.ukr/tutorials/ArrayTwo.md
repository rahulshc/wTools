| **Array Prepend**          | -                            | Once                | OnceStrictly               |
|----------------------------|------------------------------|---------------------|----------------------------|
| arrayPrepended             | index of prepended element   |  index of prepended element; or -1 if no element was prepended | index of prepended element; or -1 if no element was prepended   |
| arrayPrependedElement      | index of prepended element   | prepended element; or return undefined if no element was prepended | prepended element; or return undefined if no element was prepended; if( !Config.debug) => return 0 |
| arrayPrependedArray        | insArray.length     | number of prepended elements <= insArray.length | number of prepended elements === insArray.length  |
| arrayPrependedArrays       | length of insArray elements | number of prepended elements <= insArray.length | number of prepended elements === length of all elements in insArray |

| **Array Append**          | -                   | Once                | OnceStrictly               | 
|---------------------------|---------------------|---------------------|----------------------------|
| arrayAppended             |  dstArray.length - 1 | dstArray.length - 1 |  dstArray.length - 1 ; or -1 |
| arrayAppendedElement      |  dstArray.length - 1  | last element of dstArray; or return false | last element of dstArray; or return false; if( !Config.debug) => dstArray.length - 1                  |
| arrayAppendedArray        | insArray.length     | number of appended elements <= insArray.length | number of appended elements === insArray.length; if( !Config.debug ) => insArray.length  |
| arrayAppendedArrays       | number of appended elements => length of all elements in insArray | number of appended elements <= length of all elements in insArray | number of appended elements === length of all elements in insArray |

| **Array Remove**          | **-**                      | **Once**            | **OnceStrictly**           |
|---------------------------|----------------------------|---------------------|----------------------------|
| arrayRemoved              | number of removed element  | number of no removed element | number of removed element === 1 |
| arrayRemovedElement       | number of removed elements | number of no removed elements | __( removed element itself Власне, ми передаємо його в параметрі, його повертати не треба, краще індекс )__  |
| arrayRemovedArray         | number of removed elements | number of removed element <= insArray.length | number of removed element === insArray.length; or if( !Config.debug ) => number of removed elements  |
| arrayRemovedArrays        | number of removed elements | number of removed elements <= insArray.length | number of removed elements == insArray.length; if( !Config.debug ) => number of removed elements |

| **Array Flatten**          | **-**                      | **Once**            | **OnceStrictly**           |
|---------------------------|----------------------------|---------------------|----------------------------|
| arrayFlattened             | __( if( arguments.length === 1 ) повертає dstArray, але рутини з *ed не мають повертати масивів. Перетворення масиву здійснюється і рутини без *ed його можуть повернути )__ or number of flattened elements in dstArray and insArray  | __( if( arguments.length === 1 ) dstArray; )__  number of flattened elements <= insArray.length; | __( if( arguments.length === 1 ) dstArray; )__  number of flattened elements === insArray.length; |
| arrayFlattenedDefined      |__( if( arguments.length === 1 ) dstArray; )__  or total number of elements dstArray and insArray | __( if( arguments.length === 1 ) dstArray; )__  number of flattened elements <= total length of elements in insArray | __( if( arguments.length === 1 ) dstArray; )__ number of flattened elements == total length of elements in insArray |

|  **Array Replace**         | **-**                       | **Once**            | **OnceStrictly**           |
|----------------------------|-----------------------------|---------------------|----------------------------|
| arrayReplaced              | number of replaced elements | number of no replaced elements | number of replaced elements === 1 |
| arrayReplaceedElement      | number of replaced elements | __( ins or undefined Має бути index замість ins)__   | __( ins or undefined )__    |
| arrayReplacedArray         | number of replaced elements | number of replaced elements <= insArray.length | number of replaced elements === insArray.length |
| arrayReplacedArrays        | number of replaced elements | number of replaced elements <= insArray.length | number of replaced elements === insArray.length |
