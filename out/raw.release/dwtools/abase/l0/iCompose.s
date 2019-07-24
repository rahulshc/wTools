!function iComposeS() {
  // == begin of file iComposeS
  !function _iCompose_s_() {
    "use strict";
    _global_;
    let n = _global_.wTools, o = _global_.wTools.compose = _global_.wTools.compose || Object.create(null), t = (Array.prototype.slice, 
    Function.prototype.bind, Object.hasOwnProperty, {
      chainer: {
        original: 
        // --
        // chainer
        // --
        function originaChainer(o, t, e, r) {
          return n.assert(!1 !== t), o;
        }
        //
        ,
        originalWithDont: function originalWithDontChainer(o, t, e, r) {
          // _.assert( result !== false && result !== undefined );
          return n.assert(!1 !== t), t === n.dont ? n.dont : o;
          // return undefined;
                }
        //
        ,
        composeAll: function composeAllChainer(o, t, e, r) {
          // if( result === undefined )
          // return args;
          return n.assert(!1 !== t), t === n.dont ? n.dont : o;
          // return undefined;
          // return _.unrollFrom( result );
                }
        //
        ,
        chaining: function chainingChainer(o, t, e, r) {
          return n.assert(!1 !== t), void 0 === t ? o : t === n.dont ? n.dont : n.unrollFrom(t);
        }
        // --
        // supervisor
        // --
            },
      supervisor: {
        returningLast: function returningLastSupervisor(n, o, t, e) {
          let r = t.apply(n, o);
          return r[r.length - 1];
        }
        //
        ,
        composeAll: function composeAllSupervisor(o, t, e, r) {
          let i = e.apply(o, t);
          return n.assert(!!i), i.length ? i[i.length - 1] !== n.dont && !!n.all(i) && i : i;
        }
        //
        ,
        chaining: function chainingSupervisor(o, t, e, r) {
          let i = e.apply(o, t);
          return i[i.length - 1] === n.dont && i.pop(), i;
        }
        // --
        // declare
        // --
            }
    });
    Object.assign(o, t), 
    // --
    // export
    // --
    "undefined" != typeof module && null !== module && (module.exports = o);
  }();
  // == end of file iComposeS
}();