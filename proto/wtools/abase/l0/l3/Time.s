( function _l3_Time_s_()
{

'use strict';

const _global = _global_;
const _ = _global_.wTools;
const Self = _global_.wTools;

// --
// time
// --

function timerIs( src )
{
  if( !src )
  return false;
  return _.strIs( src.type ) && !!src.time && !!src.cancel;
}

//

function competitorIs( src )
{
  if( !src )
  return false;
  if( !_.mapIs( src ) )
  return false;
  return src.competitorRoutine !== undefined;
}

// --
// fields
// --

let Fields =
{
}

// --
// routines
// --

let Routines =
{

  timerIs,
  competitorIs,

}

//

Object.assign( Self, Routines );
Object.assign( Self, Fields );
/* qqq : for Yevhen : replace Routines+Fields -> {- name of namespace -}Extension in all files */

})();
