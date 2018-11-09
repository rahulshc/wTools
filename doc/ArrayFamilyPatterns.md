# Array Families of routines [![Array methods](https://travis-ci.org/Wandalen/wTools.svg?branch=master)]
(https://github.com/Wandalen/wTools/blob/master/out.debug/dwtools/abase/l0/fLong.s)

## Definition

  fLong.s contains a collection of functions to work with arrays ( Append, remove or replace elements are some of the functionalities covered ).
  In this file, we are going to see the families of arrayRemove, arrayAppend and arrayReplace methods, in order to better understand how the naming patterns work, and see the differences between the functions of a same family.

## Methods of arrayAppend

  Let´s see now all the different functions that cover the functionality of appending elements to an the array
  ( the small family of arrayFlatten methods has been included in the last row - it is not related with arrayAppend ):

  | **arrayAppend** | **-** | **Once** | **OnceStrictly** | **ed** | **edOnce** | **edOnceStrictly** |
  | :---: | :---: | :---: | :---: | :---: | :---: | :---: |
  | **-** | - \| dst | dst | dst | - \| index | index | - \| index |
  | **Element** | dst | - \| dst | - \| dst | index \| appended element | - \| appended element | - \| appended element |
  | **Array** | dst | dst | dst | number | number | - \| number |
  | **Arrays** | dst | dst | dst | number | number | - \| number |
  | **arrayFlatten** | dst | dst | dst | number | number | - \| number |

  Where:
  - *-* means thet the corresponding function hasn´t been developped.
  - *dst* corresponds to the destination array with the appended element( s ).
  - *index* corresponds to the position of the appended element in the destination array ( -1 if not appended ).
  - *number* corresponds to the number of appended elements.
  - *index* | *appended element* means that the corresponding function currently returns *index*, but should
  return *appended element*.

## Methods of arrayRemove

  Let´s see now all the different functions that cover the functionality of removing elements from the array:

  | **arrayRemove** | **-** | **Once** | **OnceStrictly** | **ed** | **edOnce** | **edOnceStrictly** |
  | :---: | :---: | :---: | :---: | :---: | :---: | :---: |
  | **-** | dst | dst | dst | number | index | index |
  | **Element** | dst | dst | dst | number | index \| removed element | removed element |
  | **Array** | dst | dst | dst | number | number | number |
  | **Arrays** | dst | dst | dst | number | number | number |
  | **All** | dst \| - | - | - | number \| - | - | - |

## Methods of arrayReplace

  Let´s see now all the different functions that cover the functionality of replacing elements in the array:

  | **arrayReplace** | **-** | **Once** | **OnceStrictly** | **ed** | **edOnce** | **edOnceStrictly** |
  | :---: | :---: | :---: | :---: | :---: | :---: | :---: |
  | **-** | - \| dst | dst | dst | - \| number | index | index |
  | **Element** | - \| dst | - \| dst | - \| dst | - \| number | - \| replaced element |  - \| replaced element |
  | **Array** | - \| dst | dst | dst | - \| number | number | - \| number |
  | **Arrays** | - \| dst | - \| dst | - \| dst | - \| number | - \| number | - \| number |
  | **All** | dst \| - | - | - | number \| - | - | - |


## Try out

```
npm install
node sample/SampleArrayRemove.s
```
