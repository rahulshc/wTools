# Types

| Type         | Prime | Generic | Complex |
|:------------ | ----- | ------- | ------- |
| Global       |   -   |    +    |    +    |
| GlobalReal   |   +   |    -    |    +    |
| GlobalDrived |   +   |    -    |    +    |
|              |       |         |         |
| Object       |   -   |    -    |    +    |
| ObjectLike   |   -   |    -    |    +    |
|              |       |         |         |
|              |       |         |         |

# =

Number
NumberLike

BigInt

Str
StrLike?
Regexp
RegexpLike?

ArgumentsArray
Unroll
Array
ArrayLike
Long
LongLike?
Vector
Partiable

Global
GlobalReal
GlobalDerived

objectIs, /* qqq : optimize */
objectLike, /* qqq : optimize */

compositeIs, /* qqq : cover */
compositeLike, /* qqq : cover */

mapIs,
mapLike_,
mapIsPure,
mapIsPolluted,
mapLikePolluted,
mapIsPrototyped,

HashMap
Set
