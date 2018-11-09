# Array Append Family of Routines [![Array methods](https://travis-ci.org/Wandalen/wTools.svg?branch=master)]
(https://github.com/Wandalen/wTools/blob/master/out.debug/dwtools/abase/l0/fLong.s)

## Methods of arrayAppend

  The following table shows what the outputs of the functions should be, not what the currently are ( for that see
  *ArrayFamilyPatterns.md* ).
  Let´s see now all the different functions that cover the functionality of appending elements to an the array
  ( the small family of arrayFlatten methods has been included in the last row - it is not related with arrayAppend ):

  | **arrayAppend** | **-** | **Once** | **OnceStrictly** | **ed** | **edOnce** | **edOnceStrictly** |
  | :---: | :---: | :---: | :---: | :---: | :---: | :---: |
  | **-** | dst | dst | dst | index | index | index |
  | **Element** | dst | dst | dst | appended element | appended element | appended element |
  | **Array** | dst | dst | dst | number | number | number |
  | **Arrays** | dst | dst | dst | number | number | number |
  | **arrayFlatten** | dst | dst | dst | number | number | number |

  Where:
  - *dst* corresponds to the destination array with the appended element( s ).
  - *index* corresponds to the position of the appended element in the destination array ( -1 if not appended ).
  - *number* corresponds to the number of appended ( flattened ) elements.
