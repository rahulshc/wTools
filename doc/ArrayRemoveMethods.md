# Array Remove Family of routines [![Array methods](https://travis-ci.org/Wandalen/wTools.svg?branch=master)]
(https://github.com/Wandalen/wTools/blob/master/out.debug/dwtools/abase/l0/fLong.s)

## Definition

  fLong.s contains a collection of functions to work with arrays ( Append, remove or replace elements are some of the functionalities covered ).
In this file, we are going to see the family of arrayRemove methods, in order to better understand how the naming patterns work,
and see the differences between the functions of a same family.

## Methods of arrayRemove

  Let´s see now all the different functions that cover the functionality of removing elements from the array:

  | **arrayRemove** | **-** | **Once** | **OnceStrictly** | **ed** | **edOnce** | **edOnceStrictly** |
  | :---: | :---: | :---: | :---: | :---: | :---: | :---: |
  | **Element** | dstArray | dstArray | dstArray | Number of removed elements | Position ( index ) of the removed element |  Removed element |
  | **Array** | dstArray | dstArray | dstArray | Number of removed elements | Number of removed elements | - |
  | **Arrays** | dstArray | dstArray | dstArray | Number of removed elements | Number of removed elements | - |
  | **All** | dstArray | - | - | Number of removed elements | - | - |

## Try out

```
npm install
node sample/SampleArrayRemove.s
```
