!function gBoolS() {
  // == begin of file gBoolS
  !function _gBool_s_() {
    "use strict";
    _global_;
    let o = _global_.wTools, e = _global_.wTools, t = (Array.prototype.slice, Function.prototype.bind, 
    Object.prototype.toString, Object.hasOwnProperty, {
      boolFrom: 
      // --
      // bool
      // --
      /**
 * @summary Converts argument( src ) to boolean.
 * @function boolFrom
 * @param {*} src - entity to convert
 * @memberof wTools
 */
      function boolFrom(e) {
        return o.strIs(e) ? "0" != (e = e.toLowerCase()) && "false" != e && "null" != e && "undefined" != e && "" != e : Boolean(e);
      }
      // --
      // fields
      // --
        });
    //
    Object.assign(e, t), Object.assign(e, {}), 
    // --
    // export
    // --
    "undefined" != typeof module && null !== module && (module.exports = e);
  }();
  // == end of file gBoolS
}();