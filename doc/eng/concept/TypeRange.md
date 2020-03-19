# Type <code>Range</code>

<code>Range</code> is a complex data type - a pair of numbers that defines a sequence.

### Types of <code>Range</code>

- `Orange`
- `Crange`
- `Lrange`

### Type <code>Orange</code>

`Orange` ( from `open range` ) - the first element of the range indicates the index of the element from which the counting of elements begins, and the second to the last element of the sequence and does not include it.

Selecting a range of rows from an array, `orange`:

```js
var src = [ 'abc', 'def', 'ghi' ];
_.strLinesOnly( src, [ 0, 1 ] ); // returns 'abc'
```

### Type <code>Crange</code>

`Crange` ( from `closed range` ) - the first element of the range indicates the index of the element from which the counting of elements begins, and the second to the last element of the sequence and includes it.

Selecting a range to delete, `crange`:

```js
var src = [ 0, 1, 2, 3, 4, 5, 6, 7, 8, 9 ];
_.arrayBut_( src, [ 2, 7 ] ); // returns [ 0, 1, 8, 9 ]
```

### Тип <code>Lrange</code>

`Lrange` ( from `length range` ) - the first element of the range indicates the index of the element from which the counting of elements begins, and the second indicates the length of elements of the sequence, that is the number of elements in the sequence.

The module does not use `Lrange`.

```js
var lrange = [ 3, 5 ];
```

The variable `lrange` defines the range of type `Lrange`. This range includes next indexes of elements `3`, `4`, `5`, `6`, `7`.

### Чому і для чого

`Range` has advantages over the use of separate variables to indicate bounds of the sequence:

- Convenient and compact form for declaring bounds of a sequence.
- Uses a single variable to denote two arguments.
- Standardization of values in the range.

The advantages described above are the reason of use `Range` in the routines of the module. Also, if a parameter of routine named as `Orange`,` Crange`, or `Lrange`, it immediately indicates the value of the second element of the range. It allows the developer to skip searching for a fragment of code or an experiment that determines the value of the second element.

### Theoretical examples 

|                           | Range type | Range | Indexes of elements in the sequence |
|---------------------------|------------|-------|-------------------------------------|
| range[ 0 ] < range[ 1 ]   | Orange     | 3..5  | 3, 4                                |
|                           | Crange     | 3..5  | 3, 4, 5                             |
|                           | Lrange     | 3..5  | 3, 4, 5, 6, 7                       |
| range[ 0 ] === range[ 1 ] | Orange     | 3..3  | -                                   |
|                           | Crange     | 3..3  | 3                                   |
|                           | Lrange     | 3..3  | 3, 4, 5                             |
| range[ 0 ] > range[ 1 ]   | Orange     | 3..2  | -                                   |
|                           | Crange     | 3..2  | -                                   |
|                           | Lrange     | 3..2  | 3, 4                                |

### Summary 

- Range is a pair of numbers that defines a sequence.
- Range is the convenient form for declaring bounds of a sequence. It uses a single variable to denote two arguments.
- There are three types of ranges: open - `Orange`, closed - `Crange` and length - `Lrange`.

[Back to content](../README.md#Концепції)
