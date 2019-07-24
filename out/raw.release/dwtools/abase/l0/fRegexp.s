!function fRegexpS() {
  // == begin of file fRegexpS
  !function _fRegexp_s_() {
    "use strict";
    _global_;
    let e = _global_.wTools, r = _global_.wTools, t = (Math.ceil, Math.floor, {
      // regexp
      regexpIs: 
      // --
      // regexp
      // --
      function regexpIs(e) {
        return "[object RegExp]" === Object.prototype.toString.call(e);
      }
      //
      ,
      regexpObjectIs: function regexpObjectIs(r) {
        return !!e.RegexpObject && r instanceof e.RegexpObject;
      }
      //
      ,
      regexpLike: function regexpLike(r) {
        return !(!e.regexpIs(r) && !e.strIs(r));
      }
      //
      ,
      regexpsLike: function regexpsLike(r) {
        if (!e.arrayIs(r)) return !1;
        for (let t = 0; t < r.length; t++) if (!e.regexpLike(r[t])) return !1;
        return !0;
      }
      //
      ,
      regexpIdentical: function regexpIdentical(r, t) {
        return e.assert(2 === arguments.length, "Expects exactly two arguments"), !(!e.regexpIs(r) || !e.regexpIs(t)) && r.source === t.source && r.flags === t.flags;
      }
      //
      ,
      regexpEquivalent: function regexpEquivalent(r, t) {
        return e.strEquivalent(r, t);
      }
      //
      ,
      _regexpTest: function _regexpTest(r, t) {
        return e.assert(2 === arguments.length), e.assert(e.regexpLike(r)), e.assert(e.strIs(t)), 
        e.strIs(r) ? r === t : r.test(t);
      }
      //
      ,
      regexpTest: function regexpTest(r, t) {
        return e.assert(2 === arguments.length), e.assert(e.regexpLike(r)), e.strIs(t) ? e._regexpTest(r, t) : e.arrayLike(t) ? t.map(t => e._regexpTest(r, t)) : void e.assert(0);
      }
      //
      ,
      regexpTestAll: function regexpTestAll(r, t) {
        return e.assert(2 === arguments.length), e.assert(e.regexpLike(r)), e.strIs(t) ? e._regexpTest(r, t) : e.arrayLike(t) ? t.every(t => e._regexpTest(r, t)) : void e.assert(0);
      }
      //
      ,
      regexpTestAny: function regexpTestAny(r, t) {
        return e.assert(2 === arguments.length), e.assert(e.regexpLike(r)), e.strIs(t) ? e._regexpTest(r, t) : e.arrayLike(t) ? t.some(t => e._regexpTest(r, t)) : void e.assert(0);
      }
      //
      ,
      regexpTestNone: function regexpTestNone(r, t) {
        return e.assert(2 === arguments.length), e.assert(e.regexpLike(r)), e.strIs(t) ? !e._regexpTest(r, t) : e.arrayLike(t) ? !t.some(t => e._regexpTest(r, t)) : void e.assert(0);
      }
      //
      ,
      regexpsTestAll: function regexpsTestAll(r, t) {
        return e.assert(2 === arguments.length), e.arrayIs(r) ? (e.assert(e.regexpsLike(r)), 
        r.every(r => e.regexpTestAll(r, t))) : e.regexpTestAll(r, t);
      }
      //
      ,
      regexpsTestAny: function regexpsTestAny(r, t) {
        return e.assert(2 === arguments.length), e.arrayIs(r) ? (e.assert(e.regexpsLike(r)), 
        r.some(r => e.regexpTestAny(r, t))) : e.regexpTestAny(r, t);
      }
      //
      ,
      regexpsTestNone: function regexpsTestNone(r, t) {
        return e.assert(2 === arguments.length), e.arrayIs(r) ? (e.assert(e.regexpsLike(r)), 
        r.every(r => e.regexpTestNone(r, t))) : e.regexpTestNone(r, t);
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
  // == end of file fRegexpS
}();