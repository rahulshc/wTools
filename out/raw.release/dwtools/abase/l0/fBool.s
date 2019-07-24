!function fBoolS() {
  // == begin of file fBoolS
  !function _fBool_s_() {
    "use strict";
    _global_;
    let o = _global_.wTools, e = _global_.wTools, l = (Array.prototype.slice, Function.prototype.bind, 
    Object.hasOwnProperty, {
      boolIs: 
      // --
      // bool
      // --
      /**
 * Returns true if entity ( src ) is a Boolean.
 * @function boolIs
 * @param {} src - entity to check
 * @memberof wTools
 */
      function boolIs(o) {
        return !0 === o || !1 === o;
      }
      //
      /**
 * Returns true if entity ( src ) is a Boolean or Number.
 * @function boolLike
 * @param {} src - entity to check
 * @memberof wTools
 */ ,
      boolLike: function boolLike(o) {
        let e = Object.prototype.toString.call(o);
        return "[object Boolean]" === e || "[object Number]" === e;
      }
      //
      // function boolFrom( src )
      // {
      //   if( _.strIs( src ) )
      //   {
      //     src = src.toLowerCase();
      //     if( src == '0' ) return false;
      //     if( src == 'false' ) return false;
      //     if( src == 'null' ) return false;
      //     if( src == 'undefined' ) return false;
      //     if( src == '' ) return false;
      //     return true;
      //   }
      //   return Boolean( src );
      // }
      //
      /**
 * @summary Returns copy of array( src ) with only boolean elements.
 * @description
 * Returns false if ( src ) is not ArrayLike object.
 * @function boolsAre
 * @param {Array} src - array of entities
 * @throws {Error} If more or less than one argument is provided.
 * @memberof wTools
 */ ,
      // boolFrom,
      boolsAre: function boolsAre(e) {
        return o.assert(1 === arguments.length), !!o.arrayLike(e) && e.filter(e => o.boolIs(e));
      }
      //
      /**
 * @summary Checks if all elements of array( src ) are booleans.
 * @description
 * * If ( src ) is not an array, routine checks if ( src ) is a boolean.
 * @function boolsAllAre
 * @param {Array} src - array of entities
 * @throws {Error} If more or less than one argument is provided.
 * @memberof wTools
 */ ,
      boolsAllAre: function boolsAllAre(e) {
        return o.assert(1 === arguments.length), o.arrayIs(e) ? o.all(e.filter(e => o.boolIs(e))) : o.boolIs(e);
      }
      //
      /**
 * @summary Checks if at least one element from array( src ) is a boolean.
 * @description
 * * If ( src ) is not an array, routine checks if ( src ) is a boolean.
 * @function boolsAnyAre
 * @param {Array} src - array of entities
 * @throws {Error} If more or less than one argument is provided.
 * @memberof wTools
 */ ,
      boolsAnyAre: function boolsAnyAre(e) {
        return o.assert(1 === arguments.length), o.arrayIs(e) ? o.any(e.filter(e => o.boolIs(e))) : o.boolIs(e);
      }
      //
      /**
 * @summary Checks if array( src ) doesn't have booleans.
 * @description
 * * If ( src ) is not an array, routine checks if ( src ) is not a boolean.
 * @function boolsAnyAre
 * @param {Array} src - array of entities
 * @throws {Error} If more or less than one argument is provided.
 * @memberof wTools
 */ ,
      boolsNoneAre: function boolsNoneAre(e) {
        return o.assert(1 === arguments.length), o.arrayIs(e) ? o.none(e.filter(e => o.boolIs(e))) : o.boolIs(e);
      }
      // --
      // fields
      // --
        });
    //
    Object.assign(e, l), Object.assign(e, {}), 
    // --
    // export
    // --
    "undefined" != typeof module && null !== module && (module.exports = e);
  }();
  // == end of file fBoolS
}();