!function fCheckerS() {
  // == begin of file fCheckerS
  !function _fChecker_s_() {
    "use strict";
    //
    /**
 * Is instance of a class.
 * @function instanceIs
 * @param {object} src - entity to check
 * @memberof wTools
 */
    function instanceIs(t) {
      return e.assert(1 === arguments.length, "Expects single argument"), !(e.primitiveIs(t) || n.call(t, "constructor") || n.call(t, "prototype") && t.prototype || Object.getPrototypeOf(t) === Object.prototype || null === Object.getPrototypeOf(t));
    }
    //
        //
    function consoleIs(t) {
      if (e.assert(1 === arguments.length, "Expects single argument"), console.Console && t && t instanceof console.Console) return !0;
      if (t !== console) return !1;
      let n = Object.prototype.toString.call(t);
      return "[object Console]" === n || "[object Object]" === n;
    }
    //
        //
    function printerIs(t) {
      return e.assert(1 === arguments.length, "Expects single argument"), !!t && (!!Object.getPrototypeOf(t) && "Printer" === t.MetaType);
    }
    //
        _global_;
    let e = _global_.wTools, t = _global_.wTools, n = (Array.prototype.slice, Function.prototype.bind, 
    Object.hasOwnProperty), r = null, o = {
      /* qqq : requires good tests */
      nothingIs: 
      // --
      // type test
      // --
      function nothingIs(t) {
        return null === t || void 0 === t || t === e.nothing;
      }
      //
      ,
      definedIs: function definedIs(t) {
        return void 0 !== t && null !== t && NaN !== t && t !== e.nothing;
      }
      //
      ,
      primitiveIs: function primitiveIs(e) {
        if (!e) return !0;
        let t = Object.prototype.toString.call(e);
        return "[object Symbol]" === t || "[object Number]" === t || "[object BigInt]" === t || "[object Boolean]" === t || "[object String]" === t;
      }
      //
      ,
      containerIs: function containerIs(t) {
        return !!e.arrayLike(t) || !!e.objectIs(t);
      }
      //
      ,
      containerLike: function containerLike(t) {
        return !!e.longIs(t) || !!e.objectLike(t);
      }
      //
      ,
      symbolIs: function symbolIs(e) {
        return "[object Symbol]" === Object.prototype.toString.call(e);
      }
      //
      ,
      bigIntIs: function bigIntIs(e) {
        return "[object BigInt]" === Object.prototype.toString.call(e);
      }
      //
      ,
      vectorIs: function vectorIs(t) {
        if (!e.objectIs(t)) return !1;
        if (!("_vectorBuffer" in t)) return !1;
        if (n.call(t, "constructor")) {
          debugger;
          return !1;
        }
        return !0;
      }
      //
      ,
      constructorIsVector: function constructorIsVector(e) {
        return !!e && "_vectorBuffer" in e.prototype;
      }
      //
      ,
      spaceIs: function spaceIs(t) {
        return !!t && !!e.Space && (t instanceof e.Space || void 0);
      }
      //
      ,
      constructorIsSpace: function constructorIsSpace(t) {
        return !!e.Space && t === e.Space;
      }
      //
      ,
      consequenceIs: function consequenceIs(e) {
        if (!e) return !1;
        let t = Object.getPrototypeOf(e);
        return !!t && "Consequence" === t.shortName;
      }
      //
      ,
      consequenceLike: function consequenceLike(t) {
        return !!e.consequenceIs(t) || !!e.promiseIs(t);
      }
      //
      ,
      promiseIs: function promiseIs(e) {
        return !!e && e instanceof Promise;
      }
      //
      ,
      promiseLike: function promiseLike(t) {
        return !!t && e.routineIs(t.then) && e.routineIs(t.catch) && t.constructor && "Promise" === t.constructor.name;
      }
      //
      ,
      typeOf: function typeOf(t, n) {
        return e.assert(1 === arguments.length || 2 === arguments.length, "Expects single argument"), 
        2 === arguments.length ? e.typeOf(t) === n : null === t || void 0 === t ? null : e.numberIs(t) || e.boolIs(t) || e.strIs(t) ? t.constructor : t.constructor ? (e.assert(e.routineIs(t.constructor) && t instanceof t.constructor), 
        t.constructor) : null;
      }
      //
      ,
      prototypeOf: function prototypeOf(t, n) {
        return e.assert(2 === arguments.length, "Expects single argument"), t === n || !!t && !!n && Object.isPrototypeOf.call(t, n);
      }
      //
      ,
      prototypeHas: function prototypeHas(t, n) {
        return e.assert(2 === arguments.length, "Expects single argument"), e.prototypeOf(n, t);
      }
      //
      /**
 * Is prototype.
 * @function prototypeIs
 * @param {object} src - entity to check
 * @memberof wTools
 */ ,
      prototypeIs: function prototypeIs(t) {
        return e.assert(1 === arguments.length, "Expects single argument"), !e.primitiveIs(t) && n.call(t, "constructor");
      }
      //
      ,
      prototypeIsStandard: function prototypeIsStandard(t) {
        return !!e.prototypeIs(t) && !!n.call(t, "Composes");
      }
      //
      /**
 * Checks if argument( cls ) is a constructor.
 * @function constructorIs
 * @param {Object} cls - entity to check
 * @memberof wTools
 */ ,
      constructorIs: function constructorIs(t) {
        return e.assert(1 === arguments.length, "Expects single argument"), e.routineIs(t) && !instanceIs(t);
      }
      //
      ,
      constructorIsStandard: function constructorIsStandard(t) {
        e.assert(e.constructorIs(t));
        let n = e.prototypeGet(t);
        return e.prototypeIsStandard(n);
      },
      instanceIs: instanceIs,
      instanceIsStandard: function instanceIsStandard(t) {
        if (e.assert(1 === arguments.length, "Expects single argument"), !e.instanceIs(t)) return !1;
        let n = e.prototypeGet(t);
        return !!n && e.prototypeIsStandard(n);
      }
      //
      ,
      instanceLike: function instanceLike(t) {
        return !e.primitiveIs(t) && !!t.Composes;
      }
      //
      ,
      workerIs: function workerIs(t) {
        return e.assert(0 === arguments.length || 1 === arguments.length), 1 === arguments.length ? "undefined" != typeof WorkerGlobalScope && t instanceof WorkerGlobalScope || "undefined" != typeof Worker && t instanceof Worker : "undefined" != typeof WorkerGlobalScope;
      }
      //
      ,
      streamIs: function streamIs(t) {
        return e.assert(1 === arguments.length, "Expects single argument"), e.objectIs(t) && e.routineIs(t.pipe);
      },
      consoleIs: consoleIs,
      printerLike: function printerLike(t) {
        return e.assert(1 === arguments.length, "Expects single argument"), !!printerIs(t) || !!consoleIs(t);
      },
      printerIs: printerIs,
      loggerIs: function loggerIs(t) {
        return e.assert(1 === arguments.length, "Expects single argument"), !!e.Logger && t instanceof e.Logger;
      }
      //
      ,
      processIs: function processIs(t) {
        e.assert(1 === arguments.length, "Expects single argument");
        let n = e.strType(t);
        return "ChildProcess" === n || "process" === n;
      }
      //
      ,
      processIsDebugged: function processIsDebugged() {
        if (e.assert(0 === arguments.length), "undefined" == typeof process) return !1;
        if (null === r) try {
          r = require("inspector");
        } catch (e) {
          r = !1;
        }
        if (r) return e.strIs(r.url());
        if (!process.execArgv.length) return !1;
        let t = process.execArgv.join();
        return e.strHasAny(t, [ "--inspect", "--inspect-brk", "--debug-brk" ]);
      }
      //
      ,
      definitionIs: function definitionIs(t) {
        return e.assert(1 === arguments.length, "Expects single argument"), !!t && !!e.define && t instanceof e.define.Definition;
      }
      // --
      // fields
      // --
        };
    //
    Object.assign(t, o), Object.assign(t, {}), 
    // --
    // export
    // --
    "undefined" != typeof module && null !== module && (module.exports = t);
  }();
  // == end of file fCheckerS
}();