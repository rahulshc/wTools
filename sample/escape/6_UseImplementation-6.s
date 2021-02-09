let _ = require( '../..' );
let objectSetValue = require( './6_ImplementationAddConstantFieldWithEscape.s' )

var src = { 'fieldToBeRemained' : 1 };
objectSetValue( src, 'fieldToBeRemained', null );
console.log( 'src1 : ', Object.getOwnPropertyDescriptors( src ) );
/*
log :

src1 :
{
  fieldToBeRemained:
  {
    value: 1,
    writable: false,
    enumerable: true,
    configurable: false
  }
}
*/

var src2 = { 'fieldToBeChanged' : 1 };
objectSetValue( src2, 'fieldToBeChanged', 'changed' );
console.log( 'src2 : ', Object.getOwnPropertyDescriptors( src2 ) );
/*
log :

src1 :
{
  fieldToBeChanged:
  {
    value: 'changed',
    writable: false,
    enumerable: true,
    configurable: false
  }
}
*/

var src3 = { 'fieldToBeChangedWithNull' : 1 };
objectSetValue( src3, 'fieldToBeChangedWithNull', _.escape.make( null ) );
console.log( 'src3 : ', Object.getOwnPropertyDescriptors( src3 ) );
/*
log :

src1 :
{
  fieldToBeChangedWithNull:
  {
    value: null,
    writable: false,
    enumerable: true,
    configurable: false
  }
}
*/
