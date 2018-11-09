## Methods of arrayAppend

  The following table shows what the outputs of the functions should be, not what they currently are ( for that see
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
  - *dst* corresponds to the input array with the appended element( s ) included at its end.
  - *index* corresponds to the position of the appended element in the destination array ( -1 if not appended ).
  - *number* corresponds to the number of appended ( flattened ) elements.

## Naming patterns

  The table rows and columns correspond to naming patterns, and by combining them we get the full function names. For example the cell of the row *'Array'* and the column *'edOnce'* corresponds to the function *arrayAppendedArrayOnce*. The values inside the cells are the expected outputs of these functions ( for the example *arrayAppendedArrayOnce* returns the number of appended elements ).

  Many function names contain patterns to help us understand the behaviour of each routine, here comes a quick summary of the information a function name can give us:

  The format of a function name is: array { Op } { Tense } { Second } { How }, where:

  { Op } can be one of [ Append, Prepend, Remove, Flatten, Replace ], corresponding to the action to perform.  

  { Tense } can be - ( nothing ) or ed, giving information on what to return ( the output value ).

  { Second } can be one of [ - , element, array, arrays ], refering to how to treat the src argument.

  { How } can be one of [ - , Once, OnceStrictly ], and tell us how to treat the repeats.

  For more information on these patters please see *ArrayRoutines.md*.
