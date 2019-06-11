| **Array Prepend**          | -                            | Once                | OnceStrictly               |
|----------------------------|------------------------------|---------------------|----------------------------|
| arrayPrepended             | index of prepended element   | index of prepended element or -1 if no element was prepended | index of prepended element or -1 if no element was prepended |
| arrayPrependedElement      | index of prepended element   | prepended element or 'undefined' if no element was prepended | prepended element or 'undefined' if no element was prepended; or index of prepended element if !Config.debug |
| arrayPrependedArray        | number of prepended elements | number of prepended elements | number of prepended elements |
| arrayPrependedArrays       | number of prepended elements | number of prepended elements | number of prepended elements |

| **Array Append**          | -                         | Once                      | OnceStrictly               |
|---------------------------|---------------------------|---------------------------|----------------------------|
| arrayAppended             | index of appended element | index of appended element | index of appended element or -1 if no element was appended |
| arrayAppendedElement      | index of appended element | appended element or return false if no element was appended | appended element or return false if no element was appended; or index of appended element if !Config.debug |
| arrayAppendedArray        | number of appended elements | number of appended elements | number of appended elements |
| arrayAppendedArrays       | number of appended elements | number of appended elements | number of appended elements |

| **Array Remove**          | -                          | Once                          | OnceStrictly               |
|---------------------------|----------------------------|-------------------------------|----------------------------|
| arrayRemoved              | number of removed element  | number of no removed elements | number of removed element  |
| arrayRemovedElement       | number of removed elements | number of no removed elements | __( removed element itself )__  |
| arrayRemovedArray         | number of removed elements | number of removed elements    | number of removed elements |
| arrayRemovedArrays        | number of removed elements | number of removed elements    | number of removed elements |

| **Array Flatten**          | -                          | Once                | OnceStrictly               |
|----------------------------|----------------------------|---------------------|----------------------------|
| arrayFlattened             | number of flattened elements or __( dstArray if arguments.length === 1 )__ | number of flattened elements or __( dstArray if arguments.length === 1 )__ | number of flattened elements or __( dstArray if arguments.length === 1 )__ |
| arrayFlattenedDefined      | number of flattened elements or __( dstArray if arguments.length === 1 )__ | number of flattened elements or __( dstArray if arguments.length === 1 )__ | number of flattened elements or __( dstArray if arguments.length === 1 )__ |

|  Array Replace             | -                           | Once                           | OnceStrictly                |
|----------------------------|-----------------------------|--------------------------------|-----------------------------|
| arrayReplaced              | number of replaced elements | number of no replaced elements | number of replaced element  |
| arrayReplaceedElement      | number of replaced elements | __( ins or undefined )__       | __( ins or undefined )__    |
| arrayReplacedArray         | number of replaced elements | number of replaced elements    | number of replaced elements |
| arrayReplacedArrays        | number of replaced elements | number of replaced elements    | number of replaced elements |
