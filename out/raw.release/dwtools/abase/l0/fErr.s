!function fErrS() {
  // == begin of file fErrS
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
          Object.defineProperty(r, e, {
            enumerable: !1,
            configurable: !0,
            writable: !0,
            value: n
          });
        } catch (e) {
          console.error(e);
          debugger;
          if (t.debuggerEnabled) debugger;
        }
      }
      /* */      let r;
      if (1 !== arguments.length) throw Error("_err : expects single argument");
      if (!t.longIs(e.args)) throw Error("_err : o.args should be array like");
      if (void 0 === e.usingSourceCode && (e.usingSourceCode = _err.defaults.usingSourceCode), 
      void 0 === e.condensingStack && (e.condensingStack = _err.defaults.condensingStack), 
      ("not implemented" === e.args[0] || "not tested" === e.args[0] || "unexpected" === e.args[0]) && t.debuggerEnabled) debugger;
      /* let */      let n = "", o = "", s = "", l = [], a = 0;
      /* Error.stackTraceLimit = 99; */
      /* find error in arguments */
      for (let n = 0; n < e.args.length; n++) {
        let i = e.args[n];
        if (!t.errIs(i) && t.routineIs(i)) {
          if (0 === i.length) ; else debugger;
          if (0 === i.length && (i = e.args[n] = i()), t.unrollIs(i)) {
            e.args = t.longButRange(e.args, [ n, n + 1 ], i), n -= 1;
            continue;
          }
        }
        if (t.errIs(i)) {
          if (r || (o = (r = i).catches || "", s = r.sourceCode || "", 
          // if( o.args.length === 1 )
          a = r.attended), void 0 === i.attentionRequested && Object.defineProperty(i, "attentionRequested", {
            enumerable: !1,
            configurable: !0,
            writable: !0,
            value: 0
          }), void 0 !== i.originalMessage) e.args[n] = i.originalMessage; else {
            e.args[n] = i.message || i.msg || i.constructor.name || "unknown error";
            let r = t.mapFields(i);
            Object.keys(r).length && (e.args[n] += "\n" + t.toStr(r, {
              wrap: 0,
              multiline: 1,
              levels: 2
            }));
          }
          l.length > 0 && (e.args[n] = "\n" + e.args[n]), l.push(i), e.location = t.diagnosticLocation({
            error: i,
            location: e.location
          });
        }
      }
      /* look into non-error arguments to find location */      if (!r) for (let r = 0; r < e.args.length; r++) {
        let n = e.args[r];
        !t.primitiveIs(n) && t.objectLike(n) && (e.location = t.diagnosticLocation({
          error: n,
          location: e.location
        }));
      }
      e.location = e.location || Object.create(null), 
      /* level */
      t.numberIs(e.level) || (e.level = _err.defaults.level)
      /* make new one if no error in arguments */;
      let i = e.stack, c = "";
      r ? void 0 !== r.stack ? void 0 !== r.originalMessage ? (i = r.stack, c = r.stackCondensed) : i = t.diagnosticStack(r) : i = t.diagnosticStack([ e.level, Infinity ]) : (i || (i = e.fallBackStack), 
      r = new Error(n + "\n"), i || (i = t.diagnosticStack(r, [ e.level, -1 ]), e.location.full && -1 === i.indexOf("\n") && (i = e.location.full))), 
      i || (i = e.fallBackStack), t.strIs(i) && !t.strEnds(i, "\n") && (i += "\n"), i && !c && (c = t.diagnosticStackCondense(i))
      /* collect data */;
      for (let r = 0; r < e.args.length; r++) {
        let o, s = e.args[r];
        o = s && !t.primitiveIs(s) ? t.primitiveIs(s) ? String(s) : t.routineIs(s.toStr) ? s.toStr() : t.errIs(s) || t.strIs(s.message) ? t.strIs(s.originalMessage) ? s.originalMessage : t.strIs(s.message) ? s.message : t.toStr(s) : t.toStr(s, {
          levels: 2
        }) : void 0 === s ? "\n" + String(s) + "\n" : String(s), t.strIs(o) && "\n" === o[o.length - 1] ? n += o : n += o + " ";
      }
      /* source code */      if (e.usingSourceCode && void 0 === r.sourceCode) {
        let n = "";
        e.location = t.diagnosticLocation({
          error: r,
          stack: i,
          location: e.location
        }), (n = t.diagnosticCode({
          location: e.location,
          sourceCode: e.sourceCode
        })) && n.length < 400 && (s += n);
      }
      /* where it was caught */      let u = t.diagnosticLocation(e.level);
      if (u.service && 1 !== u.service) debugger;
      /* message */ else o = "    caught at " + u.fullWithRoutine + "\n" + o;
      let g = r.briefly || e.briefly, d = function messageForm() {
        let r = "";
        return g ? r += n : (r += " = Message\n" + n + "\n", e.condensingStack ? r += "\n = Condensed calls stack\n" + c : r += "\n = Functions stack\n" + i, 
        r += "\n = Catches stack\n" + o + "\n", s && (r += " = Source code from " + s + "\n")), 
        r;
      }();
      /* fields */
      return void 0 !== e.location.line && nonenurable("lineNumber", e.location.line), 
      nonenurable("toString", function() {
        return this.message;
      }), nonenurable("message", d), nonenurable("originalMessage", n), nonenurable("level", e.level), 
      nonenurable("stack", i), nonenurable("stackCondensed", c), e.briefly && nonenurable("briefly", e.briefly), 
      nonenurable("sourceCode", s || null), void 0 === r.location && nonenurable("location", e.location), 
      nonenurable("attended", a), nonenurable("catches", o), nonenurable("catchCounter", r.catchCounter ? r.catchCounter + 1 : 1), 
      r;
    }
    // --
    // sure
    // --
    function _sureDebugger(e) {
      if (t.debuggerEnabled) debugger;
    }
    //
        let e = Object.hasOwnProperty, r = _global_, t = _global_.wTools, n = _global_.wTools;
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
    let o = {
      // error,
      error: Object.create(null),
      debuggerEnabled: !0
    }, s = {
      // stub
      diagnosticStack: 
      // --
      // stub
      // --
      function diagnosticStack(e) {
        return t.errIs(e) ? e.stack || e : new Error().stack;
      }
      //
      ,
      diagnosticStackCondense: function diagnosticStackCondense(e) {
        return t.errIs(e) ? e.stack || e : new Error().stack;
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
        return !1 !== t.errIs(e) && void 0 !== e.originalMessage;
      }
      //
      ,
      errIsAttended: function errIsAttended(e) {
        return !1 !== t.errIs(e) && !!e.attended;
      }
      //
      ,
      errIsAttentionRequested: function errIsAttentionRequested(e) {
        return !1 !== t.errIs(e) && e.attentionRequested;
      }
      //
      ,
      errAttentionRequest: function errAttentionRequest(e) {
        if (1 !== arguments.length) throw Error("errAttentionRequest : Expects one argument");
        if (!t.errIs(e)) throw Error("errAttentionRequest : Expects error as the first argument");
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
      errAttend: function errAttend(e, r) {
        1 === arguments.length && t.errIsRefined(e) || (e = _err({
          args: arguments,
          level: 2
        }))
        /* */;
        try {
          r && Object.defineProperty(e, "attentionRequested", {
            enumerable: !1,
            configurable: !0,
            writable: !0,
            value: 0
          }), Object.defineProperty(e, "attended", {
            enumerable: !1,
            configurable: !0,
            writable: !0,
            value: t.diagnosticStack([ 1, Infinity ])
          });
        } catch (e) {
          logger.warn("Cant assign attentionRequested and attended properties to error " + e.toString());
        }
        /* */        return e;
      }
      //
      ,
      errRestack: function errRestack(e, r) {
        void 0 === r && (r = 1);
        let n = t._err({
          args: [],
          level: r + 1
        });
        return t.err(n, e);
      }
      //
      ,
      error_functor: function error_functor(e, n) {
        if (t.strIs(n) || t.arrayIs(n)) {
          let e = n;
          n = function onErrorMake() {
            debugger;
            return t.arrayAppendArrays([], [ e, arguments ]), args;
          };
        } else n || (n = function onErrorMake() {
          return arguments;
        });
        let o = {
          [e]: function() {
            if (this instanceof o) return t.assert(0 === arguments.length), this;
            {
              let e = new o(), s = n.apply(e, arguments);
              t.assert(t.arrayLike(s));
              let l = t.arrayAppendArrays([], [ [ e, arguments.length ? "\n" : "" ], s ]), a = t._err({
                args: l,
                level: 3
              });
              return t.assert(e === a), t.assert(a instanceof r.Error), t.assert(a instanceof o), 
              t.assert(!!a.stack), a;
            }
          }
        }[e];
        return t.assert(o.name === e, "Looks like your interpreter does not support dynamice naming of functions. Please use ES2015 or later interpreter."), 
        o.prototype = Object.create(r.Error.prototype), o.prototype.constructor = o, o.constructor = o, 
        o;
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
        r.logger || r.console;
        let e = _err({
          args: arguments,
          level: 2
        });
        return t._errLog(e);
      }
      //
      ,
      errLogOnce: function errLogOnce(e) {
        return (e = _err({
          args: arguments,
          level: 2
        })).attended ? e : t._errLog(e);
      }
      //
      ,
      _errLog: function _errLog(e) {
        let n = r.logger || r.console;
        debugger;
        /* */        if (t.routineIs(e.toString)) {
          let r = e.toString();
          t.loggerIs(n), n.error(r);
        } else {
          debugger;
          n.error("Error does not have toString"), n.error(e);
        }
        /* */        
        /* */
        return t.errAttend(e), e;
      }
      //
      ,
      errOnce: function errOnce(e) {
        if (!(e = _err({
          args: arguments,
          level: 2
        })).attended) return t.errAttend(e), e;
      }
      // --
      // checker
      // --
      ,
      // checker
      checkInstanceOrClass: function checkInstanceOrClass(e, r) {
        t.assert(2 === arguments.length, "Expects exactly two arguments");
        debugger;
        return r === e || r instanceof e || Object.isPrototypeOf.call(e, r) || Object.isPrototypeOf.call(e, r.prototype);
      }
      //
      ,
      checkOwnNoConstructor: function checkOwnNoConstructor(r) {
        return t.assert(t.objectLikeOrRoutine(r)), t.assert(1 === arguments.length), !e.call(r, "constructor");
      },
      // sure
      sure: function sure(e) {
        if (!e || !function boolLike(e) {
          let r = Object.prototype.toString.call(e);
          return "[object Boolean]" === r || "[object Number]" === r;
        }(e)) throw _sureDebugger(), 1 === arguments.length ? _err({
          args: [ "Assertion fails" ],
          level: 2
        }) : 2 === arguments.length ? _err({
          args: [ arguments[1] ],
          level: 2
        }) : _err({
          args: t.longSlice(arguments, 1),
          level: 2
        });
      }
      //
      ,
      sureBriefly: function sureBriefly(e) {
        if (!e || !function boolLike(e) {
          let r = Object.prototype.toString.call(e);
          return "[object Boolean]" === r || "[object Number]" === r;
        }(e)) throw _sureDebugger(), 1 === arguments.length ? _err({
          args: [ "Assertion fails" ],
          level: 2,
          briefly: 1
        }) : 2 === arguments.length ? _err({
          args: [ arguments[1] ],
          level: 2,
          briefly: 1
        }) : _err({
          args: t.longSlice(arguments, 1),
          level: 2,
          briefly: 1
        });
      }
      //
      ,
      sureWithoutDebugger: function sureWithoutDebugger(e) {
        if (!e || !function boolLike(e) {
          let r = Object.prototype.toString.call(e);
          return "[object Boolean]" === r || "[object Number]" === r;
        }(e)) throw 1 === arguments.length ? _err({
          args: [ "Assertion fails" ],
          level: 2
        }) : 2 === arguments.length ? _err({
          args: [ arguments[1] ],
          level: 2
        }) : _err({
          args: t.longSlice(arguments, 1),
          level: 2
        });
      }
      //
      ,
      sureInstanceOrClass: function sureInstanceOrClass(e, r) {
        t.sure(2 === arguments.length, "Expects exactly two arguments"), t.sure(t.checkInstanceOrClass(e, r));
      }
      //
      ,
      sureOwnNoConstructor: function sureOwnNoConstructor(e) {
        t.sure(t.objectLikeOrRoutine(e));
        let r = t.longSlice(arguments);
        r[0] = t.checkOwnNoConstructor(e), t.sure.apply(t, r);
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
        if (!e) throw function _assertDebugger(e, r) {
          if (t.debuggerEnabled) {
            _err({
              args: t.longSlice(r, 1),
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
          args: t.longSlice(arguments, 1),
          level: 2
        });
        return !0;
      }
      //
      ,
      assertWithoutBreakpoint: function assertWithoutBreakpoint(e) {
        if (!e || !t.boolLike(e)) throw 1 === arguments.length ? _err({
          args: [ "Assertion fails" ],
          level: 2
        }) : 2 === arguments.length ? _err({
          args: [ arguments[1] ],
          level: 2
        }) : _err({
          args: t.longSlice(arguments, 1),
          level: 2
        });
      }
      //
      ,
      assertNotTested: function assertNotTested(e) {
        if (t.debuggerEnabled) debugger;
        t.assert(!1, "not tested : " + stack(1));
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
      assertInstanceOrClass: function assertInstanceOrClass(e, r) {
        t.assert(2 === arguments.length, "Expects exactly two arguments"), t.assert(t.checkInstanceOrClass(e, r));
      }
      //
      ,
      assertOwnNoConstructor: function assertOwnNoConstructor(e) {
        t.assert(t.objectLikeOrRoutine(e));
        let r = t.longSlice(arguments);
        r[0] = t.checkOwnNoConstructor(e), 1 === r.length && r.push(() => "Entity should not own constructor, but own " + t.toStrShort(e)), 
        t.assert.apply(t, r);
      }
    };
    // --
    // routines
    // --
        //
    Object.assign(n, s), Object.assign(n, o), Error.stackTraceLimit = Infinity, 
    // --
    // export
    // --
    "undefined" != typeof module && null !== module && (module.exports = n);
  }();
  // == end of file fErrS
}();