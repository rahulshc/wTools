!function aPredefinedS() {
  // == begin of file aPredefinedS
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
        let l = void 0;
    l || "undefined" == typeof Global || Global.Global !== Global || (l = Global), l || "undefined" == typeof global || global.global !== global || (l = global), 
    l || "undefined" == typeof window || window.window !== window || (l = window), l || "undefined" == typeof self || self.self !== self || (l = self);
    let o = l._realGlobal_ = l, e = l._global_ || l;
    // verification
    // if( !_global_.WTOOLS_PRIVATE )
    if ((l = e)._global_ = e, "real" === _global_.__GLOBAL_WHICH__) {
      if (_global_.wBase) return _global_.wTools.usePath && _global_.wTools.usePath(__dirname + "/../..") /* xxx : remove later */ , 
      void (module.exports = _global_.wBase);
      if (_global_.wBase) throw new Error("wTools was included several times");
    }
    // config
        if (void 0 === o.__GLOBAL_WHICH__ && (o.__GLOBAL_WHICH__ = "real"), o.Config || (o.Config = {
      debug: !0
    }), void 0 === o.Config.debug && (o.Config.debug = !0), void 0 === o.Config.platform && (o.Config.platform = "undefined" != typeof module && "undefined" != typeof process ? "nodejs" : "browser"), 
    void 0 === o.Config.isWorker && (o.Config.isWorker = !("undefined" == typeof self || self.self !== self || "undefined" == typeof importScripts)), 
    _global_.Config || (_global_.Config = {
      debug: !0
    }), void 0 === _global_.Config.debug && (_global_.Config.debug = !0), void 0 === _global_.Config.platform && (_global_.Config.platform = "undefined" != typeof module && "undefined" != typeof process ? "nodejs" : "browser"), 
    void 0 === _global_.Config.isWorker && (_global_.Config.isWorker = !("undefined" == typeof self || self.self !== self || "undefined" == typeof importScripts)), 
    // if( !_global_.WTOOLS_PRIVATE  )
    "real" === _global_.__GLOBAL_WHICH__ && _global_._ && (_global_.Underscore = _global_._, 
    delete _global_._), Object.hasOwnProperty.call(l, "wTools") && l !== _realGlobal_) throw Error("wTools was already defined");
    //
        l.wTools = Object.create(null), _realGlobal_.wTools = _realGlobal_.wTools || Object.create(null);
    let _ = l.wTools;
    _.__GLOBAL_WHICH__ = l.__GLOBAL_WHICH__, 
    // special globals
    _.def = Symbol.for("def"), _.nothing = Symbol.for("nothing"), _.maybe = Symbol.for("maybe"), 
    _.dont = Symbol.for("dont"), _.unroll = Symbol.for("unroll"), 
    // Self.hold = Symbol.for( 'hold' );
    // type aliases
    _global_.U32x = Uint32Array, _global_.U16x = Uint16Array, _global_.U8x = Uint8Array, 
    _global_.Ux = _global_.U32x, _global_.I32x = Int32Array, _global_.I16x = Int16Array, 
    _global_.I8x = Int8Array, _global_.Ix = _global_.I32x, _global_.F64x = Float64Array, 
    _global_.F32x = Float32Array, _global_.Fx = _global_.F32x, 
    // --
    // export
    // --
    l.wTools = _, l.wTools = _, l.wBase = _, "undefined" != typeof module && null !== module && (module.exports = _);
  }();
  // == end of file aPredefinedS
}();