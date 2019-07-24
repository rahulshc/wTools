!function zSetupS() {
  // == begin of file zSetupS
  !function _zSetup_s_() {
    "use strict";
    let e = _global_, r = e.wTools, o = e.wTools, t = {
      _setupUnhandledErrorHandler1: 
      // --
      // setup
      // --
      function _setupUnhandledErrorHandler1() {
        /* */
        function handleError(e) {
          /* */
          try {
            if (r.errIsAttended(e)) return;
          } catch (e) {
            debugger;
            console.error(e);
          }
          /* */          if (r.appExitCode) try {
            r.appExitCode(-1);
          } catch (e) {
            debugger;
            console.log(e);
          }
          /* */          console.error("------------------------------- unhandled errorr -------------------------------\x3e\n");
          /* */
          try {
            console.error(" * Application"), console.error(r.diagnosticApplicationEntryPointInfo() + "\n");
          } catch (e) {
            debugger;
            console.error(e);
          }
          /* */          if (!e.originalMessage && r.objectLike && r.objectLike(e)) try {
            r.toStr && r.field && r.toStr.fields(e, {
              errorAsMap: 1
            }), console.error(e);
          } catch (e) {
            debugger;
            console.error(e);
          }
          try {
            r.errLog ? r.errLog(e) : console.error(e);
          } catch (r) {
            debugger;
            console.error(r), console.error(e);
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
        e.process && r.routineIs(e.process.on) ? o._handleUnhandledError1 = 
        /* */
        function handleNodeError(e) {
          return handleError(e);
        } : Object.hasOwnProperty.call(e, "onerror") && (o._handleUnhandledError1 = 
        /* */
        function handleBrowserError(e, o, t, n, l) {
          let s = l;
          return r._err && (s = r._err({
            args: [ l ],
            level: 1,
            fallBackStack: "at handleError @ " + o + ":" + t,
            location: {
              path: o,
              line: t,
              col: n
            }
          })), handleError(s);
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
          return _realGlobal_.wTests || (_realGlobal_.wTests = Object.create(null)), e.suiteFilePath || (e.suiteFilePath = r.diagnosticLocation(1).path), 
          e.suiteFileLocation || (e.suiteFileLocation = r.diagnosticLocation(1).full), r.assert(r.strDefined(e.suiteFileLocation), "Test suit expects a mandatory option ( suiteFileLocation )"), 
          r.assert(r.objectIs(e)), e.abstract || r.assert(!_realGlobal_.wTests[e.name], 'Test suit with name "' + e.name + '" already registered!'), 
          _realGlobal_.wTests[e.name] = e, e.inherit = function inherit() {
            this.inherit = r.longSlice(arguments);
          }, e;
        }
        /* */), _realGlobal_.wTester || (_realGlobal_.wTester = Object.create(null), _realGlobal_.wTester.test = function test(e) {
          if (!r.workerIs()) {
            r.assert(0 === arguments.length || 1 === arguments.length), r.assert(r.strIs(e) || void 0 === e, "test : expects string {-testSuitName-}");
            debugger;
            r.timeReady(function() {
              debugger;
              if (_realGlobal_.wTester.test === test) throw r.err("Cant wTesting.test, missing wTesting package");
              _realGlobal_.wTester.test.call(_realGlobal_.wTester, e);
            });
          }
        });
      }
      //
      ,
      _setup1: function _setup1() {
        o._sourcePath = r.diagnosticStack([ 1, Infinity ]), r.assert(!1 !== e._WTOOLS_SETUP_EXPECTED_), 
        !1 !== e._WTOOLS_SETUP_EXPECTED_ && (r._setupConfig(), r._setupUnhandledErrorHandler1(), 
        r._setupLoggerPlaceholder(), r._setupTesterPlaceholder()), r.assert(!!o.timeNow);
      }
      // --
      // routines
      // --
        };
    Object.assign(o, t), o._setup1(), 
    // --
    // export
    // --
    "undefined" != typeof module && null !== module && (module.exports = o);
  }();
  // == end of file zSetupS
}();