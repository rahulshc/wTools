!function gTimeS() {
  // == begin of file gTimeS
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
    function timeOut_pre(t, n) {
      let o;
      // debugger;
      if (e.assert(2 === arguments.length), e.assert(n), e.mapIs(n[0]) && 1 === n.length) o = n[0]; else {
        let t = n[0], r = n[1];
        if (void 0 === r || e.routineIs(r) || e.consequenceIs(r)) {
          if (e.routineIs(r) && !e.consequenceIs(r)) {
            let e = r;
            r = function timeOutEnd() {
              let t = e.apply(this, arguments);
              return void 0 === t ? null : t;
            };
          }
        } else {
          e.assert(2 === n.length, "Expects two arguments if second one is not callable");
          let t = r;
          r = function onEnd() {
            return t;
          };
        }
        e.assert(n.length <= 4), void 0 !== n[1] && void 0 === n[2] && void 0 === n[3] ? e.assert(e.routineIs(r) || e.consequenceIs(r)) : void 0 === n[2] && void 0 === n[3] || e.assert(e.routineIs(n[2])), 
        // if( args[ 2 ] !== undefined || args[ 3 ] !== undefined )
        // debugger;
        void 0 === n[2] && void 0 === n[3] || (r = e.routineJoin.call(e, n[1], n[2], n[3])), 
        o = {
          delay: t,
          onEnd: r
        };
      }
      // debugger;
            return e.routineOptions(t, o), e.assert(e.numberIs(o.delay)), e.assert(null === o.onEnd || e.routineIs(o.onEnd)), 
      o;
    }
    //
        function timeOut_body(t) {
      let n = e.Consequence ? new e.Consequence() : void 0, r = null, i = !1;
      // if( o.delay > 0 )
      // timer = _.timeBegin( o.delay, timeEnd );
      // else
      // timeSoon( timeEnd );
      return e.assertRoutineOptions(timeOut_body, arguments), 
      /* */
      n && (
      // debugger;
      n.procedure("timeOut").sourcePath(t.stackLevel + 2), 
      // debugger;
      n.give(function timeGot(e, t) {
        e && clearTimeout(r), n.take(e, t);
      }))
      /* */ , r = e.timeBegin(t.delay, 
      /* */
      function timeEnd() {
        i = !0, n ? t.onEnd ? n.first(t.onEnd) : n.take(o) : t.onEnd();
      }), n;
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
      let n = t.stackLevel;
      t.stackLevel += 1;
      let o = e.timeOut.body.call(e, t);
      return o.tag = "TimeOutError", o.procedure("timeOutError").sourcePath(n + 2), o.finally(function(t, n) {
        return t ? e.Consequence().error(t) : (t = e.err("Time out!"), Object.defineProperty(t, "timeOut", {
          enumerable: !1,
          configurable: !1,
          writable: !1,
          value: 1
        }), e.Consequence().error(t));
      }), o;
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
    let e = _global_.wTools, t = _global_.wTools, n = (Array.prototype.indexOf, Array.prototype.lastIndexOf, 
    Array.prototype.slice, Array.prototype.splice, Function.prototype.bind, Object.prototype.toString, 
    Object.hasOwnProperty, Object.propertyIsEnumerable, Math.ceil, Math.floor, Math.pow(2, 31) - 1);
    timeOut_body.defaults = {
      delay: null,
      onEnd: null,
      stackLevel: 1
    };
    let o = e.routineFromPreAndBody(timeOut_pre, timeOut_body), r = "undefined" == typeof process ? function(e) {
      return setTimeout(e, 0);
    } : process.nextTick;
    //
        timeOutError_body.defaults = Object.create(timeOut_body.defaults);
    let i = e.routineFromPreAndBody(timeOut_pre, timeOutError_body), u = {
      timeBegin: function timeBegin(t, o) {
        /* */
        function out() {
          o && o(i);
        }
        let i = null;
        return void 0 === t && (t = Infinity), t >= n && (t = n), e.assert(arguments.length <= 4), 
        e.assert(e.numberIs(t)), void 0 === arguments[2] && void 0 === arguments[3] || (o = e.routineJoin.call(e, arguments[1], arguments[2], arguments[3])), 
        i = t > 0 ? setTimeout(out, t) : r(out);
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
        let n = 0;
        if (e.numberIs(arguments[0]) && (n = arguments[0], t = arguments[1]), "undefined" != typeof window && "undefined" != typeof document && "complete" != document.readyState) {
          let o = e.Consequence ? new e.Consequence({
            tag: "timeReady"
          }) : null;
          return window.addEventListener("load", function handleReady() {
            if (e.Consequence) return e.timeOut(n, t).finally(o);
            t ? e.timeBegin(n, t) : e.assert(0);
          }), o;
        }
        if (e.Consequence) return e.timeOut(n, t);
        t ? e.timeBegin(n, t) : e.assert(0);
      }
      //
      ,
      timeReadyJoin: function timeReadyJoin(t, n, o) {
        let r = e.routineJoin(t, n, o);
        return function _timeReady() {
          let t = arguments, n = e.routineSeal(this, r, t);
          return e.timeReady(n);
        };
      }
      //
      ,
      timeOnce: function timeOnce(t, n, o) {
        let r, i = e.Consequence ? new e.Consequence() : void 0, u = !1;
        return e.objectIs(t) ? (r = t, e.assert(1 === arguments.length, "Expects single argument"), 
        e.assertMapHasOnly(r, {
          delay: null,
          onBegin: null,
          onEnd: null
        }), t = r.delay, n = r.onBegin, o = r.onEnd) : e.assert(2 <= arguments.length && arguments.length <= 3), 
        e.assert(t >= 0), e.assert(e.primitiveIs(n) || e.routineIs(n) || e.objectIs(n)), 
        e.assert(e.primitiveIs(o) || e.routineIs(o) || e.objectIs(o)), function timeOnce() {
          if (!u) return u = !0, n && (e.routineIs(n) ? n.apply(this, arguments) : e.objectIs(n) && n.take(arguments), 
          i && i.take(null)), e.timeOut(t, function() {
            o && (e.routineIs(o) ? o.apply(this, arguments) : e.objectIs(o) && o.take(arguments), 
            i && i.take(null)), u = !1;
          }), i;
        };
      },
      timeOut: o,
      timeSoon: r,
      timeOutError: i,
      timePeriodic: 
      //
      function timePeriodic(t, n) {
        function handlePeriodicCon(e) {
          e && clearInterval(o);
        }
        e.assert(e.routineIs(e.Consequence));
        let o, r = new e.Consequence();
        e.assert(2 === arguments.length, "Expects exactly two arguments"), 
        // if( arguments.length > 2 )
        // {
        //   throw _.err( 'Not tested' );
        //   _.assert( arguments.length <= 4 );
        //   onReady = _.routineJoin( arguments[ 2 ], onReady[ 3 ], arguments[ 4 ] );
        // }
        e.assert(e.numberIs(t));
        let i = null;
        if (e.routineIs(n)) i = function() {
          !1 === n.call() && clearInterval(o), e.Consequence.take(r, void 0), r.finally(handlePeriodicCon);
        }; else if (n instanceof wConsquence) i = function() {
          !1 === n.ping() && clearInterval(o), e.Consequence.take(r, void 0), r.finally(handlePeriodicCon);
        }; else {
          if (void 0 !== n) throw e.err("unexpected type of onReady");
          i = function() {
            e.Consequence.take(r, void 0), r.finally(handlePeriodicCon);
          };
        }
        return o = setInterval(i, t), r;
      },
      /* dubious */
      _timeNow_functor: _timeNow_functor,
      timeNow: _timeNow_functor(),
      timeFewer_functor: function timeFewer_functor(t, n) {
        let o = e.timeNow() - t;
        return e.assert(2 === arguments.length), e.assert(e.numberIs(t)), e.assert(e.routineIs(n)), 
        function fewer() {
          let r = e.timeNow();
          if (!(r - o < t)) return o = r, n.apply(this, arguments);
        };
      }
      //
      ,
      timeFrom: function timeFrom(t) {
        return e.assert(1 === arguments.length), e.numberIs(t) ? t : e.dateIs(t) ? t.getTime() : void e.assert(0, "Not clear how to coerce to time", e.strType(t));
      }
      //
      ,
      timeSpent: function timeSpent(t, n) {
        let o = e.timeNow();
        return 1 === arguments.length && (n = arguments[0], t = ""), e.assert(1 <= arguments.length && arguments.length <= 2), 
        e.assert(e.numberIs(n)), e.assert(e.strIs(t)), t + e.timeSpentFormat(o - n);
      }
      //
      ,
      timeSpentFormat: function timeSpentFormat(t) {
        return e.timeNow(), e.assert(1 === arguments.length), e.assert(e.numberIs(t)), (.001 * t).toFixed(3) + "s";
      }
      //
      ,
      dateToStr: function dateToStr(e) {
        let t = e.getFullYear(), n = e.getMonth() + 1, o = e.getDate();
        return n < 10 && (n = "0" + n), o < 10 && (o = "0" + o), [ t, n, o ].join(".");
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
    Object.assign(t, u), Object.assign(t, {}), 
    // --
    // export
    // --
    "undefined" != typeof module && null !== module && (module.exports = t);
  }();
  // == end of file gTimeS
}();