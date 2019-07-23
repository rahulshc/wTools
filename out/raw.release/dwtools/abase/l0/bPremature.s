!function bPrematureS() {
  // == begin of file bPrematureS
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
 */    function routineIs(t) {
      return "[object Function]" === e.call(t);
    }
    //
    /**
 * Returns true if entity ( src ) is an Object.
 * @function objectIs
 * @param {} src - entity to check
 * @memberof wTools
 */    function objectIs(t) {
      return "[object Object]" === e.call(t);
    }
    //
    /**
 * Returns true if entity ( src ) is an Arguments object.
 * @function argumentsArrayIs
 * @param {} src - entity to check
 * @memberof wTools
 */    function argumentsArrayIs(t) {
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
 */    function assert(e, t) {
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
 */    function routineOptions(e, r, o) {
      argumentsArrayIs(r) || (r = [ r ]);
      let n = r[0];
      void 0 === n && (n = Object.create(null)), o = o || e.defaults, assert(2 === arguments.length || 3 === arguments.length, "Expects 2 or 3 arguments"), 
      assert(routineIs(e), "Expects routine"), assert(objectIs(o), "Expects routine with defined defaults or defaults in third argument"), 
      assert(objectIs(n), "Expects object"), assert(0 === r.length || 1 === r.length, () => "Expects single options map, but got " + r.length + " arguments"), 
      //
      function mapSupplementStructureless(e, r) {
        if (null === e && 2 === arguments.length) return Object.assign(Object.create(null), r);
        null === e && (e = Object.create(null));
        for (let o = 1; o < arguments.length; o++) {
          r = arguments[o];
          for (let o in r) if (void 0 === e[o]) {
            if (t.objectLike(r[o]) || t.arrayLike(r[o])) {
              debugger;
              throw Error("Source map should have only primitive elements, but " + o + " is " + r[o]);
            }
            e[o] = r[o];
          }
        }
      }
      //
      (n, o);
      /* xxx qqq : use instead of mapComplement */
      // _.mapComplement( options, defaults );
      // _.assertMapHasNoUndefine( options );
      for (let e in n) assert(void 0 !== o[e], () => "Unknown option " + e);
      return n;
    }
    function vectorize_pre(e, r) {
      let o = r[0];
      return 2 === r.length ? o = {
        routine: r[0],
        select: r[1]
      } : (routineIs(o) || strIs(o)) && (o = {
        routine: r[0]
      }), routineOptions(e, o), assert(2 === arguments.length, "Expects exactly two arguments"), 
      assert(routineIs(o.routine) || strIs(o.routine) || t.strsAreAll(o.routine), () => "Expects routine {-o.routine-}, but got " + o.routine), 
      assert(1 === r.length || 2 === r.length), assert(o.select >= 1 || strIs(o.select) || t.arrayIs(o.select), () => "Expects {-o.select-} as number >= 1, string or array, but got " + o.select), 
      o;
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
        if (n && !arguments.length) return [];
        let e = arguments, o = e[0];
        if (t.longIs(o)) {
          let n = t.longSlice(e), l = [];
          for (let e = 0; e < o.length; e++) n[0] = o[e], l[e] = r.apply(this, n);
          return l;
        }
        return r.apply(this, e);
      }
      /* - */      
      /* - */
      function vectorizeForOptionsMap(e) {
        if (n && !arguments.length) return [];
        let o = e[c];
        if (assert(1 === arguments.length, "Expects single argument"), t.longIs(o)) {
          let n = t.longSlice(arguments);
          a && (n = a(r, n), assert(t.arrayLikeResizable(n)));
          let l = [];
          for (let i = 0; i < o.length; i++) n[0] = t.mapExtend(null, e), n[0][c] = o[i], 
          l[i] = r.apply(this, n);
          return l;
        }
        return r.apply(this, arguments);
      }
      /* - */      t.assertRoutineOptions(vectorize_body, arguments), t.arrayIs(e.routine) && 1 === e.routine.length && (e.routine = e.routine[0]);
      let r = e.routine, o = e.fieldFilter, n = (e.bypassingFilteredOut, e.bypassingEmpty), l = e.vectorizingArray, i = e.vectorizingMapVals, s = e.vectorizingMapKeys, a = null, c = null === e.select ? 1 : e.select, u = Infinity === e.select, p = c > 1 ? function multiplyReally(e) {
        let r, o;
        e = t.longSlice(e), u && (c = e.length), assert(e.length === c, () => "Expects " + c + " arguments, but got " + e.length);
        for (let n = 0; n < c; n++) {
          if (l && t.arrayIs(e[n])) {
            r = e[n].length;
            break;
          }
          if (i && t.mapIs(e[n])) {
            o = t.mapOwnKeys(e[n]);
            break;
          }
        }
        if (void 0 !== r) for (let o = 0; o < c; o++) {
          if (i) assert(!t.mapIs(e[o]), () => "Arguments should have only arrays or only maps, but not both. Incorrect argument : " + e[o]); else if (s && t.mapIs(e[o])) continue;
          e[o] = t.multiple(e[o], r);
        } else if (void 0 !== o) for (let r = 0; r < c; r++) if (t.mapIs(e[r])) assert(t.arraySetIdentical(t.mapOwnKeys(e[r]), o), () => "Maps should have same keys : " + o); else {
          l && assert(!t.longIs(e[r]), () => "Arguments should have only arrays or only maps, but not both. Incorrect argument : " + e[r]);
          let n = Object.create(null);
          t.mapSetWithKeys(n, o, e[r]), e[r] = n;
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
      let y = vectorizeArray;
      /* */
      return t.numberIs(c) ? l || i || s ? o ? y = 
      /* - */
      function vectorizeWithFilters(e) {
        assert(0, "not tested"), assert(1 === arguments.length, "Expects single argument");
        let o = p(arguments);
        if (l && t.longIs(e)) throw o = t.longSlice(o), t.err("not tested");
        if (i && t.mapIs(e)) throw o = t.longSlice(o), Object.create(null), t.err("not tested");
        return r.call(this, e);
      }
      /* - */ : s ? 
      // assert( !vectorizingMapVals, '{-o.vectorizingMapKeys-} and {-o.vectorizingMapVals-} should not be enabled at the same time' );
      i ? (assert(1 === c, "Only single argument is allowed if {-o.vectorizingMapKeys-} and {-o.vectorizingMapVals-} are enabled."), 
      y = 
      /* - */
      function vectorizeMapWithKeysOrArray() {
        if (n && !arguments.length) return [];
        let e = p(arguments), o = e[0];
        if (assert(e.length === c, () => "Expects " + c + " arguments but got : " + e.length), 
        s && i && t.mapIs(o)) {
          let e = Object.create(null);
          for (let t in o) {
            let n = r.call(this, o[t]);
            e[r.call(this, t)] = n;
          }
          return e;
        }
        if (l && t.arrayIs(o)) {
          let e = [];
          for (let t = 0; t < o.length; t++) e[t] = r.call(this, o[t]);
          return e;
        }
        return r.apply(this, arguments);
      }) : y = function vectorizeKeysOrArray() {
        // yyy
        if (n && !arguments.length) return [];
        // yyy
                let e, o, i, a, u, y = p(arguments), g = y[0];
        if (assert(y.length === c, () => "Expects " + c + " arguments but got : " + y.length), 
        s) for (let e = 0; e < c; e++) l && t.arrayIs(y[e]) ? u = y[e] : t.mapIs(y[e]) && (assert(void 0 === i, () => "Arguments should have only single map. Incorrect argument : " + y[e]), 
        i = y[e], a = e);
        if (i) {
          if (o = Object.create(null), e = t.longSlice(y), l && t.arrayIs(u)) for (let t = 0; t < u.length; t++) {
            for (let r = 0; r < c; r++) e[r] = y[r][t];
            for (let t in i) e[a] = t, o[r.apply(this, e)] = i[t];
          } else for (let t in i) e[a] = t, o[r.apply(this, e)] = i[t];
          return o;
        }
        if (l && t.longIs(g)) {
          e = t.longSlice(y), o = [];
          for (let t = 0; t < g.length; t++) {
            for (let r = 0; r < c; r++) e[r] = y[r][t];
            o[t] = r.apply(this, e);
          }
          return o;
        }
        return r.apply(this, arguments);
      } : y = !l || i ? 
      /* - */
      function vectorizeMapOrArray() {
        if (n && !arguments.length) return [];
        let e = p(arguments), o = e[0];
        if (l && t.longIs(o)) {
          let n = t.longSlice(e), l = [];
          for (let t = 0; t < o.length; t++) {
            for (let r = 0; r < c; r++) n[r] = e[r][t];
            l[t] = r.apply(this, n);
          }
          return l;
        }
        if (i && t.mapIs(o)) {
          let n = t.longSlice(e), l = Object.create(null);
          for (let t in o) {
            for (let r = 0; r < c; r++) n[r] = e[r][t];
            l[t] = r.apply(this, n);
          }
          return l;
        }
        return r.apply(this, arguments);
      } : p === multiplyNo ? vectorizeArray : function vectorizeArrayMultiplying() {
        if (n && !arguments.length) return [];
        let e = p(arguments), o = e[0];
        if (t.longIs(o)) {
          let n = t.longSlice(e), l = [];
          for (let t = 0; t < o.length; t++) {
            for (let r = 0; r < c; r++) n[r] = e[r][t];
            l[t] = r.apply(this, n);
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
    */ : y = r : (assert(p === multiplyNo, "not implemented"), r.pre && (a = r.pre, r = r.body), 
      o ? assert(0, "not implemented") : l || !i ? y = strIs(c) ? vectorizeForOptionsMap : function vectorizeForOptionsMapForKeys() {
        let t = [];
        if (n && !arguments.length) return t;
        for (let r = 0; r < e.select.length; r++) c = e.select[r], t[r] = vectorizeForOptionsMap.apply(this, arguments);
        return t;
      } : assert(0, "not implemented"))
      /* */ , t.routineExtend(y, r), y;
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
    let o = {
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
    Object.assign(r, o), Object.assign(r, {}), 
    // --
    // export
    // --
    // if( typeof module !== 'undefined' )
    // if( _global.WTOOLS_PRIVATE )
    // { /* delete require.cache[ module.id ]; */ }
    "undefined" != typeof module && null !== module && (module.exports = r);
  }();
  // == end of file bPrematureS
}();