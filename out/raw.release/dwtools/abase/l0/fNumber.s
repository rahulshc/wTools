!function fNumberS() {
  // == begin of file fNumberS
  !function _fNumbers_s_() {
    "use strict";
    _global_;
    let e = _global_.wTools, n = _global_.wTools, r = (Array.prototype.indexOf, Array.prototype.lastIndexOf, 
    Array.prototype.slice, Array.prototype.splice, Function.prototype.bind, Object.hasOwnProperty, 
    Object.propertyIsEnumerable, Math.ceil, Math.floor, {
      numberIs: 
      // --
      // number
      // --
      /**
 * @summary Checks if argument( src ) is a Number.
 * @returns Returns true if ( src ) is a Number, otherwise returns false.
 *
 * @example
 * //returns true
 * numberIs( 5 );
 * @example
 * // returns false
 * numberIs( 'song' );
 *
 * @param {*} src.
 * @return {Boolean}.
 * @function numberIs
 * @memberof wTools
 */
      function numberIs(e) {
        return "number" == typeof e;
      }
      //
      ,
      numberIsNotNan: function numberIsNotNan(n) {
        return e.numberIs(n) && !isNaN(n);
      }
      //
      ,
      numberIsFinite: function numberIsFinite(n) {
        return !!e.numberIs(n) && isFinite(n);
      }
      //
      ,
      numberIsInfinite: function numberIsInfinite(n) {
        return !!e.numberIs(n) && (Infinity === n || -Infinity === n);
      }
      //
      ,
      numberIsInt: function numberIsInt(n) {
        return !!e.numberIs(n) && Math.floor(n) === n;
      }
      //
      ,
      numbersAre: function numbersAre(n) {
        if (e.assert(1 === arguments.length), e.bufferTypedIs(n)) return !0;
        if (e.arrayLike(n)) {
          for (let r = 0; r < n.length; r++) if (!e.numberIs(n[r])) return !1;
          return !0;
        }
        return !1;
      }
      //
      ,
      numbersAreIdentical: function numbersAreIdentical(n, r) {
        return e.assert(2 === arguments.length, "Expects exactly two arguments"), Object.is(n, r);
      }
      //
      ,
      numbersAreEquivalent: function numbersAreEquivalent(n, r, t) {
        return e.assert(2 === arguments.length || 3 === arguments.length, "Expects two or three arguments"), 
        void 0 === t && (t = e.accuracy), Math.abs(n - r) <= t;
      }
      //
      ,
      numbersAreFinite: function numbersAreFinite(n) {
        if (e.longIs(n)) {
          for (let e = 0; e < n.length; e++) if (!numbersAreFinite(n[e])) return !1;
          return !0;
        }
        return !!e.numberIs(n) && isFinite(n);
      }
      //
      ,
      numbersArePositive: function numbersArePositive(n) {
        if (e.longIs(n)) {
          for (let e = 0; e < n.length; e++) if (!numbersArePositive(n[e])) return !1;
          return !0;
        }
        return !!e.numberIs(n) && n >= 0;
      }
      //
      ,
      numbersAreInt: function numbersAreInt(n) {
        if (e.longIs(n)) {
          for (let e = 0; e < n.length; e++) if (!numbersAreInt(n[e])) return !1;
          return !0;
        }
        return !!e.numberIs(n) && Math.floor(n) === n;
      }
      //
      ,
      numberInRange: function numberInRange(n, r) {
        return e.assert(2 === arguments.length, "Expects exactly two arguments"), e.assert(2 === r.length), 
        e.assert(e.numberIs(r[0])), e.assert(e.numberIs(r[1])), !!e.numberIs(n) && r[0] <= n && n <= r[1];
      }
      //
      ,
      numberClamp: function numberClamp(n, r, t) {
        return e.assert(2 === arguments.length || 3 === arguments.length, "Expects two or three arguments"), 
        2 === arguments.length && (e.assert(2 === arguments[1].length), r = arguments[1][0], 
        t = arguments[1][1]), n > t ? t : n < r ? r : n;
      }
      //
      ,
      numberMix: function numberMix(n, r, t) {
        return e.assert(3 === arguments.length, "Expects exactly three arguments"), n * (1 - t) + r * t;
      }
      // --
      // fields
      // --
        });
    //
    Object.assign(n, r), Object.assign(n, {}), 
    // --
    // export
    // --
    "undefined" != typeof module && null !== module && (module.exports = n);
  }();
  // == end of file fNumberS
}();