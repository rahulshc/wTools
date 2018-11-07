# Array Remove Family of routines [![Array methods](https://travis-ci.org/Wandalen/wTools.svg?branch=master)]
(https://github.com/Wandalen/wTools/blob/master/out.debug/dwtools/abase/l0/fLong.s)

## Definition

  fLong.s contains a collection of functions to work with arrays ( Append, remove or replace elements are some of the functionalities covered ).
In this file, we are going to see the family of arrayRemove methods, in order to better understand how the naming patterns work,
and see the differences between the functions of a same family.

## Methods of arrayRemove

  Let´s see now all the different functions that cover the functionality of removing elements from the array:

  | **Function Name** | **Definition** | **Input elements** | **Output** |
  | :---: | :---: | :---: | :---: |
  | arrayRemoveElement | Removes all matches of ins ( treated as a scalar ) | dstArray, ins, evaluator1, evaluator2 | dstArray |
  | arrayRemoveElementOnce | Removes the first match of ins | dstArray, ins, evaluator1, evaluator2 | dstArray |
  | arrayRemoveElementOnceStrictly | Include assert to check that ins exists in dstArray only once | dstArray, ins, evaluator1, evaluator2 | dstArray |
  | arrayRemovedElement | Removes all matches of ins | dstArray, ins, evaluator1, evaluator2 | Number of removed elements |
  | arrayRemovedElementOnce | Removes the first match of ins | dstArray, ins, evaluator1, evaluator2 | Position ( index ) of the removed element |
  | arrayRemovedElementonceStrictly | Include assert to check that ins exists in dstArray only once | dstArray, ins, evaluator1, evaluator2 | Removed element |
  | arrayRemoveArray | Removes all matches of elements in ins ( treated as an array ) | dstArray, ins | dstArray |
  | arrayRemoveArrayOnce | Removes the first match for each element in ins | dstArray, ins, evaluator1, evaluator2 | dstArray |
  | arrayRemoveArrayOnceStrictly | Include assert to check that ins elements exist in dstArray only once | dstArray, ins, evaluator1, evaluator2 | dstArray |
  | arrayRemovedArray | Removes all matches of elements in ins | dstArray, ins | Number of removed elements |
  | arrayRemovedArrayOnce | Removes the first match for each element in ins | dstArray, ins, evaluator1, evaluator2 | Number of removed elements |
  | arrayRemoveArrays | Removes all matches of the elements of elements in ins | dstArray, ins | dstArray |
  | arrayRemoveArraysOnce | Removes the first match for each element of elements in ins | dstArray, ins, evaluator1, evaluator2 | dstArray |
  | arrayRemoveArraysOnceStrictly | Include assert to check that ins elements of elements exist in dstArray only once | dstArray, ins, evaluator1, evaluator2 | dstArray |
  | arrayRemovedArrays | Removes all matches of the elements of elements in ins | dstArray, ins | Number of removed elements |
  | arrayRemovedArraysOnce | Removes the first match for each element of elements in ins | dstArray, ins, evaluator1, evaluator2 | Number of removed elements |
  | arrayRemoveAll | Same as arrayRemoveElement | Same as arrayRemoveElement | Same as arrayRemoveElement |
  | arrayRemovedAll | Same as arrayRemovedElement | Same as arrayRemovedElement | Same as arrayRemoveElement |
  | arrayRemoveDuplicates | Removes all duplicated elements |  dstArray, evaluator1, evaluator2  | dstArray |

## Try out

```
npm install
node sample/SampleArrayRemove.s
```
