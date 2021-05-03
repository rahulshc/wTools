( function _l3_Unroll_s_()
{

'use strict';

const _global = _global_;
const _ = _global_.wTools;

_.assert( !!_.long._elementWithKey, 'Expects routine array._elementWithKey' );

// --
// declaration
// --

let unrollSymbol = Symbol.for( 'unroll' );

// --
// declaration
// --

let ToolsExtension =
{
}

//

Object.assign( _, ToolsExtension );

//

/* qqq : for Yevhen : make replacements */

let UnrollExtension =
{

  //

  NamespaceName : 'unroll',

  // equaler

  _identicalShallow : _.long._identicalShallow,
  identicalShallow : _.long.identicalShallow,
  identical : _.long.identical,
  _equivalentShallow : _.long._equivalentShallow,
  equivalentShallow : _.long.equivalentShallow,
  equivalent : _.long.equivalent,

  // exporter

  exportString : _.long.exportString,
  exportStringDiagnosticShallow : _.long.exportStringDiagnosticShallow,
  exportStringCodeShallow : _.long.exportStringCodeShallow,

  // container interface

  _lengthOf : _.long._lengthOf,
  lengthOf : _.long.lengthOf, /* qqq : cover */

  _hasKey : _.long._hasKey,
  hasKey : _.long._hasKey, /* qqq : cover */
  _hasCardinal : _.long._hasKey,
  hasCardinal : _.long._hasKey, /* qqq : cover */
  _keyWithCardinal : _.long._hasKey,
  keyWithCardinal : _.long._hasKey, /* qqq : cover */
  _cardinalWithKey : _.long._cardinalWithKey,
  cardinalWithKey : _.long.cardinalWithKey, /* qqq : cover */

  _elementGet : _.long._elementWithKey,
  elementGet : _.long.elementWithKey, /* qqq : cover */
  _elementWithKey : _.long._elementWithKey,
  elementWithKey : _.long.elementWithKey, /* qqq : cover */
  _elementWithImplicit : _.long._elementWithImplicit,
  elementWithImplicit : _.long.elementWithImplicit,  /* qqq : cover */
  _elementWithCardinal : _.long._elementWithCardinal,
  elementWithCardinal : _.long.elementWithCardinal,  /* qqq : cover */

  _elementSet : _.long._elementSet,
  elementSet : _.long.elementSet, /* qqq : cover */
  _elementWithKeySet : _.long._elementWithKeySet,
  elementWithKeySet : _.long.elementWithKeySet, /* qqq : cover */
  _elementWithCardinalSet : _.long._elementWithCardinalSet,
  elementWithCardinalSet : _.long.elementWithCardinalSet,  /* qqq : cover */

  _elementDel : _.long._elementDel,
  elementDel : _.long.elementDel, /* qqq : cover */
  _elementWithKeyDel : _.long._elementWithKeyDel,
  elementWithKeyDel : _.long.elementWithKeyDel, /* qqq : cover */
  _elementWithCardinalDel : _.long._elementWithCardinalDel,
  elementWithCardinalDel : _.long.elementWithCardinalDel,  /* qqq : cover */
  _empty : _.long._empty,
  empty : _.long.empty, /* qqq : for Yevhen : cover */

  _each : _.long._each,
  each : _.long.each, /* qqq : cover */
  _eachLeft : _.long._eachLeft,
  eachLeft : _.long.eachLeft, /* qqq : cover */
  _eachRight : _.long._eachRight,
  eachRight : _.long.eachRight, /* qqq : cover */

  _while : _.long._while,
  while : _.long.while, /* qqq : cover */
  _whileLeft : _.long._whileLeft,
  whileLeft : _.long.whileLeft, /* qqq : cover */
  _whileRight : _.long._whileRight,
  whileRight : _.long.whileRight, /* qqq : cover */

  _aptLeft : _.long._aptLeft,
  aptLeft : _.long.aptLeft, /* qqq : cover */
  first : _.long.first,
  _aptRight : _.long._aptRight, /* qqq : cover */
  aptRight : _.long.aptRight,
  last : _.long.last, /* qqq : cover */

}

//

Object.assign( _.unroll, UnrollExtension );

})();
