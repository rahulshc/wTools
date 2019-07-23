!function NameToolsS() {
  // == begin of file NameToolsS
  !function _NameTools_s_() {
    "use strict";
    var e, t = _global_.wTools, n = (_global_, _global_.wTools), o = (Array.prototype.slice, 
    Function.prototype.bind, Object.prototype.toString, Object.hasOwnProperty, n.longSlice, 
    {
      // name and symbol
      nameFielded: 
      // --
      // name and symbol
      // --
      /**
 * Produce fielded name from string.
 * @param {string} nameString - object coded name or string.
 * @return {object} nameKeyValue - name in key/value format.
 * @method nameFielded
 * @memberof wTools
 */
      function nameFielded(e) {
        if (n.objectIs(e)) return e;
        if (n.strIs(e)) {
          var t = {};
          return t[e] = e, t;
        }
        n.assert(0, "nameFielded :", "Expects string or ");
      }
      //
      /**
 * Returns name splitted in coded/raw fields.
 * @param {object} nameObject - fielded name or name as string.
 * @return {object} name splitted in coded/raw fields.
 * @method nameUnfielded
 * @memberof wTools
 */ ,
      /* experimental */
      nameUnfielded: function nameUnfielded(e) {
        var t = {};
        if (n.mapIs(e)) {
          var o = Object.keys(e);
          n.assert(1 === o.length), t.coded = o[0], t.raw = e[t.coded];
        } else n.strIs(e) ? (t.raw = e, t.coded = e) : n.symbolIs(e) ? (t.raw = e, t.coded = e) : n.assert(0, "nameUnfielded :", "Unknown arguments");
        // _.assert( arguments.length === 1 );
        // _.assert( _.strIs( name.raw ) || _.symbolIs( name.raw ), 'nameUnfielded :', 'not a string, something wrong :', nameObject );
        // _.assert( _.strIs( name.coded ) || _.symbolIs( name.coded ), 'nameUnfielded :', 'not a string, something wrong :', nameObject );
                return t;
      }
      //
      /**
 * Returns name splitted in coded/coded fields. Drops raw part replacing it by coded.
 * @param {object} namesMap - fielded names.
 * @return {object} expected map.
 * @method namesCoded
 * @memberof wTools
 */ ,
      /* experimental */
      namesCoded: function namesCoded(e) {
        var t = {};
        for (var o in n.assert && n.assert(1 === arguments.length), n.assert && n.assert(n.objectIs(e)), 
        e) t[o] = o;
        return t;
      }
      // --
      // id
      // --
      ,
      /* experimental */
      // id
      idWithDate: function idWithDate(e, t, n) {
        var o = new Date();
        return e = e || "", t = t || "", n ? e + o.valueOf() + t : e + [ o.getFullYear(), o.getMonth() + 1, o.getDate(), o.getHours(), o.getMinutes(), o.getSeconds(), o.getMilliseconds(), Math.floor(65536 * Math.random()).toString(16) ].join("-") + t;
      }
      //
      ,
      idWithTime: function idWithTime(e, t) {
        var n = new Date();
        return e = e || "", t = t || "", e + [ String(n.getHours()) + String(n.getMinutes()) + String(n.getSeconds()), String(n.getMilliseconds()), Math.floor(65536 * Math.random()).toString(16) ].join("-") + t;
      }
      //
      /* qqq : reimplement it more properly */ ,
      idWithGuid: function idWithGuid() {
        function s4() {
          return Math.floor(65536 * (1 + Math.random())).toString(16).substring(1);
        }
        return [ s4() + s4(), s4(), s4(), s4(), s4() + s4() + s4() ].join("-");
      }
      //
      ,
      idWithInt: (e = 0, function() {
        return n.assert(0 === arguments.length), e += 1;
      })
    });
    n.mapExtend(t, o), 
    // --
    // export
    // --
    "undefined" != typeof module && null !== module && (module.exports = t);
  }();
  // == end of file NameToolsS
}();