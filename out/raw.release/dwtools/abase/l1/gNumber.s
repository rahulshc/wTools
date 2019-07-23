!function gNumberS() {
  // == begin of file gNumberS
  !function _gNumber_s_() {
    "use strict";
    //
    function numbersFrom(r) {
      if (e.strIs(r)) return e.numberFrom(r);
      let t;
      if (e.longIs(r)) {
        t = [];
        for (let n = 0; n < r.length; n++) t[n] = e.numberFrom(r[n]);
      } else if (e.objectIs(r)) {
        t = Object.create(null);
        for (let n in r) t[n] = e.numberFrom(r[n]);
      }
      return t;
    }
    //
        _global_;
    let e = _global_.wTools, r = _global_.wTools, t = (Array.prototype.indexOf, Array.prototype.lastIndexOf, 
    Array.prototype.slice, Array.prototype.splice, Function.prototype.bind, Object.prototype.toString, 
    Object.hasOwnProperty, Object.propertyIsEnumerable, Math.ceil, Math.floor, {
      numbersTotal: 
      // --
      // number
      // --
      function numbersTotal(r) {
        let t = 0;
        e.assert(e.longIs(r)), e.assert(1 === arguments.length, "Expects single argument");
        for (let n = 0; n < r.length; n++) {
          let s = r[n];
          e.assert(e.numberIs(s)), t += s;
        }
        return t;
      }
      //
      ,
      numberFrom: function numberFrom(r) {
        return e.assert(1 === arguments.length), e.strIs(r) ? parseFloat(r) : Number(r);
      },
      numbersFrom: numbersFrom,
      /* qqq : add test coverage */
      numberFromStr: function numberFromStr(r) {
        return e.assert(1 === arguments.length), e.assert(e.strIs(r)), parseFloat(r);
      }
      //
      ,
      numbersSlice: function numbersSlice(r, t, n) {
        return e.numberIs(r) ? r : e.longSlice(r, t, n);
      }
      //
      ,
      numberRandomInRange: function numberRandomInRange(r) {
        return e.assert(1 === arguments.length && e.arrayIs(r), "numberRandomInRange :", "Expects range( array ) as argument"), 
        e.assert(2 === r.length), _random() * (r[1] - r[0]) + r[0];
      }
      //
      ,
      numberRandomInt: function numberRandomInt(r) {
        return e.numberIs(r) ? r = r >= 0 ? [ 0, r ] : [ r, 0 ] : e.arrayIs(r) ? r = r : e.assert(0, "numberRandomInt", "Expects range"), 
        e.assert(e.arrayIs(r) || e.numberIs(r)), e.assert(2 === r.length), Math.floor(r[0] + Math.random() * (r[1] - r[0]));
      }
      //
      ,
      numberRandomIntBut: function numberRandomIntBut(r) {
        let t;
        if (e.numberIs(r)) r = [ 0, r ]; else {
          if (!e.arrayIs(r)) throw e.err("numberRandomInt", "unexpected argument");
          r = r;
        }
        for (let t = 0; t < 50; t++) {
          // if( attempt === attempts-2 )
          // debugger;
          // if( attempt === attempts-1 )
          // debugger;
          /*result = _.numberRandomInt( range ); */
          let t = Math.floor(r[0] + Math.random() * (r[1] - r[0])), n = !1;
          for (let r = 1; r < arguments.length; r++) e.routineIs(arguments[r]) ? arguments[r](t) || (n = !0) : t === arguments[r] && (n = !0);
          if (!n) return t;
        }
        return t = NaN, NaN;
      }
      //
      ,
      /* dubious */
      numbersMake: function numbersMake(r, t) {
        let n;
        if (e.vectorIs(r) && (r = e.vector.slice(r)), e.assert(2 === arguments.length, "Expects exactly two arguments"), 
        e.assert(e.numberIs(r) || e.arrayLike(r)), e.arrayLike(r)) {
          e.assert(r.length === t), n = e.array.makeArrayOfLength(t);
          for (let e = 0; e < t; e++) n[e] = r[e];
        } else {
          n = e.array.makeArrayOfLength(t);
          for (let e = 0; e < t; e++) n[e] = r;
        }
        return n;
      }
      //
      ,
      numbersFromNumber: function numbersFromNumber(r, t) {
        if (e.vectorIs(r) && (r = e.vector.slice(r)), e.assert(2 === arguments.length, "Expects exactly two arguments"), 
        e.assert(e.numberIs(r) || e.arrayLike(r)), e.arrayLike(r)) return e.assert(r.length === t), 
        r;
        let n = e.array.makeArrayOfLength(t);
        for (let e = 0; e < t; e++) n[e] = r;
        return n;
      }
      //
      ,
      numbersFromInt: function numbersFromInt(r, t) {
        if (e.assert(2 === arguments.length, "Expects exactly two arguments"), e.assert(e.numberIsInt(r) || e.arrayIs(r), "Expects array of number as argument"), 
        e.assert(t >= 0), e.numberIs(r)) r = e.arrayFillTimes([], t, r); else {
          for (let t = 0; t < r.length; t++) e.assert(e.numberIsInt(r[t]), "Expects integer, but got", r[t]);
          e.assert(r.length === t, "Expects array of length", t, "but got", r);
        }
        return r;
      }
      //
      ,
      numbersMake_functor: function numbersMake_functor(e) {
        let r = this;
        return r.assert(1 === arguments.length, "Expects single argument"), r.assert(r.numberIs(e)), 
        function numbersMake(t) {
          return r.numbersMake(t, e);
        };
      }
      //
      ,
      numbersFrom_functor: function numbersFrom_functor(e) {
        let r = this;
        return r.assert(1 === arguments.length, "Expects single argument"), r.assert(r.numberIs(e)), 
        numbersFrom;
      }
      // --
      // fields
      // --
        });
    //
    Object.assign(r, t), Object.assign(r, {}), 
    // --
    // export
    // --
    "undefined" != typeof module && null !== module && (module.exports = r);
  }();
  // == end of file gNumberS
}();