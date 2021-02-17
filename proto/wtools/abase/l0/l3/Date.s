( function _l3_Date_s_()
{

'use strict';

let _global = _global_;
let _ = _global_.wTools;
let Self = _global_.wTools.date = _global_.wTools.date || Object.create( null );

// --
// typing
// --

// --
// extension
// --

let ToolsExtension =
{

  // typing

  constructibleIs, /* qqq : cover and move */
  constructibleLike, /* qqq : cover and move */

}

//

let Extension =
{

  // typing

  is : constructibleIs, /* qqq : cover and move */
  like : constructibleLike, /* qqq : cover and move */

}

//

Object.assign( _, ToolsExtension );
Object.assign( Self, Extension );

// --
// export
// --

if( typeof module !== 'undefined' )
module[ 'exports' ] = _;

})();
