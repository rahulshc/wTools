!function fRangeS() {
  // == begin of file fRangeS
  !function _fRange_s_() {
    "use strict";
    _global_;
    let e = _global_.wTools, t = _global_.wTools, n = (Array.prototype.slice, Function.prototype.bind, 
    Object.hasOwnProperty, {
      // range
      rangeIs: 
      // --
      // range
      // --
      function rangeIs(t) {
        return e.assert(1 === arguments.length), !!e.numbersAre(t) && 2 === t.length;
      }
      //
      ,
      rangeFrom: function rangeFrom(t) {
        return e.assert(1 === arguments.length), e.numberIs(t) ? [ t, Infinity ] : (e.assert(e.longIs(t)), 
        e.assert(1 === t.length || 2 === t.length), e.assert(void 0 === t[0] || e.numberIs(t[0])), 
        e.assert(void 0 === t[1] || e.numberIs(t[1])), void 0 === t[0] ? [ 0, t[1] ] : void 0 === t[1] ? [ t[0], Infinity ] : t);
      }
      //
      ,
      rangeClamp: function rangeClamp(t, n) {
        return e.assert(2 === arguments.length, "Expects exactly two arguments"), e.assert(e.rangeIs(t)), 
        e.assert(e.rangeIs(n)), t[0] < n[0] ? t[0] = n[0] : t[0] > n[1] && (t[0] = n[1]), 
        t[1] < n[0] ? t[1] = n[0] : t[1] > n[1] && (t[1] = n[1]), t;
      }
      //
      ,
      rangeNumberElements: function rangeNumberElements(t, n) {
        return e.assert(e.rangeIs(t)), e.assert(1 === arguments.length || 2 === arguments.length), 
        void 0 === n && (n = 1), n ? (t[1] - t[0]) / n : 0;
      }
      //
      ,
      rangeFirstGet: function rangeFirstGet(t, n) {
        return void 0 === (n = n || Object.create(null)).increment && (n.increment = 1), 
        e.assert(1 === arguments.length || 2 === arguments.length), e.arrayIs(t) ? t[0] : e.mapIs(t) ? t.first : void e.assert(0, "unexpected type of range", e.strType(t));
      }
      //
      ,
      rangeLastGet: function rangeLastGet(t, n) {
        return void 0 === (n = n || Object.create(null)).increment && (n.increment = 1), 
        e.assert(1 === arguments.length || 2 === arguments.length), e.arrayIs(t) ? t[1] : e.mapIs(t) ? t.last : void e.assert(0, "unexpected type of range", e.strType(t));
      }
      //
      ,
      rangeToStr: function rangeToStr(t) {
        return e.assert(e.rangeIs(t)), e.assert(1 === arguments.length), t[0] + ".." + t[1];
      }
      // --
      // fields
      // --
        });
    //
    Object.assign(t, n), Object.assign(t, {}), 
    // --
    // export
    // --
    "undefined" != typeof module && null !== module && (module.exports = t);
  }();
  // == end of file fRangeS
}();