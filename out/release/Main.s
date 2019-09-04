!function _library_() {
  // begin of library
  !function _StarterWare_() {
    //
    function ScriptFile(e) {
      return this instanceof ScriptFile ? (void 0 === e.isScript && (e.isScript = !0), 
      // o.filePath = _starter_._pathResolve( null, o.filePath );
      e.filePath = s.path.canonizeTolerant(e.filePath), this.filePath = e.filePath, this.dirPath = e.dirPath, 
      this.nakedCall = e.nakedCall, this.isScript = e.isScript, this.filename = e.filePath, 
      this.exports = void 0, this.parent = null, this.error = null, this.state = e.nakedCall ? "preloaded" : "created", 
      this.starter = s, this.include = s._fileInclude.bind(s, this), this.resolve = s._fileResolve.bind(s, this), 
      this.include.resolve = this.resolve, this.include.scriptFile = this, this._nodejsInclude = r, 
      this._nodejsResolve = n, 
      /* nodejs compatibility */
      this.path = [ "/" ], this.loaded = !1, this.id = e.filePath, Object.preventExtensions(this), 
      s.preloadedFilesMap[e.filePath] = this, this) : new ScriptFile(e);
    }
    //
        // begin of starterware
    // --
    // own
    // --
    let e = void 0;
    e || "undefined" == typeof Global || Global.Global !== Global || (e = Global), e || "undefined" == typeof global || global.global !== global || (e = global), 
    e || "undefined" == typeof window || window.window !== window || (e = window), e || "undefined" == typeof self || self.self !== self || (e = self), 
    e._realGlobal_ = e;
    let t = e._global_ || e;
    if ((e = t)._global_ = t, _global_.Config || (_global_.Config = {}), void 0 === _global_.Config.platform && (_global_.Config.platform = "undefined" != typeof module && "undefined" != typeof process ? "nodejs" : "browser"), 
    void 0 === _global_.Config.isWorker && (_global_.Config.isWorker = !("undefined" == typeof self || self.self !== self || "undefined" == typeof importScripts)), 
    e._starter_) return;
    let r = require, n = require.resolve, s = e._starter_ = e._starter_ || Object.create(null), l = s, a = (s.preloadedFilesMap = s.preloadedFilesMap || Object.create(null), 
    s.openedFilesMap = s.openedFilesMap || Object.create(null), s.path = s.path || Object.create(null));
    // --
    // imported
    // --
    l.strIs = function strIs(e) {
      return "[object String]" === Object.prototype.toString.call(e);
    }, 
    //
    l._strBeginOf = function _strBeginOf(e, t) {
      if (l.assert(l.strIs(e), "Expects string"), l.assert(2 === arguments.length, "Expects exactly two arguments"), 
      l.strIs(t)) {
        if (0 === e.lastIndexOf(t, 0)) return t;
      } else if (l.regexpIs(t)) {
        let r = t.exec(e);
        if (r && 0 === r.index) return r[0];
      } else l.assert(0, "Expects string-like ( string or regexp )");
      return !1;
    }, 
    //
    l._strEndOf = function _strEndOf(e, t) {
      if (l.assert(l.strIs(e), "Expects string"), l.assert(2 === arguments.length, "Expects exactly two arguments"), 
      l.strIs(t)) {
        if (-1 !== e.indexOf(t, e.length - t.length)) return t;
      } else if (l.regexpIs(t)) {
        // let matched = end.exec( src );
        let r = RegExp(t.toString().slice(1, -1) + "$").exec(e);
        debugger;
        //if( matched && matched.index === 0 )
                if (r && r.index + r[0].length === e.length) return r[0];
      } else l.assert(0, "Expects string-like ( string or regexp )");
      return !1;
    }, 
    //
    l._strRemovedBegin = function _strRemovedBegin(e, t) {
      l.assert(2 === arguments.length, "Expects exactly two arguments"), l.assert(l.strIs(e), "Expects string {-src-}");
      let r = e, n = l._strBeginOf(r, t);
      return !1 !== n && (r = r.substr(n.length, r.length)), r;
    }, 
    //
    l._strRemovedEnd = function _strRemovedEnd(e, t) {
      l.assert(2 === arguments.length, "Expects exactly two arguments"), l.assert(l.strIs(e), "Expects string {-src-}");
      let r = e, n = l._strEndOf(r, t);
      return !1 !== n && (r = r.substr(0, r.length - n.length)), r;
    }, 
    //
    l.strBegins = function strBegins(e, t) {
      if (l.assert(l.strIs(e), "Expects string {-src-}"), l.assert(l.strIs(t) || l.regexpIs(t) || l.longIs(t), "Expects string/regexp or array of strings/regexps {-begin-}"), 
      l.assert(2 === arguments.length, "Expects exactly two arguments"), !l.longIs(t)) {
        let r = l._strBeginOf(e, t);
        return !1 !== r || r;
      }
      for (let r = 0, n = t.length; r < n; r++) if (!1 !== l._strBeginOf(e, t[r])) return !0;
      return !1;
    }, 
    //
    l.strEnds = function strEnds(e, t) {
      if (l.assert(l.strIs(e), "Expects string {-src-}"), l.assert(l.strIs(t) || l.regexpIs(t) || l.longIs(t), "Expects string/regexp or array of strings/regexps {-end-}"), 
      l.assert(2 === arguments.length, "Expects exactly two arguments"), !l.longIs(t)) {
        let r = l._strEndOf(e, t);
        return !1 !== r || r;
      }
      for (let r = 0, n = t.length; r < n; r++) if (!1 !== l._strEndOf(e, t[r])) return !0;
      return !1;
    }, 
    //
    l.strRemoveBegin = function strRemoveBegin(e, t) {
      l.assert(2 === arguments.length, "Expects exactly two arguments"), l.assert(l.longIs(e) || l.strIs(e), "Expects string or array of strings {-src-}"), 
      l.assert(l.longIs(t) || l.strIs(t) || l.regexpIs(t), "Expects string/regexp or array of strings/regexps {-begin-}");
      let r = [], n = l.longIs(e);
      if (l.strIs(e) && !l.longIs(t)) return l._strRemovedBegin(e, t);
      e = l.arrayAs(e), t = l.arrayAs(t);
      for (let n = 0, s = e.length; n < s; n++) {
        let s = !1, a = e[n];
        for (let e = 0, r = t.length; e < r && !1 === (s = l._strBeginOf(a, t[e])); e++) ;
        !1 !== s && (a = a.substr(s.length, a.length)), r[n] = a;
      }
      return n ? r : r[0];
    }, 
    //
    l.strRemoveEnd = function strRemoveEnd(e, t) {
      l.assert(2 === arguments.length, "Expects exactly two arguments"), l.assert(l.longIs(e) || l.strIs(e), "Expects string or array of strings {-src-}"), 
      l.assert(l.longIs(t) || l.strIs(t) || l.regexpIs(t), "Expects string/regexp or array of strings/regexps {-end-}");
      let r = [], n = l.longIs(e);
      if (l.strIs(e) && !l.longIs(t)) return l._strRemovedEnd(e, t);
      e = l.arrayAs(e), t = l.arrayAs(t);
      for (let n = 0, s = e.length; n < s; n++) {
        let s = !1, a = e[n];
        for (let e = 0, r = t.length; e < r && !1 === (s = l._strEndOf(a, t[e])); e++) ;
        !1 !== s && (a = a.substr(0, a.length - s.length)), r[n] = a;
      }
      return n ? r : r[0];
    }, 
    //
    l.regexpIs = function regexpIs(e) {
      return "[object RegExp]" === Object.prototype.toString.call(e);
    }, 
    //
    l.longIs = function longIs(e) {
      return !(l.primitiveIs(e) || l.routineIs(e) || l.objectIs(e) || l.strIs(e) || Object.propertyIsEnumerable.call(e, "length") || !l.numberIs(e.length));
    }, 
    //
    l.primitiveIs = function primitiveIs(e) {
      if (!e) return !0;
      let t = Object.prototype.toString.call(e);
      return "[object Symbol]" === t || "[object Number]" === t || "[object BigInt]" === t || "[object Boolean]" === t || "[object String]" === t;
    }, 
    //
    a.refine = function refine(e) {
      l.assert(1 === arguments.length, "Expects single argument"), l.assert(l.strIs(e));
      let t = e;
      return ":" === t[1] && ("\\" === t[2] || "/" === t[2] ? t = t.length > 3 ? "/" + t[0] + "/" + t.substring(3) : "/" + t[0] : 2 === t.length && (t = "/" + t[0])), 
      t.replace(/\\/g, "/");
    }, 
    //
    a._normalize = function _normalize(e) {
      if (l.assertRoutineOptions(_normalize, arguments), l.assert(l.strIs(e.src), "Expects string"), 
      !e.src.length) return "";
      let t = e.src;
      t = this.refine(t), 
      /* detrailing */
      e.tolerant && (
      /* remove "/" duplicates */
      t = t.replace(this._delUpDupRegexp, this._upStr));
      let r = !1, n = !1;
      /* undoting */
      for (
      /* remove right "/" */
      t !== this._upStr && !l.strEnds(t, this._upStr + this._upStr) && l.strEnds(t, this._upStr) && (r = !0, 
      t = l.strRemoveEnd(t, this._upStr)); !l.strBegins(t, this._hereUpStr + this._upStr) && l.strBegins(t, this._hereUpStr); ) n = !0, 
      t = l.strRemoveBegin(t, this._hereUpStr);
      /* remove second "." */      if (-1 !== t.indexOf(this._hereStr)) {
        for (;this._delHereRegexp.test(t); ) t = t.replace(this._delHereRegexp, function(e, t) {
          return t || "";
        });
        "" === t && (t = this._upStr);
      }
      /* remove .. */      if (-1 !== t.indexOf(this._downStr)) for (;this._delDownRegexp.test(t); ) t = t.replace(this._delDownRegexp, (e, t, r, n, s) => {
        return "" === n ? t : t ? t + (s || "") : t + n;
      });
      /* nothing left */      return t.length || (t = ".")
      /* dot and trail */ , e.detrailing && (t === this._upStr || l.strEnds(t, this._upStr + this._upStr) || (t = l.strRemoveEnd(t, this._upStr))), 
      !e.detrailing && r && t !== this._rootStr && (t += this._upStr), !e.undoting && n && (t = this.dot(t)), 
      t;
    }, 
    //
    a.canonizeTolerant = function canonizeTolerant(e) {
      l.assert(l.strIs(e), "Expects string");
      let t = this._normalize({
        src: e,
        tolerant: !0,
        detrailing: !0,
        undoting: !0
      });
      return l.assert(1 === arguments.length, "Expects single argument"), l.assert(t === this._upStr || l.strEnds(t, this._upStr) || !l.strEnds(t, this._upStr + this._upStr)), 
      l.assert(-1 === t.lastIndexOf(this._upStr + this._hereStr + this._upStr)), l.assert(!l.strEnds(t, this._upStr + this._hereStr)), 
      l.assert(!this._delUpDupRegexp.test(t)), t;
    }, 
    //
    a._rootStr = "/", 
    //
    a._upStr = "/", 
    //
    a._hereStr = ".", 
    //
    a._downStr = "..", 
    //
    a._hereUpStr = "./", 
    //
    a._downUpStr = "../", 
    //
    a._delHereRegexp = /\/\.(\/|$)/, 
    //
    a._delDownRegexp = /((?:.|^))(?:(?:\/\/)|(((?:^|\/))(?!\.\.(?:\/|$))(?:(?!\/).)+\/))\.\.((?:\/|$))/, 
    //
    a._delUpDupRegexp = /\/{2,}/g, 
    //
    a.currentAtBegin = "/C/pro/web/Port/package/wTools";
    //
    // --
    // declare
    // --
    //
    let i = {
      ScriptFile: ScriptFile,
      _pathResolve: function _pathResolve(e, t) {
        let r = null;
        if (s.strIs(e) ? r = e : e && (r = e.dirPath), !r) {
          debugger;
          throw "Base path is not specified";
        }
        return "/" !== (t = s.path.canonizeTolerant(t))[0] && (t = s.path.canonizeTolerant(r + "/" + t)), 
        t;
      }
      //
      ,
      _nodejsInclude: r,
      _fileIncludeAct: function _fileIncludeAct(e, t) {
        try {
          if ("opened" === t.state) return t.exports;
          t.parent = e || null, t.nakedCall.call(t), t.loaded = !0, t.state = "opened", s.openedFilesMap[t.filePath] = t;
        } catch (e) {
          throw e.message += "\nError including " + t.filePath, t.error = e, t.state = "errored", 
          e;
        }
        return t.exports;
      }
      //
      ,
      _fileInclude: function _fileInclude(e, t) {
        let r, n = s._fileGet.apply(this, arguments);
        return s.strIs(e) ? (r = s._nodejsInclude, e = null) : r = e ? e._nodejsInclude : s._nodejsInclude, 
        n ? (s.strIs(e) && (e = null), s._fileIncludeAct(e, n)) : r(t);
      }
      //
      ,
      _fileResolve: function _fileResolve(e, t) {
        let r, n = s._fileGet.apply(this, arguments);
        return s.strIs(e) ? (r = s._nodejsResolve, e = null) : r = e ? e._nodejsResolve : s._nodejsResolve, 
        n ? n.filePath : r(t);
      }
      //
      ,
      _fileGet: function _fileGet(e, t) {
        let r = null;
        return s.strIs(e) ? r = e : e && (r = e.dirPath), "." !== t[0] ? null : (resolvedFilePath = s._pathResolve(r, t), 
        s.preloadedFilesMap[resolvedFilePath] || null);
      }
      //
      ,
      _fileCreate: function _fileCreate(e, t, r) {
        return ScriptFile({
          filePath: e,
          dirPath: t,
          nakedCall: r
        });
      }
      //
      ,
      assert: function assert() {}
      //
      ,
      assertRoutineOptions: function assertRoutineOptions() {},
      path: a
    };
    Object.assign(s, i);
  }(), _starter_.path.canonizeTolerant(__filename);
  // end of starterware
  let e = _starter_.path.canonizeTolerant(__dirname);
  !function Tools_s() {
    let t = _starter_._pathResolve(e, "dwtools/Tools.s"), r = _starter_._pathResolve(e, "dwtools/"), n = _starter_._fileCreate(t, r, // == begin of file Tools_s
    function Tools_s_naked() {
      if (void 0 !== n) {
        if ("undefined" == typeof _global_ || !_global_.wBase) {
          let e = "./Base.s", t = 0;
          try {
            e = s.resolve(e);
          } catch (e) {
            t = 1, s("wTools");
          }
          t || s(e);
        }
        n.exports = _global_.wTools;
      }
    }), s = n.include;
    n.include;
  }(), // == end of file Tools_s
  function Layer0_s() {
    let t = _starter_._pathResolve(e, "dwtools/abase/Layer0.s"), r = _starter_._pathResolve(e, "dwtools/abase/"), n = _starter_._fileCreate(t, r, // == begin of file Layer0_s
    function Layer0_s_naked() {
      //#! /usr/bin/env node
      !function _wToolsLayer0_s_() {
        "use strict";
        void 0 !== n && null !== n && (s("./l0/aPredefined.s"), s("./l0/aSetup.s"), s("./l0/bPremature.s"), 
        s("./l0/fBool.s"), s("./l0/fChecker.s"), s("./l0/fEntity.s"), s("./l0/fErr.s"), 
        s("./l0/fLong.s"), s("./l0/fMap.s"), s("./l0/fNumber.s"), s("./l0/fRange.s"), s("./l0/fRegexp.s"), 
        s("./l0/fRoutine.s"), s("./l0/fString.s"), s("./l0/fTime.s"), s("./l0/iArrayDescriptor.s"), 
        s("./l0/iCompose.s"), s("./l0/iField.s"), _global_, _global_.wTools, _global_.wTools), 
        _global_, _global_.wTools;
        let e = _global_.wTools;
        // --
        // export
        // --
        void 0 !== n && null !== n && (n.exports = e);
      }();
    }), s = n.include;
    n.include;
  }(), // == end of file Layer0_s
  function Layer1_s() {
    let t = _starter_._pathResolve(e, "dwtools/abase/Layer1.s"), r = _starter_._pathResolve(e, "dwtools/abase/"), n = _starter_._fileCreate(t, r, // == begin of file Layer1_s
    function Layer1_s_naked() {
      //#! /usr/bin/env node
      !function _wToolsLayer1_s_() {
        "use strict";
        void 0 !== n && null !== n && (s("./Layer0.s"), s("./l1/cErr.s"), s("./l1/gBool.s"), 
        s("./l1/gEntity.s"), s("./l1/gLong.s"), s("./l1/gMap.s"), s("./l1/gNumber.s"), s("./l1/gRange.s"), 
        s("./l1/gRegexp.s"), s("./l1/gRoutine.s"), s("./l1/gString.s"), s("./l1/gTime.s"), 
        s("./l1/zSetup.s"), _global_, _global_.wTools, _global_.wTools), _global_, _global_.wTools;
        let e = _global_.wTools;
        // --
        // export
        // --
        void 0 !== n && null !== n && (n.exports = e);
      }();
    }), s = n.include;
    n.include;
  }(), // == end of file Layer1_s
  function Layer2_s() {
    let t = _starter_._pathResolve(e, "dwtools/abase/Layer2.s"), r = _starter_._pathResolve(e, "dwtools/abase/"), n = _starter_._fileCreate(t, r, // == begin of file Layer2_s
    function Layer2_s_naked() {
      !function _wToolsLayer2_s_() {
        "use strict";
        void 0 !== n && null !== n && (s("./Layer1.s"), s("./l2/IncludeTools.s"), s("./l2/NameTools.s"), 
        s("./l2/StringTools.s"), s("./l2/ModulesRegistry.s")), _global_, _global_.wTools;
        let e = _global_.wTools;
        // --
        // export
        // --
        void 0 !== n && null !== n && (n.exports = e);
      }();
    }), s = n.include;
    n.include;
  }(), // == end of file Layer2_s
  function aPredefined_s() {
    let t = _starter_._pathResolve(e, "dwtools/abase/l0/aPredefined.s"), r = _starter_._pathResolve(e, "dwtools/abase/l0/"), n = r, s = _starter_._fileCreate(t, r, // == begin of file aPredefined_s
    function aPredefined_s_naked() {
      !function _aPredefined_s_() {
        "use strict";
        /**
 * @file aPredefined.s.
 */
        // /**
        //   @module Tools/base/Fundamental - Collection of general purpose tools for solving problems. Fundamentally extend JavaScript without corrupting it, so may be used solely or in conjunction with another module of such kind. Tools contain hundreds of routines to operate effectively with Array, SortedArray, Map, RegExp, Buffer, Time, String, Number, Routine, Error and other fundamental types. The module provides advanced tools for diagnostics and errors handling. Use it to have a stronger foundation for the application.
        // */
        /**
 * wTools - Generic purpose tools of base level for solving problems in Java Script.
 * @namespace wTools
 */
        // global
                let e = void 0;
        e || "undefined" == typeof Global || Global.Global !== Global || (e = Global), e || "undefined" == typeof global || global.global !== global || (e = global), 
        e || "undefined" == typeof window || window.window !== window || (e = window), e || "undefined" == typeof self || self.self !== self || (e = self);
        let t = e._realGlobal_ = e, r = e._global_ || e;
        // verification
        // if( !_global_.WTOOLS_PRIVATE )
        if ((e = r)._global_ = r, "real" === _global_.__GLOBAL_WHICH__) {
          if (_global_.wBase) return _global_.wTools.usePath && _global_.wTools.usePath(n + "/../..") /* xxx : remove later */ , 
          void (s.exports = _global_.wBase);
          if (_global_.wBase) throw new Error("wTools was included several times");
        }
        // config
                if (void 0 === t.__GLOBAL_WHICH__ && (t.__GLOBAL_WHICH__ = "real"), t.Config || (t.Config = {
          debug: !0
        }), void 0 === t.Config.debug && (t.Config.debug = !0), void 0 === t.Config.platform && (t.Config.platform = void 0 !== s && "undefined" != typeof process ? "nodejs" : "browser"), 
        void 0 === t.Config.isWorker && (t.Config.isWorker = !("undefined" == typeof self || self.self !== self || "undefined" == typeof importScripts)), 
        _global_.Config || (_global_.Config = {
          debug: !0
        }), void 0 === _global_.Config.debug && (_global_.Config.debug = !0), void 0 === _global_.Config.platform && (_global_.Config.platform = void 0 !== s && "undefined" != typeof process ? "nodejs" : "browser"), 
        void 0 === _global_.Config.isWorker && (_global_.Config.isWorker = !("undefined" == typeof self || self.self !== self || "undefined" == typeof importScripts)), 
        // if( !_global_.WTOOLS_PRIVATE  )
        "real" === _global_.__GLOBAL_WHICH__ && _global_._ && (_global_.Underscore = _global_._, 
        delete _global_._), Object.hasOwnProperty.call(e, "wTools") && e !== _realGlobal_) throw Error("wTools was already defined");
        //
                e.wTools = Object.create(null), _realGlobal_.wTools = _realGlobal_.wTools || Object.create(null);
        let l = e.wTools;
        l.__GLOBAL_WHICH__ = e.__GLOBAL_WHICH__, 
        // special globals
        l.def = Symbol.for("def"), l.nothing = Symbol.for("nothing"), l.maybe = Symbol.for("maybe"), 
        l.dont = Symbol.for("dont"), l.unroll = Symbol.for("unroll"), 
        // Self.hold = Symbol.for( 'hold' );
        // type aliases
        _global_.U32x = Uint32Array, _global_.U16x = Uint16Array, _global_.U8x = Uint8Array, 
        _global_.Ux = _global_.U32x, _global_.I32x = Int32Array, _global_.I16x = Int16Array, 
        _global_.I8x = Int8Array, _global_.Ix = _global_.I32x, _global_.F64x = Float64Array, 
        _global_.F32x = Float32Array, _global_.Fx = _global_.F32x, 
        // --
        // export
        // --
        e.wTools = l, e.wTools = l, e.wBase = l, void 0 !== s && null !== s && (s.exports = l);
      }();
    });
    s.include, s.include;
  }(), // == end of file aPredefined_s
  function aSetup_s() {
    let t = _starter_._pathResolve(e, "dwtools/abase/l0/aSetup.s"), r = _starter_._pathResolve(e, "dwtools/abase/l0/"), n = _starter_._fileCreate(t, r, // == begin of file aSetup_s
    function aSetup_s_naked() {
      !function _aSetup_s_() {
        "use strict";
        // --
        // setup
        // --
        function _setupUnhandledErrorHandler0() {
          /* */
          function handleBrowserError(e, n, s, l, a) {
            let i;
            return i = t._handleUnhandledError1 ? t._handleUnhandledError1.apply(this, arguments) : handleError(new Error(e)), 
            r && r.apply(this, arguments), i;
          }
          /* */          function handleNodeError(e) {
            let n;
            if (n = t._handleUnhandledError1 ? t._handleUnhandledError1.apply(this, arguments) : handleError(e), 
            r && r.apply(this, arguments), _appExitError && _appExitError(), t._handleUnhandledError1) return n;
          }
          /* */          function handleError(e) {
            let t = e.toString();
            try {
              t = e.toString();
            } catch (e) {
              debugger;
              console.error(e);
            }
            console.error("------------------------------- unhandled errorr -------------------------------\x3e\n"), 
            console.error(t), console.error(e ? e.stack : ""), console.error("------------------------------- unhandled errorr -------------------------------<\n");
            debugger;
          }
          /* */          function _appExitError() {
            try {
              e.process && (process.exitCode || (process.exitCode = -1));
            } catch (e) {}
          }
          if (e._setupUnhandledErrorHandlerDone) return;
          e._setupUnhandledErrorHandlerDone = 1;
          let r = null;
          if (e.process && "function" == typeof e.process.on) {
            if (r = e.process.onUncaughtException, e.process.on("uncaughtException", handleNodeError), 
            t._handleUnhandledError0 = handleNodeError, r) throw Error("not tested");
          } else Object.hasOwnProperty.call(e, "onerror") && (r = e.onerror, e.onerror = handleBrowserError, 
          t._handleUnhandledError0 = handleBrowserError);
        }
        //
                let e = _global_, t = (e._realGlobal_, e.wTools, e.wTools), r = {
          _handleUnhandledError0: null,
          _handleUnhandledError1: null,
          _setupUnhandledErrorHandler0: _setupUnhandledErrorHandler0,
          _setup0: function _setup0() {
            _setupUnhandledErrorHandler0();
          }
          // --
          // extend
          // --
                };
        Object.assign(t, {
          _setupUnhandledErrorHandlerDone: 0
        }), Object.assign(t, r), t._setup0(), 
        // --
        // export
        // --
        void 0 !== n && null !== n && (n.exports = t);
      }();
    });
    n.include, n.include;
  }(), // == end of file aSetup_s
  function bPremature_s() {
    let t = _starter_._pathResolve(e, "dwtools/abase/l0/bPremature.s"), r = _starter_._pathResolve(e, "dwtools/abase/l0/"), n = _starter_._fileCreate(t, r, // == begin of file bPremature_s
    function bPremature_s_naked() {
      !function _bPremature_s_() {
        "use strict";
        // --
        // routine
        // --
        /**
 * Returns true if entity ( src ) is a String.
 * @function strIs
 * @param {} src - entity to check
 * @memberof wTools
 */
        function strIs(t) {
          return "[object String]" === e.call(t);
        }
        //
        /**
 * Returns true if entity ( src ) is a Function.
 * @function routineIs
 * @param {} src - entity to check
 * @memberof wTools
 */        function routineIs(t) {
          return "[object Function]" === e.call(t);
        }
        //
        /**
 * Returns true if entity ( src ) is an Object.
 * @function objectIs
 * @param {} src - entity to check
 * @memberof wTools
 */        function objectIs(t) {
          return "[object Object]" === e.call(t);
        }
        //
        /**
 * Returns true if entity ( src ) is an Arguments object.
 * @function argumentsArrayIs
 * @param {} src - entity to check
 * @memberof wTools
 */        function argumentsArrayIs(t) {
          return "[object Arguments]" === e.call(t);
        }
        //
        /**
 * @summary Tests if provided condidion is true.
 *
 * @description
 *
 * * If ( msg ) is a Function - overrides ( msg ) with result of execution.
 * * If ( msg ) is a String - uses it as message.
 * * If ( msg ) is not defined - uses default message: 'Assertion fails'.
 * * If ( msg ) has any other type - uses it as argument for 'throw' statement
 *
 * @example
 * _.assert( _.strIs( src ), 'Src is not a string' );
 *
 * @function assert
 * @param {} condition - condition to check
 * @param {} msg - error message
 * @throws {Error} If condition fails. Uses second argument ( msg ) as error message.
 * @memberof wTools
 */        function assert(e, t) {
          if (1 !== arguments.length && 2 !== arguments.length) {
            debugger;
            throw Error("Premature version of assert expects one or two arguments");
          }
          if (!e) {
            debugger;
            throw routineIs(t) && (t = t()), strIs(t) ? Error(t) : void 0 === t ? Error("Assertion fails") : t;
          }
          return !0;
        }
        //
        /**
 * @summary Supplements source options map with defaults of current function( routine ) and checks if all options are known.
 *
 * @description
 *
 * * If ( args ) is an Arguments array, first argument should be a source options map;
 * * If ( args ) is not defined, creates a copy of default options;
 * * If ( defaults ) is not defined, uses defaults map from 'routine.defaults' property;
 *
 * @example
 *
 * function add( o )
 * {
 *  _.routineOptions( add, o );
 *  return o.a + o.b;
 * }
 *
 * add.defaults =
 * {
 *  a : 0,
 *  b : 0
 * }
 *
 * add({ a : 1, b : 1 }) // 2
 * add({ b : 1 }) // 1
 * add({ a : 1, c : 3 }) // throws an error, option "c" is unknown
 *
 * @function routineOptions
 * @param {Function} routine - target routine
 * @param {Arguments|Object} args - arguments array or options map
 * @param {Object} defaults - map with default options
 * @throws {Error} If first argument( routine ) is not a Function.
 * @throws {Error} If second argument( args ) is not an Arguments array or Map.
 * @throws {Error} If third argument( defaults ) is not an Object.
 * @throws {Error} If source options map has unknown properties.
 * @memberof wTools
 */        function routineOptions(e, r, n) {
          argumentsArrayIs(r) || (r = [ r ]);
          let s = r[0];
          void 0 === s && (s = Object.create(null)), n = n || e.defaults, assert(2 === arguments.length || 3 === arguments.length, "Expects 2 or 3 arguments"), 
          assert(routineIs(e), "Expects routine"), assert(objectIs(n), "Expects routine with defined defaults or defaults in third argument"), 
          assert(objectIs(s), "Expects object"), assert(0 === r.length || 1 === r.length, () => "Expects single options map, but got " + r.length + " arguments"), 
          //
          function mapSupplementStructureless(e, r) {
            if (null === e && 2 === arguments.length) return Object.assign(Object.create(null), r);
            null === e && (e = Object.create(null));
            for (let n = 1; n < arguments.length; n++) {
              r = arguments[n];
              for (let n in r) if (void 0 === e[n]) {
                if (t.objectLike(r[n]) || t.arrayLike(r[n])) {
                  debugger;
                  throw Error("Source map should have only primitive elements, but " + n + " is " + r[n]);
                }
                e[n] = r[n];
              }
            }
          }
          //
          (s, n);
          /* xxx qqq : use instead of mapComplement */
          // _.mapComplement( options, defaults );
          // _.assertMapHasNoUndefine( options );
          for (let e in s) assert(void 0 !== n[e], () => "Unknown option " + e);
          return s;
        }
        function vectorize_pre(e, r) {
          let n = r[0];
          return 2 === r.length ? n = {
            routine: r[0],
            select: r[1]
          } : (routineIs(n) || strIs(n)) && (n = {
            routine: r[0]
          }), routineOptions(e, n), assert(2 === arguments.length, "Expects exactly two arguments"), 
          assert(routineIs(n.routine) || strIs(n.routine) || t.strsAreAll(n.routine), () => "Expects routine {-o.routine-}, but got " + n.routine), 
          assert(1 === r.length || 2 === r.length), assert(n.select >= 1 || strIs(n.select) || t.arrayIs(n.select), () => "Expects {-o.select-} as number >= 1, string or array, but got " + n.select), 
          n;
        }
        //
                function vectorize_body(e) {
          /* - */
          function multiplyNo(e) {
            return e;
          }
          /* - */          
          /* - */
          function vectorizeArray() {
            if (s && !arguments.length) return [];
            let e = arguments, n = e[0];
            if (t.longIs(n)) {
              let s = t.longSlice(e), l = [];
              for (let e = 0; e < n.length; e++) s[0] = n[e], l[e] = r.apply(this, s);
              return l;
            }
            return r.apply(this, e);
          }
          /* - */          
          /* - */
          function vectorizeForOptionsMap(e) {
            if (s && !arguments.length) return [];
            let n = e[u];
            if (assert(1 === arguments.length, "Expects single argument"), t.longIs(n)) {
              let s = t.longSlice(arguments);
              o && (s = o(r, s), assert(t.arrayLikeResizable(s)));
              let l = [];
              for (let a = 0; a < n.length; a++) s[0] = t.mapExtend(null, e), s[0][u] = n[a], 
              l[a] = r.apply(this, s);
              return l;
            }
            return r.apply(this, arguments);
          }
          /* - */          t.assertRoutineOptions(vectorize_body, arguments), t.arrayIs(e.routine) && 1 === e.routine.length && (e.routine = e.routine[0]);
          let r = e.routine, n = e.fieldFilter, s = (e.bypassingFilteredOut, e.bypassingEmpty), l = e.vectorizingArray, a = e.vectorizingMapVals, i = e.vectorizingMapKeys, o = null, u = null === e.select ? 1 : e.select, c = Infinity === e.select, p = u > 1 ? function multiplyReally(e) {
            let r, n;
            e = t.longSlice(e), c && (u = e.length), assert(e.length === u, () => "Expects " + u + " arguments, but got " + e.length);
            for (let s = 0; s < u; s++) {
              if (l && t.arrayIs(e[s])) {
                r = e[s].length;
                break;
              }
              if (a && t.mapIs(e[s])) {
                n = t.mapOwnKeys(e[s]);
                break;
              }
            }
            if (void 0 !== r) for (let n = 0; n < u; n++) {
              if (a) assert(!t.mapIs(e[n]), () => "Arguments should have only arrays or only maps, but not both. Incorrect argument : " + e[n]); else if (i && t.mapIs(e[n])) continue;
              e[n] = t.multiple(e[n], r);
            } else if (void 0 !== n) for (let r = 0; r < u; r++) if (t.mapIs(e[r])) assert(t.arraySetIdentical(t.mapOwnKeys(e[r]), n), () => "Maps should have same keys : " + n); else {
              l && assert(!t.longIs(e[r]), () => "Arguments should have only arrays or only maps, but not both. Incorrect argument : " + e[r]);
              let s = Object.create(null);
              t.mapSetWithKeys(s, n, e[r]), e[r] = s;
            }
            return e;
          } : multiplyNo;
          assert(routineIs(r = 
          /* - */
          function routineNormalize(e) {
            return strIs(e) ? function methodCall() {
              return assert(routineIs(this[e]), () => "Context " + t.toStrShort(this) + " does not have routine " + e), 
              this[e].apply(this, arguments);
            } : t.arrayIs(e) ? (assert(2 === e.length), function methodCall() {
              let r = this[e[0]];
              return assert(routineIs(r[e[1]]), () => "Context " + t.toStrShort(r) + " does not have routine " + e), 
              r[e[1]].apply(r, arguments);
            }) : e;
          }(r)), () => "Expects routine {-o.routine-}, but got " + r);
          /* */
          let g = vectorizeArray;
          /* */
          return t.numberIs(u) ? l || a || i ? n ? g = 
          /* - */
          function vectorizeWithFilters(e) {
            assert(0, "not tested"), assert(1 === arguments.length, "Expects single argument");
            let n = p(arguments);
            if (l && t.longIs(e)) throw n = t.longSlice(n), t.err("not tested");
            if (a && t.mapIs(e)) throw n = t.longSlice(n), Object.create(null), t.err("not tested");
            return r.call(this, e);
          }
          /* - */ : i ? 
          // assert( !vectorizingMapVals, '{-o.vectorizingMapKeys-} and {-o.vectorizingMapVals-} should not be enabled at the same time' );
          a ? (assert(1 === u, "Only single argument is allowed if {-o.vectorizingMapKeys-} and {-o.vectorizingMapVals-} are enabled."), 
          g = 
          /* - */
          function vectorizeMapWithKeysOrArray() {
            if (s && !arguments.length) return [];
            let e = p(arguments), n = e[0];
            if (assert(e.length === u, () => "Expects " + u + " arguments but got : " + e.length), 
            i && a && t.mapIs(n)) {
              let e = Object.create(null);
              for (let t in n) {
                let s = r.call(this, n[t]);
                e[r.call(this, t)] = s;
              }
              return e;
            }
            if (l && t.arrayIs(n)) {
              let e = [];
              for (let t = 0; t < n.length; t++) e[t] = r.call(this, n[t]);
              return e;
            }
            return r.apply(this, arguments);
          }) : g = function vectorizeKeysOrArray() {
            // yyy
            if (s && !arguments.length) return [];
            // yyy
                        let e, n, a, o, c, g = p(arguments), f = g[0];
            if (assert(g.length === u, () => "Expects " + u + " arguments but got : " + g.length), 
            i) for (let e = 0; e < u; e++) l && t.arrayIs(g[e]) ? c = g[e] : t.mapIs(g[e]) && (assert(void 0 === a, () => "Arguments should have only single map. Incorrect argument : " + g[e]), 
            a = g[e], o = e);
            if (a) {
              if (n = Object.create(null), e = t.longSlice(g), l && t.arrayIs(c)) for (let t = 0; t < c.length; t++) {
                for (let r = 0; r < u; r++) e[r] = g[r][t];
                for (let t in a) e[o] = t, n[r.apply(this, e)] = a[t];
              } else for (let t in a) e[o] = t, n[r.apply(this, e)] = a[t];
              return n;
            }
            if (l && t.longIs(f)) {
              e = t.longSlice(g), n = [];
              for (let t = 0; t < f.length; t++) {
                for (let r = 0; r < u; r++) e[r] = g[r][t];
                n[t] = r.apply(this, e);
              }
              return n;
            }
            return r.apply(this, arguments);
          } : g = !l || a ? 
          /* - */
          function vectorizeMapOrArray() {
            if (s && !arguments.length) return [];
            let e = p(arguments), n = e[0];
            if (l && t.longIs(n)) {
              let s = t.longSlice(e), l = [];
              for (let t = 0; t < n.length; t++) {
                for (let r = 0; r < u; r++) s[r] = e[r][t];
                l[t] = r.apply(this, s);
              }
              return l;
            }
            if (a && t.mapIs(n)) {
              let s = t.longSlice(e), l = Object.create(null);
              for (let t in n) {
                for (let r = 0; r < u; r++) s[r] = e[r][t];
                l[t] = r.apply(this, s);
              }
              return l;
            }
            return r.apply(this, arguments);
          } : p === multiplyNo ? vectorizeArray : function vectorizeArrayMultiplying() {
            if (s && !arguments.length) return [];
            let e = p(arguments), n = e[0];
            if (t.longIs(n)) {
              let s = t.longSlice(e), l = [];
              for (let t = 0; t < n.length; t++) {
                for (let r = 0; r < u; r++) s[r] = e[r][t];
                l[t] = r.apply(this, s);
              }
              return l;
            }
            return r.apply(this, e);
          }
          /*
      vectorizeWithFilters : multiply + array/map vectorizing + filter
      vectorizeArray : array vectorizing
      vectorizeArrayMultiplying :  multiply + array vectorizing
      vectorizeMapOrArray :  multiply +  array/map vectorizing
    */ : g = r : (assert(p === multiplyNo, "not implemented"), r.pre && (o = r.pre, r = r.body), 
          n ? assert(0, "not implemented") : l || !a ? g = strIs(u) ? vectorizeForOptionsMap : function vectorizeForOptionsMapForKeys() {
            let t = [];
            if (s && !arguments.length) return t;
            for (let r = 0; r < e.select.length; r++) u = e.select[r], t[r] = vectorizeForOptionsMap.apply(this, arguments);
            return t;
          } : assert(0, "not implemented"))
          /* */ , t.routineExtend(g, r), g;
        }
        /* qqq : implement options combination vectorizingMapVals : 1, vectorizingMapKeys : 1, vectorizingArray : [ 0, 1 ] */
        /* qqq : cover it */
        /* qqq : implement bypassingEmpty for all combinations of options */
        /* qqq : options bypassingEmpty of routine _.vectorize requires good coverage */        
        //
        function vectorize() {
          let e = vectorize.pre.call(this, vectorize, arguments);
          return vectorize.body.call(this, e);
        }
        //
        function vectorizeAll_body(e) {
          t.assertRoutineOptions(vectorize, arguments);
          let r = t.vectorize.body.call(this, e);
          return function all() {
            let e = r.apply(this, arguments);
            return t.all(e);
          };
        }
        //
        function vectorizeAll() {
          let e = vectorizeAll.pre.call(this, vectorizeAll, arguments);
          return vectorizeAll.body.call(this, e);
        }
        //
        function vectorizeAny_body(e) {
          t.assertRoutineOptions(vectorize, arguments);
          let r = t.vectorize.body.call(this, e);
          return function any() {
            let e = r.apply(this, arguments);
            return t.any(e);
          };
        }
        //
        function vectorizeAny() {
          let e = vectorizeAny.pre.call(this, vectorizeAny, arguments);
          return vectorizeAny.body.call(this, e);
        }
        //
        function vectorizeNone_body(e) {
          t.assertRoutineOptions(vectorize, arguments);
          let r = t.vectorize.body.call(this, e);
          return function none() {
            let e = r.apply(this, arguments);
            return t.none(e);
          };
        }
        //
        function vectorizeNone() {
          let e = vectorizeNone.pre.call(this, vectorizeNone, arguments);
          return vectorizeNone.body.call(this, e);
        }
        Function.prototype.bind;
        let e = Object.prototype.toString, t = (_global_, _global_.wTools), r = _global_.wTools;
        vectorize_body.defaults = {
          routine: null,
          fieldFilter: null,
          bypassingFilteredOut: 1,
          bypassingEmpty: 0,
          vectorizingArray: 1,
          vectorizingMapVals: 0,
          vectorizingMapKeys: 0,
          select: 1
        }, vectorize.pre = vectorize_pre, vectorize.body = vectorize_body, vectorize.defaults = Object.create(vectorize_body.defaults), 
        vectorizeAll_body.defaults = Object.create(vectorize_body.defaults), vectorizeAll.pre = vectorize_pre, 
        vectorizeAll.body = vectorizeAll_body, vectorizeAll.defaults = Object.create(vectorizeAll_body.defaults), 
        vectorizeAny_body.defaults = Object.create(vectorize_body.defaults), vectorizeAny.pre = vectorize_pre, 
        vectorizeAny.body = vectorizeAny_body, vectorizeAny.defaults = Object.create(vectorizeAny_body.defaults), 
        vectorizeNone_body.defaults = Object.create(vectorize_body.defaults), vectorizeNone.pre = vectorize_pre, 
        vectorizeNone.body = vectorizeNone_body, vectorizeNone.defaults = Object.create(vectorizeNone_body.defaults);
        // --
        // fields
        // --
        let s = {
          strIs: strIs,
          routineIs: routineIs,
          objectIs: objectIs,
          argumentsArrayIs: argumentsArrayIs,
          assert: assert,
          routineOptions: routineOptions,
          routineVectorize_functor: vectorize,
          vectorize: vectorize,
          vectorizeAll: vectorizeAll,
          vectorizeAny: vectorizeAny,
          vectorizeNone: vectorizeNone
        };
        // --
        // routines
        // --
                //
        Object.assign(r, s), Object.assign(r, {}), 
        // --
        // export
        // --
        // if( typeof module !== 'undefined' )
        // if( _global.WTOOLS_PRIVATE )
        // { /* delete require.cache[ module.id ]; */ }
        void 0 !== n && null !== n && (n.exports = r);
      }();
    });
    n.include, n.include;
  }(), // == end of file bPremature_s
  function fBool_s() {
    let t = _starter_._pathResolve(e, "dwtools/abase/l0/fBool.s"), r = _starter_._pathResolve(e, "dwtools/abase/l0/"), n = _starter_._fileCreate(t, r, // == begin of file fBool_s
    function fBool_s_naked() {
      !function _fBool_s_() {
        "use strict";
        _global_;
        let e = _global_.wTools, t = _global_.wTools, r = (Array.prototype.slice, Function.prototype.bind, 
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
          function boolIs(e) {
            return !0 === e || !1 === e;
          }
          //
          /**
 * Returns true if entity ( src ) is a Boolean or Number.
 * @function boolLike
 * @param {} src - entity to check
 * @memberof wTools
 */ ,
          boolLike: function boolLike(e) {
            let t = Object.prototype.toString.call(e);
            return "[object Boolean]" === t || "[object Number]" === t;
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
          boolsAre: function boolsAre(t) {
            return e.assert(1 === arguments.length), !!e.arrayLike(t) && t.filter(t => e.boolIs(t));
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
          boolsAllAre: function boolsAllAre(t) {
            return e.assert(1 === arguments.length), e.arrayIs(t) ? e.all(t.filter(t => e.boolIs(t))) : e.boolIs(t);
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
          boolsAnyAre: function boolsAnyAre(t) {
            return e.assert(1 === arguments.length), e.arrayIs(t) ? e.any(t.filter(t => e.boolIs(t))) : e.boolIs(t);
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
          boolsNoneAre: function boolsNoneAre(t) {
            return e.assert(1 === arguments.length), e.arrayIs(t) ? e.none(t.filter(t => e.boolIs(t))) : e.boolIs(t);
          }
          // --
          // fields
          // --
                });
        //
        Object.assign(t, r), Object.assign(t, {}), 
        // --
        // export
        // --
        void 0 !== n && null !== n && (n.exports = t);
      }();
    });
    n.include, n.include;
  }(), // == end of file fBool_s
  function fChecker_s() {
    let t = _starter_._pathResolve(e, "dwtools/abase/l0/fChecker.s"), r = _starter_._pathResolve(e, "dwtools/abase/l0/"), n = _starter_._fileCreate(t, r, // == begin of file fChecker_s
    function fChecker_s_naked() {
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
          return e.assert(1 === arguments.length, "Expects single argument"), !(e.primitiveIs(t) || r.call(t, "constructor") || r.call(t, "prototype") && t.prototype || Object.getPrototypeOf(t) === Object.prototype || null === Object.getPrototypeOf(t));
        }
        //
                //
        function consoleIs(t) {
          if (e.assert(1 === arguments.length, "Expects single argument"), console.Console && t && t instanceof console.Console) return !0;
          if (t !== console) return !1;
          let r = Object.prototype.toString.call(t);
          return "[object Console]" === r || "[object Object]" === r;
        }
        //
                //
        function printerIs(t) {
          return e.assert(1 === arguments.length, "Expects single argument"), !!t && !!Object.getPrototypeOf(t) && "Printer" === t.MetaType;
        }
        //
                _global_;
        let e = _global_.wTools, t = _global_.wTools, r = (Array.prototype.slice, Function.prototype.bind, 
        Object.hasOwnProperty), l = null, a = {
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
            if (r.call(t, "constructor")) {
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
          typeOf: function typeOf(t, r) {
            return e.assert(1 === arguments.length || 2 === arguments.length, "Expects single argument"), 
            2 === arguments.length ? e.typeOf(t) === r : null === t || void 0 === t ? null : e.numberIs(t) || e.boolIs(t) || e.strIs(t) ? t.constructor : t.constructor ? (e.assert(e.routineIs(t.constructor) && t instanceof t.constructor), 
            t.constructor) : null;
          }
          //
          ,
          prototypeOf: function prototypeOf(t, r) {
            return e.assert(2 === arguments.length, "Expects single argument"), t === r || !!t && !!r && Object.isPrototypeOf.call(t, r);
          }
          //
          ,
          prototypeHas: function prototypeHas(t, r) {
            return e.assert(2 === arguments.length, "Expects single argument"), e.prototypeOf(r, t);
          }
          //
          /**
 * Is prototype.
 * @function prototypeIs
 * @param {object} src - entity to check
 * @memberof wTools
 */ ,
          prototypeIs: function prototypeIs(t) {
            return e.assert(1 === arguments.length, "Expects single argument"), !e.primitiveIs(t) && r.call(t, "constructor");
          }
          //
          ,
          prototypeIsStandard: function prototypeIsStandard(t) {
            return !!e.prototypeIs(t) && !!r.call(t, "Composes");
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
            let r = e.prototypeGet(t);
            return e.prototypeIsStandard(r);
          },
          instanceIs: instanceIs,
          instanceIsStandard: function instanceIsStandard(t) {
            if (e.assert(1 === arguments.length, "Expects single argument"), !e.instanceIs(t)) return !1;
            let r = e.prototypeGet(t);
            return !!r && e.prototypeIsStandard(r);
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
            let r = e.strType(t);
            return "ChildProcess" === r || "process" === r;
          }
          //
          ,
          processIsDebugged: function processIsDebugged() {
            if (e.assert(0 === arguments.length), "undefined" == typeof process) return !1;
            if (null === l) try {
              l = s("inspector");
            } catch (e) {
              l = !1;
            }
            if (l) return e.strIs(l.url());
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
        Object.assign(t, a), Object.assign(t, {}), 
        // --
        // export
        // --
        void 0 !== n && null !== n && (n.exports = t);
      }();
    }), s = n.include;
    n.include;
  }(), // == end of file fChecker_s
  function fEntity_s() {
    let t = _starter_._pathResolve(e, "dwtools/abase/l0/fEntity.s"), r = _starter_._pathResolve(e, "dwtools/abase/l0/"), n = _starter_._fileCreate(t, r, // == begin of file fEntity_s
    function fEntity_s_naked() {
      !function _fEntity_s_() {
        "use strict";
        // --
        // entity iterator
        // --
        /**
 * Routine eachSample() accepts the container {-o.sets-} with scalar or vector elements.
 * Routine returns an array of vectors. Each vector is a unique combination of elements of vectors
 * that is passed in option {-o.sets-}.
 *
 * Routine eachSample() accepts the options map {-o-} or two arguments. If options map
 * is used, all parameters can be set. If passed two arguments, first of them is ( sets )
 * and second is ( onEach ).
 *
 * @param {Array|Map} sets - Container with vector and scalar elements to combine new vectors.
 * @param {Routine|Null} onEach - Callback. Should not change elements of {-sample-}.
 * @param {Array|Map} sample - Container for new vectors. If not passed, routine create empty container.
 * @param {boolean} leftToRight - Sets the direction of combining. 1 - left to rigth, 0 - rigth to left. By default is 1.
 * @param {boolean} result - Sets retuned value. 1 - array with verctors, 0 - index of last element. By default is 1.
 *
 * @example
 * //returns  [ [ 0, 2 ], [ 1, 2 ] ]
 * var got = _.eachSample( { sets : [ [ 0, 1 ], 2 ] });
 *
 * @example
 * //returns  [ [ 0, 2 ], [ 1, 2 ],
 *              [ 0, 3 ], [ 1, 3 ] ]
 * var got = _.eachSample( { sets : [ [ 0, 1 ], [ 2, 3 ] ] });
 *
 * @example
 * //returns  [ { a : 0, b : 2}, { a : 1, b : 2},
 *              { a : 0, b : 3}, { a : 1, b : 3} ]
 * var got = _.eachSample( { sets : { a : [ 0, 1 ], b : [ 2, 3 ] } });
 *
 * @example
 * //returns  [ [ 3, 0 ], [ 2, 0 ],
 *              [ 3, 1 ], [ 2, 1 ] ]
 * var got = _.eachSample( { sets : [ [ 0, 1 ], [ 2, 3 ] ], leftToRight : 0 });
 *
 * @example
 * //returns  3
 * var got = _.eachSample( { sets : [ [ 0, 1 ], [ 2, 3 ] ], result : 0 });
 *
 * @function eachSample
 * @returns {Array} Returns array contained  check function.
 * @throws {exception} If ( arguments.length ) is less then one or more then two.
 * @throws {exception} If( onEach ) is not a Routine or null.
 * @throws {exception} If( o.sets ) is not array or objectLike.
 * @throws {exception} If ( sets ) is mapLike and ( onEach ) not passed.
 * @throws {exception} If( o.base ) or ( o.add) is undefined.
 * @memberof wTools
 */
        function eachSample(t) {
          /* */
          function nextSample(a) {
            let i = r[a];
            return s[a]++, s[a] >= n[a] ? (s[a] = 0, t.sample[i] = t.sets[i][s[a]], 0) : (t.sample[i] = t.sets[i][s[a]], 
            l += 1, t.result && (e.mapLike(t.sample) ? t.result.push(e.mapExtend(null, t.sample)) : t.result.push(t.sample.slice())), 
            1);
          }
          /* */          function iterate() {
            if (t.leftToRight) {
              for (let e = 0; e < a; e++) if (nextSample(e)) return 1;
            } else for (let e = a - 1; e >= 0; e--) if (nextSample(e)) return 1;
            return 0;
          }
          (2 === arguments.length || e.arrayLike(arguments[0])) && (t = {
            sets: arguments[0],
            onEach: arguments[1]
          }), e.routineOptions(eachSample, t), e.assert(1 === arguments.length || 2 === arguments.length), 
          e.assert(e.routineIs(t.onEach) || null === t.onEach), e.assert(e.arrayIs(t.sets) || e.mapLike(t.sets)), 
          e.assert(void 0 === t.base && void 0 === t.add), 
          /* sample */
          t.sample || (
          // Dmytro:
          // qqq: I think entityMakeTivial should be entityMakeTrivial. 7 missprints founded in wTools. Maybe, willbe contains this also.
          t.sample = e.entityMakeTivial(t.sets))
          /* */;
          let r = e.longIs(t.sets) ? e.arrayFromRange([ 0, t.sets.length ]) : e.mapKeys(t.sets);
          t.result && !e.arrayIs(t.result) && (t.result = []);
          let n = [], s = [], l = 0, a = e.entityLength(t.sets), i = 0;
          /* */
          if (
          // _.each( o.sets, function( e, k )
          // {
          //   let set = o.sets[ k ];
          //   _.assert( _.longIs( set ) || _.primitiveIs( set ) );
          //
          //   if( _.primitiveIs( set ) )
          //   o.sets[ k ] = [ set ]; /* qqq : should not change input data */
          //
          //   len[ sindex ] = _.entityLength( o.sets[ k ] );
          //   indexnd[ sindex ] = 0;
          //   sindex += 1;
          // });
          /* qqq : add tests */
          t.sets = e.filter(t.sets, function(r, l) {
            return e.assert(e.longIs(r) || e.primitiveIs(r)), e.primitiveIs(r) && (r = [ r ]) /* qqq : should not change input data */ , 
            n[i] = e.entityLength(t.sets[l]), s[i] = 0, i += 1, r;
          }), !
          /* */
          function firstSample() {
            let r = 0;
            return e.each(t.sets, function(e, l) {
              if (t.sample[l] = t.sets[l][s[r]], r += 1, !n[l]) return 0;
            }), t.result && (e.mapLike(t.sample) ? t.result.push(e.mapExtend(null, t.sample)) : t.result.push(t.sample.slice())), 
            1;
          }()) return t.result;
          do {
            t.onEach && t.onEach.call(t.sample, t.sample, l);
          } while (iterate());
          return t.result ? t.result : l;
        }
        //
        function entityEach(t, r) {
          /* */
          if (e.assert(2 === arguments.length), e.assert(r.length <= 3), 
          // _.assert( onEach.length <= 2 );
          e.assert(e.routineIs(r)), e.longIs(t)) for (let e = 0; e < t.length; e++) r(t[e], e, t); else if (e.objectLike(t)) for (let e in t) r(t[e], e, t); else r(t, void 0, void 0);
          /* */          return t;
        }
        //
                function entityEachKey(t, r) {
          /* */
          if (e.assert(2 === arguments.length), e.assert(r.length <= 3), 
          // _.assert( onEach.length <= 2 );
          e.assert(e.routineIs(r)), e.longIs(t)) for (let e = 0; e < t.length; e++) r(t[e], void 0, e, t); else if (e.objectLike(t)) {
            let e = 0;
            for (let n in t) r(n, t[n], e, t), e += 1;
          } else r(t, void 0, void 0, void 0);
          /* */          return t;
          // if( arguments.length === 2 )
          // o = { src : arguments[ 0 ], onUp : arguments[ 1 ] }
          //
          // _.routineOptions( eachKey, o );
          // _.assert( arguments.length === 1 || arguments.length === 2 );
          // _.assert( o.onUp && o.onUp.length <= 3 );
          //
          // /* */
          //
          // if( _.longIs( o.src ) )
          // {
          //
          //   for( let index = 0 ; index < o.src.length ; index++ )
          //   {
          //     o.onUp.call( o, o.src[ index ], undefined, index );
          //   }
          //
          // }
          // else if( _.objectLike( o.src ) )
          // {
          //
          //   let index = 0;
          //   for( let k in o.src )
          //   {
          //     o.onUp.call( o, k, o.src[ k ], index );
          //     index += 1;
          //   }
          //
          // }
          // else _.assert( 0, 'not container' );
          //
          // /* */
          //
          // return src;
                }
        //
        function entityEachOwn(t, n) {
          /* */
          if (e.assert(2 === arguments.length), e.assert(n.length <= 3), 
          // _.assert( onEach.length <= 2 );
          e.assert(e.routineIs(n)), e.longIs(t)) for (let e = 0; e < t.length; e++) n(t[e], e, t); else if (e.objectLike(t)) for (let e in t) r.call(t, e) && n(t[e], e, t); else n(t, void 0, void 0);
          /* */          return t;
        }
        //
                function entityAll(t, r) {
          let n = !0;
          // _.assert( onEach === undefined || ( _.routineIs( onEach ) && onEach.length <= 2 ) );
          /* */
          if (e.assert(1 === arguments.length || 2 === arguments.length), e.assert(void 0 === r || e.routineIs(r) && r.length <= 3), 
          e.routineIs(r)) {
            if (e.longIs(t)) {
              for (let e = 0; e < t.length; e++) if (!(n = r(t[e], e, t))) return n;
            } else if (e.objectLike(t)) {
              for (let e in t) if (!(n = r(t[e], e, t))) return n;
            } else if (!(n = r(t, void 0, void 0))) return n;
          } else if (e.longIs(t)) {
            for (let e = 0; e < t.length; e++) if (!(n = t[e])) return n;
          } else if (e.objectLike(t)) {
            for (let e in t) if (!(n = t[e])) return n;
          } else if (!(n = t)) return n;
          /* */          return !0;
        }
        //
                function entityAny(t, r) {
          let n = !1;
          // _.assert( onEach === undefined || ( _.routineIs( onEach ) && onEach.length <= 2 ) );
          /* */
          if (e.assert(1 === arguments.length || 2 === arguments.length), e.assert(void 0 === r || e.routineIs(r) && r.length <= 3), 
          e.routineIs(r)) {
            if (e.longIs(t)) {
              for (let e = 0; e < t.length; e++) if (n = r(t[e], e, void 0)) return n;
            } else if (e.objectLike(t)) {
              for (let e in t) if (n = r(t[e], e, void 0)) return n;
            } else if (n = r(t, void 0, void 0)) return n;
          } else if (e.longIs(t)) {
            for (let e = 0; e < t.length; e++) if (n = t[e]) return n;
          } else if (e.objectLike(t)) {
            for (let e in t) if (n = t[e]) return n;
          } else if (n = t) return n;
          /* */          return !1;
        }
        //
                function entityNone(t, r) {
          let n = !0;
          // _.assert( onEach === undefined || ( _.routineIs( onEach ) && onEach.length <= 2 ) );
          /* */
          if (e.assert(1 === arguments.length || 2 === arguments.length), e.assert(void 0 === r || e.routineIs(r) && r.length <= 3), 
          e.routineIs(r)) {
            if (e.longIs(t)) {
              for (let e = 0; e < t.length; e++) if (n = r(t[e], e, t)) return !n;
            } else if (e.objectLike(t)) {
              for (let e in t) if (n = r(t[e], e, t)) return !n;
            } else if (n = r(t, void 0, void 0)) return !n;
          } else if (e.longIs(t)) {
            for (let e = 0; e < t.length; e++) if (n = t[e]) return !n;
          } else if (e.objectLike(t)) {
            for (let e in t) if (n = t[e]) return !n;
          } else if (n = t) return !n;
          /* */          return !0;
        }
        //
        /**
 * Returns generated function that takes single argument( e ) and can be called to check if object( e )
 * has at least one key/value pair that is represented in( condition ).
 * If( condition ) is provided as routine, routine uses it to check condition.
 * Generated function returns origin( e ) if conditions is true, else undefined.
 *
 * @param {object|function} condition - Map to compare with( e ) or custom function.
 * @returns {function} Returns condition check function.
 *
 * @example
 * //returns Object {a: 1}
 * let check = _._filter_functor( { a : 1, b : 1, c : 1 } );
 * check( { a : 1 } );
 *
 * @example
 * //returns false
 * function condition( src ){ return src.y === 1 }
 * let check = _._filter_functor( condition );
 * check( { a : 2 } );
 *
 * @function _filter_functor
 * @throws {exception} If no argument provided.
 * @throws {exception} If( condition ) is not a Routine or Object.
 * @memberof wTools
 */        
        //
        /**
 * Function that produces an elements for entityMap result
 * @callback wTools.onEach
 * @param {*} val - The current element being processed in the entity.
 * @param {string|number} key - The index (if entity is array) or key of processed element.
 * @param {Array|Object} src - The src passed to entityMap.
 */
        /**
 * Creates new instance with same as( src ) type. Elements of new instance results of calling a provided ( onEach )
 * function on every element of src. If entity is array, the new array has the same length as source.
 *
 * @example
  let numbers = [ 3, 4, 6 ];

  function sqr( v )
  {
    return v * v
  };

  let res = wTools.entityMap(numbers, sqr);
  // [ 9, 16, 36 ]
  // numbers is still [ 3, 4, 6 ]

  function checkSidesOfTriangle( v, i, src )
  {
    let sumOthers = 0,
      l = src.length,
      j;

    for ( j = 0; j < l; j++ )
    {
      if ( i === j ) continue;
      sumOthers += src[ j ];
    }
    return v < sumOthers;
  }

  let res = wTools.entityMap( numbers, checkSidesOfTriangle );
 // [ true, true, true ]
 *
 * @param {ArrayLike|ObjectLike} src - Entity, on each elements of which will be called ( onEach ) function.
 * @param {wTools.onEach} onEach - Function that produces an element of the new entity.
 * @returns {ArrayLike|ObjectLike} New entity.
 * @thorws {Error} If number of arguments less or more than 2.
 * @thorws {Error} If( src ) is not Array or ObjectLike.
 * @thorws {Error} If( onEach ) is not function.
 * @function entityMap
 * @memberof wTools
 */
        function entityMap(t, r) {
          let n;
          if (e.assert(2 === arguments.length, "Expects exactly two arguments"), e.assert(e.routineIs(r)), 
          e.longIs(t)) {
            n = e.entityMakeTivial(t);
            for (let s = 0; s < t.length; s++) n[s] = r(t[s], s, t), e.assert(void 0 !== n[s], "{-entityMap-} onEach should return defined values, to been able return undefined to delete element use ( entityFilter )");
          } else if (e.objectLike(t)) {
            n = e.entityMakeTivial(t);
            for (let s in t) n[s] = r(t[s], s, t), e.assert(void 0 !== n[s], "{-entityMap-} onEach should return defined values, to been able return undefined to delete element use ( entityFilter )");
          } else n = r(t, void 0, void 0), e.assert(void 0 !== n, "{-entityMap-} onEach should return defined values, to been able return undefined to delete element use ( entityFilter )");
          return n;
        }
        //
        /* qqq :
cover entityFilter and entityFilterDeep
take into account unroll cases
*/        function entityFilter(t, r) {
          let n;
          /* */
          if (r = e._filter_functor(r, 1), e.assert(2 === arguments.length), 
          // _.assert( _.objectLike( src ) || _.longIs( src ), () => 'Expects objectLike or longIs src, but got ' + _.strType( src ) );
          e.assert(e.routineIs(r)), e.assert(void 0 !== t, "Expects src"), e.longIs(t)) {
            let s, l;
            for (n = e.longMake(t, 0), s = 0, l = 0; s < t.length; s++) {
              let a = r.call(t, t[s], s, t);
              e.unrollIs(a) ? (e.arrayAppendArray(n, a), l += a.length) : void 0 !== a && (n[l] = a, 
              l += 1);
            }
            l < t.length && (n = e.arraySlice(n, 0, l));
          }
          // else if( _.objectLike( src ) )
           else if (e.mapLike(t)) {
            n = e.entityMakeTivial(t);
            for (let e in t) {
              let s = r.call(t, t[e], e, t);
              void 0 !== s && (n[e] = s);
            }
          } else n = r.call(null, t, null, null);
          /* */          return n;
        }
        //
                function _entityFilterDeep(t) {
          let r, n = e._filter_functor(t.onEach, t.conditionLevels);
          /* */
          if (e.assert(1 === arguments.length, "Expects single argument"), e.assert(e.objectLike(t.src) || e.longIs(t.src), "entityFilter : expects objectLike or longIs src, but got", e.strType(t.src)), 
          e.assert(e.routineIs(n)), e.longIs(t.src)) {
            let s, l;
            for (r = e.longMake(t.src, 0), s = 0, l = 0; s < t.src.length; s++) 
            // for( let s = 0, d = 0 ; s < o.src.length ; s++, d++ )
            {
              let a = n.call(t.src, t.src[s], s, t.src);
              e.unrollIs(a) ? (e.arrayAppendArray(r, a), l += a.length) : void 0 !== a && (r[l] = a, 
              l += 1);
              // if( r === undefined )
              // d--;
              // else
              // result[ d ] = r;
                        }
            debugger;
            l < t.src.length && (r = e.arraySlice(r, 0, l));
          } else {
            r = e.entityMakeTivial(t.src);
            for (let e in t.src) {
              let s = n.call(t.src, t.src[e], e, t.src);
              // r = onEach.call( o.src, o.src[ s ], s, o.src );
                            void 0 !== s && (r[e] = s);
            }
          }
          /* */          return r;
        }
        //
        function entityFilterDeep(t, r) {
          return e.assert(2 === arguments.length, "Expects exactly two arguments"), _entityFilterDeep({
            /*ttt*/ src: t,
            /*ttt*/ onEach: r,
            conditionLevels: 1024
          });
        }
        // --
        // entity modifier
        // --
                //
        /**
 * Copies entity( src ) into( dst ) or returns own copy of( src ).Result depends on several moments:
 * -If( src ) is a Object - returns clone of( src ) using ( onRecursive ) callback function if its provided;
 * -If( dst ) has own 'copy' routine - copies( src ) into( dst ) using this routine;
 * -If( dst ) has own 'set' routine - sets the fields of( dst ) using( src ) passed to( dst.set );
 * -If( src ) has own 'clone' routine - returns clone of( src ) using ( src.clone ) routine;
 * -If( src ) has own 'slice' routine - returns result of( src.slice ) call;
 * -Else returns a copy of entity( src ).
 *
 * @param {object} dst - Destination object.
 * @param {object} src - Source object.
 * @param {routine} onRecursive - The callback function to copy each [ key, value ].
 * @see {@link wTools.mapCloneAssigning} Check this function for more info about( onRecursive ) callback.
 * @returns {object} Returns result of entities copy operation.
 *
 * @example
 * let dst = { set : function( src ) { this.str = src.src } };
 * let src = { src : 'string' };
 *  _.entityAssign( dst, src );
 * console.log( dst.str )
 * //returns "string"
 *
 * @example
 * let dst = { copy : function( src ) { for( let i in src ) this[ i ] = src[ i ] } }
 * let src = { src : 'string', num : 123 }
 *  _.entityAssign( dst, src );
 * console.log( dst )
 * //returns Object {src: "string", num: 123}
 *
 * @example
 * //returns 'string'
 *  _.entityAssign( null, new String( 'string' ) );
 *
 * @function entityAssign
 * @throws {exception} If( arguments.length ) is not equal to 3 or 2.
 * @throws {exception} If( onRecursive ) is not a Routine.
 * @memberof wTools
 *
 */
        function entityAssign(t, r, n) {
          let s;
          if (e.assert(2 === arguments.length || 3 === arguments.length, "Expects two or three arguments"), 
          e.assert(arguments.length < 3 || e.routineIs(n)), null === r) s = r; else if (t && e.routineIs(t.copy)) t.copy(r); else if (r && e.routineIs(r.clone)) {
            if (t instanceof r.constructor) throw e.err("not tested");
            e.primitiveIs(t) || e.longIs(t) ? s = r.clone() : e.assert(0, "unknown");
          } else r && e.routineIs(r.slice) ? s = r.slice() : t && e.routineIs(t.set) ? t.set(r) : s = e.objectIs(r) ? n ? e.mapCloneAssigning({
            srcMap: r,
            dstMap: e.primitiveIs(t) ? Object.create(null) : t,
            onField: n
          }) : e.mapCloneAssigning({
            srcMap: r
          }) : r;
          return s;
        }
        //
        /**
 * Short-cut for entityAssign function. Copies specified( name ) field from
 * source container( srcContainer ) into( dstContainer ).
 *
 * @param {object} dstContainer - Destination object.
 * @param {object} srcContainer - Source object.
 * @param {string} name - Field name.
 * @param {mapCloneAssigning.onField} onRecursive - The callback function to copy each [ key, value ].
 * @see {@link wTools.mapCloneAssigning} Check this function for more info about( onRecursive ) callback.
 * @returns {object} Returns result of entities copy operation.
 *
 * @example
 * let dst = {};
 * let src = { a : 'string' };
 * let name = 'a';
 * _.entityAssignFieldFromContainer(dst, src, name );
 * console.log( dst.a === src.a );
 * //returns true
 *
 * @example
 * let dst = {};
 * let src = { a : 'string' };
 * let name = 'a';
 * function onRecursive( dstContainer, srcContainer, key )
 * {
 *   _.assert( _.strIs( key ) );
 *   dstContainer[ key ] = srcContainer[ key ];
 * };
 * _.entityAssignFieldFromContainer(dst, src, name, onRecursive );
 * console.log( dst.a === src.a );
 * //returns true
 *
 * @function entityAssignFieldFromContainer
 * @throws {exception} If( arguments.length ) is not equal to 3 or 4.
 * @memberof wTools
 *
 */        
        //
        /**
 * The result of _entityMost routine object.
 * @typedef {Object} wTools.entityMostResult
 * @property {Number} index - Index of found element.
 * @property {String|Number} key - If the search was on map, the value of this property sets to key of found element.
 * Else if search was on array - to index of found element.
 * @property {Number} value - The found result of onEvaluate, if onEvaluate don't set, this value will be same as element.
 * @property {Number} element - The appropriate element for found value.
 */
        /**
 * Returns object( wTools.entityMostResult ) that contains min or max element of entity, it depends on( returnMax ).
 *
 * @param {ArrayLike|Object} src - Source entity.
 * @param {Function} onEvaluate  - ( onEach ) function is called for each element of( src ).If undefined routine uses it own function.
 * @param {Boolean} returnMax  - If true - routine returns maximum, else routine returns minimum value from entity.
 * @returns {wTools.entityMostResult} Object with result of search.
 *
 * @example
 * //returns { index: 0, key: 0, value: 1, element: 1 }
 * _._entityMost([ 1, 3, 3, 9, 10 ], undefined, 0 );
 *
 * @example
 * //returns { index: 4, key: 4, value: 10, element: 10 }
 * _._entityMost( [ 1, 3, 3, 9, 10 ], undefined, 1 );
 *
 * @example
 * //returns { index: 4, key: 4, value: 10, element: 10 }
 * _._entityMost( { a : 1, b : 2, c : 3 }, undefined, 0 );
 *
 * @private
 * @function _entityMost
 * @throws {Exception} If( arguments.length ) is not equal 3.
 * @throws {Exception} If( onEvaluate ) function is not implemented.
 * @memberof wTools
 */
        function _entityMost(t, r, n) {
          void 0 === r && (r = function(e) {
            return e;
          }), e.assert(3 === arguments.length, "Expects exactly three arguments"), e.assert(1 === r.length, "not mplemented");
          let s = null;
          s = n ? function(e, t) {
            return e - t;
          } : function(e, t) {
            return t - e;
          }, e.assert(1 === r.length), e.assert(2 === s.length);
          let l = {
            index: -1,
            key: void 0,
            value: void 0,
            element: void 0
          };
          if (e.longIs(t)) {
            if (0 === t.length) return l;
            l.key = 0, l.value = r(t[0]), l.element = t[0];
            for (let e = 0; e < t.length; e++) {
              let n = r(t[e]);
              s(n, l.value) > 0 && (l.key = e, l.value = n, l.element = t[e]);
            }
            l.index = l.key;
          } else {
            debugger;
            for (let e in t) {
              l.index = 0, l.key = e, l.value = r(t[e]), l.element = t[e];
              break;
            }
            let e = 0;
            for (let n in t) {
              let a = r(t[n]);
              s(a, l.value) > 0 && (l.index = e, l.key = n, l.value = a, l.element = t[n]), e += 1;
            }
          }
          return l;
        }
        //
        /**
 * Short-cut for _entityMost() routine. Returns object( wTools.entityMostResult ) with smallest value from( src ).
 *
 * @param {ArrayLike|Object} src - Source entity.
 * @param {Function} onEvaluate  - ( onEach ) function is called for each element of( src ).If undefined routine uses it own function.
 * @returns {wTools.entityMostResult} Object with result of search.
 *
 * @example
 *  //returns { index : 2, key : 'c', value 3: , element : 9  };
 *  let obj = { a : 25, b : 16, c : 9 };
 *  let min = wTools.entityMin( obj, Math.sqrt );
 *
 * @see wTools.onEach
 * @see wTools.entityMostResult
 * @function entityMin
 * @throws {Exception} If missed arguments.
 * @throws {Exception} If passed extra arguments.
 * @memberof wTools
 */        _global_;
        let e = _global_.wTools, t = _global_.wTools, r = (Array.prototype.slice, Function.prototype.bind, 
        Object.prototype.toString, Object.hasOwnProperty);
        eachSample.defaults = {
          leftToRight: 1,
          onEach: null,
          sets: null,
          sample: null,
          result: 1
        };
        var s = entityEachKey.defaults = Object.create(null);
        s.src = null, s.onUp = function(e, t) {}, _entityFilterDeep.defaults = {
          src: null,
          onEach: null,
          conditionLevels: 1
        };
        // --
        // fields
        // --
        let l = {
          // multiplier
          dup: 
          // --
          // multiplier
          // --
          function dup(t, r, n) {
            if (e.assert(2 === arguments.length || 3 === arguments.length, "Expects two or three arguments"), 
            e.assert(e.numberIs(r) || e.longIs(r), "dup expects times as number or array"), 
            e.numberIs(r)) {
              n || (n = new Array(r));
              for (let e = 0; e < r; e++) n[e] = t;
              return n;
            }
            if (e.longIs(r)) {
              e.assert(2 === r.length);
              let s = r[1] - r[0];
              n || (n = new Array(r[1]));
              for (let e = 0; e < s; e++) n[r[0] + e] = t;
              return n;
            }
            e.assert(0, "unexpected");
          }
          //
          ,
          multiple: function multiple(t, r) {
            return e.assert(2 === arguments.length), e.arrayLike(t) ? e.assert(t.length === r, () => "Vector should have " + r + " elements, but have " + t.length) : t = e.dup(t, r), 
            t;
          }
          //
          ,
          multipleAll: function multipleAll(t) {
            let r = void 0;
            e.assert(1 === arguments.length);
            for (let n = 0; n < t.length; n++) if (e.arrayIs(t[n])) {
              r = t[n].length;
              break;
            }
            if (void 0 === r) return t;
            for (let n = 0; n < t.length; n++) t[n] = e.multiple(t[n], r);
            return t;
          },
          // entity iterator
          eachSample: eachSample,
          entityEach: entityEach,
          each: entityEach,
          entityEachKey: entityEachKey,
          eachKey: entityEachKey,
          entityEachOwn: entityEachOwn,
          eachOwn: entityEachOwn,
          entityAll: entityAll,
          all: entityAll,
          entityAny: entityAny,
          any: entityAny,
          entityNone: entityNone,
          none: entityNone,
          _filter_functor: function _filter_functor(t, r) {
            if (e.assert(2 === arguments.length, "Expects exactly two arguments"), e.assert(e.routineIs(t) || e.objectIs(t)), 
            e.objectIs(t)) {
              let n = t;
              t = function selector(t, s, l) {
                return e.assert(3 === arguments.length), t === n ? t : e.objectLike(t) && e.mapSatisfy({
                  /*ttt*/ template: n,
                  src: t,
                  /*ttt*/ levels: r
                }) ? t : void 0;
              };
            }
            return t;
          },
          entityMap: entityMap,
          map: entityMap,
          entityFilter: entityFilter,
          filter: entityFilter,
          _entityFilterDeep: _entityFilterDeep,
          entityFilterDeep: entityFilterDeep,
          filterDeep: entityFilterDeep,
          // entity modifier
          enityExtend: function enityExtend(t, r) {
            return e.assert(2 === arguments.length, "Expects exactly two arguments"), e.objectIs(r) || e.longIs(r) ? e.each(r, function(e, r) {
              t[r] = e;
            }) : t = r, t;
          }
          //
          ,
          enityExtendAppending: function enityExtendAppending(t, r) {
            return e.assert(2 === arguments.length, "Expects exactly two arguments"), e.objectIs(r) ? e.each(r, function(e, r) {
              t[r] = e;
            }) : e.longIs(r) ? null === t || void 0 === t ? t = e.longSlice(r) : e.arrayAppendArray(t, r) : t = r, 
            t;
          }
          //
          ,
          entityMake: function entityMake(t, r) {
            return e.assert(1 === arguments.length || 2 === arguments.length), e.arrayIs(t) ? new Array(void 0 !== r ? r : t.length) : e.longIs(t) ? e.bufferTypedIs(t) || e.bufferNodeIs(t) ? new t.constructor(void 0 !== r ? r : t.length) : new Array(void 0 !== r ? r : t.length) : e.mapIs(t) ? Object.create(null) : e.objectIs(t) ? new t.constructor() : void e.assert(0, "unexpected");
          }
          //
          ,
          entityMakeTivial: function entityMakeTivial(t, r) {
            return e.assert(1 === arguments.length || 2 === arguments.length), e.arrayIs(t) ? new Array(void 0 !== r ? r : t.length) : e.longIs(t) ? e.bufferTypedIs(t) || e.bufferNodeIs(t) ? new t.constructor(void 0 !== r ? r : t.length) : new Array(void 0 !== r ? r : t.length) : e.objectIs(t) ? Object.create(null) : void e.assert(0, "unexpected");
          }
          //
          ,
          entityShallowClone: function entityShallowClone(t) {
            return e.primitiveIs(t) ? t : e.mapIs(t) ? e.mapShallowClone(t) : e.longIs(t) ? e.longShallowClone(t) : void e.assert(0, "Not clear how to shallow clone", e.strType(t));
          },
          entityAssign: entityAssign,
          /* refactor!!! */
          entityAssignFieldFromContainer: function entityAssignFieldFromContainer(t, n, s, l) {
            let a;
            e.assert(e.strIs(s) || e.symbolIs(s)), e.assert(3 === arguments.length || 4 === arguments.length);
            let i = r.call(t, s) ? t[s] : void 0, o = n[s];
            return void 0 !== (a = l ? entityAssign(i, o, l) : entityAssign(i, o)) && (t[s] = a), 
            a;
          }
          //
          /**
 * Short-cut for entityAssign function. Assigns value of( srcValue ) to container( dstContainer ) field specified by( name ).
 *
 * @param {object} dstContainer - Destination object.
 * @param {object} srcValue - Source value.
 * @param {string} name - Field name.
 * @param {mapCloneAssigning.onField} onRecursive - The callback function to copy each [ key, value ].
 * @see {@link wTools.mapCloneAssigning} Check this function for more info about( onRecursive ) callback.
 * @returns {object} Returns result of entity field assignment operation.
 *
 * @example
 * let dstContainer = { a : 1 };
 * let srcValue = 15;
 * let name = 'a';
 * _.entityAssignField( dstContainer, srcValue, name );
 * console.log( dstContainer.a );
 * //returns 15
 *
 * @function entityAssignField
 * @throws {exception} If( arguments.length ) is not equal to 3 or 4.
 * @memberof wTools
 *
 */ ,
          /* dubious */
          entityAssignField: function entityAssignField(t, r, n, s) {
            let l;
            e.assert(e.strIs(n) || e.symbolIs(n)), e.assert(3 === arguments.length || 4 === arguments.length);
            let a = t[n];
            if (s) throw e.err("not tested");
            return void 0 !== (l = entityAssign(a, r)) && (t[n] = l), l;
          },
          /* dubious */
          _entityMost: _entityMost,
          entityMin: function entityMin(t, r) {
            return e.assert(1 === arguments.length || 2 === arguments.length), _entityMost(t, r, 0);
          }
          //
          /**
 * Short-cut for _entityMost() routine. Returns object( wTools.entityMostResult ) with biggest value from( src ).
 *
 * @param {ArrayLike|Object} src - Source entity.
 * @param {Function} onEvaluate  - ( onEach ) function is called for each element of( src ).If undefined routine uses it own function.
 * @returns {wTools.entityMostResult} Object with result of search.
 *
 * @example
 *  //returns { index: 0, key: "a", value: 25, element: 25 };
 *  let obj = { a: 25, b: 16, c: 9 };
 *  let max = wTools.entityMax( obj );
 *
 * @see wTools.onEach
 * @see wTools.entityMostResult
 * @function entityMax
 * @throws {Exception} If missed arguments.
 * @throws {Exception} If passed extra arguments.
 * @memberof wTools
 */ ,
          entityMax: function entityMax(t, r) {
            return e.assert(1 === arguments.length || 2 === arguments.length), _entityMost(t, r, 1);
          }
        };
        // --
        // routines
        // --
                //
        Object.assign(t, l), Object.assign(t, {}), 
        // --
        // export
        // --
        // if( typeof module !== 'undefined' )
        // if( _global.WTOOLS_PRIVATE )
        // { /* delete require.cache[ module.id ]; */ }
        void 0 !== n && null !== n && (n.exports = t);
      }();
    });
    n.include, n.include;
  }(), // == end of file fEntity_s
  function fErr_s() {
    let t = _starter_._pathResolve(e, "dwtools/abase/l0/fErr.s"), r = _starter_._pathResolve(e, "dwtools/abase/l0/"), n = _starter_._fileCreate(t, r, // == begin of file fErr_s
    function fErr_s_naked() {
      !function _fErr_s_() {
        "use strict";
        /*

!!! implemen error's collectors

*/
        // let Object.prototype.toString = Object.prototype.toString;
                //
        /**
 * Creates Error object based on passed options.
 * Result error contains in message detailed stack trace and error description.
 * @param {Object} o Options for creating error.
 * @param {String[]|Error[]} o.args array with messages or errors objects, from which will be created Error obj.
 * @param {number} [o.level] using for specifying in error message on which level of stack trace was caught error.
 * @returns {Error} Result Error. If in `o.args` passed Error object, result will be reference to it.
 * @private
 * @throws {Error} Expects single argument if pass les or more than one argument
 * @throws {Error} o.args should be array like, if o.args is not array.
 * @function _err
 * @memberof wTools
 */
        function _err(e) {
          /* */
          function nonenurable(e, n) {
            try {
              Object.defineProperty(t, e, {
                enumerable: !1,
                configurable: !0,
                writable: !0,
                value: n
              });
            } catch (e) {
              console.error(e);
              debugger;
              if (r.debuggerEnabled) debugger;
            }
          }
          /* */          let t;
          if (1 !== arguments.length) throw Error("_err : expects single argument");
          if (!r.longIs(e.args)) throw Error("_err : o.args should be array like");
          if (void 0 === e.usingSourceCode && (e.usingSourceCode = _err.defaults.usingSourceCode), 
          void 0 === e.condensingStack && (e.condensingStack = _err.defaults.condensingStack), 
          ("not implemented" === e.args[0] || "not tested" === e.args[0] || "unexpected" === e.args[0]) && r.debuggerEnabled) debugger;
          /* let */          let n = "", s = "", l = "", a = [], i = 0;
          /* Error.stackTraceLimit = 99; */
          /* find error in arguments */
          for (let n = 0; n < e.args.length; n++) {
            let o = e.args[n];
            if (!r.errIs(o) && r.routineIs(o)) {
              if (0 === o.length) ; else debugger;
              if (0 === o.length && (o = e.args[n] = o()), r.unrollIs(o)) {
                e.args = r.longButRange(e.args, [ n, n + 1 ], o), n -= 1;
                continue;
              }
            }
            if (r.errIs(o)) {
              if (t || (s = (t = o).catches || "", l = t.sourceCode || "", 
              // if( o.args.length === 1 )
              i = t.attended), void 0 === o.attentionRequested && Object.defineProperty(o, "attentionRequested", {
                enumerable: !1,
                configurable: !0,
                writable: !0,
                value: 0
              }), void 0 !== o.originalMessage) e.args[n] = o.originalMessage; else {
                e.args[n] = o.message || o.msg || o.constructor.name || "unknown error";
                let t = r.mapFields(o);
                Object.keys(t).length && (e.args[n] += "\n" + r.toStr(t, {
                  wrap: 0,
                  multiline: 1,
                  levels: 2
                }));
              }
              a.length > 0 && (e.args[n] = "\n" + e.args[n]), a.push(o), e.location = r.diagnosticLocation({
                error: o,
                location: e.location
              });
            }
          }
          /* look into non-error arguments to find location */          if (!t) for (let t = 0; t < e.args.length; t++) {
            let n = e.args[t];
            !r.primitiveIs(n) && r.objectLike(n) && (e.location = r.diagnosticLocation({
              error: n,
              location: e.location
            }));
          }
          e.location = e.location || Object.create(null), 
          /* level */
          r.numberIs(e.level) || (e.level = _err.defaults.level)
          /* make new one if no error in arguments */;
          let o = e.stack, u = "";
          t ? void 0 !== t.stack ? void 0 !== t.originalMessage ? (o = t.stack, u = t.stackCondensed) : o = r.diagnosticStack(t) : o = r.diagnosticStack([ e.level, Infinity ]) : (o || (o = e.fallBackStack), 
          t = new Error(n + "\n"), o || (o = r.diagnosticStack(t, [ e.level, -1 ]), e.location.full && -1 === o.indexOf("\n") && (o = e.location.full))), 
          o || (o = e.fallBackStack), r.strIs(o) && !r.strEnds(o, "\n") && (o += "\n"), o && !u && (u = r.diagnosticStackCondense(o))
          /* collect data */;
          for (let t = 0; t < e.args.length; t++) {
            let s, l = e.args[t];
            s = l && !r.primitiveIs(l) ? r.primitiveIs(l) ? String(l) : r.routineIs(l.toStr) ? l.toStr() : r.errIs(l) || r.strIs(l.message) ? r.strIs(l.originalMessage) ? l.originalMessage : r.strIs(l.message) ? l.message : r.toStr(l) : r.toStr(l, {
              levels: 2
            }) : void 0 === l ? "\n" + String(l) + "\n" : String(l), r.strIs(s) && "\n" === s[s.length - 1] ? n += s : n += s + " ";
          }
          /* source code */          if (e.usingSourceCode && void 0 === t.sourceCode) {
            let n = "";
            e.location = r.diagnosticLocation({
              error: t,
              stack: o,
              location: e.location
            }), (n = r.diagnosticCode({
              location: e.location,
              sourceCode: e.sourceCode
            })) && n.length < 400 && (l += n);
          }
          /* where it was caught */          let c = r.diagnosticLocation(e.level);
          if (c.service && 1 !== c.service) debugger;
          /* message */ else s = "    caught at " + c.fullWithRoutine + "\n" + s;
          let p = t.briefly || e.briefly, g = function messageForm() {
            let t = "";
            return p ? t += n : (t += " = Message\n" + n + "\n", e.condensingStack ? t += "\n = Condensed calls stack\n" + u : t += "\n = Functions stack\n" + o, 
            t += "\n = Catches stack\n" + s + "\n", l && (t += " = Source code from " + l + "\n")), 
            t;
          }();
          /* fields */
          return void 0 !== e.location.line && nonenurable("lineNumber", e.location.line), 
          nonenurable("toString", function() {
            return this.message;
          }), nonenurable("message", g), nonenurable("originalMessage", n), nonenurable("level", e.level), 
          nonenurable("stack", o), nonenurable("stackCondensed", u), e.briefly && nonenurable("briefly", e.briefly), 
          nonenurable("sourceCode", l || null), void 0 === t.location && nonenurable("location", e.location), 
          nonenurable("attended", i), nonenurable("catches", s), nonenurable("catchCounter", t.catchCounter ? t.catchCounter + 1 : 1), 
          t;
        }
        // --
        // sure
        // --
        function _sureDebugger(e) {
          if (r.debuggerEnabled) debugger;
        }
        //
                let e = Object.hasOwnProperty, t = _global_, r = _global_.wTools, s = _global_.wTools;
        _err.defaults = {
          /* to make catch stack work properly it should be 1 */
          level: 1,
          usingSourceCode: 1,
          condensingStack: 1,
          location: null,
          sourceCode: null,
          briefly: null,
          args: null,
          stack: null,
          fallBackStack: null
        };
        //
        /**
 * Creates error object, with message created from passed `msg` parameters and contains error trace.
 * If passed several strings (or mixed error and strings) as arguments, the result error message is created by
 concatenating them.
 *
 * @example
  function divide( x, y )
  {
    if( y == 0 )
      throw wTools.err( 'divide by zero' )
    return x / y;
  }
  divide( 3, 0 );

 // Error:
 // caught     at divide (<anonymous>:2:29)
 // divide by zero
 // Error
 //   at _err (file:///.../wTools/staging/Base.s:1418:13)
 //   at wTools.err (file:///.../wTools/staging/Base.s:1449:10)
 //   at divide (<anonymous>:2:29)
 //   at <anonymous>:1:1
 *
 * @param {...String|Error} msg Accepts list of messeges/errors.
 * @returns {Error} Created Error. If passed existing error as one of parameters, routine modified it and return
 * reference.
 * @function err
 * @memberof wTools
 */        
        // --
        // let
        // --
        /**
 * Throwen to indicate that operation was aborted by user or other subject.
 *
 * @error ErrorAbort
 * @memberof wTools
 */
        // function ErrorAbort()
        // {
        //   this.message = arguments.length ? _.arrayFrom( arguments ) : 'Aborted';
        // }
        //
        // ErrorAbort.prototype = Object.create( Error.prototype );
        // let ErrorAbort = error_functor( 'ErrorAbort' );
        //
        // let error =
        // {
        //   ErrorAbort,
        // }
        // --
        // fields
        // --
        // let error = Object.create( null );
        /**
 * @property {Object} error={}
 * @property {Boolean} debuggerEnabled=!!Config.debug
 * @name ErrFields
 * @memberof wTools
 */
        let l = {
          // error,
          error: Object.create(null),
          debuggerEnabled: !0
        }, a = {
          // stub
          diagnosticStack: 
          // --
          // stub
          // --
          function diagnosticStack(e) {
            return r.errIs(e) ? e.stack || e : new Error().stack;
          }
          //
          ,
          diagnosticStackCondense: function diagnosticStackCondense(e) {
            return r.errIs(e) ? e.stack || e : new Error().stack;
          }
          //
          ,
          diagnosticLocation: function diagnosticLocation() {
            return Object.create(null);
          }
          //
          ,
          diagnosticCode: function diagnosticCode() {}
          // --
          // error
          // --
          ,
          // error
          errIs: function errIs(e) {
            return e instanceof Error || "[object Error]" === Object.prototype.toString.call(e);
          }
          //
          ,
          errIsRefined: function errIsRefined(e) {
            return !1 !== r.errIs(e) && void 0 !== e.originalMessage;
          }
          //
          ,
          errIsAttended: function errIsAttended(e) {
            return !1 !== r.errIs(e) && !!e.attended;
          }
          //
          ,
          errIsAttentionRequested: function errIsAttentionRequested(e) {
            return !1 !== r.errIs(e) && e.attentionRequested;
          }
          //
          ,
          errAttentionRequest: function errAttentionRequest(e) {
            if (1 !== arguments.length) throw Error("errAttentionRequest : Expects one argument");
            if (!r.errIs(e)) throw Error("errAttentionRequest : Expects error as the first argument");
            return Object.defineProperty(e, "attended", {
              enumerable: !1,
              configurable: !0,
              writable: !0,
              value: 0
            }), Object.defineProperty(e, "attentionRequested", {
              enumerable: !1,
              configurable: !0,
              writable: !0,
              value: 1
            }), e;
          },
          _err: _err,
          err: function err() {
            return _err({
              args: arguments,
              level: 2
            });
          }
          //
          ,
          errBriefly: function errBriefly() {
            return _err({
              args: arguments,
              level: 2,
              briefly: 1
            });
          }
          //
          ,
          errAttend: function errAttend(e, t) {
            1 === arguments.length && r.errIsRefined(e) || (e = _err({
              args: arguments,
              level: 2
            }))
            /* */;
            try {
              t && Object.defineProperty(e, "attentionRequested", {
                enumerable: !1,
                configurable: !0,
                writable: !0,
                value: 0
              }), Object.defineProperty(e, "attended", {
                enumerable: !1,
                configurable: !0,
                writable: !0,
                value: r.diagnosticStack([ 1, Infinity ])
              });
            } catch (e) {
              logger.warn("Cant assign attentionRequested and attended properties to error " + e.toString());
            }
            /* */            return e;
          }
          //
          ,
          errRestack: function errRestack(e, t) {
            void 0 === t && (t = 1);
            let n = r._err({
              args: [],
              level: t + 1
            });
            return r.err(n, e);
          }
          //
          ,
          error_functor: function error_functor(e, n) {
            if (r.strIs(n) || r.arrayIs(n)) {
              let e = n;
              n = function onErrorMake() {
                debugger;
                return r.arrayAppendArrays([], [ e, arguments ]), args;
              };
            } else n || (n = function onErrorMake() {
              return arguments;
            });
            let s = {
              [e]: function() {
                if (this instanceof s) return r.assert(0 === arguments.length), this;
                {
                  let e = new s(), l = n.apply(e, arguments);
                  r.assert(r.arrayLike(l));
                  let a = r.arrayAppendArrays([], [ [ e, arguments.length ? "\n" : "" ], l ]), i = r._err({
                    args: a,
                    level: 3
                  });
                  return r.assert(e === i), r.assert(i instanceof t.Error), r.assert(i instanceof s), 
                  r.assert(!!i.stack), i;
                }
              }
            }[e];
            return r.assert(s.name === e, "Looks like your interpreter does not support dynamice naming of functions. Please use ES2015 or later interpreter."), 
            s.prototype = Object.create(t.Error.prototype), s.prototype.constructor = s, s.constructor = s, 
            s;
          }
          //
          /**
 * Creates error object, with message created from passed `msg` parameters and contains error trace.
 * If passed several strings (or mixed error and strings) as arguments, the result error message is created by
 concatenating them. Prints the created error.
 * If _global_.logger defined, routine will use it to print error, else uses console
 *
 * @see {@link wTools.err See err}
 *
 * @example
   function divide( x, y )
   {
      if( y == 0 )
        throw wTools.errLog( 'divide by zero' )
      return x / y;
   }
   divide( 3, 0 );

   // Error:
   // caught     at divide (<anonymous>:2:29)
   // divide by zero
   // Error
   //   at _err (file:///.../wTools/staging/Base.s:1418:13)
   //   at wTools.errLog (file:///.../wTools/staging/Base.s:1462:13)
   //   at divide (<anonymous>:2:29)
   //   at <anonymous>:1:1
 *
 * @param {...String|Error} msg Accepts list of messeges/errors.
 * @returns {Error} Created Error. If passed existing error as one of parameters, routine modified it and return
 * @function errLog
 * @memberof wTools
 */ ,
          errLog: function errLog() {
            t.logger || t.console;
            let e = _err({
              args: arguments,
              level: 2
            });
            return r._errLog(e);
          }
          //
          ,
          errLogOnce: function errLogOnce(e) {
            return (e = _err({
              args: arguments,
              level: 2
            })).attended ? e : r._errLog(e);
          }
          //
          ,
          _errLog: function _errLog(e) {
            let n = t.logger || t.console;
            debugger;
            /* */            if (r.routineIs(e.toString)) {
              let t = e.toString();
              r.loggerIs(n), n.error(t);
            } else {
              debugger;
              n.error("Error does not have toString"), n.error(e);
            }
            /* */            
            /* */
            return r.errAttend(e), e;
          }
          //
          ,
          errOnce: function errOnce(e) {
            if (!(e = _err({
              args: arguments,
              level: 2
            })).attended) return r.errAttend(e), e;
          }
          // --
          // checker
          // --
          ,
          // checker
          checkInstanceOrClass: function checkInstanceOrClass(e, t) {
            r.assert(2 === arguments.length, "Expects exactly two arguments");
            debugger;
            return t === e || t instanceof e || Object.isPrototypeOf.call(e, t) || Object.isPrototypeOf.call(e, t.prototype);
          }
          //
          ,
          checkOwnNoConstructor: function checkOwnNoConstructor(t) {
            return r.assert(r.objectLikeOrRoutine(t)), r.assert(1 === arguments.length), !e.call(t, "constructor");
          },
          // sure
          sure: function sure(e) {
            if (!e || !function boolLike(e) {
              let t = Object.prototype.toString.call(e);
              return "[object Boolean]" === t || "[object Number]" === t;
            }(e)) throw _sureDebugger(), 1 === arguments.length ? _err({
              args: [ "Assertion fails" ],
              level: 2
            }) : 2 === arguments.length ? _err({
              args: [ arguments[1] ],
              level: 2
            }) : _err({
              args: r.longSlice(arguments, 1),
              level: 2
            });
          }
          //
          ,
          sureBriefly: function sureBriefly(e) {
            if (!e || !function boolLike(e) {
              let t = Object.prototype.toString.call(e);
              return "[object Boolean]" === t || "[object Number]" === t;
            }(e)) throw _sureDebugger(), 1 === arguments.length ? _err({
              args: [ "Assertion fails" ],
              level: 2,
              briefly: 1
            }) : 2 === arguments.length ? _err({
              args: [ arguments[1] ],
              level: 2,
              briefly: 1
            }) : _err({
              args: r.longSlice(arguments, 1),
              level: 2,
              briefly: 1
            });
          }
          //
          ,
          sureWithoutDebugger: function sureWithoutDebugger(e) {
            if (!e || !function boolLike(e) {
              let t = Object.prototype.toString.call(e);
              return "[object Boolean]" === t || "[object Number]" === t;
            }(e)) throw 1 === arguments.length ? _err({
              args: [ "Assertion fails" ],
              level: 2
            }) : 2 === arguments.length ? _err({
              args: [ arguments[1] ],
              level: 2
            }) : _err({
              args: r.longSlice(arguments, 1),
              level: 2
            });
          }
          //
          ,
          sureInstanceOrClass: function sureInstanceOrClass(e, t) {
            r.sure(2 === arguments.length, "Expects exactly two arguments"), r.sure(r.checkInstanceOrClass(e, t));
          }
          //
          ,
          sureOwnNoConstructor: function sureOwnNoConstructor(e) {
            r.sure(r.objectLikeOrRoutine(e));
            let t = r.longSlice(arguments);
            t[0] = r.checkOwnNoConstructor(e), r.sure.apply(r, t);
          }
          // --
          // assert
          // --
          /**
 * Checks condition passed by argument( condition ). Works only in debug mode. Uses StackTrace level 2.
 *
 * @see {@link wTools.err err}
 *
 * If condition is true routine returns without exceptions, otherwise routine generates and throws exception. By default generates error with message 'Assertion fails'.
 * Also generates error using message(s) or existing error object(s) passed after first argument.
 *
 * @param {*} condition - condition to check.
 * @param {String|Error} [ msgs ] - error messages for generated exception.
 *
 * @example
 * let x = 1;
 * wTools.assert( wTools.strIs( x ), 'incorrect variable type->', typeof x, 'Expects string' );
 *
 * // caught eval (<anonymous>:2:8)
 * // incorrect variable type-> number expects string
 * // Error
 * //   at _err (file:///.../wTools/staging/Base.s:3707)
 * //   at assert (file://.../wTools/staging/Base.s:4041)
 * //   at add (<anonymous>:2)
 * //   at <anonymous>:1
 *
 * @example
 * function add( x, y )
 * {
 *   wTools.assert( arguments.length === 2, 'incorrect arguments count' );
 *   return x + y;
 * }
 * add();
 *
 * // caught add (<anonymous>:3:14)
 * // incorrect arguments count
 * // Error
 * //   at _err (file:///.../wTools/staging/Base.s:3707)
 * //   at assert (file://.../wTools/staging/Base.s:4035)
 * //   at add (<anonymous>:3:14)
 * //   at <anonymous>:6
 *
 * @example
 *   function divide ( x, y )
 *   {
 *      wTools.assert( y != 0, 'divide by zero' );
 *      return x / y;
 *   }
 *   divide( 3, 0 );
 *
 * // caught     at divide (<anonymous>:2:29)
 * // divide by zero
 * // Error
 * //   at _err (file:///.../wTools/staging/Base.s:1418:13)
 * //   at wTools.errLog (file://.../wTools/staging/Base.s:1462:13)
 * //   at divide (<anonymous>:2:29)
 * //   at <anonymous>:1:1
 * @throws {Error} If passed condition( condition ) fails.
 * @function assert
 * @memberof wTools
 */ ,
          // assert
          assert: 
          //
          function assert(e) {
            if (!e) throw function _assertDebugger(e, t) {
              if (r.debuggerEnabled) {
                _err({
                  args: r.longSlice(t, 1),
                  level: 3
                });
                // console.error( 'Assertion failed' );
                debugger;
              }
            }(0, arguments), 1 === arguments.length ? _err({
              args: [ "Assertion fails" ],
              level: 2
            }) : 2 === arguments.length ? _err({
              args: [ arguments[1] ],
              level: 2
            }) : _err({
              args: r.longSlice(arguments, 1),
              level: 2
            });
            return !0;
          }
          //
          ,
          assertWithoutBreakpoint: function assertWithoutBreakpoint(e) {
            if (!e || !r.boolLike(e)) throw 1 === arguments.length ? _err({
              args: [ "Assertion fails" ],
              level: 2
            }) : 2 === arguments.length ? _err({
              args: [ arguments[1] ],
              level: 2
            }) : _err({
              args: r.longSlice(arguments, 1),
              level: 2
            });
          }
          //
          ,
          assertNotTested: function assertNotTested(e) {
            if (r.debuggerEnabled) debugger;
            r.assert(!1, "not tested : " + stack(1));
          }
          //
          /**
 * If condition failed, routine prints warning messages passed after condition argument
 * @example
  function checkAngles( a, b, c )
  {
     wTools.assertWarn( (a + b + c) === 180, 'triangle with that angles does not exists' );
  };
  checkAngles( 120, 23, 130 );

 // triangle with that angles does not exists
 * @param condition Condition to check.
 * @param messages messages to print.
 * @function assertWarn
 * @memberof wTools
 */ ,
          assertWarn: function assertWarn(e) {}
          //
          ,
          assertInstanceOrClass: function assertInstanceOrClass(e, t) {
            r.assert(2 === arguments.length, "Expects exactly two arguments"), r.assert(r.checkInstanceOrClass(e, t));
          }
          //
          ,
          assertOwnNoConstructor: function assertOwnNoConstructor(e) {
            r.assert(r.objectLikeOrRoutine(e));
            let t = r.longSlice(arguments);
            t[0] = r.checkOwnNoConstructor(e), 1 === t.length && t.push(() => "Entity should not own constructor, but own " + r.toStrShort(e)), 
            r.assert.apply(r, t);
          }
        };
        // --
        // routines
        // --
                //
        Object.assign(s, a), Object.assign(s, l), Error.stackTraceLimit = Infinity, 
        // --
        // export
        // --
        void 0 !== n && null !== n && (n.exports = s);
      }();
    });
    n.include, n.include;
  }(), // == end of file fErr_s
  function fLong_s() {
    let t = _starter_._pathResolve(e, "dwtools/abase/l0/fLong.s"), r = _starter_._pathResolve(e, "dwtools/abase/l0/"), n = _starter_._fileCreate(t, r, // == begin of file fLong_s
    function fLong_s_naked() {
      !function _fLong_s_() {
        "use strict";
        //
        function _argumentsArrayMake() {
          return arguments;
        }
        //
                //
        function bufferBytesIs(e) {
          return !s.bufferNodeIs(e) && e instanceof Uint8Array;
        }
        //
                //
        function arrayPrepended(e, t) {
          return s.assert(2 === arguments.length), s.assert(s.arrayIs(e)), e.unshift(t), 0;
        }
        //
        /**
 * Method adds a value of argument( ins ) to the beginning of an array( dstArray )
 * if destination( dstArray ) doesn't have the value of ( ins ).
 * Additionaly takes callback( onEqualize ) that checks if element from( dstArray ) is equal to( ins ).
 *
 * @param { Array } dstArray - The destination array.
 * @param { * } ins - The value to add.
 * @param { wTools~compareCallback } onEqualize - A callback function. By default, it checks the equality of two arguments.
 *
 * @example
 * // returns 0
 * _.arrayPrependedOnce( [ 1, 2, 3, 4 ], 5 );
 *
 * @example
 * // returns -1
 * _.arrayPrependedOnce( [ 1, 2, 3, 4, 5 ], 5 );
 *
 * @example
 * // returns 0
 * _.arrayPrependedOnce( [ 'Petre', 'Mikle', 'Oleg' ], 'Dmitry' );
 *
 * @example
 * // returns -1
 * _.arrayPrependedOnce( [ 'Petre', 'Mikle', 'Oleg', 'Dmitry' ], 'Dmitry' );
 *
 * @example
 * function onEqualize( a, b )
 * {
 *  return a.value === b.value;
 * };
 * _.arrayPrependedOnce( [ { value : 1 }, { value : 2 } ], { value : 1 }, onEqualize );
 * // returns -1
 *
 * @returns { Array } Returns zero if elements was succesfully added, otherwise returns -1.
 *
 * @function arrayPrependedOnce
 * @throws { Error } An Error if ( dstArray ) is not an Array.
 * @throws { Error } An Error if ( onEqualize ) is not an Function.
 * @throws { Error } An Error if ( arguments.length ) is not equal two or three.
 * @memberof wTools
 */        function arrayPrependedOnce(e, t, r, n) {
          return s.assert(s.arrayIs(e)), -1 === s.arrayLeftIndex.apply(s, arguments) ? (e.unshift(t), 
          0) : -1;
        }
        //
                /*
function arrayPrependOnceStrictly( dstArray, ins, evaluator1, evaluator2 )
{

  let result = arrayPrependedOnce.apply( this, arguments );
  _.assert( result >= 0, () => 'Array should have only unique elements, but has several ' + _.strShort( ins ) );

  return dstArray;
}
*/
        //
        /**
 * Method adds a value of argument( ins ) to the beginning of an array( dstArray )
 * and returns zero if value was succesfully added.
 *
 * @param { Array } dstArray - The destination array.
 * @param { * } ins - The element to add.
 *
 * @example
 * // returns 0
 * _.arrayPrependedElement( [ 1, 2, 3, 4 ], 5 );
 *
 * @returns { Array } Returns updated array, that contains new element( ins ).
 * @function arrayPrependedElement
 * @throws { Error } An Error if ( dstArray ) is not an Array.
 * @throws { Error } An Error if ( arguments.length ) is not equal to two.
 * @memberof wTools
 */
        function arrayPrependedElement(e, t) {
          /* xxx qqq : should return element, not index */
          // return 0;
          return s.assert(2 === arguments.length), s.assert(s.arrayIs(e)), e.unshift(t), t;
        }
        //
                function arrayPrependedElementOnce(e, t, r, n) {
          if (s.assert(s.arrayIs(e)), -1 === s.arrayLeftIndex.apply(s, arguments)) return e.unshift(t), 
          e[0];
        }
        //
                /*
function arrayPrependArrayOnceStrictly( dstArray, insArray, evaluator1, evaluator2 )
{
  let result = arrayPrependedArrayOnce.apply( this, arguments );
  _.assert( result === insArray.length );
  return dstArray;
}
*/
        //
        /**
 * Method adds all elements from array( insArray ) to the beginning of an array( dstArray ).
 * Returns count of added elements.
 *
 * @param { Array } dstArray - The destination array.
 * @param { ArrayLike } insArray - The source array.
 *
 * @example
 * let dst = [ 1, 2, 3, 4 ];
 * _.arrayPrependedArray( dst, [ 5, 6, 7 ] );
 * // returns 3
 * console.log( dst );
 * //returns [ 5, 6, 7, 1, 2, 3, 4 ]
 *
 * @returns { Array } Returns count of added elements.
 * @function arrayPrependedArray
 * @throws { Error } An Error if ( dstArray ) is not an Array.
 * @throws { Error } An Error if ( insArray ) is not an ArrayLike entity.
 * @throws { Error } An Error if ( arguments.length ) is less or more than two.
 * @memberof wTools
 */
        function arrayPrependedArray(e, t) {
          return s.assert(2 === arguments.length, "Expects exactly two arguments"), s.assert(s.arrayIs(e), "arrayPrependedArray :", "Expects array"), 
          s.assert(s.longIs(t), "arrayPrependedArray :", "Expects longIs"), e.unshift.apply(e, t), 
          t.length;
        }
        //
        /**
 * Method adds all unique elements from array( insArray ) to the beginning of an array( dstArray )
 * Additionaly takes callback( onEqualize ) that checks if element from( dstArray ) is equal to( ins ).
 * Returns count of added elements.
 *
 * @param { Array } dstArray - The destination array.
 * @param { ArrayLike } insArray - The source array.
 * @param { wTools~compareCallback } onEqualize - A callback function. By default, it checks the equality of two arguments.
 *
 * @example
 * // returns 3
 * _.arrayPrependedArrayOnce( [ 1, 2, 3 ], [ 4, 5, 6] );
 *
 * @example
 * // returns 1
 * _.arrayPrependedArrayOnce( [ 0, 2, 3, 4 ], [ 1, 1, 1 ] );
 *
 * @example
 * // returns 0
 * _.arrayPrependedArrayOnce( [ 'Petre', 'Mikle', 'Oleg', 'Dmitry' ], [ 'Dmitry' ] );
 *
 * @example
 * function onEqualize( a, b )
 * {
 *  return a.value === b.value;
 * };
 * _.arrayPrependedArrayOnce( [ { value : 1 }, { value : 2 } ], [ { value : 1 } ], onEqualize );
 * // returns 0
 *
 * @returns { Array } Returns count of added elements.
 * @function arrayPrependedArrayOnce
 * @throws { Error } An Error if ( dstArray ) is not an Array.
 * @throws { Error } An Error if ( insArray ) is not an ArrayLike entity.
 * @throws { Error } An Error if ( onEqualize ) is not an Function.
 * @throws { Error } An Error if ( arguments.length ) is not equal two or three.
 * @memberof wTools
 */        function arrayPrependedArrayOnce(e, t, r, n) {
          s.assert(s.arrayIs(e)), s.assert(s.longIs(t)), s.assert(e !== t), s.assert(2 <= arguments.length && arguments.length <= 4);
          let l = 0;
          for (let a = t.length - 1; a >= 0; a--) -1 === s.arrayLeftIndex(e, t[a], r, n) && (e.unshift(t[a]), 
          l += 1);
          return l;
        }
        //
                /*
function arrayPrependArraysOnceStrictly( dstArray, insArray, evaluator1, evaluator2 )
{
  let result = arrayPrependedArraysOnce.apply( this, arguments );
  let expected = 0;

  if( Config.debug )
  {

    for( let i = insArray.length - 1; i >= 0; i-- )
    {
      if( _.longIs( insArray[ i ] ) )
      expected += insArray[ i ].length;
      else
      expected += 1;
    }

    _.assert( result === expected, '{-dstArray-} should have none element from {-insArray-}' );

  }

  return dstArray;
}
*/
        //
        /**
 * Method adds all elements from provided arrays to the beginning of an array( dstArray ) in same order
 * that they are in( arguments ).
 * If argument provided after( dstArray ) is not a ArrayLike entity it will be prepended to destination array as usual element.
 * If argument is an ArrayLike entity and contains inner arrays, routine looks for elements only on first two levels.
 * Example: _.arrayPrependArrays( [], [ [ 1 ], [ [ 2 ] ] ] ) -> [ 1, [ 2 ] ];
 * Throws an error if one of arguments is undefined. Even if error was thrown, elements that was prepended to( dstArray ) stays in the destination array.
 *
 * @param { Array } dstArray - The destination array.
 * @param{ longIs | * } arguments[...] - Source arguments.
 *
 * @example
 * // returns 3
 * _.arrayPrependedArrays( [ 1, 2, 3, 4 ], [ 5 ], [ 6 ], 7 );
 *
 * @example
 * let dst = [ 1, 2, 3, 4 ];
 * _.arrayPrependedArrays( dst, [ 5 ], [ 6 ], undefined );
 * // throws error, but dst becomes equal [ 5, 6, 1, 2, 3, 4 ]
 *
 * @returns { Array } Returns count of added elements.
 * @function arrayPrependedArrays
 * @throws { Error } An Error if ( dstArray ) is not an Array.
 * @memberof wTools
 */
        function arrayPrependedArrays(e, t) {
          s.assert(2 === arguments.length, "Expects exactly two arguments"), s.assert(s.arrayIs(e), "arrayPrependedArrays :", "Expects array"), 
          s.assert(s.longIs(t), "arrayPrependedArrays :", "Expects longIs entity");
          let r = 0;
          for (let n = t.length - 1; n >= 0; n--) s.longIs(t[n]) ? (e.unshift.apply(e, t[n]), 
          r += t[n].length) : (e.unshift(t[n]), r += 1);
          return r;
        }
        //
        /**
 * Method adds all unique elements from provided arrays to the beginning of an array( dstArray ) in same order
 * that they are in( arguments ).
 * If argument provided after( dstArray ) is not a ArrayLike entity it will be prepended to destination array as usual element.
 * If argument is an ArrayLike entity and contains inner arrays, routine looks for elements only on first two levels.
 * Example: _.arrayPrependArrays( [], [ [ 1 ], [ [ 2 ] ] ] ) -> [ 1, [ 2 ] ];
 * Throws an error if one of arguments is undefined. Even if error was thrown, elements that was prepended to( dstArray ) stays in the destination array.
 *
 * @param { Array } dstArray - The destination array.
 * @param{ longIs | * } arguments[...] - Source arguments.
 *
 * @example
 * // returns 0
 * _.arrayPrependedArraysOnce( [ 1, 2, 3, 4, 5, 6, 7 ], [ 5 ], [ 6 ], 7 );
 *
 * @example
 * // returns 3
 * _.arrayPrependedArraysOnce( [ 1, 2, 3, 4 ], [ 5 ], 5, [ 6 ], 6, 7, [ 7 ] );
 *
 * @example
 * let dst = [ 1, 2, 3, 4 ];
 * _.arrayPrependedArraysOnce( dst, [ 5 ], [ 6 ], undefined );
 * // throws error, but dst becomes equal [ 5, 6, 1, 2, 3, 4 ]
 *
 * @returns { Array } Returns count of added elements.
 * @function arrayPrependedArraysOnce
 * @throws { Error } An Error if ( dstArray ) is not an Array.
 * @memberof wTools
 */        function arrayPrependedArraysOnce(e, t, r, n) {
          function _prependOnce(t) {
            -1 === s.arrayLeftIndex(e, t, r, n) && (
            // dstArray.unshift( argument );
            e.splice(l, 0, t), l += 1);
          }
          // for( let ii = insArray.length - 1; ii >= 0; ii-- )
                    s.assert(2 <= arguments.length && arguments.length <= 4), s.assert(s.arrayIs(e), "arrayPrependedArraysOnce :", "Expects array"), 
          s.assert(s.longIs(t), "arrayPrependedArraysOnce :", "Expects longIs entity");
          let l = 0;
          for (let e = 0; e < t.length; e++) if (s.longIs(t[e])) {
            let r = t[e];
            // for( let a = array.length - 1; a >= 0; a-- )
                        for (let e = 0; e < r.length; e++) _prependOnce(r[e]);
          } else _prependOnce(t[e]);
          return l;
        }
        //
                //
        function arrayAppended(e, t) {
          return s.assert(2 === arguments.length), s.assert(s.arrayIs(e)), e.push(t), e.length - 1;
        }
        //
                function arrayAppendedOnce(e, t, r, n) {
          return -1 === s.arrayLeftIndex.apply(s, arguments) ? (e.push(t), e.length - 1) : -1;
        }
        //
        function arrayAppendedElement(e, t) {
          return s.assert(2 === arguments.length), s.assert(s.arrayIs(e)), e.push(t), e.length - 1;
        }
        //
                function arrayAppendedElementOnce(e, t) {
          return -1 === s.arrayLeftIndex.apply(s, arguments) && (e.push(t), e[e.length - 1]);
        }
        //
                /*
function arrayAppendArrayOnceStrictly( dstArray, insArray, evaluator1, evaluator2 )
{
  let result = arrayAppendedArrayOnce.apply( this, arguments )
  _.assert( result === insArray.length );
  return dstArray;
}
*/
        //
        function arrayAppendedArray(e, t) {
          return s.assert(2 === arguments.length), s.assert(s.arrayIs(e), "arrayPrependedArray :", "Expects array"), 
          s.assert(s.longIs(t), "arrayPrependedArray :", "Expects longIs"), e.push.apply(e, t), 
          t.length;
        }
        //
                function arrayAppendedArrayOnce(e, t, r, n) {
          s.assert(s.longIs(t)), s.assert(e !== t), s.assert(2 <= arguments.length && arguments.length <= 4);
          let l = 0;
          for (let a = 0; a < t.length; a++) -1 === s.arrayLeftIndex(e, t[a], r, n) && (e.push(t[a]), 
          l += 1);
          return l;
        }
        //
                //
        function arrayAppendedArraysOnce(e, t, r, n) {
          function _appendOnce(t) {
            -1 === s.arrayLeftIndex(e, t, r, n) && (e.push(t), l += 1);
          }
          if (s.assert(2 <= arguments.length && arguments.length <= 4), void 0 === e) return t;
          s.arrayIs(t) || void 0 === t || (t = [ t ]), s.assert(s.arrayIs(e), "Expects array"), 
          s.assert(s.longIs(t), "Expects longIs entity");
          let l = 0;
          for (let e = 0, r = t.length; e < r; e++) if (s.longIs(t[e])) {
            let r = t[e];
            for (let e = 0, t = r.length; e < t; e++) _appendOnce(r[e]);
          } else _appendOnce(t[e]);
          return l;
        }
        //
                //
        function arrayRemoved(e, t, r, n) {
          return arrayRemovedElement.apply(this, arguments);
        }
        //
        /**
 * ArrayRemovedOnce and arrayRemovedOnceStrictly behave just like arrayRemovedElementOnce and arrayRemovedElementOnceStrictly,
 * but return the index of the removed element, instead of the removed element
 */        function arrayRemovedOnce(e, t, r, n) {
          let l = s.arrayLeftIndex.apply(s, arguments);
          return l >= 0 && e.splice(l, 1), l;
        }
        //
                //
        function arrayRemoveElementOnceStrictly(e, t, r, n) {
          {
            let e = arrayRemovedElementOnce.apply(this, arguments), r = s.arrayLeftIndex.apply(s, arguments);
            s.assert(r < 0), s.assert(e >= 0, () => "Array does not have element " + s.toStrShort(t));
          }
          return e;
        }
        /*
function arrayRemoveElementOnceStrictly( dstArray, ins, evaluator1, evaluator2 )
{
  let result = arrayRemovedElementOnce.apply( this, arguments );
  _.assert( result >= 0, () => 'Array does not have element ' + _.toStrShort( ins ) );
  return dstArray;
}
*/
        //
                function arrayRemovedElement(e, t, r, n) {
          let l = s.arrayLeftIndex.apply(this, arguments), a = 0;
          for (let t = 0; t < e.length; t++) -1 !== l && (e.splice(l, 1), a += 1, t -= 1), 
          l = s.arrayLeftIndex.apply(this, arguments);
          return a;
        }
        //
        /**
 * The callback function to compare two values.
 *
 * @callback wTools~compareCallback
 * @param { * } el - The element of the array.
 * @param { * } ins - The value to compare.
 */
        /**
 * The arrayRemovedElementOnce() routine returns the index of the first matching element from (dstArray)
 * that corresponds to the condition in the callback function and remove this element.
 *
 * It takes two (dstArray, ins) or three (dstArray, ins, onEvaluate) arguments,
 * checks if arguments passed two, it calls built in function(dstArray.indexOf(ins))
 * that looking for the value of the (ins) in the (dstArray).
 * If true, it removes the value (ins) from (dstArray) array by corresponding index.
 * Otherwise, if passed three arguments, it calls the routine
 * [arrayLeftIndex( dstArray, ins, onEvaluate )]{@link wTools.arrayLeftIndex}
 * If callback function(onEvaluate) returns true, it returns the index that will be removed from (dstArray).
 * @see {@link wTools.arrayLeftIndex} - See for more information.
 *
 * @param { Array } dstArray - The source array.
 * @param { * } ins - The value to remove.
 * @param { wTools~compareCallback } [ onEvaluate ] - The callback that compares (ins) with elements of the array.
 * By default, it checks the equality of two arguments.
 *
 * @example
 * // returns 1
 * let arr = _.arrayRemovedElementOnce( [ 2, 4, 6 ], 4, function( el ) {
 *   return el;
 * });
 *
 * @example
 * // returns 0
 * let arr = _.arrayRemovedElementOnce( [ 2, 4, 6 ], 2 );
 *
 * @returns { Number } - Returns the index of the value (ins) that was removed from (dstArray).
 * @function arrayRemovedElementOnce
 * @throws { Error } If the first argument is not an array-like.
 * @throws { Error } If passed less than two or more than three arguments.
 * @throws { Error } If the third argument is not a function.
 * @memberof wTools
 */        function arrayRemovedElementOnce(e, t, r, n) {
          let l = s.arrayLeftIndex.apply(s, arguments);
          return l >= 0 && e.splice(l, 1), l;
          /* "!!! : breaking" */
          /* // arrayRemovedElementOnce should return the removed element
  let result;
  let index = _.arrayLeftIndex.apply( _, arguments );

  if( index >= 0 )
  {
    result = dstArray[ index ];
    dstArray.splice( index, 1 );
  }

  return result;
  */        }
        //
                /*
function arrayRemoveArrayOnceStrictly( dstArray, insArray, evaluator1, evaluator2 )
{
  let result = arrayRemovedArrayOnce.apply( this, arguments );
  _.assert( result === insArray.length );
  return dstArray;
}
*/
        //
        function arrayRemovedArray(e, t) {
          s.assert(2 === arguments.length), s.assert(s.arrayIs(e)), s.assert(s.longIs(t)), 
          s.assert(e !== t);
          let r = 0, n = -1;
          for (let s = 0, l = t.length; s < l; s++) for (n = e.indexOf(t[s]); -1 !== n; ) e.splice(n, 1), 
          r += 1, n = e.indexOf(t[s], n);
          return r;
        }
        //
        /**
 * The callback function to compare two values.
 *
 * @callback arrayRemovedArrayOnce~onEvaluate
 * @param { * } el - The element of the (dstArray[n]) array.
 * @param { * } ins - The value to compare (insArray[n]).
 */
        /**
 * The arrayRemovedArrayOnce() determines whether a (dstArray) array has the same values as in a (insArray) array,
 * and returns amount of the deleted elements from the (dstArray).
 *
 * It takes two (dstArray, insArray) or three (dstArray, insArray, onEqualize) arguments, creates variable (let result = 0),
 * checks if (arguments[..]) passed two, it iterates over the (insArray) array and calls for each element built in function(dstArray.indexOf(insArray[i])).
 * that looking for the value of the (insArray[i]) array in the (dstArray) array.
 * If true, it removes the value (insArray[i]) from (dstArray) array by corresponding index,
 * and incrementing the variable (result++).
 * Otherwise, if passed three (arguments[...]), it iterates over the (insArray) and calls for each element the routine
 *
 * If callback function(onEqualize) returns true, it returns the index that will be removed from (dstArray),
 * and then incrementing the variable (result++).
 *
 * @see wTools.arrayLeftIndex
 *
 * @param { longIs } dstArray - The target array.
 * @param { longIs } insArray - The source array.
 * @param { function } onEqualize - The callback function. By default, it checks the equality of two arguments.
 *
 * @example
 * // returns 0
 * _.arrayRemovedArrayOnce( [  ], [  ] );
 *
 * @example
 * // returns 2
 * _.arrayRemovedArrayOnce( [ 1, 2, 3, 4, 5 ], [ 6, 2, 7, 5, 8 ] );
 *
 * @example
 * // returns 4
 * let got = _.arrayRemovedArrayOnce( [ 1, 2, 3, 4, 5 ], [ 6, 2, 7, 5, 8 ], function( a, b ) {
 *   return a < b;
 * } );
 *
 * @returns { number }  Returns amount of the deleted elements from the (dstArray).
 * @function arrayRemovedArrayOnce
 * @throws { Error } Will throw an Error if (dstArray) is not an array-like.
 * @throws { Error } Will throw an Error if (insArray) is not an array-like.
 * @throws { Error } Will throw an Error if (arguments.length < 2  || arguments.length > 3).
 * @memberof wTools
 */        function arrayRemovedArrayOnce(e, t, r, n) {
          s.assert(s.arrayIs(e)), s.assert(s.longIs(t)), s.assert(e !== t), s.assert(2 <= arguments.length && arguments.length <= 4);
          let l = 0, a = -1;
          for (let i = 0, o = t.length; i < o; i++) (a = s.arrayLeftIndex(e, t[i], r, n)) >= 0 && (e.splice(a, 1), 
          l += 1);
          return l;
        }
        //
                /*
function arrayRemoveArraysOnceStrictly( dstArray, insArray, evaluator1, evaluator2 )
{
  let result = arrayRemovedArraysOnce.apply( this, arguments );

  let expected = 0;
  for( let i = insArray.length - 1; i >= 0; i-- )
  {
    if( _.longIs( insArray[ i ] ) )
    expected += insArray[ i ].length;
    else
    expected += 1;
  }

  _.assert( result === expected );

  return dstArray;
}
*/
        //
        function arrayRemovedArrays(e, t) {
          function _remove(t) {
            let n = e.indexOf(t);
            for (;-1 !== n; ) e.splice(n, 1), r += 1, n = e.indexOf(t, n);
          }
          s.assert(2 === arguments.length, "Expects exactly two arguments"), s.assert(s.arrayIs(e), "arrayRemovedArrays :", "Expects array"), 
          s.assert(s.longIs(t), "arrayRemovedArrays :", "Expects longIs entity");
          let r = 0;
          for (let e = t.length - 1; e >= 0; e--) if (s.longIs(t[e])) {
            let r = t[e];
            for (let e = r.length - 1; e >= 0; e--) _remove(r[e]);
          } else _remove(t[e]);
          return r;
        }
        //
                function arrayRemovedArraysOnce(e, t, r, n) {
          function _removeOnce(t) {
            let a = s.arrayLeftIndex(e, t, r, n);
            a >= 0 && (e.splice(a, 1), l += 1);
          }
          s.assert(2 <= arguments.length && arguments.length <= 4), s.assert(s.arrayIs(e), "arrayRemovedArraysOnce :", "Expects array"), 
          s.assert(s.longIs(t), "arrayRemovedArraysOnce :", "Expects longIs entity");
          let l = 0;
          for (let e = t.length - 1; e >= 0; e--) if (s.longIs(t[e])) {
            let r = t[e];
            for (let e = r.length - 1; e >= 0; e--) _removeOnce(r[e]);
          } else _removeOnce(t[e]);
          return l;
        }
        //
                //
        function arrayFlattened(e, t) {
          /* */
          function onLong(t, r) {
            for (let n = 0, l = t.length; n < l; n++) s.longIs(t[n]) ? onLong(t[n], r) : e.splice(r++, 0, t[n]);
          }
          if (s.assert(arguments.length >= 1), s.assert(s.objectIs(this)), s.assert(s.arrayIs(e)), 
          1 === arguments.length) {
            for (let t = e.length - 1; t >= 0; --t) if (s.longIs(e[t])) {
              let r = e[t];
              e.splice(t, 1), onLong(r, t);
            }
            return e;
          }
          let r = 0;
          for (let t = 1; t < arguments.length; t++) {
            let n = arguments[t];
            if (s.longIs(n)) for (let t = 0, l = n.length; t < l; t++) s.longIs(n[t]) ? r += s.arrayFlattened(e, n[t]) : (s.assert(void 0 !== n[t], "The Array should have no undefined"), 
            e.push(n[t]), r += 1); else s.assert(void 0 !== n, "The Array should have no undefined"), 
            e.push(n), r += 1;
          }
          return r;
        }
        //
                function arrayFlattenedOnce(e, t, r, n) {
          /* */
          function onLongOnce(t, r) {
            for (let n = 0, l = t.length; n < l; n++) s.longIs(t[n]) ? onLongOnce(t[n], r) : -1 === s.arrayLeftIndex(e, t[n]) && e.splice(r++, 0, t[n]);
          }
          if (s.assert(arguments.length && arguments.length <= 4), s.assert(s.arrayIs(e)), 
          1 === arguments.length) {
            s.arrayRemoveDuplicates(e);
            for (let t = e.length - 1; t >= 0; --t) if (s.longIs(e[t])) {
              let r = e[t];
              e.splice(t, 1), onLongOnce(r, t);
            }
            return e;
          }
          let l = 0;
          if (s.longIs(t)) for (let a = 0, i = t.length; a < i; a++) s.assert(void 0 !== t[a], "The Array should have no undefined"), 
          s.longIs(t[a]) ? l += s.arrayFlattenedOnce(e, t[a], r, n) : -1 === s.arrayLeftIndex(e, t[a], r, n) && (e.push(t[a]), 
          l += 1); else s.assert(void 0 !== t, "The Array should have no undefined"), -1 === s.arrayLeftIndex(e, t, r, n) && (e.push(t), 
          l += 1);
          return l;
        }
        //
                function arrayFlattenedOnceStrictly(e, t, r, n) {
          /* */
          function onLongOnce(t, r) {
            for (let n = 0, l = t.length; n < l; n++) s.longIs(t[n]) ? onLongOnce(t[n], r) : -1 === s.arrayLeftIndex(e, t[n]) ? e.splice(r++, 0, t[n]) : s.assert(-1 === s.arrayLeftIndex(e, t[n]), "Elements must not be repeated");
          }
          s.assert(arguments.length && arguments.length <= 4), s.assert(s.arrayIs(e));
          let l = e.length;
          s.arrayRemoveDuplicates(e);
          let a = e.length;
          if (s.assert(l === a, "Elements in dstArray must not be repeated"), 1 === arguments.length) {
            for (let t = e.length - 1; t >= 0; --t) if (s.longIs(e[t])) {
              let r = e[t];
              e.splice(t, 1), onLongOnce(r, t);
            }
            return e;
          }
          let i = 0;
          if (s.longIs(t)) for (let l = 0, a = t.length; l < a; l++) if (s.assert(void 0 !== t[l], "The Array should have no undefined"), 
          s.longIs(t[l])) i += s.arrayFlattenedOnceStrictly(e, t[l], r, n); else {
            let a = s.arrayLeftIndex(e, t[l], r, n);
            s.assert(-1 === a, "Elements must not be repeated"), -1 === a && (e.push(t[l]), 
            i += 1);
          } else {
            s.assert(void 0 !== t, "The Array should have no undefined");
            let l = s.arrayLeftIndex(e, t, r, n);
            s.assert(-1 === l, "Elements must not be repeated"), -1 === l && (e.push(t), i += 1);
          }
          return i;
        }
        //
                //
        function arrayFlattenedDefined(e, t) {
          /* */
          function onLong(t, r) {
            for (let n = 0, l = t.length; n < l; n++) s.longIs(t[n]) ? onLong(t[n], r) : e.splice(r++, 0, t[n]);
          }
          if (s.assert(arguments.length >= 1), s.assert(s.objectIs(this)), s.assert(s.arrayIs(e)), 
          1 === arguments.length) {
            for (let t = e.length - 1; t >= 0; --t) if (s.longIs(e[t])) {
              let r = e[t];
              e.splice(t, 1), onLong(r, t);
            }
            return e;
          }
          let r = 0;
          for (let t = 1; t < arguments.length; t++) {
            let n = arguments[t];
            if (s.longIs(n)) for (let t = 0, l = n.length; t < l; t++) s.longIs(n[t]) ? r += s.arrayFlattenedDefined(e, n[t]) : 
            // _.assert( insArray[ i ] !== undefined, 'The Array should have no undefined' );
            void 0 !== n[t] && (e.push(n[t]), r += 1); else s.assert(void 0 !== n, "The Array should have no undefined"), 
            void 0 !== n && (e.push(n), r += 1);
          }
          return r;
        }
        //
                function arrayFlattenedDefinedOnce(e, t, r, n) {
          /* */
          function onLongOnce(t, r) {
            for (let n = 0, l = t.length; n < l; n++) s.longIs(t[n]) ? onLongOnce(t[n], r) : -1 === s.arrayLeftIndex(e, t[n]) && e.splice(r++, 0, t[n]);
          }
          if (s.assert(arguments.length && arguments.length <= 4), s.assert(s.arrayIs(e)), 
          1 === arguments.length) {
            s.arrayRemoveDuplicates(e);
            for (let t = e.length - 1; t >= 0; --t) if (s.longIs(e[t])) {
              let r = e[t];
              e.splice(t, 1), onLongOnce(r, t);
            }
            return e;
          }
          let l = 0;
          if (s.longIs(t)) for (let a = 0, i = t.length; a < i; a++) s.assert(void 0 !== t[a]), 
          s.longIs(t[a]) ? l += s.arrayFlattenedDefinedOnce(e, t[a], r, n) : -1 === s.arrayLeftIndex(e, t[a], r, n) && (e.push(t[a]), 
          l += 1); else void 0 !== t && -1 === s.arrayLeftIndex(e, t, r, n) && (e.push(t), 
          l += 1);
          return l;
        }
        //
                function arrayFlattenedDefinedOnceStrictly(e, t, r, n) {
          /* */
          function onLongOnce(t, r) {
            for (let n = 0, l = t.length; n < l; n++) s.longIs(t[n]) ? onLongOnce(t[n], r) : -1 === s.arrayLeftIndex(e, t[n]) ? e.splice(r++, 0, t[n]) : s.assert(-1 === s.arrayLeftIndex(e, t[n]), "Elements must not be repeated");
          }
          s.assert(arguments.length && arguments.length <= 4), s.assert(s.arrayIs(e));
          let l = e.length;
          s.arrayRemoveDuplicates(e);
          let a = e.length;
          if (s.assert(l === a, "Elements in dstArray must not be repeated"), 1 === arguments.length) {
            for (let t = e.length - 1; t >= 0; --t) if (s.longIs(e[t])) {
              let r = e[t];
              e.splice(t, 1), onLongOnce(r, t);
            }
            return e;
          }
          let i = 0;
          if (s.longIs(t)) for (let l = 0, a = t.length; l < a; l++) 
          // _.assert( insArray[ i ] !== undefined );
          if (void 0 === t[l]) ; else if (s.longIs(t[l])) i += s.arrayFlattenedDefinedOnceStrictly(e, t[l], r, n); else {
            let a = s.arrayLeftIndex(e, t[l], r, n);
            s.assert(-1 === a, "Elements must not be repeated"), -1 === a && (e.push(t[l]), 
            i += 1);
          } else if (void 0 !== t) {
            let l = s.arrayLeftIndex(e, t, r, n);
            s.assert(-1 === l, "Elements must not be repeated"), -1 === l && (e.push(t), i += 1);
          }
          return i;
        }
        // --
        // array replace
        // --
        //
                //
        function arrayReplacedOnce(e, t, r, n, l) {
          s.assert(3 <= arguments.length && arguments.length <= 5), s.longIs(t) && (s.assert(s.longIs(r)), 
          s.assert(t.length === r.length));
          let a = -1;
          return (a = s.arrayLeftIndex(e, t, n, l)) >= 0 && e.splice(a, 1, r), a;
        }
        //
                //
        function arrayReplacedElementOnce(e, t, r, n, l) {
          s.assert(3 <= arguments.length && arguments.length <= 5), s.longIs(t) && (s.assert(s.longIs(r)), 
          s.assert(t.length === r.length));
          let a = -1;
          if ((a = s.arrayLeftIndex(e, t, n, l)) >= 0) return e.splice(a, 1, r), t;
        }
        //
                /*
function arrayReplaceArrayOnceStrictly( dstArray, ins, sub, evaluator1, evaluator2  )
{
  let result = arrayReplacedArrayOnce.apply( this, arguments );
  _.assert( result === ins.length, '{-dstArray-} should have each element of {-insArray-}' );
  _.assert( ins.length === sub.length, '{-subArray-} should have the same length {-insArray-} has' );
  return dstArray;
}
*/
        //
        function arrayReplacedArray(e, t, r, n, l) {
          s.assert(3 <= arguments.length && arguments.length <= 5), s.assert(s.longIs(t)), 
          s.assert(s.longIs(r)), s.assert(t.length === r.length, "{-subArray-} should have the same length {-insArray-} has");
          let a = -1, i = 0, o = e.slice();
          // Array with src values stored
          for (let u = 0, c = t.length; u < c; u++) {
            let c = o.slice();
 // Array modified for each ins element
                        for (a = s.arrayLeftIndex(c, t[u], n, l); -1 !== a; ) {
              let o = r[u];
              void 0 === o ? (e.splice(a, 1), c.splice(a, 1)) : (e.splice(a, 1, o), c.splice(a, 1, o)), 
              i += 1, a = s.arrayLeftIndex(c, t[u], n, l);
            }
          }
          return i;
        }
        //
                function arrayReplacedArrayOnce(e, t, r, n, l) {
          s.assert(s.longIs(t)), s.assert(s.longIs(r)), s.assert(t.length === r.length, "{-subArray-} should have the same length {-insArray-} has"), 
          s.assert(3 <= arguments.length && arguments.length <= 5);
          let a = -1, i = 0;
          //let oldDstArray = dstArray.slice();  // Array with src values stored
          for (let o = 0, u = t.length; o < u; o++) if ((a = s.arrayLeftIndex(e, t[o], n, l)) >= 0) {
            let t = r[o];
            void 0 === t ? e.splice(a, 1) : e.splice(a, 1, t), i += 1;
          }
          return i;
        }
        //
                //
        function arrayReplacedArrays(e, t, r, n, l) {
          // Array with src values stored
          function _replace(e, t, r, n, l) {
            let o = i.slice(), u = s.arrayLeftIndex(o, t, n, l);
            //let index = dstArray.indexOf( argument );
                        for (;-1 !== u; ) o.splice(u, 1, r), e.splice(u, 1, r), a += 1, u = s.arrayLeftIndex(o, t, n, l);
          }
          s.assert(3 <= arguments.length && arguments.length <= 5), s.assert(s.arrayIs(e), "arrayReplacedArrays :", "Expects array"), 
          s.assert(s.longIs(r), "arrayReplacedArrays :", "Expects longIs entity"), s.assert(s.longIs(t), "arrayReplacedArrays :", "Expects longIs entity"), 
          s.assert(t.length === r.length, "{-subArray-} should have the same length {-insArray-} has");
          let a = 0, i = e.slice();
          for (let a = t.length - 1; a >= 0; a--) if (s.longIs(t[a])) {
            let s = t[a], i = r[a];
            for (let t = s.length - 1; t >= 0; t--) _replace(e, s[t], i[t], n, l);
          } else _replace(e, t[a], r[a], n, l);
          return a;
        }
        //
                function arrayReplacedArraysOnce(e, t, r, n, l) {
          // Array with src values stored
          function _replace(e, t, r, n, l) {
            let o = i.slice(), u = s.arrayLeftIndex(o, t, n, l);
            //let index = dstArray.indexOf( argument );
                        -1 !== u && (o.splice(u, 1, r), e.splice(u, 1, r), a += 1);
          }
          s.assert(3 <= arguments.length && arguments.length <= 5), s.assert(s.arrayIs(e), "arrayReplacedArrays :", "Expects array"), 
          s.assert(s.longIs(r), "arrayReplacedArrays :", "Expects longIs entity"), s.assert(s.longIs(t), "arrayReplacedArrays :", "Expects longIs entity"), 
          s.assert(t.length === r.length, "{-subArray-} should have the same length {-insArray-} has");
          let a = 0, i = e.slice();
          for (let a = t.length - 1; a >= 0; a--) if (s.longIs(t[a])) {
            let s = t[a], i = r[a];
            for (let t = s.length - 1; t >= 0; t--) _replace(e, s[t], i[t], n, l);
          } else _replace(e, t[a], r[a], n, l);
          return a;
        }
        //
                let e = Array.prototype.indexOf, t = Array.prototype.lastIndexOf, r = Array.prototype.slice, s = (_global_, 
        _global_.wTools), l = _global_.wTools, a = {
          ArrayType: Array,
          accuracy: 1e-7,
          accuracySqrt: 1e-4,
          accuracySqr: 1e-14
        }, i = {
          // arguments array
          argumentsArrayIs: 
          // --
          // arguments array
          // --
          function argumentsArrayIs(e) {
            return "[object Arguments]" === Object.prototype.toString.call(e);
          }
          //
          ,
          argumentsArrayMake: function argumentsArrayMake(e) {
            return s.assert(1 === arguments.length), s.assert(s.numberIs(e) || s.longIs(e)), 
            s.numberIs(e) ? _argumentsArrayMake.apply(s, Array(e)) : _argumentsArrayMake.apply(s, e);
          },
          _argumentsArrayMake: _argumentsArrayMake,
          argumentsArrayFrom: function argumentsArrayFrom(e) {
            return s.assert(1 === arguments.length, "Expects single argument"), s.argumentsArrayIs(e) ? e : s.argumentsArrayMake(e);
          }
          // --
          // unroll
          // --
          /**
 * The routine unrollIs() determines whether the passed value is an instance of type unroll ( unroll-array ).
 *
 * If {-src-} is an unroll, then returns true, otherwise returns false.
 *
 * @param { * } src - The object to be checked.
 *
 * @example
 * // returns true
 * _.unrollIs( _.unrollMake( [ 1, 'str' ] ) );
 *
 * @example
 * // returns false
 * _.unrollIs( [] );
 *
 * @example
 * // returns false
 * _.unrollIs( 1 );
 *
 * @returns { boolean } Returns true if {-src-} is an unroll.
 * @function unrollIs
 * @memberof wTools
 */ ,
          // unroll
          unrollIs: function unrollIs(e) {
            return !!s.arrayIs(e) && !!e[s.unroll];
          }
          //
          /**
 * The routine unrollIsPopulated() determines whether the unroll-array has elements (length).
 *
 * If {-src-} is an unroll-array and has one or more elements, then returns true, otherwise returns false.
 *
 * @param { * } src - The object to be checked.
 *
 * @example
 * // returns true
 * _.unrollIs( _.unrollMake( [ 1, 'str' ] ) );
 *
 * @example
 * // returns false
 * _.unrollIs( _.unrollMake( [] ) );
 *
 * @example
 * // returns false
 * _.unrollIs( 1 );
 *
 * @returns { boolean } Returns true if argument ( src ) is an unroll-array and has one or more elements ( length ).
 * @function unrollIsPopulated
 * @memberof wTools
 */ ,
          unrollIsPopulated: function unrollIsPopulated(e) {
            return !!s.unrollIs(e) && e.length > 0;
          }
          //
          /**
 * The routine unrollMake() returns a new unroll-array maked from {-src-}.
 *
 * Unroll constructed by attaching symbol _.unroll Symbol to ordinary array.
 * Making an unroll normalizes its content.
 *
 * @param { * } src - The number or array-like object to make unroll-array. Passing null returns an empty unroll.
 *
 * @example
 * // returns true  & false
 * let unroll = _.unrollMake( null );
 * _.unrollIs( unroll );
 * _.unrollIsPopulated( unroll );
 *
 * @example
 * // returns true
 * let unroll = _.unrollMake( [ 1, 2, 'str' ] );
 * _.unrollIs( unroll );
 *
 * @example
 * //returns false
 * let arr = new Array( 1, 2, 'str' );
 * let unroll = _.unrollMake( [ 1, 2, 'str' ] );
 * console.log( arr === unroll );
 *
 * @returns { Unroll } Returns a new unroll-array maked from {-src-}.
 * Otherwise, it returns the empty unroll.
 * @function unrollMake
 * @throws { Error } If ( arguments.length ) is less or more then one.
 * @throws { Error } If argument ( src ) is not number, not array, not null.
 * @memberof wTools
 */ ,
          unrollMake: function unrollMake(e) {
            let t = s.arrayMake(e);
            return s.assert(1 === arguments.length), s.assert(s.arrayIs(t)), t[s.unroll] = !0, 
            s.unrollIs(e) || (t = s.unrollNormalize(t)), t;
          }
          //
          /**
 * The routine unrollFrom() performs conversion of {-src-} to unroll-array.
 *
 * If {-src-} is not unroll-array, routine unrollFrom() returns new unroll-array.
 * If {-src-} is unroll-array, then routine returns {-src-}.
 *
 * @param { * } src - The number, array-like object or unroll-array. Passing null returns an empty unroll.
 *
 * @example
 * // returns true, false
 * let unroll = _.unrollFrom( null );
 * _.unrollIs( unroll );
 * _.unrollIsPopulated( unroll );
 *
 * @example
 * // returns true
 * let unroll = _.unrollMake( [ 1, 2, 'str' ] );
 * let result = _.unrollFrom( unroll );
 * console.log ( unroll === result );
 *
 * @example
 * //returns true, false
 * let arr = new Array( 1, 2, 'str' );
 * let unroll = _.unrollFrom( [ 1, 2, 'str' ] );
 * console.log( _.unrollIs( unroll ) );
 * console.log( arr === unroll );
 *
 * @returns { Unroll } Returns unroll-array converted from {-src-}.
 * If {-src-} is unroll-array, then routine returns {-src-}.
 * @function unrollFrom
 * @throws { Error } If (arguments.length) is less or more then one.
 * @throws { Error } If argument {-src-} is not number, not long-like, not null.
 * @memberof wTools
 */ ,
          unrollFrom: function unrollFrom(e) {
            return s.assert(1 === arguments.length), s.unrollIs(e) ? e : s.unrollMake(e);
          }
          //
          /**
 * The routine unrollsFrom() performs conversion of each argument to unroll-array.
 * The routine returns unroll-array contained unroll-arrays converted from arguments.
 *
 * @param { * } srcs - The objects to be converted into unrolls.
 *
 * @example
 * // returns [ [] ], true, true
 * let unroll = _.unrollsFrom( null );
 * console.log( unroll );
 * console.log( _.unrollIs( unroll ) );
 * console.log( _.unrollIsPopulated( unroll ) );
 *
 * @example
 * // returns [ [ 1, 2, 'str' ] ], true, true
 * let unroll = _.unrollsFrom( [ 1, 2, 'str' ] );
 * console.log ( unroll );
 * console.log( _.unrollIs( unroll ) );
 * console.log( _.unrollIs( unroll[ 0 ] ) );
 *
 * @example
 * //returns true, false
 * let arr = new Array( 1, 2, 'str' );
 * let unroll = _.unrollsFrom( [ 1, 2, 'str' ] );
 * console.log( _.unrollIs( unroll ) );
 * console.log( arr === unroll );
 *
 * @example
 * // returns [ [], [ undefined ], [], [ 1, [] ] ], true, true, true, true, true
 * let unroll = _.unrollsFrom( [], 1, null, [ 1, [] ] );
 * console.log( unroll );
 * console.log( _.unrollIs( unroll ) );
 * console.log( _.unrollIs( unroll[ 0 ] ) );
 * console.log( _.unrollIs( unroll[ 1 ] ) );
 * console.log( _.unrollIs( unroll[ 2 ] ) );
 * console.log( _.unrollIs( unroll[ 3 ] ) );
 *
 * @returns { Unroll } Returns unroll-array contained unroll-arrays converted from arguments.
 * @function unrollsFrom
 * @throws { Error } If (arguments.length) is less then one.
 * @throws { Error } If any of the arguments is not number, not long-like, not null.
 * @memberof wTools
 */ ,
          unrollsFrom: function unrollsFrom(e) {
            s.assert(arguments.length >= 1);
            let t = s.unrollMake(null);
            for (let e = 0; e < arguments.length; e++) s.unrollIs(arguments[e]) ? t.push(arguments[e]) : t.push(s.unrollMake(arguments[e]));
            return t;
          }
          /**
 * The routine unrollFromMaybe() performs conversion of {-src-} to unroll-array.
 *
 * If {-src-} is not unroll-array, routine unrollFromMaybe() returns new unroll-array.
 * If {-src-} is unroll-array, then routine returns {-src-}.
 * If {-src-} has incompatible type, then routine returns {-src-}.
 *
 * @param { * } src - The object to make unroll-array.
 *
 * @example
 * // returns false, true
 * var src = 'str';
 * let got = _.unrollFromMaybe( src );
 * console.log( _.unrollIs( got ) );
 * console.log( got === src );
 *
 * @example
 * // returns true, false
 * let unroll = _.unrollFromMaybe( null );
 * console.log( _.unrollIs( unroll ) );
 * console.log( _.unrollIsPopulated( unroll ) );
 *
 * @example
 * // returns true
 * let unroll = _.unrollMake( [ 1, 2, 'str' ] );
 * let result = _.unrollFromMaybe( unroll );
 * console.log ( unroll === result );
 *
 * @example
 * //returns true, false
 * let arr = new Array( 1, 2, 'str' );
 * let unroll = _.unrollFromMaybe( [ 1, 2, 'str' ] );
 * console.log( _.unrollIs( unroll ) );
 * console.log( arr === unroll );
 *
 * @returns { Unroll } Returns unroll-array converted from {-src-}.
 * If {-src-} is unroll-array or incompatible type, then routine returns {-src-}.
 * @function unrollFromMaybe
 * @throws { Error } If (arguments.length) is less or more then one.
 * @memberof wTools
 */ ,
          unrollFromMaybe: function unrollFromMaybe(e) {
            return s.assert(1 === arguments.length), s.unrollIs(e) || s.strIs(e) || s.boolIs(e) || s.mapIs(e) || void 0 === e ? e : s.unrollMake(e);
          }
          //
          /**
 * The routine unrollNormalize() performs normalization of {-dstArray-}.
 * Normalization is unrolling of unroll-arrays, which is elements of {-dstArray-}.
 *
 * If {-dstArray-} is unroll-array, routine unrollNormalize() returns unroll-array
 * with normalized elements.
 * If {-dstArray-} is array, routine unrollNormalize() returns array with unrolled elements.
 *
 * @param { arrayIs|Unroll } dstArray - The array to be unrolled (normalized).
 *
 * @example
 * // returns [ 1, 2, 3, 'str' ], true
 * let unroll = _.unrollFrom( [ 1, 2, _.unrollMake( [ 3, 'str' ] ) ] );
 * let result = _.unrollNormalize( unroll )
 * console.log( result );
 * console.log( _.unrollIs( result ) );
 *
 * @example
 * // returns [ 1, 1, 'str', [ 1, 'str' ] ], false
 * let unroll = _.unrollFrom( [ 1,'str' ] );
 * let result = _.unrollNormalize( [ 1, unroll, [ unroll ] ] );
 * console.log( result );
 * console.log( _.unrollIs( result ) );
 *
 * @returns { Array } If {-dstArray-} is array, routine returns an array with normalized elements.
 * @returns { Unroll } If {-dstArray-} is unroll-array, routine returns an unroll-array with normalized elements.
 * @function unrollNormalize
 * @throws { Error } If ( arguments.length ) is not equal to one.
 * @throws { Error } If argument ( dstArray ) is not arrayLike.
 * @memberof wTools
 */ ,
          unrollNormalize: function unrollNormalize(e) {
            s.assert(s.arrayIs(e)), s.assert(1 === arguments.length);
            for (let t = 0; t < e.length; t++) if (s.unrollIs(e[t])) {
              let r = [ t, 1 ];
              r.push.apply(r, e[t]), e.splice.apply(e, r), 
              // a -= 1; // yyy
              t += r.length - 2 - 1;
            } else s.arrayIs(e[t]) && s.unrollNormalize(e[t]);
            return e;
          }
          //
          /*
qqq : в unrollPrepend, unrollAppend бракує прикладів
коли src unroll і dst не null
із виводом результату
і більше ніж одним елементом

Dmytro: correct JSdoc in unrollFrom, unrollNormalize.
Improve examples in unrollPrepend, unrollAppend.
*/
          /**
 * The routine unrollPrepend() returns an array with elements added to the begin of destination array {-dstArray-}.
 * During the operation unrolling of unrolls happens.
 *
 * If {-dstArray-} is unroll-array, routine unrollPrepend() returns unroll-array
 * with normalized elements.
 * If {-dstArray-} is array, routine unrollPrepend() returns array with unrolled elements.
 *
 * @param { Array|Unroll } dstArray - The destination array.
 * @param { * } args - The elements to be added.
 *
 * @example
 * // returns [ [ 1, 2, 'str' ] ], false
 * let result = _.unrollPrepend( null, [ 1, 2, 'str' ] );
 * console.log( result );
 * console.log( _.unrollIs( result ) );
 *
 * @example
 * // returns [ 1, 2, str ], false
 * let result = _.unrollPrepend( null, _.unrollMake( [ 1, 2, 'str' ] ) );
 * console.log( result );
 * console.log( _.unrollIs( result ) );
 *
 * @example
 * // returns [ [ 1, 2 ], 1, 'str' ], true
 * let result = _.unrollPrepend( _.unrollFrom( [ 1, 'str' ] ), [ 1, 2 ] );
 * console.log( result );
 * console.log( _.unrollIs( result ) );
 *
 * @example
 * // returns [ 2, 3, 1, 'str' ], false
 * let result = _.unrollPrepend( [ 1, 'str' ],  _.unrollFrom( [ 2, 3 ] ) );
 * console.log( result );
 * console.log( _.unrollIs( result ) );
 *
 * @example
 * // returns [ 2, 3, 1, 'str' ], true
 * let result = _.unrollPrepend( _.unrollMake( [ 1, 'str' ] ),  _.unrollFrom( [ 2, 3 ] ) );
 * console.log( result );
 * console.log( _.unrollIs( result ) );
 *
 * @returns { Unroll } If {-dstArray-} is unroll-array, routine returns updated unroll-array
 * with normalized elements that are added to the begin of {-dstArray-}.
 * @returns { Array } If {-dstArray-} is array, routine returns updated array
 * with normalized elements that are added to the begin of {-dstArray-}.
 * If {-dstArray-} is null, routine returns empty array.
 * @function unrollPrepend
 * @throws { Error } An Error if {-dstArray-} is not an Array or not null.
 * @throws { Error } An Error if ( arguments.length ) is less then one.
 * @memberof wTools
 */ ,
          unrollPrepend: function unrollPrepend(e) {
            return s.assert(arguments.length >= 1), s.assert(s.longIs(e) || null === e, "Expects long or unroll"), 
            function _unrollPrepend(e, t) {
              s.assert(2 === arguments.length);
              for (let r = t.length - 1; r >= 0; r--) s.unrollIs(t[r]) ? _unrollPrepend(e, t[r]) : (s.arrayIs(t[r]) && s.unrollNormalize(t[r]), 
              e.unshift(t[r]));
              return e;
            }(e = e || [], s.longSlice(arguments, 1)), e;
          }
          //
          /**
 * The routine unrollAppend() returns an array with elements added to the end of destination array {-dstArray-}.
 * During the operation unrolling of unrolls happens.
 *
 * If {-dstArray-} is unroll-array, routine unrollAppend() returns unroll-array
 * with normalized elements.
 * If {-dstArray-} is array, routine unrollAppend() returns array with unrolled elements.
 *
 * @param { Array|Unroll } dstArray - The destination array.
 * @param { * } args - The elements to be added.
 *
 * @example
 * // returns [ [ 1, 2, 'str' ] ], false
 * let result = _.unrollAppend( null, [ 1, 2, 'str' ] );
 * console.log( result );
 * console.log( _.unrollIs( result ) );
 *
 * @example
 * // returns [ 1, 2, str ], false
 * let result = _.unrollAppend( null, _.unrollMake( [ 1, 2, 'str' ] ) );
 * console.log( result );
 * console.log( _.unrollIs( result ) );
 *
 * @example
 * // returns [ 1, 'str', [ 1, 2 ] ], true
 * let result = _.unrollAppend( _.unrollFrom( [ 1, 'str' ] ), [ 1, 2 ] );
 * console.log( result );
 * console.log( _.unrollIs( result ) );
 *
 * @example
 * // returns [ 1, 'str', 2, 3 ], false
 * let result = _.unrollAppend( [ 1, 'str' ],  _.unrollFrom( [ 2, 3 ] ) );
 * console.log( result );
 * console.log( _.unrollIs( result ) );
 *
 * @example
 * // returns [ 1, 'str', 2, 3 ], true
 * let result = _.unrollAppend( _.unrollMake( [ 1, 'str' ] ),  _.unrollFrom( [ 2, 3 ] ) );
 * console.log( result );
 * console.log( _.unrollIs( result ) );
 *
 * @returns { Unroll } If {-dstArray-} is unroll-array, routine returns updated unroll-array
 * with normalized elements that are added to the end of {-dstArray-}.
 * @returns { Array } If {-dstArray-} is array, routine returns updated array
 * with normalized elements that are added to the end of {-dstArray-}.
 * If {-dstArray-} is null, routine returns empty array.
 * @function unrollAppend
 * @throws { Error } An Error if {-dstArray-} is not an Array or not null.
 * @throws { Error } An Error if ( arguments.length ) is less then one.
 * @memberof wTools
 */ ,
          unrollAppend: function unrollAppend(e) {
            return s.assert(arguments.length >= 1), s.assert(s.longIs(e) || null === e, "Expects long or unroll"), 
            function _unrollAppend(e, t) {
              s.assert(2 === arguments.length);
              for (let r = 0, n = t.length; r < n; r++) s.unrollIs(t[r]) ? _unrollAppend(e, t[r]) : (s.arrayIs(t[r]) && s.unrollNormalize(t[r]), 
              e.push(t[r]));
              return e;
            }(e = e || [], s.longSlice(arguments, 1)), e;
          }
          /*

let a1 = _.unrollFrom([ 3, 4, _.unrollFrom([ 5, 6 ]) ]);
let a2 = [ 7, _.unrollFrom([ 8, 9 ]) ] ];
_.unrollAppend( null, [ 1, 2, a1, a2, 10 ] );

let a1 = _.unrollFrom([ 3, 4, _.unrollFrom([ 5, 6 ]) ]);
let a2 = [ 7, _.unrollFrom([ 8, 9 ]) ] ];
_.unrollAppend( null, [ 1, 2, a1, a2, 10 ] );

*/
          // //
          //
          // function unrollPrepend( dstArray )
          // {
          //   _.assert( arguments.length >= 1 );
          //   _.assert( _.arrayIs( dstArray ) || dstArray === null, 'Expects array' );
          //
          //   dstArray = dstArray || [];
          //
          //   for( let a = arguments.length - 1 ; a >= 1 ; a-- )
          //   {
          //     if( _.longIs( arguments[ a ] ) )
          //     {
          //       dstArray.unshift.apply( dstArray, arguments[ a ] );
          //     }
          //     else
          //     {
          //       dstArray.unshift( arguments[ a ] );
          //     }
          //   }
          //
          //   dstArray[ _.unroll ] = true;
          //
          //   return dstArray;
          // }
          //
          // //
          //
          // function unrollAppend( dstArray )
          // {
          //   _.assert( arguments.length >= 1 );
          //   _.assert( _.arrayIs( dstArray ) || dstArray === null, 'Expects array' );
          //
          //   dstArray = dstArray || [];
          //
          //   for( let a = 1, len = arguments.length ; a < len; a++ )
          //   {
          //     if( _.longIs( arguments[ a ] ) )
          //     {
          //       dstArray.push.apply( dstArray, arguments[ a ] );
          //     }
          //     else
          //     {
          //       dstArray.push( arguments[ a ] );
          //     }
          //   }
          //
          //   dstArray[ _.unroll ] = true;
          //
          //   return dstArray;
          // }
          //
          /**
 * The routine unrollRemove() removes all matching elements in destination array {-dstArray-}
 * and returns a modified {-dstArray-}. During the operation unrolling of unrolls happens.
 *
 * @param { Array|Unroll } dstArray - The destination array.
 * @param { * } args - The elements to be removed.
 *
 * @example
 * // returns [], false
 * let result = _.unrollRemove( null, [ 1, 2, 'str' ] );
 * console.log( result );
 * console.log( _.unrollIs( result ) );
 *
 * @example
 * // returns [], true
 * let result = _.unrollRemove( _.unrollMake( null ), [ 1, 2, 'str' ] );
 * console.log( result );
 * console.log( _.unrollIs( result ) );
 *
 * @example
 * // returns [ 1, 2, 1, 3, 'str' ], false
 * let result = _.unrollRemove( [ 1, 2, 1, 3, 'str' ], [ 1, 'str', 0, 5 ] );
 * console.log( result );
 * console.log( _.unrollIs( result ) );
 *
 * @example
 * // returns [ 2, 3 ], false
 * let result = _.unrollRemove( [ 1, 2, 1, 3, 'str' ], _.unrollFrom( [ 1, 'str', 0, 5 ] ) );
 * console.log( result );
 * console.log( _.unrollIs( result ) );
 *
 * @example
 * // returns [ 1, 2, 1, 3, 'str' ], true
 * let result = _.unrollRemove( _.unrollFrom( [ 1, 2, 1, 3, 'str' ] ), [ 1, 'str', 0, 5 ] );
 * console.log( result );
 * console.log( _.unrollIs( result ) );
 *
 * @example
 * // returns [ 2, 3 ], false
 * let dstArray = _.unrollFrom( [ 1, 2, 1, 3, 'str' ] );
 * let ins = _.unrollFrom( [ 1, 'str', 0, 5 ] );
 * let result = _.unrollRemove( dstArray, ins );
 * console.log( result );
 * console.log( _.unrollIs( result ) );
 *
 * @example
 * // returns [ 2, 3 ], false
 * let dstArray = _.unrollFrom( [ 1, 2, 1, 3, 'str' ] );
 * let ins = _.unrollFrom( [ 1, _.unrollMake( [ 'str', 0, 5 ] ) ] );
 * let result = _.unrollRemove( dstArray, ins );
 * console.log( result );
 * console.log( _.unrollIs( result ) );
 *
 * @returns { Unroll } If {-dstArray-} is unroll-array, routine removes all matching elements
 * and returns updated unroll-array.
 * @returns { Array } If {-dstArray-} is array, routine removes all matching elements
 * and returns updated array. If {-dstArray-} is null, routine returns empty array.
 * @function unrollAppend
 * @throws { Error } An Error if {-dstArray-} is not an Array or not null.
 * @throws { Error } An Error if ( arguments.length ) is less then one.
 * @memberof wTools
 */ ,
          unrollRemove: function unrollRemove(e) {
            return s.assert(arguments.length >= 2), s.assert(s.longIs(e) || null === e, "Expects long or unroll"), 
            function _unrollRemove(e, t) {
              s.assert(2 === arguments.length);
              for (let r = 0, n = t.length; r < n; r++) if (s.unrollIs(t[r])) _unrollRemove(e, t[r]); else for (s.arrayIs(t[r]) && s.unrollNormalize(t[r]); e.indexOf(t[r]) >= 0; ) e.splice(e.indexOf(t[r]), 1);
              return e;
            }(e = e || [], s.longSlice(arguments, 1)), e;
          }
          //
          // --
          // long
          // --
          /**
 * The longIs() routine determines whether the passed value is an array-like or an Array.
 * Imortant : longIs returns false for Object, even if the object has length field.
 *
 * If {-srcMap-} is an array-like or an Array, true is returned,
 * otherwise false is.
 *
 * @param { * } src - The object to be checked.
 *
 * @example
 * // returns true
 * longIs( [ 1, 2 ] );
 *
 * @example
 * // returns false
 * longIs( 10 );
 *
 * @example
 * // returns true
 * let isArr = ( function() {
 *   return _.longIs( arguments );
 * } )( 'Hello there!' );
 *
 * @returns { boolean } Returns true if {-srcMap-} is an array-like or an Array.
 * @function longIs.
 * @memberof wTools
 */ ,
          // long
          longIs: function longIs(e) {
            return !(s.primitiveIs(e) || s.routineIs(e) || s.objectIs(e) || s.strIs(e) || Object.propertyIsEnumerable.call(e, "length") || !s.numberIs(e.length));
          }
          //
          ,
          longIsPopulated: function longIsPopulated(e) {
            return !!s.longIs(e) && e.length > 0;
          }
          //
          /**
 * The longMake() routine returns a new array or a new TypedArray with length equal (length)
 * or new TypedArray with the same length of the initial array if second argument is not provided.
 *
 * @param { longIs } ins - The instance of an array.
 * @param { Number } [ length = ins.length ] - The length of the new array.
 *
 * @example
 * // returns [ , ,  ]
 * let arr = _.longMake( [ 1, 2, 3 ] );
 *
 * @example
 * // returns [ , , ,  ]
 * let arr = _.longMake( [ 1, 2, 3 ], 4 );
 *
 * @returns { longIs }  Returns an array with a certain (length).
 * @function longMake
 * @throws { Error } If the passed arguments is less than two.
 * @throws { Error } If the (length) is not a number.
 * @throws { Error } If the first argument in not an array like object.
 * @throws { Error } If the (length === undefined) and (_.numberIs(ins.length)) is not a number.
 * @memberof wTools
 */ ,
          longMake: function longMake(e, t) {
            let n;
            return s.routineIs(e) && s.assert(2 === arguments.length, "Expects exactly two arguments"), 
            void 0 === t ? n = e.length : s.longIs(t) ? n = t.length : s.numberIs(t) ? n = t : s.assert(0), 
            s.argumentsArrayIs(e) && (e = []), s.assert(1 === arguments.length || 2 === arguments.length), 
            s.assert(s.numberIsFinite(n)), s.assert(s.routineIs(e) || s.longIs(e) || s.bufferRawIs(e), "unknown type of array", s.strType(e)), 
            s.longIs(t) ? e.constructor === Array ? new (s.constructorJoin(e.constructor, t))() : s.routineIs(e) ? "Array" === e.prototype.constructor.name ? r.call(t) : new e(t) : new e.constructor(t) : s.routineIs(e) ? new e(n) : new e.constructor(n);
          }
          //
          ,
          longMakeZeroed: function longMakeZeroed(e, t) {
            let r, n;
            if (s.routineIs(e) && s.assert(2 === arguments.length, "Expects exactly two arguments"), 
            void 0 === t ? n = e.length : s.longIs(t) ? n = t.length : s.numberIs(t) ? n = t : s.assert(0, "Expects long or number as the second argument, got", s.strType(t)), 
            s.argumentsArrayIs(e) && (e = []), s.assert(1 === arguments.length || 2 === arguments.length), 
            s.assert(s.numberIs(n)), s.assert(s.routineIs(e) || s.longIs(e) || s.bufferRawIs(e), "unknown type of array", s.strType(e)), 
            r = s.routineIs(e) ? new e(n) : new e.constructor(n), !s.bufferTypedIs(r) && !s.bufferRawIs(r)) for (let e = 0; e < n; e++) r[e] = 0;
            return r;
          }
          //
          ,
          _longClone: function _longClone(e) {
            if (s.assert(1 === arguments.length, "Expects single argument"), s.assert(s.longIs(e) || s.bufferAnyIs(e)), 
            s.assert(!s.bufferNodeIs(e), "not tested"), s.bufferViewIs(e)) debugger;
            return s.bufferRawIs(e) ? new Uint8Array(new Uint8Array(e)).buffer : s.bufferTypedIs(e) || s.bufferNodeIs(e) ? new e.constructor(e) : s.arrayIs(e) ? e.slice() : s.bufferViewIs(e) ? new e.constructor(e.buffer, e.byteOffset, e.byteLength) : void s.assert(0, "unknown kind of buffer", s.strType(e));
          }
          //
          ,
          longShallowClone: function longShallowClone() {
            let e, t, r = 0;
            if (1 === arguments.length) return s._longClone(arguments[0]);
            /* eval length */            for (let e = 0; e < arguments.length; e++) {
              let t = arguments[e];
              if (void 0 === t) throw s.err("argument is not defined");
              s.longIs(t) ? r += t.length : s.bufferRawIs(t) ? r += t.byteLength : r += 1;
            }
            /* make result */            s.arrayIs(arguments[0]) || s.bufferTypedIs(arguments[0]) ? e = s.longMake(arguments[0], r) : s.bufferRawIs(arguments[0]) && (e = new ArrayBuffer(r));
            let n = 0;
            s.bufferRawIs(arguments[0]) && (t = new Uint8Array(e))
            /* copy */;
            for (let r = 0, l = 0; r < arguments.length; r++) {
              let a = arguments[r];
              if (s.bufferRawIs(a)) t.set(new Uint8Array(a), n), n += a.byteLength; else if (s.bufferTypedIs(arguments[0])) e.set(a, n), 
              n += a.length; else if (s.longIs(a)) for (let t = 0; t < a.length; t++) e[l] = a[t], 
              l += 1; else e[l] = a, l += 1;
            }
            return e;
          }
          //
          /**
 * Returns a copy of original array( array ) that contains elements from index( f ) to index( l ),
 * but not including ( l ).
 *
 * If ( l ) is omitted or ( l ) > ( array.length ), longSlice extracts through the end of the sequence ( array.length ).
 * If ( f ) > ( l ), end index( l ) becomes equal to begin index( f ).
 * If ( f ) < 0, zero is assigned to begin index( f ).

 * @param { Array/Buffer } array - Source array or buffer.
 * @param { Number } [ f = 0 ] f - begin zero-based index at which to begin extraction.
 * @param { Number } [ l = array.length ] l - end zero-based index at which to end extraction.
 *
 * @example
 * _.longSlice( [ 1, 2, 3, 4, 5, 6, 7 ], 2, 6 );
 * // returns [ 3, 4, 5, 6 ]
 *
 * @example
 * // begin index is less then zero
 * _.longSlice( [ 1, 2, 3, 4, 5, 6, 7 ], -1, 2 );
 * // returns [ 1, 2 ]
 *
 * @example
 * //end index is bigger then length of array
 * _.longSlice( [ 1, 2, 3, 4, 5, 6, 7 ], 5, 100 );
 * // returns [ 6, 7 ]
 *
 * @returns { Array } Returns a shallow copy of elements from the original array.
 * @function longSlice
 * @throws { Error } Will throw an Error if ( array ) is not an Array or Buffer.
 * @throws { Error } Will throw an Error if ( f ) is not a Number.
 * @throws { Error } Will throw an Error if ( l ) is not a Number.
 * @throws { Error } Will throw an Error if no arguments provided.
 * @memberof wTools
*/ ,
          longSlice: function longSlice(e, t, r) {
            let n;
            if (s.argumentsArrayIs(e) && void 0 === t && void 0 === r) {
              if (2 === e.length) return [ e[0], e[1] ];
              if (1 === e.length) return [ e[0] ];
              if (0 === e.length) return [];
            }
            if (s.assert(s.longIs(e)), s.assert(1 <= arguments.length && arguments.length <= 3), 
            s.arrayLikeResizable(e)) return s.assert(void 0 === t || s.numberIs(t)), s.assert(void 0 === r || s.numberIs(r)), 
            e.slice(t, r);
            t = void 0 !== t ? t : 0, r = void 0 !== r ? r : e.length, s.assert(s.numberIs(t)), 
            s.assert(s.numberIs(r)), t < 0 && (t = e.length + t), r < 0 && (r = e.length + r), 
            t < 0 && (t = 0), r > e.length && (r = e.length), r < t && (r = t), n = s.bufferTypedIs(e) ? new e.constructor(r - t) : new Array(r - t);
            for (let s = t; s < r; s++) n[s - t] = e[s];
            return n;
          }
          //
          ,
          longButRange: function longButRange(e, t, r) {
            if (s.assert(s.longIs(e)), s.assert(void 0 === r || s.longIs(r)), s.assert(2 === arguments.length || 3 === arguments.length), 
            s.arrayIs(e)) return s.arrayButRange(e, t, r);
            let n;
            t = s.rangeFrom(t), s.rangeClamp(t, [ 0, e.length ]);
            let l = t[1] - t[0], a = e.length - l + (r ? r.length : 0);
            n = s.longMake(e, a);
            debugger;
            s.assert(0, "not tested");
            for (let r = 0; r < t[0]; r++) n[r] = e[r];
            for (let r = t[1]; r < a; r++) n[r - l] = e[r];
            return n;
          }
          //
          /**
 * The longRemoveDuplicates( dstLong, onEvaluator ) routine returns the dstlong with the duplicated elements removed.
 * The dstLong instance will be returned when possible, if not a new instance of the same type is created.
 *
 * @param { longIs } dstLong - The source and destination long.
 * @param { Function } [ onEvaluate = function( e ) { return e } ] - A callback function.
 *
 * @example
 * // returns [ 1, 2, 'abc', 4, true ]
 * _.longRemoveDuplicates( [ 1, 1, 2, 'abc', 'abc', 4, true, true ] );
 *
 * @example
 * // [ 1, 2, 3, 4, 5 ]
 * _.longRemoveDuplicates( [ 1, 2, 3, 4, 5 ] );
 *
 * @returns { Number } - Returns the source long without the duplicated elements.
 * @function longRemoveDuplicates
 * @throws { Error } If passed arguments is less than one or more than two.
 * @throws { Error } If the first argument is not an long.
 * @throws { Error } If the second argument is not a Function.
 * @memberof wTools
 */
          // function longRemoveDuplicates( dstLong, onEvaluate )
          // {
          //   _.assert( 1 <= arguments.length || arguments.length <= 3 );
          //   _.assert( _.longIs( dstLong ), 'longRemoveDuplicates :', 'Expects Long' );
          //   if( _.arrayIs( dstLong ) )
          //   {
          //     _.arrayRemoveDuplicates( dstLong, onEvaluate );
          //   }
          //   else if( Object.prototype.toString.call( dstLong ) === "[object Arguments]")
          //   {
          //     let newElement;
          //     for( let i = 0; i < dstLong.length; i++ )
          //     {
          //       newElement = dstLong[ i ];
          //       for( let j = i + 1; j < dstLong.length; j++ )
          //       {
          //         if( newElement === dstLong[ j ] )
          //         {
          //           let array = Array.from( dstLong );
          //           _.arrayRemoveDuplicates( array, onEvaluate );
          //           dstLong = new dstLong.constructor( array );
          //         }
          //       }
          //     }
          //   }
          //   else
          //   {
          //     if( !onEvaluate )
          //     {
          //       for( let i = 0 ; i < dstLong.length ; i++ )
          //       {
          //         function isDuplicated( element, index, array )
          //         {
          //           return ( element !== dstLong[ i ] || index === i );
          //         }
          //         dstLong = dstLong.filter( isDuplicated );
          //       }
          //     }
          //     else
          //     {
          //       if( onEvaluate.length === 2 )
          //       {
          //         for( let i = 0 ; i < dstLong.length ; i++ )
          //         {
          //           function isDuplicated( element, index, array )
          //           {
          //             return ( !onEvaluate( element, dstLong[ i ] ) || index === i );
          //           }
          //           dstLong = dstLong.filter( isDuplicated );
          //         }
          //       }
          //       else
          //       {
          //         for( let i = 0 ; i < dstLong.length ; i++ )
          //         {
          //           function isDuplicated( element, index, array )
          //           {
          //             return ( onEvaluate( element ) !== onEvaluate( dstLong[ i ] ) || index === i );
          //           }
          //           dstLong = dstLong.filter( isDuplicated );
          //         }
          //       }
          //     }
          //   }
          //   return dstLong;
          // }
          ,
          longRemoveDuplicates: function longRemoveDuplicates(e, t) {
            if (s.assert(1 <= arguments.length || arguments.length <= 3), s.assert(s.longIs(e), "longRemoveDuplicates :", "Expects Long"), 
            s.arrayIs(e)) return s.arrayRemoveDuplicates(e, t);
            if (!e.length) return e;
            let r = e.length;
            for (let n = 0; n < e.length; n++) -1 !== s.arrayLeftIndex(e, e[n], n + 1, t) && r--;
            if (r === e.length) return e;
            let n = s.longMake(e, r);
            n[0] = e[0];
            let l = 1;
            for (let a = 1; a < e.length && l < r; a++) -1 === s.arrayRightIndex(n, e[a], l - 1, t) && (n[l++] = e[a]);
            return s.assert(l === r), n;
          }
          /* qqq : not optimal, no redundant copy */
          /*
function longRemoveDuplicates( dstLong, onEvaluate )
{
  _.assert( 1 <= arguments.length || arguments.length <= 3 );
  _.assert( _.longIs( dstLong ), 'longRemoveDuplicates :', 'Expects Long' );

  if( _.arrayIs( dstLong ) )
  {
    _.arrayRemoveDuplicates( dstLong, onEvaluate )
    return dstLong;
  }

  let array = Array.from( dstLong );
  _.arrayRemoveDuplicates( array, onEvaluate )

  if( array.length === dstLong.length )
  {
    return dstLong;
  }
  else
  {
    return new dstLong.constructor( array );
  }

}
*/
          //
          ,
          longAreRepeatedProbe: function longAreRepeatedProbe(e, t) {
            s.longMake(e);
            let r = Object.create(null);
            r.array = s.arrayMake(e.length), r.uniques = e.length, r.condensed = e.length, s.assert(1 === arguments.length || 2 === arguments.length), 
            s.assert(s.longIs(e));
            for (let n = 0; n < e.length; n++) {
              let l = e[n];
              if (r.array[n] > 0) continue;
              r.array[n] = 0;
              let a = s.arrayLeftIndex(e, l, n + 1, t);
              if (a >= 0) {
                r.array[n] = 1, r.uniques -= 1;
                do {
                  r.uniques -= 1, r.condensed -= 1, r.array[a] = 1, a = s.arrayLeftIndex(e, l, a + 1, t);
                } while (a >= 0);
              }
            }
            return r;
          }
          //
          ,
          longAllAreRepeated: function longAllAreRepeated(e, t) {
            return !s.longAreRepeatedProbe.apply(this, arguments).uniques;
          }
          //
          ,
          longAnyAreRepeated: function longAnyAreRepeated(e, t) {
            return s.longAreRepeatedProbe.apply(this, arguments).uniques !== e.length;
          }
          //
          ,
          longNoneAreRepeated: function longNoneAreRepeated(e, t) {
            return s.longAreRepeatedProbe.apply(this, arguments).uniques === e.length;
          }
          // --
          // buffer checker
          // --
          ,
          // buffer checker
          bufferRawIs: function bufferRawIs(e) {
            return "[object ArrayBuffer]" === Object.prototype.toString.call(e);
          }
          //
          ,
          bufferTypedIs: function bufferTypedIs(e) {
            let t = Object.prototype.toString.call(e);
            return !!/\wArray/.test(t) && !s.bufferNodeIs(e);
          }
          //
          ,
          bufferViewIs: function bufferViewIs(e) {
            return "[object DataView]" === Object.prototype.toString.call(e);
          }
          //
          ,
          bufferNodeIs: function bufferNodeIs(e) {
            return "undefined" != typeof Buffer && e instanceof Buffer;
          }
          //
          ,
          bufferAnyIs: function bufferAnyIs(e) {
            return !!e && "object" == typeof e && !!Reflect.has(e, "byteLength");
          },
          bufferBytesIs: bufferBytesIs,
          bufferBytesIs: bufferBytesIs,
          constructorIsBuffer: function constructorIsBuffer(e) {
            return !!e && !!s.numberIs(e.BYTES_PER_ELEMENT) && !!s.strIs(e.name) && -1 !== e.name.indexOf("Array");
          }
          //
          /**
 * The arrayIs() routine determines whether the passed value is an Array.
 *
 * If the {-srcMap-} is an Array, true is returned,
 * otherwise false is.
 *
 * @param { * } src - The object to be checked.
 *
 * @example
 * // returns true
 * arrayIs( [ 1, 2 ] );
 *
 * @example
 * // returns false
 * arrayIs( 10 );
 *
 * @returns { boolean } Returns true if {-srcMap-} is an Array.
 * @function arrayIs
 * @memberof wTools
 */ ,
          // array checker
          arrayIs: function arrayIs(e) {
            return "[object Array]" === Object.prototype.toString.call(e);
          }
          //
          ,
          arrayIsPopulated: function arrayIsPopulated(e) {
            return !!s.arrayIs(e) && e.length > 0;
          }
          //
          ,
          arrayLikeResizable: function arrayLikeResizable(e) {
            return "[object Array]" === Object.prototype.toString.call(e);
          }
          //
          ,
          arrayLike: function arrayLike(e) {
            return !!s.arrayIs(e) || !!s.argumentsArrayIs(e);
          }
          //
          ,
          constructorLikeArray: function constructorLikeArray(e) {
            return !!e && e !== Function && e !== Object && e !== String && !s.primitiveIs(e) && "length" in e.prototype && !Object.propertyIsEnumerable.call(e.prototype, "length");
          }
          //
          /**
 * The hasLength() routine determines whether the passed value has the property (length).
 *
 * If {-srcMap-} is equal to the (undefined) or (null) false is returned.
 * If {-srcMap-} has the property (length) true is returned.
 * Otherwise false is.
 *
 * @param { * } src - The object to be checked.
 *
 * @example
 * // returns true
 * hasLength( [ 1, 2 ] );
 *
 * @example
 * // returns true
 * hasLength( 'Hello there!' );
 *
 * @example
 * // returns true
 * let isLength = ( function() {
 *   return _.hasLength( arguments );
 * } )( 'Hello there!' );
 *
 * @example
 * // returns false
 * hasLength( 10 );
 *
 * @example
 * // returns false
 * hasLength( { } );
 *
 * @returns { boolean } Returns true if {-srcMap-} has the property (length).
 * @function hasLength
 * @memberof wTools
 */ ,
          hasLength: function hasLength(e) {
            return void 0 !== e && null !== e && !!s.numberIs(e.length);
          }
          //
          ,
          arrayHasArray: function arrayHasArray(e) {
            if (!s.arrayLike(e)) return !1;
            for (let t = 0; t < e.length; t += 1) if (s.arrayLike(e[t])) return !0;
            return !1;
          }
          //
          /**
 * The arrayCompare() routine returns the first difference between the values of the first array from the second.
 *
 * @param { longIs } src1 - The first array.
 * @param { longIs } src2 - The second array.
 *
 * @example
 * // returns 3
 * let arr = _.arrayCompare( [ 1, 5 ], [ 1, 2 ] );
 *
 * @returns { Number } - Returns the first difference between the values of the two arrays.
 * @function arrayCompare
 * @throws { Error } Will throw an Error if (arguments.length) is less or more than two.
 * @throws { Error } Will throw an Error if (src1 and src2) are not the array-like.
 * @throws { Error } Will throw an Error if (src2.length) is less or not equal to the (src1.length).
 * @memberof wTools
 */ ,
          arrayCompare: function arrayCompare(e, t) {
            s.assert(2 === arguments.length, "Expects exactly two arguments"), s.assert(s.longIs(e) && s.longIs(t)), 
            s.assert(t.length >= e.length);
            let r = 0;
            for (let n = 0; n < e.length; n++) if (0 != (r = e[n] - t[n])) return r;
            return r;
          }
          //
          /**
 * The arraysAreIdentical() routine checks the equality of two arrays.
 *
 * @param { longIs } src1 - The first array.
 * @param { longIs } src2 - The second array.
 *
 * @example
 * // returns true
 * let arr = _.arraysAreIdentical( [ 1, 2, 3 ], [ 1, 2, 3 ] );
 *
 * @returns { Boolean } - Returns true if all values of the two arrays are equal. Otherwise, returns false.
 * @function arraysAreIdentical
 * @throws { Error } Will throw an Error if (arguments.length) is less or more than two.
 * @memberof wTools
 */ ,
          arraysAreIdentical: function arraysAreIdentical(e, t) {
            s.assert(2 === arguments.length, "Expects exactly two arguments"), s.assert(s.longIs(e)), 
            s.assert(s.longIs(t));
            let r = !0;
            if (e.length !== t.length) return !1;
            for (let n = 0; n < e.length; n++) if (0 == (r = e[n] === t[n])) return !1;
            return r;
          }
          //
          ,
          arrayHas: function arrayHas(t, r, n, l) {
            return s.assert(2 <= arguments.length && arguments.length <= 4), s.assert(s.arrayLike(t)), 
            void 0 === n ? -1 !== e.call(t, r) : s.arrayLeftIndex(t, r, n, l) >= 0;
          }
          //
          /**
 * The arrayHasAny() routine checks if the {-srcMap-} array has at least one value of the following arguments.
 *
 * It iterates over array-like (arguments[]) copies each argument to the array (ins) by the routine
 * [arrayAs()]{@link wTools.arrayAs}
 * Checks, if {-srcMap-} array has at least one value of the (ins) array.
 * If true, it returns true.
 * Otherwise, it returns false.
 *
 * @see {@link wTools.arrayAs} - See for more information.
 *
 * @param { longIs } src - The source array.
 * @param {...*} arguments - One or more argument(s).
 *
 * @example
 * // returns true
 * let arr = _.arrayHasAny( [ 5, 'str', 42, false ], false, 7 );
 *
 * @returns { Boolean } - Returns true, if {-srcMap-} has at least one value of the following argument(s), otherwise false is returned.
 * @function arrayHasAny
 * @throws { Error } If the first argument in not an array.
 * @memberof wTools
 */ ,
          arrayHasAny: function arrayHasAny(e) {
            let t = !0;
            t = !1, s.assert(arguments.length >= 1, "Expects at least one argument"), s.assert(s.arrayLike(e) || s.bufferTypedIs(e), "arrayHasAny :", "array expected");
            for (let r = 1; r < arguments.length; r++) {
              t = !1;
              let n = s.arrayAs(arguments[r]);
              for (let t = 0; t < n.length; t++) if (-1 !== e.indexOf(n[t])) return !0;
            }
            return t;
          }
          //
          ,
          /* qqq : remake, make it expect only 2 mandatory arguments and optional evaluator / equalizer */
          arrayHasAll: function arrayHasAll(e) {
            s.assert(arguments.length >= 1, "Expects at least one argument"), s.assert(s.arrayLike(e) || s.bufferTypedIs(e), "arrayHasAll :", "array expected");
            for (let t = 1; t < arguments.length; t++) {
              let r = s.arrayAs(arguments[t]);
              for (let t = 0; t < r.length; t++) if (-1 === e.indexOf(r[t])) return !1;
            }
            return !0;
          }
          //
          ,
          /* qqq : remake, make it expect only 2 mandatory arguments and optional evaluator / equalizer */
          arrayHasNone: function arrayHasNone(e) {
            s.assert(arguments.length >= 1, "Expects at least one argument"), s.assert(s.arrayLike(e) || s.bufferTypedIs(e), "arrayHasNone :", "array expected");
            for (let t = 1; t < arguments.length; t++) {
              let r = s.arrayAs(arguments[t]);
              for (let t = 0; t < r.length; t++) if (-1 !== e.indexOf(r[t])) return !1;
            }
            return !0;
          }
          //
          ,
          /* qqq : remake, make it expect only 2 mandatory arguments and optional evaluator / equalizer */
          arrayAll: function arrayAll(e) {
            s.assert(1 === arguments.length, "Expects single argument"), s.assert(s.longIs(e));
            for (let t = 0; t < e.length; t += 1) if (!e[t]) return !1;
            return !0;
          }
          //
          ,
          arrayAny: function arrayAny(e) {
            s.assert(1 === arguments.length, "Expects single argument"), s.assert(s.longIs(e));
            debugger;
            for (let t = 0; t < e.length; t += 1) if (e[t]) return !0;
            debugger;
            return !1;
          }
          //
          ,
          arrayNone: function arrayNone(e) {
            s.assert(1 === arguments.length, "Expects single argument"), s.assert(s.longIs(e));
            for (let t = 0; t < e.length; t += 1) if (e[t]) return !1;
            return !0;
          }
          // --
          // scalar
          // --
          /**
 * Produce a single array from all arguments if cant return single argument as a scalar.
 * If {-scalarAppend-} gets a single argument it returns the argument as is.
 * If {-scalarAppend-} gets an argument and one or more undefined it returns the argument as is.
 * If {-scalarAppend-} gets more than one or less than one defined arguments then it returns array having all defined arguments.
 * If some argument is a long ( for example array ) then each element of the long is treated as an argument, not recursively.
 *
 * @function scalarAppend.
 * @memberof wTools
 */ ,
          // scalar
          scalarAppend: function scalarAppend(e, t) {
            if (arguments.length > 2) {
              for (let t = 1; t < arguments.length; t++) e = s.scalarAppend(e, arguments[t]);
              return e;
            }
            if (s.assert(arguments.length <= 2), void 0 === e) {
              if (!s.longIs(t)) return void 0 === t ? [] : t;
              e = [];
            }
            return s.longIs(e) ? (s.arrayIs(e) || (e = s.arrayFrom(e)), void 0 === t || (s.longIs(t) ? s.arrayAppendArray(e, t) : e.push(t))) : void 0 === t || (e = s.longIs(t) ? s.arrayAppendArray([ e ], t) : [ e, t ]), 
            e;
          }
          //
          /**
 * The scalarToVector() routine returns a new array
 * which containing the static elements only type of Number.
 *
 * It takes two arguments (dst) and (length)
 * checks if the (dst) is a Number, If the (length) is greater than or equal to zero.
 * If true, it returns the new array of static (dst) numbers.
 * Otherwise, if the first argument (dst) is an Array,
 * and its (dst.length) is equal to the (length),
 * it returns the original (dst) Array.
 * Otherwise, it throws an Error.
 *
 * @param { ( Number | Array ) } dst - A number or an Array.
 * @param { Number } length - The length of the new array.
 *
 * @example
 * // returns [ 3, 3, 3, 3, 3, 3, 3 ]
 * let arr = _.scalarToVector( 3, 7 );
 *
 * @example
 * // returns [ 3, 7, 13 ]
 * let arr = _.scalarToVector( [ 3, 7, 13 ], 3 );
 *
 * @returns { Number[] | Array } - Returns the new array of static numbers or the original array.
 * @function scalarToVector
 * @throws { Error } If missed argument, or got less or more than two arguments.
 * @throws { Error } If type of the first argument is not a number or array.
 * @throws { Error } If the second argument is less than 0.
 * @throws { Error } If (dst.length) is not equal to the (length).
 * @memberof wTools
 */
          // function arrayFromNumber( dst, length )
          ,
          scalarToVector: function scalarToVector(e, t) {
            return s.assert(2 === arguments.length, "Expects exactly two arguments"), s.assert(s.numberIs(e) || s.arrayIs(e), "Expects array of number as argument"), 
            s.assert(t >= 0), s.numberIs(e) ? e = s.arrayFillTimes([], t, e) : s.assert(e.length === t, () => "Expects array of length " + t + " but got " + e.length), 
            e;
          }
          //
          ,
          scalarFrom: function scalarFrom(e) {
            return s.longIs(e) && 1 === e.length ? e[0] : e;
          }
          //
          ,
          scalarFromOrNull: function scalarFromOrNull(e) {
            if (s.longIs(e)) {
              if (1 === e.length) return e[0];
              if (0 === e.length) return null;
            }
            return e;
          }
          // --
          // array producer
          // --
          /* qqq
add good coverage for arrayMake
take into account unroll cases
*/ ,
          // array producer
          arrayMake: function arrayMake(e) {
            return s.assert(1 === arguments.length), s.assert(s.numberIs(e) || s.longIs(e) || null === e), 
            null === e ? Array() : s.numberIs(e) ? Array(e) : 1 === e.length ? [ e[0] ] : Array.apply(Array, e);
          }
          //
          /* qqq
add good coverage for arrayFrom
take into account unroll cases
*/ ,
          arrayFrom: function arrayFrom(e) {
            return s.assert(1 === arguments.length), s.arrayIs(e) && !s.unrollIs(e) ? e : s.arrayMake.call(s, e);
          }
          //
          /**
 * The arrayAs() routine copies passed argument to the array.
 *
 * @param { * } src - The source value.
 *
 * @example
 * // returns [ false ]
 * let arr = _.arrayAs( false );
 *
 * @example
 * // returns [ { a : 1, b : 2 } ]
 * let arr = _.arrayAs( { a : 1, b : 2 } );
 *
 * @returns { Array } - If passed null or undefined than return the empty array. If passed an array then return it.
 * Otherwise return an array which contains the element from argument.
 * @function arrayAs
 * @memberof wTools
 */ ,
          arrayAs: function arrayAs(e) {
            return s.assert(1 === arguments.length), s.assert(void 0 !== e), null === e ? [] : s.longIs(e) ? e : [ e ];
          }
          //
          ,
          arrayAsShallowing: function arrayAsShallowing(e) {
            return s.assert(1 === arguments.length), s.assert(void 0 !== e), null === e ? [] : s.longIs(e) ? s.arraySlice(e) : [ e ];
          }
          // --
          // array sequential search
          // --
          ,
          // array sequential search
          arrayLeftIndex: function arrayLeftIndex(t, r, n, l) {
            let a = 0;
            if (s.numberIs(arguments[2]) && (a = arguments[2], n = arguments[3], l = arguments[4]), 
            s.assert(2 <= arguments.length && arguments.length <= 5), s.assert(s.longIs(t)), 
            s.assert(s.numberIs(a)), s.assert(void 0 === n || 1 === n.length || 2 === n.length), 
            s.assert(void 0 === n || s.routineIs(n)), s.assert(void 0 === l || 1 === l.length), 
            s.assert(void 0 === l || s.routineIs(l)), !n) return s.assert(!l), e.call(t, r, a);
            if (2 === n.length) /* equalizer */
            {
              s.assert(!l);
              for (let e = a; e < t.length; e++) if (n(t[e], r)) return e;
            } else {
              r = l ? l(r) : n(r);
              for (let e = a; e < t.length; e++) if (n(t[e]) === r) return e;
            }
            return -1;
          }
          //
          ,
          arrayRightIndex: function arrayRightIndex(e, r, n, l) {
            let a = e.length - 1;
            if (s.numberIs(arguments[2]) && (a = arguments[2], n = arguments[3], l = arguments[4]), 
            s.assert(2 <= arguments.length && arguments.length <= 5), s.assert(s.numberIs(a)), 
            s.assert(void 0 === n || 1 === n.length || 2 === n.length), s.assert(void 0 === n || s.routineIs(n)), 
            s.assert(void 0 === l || 1 === l.length), s.assert(void 0 === l || s.routineIs(l)), 
            !n) {
              if (s.assert(!l), !s.arrayIs(e)) debugger;
              return t.call(e, r, a);
            }
            if (2 === n.length) /* equalizer */
            {
              s.assert(!l);
              for (let t = a; t >= 0; t--) if (n(e[t], r)) return t;
            } else {
              r = l ? l(r) : n(r);
              for (let t = a; t >= 0; t--) if (n(e[t]) === r) return t;
            }
            return -1;
          }
          //
          /**
 * The arrayLeft() routine returns a new object containing the properties, (index, element),
 * corresponding to a found value (ins) from an array (arr).
 *
 * It creates the variable (i), assigns and calls to it the function( _.arrayLeftIndex( arr, ins, evaluator1 ) ),
 * that returns the index of the value (ins) in the array (arr).
 * [wTools.arrayLeftIndex()]{@link wTools.arrayLeftIndex}
 * If (i) is more or equal to the zero, it returns the object containing the properties ({ index : i, element : arr[ i ] }).
 * Otherwise, it returns the empty object.
 *
 * @see {@link wTools.arrayLeftIndex} - See for more information.
 *
 * @param { longIs } arr - Entity to check.
 * @param { * } ins - Element to locate in the array.
 * @param { wTools~compareCallback } evaluator1 - A callback function.
 *
 * @example
 * // returns { index : 3, element : 'str' }
 * _.arrayLeft( [ 1, 2, false, 'str', 5 ], 'str', function( a, b ) { return a === b } );
 *
 * @example
 * // returns {  }
 * _.arrayLeft( [ 1, 2, 3, 4, 5 ], 6 );
 *
 * @returns { Object } Returns a new object containing the properties, (index, element),
 * corresponding to the found value (ins) from the array (arr).
 * Otherwise, it returns the empty object.
 * @function arrayLeft
 * @throws { Error } Will throw an Error if (evaluator1) is not a Function.
 * @memberof wTools
 */ ,
          arrayLeft: function arrayLeft(e, t, r, n) {
            let l = Object.create(null), a = s.arrayLeftIndex(e, t, r, n);
            return s.assert(2 <= arguments.length && arguments.length <= 4), a >= 0 && (l.index = a, 
            l.element = e[a]), l;
          }
          //
          ,
          arrayRight: function arrayRight(e, t, r, n) {
            let l = Object.create(null), a = s.arrayRightIndex(e, t, r, n);
            return s.assert(2 <= arguments.length && arguments.length <= 4), a >= 0 && (l.index = a, 
            l.element = e[a]), l;
          }
          //
          ,
          arrayLeftDefined: function arrayLeftDefined(e) {
            return s.assert(1 === arguments.length, "Expects single argument"), s.arrayLeft(e, !0, function(e) {
              return void 0 !== e;
            });
          }
          //
          ,
          arrayRightDefined: function arrayRightDefined(e) {
            return s.assert(1 === arguments.length, "Expects single argument"), s.arrayRight(e, !0, function(e) {
              return void 0 !== e;
            });
          }
          //
          /**
 * The arrayCountElement() routine returns the count of matched elements in the {-srcArray-} array with the input { element }.
 * Returns 0 if no { element } is provided. It can take equalizer or evaluators for the routine equalities.
 *
 * @param { Array } src - The source array.
 * @param { * } element - The value to search.
 * @param { * } [ onEvaluate1 ] - It's a routine. If the routine has two parameters, it is used as an equalizer, and if it has only one, then routine used as the first part of the evaluator.
 * @param { * } [ onEvaluate2 ] - The second part of evaluator. Change the value to search.
 *
 * @example
 * // Simple exapmle. Returns 2
 * let arr = _.arrayCountElement( [ 1, 2, 'str', 10, 10, true ], 10 );
 *
 * @example
 * // With equalizer. Returns 4
 * let arr = _.arrayCountElement( [ 1, 2, 'str', 10, 10, true ], 10, ( a, b ) => _.typeOf( a ) === _.typeOf( b ) );
 *
 * @example
 * // With evaluator. Returns 4
 * let arr = _.arrayCountElement( [ [ 10, 2 ], [ 10, 2 ], [ 'str', 10 ], [ 10, true ], [ false, 10 ] ], 10, ( e ) => e[ 0 ], ( e ) => e );
 *
 * @returns { Number } - Returns the count of matched elements in the {-srcArray-} with the { element } element.
 * @function arrayCountElement
 * @throws { Error } If passed arguments is less than two or more than four.
 * @throws { Error } If the first argument is not an array-like object.
 * @throws { Error } If the third or fourth argument is not a routine.
 * @throws { Error } If the routine in third argument has less than one or more than two arguments.
 * @throws { Error } If the routine in third argument has two arguments and fourth argument is passed into routine arrayCountElement.
 * @throws { Error } If the routine in fourth argument has less than one or more than one arguments.
 * @memberof wTools
 */ ,
          arrayCountElement: function arrayCountElement(e, t, r, n) {
            let l = 0;
            s.assert(2 <= arguments.length && arguments.length <= 4), s.assert(s.longIs(e), "Expects long");
            let a = s.arrayLeftIndex(e, t, r, n);
            // let index = srcArray.indexOf( element );
                        for (;a >= 0; ) l += 1, a = s.arrayLeftIndex(e, t, a + 1, r, n);
            return l;
          }
          //
          /**
 * The arrayCountTotal() adds all the elements in { -srcArray- }, elements can be numbers or booleans ( it considers them 0 or 1 ).
 *
 * @param { Array } srcArray - The source array.
 *
 * @example
 * // returns 23;
 * let arr = _.arrayCountTotal( [ 1, 2, 10, 10 ] );
 *
 * @example
 * // returns 1;
 * let arr = _.arrayCountTotal( [ true, false, false ] );
 *
 * @returns { Number } - Returns the sum of the elements in { srcArray }.
 * @function arrayCountTotal
 * @throws { Error } If passed arguments is different than one.
 * @throws { Error } If the first argument is not an array-like object.
 * @throws { Error } If { srcArray} doesn´t contain number-like elements.
 * @memberof wTools
 */ ,
          /* qqq : cover by tests */
          arrayCountTotal: function arrayCountTotal(e) {
            let t = 0;
            s.assert(1 === arguments.length), s.assert(s.longIs(e), "Expects long");
            for (let r = 0; r < e.length; r++) s.assert(s.boolIs(e[r]) || s.numberIs(e[r]) || null === e[r]), 
            t += e[r];
            return t;
          }
          //
          /**
 * The arrayCountUnique() routine returns the count of matched pairs ([ 1, 1, 2, 2, ., . ]) in the array {-srcMap-}.
 *
 * @param { longIs } src - The source array.
 * @param { Function } [ onEvaluate = function( e ) { return e } ] - A callback function.
 *
 * @example
 * // returns 3
 * _.arrayCountUnique( [ 1, 1, 2, 'abc', 'abc', 4, true, true ] );
 *
 * @example
 * // returns 0
 * _.arrayCountUnique( [ 1, 2, 3, 4, 5 ] );
 *
 * @returns { Number } - Returns the count of matched pairs ([ 1, 1, 2, 2, ., . ]) in the array {-srcMap-}.
 * @function arrayCountUnique
 * @throws { Error } If passed arguments is less than one or more than two.
 * @throws { Error } If the first argument is not an array-like object.
 * @throws { Error } If the second argument is not a Function.
 * @memberof wTools
 */ ,
          /* qqq : cover by tests */
          arrayCountUnique: function arrayCountUnique(e, t) {
            let r = [];
            t = t || function(e) {
              return e;
            }, s.assert(1 === arguments.length || 2 === arguments.length), s.assert(s.longIs(e), "arrayCountUnique :", "Expects ArrayLike"), 
            s.assert(s.routineIs(t)), s.assert(1 === t.length);
            for (let n = 0; n < e.length; n++) {
              let s = t(e[n]);
              if (-1 === r.indexOf(s)) for (let l = n + 1; l < e.length; l++) {
                let n = t(e[l]);
                -1 === r.indexOf(n) && s === n && r.push(s);
              }
            }
            return r.length;
          }
          // --
          // array prepend
          // --
          /*

qqq : optimize *OnlyStrict* routines
qqq : use for documentation

alteration Routines :

- array { Op } { Tense } { Second } { How }

alteration Op : [ Append , Prepend , Remove, Flatten ]        // operation
alteration Tense : [ - , ed ]                                 // what to return
alteration Second : [ -, element, array, array ]              // how to treat src arguments
alteration How : [ - , Once , OnceStrictly ]                  // how to treat repeats

~ 60 routines

*/
          //
          ,
          // array prepend
          arrayPrepend_: function arrayPrepend_(e) {
            s.assert(arguments.length >= 1), s.assert(s.arrayIs(e) || null === e, "Expects array"), 
            e = e || [];
            for (let t = arguments.length - 1; t >= 1; t--) s.longIs(arguments[t]) ? e.unshift.apply(e, arguments[t]) : e.unshift(arguments[t]);
            return e;
          }
          //
          ,
          arrayPrepend: function arrayPrepend(e, t) {
            return null === e && (e = [], arguments[0] = e), arrayPrepended.apply(this, arguments), 
            e;
          }
          //
          /**
 * Method adds a value of argument( ins ) to the beginning of an array( dstArray )
 * if destination( dstArray ) doesn't have the value of ( ins ).
 * Additionaly takes callback( onEqualize ) that checks if element from( dstArray ) is equal to( ins ).
 *
 * @param { Array } dstArray - The destination array.
 * @param { * } ins - The value to add.
 * @param { wTools~compareCallback } onEqualize - A callback function. By default, it checks the equality of two arguments.
 *
 * @example
 * // returns [ 5, 1, 2, 3, 4 ]
 * _.arrayPrependOnce( [ 1, 2, 3, 4 ], 5 );
 *
 * @example
 * // returns [ 1, 2, 3, 4, 5 ]
 * _.arrayPrependOnce( [ 1, 2, 3, 4, 5 ], 5 );
 *
 * @example
 * // returns [ 'Dmitry', 'Petre', 'Mikle', 'Oleg' ]
 * _.arrayPrependOnce( [ 'Petre', 'Mikle', 'Oleg' ], 'Dmitry' );
 *
 * @example
 * // returns [ 'Petre', 'Mikle', 'Oleg', 'Dmitry' ]
 * _.arrayPrependOnce( [ 'Petre', 'Mikle', 'Oleg', 'Dmitry' ], 'Dmitry' );
 *
 * @example
 * function onEqualize( a, b )
 * {
 *  return a.value === b.value;
 * };
 * _.arrayPrependOnce( [ { value : 1 }, { value : 2 } ], { value : 1 }, onEqualize );
 * // returns [ { value : 1 }, { value : 2 } ]
 *
 * @returns { Array } If an array ( dstArray ) doesn't have a value ( ins ) it returns the updated array ( dstArray ) with the new length,
 * otherwise, it returns the original array ( dstArray ).
 * @function arrayPrependOnce
 * @throws { Error } An Error if ( dstArray ) is not an Array.
 * @throws { Error } An Error if ( onEqualize ) is not an Function.
 * @throws { Error } An Error if ( arguments.length ) is not equal two or three.
 * @memberof wTools
 */ ,
          arrayPrependOnce: function arrayPrependOnce(e, t, r, n) {
            return null === e && (e = [], arguments[0] = e), arrayPrependedOnce.apply(this, arguments), 
            e;
          }
          //
          /**
 * Method adds a value of argument( ins ) to the beginning of an array( dstArray )
 * if destination( dstArray ) doesn't have the value of ( ins ).
 * Additionaly takes callback( onEqualize ) that checks if element from( dstArray ) is equal to( ins ).
 * Returns updated array( dstArray ) if( ins ) was added, otherwise throws an Error.
 *
 * @param { Array } dstArray - The destination array.
 * @param { * } ins - The value to add.
 * @param { wTools~compareCallback } onEqualize - A callback function. By default, it checks the equality of two arguments.
 *
 * @example
 * // returns [ 5, 1, 2, 3, 4 ]
 * _.arrayPrependOnceStrictly( [ 1, 2, 3, 4 ], 5 );
 *
 * @example
 * // throws error
 * _.arrayPrependOnceStrictly( [ 1, 2, 3, 4, 5 ], 5 );
 *
 * @example
 * // returns [ 'Dmitry', 'Petre', 'Mikle', 'Oleg' ]
 * _.arrayPrependOnceStrictly( [ 'Petre', 'Mikle', 'Oleg' ], 'Dmitry' );
 *
 * @example
 * // throws error
 * _.arrayPrependOnceStrictly( [ 'Petre', 'Mikle', 'Oleg', 'Dmitry' ], 'Dmitry' );
 *
 * @example
 * function onEqualize( a, b )
 * {
 *  return a.value === b.value;
 * };
 * _.arrayPrependOnceStrictly( [ { value : 1 }, { value : 2 } ], { value : 0 }, onEqualize );
 * // returns [ { value : 0 }, { value : 1 }, { value : 2 } ]
 *
 * @returns { Array } If an array ( dstArray ) doesn't have a value ( ins ) it returns the updated array ( dstArray ) with the new length,
 * otherwise, it throws an Error.
 * @function arrayPrependOnceStrictly
 * @throws { Error } An Error if ( dstArray ) is not an Array.
 * @throws { Error } An Error if ( onEqualize ) is not an Function.
 * @throws { Error } An Error if ( arguments.length ) is not equal two or three.
 * @throws { Error } An Error if ( ins ) already exists on( dstArray ).
 * @memberof wTools
 */ ,
          arrayPrependOnceStrictly: function arrayPrependOnceStrictly(e, t, r, n) {
            let l;
            null === e && (e = [], arguments[0] = e);
            debugger;
            return l = arrayPrependedOnce.apply(this, arguments), s.assert(l >= 0, () => "Array should have only unique elements, but has several " + s.strShort(t)), 
            e;
          },
          arrayPrepended: arrayPrepended,
          arrayPrependedOnce: arrayPrependedOnce,
          arrayPrependedOnceStrictly: function arrayPrependedOnceStrictly(e, t, r, n) {
            let l;
            debugger;
            return l = arrayPrependedOnce.apply(this, arguments), s.assert(l >= 0, () => "Array should have only unique elements, but has several " + s.strShort(t)), 
            l;
          }
          //
          /**
 * Routine adds a value of argument( ins ) to the beginning of an array( dstArray ).
 *
 * @param { Array } dstArray - The destination array.
 * @param { * } ins - The element to add.
 *
 * @example
 * // returns [ 5, 1, 2, 3, 4 ]
 * _.arrayPrependElement( [ 1, 2, 3, 4 ], 5 );
 *
 * @example
 * // returns [ 5, 1, 2, 3, 4, 5 ]
 * _.arrayPrependElement( [ 1, 2, 3, 4, 5 ], 5 );
 *
 * @returns { Array } Returns updated array, that contains new element( ins ).
 * @function arrayPrependElement
 * @throws { Error } An Error if ( dstArray ) is not an Array.
 * @throws { Error } An Error if ( arguments.length ) is less or more than two.
 * @memberof wTools
 */ ,
          arrayPrependElement: function arrayPrependElement(e, t) {
            return null === e && (e = [], arguments[0] = e), arrayPrependedElement.apply(this, arguments), 
            e;
          }
          //
          ,
          arrayPrependElementOnce: function arrayPrependElementOnce(e, t, r, n) {
            return null === e && (e = [], arguments[0] = e), arrayPrependedElementOnce.apply(this, arguments), 
            e;
          }
          //
          ,
          arrayPrependElementOnceStrictly: function arrayPrependElementOnceStrictly(e, t, r, n) {
            let l;
            null === e && (e = [], arguments[0] = e);
            debugger;
            return l = arrayPrependedElementOnce.apply(this, arguments), s.assert(void 0 !== l, "Array should have only unique elements, but has several", t), 
            e;
          },
          arrayPrependedElement: arrayPrependedElement,
          arrayPrependedElementOnce: arrayPrependedElementOnce,
          arrayPrependedElementOnceStrictly: function arrayPrependedElementOnceStrictly(e, t, r, n) {
            let l;
            debugger;
            return l = arrayPrependedElementOnce.apply(this, arguments), s.assert(void 0 !== l, "Array should have only unique elements, but has several", t), 
            l;
          }
          //
          /**
 * Method adds all elements from array( insArray ) to the beginning of an array( dstArray ).
 *
 * @param { Array } dstArray - The destination array.
 * @param { ArrayLike } insArray - The source array.
 *
 * @example
 * // returns [ 5, 1, 2, 3, 4 ]
 * _.arrayPrependArray( [ 1, 2, 3, 4 ], [ 5 ] );
 *
 * @example
 * // returns [ 5, 1, 2, 3, 4, 5 ]
 * _.arrayPrependArray( [ 1, 2, 3, 4, 5 ], [ 5 ] );
 *
 * @returns { Array } Returns updated array, that contains elements from( insArray ).
 * @function arrayPrependArray
 * @throws { Error } An Error if ( dstArray ) is not an Array.
 * @throws { Error } An Error if ( insArray ) is not an ArrayLike entity.
 * @throws { Error } An Error if ( arguments.length ) is less or more than two.
 * @memberof wTools
 */ ,
          arrayPrependArray: function arrayPrependArray(e, t) {
            return null === e && (e = [], arguments[0] = e), arrayPrependedArray.apply(this, arguments), 
            e;
          }
          //
          /**
 * Method adds all unique elements from array( insArray ) to the beginning of an array( dstArray )
 * Additionaly takes callback( onEqualize ) that checks if element from( dstArray ) is equal to( ins ).
 *
 * @param { Array } dstArray - The destination array.
 * @param { ArrayLike } insArray - The source array.
 * @param { wTools~compareCallback } onEqualize - A callback function. By default, it checks the equality of two arguments.
 *
 * @example
 * // returns [ 0, 1, 2, 3, 4 ]
 * _.arrayPrependArrayOnce( [ 1, 2, 3, 4 ], [ 0, 1, 2, 3, 4 ] );
 *
 * @example
 * // returns [ 'Petre', 'Mikle', 'Oleg', 'Dmitry' ]
 * _.arrayPrependArrayOnce( [ 'Petre', 'Mikle', 'Oleg', 'Dmitry' ], [ 'Dmitry' ] );
 *
 * @example
 * function onEqualize( a, b )
 * {
 *  return a.value === b.value;
 * };
 * _.arrayPrependArrayOnce( [ { value : 1 }, { value : 2 } ], [ { value : 1 } ], onEqualize );
 * // returns [ { value : 1 }, { value : 2 } ]
 *
 * @returns { Array } Returns updated array( dstArray ) or original if nothing added.
 * @function arrayPrependArrayOnce
 * @throws { Error } An Error if ( dstArray ) is not an Array.
 * @throws { Error } An Error if ( insArray ) is not an ArrayLike entity.
 * @throws { Error } An Error if ( onEqualize ) is not an Function.
 * @throws { Error } An Error if ( arguments.length ) is not equal two or three.
 * @memberof wTools
 */ ,
          arrayPrependArrayOnce: function arrayPrependArrayOnce(e, t, r, n) {
            return null === e && (e = [], arguments[0] = e), arrayPrependedArrayOnce.apply(this, arguments), 
            e;
          }
          //
          /**
 * Method adds all unique elements from array( insArray ) to the beginning of an array( dstArray )
 * Additionaly takes callback( onEqualize ) that checks if element from( dstArray ) is equal to( ins ).
 * Returns updated array( dstArray ) if all elements from( insArray ) was added, otherwise throws error.
 * Even error was thrown, elements that was prepended to( dstArray ) stays in the destination array.
 *
 * @param { Array } dstArray - The destination array.
 * @param { ArrayLike } insArray - The source array.
 * @param { wTools~compareCallback } onEqualize - A callback function. By default, it checks the equality of two arguments.
 *
 * @example
 * // returns [ 0, 1, 2, 3, 4 ]
 * _.arrayPrependArrayOnceStrictly( [ 1, 2, 3, 4 ], [ 0, 1, 2, 3, 4 ] );
 *
 * @example
 * function onEqualize( a, b )
 * {
 *  return a.value === b.value;
 * };
 * _.arrayPrependArrayOnceStrictly( [ { value : 1 }, { value : 2 } ], { value : 1 }, onEqualize );
 * // returns [ { value : 1 }, { value : 2 } ]
 *
 * * @example
 * let dst = [ 'Petre', 'Mikle', 'Oleg', 'Dmitry' ];
 * _.arrayPrependArrayOnceStrictly( dst, [ 'Antony', 'Dmitry' ] );
 * // throws error, but dstArray was updated by one element from insArray
 *
 * @returns { Array } Returns updated array( dstArray ) or throws an error if not all elements from source
 * array( insArray ) was added.
 * @function arrayPrependArrayOnceStrictly
 * @throws { Error } An Error if ( dstArray ) is not an Array.
 * @throws { Error } An Error if ( insArray ) is not an ArrayLike entity.
 * @throws { Error } An Error if ( onEqualize ) is not an Function.
 * @throws { Error } An Error if ( arguments.length ) is not equal two or three.
 * @memberof wTools
 */ ,
          arrayPrependArrayOnceStrictly: function arrayPrependArrayOnceStrictly(e, t, r, n) {
            let l;
            return null === e && (e = [], arguments[0] = e), l = arrayPrependedArrayOnce.apply(this, arguments), 
            s.assert(l === t.length), e;
          },
          arrayPrependedArray: arrayPrependedArray,
          arrayPrependedArrayOnce: arrayPrependedArrayOnce,
          arrayPrependedArrayOnceStrictly: function arrayPrependedArrayOnceStrictly(e, t, r, n) {
            let l;
            return l = arrayPrependedArrayOnce.apply(this, arguments), s.assert(l === t.length), 
            l;
          }
          //
          /**
 * Method adds all elements from provided arrays to the beginning of an array( dstArray ) in same order
 * that they are in( arguments ).
 * If argument provided after( dstArray ) is not a ArrayLike entity it will be prepended to destination array as usual element.
 * If argument is an ArrayLike entity and contains inner arrays, routine looks for elements only on first two levels.
 * Example: _.arrayPrependArrays( [], [ [ 1 ], [ [ 2 ] ] ] ) -> [ 1, [ 2 ] ];
 * Throws an error if one of arguments is undefined. Even if error was thrown, elements that was prepended to( dstArray ) stays in the destination array.
 *
 * @param { Array } dstArray - The destination array.
 * @param{ longIs | * } arguments[...] - Source arguments.
 *
 * @example
 * // returns [ 5, 6, 7, 1, 2, 3, 4 ]
 * _.arrayPrependArrays( [ 1, 2, 3, 4 ], [ 5 ], [ 6 ], 7 );
 *
 * @example
 * let dst = [ 1, 2, 3, 4 ];
 * _.arrayPrependArrays( dst, [ 5 ], [ 6 ], undefined );
 * // throws error, but dst becomes equal [ 5, 6, 1, 2, 3, 4 ]
 *
 * @returns { Array } Returns updated array( dstArray ).
 * @function arrayPrependArrays
 * @throws { Error } An Error if ( dstArray ) is not an Array.
 * @throws { Error } An Error if one of ( arguments ) is undefined.
 * @memberof wTools
 */ ,
          arrayPrependArrays: function arrayPrependArrays(e, t) {
            return null === e && (e = [], arguments[0] = e), arrayPrependedArrays.apply(this, arguments), 
            e;
          }
          //
          /**
 * Method adds all unique elements from provided arrays to the beginning of an array( dstArray ) in same order
 * that they are in( arguments ).
 * If argument provided after( dstArray ) is not a ArrayLike entity it will be prepended to destination array as usual element.
 * If argument is an ArrayLike entity and contains inner arrays, routine looks for elements only on first two levels.
 * Example: _.arrayPrependArrays( [], [ [ 1 ], [ [ 2 ] ] ] ) -> [ 1, [ 2 ] ];
 * Throws an error if one of arguments is undefined. Even if error was thrown, elements that was prepended to( dstArray ) stays in the destination array.

 * @param { Array } dstArray - The destination array.
 * @param{ longIs | * } arguments[...] - Source arguments.
 *
 * @example
 * // returns [ 5, 6, 7, 1, 2, 3, 4 ]
 * _.arrayPrependArraysOnce( [ 1, 2, 3, 4 ], [ 5 ], 5, [ 6 ], 6, 7, [ 7 ] );
 *
 * @example
 * let dst = [ 1, 2, 3, 4 ];
 * _.arrayPrependArraysOnce( dst, [ 5 ], 5, [ 6 ], 6, undefined );
 * // throws error, but dst becomes equal [ 5, 6, 1, 2, 3, 4 ]
 *
 * @returns { Array } Returns updated array( dstArray ).
 * @function arrayPrependArraysOnce
 * @throws { Error } An Error if ( dstArray ) is not an Array.
 * @throws { Error } An Error if one of ( arguments ) is undefined.
 * @memberof wTools
 */ ,
          arrayPrependArraysOnce: function arrayPrependArraysOnce(e, t, r, n) {
            return null === e && (e = [], arguments[0] = e), arrayPrependedArraysOnce.apply(this, arguments), 
            e;
          }
          //
          /**
 * Method adds all unique elements from provided arrays to the beginning of an array( dstArray ) in same order
 * that they are in( arguments ).
 * Throws an error if one of arguments is undefined.
 * If argument provided after( dstArray ) is not a ArrayLike entity it will be prepended to destination array as usual element.
 * If argument is an ArrayLike entity and contains inner arrays, routine looks for elements only on first two levels.
 * Example: _.arrayPrependArraysOnce( [], [ [ 1 ], [ [ 2 ] ] ] ) -> [ 1, [ 2 ] ];
 * After copying checks if all elements( from first two levels ) was copied, if true returns updated array( dstArray ), otherwise throws an error.
 * Even if error was thrown, elements that was prepended to( dstArray ) stays in the destination array.

 * @param { Array } dstArray - The destination array.
 * @param { longIs | * } arguments[...] - Source arguments.
 * @param { wTools~compareCallback } onEqualize - A callback function that can be provided through routine`s context. By default, it checks the equality of two arguments.
 *
 * @example
 * // returns [ 5, 6, 7, 8, 1, 2, 3, 4 ]
 * _.arrayPrependArraysOnceStrictly( [ 1, 2, 3, 4 ], 5, [ 6, [ 7 ] ], 8 );
 *
 * @example
 * // throws error
 * _.arrayPrependArraysOnceStrictly( [ 1, 2, 3, 4 ], [ 5 ], 5, [ 6 ], 6, 7, [ 7 ] );
 *
 * @example
 * function onEqualize( a, b )
 * {
 *  return a === b;
 * };
 * let dst = [];
 * let arguments = [ dst, [ 1, [ 2 ], [ [ 3 ] ] ], 4 ];
 * _.arrayPrependArraysOnceStrictly.apply( { onEqualize }, arguments );
 * //returns [ 1, 2, [ 3 ], 4 ]
 *
 * @returns { Array } Returns updated array( dstArray ).
 * @function arrayPrependArraysOnceStrictly
 * @throws { Error } An Error if ( dstArray ) is not an Array.
 * @throws { Error } An Error if one of ( arguments ) is undefined.
 * @throws { Error } An Error if count of added elements is not equal to count of elements from( arguments )( only first two levels inside of array are counted ).
 * @memberof wTools
 */ ,
          arrayPrependArraysOnceStrictly: function arrayPrependArraysOnceStrictly(e, t, r, n) {
            let l;
            null === e && (e = [], arguments[0] = e);
            {
              l = arrayPrependedArraysOnce.apply(this, arguments);
              let e = 0;
              for (let r = t.length - 1; r >= 0; r--) s.longIs(t[r]) ? e += t[r].length : e += 1;
              s.assert(l === e, "{-dstArray-} should have none element from {-insArray-}");
            }
            return e;
          },
          arrayPrependedArrays: arrayPrependedArrays,
          arrayPrependedArraysOnce: arrayPrependedArraysOnce,
          arrayPrependedArraysOnceStrictly: function arrayPrependedArraysOnceStrictly(e, t, r, n) {
            let l;
            {
              l = arrayPrependedArraysOnce.apply(this, arguments);
              let e = 0;
              for (let r = t.length - 1; r >= 0; r--) s.longIs(t[r]) ? e += t[r].length : e += 1;
              s.assert(l === e, "{-dstArray-} should have none element from {-insArray-}");
            }
            return l;
          }
          // --
          // array append
          // --
          ,
          // array append
          arrayAppend_: function arrayAppend_(e) {
            s.assert(arguments.length >= 1), s.assert(s.arrayIs(e) || null === e, "Expects array"), 
            e = e || [];
            for (let t = 1, r = arguments.length; t < r; t++) s.longIs(arguments[t]) ? e.push.apply(e, arguments[t]) : e.push(arguments[t]);
            return e;
          }
          //
          ,
          arrayAppend: function arrayAppend(e, t) {
            return null === e && (e = [], arguments[0] = e), arrayAppended.apply(this, arguments), 
            e;
          }
          //
          /**
 * The arrayAppendOnce() routine adds at the end of an array (dst) a value {-srcMap-},
 * if the array (dst) doesn't have the value {-srcMap-}.
 *
 * @param { Array } dst - The source array.
 * @param { * } src - The value to add.
 *
 * @example
 * // returns [ 1, 2, 3, 4, 5 ]
 * _.arrayAppendOnce( [ 1, 2, 3, 4 ], 5 );
 *
 * @example
 * // returns [ 1, 2, 3, 4, 5 ]
 * _.arrayAppendOnce( [ 1, 2, 3, 4, 5 ], 5 );
 *
 * @example
 * // returns [ 'Petre', 'Mikle', 'Oleg', 'Dmitry' ]
 * _.arrayAppendOnce( [ 'Petre', 'Mikle', 'Oleg' ], 'Dmitry' );
 *
 * @example
 * // returns [ 'Petre', 'Mikle', 'Oleg', 'Dmitry' ]
 * _.arrayAppendOnce( [ 'Petre', 'Mikle', 'Oleg', 'Dmitry' ], 'Dmitry' );
 *
 * @returns { Array } If an array (dst) doesn't have a value {-srcMap-} it returns the updated array (dst) with the new length,
 * otherwise, it returns the original array (dst).
 * @function arrayAppendOnce
 * @throws { Error } Will throw an Error if (dst) is not an Array.
 * @throws { Error } Will throw an Error if (arguments.length) is less or more than two.
 * @memberof wTools
 */ ,
          arrayAppendOnce: function arrayAppendOnce(e, t, r, n) {
            return null === e && (e = [], arguments[0] = e), arrayAppendedOnce.apply(this, arguments), 
            e;
          }
          //
          ,
          arrayAppendOnceStrictly: function arrayAppendOnceStrictly(e, t, r, n) {
            let l;
            return null === e && (e = [], arguments[0] = e), l = arrayAppendedOnce.apply(this, arguments), 
            s.assert(l >= 0, () => "Array should have only unique elements, but has several " + s.strShort(t)), 
            e;
          },
          arrayAppended: arrayAppended,
          arrayAppendedOnce: arrayAppendedOnce,
          arrayAppendedOnceStrictly: function arrayAppendedOnceStrictly(e, t, r, n) {
            let l;
            return l = arrayAppendedOnce.apply(this, arguments), s.assert(l >= 0, () => "Array should have only unique elements, but has several " + s.strShort(t)), 
            l;
          }
          //
          ,
          arrayAppendElement: function arrayAppendElement(e, t) {
            return null === e && (e = [], arguments[0] = e), arrayAppendedElement.apply(this, arguments), 
            e;
          }
          //
          ,
          /* qqq : fill gaps */
          arrayAppendElementOnce: function arrayAppendElementOnce(e, t) {
            return null === e && (e = [], arguments[0] = e), arrayAppendedElementOnce.apply(this, arguments), 
            e;
          }
          //
          ,
          arrayAppendElementOnceStrictly: function arrayAppendElementOnceStrictly(e, t) {
            let r;
            return null === e && (e = [], arguments[0] = e), r = arrayAppendedElementOnce.apply(this, arguments), 
            s.assert(!1 !== r, "Array should have only unique elements, but has several", t), 
            e;
          },
          arrayAppendedElement: arrayAppendedElement,
          arrayAppendedElementOnce: arrayAppendedElementOnce,
          arrayAppendedElementOnceStrictly: function arrayAppendedElementOnceStrictly(e, t) {
            let r;
            return r = arrayAppendedElementOnce.apply(this, arguments), s.assert(!1 !== r, "Array should have only unique elements, but has several", t), 
            r;
          }
          //
          /**
* The arrayAppendArray() routine adds one or more elements to the end of the (dst) array
* and returns the new length of the array.
*
* It creates two variables the (result) - array and the (argument) - elements of array-like object (arguments[]),
* iterate over array-like object (arguments[]) and assigns to the (argument) each element,
* checks, if (argument) is equal to the 'undefined'.
* If true, it throws an Error.
* If (argument) is an array-like.
* If true, it merges the (argument) into the (result) array.
* Otherwise, it adds element to the result.
*
* @param { Array } dst - Initial array.
* @param {*} arguments[] - One or more argument(s) to add to the end of the (dst) array.
*
* @example
* // returns [ 1, 2, 'str', false, { a : 1 }, 42, 3, 7, 13 ];
* let arr = _.arrayAppendArray( [ 1, 2 ], 'str', false, { a : 1 }, 42, [ 3, 7, 13 ] );
*
* @returns { Array } - Returns an array (dst) with all of the following argument(s) that were added to the end of the (dst) array.
* @function arrayAppendArray
* @throws { Error } If the first argument is not an array.
* @throws { Error } If type of the argument is equal undefined.
* @memberof wTools
*/ ,
          arrayAppendArray: function arrayAppendArray(e, t) {
            return null === e && (e = [], arguments[0] = e), arrayAppendedArray.apply(this, arguments), 
            e;
          }
          //
          /**
 * The arrayAppendArrayOnce() routine returns an array of elements from (dst)
 * and appending only unique following arguments to the end.
 *
 * It creates two variables the (result) - array and the (argument) - elements of array-like object (arguments[]),
 * iterate over array-like object (arguments[]) and assigns to the (argument) each element,
 * checks, if (argument) is equal to the 'undefined'.
 * If true, it throws an Error.
 * if (argument) is an array-like.
 * If true, it iterate over array (argument) and checks if (result) has the same values as the (argument).
 * If false, it adds elements of (argument) to the end of the (result) array.
 * Otherwise, it checks if (result) has not the same values as the (argument).
 * If true, it adds elements to the end of the (result) array.
 *
 * @param { Array } dst - Initial array.
 * @param {*} arguments[] - One or more argument(s).
 *
 * @example
 * // returns [ 1, 2, 'str', {}, 5 ]
 * let arr = _.arrayAppendArrayOnce( [ 1, 2 ], 'str', 2, {}, [ 'str', 5 ] );
 *
 * @returns { Array } - Returns an array (dst) with only unique following argument(s) that were added to the end of the (dst) array.
 * @function arrayAppendArrayOnce
 * @throws { Error } If the first argument is not array.
 * @throws { Error } If type of the argument is equal undefined.
 * @memberof wTools
 */ ,
          arrayAppendArrayOnce: function arrayAppendArrayOnce(e, t, r, n) {
            return null === e && (e = [], arguments[0] = e), arrayAppendedArrayOnce.apply(this, arguments), 
            e;
          }
          //
          ,
          arrayAppendArrayOnceStrictly: function arrayAppendArrayOnceStrictly(e, t, r, n) {
            let l;
            return null === e && (e = [], arguments[0] = e), l = arrayAppendedArrayOnce.apply(this, arguments), 
            s.assert(l === t.length), e;
          },
          arrayAppendedArray: arrayAppendedArray,
          arrayAppendedArrayOnce: arrayAppendedArrayOnce,
          arrayAppendedArrayOnceStrictly: function arrayAppendedArrayOnceStrictly(e, t) {
            let r;
            return r = arrayAppendedArrayOnce.apply(this, arguments), s.assert(r === t.length, "Array should have only unique elements, but has several", t), 
            r;
          }
          //
          ,
          arrayAppendArrays: function arrayAppendArrays(e, t) {
            return null === e && (e = [], arguments[0] = e), void 0 === e ? (s.assert(2 === arguments.length), 
            t) : (s.arrayAppendedArrays.apply(this, arguments), e);
          }
          //
          ,
          arrayAppendArraysOnce: function arrayAppendArraysOnce(e, t, r, n) {
            if (null === e) e = [], arguments[0] = e; else if (void 0 === e) {
              if (!s.arrayIs(t)) return s.assert(2 <= arguments.length && arguments.length <= 4), 
              t;
              e = [], arguments[0] = e;
            }
            return arrayAppendedArraysOnce.apply(this, arguments), e;
          }
          //
          ,
          arrayAppendArraysOnceStrictly: function arrayAppendArraysOnceStrictly(e, t, r, n) {
            let l;
            null === e && (e = [], arguments[0] = e);
            {
              l = arrayAppendedArraysOnce.apply(this, arguments);
              let e = 0;
              for (let r = t.length - 1; r >= 0; r--) s.longIs(t[r]) ? e += t[r].length : e += 1;
              s.assert(l === e, "{-dstArray-} should have none element from {-insArray-}");
            }
            return e;
          }
          //
          ,
          arrayAppendedArrays: function arrayAppendedArrays(e, t) {
            s.assert(2 === arguments.length, "Expects exactly two arguments"), s.longIs(t) || void 0 === t || (t = [ t ]), 
            // if( !_.longIs( insArray ) )
            // {
            //   if( !_.arrayIs( dstArray ) )
            //   return [ dstArray, insArray ];
            //   else
            //   dstArray.push( insArray );
            //   return 1;
            // }
            // if( !_.arrayIs( insArray ) && insArray !== undefined )
            // insArray = [ insArray ];
            // if( !_.arrayIs( insArray ) && insArray !== undefined )
            // insArray = [ insArray ];
            s.assert(s.arrayIs(e), "Expects array"), s.assert(s.longIs(t), "Expects longIs entity");
            let r = 0;
            for (let n = 0, l = t.length; n < l; n++) s.longIs(t[n]) ? (e.push.apply(e, t[n]), 
            r += t[n].length) : (e.push(t[n]), r += 1);
            return r;
          },
          arrayAppendedArraysOnce: arrayAppendedArraysOnce,
          arrayAppendedArraysOnceStrictly: function arrayAppendedArraysOnceStrictly(e, t) {
            let r;
            {
              r = arrayAppendedArraysOnce.apply(this, arguments);
              let e = 0;
              for (let r = t.length - 1; r >= 0; r--) s.longIs(t[r]) ? e += t[r].length : e += 1;
              s.assert(r === e, "{-dstArray-} should have none element from {-insArray-}");
            }
            return r;
          }
          // --
          // array remove
          // --
          /**
 * ArrayRemove, arrayRemoveOnce, arrayRemoveOnceStrictly and arrayRemoved behave just like
 * arrayRemoveElement, arrayRemoveElementOnce, arrayRemoveElementOnceStrictly and arrayRemovedElement.
 */ ,
          // array remove
          arrayRemove: function arrayRemove(e, t, r, n) {
            return arrayRemoved.apply(this, arguments), e;
          }
          //
          ,
          arrayRemoveOnce: function arrayRemoveOnce(e, t, r, n) {
            return arrayRemovedOnce.apply(this, arguments), e;
          }
          //
          ,
          arrayRemoveOnceStrictly: function arrayRemoveOnceStrictly(e, t, r, n) {
            return arrayRemoveElementOnceStrictly.apply(this, arguments), e;
          },
          arrayRemoved: arrayRemoved,
          arrayRemovedOnce: arrayRemovedOnce,
          arrayRemovedOnceStrictly: function arrayRemovedOnceStrictly(e, t, r, n) {
            let l = s.arrayLeftIndex.apply(s, arguments);
            l >= 0 ? e.splice(l, 1) : s.assert(0, () => "Array does not have element " + s.toStrShort(t));
            let a = s.arrayLeftIndex.apply(s, arguments);
            return s.assert(a < 0, () => "The element " + s.toStrShort(t) + " is several times in dstArray"), 
            l;
          }
          //
          ,
          arrayRemoveElement: function arrayRemoveElement(e, t, r, n) {
            return arrayRemovedElement.apply(this, arguments), e;
          }
          //
          /**
 * The arrayRemoveElementOnce() routine removes the first matching element from (dstArray)
 * that corresponds to the condition in the callback function and returns a modified array.
 *
 * It takes two (dstArray, ins) or three (dstArray, ins, onEvaluate) arguments,
 * checks if arguments passed two, it calls the routine
 * [arrayRemovedElementOnce( dstArray, ins )]{@link wTools.arrayRemovedElementOnce}
 * Otherwise, if passed three arguments, it calls the routine
 * [arrayRemovedElementOnce( dstArray, ins, onEvaluate )]{@link wTools.arrayRemovedElementOnce}
 * @see  wTools.arrayRemovedElementOnce
 * @param { Array } dstArray - The source array.
 * @param { * } ins - The value to remove.
 * @param { wTools~compareCallback } [ onEvaluate ] - The callback that compares (ins) with elements of the array.
 * By default, it checks the equality of two arguments.
 *
 * @example
 * // returns [ 1, 2, 3, 'str' ]
 * let arr = _.arrayRemoveElementOnce( [ 1, 'str', 2, 3, 'str' ], 'str' );
 *
 * @example
 * // returns [ 3, 7, 13, 33 ]
 * let arr = _.arrayRemoveElementOnce( [ 3, 7, 33, 13, 33 ], 13, function( el, ins ) {
 *   return el > ins;
 * });
 *
 * @returns { Array } - Returns the modified (dstArray) array with the new length.
 * @function arrayRemoveElementOnce
 * @throws { Error } If the first argument is not an array.
 * @throws { Error } If passed less than two or more than three arguments.
 * @throws { Error } If the third argument is not a function.
 * @memberof wTools
 */ ,
          /* should remove all */
          arrayRemoveElementOnce: function arrayRemoveElementOnce(e, t, r, n) {
            return arrayRemovedElementOnce.apply(this, arguments), e;
          },
          arrayRemoveElementOnceStrictly: arrayRemoveElementOnceStrictly,
          arrayRemovedElement: arrayRemovedElement,
          arrayRemovedElementOnce: arrayRemovedElementOnce,
          arrayRemovedElementOnceStrictly: function arrayRemovedElementOnceStrictly(e, t, r, n) {
            let l, a = s.arrayLeftIndex.apply(s, arguments);
            return a >= 0 ? (l = e[a], e.splice(a, 1)) : s.assert(0, () => "Array does not have element " + s.toStrShort(t)), 
            a = s.arrayLeftIndex.apply(s, arguments), s.assert(a < 0, () => "The element " + s.toStrShort(t) + " is several times in dstArray"), 
            l;
          }
          /*
function arrayRemovedElementOnceStrictly( dstArray, ins, evaluator1, evaluator2 )
{

  let result;
  let index = _.arrayLeftIndex.apply( _, arguments );
  if( index >= 0 )
  {
    result = dstArray[ index ];
    dstArray.splice( index, 1 );
  }
  else _.assert( 0, () => 'Array does not have element ' + _.toStrShort( ins ) );

  return result;
}
*/
          //
          ,
          arrayRemoveArray: function arrayRemoveArray(e, t) {
            return arrayRemovedArray.apply(this, arguments), e;
          }
          //
          ,
          arrayRemoveArrayOnce: function arrayRemoveArrayOnce(e, t, r, n) {
            return arrayRemovedArrayOnce.apply(this, arguments), e;
          }
          //
          ,
          arrayRemoveArrayOnceStrictly: function arrayRemoveArrayOnceStrictly(e, t, r, n) {
            let l;
            {
              l = arrayRemovedArrayOnce.apply(this, arguments);
              let r = -1;
              for (let n = 0, l = t.length; n < l; n++) r = e.indexOf(t[n]), s.assert(r < 0);
              s.assert(l === t.length);
            }
            return e;
          },
          arrayRemovedArray: arrayRemovedArray,
          arrayRemovedArrayOnce: arrayRemovedArrayOnce,
          arrayRemovedArrayOnceStrictly: function arrayRemovedArrayOnceStrictly(e, t, r, n) {
            let l;
            {
              l = arrayRemovedArrayOnce.apply(this, arguments);
              let r = -1;
              for (let n = 0, l = t.length; n < l; n++) r = e.indexOf(t[n]), s.assert(r < 0);
              s.assert(l === t.length);
            }
            return l;
          }
          //
          ,
          arrayRemoveArrays: function arrayRemoveArrays(e, t) {
            return arrayRemovedArrays.apply(this, arguments), e;
          }
          //
          ,
          arrayRemoveArraysOnce: function arrayRemoveArraysOnce(e, t, r, n) {
            return arrayRemovedArraysOnce.apply(this, arguments), e;
          }
          //
          ,
          arrayRemoveArraysOnceStrictly: function arrayRemoveArraysOnceStrictly(e, t, r, n) {
            let l;
            {
              l = arrayRemovedArraysOnce.apply(this, arguments);
              let e = 0;
              for (let r = t.length - 1; r >= 0; r--) s.longIs(t[r]) ? e += t[r].length : e += 1;
              s.assert(l === e), s.assert(0 === arrayRemovedArraysOnce.apply(this, arguments));
            }
            return e;
          },
          arrayRemovedArrays: arrayRemovedArrays,
          arrayRemovedArraysOnce: arrayRemovedArraysOnce,
          arrayRemovedArraysOnceStrictly: function arrayRemovedArraysOnceStrictly(e, t, r, n) {
            let l;
            {
              l = arrayRemovedArraysOnce.apply(this, arguments);
              let e = 0;
              for (let r = t.length - 1; r >= 0; r--) s.longIs(t[r]) ? e += t[r].length : e += 1;
              s.assert(l === e), s.assert(0 === arrayRemovedArraysOnce.apply(this, arguments));
            }
            return l;
          }
          //
          /**
 * Callback for compare two value.
 *
 * @callback arrayRemoveAll~compareCallback
 * @param { * } el - Element of the array.
 * @param { * } ins - Value to compare.
 */
          /**
 * The arrayRemoveAll() routine removes all (ins) values from (dstArray)
 * that corresponds to the condition in the callback function and returns the modified array.
 *
 * It takes two (dstArray, ins) or three (dstArray, ins, onEvaluate) arguments,
 * checks if arguments passed two, it calls the routine
 * [arrayRemovedElement( dstArray, ins )]{@link wTools.arrayRemovedElement}
 * Otherwise, if passed three arguments, it calls the routine
 * [arrayRemovedElement( dstArray, ins, onEvaluate )]{@link wTools.arrayRemovedElement}
 *
 * @see wTools.arrayRemovedElement
 *
 * @param { Array } dstArray - The source array.
 * @param { * } ins - The value to remove.
 * @param { wTools~compareCallback } [ onEvaluate ] - The callback that compares (ins) with elements of the array.
 * By default, it checks the equality of two arguments.
 *
 * @example
 * // returns [ 2, 2, 3, 5 ]
 * let arr = _.arrayRemoveAll( [ 1, 2, 2, 3, 5 ], 2, function( el, ins ) {
 *   return el < ins;
 * });
 *
 * @example
 * // returns [ 1, 3, 5 ]
 * let arr = _.arrayRemoveAll( [ 1, 2, 2, 3, 5 ], 2 );
 *
 * @returns { Array } - Returns the modified (dstArray) array with the new length.
 * @function arrayRemoveAll
 * @throws { Error } If the first argument is not an array-like.
 * @throws { Error } If passed less than two or more than three arguments.
 * @throws { Error } If the third argument is not a function.
 * @memberof wTools
 */
          // function arrayRemoveAll( dstArray, ins, evaluator1, evaluator2 )
          // {
          //   arrayRemovedAll.apply( this, arguments );
          //   return dstArray;
          // }
          //
          // //
          //
          // function arrayRemovedAll( dstArray, ins, evaluator1, evaluator2  )
          // {
          //   let index = _.arrayLeftIndex.apply( _, arguments );
          //   let result = 0;
          //
          //   while( index >= 0 )
          //   {
          //     dstArray.splice( index, 1 );
          //     result += 1;
          //     index = _.arrayLeftIndex.apply( _, arguments );
          //   }
          //
          //   return result;
          // }
          //
          /**
 * The arrayRemoveDuplicates( dstArray, evaluator ) routine returns the dstArray with the duplicated elements removed.
 *
 * @param { ArrayIs } dstArray - The source and destination array.
 * @param { Function } [ evaluator = function( e ) { return e } ] - A callback function.
 *
 * @example
 * // returns [ 1, 2, 'abc', 4, true ]
 * _.arrayRemoveDuplicates( [ 1, 1, 2, 'abc', 'abc', 4, true, true ] );
 *
 * @example
 * // [ 1, 2, 3, 4, 5 ]
 * _.arrayRemoveDuplicates( [ 1, 2, 3, 4, 5 ] );
 *
 * @returns { Number } - Returns the source array without the duplicated elements.
 * @function arrayRemoveDuplicates
 * @throws { Error } If passed arguments is less than one or more than two.
 * @throws { Error } If the first argument is not an array.
 * @throws { Error } If the second argument is not a Function.
 * @memberof wTools
 */ ,
          // arrayRemoveAll,
          // arrayRemovedAll,
          arrayRemoveDuplicates: function arrayRemoveDuplicates(e, t) {
            s.assert(1 <= arguments.length || arguments.length <= 2), s.assert(s.arrayIs(e), "Expects Array");
            for (let r = 0; r < e.length; r++) {
              let n;
              do {
                (n = s.arrayRightIndex(e, e[r], t)) !== r && e.splice(n, 1);
              } while (n !== r);
            }
            return e;
          }
          /* qqq : use do .. while instead */
          /*
function arrayRemoveDuplicates( dstArray, evaluator )
{
  _.assert( 1 <= arguments.length || arguments.length <= 2 );
  _.assert( _.arrayIs( dstArray ), 'arrayRemoveDuplicates :', 'Expects Array' );

  for( let i1 = 0 ; i1 < dstArray.length ; i1++ )
  {
    let element1 = dstArray[ i1 ];
    let index = _.arrayRightIndex( dstArray, element1, evaluator );

    while ( index !== i1 )
    {
      dstArray.splice( index, 1 );
      index = _.arrayRightIndex( dstArray, element1, evaluator );
    }
  }

  return dstArray;
}
*/
          // --
          // array flatten
          // --
          /**
 * The arrayFlatten() routine returns an array that contains all the passed arguments.
 *
 * It creates two variables the (result) - array and the {-srcMap-} - elements of array-like object (arguments[]),
 * iterate over array-like object (arguments[]) and assigns to the {-srcMap-} each element,
 * checks if {-srcMap-} is not equal to the 'undefined'.
 * If true, it adds element to the result.
 * If {-srcMap-} is an Array and if element(s) of the {-srcMap-} is not equal to the 'undefined'.
 * If true, it adds to the (result) each element of the {-srcMap-} array.
 * Otherwise, if {-srcMap-} is an Array and if element(s) of the {-srcMap-} is equal to the 'undefined' it throws an Error.
 *
 * @param {...*} arguments - One or more argument(s).
 *
 * @example
 * // returns [ 'str', {}, 1, 2, 5, true ]
 * let arr = _.arrayFlatten( 'str', {}, [ 1, 2 ], 5, true );
 *
 * @returns { Array } - Returns an array of the passed argument(s).
 * @function arrayFlatten
 * @throws { Error } If (arguments[...]) is an Array and has an 'undefined' element.
 * @memberof wTools
 */ ,
          // array flatten
          arrayFlatten: function arrayFlatten(e, t) {
            return null === e && (e = [], arguments[0] = e), arrayFlattened.apply(this, arguments), 
            e;
          }
          //
          ,
          arrayFlattenOnce: function arrayFlattenOnce(e, t, r, n) {
            return null === e && (e = [], arguments[0] = e), arrayFlattenedOnce.apply(this, arguments), 
            e;
          }
          //
          ,
          arrayFlattenOnceStrictly: function arrayFlattenOnceStrictly(e, t, r, n) {
            return arrayFlattenedOnceStrictly.apply(this, arguments), e;
          },
          arrayFlattened: arrayFlattened,
          arrayFlattenedOnce: arrayFlattenedOnce,
          arrayFlattenedOnceStrictly: arrayFlattenedOnceStrictly,
          arrayFlattenDefined: function arrayFlattenDefined(e, t) {
            return null === e && (e = [], arguments[0] = e), arrayFlattenedDefined.apply(this, arguments), 
            e;
          }
          //
          ,
          arrayFlattenDefinedOnce: function arrayFlattenDefinedOnce(e, t, r, n) {
            return null === e && (e = [], arguments[0] = e), arrayFlattenedDefinedOnce.apply(this, arguments), 
            e;
          }
          //
          ,
          arrayFlattenDefinedOnceStrictly: function arrayFlattenDefinedOnceStrictly(e, t, r, n) {
            return arrayFlattenedDefinedOnceStrictly.apply(this, arguments), e;
          },
          arrayFlattenedDefined: arrayFlattenedDefined,
          arrayFlattenedDefinedOnce: arrayFlattenedDefinedOnce,
          arrayFlattenedDefinedOnceStrictly: arrayFlattenedDefinedOnceStrictly,
          // array replace
          arrayReplace: function arrayReplace(e, t, r, n, l) {
            s.assert(3 <= arguments.length && arguments.length <= 5);
            let a = -1, i = 0;
            for (a = s.arrayLeftIndex(e, t, n, l); -1 !== a; ) e.splice(a, 1, r), i += 1, a = s.arrayLeftIndex(e, t, n, l);
            return e;
          }
          /**
 * The arrayReplaceOnce() routine returns the index of the (dstArray) array which will be replaced by (sub),
 * if (dstArray) has the value (ins).
 *
 * It takes three arguments (dstArray, ins, sub), calls built in function(dstArray.indexOf(ins)),
 * that looking for value (ins) in the (dstArray).
 * If true, it replaces (ins) value of (dstArray) by (sub) and returns the index of the (ins).
 * Otherwise, it returns (-1) index.
 *
 * @param { Array } dstArray - The source array.
 * @param { * } ins - The value to find.
 * @param { * } sub - The value to replace.
 *
 * @example
 * // returns -1
 * _.arrayReplaceOnce( [ 2, 4, 6, 8, 10 ], 12, 14 );
 *
 * @example
 * // returns 1
 * _.arrayReplaceOnce( [ 1, undefined, 3, 4, 5 ], undefined, 2 );
 *
 * @example
 * // returns 3
 * _.arrayReplaceOnce( [ 'Petre', 'Mikle', 'Oleg', 'Dmitry' ], 'Dmitry', 'Bob' );
 *
 * @example
 * // returns 4
 * _.arrayReplaceOnce( [ true, true, true, true, false ], false, true );
 *
 * @returns { number }  Returns the index of the (dstArray) array which will be replaced by (sub),
 * if (dstArray) has the value (ins).
 * @function arrayReplaceOnce
 * @throws { Error } Will throw an Error if (dstArray) is not an array.
 * @throws { Error } Will throw an Error if (arguments.length) is less than three.
 * @memberof wTools
 */ ,
          arrayReplaceOnce: function arrayReplaceOnce(e, t, r, n, s) {
            return arrayReplacedOnce.apply(this, arguments), e;
          }
          //
          ,
          arrayReplaceOnceStrictly: function arrayReplaceOnceStrictly(e, t, r, n, l) {
            let a;
            return a = arrayReplacedOnce.apply(this, arguments), s.assert(a >= 0, () => "Array does not have element " + s.toStrShort(t)), 
            a = arrayReplacedOnce.apply(this, arguments), s.assert(a < 0, () => "The element " + s.toStrShort(t) + "is several times in dstArray"), 
            e;
          }
          /*
function arrayReplaceOnceStrictly( dstArray, ins, sub, evaluator1, evaluator2 )
{
  let result = arrayReplacedOnce.apply( this, arguments );
  _.assert( result >= 0, () => 'Array does not have element ' + _.toStrShort( ins ) );
  return dstArray;
}
*/
          //
          ,
          arrayReplaced: function arrayReplaced(e, t, r, n, l) {
            s.assert(3 <= arguments.length && arguments.length <= 5);
            let a = -1, i = 0;
            for (a = s.arrayLeftIndex(e, t, n, l); -1 !== a; ) e.splice(a, 1, r), i += 1, a = s.arrayLeftIndex(e, t, n, l);
            return i;
          },
          arrayReplacedOnce: arrayReplacedOnce,
          arrayReplacedOnceStrictly: function arrayReplacedOnceStrictly(e, t, r, n, l) {
            let a;
            {
              a = arrayReplacedOnce.apply(this, arguments), s.assert(a >= 0, () => "Array does not have element " + s.toStrShort(t));
              let e = arrayReplacedOnce.apply(this, arguments);
              s.assert(e < 0, () => "The element " + s.toStrShort(t) + "is several times in dstArray");
            }
            return a;
          }
          //
          ,
          /* qqq implement */
          arrayReplaceElement: function arrayReplaceElement(e, t, r, n, l) {
            s.assert(3 <= arguments.length && arguments.length <= 5);
            let a = -1, i = 0;
            for (a = s.arrayLeftIndex(e, t, n, l); -1 !== a; ) e.splice(a, 1, r), i += 1, a = s.arrayLeftIndex(e, t, n, l);
            return e;
          }
          //
          ,
          arrayReplaceElementOnce: function arrayReplaceElementOnce(e, t, r, n, s) {
            return arrayReplacedElementOnce.apply(this, arguments), e;
          }
          //
          ,
          arrayReplaceElementOnceStrictly: function arrayReplaceElementOnceStrictly(e, t, r, n, l) {
            let a;
            return a = arrayReplacedElementOnce.apply(this, arguments), s.assert(void 0 !== a, () => "Array does not have element " + s.toStrShort(t)), 
            a = arrayReplacedElementOnce.apply(this, arguments), s.assert(void 0 === a, () => "The element " + s.toStrShort(t) + "is several times in dstArray"), 
            e;
          }
          //
          ,
          arrayReplacedElement: function arrayReplacedElement(e, t, r, n, l) {
            s.assert(3 <= arguments.length && arguments.length <= 5);
            let a = -1, i = 0;
            for (a = s.arrayLeftIndex(e, t, n, l); -1 !== a; ) e.splice(a, 1, r), i += 1, a = s.arrayLeftIndex(e, t, n, l);
            return i;
          },
          arrayReplacedElementOnce: arrayReplacedElementOnce,
          arrayReplacedElementOnceStrictly: function arrayReplacedElementOnceStrictly(e, t, r, n, l) {
            let a;
            {
              a = arrayReplacedElementOnce.apply(this, arguments), s.assert(void 0 !== a, () => "Array does not have element " + s.toStrShort(t));
              let e = arrayReplacedElementOnce.apply(this, arguments);
              s.assert(void 0 === e, () => "The element " + s.toStrShort(t) + "is several times in dstArray");
            }
            return a;
          }
          /*
function arrayReplacedOnceStrictly( dstArray, ins, sub, evaluator1, evaluator2 )
{
  let result = arrayReplacedOnce.apply( this, arguments );
  _.assert( result >= 0, () => 'Array does not have element ' + _.toStrShort( ins ) );
  return result;
}
*/
          //
          ,
          arrayReplaceArray: function arrayReplaceArray(e, t, r, n, s) {
            return arrayReplacedArray.apply(this, arguments), e;
          }
          //
          ,
          arrayReplaceArrayOnce: function arrayReplaceArrayOnce(e, t, r, n, s) {
            return arrayReplacedArrayOnce.apply(this, arguments), e;
          }
          //
          ,
          arrayReplaceArrayOnceStrictly: function arrayReplaceArrayOnceStrictly(e, t, r, n, l) {
            let a;
            {
              a = arrayReplacedArrayOnce.apply(this, arguments), s.assert(a === t.length, "{-dstArray-} should have each element of {-insArray-}"), 
              s.assert(t.length === r.length, "{-subArray-} should have the same length {-insArray-} has");
              let e = arrayReplacedArrayOnce.apply(this, arguments);
              s.assert(0 === e, () => "The element " + s.toStrShort(t) + "is several times in dstArray");
            }
            return e;
          },
          arrayReplacedArray: arrayReplacedArray,
          arrayReplacedArrayOnce: arrayReplacedArrayOnce,
          arrayReplacedArrayOnceStrictly: function arrayReplacedArrayOnceStrictly(e, t, r, n, l) {
            let a;
            {
              a = arrayReplacedArrayOnce.apply(this, arguments), s.assert(a === t.length, "{-dstArray-} should have each element of {-insArray-}"), 
              s.assert(t.length === r.length, "{-subArray-} should have the same length {-insArray-} has");
              let e = arrayReplacedArrayOnce.apply(this, arguments);
              s.assert(0 === e, () => "One element of " + s.toStrShort(t) + "is several times in dstArray");
            }
            return a;
          }
          //
          ,
          arrayReplaceArrays: function arrayReplaceArrays(e, t, r, n, s) {
            return arrayReplacedArrays.apply(this, arguments), e;
          }
          //
          ,
          arrayReplaceArraysOnce: function arrayReplaceArraysOnce(e, t, r, n, s) {
            return arrayReplacedArraysOnce.apply(this, arguments), e;
          }
          //
          ,
          arrayReplaceArraysOnceStrictly: function arrayReplaceArraysOnceStrictly(e, t, r, n, l) {
            let a;
            {
              a = arrayReplacedArraysOnce.apply(this, arguments);
              let e = 0;
              for (let r = t.length - 1; r >= 0; r--) s.longIs(t[r]) ? e += t[r].length : e += 1;
              s.assert(a === e, "{-dstArray-} should have each element of {-insArray-}"), s.assert(t.length === r.length, "{-subArray-} should have the same length {-insArray-} has");
              let n = arrayReplacedArrayOnce.apply(this, arguments);
              s.assert(0 === n, () => "One element of " + s.toStrShort(t) + "is several times in dstArray");
            }
            return e;
          },
          arrayReplacedArrays: arrayReplacedArrays,
          arrayReplacedArraysOnce: arrayReplacedArraysOnce,
          arrayReplacedArraysOnceStrictly: function arrayReplacedArraysOnceStrictly(e, t, r, n, l) {
            let a;
            {
              a = arrayReplacedArraysOnce.apply(this, arguments);
              let e = 0;
              for (let r = t.length - 1; r >= 0; r--) s.longIs(t[r]) ? e += t[r].length : e += 1;
              s.assert(a === e, "{-dstArray-} should have each element of {-insArray-}"), s.assert(t.length === r.length, "{-subArray-} should have the same length {-insArray-} has");
              let n = arrayReplacedArrayOnce.apply(this, arguments);
              s.assert(0 === n, () => "The element " + s.toStrShort(t) + "is several times in dstArray");
            }
            return a;
          }
          // //
          //
          // function arrayReplaceAll( dstArray, ins, sub, evaluator1, evaluator2 )
          // {
          //   arrayReplacedAll.apply( this, arguments );
          //   return dstArray;
          // }
          //
          // //
          //
          // function arrayReplacedAll( dstArray, ins, sub, evaluator1, evaluator2 )
          // {
          //   _.assert( 3 <= arguments.length && arguments.length <= 5 );
          //
          //   let index = -1;
          //   let result = 0;
          //
          //   index = _.arrayLeftIndex( dstArray, ins, evaluator1, evaluator2 );
          //
          //   while( index !== -1 )
          //   {
          //     dstArray.splice( index, 1, sub );
          //     result += 1;
          //     index = _.arrayLeftIndex( dstArray, ins, evaluator1, evaluator2 );
          //   }
          //
          //   return result;
          // }
          //
          /**
 * The arrayUpdate() routine adds a value (sub) to an array (dstArray) or replaces a value (ins) of the array (dstArray) by (sub),
 * and returns the last added index or the last replaced index of the array (dstArray).
 *
 * It creates the variable (index) assigns and calls to it the function(arrayReplaceOnce( dstArray, ins, sub ).
 * [arrayReplaceOnce( dstArray, ins, sub )]{@link wTools.arrayReplaceOnce}.
 * Checks if (index) equal to the -1.
 * If true, it adds to an array (dstArray) a value (sub), and returns the last added index of the array (dstArray).
 * Otherwise, it returns the replaced (index).
 *
 * @see wTools.arrayReplaceOnce
 *
 * @param { Array } dstArray - The source array.
 * @param { * } ins - The value to change.
 * @param { * } sub - The value to add or replace.
 *
 * @example
 * // returns 3
 * let add = _.arrayUpdate( [ 'Petre', 'Mikle', 'Oleg' ], 'Dmitry', 'Dmitry' );
 * console.log( add ) = > [ 'Petre', 'Mikle', 'Oleg', 'Dmitry' ];
 *
 * @example
 * // returns 5
 * let add = _.arrayUpdate( [ 1, 2, 3, 4, 5 ], 6, 6 );
 * console.log( add ) => [ 1, 2, 3, 4, 5, 6 ];
 *
 * @example
 * // returns 4
 * let replace = _.arrayUpdate( [ true, true, true, true, false ], false, true );
 * console.log( replace ) => [ true, true true, true, true ];
 *
 * @returns { number } Returns the last added or the last replaced index.
 * @function arrayUpdate
 * @throws { Error } Will throw an Error if (dstArray) is not an array-like.
 * @throws { Error } Will throw an Error if (arguments.length) is less or more than three.
 * @memberof wTools
 */ ,
          // arrayReplaceAll, // use arrayReplaceElement instead
          // arrayReplacedAll, // use arrayReplacedElement instead
          arrayUpdate: function arrayUpdate(e, t, r, n, s) {
            let l = arrayReplacedOnce.apply(this, arguments);
            return -1 === l && (e.push(r), l = e.length - 1), l;
          }
          // --
          // fields
          // --
          // let unrollSymbol = Symbol.for( 'unroll' );
                };
        //
        Object.assign(l, i), Object.assign(l, a), 
        // --
        // export
        // --
        void 0 !== n && null !== n && (n.exports = l);
      }();
    });
    n.include, n.include;
  }(), // == end of file fLong_s
  function fMap_s() {
    let t = _starter_._pathResolve(e, "dwtools/abase/l0/fMap.s"), r = _starter_._pathResolve(e, "dwtools/abase/l0/"), n = _starter_._fileCreate(t, r, // == begin of file fMap_s
    function fMap_s_naked() {
      !function _fMap_s_() {
        "use strict";
        //
        /**
 * The mapIs() routine determines whether the passed value is an Object,
 * and not inherits through the prototype chain.
 *
 * If the {-srcMap-} is an Object, true is returned,
 * otherwise false is.
 *
 * @param { * } src - Entity to check.
 *
 * @example
 * // returns true
 * mapIs( { a : 7, b : 13 } );
 *
 * @example
 * // returns false
 * mapIs( 13 );
 *
 * @example
 * // returns false
 * mapIs( [ 3, 7, 13 ] );
 *
 * @returns { Boolean } Returns true if {-srcMap-} is an Object, and not inherits through the prototype chain.
 * @function mapIs
 * @memberof wTools
 */
        function mapIs(t) {
          if (!e.objectIs(t)) return !1;
          let r = Object.getPrototypeOf(t);
          return !(null !== r && (r.constructor && "Object" !== r.constructor.name || null !== Object.getPrototypeOf(r) && (e.assert(null === r || !!r, "unexpected"), 
          1)));
        }
        //
                //
        /**
 * Short-cut for _mapSatisfy() routine.
 * Checks if object( o.src ) has at least one key/value pair that is represented in( o.template ).
 * Also works with ( o.template ) as routine that check( o.src ) with own rules.
 * @param {wTools.mapSatisfyOptions} o - Default options {@link wTools.mapSatisfyOptions}.
 * @returns { boolean } Returns true if( o.src ) has same key/value pair(s) with( o.template )
 * or result if ( o.template ) routine call is true.
 *
 * @example
 * //returns true
 * _.mapSatisfy( {a : 1, b : 1, c : 1 }, { a : 1, b : 2 } );
 *
 * @example
 * //returns true
 * _.mapSatisfy( { template : {a : 1, b : 1, c : 1 }, src : { a : 1, b : 2 } } );
 *
 * @example
 * //returns false
 * function routine( src ){ return src.a === 12 }
 * _.mapSatisfy( { template : routine, src : { a : 1, b : 2 } } );
 *
 * @function mapSatisfy
 * @throws {exception} If( arguments.length ) is not equal to 1 or 2.
 * @throws {exception} If( o.template ) is not a Object.
 * @throws {exception} If( o.template ) is not a Routine.
 * @throws {exception} If( o.src ) is undefined.
 * @memberof wTools
*/
        function mapSatisfy(t) {
          return 2 === arguments.length && (t = {
            template: arguments[0],
            src: arguments[1]
          }), e.assert(1 === arguments.length || 2 === arguments.length), e.assert(e.objectIs(t.template) || e.routineIs(t.template)), 
          e.assert(void 0 !== t.src), e.routineOptions(mapSatisfy, t), _mapSatisfy(t.template, t.src, t.src, t.levels);
        }
        //
        /**
 * Default options for _mapSatisfy() routine.
 * @typedef {object} wTools.mapSatisfyOptions
 * @property {object|function} [ template=null ] - Map to compare with( src ) or routine that checks each value of( src ).
 * @property {object} [ src=null ] - Source map.
 * @property {number} [ levels=256 ] - Number of levels in map structure.
 *
*/
        /**
 * Checks if object( src ) has at least one key/value pair that is represented in( template ).
 * Returns true if( template ) has one or more indentical key/value pair with( src ).
 * If( template ) is provided as routine, routine uses it to check( src ).
 * @param {wTools.mapSatisfyOptions} args - Arguments list {@link wTools.mapSatisfyOptions}.
 * @returns { boolean } Returns true if( src ) has same key/value pair(s) with( template ).
 *
 * @example
 * //returns true
 * _._mapSatisfy( {a : 1, b : 1, c : 1 }, { a : 1, b : 2 } );
 *
 * @example
 * //returns false
 * _._mapSatisfy( {a : 1, b : 1, c : 1 }, { y : 1 , j : 1 } );
 *
 * @example
 * //returns true
 * function template( src ){ return src.y === 1 }
 * _._mapSatisfy( template, { y : 1 , j : 1 } );
 *
 * @function _mapSatisfy
 * @memberof wTools
*/
        function _mapSatisfy(t, r, n, s) {
          if (t === r) return !0;
          if (0 === s) return e.objectIs(t) && e.objectIs(r) && e.routineIs(t.identicalWith) && r.identicalWith === t.identicalWith ? t.identicalWith(r) : t === r;
          if (s < 0) return !1;
          if (e.routineIs(t)) return t(r);
          if (!e.objectIs(r)) return !1;
          if (e.objectIs(t)) {
            for (let e in t) {
              let l = !1;
              if (!(l = _mapSatisfy(t[e], r[e], n, s - 1))) return !1;
            }
            return !0;
          }
          debugger;
          return !1;
        }
        //
                function mapHasKey(e, t) {
          return !!e && "object" == typeof e && !!Reflect.has(e, t);
        }
        // //
        //
        // function mapHasKey( object, key )
        // {
        //
        //   _.assert( arguments.length === 2, 'Expects exactly two arguments' );
        //
        //   if( _.strIs( key ) )
        //   return ( key in object );
        //   else if( _.mapIs( key ) )
        //   return ( _.nameUnfielded( key ).coded in object );
        //   else if( _.symbolIs( key ) )
        //   return ( key in object );
        //
        //   _.assert( 0, 'mapHasKey :', 'unknown type of key :', _.strType( key ) );
        // }
        //
        /**
 * The mapOwnKey() returns true if (object) has own property.
 *
 * It takes (name) checks if (name) is a String,
 * if (object) has own property with the (name).
 * If true, it returns true.
 *
 * @param { Object } object - Object that will be check.
 * @param { name } name - Target property.
 *
 * @example
 * // returns true
 * _.mapOwnKey( { a : 7, b : 13 }, 'a' );
 *
 * @example
 * // returns false
 * _.mapOwnKey( { a : 7, b : 13 }, 'c' );
 *
 * @returns { boolean } Returns true if (object) has own property.
 * @function mapOwnKey
 * @throws { mapOwnKey } Will throw an error if the (name) is unknown.
 * @memberof wTools
 */
        //
                //
        /**
 * @callback mapCloneAssigning.onField
 * @param { objectLike } dstContainer - destination object.
 * @param { objectLike } srcContainer - source object.
 * @param { string } key - key to coping from one object to another.
 * @param { function } onField - handler of fields.
 */
        /**
 * The mapCloneAssigning() routine is used to clone the values of all
 * enumerable own properties from {-srcMap-} object to an (options.dst) object.
 *
 * It creates two variables:
 * let options = options || {}, result = options.dst || {}.
 * Iterate over {-srcMap-} object, checks if {-srcMap-} object has own properties.
 * If true, it calls the provided callback function( options.onField( result, srcMap, k ) ) for each key (k),
 * and copies each [ key, value ] of the {-srcMap-} to the (result),
 * and after cycle, returns clone with prototype of srcMap.
 *
 * @param { objectLike } srcMap - The source object.
 * @param { Object } o - The options.
 * @param { objectLike } [options.dst = Object.create( null )] - The target object.
 * @param { mapCloneAssigning.onField } [options.onField()] - The callback function to copy each [ key, value ]
 * of the {-srcMap-} to the (result).
 *
 * @example
 * // returns Example { sex : 'Male', name : 'Peter', age : 27 }
 * function Example() {
 *   this.name = 'Peter';
 *   this.age = 27;
 * }
 * mapCloneAssigning( new Example(), { dst : { sex : 'Male' } } );
 *
 * @returns { objectLike }  The (result) object gets returned.
 * @function mapCloneAssigning
 * @throws { Error } Will throw an Error if ( o ) is not an Object,
 * if ( arguments.length > 2 ), if (key) is not a String or
 * if {-srcMap-} has not own properties.
 * @memberof wTools
 */
        function mapCloneAssigning(t) {
          t.dstMap = t.dstMap || Object.create(null), e.assert(e.mapIs(t)), e.assert(1 === arguments.length, "mapCloneAssigning :", "Expects {-srcMap-} as argument"), 
          e.assert(e.objectLike(t.srcMap), "mapCloneAssigning :", "Expects {-srcMap-} as argument"), 
          e.routineOptions(mapCloneAssigning, t), t.onField || (t.onField = function onField(t, r, n) {
            e.assert(e.strIs(n)), t[n] = r[n];
          });
          for (let e in t.srcMap) r.call(t.srcMap, e) && t.onField(t.dstMap, t.srcMap, e, t.onField);
          return Object.setPrototypeOf(t.dstMap, Object.getPrototypeOf(t.srcMap)), t.dstMap;
        }
        //
        function _filterTrue() {
          return !0;
        }
        function _filterFalse() {
          return !0;
        }
        //
        function _mapExtendRecursiveConditional(t, r, n) {
          e.assert(e.mapIs(n));
          for (let s in n) e.mapIs(n[s]) ? !0 === t.onUpFilter(r, n, s) && (e.objectIs(r[s]) || (r[s] = Object.create(null)), 
          _mapExtendRecursiveConditional(t, r[s], n[s])) : !0 === t.onField(r, n, s) && (r[s] = n[s]);
        }
        //
                //
        function _mapExtendRecursive(t, r) {
          e.assert(e.objectIs(r));
          for (let n in r) e.objectIs(r[n]) ? (e.objectIs(t[n]) || (t[n] = Object.create(null)), 
          _mapExtendRecursive(t[n], r[n])) : t[n] = r[n];
        }
        //
                // --
        // map manipulator
        // --
        /*
  qqq : add test
  Dmytro : tests is added
  qqq : reflect update in tests
*/
        function mapSetWithKeys(t, r, n) {
          function set(e, t, r) {
            void 0 === r ? delete e[t] : e[t] = r;
          }
          if (null === t && (t = Object.create(null)), e.assert(e.objectIs(t)), e.assert(e.arrayIs(r) || e.strIs(r)), 
          e.assert(3 === arguments.length, "Expects exactly three arguments"), e.arrayIs(r)) for (let e = 0; e < r.length; e++) set(t, r[e], n); else set(t, r, n);
          return t;
        }
        //
        /* qqq : add test */        
        // --
        // map getter
        // --
        function mapInvert(r, n) {
          let s, l = this === t ? Object.create(null) : this;
          r && (l.src = r), n && (l.dst = n), e.routineOptions(mapInvert, l), l.dst = l.dst || Object.create(null), 
          e.assert(1 === arguments.length || 2 === arguments.length), e.assert(e.objectLike(l.src)), 
          "delete" === l.duplicate && (s = Object.create(null))
          /* */;
          for (let t in l.src) {
            let r = l.src[t];
            "delete" !== l.duplicate || void 0 === l.dst[r] ? "array" === l.duplicate || "array-with-value" === l.duplicate ? (void 0 === l.dst[r] && (l.dst[r] = "array-with-value" === l.duplicate ? [ r ] : []), 
            l.dst[r].push(t)) : (e.assert(void 0 === l.dst[r], "Cant invert the map, it has several keys with value", l.src[t]), 
            l.dst[r] = t) : s[r] = t;
          }
          /* */          return "delete" === l.duplicate && e.mapDelete(l.dst, s), l.dst;
        }
        //
        function mapsFlatten(t) {
          return e.arrayIs(t) && (t = {
            src: t
          }), e.routineOptions(mapsFlatten, t), e.assert(1 === arguments.length, "Expects single argument"), 
          e.assert(!1 === t.delimeter || 0 === t.delimeter || e.strIs(t.delimeter)), e.assert(e.arrayLike(t.src) || e.mapLike(t.src)), 
          t.dst = t.dst || Object.create(null), 
          /* */
          function extend(r, n) {
            if (e.arrayLike(r)) for (let e = 0; e < r.length; e++) extend(r[e], n); else if (e.mapLike(r)) for (let s in r) {
              let l = s;
              e.strIs(t.delimeter) && (l = (n ? n + t.delimeter : "") + s), e.mapIs(r[s]) ? extend(r[s], l) : (e.assert(!!t.allowingCollision || void 0 === t.dst[l]), 
              t.dst[l] = r[s]);
            } else e.assert(0, "Expects map or array of maps, but got " + e.strType(r));
          }(t.src, ""), t.dst;
        }
        //
        /**
 * The mapToStr() routine converts and returns the passed object {-srcMap-} to the string.
 *
 * It takes an object and two strings (keyValSep) and (tupleSep),
 * checks if (keyValSep and tupleSep) are strings.
 * If false, it assigns them defaults ( ' : ' ) to the (keyValSep) and
 * ( '; ' ) to the tupleSep.
 * Otherwise, it returns a string representing the passed object {-srcMap-}.
 *
 * @param { objectLike } src - The object to convert to the string.
 * @param { string } [ keyValSep = ' : ' ] keyValSep - colon.
 * @param { string } [ tupleSep = '; ' ] tupleSep - semicolon.
 *
 * @example
 * // returns 'a : 1; b : 2; c : 3; d : 4'
 * _.mapToStr( { a : 1, b : 2, c : 3, d : 4 }, ' : ', '; ' );
 *
 * @example
 * // returns '0 : 1; 1 : 2; 2 : 3';
 * _.mapToStr( [ 1, 2, 3 ], ' : ', '; ' );
 *
 * @example
 * // returns '0 : a; 1 : b; 2 : c';
 * _.mapToStr( 'abc', ' : ', '; ' );
 *
 * @returns { string } Returns a string (result) representing the passed object {-srcMap-}.
 * @function mapToStr
 * @memberof wTools
 */
        function mapToStr(t) {
          e.strIs(t) && (t = {
            src: t
          }), e.routineOptions(mapToStr, t), e.assert(1 === arguments.length, "Expects single argument");
          let r = "";
          for (let e in t.src) r += e + t.keyValDelimeter + t.src[e] + t.entryDelimeter;
          return r.substr(0, r.length - t.entryDelimeter.length);
        }
        //
        function _mapKeys(t) {
          /* */
          function filter(n, s) {
            if (t.selectFilter) for (let l = 0; l < s.length; l++) {
              let a = t.selectFilter(n, s[l]);
              void 0 !== a && e.arrayAppendOnce(r, a);
            } else e.arrayAppendArrayOnce(r, s);
          }
          /* */          let r = [];
          if (e.routineOptions(_mapKeys, t), e.assert(1 === arguments.length, "Expects single argument"), 
          e.assert(e.objectLike(t)), e.assert(!(t.srcMap instanceof Map), "not implemented"), 
          e.assert(null === t.selectFilter || e.routineIs(t.selectFilter)), t.enumerable) filter(t.srcMap, e._mapEnumerableKeys(t.srcMap, t.own)); else if (t.own) filter(t.srcMap, Object.getOwnPropertyNames(t.srcMap)); else {
            let e = t.srcMap;
            r = [];
            do {
              filter(e, Object.getOwnPropertyNames(e)), e = Object.getPrototypeOf(e);
            } while (e);
          }
          /* */          return r;
        }
        //
        /**
 * This routine returns an array of a given objects enumerable properties,
 * in the same order as that provided by a for...in loop.
 * Accept single object. Each element of result array is unique.
 * Unlike standard [Object.keys]{@https://developer.mozilla.org/en/docs/Web/JavaScript/Reference/Global_Objects/Object/keys}
 * which accept object only mapKeys accept any object-like entity.
 *
 * @see {@link wTools.mapOwnKeys} - Similar routine taking into account own elements only.
 * @see {@link wTools.mapVals} - Similar routine returning values.
 *
 * @example
 * // returns [ "a", "b" ]
 * _.mapKeys({ a : 7, b : 13 });
 *
 * @example
 * // returns [ "a" ]
 * let o = { own : 1, enumerable : 0 };
 * _.mapKeys.call( o, { a : 1 } );
 *
 * @param { objectLike } srcMap - object of interest to extract keys.
 * @param { objectLike } o - routine options can be provided through routine`s context.
 * @param { boolean } [ o.own = false ] - count only object`s own properties.
 * @param { boolean } [ o.enumerable = true ] - count only object`s enumerable properties.
 * @return { array } Returns an array with unique string elements.
 * corresponding to the enumerable properties found directly upon object or empty array
 * if nothing found.
 * @function mapKeys
 * @throws { Exception } Throw an exception if {-srcMap-} is not an objectLike entity.
 * @throws { Error } Will throw an Error if unknown option is provided.
 * @memberof wTools
 */
        function mapKeys(r) {
          let n = this === t ? Object.create(null) : this;
          return e.assert(1 === arguments.length, "Expects single argument"), e.routineOptions(mapKeys, n), 
          e.assert(!e.primitiveIs(r)), n.srcMap = r, n.enumerable ? e._mapEnumerableKeys(n.srcMap, n.own) : e._mapKeys(n);
        }
        //
        /**
 * The mapOwnKeys() returns an array of a given object`s own enumerable properties,
 * in the same order as that provided by a for...in loop. Each element of result array is unique.
 *
 * @param { objectLike } srcMap - The object whose properties keys are to be returned.
 * @param { objectLike } o - routine options can be provided through routine`s context.
 * @param { boolean } [ o.enumerable = true ] - count only object`s enumerable properties.
 *
 * @example
 * // returns [ "a", "b" ]
 * _.mapOwnKeys({ a : 7, b : 13 });
 *
 * * @example
 * // returns [ "a" ]
 * let o = { enumerable : 0 };
 * _.mapOwnKeys.call( o, { a : 1 } );
 *
 * @return { array } Returns an array whose elements are strings
 * corresponding to the own enumerable properties found directly upon object or empty
 * array if nothing found.
 * @function mapOwnKeys
 * @throws { Error } Will throw an Error if {-srcMap-} is not an objectLike entity.
 * @throws { Error } Will throw an Error if unknown option is provided.
 * @memberof wTools
*/
        function mapOwnKeys(r) {
          let n, s = this === t ? Object.create(null) : this;
          if (e.assert(1 === arguments.length, "Expects single argument"), e.assertMapHasOnly(s, mapOwnKeys.defaults), 
          e.assert(!e.primitiveIs(r)), s.srcMap = r, s.own = 1, n = s.enumerable ? e._mapEnumerableKeys(s.srcMap, s.own) : e._mapKeys(s), 
          !s.enumerable) debugger;
          return n;
        }
        //
        /**
 * The mapAllKeys() returns all properties of provided object as array,
 * in the same order as that provided by a for...in loop. Each element of result array is unique.
 *
 * @param { objectLike } srcMap - The object whose properties keys are to be returned.
 *
 * @example
 * // returns [ "a", "b", "__defineGetter__", ... "isPrototypeOf" ]
 * let x = { a : 1 };
 * let y = { b : 2 };
 * Object.setPrototypeOf( x, y );
 * _.mapAllKeys( x );
 *
 * @return { array } Returns an array whose elements are strings
 * corresponding to the all properties found on the object.
 * @function mapAllKeys
 * @throws { Error } Will throw an Error if {-srcMap-} is not an objectLike entity.
 * @memberof wTools
*/
        function mapAllKeys(r) {
          let n = this === t ? Object.create(null) : this;
          e.assert(1 === arguments.length, "Expects single argument"), e.assertMapHasOnly(n, mapAllKeys.defaults), 
          e.assert(!e.primitiveIs(r)), n.srcMap = r, n.own = 0, n.enumerable = 0;
          let s = e._mapKeys(n);
          debugger;
          return s;
        }
        //
        function _mapVals(t) {
          e.routineOptions(_mapVals, t), e.assert(1 === arguments.length, "Expects single argument"), 
          e.assert(null === t.selectFilter || e.routineIs(t.selectFilter)), e.assert(null === t.selectFilter);
          // let selectFilter = o.selectFilter;
          //
          // if( o.selectFilter )
          // debugger;
          //
          // if( !o.selectFilter )
          // o.selectFilter = function getVal( srcMap, k )
          // {
          //   return srcMap[ k ]
          // }
          let r = e._mapKeys(t);
          for (let e = 0; e < r.length; e++) r[e] = t.srcMap[r[e]];
          return r;
        }
        //
        /**
 * The mapVals() routine returns an array of a given object's
 * enumerable property values, in the same order as that provided by a for...in loop.
 *
 * It takes an object {-srcMap-} creates an empty array,
 * checks if {-srcMap-} is an object.
 * If true, it returns an array of values,
 * otherwise it returns an empty array.
 *
 * @param { objectLike } srcMap - The object whose property values are to be returned.
 * @param { objectLike } o - routine options can be provided through routine`s context.
 * @param { boolean } [ o.own = false ] - count only object`s own properties.
 * @param { boolean } [ o.enumerable = true ] - count only object`s enumerable properties.
 *
 * @example
 * // returns [ "7", "13" ]
 * _.mapVals( { a : 7, b : 13 } );
 *
 * @example
 * let o = { own : 1 };
 * let a = { a : 7 };
 * let b = { b : 13 };
 * Object.setPrototypeOf( a, b );
 * _.mapVals.call( o, a )
 * // returns [ 7 ]
 *
 * @returns { array } Returns an array whose elements are strings.
 * corresponding to the enumerable property values found directly upon object.
 * @function mapVals
 * @throws { Error } Will throw an Error if {-srcMap-} is not an objectLike entity.
 * @throws { Error } Will throw an Error if unknown option is provided.
 * @memberof wTools
 */
        function mapVals(r) {
          let n = this === t ? Object.create(null) : this;
          return e.assert(1 === arguments.length, "Expects single argument"), e.routineOptions(mapVals, n), 
          e.assert(!e.primitiveIs(r)), n.srcMap = r, e._mapVals(n);
        }
        //
        /**
 * The mapOwnVals() routine returns an array of a given object's
 * own enumerable property values,
 * in the same order as that provided by a for...in loop.
 *
 * It takes an object {-srcMap-} creates an empty array,
 * checks if {-srcMap-} is an object.
 * If true, it returns an array of values,
 * otherwise it returns an empty array.
 *
 * @param { objectLike } srcMap - The object whose property values are to be returned.
 * @param { objectLike } o - routine options can be provided through routine`s context.
 * @param { boolean } [ o.enumerable = true ] - count only object`s enumerable properties.
 *
 * @example
 * // returns [ "7", "13" ]
 * _.mapOwnVals( { a : 7, b : 13 } );
 *
 * @example
 * let o = { enumerable : 0 };
 * let a = { a : 7 };
 * Object.defineProperty( a, 'x', { enumerable : 0, value : 1 } )
 * _.mapOwnVals.call( o, a )
 * // returns [ 7, 1 ]
 *
 * @returns { array } Returns an array whose elements are strings.
 * corresponding to the enumerable property values found directly upon object.
 * @function mapOwnVals
 * @throws { Error } Will throw an Error if {-srcMap-} is not an objectLike entity.
 * @throws { Error } Will throw an Error if unknown option is provided.
 * @memberof wTools
 */
        function mapOwnVals(r) {
          let n = this === t ? Object.create(null) : this;
          e.assert(1 === arguments.length, "Expects single argument"), e.assertMapHasOnly(n, mapVals.defaults), 
          e.assert(!e.primitiveIs(r)), n.srcMap = r, n.own = 1;
          let s = e._mapVals(n);
          debugger;
          return s;
        }
        //
        /**
 * The mapAllVals() returns values of all properties of provided object as array,
 * in the same order as that provided by a for...in loop.
 *
 * It takes an object {-srcMap-} creates an empty array,
 * checks if {-srcMap-} is an object.
 * If true, it returns an array of values,
 * otherwise it returns an empty array.
 *
 * @param { objectLike } srcMap - The object whose property values are to be returned.
 *
 * @example
 * // returns [ "7", "13", function __defineGetter__(), ... function isPrototypeOf() ]
 * _.mapAllVals( { a : 7, b : 13 } );
 *
 * @returns { array } Returns an array whose elements are strings.
 * corresponding to the enumerable property values found directly upon object.
 * @function mapAllVals
 * @throws { Error } Will throw an Error if {-srcMap-} is not an objectLike entity.
 * @memberof wTools
 */
        function mapAllVals(r) {
          let n = this === t ? Object.create(null) : this;
          e.assert(1 === arguments.length, "Expects single argument"), e.assertMapHasOnly(n, mapAllVals.defaults), 
          e.assert(!e.primitiveIs(r)), n.srcMap = r, n.own = 0, n.enumerable = 0;
          let s = e._mapVals(n);
          debugger;
          return s;
        }
        //
        function _mapPairs(t) {
          if (e.routineOptions(_mapPairs, t), e.assert(1 === arguments.length, "Expects single argument"), 
          e.assert(null === t.selectFilter || e.routineIs(t.selectFilter)), e.assert(!e.primitiveIs(t.srcMap)), 
          t.selectFilter, t.selectFilter) debugger;
          return t.selectFilter || (t.selectFilter = function getVal(e, t) {
            return [ t, e[t] ];
          }), e._mapKeys(t);
        }
        //
        /**
 * The mapPairs() converts an object into a list of unique [ key, value ] pairs.
 *
 * It takes an object {-srcMap-} creates an empty array,
 * checks if {-srcMap-} is an object.
 * If true, it returns a list of [ key, value ] pairs if they exist,
 * otherwise it returns an empty array.
 *
 * @param { objectLike } srcMap - Object to get a list of [ key, value ] pairs.
 * @param { objectLike } o - routine options can be provided through routine`s context.
 * @param { boolean } [ o.own = false ] - count only object`s own properties.
 * @param { boolean } [ o.enumerable = true ] - count only object`s enumerable properties.
 *
 * @example
 * // returns [ [ "a", 7 ], [ "b", 13 ] ]
 * _.mapPairs( { a : 7, b : 13 } );
 *
 * @example
 * let a = { a : 1 };
 * let b = { b : 2 };
 * Object.setPrototypeOf( a, b );
 * _.mapPairs.call( { own : 1 }, a );
 * //returns [ [ "a", 1 ] ]
 *
 * @returns { array } A list of [ key, value ] pairs.
 * @function mapPairs
 * @throws { Error } Will throw an Error if {-srcMap-} is not an objectLike entity.
 * @throws { Error } Will throw an Error if unknown option is provided.
 * @memberof wTools
 */
        function mapPairs(r) {
          let n = this === t ? Object.create(null) : this;
          return e.assert(1 === arguments.length, "Expects single argument"), e.assertMapHasOnly(n, mapPairs.defaults), 
          n.srcMap = r, e._mapPairs(n);
        }
        //
        /**
 * The mapOwnPairs() converts an object's own properties into a list of [ key, value ] pairs.
 *
 *
 * It takes an object {-srcMap-} creates an empty array,
 * checks if {-srcMap-} is an object.
 * If true, it returns a list of [ key, value ] pairs of object`s own properties if they exist,
 * otherwise it returns an empty array.
 *
 * @param { objectLike } srcMap - Object to get a list of [ key, value ] pairs.
 * @param { objectLike } o - routine options can be provided through routine`s context.
 * @param { boolean } [ o.enumerable = true ] - count only object`s enumerable properties.
 *
 * @example
 * // returns [ [ "a", 7 ], [ "b", 13 ] ]
 * _.mapOwnPairs( { a : 7, b : 13 } );
 *
 * @example
 * let a = { a : 1 };
 * let b = { b : 2 };
 * Object.setPrototypeOf( a, b );
 * _.mapOwnPairs( a );
 * //returns [ [ "a", 1 ] ]
 *
 * @example
 * let a = { a : 1 };
 * _.mapOwnPairs.call( { enumerable : 0 }, a );
 *
 * @returns { array } A list of [ key, value ] pairs.
 * @function mapOwnPairs
 * @throws { Error } Will throw an Error if {-srcMap-} is not an objectLike entity.
 * @throws { Error } Will throw an Error if unknown option is provided.
 * @memberof wTools
 */
        function mapOwnPairs(r) {
          let n = this === t ? Object.create(null) : this;
          e.assert(1 === arguments.length, "Expects single argument"), e.assertMapHasOnly(n, mapPairs.defaults), 
          n.srcMap = r, n.own = 1;
          let s = e._mapPairs(n);
          debugger;
          return s;
        }
        //
        /**
 * The mapAllPairs() converts all properties of the object {-srcMap-} into a list of unique [ key, value ] pairs.
 *
 * It takes an object {-srcMap-} creates an empty array,
 * checks if {-srcMap-} is an object.
 * If true, it returns a list of [ key, value ] pairs that repesents all properties of provided object{-srcMap-},
 * otherwise it returns an empty array.
 *
 * @param { objectLike } srcMap - Object to get a list of [ key, value ] pairs.
 *
 * @example
 * // returns [ [ "a", 7 ], [ "b", 13 ], ... [ "isPrototypeOf", function isPrototypeOf() ] ]
 * _.mapAllPairs( { a : 7, b : 13 } );
 *
 * @example
 * let a = { a : 1 };
 * let b = { b : 2 };
 * Object.setPrototypeOf( a, b );
 * _.mapAllPairs( a );
 * //returns [ [ "a", 1 ], [ "b", 2 ], ... [ "isPrototypeOf", function isPrototypeOf() ]  ]
 *
 * @returns { array } A list of [ key, value ] pairs.
 * @function mapAllPairs
 * @throws { Error } Will throw an Error if {-srcMap-} is not an objectLike entity.
 * @memberof wTools
 */
        function mapAllPairs(r) {
          let n = this === t ? Object.create(null) : this;
          e.assert(1 === arguments.length, "Expects single argument"), e.assertMapHasOnly(n, mapAllPairs.defaults), 
          n.srcMap = r, n.own = 0, n.enumerable = 0;
          let s = e._mapPairs(n);
          debugger;
          return s;
        }
        //
        function _mapProperties(t) {
          let r = Object.create(null);
          e.routineOptions(_mapProperties, t), e.assert(1 === arguments.length, "Expects single argument"), 
          e.assert(!e.primitiveIs(t.srcMap));
          let n = e._mapKeys(t);
          for (let e = 0; e < n.length; e++) r[n[e]] = t.srcMap[n[e]];
          return r;
        }
        //
        /**
 * The mapProperties() gets enumerable properties of the object{-srcMap-} and returns them as new map.
 *
 * It takes an object {-srcMap-} creates an empty map,
 * checks if {-srcMap-} is an object.
 * If true, it copies unique enumerable properties of the provided object to the new map using
 * their original name/value and returns the result,
 * otherwise it returns empty map.
 *
 * @param { objectLike } srcMap - Object to get a map of enumerable properties.
 * @param { objectLike } o - routine options can be provided through routine`s context.
 * @param { boolean } [ o.own = false ] - count only object`s own properties.
 * @param { boolean } [ o.enumerable = true ] - count only object`s enumerable properties.
 *
 * @example
 * // returns { a : 7, b : 13 }
 * _.mapProperties( { a : 7, b : 13 } );
 *
 * @example
 * let a = { a : 1 };
 * let b = { b : 2 };
 * Object.setPrototypeOf( a, b );
 * _.mapProperties( a );
 * //returns { a : 1, b : 2 }
 *
 * @example
 * let a = { a : 1 };
 * let b = { b : 2 };
 * Object.setPrototypeOf( a, b );
 * _.mapProperties.call( { own : 1 }, a )
 * //returns { a : 1 }
 *
 * @returns { object } A new map with unique enumerable properties from source{-srcMap-}.
 * @function mapProperties
 * @throws { Error } Will throw an Error if {-srcMap-} is not an objectLike entity.
 * @throws { Error } Will throw an Error if unknown option is provided.
 * @memberof wTools
 */
        function mapProperties(r) {
          let n = this === t ? Object.create(null) : this;
          return e.assert(1 === arguments.length, "Expects single argument"), e.routineOptions(mapProperties, n), 
          n.srcMap = r, e._mapProperties(n);
        }
        //
        /**
 * The mapOwnProperties() gets the object's {-srcMap-} own enumerable properties and returns them as new map.
 *
 * It takes an object {-srcMap-} creates an empty map,
 * checks if {-srcMap-} is an object.
 * If true, it copies object's own enumerable properties to the new map using
 * their original name/value and returns the result,
 * otherwise it returns empty map.
 *
 * @param { objectLike } srcMap - Source to get a map of object`s own enumerable properties.
 * @param { objectLike } o - routine options can be provided through routine`s context.
 * @param { boolean } [ o.enumerable = true ] - count only object`s enumerable properties.
 *
 * @example
 * // returns { a : 7, b : 13 }
 * _.mapOwnProperties( { a : 7, b : 13 } );
 *
 * @example
 * let a = { a : 1 };
 * let b = { b : 2 };
 * Object.setPrototypeOf( a, b );
 * _.mapOwnProperties( a );
 * //returns { a : 1 }
 *
 * @example
 * let a = { a : 1 };
 * Object.defineProperty( a, 'b', { enumerable : 0, value : 2 } );
 * _.mapOwnProperties.call( { enumerable : 0 }, a )
 * //returns { a : 1, b : 2 }
 *
 * @returns { object } A new map with source {-srcMap-} own enumerable properties.
 * @function mapOwnProperties
 * @throws { Error } Will throw an Error if {-srcMap-} is not an objectLike entity.
 * @throws { Error } Will throw an Error if unknown option is provided.
 * @memberof wTools
 */
        function mapOwnProperties(r) {
          let n = this === t ? Object.create(null) : this;
          return e.assert(1 === arguments.length, "Expects single argument"), e.routineOptions(mapOwnProperties, n), 
          n.srcMap = r, n.own = 1, e._mapProperties(n);
        }
        //
        /**
 * The mapAllProperties() gets all properties from provided object {-srcMap-} and returns them as new map.
 *
 * It takes an object {-srcMap-} creates an empty map,
 * checks if {-srcMap-} is an object.
 * If true, it copies all unique object's properties to the new map using
 * their original name/value and returns the result,
 * otherwise it returns empty map.
 *
 * @param { objectLike } srcMap - Source to get a map of all object`s properties.
 *
 * @example
 * // returns { a : 7, b : 13, __defineGetter__ : function...}
 * _.mapAllProperties( { a : 7, b : 13 } );
 *
 * @example
 * let a = { a : 1 };
 * let b = { b : 2 };
 * Object.setPrototypeOf( a, b );
 * _.mapAllProperties( a );
 * //returns { a : 1, b : 2, __defineGetter__ : function...}
 *
 * @returns { object } A new map with all unique properties from source {-srcMap-}.
 * @function mapAllProperties
 * @throws { Error } Will throw an Error if {-srcMap-} is not an objectLike entity.
 * @throws { Error } Will throw an Error if unknown option is provided.
 * @memberof wTools
 */
        function mapAllProperties(r) {
          let n = this === t ? Object.create(null) : this;
          return e.assert(1 === arguments.length, "Expects single argument"), e.routineOptions(mapAllProperties, n), 
          n.srcMap = r, n.own = 0, n.enumerable = 0, e._mapProperties(n);
        }
        //
        /**
 * The mapRoutines() gets enumerable properties that contains routines as value from the object {-srcMap-} and returns them as new map.
 *
 * It takes an object {-srcMap-} creates an empty map,
 * checks if {-srcMap-} is an object.
 * If true, it copies unique enumerable properties that holds routines from source {-srcMap-} to the new map using
 * original name/value of the property and returns the result, otherwise it returns empty map.
 *
 * @param { objectLike } srcMap - Source to get a map of object`s properties.
 * @param { objectLike } o - routine options, can be provided through routine`s context.
 * @param { boolean } [ o.own = false ] - count only object`s own properties.
 * @param { boolean } [ o.enumerable = true ] - count only object`s enumerable properties.
 *
 * @example
 * // returns { f : function(){} }
 * _.mapRoutines( { a : 7, b : 13, f : function(){} } );
 *
 * @example
 * let a = { a : 1 };
 * let b = { b : 2, f : function(){} };
 * Object.setPrototypeOf( a, b );
 * _.mapRoutines( a )
 * //returns { f : function(){} }
 *
 * @example
 * let a = { a : 1 };
 * let b = { b : 2, f : function(){} };
 * Object.setPrototypeOf( a, b );
 * _.mapRoutines.call( { own : 1 }, a )
 * //returns {}
 *
 * @returns { object } A new map with unique enumerable routine properties from source {-srcMap-}.
 * @function mapRoutines
 * @throws { Error } Will throw an Error if {-srcMap-} is not an objectLike entity.
 * @throws { Error } Will throw an Error if unknown option is provided.
 * @memberof wTools
 */
        function mapRoutines(r) {
          let n = this === t ? Object.create(null) : this;
          e.assert(1 === arguments.length, "Expects single argument"), e.routineOptions(mapRoutines, n), 
          n.srcMap = r, n.selectFilter = function selectRoutine(t, r) {
            debugger;
            if (e.routineIs(t[r])) return r;
            debugger;
          };
          debugger;
          return e._mapProperties(n);
        }
        //
        /**
 * The mapOwnRoutines() gets object`s {-srcMap-} own enumerable properties that contains routines as value and returns them as new map.
 *
 * It takes an object {-srcMap-} creates an empty map,
 * checks if {-srcMap-} is an object.
 * If true, it copies object`s {-srcMap-} own unique enumerable properties that holds routines to the new map using
 * original name/value of the property and returns the result, otherwise it returns empty map.
 *
 * @param { objectLike } srcMap - Source to get a map of object`s properties.
 * @param { objectLike } o - routine options, can be provided through routine`s context.
 * @param { boolean } [ o.enumerable = true ] - count only object`s enumerable properties.
 *
 * @example
 * // returns { f : function(){} }
 * _.mapOwnRoutines( { a : 7, b : 13, f : function(){} } );
 *
 * @example
 * let a = { a : 1 };
 * let b = { b : 2, f : function(){} };
 * Object.setPrototypeOf( a, b );
 * _.mapOwnRoutines( a )
 * //returns {}
 *
 * @example
 * let a = { a : 1 };
 * Object.defineProperty( a, 'b', { enumerable : 0, value : function(){} } );
 * _.mapOwnRoutines.call( { enumerable : 0 }, a )
 * //returns { b : function(){} }
 *
 * @returns { object } A new map with unique object`s own enumerable routine properties from source {-srcMap-}.
 * @function mapOwnRoutines
 * @throws { Error } Will throw an Error if {-srcMap-} is not an objectLike entity.
 * @throws { Error } Will throw an Error if unknown option is provided.
 * @memberof wTools
 */
        function mapOwnRoutines(r) {
          let n = this === t ? Object.create(null) : this;
          e.assert(1 === arguments.length, "Expects single argument"), e.routineOptions(mapOwnRoutines, n), 
          n.srcMap = r, n.own = 1, n.selectFilter = function selectRoutine(t, r) {
            debugger;
            if (e.routineIs(t[r])) return r;
            debugger;
          };
          debugger;
          return e._mapProperties(n);
        }
        //
        /**
 * The mapAllRoutines() gets all properties of object {-srcMap-} that contains routines as value and returns them as new map.
 *
 * It takes an object {-srcMap-} creates an empty map,
 * checks if {-srcMap-} is an object.
 * If true, it copies all unique properties of source {-srcMap-} that holds routines to the new map using
 * original name/value of the property and returns the result, otherwise it returns empty map.
 *
 * @param { objectLike } srcMap - Source to get a map of object`s properties.
 *
 * @example
 * // returns { f : function, __defineGetter__ : function...}
 * _.mapAllRoutines( { a : 7, b : 13, f : function(){} } );
 *
 * @example
 * let a = { a : 1 };
 * let b = { b : 2, f : function(){} };
 * Object.setPrototypeOf( a, b );
 * _.mapAllRoutines( a )
 * // returns { f : function, __defineGetter__ : function...}
 *
 *
 * @returns { object } A new map with all unique object`s {-srcMap-} properties that are routines.
 * @function mapAllRoutines
 * @throws { Error } Will throw an Error if {-srcMap-} is not an objectLike entity.
 * @throws { Error } Will throw an Error if unknown option is provided.
 * @memberof wTools
 */
        function mapAllRoutines(r) {
          let n = this === t ? Object.create(null) : this;
          e.assert(1 === arguments.length, "Expects single argument"), e.routineOptions(mapAllRoutines, n), 
          n.srcMap = r, n.own = 0, n.enumerable = 0, n.selectFilter = function selectRoutine(t, r) {
            debugger;
            if (e.routineIs(t[r])) return r;
          };
          debugger;
          return e._mapProperties(n);
        }
        //
        /**
 * The mapFields() gets enumerable fields( all properties except routines ) of the object {-srcMap-} and returns them as new map.
 *
 * It takes an object {-srcMap-} creates an empty map,
 * checks if {-srcMap-} is an object.
 * If true, it copies unique enumerable properties of the provided object {-srcMap-} that are not routines to the new map using
 * their original name/value and returns the result, otherwise it returns empty map.
 *
 * @param { objectLike } srcMap - Object to get a map of enumerable properties.
 * @param { objectLike } o - routine options can be provided through routine`s context.
 * @param { boolean } [ o.own = false ] - count only object`s own properties.
 * @param { boolean } [ o.enumerable = true ] - count only object`s enumerable properties.
 *
 * @example
 * // returns { a : 7, b : 13 }
 * _.mapFields( { a : 7, b : 13, c : function(){} } );
 *
 * @example
 * let a = { a : 1 };
 * let b = { b : 2, c : function(){} };
 * Object.setPrototypeOf( a, b );
 * _.mapFields( a );
 * //returns { a : 1, b : 2 }
 *
 * @example
 * let a = { a : 1, x : function(){} };
 * let b = { b : 2 };
 * Object.setPrototypeOf( a, b );
 * _.mapFields.call( { own : 1 }, a )
 * //returns { a : 1 }
 *
 * @returns { object } A new map with unique enumerable fields( all properties except routines ) from source {-srcMap-}.
 * @function mapFields
 * @throws { Error } Will throw an Error if {-srcMap-} is not an objectLike entity.
 * @throws { Error } Will throw an Error if unknown option is provided.
 * @memberof wTools
 */
        function mapFields(r) {
          let n = this === t ? Object.create(null) : this;
          return e.assert(1 === arguments.length, "Expects single argument"), e.routineOptions(mapFields, n), 
          n.srcMap = r, n.selectFilter = function selectRoutine(t, r) {
            if (!e.routineIs(t[r])) return r;
          }, e._mapProperties(n);
        }
        //
        /**
 * The mapOwnFields() gets object`s {-srcMap-} own enumerable fields( all properties except routines ) and returns them as new map.
 *
 * It takes an object {-srcMap-} creates an empty map,
 * checks if {-srcMap-} is an object.
 * If true, it copies object`s own enumerable properties that are not routines to the new map using
 * their original name/value and returns the result, otherwise it returns empty map.
 *
 * @param { objectLike } srcMap - Object to get a map of enumerable properties.
 * @param { objectLike } o - routine options can be provided through routine`s context.
 * @param { boolean } [ o.enumerable = true ] - count only object`s enumerable properties.
 *
 * @example
 * // returns { a : 7, b : 13 }
 * _.mapOwnFields( { a : 7, b : 13, c : function(){} } );
 *
 * @example
 * let a = { a : 1 };
 * let b = { b : 2, c : function(){} };
 * Object.setPrototypeOf( a, b );
 * _.mapOwnFields( a );
 * //returns { a : 1 }
 *
 * @example
 * let a = { a : 1, x : function(){} };
 * Object.defineProperty( a, 'b', { enumerable : 0, value : 2 } )
 * _.mapFields.call( { enumerable : 0 }, a )
 * //returns { a : 1, b : 2 }
 *
 * @returns { object } A new map with object`s {-srcMap-} own enumerable fields( all properties except routines ).
 * @function mapOwnFields
 * @throws { Error } Will throw an Error if {-srcMap-} is not an objectLike entity.
 * @throws { Error } Will throw an Error if unknown option is provided.
 * @memberof wTools
 */
        function mapOwnFields(r) {
          let n = this === t ? Object.create(null) : this;
          return e.assert(1 === arguments.length, "Expects single argument"), e.routineOptions(mapOwnFields, n), 
          n.srcMap = r, n.own = 1, n.selectFilter = function selectRoutine(t, r) {
            if (!e.routineIs(t[r])) return r;
          }, e._mapProperties(n);
        }
        //
        /**
 * The mapAllFields() gets all object`s {-srcMap-} fields( properties except routines ) and returns them as new map.
 *
 * It takes an object {-srcMap-} creates an empty map,
 * checks if {-srcMap-} is an object.
 * If true, it copies all object`s properties that are not routines to the new map using
 * their original name/value and returns the result, otherwise it returns empty map.
 *
 * @param { objectLike } srcMap - Object to get a map of all properties.
 *
 * @example
 * // returns { a : 7, b : 13, __proto__ : Object }
 * _.mapAllFields( { a : 7, b : 13, c : function(){} } );
 *
 * @example
 * let a = { a : 1 };
 * let b = { b : 2, c : function(){} };
 * Object.setPrototypeOf( a, b );
 * _.mapAllFields( a );
 * //returns { a : 1, b : 2, __proto__ : Object }
 *
 * @example
 * let a = { a : 1, x : function(){} };
 * Object.defineProperty( a, 'b', { enumerable : 0, value : 2 } )
 * _.mapAllFields( a );
 * //returns { a : 1, b : 2, __proto__ : Object }
 *
 * @returns { object } A new map with all fields( properties except routines ) from source {-srcMap-}.
 * @function mapAllFields
 * @throws { Error } Will throw an Error if {-srcMap-} is not an objectLike entity.
 * @throws { Error } Will throw an Error if unknown option is provided.
 * @memberof wTools
 */
        function mapAllFields(r) {
          let n = this === t ? Object.create(null) : this;
          return e.assert(1 === arguments.length, "Expects single argument"), e.routineOptions(mapAllFields, n), 
          n.srcMap = r, n.own = 0, n.enumerable = 0, n.selectFilter = function selectRoutine(t, r) {
            if (!e.routineIs(t[r])) return r;
          }, e.routineIs(r) && (n.selectFilter = function selectRoutine(t, r) {
            if (!e.arrayHas([ "arguments", "caller" ], r)) return e.routineIs(t[r]) ? void 0 : r;
          }), e._mapProperties(n);
        }
        //
        /**
 * @callback  options.filter
 * @param { objectLike } dstMap - An empty object.
 * @param { objectLike } srcMaps - The target object.
 * @param { string } - The key of the (screenMap).
 */
        /**
 * The _mapOnly() returns an object filled by unique [ key, value]
 * from others objects.
 *
 * The _mapOnly() checks whether there are the keys of
 * the (screenMap) in the list of (srcMaps).
 * If true, it calls a provided callback function(filter)
 * and adds to the (dstMap) all the [ key, value ]
 * for which callback function returns true.
 *
 * @param { function } [options.filter = filter.bypass()] options.filter - The callback function.
 * @param { objectLike } options.srcMaps - The target object.
 * @param { objectLike } options.screenMaps - The source object.
 * @param { Object } [options.dstMap = Object.create( null )] options.dstMap - The empty object.
 *
 * @example
 * // returns { a : 33, c : 33, name : "Mikle" };
 * let options = Object.create( null );
 * options.dstMap = Object.create( null );
 * options.screenMaps = { 'a' : 13, 'b' : 77, 'c' : 3, 'name' : 'Mikle' };
 * options.srcMaps = { 'a' : 33, 'd' : 'name', 'name' : 'Mikle', 'c' : 33 };
 * _mapOnly( options );
 *
 * @example
 * // returns { a : "abc", c : 33, d : "name" };
 * let options = Object.create( null );
 * options.dstMap = Object.create( null );
 * options.screenMaps = { a : 13, b : 77, c : 3, d : 'name' };
 * options.srcMaps = { d : 'name', c : 33, a : 'abc' };
 * _mapOnly( options );
 *
 * @returns { Object } Returns an object filled by unique [ key, value ]
 * from others objects.
 * @function _mapOnly
 * @throws { Error } Will throw an Error if (options.dstMap or screenMap) are not objects,
 * or if (srcMaps) is not an array
 * @memberof wTools
 */
        function _mapOnly(t) {
          let r = t.dstMap || Object.create(null), n = t.screenMaps, s = t.srcMaps;
          e.arrayIs(n) && (n = e.mapMake.apply(this, n)), e.arrayIs(s) || (s = [ s ]), t.filter || (t.filter = e.field.mapper.bypass), 
          e.assert("field-mapper" === t.filter.functionFamily), e.assert(1 === arguments.length, "Expects single argument"), 
          e.assert(e.objectLike(r), "Expects object-like {-dstMap-}"), e.assert(!e.primitiveIs(n), "Expects not primitive {-screenMap-}"), 
          e.assert(e.arrayIs(s), "Expects array {-srcMaps-}"), e.assertMapHasOnly(t, _mapOnly.defaults);
          for (let t = s.length - 1; t >= 0; t--) e.assert(!e.primitiveIs(s[t]), "Expects {-srcMaps-}");
          for (let e in n) {
            if (void 0 === n[e]) continue;
            let l;
            for (l = s.length - 1; l >= 0 && !(e in s[l]); l--) ;
            -1 !== l && t.filter.call(this, r, s[l], e);
          }
          return r;
        }
        _global_;
        let e = _global_.wTools, t = _global_.wTools, r = (Array.prototype.slice, Function.prototype.bind, 
        Object.hasOwnProperty);
        mapSatisfy.defaults = {
          template: null,
          src: null,
          levels: 1
        }, mapCloneAssigning.defaults = {
          srcMap: null,
          dstMap: null,
          onField: null
        }, _filterTrue.functionFamily = "field-filter", _filterFalse.functionFamily = "field-filter", 
        mapInvert.defaults = {
          src: null,
          dst: null,
          duplicate: "error"
        }, mapsFlatten.defaults = {
          src: null,
          dst: null,
          allowingCollision: 0,
          delimeter: "/"
        }, mapToStr.defaults = {
          src: null,
          keyValDelimeter: ":",
          entryDelimeter: ";"
        }, _mapKeys.defaults = {
          srcMap: null,
          own: 0,
          enumerable: 1,
          selectFilter: null
        }, mapKeys.defaults = {
          own: 0,
          enumerable: 1
        }, mapOwnKeys.defaults = {
          enumerable: 1
        }, mapAllKeys.defaults = {}, _mapVals.defaults = {
          srcMap: null,
          own: 0,
          enumerable: 1,
          selectFilter: null
        }, mapVals.defaults = {
          own: 0,
          enumerable: 1
        }, mapOwnVals.defaults = {
          enumerable: 1
        }, mapAllVals.defaults = {}, _mapPairs.defaults = {
          srcMap: null,
          own: 0,
          enumerable: 1,
          selectFilter: null
        }, mapPairs.defaults = {
          own: 0,
          enumerable: 1
        }, mapOwnPairs.defaults = {
          enumerable: 1
        }, mapAllPairs.defaults = {}, _mapProperties.defaults = {
          srcMap: null,
          own: 0,
          enumerable: 1,
          selectFilter: null
        }, mapProperties.defaults = {
          own: 0,
          enumerable: 1
        }, mapOwnProperties.defaults = {
          enumerable: 1
        }, mapAllProperties.defaults = {}, mapRoutines.defaults = {
          own: 0,
          enumerable: 1
        }, mapOwnRoutines.defaults = {
          enumerable: 1
        }, mapAllRoutines.defaults = {}, mapFields.defaults = {
          own: 0,
          enumerable: 1
        }, mapOwnFields.defaults = {
          enumerable: 1
        }, mapAllFields.defaults = {}, _mapOnly.defaults = {
          dstMap: null,
          srcMaps: null,
          screenMaps: null,
          filter: null
        };
        // --
        // fields
        // --
        let s = {
          // map checker
          objectIs: 
          // --
          // map checker
          // --
          /**
 * Function objectIs checks incoming param whether it is object.
 * Returns "true" if incoming param is object. Othervise "false" returned.
 *
 * @example
 * // returns true
 * let obj = { x : 100 };
 * objectIs(obj);
 * @example
 * // returns false
 * objectIs( 10 );
 *
 * @param { * } src.
 * @return { Boolean }.
 * @function objectIs
 * @memberof wTools
 */
          function objectIs(e) {
            // if( !src )
            // return false;
            // if( _ObjectHasOwnProperty.call( src, 'callee' ) )
            // return false;
            // if( src instanceof Array )
            // return true;
            // if( src instanceof Object )
            // return true;
            // let prototype = Object.getPrototypeOf( src );
            // return prototype === null;
            return "[object Object]" === Object.prototype.toString.call(e);
          }
          //
          ,
          objectLike: function objectLike(t) {
            if (e.objectIs(t)) return !0;
            if (e.primitiveIs(t)) return !1;
            if (e.longIs(t)) return !1;
            if (e.routineIsPure(t)) return !1;
            if (e.strIs(t)) return !1;
            for (let e in t) return !0;
            return !1;
          }
          //
          ,
          objectLikeOrRoutine: function objectLikeOrRoutine(t) {
            return !!e.routineIs(t) || e.objectLike(t);
          },
          mapIs: mapIs,
          mapIsEmpty: function mapIsEmpty(t) {
            return !!e.mapIs(t) && 0 === Object.keys(t).length;
          }
          //
          ,
          mapIsPure: function mapIsPure(e) {
            if (e) return null === Object.getPrototypeOf(e);
          }
          //
          ,
          mapIsPopulated: function mapIsPopulated(t) {
            return !!e.mapIs(t) && Object.keys(t).length > 0;
          }
          //
          ,
          mapLike: function mapLike(t) {
            return !!mapIs(t) || !!t && (t.constructor === Object || null === t.constructor || !!e.objectLike(t) && !e.instanceIs(t));
          }
          //
          /**
 * The mapsAreIdentical() returns true, if the second object (src2)
 * has the same values as the first object(src1).
 *
 * It takes two objects (scr1, src2), checks
 * if both object have the same length and [key, value] return true
 * otherwise it returns undefined.
 *
 * @param { objectLike } src1 - First object.
 * @param { objectLike } src2 - Target object.
 * Objects to compare values.
 *
 * @example
 * // returns true
 * mapsAreIdentical( { a : 7, b : 13 }, { a : 7, b : 13 } );
 *
 * @example
 * returns false
 * _.mapsAreIdentical( { a : 7, b : 13 }, { a : 33, b : 13 } );
 *
 * @example
 * returns false
 * _.mapsAreIdentical( { a : 7, b : 13, c : 33 }, { a : 7, b : 13 } );
 *
 * @returns { boolean } Returns true, if the second object (src2)
 * has the same values as the first object(src1).
 * @function mapsAreIdentical
 * @throws Will throw an error if ( arguments.length !== 2 ).
 * @memberof wTools
 */ ,
          mapsAreIdentical: function mapsAreIdentical(t, r) {
            if (e.assert(2 === arguments.length, "Expects exactly two arguments"), e.assert(e.objectLike(t)), 
            e.assert(e.objectLike(r)), Object.keys(t).length !== Object.keys(r).length) return !1;
            for (let e in t) if (t[e] !== r[e]) return !1;
            return !0;
          }
          //
          /**
 * The mapContain() returns true, if the first object {-srcMap-}
 * has the same values as the second object(ins).
 *
 * It takes two objects (scr, ins),
 * checks if the first object {-srcMap-} has the same [key, value] as
 * the second object (ins).
 * If true, it returns true,
 * otherwise it returns false.
 *
 * @param { objectLike } src - Target object.
 * @param { objectLike } ins - Second object.
 * Objects to compare values.
 *
 * @example
 * // returns true
 * mapContain( { a : 7, b : 13, c : 15 }, { a : 7, b : 13 } );
 *
 * @example
 * returns false
 * mapContain( { a : 7, b : 13 }, { a : 7, b : 13, c : 15 } );
 *
 * @returns { boolean } Returns true, if the first object {-srcMap-}
 * has the same values as the second object(ins).
 * @function mapContain
 * @throws Will throw an error if ( arguments.length !== 2 ).
 * @memberof wTools
 */ ,
          mapContain: function mapContain(t, r) {
            e.assert(2 === arguments.length, "Expects exactly two arguments");
            /*
  if( Object.keys( src ).length < Object.keys( ins ).length )
  return false;
*/
            for (let e in r) if (void 0 !== r[e] && t[e] !== r[e]) return !1;
            return !0;
          },
          mapSatisfy: mapSatisfy,
          _mapSatisfy: _mapSatisfy,
          mapHas: mapHasKey,
          mapHasKey: mapHasKey,
          mapOwnKey: function mapOwnKey(t, n) {
            return e.assert(2 === arguments.length, "Expects exactly two arguments"), e.strIs(n) ? r.call(t, n) : e.mapIs(n) ? r.call(t, e.nameUnfielded(n).coded) : e.symbolIs(n) ? r.call(t, n) : void e.assert(0, "mapOwnKey :", "unknown type of key :", e.strType(n));
          }
          //
          ,
          mapHasVal: function mapHasVal(t, r) {
            return -1 !== e.mapVals(t).indexOf(r);
          }
          //
          ,
          mapOwnVal: function mapOwnVal(t, r) {
            return -1 !== e.mapOwnVals(t).indexOf(r);
          }
          //
          /**
 * The mapHasAll() returns true if object( src ) has all enumerable keys from object( screen ).
 * Values of properties are not checked, only names.
 *
 * Uses for..in to get each key name from object( screen ) and checks if source( src ) has property with same name.
 * Returns true if all keys from( screen ) exists on object( src ), otherwise returns false.
 *
 * @param { ObjectLike } src - Map that will be checked for keys from( screen ).
 * @param { ObjectLike } screen - Map that hold keys.
 *
 * @example
 * // returns true
 * _.mapHasAll( {}, {} );
 *
 * // returns false
 * _.mapHasAll( {}, { a : 1 } );
 *
 * @returns { boolean } Returns true if object( src ) has all enumerable keys from( screen ).
 * @function mapHasAll
 * @throws { Exception } Will throw an error if the ( src ) is not a ObjectLike entity.
 * @throws { Exception } Will throw an error if the ( screen ) is not a ObjectLike entity.
 * @memberof wTools
 */ ,
          mapHasAll: function mapHasAll(t, r) {
            e.assert(2 === arguments.length, "Expects exactly two arguments"), e.assert(e.objectLike(t)), 
            e.assert(e.objectLike(r));
            for (let e in r) if (!(e in t)) return !1;
            return !0;
          }
          //
          /**
 * The mapHasAny() returns true if object( src ) has at least one enumerable key from object( screen ).
 * Values of properties are not checked, only names.
 *
 * Uses for..in to get each key name from object( screen ) and checks if source( src ) has at least one property with same name.
 * Returns true if any key from( screen ) exists on object( src ), otherwise returns false.
 *
 * @param { ObjectLike } src - Map that will be checked for keys from( screen ).
 * @param { ObjectLike } screen - Map that hold keys.
 *
 * @example
 * // returns false
 * _.mapHasAny( {}, {} );
 *
 * // returns true
 * _.mapHasAny( { a : 1, b : 2 }, { a : 1 } );
 *
 * // returns false
 * _.mapHasAny( { a : 1, b : 2 }, { c : 1 } );
 *
 * @returns { boolean } Returns true if object( src ) has at least one enumerable key from( screen ).
 * @function mapHasAny
 * @throws { Exception } Will throw an error if the ( src ) is not a ObjectLike entity.
 * @throws { Exception } Will throw an error if the ( screen ) is not a ObjectLike entity.
 * @memberof wTools
 */ ,
          mapHasAny: function mapHasAny(t, r) {
            e.assert(2 === arguments.length, "Expects exactly two arguments"), e.assert(e.objectLike(t)), 
            e.assert(e.objectLike(r));
            for (let e in r) {
              if (e in t) debugger;
              if (e in t) return !0;
            }
            debugger;
            return !1;
          }
          //
          /**
 * The mapHasAny() returns true if object( src ) has no one enumerable key from object( screen ).
 * Values of properties are not checked, only names.
 *
 * Uses for..in to get each key name from object( screen ) and checks if source( src ) has no one property with same name.
 * Returns true if all keys from( screen ) not exists on object( src ), otherwise returns false.
 *
 * @param { ObjectLike } src - Map that will be checked for keys from( screen ).
 * @param { ObjectLike } screen - Map that hold keys.
 *
 * @example
 * // returns true
 * _.mapHasNone( {}, {} );
 *
 * // returns false
 * _.mapHasNone( { a : 1, b : 2 }, { a : 1 } );
 *
 * // returns true
 * _.mapHasNone( { a : 1, b : 2 }, { c : 1 } );
 *
 * @returns { boolean } Returns true if object( src ) has at least one enumerable key from( screen ).
 * @function mapHasNone
 * @throws { Exception } Will throw an error if the ( src ) is not a ObjectLike entity.
 * @throws { Exception } Will throw an error if the ( screen ) is not a ObjectLike entity.
 * @memberof wTools
 */ ,
          mapHasNone: function mapHasNone(t, r) {
            e.assert(2 === arguments.length, "Expects exactly two arguments"), e.assert(e.objectLike(t)), 
            e.assert(e.objectLike(r));
            for (let e in r) if (e in t) return !1;
            return !0;
          }
          //
          /**
 * The mapOwnAll() returns true if object( src ) has all own keys from object( screen ).
 * Values of properties are not checked, only names.
 *
 * Uses for..in to get each key name from object( screen ) and checks if source( src ) has own property with that key name.
 * Returns true if all keys from( screen ) exists on object( src ), otherwise returns false.
 *
 * @param { Object } src - Map that will be checked for keys from( screen ).
 * @param { Object } screen - Map that hold keys.
 *
 * @example
 * // returns true
 * _.mapOwnAll( {}, {} );
 *
 * // returns true
 * _.mapOwnAll( { a : 1, b : 2 }, { a : 1 } );
 *
 * // returns false
 * _.mapOwnAll( { a : 1, b : 2 }, { c : 1 } );
 *
 * @returns { boolean } Returns true if object( src ) has own properties from( screen ).
 * @function mapOwnAll
 * @throws { Exception } Will throw an error if the ( src ) is not a ObjectLike entity.
 * @throws { Exception } Will throw an error if the ( screen ) is not a ObjectLike entity.
 * @memberof wTools
 */ ,
          mapOwnAll: function mapOwnAll(t, n) {
            e.assert(2 === arguments.length, "Expects exactly two arguments"), e.assert(e.mapIs(t)), 
            e.assert(e.mapIs(n));
            for (let e in n) {
              if (!r.call(t, e)) debugger;
              if (!r.call(t, e)) return !1;
            }
            debugger;
            return !0;
          }
          //
          /**
 * The mapOwnAny() returns true if map( src ) has at least one own property from map( screen ).
 * Values of properties are not checked, only names.
 *
 * Uses for..in to get each key name from map( screen ) and checks if source( src ) has at least one property with that key name.
 * Returns true if one of keys from( screen ) exists on object( src ), otherwise returns false.
 *
 * @param { Object } src - Map that will be checked for keys from( screen ).
 * @param { Object } screen - Map that hold keys.
 *
 * @example
 * // returns false
 * _.mapOwnAny( {}, {} );
 *
 * // returns true
 * _.mapOwnAny( { a : 1, b : 2 }, { a : 1 } );
 *
 * // returns false
 * _.mapOwnAny( { a : 1, b : 2 }, { c : 1 } );
 *
 * @returns { boolean } Returns true if object( src ) has own properties from( screen ).
 * @function mapOwnAny
 * @throws { Exception } Will throw an error if the ( src ) is not a map.
 * @throws { Exception } Will throw an error if the ( screen ) is not a map.
 * @memberof wTools
 */ ,
          mapOwnAny: function mapOwnAny(t, n) {
            e.assert(2 === arguments.length, "Expects exactly two arguments"), e.assert(e.mapIs(t)), 
            e.assert(e.mapIs(n));
            for (let e in n) {
              if (r.call(t, e)) debugger;
              if (r.call(t, e)) return !0;
            }
            debugger;
            return !1;
          }
          //
          /**
 * The mapOwnNone() returns true if map( src ) not owns properties from map( screen ).
 * Values of properties are not checked, only names.
 *
 * Uses for..in to get each key name from object( screen ) and checks if source( src ) has own property with that key name.
 * Returns true if no one key from( screen ) exists on object( src ), otherwise returns false.
 *
 * @param { Object } src - Map that will be checked for keys from( screen ).
 * @param { Object } screen - Map that hold keys.
 *
 * @example
 * // returns true
 * _.mapOwnNone( {}, {} );
 *
 * // returns false
 * _.mapOwnNone( { a : 1, b : 2 }, { a : 1 } );
 *
 * // returns true
 * _.mapOwnNone( { a : 1, b : 2 }, { c : 1 } );
 *
 * @returns { boolean } Returns true if map( src ) not owns properties from( screen ).
 * @function mapOwnNone
 * @throws { Exception } Will throw an error if the ( src ) is not a map.
 * @throws { Exception } Will throw an error if the ( screen ) is not a map.
 * @memberof wTools
 */ ,
          mapOwnNone: function mapOwnNone(t, n) {
            e.assert(2 === arguments.length, "Expects exactly two arguments"), e.assert(e.mapIs(t)), 
            e.assert(e.mapIs(n));
            for (let e in n) {
              if (r.call(t, e)) debugger;
              if (r.call(t, e)) return !1;
            }
            debugger;
            return !0;
          }
          //
          ,
          mapHasExactly: function mapHasExactly(t, r) {
            let n = !0;
            return e.assert(2 === arguments.length), n = (n = n && e.mapHasOnly(t, r)) && e.mapHasAll(t, r), 
            !0;
          }
          //
          ,
          mapOwnExactly: function mapOwnExactly(t, r) {
            let n = !0;
            return e.assert(2 === arguments.length), n = (n = n && e.mapOwnOnly(t, r)) && e.mapOwnAll(t, r), 
            !0;
          }
          //
          ,
          mapHasOnly: function mapHasOnly(t, r) {
            return e.assert(2 === arguments.length), arguments.length, !(Object.keys(e.mapBut(t, r)).length > 0);
          }
          //
          ,
          mapOwnOnly: function mapOwnOnly(t, r) {
            return e.assert(2 === arguments.length), arguments.length, !(Object.keys(e.mapOwnBut(t, r)).length > 0);
          }
          // //
          //
          // function mapHasAll( srcMap, all )
          // {
          //
          //   _.assert( arguments.length === 2 );
          //
          //   let but = Object.keys( _.mapBut( all, srcMap ) );
          //
          //   if( but.length > 0 )
          //   return false;
          //
          //   return true;
          // }
          //
          //
          //
          // function mapOwnAll( srcMap, all )
          // {
          //
          //   _.assert( arguments.length === 2 );
          //
          //   let but = Object.keys( _.mapOwnBut( all, srcMap ) );
          //
          //   if( but.length > 0 )
          //   return false;
          //
          //   return true;
          // }
          //
          // //
          //
          // function mapHasNone( srcMap, screenMaps )
          // {
          //
          //   _.assert( arguments.length === 2 );
          //
          //   let but = _.mapOnly( srcMap, screenMaps );
          //   let keys = Object.keys( but );
          //   if( keys.length )
          //   return false;
          //
          //   return true;
          // }
          //
          // //
          //
          // function mapOwnNone( srcMap, screenMaps )
          // {
          //
          //   _.assert( arguments.length === 2 );
          //
          //   let but = Object.keys( _.mapOnlyOwn( srcMap, screenMaps ) );
          //
          //   if( but.length )
          //   return false;
          //
          //   return true;
          // }
          //
          ,
          mapHasNoUndefine: function mapHasNoUndefine(t) {
            e.assert(1 === arguments.length), arguments.length;
            for (let e in t) if (void 0 === t[e]) return !1;
            return !0;
          }
          // --
          // map move
          // --
          /**
 * The mapMake() routine is used to copy the values of all properties
 * from one or more source objects to the new object.
 *
 * @param { ...objectLike } arguments[] - The source object(s).
 *
 * @example
 * // returns { a : 7, b : 13, c : 3, d : 33, e : 77 }
 * _.mapMake( { a : 7, b : 13 }, { c : 3, d : 33 }, { e : 77 } );
 *
 * @returns { objectLike } It will return the new object filled by [ key, value ]
 * from one or more source objects.
 * @function mapMake
 * @memberof wTools
 */ ,
          // map extend
          mapMake: function mapMake() {
            if (arguments.length <= 1 && (void 0 === arguments[0] || null === arguments[0])) return Object.create(null);
            let t = e.longSlice(arguments);
            return t.unshift(Object.create(null)), e.assert(!e.primitiveIs(arguments[0]) || null === arguments[0]), 
            e.mapExtend.apply(e, t);
          }
          //
          ,
          mapShallowClone: function mapShallowClone(t) {
            return e.assert(1 === arguments.length), e.assert(e.objectIs(t)), e.mapExtend(null, t);
          },
          mapCloneAssigning: mapCloneAssigning,
          /* dubious */
          mapExtend: 
          //
          /**
 * The mapExtend() is used to copy the values of all properties
 * from one or more source objects to a target object.
 *
 * It takes first object (dstMap)
 * creates variable (result) and assign first object.
 * Checks if arguments equal two or more and if (result) is an object.
 * If true,
 * it extends (result) from the next objects.
 *
 * @param{ objectLike } dstMap - The target object.
 * @param{ ...objectLike } arguments[] - The source object(s).
 *
 * @example
 * // returns { a : 7, b : 13, c : 3, d : 33, e : 77 }
 * mapExtend( { a : 7, b : 13 }, { c : 3, d : 33 }, { e : 77 } );
 *
 * @returns { objectLike } It will return the target object.
 * @function mapExtend
 * @throws { Error } Will throw an error if ( arguments.length < 2 ),
 * if the (dstMap) is not an Object.
 * @memberof wTools
 */
          function mapExtend(t, r) {
            if (null === t && (t = Object.create(null)), 2 === arguments.length && null === Object.getPrototypeOf(r)) return Object.assign(t, r);
            e.assert(arguments.length >= 2, "Expects at least two arguments"), e.assert(!e.primitiveIs(t), "Expects non primitive as the first argument");
            for (let r = 1; r < arguments.length; r++) {
              let n = arguments[r];
              if (e.assert(!e.primitiveIs(n), "Expects non primitive"), null === Object.getPrototypeOf(n)) Object.assign(t, n); else for (let e in n) t[e] = n[e];
            }
            return t;
          }
          //
          ,
          mapsExtend: function mapsExtend(t, r) {
            if (null === t && (t = Object.create(null)), 1 === r.length && null === Object.getPrototypeOf(r[0])) return Object.assign(t, r[0]);
            e.arrayLike(r) || (r = [ r ]), e.assert(2 === arguments.length, "Expects exactly two arguments"), 
            e.assert(e.arrayLike(r)), e.assert(!e.primitiveIs(t), "Expects non primitive as the first argument");
            for (let n = 0; n < r.length; n++) {
              let s = r[n];
              if (e.assert(!e.primitiveIs(s), "Expects non primitive"), null === Object.getPrototypeOf(s)) Object.assign(t, s); else for (let e in s) t[e] = s[e];
            }
            return t;
          }
          //
          /**
 * The mapExtendConditional() creates a new [ key, value ]
 * from the next objects if callback function(filter) returns true.
 *
 * It calls a provided callback function(filter) once for each key in an (argument),
 * and adds to the {-srcMap-} all the [ key, value ] for which callback
 * function(filter) returns true.
 *
 * @param { function } filter - The callback function to test each [ key, value ]
 * of the (dstMap) object.
 * @param { objectLike } dstMap - The target object.
 * @param { ...objectLike } arguments[] - The next object.
 *
 * @example
 * // returns { a : 1, b : 2, c : 3 }
 * _.mapExtendConditional( _.field.mapper.dstNotHas, { a : 1, b : 2 }, { a : 1 , c : 3 } );
 *
 * @returns { objectLike } Returns the unique [ key, value ].
 * @function mapExtendConditional
 * @throws { Error } Will throw an Error if ( arguments.length < 3 ), (filter)
 * is not a Function, (result) and (argument) are not the objects.
 * @memberof wTools
 */ ,
          mapExtendConditional: function mapExtendConditional(t, r) {
            null === r && (r = Object.create(null)), e.assert(!!t), e.assert("field-mapper" === t.functionFamily), 
            e.assert(arguments.length >= 3, "Expects more arguments"), e.assert(e.routineIs(t), "Expects filter"), 
            e.assert(!e.primitiveIs(r), "Expects non primitive as argument");
            for (let n = 2; n < arguments.length; n++) {
              let s = arguments[n];
              e.assert(!e.primitiveIs(s), () => "Expects object-like entity to extend, but got : " + e.strType(s));
              for (let e in s) t.call(this, r, s, e);
            }
            return r;
          }
          //
          ,
          mapsExtendConditional: function mapsExtendConditional(t, r, n) {
            null === r && (r = Object.create(null)), e.assert(!!t), e.assert("field-mapper" === t.functionFamily), 
            e.assert(3 === arguments.length, "Expects exactly three arguments"), e.assert(e.routineIs(t), "Expects filter"), 
            e.assert(!e.primitiveIs(r), "Expects non primitive as argument");
            for (let s = 0; s < n.length; s++) {
              let l = n[s];
              e.assert(!e.primitiveIs(l), () => "Expects object-like entity to extend, but got : " + e.strType(l));
              for (let e in l) t.call(this, r, l, e);
            }
            return r;
          }
          //
          ,
          mapExtendHiding: function mapExtendHiding(t) {
            let r = e.longSlice(arguments);
            return r.unshift(e.field.mapper.hiding), e.mapExtendConditional.apply(this, r);
          }
          //
          ,
          mapsExtendHiding: function mapsExtendHiding(t, r) {
            return e.assert(2 === arguments.length, "Expects exactly two arguments"), e.mapsExtendConditional(e.field.mapper.hiding, t, r);
          }
          //
          ,
          mapExtendAppendingAnything: function mapExtendAppendingAnything(t) {
            if (null === t && 2 === arguments.length) return Object.assign(Object.create(null), srcMap);
            let r = e.longSlice(arguments);
            return r.unshift(e.field.mapper.appendingAnything), e.mapExtendConditional.apply(this, r);
          }
          //
          ,
          mapsExtendAppendingAnything: function mapsExtendAppendingAnything(t, r) {
            return e.assert(2 === arguments.length, "Expects exactly two arguments"), null === t ? e.mapExtend(null, r[0]) : e.mapsExtendConditional(e.field.mapper.appendingAnything, t, r);
          }
          //
          ,
          mapExtendAppendingArrays: function mapExtendAppendingArrays(t) {
            if (null === t && 2 === arguments.length) return Object.assign(Object.create(null), srcMap);
            let r = e.longSlice(arguments);
            return r.unshift(e.field.mapper.appendingArrays), e.mapExtendConditional.apply(this, r);
          }
          //
          ,
          mapsExtendAppendingArrays: function mapsExtendAppendingArrays(t, r) {
            return e.assert(2 === arguments.length, "Expects exactly two arguments"), null === t ? e.mapExtend(null, r[0]) : e.mapsExtendConditional(e.field.mapper.appendingArrays, t, r);
          }
          //
          ,
          mapExtendByDefined: function mapExtendByDefined(t) {
            if (null === t && 2 === arguments.length) return Object.assign(Object.create(null), srcMap);
            let r = e.longSlice(arguments);
            return r.unshift(e.field.mapper.srcDefined), e.mapExtendConditional.apply(this, r);
          }
          //
          ,
          mapsExtendByDefined: function mapsExtendByDefined(t, r) {
            return e.assert(2 === arguments.length, "Expects exactly two arguments"), e.mapsExtendConditional(e.field.mapper.srcDefined, t, r);
          }
          //
          ,
          mapExtendNulls: function mapExtendNulls(t) {
            let r = e.longSlice(arguments);
            return r.unshift(e.field.mapper.srcNull), e.mapExtendConditional.apply(this, r);
          }
          //
          ,
          mapsExtendNulls: function mapsExtendNulls(t, r) {
            return e.assert(2 === arguments.length, "Expects exactly two arguments"), e.mapsExtendConditional(e.field.mapper.srcNull, t, r);
          }
          //
          /**
 * The mapSupplement() supplement destination map by source maps.
 * Pairs of destination map are not overwritten by pairs of source maps if any overlap.
 * Routine rewrite pairs of destination map which has key === undefined.
 *
 * @param { ...objectLike } arguments[] - The source object(s).
 *
 * @example
 * // returns { a : 1, b : 2, c : 3 }
 * let r = mapSupplement( { a : 1, b : 2 }, { a : 1, c : 3 } );
 *
 * @returns { objectLike } Returns an object with unique [ key, value ].
 * @function mapSupplement
 * @memberof wTools
 */ ,
          mapSupplement: function mapSupplement(t, r) {
            if (null === t && 2 === arguments.length) return Object.assign(Object.create(null), r);
            null === t && (t = Object.create(null)), e.assert(!e.primitiveIs(t));
            for (let e = 1; e < arguments.length; e++) {
              r = arguments[e];
              for (let e in r) e in t || (t[e] = r[e]);
            }
            return t;
          }
          //
          ,
          mapSupplementStructureless: function mapSupplementStructureless(t, r) {
            if (null === t && 2 === arguments.length) return Object.assign(Object.create(null), r);
            null === t && (t = Object.create(null));
            for (let n = 1; n < arguments.length; n++) {
              r = arguments[n];
              for (let n in r) if (void 0 === t[n]) {
                if (e.objectLike(r[n]) || e.arrayLike(r[n])) {
                  debugger;
                  throw Error("Source map should have only primitive elements, but have " + e.strType(r));
                }
                t[n] = r[n];
              }
            }
            return t;
          }
          //
          ,
          mapSupplementNulls: 
          //
          function mapSupplementNulls(t) {
            let r = e.longSlice(arguments);
            return r.unshift(e.field.mapper.dstNotHasOrHasNull), e.mapExtendConditional.apply(this, r);
          }
          //
          ,
          mapSupplementNils: function mapSupplementNils(t) {
            let r = e.longSlice(arguments);
            return r.unshift(e.field.mapper.dstNotHasOrHasNil), e.mapExtendConditional.apply(this, r);
          }
          //
          ,
          mapSupplementAssigning: function mapSupplementAssigning(t) {
            let r = e.longSlice(arguments);
            // args.unshift( _.field.mapper.dstNotOwnAssigning );
                        return r.unshift(e.field.mapper.dstNotHasAssigning), e.mapExtendConditional.apply(this, r);
          }
          //
          ,
          mapSupplementAppending: function mapSupplementAppending(t) {
            if (null === t && 2 === arguments.length) return Object.assign(Object.create(null), srcMap);
            let r = e.longSlice(arguments);
            return r.unshift(e.field.mapper.dstNotHasAppending), e.mapExtendConditional.apply(this, r);
          }
          //
          ,
          mapsSupplementAppending: function mapsSupplementAppending(t, r) {
            return e.assert(2 === arguments.length, "Expects exactly two arguments"), e.mapsExtendConditional(e.field.mapper.dstNotHasAppending, t, r);
          }
          //
          // function mapStretch( dstMap )
          ,
          mapSupplementOwn: function mapSupplementOwn(t, r) {
            if (null === t && 2 === arguments.length) return e.mapExtend(t, r);
            let n = e.longSlice(arguments);
            return n.unshift(e.field.mapper.dstNotOwn), e.mapExtendConditional.apply(this, n);
          }
          //
          ,
          mapsSupplementOwn: function mapsSupplementOwn(t, r) {
            return e.assert(2 === arguments.length, "Expects exactly two arguments"), null === t ? e.mapExtend(null, r[0]) : e.mapsExtendConditional(e.field.mapper.dstNotOwn, t, r);
          }
          //
          ,
          mapSupplementOwnAssigning: function mapSupplementOwnAssigning(t) {
            let r = e.longSlice(arguments);
            return r.unshift(e.field.mapper.dstNotOwnAssigning), e.mapExtendConditional.apply(this, r);
          }
          //
          ,
          mapSupplementOwnFromDefinition: function mapSupplementOwnFromDefinition(t, r) {
            let n = e.longSlice(arguments);
            return n.unshift(e.field.mapper.dstNotOwnFromDefinition), e.mapExtendConditional.apply(this, n);
          }
          //
          ,
          mapSupplementOwnFromDefinitionStrictlyPrimitives: function mapSupplementOwnFromDefinitionStrictlyPrimitives(t, r) {
            let n = e.longSlice(arguments);
            return n.unshift(e.field.mapper.dstNotOwnFromDefinitionStrictlyPrimitive), e.mapExtendConditional.apply(this, n);
          }
          //
          /**
 * The mapComplement() complement ( dstMap ) by one or several ( srcMap ).
 *
 * @param { ...objectLike } arguments[] - The source object(s).
 *
 * @example
 * // returns { a : 1, b : 'ab', c : 3 };
 * _.mapComplement( { a : 1, b : 'ab' }, { a : 12 , c : 3 } );
 *
 * @returns { objectLike } Returns an object filled by all unique, clone [ key, value ].
 * @function mapComplement
 * @memberof wTools
 */
          /* qqq : need to explain how undefined handled and write good documentation */ ,
          mapComplement: function mapComplement(t, n) {
            function dstNotOwnOrUndefinedAssigning(t, n, s) {
              r.call(t, s) && void 0 !== t[s] || e.entityAssignFieldFromContainer(t, n, s);
            }
            // _.assert( !!_.field.mapper );
            if (dstNotOwnOrUndefinedAssigning.functionFamily = "field-mapper", 2 === arguments.length) return e.mapExtendConditional(dstNotOwnOrUndefinedAssigning, t, n);
            let s = e.longSlice(arguments);
            return s.unshift(dstNotOwnOrUndefinedAssigning), e.mapExtendConditional.apply(this, s);
            /*
    filter should be defined explicitly instead of using _.field.mapper.dstNotOwnOrUndefinedAssigning
    to have mapComplement available as soon as possible
  */          }
          //
          ,
          mapsComplement: function mapsComplement(t, r) {
            return e.assert(2 === arguments.length, "Expects exactly two arguments"), e.mapsExtendConditional(e.field.mapper.dstNotOwnOrUndefinedAssigning, t, r);
          }
          //
          ,
          mapComplementReplacingUndefines: function mapComplementReplacingUndefines(t, r) {
            if (e.assert(!!e.field.mapper), 2 === arguments.length) return e.mapExtendConditional(e.field.mapper.dstNotOwnOrUndefinedAssigning, t, r);
            let n = e.longSlice(arguments);
            return n.unshift(e.field.mapper.dstNotOwnOrUndefinedAssigning), e.mapExtendConditional.apply(this, n);
          }
          //
          ,
          mapsComplementReplacingUndefines: function mapsComplementReplacingUndefines(t, r) {
            return e.assert(2 === arguments.length, "Expects exactly two arguments"), e.mapsExtendConditional(e.field.mapper.dstNotOwnOrUndefinedAssigning, t, r);
          }
          //
          ,
          mapComplementPreservingUndefines: function mapComplementPreservingUndefines(t) {
            let r = e.longSlice(arguments);
            return r.unshift(e.field.mapper.dstNotOwnAssigning), e.mapExtendConditional.apply(this, r);
          }
          //
          ,
          mapsComplementPreservingUndefines: function mapsComplementPreservingUndefines(t, r) {
            return e.assert(2 === arguments.length, "Expects exactly two arguments"), e.mapsExtendConditional(e.field.mapper.dstNotOwnAssigning, t, r);
          }
          //
          ,
          // map extend recursive
          mapExtendRecursiveConditional: 
          // --
          // map recursive
          // --
          function mapExtendRecursiveConditional(r, n, s) {
            e.assert(arguments.length >= 3, "Expects at least three arguments"), e.assert(this === t);
            let l = e.longSlice(arguments, 2);
            return e.mapsExtendRecursiveConditional(r, n, l);
          },
          mapsExtendRecursiveConditional: function mapsExtendRecursiveConditional(r, n, s) {
            e.assert(3 === arguments.length, "Expects exactly three arguments"), e.assert(this === t), 
            e.routineIs(r) && (r = {
              onUpFilter: r,
              onField: r
            }), void 0 === r.onUpFilter ? r.onUpFilter = r.onField : !0 === r.onUpFilter ? r.onUpFilter = _filterTrue : !1 === r.onUpFilter && (r.onUpFilter = _filterFalse), 
            !0 === r.onField ? r.onField = _filterTrue : !1 === r.onField && (r.onField = _filterFalse), 
            e.assert(e.routineIs(r.onUpFilter)), e.assert(e.routineIs(r.onField)), e.assert("field-filter" === r.onUpFilter.functionFamily), 
            e.assert("field-filter" === r.onField.functionFamily || "field-mapper" === r.onField.functionFamily);
            for (let e = 0; e < s.length; e++) _mapExtendRecursiveConditional(r, n, s[e]);
            return n;
          },
          _mapExtendRecursiveConditional: _mapExtendRecursiveConditional,
          mapExtendRecursive: function mapExtendRecursive(r, n) {
            e.assert(arguments.length >= 2, "Expects at least two arguments"), e.assert(this === t);
            for (let e = 1; e < arguments.length; e++) _mapExtendRecursive(r, arguments[e]);
            return r;
          }
          //
          ,
          mapsExtendRecursive: function mapsExtendRecursive(r, n) {
            e.assert(2 === arguments.length, "Expects exactly two arguments"), e.assert(this === t);
            for (let e = 1; e < n.length; e++) _mapExtendRecursive(r, n[e]);
            return r;
          },
          _mapExtendRecursive: _mapExtendRecursive,
          mapExtendAppendingAnythingRecursive: function mapExtendAppendingAnythingRecursive(r, n) {
            e.assert(this === t), e.assert(arguments.length >= 2, "Expects at least two arguments");
            let s = {
              onField: e.field.mapper.appendingAnything,
              onUpFilter: !0
            }, l = e.longSlice(arguments);
            return l.unshift(s), e.mapExtendRecursiveConditional.apply(e, l);
          }
          //
          ,
          mapsExtendAppendingAnythingRecursive: function mapsExtendAppendingAnythingRecursive(r, n) {
            e.assert(this === t), e.assert(2 === arguments.length, "Expects exactly two arguments");
            let s = {
              onField: e.field.mapper.appendingAnything,
              onUpFilter: !0
            };
            return e.mapsExtendRecursiveConditional.call(e, s, r, n);
          }
          //
          ,
          mapExtendAppendingArraysRecursive: function mapExtendAppendingArraysRecursive(r, n) {
            e.assert(this === t), e.assert(arguments.length >= 2, "Expects at least two arguments");
            let s = {
              onField: e.field.mapper.appendingArrays,
              onUpFilter: !0
            }, l = e.longSlice(arguments);
            return l.unshift(s), e.mapExtendRecursiveConditional.apply(e, l);
          }
          //
          ,
          mapsExtendAppendingArraysRecursive: function mapsExtendAppendingArraysRecursive(r, n) {
            e.assert(this === t), e.assert(2 === arguments.length, "Expects exactly two arguments");
            let s = {
              onField: e.field.mapper.appendingArrays,
              onUpFilter: !0
            };
            return e.mapsExtendRecursiveConditional.call(e, s, r, n);
          }
          //
          ,
          mapExtendAppendingOnceRecursive: function mapExtendAppendingOnceRecursive(r, n) {
            e.assert(this === t), e.assert(arguments.length >= 2, "Expects at least two arguments");
            let s = {
              onField: e.field.mapper.appendingOnce,
              onUpFilter: !0
            }, l = e.longSlice(arguments);
            return l.unshift(s), e.mapExtendRecursiveConditional.apply(e, l);
          }
          //
          ,
          mapsExtendAppendingOnceRecursive: function mapsExtendAppendingOnceRecursive(r, n) {
            e.assert(this === t), e.assert(2 === arguments.length, "Expects exactly two arguments");
            let s = {
              onField: e.field.mapper.appendingOnce,
              onUpFilter: !0
            };
            return e.mapsExtendRecursiveConditional.call(e, s, r, n);
          }
          //
          ,
          mapSupplementRecursive: function mapSupplementRecursive(r, n) {
            e.assert(this === t), e.assert(arguments.length >= 2, "Expects at least two arguments");
            let s = {
              onField: e.field.mapper.dstNotHas,
              onUpFilter: !0
            }, l = e.longSlice(arguments);
            return l.unshift(s), e.mapExtendRecursiveConditional.apply(e, l);
          }
          //
          ,
          mapSupplementByMapsRecursive: function mapSupplementByMapsRecursive(r, n) {
            e.assert(this === t), e.assert(2 === arguments.length, "Expects exactly two arguments");
            let s = {
              onField: e.field.mapper.dstNotHas,
              onUpFilter: !0
            };
            return e.mapsExtendRecursiveConditional.call(e, s, r, n);
          }
          //
          ,
          mapSupplementOwnRecursive: function mapSupplementOwnRecursive(r, n) {
            e.assert(this === t), e.assert(arguments.length >= 2, "Expects at least two arguments");
            let s = {
              onField: e.field.mapper.dstNotOwn,
              onUpFilter: !0
            }, l = e.longSlice(arguments);
            return l.unshift(s), e.mapExtendRecursiveConditional.apply(e, l);
          }
          //
          ,
          mapsSupplementOwnRecursive: function mapsSupplementOwnRecursive(r, n) {
            e.assert(this === t), e.assert(2 === arguments.length, "Expects exactly two arguments");
            let s = {
              onField: e.field.mapper.dstNotOwn,
              onUpFilter: !0
            };
            return e.mapsExtendRecursiveConditional.call(e, s, r, n);
          }
          //
          ,
          mapSupplementRemovingRecursive: function mapSupplementRemovingRecursive(r, n) {
            e.assert(this === t), e.assert(arguments.length >= 2, "Expects at least two arguments");
            let s = {
              onField: e.field.mapper.removing,
              onUpFilter: !0
            }, l = e.longSlice(arguments);
            return l.unshift(s), e.mapExtendRecursiveConditional.apply(e, l);
          }
          //
          ,
          mapSupplementByMapsRemovingRecursive: function mapSupplementByMapsRemovingRecursive(r, n) {
            e.assert(this === t), e.assert(2 === arguments.length, "Expects exactly two arguments");
            let s = {
              onField: e.field.mapper.removing,
              onUpFilter: !0
            };
            return e.mapsExtendRecursiveConditional.call(e, s, r, n);
          },
          // map manipulator
          mapSetWithKeys: mapSetWithKeys,
          mapSet: mapSetWithKeys,
          mapSetStrictly: function mapSetStrictly(t, r, n) {
            function set(t, r, n) {
              void 0 === n ? delete t[r] : (e.assert(void 0 === t[r] || t[r] === n), t[r] = n);
            }
            if (null === t && (t = Object.create(null)), e.assert(e.objectIs(t)), e.assert(e.arrayIs(r) || e.strIs(r)), 
            e.assert(3 === arguments.length, "Expects exactly three arguments"), e.arrayIs(r)) for (let e = 0; e < r.length; e++) set(t, r[e], n); else set(t, r, n);
            return t;
          },
          mapDelete: function mapDelete(t, r) {
            if (e.assert(1 === arguments.length || 2 === arguments.length), e.assert(e.objectLike(t)), 
            void 0 !== r) {
              e.assert(e.objectLike(r));
              for (let e in r) delete t[e];
            } else for (let e in t) delete t[e];
            return t;
          },
          // map transformer
          mapInvert: mapInvert,
          mapInvertDroppingDuplicates: 
          //
          function mapInvertDroppingDuplicates(t, r) {
            let n;
            r = r || Object.create(null), e.assert(1 === arguments.length || 2 === arguments.length), 
            e.assert(e.objectLike(t));
            for (let e in t) void 0 !== r[t[e]] && ((n = n || Object.create(null))[t[e]] = !0), 
            r[t[e]] = e;
            if (n) for (let e in n) delete r[e];
            return r;
          },
          mapsFlatten: mapsFlatten,
          mapToArray: 
          //
          /**
 * The mapToArray() converts an object {-srcMap-} into array [ [ key, value ] ... ].
 *
 * It takes an object {-srcMap-} creates an empty array,
 * checks if ( arguments.length === 1 ) and {-srcMap-} is an object.
 * If true, it returns a list of [ [ key, value ] ... ] pairs.
 * Otherwise it throws an Error.
 *
 * @param { objectLike } src - object to get a list of [ key, value ] pairs.
 *
 * @example
 * // returns [ [ 'a', 3 ], [ 'b', 13 ], [ 'c', 7 ] ]
 * _.mapToArray( { a : 3, b : 13, c : 7 } );
 *
 * @returns { array } Returns a list of [ [ key, value ] ... ] pairs.
 * @function mapToArray
 * @throws { Error } Will throw an Error if( arguments.length !== 1 ) or {-srcMap-} is not an object.
 * @memberof wTools
 */
          function mapToArray(t) {
            return e.mapPairs(t);
          },
          /* qqq : test required */
          mapToStr: mapToStr,
          /* experimental */
          // map selector
          _mapEnumerableKeys: 
          // --
          // map selector
          // --
          function _mapEnumerableKeys(t, n) {
            let s = [];
            if (e.assert(2 === arguments.length, "Expects exactly two arguments"), e.assert(!e.primitiveIs(t)), 
            n) for (let e in t) r.call(t, e) && s.push(e); else for (let e in t) s.push(e);
            return s;
          },
          _mapKeys: _mapKeys,
          mapKeys: mapKeys,
          mapOwnKeys: mapOwnKeys,
          mapAllKeys: mapAllKeys,
          _mapVals: _mapVals,
          mapVals: mapVals,
          mapOwnVals: mapOwnVals,
          mapAllVals: mapAllVals,
          _mapPairs: _mapPairs,
          mapPairs: mapPairs,
          mapOwnPairs: mapOwnPairs,
          mapAllPairs: mapAllPairs,
          _mapProperties: _mapProperties,
          mapProperties: mapProperties,
          mapProperties: mapProperties,
          mapOwnProperties: mapOwnProperties,
          mapAllProperties: mapAllProperties,
          mapRoutines: mapRoutines,
          mapRoutines: mapRoutines,
          mapOwnRoutines: mapOwnRoutines,
          mapAllRoutines: mapAllRoutines,
          mapFields: mapFields,
          mapFields: mapFields,
          mapOwnFields: mapOwnFields,
          mapAllFields: mapAllFields,
          mapOnlyPrimitives: 
          //
          /**
 * The mapOnlyPrimitives() gets all object`s {-srcMap-} enumerable atomic fields( null, undef, number, string, symbol ) and returns them as new map.
 *
 * It takes an object {-srcMap-} creates an empty map,
 * checks if {-srcMap-} is an object.
 * If true, it copies object`s {-srcMap-} enumerable atomic properties to the new map using
 * their original name/value and returns the result, otherwise it returns empty map.
 *
 * @param { objectLike } srcMap - Object to get a map of atomic properties.
 *
 * @example
 * let a = {};
 * Object.defineProperty( a, 'x', { enumerable : 0, value : 3 } )
 * _.mapOnlyPrimitives( a );
 * // returns { }
 *
 * @example
 * let a = { a : 1 };
 * let b = { b : 2, c : function(){} };
 * Object.setPrototypeOf( a, b );
 * _.mapOnlyPrimitives( a );
 * //returns { a : 1, b : 2 }
 *
 * @returns { object } A new map with all atomic fields from source {-srcMap-}.
 * @function mapOnlyPrimitives
 * @throws { Error } Will throw an Error if {-srcMap-} is not an Object.
 * @memberof wTools
 */
          function mapOnlyPrimitives(t) {
            return e.assert(1 === arguments.length, "Expects single argument"), e.assert(!e.primitiveIs(t)), 
            e.mapExtendConditional(e.field.mapper.primitive, Object.create(null), t);
          }
          //
          /**
 * The mapFirstPair() routine returns first pair [ key, value ] as array.
 *
 * @param { objectLike } srcMap - An object like entity of get first pair.
 *
 * @example
 * // returns [ 'a', 3 ]
 * _.mapFirstPair( { a : 3, b : 13 } );
 *
 * @example
 * // returns 'undefined'
 * _.mapFirstPair( {  } );
 *
 * @example
 * // returns [ '0', [ 'a', 7 ] ]
 * _.mapFirstPair( [ [ 'a', 7 ] ] );
 *
 * @returns { Array } Returns pair [ key, value ] as array if {-srcMap-} has fields, otherwise, undefined.
 * @function mapFirstPair
 * @throws { Error } Will throw an Error if (arguments.length) less than one, if {-srcMap-} is not an object-like.
 * @memberof wTools
 */ ,
          mapFirstPair: function mapFirstPair(t) {
            e.assert(1 === arguments.length, "Expects single argument"), e.assert(e.objectLike(t));
            for (let e in t) return [ e, t[e] ];
            return [];
          }
          //
          ,
          mapValsSet: function mapValsSet(t, r) {
            e.assert(2 === arguments.length, "Expects exactly two arguments");
            for (let e in t) t[e] = r;
            return t;
          }
          //
          ,
          mapSelect: function mapSelect(t, r) {
            let n = Object.create(null);
            e.assert(e.arrayLike(r)), e.assert(!e.primitiveIs(t));
            for (let s = 0; s < r.length; s++) {
              let l = r[s];
              e.assert(e.strIs(l) || e.numberIs(l)), n[l] = t[l];
            }
            return n;
          }
          //
          /**
 * The mapValWithIndex() returns value of {-srcMap-} by corresponding (index).
 *
 * It takes {-srcMap-} and (index), creates a variable ( i = 0 ),
 * checks if ( index > 0 ), iterate over {-srcMap-} object-like and match
 * if ( i == index ).
 * If true, it returns value of {-srcMap-}.
 * Otherwise it increment ( i++ ) and iterate over {-srcMap-} until it doesn't match index.
 *
 * @param { objectLike } srcMap - An object-like.
 * @param { number } index - To find the position an element.
 *
 * @example
 * // returns 7
 * _.mapValWithIndex( [ 3, 13, 'c', 7 ], 3 );
 *
 * @returns { * } Returns value of {-srcMap-} by corresponding (index).
 * @function mapValWithIndex
 * @throws { Error } Will throw an Error if( arguments.length > 2 ) or {-srcMap-} is not an Object.
 * @memberof wTools
 */ ,
          mapValWithIndex: function mapValWithIndex(t, r) {
            if (e.assert(2 === arguments.length, "Expects exactly two arguments"), e.assert(!e.primitiveIs(t)), 
            r < 0) return;
            let n = 0;
            for (let e in t) {
              if (n == r) return t[e];
              n++;
            }
          }
          //
          /**
 * The mapKeyWithIndex() returns key of {-srcMap-} by corresponding (index).
 *
 * It takes {-srcMap-} and (index), creates a variable ( i = 0 ),
 * checks if ( index > 0 ), iterate over {-srcMap-} object-like and match
 * if ( i == index ).
 * If true, it returns value of {-srcMap-}.
 * Otherwise it increment ( i++ ) and iterate over {-srcMap-} until it doesn't match index.
 *
 * @param { objectLike } srcMap - An object-like.
 * @param { number } index - To find the position an element.
 *
 * @example
 * // returns '1'
 * _.mapKeyWithIndex( [ 'a', 'b', 'c', 'd' ], 1 );
 *
 * @returns { string } Returns key of {-srcMap-} by corresponding (index).
 * @function mapKeyWithIndex
 * @throws { Error } Will throw an Error if( arguments.length > 2 ) or {-srcMap-} is not an Object.
 * @memberof wTools
 */ ,
          mapKeyWithIndex: function mapKeyWithIndex(t, r) {
            if (e.assert(2 === arguments.length, "Expects exactly two arguments"), e.assert(!e.primitiveIs(t)), 
            r < 0) return;
            let n = 0;
            for (let e in t) {
              if (n == r) return e;
              n++;
            }
          }
          //
          ,
          mapKeyWithValue: function mapKeyWithValue(t, r) {
            e.assert(2 === arguments.length, "Expects exactly two arguments"), e.assert(!e.primitiveIs(t));
          }
          //
          ,
          mapIndexWithKey: function mapIndexWithKey(t, r) {
            e.assert(2 === arguments.length, "Expects exactly two arguments"), e.assert(!e.primitiveIs(t));
            for (let e in t) if (e === r) return e;
          }
          //
          ,
          mapIndexWithValue: function mapIndexWithValue(t, r) {
            e.assert(2 === arguments.length, "Expects exactly two arguments"), e.assert(!e.primitiveIs(t));
            for (let e in t) if (t[e] === r) return e;
          }
          //
          ,
          mapNulls: function mapNulls(t) {
            let r = Object.create(null);
            e.assert(1 === arguments.length), e.assert(!e.primitiveIs(t));
            for (let e in t) null === t[e] && (r[e] = null);
            return r;
          }
          //
          ,
          mapButNulls: function mapButNulls(t) {
            let r = Object.create(null);
            e.assert(1 === arguments.length), e.assert(!e.primitiveIs(t));
            for (let e in t) null !== t[e] && (r[e] = t[e]);
            return r;
          }
          // --
          // map logic operator
          // --
          /**
 * The mapButConditional() routine returns a new object (result)
 * whose (values) are not equal to the arrays or objects.
 *
 * Takes any number of objects.
 * If the first object has same key any other object has
 * then this pair [ key, value ] will not be included into (result) object.
 * Otherwise,
 * it calls a provided callback function( _.field.mapper.primitive )
 * once for each key in the {-srcMap-}, and adds to the (result) object
 * all the [ key, value ],
 * if values are not equal to the array or object.
 *
 * @param { function } filter.primitive() - Callback function to test each [ key, value ] of the {-srcMap-} object.
 * @param { objectLike } srcMap - The target object.
 * @param { ...objectLike } arguments[] - The next objects.
 *
 * @example
 * // returns { a : 1, b : "b" }
 * mapButConditional( _.field.mapper.primitive, { a : 1, b : 'b', c : [ 1, 2, 3 ] } );
 *
 * @returns { object } Returns an object whose (values) are not equal to the arrays or objects.
 * @function mapButConditional
 * @throws { Error } Will throw an Error if {-srcMap-} is not an object.
 * @memberof wTools
 */ ,
          // map logic operator
          mapButConditional: function mapButConditional(t, r, n) {
            let s = Object.create(null);
            if (e.assert(3 === arguments.length, "Expects exactly three arguments"), e.assert(!e.primitiveIs(n), "Expects map {-butMap-}"), 
            e.assert(!e.primitiveIs(r) && !e.longIs(r), "Expects map {-srcMap-}"), e.assert(t && 3 === t.length && "field-filter" === t.functionFamily, "Expects field-filter {-fieldFilter-}"), 
            e.arrayLike(n)) for (let e in r) {
              let l;
              for (l = 0; l < n.length && t(n[l], r, e); l++) ;
              l === n.length && (s[e] = r[e]);
            } else for (let e in r) t(n, r, e) && (s[e] = r[e]);
            return s;
          }
          //
          /**
 * Returns new object with unique keys.
 *
 * Takes any number of objects.
 * Returns new object filled by unique keys
 * from the first {-srcMap-} original object.
 * Values for result object come from original object {-srcMap-}
 * not from second or other one.
 * If the first object has same key any other object has
 * then this pair( key/value ) will not be included into result object.
 * Otherwise pair( key/value ) from the first object goes into result object.
 *
 * @param{ objectLike } srcMap - original object.
 * @param{ ...objectLike } arguments[] - one or more objects.
 * Objects to return an object without repeating keys.
 *
 * @example
 * // returns { c : 3 }
 * mapBut( { a : 7, b : 13, c : 3 }, { a : 7, b : 13 } );
 *
 * @throws { Error }
 *  In debug mode it throws an error if any argument is not object like.
 * @returns { object } Returns new object made by unique keys.
 * @function mapBut
 * @memberof wTools
 */ ,
          mapBut: function mapBut(t, r) {
            let n = Object.create(null);
            if (e.arrayLike(t) && (t = e.mapMake.apply(this, t)), e.assert(2 === arguments.length, "Expects exactly two arguments"), 
            e.assert(!e.primitiveIs(r), "Expects map {-butMap-}"), e.assert(!e.primitiveIs(t) && !e.arrayLike(t), "Expects map {-srcMap-}"), 
            e.arrayLike(r)) for (let e in t) {
              let s;
              for (s = 0; s < r.length && !(e in r[s]); s++) ;
              s === r.length && (n[e] = t[e]);
            } else for (let e in t) e in r || (n[e] = t[e]);
            return n;
          }
          //
          /**
 * Returns new object with unique keys.
 *
 * Takes any number of objects.
 * Returns new object filled by unique keys
 * from the first {-srcMap-} original object.
 * Values for result object come from original object {-srcMap-}
 * not from second or other one.
 * If the first object has same key any other object has
 * then this pair( key/value ) will not be included into result object.
 * Otherwise pair( key/value ) from the first object goes into result object.
 *
 * @param{ objectLike } srcMap - original object.
 * @param{ ...objectLike } arguments[] - one or more objects.
 * Objects to return an object without repeating keys.
 *
 * @example
 * // returns { c : 3 }
 * mapButIgnoringUndefines( { a : 7, b : 13, c : 3 }, { a : 7, b : 13 } );
 *
 * @throws { Error }
 *  In debug mode it throws an error if any argument is not object like.
 * @returns { object } Returns new object made by unique keys.
 * @function mapButIgnoringUndefines
 * @memberof wTools
 */ ,
          mapButIgnoringUndefines: function mapButIgnoringUndefines(t, r) {
            return Object.create(null), e.assert(2 === arguments.length, "Expects exactly two arguments"), 
            e.mapButConditional(e.field.filter.dstUndefinedSrcNotUndefined, t, r);
            // return _.mapButConditional( _.field.filter.dstHasButUndefined, butMap, srcMap );
                    }
          // function mapButIgnoringUndefines( srcMap, butMap )
          // {
          //   let result = Object.create( null );
          //
          //   _.assert( arguments.length === 2, 'Expects exactly two arguments' );
          //   _.assert( !_.primitiveIs( butMap ), 'Expects map {-butMap-}' );
          //   _.assert( !_.primitiveIs( srcMap ) && !_.longIs( srcMap ), 'Expects map {-srcMap-}' );
          //
          //   if( _.arrayLike( butMap ) )
          //   {
          //
          //     for( let s in srcMap )
          //     {
          //
          //       if( srcMap[ k ] === undefined )
          //       continue;
          //
          //       for( let m = 0 ; m < butMap.length ; m++ )
          //       {
          //         if( butMap[ m ][ s ] === undefined )
          //         break;
          //       }
          //
          //       if( m === butMap.length )
          //       result[ s ] = srcMap[ s ];
          //
          //     }
          //
          //   }
          //   else
          //   {
          //
          //     for( let s in srcMap )
          //     {
          //
          //       if( srcMap[ k ] === undefined )
          //       continue;
          //
          //       if( butMap[ s ] === undefined )
          //       {
          //         result[ s ] = srcMap[ s ];
          //       }
          //
          //     }
          //
          //   }
          //
          //   return result;
          // }
          //
          //
          //
          // function mapButIgnoringUndefines( srcMap )
          // {
          //   let result = Object.create( null );
          //   let a, k;
          //
          //   _.assert( arguments.length >= 2 );
          //   _.assert( !_.primitiveIs( srcMap ), 'Expects object as argument' );
          //
          //   for( k in srcMap )
          //   {
          //
          //     for( a = 1 ; a < arguments.length ; a++ )
          //     {
          //       let argument = arguments[ a ];
          //
          //       _.assert( !_.primitiveIs( argument ), 'argument', '#'+a, 'is not object' );
          //
          //       if( k in argument )
          //       if( argument[ k ] !== undefined )
          //       break;
          //
          //     }
          //     if( a === arguments.length )
          //     {
          //       result[ k ] = srcMap[ k ];
          //     }
          //   }
          //
          //   return result;
          // }
          //
          // //
          //
          // function mapBut( srcMap )
          // {
          //   let result = Object.create( null );
          //   let a, k;
          //
          //   _.assert( arguments.length >= 2 );
          //   _.assert( !_.primitiveIs( srcMap ), 'mapBut :', 'Expects object as argument' );
          //
          //   for( k in srcMap )
          //   {
          //     for( a = 1 ; a < arguments.length ; a++ )
          //     {
          //       let argument = arguments[ a ];
          //
          //       _.assert( !_.primitiveIs( argument ), 'argument', '#'+a, 'is not object' );
          //
          //       if( k in argument )
          //       break;
          //
          //     }
          //     if( a === arguments.length )
          //     {
          //       result[ k ] = srcMap[ k ];
          //     }
          //   }
          //
          //   return result;
          // }
          //
          //
          /**
 * The mapOwnBut() returns new object with unique own keys.
 *
 * Takes any number of objects.
 * Returns new object filled by unique own keys
 * from the first {-srcMap-} original object.
 * Values for (result) object come from original object {-srcMap-}
 * not from second or other one.
 * If {-srcMap-} does not have own properties it skips rest of code and checks another properties.
 * If the first object has same key any other object has
 * then this pair( key/value ) will not be included into result object.
 * Otherwise pair( key/value ) from the first object goes into result object.
 *
 * @param { objectLike } srcMap - The original object.
 * @param { ...objectLike } arguments[] - One or more objects.
 *
 * @example
 * // returns { a : 7 }
 * mapBut( { a : 7, 'toString' : 5 }, { b : 33, c : 77 } );
 *
 * @returns { object } Returns new (result) object with unique own keys.
 * @function mapOwnBut
 * @throws { Error } Will throw an Error if {-srcMap-} is not an object.
 * @memberof wTools
 */ ,
          mapOwnBut: function mapOwnBut(t, r) {
            return Object.create(null), e.assert(2 === arguments.length, "Expects exactly two arguments"), 
            e.mapButConditional(e.field.filter.dstNotHasSrcOwn, t, r);
          }
          //
          /**
 * @namespace
 * @property { objectLike } screenMaps.screenMap - The first object.
 * @property { ...objectLike } srcMap.arguments[1, ...] -
 * The pseudo array (arguments[]) from the first [1] index to the end.
 * @property { object } dstMap - The empty object.
 */
          /**
 * The mapOnly() returns an object filled by unique [ key, value ]
 * from others objects.
 *
 * It takes number of objects, creates a new object by three properties
 * and calls the _mapOnly( {} ) with created object.
 *
 * @see  {@link wTools._mapOnly} - See for more information.
 *
 * @param { objectLike } screenMap - The first object.
 * @param { ...objectLike } arguments[] - One or more objects.
 *
 * @example
 * // returns { a : "abc", c : 33, d : "name" };
 * _.mapOnly( { a : 13, b : 77, c : 3, d : 'name' }, { d : 'name', c : 33, a : 'abc' } );
 *
 * @returns { Object } Returns the object filled by unique [ key, value ]
 * from others objects.
 * @function mapOnly
 * @throws { Error } Will throw an Error if (arguments.length < 2) or (arguments.length !== 2).
 * @memberof wTools
 */ ,
          mapOnly: function mapOnly(t, r) {
            return 1 === arguments.length ? e.mapsExtend(null, t) : (e.assert(1 === arguments.length || 2 === arguments.length, "Expects single or two arguments"), 
            _mapOnly({
              srcMaps: t,
              screenMaps: r,
              dstMap: Object.create(null)
            }));
          }
          //
          ,
          mapOnlyOwn: function mapOnlyOwn(t, r) {
            return 1 === arguments.length ? e.mapsExtendConditional(e.field.mapper.srcOwn, null, t) : (e.assert(1 === arguments.length || 2 === arguments.length, "Expects single or two arguments"), 
            _mapOnly({
              filter: e.field.mapper.srcOwn,
              srcMaps: t,
              screenMaps: r,
              dstMap: Object.create(null)
            }));
          }
          //
          ,
          mapOnlyComplementing: function mapOnlyComplementing(t, r) {
            return e.assert(1 === arguments.length || 2 === arguments.length, "Expects single or two arguments"), 
            _mapOnly({
              filter: e.field.mapper.dstNotOwnOrUndefinedAssigning,
              srcMaps: t,
              screenMaps: r,
              dstMap: Object.create(null)
            });
          },
          _mapOnly: _mapOnly,
          // map surer
          sureMapHasExactly: 
          // --
          // map sure
          // --
          function sureMapHasExactly(t, r, n) {
            let s = !0;
            return s = (s = s && e.sureMapHasOnly.apply(this, arguments)) && e.sureMapHasAll.apply(this, arguments), 
            !0;
          }
          //
          ,
          sureMapOwnExactly: function sureMapOwnExactly(t, r, n) {
            let s = !0;
            return s = (s = s && e.sureMapOwnOnly.apply(this, arguments)) && e.sureMapOwnAll.apply(this, arguments), 
            !0;
          }
          //
          /**
 * Checks if map passed by argument {-srcMap-} has only properties represented in object(s) passed after first argument. Checks all enumerable properties.
 * Works only in debug mode. Uses StackTrace level 2. {@link wTools.err See err}
 * If routine found some unique properties in source it generates and throws exception, otherwise returns without exception.
 * Also generates error using message passed after last object. Message may be a string, an array, or a function.
 *
 * @param { Object } srcMap - source map.
 * @param { Object } screenMaps - object to compare with.
 * @param { * } [ msg ] - error message for generated exception.
 * @param { * } [ msg ] - error message that adds to the message in third argument.
 *
 * @example
 * let a = { a : 1, b : 3 };
 * let b = { a : 2, b : 3 };
 * wTools.sureMapHasOnly( a, b );
 *
 * // no exception
 *
 * @example
 * let a = { a : 1, c : 3 };
 * let b = { a : 2, b : 3 };
 * wTools.sureMapHasOnly( a, b );
 *
 * // caught <anonymous>:3:8
 * // Object should have no fields : c
 * //
 * // at _err (file:///.../wTools/staging/Base.s:3707)
 * // at sureMapHasOnly (file:///.../wTools/staging/Base.s:4188)
 * // at <anonymous>:3
 *
 * @example
 * let x = { d : 1 };
 * let a = Object.create( x );
 * let b = { a : 1 };
 * wTools.sureMapHasOnly( a, b, 'message' )
 *
 * // caught <anonymous>:4:8
 * // message Object should have no fields : d
 * //
 * // at _err (file:///.../wTools/staging/Base.s:3707)
 * // at sureMapHasOnly (file:///.../wTools/staging/Base.s:4188)
 * // at <anonymous>:4
 *
 * @example
 * let x = { d : 1 };
 * let a = Object.create( x );
 * let b = { a : 1 };
 * wTools.sureMapHasOnly( a, b, () => 'message, ' + 'map`, ' should have no fields :'  )
 *
 * // caught <anonymous>:4:8
 * // message Object should have no fields : d
 * //
 * // at _err (file:///.../wTools/staging/Base.s:3707)
 * // at sureMapHasOnly (file:///.../wTools/staging/Base.s:4188)
 * // at <anonymous>:4
 *
 * @function sureMapHasOnly
 * @throws {Exception} If no arguments are provided or more than four arguments are provided.
 * @throws {Exception} If map {-srcMap-} contains unique property.
 * @memberof wTools
 *
 */ ,
          sureMapHasOnly: function sureMapHasOnly(t, r, n) {
            e.assert(2 === arguments.length || 3 === arguments.length || 4 === arguments.length, "Expects two, three or four arguments");
            let s = Object.keys(e.mapBut(t, r));
            if (s.length > 0) {
              debugger;
              if (2 === arguments.length) throw e._err({
                args: [ e.strType(t) + " should have no fields :", e.strQuote(s).join(", ") ],
                level: 2
              });
              {
                let t = [];
                for (let r = 2; r < arguments.length; r++) e.routineIs(arguments[r]) && (arguments[r] = arguments[r]()), 
                t[r] = arguments[r];
                throw e._err({
                  args: [ t.join(" "), e.strQuote(s).join(", ") ],
                  level: 2
                });
              }
            }
            return !0;
          }
          //
          /**
 * Checks if map passed by argument {-srcMap-} has only properties represented in object(s) passed after first argument. Checks only own properties of the objects.
 * Works only in debug mode. Uses StackTrace level 2.{@link wTools.err See err}
 * If routine found some unique properties in source it generates and throws exception, otherwise returns without exception.
 * Also generates error using message passed after last object. Message may be a string, an array, or a function.
 *
 * @param { Object } srcMap - source map.
 * @param { Object } screenMaps - object to compare with.
 * @param { * } [ msg ] - error message for generated exception.
 * @param { * } [ msg ] - error message that adds to the message in third argument.
 *
 * @example
 * let x = { d : 1 };
 * let a = Object.create( x );
 * a.a = 5;
 * let b = { a : 2 };
 * wTools.sureMapOwnOnly( a, b );
 *
 * //no exception
 *
 * @example
 * let a = { d : 1 };
 * let b = { a : 2 };
 * wTools.sureMapOwnOnly( a, b );
 *
 * // caught <anonymous>:3:10
 * // Object should have no own fields : d
 * //
 * // at _err (file:///.../wTools/staging/Base.s:3707)
 * // at sureMapOwnOnly (file:///.../wTools/staging/Base.s:4215)
 * // at <anonymous>:3
 *
 * @example
 * let a = { x : 0, y : 2 };
 * let b = { c : 0, d : 3};
 * let c = { a : 1 };
 * wTools.sureMapOwnOnly( a, b, 'error msg' );
 *
 * // caught <anonymous>:4:8
 * // error msg Object should have no own fields : x, y
 * //
 * // at _err (file:///.../wTools/staging/Base.s:3707)
 * // at sureMapOwnOnly (file:///.../wTools/staging/Base.s:4215)
 * // at <anonymous>:4
 *
 * @example
 * let a = { x : 0, y : 2 };
 * let b = { c : 0, d : 3};
 * let c = { a : 1 };
 * wTools.sureMapOwnOnly( a, b, () => 'error, ' + 'map should', ' no own fields :' );
 *
 * // caught <anonymous>:4:9
 * // error, map should have no own fields : x, y
 * //
 * // at _err (file:///.../wTools/staging/Base.s:3707)
 * // at sureMapOwnOnly (file:///.../wTools/staging/Base.s:4215)
 * // at <anonymous>:3
 *
 * @function sureMapOwnOnly
 * @throws {Exception} If no arguments are provided or more than four arguments are provided.
 * @throws {Exception} If map {-srcMap-} contains unique property.
 * @memberof wTools
 *
 */ ,
          sureMapOwnOnly: function sureMapOwnOnly(t, r, n) {
            e.assert(2 === arguments.length || 3 === arguments.length || 4 === arguments.length, "Expects two, three or four arguments");
            let s = Object.keys(e.mapOwnBut(t, r));
            if (s.length > 0) {
              debugger;
              if (2 === arguments.length) throw e._err({
                args: [ e.strType(t) + " should own no fields :", e.strQuote(s).join(", ") ],
                level: 2
              });
              {
                let t = [];
                for (let r = 2; r < arguments.length; r++) e.routineIs(arguments[r]) && (arguments[r] = arguments[r]()), 
                t[r] = arguments[r];
                throw e._err({
                  args: [ t.join(" "), e.strQuote(s).join(", ") ],
                  level: 2
                });
              }
            }
            return !0;
          }
          //
          /**
 * Checks if map passed by argument {-srcMap-} has all properties represented in object passed by argument( all ). Checks all enumerable properties.
 * Works only in debug mode. Uses StackTrace level 2.{@link wTools.err See err}
 * If routine did not find some properties in source it generates and throws exception, otherwise returns without exception.
 * Also generates error using message passed after last object. Message may be a string, an array, or a function.
 *
 * @param { Object } srcMap - source map.
 * @param { Object } all - object to compare with.
 * @param { * } [ msg ] - error message for generated exception.
 * @param { * } [ msg ] - error message that adds to the message in third argument.
 *
 * @example
 * let x = { a : 1 };
 * let a = Object.create( x );
 * let b = { a : 2 };
 * wTools.sureMapHasAll( a, b );
 *
 * // no exception
 *
 * @example
 * let a = { d : 1 };
 * let b = { a : 2 };
 * wTools.sureMapHasAll( a, b );
 *
 * // caught <anonymous>:3:10
 * // Object should have fields : a
 * //
 * // at _err (file:///.../wTools/staging/Base.s:3707)
 * // at sureMapHasAll (file:///.../wTools/staging/Base.s:4242)
 * // at <anonymous>:3
 *
 * @example
 * let a = { x : 0, y : 2 };
 * let b = { x : 0, d : 3};
 * wTools.sureMapHasAll( a, b, 'error msg' );
 *
 * // caught <anonymous>:4:9
 * // error msg Object should have fields : d
 * //
 * // at _err (file:///.../wTools/staging/Base.s:3707)
 * // at sureMapHasAll (file:///.../wTools/staging/Base.s:4242)
 * // at <anonymous>:3
 *
 * @example
 * let a = { x : 0 };
 * let b = { x : 1, y : 0};
 * wTools.sureMapHasAll( a, b, () => 'error, ' + 'map should', ' have fields :' );
 *
 * // caught <anonymous>:4:9
 * // error, map should have fields : y
 * //
 * // at _err (file:///.../wTools/staging/Base.s:3707)
 * // at sureMapHasAll (file:///.../wTools/staging/Base.s:4242)
 * // at <anonymous>:3
 *
 * @function sureMapHasAll
 * @throws {Exception} If no arguments are provided or more than four arguments are provided.
 * @throws {Exception} If map {-srcMap-} not contains some properties from argument( all ).
 * @memberof wTools
 *
 */ ,
          sureMapHasAll: function sureMapHasAll(t, r, n) {
            e.assert(2 === arguments.length || 3 === arguments.length || 4 === arguments.length, "Expects two, three or four arguments");
            let s = Object.keys(e.mapBut(r, t));
            if (s.length > 0) {
              debugger;
              if (2 === arguments.length) throw e._err({
                args: [ e.strType(t) + " should have fields :", e.strQuote(s).join(", ") ],
                level: 2
              });
              {
                let t = [];
                for (let r = 2; r < arguments.length; r++) e.routineIs(arguments[r]) && (arguments[r] = arguments[r]()), 
                t[r] = arguments[r];
                throw e._err({
                  args: [ t.join(" "), e.strQuote(s).join(", ") ],
                  level: 2
                });
              }
            }
            return !0;
          }
          //
          /**
 * Checks if map passed by argument {-srcMap-} has all properties represented in object passed by argument( all ). Checks only own properties of the objects.
 * Works only in Config.debug mode. Uses StackTrace level 2. {@link wTools.err See err}
 * If routine did not find some properties in source it generates and throws exception, otherwise returns without exception.
 * Also generates error using message passed after last object. Message may be a string, an array, or a function.
 *
 * @param { Object } srcMap - source map.
 * @param { Object } all - object to compare with.
 * @param { * } [ msg ] - error message for generated exception.
 * @param { * } [ msg ] - error message that adds to the message in third argument.
 *
 * @example
 * let a = { a : 1 };
 * let b = { a : 2 };
 * wTools.sureMapOwnAll( a, b );
 *
 * // no exception
 *
 * @example
 * let a = { a : 1 };
 * let b = { a : 2, b : 2 }
 * wTools.sureMapOwnAll( a, b );
 *
 * // caught <anonymous>:3:8
 * // Object should have own fields : b
 * //
 * // at _err (file:///.../wTools/staging/Base.s:3707)
 * // at sureMapOwnAll (file:///.../wTools/staging/Base.s:4269)
 * // at <anonymous>:3
 *
 * @example
 * let a = { x : 0 };
 * let b = { x : 1, y : 0};
 * wTools.sureMapOwnAll( a, b, 'error, should own fields' );
 *
 * // caught <anonymous>:4:9
 * // error, should own fields : y
 * //
 * // at _err (file:///.../wTools/staging/Base.s:3707)
 * // at sureMapOwnAll (file:///.../wTools/staging/Base.s:4269)
 * // at <anonymous>:3
 *
 * @example
 * let a = { x : 0 };
 * let b = { x : 1, y : 0};
 * wTools.sureMapOwnAll( a, b, () => 'error, ' + 'map should', ' own fields :' );
 *
 * // caught <anonymous>:4:9
 * // error, map should own fields : y
 * //
 * // at _err (file:///.../wTools/staging/Base.s:3707)
 * // at sureMapOwnAll (file:///.../wTools/staging/Base.s:4269)
 * // at <anonymous>:3
 *
 * @function sureMapOwnAll
 * @throws {Exception} If no arguments are provided or more than four arguments are provided.
 * @throws {Exception} If map {-srcMap-} not contains some properties from argument( all ).
 * @memberof wTools
 *
 */ ,
          sureMapOwnAll: function sureMapOwnAll(t, r, n) {
            e.assert(2 === arguments.length || 3 === arguments.length || 4 === arguments.length, "Expects two, three or four arguments");
            let s = Object.keys(e.mapOwnBut(r, t));
            if (s.length > 0) {
              debugger;
              if (2 === arguments.length) throw e._err({
                args: [ e.strType(t) + " should own fields :", e.strQuote(s).join(", ") ],
                level: 2
              });
              {
                let t = [];
                for (let r = 2; r < arguments.length; r++) e.routineIs(arguments[r]) && (arguments[r] = arguments[r]()), 
                t[r] = arguments[r];
                throw e._err({
                  args: [ t.join(" "), e.strQuote(s).join(", ") ],
                  level: 2
                });
              }
            }
            return !0;
          }
          //
          /**
 * Checks if map passed by argument {-srcMap-} has no properties represented in object(s) passed after first argument. Checks all enumerable properties.
 * Works only in debug mode. Uses StackTrace level 2. {@link wTools.err See err}
 * If routine found some properties in source it generates and throws exception, otherwise returns without exception.
 * Also generates error using message passed after last object. Message may be a string, an array, or a function.
 *
 * @param { Object } srcMap - source map.
 * @param {...Object} screenMaps - object(s) to compare with.
 * @param { * } [ msg ] - error message for generated exception.
 * @param { * } [ msg ] - error message that adds to the message in third argument.
 *
 * @example
 * let a = { a : 1 };
 * let b = { b : 2 };
 * wTools.sureMapHasNone( a, b );
 *
 * // no exception
 *
 * @example
 * let x = { a : 1 };
 * let a = Object.create( x );
 * let b = { a : 2, b : 2 }
 * wTools.sureMapHasNone( a, b );
 *
 * // caught <anonymous>:4:8
 * // Object should have no fields : a
 * //
 * // at _err (file:///.../wTools/staging/Base.s:3707)
 * // at sureMapHasAll (file:///.../wTools/staging/Base.s:4518)
 * // at <anonymous>:4
 *
 * @example
 * let a = { x : 0, y : 1 };
 * let b = { x : 1, y : 0 };
 * wTools.sureMapHasNone( a, b, 'error, map should have no fields' );
 *
 * // caught <anonymous>:3:9
 * // error, map should have no fields : x, y
 * //
 * // at _err (file:///.../wTools/staging/Base.s:3707)
 * // at sureMapHasNone (file:///.../wTools/staging/Base.s:4518)
 * // at <anonymous>:3
 *
 * @example
 * let a = { x : 0, y : 1 };
 * let b = { x : 1, y : 0 };
 * wTools.sureMapHasNone( a, b, () => 'error, ' + 'map should have', 'no fields :' );
 *
 * // caught <anonymous>:3:9
 * // error, map should have no fields : x, y
 * //
 * // at _err (file:///.../wTools/staging/Base.s:3707)
 * // at sureMapHasNone (file:///.../wTools/staging/Base.s:4518)
 * // at <anonymous>:3
 *
 * @function sureMapHasNone
 * @throws {Exception} If no arguments are provided or more than four arguments are provided.
 * @throws {Exception} If map {-srcMap-} contains some properties from other map(s).
 * @memberof wTools
 *
 */ ,
          sureMapHasNone: function sureMapHasNone(t, r, n) {
            e.assert(2 === arguments.length || 3 === arguments.length || 4 === arguments.length, "Expects two, three or four arguments");
            let s = Object.keys(e.mapOnly(t, r));
            if (s.length > 0) {
              debugger;
              if (2 === arguments.length) throw e._err({
                args: [ e.strType(t) + " should have no fields :", e.strQuote(s).join(", ") ],
                level: 2
              });
              {
                let t = [];
                for (let r = 2; r < arguments.length; r++) e.routineIs(arguments[r]) && (arguments[r] = arguments[r]()), 
                t[r] = arguments[r];
                throw e._err({
                  args: [ t.join(" "), e.strQuote(s).join(", ") ],
                  level: 2
                });
              }
            }
            return !0;
          }
          //
          ,
          sureMapOwnNone: function sureMapOwnNone(t, r, n) {
            e.assert(2 === arguments.length || 3 === arguments.length || 4 === arguments.length, "Expects two, three or four arguments");
            let s = Object.keys(e.mapOnlyOwn(t, r));
            if (s.length > 0) {
              debugger;
              if (2 === arguments.length) throw e._err({
                args: [ e.strType(t) + " should own no fields :", e.strQuote(s).join(", ") ],
                level: 2
              });
              {
                let t = [];
                for (let r = 2; r < arguments.length; r++) e.routineIs(arguments[r]) && (arguments[r] = arguments[r]()), 
                t[r] = arguments[r];
                throw e._err({
                  args: [ t.join(" "), e.strQuote(s).join(", ") ],
                  level: 2
                });
              }
            }
            return !0;
          }
          //
          /**
 * Checks if map passed by argument {-srcMap-} not contains undefined properties. Works only in debug mode. Uses StackTrace level 2. {@link wTools.err See err}
 * If routine found undefined property it generates and throws exception, otherwise returns without exception.
 * Also generates error using messages passed after first argument. Message may be a string, an array, or a function.
 *
 * @param { Object } srcMap - source map.
 * @param { * } [ msg ] - error message for generated exception.
 * @param { * } [ msg ] - error message that adds to the message in third argument.
 *
 * @example
 * let map = { a : '1', b : 'name' };
 * wTools.sureMapHasNoUndefine( map );
 *
 * // no exception
 *
 * @example
 * let map = { a : '1', b : undefined };
 * wTools.sureMapHasNoUndefine( map );
 *
 * // caught <anonymous>:2:8
 * // Object  should have no undefines, but has : b
 * //
 * // at _err (file:///.../wTools/staging/Base.s:3707)
 * // at sureMapHasNoUndefine (file:///.../wTools/staging/Base.s:4087)
 * // at <anonymous>:2
 *
 * @example
 * let map = { a : undefined, b : '1' };
 * wTools.sureMapHasNoUndefine( map, '"map" has undefines :');
 *
 * // caught <anonymous>:2:8
 * // "map" has undefines : a
 * //
 * // at _err (file:///.../wTools/staging/Base.s:3707)
 * // at sureMapHasNoUndefine (file:///.../wTools/staging/Base.s:4087)
 * // at <anonymous>:2
 *
 * @example
 * let map = { a : undefined, b : '1' };
 * wTools.sureMapHasNoUndefine( map, '"map"', () => 'should have ' + 'no undefines, but has :' );
 *
 * // caught <anonymous>:2:8
 * // "map" should have no undefines, but has : a
 * //
 * // at _err (file:///.../wTools/staging/Base.s:3707)
 * // at sureMapHasNoUndefine (file:///.../wTools/staging/Base.s:4087)
 * // at <anonymous>:2
 *
 * @function sureMapHasNoUndefine
 * @throws {Exception} If no arguments passed or than three arguments passed.
 * @throws {Exception} If map {-srcMap-} contains undefined property.
 * @memberof wTools
 *
 */ ,
          sureMapHasNoUndefine: function sureMapHasNoUndefine(t, r) {
            e.assert(1 === arguments.length || 2 === arguments.length || 3 === arguments.length, "Expects one, two or three arguments");
            let n = [];
            for (let e in t) void 0 === t[e] && n.push(e);
            if (n.length > 0) {
              debugger;
              if (1 === arguments.length) throw e._err({
                args: [ e.strType(t) + " should have no undefines, but has :", e.strQuote(n).join(", ") ],
                level: 2
              });
              {
                let t = [];
                for (let r = 1; r < arguments.length; r++) e.routineIs(arguments[r]) && (arguments[r] = arguments[r]()), 
                t[r] = arguments[r];
                throw e._err({
                  args: [ t.join(" "), e.strQuote(n).join(", ") ],
                  level: 2
                });
              }
            }
            return !0;
          }
          // --
          // map assert
          // --
          ,
          // map assert
          assertMapHasFields: function assertMapHasFields(t, r, n) {
            return e.sureMapHasExactly.apply(this, arguments);
          }
          //
          ,
          assertMapOwnFields: function assertMapOwnFields(t, r, n) {
            return e.sureMapOwnExactly.apply(this, arguments);
          }
          //
          /**
 * Checks if map passed by argument {-srcMap-} has only properties represented in object(s) passed after first argument. Checks all enumerable properties.
 * Works only in debug mode. Uses StackTrace level 2. {@link wTools.err See err}
 * If routine found some unique properties in source it generates and throws exception, otherwise returns without exception.
 * Also generates error using message passed after second argument. Message may be a string, an array, or a function.
 *
 * @param { Object } srcMap - source map.
 * @param { Object } screenMaps - object to compare with.
 * @param { * } [ msg ] - error message for generated exception.
 * @param { * } [ msg ] - error message that adds to the message in third argument.
 *
 * @example
 * let a = { a : 1, b : 3 };
 * let b = { a : 2, b : 3 };
 * wTools.assertMapHasOnly( a, b );
 *
 * //no exception
 *
 * @example
 * let a = { a : 1, c : 3 };
 * let b = { a : 2, b : 3 };
 * wTools.assertMapHasOnly( a, b );
 *
 * // caught <anonymous>:3:8
 * // Object should have no fields : c
 * //
 * // at _err (file:///.../wTools/staging/Base.s:3707)
 * // at assertMapHasOnly (file:///.../wTools/staging/Base.s:4188)
 * // at <anonymous>:3
 *
 * @example
 * let x = { d : 1 };
 * let a = Object.create( x );
 * let b = { a : 1 };
 * wTools.assertMapHasOnly( a, b, 'map should have no fields :' )
 *
 * // caught <anonymous>:4:8
 * // map should have no fields : d
 * //
 * // at _err (file:///.../wTools/staging/Base.s:3707)
 * // at assertMapHasOnly (file:///.../wTools/staging/Base.s:4188)
 * // at <anonymous>:4
 *
 * @example
 * let x = { d : 1 };
 * let a = Object.create( x );
 * let b = { a : 1 };
 * wTools.assertMapHasOnly( a, b, 'map', () => ' should' + ' have no fields :' )
 *
 * // caught <anonymous>:4:8
 * // map should have no fields : d
 * //
 * // at _err (file:///.../wTools/staging/Base.s:3707)
 * // at assertMapHasOnly (file:///.../wTools/staging/Base.s:4188)
 * // at <anonymous>:4
 *
 * @function assertMapHasOnly
 * @throws {Exception} If no arguments provided or more than four arguments passed.
 * @throws {Exception} If map {-srcMap-} contains unique property.
 * @memberof wTools
 *
 */ ,
          assertMapHasOnly: function assertMapHasOnly(t, r, n) {
            return e.sureMapHasOnly.apply(this, arguments);
          }
          //
          /**
 * Checks if map passed by argument {-srcMap-} has only properties represented in object(s) passed after first argument. Checks only own properties of the objects.
 * Works only in debug mode. Uses StackTrace level 2.{@link wTools.err See err}
 * If routine found some unique properties in source it generates and throws exception, otherwise returns without exception.
 * Also generates error using message passed after second argument. Message may be a string, an array, or a function.
 *
 * @param { Object } srcMap - source map.
 * @param { Object } screenMaps - object to compare with.
 * @param { * } [ msg ] - error message for generated exception.
 * @param { * } [ msg ] - error message that adds to the message in third argument.
 *
 * @example
 * let x = { d : 1 };
 * let a = Object.create( x );
 * a.a = 5;
 * let b = { a : 2 };
 * wTools.assertMapOwnOnly( a, b );
 *
 * //no exception
 *
 * @example
 * let a = { d : 1 };
 * let b = { a : 2 };
 * wTools.assertMapOwnOnly( a, b );
 *
 * // caught <anonymous>:3:10
 * // Object should have no own fields : d
 * //
 * // at _err (file:///.../wTools/staging/Base.s:3707)
 * // at assertMapOwnOnly (file:///.../wTools/staging/Base.s:4215)
 * // at <anonymous>:3
 *
 * @example
 * let a = { x : 0, y : 2 };
 * let b = { c : 0, d : 3};
 * let c = { a : 1 };
 * wTools.assertMapOwnOnly( a, b, 'error, map should have no own fields :' );
 *
 * // caught <anonymous>:4:8
 * // error, map should have no own fields : x, y
 * //
 * // at _err (file:///.../wTools/staging/Base.s:3707)
 * // at assertMapOwnOnly (file:///.../wTools/staging/Base.s:4215)
 * // at <anonymous>:4
 *
 * @example
 * let a = { x : 0, y : 2 };
 * let b = { c : 0, d : 3};
 * let c = { a : 1 };
 * wTools.assertMapOwnOnly( a, b, () => 'error, ' + 'map', ' should have no own fields :' );
 *
 * // caught <anonymous>:4:8
 * // error, map should have no own fields : x, y
 * //
 * // at _err (file:///.../wTools/staging/Base.s:3707)
 * // at assertMapOwnOnly (file:///.../wTools/staging/Base.s:4215)
 * // at <anonymous>:4
 *
 * @function assertMapOwnOnly
 * @throws {Exception} If no arguments provided or more than four arguments passed.
 * @throws {Exception} If map {-srcMap-} contains unique property.
 * @memberof wTools
 *
 */ ,
          assertMapOwnOnly: function assertMapOwnOnly(t, r, n) {
            return e.sureMapOwnOnly.apply(this, arguments);
          }
          //
          /**
 * Checks if map passed by argument {-srcMap-} has no properties represented in object(s) passed after first argument. Checks all enumerable properties.
 * Works only in debug mode. Uses StackTrace level 2. {@link wTools.err See err}
 * If routine found some properties in source it generates and throws exception, otherwise returns without exception.
 * Also generates error using message passed after second argument. Message may be a string, an array, or a function.
 *
 * @param { Object } srcMap - source map.
 * @param { Object } screenMaps - object to compare with.
 * @param { * } [ msg ] - error message for generated exception.
 * @param { * } [ msg ] - error message that adds to the message in third argument.
 *
 * @example
 * let a = { a : 1 };
 * let b = { b : 2 };
 * wTools.assertMapHasNone( a, b );
 *
 * // no exception
 *
 * @example
 * let x = { a : 1 };
 * let a = Object.create( x );
 * let b = { a : 2, b : 2 }
 * wTools.assertMapHasNone( a, b );
 *
 * // caught <anonymous>:4:8
 * // Object should have no fields : a
 * //
 * // at _err (file:///.../wTools/staging/Base.s:3707)
 * // at assertMapHasAll (file:///.../wTools/staging/Base.s:4518)
 * // at <anonymous>:4
 *
 * @example
 * let a = { x : 0, y : 1 };
 * let b = { x : 1, y : 0 };
 * wTools.assertMapHasNone( a, b, 'map should have no fields :' );
 *
 * // caught <anonymous>:3:9
 * // map should have no fields : x, y
 * //
 * // at _err (file:///.../wTools/staging/Base.s:3707)
 * // at assertMapHasNone (file:///.../wTools/staging/Base.s:4518)
 * // at <anonymous>:3
 *
 * @example
 * let a = { x : 0, y : 1 };
 * let b = { x : 1, y : 0 };
 * wTools.assertMapHasNone( a, b, () => 'map ' + 'should ', 'have no fields :' );
 *
 * // caught <anonymous>:3:9
 * // map should have no fields : x, y
 * //
 * // at _err (file:///.../wTools/staging/Base.s:3707)
 * // at assertMapHasNone (file:///.../wTools/staging/Base.s:4518)
 * // at <anonymous>:3
 *
 * @function assertMapHasNone
 * @throws {Exception} If no arguments provided or more than four arguments passed.
 * @throws {Exception} If map {-srcMap-} contains some properties from other map(s).
 * @memberof wTools
 *
 */ ,
          assertMapHasNone: function assertMapHasNone(t, r, n) {
            return e.sureMapHasNone.apply(this, arguments);
          }
          //
          ,
          assertMapOwnNone: function assertMapOwnNone(t, r, n) {
            return e.sureMapOwnNone.apply(this, arguments);
          }
          //
          /**
 * Checks if map passed by argument {-srcMap-} has all properties represented in object passed by argument( all ). Checks all enumerable properties.
 * Works only in debug mode. Uses StackTrace level 2.{@link wTools.err See err}
 * If routine did not find some properties in source it generates and throws exception, otherwise returns without exception.
 * Also generates error using message passed after second argument. Message may be a string, an array, or a function.
 *
 * @param { Object } srcMap - source map.
 * @param { Object } all - object to compare with.
 * @param { * } [ msg ] - error message for generated exception.
 * @param { * } [ msg ] - error message that adds to the message in third argument.
 *
 * @example
 * let x = { a : 1 };
 * let a = Object.create( x );
 * let b = { a : 2 };
 * wTools.assertMapHasAll( a, b );
 *
 * // no exception
 *
 * @example
 * let a = { d : 1 };
 * let b = { a : 2 };
 * wTools.assertMapHasAll( a, b );
 *
 * // caught <anonymous>:3:10
 * // Object should have fields : a
 * //
 * // at _err (file:///.../wTools/staging/Base.s:3707)
 * // at assertMapHasAll (file:///.../wTools/staging/Base.s:4242)
 * // at <anonymous>:3
 *
 * @example
 * let a = { x : 0, y : 2 };
 * let b = { x : 0, d : 3};
 * wTools.assertMapHasAll( a, b, 'map should have fields :' );
 *
 * // caught <anonymous>:4:9
 * // map should have fields : d
 * //
 * // at _err (file:///.../wTools/staging/Base.s:3707)
 * // at assertMapHasAll (file:///.../wTools/staging/Base.s:4242)
 * // at <anonymous>:3
 *
 * @example
 * let a = { x : 0, y : 2 };
 * let b = { x : 0, d : 3};
 * wTools.assertMapHasAll( a, b, () => 'map' + ' should', ' have fields :' );
 *
 * // caught <anonymous>:4:9
 * // map should have fields : d
 * //
 * // at _err (file:///.../wTools/staging/Base.s:3707)
 * // at assertMapHasAll (file:///.../wTools/staging/Base.s:4242)
 * // at <anonymous>:3
 *
 * @function assertMapHasAll
 * @throws {Exception} If no arguments provided or more than four arguments passed.
 * @throws {Exception} If map {-srcMap-} not contains some properties from argument( all ).
 * @memberof wTools
 *
 */ ,
          assertMapHasAll: function assertMapHasAll(t, r, n) {
            return e.sureMapHasAll.apply(this, arguments);
          }
          //
          /**
 * Checks if map passed by argument {-srcMap-} has all properties represented in object passed by argument( all ). Checks only own properties of the objects.
 * Works only in Config.debug mode. Uses StackTrace level 2. {@link wTools.err See err}
 * If routine did not find some properties in source it generates and throws exception, otherwise returns without exception.
 * Also generates error using message passed after second argument. Message may be a string, an array, or a function.
 *
 * @param { Object } srcMap - source map.
 * @param { Object } all - object to compare with.
 * @param { * } [ msg ] - error message for generated exception.
 * @param { * } [ msg ] - error message that adds to the message in third argument.
 *
 * @example
 * let a = { a : 1 };
 * let b = { a : 2 };
 * wTools.assertMapOwnAll( a, b );
 *
 * // no exception
 *
 * @example
 * let a = { a : 1 };
 * let b = { a : 2, b : 2 }
 * wTools.assertMapOwnAll( a, b );
 *
 * // caught <anonymous>:3:8
 * // Object should own fields : b
 * //
 * // at _err (file:///.../wTools/staging/Base.s:3707)
 * // at assertMapHasAll (file:///.../wTools/staging/Base.s:4269)
 * // at <anonymous>:3
 *
 * @example
 * let a = { x : 0 };
 * let b = { x : 1, y : 0};
 * wTools.assertMapOwnAll( a, b, 'error msg, map should own fields :' );
 *
 * // caught <anonymous>:4:9
 * // error msg, map should own fields : y
 * //
 * // at _err (file:///.../wTools/staging/Base.s:3707)
 * // at assertMapOwnAll (file:///.../wTools/staging/Base.s:4269)
 * // at <anonymous>:3
 *
 * @example
 * let a = { x : 0 };
 * let b = { x : 1, y : 0};
 * wTools.assertMapOwnAll( a, b, 'error msg, ', () => 'map' + ' should own fields :' );
 *
 * // caught <anonymous>:4:9
 * // error msg, map should own fields : y
 * //
 * // at _err (file:///.../wTools/staging/Base.s:3707)
 * // at assertMapOwnAll (file:///.../wTools/staging/Base.s:4269)
 * // at <anonymous>:3
 *
 * @function assertMapOwnAll
 * @throws {Exception} If no arguments passed or more than four arguments passed.
 * @throws {Exception} If map {-srcMap-} not contains some properties from argument( all ).
 * @memberof wTools
 *
 */ ,
          assertMapOwnAll: function assertMapOwnAll(t, r, n) {
            return e.sureMapOwnAll.apply(this, arguments);
          }
          //
          /**
 * Checks if map passed by argument {-srcMap-} not contains undefined properties. Works only in debug mode. Uses StackTrace level 2. {@link wTools.err See err}
 * If routine found undefined property it generates and throws exception, otherwise returns without exception.
 * Also generates error using messages passed after first argument. Message may be a string, an array, or a function.
 *
 * @param { Object } srcMap - source map.
 * @param { * } [ msg ] - error message for generated exception.
 * @param { * } [ msg ] - error message that adds to the message in second argument.
 *
 * @example
 * let map = { a : '1', b : 'name' };
 * wTools.assertMapHasNoUndefine( map );
 *
 * // no exception
 *
 * @example
 * let map = { a : '1', b : undefined };
 * wTools.assertMapHasNoUndefine( map );
 *
 * // caught <anonymous>:2:8
 * // Object should have no undefines, but has : b
 * //
 * // at _err (file:///.../wTools/staging/Base.s:3707)
 * // at assertMapHasNoUndefine (file:///.../wTools/staging/Base.s:4087)
 * // at <anonymous>:2
 *
 * @example
 * let map = { a : undefined, b : '1' };
 * wTools.assertMapHasNoUndefine( map, '"map" has undefines :');
 *
 * // caught <anonymous>:2:8
 * // "map" has undefines : a
 * //
 * // at _err (file:///.../wTools/staging/Base.s:3707)
 * // at assertMapHasNoUndefine (file:///.../wTools/staging/Base.s:4087)
 * // at <anonymous>:2
 *
 * @example
 * let map = { a : undefined, b : '1' };
 * wTools.assertMapHasNoUndefine( map, 'map', () => ' has ' + 'undefines :');
 *
 * // caught <anonymous>:2:8
 * // map has undefines : a
 * //
 * // at _err (file:///.../wTools/staging/Base.s:3707)
 * // at assertMapHasNoUndefine (file:///.../wTools/staging/Base.s:4087)
 * // at <anonymous>:2
 *
 * @function assertMapHasNoUndefine
 * @throws {Exception} If no arguments provided or more than three arguments passed.
 * @throws {Exception} If map {-srcMap-} contains undefined property.
 * @memberof wTools
 *
 */ ,
          assertMapHasNoUndefine: function assertMapHasNoUndefine(t, r) {
            return e.sureMapHasNoUndefine.apply(this, arguments);
          }
        };
        // --
        // routines
        // --
                //
        Object.assign(t, s), Object.assign(t, {}), 
        // --
        // export
        // --
        void 0 !== n && null !== n && (n.exports = t);
      }();
    });
    n.include, n.include;
  }(), // == end of file fMap_s
  function fNumber_s() {
    let t = _starter_._pathResolve(e, "dwtools/abase/l0/fNumber.s"), r = _starter_._pathResolve(e, "dwtools/abase/l0/"), n = _starter_._fileCreate(t, r, // == begin of file fNumber_s
    function fNumber_s_naked() {
      !function _fNumbers_s_() {
        "use strict";
        _global_;
        let e = _global_.wTools, t = _global_.wTools, r = (Array.prototype.indexOf, Array.prototype.lastIndexOf, 
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
          numberIsNotNan: function numberIsNotNan(t) {
            return e.numberIs(t) && !isNaN(t);
          }
          //
          ,
          numberIsFinite: function numberIsFinite(t) {
            return !!e.numberIs(t) && isFinite(t);
          }
          //
          ,
          numberIsInfinite: function numberIsInfinite(t) {
            return !!e.numberIs(t) && (Infinity === t || -Infinity === t);
          }
          //
          ,
          numberIsInt: function numberIsInt(t) {
            return !!e.numberIs(t) && Math.floor(t) === t;
          }
          //
          ,
          numbersAre: function numbersAre(t) {
            if (e.assert(1 === arguments.length), e.bufferTypedIs(t)) return !0;
            if (e.arrayLike(t)) {
              for (let r = 0; r < t.length; r++) if (!e.numberIs(t[r])) return !1;
              return !0;
            }
            return !1;
          }
          //
          ,
          numbersAreIdentical: function numbersAreIdentical(t, r) {
            return e.assert(2 === arguments.length, "Expects exactly two arguments"), Object.is(t, r);
          }
          //
          ,
          numbersAreEquivalent: function numbersAreEquivalent(t, r, n) {
            return e.assert(2 === arguments.length || 3 === arguments.length, "Expects two or three arguments"), 
            void 0 === n && (n = e.accuracy), Math.abs(t - r) <= n;
          }
          //
          ,
          numbersAreFinite: function numbersAreFinite(t) {
            if (e.longIs(t)) {
              for (let e = 0; e < t.length; e++) if (!numbersAreFinite(t[e])) return !1;
              return !0;
            }
            return !!e.numberIs(t) && isFinite(t);
          }
          //
          ,
          numbersArePositive: function numbersArePositive(t) {
            if (e.longIs(t)) {
              for (let e = 0; e < t.length; e++) if (!numbersArePositive(t[e])) return !1;
              return !0;
            }
            return !!e.numberIs(t) && t >= 0;
          }
          //
          ,
          numbersAreInt: function numbersAreInt(t) {
            if (e.longIs(t)) {
              for (let e = 0; e < t.length; e++) if (!numbersAreInt(t[e])) return !1;
              return !0;
            }
            return !!e.numberIs(t) && Math.floor(t) === t;
          }
          //
          ,
          numberInRange: function numberInRange(t, r) {
            return e.assert(2 === arguments.length, "Expects exactly two arguments"), e.assert(2 === r.length), 
            e.assert(e.numberIs(r[0])), e.assert(e.numberIs(r[1])), !!e.numberIs(t) && r[0] <= t && t <= r[1];
          }
          //
          ,
          numberClamp: function numberClamp(t, r, n) {
            return e.assert(2 === arguments.length || 3 === arguments.length, "Expects two or three arguments"), 
            2 === arguments.length && (e.assert(2 === arguments[1].length), r = arguments[1][0], 
            n = arguments[1][1]), t > n ? n : t < r ? r : t;
          }
          //
          ,
          numberMix: function numberMix(t, r, n) {
            return e.assert(3 === arguments.length, "Expects exactly three arguments"), t * (1 - n) + r * n;
          }
          // --
          // fields
          // --
                });
        //
        Object.assign(t, r), Object.assign(t, {}), 
        // --
        // export
        // --
        void 0 !== n && null !== n && (n.exports = t);
      }();
    });
    n.include, n.include;
  }(), // == end of file fNumber_s
  function fRange_s() {
    let t = _starter_._pathResolve(e, "dwtools/abase/l0/fRange.s"), r = _starter_._pathResolve(e, "dwtools/abase/l0/"), n = _starter_._fileCreate(t, r, // == begin of file fRange_s
    function fRange_s_naked() {
      !function _fRange_s_() {
        "use strict";
        _global_;
        let e = _global_.wTools, t = _global_.wTools, r = (Array.prototype.slice, Function.prototype.bind, 
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
          rangeClamp: function rangeClamp(t, r) {
            return e.assert(2 === arguments.length, "Expects exactly two arguments"), e.assert(e.rangeIs(t)), 
            e.assert(e.rangeIs(r)), t[0] < r[0] ? t[0] = r[0] : t[0] > r[1] && (t[0] = r[1]), 
            t[1] < r[0] ? t[1] = r[0] : t[1] > r[1] && (t[1] = r[1]), t;
          }
          //
          ,
          rangeNumberElements: function rangeNumberElements(t, r) {
            return e.assert(e.rangeIs(t)), e.assert(1 === arguments.length || 2 === arguments.length), 
            void 0 === r && (r = 1), r ? (t[1] - t[0]) / r : 0;
          }
          //
          ,
          rangeFirstGet: function rangeFirstGet(t, r) {
            return void 0 === (r = r || Object.create(null)).increment && (r.increment = 1), 
            e.assert(1 === arguments.length || 2 === arguments.length), e.arrayIs(t) ? t[0] : e.mapIs(t) ? t.first : void e.assert(0, "unexpected type of range", e.strType(t));
          }
          //
          ,
          rangeLastGet: function rangeLastGet(t, r) {
            return void 0 === (r = r || Object.create(null)).increment && (r.increment = 1), 
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
        Object.assign(t, r), Object.assign(t, {}), 
        // --
        // export
        // --
        void 0 !== n && null !== n && (n.exports = t);
      }();
    });
    n.include, n.include;
  }(), // == end of file fRange_s
  function fRegexp_s() {
    let t = _starter_._pathResolve(e, "dwtools/abase/l0/fRegexp.s"), r = _starter_._pathResolve(e, "dwtools/abase/l0/"), n = _starter_._fileCreate(t, r, // == begin of file fRegexp_s
    function fRegexp_s_naked() {
      !function _fRegexp_s_() {
        "use strict";
        _global_;
        let e = _global_.wTools, t = _global_.wTools, r = (Math.ceil, Math.floor, {
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
          regexpObjectIs: function regexpObjectIs(t) {
            return !!e.RegexpObject && t instanceof e.RegexpObject;
          }
          //
          ,
          regexpLike: function regexpLike(t) {
            return !(!e.regexpIs(t) && !e.strIs(t));
          }
          //
          ,
          regexpsLike: function regexpsLike(t) {
            if (!e.arrayIs(t)) return !1;
            for (let r = 0; r < t.length; r++) if (!e.regexpLike(t[r])) return !1;
            return !0;
          }
          //
          ,
          regexpIdentical: function regexpIdentical(t, r) {
            return e.assert(2 === arguments.length, "Expects exactly two arguments"), !(!e.regexpIs(t) || !e.regexpIs(r)) && t.source === r.source && t.flags === r.flags;
          }
          //
          ,
          regexpEquivalent: function regexpEquivalent(t, r) {
            return e.strEquivalent(t, r);
          }
          //
          ,
          _regexpTest: function _regexpTest(t, r) {
            return e.assert(2 === arguments.length), e.assert(e.regexpLike(t)), e.assert(e.strIs(r)), 
            e.strIs(t) ? t === r : t.test(r);
          }
          //
          ,
          regexpTest: function regexpTest(t, r) {
            return e.assert(2 === arguments.length), e.assert(e.regexpLike(t)), e.strIs(r) ? e._regexpTest(t, r) : e.arrayLike(r) ? r.map(r => e._regexpTest(t, r)) : void e.assert(0);
          }
          //
          ,
          regexpTestAll: function regexpTestAll(t, r) {
            return e.assert(2 === arguments.length), e.assert(e.regexpLike(t)), e.strIs(r) ? e._regexpTest(t, r) : e.arrayLike(r) ? r.every(r => e._regexpTest(t, r)) : void e.assert(0);
          }
          //
          ,
          regexpTestAny: function regexpTestAny(t, r) {
            return e.assert(2 === arguments.length), e.assert(e.regexpLike(t)), e.strIs(r) ? e._regexpTest(t, r) : e.arrayLike(r) ? r.some(r => e._regexpTest(t, r)) : void e.assert(0);
          }
          //
          ,
          regexpTestNone: function regexpTestNone(t, r) {
            return e.assert(2 === arguments.length), e.assert(e.regexpLike(t)), e.strIs(r) ? !e._regexpTest(t, r) : e.arrayLike(r) ? !r.some(r => e._regexpTest(t, r)) : void e.assert(0);
          }
          //
          ,
          regexpsTestAll: function regexpsTestAll(t, r) {
            return e.assert(2 === arguments.length), e.arrayIs(t) ? (e.assert(e.regexpsLike(t)), 
            t.every(t => e.regexpTestAll(t, r))) : e.regexpTestAll(t, r);
          }
          //
          ,
          regexpsTestAny: function regexpsTestAny(t, r) {
            return e.assert(2 === arguments.length), e.arrayIs(t) ? (e.assert(e.regexpsLike(t)), 
            t.some(t => e.regexpTestAny(t, r))) : e.regexpTestAny(t, r);
          }
          //
          ,
          regexpsTestNone: function regexpsTestNone(t, r) {
            return e.assert(2 === arguments.length), e.arrayIs(t) ? (e.assert(e.regexpsLike(t)), 
            t.every(t => e.regexpTestNone(t, r))) : e.regexpTestNone(t, r);
          }
          // --
          // fields
          // --
                });
        //
        Object.assign(t, r), Object.assign(t, {}), 
        // --
        // export
        // --
        void 0 !== n && null !== n && (n.exports = t);
      }();
    });
    n.include, n.include;
  }(), // == end of file fRegexp_s
  function fRoutine_s() {
    let t = _starter_._pathResolve(e, "dwtools/abase/l0/fRoutine.s"), r = _starter_._pathResolve(e, "dwtools/abase/l0/"), n = _starter_._fileCreate(t, r, // == begin of file fRoutine_s
    function fRoutine_s_naked() {
      !function _fRoutine_s_() {
        "use strict";
        // --
        // routine
        // --
        function routineIs(e) {
          return "[object Function]" === Object.prototype.toString.call(e);
        }
        //
                //
        /**
 * Internal implementation.
 * @param {object} object - object to check.
 * @return {object} object - name in key/value format.
 * @function _routineJoin
 * @memberof wTools
 */
        function _routineJoin(t) {
          e.assert(1 === arguments.length, "Expects single argument"), e.assert(e.boolIs(t.sealing)), 
          e.assert(e.boolIs(t.extending)), e.assert(e.routineIs(t.routine), "Expects routine"), 
          e.assert(e.longIs(t.args) || void 0 === t.args);
          let r = t.routine, n = t.args, s = t.context, l = function act() {
            if (void 0 !== s && void 0 !== n) {
              if (!0 === t.sealing) {
                let t = r.name || "__sealedContextAndArguments";
                return e.assert(e.strIs(t)), {
                  [t]: function() {
                    return r.apply(s, n);
                  }
                }[t];
              }
              {
                let t = e.arrayAppendArray([ s ], n);
                return Function.prototype.bind.apply(r, t);
              }
            }
            if (void 0 !== s && void 0 === n) {
              if (!0 === t.sealing) {
                let e = r.name || "__sealedContext";
                return {
                  [e]: function() {
                    return r.call(s);
                  }
                }[e];
              }
              return Function.prototype.bind.call(r, s);
            }
            if (void 0 === s && void 0 !== n) // xxx
            {
              if (!0 === t.sealing) {
                let t = r.name || "__sealedArguments";
                return e.assert(e.strIs(t)), {
                  [t]: function() {
                    return r.apply(this, n);
                  }
                }[t];
              }
              {
                let t = r.name || "__joinedArguments";
                return {
                  [t]: function() {
                    let t = e.arrayAppendArrays(null, [ n, arguments ]);
                    return r.apply(this, t);
                  }
                }[t];
              }
            }
            if (void 0 === s && void 0 === n) return r;
            // if( !o.sealing )
            // {
            //   return routine;
            // }
            // else
            // {
            //   if( !args )
            //   args = [];
            //
            //   let name = routine.name || '__sealedArguments';
            //   let __sealedArguments =
            //   {
            //     [ name ] : function()
            //     {
            //       return routine.apply( undefined, args );
            //     }
            //   }
            //   return __sealedArguments[ name ];
            //
            // }
                        e.assert(0);
          }();
          return t.extending && (e.mapExtend(l, r), Object.defineProperty(l, "originalRoutine", {
            value: r,
            enumerable: !1
          }), void 0 !== s && Object.defineProperty(l, "boundContext", {
            value: s,
            enumerable: !1
          }), void 0 !== n && Object.defineProperty(l, "boundArguments", {
            value: n,
            enumerable: !1
          })), l;
        }
        //
                //
        function _routinesCompose_body(t) {
          null === t.chainer && (t.chainer = e.compose.chainer.original), t.elements = e.arrayFlatten(null, t.elements);
          /* qqq xxx : single argument call should be ( no-copy call ) */
          let r = [];
          for (let n = 0; n < t.elements.length; n++) {
            let s = t.elements[n];
            if (e.assert(e.routineIs(s)), s.composed) if (s.composed.chainer === t.chainer && s.composed.supervisor === t.supervisor) e.arrayAppendArray(r, s.composed.elements); else {
              debugger;
              e.arrayAppendElement(r, s);
            } else e.arrayAppendElement(r, s);
          }
          t.elements = r;
          let n, s = t.supervisor, l = t.chainer;
          if (e.assert(e.routineIs(l)), e.assert(null === s || e.routineIs(s)), 
          /* */
          n = 0 === r.length ? function empty() {
            return [];
          }
          // else if( elements.length === 1 ) /* xxx : optimize the case */
          // {
          //   act = elements[ 0 ];
          // }
           : function composition() {
            let n = [], s = e.unrollFrom(arguments);
            // let args = _.unrollAppend( _.unrollFrom( null ), arguments );
            // debugger;
                        for (let a = 0; a < r.length; a++) {
              e.assert(e.unrollIs(s), () => "Expects unroll, but got", e.strType(s));
              let i = r[a].apply(this, s);
              // if( args === undefined )
              if (e.assert(!1 /* && r !== undefined */ !== i, "Temporally forbidden type of result", i), 
              e.assert(!e.argumentsArrayIs(i)), void 0 !== i && e.unrollAppend(n, i), 
              // args = chainer( r, k, args, o );
              s = l(s, i, t, a), e.assert(void 0 !== s && !1 !== s), s === e.dont) break;
              s = e.unrollFrom(s);
            }
            return n;
          }, t.act = n, n.composed = t, s) {
            function compositionSupervise() {
              return s(this, arguments, n, t);
            }
            return e.routineExtend(compositionSupervise, n), compositionSupervise;
          }
          return n;
        }
        //
        function routinesCompose() {
          let t = e.routinesCompose.pre(routinesCompose, arguments);
          return e.routinesCompose.body(t);
        }
        //
        function routineFromPreAndBody_body(t) {
          // args, r, o, k
          if (e.assert(1 === arguments.length), !e.routineIs(t.pre)) {
            let r = e.routinesCompose(t.pre, function(t, r, n, l) {
              return e.assert(4 === arguments.length), e.assert(!e.unrollIs(r)), e.assert(e.objectIs(r)), 
              e.unrollAppend([ s, [ r ] ]);
            });
            e.assert(e.routineIs(r)), t.pre = function pre() {
              let e = r.apply(this, arguments);
              return e[e.length - 1];
            };
          }
          let r = t.pre, n = t.body;
          t.name || (e.assert(e.strDefined(t.body.name), "Body routine should have name"), 
          t.name = t.body.name, t.name.indexOf("_body") === t.name.length - 5 && t.name.length > 5 && (t.name = t.name.substring(0, t.name.length - 5)));
          let s = {
            [t.name]: function() {
              let t = r.call(this, s, arguments);
              return e.assert(!e.argumentsArrayIs(t), "does not expect arguments array"), e.unrollIs(t) ? n.apply(this, t) : n.call(this, t);
            }
          }[t.name];
          return e.assert(e.strDefined(s.name), "Looks like your interpreter does not support dynamic naming of functions. Please use ES2015 or later interpreter."), 
          e.routineExtend(s, t.body), s.pre = t.pre, s.body = t.body, s;
        }
        //
        function routineFromPreAndBody() {
          let e = routineFromPreAndBody.pre.call(this, routineFromPreAndBody, arguments);
          return routineFromPreAndBody.body.call(this, e);
        }
        _global_;
        let e = _global_.wTools, t = _global_.wTools;
        _routinesCompose_body.defaults = {
          elements: null,
          chainer: null,
          supervisor: null
        }, routinesCompose.pre = 
        //
        function _routinesCompose_pre(t, r) {
          let n = r[0];
          return e.mapIs(n) || (n = {
            elements: r[0]
          }), void 0 !== r[1] && (n.chainer = r[1]), n.elements = e.arrayAppendArrays([], [ n.elements ]), 
          n.elements = n.elements.filter(e => null !== e && e), e.routineOptions(t, n), e.assert(e.routinesAre(n.elements)), 
          e.assert(2 === arguments.length, "Expects exactly two arguments"), e.assert(1 === r.length || 2 === r.length), 
          e.assert(1 === r.length || !e.objectIs(r[0])), e.assert(e.arrayIs(n.elements) || e.routineIs(n.elements)), 
          e.assert(e.routineIs(r[1]) || void 0 === r[1] || null === r[1]), e.assert(null === n.chainer || e.routineIs(n.chainer)), 
          e.assert(null === n.supervisor || e.routineIs(n.supervisor)), n;
        }, routinesCompose.body = _routinesCompose_body, routinesCompose.defaults = Object.create(routinesCompose.body.defaults), 
        routineFromPreAndBody_body.defaults = {
          pre: null,
          body: null,
          name: null
        }, routineFromPreAndBody.pre = 
        //
        function routineFromPreAndBody_pre(t, r) {
          let n = r[0];
          return void 0 !== r[1] && (n = {
            pre: r[0],
            body: r[1],
            name: r[2]
          }), e.routineOptions(t, n), e.assert(1 === r.length || 2 === r.length || 3 === r.length), 
          e.assert(2 === arguments.length), e.assert(e.routineIs(n.pre) || e.routinesAre(n.pre), "Expects routine or routines {-o.pre-}"), 
          e.assert(e.routineIs(n.body), "Expects routine {-o.body-}"), e.assert(void 0 !== n.body.defaults, "Body should have defaults"), 
          n;
        }, routineFromPreAndBody.body = routineFromPreAndBody_body, routineFromPreAndBody.defaults = Object.create(routineFromPreAndBody_body.defaults);
        // --
        // fields
        // --
        let r = {
          routineIs: routineIs,
          routinesAre: function routinesAre(t) {
            if (e.assert(1 === arguments.length, "Expects single argument"), e.longIs(t)) {
              for (let r = 0; r < t.length; r++) if (!e.routineIs(t[r])) return !1;
              return !0;
            }
            return e.routineIs(t);
          }
          //
          ,
          routineIsPure: function routineIsPure(e) {
            return !!e && Object.getPrototypeOf(e) === Function.__proto__;
          }
          //
          ,
          routineHasName: function routineHasName(e) {
            return !!routineIs(e) && !!e.name;
          },
          _routineJoin: _routineJoin,
          constructorJoin: function constructorJoin(t, r) {
            return e.assert(e.routineIs(t), "Expects routine in the first argument"), e.assert(e.longIs(r), "Expects array-like in the second argument"), 
            e.assert(1 === arguments.length || 2 === arguments.length), _routineJoin({
              routine: t,
              context: t,
              args: r || [],
              sealing: !1,
              extending: !1
            });
          }
          //
          /**
 * The routineJoin() routine creates a new function with its 'this' ( context ) set to the provided `context`
 value. Argumetns `args` of target function which are passed before arguments of binded function during
 calling of target function. Unlike bind routine, position of `context` parameter is more intuitive.
 * @example
   let o = {
        z: 5
    };

   let y = 4;

   function sum(x, y) {
       return x + y + this.z;
    }
   let newSum = wTools.routineJoin(o, sum, [3]);
   newSum(y); // 12

   function f1(){ console.log( this ) };
   let f2 = f1.bind( undefined ); // context of new function sealed to undefined (or global object);
   f2.call( o ); // try to call new function with context set to { z: 5 }
   let f3 = _.routineJoin( undefined, f1 ); // new function.
   f3.call( o ) // print  { z: 5 }

 * @param {Object} context The value that will be set as 'this' keyword in new function
 * @param {Function} routine Function which will be used as base for result function.
 * @param {Array<*>} args Argumetns of target function which are passed before arguments of binded function during
 calling of target function. Must be wraped into array.
 * @returns {Function} New created function with preceding this, and args.
 * @throws {Error} When second argument is not callable throws error with text 'first argument must be a routine'
 * @thorws {Error} If passed arguments more than 3 throws error with text 'Expects 3 or less arguments'
 * @function routineJoin
 * @memberof wTools
 */ ,
          routineJoin: 
          //
          /**
 * The routineJoin() routine creates a new function with its 'this' ( context ) set to the provided `context`
 value. Argumetns `args` of target function which are passed before arguments of binded function during
 calling of target function. Unlike bind routine, position of `context` parameter is more intuitive.
 * @example
   let o = {
        z: 5
    };

   let y = 4;

   function sum(x, y) {
       return x + y + this.z;
    }
   let newSum = wTools.routineJoin(o, sum, [3]);
   newSum(y); // 12

   function f1(){ console.log( this ) };
   let f2 = f1.bind( undefined ); // context of new function sealed to undefined (or global object);
   f2.call( o ); // try to call new function with context set to { z: 5 }
   let f3 = _.routineJoin( undefined, f1 ); // new function.
   f3.call( o ) // print  { z: 5 }

 * @param {Object} context The value that will be set as 'this' keyword in new function
 * @param {Function} routine Function which will be used as base for result function.
 * @param {Array<*>} args Argumetns of target function which are passed before arguments of binded function during
 calling of target function. Must be wraped into array.
 * @returns {Function} New created function with preceding this, and args.
 * @throws {Error} When second argument is not callable throws error with text 'first argument must be a routine'
 * @thorws {Error} If passed arguments more than 3 throws error with text 'Expects 3 or less arguments'
 * @function routineJoin
 * @memberof wTools
 */
          function routineJoin(t, r, n) {
            return e.assert(e.routineIs(r), "routineJoin :", "second argument must be a routine"), 
            e.assert(arguments.length <= 3, "routineJoin :", "Expects 3 or less arguments"), 
            _routineJoin({
              routine: r,
              context: t,
              args: n,
              sealing: !1,
              extending: !0
            });
          }
          //
          /**
   * Return new function with sealed context and arguments.
   *
   * @example
   let o = {
        z: 5
    };

   function sum(x, y) {
       return x + y + this.z;
    }
   let newSum = wTools.routineSeal(o, sum, [3, 4]);
   newSum(y); // 12
   * @param {Object} context The value that will be set as 'this' keyword in new function
   * @param {Function} routine Function which will be used as base for result function.
   * @param {Array<*>} args Arguments wrapped into array. Will be used as argument to `routine` function
   * @returns {Function} Result function with sealed context and arguments.
   * @function routineJoin
   * @memberof wTools
   */ ,
          routineSeal: function routineSeal(t, r, n) {
            return e.assert(e.routineIs(r), "routineSeal :", "second argument must be a routine"), 
            e.assert(arguments.length <= 3, "routineSeal :", "Expects 3 or less arguments"), 
            _routineJoin({
              routine: r,
              context: t,
              args: n,
              sealing: !0,
              extending: !0
            });
          }
          //
          ,
          routineOptions: function routineOptions(t, r, n) {
            e.argumentsArrayIs(r) || (r = [ r ]);
            let s = r[0];
            return void 0 === s && (s = Object.create(null)), n = n || (t ? t.defaults : null), 
            e.assert(2 === arguments.length || 3 === arguments.length, "Expects 2 or 3 arguments"), 
            e.assert(e.routineIs(t) || null === t, "Expects routine"), e.assert(e.objectIs(n), "Expects routine with defined defaults or defaults in third argument"), 
            e.assert(e.objectIs(s), "Expects object"), e.assert(0 === r.length || 1 === r.length, "Expects single options map, but got", r.length, "arguments"), 
            e.assertMapHasOnly(s, n), 
            // _.mapSupplementStructureless( options, defaults ); /* xxx qqq : use instead of mapComplement */
            e.mapComplement(s, n), e.assertMapHasNoUndefine(s), s;
          }
          //
          ,
          assertRoutineOptions: function assertRoutineOptions(t, r, n) {
            e.argumentsArrayIs(r) || (r = [ r ]);
            let s = r[0];
            return n = n || (t ? t.defaults : null), e.assert(2 === arguments.length || 3 === arguments.length, "Expects 2 or 3 arguments"), 
            e.assert(e.routineIs(t) || null === t, "Expects routine"), e.assert(e.objectIs(n), "Expects routine with defined defaults or defaults in third argument"), 
            e.assert(e.objectIs(s), "Expects object"), e.assert(0 === r.length || 1 === r.length, "Expects single options map, but got", r.length, "arguments"), 
            e.assertMapHasOnly(s, n), e.assertMapHasAll(s, n), e.assertMapHasNoUndefine(s), 
            s;
          }
          //
          ,
          routineOptionsPreservingUndefines: function routineOptionsPreservingUndefines(t, r, n) {
            e.argumentsArrayIs(r) || (r = [ r ]);
            let s = r[0];
            return void 0 === s && (s = Object.create(null)), n = n || t.defaults, e.assert(2 === arguments.length || 3 === arguments.length, "Expects 2 or 3 arguments"), 
            e.assert(e.routineIs(t), "Expects routine"), e.assert(e.objectIs(n), "Expects routine with defined defaults"), 
            e.assert(e.objectIs(s), "Expects object"), e.assert(0 === r.length || 1 === r.length, "routineOptions : expects single options map, but got", r.length, "arguments"), 
            e.assertMapHasOnly(s, n), e.mapComplementPreservingUndefines(s, n), s;
          }
          //
          ,
          assertRoutineOptionsPreservingUndefines: 
          //
          function assertRoutineOptionsPreservingUndefines(t, r, n) {
            e.argumentsArrayIs(r) || (r = [ r ]);
            let s = r[0];
            return n = n || t.defaults, e.assert(2 === arguments.length || 3 === arguments.length, "Expects 2 or 3 arguments"), 
            e.assert(e.routineIs(t), "Expects routine"), e.assert(e.objectIs(n), "Expects routine with defined defaults or defaults in third argument"), 
            e.assert(e.objectIs(s), "Expects object"), e.assert(0 === r.length || 1 === r.length, "Expects single options map, but got", r.length, "arguments"), 
            e.assertMapHasOnly(s, n), e.assertMapHasAll(s, n), s;
          }
          //
          ,
          routineOptionsFromThis: function routineOptionsFromThis(t, r, n) {
            e.assert(3 === arguments.length, "routineOptionsFromThis : expects 3 arguments");
            let s = r || Object.create(null);
            return (Object.isPrototypeOf.call(n, r) || n === r) && (s = Object.create(null)), 
            e.routineOptions(t, s);
          },
          routinesCompose: routinesCompose,
          routineExtend: 
          //
          /**
 * The routineExtend() is used to copy the values of all properties
 * from source routine to a target routine.
 *
 * It takes first routine (dst), and shallow clone each destination property of type map.
 * Then it checks properties of source routine (src) and extends dst by source properties.
 * The dst properties can be owerwriten by values of source routine
 * if descriptor (writable) of dst property is set.
 *
 * If the first routine (dst) is null then
 * routine routineExtend() makes a routine from routines pre and body
 * @see {@link wTools.routineFromPreAndBody} - Automatic routine generating
 * from preparation routine and main routine (body).
 *
 * @param{ routine } dst - The target routine or null.
 * @param{ * } src - The source routine or object to copy.
 *
 * @example
 * // returns [ routine routinesCompose ], got.option === 1
 * var src =
 * {
 *   pre : _.routinesCompose.pre,
 *   body : _.routinesCompose.body,
 *   someOption : 1,
 * }
 * var got = _.routineExtend( null, src );
 *
 * @example
 * // returns [ routine routinesCompose ]
 * _.routineExtend( null, _.routinesCompose );
 *
 * @example
 * // returns [ routine routinesCompose ], routinesCompose.someOption === 1
 * _.routineExtend( _.routinesCompose, { someOption : 1 } );
 *
 * @example
 * // returns [ routine routinesCompose ], routinesCompose.someOption === 1
 * _.routinesComposes.someOption = 22;
 * _.routineExtend( _.routinesCompose, { someOption : 1 } );
 *
 * @returns { routine } It will return the target routine with extended properties.
 * @function routineExtend
 * @throws { Error } Throw an error if arguments.length < 1 or arguments.length > 2.
 * @throws { Error } Throw an error if dst is not routine or not null.
 * @throws { Error } Throw an error if dst is null and src has not pre and body properties.
 * @throws { Error } Throw an error if src is primitive value.
 * @memberof wTools
 */
          function routineExtend(t) {
            /* generate dst routine */
            if (e.assert(1 === arguments.length || 2 === arguments.length), e.assert(e.routineIs(t) || null === t), 
            null === t) {
              let r = Object.create(null);
              for (let t = 0; t < arguments.length; t++) {
                let n = arguments[t];
                null !== n && e.mapExtend(r, n);
              }
              r.pre && r.body ? t = e.routineFromPreAndBody(r.pre, r.body) : e.assert(0, "Not clear how to construct the routine");
            }
            /* shallow clone properties of dst routine */            for (let r in t) {
              let n = t[r];
              e.mapIs(n) && (n = e.mapExtend(null, n), t[r] = n);
            }
            /* extend dst routine */            for (let r = 0; r < arguments.length; r++) {
              let n = arguments[r];
              if (null !== n) {
                e.assert(!e.primitiveIs(n));
                for (let r in n) {
                  let s = n[r], l = Object.getOwnPropertyDescriptor(t, r);
                  l && !l.writable || (e.objectIs(s) && (e.assert(!e.mapHas(t, r) || e.mapIs(t[r])), 
                  s = Object.create(s), t[r] && e.mapSupplement(s, t[r])), t[r] = s);
                }
              }
            }
            return t;
          },
          routineFromPreAndBody: routineFromPreAndBody
        };
        // --
        // routines
        // --
                //
        Object.assign(t, r), Object.assign(t, {}), 
        // --
        // export
        // --
        void 0 !== n && null !== n && (n.exports = t);
      }();
    });
    n.include, n.include;
  }(), // == end of file fRoutine_s
  function fString_s() {
    let t = _starter_._pathResolve(e, "dwtools/abase/l0/fString.s"), r = _starter_._pathResolve(e, "dwtools/abase/l0/"), n = _starter_._fileCreate(t, r, // == begin of file fString_s
    function fString_s_naked() {
      !function _fString_s_() {
        "use strict";
        // let _ArraySlice = Array.prototype.slice;
        // let _FunctionBind = Function.prototype.bind;
        // // let Object.prototype.toString = Object.prototype.toString;
        // let Object.hasOwnProperty = Object.hasOwnProperty;
        // --
        // str
        // --
        /**
 * Function strIs checks incoming param whether it is string.
 * Returns "true" if incoming param is string. Othervise "false" returned
 *
 * @example
 * //returns true
 * strIsIs( 'song' );
 * @example
 * // returns false
 * strIs( 5 );
 *
 * @param {*} src.
 * @return {Boolean}.
 * @function strIs.
 * @memberof wTools
 */
        function strIs(e) {
          return "[object String]" === Object.prototype.toString.call(e);
        }
        //
                //
        function strLike(t) {
          return !!e.strIs(t) || !!e.regexpIs(t);
        }
        //
                // --
        // converter
        // --
        function toStr(t, r) {
          return e.assert(1 === arguments.length || 2 === arguments.length), e.str(t);
        }
        // --
        // decorator
        // --
        function strQuote(t) {
          if (e.mapIs(t) || (t = {
            src: t
          }), void 0 !== t.quote && null !== t.quote || (t.quote = strQuote.defaults.quote), 
          e.assertMapHasOnly(t, strQuote.defaults), e.assert(1 === arguments.length, "Expects single argument"), 
          e.arrayIs(t.src)) {
            let r = [];
            for (let n = 0; n < t.src.length; n++) r.push(e.strQuote({
              src: t.src[n],
              quote: t.quote
            }));
            return r;
          }
          let r = t.src;
          return e.primitiveIs(r) || (r = e.toStr(r)), e.assert(e.primitiveIs(r)), t.quote + String(r) + t.quote;
        }
        // //
        //
        // function _strCutOff_pre( routine, args )
        // {
        //   let o;
        //
        //   if( args.length > 1 )
        //   {
        //     o = { src : args[ 0 ], delimeter : args[ 1 ], number : args[ 2 ] };
        //   }
        //   else
        //   {
        //     o = args[ 0 ];
        //     _.assert( args.length === 1, 'Expects single argument' );
        //   }
        //
        //   _.routineOptions( routine, o );
        //   _.assert( args.length === 1 || args.length === 2 || args.length === 3 );
        //   _.assert( arguments.length === 2, 'Expects exactly two arguments' );
        //   _.assert( _.strIs( o.src ) );
        //   _.assert( _.strIs( o.delimeter ) || _.arrayIs( o.delimeter ) );
        //
        //   return o;
        // }
        //
        function strEquivalent(t, r) {
          let n = e.strIs(t), s = e.strIs(r);
          if (e.assert(2 === arguments.length, "Expects exactly two arguments"), !n && s) return e.strEquivalent(r, t);
          if (e.assert(e.strLike(t), "Expects string-like ( string or regexp )"), e.assert(e.strLike(t), "Expects string-like ( string or regexp )"), 
          n && s) return t === r;
          if (n) {
            debugger;
            let e = r.exec(t);
            debugger;
            return !!e && e[0].length === t.length;
          }
          return e.regexpIdentical(t, r);
        }
        //
                _global_;
        let e = _global_.wTools, t = _global_.wTools;
        toStr.fields = toStr, toStr.routines = toStr, strQuote.defaults = {
          src: null,
          quote: '"'
        };
        // --
        // fields
        // --
        let r = {
          strIs: strIs,
          strsAreAll: function strsAreAll(t) {
            if (e.assert(1 === arguments.length), e.arrayLike(t)) {
              for (let r = 0; r < t.length; r++) if (!e.strIs(t[r])) return !1;
              return !0;
            }
            return strIs(t);
          },
          strLike: strLike,
          strsLikeAll: function strsLikeAll(t) {
            if (e.assert(1 === arguments.length), e.arrayLike(t)) {
              for (let r = 0; r < t.length; r++) if (!e.strLike(t[r])) return !1;
              return !0;
            }
            return strLike(t);
          }
          //
          ,
          strDefined: function strDefined(e) {
            return !!e && "[object String]" === Object.prototype.toString.call(e);
          }
          //
          ,
          strsAreNotEmpty: function strsAreNotEmpty(t) {
            if (e.arrayLike(t)) {
              for (let r = 0; r < t.length; r++) if (!e.strDefined(t[r])) return !1;
              return !0;
            }
            return !1;
          },
          // converter
          toStr: toStr,
          toStrShort: toStr,
          strFrom: toStr,
          str: 
          //
          /**
  * Return in one string value of all arguments.
  * @example
   let args = _.str( 'test2' );
  * @return {string}
  * If no arguments return empty string
  * @function str
  * @memberof wTools
  */
          function str() {
            let t, r = "";
            if (!arguments.length) return r;
            for (let n = 0; n < arguments.length; n++) {
              let s = arguments[n];
              if (s && s.toStr && !Object.hasOwnProperty.call(s, "constructor")) t = s.toStr(); else try {
                t = String(s);
              } catch (r) {
                t = e.strType(s);
              }
              r += t + " ";
            }
            return r;
          }
          //
          ,
          strShort: function strShort(t) {
            let r = "";
            e.assert(1 === arguments.length, "Expects exactly one argument");
            try {
              if (e.primitiveIs(t)) return String(t);
              e.vectorIs(t) ? r += "[ Vector with " + t.length + " elements ]" : t && !e.objectIs(t) && e.numberIs(t.length) ? r += "[ " + e.strType(t) + " with " + t.length + " elements ]" : e.objectIs(t) || e.objectLike(t) ? r += "[ " + e.strType(t) + " with " + e.entityLength(t) + " elements ]" : t instanceof Date ? r += t.toISOString() : r += String(t);
            } catch (e) {
              throw e;
            }
            return r;
          }
          //
          ,
          strPrimitive: function strPrimitive(t) {
            if (e.assert(1 === arguments.length, "Expects exactly one argument"), null !== t && void 0 !== t) return e.primitiveIs(t) ? String(t) : void 0;
          }
          //
          /**
  * Return type of src.
  * @example
      let str = _.strType( 'testing' );
  * @param {*} src
  * @return {string}
  * string name of type src
  * @function strType
  * @memberof wTools
  */ ,
          strType: function strType(t) {
            if (e.assert(1 === arguments.length, "Expects single argument"), !e.primitiveIs(t) && t.constructor && t.constructor.name) return t.constructor.name;
            let r = e.strPrimitiveType(t);
            return "Object" === r && (null === Object.getPrototypeOf(t) ? r = "Map:Pure" : t.__proto__ !== Object.__proto__ && (r = "Object:Special")), 
            r;
          }
          //
          /**
  * Return primitive type of src.
  * @example
      let str = _.strPrimitiveType( 'testing' );
  * @param {*} src
  * @return {string}
  * string name of type src
  * @function strPrimitiveType
  * @memberof wTools
  */ ,
          strPrimitiveType: function strPrimitiveType(t) {
            let r = Object.prototype.toString.call(t), n = /\[(\w+) (\w+)\]/.exec(r);
            if (!n) throw e.err("strType :", "unknown type", r);
            return n[2];
          },
          // decorator
          strQuote: strQuote,
          //
          _strLeftSingle: 
          // --
          //
          // --
          function _strLeftSingle(t, r, n, s) {
            e.assert(2 === arguments.length || 3 === arguments.length || 4 === arguments.length), 
            e.assert(e.strIs(t)), e.assert(void 0 === n || e.numberIs(n)), e.assert(void 0 === s || e.numberIs(s)), 
            r = e.arrayAs(r);
            let l = t.length, a = Object.create(null);
            a.index = l, a.entry = void 0, void 0 === n && void 0 === s || (void 0 === n && (n = 0), 
            void 0 === s && (s = t.length), n < 0 && (n = t.length + n), s < 0 && (s = t.length + s), 
            e.assert(0 <= n && n <= t.length), e.assert(0 <= s && s <= t.length), t = t.substring(n, s));
            for (let n = 0, s = r.length; n < s; n++) {
              let s = r[n];
              if (e.strIs(s)) {
                let e = t.indexOf(s);
                e >= 0 && (e < a.index || void 0 === a.entry) && (a.index = e, a.entry = s);
              } else if (e.regexpIs(s)) {
                let e = t.match(s);
                e && (e.index < a.index || void 0 === a.entry) && (a.index = e.index, a.entry = e[0]);
              } else e.assert(0, "Expects string-like ( string or regexp )");
            }
            return void 0 !== n && a.index !== l && (a.index += n), a;
          }
          //
          ,
          strLeft: function strLeft(t, r, n, s) {
            if (e.assert(2 === arguments.length || 3 === arguments.length || 4 === arguments.length), 
            e.arrayLike(t)) {
              let l = [];
              for (let a = 0; a < t.length; a++) l[a] = e._strLeftSingle(t[a], r, n, s);
              return l;
            }
            return e._strLeftSingle(t, r, n, s);
          }
          //
          /*

(bb)(?!(?=.).*(?:bb))
aaa_bbb_|bb|b_ccc_ccc

.*(bb)
aaa_bbb_b|bb|_ccc_ccc

(b+)(?!(?=.).*(?:b+))
aaa_bbb_|bbb|_ccc_ccc

.*(b+)
aaa_bbb_bb|b|_ccc_ccc

*/ ,
          _strRightSingle: function _strRightSingle(t, r, n, s) {
            e.assert(2 === arguments.length || 3 === arguments.length || 4 === arguments.length), 
            e.assert(e.strIs(t)), e.assert(void 0 === n || e.numberIs(n)), e.assert(void 0 === s || e.numberIs(s)), 
            r = e.arrayAs(r), t.length;
            let l = Object.create(null);
            l.index = -1, l.entry = void 0, void 0 === n && void 0 === s || (void 0 === n && (n = 0), 
            void 0 === s && (s = t.length), n < 0 && (n = t.length + n), s < 0 && (s = t.length + s), 
            e.assert(0 <= n && n <= t.length), e.assert(0 <= s && s <= t.length), t = t.substring(n, s));
            for (let n = 0, s = r.length; n < s; n++) {
              let s = r[n];
              if (e.strIs(s)) {
                let e = t.lastIndexOf(s);
                e >= 0 && e > l.index && (l.index = e, l.entry = s);
              } else if (e.regexpIs(s)) {
                // entry = _.regexpsJoin([ entry, '(?!(?=.).*(?:))' ]);
                // debugger;
                let r = e.regexpsJoin([ ".*", "(", s, ")" ]), n = t.match(r);
 // xxx
                                if (!n) continue;
                let a, i = e.regexpsJoin([ s, "(?!(?=.).*", s, ")" ]), o = t.match(i);
                e.assert(!!o);
                let u, c = n[1], p = o[0], g = n.index + n[0].length, f = o.index + o[0].length;
                if (g === f) if (c.length < p.length) {
                  debugger;
                  u = f - (a = p).length;
                } else u = g - (a = c).length; else if (g < f) u = f - (a = p).length; else {
                  debugger;
                  u = g - (a = c).length;
                }
                u > l.index && (l.index = u, l.entry = a);
              } else e.assert(0, "Expects string-like ( string or regexp )");
            }
            return void 0 !== n && -1 !== l.index && (l.index += n), l;
          }
          //
          ,
          strRight: function strRight(t, r, n, s) {
            if (e.assert(2 === arguments.length || 3 === arguments.length || 4 === arguments.length), 
            e.arrayLike(t)) {
              let l = [];
              for (let a = 0; a < t.length; a++) l[a] = e._strRightSingle(t[a], r, n, s);
              return l;
            }
            return e._strRightSingle(t, r, n, s);
          },
          strEquivalent: strEquivalent,
          strsEquivalent: e.vectorize(strEquivalent, 2),
          strsEquivalentAll: e.vectorizeAll(strEquivalent, 2),
          strsEquivalentAny: e.vectorizeAny(strEquivalent, 2),
          strsEquivalentNone: e.vectorizeNone(strEquivalent, 2),
          _strBeginOf: 
          //
          function _strBeginOf(t, r) {
            if (e.assert(e.strIs(t), "Expects string"), e.assert(2 === arguments.length, "Expects exactly two arguments"), 
            e.strIs(r)) {
              if (0 === t.lastIndexOf(r, 0)) return r;
            } else if (e.regexpIs(r)) {
              let e = r.exec(t);
              if (e && 0 === e.index) return e[0];
            } else e.assert(0, "Expects string-like ( string or regexp )");
            return !1;
          }
          //
          ,
          _strEndOf: function _strEndOf(t, r) {
            if (e.assert(e.strIs(t), "Expects string"), e.assert(2 === arguments.length, "Expects exactly two arguments"), 
            e.strIs(r)) {
              if (-1 !== t.indexOf(r, t.length - r.length)) return r;
            } else if (e.regexpIs(r)) {
              // let matched = end.exec( src );
              let e = RegExp(r.toString().slice(1, -1) + "$").exec(t);
              debugger;
              //if( matched && matched.index === 0 )
                            if (e && e.index + e[0].length === t.length) return e[0];
            } else e.assert(0, "Expects string-like ( string or regexp )");
            return !1;
          }
          //
          /**
  * Compares two strings.
  * @param { String } src - Source string.
  * @param { String } begin - String to find at begin of source.
  *
  * @example
  * let scr = _.strBegins( "abc", "a" );
  * // returns true
  *
  * @example
  * let scr = _.strBegins( "abc", "b" );
  * // returns false
  *
  * @returns { Boolean } Returns true if param( begin ) is match with first chars of param( src ), otherwise returns false.
  * @function strBegins
  * @throws { Exception } If one of arguments is not a String.
  * @throws { Exception } If( arguments.length ) is not equal 2.
  * @memberof wTools
  */ ,
          strBegins: function strBegins(t, r) {
            if (e.assert(e.strIs(t), "Expects string {-src-}"), e.assert(e.strIs(r) || e.regexpIs(r) || e.longIs(r), "Expects string/regexp or array of strings/regexps {-begin-}"), 
            e.assert(2 === arguments.length, "Expects exactly two arguments"), !e.longIs(r)) {
              let n = e._strBeginOf(t, r);
              return !1 !== n || n;
            }
            for (let n = 0, s = r.length; n < s; n++) if (!1 !== e._strBeginOf(t, r[n])) return !0;
            return !1;
          }
          //
          /**
  * Compares two strings.
  * @param { String } src - Source string.
  * @param { String } end - String to find at end of source.
  *
  * @example
  * let scr = _.strEnds( "abc", "c" );
  * // returns true
  *
  * @example
  * let scr = _.strEnds( "abc", "b" );
  * // returns false
  *
  * @return { Boolean } Returns true if param( end ) is match with last chars of param( src ), otherwise returns false.
  * @function strEnds
  * @throws { Exception } If one of arguments is not a String.
  * @throws { Exception } If( arguments.length ) is not equal 2.
  * @memberof wTools
  */ ,
          strEnds: function strEnds(t, r) {
            if (e.assert(e.strIs(t), "Expects string {-src-}"), e.assert(e.strIs(r) || e.regexpIs(r) || e.longIs(r), "Expects string/regexp or array of strings/regexps {-end-}"), 
            e.assert(2 === arguments.length, "Expects exactly two arguments"), !e.longIs(r)) {
              let n = e._strEndOf(t, r);
              return !1 !== n || n;
            }
            for (let n = 0, s = r.length; n < s; n++) if (!1 !== e._strEndOf(t, r[n])) return !0;
            return !1;
          }
          //
          /**
  * Finds occurrence of( end ) at the end of source( src ) and removes it if exists.
  * Returns begin part of a source string if occurrence was finded or empty string if arguments are equal, otherwise returns undefined.
  *
  * @param { String } src - The source string.
  * @param { String } end - String to find.
  *
  * @example
  * _.strBeginOf( 'abc', 'c' );
  * //returns 'ab'
  *
  * @example
  * _.strBeginOf( 'abc', 'x' );
  * //returns undefined
  *
  * @returns { String } Returns part of source string without tail( end ) or undefined.
  * @throws { Exception } If all arguments are not strings;
  * @throws { Exception } If ( argumets.length ) is not equal 2.
  * @function strBeginOf
  * @memberof wTools
  */ ,
          strBeginOf: function strBeginOf(t, r) {
            if (e.assert(e.strIs(t), "Expects string {-src-}"), e.assert(e.strIs(r) || e.regexpIs(r) || e.longIs(r), "Expects string/regexp or array of strings/regexps {-begin-}"), 
            e.assert(2 === arguments.length, "Expects exactly two arguments"), !e.longIs(r)) {
              let n = e._strBeginOf(t, r);
              if (n) debugger;
              return n;
            }
            debugger;
            for (let n = 0, s = r.length; n < s; n++) {
              let s = e._strBeginOf(t, r[n]);
              if (!1 !== s) return s;
            }
            return !1;
          }
          //
          /**
  * Finds occurrence of( begin ) at the begining of source( src ) and removes it if exists.
  * Returns end part of a source string if occurrence was finded or empty string if arguments are equal, otherwise returns undefined.
  * otherwise returns undefined.
  *
  * @param { String } src - The source string.
  * @param { String } begin - String to find.
  *
  * @example
  * _.strEndOf( 'abc', 'a' );
  * //returns 'bc'
  *
  * @example
  * _.strEndOf( 'abc', 'c' );
  * //returns undefined
  *
  * @returns { String } Returns part of source string without head( begin ) or undefined.
  * @throws { Exception } If all arguments are not strings;
  * @throws { Exception } If ( argumets.length ) is not equal 2.
  * @function strEndOf
  * @memberof wTools
  */ ,
          strEndOf: function strEndOf(t, r) {
            e.assert(e.strIs(t), "Expects string {-src-}"), e.assert(e.strIs(r) || e.regexpIs(r) || e.longIs(r), "Expects string/regexp or array of strings/regexps {-end-}"), 
            e.assert(2 === arguments.length, "Expects exactly two arguments");
            debugger;
            if (!e.longIs(r)) return e._strEndOf(t, r);
            for (let n = 0, s = r.length; n < s; n++) {
              let s = e._strEndOf(t, r[n]);
              if (!1 !== s) return s;
            }
            return !1;
          }
          //
          /**
  * Returns part of a source string( src ) between first occurrence of( begin ) and last occurrence of( end ).
  * Returns result if ( begin ) and ( end ) exists in source( src ) and index of( end ) is bigger the index of( begin ).
  * Otherwise returns undefined.
  *
  * @param { String } src - The source string.
  * @param { String } begin - String to find from begin of source.
  * @param { String } end - String to find from end source.
  *
  * @example
  * _.strInsideOf( 'abcd', 'a', 'd' );
  * //returns 'bc'
  *
  * @example
  * _.strInsideOf( 'aabcc', 'a', 'c' );
  * //returns 'aabcc'
  *
  * @example
  * _.strInsideOf( 'aabcc', 'a', 'a' );
  * //returns 'a'
  *
  * @example
  * _.strInsideOf( 'abc', 'a', 'a' );
  * //returns undefined
  *
  * @example
  * _.strInsideOf( 'abcd', 'x', 'y' )
  * //returns undefined
  *
  * @example
  * //index of begin is bigger then index of end
  * _.strInsideOf( 'abcd', 'c', 'a' )
  * //returns undefined
  *
  * @returns { string } Returns part of source string between ( begin ) and ( end ) or undefined.
  * @throws { Exception } If all arguments are not strings;
  * @throws { Exception } If ( argumets.length ) is not equal 3.
  * @function strInsideOf
  * @memberof wTools
  */ ,
          strInsideOf: function strInsideOf(t, r, n) {
            let s, l;
            if (e.assert(e.strIs(t), "Expects string {-src-}"), e.assert(3 === arguments.length, "Expects exactly three arguments"), 
            !1 === (s = e.strBeginOf(t, r))) return !1;
            debugger;
            if (!1 === (l = e.strEndOf(t, n))) return !1;
            debugger;
            return t.substring(s.length, t.length - l.length);
          }
          //
          ,
          strOutsideOf: function strOutsideOf(t, r, n) {
            let s, l;
            return e.assert(e.strIs(t), "Expects string {-src-}"), e.assert(3 === arguments.length, "Expects exactly three arguments"), 
            !1 !== (s = e.strBeginOf(t, r)) && !1 !== (l = e.strEndOf(t, n)) && s + l;
          }
          //
          /**
 * Finds substring prefix ( begin ) occurrence from the very begining of source ( src ) and removes it.
 * Returns original string if source( src ) does not have occurrence of ( prefix ).
 *
 * @param { String } src - Source string to parse.
 * @param { String } prefix - String that is to be dropped.
 * @returns { String } Returns string with result of prefix removement.
 *
 * @example
 * //returns mple
 * _.strRemoveBegin( 'example', 'exa' );
 *
 * @example
 * //returns example
 * _.strRemoveBegin( 'example', 'abc' );
 *
 * @function strRemoveBegin
 * @throws { Exception } Throws a exception if( src ) is not a String.
 * @throws { Exception } Throws a exception if( prefix ) is not a String.
 * @throws { Exception } Throws a exception if( arguments.length ) is not equal 2.
 * @memberof wTools
 *
 */ ,
          strRemoveBegin: function strRemoveBegin(t, r) {
            e.assert(2 === arguments.length, "Expects exactly two arguments"), e.assert(e.strIs(t), "Expects string {-src-}"), 
            e.assert(e.strIs(r) || e.regexpIs(r), "Expects string/regexp {-begin-}");
            let n = t, s = e._strBeginOf(n, r);
            return !1 !== s && (n = n.substr(s.length, n.length)), n;
          }
          //
          /**
 * Removes occurrence of postfix ( end ) from the very end of string( src ).
 * Returns original string if no occurrence finded.
 * @param { String } src - Source string to parse.
 * @param { String } postfix - String that is to be dropped.
 * @returns { String } Returns string with result of postfix removement.
 *
 * @example
 * //returns examp
 * _.strRemoveEnd( 'example', 'le' );
 *
 * @example
 * //returns example
 * _.strRemoveEnd( 'example', 'abc' );
 *
 * @function strRemoveEnd
 * @throws { Exception } Throws a exception if( src ) is not a String.
 * @throws { Exception } Throws a exception if( postfix ) is not a String.
 * @throws { Exception } Throws a exception if( arguments.length ) is not equal 2.
 * @memberof wTools
 *
 */ ,
          strRemoveEnd: function strRemoveEnd(t, r) {
            e.assert(2 === arguments.length, "Expects exactly two arguments"), e.assert(e.strIs(t), "Expects string {-src-}"), 
            e.assert(e.strIs(r) || e.regexpIs(r), "Expects string/regexp {-end-}");
            let n = t, s = e._strEndOf(n, r);
            return !1 !== s && (n = n.substr(0, n.length - s.length)), n;
          }
          //
          /**
* Finds substring or regexp ( insStr ) first occurrence from the source string ( srcStr ) and removes it.
* Returns original string if source( src ) does not have occurrence of ( insStr ).
*
* @param { String } srcStr - Source string to parse.
* @param { String } insStr - String/RegExp that is to be dropped.
* @returns { String } Returns string with result of substring removement.
*
* @example
* //returns ource tring
* _.strRemove( 'source string', 's' );
*
* @example
* //returns example
* _.strRemove( 'example', 's' );
*
* @function strRemove
* @throws { Exception } Throws a exception if( srcStr ) is not a String.
* @throws { Exception } Throws a exception if( insStr ) is not a String or a RegExp.
* @throws { Exception } Throws a exception if( arguments.length ) is not equal 2.
* @memberof wTools
*
*/ ,
          strRemove: function strRemove(t, r) {
            e.assert(2 === arguments.length, "expects exactly two arguments"), e.assert(e.strIs(t), "expects string {-src-}"), 
            e.assert(e.strIs(r) || e.regexpIs(r), "expects string/regexp {-begin-}");
            let n = t;
            debugger;
            return n.replace(r, "");
          }
          //
          ,
          strReplaceBegin: function strReplaceBegin(t, r, n) {
            e.assert(3 === arguments.length, "Expects exactly three arguments"), e.assert(e.strIs(n), "Expects {-ins-} as string"), 
            e.assert(e.strIs(t));
            let s = t;
            return e.strBegins(s, r) && (s = n + e.strRemoveBegin(s, r)), s;
          }
          //
          ,
          strReplaceEnd: function strReplaceEnd(t, r, n) {
            e.assert(3 === arguments.length, "Expects exactly three arguments"), e.assert(e.strIs(n), "Expects {-ins-} as string"), 
            e.assert(e.strIs(t));
            let s = t;
            if (e.strEnds(s, r)) {
              let t = n;
              s = e.strRemoveEnd(s, r) + t;
            }
            return s;
          }
          //
          ,
          strReplace: function strReplace(t, r, n) {
            e.assert(3 === arguments.length, "expects exactly three arguments"), e.assert(e.strIs(t), "expects string {-src-}"), 
            e.assert(e.strIs(n), "expects string {-sub-}");
            let s = t;
            debugger;
            return s.replace(r, n);
          }
        };
        // --
        // routines
        // --
                //
        Object.assign(t, r), Object.assign(t, {}), 
        // --
        // export
        // --
        void 0 !== n && null !== n && (n.exports = t);
      }();
    });
    n.include, n.include;
  }(), // == end of file fString_s
  function fTime_s() {
    let t = _starter_._pathResolve(e, "dwtools/abase/l0/fTime.s"), r = _starter_._pathResolve(e, "dwtools/abase/l0/"), n = _starter_._fileCreate(t, r, // == begin of file fTime_s
    function fTime_s_naked() {
      !function _fTime_s_() {
        "use strict";
        _global_;
        let e = _global_.wTools, t = _global_.wTools, r = (Array.prototype.indexOf, Array.prototype.lastIndexOf, 
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
          datesAreIdentical: function datesAreIdentical(t, r) {
            return e.assert(2 === arguments.length, "Expects exactly two arguments"), !!e.dateIs(t) && !!e.dateIs(r) && (t = t.getTime()) === r.getTime();
          }
          // --
          // fields
          // --
                });
        //
        Object.assign(t, r), Object.assign(t, {}), 
        // --
        // export
        // --
        void 0 !== n && null !== n && (n.exports = t);
      }();
    });
    n.include, n.include;
  }(), // == end of file fTime_s
  function iArrayDescriptor_s() {
    let t = _starter_._pathResolve(e, "dwtools/abase/l0/iArrayDescriptor.s"), r = _starter_._pathResolve(e, "dwtools/abase/l0/"), n = _starter_._fileCreate(t, r, // == begin of file iArrayDescriptor_s
    function iArrayDescriptor_s_naked() {
      !function _kArrayDescriptor_s_() {
        "use strict";
        //
        function _arrayNameSpaceApplyTo(e, r) {
          t.assert(2 === arguments.length, "Expects exactly two arguments"), t.assert(!t.mapOwnKey(e, "withArray")), 
          t.assert(!t.mapOwnKey(e, "array")), t.assert(!!i[r]), e.withArray = Object.create(null);
          for (let r in i) e.withArray[r] = Object.create(e), t.mapExtend(e.withArray[r], i[r]);
          e.array = e.withArray[r], e.ArrayNameSpaces = i;
        }
        // --
        // delcare
        // --
                function _declare(e) {
          //
          /**
 * @summary Creates new array taking elements from source array `src`.
 * @description Type of new array depends on `ArrayType`( see examples ).
 * Returns new array of type `ArrayType` or src if types are same.
 * @param {} src Source array.
 *
 * @example
 * let src =  _.withArray.Float32.makeArrayOfLength( 2 );
 * _.array.arrayFromCoercing( src );//Array [ 0,0 ]
 *
 * @example
 * let src =  _.array.makeArrayOfLength( 2 );
 * _.withArray.Float32.arrayFromCoercing( src );// Float32Array [ 0,0 ]
 *
 * @example
 * let src =  _.array.makeArrayOfLength( 2 );
 * _.array.arrayFromCoercing( src );// returns src
 *
 * @function arrayFromCoercing
 * @memberof wTools."wTools.array"
 */
          function arrayFromCoercing(e) {
            if (t.assert(t.longIs(e)), t.assert(1 === arguments.length, "Expects single argument"), 
            e.constructor === this.array.ArrayType) return e;
            return this.array.ArrayType === Array ? new (t.constructorJoin(this.array.ArrayType, e))() : new this.array.ArrayType(e);
          }
          // --
          //
          // --
                    e.ArrayType;
          let r = e.ArrayName, n = {
            makeSimilar: 
            //
            /**
 * @summary Creates new array based on type of `src` array. Takes length of new array from second argument `length`.
 * @param {} src Source array
 * @param {Number} [ length ] Lengthof target array.
 * @function makeSimilar
 * @memberof wTools."wTools.array"
 */
            function makeSimilar(e, r) {
              return t.assert(1 === arguments.length || 2 === arguments.length), t.longMake(e, r);
            }
            //
            /**
 * @summary Creates new array of length( length ).
 * @description Type of array depends on `ArrayType`( see examples ).
 * @param {Number} length Lengthof new array.
 *
 * @example
 * _.array.makeArrayOfLength(1);// return instance of Array
 *
 * @example
 * _.withArray.Float32.makeArrayOfLength(1);// return instance of Float32Array
 *
 * @function makeArrayOfLength
 * @memberof wTools."wTools.array"
 */ ,
            makeArrayOfLength: function makeArrayOfLength(e) {
              return void 0 === e && (e = 0), t.assert(void 0 === e || e >= 0), t.assert(0 === arguments.length || 1 === arguments.length), 
              new this.array.ArrayType(e);
            }
            //
            /**
 * @summary Creates new array of length( length ) filled with zeroes.
 * @description Type of array depends on `ArrayType`( see examples ).
 * @param {Number} length Lengthof new array.
 *
 * @example
 * _.array.makeArrayOfLengthZeroed( 2 );//Array [ 0,0 ]
 *
 * @example
 * _.withArray.Float32.makeArrayOfLength( 2 );// Float32Array [ 0,0 ]
 *
 * @function makeArrayOfLengthZeroed
 * @memberof wTools."wTools.array"
 */ ,
            makeArrayOfLengthZeroed: function makeArrayOfLengthZeroed(e) {
              void 0 === e && (e = 0), t.assert(void 0 === e || e >= 0), t.assert(0 === arguments.length || 1 === arguments.length);
              let r = new this.array.ArrayType(e);
              if (this.array.ArrayType === Array) for (let t = 0; t < e; t++) r[t] = 0;
              return r;
            },
            arrayFrom: arrayFromCoercing,
            arrayFromCoercing: arrayFromCoercing,
            array: e = t.mapExtend(null, e)
          };
          return t.mapExtend(e, n), t.assert(!i[r]), i[r] = e, e;
        }
        // --
        //
        // --
                function makeFor_functor(e) {
          return t.assert(1 === arguments.length), t.assert(t.routineIs(e)), t.assert(t.strDefined(e.name)), 
          {
            [e.name]: function(r) {
              debugger;
              return t.assert(1 === arguments.length), new e(r);
            }
          }[e.name];
        }
        //
                function fromFor_functor(e) {
          return t.assert(1 === arguments.length), t.assert(t.routineIs(e)), t.assert(t.strDefined(e.name)), 
          {
            [e.name]: function() {
              debugger;
              return t.assert(1 === arguments.length), this instanceof e ? this : new e(src);
            }
          }[e.name];
        }
        //
                function isFor_functor(e) {
          return t.assert(1 === arguments.length), t.assert(t.routineIs(e)), t.assert(t.strDefined(e.name)), 
          {
            [e.name]: function(r) {
              debugger;
              return xxx, t.assert(1 === arguments.length), r instanceof e;
            }
          }[e.name];
        }
        //
                function longDeclare(e) {
          return t.routineOptions(longDeclare, e), t.assert(t.strDefined(e.name)), t.assert(t.strDefined(e.secondName) || null === e.secondName), 
          t.assert(t.strDefined(e.aliasName) || null === e.aliasName), t.assert(t.routineIs(e.type)), 
          t.assert(t.routineIs(e.make) || null === e.make), t.assert(t.routineIs(e.from) || null === e.from), 
          t.assert(t.routineIs(e.is) || null === e.make), t.assert(t.boolIs(e.isTyped)), t.assert(void 0 === s[e.name]), 
          e.make || (e.make = makeFor_functor(e.type)), e.from || (e.from = fromFor_functor(e.type)), 
          e.is || (e.is = isFor_functor(e.type)), Object.freeze(e), s[e.name] = e, e;
        }
        let e = _global_, t = e.wTools, r = e.wTools;
        t.assert(!t.Array), t.assert(!t.array), t.assert(!t.withArray), longDeclare.defaults = {
          name: null,
          secondName: null,
          aliasName: null,
          type: null,
          make: null,
          from: null,
          is: null,
          isTyped: null
        };
        //
        let s = {};
        longDeclare({
          name: "Array",
          type: Array,
          make: t.arrayMake,
          from: t.arrayMake,
          is: t.arrayIs,
          isTyped: !1
        }), longDeclare({
          name: "Unroll",
          type: Array,
          make: t.unrollMake,
          from: t.unrollFrom,
          is: t.unrollIs,
          isTyped: !1
        }), longDeclare({
          name: "ArgumentsArray",
          secondName: "Arguments",
          type: t._argumentsArrayMake().constructor,
          make: t.argumentsArrayFrom,
          from: t.argumentsArrayFrom,
          is: t.argumentsArrayIs,
          isTyped: !1
        }), longDeclare({
          name: "U32x",
          secondName: "Uint32",
          type: e.U32x,
          isTyped: !0
        }), longDeclare({
          name: "U16x",
          secondName: "Uint16",
          type: e.U16x,
          isTyped: !0
        }), longDeclare({
          name: "U8x",
          secondName: "Uint8",
          type: e.U8x,
          isTyped: !0
        }), longDeclare({
          name: "Ux",
          secondName: "Uint32",
          aliasName: "U32x",
          type: e.Ux,
          isTyped: !0
        }), longDeclare({
          name: "I32x",
          secondName: "Int32",
          type: e.I32x,
          isTyped: !0
        }), longDeclare({
          name: "I16x",
          secondName: "Int16",
          type: e.I16x,
          isTyped: !0
        }), longDeclare({
          name: "I8x",
          secondName: "Int8",
          type: e.I8x,
          isTyped: !0
        }), longDeclare({
          name: "Ix",
          secondName: "Int32",
          aliasName: "I32x",
          type: e.Ix,
          isTyped: !0
        }), longDeclare({
          name: "F32x",
          secondName: "Float32",
          type: e.F32x,
          isTyped: !0
        }), longDeclare({
          name: "F64x",
          secondName: "Float64",
          type: e.F64x,
          isTyped: !0
        }), longDeclare({
          name: "Fx",
          secondName: "Float32",
          aliasName: "F32x",
          type: e.Fx,
          isTyped: !0
        });
        //
        let l = {
          makeFor_functor: makeFor_functor,
          fromFor_functor: fromFor_functor,
          isFor_functor: isFor_functor,
          longDeclare: longDeclare,
          LongDescriptor: s
        };
        Object.assign(wTools, l);
        // --
        //
        // --
        let a = [ {
          ArrayType: Float32Array,
          ArrayName: "Float32"
        }, {
          ArrayType: Uint32Array,
          ArrayName: "Wrd32"
        }, {
          ArrayType: Int32Array,
          ArrayName: "Int32"
        }, {
          ArrayType: Array,
          ArrayName: "Array"
        } ];
        // if( _.Array )
        // debugger;
        // if( _.Array )
        // return;
                t.assert(!t.Array), t.assert(!t.array), t.assert(!t.withArray);
        // debugger;
        /**
 * @summary Array namespace
 * @namespace "wTools.array"
 * @memberof wTools
 */
        let i = Object.create(null);
        t._arrayNameSpaceApplyTo = _arrayNameSpaceApplyTo;
        for (let e = 0; e < a.length; e++) _declare(a[e]);
        _arrayNameSpaceApplyTo(t, "Array"), 
        // debugger;
        t.assert(!t.Array), t.assert(t.mapOwnKey(t, "withArray")), t.assert(t.mapOwnKey(t, "array")), 
        t.assert(t.mapOwnKey(t.array, "array")), t.assert(!t.mapOwnKey(t.array, "withArray")), 
        t.assert(!!t.array.withArray), t.assert(t.objectIs(t.withArray)), t.assert(t.objectIs(t.array)), 
        t.assert(t.routineIs(t.array.makeArrayOfLength)), 
        // --
        // export
        // --
        void 0 !== n && null !== n && (n.exports = r);
      }();
    });
    n.include, n.include;
  }(), // == end of file iArrayDescriptor_s
  function iCompose_s() {
    let t = _starter_._pathResolve(e, "dwtools/abase/l0/iCompose.s"), r = _starter_._pathResolve(e, "dwtools/abase/l0/"), n = _starter_._fileCreate(t, r, // == begin of file iCompose_s
    function iCompose_s_naked() {
      !function _iCompose_s_() {
        "use strict";
        _global_;
        let e = _global_.wTools, t = _global_.wTools.compose = _global_.wTools.compose || Object.create(null), r = (Array.prototype.slice, 
        Function.prototype.bind, Object.hasOwnProperty, {
          chainer: {
            original: 
            // --
            // chainer
            // --
            function originaChainer(t, r, n, s) {
              return e.assert(!1 !== r), t;
            }
            //
            ,
            originalWithDont: function originalWithDontChainer(t, r, n, s) {
              // _.assert( result !== false && result !== undefined );
              return e.assert(!1 !== r), r === e.dont ? e.dont : t;
              // return undefined;
                        }
            //
            ,
            composeAll: function composeAllChainer(t, r, n, s) {
              // if( result === undefined )
              // return args;
              return e.assert(!1 !== r), r === e.dont ? e.dont : t;
              // return undefined;
              // return _.unrollFrom( result );
                        }
            //
            ,
            chaining: function chainingChainer(t, r, n, s) {
              return e.assert(!1 !== r), void 0 === r ? t : r === e.dont ? e.dont : e.unrollFrom(r);
            }
            // --
            // supervisor
            // --
                    },
          supervisor: {
            returningLast: function returningLastSupervisor(e, t, r, n) {
              let s = r.apply(e, t);
              return s[s.length - 1];
            }
            //
            ,
            composeAll: function composeAllSupervisor(t, r, n, s) {
              let l = n.apply(t, r);
              return e.assert(!!l), l.length ? l[l.length - 1] !== e.dont && !!e.all(l) && l : l;
            }
            //
            ,
            chaining: function chainingSupervisor(t, r, n, s) {
              let l = n.apply(t, r);
              return l[l.length - 1] === e.dont && l.pop(), l;
            }
            // --
            // declare
            // --
                    }
        });
        Object.assign(t, r), 
        // --
        // export
        // --
        void 0 !== n && null !== n && (n.exports = t);
      }();
    });
    n.include, n.include;
  }(), // == end of file iCompose_s
  function iField_s() {
    let t = _starter_._pathResolve(e, "dwtools/abase/l0/iField.s"), r = _starter_._pathResolve(e, "dwtools/abase/l0/"), n = _starter_._fileCreate(t, r, // == begin of file iField_s
    function iField_s_naked() {
      !function _Field_s_() {
        "use strict";
        // --
        //
        // --
        function bypass() {
          let e = function bypass(e, t, r) {
            /*dstContainer[ key ] = srcContainer[ key ];*/
            return !0;
          };
          return e.functionFamily = "field-filter", e;
        }
        //
        function assigning() {
          let e = function assigning(e, r, n) {
            t.entityAssignFieldFromContainer(e, r, n);
          };
          return e.functionFamily = "field-mapper", e;
        }
        //
        function primitive() {
          let e = function primitive(e, r, n) {
            return !!t.primitiveIs(r[n]);
          };
          return e.functionFamily = "field-filter", e;
        }
        //
        function hiding() {
          let e = function hiding(e, t, r) {
            Object.defineProperty(e, r, {
              value: t[r],
              enumerable: !1,
              configurable: !0
            });
          };
          return e.functionFamily = "field-mapper", e;
        }
        //
        function appendingAnything() {
          let e = function appendingAnything(e, r, n) {
            void 0 === e[n] ? e[n] = r[n] : e[n] = t.arrayAppendArrays([], [ e[n], r[n] ]);
          };
          return e.functionFamily = "field-mapper", e;
        }
        //
        function appendingArrays() {
          let e = function appendingArrays(e, r, n) {
            t.arrayIs(e[n]) && t.arrayIs(r[n]) ? t.arrayAppendArray(e[n], r[n]) : e[n] = r[n];
          };
          return e.functionFamily = "field-mapper", e;
        }
        //
        function appendingOnce() {
          let e = function appendingOnce(e, r, n) {
            t.arrayIs(e[n]) && t.arrayIs(r[n]) ? t.arrayAppendArrayOnce(e[n], r[n]) : e[n] = r[n];
          };
          return e.functionFamily = "field-mapper", e;
        }
        //
        function removing() {
          let e = function removing(e, r, n) {
            let s = e[n], l = r[n];
            t.arrayIs(s) && t.arrayIs(l) ? s === l ? e[n] = [] : t.arrayRemoveArrayOnce(s, l) : s === l && delete e[n];
          };
          return e.functionFamily = "field-mapper", e;
        }
        //
        function notPrimitiveAssigning() {
          let e = function notPrimitiveAssigning(e, r, n) {
            t.primitiveIs(r[n]) || t.entityAssignFieldFromContainer(e, r, n);
          };
          return e.functionFamily = "field-mapper", e;
        }
        //
        function assigningRecursive() {
          let e = function assigningRecursive(e, r, n) {
            t.entityAssignFieldFromContainer(e, r, n, t.entityAssignFieldFromContainer);
          };
          return e.functionFamily = "field-mapper", e;
        }
        //
        function drop(e) {
          debugger;
          t.assert(t.objectIs(e));
          let r = function drop(t, r, n) {
            return void 0 === e[n];
            /*dstContainer[ key ] = srcContainer[ key ];*/          };
          return r.functionFamily = "field-filter", r;
        }
        // --
        // src
        // --
        function srcDefined() {
          let e = function srcDefined(e, t, r) {
            return void 0 !== t[r];
          };
          return e.functionFamily = "field-filter", e;
        }
        //
        function srcNull() {
          let e = function srcNull(e, t, r) {
            return null === t[r];
          };
          return e.functionFamily = "field-filter", e;
        }
        //
        function dstAndSrcOwn() {
          let e = function dstAndSrcOwn(e, t, r) {
            return !!s.call(t, r) && !!s.call(e, r);
          };
          return e.functionFamily = "field-filter", e;
        }
        //
        function dstUndefinedSrcNotUndefined() {
          let e = function dstUndefinedSrcNotUndefined(e, t, r) {
            return void 0 === e[r] && void 0 !== t[r];
          };
          return e.functionFamily = "field-filter", e;
        }
        // --
        // dstNotHas
        // --
        function dstNotHas() {
          let e = function dstNotHas(e, t, r) {
            // if( dstContainer[ key ] !== undefined )
            // return false;
            return !(r in e);
          };
          return e.functionFamily = "field-filter", e;
        }
        //
        function dstNotHasOrHasNull() {
          let e = function dstNotHasOrHasNull(e, t, r) {
            return !(r in e && null !== e[r]);
          };
          return e.functionFamily = "field-filter", e;
        }
        //
        function dstNotHasOrHasNil() {
          let e = function dstNotHasOrHasNil(e, r, n) {
            return !(n in e && e[n] !== t.nothing);
          };
          return e.functionFamily = "field-filter", e;
        }
        //
        function dstNotHasAssigning() {
          let e = function dstNotHasAssigning(e, r, n) {
            void 0 === e[n] && t.entityAssignFieldFromContainer(e, r, n);
          };
          return e.functionFamily = "field-mapper", e;
        }
        //
        function dstNotHasAppending() {
          let e = function dstNotHasAppending(e, r, n) {
            if (n in e) {
              debugger;
              t.arrayIs(e[n]) && t.arrayIs(r[n]) && t.arrayAppendArray(e, r, n);
            } else e[n] = r[n];
          };
          return e.functionFamily = "field-mapper", e;
        }
        //
        function dstNotHasSrcPrimitive() {
          let e = function dstNotHasSrcPrimitive(e, r, n) {
            debugger;
            return !(n in e || !t.primitiveIs(r[n]));
          };
          return e.functionFamily = "field-filter", e;
        }
        //
        function dstNotHasSrcOwn() {
          let e = function dstNotHasSrcOwn(e, t, r) {
            return !(!s.call(t, r) || r in e);
          };
          return e.functionFamily = "field-filter", e;
        }
        //
        function dstNotHasSrcOwnAssigning() {
          let e = function dstNotHasSrcOwnAssigning(e, r, n) {
            s.call(r, n) && (n in e || t.entityAssignFieldFromContainer(e, r, n));
          };
          return e.functionFamily = "field-mapper", e;
        }
        //
        function dstNotHasSrcOwnRoutines() {
          let e = function dstNotHasSrcOwnRoutines(e, r, n) {
            return !(!s.call(r, n) || !t.routineIs(r[n]) || n in e);
          };
          return e.functionFamily = "field-filter", e;
        }
        //
        function dstNotHasAssigningRecursive() {
          let e = function dstNotHasAssigningRecursive(e, r, n) {
            n in e || t.entityAssignFieldFromContainer(e, r, n, t.entityAssignFieldFromContainer);
          };
          return e.functionFamily = "field-mapper", e;
        }
        // --
        // dstNotOwn
        // --
        function dstNotOwn() {
          let e = function dstNotOwn(e, t, r) {
            return !s.call(e, r);
          };
          return e.functionFamily = "field-filter", e;
        }
        //
        function dstNotOwnSrcOwn() {
          let e = function dstNotOwnSrcOwn(e, t, r) {
            return !!s.call(t, r) && !s.call(e, r);
          };
          return e.functionFamily = "field-filter", e;
        }
        //
        function dstNotOwnSrcOwnAssigning() {
          let e = function dstNotOwnSrcOwnAssigning(e, r, n) {
            s.call(r, n) && (s.call(e, n) || t.entityAssignFieldFromContainer(e, r, n));
          };
          return e.functionFamily = "field-mapper", e;
        }
        //
        function dstNotOwnOrUndefinedAssigning() {
          let e = function dstNotOwnOrUndefinedAssigning(e, r, n) {
            s.call(e, n) && void 0 !== e[n] || t.entityAssignFieldFromContainer(e, r, n);
          };
          return e.functionFamily = "field-mapper", e;
        }
        // //
        //
        // function dstNotOwnAssigning()
        // {
        //
        //   let routine = function dstNotOwnAssigning( dstContainer, srcContainer, key )
        //   {
        //
        //     if( _ObjectHasOwnProperty.call( dstContainer, key ) )
        //     {
        //
        //       if( key in dstContainer )
        //       return;
        //
        //     }
        //
        //     _.entityAssignFieldFromContainer( dstContainer, srcContainer, key );
        //   }
        //
        //   routine.functionFamily = 'field-mapper';
        //   return routine;
        // }
        //
        function dstNotOwnAssigning() {
          let e = function dstNotOwnAssigning(e, r, n) {
            if (s.call(e, n)) return;
            let l = r[n];
            t.mapIs(l) || t.arrayIs(l) ? t.entityAssignFieldFromContainer(e, r, n) : e[n] = r[n];
          };
          return e.functionFamily = "field-mapper", e;
        }
        //
        function dstNotOwnAppending() {
          let e = function dstNotOwnAppending(e, r, n) {
            debugger;
            if (void 0 !== e[n]) {
              debugger;
              t.arrayIs(e[n]) && t.arrayIs(r[n]) && t.arrayAppendArray(e, r, n);
            }
            s.call(e, n) || (e[n] = r[n]);
          };
          return e.functionFamily = "field-mapper", e;
        }
        // --
        // dstHas
        // --
        function dstHasMaybeUndefined() {
          let e = function dstHasMaybeUndefined(e, t, r) {
            return r in e;
          };
          return e.functionFamily = "field-filter", e;
        }
        //
        function dstHasButUndefined() {
          let e = function dstHasButUndefined(e, t, r) {
            return void 0 !== e[r];
          };
          return e.functionFamily = "field-filter", e;
        }
        //
        function dstHasSrcOwn() {
          let e = function dstHasSrcOwn(e, t, r) {
            return r in e && !!s.call(t, r);
          };
          return e.functionFamily = "field-filter", e;
        }
        //
        function dstHasSrcNotOwn() {
          let e = function dstHasSrcNotOwn(e, t, r) {
            return r in e && !s.call(t, r);
          };
          return e.functionFamily = "field-filter", e;
        }
        // --
        // srcOwn
        // --
        function srcOwn() {
          let e = function srcOwn(e, t, r) {
            return !!s.call(t, r);
            /*dstContainer[ key ] = srcContainer[ key ];*/          };
          return e.functionFamily = "field-filter", e;
        }
        //
        function srcOwnRoutines() {
          let e = function srcOwnRoutines(e, r, n) {
            return !!s.call(r, n) && !!t.routineIs(r[n]);
          };
          return e.functionFamily = "field-filter", e;
        }
        //
        function srcOwnAssigning() {
          let e = function assigning(e, r, n) {
            s.call(r, n) && t.entityAssignFieldFromContainer(e, r, n);
          };
          return e.functionFamily = "field-mapper", e;
        }
        //
        function srcOwnPrimitive() {
          let e = function srcOwnPrimitive(e, r, n) {
            return !!s.call(r, n) && !!t.primitiveIs(r[n]);
          };
          return e.functionFamily = "field-filter", e;
        }
        //
        function srcOwnNotPrimitiveAssigning() {
          let e = function srcOwnNotPrimitiveAssigning(e, r, n) {
            s.call(r, n) && (t.primitiveIs(r[n]) || t.entityAssignFieldFromContainer(e, r, n));
          };
          return e.functionFamily = "field-mapper", e;
        }
        //
        function srcOwnNotPrimitiveAssigningRecursive() {
          let e = function srcOwnNotPrimitiveAssigningRecursive(e, r, n) {
            s.call(r, n) && (t.primitiveIs(r[n]) || t.entityAssignFieldFromContainer(e, r, n, t.entityAssignFieldFromContainer));
          };
          return e.functionFamily = "field-mapper", e;
        }
        //
        function srcOwnAssigningRecursive() {
          let e = function srcOwnAssigningRecursive(e, r, n) {
            s.call(r, n) && t.entityAssignFieldFromContainer(e, r, n, t.entityAssignFieldFromContainer);
          };
          return e.functionFamily = "field-mapper", e;
        }
        //
        function mapperFromFilter(e) {
          if (t.assert(1 === arguments.length, "Expects single argument"), t.assert(t.routineIs(e), "Expects routine but got", t.strType(e)), 
          t.assert(t.strIs(e.functionFamily)), "field-filter" === e.functionFamily) {
            function r(r, n, s) {
              let l = e(r, n, s);
              t.assert(t.boolIs(l)), !1 !== l && (r[s] = n[s]);
            }
            return r.functionFamily = "field-mapper", r;
          }
          if ("field-mapper" === e.functionFamily) return e;
          t.assert(0, "Expects routine.functionFamily");
        }
        //
        //
        // function mapperFromFilterRecursive( routine )
        // {
        //
        //   _.assert( arguments.length === 1, 'Expects single argument' );
        //   _.assert( _.routineIs( routine ) );
        //   _.assert( _.strIs( routine.functionFamily ) );
        //
        //   debugger;
        //
        //   if( routine.functionFamily === 'field-filter' )
        //   {
        //     function r( dstContainer, srcContainer, key )
        //     {
        //       debugger;
        //       let result = routine( dstContainer, srcContainer, key );
        //       _.assert( _.boolIs( result ) );
        //       if( result === false )
        //       return;
        //       dstContainer[ key ] = srcContainer[ key ];
        //     }
        //     r.functionFamily = 'field-mapper';
        //     return r;
        //   }
        //   else if( routine.functionFamily === 'field-mapper' )
        //   {
        //     return routine;
        //   }
        //   else throw _.err( 'Expects routine.functionFamily' );
        //
        // }
        // --
        // setup
        // --
                let e = _global_.wTools.field = _global_.wTools.field || Object.create(null), t = (_global_, 
        _global_.wTools), s = (Array.prototype.slice, Function.prototype.bind, Object.hasOwnProperty);
        bypass.functionFamily = "field-filter", assigning.functionFamily = "field-mapper", 
        primitive.functionFamily = "field-filter", hiding.functionFamily = "field-mapper", 
        appendingAnything.functionFamily = "field-mapper", appendingArrays.functionFamily = "field-mapper", 
        appendingOnce.functionFamily = "field-mapper", removing.functionFamily = "field-mapper", 
        notPrimitiveAssigning.functionFamily = "field-mapper", assigningRecursive.functionFamily = "field-mapper", 
        drop.functionFamily = "field-filter", srcDefined.functionFamily = "field-filter", 
        srcNull.functionFamily = "field-filter", dstAndSrcOwn.functionFamily = "field-filter", 
        dstAndSrcOwn.functionFamily = "field-filter", dstUndefinedSrcNotUndefined.functionFamily = "field-filter", 
        dstNotHas.functionFamily = "field-filter", dstNotHasOrHasNull.functionFamily = "field-filter", 
        dstNotHasOrHasNil.functionFamily = "field-filter", dstNotHasAssigning.functionFamily = "field-mapper", 
        dstNotHasAppending.functionFamily = "field-mapper", dstNotHasSrcPrimitive.functionFamily = "field-filter", 
        dstNotHasSrcOwn.functionFamily = "field-filter", dstNotHasSrcOwnAssigning.functionFamily = "field-mapper", 
        dstNotHasSrcOwnRoutines.functionFamily = "field-filter", dstNotHasAssigningRecursive.functionFamily = "field-mapper", 
        dstNotOwn.functionFamily = "field-filter", dstNotOwnSrcOwn.functionFamily = "field-filter", 
        dstNotOwnSrcOwnAssigning.functionFamily = "field-mapper", dstNotOwnOrUndefinedAssigning.functionFamily = "field-mapper", 
        dstNotOwnAssigning.functionFamily = "field-mapper", dstNotOwnAppending.functionFamily = "field-mapper", 
        dstHasMaybeUndefined.functionFamily = "field-filter", dstHasButUndefined.functionFamily = "field-filter", 
        dstHasSrcOwn.functionFamily = "field-filter", dstHasSrcNotOwn.functionFamily = "field-filter", 
        srcOwn.functionFamily = "field-filter", srcOwnRoutines.functionFamily = "field-filter", 
        srcOwnAssigning.functionFamily = "field-mapper", srcOwnPrimitive.functionFamily = "field-filter", 
        srcOwnNotPrimitiveAssigning.functionFamily = "field-mapper", srcOwnNotPrimitiveAssigningRecursive.functionFamily = "field-mapper", 
        srcOwnAssigningRecursive.functionFamily = "field-mapper";
        // --
        // make
        // --
        let l = {
          //
          bypass: bypass,
          assigning: assigning,
          primitive: primitive,
          hiding: hiding,
          appendingAnything: appendingAnything,
          appendingArrays: appendingArrays,
          appendingOnce: appendingOnce,
          removing: removing,
          notPrimitiveAssigning: notPrimitiveAssigning,
          assigningRecursive: assigningRecursive,
          drop: drop,
          // src
          srcDefined: srcDefined,
          srcNull: srcNull,
          // dst
          dstNotConstant: 
          // --
          // dst
          // --
          function dstNotConstant() {
            let e = function dstNotConstant(e, t, r) {
              let n = Object.getOwnPropertyDescriptor(e, r);
              return !n || !!n.writable;
            };
            return e.functionFamily = "field-filter", e;
          },
          dstAndSrcOwn: dstAndSrcOwn,
          dstUndefinedSrcNotUndefined: dstUndefinedSrcNotUndefined,
          // dstNotHas
          dstNotHas: dstNotHas,
          dstNotHasOrHasNull: dstNotHasOrHasNull,
          dstNotHasOrHasNil: dstNotHasOrHasNil,
          dstNotHasAssigning: dstNotHasAssigning,
          dstNotHasAppending: dstNotHasAppending,
          dstNotHasSrcPrimitive: dstNotHasSrcPrimitive,
          dstNotHasSrcOwn: dstNotHasSrcOwn,
          dstNotHasSrcOwnAssigning: dstNotHasSrcOwnAssigning,
          dstNotHasSrcOwnRoutines: dstNotHasSrcOwnRoutines,
          dstNotHasAssigningRecursive: dstNotHasAssigningRecursive,
          // dstNotOwn
          dstNotOwn: dstNotOwn,
          dstNotOwnSrcOwn: dstNotOwnSrcOwn,
          dstNotOwnSrcOwnAssigning: dstNotOwnSrcOwnAssigning,
          dstNotOwnOrUndefinedAssigning: dstNotOwnOrUndefinedAssigning,
          dstNotOwnAssigning: dstNotOwnAssigning,
          dstNotOwnAppending: dstNotOwnAppending,
          dstNotOwnFromDefinition: 
          //
          function dstNotOwnFromDefinition() {
            let e = function dstNotOwnFromDefinition(e, r, n) {
              if (s.call(e, n)) return;
              if (s.call(e, Symbol.for(n))) return;
              let l = r[n];
              t.definitionIs(l) ? e[n] = l.valueGet() : e[n] = l;
            };
            return e.functionFamily = "field-mapper", e;
          }
          //
          ,
          dstNotOwnFromDefinitionStrictlyPrimitive: function dstNotOwnFromDefinitionStrictlyPrimitive() {
            let e = function dstNotOwnFromDefinitionStrictlyPrimitive(e, r, n) {
              if (s.call(e, n)) return;
              if (s.call(e, Symbol.for(n))) return;
              let l = r[n];
              t.definitionIs(l) ? e[n] = l.valueGet() : (t.assert(!t.consequenceIs(l) && (t.primitiveIs(l) || t.routineIs(l)), () => t.toStrShort(e) + " has non-primitive element " + t.strQuote(n) + " use _.define.own instead"), 
              e[n] = l);
            };
            return e.functionFamily = "field-mapper", e;
          },
          // dstHas
          dstHasMaybeUndefined: dstHasMaybeUndefined,
          dstHasButUndefined: dstHasButUndefined,
          dstHasSrcOwn: dstHasSrcOwn,
          dstHasSrcNotOwn: dstHasSrcNotOwn,
          // srcOwn
          srcOwn: srcOwn,
          srcOwnRoutines: srcOwnRoutines,
          srcOwnAssigning: srcOwnAssigning,
          srcOwnPrimitive: srcOwnPrimitive,
          srcOwnNotPrimitiveAssigning: srcOwnNotPrimitiveAssigning,
          srcOwnNotPrimitiveAssigningRecursive: srcOwnNotPrimitiveAssigningRecursive,
          srcOwnAssigningRecursive: srcOwnAssigningRecursive
        }, a = {
          make: l,
          mapper: Object.create(null),
          filter: Object.create(null),
          and: 
          // --
          //
          // --
          function and() {
            let e = [], r = [];
            for (let n = 0; n < arguments.length; n++) {
              let s = arguments[n];
              if (t.assert(t.routineIs(s)), t.assert(t.strIs(s.functionFamily)), "field-filter" === s.functionFamily) e.push(s); else {
                if ("field-mapper" !== s.functionFamily) throw t.err("Expects routine.functionFamily");
                r.push(s);
              }
            }
            if (r.length > 1) throw t.err("can combineMethodUniform only one mapper with any number of filters");
            let n = function and(n, s, l) {
              for (let a = 0; a < e.length; a++) {
                let i = (0, e[a])(n, s, l);
                if (t.assert(t.boolIs(i)), !1 === i) return !!r.length && void 0;
              }
              for (let e = 0; e < r.length; e++) {
                let a = (0, r[e])(n, s, l);
                return void t.assert(void 0 === a);
              }
              return !r.length || void 0;
            };
            return n.functionFamily = r.length ? "field-mapper" : "field-filter", n;
          },
          mapperFromFilter: mapperFromFilter
        };
        // --
        // extend
        // --
                !function setup() {
          for (let e in l) {
            let r = l[e];
            r.length || ("field-mapper" === (r = r()).functionFamily ? a.mapper[e] = r : "field-filter" === r.functionFamily ? (a.filter[e] = r, 
            a.mapper[e] = mapperFromFilter(r)) : t.assert(0, "unexpected"));
          }
        }(), Object.assign(e, a), 
        // --
        // export
        // --
        void 0 !== n && null !== n && (n.exports = e);
      }();
    });
    n.include, n.include;
  }(), // == end of file iField_s
  function cErr_s() {
    let t = _starter_._pathResolve(e, "dwtools/abase/l1/cErr.s"), r = _starter_._pathResolve(e, "dwtools/abase/l1/"), n = _starter_._fileCreate(t, r, // == begin of file cErr_s
    function cErr_s_naked() {
      !function _cErr_s_() {
        "use strict";
        //
        // function diagnosticVariate( o )
        // {
        //   _.routineOptions( diagnosticVariate,o );
        //
        //   if( _.arrayIs( o.routine ) )
        //   {
        //     _.assert( _.routineIs( o.routine[ 1 ] ) );
        //     if( !o.variates && o.routine[ 1 ].variates )
        //     o.variates = o.routine[ 1 ].variates;
        //     o.routine = _.routineJoin.apply( _,o.routine );
        //   }
        //
        //   _.assert( _.routineIs( o.routine ) );
        //   _.assert( _.objectIs( o.variates ) );
        //
        //   let vals = _.mapExtend( null,o.variates );
        //   vals = _.proxyNoUndefined( vals );
        //
        //   if( o.test === null )
        //   o.test = function vtest( got,o )
        //   {
        //     return _.entityEquivalent( got,o.expected,{ /*eps*/accuracy : o./*eps*/accuracy } );
        //   }
        //
        //   let found = 0;
        //   let nsamples = _.eachSample
        //   ({
        //
        //     onEach : function( sample,i )
        //     {
        //       let got = o.routine( sample );
        //       let res = o.test( got,o );
        //       if( res )
        //       found += 1;
        //       if( res || !o.printingValidOnly )
        //       {
        //         logger.log( 'routine',o.routine.name,'gave',got,'expected',o.expected,'#',i );
        //         if( res )
        //         {
        //           logger.log( 'sample :',sample );
        //           logger.log( got );
        //         }
        //       }
        //     },
        //
        //     sets : o.variates,
        //     sample : vals,
        //     result : null,
        //
        //   });
        //
        //   logger.log( 'Found',found,'/',nsamples );
        //
        // }
        //
        // diagnosticVariate.defaults =
        // {
        //   routine : null,
        //   test : null,
        //
        //   expected : null,
        //   variates : null,
        //   accuracy : 1e-3,
        //   printingValidOnly : 1,
        // }
        // --
        // diagnostics
        // --
        // function _diagnosticStripPath( src )
        // {
        //   _.assert( arguments.length === 1, 'Expects single argument' );
        //
        //   if( _.strIs( src ) )
        //   {
        //     src = src.replace( /^\s+/,'' );
        //     // src = src.replace( /^at/,'' );
        //     // src = src.replace( /^\s+/,'' );
        //   }
        //
        //   return src;
        // }
        //
        // function diagnosticScript( path )
        // {
        //
        //   if( typeof document !== 'undefined' && document.scripts )
        //   {
        //     let scripts = document.scripts;
        //     for( let s = 0 ; s < scripts.length ; s++ )
        //     if( scripts[ s ].src === path )
        //     return scripts[ s ];
        //   }
        //   else
        //   {
        //     debugger;
        //   }
        //
        // }
        //
        function diagnosticLocation(e) {
          /* end */
          function end() {
            let t = e.location.path;
            /* full */
            // if( path )
                        /* name */
            if (e.location.full = t || "", void 0 !== e.location.line && (e.location.full += ":" + e.location.line), 
            /* name long */
            e.location.full && (e.location.fullWithRoutine = e.location.routine + " @ " + e.location.full), 
            t) {
              let r = t, n = r.lastIndexOf("/");
              -1 !== n && (r = r.substr(n + 1)), e.location.name = r;
            }
            /* name long */            if (t) {
              let t = e.location.name;
              void 0 !== e.location.line && (t += ":" + e.location.line, void 0 !== e.location.col && (t += ":" + e.location.col)), 
              e.location.nameLong = t;
            }
            return e.location;
          }
          /* routine from stack */          
          /* path from stack */
          function fromStack(r) {
            let n;
            if (r) {
              if (t.strIs(r) && (r = r.split("\n")), n = r[e.level], !t.strIs(n)) return end();
              n = (n = (n = (n = (n = n.replace(/^\s+/, "")).replace(/^\w+@/, "")).replace(/^at/, "")).replace(/^\s+/, "")).replace(/\s+$/, "");
              var s = /^.*\((.*)\)$/.exec(n);
              // if( _.strEnds( path,')' ) )
              // path = _.strIsolateInsideOrAll( path,'(',')' )[ 2 ];
              return s && (n = s[1]), n;
            }
          }
          /* line / col number from path */          function lineColFromPath(t) {
            let r, n, s = /(.+?):(\d+)(?::(\d+))?[^:/]*$/.exec(t);
            return s && (t = s[1], r = s[2], n = s[3]), 
            // let postfix = /:(\d+)$/;
            // colNumber = postfix.exec( o.location.path );
            // if( colNumber )
            // {
            //   o.location.path = _.strRemoveEnd( o.location.path,colNumber[ 0 ] );
            //   colNumber = colNumber[ 1 ];
            //   lineNumber = postfix.exec( o.location.path );
            //   if( lineNumber )
            //   {
            //     o.location.path = _.strRemoveEnd( o.location.path,lineNumber[ 0 ] );
            //     lineNumber = lineNumber[ 1 ];
            //   }
            //   else
            //   {
            //     lineNumber = colNumber;
            //     colNumber = undefined;
            //   }
            // }
            r = parseInt(r), n = parseInt(n), isNaN(e.location.line) && !isNaN(r) && (e.location.line = r), 
            isNaN(e.location.col) && !isNaN(n) && (e.location.col = n), t;
          }
          t.numberIs(e) ? e = {
            level: e
          } : t.strIs(e) ? e = {
            stack: e,
            level: 0
          } : t.errIs(e) ? e = {
            error: e,
            level: 0
          } : void 0 === e && (e = {
            stack: t.diagnosticStack([ 1, Infinity ])
          })
          /* */;
          for (let t in e) if (void 0 === diagnosticLocation.defaults[t]) throw Error("Unknown option " + t);
          for (let t in diagnosticLocation.defaults) void 0 === e[t] && (e[t] = diagnosticLocation.defaults[t]);
          if (0 !== arguments.length && 1 !== arguments.length) throw Error("Expects single argument or none");
          if (!t.objectIs(e)) throw Error("Expects options map");
          // _.routineOptions( diagnosticLocation,o );
          // _.assert( arguments.length === 0 || arguments.length === 1 );
          // _.assert( _.objectIs( o ),'diagnosticLocation expects integer {-level-} or string ( stack ) or object ( options )' );
          /* */          
          /* */
          if (e.location || (e.location = Object.create(null)), e.error) {
            let r = e.error.location || Object.create(null);
            if (e.location.path = t.arrayLeftDefined([ r.path, e.location.path, e.error.filename, e.error.fileName ]).element, 
            e.location.line = t.arrayLeftDefined([ r.line, e.location.line, e.error.line, e.error.linenumber, e.error.lineNumber, e.error.lineNo, e.error.lineno ]).element, 
            e.location.col = t.arrayLeftDefined([ r.col, e.location.col, e.error.col, e.error.colnumber, e.error.colNumber, e.error.colNo, e.error.colno ]).element, 
            e.location.path && t.numberIs(e.location.line)) return end();
          }
          /* */          e.stack || (e.error ? e.stack = t.diagnosticStack(e.error, void 0) : (e.stack = t.diagnosticStack(), 
          e.level += 1)), function routineFromStack(r) {
            let n;
            if (!r) return;
            if (t.strIs(r) && (r = r.split("\n")), n = r[e.level], !t.strIs(n)) return "(-routine anonymous-)";
            // debugger;
                        let s = /^\s*(at\s+)?([\w\.]+)\s*.+/.exec(n);
            s && (n = s[2] || ""), t.strEnds(n, ".") && (n += "?"), e.location.routine = n, 
            e.location.service = 0, 0 === e.location.service && (t.strBegins(n, "__") || -1 !== n.indexOf(".__")) && (e.location.service = 2), 
            0 === e.location.service && (t.strBegins(n, "_") || -1 !== n.indexOf("._")) && (e.location.service = 1);
          }(e.stack);
          let r = !!e.location.path;
          if (r || (e.location.path = fromStack(e.stack)), !t.strIs(e.location.path)) return end();
          if (t.numberIs(e.location.line) || (e.location.path = lineColFromPath(e.location.path)), 
          !t.numberIs(e.location.line) && r) {
            let t = fromStack(e.stack);
            t && lineColFromPath(t);
          }
          return end();
        }
        function diagnosticCode(e) {
          /* */
          function end(e) {
            return s -= 1, e;
          }
          if (t.routineOptions(diagnosticCode, e), t.assert(0 === arguments.length || 1 === arguments.length), 
          !s) {
            s += 1;
            try {
              if (e.location || (e.error ? e.location = t.diagnosticLocation({
                error: e.error,
                level: e.level
              }) : e.location = t.diagnosticLocation({
                stack: e.stack,
                level: e.stack ? e.level : e.level + 1
              })), !t.numberIs(e.location.line)) return end();
              /* */              if (!e.sourceCode) {
                if (!e.location.path) return end();
                let r = t.codeProvider || t.fileProvider;
                if (!r) return end();
                try {
                  // if( _global._starter_ )
                  // debugger;
                  // if( _global._starter_ )
                  // _global._starter_.fileProvider.fileRead( _.weburi.parse( o.location.path ).localWebPath );
                  // o.location.path = codeProvider.path.normalize( o.location.path );
                  r.path.isAbsolute(r.path.normalize(e.location.path)) && (e.sourceCode = r.fileRead({
                    filePath: e.location.path,
                    sync: 1,
                    throwing: 0
                  }));
                } catch (r) {
                  e.sourceCode = "CANT LOAD SOURCE CODE " + t.strQuote(e.location.path);
                }
                if (!e.sourceCode) return end();
              }
              /* */              let r = t.strLinesSelect({
                src: e.sourceCode,
                line: e.location.line,
                numberOfLines: e.numberOfLines,
                selectMode: e.selectMode,
                zero: 1,
                number: 1
              });
              return r && t.strIndentation && (r = e.identation + t.strIndentation(r, e.identation)), 
              e.withPath && (r = e.location.full + "\n" + r), end(r);
            } catch (e) {
              return void console.log(e.toString());
            }
          }
        }
        //
        /*

_.diagnosticWatchFields
({
  target : _global_,
  names : 'Uniforms',
});

_.diagnosticWatchFields
({
  target : state,
  names : 'filterColor',
});

_.diagnosticWatchFields
({
  target : _global_,
  names : 'Config',
});

_.diagnosticWatchFields
({
  target : _global_,
  names : 'logger',
});

_.diagnosticWatchFields
({
  target : self,
  names : 'catalogPath',
});

*/
        function diagnosticWatchFields(e) {
          void 0 !== arguments[1] && (e = {
            target: arguments[0],
            names: arguments[1]
          }), (e = t.routineOptions(diagnosticWatchFields, e)).names ? e.names = e.names : e.names = e.target, 
          t.assert(1 === arguments.length || 2 === arguments.length), t.assert(t.objectLike(e.target)), 
          t.assert(t.objectLike(e.names));
          for (let r in e.names) !function() {
            let n = r, s = (Symbol.for(r), e.target[r]);
            /* */
            if (e.debugging > 1) debugger;
            e.verbosity > 1 && console.log("watching for", n, "in", e.target), Object.defineProperty(e.target, n, {
              enumerable: !0,
              configurable: !0,
              get: 
              /* */
              function read() {
                //let result = o.target[ fieldSymbol ];
                let r = s;
                if (e.verbosity > 1 ? console.log("reading " + n + " " + t.toStr(r)) : console.log("reading " + n), 
                e.debugging > 1) debugger;
                return r;
              }
              /* */ ,
              set: function write(r) {
                if (e.verbosity > 1 ? console.log("writing " + n + " " + t.toStr(e.target[n]) + " -> " + t.toStr(r)) : console.log("writing " + n), 
                e.debugging) debugger;
                //o.target[ fieldSymbol ] = src;
                                s = r;
              }
            });
          }();
        }
        //
        /*

_.diagnosticProxyFields
({
  target : _.field,
});

_.diagnosticWatchFields
({
  target : _,
  names : 'field',
});

*/
        function diagnosticProxyFields(e) {
          void 0 !== arguments[1] && (e = {
            target: arguments[0],
            names: arguments[1]
          }), e = t.routineOptions(diagnosticWatchFields, e), 
          // if( o.names )
          // o.names = _.nameFielded( o.names );
          t.assert(1 === arguments.length || 2 === arguments.length), t.assert(t.objectLike(e.target)), 
          t.assert(t.objectLike(e.names) || null === e.names);
          let r = {
            set: function(r, n, s) {
              if (!e.names || n in e.names) {
                if (e.verbosity > 1 ? console.log("writing " + n + " " + t.toStr(e.target[n]) + " -> " + t.toStr(s)) : console.log("writing " + n), 
                e.debug) debugger;
                return r[n] = s, !0;
              }
            }
          }, n = new Proxy(e.target, r);
          if (e.verbosity > 1 && console.log("watching for", e.target), e.debug) debugger;
          return n;
        }
        //
        function diagnosticEachLongType(e) {
          let r = Object.create(null);
          t.routineIs(e) && (e = {
            onEach: e
          }), null === (e = t.routineOptions(diagnosticEachLongType, e)).onEach && (e.onEach = function onEach(e, t) {
            return e;
          }), t.assert(0 === arguments.length || 1 === arguments.length), t.assert(t.routineIs(e.onEach));
          // debugger;
          for (let n in t.LongDescriptor) {
            let s = t.LongDescriptor[n];
            r[s.name] = e.onEach(s.make, s);
          }
          // debugger;
                    return r;
        }
        //
        function diagnosticEachElementComparator(e) {
          /* */
          function evaluator(e) {
            return t.assert(1 === e.length), e[0];
          }
          /* */          
          /* */
          function make(r) {
            t.assert(t.longIs(r));
            let n = [];
            for (let e = 0; e < r.length; e++) n[e] = [ r[e] ];
            return e.onMake(n);
          }
          let r = [];
          return void 0 !== arguments[1] ? e = {
            onMake: arguments[0],
            onEach: arguments[1]
          } : t.routineIs(arguments[0]) && (e = {
            onEach: arguments[1]
          }), null === (e = t.routineOptions(diagnosticEachElementComparator, e)).onEach && (e.onEach = function onEach(e, t, r) {
            return t;
          }), null === e.onMake && (e.onMake = function onMake(e) {
            return e;
          }), t.assert(1 === arguments.length || 2 === arguments.length), t.assert(t.routineIs(e.onEach)), 
          t.assert(t.routineIs(e.onMake)), r.push(e.onEach(e.onMake, void 0, "no evaluator")), 
          r.push(e.onEach(make, evaluator, "evaluator")), r.push(e.onEach(make, [ evaluator, evaluator ], "tandem of evaluators")), 
          r.push(e.onEach(make, function equalizer(e, r) {
            return t.assert(1 === e.length), t.assert(1 === r.length), e[0] === r[0];
          }, "equalizer")), r;
        }
        //
        function diagnosticsStructureGenerate(e) {
          t.assert(1 === arguments.length), t.routineOptions(diagnosticsStructureGenerate, e), 
          t.assert(t.numberIs(e.breadth)), t.assert(t.numberIs(e.depth)), t.assert(null === e._pre || t.routineIs(e._pre));
          /* qqq: pre */
          /**/
          let r = 0;
          // console.log( 'entitySize:', _.strMetricFormatBytes( o.size ) );
          return e.structure = 
          /*  */
          function structureMake() {
            /*  */
            function mapForSize(r, n) {
              let s = {};
              for (var l = 0; l < e.mapSize; l++) {
                let e = t.numberRandomInt(n);
                s[l] = r[e];
              }
              return s;
            }
            let n = Object.create(null), s = t.strDup("a", e.stringSize || e.fieldSize);
            (e.boolean || e.primitive) && (n.boolean = !0), (e.number || e.primitive) && (n.number = 0), 
            (e.signedNumber || e.primitive > 2) && (n["-0"] = -0, n["+0"] = 0), (e.string || e.primitive) && (n.string = s), 
            (e.null || e.primitive > 1) && (n.null = null), (e.infinity || e.primitive > 1) && (n["+infinity"] = Infinity, 
            n["-infinity"] = -Infinity), (e.nan || e.primitive > 1) && (n.nan = NaN), (e.undefined || e.primitive > 2) && (n[void 0] = void 0), 
            (e.date || e.primitive > 2) && (n.date = new Date()), (e.bigInt || e.primitive > 2) && "undefined" != typeof BigInt && (n.bigInt = BigInt(1)), 
            e.regexp && (n.regexp1 = /ab|cd/, n.regexp2 = /a[bc]d/, n.regexp3 = /ab{1,}bc/, 
            n.regexp4 = /\.js$/, n.regexp5 = /.regexp/), (e.regexpComplex || e.regexp > 1) && (n.complexRegexp0 = /^(?:(?!ab|cd).)+$/gm, 
            n.complexRegexp1 = /\/\*[\s\S]*?\*\/|\/\/.*/g, n.complexRegexp2 = /^[1-9]+[0-9]*$/gm, 
            n.complexRegexp3 = /aBc/i, n.complexRegexp4 = /^\d+/gm, n.complexRegexp5 = /^a.*c$/g, 
            n.complexRegexp6 = /[a-z]/m, n.complexRegexp7 = /^[A-Za-z0-9]$/);
            let l = t.arrayFillTimes([], e.bufferSize || e.fieldSize, 0);
            if ((e.bufferNode || e.buffer && 2 !== e.buffer) && "undefined" != typeof Buffer && (n.bufferNode = Buffer.from(l)), 
            (e.bufferRaw || e.buffer) && (n.bufferRaw = new ArrayBuffer(l)), (e.bufferBytes || e.buffer && 2 !== e.buffer) && (n.bufferBytes = new Uint8Array(l)), 
            e.map || e.structure) {
              let t = n.map = {
                0: s,
                1: 1,
                2: !0
              };
              e.mapSize && (n.map = mapForSize(t, [ 0, 3 ]));
            }
            if (e.mapComplex || e.structure > 1) {
              let t = n.mapComplex = {
                0: "1",
                1: {
                  b: 2
                },
                2: [ 1, 2, 3 ]
              };
              e.mapSize && (n.mapComplex = mapForSize(t, [ 0, 3 ]));
            }
            if ((e.array || e.structure) && (n.array = t.arrayFillTimes([], e.arraySize || e.fieldSize, 0)), 
            e.arrayComplex || e.structure > 1) {
              let r = {
                a: "1",
                dir: {
                  b: 2
                },
                c: [ 1, 2, 3 ]
              };
              n.arrayComplex = t.arrayFillTimes([], e.arraySize || e.fieldSize, r);
            }
            (e.recursion || e.structure > 2) && (n.recursion = n);
            /**/
            for (var a = t.mapExtend(null, n), i = 0; i < e.breadth; i++) n["breadth" + i] = t.mapExtend(null, a);
            /*  */            return r < e.depth - 1 && (n["depth" + (r += 1)] = structureMake()), 
            n;
          }(), e.size = t.entitySize(e.structure), e;
        }
        Array.prototype.slice, Function.prototype.bind, Object.prototype.toString, Object.hasOwnProperty, 
        Object.propertyIsEnumerable, Math.ceil, Math.floor;
        let e = _global_, t = e.wTools, r = (t._err, t);
        diagnosticLocation.defaults = {
          level: 0,
          stack: null,
          error: null,
          location: null
        };
        //
                let s = 0;
        diagnosticCode.defaults = {
          level: 0,
          numberOfLines: 3,
          withPath: 1,
          selectMode: "center",
          identation: "    ",
          stack: null,
          error: null,
          location: null,
          sourceCode: null
        }, diagnosticWatchFields.defaults = {
          target: null,
          names: null,
          verbosity: 2,
          debugging: 1
        }, diagnosticProxyFields.defaults = {}, diagnosticProxyFields.defaults.__proto__, 
        diagnosticWatchFields.defaults, diagnosticEachLongType.defaults = {
          onEach: null
        }, diagnosticEachElementComparator.defaults = {
          onMake: null,
          onEach: null
        }, diagnosticsStructureGenerate.defaults = {
          _pre: null,
          depth: null,
          breadth: null,
          /**/
          boolean: null,
          number: null,
          signedNumber: null,
          string: null,
          null: null,
          infinity: null,
          nan: null,
          undefined: null,
          date: null,
          bigInt: null,
          regexp: null,
          regexpComplex: null,
          bufferNode: null,
          bufferRaw: null,
          bufferBytes: null,
          array: null,
          arrayComplex: null,
          map: null,
          mapComplex: null,
          /*  */
          primitive: null,
          buffer: null,
          structure: null,
          /* */
          stringSize: null,
          bufferSize: null,
          regexpSize: null,
          arraySize: null,
          mapSize: null,
          fieldSize: 50
        };
        //
        /**
 * Return stack trace as string.
 * @example
  let stack;
  function function1()
  {
    function2();
  }

  function function2()
  {
    function3();
  }

  function function3()
  {
    stack = wTools.diagnosticStack();
  }

  function1();
  console.log( stack );
 //"    at function3 (<anonymous>:10:17)
 // at function2 (<anonymous>:6:2)
 // at function1 (<anonymous>:2:2)
 // at <anonymous>:1:1"
 *
 * @returns {String} Return stack trace from call point.
 * @function stack
 * @memberof wTools
 */
        // function diagnosticStack( stack, first, last )
                // --
        // errrors
        // --
        let l = {
          ErrorAbort: t.error_functor("ErrorAbort")
        }, a = {
          // _diagnosticStripPath,
          diagnosticLocation: diagnosticLocation,
          diagnosticCode: diagnosticCode,
          diagnosticStack: function diagnosticStack(e, r) {
            // if( last-first === 1 )
            // debugger;
            // if( _.numberIs( arguments[ 0 ] ) || arguments[ 0 ] === undefined )
            // {
            //
            //   first = arguments[ 0 ] ? arguments[ 0 ] + 1 : 1;
            //   last = arguments[ 1 ] >= 0 ? arguments[ 1 ] + 1 : arguments[ 1 ];
            //
            //   return diagnosticStack( new Error(), first, last );
            // }
            if (1 === arguments.length && (t.errIs(e) || (r = arguments[0], e = void 0)), void 0 === e && (e = new Error(), 
            void 0 === r && (r = [ 1, Infinity ])), void 0 === r && (r = [ 0, Infinity ]), 0 !== arguments.length && 1 !== arguments.length && 2 !== arguments.length) {
              debugger;
              throw Error("diagnosticStack : expects one or two or none arguments");
            }
            // if( !_.numberIs( first ) && first !== undefined )
            // {
            //   debugger;
            //   throw Error( 'diagnosticStack : expects number {-first-}, got ' + _.strType( first ) );
            // }
            //
            // if( !_.numberIs( last ) && last !== undefined )
            // {
            //   debugger;
            //   throw Error( 'diagnosticStack : expects number {-last-}, got ' + _.strType( last ) );
            // }
                        if (!t.rangeIs(r)) {
              debugger;
              throw Error("diagnosticStack : expects range but, got " + t.strType(r));
            }
            let n = r[0], s = r[1];
            if (!t.numberIs(n)) {
              debugger;
              throw Error("diagnosticStack : expects number range[ 0 ], but got " + t.strType(n));
            }
            if (!t.numberIs(s)) {
              debugger;
              throw Error("diagnosticStack : expects number range[ 0 ], but got " + t.strType(s));
            }
            let l = 0;
            if (t.errIs(e) && (e = e.stack, l = 1), !e) return "";
            if (t.arrayIs(e) || t.strIs(e)) {
              if (!t.arrayIs(e) && !t.strIs(e)) {
                debugger;
                throw Error("diagnosticStack expects array or string");
              }
              // debugger;
                            /* xxx */
              if (t.arrayIs(e) || (e = e.split("\n"))
              /* remove redundant lines */ , l || console.debug("REMINDER : problem here if !errIs"), 
              !l) debugger;
              if (l) for (;e.length; ) {
                let t = 0;
                if (t |= -1 === e[0].indexOf("  at ") && -1 === e[0].indexOf("@"), t |= -1 !== e[0].indexOf("(vm.js:"), 
                t |= -1 !== e[0].indexOf("(module.js:"), !(t |= -1 !== e[0].indexOf("(internal/module.js:"))) break;
                e.splice(0, 1);
              }
              // if( stack[ 0 ].indexOf( '@' ) === -1 )
              // stack[ 0 ] = _.strIsolateLeftOrNone( stack[ 0 ],'@' )[ 1 ];
              // if( !stack[ 0 ] )
              // return '... stack is empty ...';
              // debugger;
                            if (e[0] && -1 === e[0].indexOf("at ") && -1 === e[0].indexOf("@")) {
                debugger;
                console.error("diagnosticStack : cant parse stack\n" + e);
              }
              /* */              return n = void 0 === n ? 0 : n, s = void 0 === s ? e.length : s, 
              t.numberIs(n) && n < 0 && (n = e.length + n), t.numberIs(s) && s < 0 && (s = e.length + s + 1), 
              /* */
              // if( last-first === 1 )
              // {
              //   debugger;
              //   // stack = stack[ first ];
              //   //
              //   // if( _.strIs( stack ) )
              //   // {
              //   //   stack = _._diagnosticStripPath( stack );
              //   // }
              //   //
              //   // return stack;
              // }
              0 === n && s === e.length || (e = e.slice(n || 0, s))
              /* */ , String(e.join("\n"));
            }
          }
          //
          ,
          diagnosticStackCondense: function diagnosticStackCondense(e) {
            if (1 !== arguments.length) throw Error("Expects single arguments");
            if (!t.strIs(e)) throw Error("Expects string");
            e = e.split("\n");
            for (let t = 1; t < e.length; t++) if (/(\w)_entry(\W|$)/.test(e[t])) {
              e.splice(t + 1, e.length);
              break;
            }
            for (let t = e.length - 1; t >= 1; t--) /(\W|^)__\w+/.test(e[t]) && e.splice(t, 1);
            return e.join("\n");
          }
          //
          ,
          diagnosticBeep: function diagnosticBeep() {
            console.log("");
          }
          //
          ,
          diagnosticApplicationEntryPointData: function diagnosticApplicationEntryPointData() {
            let r = Object.create(null);
            return void 0 !== e.process && (e.process.argv && (r.execPath = e.process.argv.join(" ")), 
            t.routineIs(e.process.cwd) && (r.currentPath = e.process.cwd())), r;
          }
          //
          ,
          diagnosticApplicationEntryPointInfo: function diagnosticApplicationEntryPointInfo() {
            /* */
            function join(e, t) {
              return r && (r += "\n"), r += e + " : " + t;
            }
            let e = t.diagnosticApplicationEntryPointData(), r = "";
            return e.currentPath && (r = join("Current path", e.currentPath)), e.execPath && (r = join("Exec path", e.execPath)), 
            r;
          },
          diagnosticWatchFields: diagnosticWatchFields,
          /* experimental */
          diagnosticProxyFields: diagnosticProxyFields,
          /* experimental */
          diagnosticEachLongType: diagnosticEachLongType,
          diagnosticEachElementComparator: diagnosticEachElementComparator,
          diagnosticsStructureGenerate: diagnosticsStructureGenerate
        };
        // --
        // declare
        // --
                Object.assign(r, a), Object.assign(r.error, l), 
        // --
        // export
        // --
        void 0 !== n && null !== n && (n.exports = r);
      }();
    });
    n.include, n.include;
  }(), // == end of file cErr_s
  function gBool_s() {
    let t = _starter_._pathResolve(e, "dwtools/abase/l1/gBool.s"), r = _starter_._pathResolve(e, "dwtools/abase/l1/"), n = _starter_._fileCreate(t, r, // == begin of file gBool_s
    function gBool_s_naked() {
      !function _gBool_s_() {
        "use strict";
        _global_;
        let e = _global_.wTools, t = _global_.wTools, r = (Array.prototype.slice, Function.prototype.bind, 
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
          function boolFrom(t) {
            return e.strIs(t) ? "0" != (t = t.toLowerCase()) && "false" != t && "null" != t && "undefined" != t && "" != t : Boolean(t);
          }
          // --
          // fields
          // --
                });
        //
        Object.assign(t, r), Object.assign(t, {}), 
        // --
        // export
        // --
        void 0 !== n && null !== n && (n.exports = t);
      }();
    });
    n.include, n.include;
  }(), // == end of file gBool_s
  function gEntity_s() {
    let t = _starter_._pathResolve(e, "dwtools/abase/l1/gEntity.s"), r = _starter_._pathResolve(e, "dwtools/abase/l1/"), n = _starter_._fileCreate(t, r, // == begin of file gEntity_s
    function gEntity_s_naked() {
      !function _gEntity_s_() {
        "use strict";
        _global_;
        let e = _global_.wTools, t = _global_.wTools, r = {
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
              let r = 0;
              for (let n = 0; n < t.length && (r += e.entitySize(t[n]), !isNaN(r)); n++) ;
              return r;
            }
            if (e.mapIs(t)) {
              let r = 0;
              for (let n in t) if (r += e.entitySize(n), r += e.entitySize(t[n]), isNaN(r)) break;
              return r;
            }
            return NaN;
          }
          // --
          // fields
          // --
                };
        //
        Object.assign(t, r), Object.assign(t, {}), 
        // --
        // export
        // --
        void 0 !== n && null !== n && (n.exports = t);
      }();
    });
    n.include, n.include;
  }(), // == end of file gEntity_s
  function gLong_s() {
    let t = _starter_._pathResolve(e, "dwtools/abase/l1/gLong.s"), r = _starter_._pathResolve(e, "dwtools/abase/l1/"), n = _starter_._fileCreate(t, r, // == begin of file gLong_s
    function gLong_s_naked() {
      !function _gLong_s_() {
        "use strict";
        //
        function bufferMove(e, r) {
          if (2 === arguments.length) {
            if (t.assert(t.longIs(e)), t.assert(t.longIs(r)), e.length !== r.length) throw t.err("_.bufferMove :", '"dst" and "src" must have same length');
            if (e.set) return e.set(r), e;
            for (let t = 0; t < r.length; t++) e[t] = r[t];
          } else if (1 === arguments.length) {
            let e = arguments[0];
            t.assertMapHasOnly(e, bufferMove.defaults);
            let r = e.src, n = e.dst;
            if (t.bufferRawIs(n) && (n = new Uint8Array(n), !t.bufferTypedIs(r) || r instanceof Uint8Array || (r = new Uint8Array(r.buffer, r.byteOffset, r.byteLength))), 
            t.assert(t.longIs(n)), t.assert(t.longIs(r)), e.dstOffset = e.dstOffset || 0, n.set) return n.set(r, e.dstOffset), 
            n;
            for (let t = 0, s = e.dstOffset; t < r.length; t++, s++) n[s] = r[t];
          } else t.assert(0, "unexpected");
          return e;
        }
        //
        function bufferFrom(e) {
          let r;
          /* same */
          if (t.assert(1 === arguments.length), t.assert(t.objectIs(e)), t.assert(t.routineIs(e.bufferConstructor), "Expects bufferConstructor"), 
          t.assertMapHasOnly(e, bufferFrom.defaults), e.src.constructor && e.src.constructor === e.bufferConstructor) return e.src;
          /* number */          if (t.numberIs(e.src) && (e.src = [ e.src ]), "ArrayBuffer" === e.bufferConstructor.name) return t.bufferRawFrom(e.src);
          if ("Buffer" === e.bufferConstructor.name) return t.bufferNodeFrom(e.src);
          /* str / buffer.node / buffer.raw */          
          /* buffer.typed */
          if ((t.strIs(e.src) || t.bufferNodeIs(e.src) || t.bufferRawIs(e.src)) && (e.src = t.bufferBytesFrom(e.src)), 
          t.bufferTypedIs(e.src)) return e.src.constructor === e.bufferConstructor ? e.src : r = new e.bufferConstructor(e.src);
          /* verification */          t.assert(t.objectLike(e.src) || t.longIs(e.src), "bufferFrom expects object-like or array-like as o.src");
          /* length */
          let n = e.src.length;
          if (!t.numberIs(n)) {
            let t = 0;
            for (;void 0 !== e.src[t]; ) t += 1;
          }
          /* make */          if (t.arrayIs(e.src)) r = new e.bufferConstructor(e.src); else {
            if (t.longIs(e.src)) throw r = new e.bufferConstructor(e.src), t.err("not tested");
            r = new e.bufferConstructor(n);
            for (let t = 0; t < n; t++) r[t] = e.src[t];
          }
          return r;
        }
        //
        function buffersSerialize(e) {
          let r = 0;
          e = e || Object.create(null), t.assertMapHasNoUndefine(e), t.assertMapHasOnly(e, buffersSerialize.defaults), 
          t.mapComplement(e, buffersSerialize.defaults), t.assert(t.objectIs(e.store));
          let n = e.store, s = (n.attributes = n.attributes || Object.create(null), e.onAttributesGet.call(e.context)), l = [];
          /* eval size */
          for (let n = 0; n < s.length; n++) {
            let a = s[n][0], i = s[n][1], o = e.onBufferGet.call(e.context, i);
            t.assert(t.bufferTypedIs(o) || null === o, "Expects buffer or null, got : " + t.strType(o));
            let u = o ? o.length * o.BYTES_PER_ELEMENT : 0;
            if (e.dropAttribute && e.dropAttribute[a]) continue;
            let c = Object.create(null);
            c.attribute = i, c.name = a, c.buffer = o, c.bufferSize = u, c.sizeOfAtom = o ? o.BYTES_PER_ELEMENT : 0, 
            l.push(c), r += u;
          }
          /* make buffer */          n.buffer || (n.buffer = new ArrayBuffer(r));
          let a = t.bufferBytesGet(n.buffer);
          if (t.assert(n.buffer.byteLength === r), n.buffer.byteLength < r) throw t.err("buffersSerialize :", "buffer does not have enough space");
          /* sort by atom size */          l.sort(function(e, t) {
            return t.sizeOfAtom - e.sizeOfAtom;
          });
          /* store into single buffer */
          let i = 0;
          for (let r = 0; r < l.length; r++) {
            let s = l[r].name, o = l[r].attribute, u = l[r].buffer, c = u ? t.bufferBytesGet(u) : new Uint8Array(), p = l[r].bufferSize;
            if (e.dropAttribute && e.dropAttribute[s]) continue;
            t.bufferMove(a.subarray(i, i + p), c);
            let g = n.attributes[s] = {
              "bufferConstructorName": u ? u.constructor.name : "null",
              "sizeOfAtom": u ? u.BYTES_PER_ELEMENT : 0,
              "offsetInCommonBuffer": i,
              "size": c.length
            };
            o.copyCustom && (g.fields = o.copyCustom({
              dst: Object.create(null),
              src: o,
              copyingComposes: 3,
              copyingAggregates: 3,
              copyingAssociates: 1,
              technique: "data"
            })), i += p;
          }
          /* return */          return n;
        }
        //
        function buffersDeserialize(r) {
          let n = (r = r || Object.create(null)).store, s = n.buffer;
          t.assertMapHasNoUndefine(r), t.assertMapHasOnly(r, buffersDeserialize.defaults), 
          t.mapComplement(r, buffersDeserialize.defaults), t.assert(t.objectIs(r.store)), 
          t.assert(t.bufferRawIs(s) || t.bufferTypedIs(s)), s = t.bufferRawFromTyped(s);
          for (let l in n.attributes) {
            let a = n.attributes[l], i = "null" === a.bufferConstructorName ? null : e[a.bufferConstructorName], o = a.offsetInCommonBuffer, u = a.size, c = a.sizeOfAtom, p = a.fields;
            if (t.assert(t.routineIs(i) || null === i, "unknown attribute' constructor :", a.bufferConstructorName), 
            t.assert(t.numberIs(o), "unknown attribute' offset in common buffer :", o), t.assert(t.numberIs(u), "unknown attribute' size of buffer :", u), 
            t.assert(t.numberIs(c), "unknown attribute' sizeOfAtom of buffer :", c), a.offset + u > s.byteLength) throw t.err("cant deserialize attribute", '"' + l + '"', "it is out of common buffer");
            /* logger.log( 'bufferConstructor( ' + commonBuffer + ', ' + offset + ', ' + size / sizeOfAtom + ' )' ); */            let g = i ? new i(s, o, u / c) : null;
            r.onAttribute.call(r.context, p, g, l);
          }
        }
        // --
        // array maker
        // --
        /**
 * The arrayMakeRandom() routine returns an array which contains random numbers.
 *
 * @param { Object } o - The options for getting random numbers.
 * @param { Number } o.length - The length of an array.
 * @param { Array } [ o.range = [ 0, 1 ] ] - The range of numbers.
 * @param { Boolean } [ o.int = false ] - Floating point numbers or not.
 *
 * @example
 * // returns [ 6, 2, 4, 7, 8 ]
 * let arr = _.arrayMakeRandom
 * ({
 *   length : 5,
 *   range : [ 1, 9 ],
 *   int : true,
 * });
 *
 * @returns { Array } - Returns an array of random numbers.
 * @function arrayMakeRandom
 * @memberof wTools
 */
        function arrayMakeRandom(e) {
          let r = [];
          t.numberIs(e) && (e = {
            length: e
          }), t.assert(1 === arguments.length, "Expects single argument"), t.routineOptions(arrayMakeRandom, e);
          debugger;
          for (let t = 0; t < e.length; t++) r[t] = e.range[0] + Math.random() * (e.range[1] - e.range[0]), 
          e.int && (r[t] = Math.floor(r[t]));
          return r;
        }
        //
        /**
 * The arrayDuplicate() routine returns an array with duplicate values of a certain number of times.
 *
 * @param { objectLike } [ o = {  } ] o - The set of arguments.
 * @param { longIs } o.src - The given initial array.
 * @param { longIs } o.result - To collect all data.
 * @param { Number } [ o.numberOfAtomsPerElement = 1 ] o.numberOfAtomsPerElement - The certain number of times
 * to append the next value from (srcArray or o.src) to the (o.result).
 * If (o.numberOfAtomsPerElement) is greater that length of a (srcArray or o.src) it appends the 'undefined'.
 * @param { Number } [ o.numberOfDuplicatesPerElement = 2 ] o.numberOfDuplicatesPerElement = 2 - The number of duplicates per element.
 *
 * @example
 * // returns [ 'a', 'a', 'b', 'b', 'c', 'c' ]
 * _.arrayDuplicate( [ 'a', 'b', 'c' ] );
 *
 * @example
 * // returns [ 'abc', 'def', 'abc', 'def', 'abc', 'def' ]
 * let options = {
 *   src : [ 'abc', 'def' ],
 *   result : [  ],
 *   numberOfAtomsPerElement : 2,
 *   numberOfDuplicatesPerElement : 3
 * };
 * _.arrayDuplicate( options, {} );
 *
 * @example
 * // returns [ 'abc', 'def', undefined, 'abc', 'def', undefined, 'abc', 'def', undefined ]
 * let options = {
 *   src : [ 'abc', 'def' ],
 *   result : [  ],
 *   numberOfAtomsPerElement : 3,
 *   numberOfDuplicatesPerElement : 3
 * };
 * _.arrayDuplicate( options, { a : 7, b : 13 } );
 *
 * @returns { Array } Returns an array with duplicate values of a certain number of times.
 * @function arrayDuplicate
 * @throws { Error } Will throw an Error if ( o ) is not an objectLike.
 * @memberof wTools
 */
        function arrayDuplicate(e) {
          if (t.assert(1 === arguments.length || 2 === arguments.length), 2 === arguments.length ? e = {
            src: arguments[0],
            numberOfDuplicatesPerElement: arguments[1]
          } : t.objectIs(e) || (e = {
            src: e
          }), t.assert(t.numberIs(e.numberOfDuplicatesPerElement) || void 0 === e.numberOfDuplicatesPerElement), 
          t.routineOptions(arrayDuplicate, e), t.assert(t.longIs(e.src), "arrayDuplicate expects o.src as longIs entity"), 
          t.assert(t.numberIsInt(e.src.length / e.numberOfAtomsPerElement)), 1 === e.numberOfDuplicatesPerElement) return e.result ? (t.assert(t.longIs(e.result) || t.bufferTypedIs(e.result), "Expects o.result as longIs or TypedArray if numberOfDuplicatesPerElement equals 1"), 
          t.bufferTypedIs(e.result) ? e.result = t.longShallowClone(e.result, e.src) : t.longIs(e.result) && e.result.push.apply(e.result, e.src)) : e.result = e.src, 
          e.result;
          let r = e.src.length * e.numberOfDuplicatesPerElement, n = e.src.length / e.numberOfAtomsPerElement;
          e.result && t.assert(e.result.length >= r), e.result = e.result || t.longMake(e.src, r);
          let s = e.result.length;
          for (let t = 0, r = n; t < r; t++) for (let r = 0, n = e.numberOfDuplicatesPerElement; r < n; r++) for (let n = 0, s = e.numberOfAtomsPerElement; n < s; n++) {
            let s = t * e.numberOfAtomsPerElement * e.numberOfDuplicatesPerElement + r * e.numberOfAtomsPerElement + n, l = t * e.numberOfAtomsPerElement + n;
            e.result[s] = e.src[l];
          }
          return t.assert(e.result.length === s), e.result;
        }
        //
        function arrayUnmask(e) {
          t.assert(1 === arguments.length || 2 === arguments.length), 2 === arguments.length && (e = {
            src: arguments[0],
            mask: arguments[1]
          }), t.assertMapHasOnly(e, arrayUnmask.defaults), t.assert(t.longIs(e.src), "arrayUnmask : expects o.src as ArrayLike");
          let r = e.mask.length, n = 0;
          for (let t = 0; t < e.mask.length; t++) e.mask[t] && (n += 1);
          let s = e.src.length / n;
          if (Math.floor(s) !== s) throw t.err("arrayMask :", "Expects mask that has component for each atom of o.src", t.toStr({
            "atomsPerElementPreserved": n,
            "o.src.length": e.src.length
          }));
          let l = new e.src.constructor(r * s), a = [];
          for (let t = 0; t < s; t++) {
            for (let r = 0, s = 0; r < e.mask.length; r++) e.mask[r] ? (a[r] = e.src[t * n + s], 
            s += 1) : a[r] = 0;
            e.onEach && e.onEach(a, t);
            for (let n = 0; n < e.mask.length; n++) l[t * r + n] = a[n];
          }
          return l;
        }
        //
        function longUniqueAre(e) {
          t.longIs(e) && (e = {
            src: e
          }), t.assert(1 === arguments.length, "Expects single argument"), t.assert(t.longIs(e.src)), 
          t.assertMapHasOnly(e, longUniqueAre.defaults);
          /* */
          // if( o.onEvaluate )
          // {
          //   o.src = _.entityMap( o.src, ( e ) => o.onEvaluate( e ) );
          // }
          /* */
          let r, n = e.src.length, s = [];
          for (let t = 0; t < e.src.length; t++) s[t] = 1;
          for (let l = 0; l < e.src.length; l++) {
            if (r = l, !s[l]) continue;
            let a = 1;
            if ((r = t.arrayLeftIndex(e.src, e.src[l], r + 1, e.onEvaluate)) >= 0) do {
              s[r] = 0, n -= 1, a = 0, r = t.arrayLeftIndex(e.src, e.src[l], r + 1, e.onEvaluate);
            } while (r >= 0);
            // if( currentUnique && o.src2 )
            // do
            // {
            //   index = o.src2.indexOf( o.src2[ i ], index+1 );
            //   if( index !== -1 )
            //   currentUnique = 0;
            // }
            // while( index !== -1 );
                        e.includeFirst || a || (s[l] = 0, n -= 1);
          }
          return {
            number: n,
            is: s
          };
        }
        let e = _global_, t = _global_.wTools, r = _global_.wTools, s = (Array.prototype.indexOf, 
        Array.prototype.lastIndexOf, Array.prototype.slice), l = (Array.prototype.splice, 
        Function.prototype.bind, Object.prototype.toString);
        Object.hasOwnProperty, Object.propertyIsEnumerable, bufferMove.defaults = {
          dst: null,
          src: null,
          dstOffset: null
        }, bufferFrom.defaults = {
          src: null,
          bufferConstructor: null
        }, buffersSerialize.defaults = {
          context: null,
          store: null,
          dropAttribute: {},
          onAttributesGet: function() {
            return t.mapPairs(this.attributes);
          },
          onBufferGet: function(e) {
            return e.buffer;
          }
        }, buffersDeserialize.defaults = {
          store: null,
          context: null,
          onAttribute: function(e, t) {
            e.buffer = t, new this.AttributeOfGeometry(e).addTo(this);
          }
        }, arrayMakeRandom.defaults = {
          int: 0,
          range: [ 0, 1 ],
          length: 1
        }, arrayDuplicate.defaults = {
          src: null,
          result: null,
          numberOfAtomsPerElement: 1,
          numberOfDuplicatesPerElement: 2
        }, arrayUnmask.defaults = {
          src: null,
          mask: null,
          onEach: null
        }, longUniqueAre.defaults = {
          src: null,
          // src2 : null,
          onEvaluate: null,
          includeFirst: 0
        };
        // --
        // fields
        // --
        // let unrollSymbol = Symbol.for( 'unroll' );
        let a = {
          // buffer
          buffersTypedAreEquivalent: 
          // --
          // buffer
          // --
          function buffersTypedAreEquivalent(e, r, n) {
            if (!t.bufferTypedIs(e)) return !1;
            if (!t.bufferTypedIs(r)) return !1;
            if (e.length !== r.length) debugger;
            if (e.length !== r.length) return !1;
            debugger;
            null !== n && void 0 !== n || (n = t.accuracy);
            for (let t = 0; t < e.length; t++) if (Math.abs(e[t] - r[t]) > n) return !1;
            return !0;
          }
          //
          ,
          buffersTypedAreIdentical: function buffersTypedAreIdentical(e, r) {
            if (!t.bufferTypedIs(e)) return !1;
            if (!t.bufferTypedIs(r)) return !1;
            if (l.call(e) !== l.call(r)) return !1;
            if (e.length !== r.length) debugger;
            if (e.length !== r.length) return !1;
            for (let t = 0; t < e.length; t++) if (!Object.is(e[t], r[t])) return !1;
            return !0;
          }
          //
          ,
          buffersRawAreIdentical: function buffersRawAreIdentical(e, r) {
            if (!t.bufferRawIs(e)) return !1;
            if (!t.bufferRawIs(r)) return !1;
            if (e.byteLength !== r.byteLength) debugger;
            if (e.byteLength !== r.byteLength) return !1;
            e = new Uint8Array(e), r = new Uint8Array(r);
            for (let t = 0; t < e.length; t++) if (e[t] !== r[t]) return !1;
            return !0;
          }
          //
          ,
          buffersViewAreIdentical: function buffersViewAreIdentical(e, r) {
            debugger;
            if (!t.bufferViewIs(e)) return !1;
            if (!t.bufferViewIs(r)) return !1;
            if (e.byteLength !== r.byteLength) debugger;
            if (e.byteLength !== r.byteLength) return !1;
            for (let t = 0; t < e.byteLength; t++) if (e.getUint8(t) !== r.getUint8(t)) return !1;
            return !0;
          }
          //
          ,
          buffersNodeAreIdentical: function buffersNodeAreIdentical(e, r) {
            debugger;
            return !!t.bufferNodeIs(e) && !!t.bufferNodeIs(r) && e.equals(r);
          }
          //
          ,
          buffersAreEquivalent: function buffersAreEquivalent(e, r, n) {
            return t.assert(2 === arguments.length || 3 === arguments.length, "Expects two or three arguments"), 
            t.bufferTypedIs(e) ? t.buffersTypedAreEquivalent(e, r, n) : t.bufferRawIs(e) ? t.buffersRawAreIdentical(e, r) : t.bufferViewIs(e) ? t.buffersViewAreIdentical(e, r) : !!t.bufferNodeIs(e) && t.buffersNodeAreIdentica(e, r);
          }
          //
          ,
          buffersAreIdentical: function buffersAreIdentical(e, r) {
            return t.assert(2 === arguments.length, "Expects exactly two arguments"), l.call(e) === l.call(r) && (t.bufferTypedIs(e) ? t.buffersTypedAreIdentical(e, r) : t.bufferRawIs(e) ? t.buffersRawAreIdentical(e, r) : t.bufferViewIs(e) ? t.buffersViewAreIdentical(e, r) : !!t.bufferNodeIs(e) && t.buffersNodeAreIdentical(e, r));
          }
          //
          /**
 * The bufferMakeSimilar() routine returns a new array or a new TypedArray with length equal (length)
 * or new TypedArray with the same length of the initial array if second argument is not provided.
 *
 * @param { longIs } ins - The instance of an array.
 * @param { Number } [ length = ins.length ] - The length of the new array.
 *
 * @example
 * // returns [ , ,  ]
 * let arr = _.bufferMakeSimilar( [ 1, 2, 3 ] );
 *
 * @example
 * // returns [ , , ,  ]
 * let arr = _.bufferMakeSimilar( [ 1, 2, 3 ], 4 );
 *
 * @returns { longIs }  Returns an array with a certain (length).
 * @function bufferMakeSimilar
 * @throws { Error } If the passed arguments is less than two.
 * @throws { Error } If the (length) is not a number.
 * @throws { Error } If the first argument in not an array like object.
 * @throws { Error } If the (length === undefined) and (_.numberIs(ins.length)) is not a number.
 * @memberof wTools
 */
          /* qqq : implement */ ,
          bufferMakeSimilar: function bufferMakeSimilar(e, r) {
            throw t.err("not tested");
          }
          //
          /* qqq : implement */ ,
          bufferButRange: function bufferButRange(e, r, n) {
            throw r = t.rangeFrom(r), t.assert(t.bufferTypedIs(e)), t.assert(void 0 === n || t.longIs(n)), 
            t.assert(2 === arguments.length || 3 === arguments.length), t.err("not implemented");
          }
          //
          /**
 * The bufferRelen() routine returns a new or the same typed array {-srcMap-} with a new or the same length (len).
 *
 * It creates the variable (result) checks, if (len) is more than (src.length),
 * if true, it creates and assigns to (result) a new typed array with the new length (len) by call the function(longMake(src, len))
 * and copies each element from the {-srcMap-} into the (result) array while ensuring only valid data types, if data types are invalid they are replaced with zero.
 * Otherwise, if (len) is less than (src.length) it returns a new typed array from 0 to the (len) indexes, but not including (len).
 * Otherwise, it returns an initial typed array.
 *
 * @see {@link wTools.longMake} - See for more information.
 *
 * @param { typedArray } src - The source typed array.
 * @param { Number } len - The length of a typed array.
 *
 * @example
 * // returns [ 3, 7, 13, 0 ]
 * let ints = new Int8Array( [ 3, 7, 13 ] );
 * _.bufferRelen( ints, 4 );
 *
 * @example
 * // returns [ 3, 7, 13 ]
 * let ints2 = new Int16Array( [ 3, 7, 13, 33, 77 ] );
 * _.bufferRelen( ints2, 3 );
 *
 * @example
 * // returns [ 3, 0, 13, 0, 77, 0 ]
 * let ints3 = new Int32Array( [ 3, 7, 13, 33, 77 ] );
 * _.bufferRelen( ints3, 6 );
 *
 * @returns { typedArray } - Returns a new or the same typed array {-srcMap-} with a new or the same length (len).
 * @function bufferRelen
 * @memberof wTools
 */ ,
          bufferRelen: function bufferRelen(e, r) {
            t.assert(t.bufferTypedIs(e)), t.assert(2 === arguments.length, "Expects exactly two arguments"), 
            t.assert(t.numberIs(r));
            let n = e;
            return r > e.length ? (n = t.longMake(e, r)).set(e) : r < e.length && (n = e.subarray(0, r)), 
            n;
          }
          //
          /* qqq : implement for 2 other types of buffer and do code test coverage */ ,
          bufferResize: function bufferResize(e, r) {
            let n = e;
            if (t.assert(t.bufferRawIs(e) || t.bufferTypedIs(e)), t.assert(e.byteLength >= 0), 
            t.assert(2 === arguments.length, "Expects exactly two arguments"), r > e.byteLength) {
              n = t.longMake(e, r);
              let s = new Uint8Array(n, 0, n.byteLength), l = new Uint8Array(e, 0, e.byteLength);
              s.set(l);
            } else r < e.byteLength && (n = e.slice(0, r));
            return n;
          }
          //
          ,
          bufferBytesGet: function bufferBytesGet(e) {
            return e instanceof ArrayBuffer ? new Uint8Array(e) : "undefined" != typeof Buffer && e instanceof Buffer ? new Uint8Array(e.buffer, e.byteOffset, e.byteLength) : t.bufferTypedIs(e) ? new Uint8Array(e.buffer, e.byteOffset, e.byteLength) : t.strIs(e) ? _global_.Buffer ? new Uint8Array(t.bufferRawFrom(Buffer.from(e, "utf8"))) : new Uint8Array(t.encode.utf8ToBuffer(e)) : void t.assert(0, "wrong argument");
          }
          //
          /**
   * The bufferRetype() routine converts and returns a new instance of (bufferType) constructor.
   *
   * @param { typedArray } src - The typed array.
   * @param { typedArray } bufferType - The type of typed array.
   *
   * @example
   * // returns [ 513, 1027, 1541 ]
   * let view1 = new Int8Array( [ 1, 2, 3, 4, 5, 6 ] );
   * _.bufferRetype(view1, Int16Array);
   *
   * @example
   * // returns [ 1, 2, 3, 4, 5, 6 ]
   * let view2 = new Int16Array( [ 513, 1027, 1541 ] );
   * _.bufferRetype(view2, Int8Array);
   *
   * @returns { typedArray } Returns a new instance of (bufferType) constructor.
   * @function bufferRetype
   * @throws { Error } Will throw an Error if {-srcMap-} is not a typed array object.
   * @throws { Error } Will throw an Error if (bufferType) is not a type of the typed array.
   * @memberof wTools
   */ ,
          bufferRetype: function bufferRetype(e, r) {
            t.assert(t.bufferTypedIs(e)), t.assert(t.constructorIsBuffer(r));
            let n = e.byteOffset, s = Math.floor(e.byteLength / r.BYTES_PER_ELEMENT);
            return new r(e.buffer, n, s);
          }
          //
          ,
          bufferJoin: function bufferJoin() {
            if (arguments.length < 2) return arguments[0] || null;
            let e, r = [], n = 0;
            for (let s = 0; s < arguments.length; s++) {
              let l = arguments[s];
              null !== l && (e || (e = l), t.bufferRawIs(l) ? r.push(new Uint8Array(l)) : l instanceof Uint8Array ? r.push(l) : r.push(new Uint8Array(l.buffer, l.byteOffset, l.byteLength)), 
              t.assert(l.byteLength >= 0, "Expects buffers, but got", t.strType(l)), n += l.byteLength);
            }
            if (0 === r.length) return null;
            // if( srcs.length < 2 )
            // return firstSrc || null;
            /* */            let s = new ArrayBuffer(n), l = t.bufferRawIs(e) ? s : new e.constructor(s), a = l.constructor === Uint8Array ? l : new Uint8Array(s), i = 0;
            for (let e = 0; e < r.length; e++) {
              let t = r[e];
              if (a.set) a.set(t, i); else for (let e = 0; e < t.length; e++) a[i + e] = t[e];
              i += t.byteLength;
            }
            return l;
          },
          bufferMove: bufferMove,
          bufferToStr: 
          //
          function bufferToStr(e) {
            let r = "";
            if (e instanceof ArrayBuffer && (e = new Uint8Array(e, 0, e.byteLength)), t.assert(1 === arguments.length, "Expects single argument"), 
            t.assert(t.bufferAnyIs(e)), t.bufferNodeIs(e)) return e.toString("utf8");
            try {
              r = String.fromCharCode.apply(null, e);
            } catch (t) {
              for (let t = 0; t < e.byteLength; t++) r += String.fromCharCode(e[t]);
            }
            return r;
          }
          //
          ,
          bufferToDom: function bufferToDom(e) {
            let r;
            if ("undefined" != typeof DOMParser && DOMParser.prototype.parseFromBuffer) throw r = new DOMParser().parseFromBuffer(e, e.byteLength, "text/xml"), 
            t.err("not tested");
            {
              let n = t.bufferToStr(e);
              r = this.strToDom(n);
            }
            return r;
          }
          //
          ,
          bufferLeft: function bufferLeft(e, r) {
            t.bufferRawIs(e) || (e = t.bufferBytesGet(e)), t.bufferRawIs(r) || (r = t.bufferBytesGet(r)), 
            t.assert(e.indexOf), t.assert(r.indexOf);
            let n = e.indexOf(r[0]);
            for (;-1 !== n; ) {
              for (let t = 0; t < r.length && e[n + t] === r[t]; t++) ;
              if (i === r.length) return n;
              n += 1, n = e.indexOf(r[0], n);
            }
            return -1;
          }
          //
          ,
          bufferSplit: function bufferSplit(e, r) {
            t.bufferRawIs(e) || (e = t.bufferBytesGet(e)), t.bufferRawIs(r) || (r = t.bufferBytesGet(r)), 
            t.assert(e.indexOf), t.assert(r.indexOf);
            let n = [], s = 0, l = e.indexOf(r[0]);
            for (;-1 !== l; ) {
              for (let t = 0; t < r.length && e[l + t] === r[t]; t++) ;
              i === r.length ? (n.push(e.slice(s, l)), s = l += i) : l += 1, l = e.indexOf(r[0], l);
            }
            return 0 === s ? n.push(e) : n.push(e.slice(s, e.length)), n;
          }
          //
          ,
          bufferCutOffLeft: function bufferCutOffLeft(e, r) {
            t.bufferRawIs(e) || (e = t.bufferBytesGet(e)), t.bufferRawIs(r) || (r = t.bufferBytesGet(r)), 
            t.assert(e.indexOf), t.assert(r.indexOf);
            let n = [], s = e.indexOf(r[0]);
            for (;-1 !== s; ) {
              for (let t = 0; t < r.length && e[s + t] === r[t]; t++) ;
              if (i === r.length) return n.push(e.slice(0, s)), n.push(e.slice(s, s + i)), n.push(e.slice(s + i, e.length)), 
              n;
              s += 1, s = e.indexOf(r[0], s);
            }
            return n.push(null), n.push(null), n.push(e), n;
          }
          //
          ,
          bufferFromArrayOfArray: function bufferFromArrayOfArray(e, r) {
            if (t.objectIs(e) && (e = (r = e).buffer), e = (r = r || Object.create(null)).buffer = e || r.buffer, 
            //
            void 0 === r.BufferType && (r.BufferType = Float32Array), void 0 === r.sameLength && (r.sameLength = 1), 
            !r.sameLength) throw t.err("_.bufferFromArrayOfArray :", "differemt length of arrays is not implemented");
            if (!e.length) return new r.BufferType();
            let n = t.numberIs(e[0].length) ? e[0].length : e[0].len;
            if (!t.numberIs(n)) throw t.err("_.bufferFromArrayOfArray :", "cant find out element length");
            let s = e.length * n, l = new r.BufferType(s), a = 0;
            for (let t = 0; t < e.length; t++) {
              let r = e[t];
              for (let e = 0; e < n; e++) l[a] = r[e], a += 1;
            }
            return l;
          },
          bufferFrom: bufferFrom,
          bufferRawFromTyped: 
          //
          /**
 * The bufferRawFromTyped() routine returns a new ArrayBuffer from (buffer.byteOffset) to the end of an ArrayBuffer of a typed array (buffer)
 * or returns the same ArrayBuffer of the (buffer), if (buffer.byteOffset) is not provided.
 *
 * @param { typedArray } buffer - Entity to check.
 *
 * @example
 * // returns [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ]
 * let buffer1 = new ArrayBuffer( 10 );
 * let view1 = new Int8Array( buffer1 );
 * _.bufferRawFromTyped( view1 );
 *
 * @example
 * // returns [ 0, 0, 0, 0, 0, 0 ]
 * let buffer2 = new ArrayBuffer( 10 );
 * let view2 = new Int8Array( buffer2, 2 );
 * _.bufferRawFromTyped( view2 );
 *
 * @returns { ArrayBuffer } Returns a new or the same ArrayBuffer.
 * If (buffer) is instance of '[object ArrayBuffer]', it returns buffer.
 * @function bufferRawFromTyped
 * @throws { Error } Will throw an Error if (arguments.length) is not equal to the 1.
 * @throws { Error } Will throw an Error if (buffer) is not a typed array.
 * @memberof wTools
 */
          function bufferRawFromTyped(e) {
            if (t.assert(1 === arguments.length, "Expects single argument"), t.assert(t.bufferTypedIs(e) || t.bufferRawIs(e)), 
            t.bufferRawIs(e)) return e;
            let r = e.buffer;
            return (e.byteOffset || e.byteLength !== r.byteLength) && (r = r.slice(e.byteOffset || 0, e.byteLength)), 
            t.assert(t.bufferRawIs(r)), r;
          }
          //
          ,
          bufferRawFrom: function bufferRawFrom(r) {
            let n;
            if (t.assert(1 === arguments.length, "Expects single argument"), r instanceof ArrayBuffer) return r;
            if (t.bufferNodeIs(r) || t.arrayIs(r)) 
            // result = buffer.buffer;
            n = new Uint8Array(r).buffer; else if (t.bufferTypedIs(r) || t.bufferViewIs(r)) {
              debugger;
              // _.assert( 0, 'not implemented' );
                            n = r.buffer, (r.byteOffset || r.byteLength !== n.byteLength) && (n = n.slice(r.byteOffset || 0, r.byteLength));
            } else t.strIs(r) ? n = _global_.Buffer ? t.bufferRawFrom(Buffer.from(r, "utf8")) : t.encode.utf8ToBuffer(r).buffer : e.File && r instanceof File ? (n = new FileReaderSync().readAsArrayBuffer(r), 
            t.assert(0, "not tested")) : t.assert(0, () => "Unknown type of source " + t.strType(r));
            return t.assert(t.bufferRawIs(n)), n;
          }
          //
          ,
          bufferBytesFrom: function bufferBytesFrom(e) {
            let r;
            if (t.assert(1 === arguments.length, "Expects single argument"), t.bufferNodeIs(e)) t.assert(t.bufferRawIs(e.buffer)), 
            r = new U8x(e.buffer, e.byteOffset, e.byteLength); else if (t.bufferRawIs(e)) r = new U8x(e, 0, e.byteLength); else if (t.bufferTypedIs(e)) r = new U8x(e.buffer, e.byteOffset, e.byteLength); else {
              if (!t.bufferViewIs(e)) return t.bufferBytesFrom(t.bufferRawFrom(e));
              debugger;
              // _.assert( 0, 'not tested' );
                            r = new U8x(e.buffer, e.byteOffset, e.byteLength);
            }
            return t.assert(t.bufferBytesIs(r)), r;
          }
          //
          ,
          bufferBytesFromNode: function bufferBytesFromNode(e) {
            return t.assert(t.bufferNodeIs(e)), new Uint8Array(buffer);
          }
          //
          /*
qqq : cover it
*/ ,
          bufferNodeFrom: function bufferNodeFrom(e) {
            if (t.assert(1 === arguments.length, "Expects single argument"), t.assert(t.bufferViewIs(e) || t.bufferTypedIs(e) || t.bufferRawIs(e) || t.bufferNodeIs(e) || t.strIs(e) || t.arrayIs(e), "Expects typed or raw buffer, but got", t.strType(e)), 
            t.bufferNodeIs(e)) return e;
            /* */
            // if( toBuffer === null )
            // try
            // {
            //   toBuffer = require( 'typedarray-to-buffer' );
            // }
            // catch( err )
            // {
            //   toBuffer = false;
            // }
            /* */            let r;
            if (0 === e.length || 0 === e.byteLength) 
            // _.assert( 0, 'not tested' );
            // result = new Buffer([]);
            r = Buffer.from([]); else if (t.strIs(e)) {
              debugger;
              r = t.bufferNodeFrom(t.bufferRawFrom(e));
            } else r = e.buffer ? Buffer.from(e.buffer, e.byteOffset, e.byteLength) : Buffer.from(e);
            // if( !buffer.length && !buffer.byteLength )
            // {
            //   buffer = new Buffer([]);
            // }
            // else if( toBuffer )
            // try
            // {
            //   buffer = toBuffer( buffer );
            // }
            // catch( err )
            // {
            //   debugger;
            //   buffer = toBuffer( buffer );
            // }
            // else
            // {
            //   if( _.bufferTypedIs( buffer ) )
            //   buffer = Buffer.from( buffer.buffer );
            //   else
            //   buffer = Buffer.from( buffer );
            // }
                        return t.assert(t.bufferNodeIs(r)), r;
          },
          buffersSerialize: buffersSerialize,
          /* deprecated */
          buffersDeserialize: buffersDeserialize,
          /* deprecated */
          // array maker
          arrayMakeRandom: arrayMakeRandom,
          // scalarToVector,
          arrayFromCoercing: 
          //
          /**
 * The arrayFromCoercing() routine converts an object-like {-srcMap-} into Array.
 *
 * @param { * } src - To convert into Array.
 *
 * @example
 * // returns [ 3, 7, 13, 'abc', false, undefined, null, {} ]
 * _.arrayFromCoercing( [ 3, 7, 13, 'abc', false, undefined, null, {} ] );
 *
 * @example
 * // returns [ [ 'a', 3 ], [ 'b', 7 ], [ 'c', 13 ] ]
 * _.arrayFromCoercing( { a : 3, b : 7, c : 13 } );
 *
 * @example
 * // returns [ 3, 7, 13, 3.5, 5, 7.5, 13 ]
 * _.arrayFromCoercing( "3, 7, 13, 3.5abc, 5def, 7.5ghi, 13jkl" );
 *
 * @example
 * // returns [ 3, 7, 13, 'abc', false, undefined, null, { greeting: 'Hello there!' } ]
 * let args = ( function() {
 *   return arguments;
 * } )( 3, 7, 13, 'abc', false, undefined, null, { greeting: 'Hello there!' } );
 * _.arrayFromCoercing( args );
 *
 * @returns { Array } Returns an Array.
 * @function arrayFromCoercing
 * @throws { Error } Will throw an Error if {-srcMap-} is not an object-like.
 * @memberof wTools
 */
          function arrayFromCoercing(e) {
            return t.assert(1 === arguments.length, "Expects single argument"), t.arrayIs(e) ? e : t.objectIs(e) ? t.mapToArray(e) : t.longIs(e) ? s.call(e) : t.strIs(e) ? e.split(/[, ]+/).map(function(e) {
              if (e.length) return parseFloat(e);
            }) : t.argumentsArrayIs(e) ? s.call(e) : void t.assert(0, "Unknown data type : " + t.strType(e));
          }
          //
          /**
 * The arrayFromRange() routine generate array of arithmetic progression series,
 * from the range[ 0 ] to the range[ 1 ] with increment 1.
 *
 * It iterates over loop from (range[0]) to the (range[ 1 ] - range[ 0 ]),
 * and assigns to the each index of the (result) array (range[ 0 ] + 1).
 *
 * @param { longIs } range - The first (range[ 0 ]) and the last (range[ 1 ] - range[ 0 ]) elements of the progression.
 *
 * @example
 * // returns [ 1, 2, 3, 4 ]
 * let range = _.arrayFromRange( [ 1, 5 ] );
 *
 * @example
 * // returns [ 0, 1, 2, 3, 4 ]
 * let range = _.arrayFromRange( 5 );
 *
 * @returns { array } Returns an array of numbers for the requested range with increment 1.
 * May be an empty array if adding the step would not converge toward the end value.
 * @function arrayFromRange
 * @throws { Error } If passed arguments is less than one or more than one.
 * @throws { Error } If the first argument is not an array-like object.
 * @throws { Error } If the length of the (range) is not equal to the two.
 * @memberof wTools
 */ ,
          // arrayAs,
          arrayFromRange: function arrayFromRange(e) {
            t.numberIs(e) && (e = [ 0, e ]), t.assert(1 === arguments.length, "Expects single argument"), 
            t.assert(2 === e.length), t.assert(t.longIs(e));
            let r = e[0] <= e[1] ? 1 : -1;
            return this.arrayFromRangeWithStep(e, r);
          }
          //
          ,
          arrayFromProgressionArithmetic: function arrayFromProgressionArithmetic(e, r) {
            debugger;
            t.assert(2 === arguments.length, "Expects exactly two arguments"), t.assert(t.longIs(e)), 
            t.assert(isFinite(e[0])), t.assert(isFinite(e[1])), t.assert(isFinite(r)), t.assert(t.routineIs(this.ArrayType));
            debugger;
            if (0 === r) return new this.ArrayType();
            if (1 === r) return new this.ArrayType([ e[0] ]);
            let n = [ e[0], e[0] + e[1] * (r + 1) ], s = (n[1] - n[0]) / (r - 1);
            return this.arrayFromRangeWithStep(n, s);
          }
          //
          ,
          arrayFromRangeWithStep: function arrayFromRangeWithStep(e, r) {
            let n;
            if (t.assert(2 === arguments.length, "Expects exactly two arguments"), t.assert(isFinite(e[0])), 
            t.assert(isFinite(e[1])), t.assert(void 0 === r || r < 0 || r > 0), t.assert(t.routineIs(this.ArrayType)), 
            e[0] === e[1]) return new this.ArrayType();
            if (e[0] < e[1]) {
              void 0 === r && (r = 1), t.assert(r > 0), n = new this.ArrayType(Math.round((e[1] - e[0]) / r));
              let s = 0;
              for (;e[0] < e[1]; ) n[s] = e[0], e[0] += r, s += 1;
            } else {
              debugger;
              void 0 === r && (r = -1), t.assert(r < 0), n = new this.ArrayType(Math.round(e[0] - e[1] / r));
              let s = 0;
              for (;e[0] > e[1]; ) n[s] = e[0], e[0] += r, s += 1;
            }
            return n;
          }
          //
          ,
          arrayFromRangeWithNumberOfSteps: function arrayFromRangeWithNumberOfSteps(e, r) {
            if (t.assert(2 === arguments.length, "Expects exactly two arguments"), t.assert(isFinite(e[0])), 
            t.assert(isFinite(e[1])), t.assert(r >= 0), t.assert(t.routineIs(this.ArrayType)), 
            0 === r) return new this.ArrayType();
            if (1 === r) return new this.ArrayType(e[0]);
            let n;
            return n = e[0] < e[1] ? (e[1] - e[0]) / (r - 1) : (e[0] - e[1]) / (r - 1), this.arrayFromRangeWithStep(e, n);
          }
          // --
          // array converter
          // --
          /**
 * The arrayToMap() converts an (array) into Object.
 *
 * @param { longIs } array - To convert into Object.
 *
 * @example
 * // returns {  }
 * _.arrayToMap( [  ] );
 *
 * @example
 * // returns { '0' : 3, '1' : [ 1, 2, 3 ], '2' : 'abc', '3' : false, '4' : undefined, '5' : null, '6' : {} }
 * _.arrayToMap( [ 3, [ 1, 2, 3 ], 'abc', false, undefined, null, {} ] );
 *
 * @example
 * // returns { '0' : 3, '1' : 'abc', '2' : false, '3' : undefined, '4' : null, '5' : { greeting: 'Hello there!' } }
 * let args = ( function() {
 *   return arguments;
 * } )( 3, 'abc', false, undefined, null, { greeting: 'Hello there!' } );
 * _.arrayToMap( args );
 *
 * @returns { Object } Returns an Object.
 * @function arrayToMap
 * @throws { Error } Will throw an Error if (array) is not an array-like.
 * @memberof wTools
 */ ,
          // array converter
          arrayToMap: function arrayToMap(e) {
            let r = Object.create(null);
            t.assert(1 === arguments.length, "Expects single argument"), t.assert(t.longIs(e));
            for (let t = 0; t < e.length; t++) r[t] = e[t];
            return r;
          }
          //
          /**
 * The arrayToStr() routine joins an array {-srcMap-} and returns one string containing each array element separated by space,
 * only types of integer or floating point.
 *
 * @param { longIs } src - The source array.
 * @param { objectLike } [ options = {  } ] options - The options.
 * @param { Number } [ options.precision = 5 ] - The precision of numbers.
 * @param { String } [ options.type = 'mixed' ] - The type of elements.
 *
 * @example
 * // returns "1 2 3 "
 * _.arrayToStr( [ 1, 2, 3 ], { type : 'int' } );
 *
 * @example
 * // returns "3.500 13.77 7.330"
 * _.arrayToStr( [ 3.5, 13.77, 7.33 ], { type : 'float', precission : 4 } );
 *
 * @returns { String } Returns one string containing each array element separated by space,
 * only types of integer or floating point.
 * If (src.length) is empty, it returns the empty string.
 * @function arrayToStr
 * @throws { Error } Will throw an Error If (options.type) is not the number or float.
 * @memberof wTools
 */ ,
          /* dubious */
          arrayToStr: function arrayToStr(e, r) {
            let n = "";
            if (void 0 === (r = r || Object.create(null)).precission && (r.precission = 5), 
            void 0 === r.type && (r.type = "mixed"), !e.length) return n;
            if ("float" === r.type) {
              for (var s = 0; s < e.length - 1; s++) n += e[s].toPrecision(r.precission) + " ";
              n += e[s].toPrecision(r.precission);
            } else {
              if ("int" !== r.type) throw t.err("not tested");
              for (s = 0; s < e.length - 1; s++) n += String(e[s]) + " ";
              n += String(e[s]) + " ";
            }
            return n;
          }
          // --
          // array transformer
          // --
          /**
 * The arraySub() routine returns a shallow copy of a portion of an array
 * or a new TypedArray that contains
 * the elements from (begin) index to the (end) index,
 * but not including (end).
 *
 * @param { Array } src - Source array.
 * @param { Number } begin - Index at which to begin extraction.
 * @param { Number } end - Index at which to end extraction.
 *
 * @example
 * // returns [ 3, 4 ]
 * let arr = _.arraySub( [ 1, 2, 3, 4, 5 ], 2, 4 );
 *
 * @example
 * // returns [ 2, 3 ]
 * _.arraySub( [ 1, 2, 3, 4, 5 ], -4, -2 );
 *
 * @example
 * // returns [ 1, 2, 3, 4, 5 ]
 * _.arraySub( [ 1, 2, 3, 4, 5 ] );
 *
 * @returns { Array } - Returns a shallow copy of a portion of an array into a new Array.
 * @function arraySub
 * @throws { Error } If the passed arguments is more than three.
 * @throws { Error } If the first argument is not an array.
 * @memberof wTools
 */
          /* xxx : not array */ ,
          /* dubious */
          // array transformer
          arraySub: function arraySub(e, r, n) {
            return t.assert(arguments.length <= 3), t.assert(t.longIs(e), "unknown type of (-src-) argument"), 
            t.assert(t.routineIs(e.slice) || t.routineIs(e.subarray)), t.routineIs(e.subarray) ? e.subarray(r, n) : e.slice(r, n);
          }
          //
          ,
          arrayButRange: function arrayButRange(e, r, n) {
            t.assert(t.arrayLikeResizable(e)), t.assert(void 0 === n || t.longIs(n)), t.assert(2 === arguments.length || 3 === arguments.length);
            let s = [ r[0], r[1] - r[0] ];
            n && t.arrayAppendArray(s, n);
            let l = e.slice();
            return l.splice.apply(l, s), l;
          }
          //
          /* qqq : requires good test coverage */ ,
          arraySlice: function arraySlice(e, r, n) {
            return t.assert(t.arrayLikeResizable(e)), t.assert(1 <= arguments.length && arguments.length <= 3), 
            e.slice(r, n);
          }
          //
          /**
 * Changes length of provided array( array ) by copying it elements to newly created array using begin( f ),
 * end( l ) positions of the original array and value to fill free space after copy( val ). Length of new array is equal to ( l ) - ( f ).
 * If ( l ) < ( f ) - value of index ( f ) will be assigned to ( l ).
 * If ( l ) === ( f ) - returns empty array.
 * If ( l ) > ( array.length ) - returns array that contains elements with indexies from ( f ) to ( array.length ),
 * and free space filled by value of ( val ) if it was provided.
 * If ( l ) < ( array.length ) - returns array that contains elements with indexies from ( f ) to ( l ).
 * If ( l ) < 0 and ( l ) > ( f ) - returns array filled with some amount of elements with value of argument( val ).
 * If ( f ) < 0 - prepends some number of elements with value of argument( let ) to the result array.
 * @param { Array/Buffer } array - source array or buffer;
 * @param { Number } [ f = 0 ] - index of a first element to copy into new array;
 * @param { Number } [ l = array.length ] - index of a last element to copy into new array;
 * @param { * } val - value used to fill the space left after copying elements of the original array.
 *
 * @example
 * //Just partial copy of origin array
 * let arr = [ 1, 2, 3, 4 ]
 * let result = _.arrayGrow( arr, 0, 2 );
 * console.log( result );
 * //[ 1, 2 ]
 *
 * @example
 * //Increase size, fill empty with zeroes
 * let arr = [ 1 ]
 * let result = _.arrayGrow( arr, 0, 5, 0 );
 * console.log( result );
 * //[ 1, 0, 0, 0, 0 ]
 *
 * @example
 * //Take two last elements from original, other fill with zeroes
 * let arr = [ 1, 2, 3, 4, 5 ]
 * let result = _.arrayGrow( arr, 3, 8, 0 );
 * console.log( result );
 * //[ 4, 5, 0, 0, 0 ]
 *
 * @example
 * //Add two zeroes at the beginning
 * let arr = [ 1, 2, 3, 4, 5 ]
 * let result = _.arrayGrow( arr, -2, arr.length, 0 );
 * console.log( result );
 * //[ 0, 0, 1, 2, 3, 4, 5 ]
 *
 * @example
 * //Add two zeroes at the beginning and two at end
 * let arr = [ 1, 2, 3, 4, 5 ]
 * let result = _.arrayGrow( arr, -2, arr.length + 2, 0 );
 * console.log( result );
 * //[ 0, 0, 1, 2, 3, 4, 5, 0, 0 ]
 *
 * @example
 * //Source can be also a Buffer
 * let buffer = Buffer.from( '123' );
 * let result = _.arrayGrow( buffer, 0, buffer.length + 2, 0 );
 * console.log( result );
 * //[ 49, 50, 51, 0, 0 ]
 *
 * @returns { Array } Returns resized copy of a part of an original array.
 * @function arrayGrow
 * @throws { Error } Will throw an Error if( array ) is not a Array or Buffer.
 * @throws { Error } Will throw an Error if( f ) or ( l ) is not a Number.
 * @throws { Error } Will throw an Error if not enough arguments provided.
 * @memberof wTools
 */ ,
          arrayGrow: function arrayGrow(e, r, n, s) {
            let l;
            r = void 0 !== r ? r : 0, n = void 0 !== n ? n : e.length, t.assert(t.longIs(e)), 
            t.assert(t.numberIs(r)), t.assert(t.numberIs(n)), t.assert(1 <= arguments.length && arguments.length <= 4), 
            n < r && (n = r), l = t.bufferTypedIs(e) ? new e.constructor(n - r) : new Array(n - r)
            /* */;
            let a = Math.min(e.length, n);
            for (let t = Math.max(r, 0); t < a; t++) l[t - r] = e[t];
            /* */            if (void 0 !== s) {
              for (let e = 0; e < -r; e++) l[e] = s;
              for (let e = a - r; e < l.length; e++) l[e] = s;
            }
            return l;
          }
          //
          /**
 * Routine performs two operations: slice and grow.
 * "Slice" means returning a copy of original array( array ) that contains elements from index( f ) to index( l ),
 * but not including ( l ).
 * "Grow" means returning a bigger copy of original array( array ) with free space supplemented by elements with value of ( val )
 * argument.
 *
 * Returns result of operation as new array with same type as original array, original array is not modified.
 *
 * If ( f ) > ( l ), end index( l ) becomes equal to begin index( f ).
 * If ( l ) === ( f ) - returns empty array.
 *
 * To run "Slice", first ( f ) and last ( l ) indexes must be in range [ 0, array.length ], otherwise routine will run "Grow" operation.
 *
 * Rules for "Slice":
 * If ( f ) >= 0  and ( l ) <= ( array.length ) - returns array that contains elements with indexies from ( f ) to ( l ) but not including ( l ).
 *
 * Rules for "Grow":
 *
 * If ( f ) < 0 - prepends some number of elements with value of argument( val ) to the result array.
 * If ( l ) > ( array.length ) - returns array that contains elements with indexies from ( f ) to ( array.length ),
 * and free space filled by value of ( val ) if it was provided.
 * If ( l ) < 0, ( l ) > ( f ) - returns array filled with some amount of elements with value of argument( val ).
 *
 * @param { Array/Buffer } array - Source array or buffer.
 * @param { Number } [ f = 0 ] f - begin zero-based index at which to begin extraction.
 * @param { Number } [ l = array.length ] l - end zero-based index at which to end extraction.
 * @param { * } val - value used to fill the space left after copying elements of the original array.
 *
 * @example
 * _.arrayResize( [ 1, 2, 3, 4, 5, 6, 7 ], 2, 6 );
 * // returns [ 3, 4, 5, 6 ]
 *
 * @example
 * // begin index is less then zero
 * _.arrayResize( [ 1, 2, 3, 4, 5, 6, 7 ], -1, 2 );
 * // returns [ 1, 2 ]
 *
 * @example
 * //end index is bigger then length of array
 * _.arrayResize( [ 1, 2, 3, 4, 5, 6, 7 ], 5, 100 );
 * // returns [ 6, 7 ]
 *
 * @example
 * //Increase size, fill empty with zeroes
 * let arr = [ 1 ]
 * let result = _.arrayResize( arr, 0, 5, 0 );
 * console.log( result );
 * //[ 1, 0, 0, 0, 0 ]
 *
 * @example
 * //Take two last elements from original, other fill with zeroes
 * let arr = [ 1, 2, 3, 4, 5 ]
 * let result = _.arrayResize( arr, 3, 8, 0 );
 * console.log( result );
 * //[ 4, 5, 0, 0, 0 ]
 *
 * @example
 * //Add two zeroes at the beginning
 * let arr = [ 1, 2, 3, 4, 5 ]
 * let result = _.arrayResize( arr, -2, arr.length, 0 );
 * console.log( result );
 * //[ 0, 0, 1, 2, 3, 4, 5 ]
 *
 * @example
 * //Add two zeroes at the beginning and two at end
 * let arr = [ 1, 2, 3, 4, 5 ]
 * let result = _.arrayResize( arr, -2, arr.length + 2, 0 );
 * console.log( result );
 * //[ 0, 0, 1, 2, 3, 4, 5, 0, 0 ]
 *
 * @example
 * //Source can be also a Buffer
 * let buffer = Buffer.from( '123' );
 * let result = _.arrayResize( buffer, 0, buffer.length + 2, 0 );
 * console.log( result );
 * //[ 49, 50, 51, 0, 0 ]
 *
 * @returns { Array } Returns a shallow copy of elements from the original array supplemented with value of( val ) if needed.
 * @function arrayResize
 * @throws { Error } Will throw an Error if ( array ) is not an Array-like or Buffer.
 * @throws { Error } Will throw an Error if ( f ) is not a Number.
 * @throws { Error } Will throw an Error if ( l ) is not a Number.
 * @throws { Error } Will throw an Error if no arguments provided.
 * @memberof wTools
*/ ,
          arrayResize: function arrayResize(e, r, n, s) {
            let l;
            t.assert(t.longIs(e)), r = void 0 !== r ? r : 0, n = void 0 !== n ? n : e.length, 
            t.assert(t.numberIs(r)), t.assert(t.numberIs(n)), t.assert(1 <= arguments.length && arguments.length <= 4), 
            n < r && (n = r);
            let a = Math.min(e.length, n);
            l = t.bufferTypedIs(e) ? new e.constructor(n - r) : new Array(n - r);
            for (let t = Math.max(r, 0); t < a; t++) l[t - r] = e[t];
            if (void 0 !== s && (r < 0 || n > e.length)) {
              for (let e = 0; e < -r; e++) l[e] = s;
              let e = Math.max(a - r, 0);
              for (;e < l.length; e++) l[e] = s;
            }
            return l;
          }
          //
          /* srcBuffer = _.arrayMultislice( [ originalBuffer, f ], [ originalBuffer, 0, srcAttribute.atomsPerElement ] ); */ ,
          arrayMultislice: function arrayMultislice() {
            let e = 0;
            if (0 === arguments.length) return [];
            for (let r = 0; r < arguments.length; r++) {
              let n = arguments[r], s = n[1], l = n[2];
              t.assert(t.longIs(n) && t.longIs(n[0]), "Expects array of array"), s = void 0 !== s ? s : 0, 
              (l = void 0 !== l ? l : n[0].length) < s && (l = s), t.assert(t.numberIs(s)), t.assert(t.numberIs(l)), 
              n[1] = s, n[2] = l, e += l - s;
            }
            let r = new arguments[0][0].constructor(e), n = 0;
            for (let e = 0; e < arguments.length; e++) {
              let t = arguments[e], s = t[1], l = t[2];
              for (let e = s; e < l; e++, n++) r[n] = t[0][e];
            }
            return r;
          },
          arrayDuplicate: arrayDuplicate,
          arrayMask: 
          //
          /**
 * The arrayMask() routine returns a new instance of array that contains the certain value(s) from array (srcArray),
 * if an array (mask) contains the truth-value(s).
 *
 * The arrayMask() routine checks, how much an array (mask) contain the truth value(s),
 * and from that amount of truth values it builds a new array, that contains the certain value(s) of an array (srcArray),
 * by corresponding index(es) (the truth value(s)) of the array (mask).
 * If amount is equal 0, it returns an empty array.
 *
 * @param { longIs } srcArray - The source array.
 * @param { longIs } mask - The target array.
 *
 * @example
 * // returns [  ]
 * _.arrayMask( [ 1, 2, 3, 4 ], [ undefined, null, 0, '' ] );
 *
 * @example
 * // returns [ "c", 4, 5 ]
 * _arrayMask( [ 'a', 'b', 'c', 4, 5 ], [ 0, '', 1, 2, 3 ] );
 *
 * @example
 * // returns [ 'a', 'b', 5, 'd' ]
 * _.arrayMask( [ 'a', 'b', 'c', 4, 5, 'd' ], [ 3, 7, 0, '', 13, 33 ] );
 *
 * @returns { longIs } Returns a new instance of array that contains the certain value(s) from array (srcArray),
 * if an array (mask) contains the truth-value(s).
 * If (mask) contains all falsy values, it returns an empty array.
 * Otherwise, it returns a new array with certain value(s) of an array (srcArray).
 * @function arrayMask
 * @throws { Error } Will throw an Error if (arguments.length) is less or more that two.
 * @throws { Error } Will throw an Error if (srcArray) is not an array-like.
 * @throws { Error } Will throw an Error if (mask) is not an array-like.
 * @throws { Error } Will throw an Error if length of both (srcArray and mask) is not equal.
 * @memberof wTools
 */
          function arrayMask(e, r) {
            let n = r.length, s = e.length / n;
            t.assert(2 === arguments.length, "Expects exactly two arguments"), t.assert(t.longIs(e), "arrayMask :", "Expects array-like as srcArray"), 
            t.assert(t.longIs(r), "arrayMask :", "Expects array-like as mask"), t.assert(t.numberIsInt(s), "arrayMask :", "Expects mask that has component for each atom of srcArray", t.toStr({
              "atomsPerElement": n,
              "srcArray.length": e.length
            }));
            let l = 0;
            for (let e = 0; e < r.length; e++) r[e] && (l += 1);
            let a = new e.constructor(s * l);
            if (!l) return a;
            let i = 0;
            for (let t = 0; t < s; t++) for (let s = 0; s < r.length; s++) r[s] && (a[i] = e[t * n + s], 
            i += 1);
            return a;
          },
          /* dubious */
          arrayUnmask: arrayUnmask,
          /* dubious */
          longUniqueAre: longUniqueAre,
          longUnduplicate: 
          //
          function longUnduplicate(e, r, n) {
            if (t.routineIs(arguments[1]) && void 0 === arguments[2] && (n = arguments[1], r = void 0), 
            t.assert(1 === arguments.length || 2 === arguments.length || 3 === arguments.length), 
            t.assert(null === e || t.arrayIs(e)), t.assert(void 0 === r || t.longIs(r)), t.assert(void 0 === n || t.routineIs(n)), 
            r && e && (e = t.arrayAppendArraysOnce(e, r), r = void 0), r) {
              t.assert(null === e);
              let s = t.longUniqueAre({
                src: r,
                onEvaluate: n,
                includeFirst: 1
              }), l = t.longMake(r, s.number), a = 0;
              for (let e = 0; e < r.length; e++) s.is[e] && (l[a] = r[e], a += 1);
              return l;
            }
            if (e) {
              let r = t.longUniqueAre({
                src: e,
                onEvaluate: n,
                includeFirst: 1
              });
              for (let t = e.length - 1; t >= 0; t--) r.is[t] || e.splice(t, 1);
              return e;
            }
            t.assert(0);
          }
          //
          // function longUnduplicate( dst, src, onEvaluate )
          // {
          //
          //   _.assert( arguments.length === 2 || arguments.length === 3 );
          //   _.assert( dst === null || _.arrayIs( dst ) );
          //   _.assert( src === null || _.longIs( src ) );
          //
          //   let dstUnique;
          //
          //   if( src && dst )
          //   {
          //     dst = _.arrayAppendArraysOnce( dst, src );
          //   }
          //
          //   x
          //
          //   let srcUnique = _.longUniqueAre
          //   ({
          //     src,
          //     onEvaluate,
          //     includeFirst : 1,
          //   });
          //
          //   let result = _.longMake( src, dstUnique.number + srcUnique.number );
          //
          //   let c = 0;
          //   for( let i = 0 ; i < src.length ; i++ )
          //   if( srcUnique.is[ i ] )
          //   {
          //     result[ c ] = src[ i ];
          //     c += 1;
          //   }
          //
          //   return result;
          // }
          /*

*/
          //
          /**
 * The arraySelect() routine selects elements from (srcArray) by indexes of (indicesArray).
 *
 * @param { longIs } srcArray - Values for the new array.
 * @param { ( longIs | object ) } [ indicesArray = indicesArray.indices ] - Indexes of elements from the (srcArray) or options object.
 *
 * @example
 * // returns [ 3, 4, 5 ]
 * let arr = _.arraySelect( [ 1, 2, 3, 4, 5 ], [ 2, 3, 4 ] );
 *
 * @example
 * // returns [ undefined, undefined ]
 * let arr = _.arraySelect( [ 1, 2, 3 ], [ 4, 5 ] );
 *
 * @returns { longIs } - Returns a new array with the length equal (indicesArray.length) and elements from (srcArray).
   If there is no element with necessary index than the value will be undefined.
 * @function arraySelect
 * @throws { Error } If passed arguments is not array like object.
 * @throws { Error } If the atomsPerElement property is not equal to 1.
 * @memberof wTools
 */ ,
          arraySelect: function arraySelect(e, r) {
            let n = 1;
            t.objectIs(r) && (n = r.atomsPerElement || 1, r = r.indices), t.assert(2 === arguments.length, "Expects exactly two arguments"), 
            t.assert(t.bufferTypedIs(e) || t.arrayIs(e)), t.assert(t.bufferTypedIs(r) || t.arrayIs(r));
            let s = new e.constructor(r.length);
            if (1 === n) for (let t = 0, n = r.length; t < n; t += 1) s[t] = e[r[t]]; else for (let t = 0, l = r.length; t < l; t += 1) 
            // throw _.err( 'not tested' );
            for (let l = 0; l < n; l += 1) s[t * n + l] = e[r[t] * n + l];
            return s;
          }
          // --
          // array mutator
          // --
          ,
          // array mutator
          arraySet: function arraySet(e, r, n) {
            return t.assert(3 === arguments.length, "Expects exactly three arguments"), t.assert(e.length > r), 
            e[r] = n, e;
          }
          //
          /**
 * The arraySwap() routine reverses the elements by indices (index1) and (index2) in the (dst) array.
 *
 * @param { Array } dst - The initial array.
 * @param { Number } index1 - The first index.
 * @param { Number } index2 - The second index.
 *
 * @example
 * // returns [ 5, 2, 3, 4, 1 ]
 * let arr = _.arraySwap( [ 1, 2, 3, 4, 5 ], 0, 4 );
 *
 * @returns { Array } - Returns the (dst) array that has been modified in place by indexes (index1) and (index2).
 * @function arraySwap
 * @throws { Error } If the first argument in not an array.
 * @throws { Error } If the second argument is less than 0 and more than a length initial array.
 * @throws { Error } If the third argument is less than 0 and more than a length initial array.
 * @memberof wTools
 */ ,
          arraySwap: function arraySwap(e, r, n) {
            1 === arguments.length && (r = 0, n = 1), t.assert(1 === arguments.length || 3 === arguments.length), 
            t.assert(t.longIs(e), "arraySwap :", "argument must be array"), t.assert(0 <= r && r < e.length, "arraySwap :", "index1 is out of bound"), 
            t.assert(0 <= n && n < e.length, "arraySwap :", "index2 is out of bound");
            let s = e[r];
            return e[r] = e[n], e[n] = s, e;
          }
          //
          /**
 * Removes range( range ) of elements from provided array( dstArray ) and adds elements from array( srcArray )
 * at the start position of provided range( range ) if( srcArray ) was provided.
 * On success returns array with deleted element(s), otherwise returns empty array.
 * For TypedArray's and buffers returns modified copy of ( dstArray ) or original array if nothing changed.
 *
 * @param { Array|TypedArray|Buffer } dstArray - The target array, TypedArray( Int8Array, Int16Array, Uint8Array ... etc ) or Buffer( ArrayBuffer, Buffer ).
 * @param { Array|Number } range - The range of elements or index of single element to remove from ( dstArray ).
 * @param { Array } srcArray - The array of elements to add to( dstArray ) at the start position of provided range( range ).
 * If one of ( range ) indexies is not specified it will be setted to zero.
 * If ( range ) start index is greater than the length of the array ( dstArray ), actual starting index will be set to the length of the array ( dstArray ).
 * If ( range ) start index is negative, will be setted to zero.
 * If ( range ) start index is greater than end index, the last will be setted to value of start index.
 *
 * @example
 * _.arrayCutin( [ 1, 2, 3, 4 ], 2 );
 * // returns [ 3 ]
 *
 * @example
 * _.arrayCutin( [ 1, 2, 3, 4 ], [ 1, 2 ] );
 * // returns [ 2 ]
 *
 * @example
 * _.arrayCutin( [ 1, 2, 3, 4 ], [ 0, 5 ] );
 * // returns [ 1, 2, 3, 4 ]
 *
 * @example
 * _.arrayCutin( [ 1, 2, 3, 4 ], [ -1, 5 ] );
 * // returns [ 1, 2, 3, 4 ]
 *
 * @example
 * let dst = [ 1, 2, 3, 4 ];
 * _.arrayCutin( dst, [ 0, 3 ], [ 0, 0, 0 ] );
 * console.log( dst );
 * // returns [ 0, 0, 0, 4 ]
 *
 * @example
 * let dst = new Int32Array( 4 );
 * dst.set( [ 1, 2, 3, 4 ] )
 * _.arrayCutin( dst, 0 );
 * // returns [ 2, 3, 4 ]
 *
 * @returns { Array|TypedArray|Buffer } For array returns array with deleted element(s), otherwise returns empty array.
 * For other types returns modified copy or origin( dstArray ).
 * @function arrayCutin
 * @throws { Error } If ( arguments.length ) is not equal to two or three.
 * @throws { Error } If ( dstArray ) is not an Array.
 * @throws { Error } If ( srcArray ) is not an Array.
 * @throws { Error } If ( range ) is not an Array.
 * @memberof wTools
 */ ,
          arrayCutin: function arrayCutin(e, r, n) {
            t.numberIs(r) && (r = [ r, r + 1 ]), t.assert(2 === arguments.length || 3 === arguments.length, "Expects two or three arguments"), 
            t.assert(t.arrayIs(e) || t.bufferAnyIs(e)), t.assert(t.arrayIs(r)), t.assert(void 0 === n || t.arrayIs(n));
            let s, l = t.definedIs(e.length) ? e.length : e.byteLength, a = void 0 !== r[0] ? r[0] : 0, i = void 0 !== r[1] ? r[1] : l;
            if (a < 0 && (a = 0), a > l && (a = l), i > l && (i = l), i < a && (i = a), t.bufferAnyIs(e)) {
              if (a === i) return e;
              let r = l - i + a, o = 0;
              if (n && (r += o = t.definedIs(n.length) ? n.length : n.byteLength), s = t.bufferRawIs(e) ? new ArrayBuffer(r) : t.bufferNodeIs(e) ? Buffer.alloc(r) : t.longMake(e, r), 
              a > 0) for (let t = 0; t < a; ++t) s[t] = e[t];
              if (n) for (let e = a, t = 0; t < o; ) s[e++] = n[t++];
              for (let t = i, r = a + o; t < l; ) s[r++] = e[t++];
              return s;
            }
            {
              let t = n ? n.slice() : [];
              t.unshift(i - a), t.unshift(a), s = e.splice.apply(e, t);
            }
            return s;
          }
          //
          /**
 * The arrayPut() routine puts all values of (arguments[]) after the second argument to the (dstArray)
 * in the position (dstOffset) and changes values of the following index.
 *
 * @param { longIs } dstArray - The source array.
 * @param { Number } [ dstOffset = 0 ] dstOffset - The index of element where need to put the new values.
 * @param {*} arguments[] - One or more argument(s).
 * If the (argument) is an array it iterates over array and adds each element to the next (dstOffset++) index of the (dstArray).
 * Otherwise, it adds each (argument) to the next (dstOffset++) index of the (dstArray).
 *
 * @example
 * // returns [ 1, 2, 'str', true, 7, 8, 9 ]
 * let arr = _.arrayPut( [ 1, 2, 3, 4, 5, 6, 9 ], 2, 'str', true, [ 7, 8 ] );
 *
 * @example
 * // returns [ 'str', true, 7, 8, 5, 6, 9 ]
 * let arr = _.arrayPut( [ 1, 2, 3, 4, 5, 6, 9 ], 0, 'str', true, [ 7, 8 ] );
 *
 * @returns { longIs } - Returns an array containing the changed values.
 * @function arrayPut
 * @throws { Error } Will throw an Error if (arguments.length) is less than one.
 * @throws { Error } Will throw an Error if (dstArray) is not an array-like.
 * @throws { Error } Will throw an Error if (dstOffset) is not a Number.
 * @memberof wTools
 */ ,
          arrayPut: function arrayPut(e, r) {
            t.assert(arguments.length >= 1, "Expects at least one argument"), t.assert(t.longIs(e)), 
            t.assert(t.numberIs(r)), r = r || 0;
            for (let n = 2; n < arguments.length; n++) {
              let s = arguments[n], l = t.arrayIs(s) || t.bufferTypedIs(s);
              if (l && t.bufferTypedIs(e)) e.set(s, r), r += s.length; else if (l) for (let t = 0; t < s.length; t++) e[r] = s[t], 
              r += 1; else e[r] = s, r += 1;
            }
            return e;
          }
          //
          /**
 * The arrayFill() routine fills all the elements of the given or a new array from the 0 index to an (options.times) index
 * with a static value.
 *
 * @param { ( Object | Number | Array ) } o - The options to fill the array.
 * @param { Number } [ o.times = result.length ] o.times - The count of repeats.
   If in the function passed an Array, the times will be equal the length of the array. If Number than this value.
 * @param { Number } [ o.value = 0 ] - The value for the filling.
 *
 * @example
 * // returns [ 3, 3, 3, 3, 3 ]
 * let arr = _.arrayFill( { times : 5, value : 3 } );
 *
 * @example
 * // returns [ 0, 0, 0, 0 ]
 * let arr = _.arrayFill( 4 );
 *
 * @example
 * // returns [ 0, 0, 0 ]
 * let arr = _.arrayFill( [ 1, 2, 3 ] );
 *
 * @returns { Array } - Returns an array filled with a static value.
 * @function arrayFill
 * @throws { Error } If missed argument, or got more than one argument.
 * @throws { Error } If passed argument is not an object.
 * @throws { Error } If the last element of the (o.result) is not equal to the (o.value).
 * @memberof wTools
 */ ,
          arrayFillTimes: function arrayFillTimes(e, r, n) {
            if (t.assert(2 === arguments.length || 3 === arguments.length, "Expects two or three arguments"), 
            t.assert(t.longIs(e)), void 0 === n && (n = 0), e.length < r && (e = t.arrayGrow(e, 0, r)), 
            t.routineIs(e.fill)) e.fill(n, 0, r); else {
              debugger;
              r < 0 && (r = e.length + r);
              for (let t = 0; t < r; t++) e[t] = n;
            }
            return t.assert(r <= 0 || e[r - 1] === n), e;
          }
          //
          ,
          arrayFillWhole: function arrayFillWhole(e, r) {
            return t.assert(t.longIs(e)), t.assert(1 === arguments.length || 2 === arguments.length), 
            void 0 === r && (r = 0), t.arrayFillTimes(e, e.length, r);
          }
          // {
          //   _.assert( arguments.length === 2 || arguments.length === 3, 'Expects two or three arguments' );
          //   _.assert( _.objectIs( o ) || _.numberIs( o ) || _.arrayIs( o ), 'arrayFill :', '"o" must be object' );
          //
          //   if( arguments.length === 1 )
          //   {
          //     if( _.numberIs( o ) )
          //     o = { times : o };
          //     else if( _.arrayIs( o ) )
          //     o = { result : o };
          //   }
          //   else
          //   {
          //     o = { result : arguments[ 0 ], value : arguments[ 1 ] };
          //   }
          //
          //   _.assertMapHasOnly( o, arrayFill.defaults );
          //   if( o.result )
          //   _.assert( _.longIs( o.result ) );
          //
          //   let result = o.result || [];
          //   let times = o.times !== undefined ? o.times : result.length;
          //   let value = o.value !== undefined ? o.value : 0;
          //
          //   if( _.routineIs( result.fill ) )
          //   {
          //     if( result.length < times )
          //     result.length = times;
          //     result.fill( value, 0, times );
          //   }
          //   else
          //   {
          //     for( let t = 0 ; t < times ; t++ )
          //     result[ t ] = value;
          //   }
          //
          //   _.assert( result[ times-1 ] === value );
          //   return result;
          // }
          //
          // arrayFill.defaults =
          // {
          //   result : null,
          //   times : null,
          //   value : null,
          // }
          //
          /**
 * The arraySupplement() routine returns an array (dstArray), that contains values from following arrays only type of numbers.
 * If the initial (dstArray) isn't contain numbers, they are replaced.
 *
 * It finds among the arrays the biggest array, and assigns to the variable (length), iterates over from 0 to the (length),
 * creates inner loop that iterates over (arguments[...]) from the right (arguments.length - 1) to the (arguments[0]) left,
 * checks each element of the arrays, if it contains only type of number.
 * If true, it adds element to the array (dstArray) by corresponding index.
 * Otherwise, it skips and checks following array from the last executable index, previous array.
 * If the last executable index doesn't exist, it adds 'undefined' to the array (dstArray).
 * After that it returns to the previous array, and executes again, until (length).
 *
 * @param { longIs } dstArray - The initial array.
 * @param { ...longIs } arguments[...] - The following array(s).
 *
 * @example
 * // returns ?
 * _.arraySupplement( [ 4, 5 ], [ 1, 2, 3 ], [ 6, 7, 8, true, 9 ], [ 'a', 'b', 33, 13, 'e', 7 ] );
 * @returns { longIs } - Returns an array that contains values only type of numbers.
 * @function arraySupplement
 * @throws { Error } Will throw an Error if (dstArray) is not an array-like.
 * @throws { Error } Will throw an Error if (arguments[...]) is/are not the array-like.
 * @memberof wTools
 */ ,
          arraySupplement: function arraySupplement(e) {
            let r = e;
            null === r && (r = []);
            let n = r.length;
            t.assert(t.longIs(r) || t.numberIs(r), "Expects object as argument");
            for (let e = arguments.length - 1; e >= 1; e--) t.assert(t.longIs(arguments[e]), "argument is not defined :", e), 
            n = Math.max(n, arguments[e].length);
            t.numberIs(r) && (r = arrayFill({
              value: r,
              times: n
            }));
            for (let t = 0; t < n; t++) {
              if (t in e && isFinite(e[t])) continue;
              let n;
              for (n = arguments.length - 1; n >= 1 && (!(t in arguments[n]) || isNaN(arguments[n][t])); n--) ;
              0 !== n && (r[t] = arguments[n][t]);
            }
            return r;
          }
          //
          /**
 * The arrayExtendScreening() routine iterates over (arguments[...]) from the right to the left (arguments[1]),
 * and returns a (dstArray) containing the values of the following arrays,
 * if the following arrays contains the indexes of the (screenArray).
 *
 * @param { longIs } screenArray - The source array.
 * @param { longIs } dstArray - To add the values from the following arrays,
 * if the following arrays contains indexes of the (screenArray).
 * If (dstArray) contains values, the certain values will be replaced.
 * @param { ...longIs } arguments[...] - The following arrays.
 *
 * @example
 * // returns [ 5, 6, 2 ]
 * _.arrayExtendScreening( [ 1, 2, 3 ], [  ], [ 0, 1, 2 ], [ 3, 4 ], [ 5, 6 ] );
 *
 * @example
 * // returns [ 'a', 6, 2, 13 ]
 * _.arrayExtendScreening( [ 1, 2, 3 ], [ 3, 'abc', 7, 13 ], [ 0, 1, 2 ], [ 3, 4 ], [ 'a', 6 ] );
 *
 * @example
 * // returns [ 3, 'abc', 7, 13 ]
 * _.arrayExtendScreening( [  ], [ 3, 'abc', 7, 13 ], [ 0, 1, 2 ], [ 3, 4 ], [ 'a', 6 ] )
 *
 * @returns { longIs } Returns a (dstArray) containing the values of the following arrays,
 * if the following arrays contains the indexes of the (screenArray).
 * If (screenArray) is empty, it returns a (dstArray).
 * If (dstArray) is equal to the null, it creates a new array,
 * and returns the corresponding values of the following arrays by the indexes of a (screenArray).
 * @function arrayExtendScreening
 * @throws { Error } Will throw an Error if (screenArray) is not an array-like.
 * @throws { Error } Will throw an Error if (dstArray) is not an array-like.
 * @throws { Error } Will throw an Error if (arguments[...]) is/are not an array-like.
 * @memberof wTools
 */ ,
          /* experimental */
          arrayExtendScreening: function arrayExtendScreening(e, r) {
            let n = r;
            null === n && (n = []), t.assert(t.longIs(e), "Expects object as screenArray"), 
            t.assert(t.longIs(n), "Expects object as argument");
            for (let e = arguments.length - 1; e >= 2; e--) t.assert(arguments[e], "argument is not defined :", e);
            for (let t = 0; t < e.length; t++) {
              if (void 0 === e[t]) continue;
              let r;
              for (r = arguments.length - 1; r >= 2 && !(t in arguments[r]); r--) ;
              1 !== r && (n[t] = arguments[r][t]);
            }
            return n;
          }
          //
          ,
          /* experimental */
          arrayShuffle: function arrayShuffle(e, r) {
            t.assert(1 === arguments.length || 2 === arguments.length), t.assert(t.longIs(e)), 
            void 0 === r && (r = e.length);
            let n, s, l = e.length;
            for (let t = 0; t < r; t++) {
              let r = Math.floor(Math.random() * l);
              n = e[t], s = e[r], e[t] = s, e[r] = n;
            }
            return e;
          }
          //
          ,
          arraySort: function arraySort(e, r) {
            if (t.assert(1 === arguments.length || 2 === arguments.length), t.assert(void 0 === r || t.routineIs(r)), 
            void 0 === r) {
              debugger;
              e.sort();
            } else 2 === r.length ? e.sort(r) : 1 === r.length ? e.sort(function(e, t) {
              return (e = r(e)) > (t = r(t)) ? 1 : e < t ? -1 : 0;
            }) : t.assert(0, "Expects signle-arguments evaluator or two-argument comparator");
            return e;
          }
          // --
          // array etc
          // --
          ,
          // array etc
          arrayIndicesOfGreatest: function arrayIndicesOfGreatest(e, r, n) {
            e.length;
            debugger;
            throw t.err("not tested");
          }
          //
          /**
 * The arraySum() routine returns the sum of an array {-srcMap-}.
 *
 * @param { longIs } src - The source array.
 * @param { Function } [ onEvaluate = function( e ) { return e } ] - A callback function.
 *
 * @example
 * // returns 15
 * _.arraySum( [ 1, 2, 3, 4, 5 ] );
 *
 * @example
 * // returns 29
 * _.arraySum( [ 1, 2, 3, 4, 5 ], function( e ) { return e * 2 } );
 *
 * @example
 * // returns 94
 * _.arraySum( [ true, false, 13, '33' ], function( e ) { return e * 2 } );
 *
 * @returns { Number } - Returns the sum of an array {-srcMap-}.
 * @function arraySum
 * @throws { Error } If passed arguments is less than one or more than two.
 * @throws { Error } If the first argument is not an array-like object.
 * @throws { Error } If the second argument is not a Function.
 * @memberof wTools
 */ ,
          /* dubious */
          arraySum: function arraySum(e, r) {
            let n = 0;
            t.assert(1 === arguments.length || 2 === arguments.length), t.assert(t.longIs(e), "arraySum :", "Expects ArrayLike"), 
            void 0 === r && (r = function(e) {
              return e;
            }), t.assert(t.routineIs(r));
            for (let t = 0; t < e.length; t++) n += r(e[t], t, e);
            return n;
          }
          // --
          // array set
          // --
          /**
 * Returns new array that contains difference between two arrays: ( src1 ) and ( src2 ).
 * If some element is present in both arrays, this element and all copies of it are ignored.
 * @param { longIs } src1 - source array;
 * @param { longIs} src2 - array to compare with ( src1 ).
 *
 * @example
 * // returns [ 1, 2, 3, 4, 5, 6 ]
 * _.arraySetDiff( [ 1, 2, 3 ], [ 4, 5, 6 ] );
 *
 * @example
 * // returns [ 2, 4, 3, 5 ]
 * _.arraySetDiff( [ 1, 2, 4 ], [ 1, 3, 5 ] );
 *
 * @returns { Array } Array with unique elements from both arrays.
 * @function arraySetDiff
 * @throws { Error } If arguments count is not 2.
 * @throws { Error } If one or both argument(s) are not longIs entities.
 * @memberof wTools
 */ ,
          /* dubious */
          // array set
          arraySetDiff: function arraySetDiff(e, r) {
            let n = [];
            t.assert(2 === arguments.length, "Expects exactly two arguments"), t.assert(t.longIs(e)), 
            t.assert(t.longIs(r));
            for (let t = 0; t < e.length; t++) -1 === r.indexOf(e[t]) && n.push(e[t]);
            for (let t = 0; t < r.length; t++) -1 === e.indexOf(r[t]) && n.push(r[t]);
            return n;
          }
          //
          /**
 * Returns new array that contains elements from ( src ) that are not present in ( but ).
 * All copies of ignored element are ignored too.
 * @param { longIs } src - source array;
 * @param { longIs} but - array of elements to ignore.
 *
 * @example
 * // returns []
 * _.arraySetBut( [ 1, 1, 1 ], [ 1 ] );
 *
 * @example
 * // returns [ 2, 2 ]
 * _.arraySetBut( [ 1, 1, 2, 2, 3, 3 ], [ 1, 3 ] );
 *
 * @returns { Array } Source array without elements from ( but ).
 * @function arraySetBut
 * @throws { Error } If arguments count is not 2.
 * @throws { Error } If one or both argument(s) are not longIs entities.
 * @memberof wTools
 */ ,
          arraySetBut: function arraySetBut(e) {
            let r = t.longSlice(arguments);
            if (null === e) {
              if (!(r.length > 1)) return [];
              e = t.longSlice(r[1]), r.splice(1, 1);
            }
            r[0] = e, t.assert(arguments.length >= 1, "Expects at least one argument");
            for (let e = 0; e < r.length; e++) t.assert(t.longIs(r[e]));
            for (let t = e.length - 1; t >= 0; t--) for (let n = 1; n < r.length; n++) if (-1 !== r[n].indexOf(e[t])) {
              e.splice(t, 1);
              break;
            }
            return e;
          }
          //
          /**
 * Returns array that contains elements from ( src ) that exists at least in one of arrays provided after first argument.
 * If element exists and it has copies, all copies of that element will be included into result array.
 * @param { longIs } src - source array;
 * @param { ...longIs } - sequence of arrays to compare with ( src ).
 *
 * @example
 * // returns [ 1, 3 ]
 * _.arraySetIntersection( [ 1, 2, 3 ], [ 1 ], [ 3 ] );
 *
 * @example
 * // returns [ 1, 1, 2, 2, 3, 3 ]
 * _.arraySetIntersection( [ 1, 1, 2, 2, 3, 3 ], [ 1 ], [ 2 ], [ 3 ], [ 4 ] );
 *
 * @returns { Array } Array with elements that are a part of at least one of the provided arrays.
 * @function arraySetIntersection
 * @throws { Error } If one of arguments is not an longIs entity.
 * @memberof wTools
 */ ,
          arraySetIntersection: function arraySetIntersection(e) {
            let r = 1;
            if (null === e) {
              if (!(arguments.length > 1)) return [];
              e = t.longSlice(arguments[1]), r = 2;
            }
            t.assert(arguments.length >= 1, "Expects at least one argument"), t.assert(t.longIs(e));
            for (let e = 1; e < arguments.length; e++) t.assert(t.longIs(arguments[e]));
            for (let t = e.length - 1; t >= 0; t--) for (let n = r; n < arguments.length; n++) if (-1 === arguments[n].indexOf(e[t])) {
              e.splice(t, 1);
              break;
            }
            return e;
          }
          //
          ,
          arraySetUnion: function arraySetUnion(e) {
            let r = t.longSlice(arguments);
            if (null === e) {
              if (!(arguments.length > 1)) return [];
              e = [];
            }
            t.assert(arguments.length >= 1, "Expects at least one argument"), t.assert(t.longIs(e));
            for (let e = 1; e < r.length; e++) t.assert(t.longIs(r[e]));
            for (let t = 1; t < r.length; t++) {
              let n = r[t];
              for (let t = 0; t < n.length; t++) -1 === e.indexOf(n[t]) && e.push(n[t]);
            }
            return e;
          }
          //
          /*
function arraySetContainAll( src )
{
  let result = [];

  _.assert( _.longIs( src ) );

  for( let a = 1 ; a < arguments.length ; a++ )
  {

    _.assert( _.longIs( arguments[ a ] ) );

    if( src.length > arguments[ a ].length )
    return false;

    for( let i = 0 ; i < src.length ; i++ )
    {

      throw _.err( 'Not tested' );
      if( arguments[ a ].indexOf( src[ i ] ) !== -1 )
      {
        throw _.err( 'Not tested' );
        return false;
      }

    }

  }

  return true;
}
*/
          //
          /**
   * The arraySetContainAll() routine returns true, if at least one of the following arrays (arguments[...]),
   * contains all the same values as in the {-srcMap-} array.
   *
   * @param { longIs } src - The source array.
   * @param { ...longIs } arguments[...] - The target array.
   *
   * @example
   * // returns true
   * _.arraySetContainAll( [ 1, 'b', 'c', 4 ], [ 1, 2, 3, 4, 5, 'b', 'c' ] );
   *
   * @example
   * // returns false
   * _.arraySetContainAll( [ 'abc', 'def', true, 26 ], [ 1, 2, 3, 4 ], [ 26, 'abc', 'def', true ] );
   *
   * @returns { boolean } Returns true, if at least one of the following arrays (arguments[...]),
   * contains all the same values as in the {-srcMap-} array.
   * If length of the {-srcMap-} is more than the next argument, it returns false.
   * Otherwise, it returns false.
   * @function arraySetContainAll
   * @throws { Error } Will throw an Error if {-srcMap-} is not an array-like.
   * @throws { Error } Will throw an Error if (arguments[...]) is not an array-like.
   * @memberof wTools
   */ ,
          arraySetContainAll: function arraySetContainAll(e) {
            t.assert(t.longIs(e));
            for (let e = 1; e < arguments.length; e++) t.assert(t.longIs(arguments[e]));
            for (let t = 1; t < arguments.length; t++) {
              let r = arguments[t];
              for (let t = 0; t < r.length; t++) if (-1 === e.indexOf(r[t])) return !1;
            }
            return !0;
          }
          //
          /**
 * The arraySetContainAny() routine returns true, if at least one of the following arrays (arguments[...]),
 * contains the first matching value from {-srcMap-}.
 *
 * @param { longIs } src - The source array.
 * @param { ...longIs } arguments[...] - The target array.
 *
 * @example
 * // returns true
 * _.arraySetContainAny( [ 33, 4, 5, 'b', 'c' ], [ 1, 'b', 'c', 4 ], [ 33, 13, 3 ] );
 *
 * @example
 * // returns true
 * _.arraySetContainAny( [ 'abc', 'def', true, 26 ], [ 1, 2, 3, 4 ], [ 26, 'abc', 'def', true ] );
 *
 * @example
 * // returns false
 * _.arraySetContainAny( [ 1, 'b', 'c', 4 ], [ 3, 5, 'd', 'e' ], [ 'abc', 33, 7 ] );
 *
 * @returns { Boolean } Returns true, if at least one of the following arrays (arguments[...]),
 * contains the first matching value from {-srcMap-}.
 * Otherwise, it returns false.
 * @function arraySetContainAny
 * @throws { Error } Will throw an Error if {-srcMap-} is not an array-like.
 * @throws { Error } Will throw an Error if (arguments[...]) is not an array-like.
 * @memberof wTools
 */ ,
          arraySetContainAny: function arraySetContainAny(e) {
            t.assert(t.longIs(e));
            for (let e = 1; e < arguments.length; e++) t.assert(t.longIs(arguments[e]));
            if (0 === e.length) return !0;
            for (let t = 1; t < arguments.length; t++) {
              let r, n = arguments[t];
              for (r = 0; r < n.length && -1 === e.indexOf(n[r]); r++) ;
              if (r === n.length) return !1;
            }
            return !0;
          }
          //
          ,
          arraySetContainNone: function arraySetContainNone(e) {
            t.assert(t.longIs(e));
            for (let r = 1; r < arguments.length; r++) {
              t.assert(t.longIs(arguments[r]));
              for (let t = 0; t < e.length; t++) if (-1 !== arguments[r].indexOf(e[t])) return !1;
            }
            return !0;
          }
          //
          /**
 * Returns true if ( ins1 ) and ( ins2) arrays have same length and elements, elements order doesn't matter.
 * Inner arrays of arguments are not compared and result of such combination will be false.
 * @param { longIs } ins1 - source array;
 * @param { longIs} ins2 - array to compare with.
 *
 * @example
 * // returns false
 * _.arraySetIdentical( [ 1, 2, 3 ], [ 4, 5, 6 ] );
 *
 * @example
 * // returns true
 * _.arraySetIdentical( [ 1, 2, 4 ], [ 4, 2, 1 ] );
 *
 * @returns { Boolean } Result of comparison as boolean.
 * @function arraySetIdentical
 * @throws { Error } If one of arguments is not an ArrayLike entity.
 * @throws { Error } If arguments length is not 2.
 * @memberof wTools
 */ ,
          arraySetIdentical: function arraySetIdentical(e, r) {
            return t.assert(2 === arguments.length, "Expects exactly two arguments"), t.assert(t.longIs(e)), 
            t.assert(t.longIs(r)), e.length === r.length && 0 === t.arraySetDiff(e, r).length;
          }
        };
        // --
        // routines
        // --
                //
        Object.assign(r, a), Object.assign(r, {}), 
        // --
        // export
        // --
        void 0 !== n && null !== n && (n.exports = r);
      }();
    });
    n.include, n.include;
  }(), // == end of file gLong_s
  function gMap_s() {
    let t = _starter_._pathResolve(e, "dwtools/abase/l1/gMap.s"), r = _starter_._pathResolve(e, "dwtools/abase/l1/"), n = _starter_._fileCreate(t, r, // == begin of file gMap_s
    function gMap_s_naked() {
      !function _gMap_s_() {
        "use strict";
        _global_, _global_.wTools;
        let e = _global_.wTools;
        Array.prototype.slice, Function.prototype.bind, Object.prototype.toString, Object.hasOwnProperty, 
        //
        Object.assign(e, {}), Object.assign(e, {}), 
        // --
        // export
        // --
        void 0 !== n && null !== n && (n.exports = e);
      }();
    });
    n.include, n.include;
  }(), // == end of file gMap_s
  function gNumber_s() {
    let t = _starter_._pathResolve(e, "dwtools/abase/l1/gNumber.s"), r = _starter_._pathResolve(e, "dwtools/abase/l1/"), n = _starter_._fileCreate(t, r, // == begin of file gNumber_s
    function gNumber_s_naked() {
      !function _gNumber_s_() {
        "use strict";
        //
        function numbersFrom(t) {
          if (e.strIs(t)) return e.numberFrom(t);
          let r;
          if (e.longIs(t)) {
            r = [];
            for (let n = 0; n < t.length; n++) r[n] = e.numberFrom(t[n]);
          } else if (e.objectIs(t)) {
            r = Object.create(null);
            for (let n in t) r[n] = e.numberFrom(t[n]);
          }
          return r;
        }
        //
                _global_;
        let e = _global_.wTools, t = _global_.wTools, r = (Array.prototype.indexOf, Array.prototype.lastIndexOf, 
        Array.prototype.slice, Array.prototype.splice, Function.prototype.bind, Object.prototype.toString, 
        Object.hasOwnProperty, Object.propertyIsEnumerable, Math.ceil, Math.floor, {
          numbersTotal: 
          // --
          // number
          // --
          function numbersTotal(t) {
            let r = 0;
            e.assert(e.longIs(t)), e.assert(1 === arguments.length, "Expects single argument");
            for (let n = 0; n < t.length; n++) {
              let s = t[n];
              e.assert(e.numberIs(s)), r += s;
            }
            return r;
          }
          //
          ,
          numberFrom: function numberFrom(t) {
            return e.assert(1 === arguments.length), e.strIs(t) ? parseFloat(t) : Number(t);
          },
          numbersFrom: numbersFrom,
          /* qqq : add test coverage */
          numberFromStr: function numberFromStr(t) {
            return e.assert(1 === arguments.length), e.assert(e.strIs(t)), parseFloat(t);
          }
          //
          ,
          numbersSlice: function numbersSlice(t, r, n) {
            return e.numberIs(t) ? t : e.longSlice(t, r, n);
          }
          //
          ,
          numberRandomInRange: function numberRandomInRange(t) {
            return e.assert(1 === arguments.length && e.arrayIs(t), "numberRandomInRange :", "Expects range( array ) as argument"), 
            e.assert(2 === t.length), _random() * (t[1] - t[0]) + t[0];
          }
          //
          ,
          numberRandomInt: function numberRandomInt(t) {
            return e.numberIs(t) ? t = t >= 0 ? [ 0, t ] : [ t, 0 ] : e.arrayIs(t) ? t = t : e.assert(0, "numberRandomInt", "Expects range"), 
            e.assert(e.arrayIs(t) || e.numberIs(t)), e.assert(2 === t.length), Math.floor(t[0] + Math.random() * (t[1] - t[0]));
          }
          //
          ,
          numberRandomIntBut: function numberRandomIntBut(t) {
            let r;
            if (e.numberIs(t)) t = [ 0, t ]; else {
              if (!e.arrayIs(t)) throw e.err("numberRandomInt", "unexpected argument");
              t = t;
            }
            for (let r = 0; r < 50; r++) {
              // if( attempt === attempts-2 )
              // debugger;
              // if( attempt === attempts-1 )
              // debugger;
              /*result = _.numberRandomInt( range ); */
              let r = Math.floor(t[0] + Math.random() * (t[1] - t[0])), n = !1;
              for (let t = 1; t < arguments.length; t++) e.routineIs(arguments[t]) ? arguments[t](r) || (n = !0) : r === arguments[t] && (n = !0);
              if (!n) return r;
            }
            return r = NaN, NaN;
          }
          //
          ,
          /* dubious */
          numbersMake: function numbersMake(t, r) {
            let n;
            if (e.vectorIs(t) && (t = e.vector.slice(t)), e.assert(2 === arguments.length, "Expects exactly two arguments"), 
            e.assert(e.numberIs(t) || e.arrayLike(t)), e.arrayLike(t)) {
              e.assert(t.length === r), n = e.array.makeArrayOfLength(r);
              for (let e = 0; e < r; e++) n[e] = t[e];
            } else {
              n = e.array.makeArrayOfLength(r);
              for (let e = 0; e < r; e++) n[e] = t;
            }
            return n;
          }
          //
          ,
          numbersFromNumber: function numbersFromNumber(t, r) {
            if (e.vectorIs(t) && (t = e.vector.slice(t)), e.assert(2 === arguments.length, "Expects exactly two arguments"), 
            e.assert(e.numberIs(t) || e.arrayLike(t)), e.arrayLike(t)) return e.assert(t.length === r), 
            t;
            let n = e.array.makeArrayOfLength(r);
            for (let e = 0; e < r; e++) n[e] = t;
            return n;
          }
          //
          ,
          numbersFromInt: function numbersFromInt(t, r) {
            if (e.assert(2 === arguments.length, "Expects exactly two arguments"), e.assert(e.numberIsInt(t) || e.arrayIs(t), "Expects array of number as argument"), 
            e.assert(r >= 0), e.numberIs(t)) t = e.arrayFillTimes([], r, t); else {
              for (let r = 0; r < t.length; r++) e.assert(e.numberIsInt(t[r]), "Expects integer, but got", t[r]);
              e.assert(t.length === r, "Expects array of length", r, "but got", t);
            }
            return t;
          }
          //
          ,
          numbersMake_functor: function numbersMake_functor(e) {
            let t = this;
            return t.assert(1 === arguments.length, "Expects single argument"), t.assert(t.numberIs(e)), 
            function numbersMake(r) {
              return t.numbersMake(r, e);
            };
          }
          //
          ,
          numbersFrom_functor: function numbersFrom_functor(e) {
            let t = this;
            return t.assert(1 === arguments.length, "Expects single argument"), t.assert(t.numberIs(e)), 
            numbersFrom;
          }
          // --
          // fields
          // --
                });
        //
        Object.assign(t, r), Object.assign(t, {}), 
        // --
        // export
        // --
        void 0 !== n && null !== n && (n.exports = t);
      }();
    });
    n.include, n.include;
  }(), // == end of file gNumber_s
  function gRange_s() {
    let t = _starter_._pathResolve(e, "dwtools/abase/l1/gRange.s"), r = _starter_._pathResolve(e, "dwtools/abase/l1/"), n = _starter_._fileCreate(t, r, // == begin of file gRange_s
    function gRange_s_naked() {
      !function _gRange_s_() {
        "use strict";
        _global_, _global_.wTools;
        let e = _global_.wTools;
        Array.prototype.slice, Function.prototype.bind, Object.prototype.toString, Object.hasOwnProperty, 
        //
        Object.assign(e, {}), Object.assign(e, {}), 
        // --
        // export
        // --
        void 0 !== n && null !== n && (n.exports = e);
      }();
    });
    n.include, n.include;
  }(), // == end of file gRange_s
  function gRegexp_s() {
    let t = _starter_._pathResolve(e, "dwtools/abase/l1/gRegexp.s"), r = _starter_._pathResolve(e, "dwtools/abase/l1/"), n = _starter_._fileCreate(t, r, // == begin of file gRegexp_s
    function gRegexp_s_naked() {
      !function _gRegexp_s_() {
        "use strict";
        // --
        // regexp
        // --
        // function regexpIs( src )
        // {
        //   return _ObjectToString.call( src ) === '[object RegExp]';
        // }
        //
        // //
        //
        // function regexpObjectIs( src )
        // {
        //   if( !_.RegexpObject )
        //   return false;
        //   return src instanceof _.RegexpObject;
        // }
        //
        // //
        //
        // function regexpLike( src )
        // {
        //   if( _.regexpIs( src ) || _.strIs( src ) )
        //   return true;
        //   return false;
        // }
        //
        // //
        //
        // function regexpsLike( srcs )
        // {
        //   if( !_.arrayIs( srcs ) )
        //   return false;
        //   for( let s = 0 ; s < srcs.length ; s++ )
        //   if( !_.regexpLike( srcs[ s ] ) )
        //   return false;
        //   return true;
        // }
        //
        // //
        //
        // function regexpIdentical( src1,src2 )
        // {
        //   _.assert( arguments.length === 2, 'Expects exactly two arguments' );
        //
        //   if( !_.regexpIs( src1 ) || !_.regexpIs( src2 ) )
        //   return false;
        //
        //   return src1.source === src2.source && src1.flags === src2.flags;
        // }
        //
        // //
        //
        // function _regexpTest( regexp, str )
        // {
        //   _.assert( arguments.length === 2 );
        //   _.assert( _.regexpLike( regexp ) );
        //   _.assert( _.strIs( str ) );
        //
        //   if( _.strIs( regexp ) )
        //   return regexp === str;
        //   else
        //   return regexp.test( str );
        //
        // }
        //
        // //
        //
        // function regexpTest( regexp, strs )
        // {
        //   _.assert( arguments.length === 2 );
        //   _.assert( _.regexpLike( regexp ) );
        //
        //   if( _.strIs( strs ) )
        //   return _._regexpTest( regexp, strs );
        //   else if( _.arrayLike( strs ) )
        //   return strs.map( ( str ) => _._regexpTest( regexp, str ) )
        //   else _.assert( 0 );
        //
        // }
        //
        // //
        //
        // function regexpTestAll( regexp, strs )
        // {
        //   _.assert( arguments.length === 2 );
        //   _.assert( _.regexpLike( regexp ) );
        //
        //   if( _.strIs( strs ) )
        //   return _._regexpTest( regexp, strs );
        //   else if( _.arrayLike( strs ) )
        //   return strs.every( ( str ) => _._regexpTest( regexp, str ) )
        //   else _.assert( 0 );
        //
        // }
        //
        // //
        //
        // function regexpTestAny( regexp, strs )
        // {
        //   _.assert( arguments.length === 2 );
        //   _.assert( _.regexpLike( regexp ) );
        //
        //   if( _.strIs( strs ) )
        //   return _._regexpTest( regexp, strs );
        //   else if( _.arrayLike( strs ) )
        //   return strs.some( ( str ) => _._regexpTest( regexp, str ) )
        //   else _.assert( 0 );
        //
        // }
        //
        // //
        //
        // function regexpTestNone( regexp, strs )
        // {
        //   _.assert( arguments.length === 2 );
        //   _.assert( _.regexpLike( regexp ) );
        //
        //   if( _.strIs( strs ) )
        //   return !_._regexpTest( regexp, strs );
        //   else if( _.arrayLike( strs ) )
        //   return !strs.some( ( str ) => _._regexpTest( regexp, str ) )
        //   else _.assert( 0 );
        //
        // }
        //
        // //
        //
        // function regexpsTestAll( regexps, strs )
        // {
        //   _.assert( arguments.length === 2 );
        //
        //   if( !_.arrayIs( regexps ) )
        //   return _.regexpTestAll( regexps, strs );
        //
        //   _.assert( _.regexpsLike( regexps ) );
        //
        //   return regexps.every( ( regexp ) => _.regexpTestAll( regexp, strs ) );
        // }
        //
        // //
        //
        // function regexpsTestAny( regexps, strs )
        // {
        //   _.assert( arguments.length === 2 );
        //
        //   if( !_.arrayIs( regexps ) )
        //   return _.regexpTestAny( regexps, strs );
        //
        //   _.assert( _.regexpsLike( regexps ) );
        //
        //   return regexps.some( ( regexp ) => _.regexpTestAny( regexp, strs ) );
        // }
        //
        // //
        //
        // function regexpsTestNone( regexps, strs )
        // {
        //   _.assert( arguments.length === 2 );
        //
        //   if( !_.arrayIs( regexps ) )
        //   return _.regexpTestNone( regexps, strs );
        //
        //   _.assert( _.regexpsLike( regexps ) );
        //
        //   return regexps.every( ( regexp ) => _.regexpTestNone( regexp, strs ) );
        // }
        //
        /**
 * Escapes special characters with a slash ( \ ). Supports next set of characters : .*+?^=! :${}()|[]/\
 *
 * @example
 * wTools.regexpEscape( 'Hello. How are you?' ); // "Hello\. How are you\?"
 * @param {String} src Regexp string
 * @returns {String} Escaped string
 * @function regexpEscape
 * @memberof wTools
 */
        function regexpEscape(t) {
          return e.assert(e.strIs(t)), e.assert(1 === arguments.length, "Expects single argument"), 
          t.replace(/([.*+?^=!:${}()|\[\]\/\\])/g, "\\$1");
        }
        //
                //
        function regexpMaybeFrom(t) {
          e.objectIs(t) || (t = {
            srcStr: arguments[0]
          }), e.assert(1 === arguments.length, "Expects single argument"), e.assert(e.strIs(t.srcStr) || e.regexpIs(t.srcStr)), 
          e.routineOptions(regexpMaybeFrom, t);
          let r = t.srcStr;
          if (e.strIs(r)) {
            // let optionsExtract =
            // {
            //   prefix : '//',
            //   postfix : '//',
            //   src : result,
            // }
            // let strips = _.strExtractInlinedStereo( optionsExtract );
            if (t.stringWithRegexp) {
              let t = {
                delimeter: "//",
                src: r
              };
              e.strExtractInlined(t);
            }
            for (let r = 0; r < strips.length; r++) {
              let n = strips[r];
              r % 2 == 0 && (n = e.regexpEscape(n), t.toleratingSpaces && (n = n.replace(/\s+/g, "\\s*"))), 
              strips[r] = n;
            }
            r = RegExp(strips.join(""), t.flags);
          }
          return r;
        }
        //
        function regexpsSources(t) {
          e.arrayIs(arguments[0]) && ((t = Object.create(null)).sources = arguments[0]), 
          // o.sources = o.sources ? _.longSlice( o.sources ) : [];
          t.sources = e.longSlice(t.sources), void 0 === t.flags && (t.flags = null), e.assert(1 === arguments.length, "Expects single argument"), 
          e.routineOptions(regexpsSources, t);
          /* */
          for (let r = 0; r < t.sources.length; r++) {
            let n = t.sources[r];
            e.regexpIs(n) ? (t.sources[r] = n.source, e.assert(null === t.flags || n.flags === t.flags, () => "All RegExps should have flags field with the same value " + e.strQuote(n.flags) + " != " + e.strQuote(t.flags)), 
            null === t.flags && (t.flags = n.flags)) : t.escaping && (t.sources[r] = e.regexpEscape(n)), 
            e.assert(e.strIs(t.sources[r]));
          }
          /* */          return t;
        }
        //
        function regexpsJoin(t) {
          e.objectIs(t) || (t = {
            sources: t
          }), e.routineOptions(regexpsJoin, t), e.assert(1 === arguments.length, "Expects single argument");
          let r = t.sources[0];
          if (1 === (t = e.regexpsSources(t)).sources.length && e.regexpIs(r)) return r;
          let n = t.sources.join("");
          return new RegExp(n, t.flags || "");
        }
        //
        function regexpsJoinEscaping(t) {
          return e.objectIs(t) || (t = {
            sources: t
          }), e.routineOptions(regexpsJoinEscaping, t), e.assert(1 === arguments.length, "Expects single argument"), 
          e.assert(!!t.escaping), e.regexpsJoin(t);
        }
        //
        function regexpsAtLeastFirst(t) {
          e.objectIs(t) || (t = {
            sources: t
          }), e.routineOptions(regexpsAtLeastFirst, t), e.assert(1 === arguments.length, "Expects single argument");
          let r = t.sources[0];
          if (1 === (t = e.regexpsSources(t)).sources.length && e.regexpIs(r)) return r;
          let n = "", s = "", l = "";
          for (let e = 0; e < t.sources.length; e++) {
            let r = t.sources[e];
            0 === e ? s += r : (s = s + "(?:" + r, l = ")?" + l);
          }
          return new RegExp(n = s + l, t.flags || "");
        }
        //
        /**
 *  Generates "but" regular expression pattern. Accepts a list of words, which will be used in regexp.
 *  The result regexp matches the strings that do not contain any of those words.
 *
 * @example
 * wTools.regexpsNone( 'yellow', 'red', 'green' ); //   /^(?:(?!yellow|red|green).)+$/
 *
 * let options =
 * {
 *    but : [ 'yellow', 'red', 'green' ],
 *    atLeastOnce : false
 * };
 * wTools.regexpsNone(options); // /^(?:(?!yellow|red|green).)*$/
 *
 * @param {Object} [options] options for generate regexp. If this argument omitted then default options will be used
 * @param {String[]} [options.but=null] a list of words,from each will consist regexp
 * @param {boolean} [options.atLeastOne=true] indicates whether search matches at least once
 * @param {...String} [words] a list of words, from each will consist regexp. This arguments can be used instead
 * options object.
 * @returns {RegExp} Result regexp
 * @throws {Error} If passed arguments are not strings or options object.
 * @throws {Error} If options contains any different from 'but' or 'atLeastOnce' properties.
 * @function regexpsNone
 * @memberof wTools
 */
        function regexpsNone(t) {
          e.objectIs(t) || (t = {
            sources: t
          }), e.routineOptions(regexpsNone, t), e.assert(1 === arguments.length, "Expects single argument");
          /* ^(?:(?!(?:abc)).)+$ */
          let r = "^(?:(?!(?:";
          return r += (t = e.regexpsSources(t)).sources.join(")|(?:"), r += ")).)+$", new RegExp(r, t.flags || "");
        }
        //
        function regexpsAny(t) {
          if (e.objectIs(t) || (t = {
            sources: t
          }), e.routineOptions(regexpsAny, t), e.assert(1 === arguments.length, "Expects single argument"), 
          e.regexpIs(t.sources)) return e.assert(t.sources.flags === t.flags || null === t.flags), 
          t.sources;
          e.assert(!!t.sources);
          let r = t.sources[0];
          if (1 === (t = e.regexpsSources(t)).sources.length && e.regexpIs(r)) return r;
          let n = "(?:";
          return n += t.sources.join(")|(?:"), n += ")", new RegExp(n, t.flags || "");
        }
        //
        function regexpsAll(t) {
          if (e.objectIs(t) || (t = {
            sources: t
          }), e.routineOptions(regexpsAll, t), e.assert(1 === arguments.length, "Expects single argument"), 
          e.regexpIs(t.sources)) return e.assert(t.sources.flags === t.flags || null === t.flags), 
          t.sources;
          let r = t.sources[0];
          if (1 === (t = e.regexpsSources(t)).sources.length && e.regexpIs(r)) return r;
          let n = "";
          return t.sources.length > 0 && (t.sources.length > 1 && (n += "(?=", n += t.sources.slice(0, t.sources.length - 1).join(")(?="), 
          n += ")"), n += "(?:", n += t.sources[t.sources.length - 1], n += ")"), new RegExp(n, t.flags || "");
        }
        //
        /**
 * Wraps regexp(s) into array and returns it. If in `src` passed string - turn it into regexp
 *
 * @example
 * wTools.regexpArrayMake( ['red', 'white', /[a-z]/] ); // [ /red/, /white/, /[a-z]/ ]
 * @param {String[]|String} src - array of strings/regexps or single string/regexp
 * @returns {RegExp[]} Array of regexps
 * @throw {Error} if `src` in not string, regexp, or array
 * @function regexpArrayMake
 * @memberof wTools
 */
        function regexpArrayMake(t) {
          e.assert(e.regexpLike(t) || e.arrayLike(t), "Expects array/regexp/string, got " + e.strType(t));
          for (let r = (t = e.arrayFlatten([], e.arrayAs(t))).length - 1; r >= 0; r--) {
            let n = t[r];
            null !== n ? t[r] = e.regexpFrom(n) : t.splice(r, 1);
          }
          return t;
        }
        //
        /**
 * regexpArrayIndex() returns the index of the first regular expression that matches substring
  Otherwise, it returns -1.
 * @example
 *
   let str = "The RGB color model is an additive color model in which red, green, and blue light are added together in various ways to reproduce a broad array of colors";
   let regArr1 = [/white/, /green/, /blue/];
   wTools.regexpArrayIndex(regArr1, str); // 1

 * @param {RegExp[]} arr Array for regular expressions.
 * @param {String} ins String, inside which will be execute search
 * @returns {number} Index of first matching or -1.
 * @throws {Error} If first argument is not array.
 * @throws {Error} If second argument is not string.
 * @throws {Error} If element of array is not RegExp.
 * @function regexpArrayIndex
 * @memberof wTools
 */        _global_;
        let e = _global_.wTools, t = _global_.wTools;
        Array.prototype.indexOf, Array.prototype.lastIndexOf, Array.prototype.slice, Array.prototype.splice, 
        Function.prototype.bind, Object.prototype.toString, Object.hasOwnProperty, Object.propertyIsEnumerable, 
        Math.ceil, Math.floor, regexpMaybeFrom.defaults = {
          srcStr: null,
          stringWithRegexp: 1,
          toleratingSpaces: 1,
          flags: "g"
        }, regexpsSources.defaults = {
          sources: null,
          flags: null,
          escaping: 0
        }, regexpsJoin.defaults = {
          flags: null,
          sources: null,
          escaping: 0
        }, (regexpsJoinEscaping.defaults = Object.create(regexpsJoin.defaults)).escaping = 1, 
        regexpsAtLeastFirst.defaults = {
          flags: null,
          sources: null,
          escaping: 0
        }, regexpsAtLeastFirst.defaults = {
          flags: null,
          sources: null,
          escaping: 0
        }, regexpsNone.defaults = {
          flags: null,
          sources: null,
          escaping: 0
        }, regexpsAny.defaults = {
          flags: null,
          sources: null,
          escaping: 0
        }, regexpsAll.defaults = {
          flags: null,
          sources: null,
          escaping: 0
        };
        // --
        // fields
        // --
        let r = {
          // regexp
          regexpEscape: regexpEscape,
          regexpsEscape: e.routineVectorize_functor(regexpEscape),
          regexpArrayMake: regexpArrayMake,
          regexpFrom: 
          //
          /**
 * Make regexp from string.
 *
 * @example
 * wTools.regexpFrom( 'Hello. How are you?' ); // /Hello\. How are you\?/
 * @param {RegexpLike} src - string or regexp
 * @returns {String} Regexp
 * @throws {Error} Throw error with message 'unknown type of expression, expects regexp or string, but got' error
 if src not string-like ( string or regexp )
 * @function regexpFrom
 * @memberof wTools
 */
          function regexpFrom(t, r) {
            return e.assert(1 === arguments.length || 2 === arguments.length), e.assert(void 0 === r || e.strIs(r)), 
            e.regexpIs(t) ? t : (e.assert(e.strIs(t)), new RegExp(e.regexpEscape(t), r));
          },
          regexpMaybeFrom: regexpMaybeFrom,
          regexpsMaybeFrom: e.routineVectorize_functor({
            routine: regexpMaybeFrom,
            select: "srcStr"
          }),
          regexpsSources: regexpsSources,
          regexpsJoin: regexpsJoin,
          regexpsJoinEscaping: regexpsJoinEscaping,
          regexpsAtLeastFirst: regexpsAtLeastFirst,
          regexpsAtLeastFirstOnly: 
          //
          function regexpsAtLeastFirstOnly(t) {
            e.objectIs(t) || (t = {
              sources: t
            }), e.routineOptions(regexpsAtLeastFirst, t), e.assert(1 === arguments.length, "Expects single argument");
            let r = t.sources[0];
            if (1 === (t = e.regexpsSources(t)).sources.length && e.regexpIs(r)) return r;
            let n = "";
            if (1 === t.sources.length) n = t.sources[0]; else for (let e = 0; e < t.sources.length; e++) t.sources[e], 
            e < t.sources.length - 1 ? n += "(?:" + t.sources.slice(0, e + 1).join("") + "$)|" : n += "(?:" + t.sources.slice(0, e + 1).join("") + ")";
            return new RegExp(n, t.flags || "");
          },
          regexpsNone: regexpsNone,
          regexpsAny: regexpsAny,
          regexpsAll: regexpsAll,
          regexpArrayMake: regexpArrayMake,
          regexpArrayIndex: function regexpArrayIndex(t, r) {
            e.assert(e.arrayIs(t)), e.assert(e.strIs(r));
            for (let n = 0; n < t.length; n++) {
              let s = t[n];
              if (e.assert(e.regexpIs(s)), s.test(r)) return n;
            }
            return -1;
          }
          //
          /**
 * Checks if any regexp passed in `arr` is found in string `ins`
 * If match was found - returns match index
 * If no matches found and regexp array is not empty - returns false
 * If regexp array is empty - returns some default value passed in the `ifEmpty` input param
 *
 * @example
 * let str = "The RGB color model is an additive color model in which red, green, and blue light are added together in various ways to reproduce a broad array of colors";
 *
 * let regArr2 = [/yellow/, /blue/, /red/];
 * wTools.regexpArrayAny(regArr2, str, false); // 1
 *
 * let regArr3 = [/yellow/, /white/, /greey/]
 * wTools.regexpArrayAny(regArr3, str, false); // false
 * @param {String[]} arr Array of regular expressions strings
 * @param {String} ins - string that is tested by regular expressions passed in `arr` parameter
 * @param {*} none - Default return value if array is empty
 * @returns {*} Returns the first match index, false if input array of regexp was empty or default value otherwise
 * @thows {Error} If missed one of arguments
 * @function regexpArrayAny
 * @memberof wTools
 */ ,
          regexpArrayAny: function regexpArrayAny(t, r, n) {
            e.assert(e.arrayIs(t) || e.regexpIs(src)), e.assert(3 === arguments.length, "Expects exactly three arguments"), 
            t = e.arrayAs(t);
            for (let n = 0; n < t.length; n++) if (e.assert(e.routineIs(t[n].test)), t[n].test(r)) return n;
            return !t.length && n;
          }
          //
          /**
 * Checks if all regexps passed in `arr` are found in string `ins`
 * If any of regex was not found - returns match index
 * If regexp array is not empty and all regexps passed test - returns true
 * If regexp array is empty - returns some default value passed in the `ifEmpty` input param
 *
 * @example
 * let str = "The RGB color model is an additive color model in which red, green, and blue light are added together in various ways to reproduce a broad array of colors";
 *
 * let regArr1 = [/red/, /green/, /blue/];
 * wTools.regexpArrayAll(regArr1, str, false); // true
 *
 * let regArr2 = [/yellow/, /blue/, /red/];
 * wTools.regexpArrayAll(regArr2, str, false); // 0
 * @param {String[]} arr Array of regular expressions strings
 * @param {String} ins - string that is tested by regular expressions passed in `arr` parameter
 * @param {*} none - Default return value if array is empty
 * @returns {*} Returns the first match index, false if input array of regexp was empty or default value otherwise
 * @thows {Error} If missed one of arguments
 * @function regexpArrayAll
 * @memberof wTools
 */ ,
          regexpArrayAll: function regexpArrayAll(t, r, n) {
            e.assert(e.arrayIs(t) || e.regexpIs(src)), e.assert(3 === arguments.length, "Expects exactly three arguments"), 
            t = e.arrayAs(t);
            for (let e = 0; e < t.length; e++) if (!t[e].test(r)) return e;
            return !!t.length || n;
          }
          //
          ,
          regexpArrayNone: function regexpArrayNone(t, r, n) {
            e.assert(e.arrayIs(t) || e.regexpIs(src)), e.assert(3 === arguments.length, "Expects exactly three arguments"), 
            t = e.arrayAs(t);
            for (let n = 0; n < t.length; n++) if (e.assert(e.routineIs(t[n].test)), t[n].test(r)) return !1;
            return !!t.length || n;
          }
        };
        // --
        // routines
        // --
                //
        Object.assign(t, r), Object.assign(t, {}), 
        // --
        // export
        // --
        void 0 !== n && null !== n && (n.exports = t);
      }();
    });
    n.include, n.include;
  }(), // == end of file gRegexp_s
  function gRoutine_s() {
    let t = _starter_._pathResolve(e, "dwtools/abase/l1/gRoutine.s"), r = _starter_._pathResolve(e, "dwtools/abase/l1/"), n = _starter_._fileCreate(t, r, // == begin of file gRoutine_s
    function gRoutine_s_naked() {
      !function _gRoutine_s_() {
        "use strict";
        // --
        // routine
        // --
        function _routinesComposeWithSingleArgument_pre(t, r) {
          let n = e.routinesCompose.pre.call(this, t, r);
          return e.assert(1 === r.length), e.assert(2 === arguments.length, "Expects exactly two arguments"), 
          n;
        }
        //
                function routinesComposeReturningLast() {
          let t = e.routinesComposeReturningLast.pre(routinesComposeReturningLast, arguments);
          return e.routinesComposeReturningLast.body(t);
        }
        function routinesComposeAll() {
          let t = e.routinesComposeAll.pre(routinesComposeAll, arguments);
          return e.routinesComposeAll.body(t);
        }
        //
        function routinesComposeAllReturningLast() {
          let t = e.routinesComposeAllReturningLast.pre(routinesComposeAllReturningLast, arguments);
          return e.routinesComposeAllReturningLast.body(t);
        }
        //
        function routinesChain() {
          let t = e.routinesChain.pre(routinesChain, arguments);
          return e.routinesChain.body(t);
        }
        _global_;
        let e = _global_.wTools, t = _global_.wTools;
        var r;
        routinesComposeReturningLast.pre = e.routinesCompose.pre, routinesComposeReturningLast.body = e.routinesCompose.body, 
        routinesComposeReturningLast.defaults = Object.create(e.routinesCompose.defaults), 
        routinesComposeReturningLast.defaults.supervisor = e.compose.supervisor.returningLast, 
        routinesComposeAll.pre = _routinesComposeWithSingleArgument_pre, routinesComposeAll.body = e.routinesCompose.body, 
        (r = routinesComposeAll.defaults = Object.create(e.routinesCompose.defaults)).chainer = e.compose.chainer.composeAll, 
        r.supervisor = e.compose.supervisor.composeAll, e.assert(e.routineIs(e.compose.chainer.originalWithDont)), 
        e.assert(e.routineIs(e.compose.supervisor.composeAll)), routinesComposeAllReturningLast.pre = _routinesComposeWithSingleArgument_pre, 
        routinesComposeAllReturningLast.body = e.routinesCompose.body, (r = routinesComposeAllReturningLast.defaults = Object.create(e.routinesCompose.defaults)).chainer = e.compose.chainer.originalWithDont, 
        r.supervisor = e.compose.supervisor.returningLast, routinesChain.pre = _routinesComposeWithSingleArgument_pre, 
        routinesChain.body = e.routinesCompose.body, (r = routinesChain.defaults = Object.create(e.routinesCompose.defaults)).chainer = e.compose.chainer.chaining, 
        r.supervisor = e.compose.supervisor.chaining;
        // --
        // fields
        // --
        let s = {
          routinesComposeReturningLast: routinesComposeReturningLast,
          routinesComposeAll: routinesComposeAll,
          routinesComposeAllReturningLast: routinesComposeAllReturningLast,
          /* !!! */
          routinesChain: routinesChain,
          _equalizerFromMapper: 
          //
          function _equalizerFromMapper(t) {
            return void 0 === t && (t = function mapper(e, t) {
              return e === t;
            }), e.assert(0, "not tested"), e.assert(1 === arguments.length, "Expects single argument"), 
            e.assert(1 === t.length || 2 === t.length), 1 === t.length ? function equalizerFromMapper(e, r) {
              return t(e) === t(r);
            } : t;
          }
          //
          ,
          _comparatorFromEvaluator: function _comparatorFromEvaluator(t) {
            return void 0 === t && (t = function comparator(e, t) {
              return e - t;
            }), e.assert(1 === arguments.length, "Expects single argument"), e.assert(1 === t.length || 2 === t.length), 
            1 === t.length ? function comparatorFromEvaluator(e, r) {
              return t(e) - t(r);
            } : t;
          }
        };
        // --
        // routines
        // --
                //
        Object.assign(t, s), Object.assign(t, {}), 
        // --
        // export
        // --
        void 0 !== n && null !== n && (n.exports = t);
      }();
    });
    n.include, n.include;
  }(), // == end of file gRoutine_s
  function gString_s() {
    let t = _starter_._pathResolve(e, "dwtools/abase/l1/gString.s"), r = _starter_._pathResolve(e, "dwtools/abase/l1/"), n = _starter_._fileCreate(t, r, // == begin of file gString_s
    function gString_s_naked() {
      !function _gString_s_() {
        "use strict";
        // --
        // str
        // --
        function strIsolate_pre(t, r) {
          let n;
          return r.length > 1 ? n = {
            src: r[0],
            delimeter: r[1],
            times: r[2]
          } : (n = r[0], e.assert(1 === r.length, "Expects single argument")), e.routineOptions(t, n), 
          e.assert(1 === r.length || 2 === r.length || 3 === r.length), e.assert(2 === arguments.length, "Expects exactly two arguments"), 
          e.assert(e.strIs(n.src)), e.assert(e.strsLikeAll(n.delimeter)), e.assert(e.numberIs(n.times)), 
          n;
        }
        //
        /**
* @typedef {object} wTools.toStrInhalfOptions
* @property {string} [ o.src=null ] - Source string.
* @property {string | array} [ o.delimeter=' ' ] - Splitter of the string.
* @property {boolean} [ o.left=1 ] - Finds occurrence from begining of the string.
*/
        /**
 * Finds occurrence of delimeter( o.delimeter ) in source( o.src ) and splits string in finded position by half.
 * If function finds  more then one occurrence, it separates string in the position of the last.
 *
 * @param {wTools.toStrInhalfOptions} o - Contains data and options {@link wTools.toStrInhalfOptions}.
 * @returns {array} Returns array with separated parts of string( o.src ) or original string if nothing finded.
 *
 * @example
 * //returns [ 'sample', 'string' ]
 * _.strIsolate( { src : 'sample, string', delimeter : [ ',' ] } );
 *
 * @example
 * //returns [ 'sample', 'string' ]
 *_.strIsolate( { src : 'sample string', delimeter : ' ' } )
 *
 * @example
 * //returns [ 'sample string, name', 'string' ]
 * _.strIsolate( { src : 'sample string, name string', delimeter : [ ',', ' ' ] } )
 *
 * @method strIsolate
 * @throws { Exception } Throw an exception if no argument provided.
 * @throws { Exception } Throw an exception if( o ) is not a Map.
 * @throws { Exception } Throw an exception if( o.src ) is not a String.
 * @throws { Exception } Throw an exception if( o.delimeter ) is not a Array or String.
 * @throws { Exception } Throw an exception if( o ) is extended by uknown property.
 * @memberof wTools
 *
 */
        // function strIsolate( o )
        // {
        //   let result = [];
        //   let times = o.times;
        //   let delimeter
        //   let index = o.left ? -1 : o.src.length;
        //
        //   _.assertRoutineOptions( strIsolate, o );
        //   _.assert( arguments.length === 1, 'Expects single argument' );
        //   _.assert( _.strIs( o.src ), 'Expects string {-o.src-}, got', _.strType( o.src ) );
        //   _.assert( _.strIs( o.delimeter ) || _.arrayIs( o.delimeter ) );
        //   _.assert( _.numberIs( o.times ) );
        //
        //   /* */
        //
        //   if( !( times >= 1 ) )
        //   {
        //     return everything( o.left ^ o.none );
        //   }
        //
        //   if( _.arrayIs( o.delimeter ) && o.delimeter.length === 1 )
        //   o.delimeter = o.delimeter[ 0 ];
        //
        //   let closest = o.left ? strLeft : strRight;
        //
        //   /* */
        //
        //   while( times > 0 )
        //   {
        //
        //     index += o.left ? +1 : -1;
        //
        //     if( _.arrayIs( o.delimeter ) )
        //     {
        //
        //       if( !o.delimeter.length )
        //       {
        //         return everything( o.left ^ o.none );
        //       }
        //
        //       let c = closest( index );
        //
        //       delimeter = c.element;
        //       index = c.value;
        //
        //       if( o.times === 1 && index === o.src.length && o.left )
        //       index = -1;
        //
        //     }
        //     else
        //     {
        //
        //       delimeter = o.delimeter;
        //       index = o.left ? o.src.indexOf( delimeter, index ) : o.src.lastIndexOf( delimeter, index );
        //
        //       if( o.left && !( index >= 0 ) && o.times > 1 )
        //       {
        //         index = o.src.length;
        //         break;
        //       }
        //
        //     }
        //
        //     /* */
        //
        //     if( !o.left && times > 1 && index === 0  )
        //     {
        //       return everything( !o.none )
        //     }
        //
        //     if( !( index >= 0 ) && o.times === 1 )
        //     {
        //       return everything( o.left ^ o.none )
        //     }
        //
        //     times -= 1;
        //
        //   }
        //
        //   /* */
        //
        //   result.push( o.src.substring( 0, index ) );
        //   result.push( delimeter );
        //   result.push( o.src.substring( index + delimeter.length ) );
        //
        //   return result;
        //
        //   /* */
        //
        //   function everything( side )
        //   {
        //     return ( side ) ? [ o.src, '', '' ] : [ '', '', o.src ];
        //   }
        //
        //   /* */
        //
        //   function strLeft( index )
        //   {
        //     return _.entityMin( o.delimeter, function( a )
        //     {
        //       let i = o.src.indexOf( a, index );
        //       if( i === -1 )
        //       return o.src.length;
        //       return i;
        //     });
        //   }
        //
        //   /* */
        //
        //   function strRight( index )
        //   {
        //     return _.entityMax( o.delimeter, function( a )
        //     {
        //       let i = o.src.lastIndexOf( a, index );
        //       return i;
        //     });
        //   }
        //
        // }
        //
        // strIsolate.defaults =
        // {
        //   src : null,
        //   delimeter : ' ',
        //   quoting : null,
        //   left : 1,
        //   times : 1,
        //   none : 1,
        // }
                function strIsolate_body(t) {
          /* */
          function everything(e) {
            return e ? [ t.src, void 0, "" ] : [ "", void 0, t.src ];
          }
          /* */          let r = [], n = t.times, s = t.left ? 0 : t.src.length, l = t.left ? function strLeft(r) {
            return e._strLeftSingle(t.src, t.delimeter, r, void 0);
          }
          /* */ : function strRight(r) {
            return e._strRightSingle(t.src, t.delimeter, void 0, r);
          }, a = t.left ? 1 : -1;
          /* */
          for (e.assertRoutineOptions(strIsolate_body, arguments), 
          /* */
          e.arrayIs(t.delimeter) && 1 === t.delimeter.length && (t.delimeter = t.delimeter[0]); n > 0; ) {
            let e = l(s);
            if (void 0 === e.entry) break;
            if (n -= 1, s = t.left ? e.index + a : e.index + e.entry.length + a, 0 === n) return r.push(t.src.substring(0, e.index)), 
            r.push(e.entry), r.push(t.src.substring(e.index + e.entry.length)), r;
            /* */            if (t.left) {
              if (s >= t.src.length) break;
            } else if (s <= 0) break;
          }
          /* */          return r.length ? r : 0 === t.times ? everything(!t.left) : n === t.times ? everything(t.left ^ t.none) : everything(t.left);
        }
        //
        /**
 * Short-cut for strIsolate function.
 * Finds occurrence of delimeter( o.delimeter ) from begining of ( o.src ) and splits string in finded position by half.
 *
 * @param {wTools.toStrInhalfOptions} o - Contains data and options {@link wTools.toStrInhalfOptions}.
 * @returns {array} Returns array with separated parts of string( o.src ) or original string if nothing finded.
 *
 * @example
 * //returns [ 'sample', 'string' ]
 * _.strIsolateLeftOrNone( { src : 'sample, string', delimeter : [ ', ' ] } );
 *
 * @example
 * //returns [ 'sample', 'string' ]
 *_.strIsolateLeftOrNone( { src : 'sample string', delimeter : ' ' } )
 *
 * @example
 * //returns [ 'sample string, name', 'string' ]
 * _.strIsolateLeftOrNone( 'sample string, name string', ',' )
 *
 * @method strIsolateLeftOrNone
 * @throws { Exception } Throw an exception if no argument provided.
 * @throws { Exception } Throw an exception if( o ) is not a Map.
 * @throws { Exception } Throw an exception if( o.src ) is not a String.
 * @memberof wTools
 *
 */
        function strIsolateLeftOrNone_body(t) {
          return t.left = 1, t.none = 1, e.strIsolate.body(t);
        }
        //
        function strIsolateLeftOrAll_body(t) {
          return t.left = 1, t.none = 0, e.strIsolate.body(t);
        }
        //
        /**
 * Short-cut for strIsolate function.
 * Finds occurrence of delimeter( o.delimeter ) from end of ( o.src ) and splits string in finded position by half.
 *
 * @param {wTools.toStrInhalfOptions} o - Contains data and options {@link wTools.toStrInhalfOptions}.
 * @returns {array} Returns array with separated parts of string( o.src ) or original string if nothing finded.
 *
 * @example
 * //returns [ 'sample', 'string' ]
 * _.strIsolateRightOrNone( { src : 'sample, string', delimeter : [ ',' ] } );
 *
 * @example
 * //returns [ 'sample', 'string' ]
 *_.strIsolateRightOrNone( { src : 'sample string', delimeter : ' ' } )
 *
 * @method strIsolateRightOrNone
 * @throws { Exception } Throw an exception if no argument provided.
 * @throws { Exception } Throw an exception if( o ) is not a Map.
 * @throws { Exception } Throw an exception if( o.src ) is not a String.
 * @memberof wTools
 *
 */
        function strIsolateRightOrNone_body(t) {
          return t.left = 0, t.none = 1, e.strIsolate.body(t);
        }
        //
        function strIsolateRightOrAll_body(t) {
          return t.left = 0, t.none = 0, e.strIsolate.body(t);
        }
        _global_;
        let e = _global_.wTools, t = _global_.wTools;
        Array.prototype.slice, Function.prototype.bind, Object.prototype.toString, Object.hasOwnProperty, 
        strIsolate_body.defaults = {
          src: null,
          delimeter: " ",
          quoting: null,
          left: 1,
          times: 1,
          none: 1
        }, strIsolateLeftOrNone_body.defaults = {
          src: null,
          delimeter: " ",
          times: 1,
          quoting: null
        }, strIsolateLeftOrAll_body.defaults = {
          src: null,
          delimeter: " ",
          times: 1,
          quoting: null
        }, strIsolateRightOrNone_body.defaults = {
          src: null,
          delimeter: " ",
          times: 1,
          quoting: null
        }, strIsolateRightOrAll_body.defaults = {
          src: null,
          delimeter: " ",
          times: 1,
          quoting: null
        };
        // --
        // fields
        // --
        let r = {
          strIsolate: e.routineFromPreAndBody(strIsolate_pre, strIsolate_body),
          strIsolateLeftOrNone: e.routineFromPreAndBody(strIsolate_pre, strIsolateLeftOrNone_body),
          strIsolateLeftOrAll: e.routineFromPreAndBody(strIsolate_pre, strIsolateLeftOrAll_body),
          strIsolateRightOrNone: e.routineFromPreAndBody(strIsolate_pre, strIsolateRightOrNone_body),
          strIsolateRightOrAll: e.routineFromPreAndBody(strIsolate_pre, strIsolateRightOrAll_body),
          strIsolateInsideOrNoneSingle: 
          //
          /**
  * Returns part of a source string( src ) between first occurrence of( begin ) and last occurrence of( end ).
  * Returns result if ( begin ) and ( end ) exists in source( src ) and index of( end ) is bigger the index of( begin ).
  * Otherwise returns undefined.
  *
  * @param { String } src - The source string.
  * @param { String } begin - String to find from begin of source.
  * @param { String } end - String to find from end source.
  *
  * @example
  * _.strIsolateInsideOrNone( 'abcd', 'a', 'd' );
  * //returns 'bc'
  *
  * @example
  * _.strIsolateInsideOrNone( 'aabcc', 'a', 'c' );
  * //returns 'aabcc'
  *
  * @example
  * _.strIsolateInsideOrNone( 'aabcc', 'a', 'a' );
  * //returns 'a'
  *
  * @example
  * _.strIsolateInsideOrNone( 'abc', 'a', 'a' );
  * //returns undefined
  *
  * @example
  * _.strIsolateInsideOrNone( 'abcd', 'x', 'y' )
  * //returns undefined
  *
  * @example
  * //index of begin is bigger then index of end
  * _.strIsolateInsideOrNone( 'abcd', 'c', 'a' )
  * //returns undefined
  *
  * @returns { string } Returns part of source string between ( begin ) and ( end ) or undefined.
  * @throws { Exception } If all arguments are not strings;
  * @throws { Exception } If ( argumets.length ) is not equal 3.
  * @function strIsolateInsideOrNone
  * @memberof wTools
  */
          function strIsolateInsideOrNoneSingle(t, r, n) {
            e.assert(e.strIs(t), "Expects string {-src-}"), e.assert(3 === arguments.length, "Expects exactly three arguments");
            let s = e.strLeft(t, r);
            if (void 0 === s.entry) return;
            let l = e.strRight(t, n);
            return void 0 === l.entry || l.index < s.index + s.entry.length ? void 0 : [ t.substring(0, s.index), s.entry, t.substring(s.index + s.entry.length, l.index), l.entry, t.substring(l.index + l.entry.length, t.length) ];
          }
          //
          ,
          strIsolateInsideOrNone: function strIsolateInsideOrNone(t, r, n) {
            if (e.assert(3 === arguments.length, "Expects exactly three arguments"), e.arrayLike(t)) {
              let s = [];
              for (let l = 0; l < t.length; l++) s[l] = e.strIsolateInsideOrNoneSingle(t[l], r, n);
              return s;
            }
            return e.strIsolateInsideOrNoneSingle(t, r, n);
          }
          //
          ,
          strIsolateInsideOrAllSignle: function strIsolateInsideOrAllSignle(t, r, n) {
            e.assert(e.strIs(t), "Expects string {-src-}"), e.assert(3 === arguments.length, "Expects exactly three arguments");
            let s = e.strLeft(t, r);
            void 0 === s.entry && (s = {
              entry: "",
              index: 0
            });
            let l = e.strRight(t, n);
            return void 0 === l.entry && (l = {
              entry: "",
              index: t.length
            }), l.index < s.index + s.entry.length && (l.index = t.length, l.entry = ""), [ t.substring(0, s.index), s.entry, t.substring(s.index + s.entry.length, l.index), l.entry, t.substring(l.index + l.entry.length, t.length) ];
          }
          //
          ,
          strIsolateInsideOrAll: function strIsolateInsideOrAll(t, r, n) {
            if (e.assert(3 === arguments.length, "Expects exactly three arguments"), e.arrayLike(t)) {
              let s = [];
              for (let l = 0; l < t.length; l++) s[l] = e.strIsolateInsideOrAllSignle(t[l], r, n);
              return s;
            }
            return e.strIsolateInsideOrAllSignle(t, r, n);
          }
        };
        // --
        // routines
        // --
                //
        Object.assign(t, r), Object.assign(t, {}), 
        // --
        // export
        // --
        void 0 !== n && null !== n && (n.exports = t);
      }();
    });
    n.include, n.include;
  }(), // == end of file gString_s
  function gTime_s() {
    let t = _starter_._pathResolve(e, "dwtools/abase/l1/gTime.s"), r = _starter_._pathResolve(e, "dwtools/abase/l1/"), n = _starter_._fileCreate(t, r, // == begin of file gTime_s
    function gTime_s_naked() {
      !function _gTime_s_() {
        "use strict";
        //
        /**
 * Routine creates timer that executes provided routine( onReady ) after some amout of time( delay ).
 * Returns wConsequence instance. {@link module:Tools/base/Consequence.wConsequence wConsequence}
 *
 * If ( onReady ) is not provided, timeOut returns consequence that gives empty message after ( delay ).
 * If ( onReady ) is a routine, timeOut returns consequence that gives message with value returned or error throwed by ( onReady ).
 * If ( onReady ) is a consequence or routine that returns it, timeOut returns consequence and waits until consequence from ( onReady ) resolves the message, then
 * timeOut gives that resolved message throught own consequence.
 * If ( delay ) <= 0 timeOut performs all operations on nextTick in node
 * @see {@link https://nodejs.org/en/docs/guides/event-loop-timers-and-nexttick/#the-node-js-event-loop-timers-and-process-nexttick }
 * or after 1 ms delay in browser.
 * Returned consequence controls the timer. Timer can be easly stopped by giving an error from than consequence( see examples below ).
 * Important - Error that stops timer is returned back as regular message inside consequence returned by timeOut.
 * Also timeOut can run routine with different context and arguments( see example below ).
 *
 * @param {Number} delay - Delay in ms before ( onReady ) is fired.
 * @param {Function|wConsequence} onReady - Routine that will be executed with delay.
 *
 * @example
 * // Simplest, just timer
 * let t = _.timeOut( 1000 );
 * t.give( () => console.log( 'Message with 1000ms delay' ) )
 * console.log( 'Normal message' )
 *
 * @example
 * // Run routine with delay
 * let routine = () => console.log( 'Message with 1000ms delay' );
 * let t = _.timeOut( 1000, routine );
 * t.give( () => console.log( 'Routine finished work' ) );
 * console.log( 'Normal message' )
 *
 * @example
 * // Routine returns consequence
 * let routine = () => new _.Consequence().take( 'msg' );
 * let t = _.timeOut( 1000, routine );
 * t.give( ( err, got ) => console.log( 'Message from routine : ', got ) );
 * console.log( 'Normal message' )
 *
 * @example
 * // timeOut waits for long time routine
 * let routine = () => _.timeOut( 1500, () => 'work done' ) ;
 * let t = _.timeOut( 1000, routine );
 * t.give( ( err, got ) => console.log( 'Message from routine : ', got ) );
 * console.log( 'Normal message' )
 *
 * @example
 * // how to stop timer
 * let routine = () => console.log( 'This message never appears' );
 * let t = _.timeOut( 5000, routine );
 * t.error( 'stop' );
 * t.give( ( err, got ) => console.log( 'Error returned as regular message : ', got ) );
 * console.log( 'Normal message' )
 *
 * @example
 * // running routine with different context and arguments
 * function routine( y )
 * {
 *   let self = this;
 *   return self.x * y;
 * }
 * let context = { x : 5 };
 * let arguments = [ 6 ];
 * let t = _.timeOut( 100, context, routine, arguments );
 * t.give( ( err, got ) => console.log( 'Result of routine execution : ', got ) );
 *
 * @returns {wConsequence} Returns wConsequence instance that resolves message when work is done.
 * @throws {Error} If ( delay ) is not a Number.
 * @throws {Error} If ( onEnd ) is not a routine or wConsequence instance.
 * @function timeOut
 * @memberof wTools
 */
        function timeOut_pre(t, r) {
          let n;
          // debugger;
          if (e.assert(2 === arguments.length), e.assert(r), e.mapIs(r[0]) && 1 === r.length) n = r[0]; else {
            let t = r[0], s = r[1];
            if (void 0 === s || e.routineIs(s) || e.consequenceIs(s)) {
              if (e.routineIs(s) && !e.consequenceIs(s)) {
                let e = s;
                s = function timeOutEnd() {
                  let t = e.apply(this, arguments);
                  return void 0 === t ? null : t;
                };
              }
            } else {
              e.assert(2 === r.length, "Expects two arguments if second one is not callable");
              let t = s;
              s = function onEnd() {
                return t;
              };
            }
            e.assert(r.length <= 4), void 0 !== r[1] && void 0 === r[2] && void 0 === r[3] ? e.assert(e.routineIs(s) || e.consequenceIs(s)) : void 0 === r[2] && void 0 === r[3] || e.assert(e.routineIs(r[2])), 
            // if( args[ 2 ] !== undefined || args[ 3 ] !== undefined )
            // debugger;
            void 0 === r[2] && void 0 === r[3] || (s = e.routineJoin.call(e, r[1], r[2], r[3])), 
            n = {
              delay: t,
              onEnd: s
            };
          }
          // debugger;
                    return e.routineOptions(t, n), e.assert(e.numberIs(n.delay)), e.assert(null === n.onEnd || e.routineIs(n.onEnd)), 
          n;
        }
        //
                function timeOut_body(t) {
          let r = e.Consequence ? new e.Consequence() : void 0, n = null, l = !1;
          // if( o.delay > 0 )
          // timer = _.timeBegin( o.delay, timeEnd );
          // else
          // timeSoon( timeEnd );
          return e.assertRoutineOptions(timeOut_body, arguments), 
          /* */
          r && (
          // debugger;
          r.procedure("timeOut").sourcePath(t.stackLevel + 2), 
          // debugger;
          r.give(function timeGot(e, t) {
            e && clearTimeout(n), r.take(e, t);
          }))
          /* */ , n = e.timeBegin(t.delay, 
          /* */
          function timeEnd() {
            l = !0, r ? t.onEnd ? r.first(t.onEnd) : r.take(s) : t.onEnd();
          }), r;
        }
        //
        /**
 * Routine works moslty same like {@link wTools.timeOut} but has own small features:
 *  Is used to set execution time limit for async routines that can run forever or run too long.
 *  wConsequence instance returned by timeOutError always give an error:
 *  - Own 'timeOut' error message if ( onReady ) was not provided or it execution dont give any error.
 *  - Error throwed or returned in consequence by ( onRead ) routine.
 *
 * @param {Number} delay - Delay in ms before ( onReady ) is fired.
 * @param {Function|wConsequence} onReady - Routine that will be executed with delay.
 *
 * @example
 * // timeOut error after delay
 * let t = _.timeOutError( 1000 );
 * t.give( ( err, got ) => { throw err; } )
 *
 * @example
 * // using timeOutError with long time routine
 * let time = 5000;
 * let timeOut = time / 2;
 * function routine()
 * {
 *   return _.timeOut( time );
 * }
 * // orKeepingSplit waits until one of provided consequences will resolve the message.
 * // In our example single timeOutError consequence was added, so orKeepingSplit adds own context consequence to the queue.
 * // Consequence returned by 'routine' resolves message in 5000 ms, but timeOutError will do the same in 2500 ms and 'timeOut'.
 * routine()
 * .orKeepingSplit( _.timeOutError( timeOut ) )
 * .give( function( err, got )
 * {
 *   if( err )
 *   throw err;
 *   console.log( got );
 * })
 *
 * @returns {wConsequence} Returns wConsequence instance that resolves error message when work is done.
 * @throws {Error} If ( delay ) is not a Number.
 * @throws {Error} If ( onReady ) is not a routine or wConsequence instance.
 * @function timeOutError
 * @memberof wTools
 */
        function timeOutError_body(t) {
          e.assert(e.routineIs(e.Consequence)), e.assertRoutineOptions(timeOutError_body, arguments);
          let r = t.stackLevel;
          t.stackLevel += 1;
          let n = e.timeOut.body.call(e, t);
          return n.tag = "TimeOutError", n.procedure("timeOutError").sourcePath(r + 2), n.finally(function(t, r) {
            return t ? e.Consequence().error(t) : (t = e.err("Time out!"), Object.defineProperty(t, "timeOut", {
              enumerable: !1,
              configurable: !1,
              writable: !1,
              value: 1
            }), e.Consequence().error(t));
          }), n;
        }
        //
        function _timeNow_functor() {
          // _.assert( arguments.length === 0 );
          return "undefined" != typeof performance && void 0 !== performance.now ? e.routineJoin(performance, performance.now) : Date.now ? e.routineJoin(Date, Date.now) : function() {
            return Date().getTime();
          };
        }
        //
                _global_;
        let e = _global_.wTools, t = _global_.wTools, r = (Array.prototype.indexOf, Array.prototype.lastIndexOf, 
        Array.prototype.slice, Array.prototype.splice, Function.prototype.bind, Object.prototype.toString, 
        Object.hasOwnProperty, Object.propertyIsEnumerable, Math.ceil, Math.floor, Math.pow(2, 31) - 1);
        timeOut_body.defaults = {
          delay: null,
          onEnd: null,
          stackLevel: 1
        };
        let s = e.routineFromPreAndBody(timeOut_pre, timeOut_body), l = "undefined" == typeof process ? function(e) {
          return setTimeout(e, 0);
        } : process.nextTick;
        //
                timeOutError_body.defaults = Object.create(timeOut_body.defaults);
        let a = e.routineFromPreAndBody(timeOut_pre, timeOutError_body), i = {
          timeBegin: function timeBegin(t, n) {
            /* */
            function out() {
              n && n(s);
            }
            let s = null;
            return void 0 === t && (t = Infinity), t >= r && (t = r), e.assert(arguments.length <= 4), 
            e.assert(e.numberIs(t)), void 0 === arguments[2] && void 0 === arguments[3] || (n = e.routineJoin.call(e, arguments[1], arguments[2], arguments[3])), 
            s = t > 0 ? setTimeout(out, t) : l(out);
          }
          //
          ,
          timeEnd: function timeEnd(e) {
            return clearTimeout(e), e;
          }
          //
          ,
          timeReady: function timeReady(t) {
            e.assert(0 === arguments.length || 1 === arguments.length || 2 === arguments.length), 
            e.assert(e.numberIs(arguments[0]) || e.routineIs(arguments[0]) || void 0 === arguments[0]);
            let r = 0;
            if (e.numberIs(arguments[0]) && (r = arguments[0], t = arguments[1]), "undefined" != typeof window && "undefined" != typeof document && "complete" != document.readyState) {
              let n = e.Consequence ? new e.Consequence({
                tag: "timeReady"
              }) : null;
              return window.addEventListener("load", function handleReady() {
                if (e.Consequence) return e.timeOut(r, t).finally(n);
                t ? e.timeBegin(r, t) : e.assert(0);
              }), n;
            }
            if (e.Consequence) return e.timeOut(r, t);
            t ? e.timeBegin(r, t) : e.assert(0);
          }
          //
          ,
          timeReadyJoin: function timeReadyJoin(t, r, n) {
            let s = e.routineJoin(t, r, n);
            return function _timeReady() {
              let t = arguments, r = e.routineSeal(this, s, t);
              return e.timeReady(r);
            };
          }
          //
          ,
          timeOnce: function timeOnce(t, r, n) {
            let s, l = e.Consequence ? new e.Consequence() : void 0, a = !1;
            return e.objectIs(t) ? (s = t, e.assert(1 === arguments.length, "Expects single argument"), 
            e.assertMapHasOnly(s, {
              delay: null,
              onBegin: null,
              onEnd: null
            }), t = s.delay, r = s.onBegin, n = s.onEnd) : e.assert(2 <= arguments.length && arguments.length <= 3), 
            e.assert(t >= 0), e.assert(e.primitiveIs(r) || e.routineIs(r) || e.objectIs(r)), 
            e.assert(e.primitiveIs(n) || e.routineIs(n) || e.objectIs(n)), function timeOnce() {
              if (!a) return a = !0, r && (e.routineIs(r) ? r.apply(this, arguments) : e.objectIs(r) && r.take(arguments), 
              l && l.take(null)), e.timeOut(t, function() {
                n && (e.routineIs(n) ? n.apply(this, arguments) : e.objectIs(n) && n.take(arguments), 
                l && l.take(null)), a = !1;
              }), l;
            };
          },
          timeOut: s,
          timeSoon: l,
          timeOutError: a,
          timePeriodic: 
          //
          function timePeriodic(t, r) {
            function handlePeriodicCon(e) {
              e && clearInterval(n);
            }
            e.assert(e.routineIs(e.Consequence));
            let n, s = new e.Consequence();
            e.assert(2 === arguments.length, "Expects exactly two arguments"), 
            // if( arguments.length > 2 )
            // {
            //   throw _.err( 'Not tested' );
            //   _.assert( arguments.length <= 4 );
            //   onReady = _.routineJoin( arguments[ 2 ], onReady[ 3 ], arguments[ 4 ] );
            // }
            e.assert(e.numberIs(t));
            let l = null;
            if (e.routineIs(r)) l = function() {
              !1 === r.call() && clearInterval(n), e.Consequence.take(s, void 0), s.finally(handlePeriodicCon);
            }; else if (r instanceof wConsquence) l = function() {
              !1 === r.ping() && clearInterval(n), e.Consequence.take(s, void 0), s.finally(handlePeriodicCon);
            }; else {
              if (void 0 !== r) throw e.err("unexpected type of onReady");
              l = function() {
                e.Consequence.take(s, void 0), s.finally(handlePeriodicCon);
              };
            }
            return n = setInterval(l, t), s;
          },
          /* dubious */
          _timeNow_functor: _timeNow_functor,
          timeNow: _timeNow_functor(),
          timeFewer_functor: function timeFewer_functor(t, r) {
            let n = e.timeNow() - t;
            return e.assert(2 === arguments.length), e.assert(e.numberIs(t)), e.assert(e.routineIs(r)), 
            function fewer() {
              let s = e.timeNow();
              if (!(s - n < t)) return n = s, r.apply(this, arguments);
            };
          }
          //
          ,
          timeFrom: function timeFrom(t) {
            return e.assert(1 === arguments.length), e.numberIs(t) ? t : e.dateIs(t) ? t.getTime() : void e.assert(0, "Not clear how to coerce to time", e.strType(t));
          }
          //
          ,
          timeSpent: function timeSpent(t, r) {
            let n = e.timeNow();
            return 1 === arguments.length && (r = arguments[0], t = ""), e.assert(1 <= arguments.length && arguments.length <= 2), 
            e.assert(e.numberIs(r)), e.assert(e.strIs(t)), t + e.timeSpentFormat(n - r);
          }
          //
          ,
          timeSpentFormat: function timeSpentFormat(t) {
            return e.timeNow(), e.assert(1 === arguments.length), e.assert(e.numberIs(t)), (.001 * t).toFixed(3) + "s";
          }
          //
          ,
          dateToStr: function dateToStr(e) {
            let t = e.getFullYear(), r = e.getMonth() + 1, n = e.getDate();
            return r < 10 && (r = "0" + r), n < 10 && (n = "0" + n), [ t, r, n ].join(".");
          }
          //
          // let _timeSleepBuffer = new Int32Array( new SharedArrayBuffer( 4 ) );
          // function timeSleep( time )
          // {
          //   _.assert( time >= 0 );
          //   Atomics.wait( _timeSleepBuffer, 0, 1, time );
          // }
          //
          // //
          //
          // function timeSleepUntil( o )
          // {
          //   if( _.routineIs( o ) )
          //   o = { onCondition : o }
          //
          //   if( o.periodicity === undefined )
          //   o.periodicity = timeSleepUntil.defaults.periodicity;
          //
          //   let i = 0;
          //   while( !o.onCondition() )
          //   {
          //     _.timeSleep( o.periodicity );
          //   }
          //
          //   return true;
          // }
          //
          // timeSleepUntil.defaults =
          // {
          //   onCondition : null,
          //   periodicity : 100,
          // }
          // --
          // fields
          // --
                };
        //
        Object.assign(t, i), Object.assign(t, {}), 
        // --
        // export
        // --
        void 0 !== n && null !== n && (n.exports = t);
      }();
    });
    n.include, n.include;
  }(), // == end of file gTime_s
  function rFundamental_s() {
    let t = _starter_._pathResolve(e, "dwtools/abase/l1/rFundamental.s"), r = _starter_._pathResolve(e, "dwtools/abase/l1/"), n = _starter_._fileCreate(t, r, // == begin of file rFundamental_s
    function rFundamental_s_naked() {
      // ( function _aFundamental_s_() {
      //
      // 'use strict';
      //
      // // fast access
      //
      // let _global = _global_;
      // let _ = _global_.wTools;
      // let Self = _global_.wTools;
      //
      // let _ArrayIndexOf = Array.prototype.indexOf;
      // let _ArrayLastIndexOf = Array.prototype.lastIndexOf;
      // let _ArraySlice = Array.prototype.slice;
      // let _ArraySplice = Array.prototype.splice;
      // let _FunctionBind = Function.prototype.bind;
      // let _ObjectToString = Object.prototype.toString;
      // let _ObjectHasOwnProperty = Object.hasOwnProperty;
      // let _propertyIsEumerable = Object.propertyIsEnumerable;
      // let _ceil = Math.ceil;
      // let _floor = Math.floor;
      //
      // // --
      // // meta
      // // --
      //
      // _.Later = function Later()
      // {
      //   let d = Object.create( null );
      //   d.args = arguments;
      //   _.Later._lates.push( d );
      //   return d;
      // }
      //
      // //
      //
      // _.Later.replace = function replace( container )
      // {
      //   if( arguments.length !== 1 || !container )
      //   throw Error( 'Expects single argument {-container-}' );
      //   if( !_.Later._lates.length )
      //   throw Error( 'No late was done' );
      //
      //   // debugger;
      //   let descriptors = _.Later._associatedMap.get( container ) || [];
      //   _.Later._associatedMap.set( container, descriptors );
      //   _.Later._lates.forEach( ( d ) =>
      //   {
      //     d.container = container;
      //     // _.Later._associatedLates.push( d );
      //     descriptors.push( d );
      //   });
      //   _.Later._lates = [];
      //   // debugger;
      //
      // }
      //
      // //
      //
      // _.Later.for = function for_( container )
      // {
      //   if( arguments.length !== 1 || !container )
      //   throw Error( 'Expects single argument {-container-}' );
      //
      //   let descriptors = _.Later._associatedMap.get( container );
      //   _.Later._associatedMap.delete( container );
      //
      //   if( !descriptors )
      //   throw Error( 'No laters for {-container-} was made' );
      //
      //   // debugger;
      //
      //   for( let k in container )
      //   {
      //     let d = container[ k ];
      //     let i = descriptors.indexOf( d );
      //     if( i !== -1 )
      //     {
      //       descriptors.splice( i,1 );
      //       _.Later._for( k,d );
      //     }
      //   }
      //
      //   // debugger;
      //
      //   if( descriptors.length )
      //   throw Error( 'Some laters was not found in the {-container-}' );
      //
      // }
      //
      // //
      //
      // _.Later._for = function _for( key, descriptor )
      // {
      //
      //   if( descriptor.args.length === 3 )
      //   if( !_.arrayIs( descriptor.args[ 2 ] ) )
      //   descriptor.args[ 2 ] = [ descriptor.args[ 2 ] ];
      //
      //   // debugger;
      //   descriptor.container[ key ] = _.routineCall.apply( _, descriptor.args );
      //   // debugger;
      //
      // }
      //
      // //
      //
      // _.Later._lates = [];
      // _.Later._associatedMap = new Map();
      //
      // // --
      // // fields
      // // --
      //
      // let Fields =
      // {
      // }
      //
      // // --
      // // routines
      // // --
      //
      // let Routines =
      // {
      //
      // }
      //
      // //
      //
      // Object.assign( Self, Routines );
      // Object.assign( Self, Fields );
      //
      // _.assert( !Self.Array );
      //
      // // _.assert( !Self.array );
      // // _.assert( !Self.withArray );
      // // _.assert( _.objectIs( _.strIsolateBeginOrAll ) )
      // // _.assert( _.objectIs( _.regexpsEscape ) );
      //
      // // _.Later.replace( Self );
      //
      // // --
      // // export
      // // --
      //
      // if( typeof module !== 'undefined' )
      // if( _global.WTOOLS_PRIVATE )
      // { /* delete require.cache[ module.id ]; */ }
      //
      // if( typeof module !== 'undefined' && module !== null )
      // module[ 'exports' ] = Self;
      //
      // })();
    });
    n.include, n.include;
  }(), // == end of file rFundamental_s
  function zSetup_s() {
    let t = _starter_._pathResolve(e, "dwtools/abase/l1/zSetup.s"), r = _starter_._pathResolve(e, "dwtools/abase/l1/"), n = _starter_._fileCreate(t, r, // == begin of file zSetup_s
    function zSetup_s_naked() {
      !function _zSetup_s_() {
        "use strict";
        let e = _global_, t = e.wTools, r = e.wTools, s = {
          _setupUnhandledErrorHandler1: 
          // --
          // setup
          // --
          function _setupUnhandledErrorHandler1() {
            /* */
            function handleError(e) {
              /* */
              try {
                if (t.errIsAttended(e)) return;
              } catch (e) {
                debugger;
                console.error(e);
              }
              /* */              if (t.appExitCode) try {
                t.appExitCode(-1);
              } catch (e) {
                debugger;
                console.log(e);
              }
              /* */              console.error("------------------------------- unhandled errorr -------------------------------\x3e\n");
              /* */
              try {
                console.error(" * Application"), console.error(t.diagnosticApplicationEntryPointInfo() + "\n");
              } catch (e) {
                debugger;
                console.error(e);
              }
              /* */              if (!e.originalMessage && t.objectLike && t.objectLike(e)) try {
                t.toStr && t.field && t.toStr.fields(e, {
                  errorAsMap: 1
                }), console.error(e);
              } catch (e) {
                debugger;
                console.error(e);
              }
              try {
                t.errLog ? t.errLog(e) : console.error(e);
              } catch (t) {
                debugger;
                console.error(t), console.error(e);
              }
              console.error("------------------------------- unhandled errorr -------------------------------<\n");
              debugger;
            }
            if (!e._setupUnhandledErrorHandlerDone) {
              debugger;
              throw Error("setup0 should be called first");
            }
            e._setupUnhandledErrorHandlerDone > 1 || (e._setupUnhandledErrorHandlerDone = 2, 
            /* */
            e.process && t.routineIs(e.process.on) ? r._handleUnhandledError1 = 
            /* */
            function handleNodeError(e) {
              return handleError(e);
            } : Object.hasOwnProperty.call(e, "onerror") && (r._handleUnhandledError1 = 
            /* */
            function handleBrowserError(e, r, n, s, l) {
              let a = l;
              return t._err && (a = t._err({
                args: [ l ],
                level: 1,
                fallBackStack: "at handleError @ " + r + ":" + n,
                location: {
                  path: r,
                  line: n,
                  col: s
                }
              })), handleError(a);
            }));
          }
          //
          ,
          _setupConfig: function _setupConfig() {
            // if( _global.WTOOLS_PRIVATE )
            // return;
            "real" === e.__GLOBAL_WHICH__ && (e.Config || (e.Config = Object.create(null)), 
            void 0 === e.Config.debug && (e.Config.debug = !0), e.Config.debug = !!e.Config.debug);
          }
          //
          ,
          _setupLoggerPlaceholder: function _setupLoggerPlaceholder() {
            e.console.debug || (e.console.debug = function debug() {
              this.log.apply(this, arguments);
            }), e.logger || (e.logger = {
              log: function log() {
                console.log.apply(console, arguments);
              },
              logUp: function logUp() {
                console.log.apply(console, arguments);
              },
              logDown: function logDown() {
                console.log.apply(console, arguments);
              },
              error: function error() {
                console.error.apply(console, arguments);
              },
              errorUp: function errorUp() {
                console.error.apply(console, arguments);
              },
              errorDown: function errorDown() {
                console.error.apply(console, arguments);
              }
            });
          }
          //
          ,
          _setupTesterPlaceholder: function _setupTesterPlaceholder() {
            e.wTestSuite || (e.wTestSuite = function wTestSuite(e) {
              return _realGlobal_.wTests || (_realGlobal_.wTests = Object.create(null)), e.suiteFilePath || (e.suiteFilePath = t.diagnosticLocation(1).path), 
              e.suiteFileLocation || (e.suiteFileLocation = t.diagnosticLocation(1).full), t.assert(t.strDefined(e.suiteFileLocation), "Test suit expects a mandatory option ( suiteFileLocation )"), 
              t.assert(t.objectIs(e)), e.abstract || t.assert(!_realGlobal_.wTests[e.name], 'Test suit with name "' + e.name + '" already registered!'), 
              _realGlobal_.wTests[e.name] = e, e.inherit = function inherit() {
                this.inherit = t.longSlice(arguments);
              }, e;
            }
            /* */), _realGlobal_.wTester || (_realGlobal_.wTester = Object.create(null), _realGlobal_.wTester.test = function test(e) {
              if (!t.workerIs()) {
                t.assert(0 === arguments.length || 1 === arguments.length), t.assert(t.strIs(e) || void 0 === e, "test : expects string {-testSuitName-}");
                debugger;
                t.timeReady(function() {
                  debugger;
                  if (_realGlobal_.wTester.test === test) throw t.err("Cant wTesting.test, missing wTesting package");
                  _realGlobal_.wTester.test.call(_realGlobal_.wTester, e);
                });
              }
            });
          }
          //
          ,
          _setup1: function _setup1() {
            r._sourcePath = t.diagnosticStack([ 1, Infinity ]), t.assert(!1 !== e._WTOOLS_SETUP_EXPECTED_), 
            !1 !== e._WTOOLS_SETUP_EXPECTED_ && (t._setupConfig(), t._setupUnhandledErrorHandler1(), 
            t._setupLoggerPlaceholder(), t._setupTesterPlaceholder()), t.assert(!!r.timeNow);
          }
          // --
          // routines
          // --
                };
        Object.assign(r, s), r._setup1(), 
        // --
        // export
        // --
        void 0 !== n && null !== n && (n.exports = r);
      }();
    });
    n.include, n.include;
  }(), // == end of file zSetup_s
  function IncludeTools_s() {
    let t = _starter_._pathResolve(e, "dwtools/abase/l2/IncludeTools.s"), r = _starter_._pathResolve(e, "dwtools/abase/l2/"), n = r, s = _starter_._fileCreate(t, r, // == begin of file IncludeTools_s
    function IncludeTools_s_naked() {
      !function _IncludeTools_s_() {
        "use strict";
        //
                //
        function _usePathGlobally(e, t, r) {
          if (i.assert(3 === arguments.length, "Expects exactly three arguments"), i.assert(i.arrayIs(t)), 
          -1 === r.indexOf(e)) {
            o || (o = l("module"));
            for (let e = 0; e < t.length; e++) -1 === o.globalPaths.indexOf(t[e]) && o.globalPaths.push(t[e]);
            // [].push.apply( Module.globalPaths, paths );
            /* patch parents */            for (;e; ) _usePathGloballyChildren(e, t, r), e = e.parent;
          }
        }
        //
                function _usePathGloballyChildren(e, t, r) {
          if (i.assert(3 === arguments.length, "Expects exactly three arguments"), i.assert(i.arrayIs(t)), 
          -1 === r.indexOf(e)) {
            r.push(e);
            for (let r = 0; r < t.length; r++) -1 === e.paths.indexOf(t[r]) && e.paths.push(t[r]);
            // [].push.apply( _module.paths, paths );
            /* patch parents */            if (e.children) for (var n = 0; n < e.children.length; n++) _usePathGloballyChildren(e.children[n], t, r);
          }
        }
        //
                function _includeWithRequireAct(t) {
          /* console.log( '_includeWithRequireAct', '"' + src + '"' ); */
          if (i.assert(1 === arguments.length, "Expects single argument"), i.assert(i.strIs(t), "include expects string"), 
          void 0 === s) throw i.err('Cant include, no "require".');
          try {
            // if( _.strHas( src, 'Consequence' ) )
            // debugger;
            return e(t);
          } catch (e) {
            debugger;
            throw i.err(e, "\n", "Cant require", t);
          }
        }
        //
                function _includeAct(e) {
          var t, r;
          if (i.assert(1 === arguments.length, "Expects single argument"), i.assert(i.strIs(e)), 
          a.ModulesRegistry[e] && (t = a.ModulesRegistry[e]), !t) return _includeWithRequireAny(e);
          /* */          if (t.isIncluded && t.isIncluded()) return t.returned;
          if (t.include) r = _includeWithRequire(t.include); else {
            if (!t.includeAny) throw i.err("Handler does not has ( include ) neither ( includeAny ).\nCant use the handler to include file", e);
            i.assert(i.arrayIs(t.includeAny), "include handler expect an array ( includeAny ) if present"), 
            r = _includeWithRequireAny.apply(i, t.includeAny);
          }
          return t.returned = r, r;
        }
        //
                function _includeAnyAct(r) {
          i.assert(1 === arguments.length, "Expects single argument"), i.assert(i.longIs(r));
          for (
          /* */
          var n = [], s = 0; s < r.length; s++) {
            var l = r[s], o = a.ModulesRegistry[l];
            if (o) {
              if (o.isIncluded && o.isIncluded()) return o.returned;
              if (o.include) {
                n.push({
                  path: o.include,
                  handler: o
                });
                debugger;
              } else {
                if (!o.includeAny) throw i.err("Handler does not has ( include ) neither ( includeAny ).\nCant use the handler to include file", l);
                i.assert(i.arrayIs(o.includeAny), "include handler expect an array ( includeAny ) if present");
                for (var u = 0; u < o.includeAny.length; u++) n.push({
                  path: o.includeAny[u],
                  handler: o
                });
              }
            } else n.push({
              path: l
            });
          }
          /* */          for (var c = 0; c < n.length; c++) {
            if ("" !== (l = n[c].path)) try {
              l = e.resolve(l);
            } catch (e) {
              if (c !== n.length - 1 && !t) continue;
            }
            if (c === n.length - 1 && "" === l) return;
            var p = _includeWithRequireAct(l);
            return n[c].handler && (n[c].handler.returned = p), p;
          }
          /* */          debugger;
          throw i.err("Can include none of file", r);
        }
        //
                function _includeWithRequire(e) {
          if (1 !== arguments.length) return _includeWithRequire(arguments);
          if (i.longIs(e)) {
            var t = [];
            e = i.arrayFlatten([], e);
            for (var r = 0; r < e.length; r++) t[r] = _includeWithRequireAct(e[r]);
            return t;
          }
          return _includeWithRequireAct(e);
        }
        //
                //
        function _includeWithRequireAny(r) {
          for (var n = 0; n < arguments.length; n++) {
            var s;
            if ("" !== (r = arguments[n])) try {
              s = e.resolve(r);
              // src = resolved;
                        } catch (e) {
              if (n !== arguments.length - 1 && !t) continue;
            }
            if (n === arguments.length - 1 && "" === r) return;
            return _includeWithRequireAct(s || arguments[0]);
          }
          i.assert(0, "unexpected");
        }
        //
                var e, t = 0, r = _global_.wTools, a = _global_, i = _global_.wTools, o = (a = _global_, 
        null);
        void 0 !== l ? e = l : "undefined" != typeof importScripts ? e = importScripts : a._remoteRequire && (e = a._remoteRequire), 
        a.ModulesRegistry = a.ModulesRegistry || Object.create(null);
        // --
        // declare
        // --
        var u = {
          /* xxx qqq : comment out maybe !!! */
          usePath: 
          // _global.ModulesRegistry.ModulesRegistry =
          // {
          //   includeAny : [ '../../abase/l3/ModulesRegistry.s','l3/ModulesRegistry.s','wmodulesregistry' ],
          //   isIncluded : function(){ return Object.keys( _global.ModulesRegistry ).length > 3 },
          // }
          // --
          // routines
          // --
          function usePath(e) {
            i.assert(1 === arguments.length, "Expects single argument"), i.assert(i.strIs(e)), 
            i.path && i.path.refine && (e = i.path.refine(e)), void 0 !== s && s.paths && -1 === s.paths.indexOf(e) && s.paths.push(e);
          }
          //
          ,
          usePathGlobally: function usePathGlobally(e) {
            i.strIs(e) && (e = [ e ]), i.assert(1 === arguments.length, "Expects single argument"), 
            i.assert(i.arrayIs(e));
            debugger;
            if (i.path.nativize && i.path.refine) for (var t = 0; t < e.length; t++) e[t] = i.path.nativize(i.path.resolve(e[t])), 
            console.log("usePathGlobally", e[t]);
            return _usePathGlobally(s, e, []);
          },
          _usePathGlobally: _usePathGlobally,
          _usePathGloballyChildren: _usePathGloballyChildren,
          //
          _includeWithRequireAct: _includeWithRequireAct,
          _includeAct: _includeAct,
          _includeAnyAct: _includeAnyAct,
          _includeWithRequire: _includeWithRequire,
          include: function include(e) {
            if (1 !== arguments.length) return _includeAct(arguments);
            if (i.longIs(e)) {
              var t = [];
              e = i.arrayFlatten([], e);
              for (var r = 0; r < e.length; r++) t[r] = _includeAct(e[r]);
              return t;
            }
            return _includeAct(e);
          },
          _includeWithRequireAny: _includeWithRequireAny,
          includeAny: function includeAny() {
            return _includeAnyAct(arguments);
          }
          //
          ,
          isIncluded: function isIncluded(e) {
            var t;
            return a.ModulesRegistry[e] && (t = a.ModulesRegistry[e]), !!t && !!t.isIncluded && t.isIncluded();
          }
        };
        i.mapExtend(r, u), i.usePath && void 0 !== n && i.usePath(n + "/../.."), 
        // --
        // export
        // --
        void 0 !== s && null !== s && (s.exports = r);
      }();
    }), l = s.include;
    s.include;
  }(), // == end of file IncludeTools_s
  function ModulesRegistry_s() {
    let t = _starter_._pathResolve(e, "dwtools/abase/l2/ModulesRegistry.s"), r = _starter_._pathResolve(e, "dwtools/abase/l2/"), n = _starter_._fileCreate(t, r, // == begin of file ModulesRegistry_s
    function ModulesRegistry_s_naked() {
      !function _ModulesRegistry_s_() {
        "use strict";
        /**
 * @typedef {Object} ModulesRegistry - Map that contains info about modules, is uses by {@link wTools.include}.
 * @memberof wTools
 */
        // --
        // helper
        // --
        function includeAny(e, r) {
          return t.assert(2 === arguments.length), [ "../../" + e, e, r ];
        }
        // --
        // include map
        // --
        // base / l3
        // let wNameTools =
        // {
        //   includeAny : includeAny( 'abase/l3/NameTools.s', 'wNameTools' ),
        //   isIncluded : function(){ return !!_global.wTools && !!_global.wTools.idWithInt; },
        // }
                let e = _global_, t = e.wTools;
        Object.hasOwnProperty.call(e, "ModuleRegistry") || (e.ModulesRegistry = Object.create(null));
        let r = e.ModulesRegistry, s = (includeAny("abase/l3/Entity.s", "wentitybasic"), 
        {
          includeAny: includeAny("abase/l3/Looker.s", "wlooker"),
          isIncluded: function() {
            return !!e.wTools && !!e.wTools.look;
          }
        }), l = {
          includeAny: includeAny("abase/l3/Path.s", "wpathbasic"),
          isIncluded: function() {
            return !!e.wTools && !!e.wTools.path;
          }
        }, a = {
          includeAny: includeAny("abase/l3/RoutineFundamentals.s", "wroutinebasic"),
          isIncluded: function() {
            return !!e.wTools && !!e.wTools.exec;
          }
        }, i = {
          includeAny: includeAny("abase/l3/Proto.s", "wProto"),
          isIncluded: function() {
            return !!e.wTools && !!e.wTools.mixinDelcare;
          }
        }, o = {
          includeAny: includeAny("abase/l3/Stringer.s", "wstringer"),
          isIncluded: function() {
            return !!e.wTools && !!e.wTools.Stringer;
          }
        }, u = {
          // base / l3
          wLooker: s,
          wPathBasic: l,
          wRoutineBasic: a,
          wProto: i,
          // base / l4
          wReplicator: {
            includeAny: includeAny("abase/l4/Replicator.s", "wreplicator"),
            isIncluded: function() {
              return !!e.wTools && !!e.wTools.replicate;
            }
          },
          wLookerExtra: {
            includeAny: includeAny("abase/l4/LookerExtra.s", "wlookerextra"),
            isIncluded: function() {
              return !!e.wTools && !!e.wTools.entitySearch;
            }
          },
          wArraySorted: {
            includeAny: includeAny("abase/l4/ArraySorted.s", "warraysorted"),
            isIncluded: function() {
              return !!e.wTools && !!e.wTools.sorted;
            }
          },
          wArraySparse: {
            includeAny: includeAny("abase/l4/ArraySparse.s", "warraysparse"),
            isIncluded: function() {
              return !!e.wTools && !!e.wTools.sparse;
            }
          },
          wAppBasic: {
            includeAny: includeAny("abase/l4/External.s", "wappbasic"),
            isIncluded: function() {
              return !!e.wTools && !!e.wTools.shell;
            }
          },
          wUriBasic: {
            includeAny: includeAny("abase/l4/Uri.s", "wuribasic"),
            isIncluded: function() {
              return !!e.wTools && !!e.wTools.uri;
            }
          },
          wTraverser: {
            includeAny: includeAny("abase/l4/Traverser.s", "wtraverser"),
            isIncluded: function() {
              return !!e.wTools && !!e.wTools._traverse;
            }
          },
          wStringer: o,
          wRoutineTransform: {
            includeAny: includeAny("abase/l4/RoutineTransform.s", "wroutinetransform"),
            isIncluded: function() {
              return !!e.wTools && !!e.wTools.routineNew;
            }
          },
          // base / l5
          wSelector: {
            includeAny: includeAny("abase/l5/Selector.s", "wselector"),
            isIncluded: function() {
              return !!e.wTools && !!e.wTools.select;
            }
          },
          wWebUriBasic: {
            includeAny: includeAny("abase/l5/WebUri.s", "wweburibasic"),
            isIncluded: function() {
              return !!e.wTools && !!e.wTools.weburi;
            }
          },
          wCloner: {
            includeAny: includeAny("abase/l5/Cloner.s", "wcloner"),
            isIncluded: function() {
              return !!e.wTools && !!e.wTools._clone;
            }
          },
          wStringsExtra: {
            includeAny: includeAny("abase/l5/StringTools.s", "wstringsextra"),
            isIncluded: function() {
              return !!e.wTools && !!e.wTools.strSorterParse;
            }
          },
          // base / l6
          wEqualer: {
            includeAny: includeAny("abase/l6/LookerComparator.s", "wequaler"),
            isIncluded: function() {
              return !!e.wTools && !!e.wTools.entityIdentical;
            }
          },
          wSelectorExtra: {
            includeAny: includeAny("abase/l6/SelectorExtra.s", "wselectorextra"),
            isIncluded: function() {
              return !!e.wTools && !!e.wTools.entityProbe;
            }
          },
          // base / l7_mixin
          wConsequizer: {
            includeAny: includeAny("abase/l7_mixin/Consequizer.", "wconsequizer"),
            isIncluded: function() {
              return !!e.wTools && !!e.wTools.Consequizer;
            }
          },
          wCopyable: {
            includeAny: includeAny("abase/l7_mixin/Copyable.s", "wCopyable"),
            isIncluded: function() {
              return !!e.wTools && !!e.wTools.Copyable;
            }
          },
          wInstancing: {
            includeAny: includeAny("abase/l7_mixin/Instancing.s", "winstancing"),
            isIncluded: function() {
              return !!e.wTools && !!e.wTools.Instancing;
            }
          },
          wEventHandler: {
            includeAny: includeAny("abase/l7_mixin/EventHandler.s", "wEventHandler"),
            isIncluded: function() {
              return !!e.wTools && !!e.wTools.EventHandler;
            }
          },
          wFieldsStack: {
            includeAny: includeAny("abase/l7_mixin/FieldsStack.s", "wfieldsstack"),
            isIncluded: function() {
              return !!e.wTools && !!e.wTools.FieldsStack;
            }
          },
          // base / l8
          wProcedure: {
            includeAny: includeAny("abase/l8/Procedure.s", "wprocedure"),
            isIncluded: function() {
              return !!e.wTools && !!e.wTools.procedure;
            }
          },
          wGdfStrategy: {
            includeAny: includeAny("abase/l8/GdfConverter.s", "wgdfstrategy"),
            isIncluded: function() {
              return !!e.wTools && !!e.wTools.Gdf;
            }
          },
          wBaseEncoder: {
            includeAny: includeAny("abase/l4/Encoder.s", "wbaseencoder"),
            isIncluded: function() {
              return !!e.wTools && !!e.wTools.encode;
            }
          },
          // base / l9
          wLogger: {
            includeAny: includeAny("abase/l9/printer/top/Logger.s", "wLogger"),
            isIncluded: function() {
              return !!e.wTools && !!e.wTools.Logger;
            }
          },
          wPrinterToFile: {
            includeAny: includeAny("abase/l9/printer/top/ToFile.ss", "wloggertofile"),
            isIncluded: function() {
              return !!e.wTools && !!e.wTools.PrinterToFile;
            }
          },
          wPrinterToJs: {
            includeAny: includeAny("abase/l9/printer/top/ToJstructure.s", "wloggertojs"),
            isIncluded: function() {
              return !!e.wTools && !!e.wTools.PrinterToJs;
            }
          },
          wConsequence: {
            includeAny: includeAny("abase/l9/consequence/Consequence.s", "wConsequence"),
            isIncluded: function() {
              return !!e.wTools && !!e.wTools.Consequence;
            }
          },
          // base_dom
          wDomBaseLayer1: {
            includeAny: includeAny("abase_dom/l1/Common.js", "wdombaselayer1"),
            isIncluded: function() {
              return !!e.wTools && !!e.wTools._domBaselayer1Loaded;
            }
          },
          wDomBaseLayer3: {
            includeAny: includeAny("abase_dom/l3/Common.js", "wdombaselayer3"),
            isIncluded: function() {
              return !!e.wTools && !!e.wTools._domBaselayer3Loaded;
            }
          },
          wDomBaseLayer5: {
            includeAny: includeAny("abase_dom/l5/Common.js", "wdombasel5"),
            isIncluded: function() {
              return !!e.wTools && !!e.wTools._domBasel5Loaded;
            }
          },
          // mid
          wRegexpObject: {
            includeAny: includeAny("amid/bclass/RegexpObject.s", "wRegexpObject"),
            isIncluded: function() {
              return !!e.wTools && !!e.wTools.RegexpObject;
            }
          },
          wColor: {
            includeAny: includeAny("amid/color/Color.s", "wColor"),
            isIncluded: function() {
              return !!e.wTools && !!e.wTools.ColorMap;
            }
          },
          wColor256: {
            includeAny: includeAny("amid/color/Color256.s", "wColor256"),
            isIncluded: function() {
              return !!e.wTools && !!e.wTools.ColorMap && Object.keys(e.wTools.ColorMap).length > 100;
            }
          },
          wChangeTransactor: {
            includeAny: includeAny("amid/changes/ChangeTransactor.s", "wChangeTransactor"),
            isIncluded: function() {
              return !!e.wTools && !!e.wTools.ChangeTransactor;
            }
          },
          wVocabulary: {
            includeAny: includeAny("amid/bclass/Vocabulary.s", "wvocabulary"),
            isIncluded: function() {
              return !!e.wTools && !!e.wTools.Vocabulary;
            }
          },
          wCommandsAggregator: {
            includeAny: includeAny("amid/l7/Commands/CommandsAggregator.s", "wcommandsaggregator"),
            isIncluded: function() {
              return !!e.wTools && !!e.wTools.CommandsAggregator;
            }
          },
          wCommandsConfig: {
            includeAny: includeAny("amid/l7/commands/mixin/CommandsConfig.s", "wcommandsconfig"),
            isIncluded: function() {
              return !!e.wTools && !!e.wTools.CommandsConfig;
            }
          },
          wFiles: {
            includeAny: includeAny("amid/files/UseTop.s", "wFiles"),
            isIncluded: function() {
              return !!e.wTools && !!e.wTools.fileProvider;
            }
          },
          wFilesArchive: {
            includeAny: includeAny("amid/files/IncludeArchive.s", "wfilesarchive"),
            isIncluded: function() {
              return !!e.wTools && !!e.wTools.FilesArchive;
            }
          },
          wFilesEncoders: {
            includeAny: includeAny("amid/files/l1/EncodersExtended.s", "wfilesencoders"),
            isIncluded: function() {
              return !!e.wTools && !!e.wTools.FileReadEncoders && !!e.wTools.FileReadEncoders.yml;
            }
          },
          wFilesSvn: {
            includeAny: includeAny("amid/files/fprovider/pSvn.ss", "wFilesSvn"),
            isIncluded: function() {
              return !!e.wTools && !!e.wTools.fileProvider.Svn;
            }
          },
          wTimeMarker: {
            includeAny: includeAny("amid/amixin/TimeMarker.s", "wtimemarker"),
            isIncluded: function() {
              return !!e.wTools && !!e.wTools.TimeMarker;
            }
          },
          wVerbal: {
            includeAny: includeAny("amid/amixin/Verbal.s", "wverbal"),
            isIncluded: function() {
              return !!e.wTools && !!e.wTools.Verbal;
            }
          },
          wStateStorage: {
            includeAny: includeAny("amid/amixin/aStateStorage.s", "wstatestorage"),
            isIncluded: function() {
              return !!e.wTools && !!e.wTools.StateStorage;
            }
          },
          wStateSession: {
            includeAny: includeAny("amid/amixin/StateSession.s", "wstatesession"),
            isIncluded: function() {
              return !!e.wTools && !!e.wTools.StateSession;
            }
          },
          wStager: {
            includeAny: includeAny("amid/l3/stager/Stager.s", "wstager"),
            isIncluded: function() {
              return !!e.wTools && !!e.wTools.Stager;
            }
          },
          wFileExecutor: {
            includeAny: includeAny("amid/l7/executor/FileExecutor.s", "wFileExecutor"),
            isIncluded: function() {
              return !!e.wTools && !!e.wTools.wFileExecutor;
            }
          },
          wFileExecutorHtmlFormatters: {
            includeAny: includeAny("amid/l7/executor/HtmlFormatters.s", "wFileExecutorHtmlFormatters"),
            isIncluded: function() {
              return !!e.wTools && !!e.wTools.FileExecutorHtmlFormatters;
            }
          },
          wPathTranslator: {
            includeAny: includeAny("amid/l5_mapper/PathTranslator.s", "wpathtranslator"),
            isIncluded: function() {
              return !!e.wTools && !!e.wTools.PathTranslator;
            }
          },
          wNameMapper: {
            includeAny: includeAny("amid/l5_mapper/NameMapper.s", "wnamemapper"),
            isIncluded: function() {
              return !!e.wTools && !!e.wTools.NameMapper;
            }
          },
          wTemplateTreeResolver: {
            includeAny: includeAny("amid/l5_mapper/TemplateTreeAresolver.s", "wtemplatetreeresolver"),
            isIncluded: function() {
              return !!e.wTools && !!e.wTools.TemplateTreeResolver;
            }
          },
          wTemplateTreeEnvironment: {
            includeAny: includeAny("amid/l5_mapper/TemplateTreeEnvironment.s", "wtemplatetreeenvironment"),
            isIncluded: function() {
              return !!e.wTools && !!e.wTools.TemplateTreeEnvironment;
            }
          },
          wTemplateFileWriter: {
            includeAny: includeAny("amid/l5_mapper/TemplateFileWriter.s", "wtemplatefilewriter"),
            isIncluded: function() {
              return !!e.wTools && !!e.wTools.TemplateFileWriter;
            }
          },
          wGraph: {
            includeAny: includeAny("amid/agraph/UseTop.s", "wgraphbase"),
            isIncluded: function() {
              return !!e.wTools && !!e.wTools.graph;
            }
          },
          wGraphLive: {
            includeAny: includeAny("amid/agraph/UseLive.s", "wgraphlive"),
            isIncluded: function() {
              return !!e.wTools && !!e.wTools.LiveSystem;
            }
          },
          wSchema: {
            includeAny: includeAny("amid/schema/Top.s", "wSchema"),
            isIncluded: function() {
              return !!e.wTools && !!e.wTools.schema;
            }
          },
          wScriptLauncher: {
            includeAny: includeAny("amid/launcher/ScriptLauncher.s", "wscriptlauncher"),
            isIncluded: function() {
              return !!e.wTools && !!e.wTools.ScriptLauncher;
            }
          },
          wExchangePoint: {
            includeAny: includeAny("amid/exchangePoint/ExchangePoint.s", "wExchangePoint"),
            isIncluded: function() {
              return !!e.wTools && !!e.wTools.ExchangePoint;
            }
          },
          wCommunicator: {
            includeAny: includeAny("amid/communicator/Communicator.s", "wCommunicator"),
            isIncluded: function() {
              return !!e.wTools && !!e.wTools.Communicator;
            }
          },
          wIncubator: {
            includeAny: includeAny("amid/worker/Incubator.s", "wIncubator"),
            isIncluded: function() {
              return !!e.wTools && !!e.wTools.Incubator;
            }
          },
          wCollectionOfInstances: {
            includeAny: includeAny("amid/container/CollectionOfInstances.s", "wcollectionofinstances"),
            isIncluded: function() {
              return !!e.wTools && !!e.wTools.CollectionOfInstances;
            }
          },
          wStarterMaker: {
            includeAny: includeAny("amid/starter/StarterMaker.s", "wstartermaker"),
            isIncluded: function() {
              return !!e.wTools && !!e.wTools.StarterMaker;
            }
          },
          // amid / l5
          wBitmask: {
            includeAny: includeAny("amid/l5_mapper/Bitmask.s", "wBitmask"),
            isIncluded: function() {
              return !!e.wTools && !!e.wTools.Bitmask;
            }
          },
          // math
          wMathScalar: {
            includeAny: includeAny("amath/l1/Scalar.s", "wmathscalar"),
            isIncluded: function() {
              return !!e.wTools && !!e.wTools.clamp;
            }
          },
          wMathVector: {
            includeAny: includeAny("amath/l3_vector/Main.s", "wmathvector"),
            isIncluded: function() {
              return !!e.wTools && !!e.wTools.vector;
            }
          },
          wMathSpace: {
            includeAny: includeAny("amath/l5_space/Main.s", "wmathspace"),
            isIncluded: function() {
              return !!e.wTools && !!e.wTools.Space;
            }
          },
          wMathConcepts: {
            includeAny: includeAny("amath/l8/Concepts.ss", "wmathconcepts"),
            isIncluded: function() {
              return !!e.wTools && !!e.wTools.box;
            }
          },
          // top
          wTesting: {
            includeAny: includeAny("atop/tester/MainTop.s", "wTesting"),
            isIncluded: function() {
              return _realGlobal_.wTester && _realGlobal_.wTester._isReal_;
            }
          },
          wTranspilationStrategy: {
            includeAny: includeAny("atop/transpilationStrategy/MainBase.s", "wtranspilationstrategy"),
            isIncluded: function() {
              return !!e.wTools && !!e.wTools.TranspilationStrategy;
            }
          },
          wFilesOperationsDirector: {
            includeAny: includeAny("atop/files/OperationsDirector.s", "wfilesoperationsdirector"),
            isIncluded: function() {
              return !!e.wTools && !!e.wTools.FilesOperationsDirector;
            }
          },
          wFilesLinker: {
            includeAny: includeAny("atop/files/Linker.s", "wfileslinker"),
            isIncluded: function() {
              return !!e.wTools && !!e.wTools.FilesLinker;
            }
          },
          wBaker: {
            includeAny: includeAny("atop/baker/Baker.s", "wBaker"),
            isIncluded: function() {
              return !!e.wTools && !!e.wTools.Baker;
            }
          },
          wBakerWithFileExecutor: {
            includeAny: includeAny("atop/baker/BakerWithFileExecutor.s", "wBakerWithFileExecutor"),
            isIncluded: function() {
              return !!e.wTools && !!e.wTools.wBakerWithFileExecutor;
            }
          },
          wMaker: {
            includeAny: includeAny("atop/maker/Maker.s", "wMaker"),
            isIncluded: function() {
              return !!e.wTools && !!e.wTools.Maker;
            }
          },
          wServlet: {
            includeAny: includeAny("atop/servlet/Servlet.ss", "wServlet"),
            isIncluded: function() {
              return !!e.wTools && !!e.wTools.servlet;
            }
          }
        };
        Object.assign(r, u), 
        // --
        // export
        // --
        void 0 !== n && null !== n && (n.exports = r);
      }();
    });
    n.include, n.include;
  }(), // == end of file ModulesRegistry_s
  function NameTools_s() {
    let t = _starter_._pathResolve(e, "dwtools/abase/l2/NameTools.s"), r = _starter_._pathResolve(e, "dwtools/abase/l2/"), n = _starter_._fileCreate(t, r, // == begin of file NameTools_s
    function NameTools_s_naked() {
      !function _NameTools_s_() {
        "use strict";
        var e, t = _global_.wTools, r = (_global_, _global_.wTools), s = (Array.prototype.slice, 
        Function.prototype.bind, Object.prototype.toString, Object.hasOwnProperty, r.longSlice, 
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
            if (r.objectIs(e)) return e;
            if (r.strIs(e)) {
              var t = {};
              return t[e] = e, t;
            }
            r.assert(0, "nameFielded :", "Expects string or ");
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
            if (r.mapIs(e)) {
              var n = Object.keys(e);
              r.assert(1 === n.length), t.coded = n[0], t.raw = e[t.coded];
            } else r.strIs(e) ? (t.raw = e, t.coded = e) : r.symbolIs(e) ? (t.raw = e, t.coded = e) : r.assert(0, "nameUnfielded :", "Unknown arguments");
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
            for (var n in r.assert && r.assert(1 === arguments.length), r.assert && r.assert(r.objectIs(e)), 
            e) t[n] = n;
            return t;
          }
          // --
          // id
          // --
          ,
          /* experimental */
          // id
          idWithDate: function idWithDate(e, t, r) {
            var n = new Date();
            return e = e || "", t = t || "", r ? e + n.valueOf() + t : e + [ n.getFullYear(), n.getMonth() + 1, n.getDate(), n.getHours(), n.getMinutes(), n.getSeconds(), n.getMilliseconds(), Math.floor(65536 * Math.random()).toString(16) ].join("-") + t;
          }
          //
          ,
          idWithTime: function idWithTime(e, t) {
            var r = new Date();
            return e = e || "", t = t || "", e + [ String(r.getHours()) + String(r.getMinutes()) + String(r.getSeconds()), String(r.getMilliseconds()), Math.floor(65536 * Math.random()).toString(16) ].join("-") + t;
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
            return r.assert(0 === arguments.length), e += 1;
          })
        });
        r.mapExtend(t, s), 
        // --
        // export
        // --
        void 0 !== n && null !== n && (n.exports = t);
      }();
    });
    n.include, n.include;
  }(), // == end of file NameTools_s
  function StringTools_s() {
    let t = _starter_._pathResolve(e, "dwtools/abase/l2/StringTools.s"), r = _starter_._pathResolve(e, "dwtools/abase/l2/"), n = _starter_._fileCreate(t, r, // == begin of file StringTools_s
    function StringTools_s_naked() {
      !function _StringTools_s_() {
        "use strict";
        /*

= articles

- strIsolate* difference

*/
        //
                //
        function strHas(e, r) {
          return t.assert(2 === arguments.length, "Expects exactly two arguments"), t.assert(t.strIs(e)), 
          t.assert(t.strLike(r)), t.strIs(r) ? -1 !== e.indexOf(r) : r.test(e);
        }
        //
                //
        /**
 * Returns source string( src ) with limited number( limit ) of characters.
 * For example: src : 'string', limit : 4, result -> ''st'...'ng''.
 * Function can be called in two ways:
 * - First to pass only source string and limit;
 * - Second to pass all options map. Example: ( { src : 'string', limit : 4, wrap : 0, escaping : 0 } ).
 *
 * @param {string|object} o - String to parse or object with options.
 * @param {string} [ o.src=null ] - Source string.
 * @param {number} [ o.limit=40 ] - Limit of characters in output.
 * @param {string} [ o.wrap='\'' ] - String wrapper. Use zero or false to disable.
 * @param {string} [ o.escaping=1 ] - Escaping characters appears in output.
 * @returns {string} Returns simplified source string.
 *
 * @example
 * //returns ''st' ... 'ng''
 * _.strStrShort( 'string', 4 );
 *
 * @example
 * //returns ''s' ... 'ng''
 * _.strStrShort( 's\ntring', 4 );
 *
 * @example
 * //returns 'string'
 * _.strStrShort( 'string', 0 );
 *
 * @example
 * //returns ''st' ... 'ng''
 * _.strStrShort( { src : 'string', limit : 4, wrap : '\'' } );
 *
 * @example
 * //returns 'si ... le'
 *  _.strStrShort( { src : 'simple', limit : 4, wrap : 0 } );
 *
 * @example
 * //returns ''si' ... 'le''
 *  _.strStrShort( { src : 'si\x01mple', limit : 5, wrap : '\'' } );
 *
 * @example
 * //returns ''s\u0001' ... ' string''
 *  _.strStrShort( 's\x01t\x01ing string string', 14 );
 *
 * @method strStrShort
 * @throws { Exception } If no argument provided.
 * @throws { Exception } If( arguments.length ) is not equal 1 or 2.
 * @throws { Exception } If( o ) is extended with unknown property.
 * @throws { Exception } If( o.src ) is not a String.
 * @throws { Exception } If( o.limit ) is not a Number.
 * @throws { Exception } If( o.wrap ) is not a String.
 *
 * @memberof wTools
 *
 */
        function strStrShort(e) {
          t.assert(1 === arguments.length || 2 === arguments.length), 2 === arguments.length ? e = {
            src: arguments[0],
            limit: arguments[1]
          } : 1 === arguments.length && t.strIs(e) && (e = {
            src: arguments[0]
          }), t.routineOptions(strStrShort, e), t.assert(t.strIs(e.src)), t.assert(t.numberIs(e.limit));
          let r = e.src;
          if (r.length > e.limit && e.limit > 0) {
            let n = Math.ceil(e.limit / 2), s = e.limit - n, l = r.substr(0, n), a = r.slice(-s);
            if (e.escaping) {
              function check(e, r) {
                let n = t.strEscape(e);
                if (n.length > r) for (let s = e.length - 1; s >= 0 && !(n.length <= r); --s) n = n.slice(0, -t.strEscape(e[s]).length);
                return n;
              }
              l = check(l, n), a = check(a, s);
            }
            e.wrap && (t.assert(t.strIs(e.wrap)), l = e.wrap + l + e.wrap, a = e.wrap + a + e.wrap), 
            r = 1 === e.limit ? l : l + " ... " + a;
          } else e.escaping && (r = t.strEscape(r));
          return r;
        }
        //
        /**
 * Disables escaped characters in source string( src ).
 * Example: '\n' -> '\\n', '\u001b' -> '\\u001b' etc.
 * Returns string with disabled escaped characters, source string if nothing changed or  empty string if source is zero length.
 * @param {string} src - Source string.
 * @returns {string} Returns string with disabled escaped characters.
 *
 * @example
 * //returns '\nhello\u001bworld\n'
 * _.strEscape( '\nhello\u001bworld\n' );
 *
 * @example
 * //returns 'string'
 * _.strEscape( 'string' );
 *
 * @example
 * //returns 'str\''
 * _.strEscape( 'str\'' );
 *
 * @example
 * //returns ''
 * _.strEscape( '' );
 *
 * @method strEscape
 * @throw { Exception } If( src ) is not a String.
 * @memberof wTools
 *
 */
        function strEscape(e) {
          // 007f : ''
          // . . .
          // 009f : ''
          // 00ad : '­'
          // \' 	single quote 	byte 0x27 in ASCII encoding
          // \' 	double quote 	byte 0x22 in ASCII encoding
          // \\ 	backslash 	byte 0x5c in ASCII encoding
          // \b 	backspace 	byte 0x08 in ASCII encoding
          // \f 	form feed - new page 	byte 0x0c in ASCII encoding
          // \n 	line feed - new line 	byte 0x0a in ASCII encoding
          // \r 	carriage return 	byte 0x0d in ASCII encoding
          // \t 	horizontal tab 	byte 0x09 in ASCII encoding
          // \v 	vertical tab 	byte 0x0b in ASCII encoding
          // source : http://en.cppreference.com/w/cpp/language/escape
          // console.log( _.appMemoryUsageInfo(), o.src.length );
          // if( o.src.length === 111691 )
          // debugger;
          t.strIs(e) && (e = {
            src: e
          }), t.assert(t.strIs(e.src), "Expects string {-o.src-}, but got", t.strType(e.src)), 
          t.routineOptions(strEscape, e);
          let r = "", n = e.stringWrapper.charCodeAt(0);
          // let src = o.src.split( '' );
          // debugger;
                    for (let s = 0; s < e.src.length; s++) {
            // let c = o.src[ s ];
            // let c = src[ s ];
            // let code = c.charCodeAt( 0 );
            let l = e.src.charCodeAt(s);
            // if( o.stringWrapper === '`' && c === '$' )
                        if ("`" === e.stringWrapper && 36 /* $ */ === l) r += "\\$"; else if (e.stringWrapper && l === n) r += "\\" + e.stringWrapper; else if (127 <= l && l <= 159 || 173 /*|| code >= 65533*/ === l) 
            // result += _.strUnicodeEscape( c );
            r += t.strCodeUnicodeEscape(l); else switch (l) {
             case 92 /* '\\' */ :
              r += "\\\\";
              break;

             case 8 /* '\b' */ :
              r += "\\b";
              break;

             case 12 /* '\f' */ :
              r += "\\f";
              break;

             case 10 /* '\n' */ :
              r += "\\n";
              break;

             case 13 /* '\r' */ :
              r += "\\r";
              break;

             case 9 /* '\t' */ :
              r += "\\t";
              break;

             default:
              r += l < 32 ? t.strCodeUnicodeEscape(l) : String.fromCharCode(l);
            }
          }
          return r;
        }
        // --
        // stripper
        // --
        /**
 * Removes leading and trailing characters occurrences from source string( o.src ) finded by mask( o.stripper ).
 * If( o.stripper ) is not defined function removes leading and trailing whitespaces and escaped characters from( o.src ).
 * Function can be called in two ways:
 * - First to pass only source string and use default options;
 * - Second to pass map like ({ src : ' acb ', stripper : ' ' }).
 *
 * @param {string|object} o - Source string to parse or map with source( o.src ) and options.
 * @param {string} [ o.src=null ]- Source string to strip.
 * @param {string|array} [ o.stripper=' ' ]- Contains characters to remove.
 * @returns {string} Returns result of removement in a string.
 *
 * @example
 * //returns 'b'
 * _.strStrip( { src : 'aabaa', stripper : 'a' } );
 *
 * @example
 * //returns 'b'
 * _.strStrip( { src : 'xaabaax', stripper : [ 'a', 'x' ] } )
 *
 * @example
 * //returns 'b'
 * _.strStrip( { src : '   b  \n' } )
 *
 * @method strStrip
 * @throws { Exception } Throw an exception if( arguments.length ) is not equal 1.
 * @throws { Exception } Throw an exception if( o ) is not Map.
 * @throws { Exception } Throw an exception if( o.src ) is not a String.
 * @throws { Exception } Throw an exception if( o.stripper ) is not a String or Array.
 * @throws { Exception } Throw an exception if object( o ) has been extended by invalid property.
 * @memberof wTools
 *
 */
        function strStrip(e) {
          if ((t.strIs(e) || t.arrayIs(e)) && (e = {
            src: e
          }), t.routineOptions(strStrip, e), t.assert(1 === arguments.length, "Expects single argument"), 
          t.arrayIs(e.src)) {
            let r = [];
            for (let n = 0; n < e.src.length; n++) {
              let s = t.mapExtend(null, e);
              s.src = s.src[n], r[n] = strStrip(s);
            }
            return r;
          }
          if (t.assert(t.strIs(e.src), "Expects string or array o.src, got", t.strType(e.src)), 
          t.assert(t.strIs(e.stripper) || t.arrayIs(e.stripper) || t.regexpIs(e.stripper), "Expects string or array or regexp ( o.stripper )"), 
          t.strIs(e.stripper) || t.regexpIs(e.stripper)) {
            let r = e.stripper;
            return t.strIs(r) && (r = t.regexpEscape(r), r = new RegExp(r, "g")), e.src.replace(r, "");
          }
          {
            t.assert(t.arrayIs(e.stripper));
            for (let r of e.stripper) t.assert(t.strIs(r, "Expects string {-stripper[ * ]-}"));
            let r = 0;
            for (;r < e.src.length && -1 !== e.stripper.indexOf(e.src[r]); r++) ;
            let n = e.src.length - 1;
            for (;n >= 0 && -1 !== e.stripper.indexOf(e.src[n]); n--) ;
            return r >= n ? "" : e.src.substring(r, n + 1);
          }
        }
        //
        /**
 * Same as _.strStrip with one difference:
 * If( o.stripper ) is not defined, function removes only leading whitespaces and escaped characters from( o.src ).
 *
 * @example
 * //returns 'a '
 * _.strStripLeft( ' a ' )
 *
 * @method strStripLeft
 * @memberof wTools
 *
 */
        function strStripLeft(e) {
          return (t.strIs(e) || t.arrayIs(e)) && (e = {
            src: e
          }), t.routineOptions(strStripLeft, e), t.assert(1 === arguments.length, "Expects single argument"), 
          t.strStrip(e);
        }
        //
        /**
 * Same as _.strStrip with one difference:
 * If( o.stripper ) is not defined, function removes only trailing whitespaces and escaped characters from( o.src ).
 *
 * @example
 * //returns ' a'
 * _.strStripRight( ' a ' )
 *
 * @method strStripRight
 * @memberof wTools
 *
 */
        function strStripRight(e) {
          return (t.strIs(e) || t.arrayIs(e)) && (e = {
            src: e
          }), t.routineOptions(strStripRight, e), t.assert(1 === arguments.length, "Expects single argument"), 
          t.strStrip(e);
        }
        //
        function strSplitChunks(e) {
          /* - */
          function makeChunkStatic(e) {
            let i = Object.create(null);
            i.line = s, i.text = n.substring(0, e), i.index = a, i.kind = "static", r.chunks.push(i), 
            n = n.substring(e), s += t.strLinesCount(i.text) - 1, a += 1, 
            /* - */
            function colAccount(e) {
              let r = e.lastIndexOf("\n");
              -1 === r ? l += e.length : l = e.length - r, t.assert(l >= 0);
            }(i.text);
          }
          /* - */          function makeChunkDynamic() {
            let t = Object.create(null);
            return t.line = s, t.column = l, t.index = a, t.kind = "dynamic", t.prefix = n.match(e.prefix)[0], 
            t.code = n.substring(t.prefix.length, o), e.investigate && (t.lines = t.code.split("\n"), 
            t.tab = /^\s*/.exec(t.lines[t.lines.length - 1])[0])
            /* postfix */ , n = n.substring(t.prefix.length + t.code.length), t.postfix = n.match(e.postfix)[0], 
            n = n.substring(t.postfix.length), r.chunks.push(t), t;
          }
          let r = Object.create(null);
          r.chunks = [], 2 === arguments.length ? (e = arguments[1] || Object.create(null)).src = arguments[0] : (t.assert(1 === arguments.length, "Expects single argument"), 
          t.strIs(arguments[0]) && (e = {
            src: arguments[0]
          })), t.routineOptions(strSplitChunks, e), t.assert(t.strIs(e.src), "Expects string (-o.src-), but got", t.strType(e.src)), 
          t.regexpIs(e.prefix) || (e.prefix = RegExp(t.regexpEscape(e.prefix), "m")), t.regexpIs(e.postfix) || (e.postfix = RegExp(t.regexpEscape(e.postfix), "m"));
          let n = e.src, s = 0, l = 0, a = 0, i = -1, o = -1;
          /* */          do {
            /* break */
            if (
            /* begin */
            -1 === (i = n.search(e.prefix)) && (i = n.length)
            /* text chunk */ , i > 0 && makeChunkStatic(i), !n) {
              r.chunks.length || makeChunkStatic(0);
              break;
            }
            /* end */            if (-1 === (o = n.search(e.postfix))) return r.lines = n.split("\n").length, 
            r.error = t.err("Openning prefix", e.prefix, "of chunk #" + r.chunks.length, "at" + s, "line does not have closing tag :", e.postfix), 
            r;
            /* code chunk */            let l = makeChunkDynamic();
            /* wind */            a += 1, s += t.strLinesCount(l.prefix + l.code + l.postfix) - 1;
          } while (n);
          return r;
        }
        //
        function strSplitsCoupledGroup(e) {
          t.arrayIs(e) && (e = {
            splits: e
          }), (e = t.routineOptions(strSplitsCoupledGroup, e)).prefix = t.arrayAs(e.prefix), 
          e.postfix = t.arrayAs(e.postfix), t.assert(1 === arguments.length), t.assert(t.regexpsLike(e.prefix)), 
          t.assert(t.regexpsLike(e.postfix));
          let r = [];
          for (let n = 0; n < e.splits.length; n++) {
            let s = e.splits[n];
            if (t.regexpsTestAny(e.prefix, s)) r.push(n); else if (t.regexpsTestAny(e.postfix, s)) {
              if (0 === r.length && !e.allowingUncoupledPostfix) throw t.err(t.strQuote(s), "does not have complementing openning\n");
              if (0 === r.length) continue;
              let l = r.pop(), a = n - l;
              t.assert(a >= 0);
              let i = e.splits.splice(l, a + 1, null);
              e.splits[l] = i, n -= a;
            }
          }
          if (r.length && !e.allowingUncoupledPrefix) throw t.err(t.strQuote(r[r.length - 1]), "does not have complementing closing\n");
          return e.splits;
        }
        //
        function strSplitsUngroupedJoin(e) {
          /* */
          function join() {
            if (r + 1 < n) {
              let t = e.splits.slice(r + 1, n + 1).join("");
              e.splits.splice(r + 1, n + 1, t);
            }
            n = null;
          }
          t.arrayIs(e) && (e = {
            splits: e
          });
          let r = (e = t.routineOptions(strSplitsUngroupedJoin, e)).splits.length - 1, n = null;
          for (;r >= 0; ) {
            let s = e.splits[r];
            t.strIs(s) ? null === n && (n = r) : null !== n && join(), r -= 1;
          }
          return null !== n && join(), e.splits;
        }
        //
        function strSplitsQuotedRejoin_body(e) {
          /* quoting */
          if (t.assert(1 === arguments.length), t.assert(t.arrayIs(e.splits)), e.quoting) for (let r = 1; r < e.splits.length; r += 1) {
            let n, s = e.splits[r], l = e.quotingPrefixes.indexOf(s);
            if (l >= 0) {
              let t = e.quotingPostfixes[l];
              for (n = r + 2; n < e.splits.length; n += 1) if (e.splits[n] === t) {
                let t = 0, s = 0;
                e.inliningQuoting && (r -= 1, t += 1, n += 1, s += 1);
                let l = e.splits.splice(r, n - r + 1, null);
                e.preservingQuoting || (l.splice(t, 1), l.splice(l.length - 1 - s, 1)), l = l.join(""), 
                e.splits[r] = l, n = r;
                break;
              }
            }
            /* if complementing postfix not found */            if (n >= e.splits.length && !t.arrayHas(e.delimeter, s)) {
              let t = e.splits.splice(r, 2).join("");
              e.splits[r - 1] = e.splits[r - 1] + t;
            }
          }
          return e.splits;
        }
        //
        function strSplitsDropDelimeters_body(e) {
          /* stripping */
          if (t.assert(1 === arguments.length), t.assert(t.arrayIs(e.splits)), e.delimeter.some(e => t.regexpIs(e))) debugger;
          for (let r = e.splits.length - 1; r >= 0; r--) {
            let n = e.splits[r];
            t.regexpsTestAny(e.delimeter, n) && e.splits.splice(r, 1);
            // if( _.arrayHas( o.delimeter, split ) )
            // o.splits.splice( s, 1 );
            //
            // if( s % 2 === 1 )
            // o.splits.splice( s, 1 );
                    }
          return e.splits;
        }
        //
        function strSplitsStrip_body(e) {
          t.assert(1 === arguments.length), t.assert(t.arrayIs(e.splits));
          /* stripping */
          for (let r = 0; r < e.splits.length; r++) {
            let n = e.splits[r];
            e.stripping && (n = t.strStrip({
              src: n,
              stripper: e.stripping
            })), e.splits[r] = n;
          }
          return e.splits;
        }
        //
        function strSplitsDropEmpty_body(e) {
          t.assert(1 === arguments.length), t.assert(t.arrayIs(e.splits));
          /* stripping */
          for (let t = 0; t < e.splits.length; t++) e.splits[t] || (e.splits.splice(t, 1), 
          t -= 1);
          return e.splits;
        }
        // --
        //
        // --
        function strSplitFast_pre(e, r) {
          let n = r[0];
          return 2 === r.length ? n = {
            src: r[0],
            delimeter: r[1]
          } : t.strIs(r[0]) && (n = {
            src: r[0]
          }), t.routineOptions(e, n), t.assert(2 === arguments.length, "Expects exactly two arguments"), 
          t.assert(1 === r.length || 2 === r.length, "Expects one or two arguments"), t.assert(t.strIs(n.src)), 
          t.assert(t.objectIs(n)), n;
        }
        //
                function strSplitFast_body(e) {
          /* */
          function delimeterAdd(t) {
            e.preservingDelimeters && (e.preservingEmpty || t) && r.push(t);
          }
          /*  */          function ordinaryAdd(t) {
            (e.preservingEmpty || t) && r.push(t);
          }
          /* */          function closestWhich() {
            l = e.src.length, a = -1;
            for (let t = 0; t < e.delimeter.length; t++) n[t] < e.src.length && n[t] < l && (l = n[t], 
            a = t);
            o = u[a];
          }
          /* */          function delimeterNext(r, n) {
            t.assert(n <= e.src.length);
            let s, l = e.delimeter[r];
            if (t.strIs(l)) s = e.src.indexOf(l, n); else {
              let t = l.exec(e.src.substring(n));
              t && (s = t.index + n, u[r] = t[0]);
            }
            return -1 === s ? e.src.length : s;
          }
          let r, n, s, l, a, i, o;
          e.delimeter = t.arrayAs(e.delimeter);
          let u = e.delimeter.slice();
          /* */
          if (t.assert(1 === arguments.length), t.assert(t.arrayIs(e.delimeter)), t.assert(t.boolLike(e.preservingDelimeters)), 
          e.preservingDelimeters || 1 !== e.delimeter.length) {
            if (!e.delimeter.length) return r = [ e.src ];
            r = [], n = [], s = 0, l = 0, a = -1, i = !1;
            for (let r = 0; r < e.delimeter.length; r++) {
              let l = e.delimeter[r];
              t.regexpIs(l) ? (t.assert(!l.sticky), "" !== l.source && "()" !== l.source && "(?:)" !== l.source || (i = !0)) : 0 === l.length && (i = !0), 
              n[r] = delimeterNext(r, s);
            }
            // let delimeter;
                        do {
              if (closestWhich(), l === e.src.length) break;
              o.length || (s += 1), ordinaryAdd(e.src.substring(s, l)), (o.length > 0 || s < e.src.length) && delimeterAdd(o), 
              s = n[a] + (o.length ? o.length : 1);
              // debugger;
              for (let t = 0; t < e.delimeter.length; t++) n[t] < s && (n[t] = delimeterNext(t, s));
              // debugger;
                        } while (s < e.src.length);
            !o && i || ordinaryAdd(e.src.substring(s, e.src.length));
          } else r = e.src.split(e.delimeter[0]), e.preservingEmpty || (r = r.filter(e => e || !1));
          return r;
        }
        //
        function strSplit_body(e) {
          if (e.delimeter = t.arrayAs(e.delimeter), !e.stripping && !e.quoting && !e.onDelimeter) return t.strSplitFast.body(t.mapOnly(e, t.strSplitFast.defaults));
          /* */          t.assert(1 === arguments.length);
          /* */
          let r = t.mapOnly(e, t.strSplitFast.defaults);
          /* */
          return r.preservingEmpty = 1, r.preservingDelimeters = 1, e.quoting && (r.delimeter = t.arrayPrependArraysOnce([], [ e.quotingPrefixes, e.quotingPostfixes, r.delimeter ])), 
          e.splits = t.strSplitFast.body(r), e.quoting && t.strSplitsQuotedRejoin.body(e), 
          e.preservingDelimeters || t.strSplitsDropDelimeters.body(e), e.stripping && t.strSplitsStrip.body(e), 
          e.preservingEmpty || t.strSplitsDropEmpty.body(e), e.splits;
        }
        //
        function _strExtractInlined_body(e) {
          /* */
          function handleTriplet() {
            let a = r[l + 1], i = r[l + 2], o = r[l + 3];
            return e.onInlined && (i = e.onInlined(i, e, [ a, o ])), void 0 === i ? (t.assert(t.strIs(r[l + 4])), 
            r[l + 2] = r[l + 0] + r[l + 1] + r[l + 2], r.splice(l, 2), l -= 4, !1) : (n = s.length, 
            e.preservingDelimeters && void 0 !== a && (e.preservingEmpty || a) && s.push(a), 
            e.preservingInlined && void 0 !== i && (e.preservingEmpty || i) && s.push(i), e.preservingDelimeters && void 0 !== o && (e.preservingEmpty || o) && s.push(o), 
            !0);
          }
          /* */          function handleOrdinary() {
            let t = r[l + 0];
            e.onOrdinary && (t = e.onOrdinary(t, e)), e.preservingOrdinary && void 0 !== t && (e.preservingEmpty || t) && s.splice(n, 0, t), 
            n = s.length;
          }
          t.assert(1 === arguments.length, "Expects single options map"), null === e.delimeter && (e.delimeter = "#");
          let r = t.strSplit({
            src: e.src,
            delimeter: e.delimeter,
            stripping: e.stripping,
            quoting: e.quoting,
            preservingEmpty: 1,
            preservingDelimeters: 1
          });
          if (r.length <= 1) return e.preservingEmpty || "" === r[0] && r.splice(0, 1), r;
          /*
  first - for tracking index to insert ordinary text
  onInlined should be called first and
  if undefined returned escaped text shoud be treated as ordinary
  so tracking index to insert ordinary text ( in case not undefined returned ) required
  */          let n = 0, s = [], l = 0;
          for (;l < r.length; l += 4) r.length - l >= 4 ? handleTriplet() && handleOrdinary() : (r.length > l + 1 && (r[l] = r.slice(l, r.length).join(""), 
          r.splice(l + 1, r.length - l - 1)), handleOrdinary(), t.assert(l + 1 === r.length, "Openning delimeter", e.delimeter, "does not have closing"));
          return s;
        }
        //
        /**
 * Extracts words enclosed by prefix( o.prefix ) and postfix( o.postfix ) delimeters
 * Function can be called in two ways:
 * - First to pass only source string and use default options;
 * - Second to pass source string and options map like ( { prefix : '#', postfix : '#' } ) as function context.
 *
 * Returns result as array of strings.
 *
 * Function extracts words in two attempts:
 * First by splitting source string by ( o.prefix ).
 * Second by splitting each element of the result of first attempt by( o.postfix ).
 * If splitting by ( o.prefix ) gives only single element then second attempt is skipped, otherwise function
 * splits all elements except first by ( o.postfix ) into two halfs and calls provided ( o.onInlined ) function on first half.
 * If result of second splitting( by o.postfix ) is undefined function appends value of element from first splitting attempt
 * with ( o.prefix ) prepended to the last element of result array.
 *
 * @param {string} src - Source string.
 * @param {object} o - Options map.
 * @param {string} [ o.prefix = '#' ] - delimeter that marks begining of enclosed string
 * @param {string} [ o.postfix = '#' ] - delimeter that marks ending of enclosed string
 * @param {string} [ o.onInlined = null ] - function called on each splitted part of a source string
 * @returns {object} Returns an array of strings separated by( o.delimeter ).
 *
 * @example
 * _.strExtractInlinedStereo( '#abc#' );
 * //returns [ '', 'abc', '' ]
 *
 * @example
 * _.strExtractInlinedStereo.call( { prefix : '#', postfix : '$' }, '#abc$' );
 * //returns [ 'abc' ]
 *
 * @example
 * function onInlined( strip )
 * {
 *   if( strip.length )
 *   return strip.toUpperCase();
 * }
 * _.strExtractInlinedStereo.call( { postfix : '$', onInlined }, '#abc$' );
 * //returns [ 'ABC' ]
 *
 * @method strExtractInlinedStereo
 * @throws { Exception } Throw an exception if( arguments.length ) is not equal 1 or 2.
 * @throws { Exception } Throw an exception if( o.src ) is not a String.
 * @throws { Exception } Throw an exception if( o.delimeter ) is not a String or an Array.
 * @throws { Exception } Throw an exception if object( o ) has been extended by invalid property.
 * @memberof wTools
 *
 */
        // let strExtractInlinedStereo = _.routineFromPreAndBody( strSplitFast_pre, _strExtractInlinedStereo_body );
        function strExtractInlinedStereo(e) {
          t.strIs(e) && (e = {
            src: e
          }), t.assert(this === t), t.assert(t.strIs(e.src)), t.assert(t.objectIs(e)), t.assert(1 === arguments.length, "Expects single argument"), 
          t.routineOptions(strExtractInlinedStereo, e);
          let r = [], n = e.src.split(e.prefix);
          if (1 === n.length) return n;
          /* */          n[0] && r.push(n[0])
          /* */;
          for (let s = 1; s < n.length; s++) {
            let l = t.strIsolateLeftOrNone(n[s], e.postfix), a = e.onInlined ? e.onInlined(l[0]) : l[0];
            if (t.assert(3 === l.length), void 0 !== a) r.push(a), l[2] && r.push(l[2]); else {
              if (r.length) debugger; else debugger;
              r.length ? r[r.length - 1] += e.prefix + n[s] : r.push(e.prefix + n[s]);
            }
          }
          return r;
        }
        //
        /**
 * Splits string( srcStr ) into parts using array( maskArray ) as mask and returns them as array.
 * Mask( maskArray ) contains string(s) separated by marker( strUnjoin.any ). Mask must starts/ends with first/last letter from source
 * or can be replaced with marker( strUnjoin.any ). Position of( strUnjoin.any ) determines which part of source string will be splited:
 * - If( strUnjoin.any ) is before string it marks everything before that string. Example: ( [ _.strUnjoin.any, 'postfix' ] ).
 * - If( strUnjoin.any ) is after string it marks everything after that string. Example: ( [ 'prefix', _.strUnjoin.any ] ).
 * - If( strUnjoin.any ) is between two strings it marks everything between them. Example: ( [ 'prefix', _.strUnjoin.any, 'postfix' ] ).
 * - If( strUnjoin.any ) is before and after string it marks all except that string. Example: ( [ '_.strUnjoin.any', something, '_.strUnjoin.any' ] ).
 *
 * @param {string} srcStr - Source string.
 * @param {array} maskArray - Contains mask for source string.
 * @returns {array} Returns array with unjoined string part.
 *
 * @example
 * //returns [ 'prefix', '_something_', 'postfix' ]
 * _.strUnjoin( 'prefix_something_postfix', [ 'prefix', _.strUnjoin.any, 'postfix' ] );
 *
 * @example
 * //returns [ 'prefix_', 'something', '_', 'postfix' ]
 * _.strUnjoin( 'prefix_something_postfix', [ _.strUnjoin.any, 'something', _.strUnjoin.any, 'postfix' ] );
 *
 * @example
 * //returns [ 'prefix_something_', 'postfix' ]
 * _.strUnjoin( 'prefix_something_postfix', [ _.strUnjoin.any, 'postfix' ] );
 *
 * @example
 * //returns [ 'prefix', '_something_postfix' ]
 * _.strUnjoin( 'prefix_something_postfix', [ 'prefix', _.strUnjoin.any ] );
 *
 * @example
 * //returns [ 'prefi', 'x', '_something_', 'p', 'ostfix' ]
 * _.strUnjoin( 'prefix_something_postfix', [ _.strUnjoin.any, 'x', _.strUnjoin.any, 'p', _.strUnjoin.any ] );
 *
 * @method strUnjoin
 * @throws { Exception } If no arguments provided.
 * @throws { Exception } If( srcStr ) is not a String.
 * @throws { Exception } If( maskArray ) is not a Array.
 * @throws { Exception } If( maskArray ) value is not String or strUnjoin.any.
 * @memberof wTools
 *
 */
        function strUnjoin(e, r) {
          /**/
          function checkToken() {
            return -1 !== l && (t.assert(l <= s), n.push(e.substring(l, s)), l = -1, !0);
          }
          /**/          function checkMask(r) {
            if (t.assert(t.strIs(r) || r === strUnjoin.any, "Expects string or strUnjoin.any, got", t.strType(r)), 
            t.strIs(r)) {
              if (-1 === (s = e.indexOf(r, s))) return !1;
              if (-1 === l && 0 !== s) return !1;
              checkToken(), n.push(r), s += r.length;
            } else r === strUnjoin.any ? l = s : t.assert(0, "unexpected mask");
            return !0;
          }
          t.assert(2 === arguments.length, "Expects exactly two arguments"), t.assert(t.strIs(e)), 
          t.assert(t.arrayIs(r));
          let n = [], s = 0, l = -1;
          /**/
          for (let e = 0; e < r.length; e++) if (!checkMask(r[e])) return;
          if ((-1 === l || (s = e.length, checkToken())) && s === e.length) 
          /**/
          return n;
        }
        //
        // function strJoin_body( srcs, delimeter )
        function strJoin_body(e) {
          // let result = [ '' ];
          // let arrayEncountered = 0;
          let r;
          t.assertRoutineOptions(strJoin_body, arguments);
          let n = e.join || "";
          // debugger;
          if ((null === e.join || t.strIs(e.join)) && (e.join = 
          /* */
          function join(e, t, r) {
            return n && r > 0 ? e + n + t : e + t;
          }), !e.srcs.length) return [];
          /* */          for (let n = 0; n < e.srcs.length; n++) {
            let s = e.srcs[n];
            t.arrayIs(s) && (t.assert(void 0 === r || r === s.length, "All arrays should have the same length"), 
            r = s.length);
          }
          if (0 === r) return [];
          /* */          if (void 0 === r) {
            let r = "";
            for (let n = 0; n < e.srcs.length; n++) {
              let s = e.srcs[n], l = e.str(s);
              t.assert(t.strIs(l), () => "Expects primitive or array, but got " + t.strType(s)), 
              r = e.join(r, l, n);
            }
            return r;
          }
          /* */          {
            let n = [];
            for (let e = 0; e < r; e++) n[e] = "";
            for (let r = 0; r < e.srcs.length; r++) {
              let s = e.srcs[r];
              // _.assert( _.strIs( srcStr ) || _.arrayIs( src ), () => 'Expects primitive or array, but got ' + _.strType( src ) );
              // _.assert( _.strIs( src ) || _.numberIs( src ) || _.arrayIs( src ) );
                            if (t.arrayIs(s)) 
              // if( arrayEncountered === 0 )
              // for( let s = 1 ; s < src.length ; s++ )
              // result[ s ] = result[ 0 ];
              // _.assert( arrayLength === undefined || arrayLength === src.length, 'All arrays should have the same length' );
              // arrayLength = src.length;
              // arrayEncountered = 1;
              for (let t = 0; t < n.length; t++) n[t] = e.join(n[t], s[t], r); else {
                let l = e.str(s);
                t.assert(t.strIs(l), () => "Expects primitive or array, but got " + t.strType(s));
                for (let t = 0; t < n.length; t++) n[t] = e.join(n[t], l, r);
              }
            }
            return n;
          }
        }
        //
        function strConcat(e, r) {
          if (r = t.routineOptions(strConcat, r || Object.create(null)), t.assert(1 === arguments.length || 2 === arguments.length), 
          t.assert(this.strConcat === strConcat), r.optionsForToStr = t.mapSupplement(r.optionsForToStr, {
            stringWrapper: ""
          }, strConcat.defaults.optionsForToStr), t.routineIs(e)) return e();
          t.arrayLike(e) || (e = [ e ]);
          let n = "";
          if (!e.length) return n;
          /* */          let s = 1;
          for (let l = 0; l < e.length; l++) {
            let a = e[l];
            if (a = t.toStr(a, r.optionsForToStr), !s) {
              let e = a.trim().lastIndexOf(r.lineDelimter);
              -1 === e ? " " !== n[n.length - 1] && " " !== a[0] && (n += r.delimeter) : 0 !== e && (n += r.lineDelimter);
            }
            a.length && (s = a[a.length - 1] === r.lineDelimter), n += a;
          }
          /* */          
          /* */
          return (r.linePrefix || r.linePostfix) && (n = n.split(r.lineDelimter), n = r.linePrefix + n.join(r.linePostfix + r.lineDelimter + r.linePrefix) + r.linePostfix), 
          n;
        }
        //
        /**
 * Puts line counter before each line/element of provided source( o.src ).
 * If( o.src ) is a string, function splits it into array using new line as splitter, then puts line counter at the begining of each line( element ).
 * If( o.src ) is a array, function puts line counter at the begining of each line( element ).
 * Initial value of a counter can be changed by defining( o.first ) options( o ) property.
 * Can be called in two ways:
 * - First by passing all options in one object;
 * - Second by passing source only and using default value of( first ).
 *
 * @param { Object } o - options.
 * @param { String/Array } [ o.src=null ] - Source string or array of lines( not array of texts ).
 * With line we mean it does not have eol. Otherwise please join the array to let the routine to resplit the text,
 * like that: _.strLinesNumber( array.join( '\n' ) ).
 * @param { Number} [ o.first=1 ] - Sets initial value of a counter.
 * @returns { String } Returns string with line enumeration.
 *
 * @example
 * _.strLinesNumber( 'line' );
 * //returns '1 : line'
 *
 * @example
 * _.strLinesNumber( 'line1\nline2\nline3' );
 * //returns
 * // 1: line1
 * // 2: line2
 * // 3: line3
 *
 * @example
 * _.strLinesNumber( [ 'line', 'line', 'line' ] );
 * //returns
 * // 1: line1
 * // 2: line2
 * // 3: line3
 *
 * @example
 * _.strLinesNumber( { src:'line1\nline2\nline3', first : 2 } );
 * //returns
 * // 2: line1
 * // 3: line2
 * // 4: line3
 *
 * @method strLinesNumber
 * @throws { Exception } Throw an exception if no argument provided.
 * @throws { Exception } Throw an exception if( o.src ) is not a String or Array.
 * @memberof wTools
 */
        function strLinesNumber(e) {
          /* */
          if (t.objectIs(e) || (e = {
            src: arguments[0],
            first: arguments[1]
          }), t.routineOptions(strLinesNumber, e), t.assert(1 === arguments.length || 2 === arguments.length), 
          t.assert(t.strIs(e.src) || t.strsAreAll(e.src), "Expects string or strings {-o.src-}"), 
          null === e.first) if (null === e.firstChar) e.first = 1; else if (t.numberIs(e.firstChar)) {
            debugger;
            let r = t.arrayIs(e.src) ? e.src.join("\n") : e.src;
            e.first = t.strLinesCount(r.substring(0, e.firstChar + 1));
          }
          /* */          let r = t.strIs(e.src) ? e.src.split("\n") : e.src;
          /* */          if (e.onLine) for (let n = 0; n < r.length; n += 1) r[n] = e.onLine([ n + e.first, " : ", r[n] ], e), 
          void 0 === r[n] && (r.splice(n, 1), n -= 1), t.assert(t.strIs(r[n])); else for (let t = 0; t < r.length; t += 1) r[t] = t + e.first + " : " + r[t];
          return r.join("\n");
        }
        //
        // function strLinesAt( code, line, radius )
        // {
        //   _.assert( arguments.length === 3, 'Expects exactly three arguments' );
        //   _.assert( _.strIs( code ) || _.arrayIs( code ) );
        //   _.assert( _.numberIs( line ) );
        //
        //   if( radius === undefined )
        //   radius = 2;
        //
        //   debugger;
        //
        //   let lines = code.split( '\n' );
        //   let result = lines.slice( line-radius, line+radius-1 );
        //   result = _.strLinesNumber( result, line-radius+1 );
        //
        //   return result;
        // }
        //
        /**
 * Selects range( o.range ) of lines from source string( o.src ).
 * If( o.range ) is not specified and ( o.line ) is provided function uses it with ( o.selectMode ) option to generate new range.
 * If( o.range ) and ( o.line ) are both not provided function generates range by formula: [ 0, n + 1 ], where n: number of ( o.delimteter ) in source( o.src ).
 * Returns selected lines range as string or empty string if nothing selected.
 * Can be called in three ways:
 * - First by passing all parameters in one options object( o ) ;
 * - Second by passing source string( o.src ) and range( o.range ) as array or number;
 * - Third by passing source string( o.src ), range start and end position.
 *
 * @param {Object} o - Options.
 * @param {String} [ o.src=null ] - Source string.
 * @param {Array|Number} [ o.range=null ] - Sets range of lines to select from( o.src ) or single line number.
 * @param {Number} [ o.zero=1 ] - Sets base value for a line counter.
 * @param {Number} [ o.number=0 ] - If true, puts line counter before each line by using o.range[ 0 ] as initial value of a counter.
 * @param {String} [ o.delimteter='\n' ] - Sets new line character.
 * @param {String} [ o.line=null ] - Sets line number from which to start selecting, is used only if ( o.range ) is null.
 * @param {Number} [ o.numberOfLines=3 ] - Sets maximal number of lines to select, is used only if ( o.range ) is null and ( o.line ) option is specified.
 * @param {String} [ o.selectMode='center' ] - Determines in what way funtion must select lines, works only if ( o.range ) is null and ( o.line ) option is specified.
 * Possible values:
 * - 'center' - uses ( o.line ) index as center point and selects ( o.numberOfLines ) lines in both directions.
 * - 'begin' - selects ( o.numberOfLines ) lines from start point ( o.line ) in forward direction;
 * - 'end' - selects ( o.numberOfLines ) lines from start point ( o.line ) in backward direction.
 * @returns {string} Returns selected lines as new string or empty if nothing selected.
 *
 * @example
 * //selecting single line
 * _.strLinesSelect( 'a\nb\nc', 1 );
 * //returns 'a'
 *
 * @example
 * //selecting first two lines
 * _.strLinesSelect( 'a\nb\nc', [ 1, 3 ] );
 * //returns
 * 'a
 * b'
 *
 * @example
 * //selecting first two lines, second way
 * _.strLinesSelect( 'a\nb\nc', 1, 3 );
 * //returns
 * 'a
 * b'
 *
 * @example
 * //custom new line character
 * _.strLinesSelect({ src : 'a b c', range : [ 1, 3 ], delimteter : ' ' });
 * //returns 'a b'
 *
 * @example
 * //setting preferred number of lines to select, line option must be specified
 * _.strLinesSelect({ src : 'a\nb\nc', line : 2, numberOfLines : 1 });
 * //returns 'b'
 *
 * @example
 * //selecting 2 two next lines starting from second
 * _.strLinesSelect({ src : 'a\nb\nc', line : 2, numberOfLines : 2, selectMode : 'begin' });
 * //returns
 * 'b
 * c'
 *
 * @example
 * //selecting 2 two lines starting from second in backward direction
 * _.strLinesSelect({ src : 'a\nb\nc', line : 2, numberOfLines : 2, selectMode : 'end' });
 * //returns
 * 'a
 * b'
 *
 * @method strLinesSelect
 * @throws { Exception } Throw an exception if no argument provided.
 * @throws { Exception } Throw an exception if( o.src ) is not a String.
 * @throws { Exception } Throw an exception if( o.range ) is not a Array or Number.
 * @throws { Exception } Throw an exception if( o ) is extended by unknown property.
 * @memberof wTools
 */
        function strLinesSelect(e) {
          2 === arguments.length ? t.arrayIs(arguments[1]) ? e = {
            src: arguments[0],
            range: arguments[1]
          } : t.numberIs(arguments[1]) ? e = {
            src: arguments[0],
            range: [ arguments[1], arguments[1] + 1 ]
          } : t.assert(0, "unexpected argument", t.strType(range)) : 3 === arguments.length && (e = {
            src: arguments[0],
            range: [ arguments[1], arguments[2] ]
          }), t.assert(arguments.length <= 3), t.assert(t.strIs(e.src)), t.routineOptions(strLinesSelect, e), 
          /* range */
          e.range || (null !== e.line ? "center" === e.selectMode ? e.range = [ e.line - Math.ceil((e.numberOfLines + 1) / 2) + 1, e.line + Math.floor((e.numberOfLines - 1) / 2) + 1 ] : "begin" === e.selectMode ? e.range = [ e.line, e.line + e.numberOfLines ] : "end" === e.selectMode && (e.range = [ e.line - e.numberOfLines + 1, e.line + 1 ]) : e.range = [ 0, t.strCount(e.src, e.delimteter) + 1 ]), 
          t.assert(t.longIs(e.range));
          /* */
          let r = 0, n = e.zero;
          for (;n < e.range[0]; ) {
            if (-1 === (r = e.src.indexOf(e.delimteter, r))) return "";
            r += e.delimteter.length, n += 1;
          }
          /* */          let s = r - 1;
          for (;n < e.range[1]; ) {
            if (s += 1, -1 === (s = e.src.indexOf(e.delimteter, s))) {
              s = e.src.length;
              break;
            }
            n += 1;
          }
          /* */          let l = r < s ? e.src.substring(r, s) : "";
          /* number */          return e.number && (l = t.strLinesNumber(l, e.range[0])), 
          l;
        }
        //
        /**
 * Get the nearest ( o.numberOfLines ) lines to the range ( o.charsRange ) from source string( o.src ).
 * Returns object with two elements: .
 * Can be called in two ways:
 * - First by passing all parameters in one options object( o ) ;
 * - Second by passing source string( o.src ) and range( o.range ) as array or number;
 *
 * @param { Object } o - Options.
 * @param { String } [ o.src ] - Source string.
 * @param { Array|Number } [ o.range ] - Sets range of lines to select from( o.src ) or single line number.
 * @param { Number } [ o.numberOfLines ] - Sets number of lines to select.
 * @returns { Object } o - Returns object with Options with fields:
 * @returns { Array } [ o.splits ] - Array with three entries:
 * o.splits[ 0 ] and o.splits[ 2 ] contains a string with the nearest lines,
 * and o.splits[ 1 ] contains the substring corresponding to the range.
 * @returns { Array } [ o.spans ] - Array with indexes of begin and end of nearest lines.
 *
 * @example
 * //selecting single line
 * _.strLinesNearest
 * ({
 *   src : `\na\nbc\ndef\nghij\n\n`,
 *   charsRange : [ 2, 4 ],
 *   numberOfLines : 1,
 * });
 * //returns o.splits = [ 'a', '\nb', 'c' ];
 * //returns o.spans = [ 1, 2, 4, 5 ];
 *
 * @example
 * //selecting single line
 * _.strLinesNearest
 * ({
 *   src : `\na\nbc\ndef\nghij\n\n`,
 *   charsRange : 3,
 *   numberOfLines : 2,
 * });
 * //returns o.splits = [ 'a\n', 'b', 'c' ];
 * //returns o.spans = [ 1, 3, 4, 5 ];
 *
 * @method strLinesNearest
 * @throws { Exception } Throw an exception if no argument provided.
 * @throws { Exception } Throw an exception if( o.src ) is not a String.
 * @throws { Exception } Throw an exception if( o.charsRange ) is not a Array or Number.
 * @throws { Exception } Throw an exception if( o ) is extended by unknown property.
 * @memberof wTools
 */
        function strLinesNearest_pre(e, r) {
          let n = r[0];
          return void 0 !== r[1] && (n = {
            src: r[0],
            charsRange: r[1]
          }), t.routineOptions(e, n), t.numberIs(n.charsRange) && (n.charsRange = [ n.charsRange, n.charsRange + 1 ]), 
          t.assert(t.rangeIs(n.charsRange)), n;
        }
        //
                function strLinesNearest_body(e) {
          let t, r, n = Object.create(null);
          // let resultCharRange = [];
                    /* */
          if (n.splits = [], n.spans = [ e.charsRange[0], e.charsRange[0], e.charsRange[1], e.charsRange[1] ], 
          logger.log("Result", n), logger.log(), 0 === e.numberOfLines) 
          // result = [];
          return n.splits = [], n.splits[0] = "", n.splits[1] = e.src.substring(e.charsRange[0], e.charsRange[1]), 
          n.splits[2] = "", n;
          /* */          let s = Math.ceil((e.numberOfLines + 1) / 2);
          if ((r = s) > 0) {
            for (t = e.charsRange[0] - 1; t >= 0 && ("\n" === e.src[t] && (r -= 1), !(r <= 0)); t--) ;
            t += 1;
          }
          if (n.spans[0] = t, (r = e.numberOfLines + 1 - s) > 0) for (t = e.charsRange[1]; t < e.src.length && ("\n" === e.src[t] && (r -= 1), 
          !(r <= 0)); t++) ;
          // result.splits[ 0 ] = o.src.substring( resultCharRange[ 0 ], o.charsRange[ 0 ] );
          // result.splits[ 1 ] = o.src.substring( o.charsRange[ 0 ], o.charsRange[ 1 ] );
          // result.splits[ 2 ] = o.src.substring( o.charsRange[ 1 ], resultCharRange[ 1 ] );
          return n.spans[3] = t, 
          /* */
          n.splits[0] = e.src.substring(n.spans[0], n.spans[1]), n.splits[1] = e.src.substring(n.spans[1], n.spans[2]), 
          n.splits[2] = e.src.substring(n.spans[2], n.spans[3]), n;
        }
        //
        function strLinesNearestReport_body(e) {
          let r = Object.create(null);
          debugger;
          r.nearest = t.strLinesNearest.body(e).splits, 
          // result.linesRange = _.strLinesRangeWithCharRange.body( o );
          r.report = r.nearest.slice(), e.gray || (r.report[1] = t.color.strUnescape(t.color.strFormat(r.report[1], {
            fg: "yellow"
          }))), r.report = r.report.join(""), r.report = t.strLinesSplit(r.report), e.gray || (r.report = t.color.strEscape(r.report));
          let n = t.strLinesCount(e.src.substring(0, e.charsRange[0])) - 1;
          r.report = t.strLinesNumber({
            src: r.report,
            first: n,
            onLine: r => {
              return e.gray || (r[0] = t.color.strFormat(r[0], {
                fg: "bright black"
              }), r[1] = t.color.strFormat(r[1], {
                fg: "bright black"
              })), r.join("");
            }
          });
          debugger;
          return r;
        }
        //
        function strLinesRangeWithCharRange_body(e) {
          let r = e.src.substring(0, e.charsRange[0]), n = e.src.substring(e.charsRange[0], e.charsRange[1]), s = [];
          return s[0] = t.strLinesCount(r) - 1, s[1] = s[0] + t.strLinesCount(n), s;
        }
        let e = _global_.wTools, t = (_global_, _global_.wTools);
        Array.prototype.slice, Function.prototype.bind, Object.prototype.toString, Object.hasOwnProperty, 
        t.longSlice, t.strType, strStrShort.defaults = {
          src: null,
          limit: 40,
          wrap: "'",
          escaping: 1
        }, strEscape.defaults = {
          src: null,
          stringWrapper: "'"
        }, strStrip.defaults = {
          src: null,
          stripper: /^(\s|\n|\0)+|(\s|\n|\0)+$/gm
        }, strStripLeft.defaults = {
          stripper: /^(\s|\n|\0)+/gm
        }, strStripLeft.defaults.__proto__ = strStrip.defaults, strStripRight.defaults = {
          stripper: /(\s|\n|\0)+$/gm
        }, strStripRight.defaults.__proto__ = strStrip.defaults, strSplitChunks.defaults = {
          src: null,
          investigate: 1,
          prefix: "//>--\x3e//",
          postfix: "//<--<//"
        }, strSplitsCoupledGroup.defaults = {
          splits: null,
          prefix: '"',
          postfix: '"',
          allowingUncoupledPrefix: 0,
          allowingUncoupledPostfix: 0
        }, strSplitsUngroupedJoin.defaults = {
          splits: null
        }, strSplitsQuotedRejoin_body.defaults = {
          quoting: 1,
          quotingPrefixes: null,
          quotingPostfixes: null,
          preservingQuoting: 1,
          inliningQuoting: 1,
          splits: null,
          delimeter: null
        };
        //
        let r = t.routineFromPreAndBody(
        //
        function strSplitsQuotedRejoin_pre(e, r) {
          let n = r[0];
          return t.routineOptions(e, n), t.assert(2 === arguments.length, "Expects exactly two arguments"), 
          t.assert(1 === r.length, "Expects one or two arguments"), t.assert(t.objectIs(n)), 
          n.quoting && (t.boolLike(n.quoting) ? (n.quotingPrefixes || (n.quotingPrefixes = [ '"' ]), 
          n.quotingPostfixes || (n.quotingPostfixes = [ '"' ])) : t.strIs(n.quoting) || t.regexpIs(n.quoting) || t.arrayIs(n.quoting) ? (t.assert(!n.quotingPrefixes), 
          t.assert(!n.quotingPostfixes), n.quoting = t.arrayAs(n.quoting), n.quotingPrefixes = n.quoting, 
          n.quotingPostfixes = n.quoting, n.quoting = !0) : t.assert(0, "unexpected type of {-o.quoting-}"), 
          t.assert(n.quotingPrefixes.length === n.quotingPostfixes.length), t.assert(t.boolLike(n.quoting))), 
          n;
        }, strSplitsQuotedRejoin_body);
        // --
        //
        // --
                strSplitsDropDelimeters_body.defaults = {
          splits: null,
          delimeter: null
        };
        //
                let s = t.routineFromPreAndBody(function strSplitsDropDelimeters_pre(e, r) {
          let n = r[0];
          return t.routineOptions(e, n), t.strIs(n.delimeter) && (n.delimeter = [ n.delimeter ]), 
          t.assert(2 === arguments.length, "Expects exactly two arguments"), t.assert(1 === r.length), 
          t.assert(t.objectIs(n)), n;
        }, strSplitsDropDelimeters_body);
        // --
        //
        // --
                strSplitsStrip_body.defaults = {
          stripping: 1,
          splits: null
        };
        //
                let l = t.routineFromPreAndBody(function strSplitsStrip_pre(e, r) {
          let n = r[0];
          return t.routineOptions(e, n), n.stripping && t.boolLike(n.stripping) && (n.stripping = t.strStrip.defaults.stripper), 
          t.assert(2 === arguments.length, "Expects exactly two arguments"), t.assert(1 === r.length), 
          t.assert(t.objectIs(n)), t.assert(!n.stripping || t.strIs(n.stripping) || t.regexpIs(n.stripping)), 
          n;
        }, strSplitsStrip_body);
        // --
        //
        // --
                strSplitsDropEmpty_body.defaults = {
          splits: null
        };
        //
                let a = t.routineFromPreAndBody(function strSplitsDropEmpty_pre(e, r) {
          let n = r[0];
          return t.routineOptions(e, n), t.assert(2 === arguments.length, "Expects exactly two arguments"), 
          t.assert(1 === r.length), t.assert(t.objectIs(n)), n;
        }, strSplitsDropEmpty_body);
        strSplitFast_body.defaults = {
          src: null,
          delimeter: " ",
          preservingEmpty: 1,
          preservingDelimeters: 1
        };
        //
        /**
 * Divides source string( o.src ) into parts using delimeter provided by argument( o.delimeter ).
 * If( o.stripping ) is true - removes leading and trailing whitespace characters.
 * If( o.preservingEmpty ) is true - empty lines are saved in the result array.
 * If( o.preservingDelimeters ) is true - leaves word delimeters in result array, otherwise removes them.
 * Function can be called in two ways:
 * - First to pass only source string and use default options;
 * - Second to pass map like ( { src : 'a, b, c', delimeter : ', ', stripping : 1 } ).
 * Returns result as array of strings.
 *
 * @param {string|object} o - Source string to split or map with source( o.src ) and options.
 * @param {string} [ o.src=null ] - Source string.
 * @param {string|array} [ o.delimeter=' ' ] - Word divider in source string.
 * @param {boolean} [ o.preservingEmpty=false ] - Leaves empty strings in the result array.
 * @param {boolean} [ o.preservingDelimeters=false ] - Puts delimeters into result array in same order how they was in the source string.
 * @param {boolean} [ o.stripping=true ] - Removes leading and trailing whitespace characters occurrences from source string.
 * @returns {object} Returns an array of strings separated by( o.delimeter ).
 *
 * @example
 * //returns [ 'first', 'second', 'third' ]
 * _.strSplitFast( ' first second third ' );
 *
 * @example
 * //returns [ 'a', 'b', 'c', 'd' ]
 * _.strSplitFast( { src : 'a, b, c, d', delimeter : ', '  } );
 *
 * @example
 * //returns [ 'a', 'b', 'c', 'd' ]
 * _.strSplitFast( { src : 'a.b, c.d', delimeter : [ '.', ', ' ]  } );
 *
 * @example
 * //returns [ '    a', 'b', 'c', 'd   ' ]
   * _.strSplitFast( { src : '    a, b, c, d   ', delimeter : [ ', ' ], stripping : 0  } );
 *
 * @example
 * //returns [ 'a', ', ', 'b', ', ', 'c', ', ', 'd' ]
 * _.strSplitFast( { src : 'a, b, c, d', delimeter : [ ', ' ], preservingDelimeters : 1  } );
 *
 * @example
 * //returns [ 'a', '', 'b', '', 'c', '', 'd' ]
 * _.strSplitFast( { src : 'a ., b ., c ., d', delimeter : [ ', ', '.' ], preservingEmpty : 1  } );
 *
 * @method strSplitFast
 * @throws { Exception } Throw an exception if( arguments.length ) is not equal 1 or 2.
 * @throws { Exception } Throw an exception if( o.src ) is not a String.
 * @throws { Exception } Throw an exception if( o.delimeter ) is not a String or an Array.
 * @throws { Exception } Throw an exception if object( o ) has been extended by invalid property.
 * @memberof wTools
 *
 */        let i = t.routineFromPreAndBody(strSplitFast_pre, strSplitFast_body);
        t.assert(i.pre === strSplitFast_pre), t.assert(i.body === strSplitFast_body), t.assert(t.objectIs(i.defaults)), 
        (p = strSplit_body.defaults = Object.create(strSplitFast_body.defaults)).preservingEmpty = 1, 
        p.preservingDelimeters = 1, p.preservingQuoting = 1, p.inliningQuoting = 1, p.stripping = 1, 
        p.quoting = 1, p.quotingPrefixes = null, p.quotingPostfixes = null, p.onDelimeter = null, 
        p.onQuote = null;
        //
        /**
 * Divides source string( o.src ) into parts using delimeter provided by argument( o.delimeter ).
 * If( o.stripping ) is true - removes leading and trailing whitespace characters.
 * If( o.preservingEmpty ) is true - empty lines are saved in the result array.
 * If( o.preservingDelimeters ) is true - leaves word delimeters in result array, otherwise removes them.
 * Function can be called in two ways:
 * - First to pass only source string and use default options;
 * - Second to pass map like ( { src : 'a, b, c', delimeter : ', ', stripping : 1 } ).
 * Returns result as array of strings.
 *
 * @param {string|object} o - Source string to split or map with source( o.src ) and options.
 * @param {string} [ o.src=null ] - Source string.
 * @param {string|array} [ o.delimeter=' ' ] - Word divider in source string.
 * @param {boolean} [ o.preservingEmpty=false ] - Leaves empty strings in the result array.
 * @param {boolean} [ o.preservingDelimeters=false ] - Puts delimeters into result array in same order how they was in the source string.
 * @param {boolean} [ o.stripping=true ] - Removes leading and trailing whitespace characters occurrences from source string.
 * @returns {object} Returns an array of strings separated by( o.delimeter ).
 *
 * @example
 * //returns [ 'first', 'second', 'third' ]
 * _.strSplit( ' first second third ' );
 *
 * @example
 * //returns [ 'a', 'b', 'c', 'd' ]
 * _.strSplit( { src : 'a, b, c, d', delimeter : ', '  } );
 *
 * @example
 * //returns [ 'a', 'b', 'c', 'd' ]
 * _.strSplit( { src : 'a.b, c.d', delimeter : [ '.', ', ' ]  } );
 *
 * @example
 * //returns [ '    a', 'b', 'c', 'd   ' ]
   * _.strSplit( { src : '    a, b, c, d   ', delimeter : [ ', ' ], stripping : 0  } );
 *
 * @example
 * //returns [ 'a', ', ', 'b', ', ', 'c', ', ', 'd' ]
 * _.strSplit( { src : 'a, b, c, d', delimeter : [ ', ' ], preservingDelimeters : 1  } );
 *
 * @example
 * //returns [ 'a', '', 'b', '', 'c', '', 'd' ]
 * _.strSplit( { src : 'a ., b ., c ., d', delimeter : [ ', ', '.' ], preservingEmpty : 1  } );
 *
 * @method strSplit
 * @throws { Exception } Throw an exception if( arguments.length ) is not equal 1 or 2.
 * @throws { Exception } Throw an exception if( o.src ) is not a String.
 * @throws { Exception } Throw an exception if( o.delimeter ) is not a String or an Array.
 * @throws { Exception } Throw an exception if object( o ) has been extended by invalid property.
 * @memberof wTools
 *
 */
        let o = [ i.pre, r.pre, s.pre, l.pre, a.pre ], u = t.routineFromPreAndBody(o, strSplit_body);
        t.assert(u.pre !== i.pre), t.assert(t.routineIs(u.pre)), t.assert(u.body === strSplit_body), 
        t.assert(t.objectIs(u.defaults));
        //
        let c = t.routineFromPreAndBody(u.pre, u.body);
        var p;
        (p = c.defaults).preservingEmpty = 0, p.preservingDelimeters = 0, _strExtractInlined_body.defaults = {
          src: null,
          delimeter: null,
          // delimeterLeft : null,
          // delimeterRight : null,
          stripping: 0,
          quoting: 0,
          onOrdinary: null,
          onInlined: e => [ e ],
          preservingEmpty: 1,
          preservingDelimeters: 0,
          preservingOrdinary: 1,
          preservingInlined: 1
        };
        //
        let g = t.routineFromPreAndBody(strSplitFast_pre, _strExtractInlined_body);
        //
                strExtractInlinedStereo.defaults = {
          src: null,
          prefix: "#",
          postfix: "#",
          onInlined: null
        }, strUnjoin.any = t.any, t.assert(t.routineIs(strUnjoin.any)), strJoin_body.defaults = {
          srcs: null,
          join: null,
          str: t.strPrimitive
        };
        let f = t.routineFromPreAndBody(
        //
        /**
 * Joins objects inside the source array, by concatenating their values in order that they are specified.
 * The source array can contain strings, numbers and arrays. If arrays are provided, they must have same length.
 * Joins arrays by concatenating all elements with same index into one string and puts it into new array at same position.
 * Joins array with other object by concatenating each array element with that object value. Examples: ( [ [ 1, 2 ], 3 ] ) -> ( [ '13', '23' ] ),
 * ( [ [ 1, 2 ], [ 1, 2] ] ) -> ( [ '11', '22' ] ).
 * An optional second string argument can be passed to the function. This argument ( joiner ) defines the string that joins the
 * srcArray objects.  Examples: ( [ [ 1, 2 ], 3 ], '*' ) -> ( [ '1*3', '2*3' ] ),
 * ( [ [ 1, 2 ], [ 1, 2 ] ], ' to ' ) -> ( [ '1 to 1', '2 to 2' ] ).
 *
 * @param { Array-like } srcs - Source array with the provided objects.
 * @param { String } joiner - Optional joiner parameter.
 * @returns { Object } Returns concatenated objects as string or array. Return type depends from arguments type.
 *
 * @example
 * //returns '123'
 * _.strJoin([ 1, 2, 3 ]);
 *
 * @example
 * //returns [ '12', '22', '32' ]
 * _.strJoin([ [ 1, 2, 3 ], 2 ]);
 *
 * @example
 * //returns [ '11', '23' ]
 * _.strJoin([ [ 1, 2 ], [ 1, 3 ] ]);
 *
 * @example
 * //returns [ '1236', '1247', '1258' ]
 * _.strJoin([ 1, 2, [ 3, 4, 5 ], [ 6, 7, 8 ] ]);
 *
 * @example
 * //returns [ '1 2 3 6', '1 2 4 7', '1 2 5 8' ]
 * _.strJoin([ 1, 2, [ 3, 4, 5 ], [ 6, 7, 8 ] ], ' ');
 *
 * @method strJoin
 * @throws { Exception } If ( arguments.length ) is not one or two.
 * @throws { Exception } If some object from( srcs ) is not a Array, String or Number.
 * @throws { Exception } If length of arrays in srcs is different.
 * @throws { Exception } If ( joiner ) is not undefined or a string .
 * @memberof wTools
 *
 */
        function strJoin_pre(e, r) {
          let n = r[0];
          return (void 0 !== r[1] || t.arrayLike(r[0])) && (n = {
            srcs: r[0],
            join: r[1]
          }), t.routineOptions(e, n), t.assert(2 === arguments.length), t.assert(1 === r.length || 2 === r.length, () => "Expects an array of string and optional join, but got " + r.length + " arguments"), 
          t.assert(t.arrayLike(n.srcs), () => "Expects an array of strings, but got " + t.strType(n.srcs)), 
          t.assert(null === n.join || t.strIs(n.join), () => "Expects optional join, but got " + t.strType(n.join)), 
          n;
        }, strJoin_body);
        //
                strConcat.defaults = {
          linePrefix: "",
          linePostfix: "",
          lineDelimter: "\n",
          delimeter: " ",
          optionsForToStr: null
        }, strLinesNumber.defaults = {
          src: null,
          first: null,
          firstChar: null,
          onLine: null
        }, strLinesSelect.defaults = {
          src: null,
          range: null,
          line: null,
          numberOfLines: 3,
          selectMode: "center",
          number: 0,
          zero: 1,
          delimteter: "\n"
        }, strLinesNearest_body.defaults = {
          src: null,
          charsRange: null,
          numberOfLines: 3
        };
        // --
        // liner
        // --
        /**
 * Adds indentation character(s) to passed string.
 * If( src ) is a multiline string, function puts indentation character( tab ) before first
 * and every next new line in a source string( src ).
 * If( src ) represents single line, function puts indentation at the begining of the string.
 * If( src ) is a Array, function prepends indentation character( tab ) to each line( element ) of passed array.
 *
 * @param { String/Array } src - Source string to parse or array of lines( not array of texts ).
 * With line we mean it does not have eol. Otherwise please join the array to let the routine to resplit the text,
 * like that: _.strIndentation( array.join( '\n' ), '_' ).
 * @param { String } tab - Indentation character.
 * @returns { String } Returns indented string.
 *
 * @example
 *  _.strIndentation( 'abc', '_' )
 * //returns '_abc'
 *
 * @example
 * _.strIndentation( 'a\nb\nc', '_' )
 * //returns
 * _a
 * _b
 * _c
 *
 * @example
 * _.strIndentation( [ 'a', 'b', 'c' ], '_' )
 * //returns
 * _a
 * _b
 * _c
 *
 * @example
 * let array = [ 'a\nb', 'c\nd' ];
 * _.strIndentation( array.join( '\n' ), '_' )
 * //returns
 * _a
 * _b
 * _c
 * _d
 *
 * @method strIndentation
 * @throws { Exception } Throw an exception if( src ) is not a String or Array.
 * @throws { Exception } Throw an exception if( tab ) is not a String.
 * @throws { Exception } Throw an exception if( arguments.length ) is not a equal 2.
 * @memberof wTools
 *
 */
        /*
qqq : extend coverage of strIndentation
*/        let d = t.routineFromPreAndBody(strLinesNearest_pre, strLinesNearest_body);
        strLinesNearestReport_body.defaults = {
          src: null,
          charsRange: null,
          numberOfLines: 3,
          gray: 0
        };
        let y = t.routineFromPreAndBody(strLinesNearest_pre, strLinesNearestReport_body);
        //
        /**
 * Returns a count of lines in a string.
 * Expects one object: the string( src ) to be processed.
 *
 * @param {string} src - Source string.
 * @returns {number} Returns a number of lines in string.
 *
 * @example
 * //returns 2
 * _.strLinesCount( 'first\nsecond' );
 *
 * @example
 * //returns 4
 * _.strLinesCount( 'first\nsecond\nthird\n' );
 *
 * @method strLinesCount
 * @throws { Exception } Throw an exception if( src ) is not a String.
 * @throws { Exception } Throw an exception if no argument provided.
 * @memberof wTools
 *
*/        strLinesRangeWithCharRange_body.defaults = {
          src: null,
          charsRange: null
        };
        let m = t.routineFromPreAndBody(
        //
        function strLinesRangeWithCharRange_pre(e, r) {
          let n = r[0];
          return void 0 !== r[1] && (n = {
            src: r[0],
            charsRange: r[1]
          }), t.assert(2 === arguments.length), t.assert(1 === r.length || 2 === r.length), 
          t.assert(t.rangeIs(n.charsRange)), t.assert(t.strIs(n.src)), t.routineOptions(e, n), 
          n;
        }, strLinesRangeWithCharRange_body), h = {
          // checker
          strIsHex: 
          // --
          // checker
          // --
          function strIsHex(e) {
            t.assert(t.strIs(e)), t.assert(1 === arguments.length);
            let r = parseInt(e, 16);
            return !isNaN(r) && r.toString(16).length === e.length;
          }
          //
          ,
          strIsMultilined: function strIsMultilined(e) {
            return !!t.strIs(e) && -1 !== e.indexOf("\n");
          },
          strHas: strHas,
          strHasAny: function strHasAny(e, r) {
            if (t.assert(2 === arguments.length, "Expects exactly two arguments"), t.arrayIs(r)) {
              for (let t = 0; t < r.length; t++) if (strHas(e, r[t])) return !0;
              return !1;
            }
            return strHas(e, r);
          }
          //
          ,
          strHasAll: function strHasAll(e, r) {
            if (t.assert(2 === arguments.length, "Expects exactly two arguments"), t.arrayIs(r)) {
              for (let t = 0; t < r.length; t++) if (!strHas(e, r[t])) return !1;
              return !0;
            }
            return strHas(e, r);
          }
          //
          ,
          strHasNone: function strHasNone(e, r) {
            if (t.assert(2 === arguments.length, "Expects exactly two arguments"), t.arrayIs(r)) {
              for (let t = 0; t < r.length; t++) if (strHas(e, r[t])) return !1;
              return !0;
            }
            return !strHas(e, r);
          }
          //
          ,
          strHasSeveral: function strHasSeveral(e, r) {
            let n = 0;
            if (t.assert(2 === arguments.length, "Expects exactly two arguments"), t.arrayIs(r)) {
              for (let t = 0; t < r.length; t++) strHas(e, r[t]) && (n += 1);
              return n;
            }
            return strHas(e, r) ? 1 : 0;
          }
          //
          ,
          strsAnyHas: function strsAnyHas(e, r) {
            return t.assert(t.strIs(e) || t.strsAreAll(e)), t.assert(t.strIs(r)), t.strIs(e) ? t.strHas(e, r) : e.some(e => t.strHas(e, r));
          }
          //
          ,
          strsAllHas: function strsAllHas(e, r) {
            return t.assert(t.strIs(e) || t.strsAreAll(e)), t.assert(t.strIs(r)), t.strIs(e) ? t.strHas(e, r) : e.every(e => t.strHas(e, r));
          }
          //
          ,
          strsNoneHas: function strsNoneHas(e, r) {
            return t.assert(t.strIs(e) || t.strsAreAll(e)), t.assert(t.strIs(r)), t.strIs(e) ? !t.strHas(e, r) : e.every(e => !t.strHas(e, r));
          }
          // --
          // evaluator
          // --
          /**
 * Returns number of occurrences of a substring( ins ) in a string( src ),
 * Expects two objects in order: source string, substring.
 * Returns zero if one of arguments is empty string.
 *
 * @param {string} src - Source string.
 * @param {string} ins - Substring.
 * @returns {Number} Returns number of occurrences of a substring in a string.
 *
 * @example
 * //returns 2
 * _.strCount( 'aabab', 'ab' );
 *
 * @example
 * //returns 0
 * _.strCount( 'aabab', '' );
 *
 * @method strCount
 * @throws { Exception } Throw an exception if( src ) is not a String.
 * @throws { Exception } Throw an exception if( ins ) is not a String.
 * @throws { Exception } Throw an exception if( arguments.length ) is not equal 2.
 * @memberof wTools
 *
 */ ,
          // evaluator
          strCount: function strCount(e, r) {
            let n = 0;
            t.assert(2 === arguments.length, "Expects exactly two arguments"), t.assert(t.strIs(e)), 
            t.assert(t.strLike(r));
            let s = 0;
            do {
              let l = t.strLeft(e, r, s);
              if (void 0 === l.entry) break;
              s = l.index + l.entry.length, l.entry.length || (s += 1), n += 1, t.assert(-1 !== s, "not tested");
            } while (-1 !== s && s < e.length);
            return n;
          }
          // //
          //
          // function strCountLeft( src, ins )
          // {
          //   let result = 0;
          //
          //   _.assert( arguments.length === 2, 'Expects exactly two arguments' );
          //   _.assert( _.strIs( src ) );
          //   _.assert( _.strIs( ins ) );
          //
          //   if( !ins.length )
          //   return 0;
          //
          //   let i = 0;
          //   do
          //   {
          //     if( src.substring( i, i+ins.length ) !== ins )
          //     break;
          //     result += 1;
          //     i += ins.length;
          //   }
          //   while( i < src.length );
          //
          //   return result;
          // }
          //
          // //
          //
          // function strCountRight( src, ins )
          // {
          //   let result = 0;
          //
          //   _.assert( arguments.length === 2, 'Expects exactly two arguments' );
          //   _.assert( _.strIs( src ) );
          //   _.assert( _.strIs( ins ) );
          //
          //   throw _.err( 'not tested' );
          //
          //   if( !ins.length )
          //   return 0;
          //
          //   let i = src.length;
          //   do
          //   {
          //     if( src.substring( i-ins.length, i ) !== ins )
          //     break;
          //     result += 1;
          //     i -= ins.length;
          //   }
          //   while( i > 0 );
          //
          //   return result;
          // }
          //
          ,
          // strCountLeft,
          // strCountRight,
          strsShortest: function strsShortest(e) {
            return t.assert(1 === arguments.length), t.assert(t.strIs(e) || t.arrayLike(e)), 
            t.strIs(e) ? e : e.sort((e, t) => e.length - t.length)[0];
          }
          //
          ,
          strsLongest: function strsLongest() {
            return t.assert(1 === arguments.length), t.assert(t.strIs(src) || t.arrayLike(src)), 
            t.strIs(src) ? src : src.sort((e, t) => t.length - e.length)[0];
          }
          // --
          // replacer
          // --
          ,
          // replacer
          _strRemovedBegin: function _strRemovedBegin(e, r) {
            t.assert(2 === arguments.length, "Expects exactly two arguments"), t.assert(t.strIs(e), "Expects string {-src-}");
            let n = e, s = t._strBeginOf(n, r);
            return !1 !== s && (n = n.substr(s.length, n.length)), n;
          }
          //
          /**
 * Finds substring prefix ( begin ) occurrence from the very begining of source ( src ) and removes it.
 * Returns original string if source( src ) does not have occurrence of ( prefix ).
 *
 * @param { String } src - Source string to parse.
 * @param { String } prefix - String that is to be dropped.
 * @returns { String } Returns string with result of prefix removement.
 *
 * @example
 * //returns mple
 * _.strRemoveBegin( 'example', 'exa' );
 *
 * @example
 * //returns example
 * _.strRemoveBegin( 'example', 'abc' );
 *
 * @function strRemoveBegin
 * @throws { Exception } Throws a exception if( src ) is not a String.
 * @throws { Exception } Throws a exception if( prefix ) is not a String.
 * @throws { Exception } Throws a exception if( arguments.length ) is not equal 2.
 * @memberof wTools
 *
 */ ,
          strRemoveBegin: function strRemoveBegin(e, r) {
            t.assert(2 === arguments.length, "Expects exactly two arguments"), t.assert(t.longIs(e) || t.strIs(e), "Expects string or array of strings {-src-}"), 
            t.assert(t.longIs(r) || t.strIs(r) || t.regexpIs(r), "Expects string/regexp or array of strings/regexps {-begin-}");
            let n = [], s = t.longIs(e);
            if (t.strIs(e) && !t.longIs(r)) return t._strRemovedBegin(e, r);
            e = t.arrayAs(e), r = t.arrayAs(r);
            for (let s = 0, l = e.length; s < l; s++) {
              let l = !1, a = e[s];
              for (let e = 0, n = r.length; e < n && !1 === (l = t._strBeginOf(a, r[e])); e++) ;
              !1 !== l && (a = a.substr(l.length, a.length)), n[s] = a;
            }
            return s ? n : n[0];
          }
          //
          ,
          _strRemovedEnd: function _strRemovedEnd(e, r) {
            t.assert(2 === arguments.length, "Expects exactly two arguments"), t.assert(t.strIs(e), "Expects string {-src-}");
            let n = e, s = t._strEndOf(n, r);
            return !1 !== s && (n = n.substr(0, n.length - s.length)), n;
          }
          //
          /**
 * Removes occurrence of postfix ( end ) from the very end of string( src ).
 * Returns original string if no occurrence finded.
 * @param { String } src - Source string to parse.
 * @param { String } postfix - String that is to be dropped.
 * @returns { String } Returns string with result of postfix removement.
 *
 * @example
 * //returns examp
 * _.strRemoveEnd( 'example', 'le' );
 *
 * @example
 * //returns example
 * _.strRemoveEnd( 'example', 'abc' );
 *
 * @function strRemoveEnd
 * @throws { Exception } Throws a exception if( src ) is not a String.
 * @throws { Exception } Throws a exception if( postfix ) is not a String.
 * @throws { Exception } Throws a exception if( arguments.length ) is not equal 2.
 * @memberof wTools
 *
 */ ,
          strRemoveEnd: function strRemoveEnd(e, r) {
            t.assert(2 === arguments.length, "Expects exactly two arguments"), t.assert(t.longIs(e) || t.strIs(e), "Expects string or array of strings {-src-}"), 
            t.assert(t.longIs(r) || t.strIs(r) || t.regexpIs(r), "Expects string/regexp or array of strings/regexps {-end-}");
            let n = [], s = t.longIs(e);
            if (t.strIs(e) && !t.longIs(r)) return t._strRemovedEnd(e, r);
            e = t.arrayAs(e), r = t.arrayAs(r);
            for (let s = 0, l = e.length; s < l; s++) {
              let l = !1, a = e[s];
              for (let e = 0, n = r.length; e < n && !1 === (l = t._strEndOf(a, r[e])); e++) ;
              !1 !== l && (a = a.substr(0, a.length - l.length)), n[s] = a;
            }
            return s ? n : n[0];
          }
          //
          ,
          _strRemoved: function _strRemoved(e, r) {
            let n = e;
            if (t.assert(2 === arguments.length, "expects exactly two arguments"), t.assert(t.strIs(e), "expects string {-src-}"), 
            t.longIs(r)) for (let e = 0; e < r.length; e++) n = n.replace(r[e], ""); else n = n.replace(r, "");
            return n;
          }
          //
          /**
* Finds substring or regexp ( insStr ) first occurrence from the source string ( srcStr ) and removes it.
* Returns original string if source( src ) does not have occurrence of ( insStr ).
*
* @param { String } srcStr - Source string to parse.
* @param { String } insStr - String/RegExp that is to be dropped.
* @returns { String } Returns string with result of substring removement.
*
* @example
* //returns ource tring
* _.strRemove( 'source string', 's' );
*
* @example
* //returns example
* _.strRemove( 'example', 's' );
*
* @function strRemove
* @throws { Exception } Throws a exception if( srcStr ) is not a String.
* @throws { Exception } Throws a exception if( insStr ) is not a String or a RegExp.
* @throws { Exception } Throws a exception if( arguments.length ) is not equal 2.
* @memberof wTools
*
*/ ,
          strRemove: function strRemove(e, r) {
            t.assert(2 === arguments.length, "expects exactly two arguments"), t.assert(t.longIs(e) || t.strIs(e), "expects string or array of strings {-src-}"), 
            t.assert(t.longIs(r) || t.strIs(r) || t.regexpIs(r), "expects string/regexp or array of strings/regexps {-begin-}");
            let n = [], s = t.longIs(e);
            if (t.strIs(e) && !t.longIs(e)) return t._strRemoved(e, r);
            e = t.arrayAs(e);
            for (let s = 0; s < e.length; s++) {
              let l = e[s];
              n[s] = t._strRemoved(l, r);
            }
            return s ? n : n[0];
          }
          //
          ,
          strReplaceBegin: function strReplaceBegin(e, r, n) {
            t.assert(3 === arguments.length, "Expects exactly three arguments"), t.assert(t.strIs(n) || t.longIs(n), "Expects {-ins-} as string/array of strings"), 
            t.longIs(r) && t.longIs(n) && t.assert(r.length === n.length), r = t.arrayAs(r);
            let s = t.arrayAs(e).slice();
            for (let e = 0, l = s.length; e < l; e++) for (let l = 0, a = r.length; l < a; l++) if (t.strBegins(s[e], r[l])) {
              let a = t.longIs(n) ? n[l] : n;
              t.assert(t.strIs(a)), s[e] = a + t.strRemoveBegin(s[e], r[l]);
              break;
            }
            return 1 === s.length && t.strIs(e) ? s[0] : s;
          }
          //
          ,
          strReplaceEnd: function strReplaceEnd(e, r, n) {
            t.assert(3 === arguments.length, "Expects exactly three arguments"), t.assert(t.strIs(n) || t.longIs(n), "Expects {-ins-} as string/array of strings"), 
            t.longIs(r) && t.longIs(n) && t.assert(r.length === n.length), r = t.arrayAs(r);
            let s = t.arrayAs(e).slice();
            for (let e = 0, l = s.length; e < l; e++) for (let l = 0, a = r.length; l < a; l++) if (t.strEnds(s[e], r[l])) {
              let a = t.longIs(n) ? n[l] : n;
              t.assert(t.strIs(a)), s[e] = t.strRemoveEnd(s[e], r[l]) + a;
            }
            return 1 === s.length && t.strIs(e) ? s[0] : s;
          }
          //
          ,
          _strReplaced: function _strReplaced(e, r, n) {
            t.assert(3 === arguments.length, "expects exactly three arguments"), t.assert(t.strIs(e), "expects string {-src-}");
            let s = e;
            if (t.longIs(r)) {
              t.assert(r.length === n.length, "Search and replace strings must have same length");
              for (let e = 0; e < r.length; e++) t.assert(t.strIs(n[e]), "expects string {-sub-}"), 
              s = s.replace(r[e], n[e]);
            } else t.assert(t.strIs(n), "expects string {-sub-}"), s = s.replace(r, n);
            return s;
          }
          //
          /**
* Finds substring or regexp ( insStr ) occurrence from the source string ( srcStr ) and replaces them
* with the subStr values.
* Returns original string if source( src ) does not have occurrence of ( insStr ).
*
* @param { String } srcStr - Source string to parse.
* @param { String } insStr - String/RegExp that is to be replaced.
* @param { String } subStr - Replacement String/RegExp.
* @returns { String } Returns string with result of substring replacement.
*
* @example
* //returns Source string
* _.strReplace( 'source string', 's', 'S' );
*
* @example
* //returns example
* _.strReplace( 'example', 's' );
*
* @function strReplace
* @throws { Exception } Throws a exception if( srcStr ) is not a String.
* @throws { Exception } Throws a exception if( insStr ) is not a String or a RegExp.
* @throws { Exception } Throws a exception if( subStr ) is not a String.
* @throws { Exception } Throws a exception if( arguments.length ) is not equal 3.
* @memberof wTools
*
*/ ,
          strReplace: function strReplace(e, r, n) {
            t.assert(3 === arguments.length, "expects exactly three arguments"), t.assert(t.longIs(e) || t.strIs(e), "expects string or array of strings {-src-}"), 
            t.assert(t.longIs(r) || t.strIs(r) || t.regexpIs(r), "expects string/regexp or array of strings/regexps {-begin-}"), 
            t.assert(t.longIs(n) || t.strIs(n), "expects string or array of strings {-src-}");
            let s = [], l = t.longIs(e);
            if (t.strIs(e) && !t.longIs(e)) return t._strReplaced(e, r, n);
            e = t.arrayAs(e);
            for (let l = 0; l < e.length; l++) {
              let a = e[l];
              s[l] = t._strReplaced(a, r, n);
            }
            return l ? s : s[0];
          }
          //
          /**
  * Prepends string( begin ) to the source( src ) if prefix( begin ) is not match with first chars of string( src ),
  * otherwise returns original string.
  * @param { String } src - Source string to parse.
  * @param { String } begin - String to prepend.
  *
  * @example
  * _.strPrependOnce( 'test', 'test' );
  * //returns 'test'
  *
  * @example
  * _.strPrependOnce( 'abc', 'x' );
  * //returns 'xabc'
  *
  * @returns { String } Returns result of prepending string( begin ) to source( src ) or original string.
  * @function strPrependOnce
  * @memberof wTools
  */ ,
          strPrependOnce: function strPrependOnce(e, r) {
            return t.assert(t.strIs(e) && t.strIs(r), "Expects {-src-} and {-begin-} as strings"), 
            0 === e.lastIndexOf(r, 0) ? e : r + e;
          }
          //
          /**
  * Appends string( end ) to the source( src ) if postfix( end ) is not match with last chars of string( src ),
  * otherwise returns original string.
  * @param {string} src - Source string to parse.
  * @param {string} end - String to append.
  *
  * @example
  * _.strAppendOnce( 'test', 'test' );
  * //returns 'test'
  *
  * @example
  * _.strAppendOnce( 'abc', 'x' );
  * //returns 'abcx'
  *
  * @returns {string} Returns result of appending string( end ) to source( src ) or original string.
  * @function strAppendOnce
  * @memberof wTools
  */ ,
          strAppendOnce: function strAppendOnce(e, r) {
            return t.assert(t.strIs(e) && t.strIs(r), "Expects {-src-} and {-end-} as strings"), 
            -1 !== e.indexOf(r, e.length - r.length) ? e : e + r;
          }
          // --
          // etc
          // --
          /**
 * Replaces occurrence of each word from array( ins ) in string( src ) with word
 * from array( sub ) considering it position.
 * @param {string} src - Source string to parse.
 * @param {array} ins - Array with strings to replace.
 * @param {string} sub - Array with new strings.
 * @returns {string} Returns string with result of replacements.
 *
 * @example
 * //returns ' your cars are'
 * _.strReplaceWords( ' my name is', [ 'my', 'name', 'is' ], [ 'your', 'cars', 'are' ] )
 *
 * @method strReplaceWords
 * @throws { Exception } Throws a exception if( ins ) is not a Array.
 * @throws { Exception } Throws a exception if( sub ) is not a Array.
 * @throws { TypeError } Throws a exception if( src ) is not a String.
 * @throws { Exception } Throws a exception if( arguments.length ) is not equal 3.
 * @memberof wTools
 *
 */ ,
          strReplaceWords: function strReplaceWords(e, r, n) {
            t.assert(3 === arguments.length, "Expects exactly three arguments"), t.assert(t.strIs(e)), 
            t.assert(t.arrayIs(r)), t.assert(t.arrayIs(n)), t.assert(r.length === n.length);
            let s = e;
            for (let e = 0; e < r.length; e++) {
              t.assert(t.strIs(r[e]));
              let l = new RegExp("(\\W|^)" + r[e] + "(?=\\W|$)", "gm");
              s = s.replace(l, function(t) {
                return t[0] !== n[e][0] ? t[0] + n[e] : n[e];
              });
            }
            return s;
          }
          // --
          // etc
          // --
          /**
 * Find common symbols from the begining of all strings passed to arguments list. Uses first argument( ins ) as pattern.
 * If some string doesn`t have the same first symbols as the pattern ( ins ), the function returns an empty string.
 * Otherwise, it returns the symbol sequence that appears from the start of each string.
 *
 * @param {string} ins - Sequence of possible symbols.
 * @returns {string} Returns found common symbols.
 *
 * @example
 * //returns 'a'
 * _.strCommonLeft( 'abcd', 'ab', 'abc', 'a' );
 *
 * @example
 * //returns 'abc'
 * _.strCommonLeft( 'abcd', 'abc', 'abcd' );
 *
 * @example
 * //returns ''
 * _.strCommonLeft( 'abcd', 'abc', 'd' )
 *
 * @method strCommonLeft
 * @throws {exception} If ( ins ) is not a String.
 * @memberof wTools
 *
 */ ,
          // etc
          strCommonLeft: function strCommonLeft(e) {
            if (0 === arguments.length) return "";
            if (1 === arguments.length) return e;
            t.assert(t.strIs(e));
            let r = Infinity;
            for (let e = 0; e < arguments.length; e++) {
              let t = arguments[e];
              r = Math.min(r, t.length);
            }
            let n = 0;
            for (;n < r; n++) for (let t = 1; t < arguments.length; t++) if (arguments[t][n] !== e[n]) return e.substring(0, n);
            return e.substring(0, n);
          }
          //
          /**
 * Finds common symbols from the end of all strings passed to arguments list. Uses first argument( ins ) as pattern.
 * If some string doesn`t have same last symbol with pattern( ins ), the function returns an empty string.
 * Otherwise, it returns the symbol sequence that appears from the end of each string.
 *
 * @param { String } ins - Sequence of possible symbols.
 * @returns { String } Returns found common symbols.
 *
 * @example 'ame'
 * _.strCommonRight( 'ame', 'same', 'name' );
 *
 * @example 'c'
 * _.strCommonRight( 'abc', 'dbc', 'ddc', 'aac' );
 *
 * @example ''
 * _.strCommonRight( 'abc', 'dba', 'abc' );
 *
 * @method strCommonRight
 * @throws {exception} If( ins ) is not a String.
 * @memberof wTools
 *
 */ ,
          /* document me */
          strCommonRight: function strCommonRight(e) {
            if (0 === arguments.length) return "";
            if (1 === arguments.length) return e;
            t.assert(t.strIs(e));
            let r = Infinity;
            for (let e = 0; e < arguments.length; e++) {
              let t = arguments[e];
              r = Math.min(r, t.length);
            }
            let n = 0;
            for (;n < r; n++) for (let t = 1; t < arguments.length; t++) {
              let r = arguments[t];
              if (r[r.length - n - 1] !== e[e.length - n - 1]) return e.substring(e.length - n);
            }
            return e.substring(e.length - n);
          }
          // --
          // formatter
          // --
          ,
          /* document me */
          // formatter
          strForRange: function strForRange(e) {
            return t.assert(1 === arguments.length), t.assert(t.arrayIs(e)), "[ " + e[0] + ".." + e[1] + " ]";
          }
          //
          ,
          /* experimental */
          strForCall: function strForCall(e, r, n, s) {
            let l = e + "( ", a = !0;
            return t.assert(t.arrayIs(r) || t.objectIs(r)), t.assert(arguments.length <= 4), 
            t.each(r, function(e, r) {
              !1 === a && (l += ", "), t.objectIs(e) ? l += r + " :" + t.toStr(e, s) : l += t.toStr(e, s), 
              a = !1;
            }), l += " )", arguments.length >= 3 && (l += " -> " + t.toStr(n, s)), l;
          },
          /* experimental */
          strStrShort: strStrShort,
          strDifference: 
          //
          function strDifference(e, r, n) {
            if (t.assert(t.strIs(e)), t.assert(t.strIs(r)), e === r) return !1;
            for (var s = 0, l = Math.min(e.length, r.length); s < l; s++) if (e[s] !== r[s]) return e.substr(0, s) + "*";
            return e.substr(0, s) + "*";
          }
          // --
          // transformer
          // --
          /**
 * Returns string with first letter converted to upper case.
 * Expects one object: the string to be formatted.
 *
 * @param {string} src - Source string.
 * @returns {String} Returns a string with the first letter capitalized.
 *
 * @example
 * //returns Test string
 * _.strCapitalize( 'test string' );
 *
 * @example
 * //returns Another_test_string
 * _.strCapitalize( 'another_test_string' );
 *
 * @method strCapitalize
 * @throws { Exception } Throw an exception if( src ) is not a String.
 * @throws { Exception } Throw an exception if( arguments.length ) is not equal 1.
 * @memberof wTools
 *
 */ ,
          // transformer
          strCapitalize: function strCapitalize(e) {
            /*_.assert( src.length > 0 );*/
            /*_.assert( src.match(/(^\W)/) === null );*/
            return t.assert(t.strIs(e)), t.assert(1 === arguments.length, "Expects single argument"), 
            0 === e.length ? e : e[0].toUpperCase() + e.substring(1);
          }
          //
          ,
          strDecapitalize: function strDecapitalize(e) {
            return t.assert(t.strIs(e)), t.assert(1 === arguments.length, "Expects single argument"), 
            0 === e.length ? e : e[0].toLowerCase() + e.substring(1);
          },
          strEscape: strEscape,
          strCodeUnicodeEscape: 
          //
          /**
 * Converts source string( src ) into unicode representation by replacing each symbol with its escaped unicode equivalent.
 * Example: ( 't' -> '\u0074' ). Returns result of conversion as new string or empty string if source has zero length.
 * @param {string} str - Source string to parse.
 * @returns {string} Returns string with result of conversion.
 *
 * @example
 * //returns \u0061\u0062\u0063;
 * _.strUnicodeEscape( 'abc' );
 *
 * @example
 * //returns \u0077\u006f\u0072\u006c\u0064
 * _.strUnicodeEscape( 'world' );
 *
 * @example
 * //returns \u002f\u002f\u0074\u0065\u0073\u0074\u002f\u002f
 * _.strUnicodeEscape( '//test//' );
 *
 * @method strUnicodeEscape
 * @throws { Exception } Throws a exception if no argument provided.
 * @throws { Exception } Throws a exception if( src ) is not a String.
 * @memberof wTools
 *
 */
          function strCodeUnicodeEscape(e) {
            t.assert(t.numberIs(e)), t.assert(1 === arguments.length, "Expects single argument");
            let r = e.toString(16);
            return "\\u" + (t.strDup("0", 4 - r.length) + r);
          }
          //
          /**
 * Converts source string( src ) into unicode representation by replacing each symbol with its escaped unicode equivalent.
 * Example: ( 't' -> '\u0074' ). Returns result of conversion as new string or empty string if source has zero length.
 * @param {string} str - Source string to parse.
 * @returns {string} Returns string with result of conversion.
 *
 * @example
 * //returns \u0061\u0062\u0063;
 * _.strUnicodeEscape( 'abc' );
 *
 * @example
 * //returns \u0077\u006f\u0072\u006c\u0064
 * _.strUnicodeEscape( 'world' );
 *
 * @example
 * //returns \u002f\u002f\u0074\u0065\u0073\u0074\u002f\u002f
 * _.strUnicodeEscape( '//test//' );
 *
 * @method strUnicodeEscape
 * @throws { Exception } Throws a exception if no argument provided.
 * @throws { Exception } Throws a exception if( src ) is not a String.
 * @memberof wTools
 *
 */ ,
          strUnicodeEscape: function strUnicodeEscape(e) {
            let r = "";
            t.assert(t.strIs(e)), t.assert(1 === arguments.length, "Expects single argument");
            for (let n = 0; n < e.length; n++) {
              let s = e.charCodeAt(n);
              r += t.strCodeUnicodeEscape(s);
            }
            return r;
          }
          //
          ,
          /* document me */
          strReverse: function strReverse(e) {
            t.assert(1 === arguments.length, "Expects single argument");
            let r = "";
            for (let t = 0; t < e.length; t++) r = e[t] + r;
            return r;
          },
          // stripper
          strStrip: strStrip,
          strsStrip: t.routineVectorize_functor(strStrip),
          strStripLeft: strStripLeft,
          strsStripLeft: t.routineVectorize_functor(strStripLeft),
          strStripRight: strStripRight,
          strsStripRight: t.routineVectorize_functor(strStripRight),
          strRemoveAllSpaces: t.routineVectorize_functor(
          //
          /**
 * Removes whitespaces from source( src ).
 * If argument( sub ) is defined, function replaces whitespaces with it.
 *
 * @param {string} src - Source string to parse.
 * @param {string} sub - Substring that replaces whitespaces.
 * @returns {string} Returns a string with removed whitespaces.
 *
 * @example
 * //returns abcde
 * _.strRemoveAllSpaces( 'a b c d e' );
 *
 * @example
 * //returns a*b*c*d*e
 * _.strRemoveAllSpaces( 'a b c d e', '*' );
 *
 * @method strRemoveAllSpaces
 * @memberof wTools
 *
*/
          function _strRemoveAllSpaces(e, r) {
            return t.assert(1 === arguments.length || 2 === arguments.length), t.assert(t.strIs(e)), 
            void 0 === r && (r = ""), e.replace(/\s/g, r);
          }
          //
          /**
 * Removes empty lines from the string passed by argument( srcStr ).
 *
 * @param {string} srcStr - Source string to parse.
 * @returns {string} Returns a string with empty lines removed.
 *
 * @example
 * //returns
 * //first
 * //second
 * _.strStripEmptyLines( 'first\n\nsecond' );
 *
 * @example
 * //returns
 * //zero
 * //first
 * //second
 * _.strStripEmptyLines( 'zero\n\nfirst\n\nsecond' );
 *
 * @method strStripEmptyLines
 * @throws { Exception } Throw an exception if( srcStr ) is not a String.
 * @throws { Exception } Throw an exception if( arguments.length ) is not equal 1.
 * @memberof wTools
 *
 */),
          strStripEmptyLines: t.routineVectorize_functor(function _strStripEmptyLines(e) {
            let r = "", n = e.split("\n");
            t.assert(t.strIs(e)), t.assert(1 === arguments.length, "Expects single argument");
            for (let e = 0; e < n.length; e += 1) {
              let s = n[e];
              t.strStrip(s) && (r += s + "\n");
            }
            return r.substring(0, r.length - 1);
          }
          // --
          // splitter
          // --
          /**
 * Parses a source string( src ) and separates numbers and string values
 * in to object with two properties: 'str' and 'number', example of result: ( { str: 'bd', number: 1 } ).
 *
 * @param {string} src - Source string.
 * @returns {object} Returns the object with two properties:( str ) and ( number ),
 * with values parsed from source string. If a string( src ) doesn't contain number( s ),
 * function returns the object with value of string( src ).
 *
 * @example
 * //returns { str: 'bd', number: 1 }
 * _.strSplitStrNumber( 'bd1' );
 *
 * @example
 * //returns { str: 'bdxf' }
 * _.strSplitStrNumber( 'bdxf' );
 *
 * @method strSplitStrNumber
 * @throws { Exception } Throw an exception if( src ) is not a String.
 * @throws { Exception } Throw an exception if no argument provided.
 * @memberof wTools
 *
 */),
          // splitter
          strSplitStrNumber: function strSplitStrNumber(e) {
            let r = Object.create(null);
            t.assert(1 === arguments.length, "Expects single argument"), t.assert(t.strIs(e));
            let n = e.match(/\d+/);
            if (n && n.length) {
              let s = e.match(/[^\d]*/);
              r.str = s[0], r.number = t.numberFrom(n[0]);
            } else r.str = e;
            return r;
          },
          /* experimental */
          strSplitChunks: strSplitChunks,
          /* experimental */
          strSplitsCoupledGroup: strSplitsCoupledGroup,
          strSplitsUngroupedJoin: strSplitsUngroupedJoin,
          strSplitsQuotedRejoin: r,
          strSplitsDropDelimeters: s,
          strSplitsStrip: l,
          strSplitsDropEmpty: a,
          strSplitFast: i,
          strSplit: u,
          strSplitNonPreserving: c,
          strSplitCamel: 
          //
          /*
qqq : cover it by test
*/
          function strSplitCamel(e) {
            let r = t.strSplitFast(e, /[A-Z]/);
            for (let e = r.length - 2; e >= 0; e--) e % 2 == 1 && r.splice(e, 2, r[e].toLowerCase() + r[e + 1]);
            return r;
          }
          // --
          // extractor
          // --
          /**
 * Gets substring out of source string according to a given range.
 * The end value of the range is not included in the substring.
 * Returns result as string.
 *
 * @param {string} srcStr - Source string.
 * @param {range} range - Source range.
 * @returns {string} Returns the corresponding substring.
 *
 * @example
 * //returns [ 'first', [ 0, 2 ] ]
 * _.strSub( 'fi' );
 *
 * @method strSub
 * @throws { Exception } Throw an exception if( arguments.length ) is not equal 2.
 * @throws { Exception } Throw an exception if( srcStr ) is not a String.
 * @throws { Exception } Throw an exception if( range ) is not a range.
 * @memberof wTools
 *
 */ ,
          // strSplitNaive,
          // extractor
          strSub: t.routineVectorize_functor(function _strSub(e, r) {
            return t.assert(2 === arguments.length, "Expects exactly two arguments"), t.assert(t.strIs(e)), 
            t.assert(t.rangeIs(r)), e.substring(r[0], r[1]);
          }),
          strExtractInlined: g,
          strExtractInlinedStereo: strExtractInlinedStereo,
          strUnjoin: strUnjoin,
          /* document me */
          // joiner
          strDup: t.routineVectorize_functor(
          // --
          // joiner
          // --
          /**
 * Returns a string with the source string appended to itself n-times.
 * Expects two objects: source string( s ) ( or array of strings ) and number of concatenations( times ).
 * The string ( s ) and the number ( times ) remain unchanged.
 *
 * @param { Array/String } s - Source array of strings / source string.
 * @param { Number } times - Number of concatenation cycles.
 * @returns { String } - Returns a string containing the src string concatenated n-times.
 *
 * @example
 * //returns WordWordWordWordWord
 * _.strDup( 'Word', 5 );
 *
 * @example
 * //returns 1 21 2
 * _.strDup( '1 '+'2', 2 );
 *
 * @example
 * //returns [ 'abab', 'dd', '3 43 4']
 * _.strDup( [ 'ab', 'd', '3 4'], 2 );
 *
 * @method strDup
 * @throws { Exception } Throw an exception if( s ) is not a String or an array of strings.
 * @throws { Exception } Throw an exception if( times ) is not a Number.
 * @throws { Exception } Throw an exception if( arguments.length ) is not equal 2.
 * @memberof wTools
 *
 */
          function _strDup(e, r) {
            let n = "";
            t.assert(2 === arguments.length, "Expects exactly two arguments"), t.assert(t.strIs(e)), 
            t.assert(t.numberIs(r));
            for (let t = 0; t < r; t++) n += e;
            return n;
          }),
          /* document me */
          strJoin: f,
          strJoinPath: function strJoinPath(e, r) {
            /* */
            function join(e, n, l) {
              if (t.numberIs(e) && (e = e.toString()), l > 0 && r) {
                let l = t.strEnds(s[n], r), a = t.strBegins(e, r);
                a && l ? s[n] = t.strRemoveEnd(s[n], r) + e : s[n] += a || l ? e : r + e;
              } else s[n] += e;
            }
            let n, s = [ "" ], l = 0;
            t.assert(2 === arguments.length, () => "Expects an array of string and joiner, but got " + arguments.length + " arguments"), 
            t.assert(t.arrayLike(e), () => "Expects an array of strings, but got " + t.strType(e)), 
            t.assert(t.strIs(r), () => "Expects joiner, but got " + t.strType(r));
            /* xxx */
            for (let r = 0; r < e.length; r++) {
              let a = e[r];
              if (t.assert(t.strIs(a) || t.numberIs(a) || t.arrayIs(a)), t.arrayIs(a)) {
                if (0 === l) for (let e = 1; e < a.length; e++) s[e] = s[0];
                t.assert(void 0 === n || n === a.length, "All arrays should have the same length"), 
                n = a.length, l = 1;
                for (let e = 0; e < a.length; e++) join(a[e], e, r);
              } else for (let e = 0; e < s.length; e++) join(a, e, r);
            }
            return l ? s : s[0];
          },
          /* qqq : cover and document me */
          strConcat: strConcat,
          // liner
          strIndentation: function strIndentation(e, r) {
            if (t.assert(t.strIs(e) || t.arrayIs(e), "Expects src as string or array"), t.assert(t.strIs(r), "Expects string tab"), 
            t.assert(2 === arguments.length, "Expects two arguments"), t.strIs(e)) {
              if (-1 === e.indexOf("\n")) return e;
              // if( src.indexOf( '\n' ) === -1 )
              // return tab + src;
                            e = e.split("\n");
            }
            /*
  should be no tab in prolog
*/            
            // let result = tab + src.join( '\n' + tab );
            return e.join("\n" + r);
          }
          // //
          //
          // function strIndentationButFirst( src, tab )
          // {
          //
          //   _.assert( _.strIs( src ) || _.arrayIs( src ), 'Expects src as string or array' );
          //   _.assert( _.strIs( tab ), 'Expects string tab' );
          //   _.assert( arguments.length === 2, 'Expects two arguments' );
          //
          //   if( _.strIs( src ) )
          //   {
          //
          //     if( src.indexOf( '\n' ) === -1 )
          //     return tab + src;
          //
          //     src = src.split( '\n' );
          //
          //   }
          //
          // /*
          //   should be no tab in prolog
          // */
          //
          //   let result = src.join( '\n' + tab );
          //
          //   return result;
          // }
          //
          ,
          strLinesSplit: function strLinesSplit(e) {
            return t.assert(t.strIs(e) || t.arrayIs(e)), t.assert(1 === arguments.length), t.arrayIs(e) ? e : e.split("\n");
          }
          //
          ,
          strLinesJoin: function strLinesJoin(e) {
            t.assert(t.strIs(e) || t.arrayIs(e)), t.assert(1 === arguments.length);
            let r = e;
            return t.arrayIs(e) && (r = e.join("\n")), r;
          }
          //
          /**
 * Remove espace characters and white spaces at the begin or at the end of each line.
 * Input arguments can be strings or arrays of strings. If input is a string, it splits it in lines and
 * removes the white/escape characters from the beggining and the end of each line. If input is an array,
 * it treats it as a single string split into lines, where each entry corresponds to a line. Therefore,
 * it removes the white/escape characters only from the beggining and the end of the strings in the array.
 *
 * @param { String/Array } [ src ] - Source string or array of strings.
 * @returns { String/Array } Returns string/array with empty lines and spaces removed.
 *
 * @example input string
 * _.strLinesStrip( '  Hello \r\n\t World \n\n ' );
 * //returns 'Hello\nWorld'
 *
 * @example input array
 * _.strLinesStrip( [ '  Hello \r\n\t world \n\n ', '\n! \n' ] );
 * //returns  [ 'Hello \r\n\t world', '!' ]
 *
 * @example input strings
 * _.strLinesStrip( '  Hello \r\n\t', ' World \n\n  ! \n\n', '\n\n' );
 * //returns [ 'Hello', 'World\n!', '' ]
 *
 * @example input arrays
 * _.strLinesStrip( [ '  Hello \r\n\t world \n\n ', '\n! \n' ], [ '\n\nHow\n\nAre  ', '  \r\nyou ? \n'], [ '\t\r\n  ' ] );
 * //returns [ [ 'Hello \r\n\t world', '!' ], [ 'How\n\nAre', 'you ?' ], [] ]
 *
 * @method strLinesStrip
 * @throws { Exception } Throw an exception if( src ) is not a String or Array.
 * @memberof wTools
 */ ,
          strLinesStrip: function strLinesStrip(e) {
            if (arguments.length > 1) {
              let e = t.unrollMake(null);
              for (let t = 0; t < arguments.length; t++) e[t] = strLinesStrip(arguments[t]);
              return e;
            }
            t.assert(t.strIs(e) || t.arrayIs(e)), t.assert(1 === arguments.length);
            let r = t.strLinesSplit(e);
            return r = r.map(e => e.trim()).filter(e => e), t.strIs(e) && (r = t.strLinesJoin(r)), 
            r;
          },
          /* qqq : test coverage */
          strLinesNumber: strLinesNumber,
          strLinesSelect: strLinesSelect,
          strLinesNearest: d,
          /* qqq : check coverage */
          strLinesNearestReport: y,
          strLinesCount: function strLinesCount(e) {
            return t.assert(1 === arguments.length, "Expects single argument"), t.assert(t.strIs(e)), 
            -1 !== e.indexOf("\n") ? e.split("\n").length : 1;
          },
          strLinesRangeWithCharRange: m
        };
        // --
        // declare
        // --
                t.mapExtend(e, h), 
        // --
        // export
        // --
        void 0 !== n && null !== n && (n.exports = e);
      }();
    });
    n.include, n.include;
  }(), // == end of file StringTools_s
  module.exports = _starter_._fileInclude(e, "./dwtools/abase/Layer2.s");
}(); // == end of library