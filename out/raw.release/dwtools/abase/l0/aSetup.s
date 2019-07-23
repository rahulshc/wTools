!function aSetupS() {
  // == begin of file aSetupS
  !function _aSetup_s_() {
    "use strict";
    // --
    // setup
    // --
    function _setupUnhandledErrorHandler0() {
      /* */
      function handleBrowserError(r, o, l, d, a) {
        let t;
        return t = e._handleUnhandledError1 ? e._handleUnhandledError1.apply(this, arguments) : handleError(new Error(r)), 
        n && n.apply(this, arguments), t;
      }
      /* */      function handleNodeError(r) {
        let o;
        if (o = e._handleUnhandledError1 ? e._handleUnhandledError1.apply(this, arguments) : handleError(r), 
        n && n.apply(this, arguments), _appExitError && _appExitError(), e._handleUnhandledError1) return o;
      }
      /* */      function handleError(r) {
        let e = r.toString();
        try {
          e = r.toString();
        } catch (r) {
          debugger;
          console.error(r);
        }
        console.error("------------------------------- unhandled errorr -------------------------------\x3e\n"), 
        console.error(e), console.error(r ? r.stack : ""), console.error("------------------------------- unhandled errorr -------------------------------<\n");
        debugger;
      }
      /* */      function _appExitError() {
        try {
          r.process && (process.exitCode || (process.exitCode = -1));
        } catch (r) {}
      }
      if (r._setupUnhandledErrorHandlerDone) return;
      r._setupUnhandledErrorHandlerDone = 1;
      let n = null;
      if (r.process && "function" == typeof r.process.on) {
        if (n = r.process.onUncaughtException, r.process.on("uncaughtException", handleNodeError), 
        e._handleUnhandledError0 = handleNodeError, n) throw Error("not tested");
      } else Object.hasOwnProperty.call(r, "onerror") && (n = r.onerror, r.onerror = handleBrowserError, 
      e._handleUnhandledError0 = handleBrowserError);
    }
    //
        let r = _global_, e = (r._realGlobal_, r.wTools, r.wTools), n = {
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
    Object.assign(e, {
      _setupUnhandledErrorHandlerDone: 0
    }), Object.assign(e, n), e._setup0(), 
    // --
    // export
    // --
    "undefined" != typeof module && null !== module && (module.exports = e);
  }();
  // == end of file aSetupS
}();