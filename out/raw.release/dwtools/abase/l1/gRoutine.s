!function gRoutineS() {
  // == begin of file gRoutineS
  !function _gRoutine_s_() {
    "use strict";
    // --
    // routine
    // --
    function _routinesComposeWithSingleArgument_pre(o, t) {
      let s = e.routinesCompose.pre.call(this, o, t);
      return e.assert(1 === t.length), e.assert(2 === arguments.length, "Expects exactly two arguments"), 
      s;
    }
    //
        function routinesComposeReturningLast() {
      let o = e.routinesComposeReturningLast.pre(routinesComposeReturningLast, arguments);
      return e.routinesComposeReturningLast.body(o);
    }
    function routinesComposeAll() {
      let o = e.routinesComposeAll.pre(routinesComposeAll, arguments);
      return e.routinesComposeAll.body(o);
    }
    //
    function routinesComposeAllReturningLast() {
      let o = e.routinesComposeAllReturningLast.pre(routinesComposeAllReturningLast, arguments);
      return e.routinesComposeAllReturningLast.body(o);
    }
    //
    function routinesChain() {
      let o = e.routinesChain.pre(routinesChain, arguments);
      return e.routinesChain.body(o);
    }
    _global_;
    let e = _global_.wTools, o = _global_.wTools;
    var t;
    routinesComposeReturningLast.pre = e.routinesCompose.pre, routinesComposeReturningLast.body = e.routinesCompose.body, 
    routinesComposeReturningLast.defaults = Object.create(e.routinesCompose.defaults), 
    routinesComposeReturningLast.defaults.supervisor = e.compose.supervisor.returningLast, 
    routinesComposeAll.pre = _routinesComposeWithSingleArgument_pre, routinesComposeAll.body = e.routinesCompose.body, 
    (t = routinesComposeAll.defaults = Object.create(e.routinesCompose.defaults)).chainer = e.compose.chainer.composeAll, 
    t.supervisor = e.compose.supervisor.composeAll, e.assert(e.routineIs(e.compose.chainer.originalWithDont)), 
    e.assert(e.routineIs(e.compose.supervisor.composeAll)), routinesComposeAllReturningLast.pre = _routinesComposeWithSingleArgument_pre, 
    routinesComposeAllReturningLast.body = e.routinesCompose.body, (t = routinesComposeAllReturningLast.defaults = Object.create(e.routinesCompose.defaults)).chainer = e.compose.chainer.originalWithDont, 
    t.supervisor = e.compose.supervisor.returningLast, routinesChain.pre = _routinesComposeWithSingleArgument_pre, 
    routinesChain.body = e.routinesCompose.body, (t = routinesChain.defaults = Object.create(e.routinesCompose.defaults)).chainer = e.compose.chainer.chaining, 
    t.supervisor = e.compose.supervisor.chaining;
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
      function _equalizerFromMapper(o) {
        return void 0 === o && (o = function mapper(e, o) {
          return e === o;
        }), e.assert(0, "not tested"), e.assert(1 === arguments.length, "Expects single argument"), 
        e.assert(1 === o.length || 2 === o.length), 1 === o.length ? function equalizerFromMapper(e, t) {
          return o(e) === o(t);
        } : o;
      }
      //
      ,
      _comparatorFromEvaluator: function _comparatorFromEvaluator(o) {
        return void 0 === o && (o = function comparator(e, o) {
          return e - o;
        }), e.assert(1 === arguments.length, "Expects single argument"), e.assert(1 === o.length || 2 === o.length), 
        1 === o.length ? function comparatorFromEvaluator(e, t) {
          return o(e) - o(t);
        } : o;
      }
    };
    // --
    // routines
    // --
        //
    Object.assign(o, s), Object.assign(o, {}), 
    // --
    // export
    // --
    "undefined" != typeof module && null !== module && (module.exports = o);
  }();
  // == end of file gRoutineS
}();