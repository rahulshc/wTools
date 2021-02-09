let objectSetValue = require( './5_ImplementationAddConstantField.s' );

let obj = { fieldToBeRemained : 1, fieldToBeChanged : 2 };

objectSetValue( obj, 'field1', 1 );
objectSetValue( obj, 'fieldToBeChanged', 'changed' );
objectSetValue( obj, 'fieldToBeRemained', null );

console.log( Object.getOwnPropertyDescriptors( obj ) );
/*
log :
{
  fieldToBeRemained:
  {
    value: 1,
    writable: false,
    enumerable: true,
    configurable: false
  },
  fieldToBeChanged:
  {
    value: 'changed',
    writable: false,
    enumerable: true,
    configurable: false
  },
  field1:
  {
    value: 1,
    writable: false,
    enumerable: true,
    configurable: false
  }
}
*/
