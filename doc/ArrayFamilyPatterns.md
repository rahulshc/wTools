# Array Families of routines [![Array methods](https://travis-ci.org/Wandalen/wTools.svg?branch=master)]
(https://github.com/Wandalen/wTools/blob/master/out.debug/dwtools/abase/l0/fLong.s)

## Definition

  fLong.s contains a collection of functions to work with arrays ( Append, remove or replace elements are some of the functionalities covered ).
  In this file, we are going to see the families of arrayRemove, arrayAppend and arrayReplace methods, in order to better understand how the naming patterns work, and see the differences between the functions of a same family.

## Methods of arrayAppend

  Let´s see now all the different functions that cover the functionality of appending elements to an the array:

  | **arrayAppend** | **-** | **Once** | **OnceStrictly** | **ed** | **edOnce** | **edOnceStrictly** |
  | :---: | :---: | :---: | :---: | :---: | :---: | :---: |
  | **-** | - | dstArray | dstArray | - | Position ( index ) of the appended element | - |
  | **Element** | dstArray | - | - | Position ( index ) of the appended element| - | - |
  | **Array** | dstArray | dstArray | dstArray | Number of appended elements | Number of appended elements | - |
  | **Arrays** | dstArray | dstArray | dstArray | Number of appended elements | Number of appended elements | - |

## Methods of arrayRemove

  Let´s see now all the different functions that cover the functionality of removing elements from the array:

  | **arrayRemove** | **-** | **Once** | **OnceStrictly** | **ed** | **edOnce** | **edOnceStrictly** |
  | :---: | :---: | :---: | :---: | :---: | :---: | :---: |
  | **-** | dstArray | dstArray | dstArray | Number of removed element | Position ( index ) of the removed element | Position ( index ) of the removed element |
  | **Element** | dstArray | dstArray | dstArray | Number of removed elements | Position ( index ) of the removed element - Should be removed element |  Removed element |
  | **Array** | dstArray | dstArray | dstArray | Number of removed elements | Number of removed elements | (NI) |
  | **Arrays** | dstArray | dstArray | dstArray | Number of removed elements | Number of removed elements | (NI) |
  | **All** | dstArray | - | - | Number of removed elements | - | - |

  (NI) - Not Implemented ( yet ).

## Methods of arrayReplace

  Let´s see now all the different functions that cover the functionality of replacing elements in the array:

  | **arrayReplace** | **-** | **Once** | **OnceStrictly** | **ed** | **edOnce** | **edOnceStrictly** |
  | :---: | :---: | :---: | :---: | :---: | :---: | :---: |
  | **-** | - | dstArray | dstArray | - | Position ( index ) of the replaced element | Position ( index ) of the replaced element |
  | **Element** | - | - | - | - | - |  - |
  | **Array** | - | dstArray | dstArray | - | Number of replaced elements | - |
  | **Arrays** | - | - | - | - | - | - |
  | **All** | dstArray | - | - | Number of replaced elements | - | - |


## Try out

```
npm install
node sample/SampleArrayRemove.s
```
