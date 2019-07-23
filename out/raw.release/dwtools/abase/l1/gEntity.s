!function gEntityS() {
  // == begin of file gEntityS
  !function _gEntity_s_() {
    "use strict";
    _global_;
    let e = _global_.wTools, t = _global_.wTools, n = {
      entityLength: 
      // --
      // entity getter
      // --
      /**
 * Returns "length" of entity( src ). Representation of "length" depends on type of( src ):
 *  - For object returns number of it own enumerable properties;
 *  - For array or array-like object returns value of length property;
 *  - For undefined returns 0;
 *  - In other cases returns 1.
 *
 * @param {*} src - Source entity.
 * @returns {number} Returns "length" of entity.
 *
 * @example
 * //returns 3
 * _.entityLength( [ 1, 2, 3 ] );
 *
 * @example
 * //returns 1
 * _.entityLength( 'string' );
 *
 * @example
 * //returns 2
 * _.entityLength( { a : 1, b : 2 } );
 *
 * @example
 * //returns 0
 * let src = undefined;
 * _.entityLength( src );
 *
 * @function entityLength
 * @memberof wTools
*/
      function entityLength(t) {
        return void 0 === t ? 0 : e.longIs(t) ? t.length : e.objectLike(t) ? e.mapOwnKeys(t).length : 1;
      }
      //
      /**
 * Returns "size" of entity( src ). Representation of "size" depends on type of( src ):
 *  - For string returns value of it own length property;
 *  - For array-like entity returns value of it own byteLength property for( ArrayBuffer, TypedArray, etc )
 *    or length property for other;
 *  - In other cases returns null.
 *
 * @param {*} src - Source entity.
 * @returns {number} Returns "size" of entity.
 *
 * @example
 * //returns 6
 * _.entitySize( 'string' );
 *
 * @example
 * //returns 3
 * _.entitySize( [ 1, 2, 3 ] );
 *
 * @example
 * //returns 8
 * _.entitySize( new ArrayBuffer( 8 ) );
 *
 * @example
 * //returns null
 * _.entitySize( 123 );
 *
 * @function entitySize
 * @memberof wTools
*/ ,
      entitySize: function entitySize(t) {
        if (e.assert(1 === arguments.length, "Expects single argument"), e.strIs(t)) return t.length ? e.bufferBytesFrom(t).byteLength : t.length;
        if (e.numberIs(t)) return 8;
        if (!e.definedIs(t)) return 8;
        if (e.boolIs(t) || e.dateIs(t)) return 8;
        if (e.numberIs(t.byteLength)) return t.byteLength;
        if (e.regexpIs(t)) return entitySize(t.source) + 2 * t.flags.length;
        if (e.longIs(t)) {
          let n = 0;
          for (let i = 0; i < t.length && (n += e.entitySize(t[i]), !isNaN(n)); i++) ;
          return n;
        }
        if (e.mapIs(t)) {
          let n = 0;
          for (let i in t) if (n += e.entitySize(i), n += e.entitySize(t[i]), isNaN(n)) break;
          return n;
        }
        return NaN;
      }
      // --
      // fields
      // --
        };
    //
    Object.assign(t, n), Object.assign(t, {}), 
    // --
    // export
    // --
    "undefined" != typeof module && null !== module && (module.exports = t);
  }();
  // == end of file gEntityS
}();