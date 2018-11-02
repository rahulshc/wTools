
### fLong.s Array Methods Usage [![Array methods](https://travis-ci.org/Wandalen/wTools.svg?branch=master)](https://github.com/Wandalen/wTools/blob/master/out.debug/dwtools/abase/l0/fLong.s)


### Definition:
  fLong.s contains a collection of functions to work with arrays ( Append, remove or replace elements are some of the functionalities covered ).


### Methods:
* `arrayIs( src )` - Checks if src is an array.
* `arrayleftIndex/arrayRightIndex( arr, ins, evaluator1, evaluator2 )` - Returns the index of the first/last matching (ins) element of an array (arr).
  ( see evaluators on ### Patterns # 5 )
* `arrayRight/arrayLeft( arr, ins, evaluator1, evaluator2 )` - Returns a new object containing the properties, (index, element), corresponding to
  a found value (ins) of an array (arr).
* `arrayCount( src, instance )` - Returns the count of matched elements with ( instance ) of an array ( src ).
* `arrayCountUnique( src, onEvaluate )` - Returns the count of matched pairs of an array ( src ).
* `arrayPrepend*` - Adds a value of argument( ins ) to the beginning of an array( dstArray ).
  ( see options for * on ### Patterns )
* `arrayAppend*` - Adds a value of argument( ins ) at the end of an array( dstArray ).
* `arrayRemove*` - Removes the matching elements ( ins ) of an array (dstArray).
* `arrayRemoveDuplicates( dstArray, onEvaluate )` - Removes the duplicated elements of an array (dstArray).
* `arrayFlatten*` - Returns an array that contains all the passed arguments.
* `arrayReplace*` - Returns an ( dstArray ) array where the matching elememts of ( ins ) are replaced by the ones in ( sub ).
* `arrayUpdate( dstArray, ins, sub, evaluator1, evaluator2 )` - Adds a value (sub) to an array (dstArray) or replaces a value (ins) of the array (dstArray) by (sub).


### Patterns:

#1: Function contains `*ed` :

  If the function contains `*ed`, instead of returning the destination array ( dstArray ), the returned value will be
  the index, count or element ( depending on the kind of function ).
  @Example:
  - arrayFlatten( [], [ 1, 2, 3 ] ) -> [ 1, 2, 3 ]
  - arrayFlattened( [], [ 1, 2, 3 ] ) -> 3 ( the count of the added elements )

#2: Function contains `*Once` :

  If the function contains `*Once`, the action will be performed only on the first matching element.
  @Example:
  - arrayRemoveElement( [ 1, 2, 1 ], 1 ) -> [ 2 ]
  - arrayRemoveElementOnce( [ 1, 2, 1 ], 1 ) -> [ 2, 1 ]

  There are some exceptions, like arrayPrepend/arrayAppend: if they have `*Once`, the action will only be performed if
  the destination array ( dstArray ) doesn't have the value of ( ins ).
  @Example:
  - arrayPrependElement( [ 1, 2, 3, 4, 5 ], 5 ) -> [ 5, 1, 2, 3, 4, 5 ]
  - arrayPrependOnce( [ 1, 2, 3, 4, 5 ], 5 ) -> [ 1, 2, 3, 4, 5 ]

#3: Function contains `*OnceStrictly` :

  If the function contains `*OnceStrictly` expects that the action will be done, and only once: an error will be thrown if there are no matching elements or elements are not unique ( they are both in src and ins ).
  @Example:
  - arrayAppendOnceStrictly( [ 1, 2, 3 ], 3 ) -> 'array should have only unique element, but has several 3'
  - arrayReplaceOnceStrictly( [ 1, 2, 3 ], 4, 5 ); -> 'array does not have element 4'

  Without `*Strictly` it would return:
  - arrayAppendOnce( [ 1, 2, 3 ], 3 ) -> [ 1, 2, 3 ]
  - arrayReplaceOnceStrictly( [ 1, 2, 3 ], 4, 5 ); -> [ 1, 2, 3 ]

#4: Function contains `*Element`, `*Array`, `*Arrays` :

  If the function contains `*Element`, ( ins ) is treated as a scalar.
  @Example:
  - arrayRemoveElement( [ 1, 2, 3, 4 ], 3 ) -> [ 1, 2, 4 ]
  - arrayRemoveElement( [ 1, 2, 3, 4 ], [ 3 ] ) -> [ 1, 2, 3, 4 ]

  If the function contains `*Array`, ( ins ) is expected to be an array, and it will iterate over its elements.
  @Example:
  - arrayRemoveArray( [ 1, 2, 3, 4 ], [ 3, 4 ] ) -> [ 1, 2 ]
  - arrayRemoveArray( [ 1, 2, 3, 4 ], [ [ 3 ], [ 4 ] ] ) -> [ 1, 2, 3, 4 ]

  If the function contains `*Arrays`, ( ins ) it will iterate over the elements of elements recursively.
  @Example:
  - arrayRemoveArrays( [ 1, 2, 3, 4 ], [ [ 3 ], [ 4, 5 ] ] ) -> [ 1, 2 ]

#5: Evaluators :

  Most of the routines can take additional routine parameters to evaluate and compare the input elements:

  Evaluators: Check ( src ) and ( ins ) values.  
  @Example:
  - arrayRemoveElement( [ [ 1 ], [ 2 ] ], [ 1 ], ( e ) => e[ 0 ] ) -> [ [ 2 ] ]
  - arrayRemoveElement( [ [ 1 ], [ 2 ] ], 1, ( e ) => e[ 0 ] ) -> [ [ 1 ], [ 2 ] ]

  Tandem of evaluators: One evaluator to check ( src ) and a different one to check ( ins ).
  @Example:
  - arrayRemoveElement( [ [ 1 ], [ 2 ] ], 1, ( e ) => e[ 0 ], ( e ) => e ) -> [ [ 2 ] ]

  Equalizers: Compare ( src ) and ( ins ) values.  
  @Example:
  - var onEqualize = function( a, b )
    {
      return a.num === b.num;
    }
    arrayRemoveElement( [ { num : 1 },{ num : 2 },{ num : 3 } ], { num : 2 }, onEqualize ) -> [ { num : 1 }, { num : 3 } ]


### Try out  
```
npm install
node sample/SampleArrayPrepend.js
node sample/SampleArrayRemove.s
```
