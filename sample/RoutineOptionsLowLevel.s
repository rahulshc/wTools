
/* minimal require */

require( '../proto/wtools/abase/l0/l1/Predefined.s' );
require( '../proto/wtools/abase/l0/l2/Setup.s' );
require( '../proto/wtools/abase/l0/l3/ArgumentsArray.s' );
require( '../proto/wtools/abase/l0/l3/Array.s' );
require( '../proto/wtools/abase/l0/l3/Entity.s' ); /* Array.s require */
require( '../proto/wtools/abase/l0/l3/Err.s' );
require( '../proto/wtools/abase/l0/l3/Object.s' );
require( '../proto/wtools/abase/l0/l3/Routine.s' );
require( '../proto/wtools/abase/l0/l3/Type.s' ); /* Map.s require */

//

let _ = _global_.wTools;

//

console.log( 'routineOptions, defaults in third argument' );
var routine = () => true;
var defaults = { a : null, b : 1 };
var options = { a : 1, b : undefined };
_.routineOptions( routine, options, defaults );
console.log( options );
/* log : { a : 1, b : 1 } */

console.log( 'routineOptions, defaults in routine field' );
var routine = () => true;
routine.defaults = { a : null, b : 1 };
var options = { a : 1, b : undefined };
_.routineOptions( routine, options );
console.log( options );
/* log : { a : 1, b : 1 } */

//

console.log( 'assertRoutineOptions, defaults in third argument' );
var routine = () => true;
var defaults = { a : null, b : 1 };
var options = { a : 1, b : null };
_.assertRoutineOptions( routine, options, defaults );
console.log( options );
/* log : { a : 1, b : null } */

console.log( 'assertRoutineOptions, defaults in routine field' );
var routine = () => true;
routine.defaults = { a : null, b : 1 };
var options = { a : 1, b : null };
_.assertRoutineOptions( routine, options );
console.log( options );
/* log : { a : 1, b : null } */
