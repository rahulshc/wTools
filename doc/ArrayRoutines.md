
### fLong.s Array Methods Usage [![Array methods](https://travis-ci.org/Wandalen/wTools.svg?branch=master)](https://github.com/Wandalen/wTools/blob/master/out.debug/dwtools/abase/l0/fLong.s)

### Definition:
  fLong.s contains a collection of functions to work with arrays ( Append, remove or replace elements are some of the functionalities covered ).

### Methods:
* arrayIs( src ) - checks if src is an array.
* arrayleftIndex/arrayRightIndex( arr, ins, evaluator1, evaluator2 ) - returns the index of the first/last matching (ins) element in a array (arr).
  ( see evaluators on ### Patterns )
* arrayRight/arrayLeft( arr, ins, evaluator1, evaluator2 ) - returns a new object containing the properties, (index, element), corresponding to
  a found value (ins) from an array (arr).
* arrayCount( src, instance ) - returns the count of matched elements with ( instance ) in the array ( src ).
* arrayCountUnique( src, onEvaluate ) - returns the count of matched pairs in the array ( src ).


### Patterns:
