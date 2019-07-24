!function fTimeS() {
  // == begin of file fTimeS
  !function _fTime_s_() {
    "use strict";
    _global_;
    let e = _global_.wTools, t = _global_.wTools, o = (Array.prototype.indexOf, Array.prototype.lastIndexOf, 
    Array.prototype.slice, Array.prototype.splice, Function.prototype.bind, Object.hasOwnProperty, 
    Object.propertyIsEnumerable, Math.ceil, Math.floor, {
      dateIs: 
      // --
      // time
      // --
      function dateIs(e) {
        return "[object Date]" === Object.prototype.toString.call(e);
      }
      //
      ,
      datesAreIdentical: function datesAreIdentical(t, o) {
        return e.assert(2 === arguments.length, "Expects exactly two arguments"), !!e.dateIs(t) && !!e.dateIs(o) && (t = t.getTime()) === o.getTime();
      }
      // --
      // fields
      // --
        });
    //
    Object.assign(t, o), Object.assign(t, {}), 
    // --
    // export
    // --
    "undefined" != typeof module && null !== module && (module.exports = t);
  }();
  // == end of file fTimeS
}();