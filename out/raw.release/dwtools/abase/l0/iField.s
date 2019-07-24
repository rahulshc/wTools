!function iFieldS() {
  // == begin of file iFieldS
  !function _Field_s_() {
    "use strict";
    // --
    //
    // --
    function bypass() {
      let n = function bypass(n, i, t) {
        /*dstContainer[ key ] = srcContainer[ key ];*/
        return !0;
      };
      return n.functionFamily = "field-filter", n;
    }
    //
    function assigning() {
      let n = function assigning(n, t, e) {
        i.entityAssignFieldFromContainer(n, t, e);
      };
      return n.functionFamily = "field-mapper", n;
    }
    //
    function primitive() {
      let n = function primitive(n, t, e) {
        return !!i.primitiveIs(t[e]);
      };
      return n.functionFamily = "field-filter", n;
    }
    //
    function hiding() {
      let n = function hiding(n, i, t) {
        Object.defineProperty(n, t, {
          value: i[t],
          enumerable: !1,
          configurable: !0
        });
      };
      return n.functionFamily = "field-mapper", n;
    }
    //
    function appendingAnything() {
      let n = function appendingAnything(n, t, e) {
        void 0 === n[e] ? n[e] = t[e] : n[e] = i.arrayAppendArrays([], [ n[e], t[e] ]);
      };
      return n.functionFamily = "field-mapper", n;
    }
    //
    function appendingArrays() {
      let n = function appendingArrays(n, t, e) {
        i.arrayIs(n[e]) && i.arrayIs(t[e]) ? i.arrayAppendArray(n[e], t[e]) : n[e] = t[e];
      };
      return n.functionFamily = "field-mapper", n;
    }
    //
    function appendingOnce() {
      let n = function appendingOnce(n, t, e) {
        i.arrayIs(n[e]) && i.arrayIs(t[e]) ? i.arrayAppendArrayOnce(n[e], t[e]) : n[e] = t[e];
      };
      return n.functionFamily = "field-mapper", n;
    }
    //
    function removing() {
      let n = function removing(n, t, e) {
        let r = n[e], s = t[e];
        i.arrayIs(r) && i.arrayIs(s) ? r === s ? n[e] = [] : i.arrayRemoveArrayOnce(r, s) : r === s && delete n[e];
      };
      return n.functionFamily = "field-mapper", n;
    }
    //
    function notPrimitiveAssigning() {
      let n = function notPrimitiveAssigning(n, t, e) {
        i.primitiveIs(t[e]) || i.entityAssignFieldFromContainer(n, t, e);
      };
      return n.functionFamily = "field-mapper", n;
    }
    //
    function assigningRecursive() {
      let n = function assigningRecursive(n, t, e) {
        i.entityAssignFieldFromContainer(n, t, e, i.entityAssignFieldFromContainer);
      };
      return n.functionFamily = "field-mapper", n;
    }
    //
    function drop(n) {
      debugger;
      i.assert(i.objectIs(n));
      let t = function drop(i, t, e) {
        return void 0 === n[e];
        /*dstContainer[ key ] = srcContainer[ key ];*/      };
      return t.functionFamily = "field-filter", t;
    }
    // --
    // src
    // --
    function srcDefined() {
      let n = function srcDefined(n, i, t) {
        return void 0 !== i[t];
      };
      return n.functionFamily = "field-filter", n;
    }
    //
    function srcNull() {
      let n = function srcNull(n, i, t) {
        return null === i[t];
      };
      return n.functionFamily = "field-filter", n;
    }
    //
    function dstAndSrcOwn() {
      let n = function dstAndSrcOwn(n, i, e) {
        return !!t.call(i, e) && !!t.call(n, e);
      };
      return n.functionFamily = "field-filter", n;
    }
    //
    function dstUndefinedSrcNotUndefined() {
      let n = function dstUndefinedSrcNotUndefined(n, i, t) {
        return void 0 === n[t] && void 0 !== i[t];
      };
      return n.functionFamily = "field-filter", n;
    }
    // --
    // dstNotHas
    // --
    function dstNotHas() {
      let n = function dstNotHas(n, i, t) {
        // if( dstContainer[ key ] !== undefined )
        // return false;
        return !(t in n);
      };
      return n.functionFamily = "field-filter", n;
    }
    //
    function dstNotHasOrHasNull() {
      let n = function dstNotHasOrHasNull(n, i, t) {
        return !(t in n && null !== n[t]);
      };
      return n.functionFamily = "field-filter", n;
    }
    //
    function dstNotHasOrHasNil() {
      let n = function dstNotHasOrHasNil(n, t, e) {
        return !(e in n && n[e] !== i.nothing);
      };
      return n.functionFamily = "field-filter", n;
    }
    //
    function dstNotHasAssigning() {
      let n = function dstNotHasAssigning(n, t, e) {
        void 0 === n[e] && i.entityAssignFieldFromContainer(n, t, e);
      };
      return n.functionFamily = "field-mapper", n;
    }
    //
    function dstNotHasAppending() {
      let n = function dstNotHasAppending(n, t, e) {
        if (e in n) {
          debugger;
          i.arrayIs(n[e]) && i.arrayIs(t[e]) && i.arrayAppendArray(n, t, e);
        } else n[e] = t[e];
      };
      return n.functionFamily = "field-mapper", n;
    }
    //
    function dstNotHasSrcPrimitive() {
      let n = function dstNotHasSrcPrimitive(n, t, e) {
        debugger;
        return !(e in n || !i.primitiveIs(t[e]));
      };
      return n.functionFamily = "field-filter", n;
    }
    //
    function dstNotHasSrcOwn() {
      let n = function dstNotHasSrcOwn(n, i, e) {
        return !(!t.call(i, e) || e in n);
      };
      return n.functionFamily = "field-filter", n;
    }
    //
    function dstNotHasSrcOwnAssigning() {
      let n = function dstNotHasSrcOwnAssigning(n, e, r) {
        t.call(e, r) && (r in n || i.entityAssignFieldFromContainer(n, e, r));
      };
      return n.functionFamily = "field-mapper", n;
    }
    //
    function dstNotHasSrcOwnRoutines() {
      let n = function dstNotHasSrcOwnRoutines(n, e, r) {
        return !(!t.call(e, r) || !i.routineIs(e[r]) || r in n);
      };
      return n.functionFamily = "field-filter", n;
    }
    //
    function dstNotHasAssigningRecursive() {
      let n = function dstNotHasAssigningRecursive(n, t, e) {
        e in n || i.entityAssignFieldFromContainer(n, t, e, i.entityAssignFieldFromContainer);
      };
      return n.functionFamily = "field-mapper", n;
    }
    // --
    // dstNotOwn
    // --
    function dstNotOwn() {
      let n = function dstNotOwn(n, i, e) {
        return !t.call(n, e);
      };
      return n.functionFamily = "field-filter", n;
    }
    //
    function dstNotOwnSrcOwn() {
      let n = function dstNotOwnSrcOwn(n, i, e) {
        return !!t.call(i, e) && !t.call(n, e);
      };
      return n.functionFamily = "field-filter", n;
    }
    //
    function dstNotOwnSrcOwnAssigning() {
      let n = function dstNotOwnSrcOwnAssigning(n, e, r) {
        t.call(e, r) && (t.call(n, r) || i.entityAssignFieldFromContainer(n, e, r));
      };
      return n.functionFamily = "field-mapper", n;
    }
    //
    function dstNotOwnOrUndefinedAssigning() {
      let n = function dstNotOwnOrUndefinedAssigning(n, e, r) {
        t.call(n, r) && void 0 !== n[r] || i.entityAssignFieldFromContainer(n, e, r);
      };
      return n.functionFamily = "field-mapper", n;
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
      let n = function dstNotOwnAssigning(n, e, r) {
        if (t.call(n, r)) return;
        let s = e[r];
        i.mapIs(s) || i.arrayIs(s) ? i.entityAssignFieldFromContainer(n, e, r) : n[r] = e[r];
      };
      return n.functionFamily = "field-mapper", n;
    }
    //
    function dstNotOwnAppending() {
      let n = function dstNotOwnAppending(n, e, r) {
        debugger;
        if (void 0 !== n[r]) {
          debugger;
          i.arrayIs(n[r]) && i.arrayIs(e[r]) && i.arrayAppendArray(n, e, r);
        }
        t.call(n, r) || (n[r] = e[r]);
      };
      return n.functionFamily = "field-mapper", n;
    }
    // --
    // dstHas
    // --
    function dstHasMaybeUndefined() {
      let n = function dstHasMaybeUndefined(n, i, t) {
        return t in n;
      };
      return n.functionFamily = "field-filter", n;
    }
    //
    function dstHasButUndefined() {
      let n = function dstHasButUndefined(n, i, t) {
        return void 0 !== n[t];
      };
      return n.functionFamily = "field-filter", n;
    }
    //
    function dstHasSrcOwn() {
      let n = function dstHasSrcOwn(n, i, e) {
        return e in n && !!t.call(i, e);
      };
      return n.functionFamily = "field-filter", n;
    }
    //
    function dstHasSrcNotOwn() {
      let n = function dstHasSrcNotOwn(n, i, e) {
        return e in n && !t.call(i, e);
      };
      return n.functionFamily = "field-filter", n;
    }
    // --
    // srcOwn
    // --
    function srcOwn() {
      let n = function srcOwn(n, i, e) {
        return !!t.call(i, e);
        /*dstContainer[ key ] = srcContainer[ key ];*/      };
      return n.functionFamily = "field-filter", n;
    }
    //
    function srcOwnRoutines() {
      let n = function srcOwnRoutines(n, e, r) {
        return !!t.call(e, r) && !!i.routineIs(e[r]);
      };
      return n.functionFamily = "field-filter", n;
    }
    //
    function srcOwnAssigning() {
      let n = function assigning(n, e, r) {
        t.call(e, r) && i.entityAssignFieldFromContainer(n, e, r);
      };
      return n.functionFamily = "field-mapper", n;
    }
    //
    function srcOwnPrimitive() {
      let n = function srcOwnPrimitive(n, e, r) {
        return !!t.call(e, r) && !!i.primitiveIs(e[r]);
      };
      return n.functionFamily = "field-filter", n;
    }
    //
    function srcOwnNotPrimitiveAssigning() {
      let n = function srcOwnNotPrimitiveAssigning(n, e, r) {
        t.call(e, r) && (i.primitiveIs(e[r]) || i.entityAssignFieldFromContainer(n, e, r));
      };
      return n.functionFamily = "field-mapper", n;
    }
    //
    function srcOwnNotPrimitiveAssigningRecursive() {
      let n = function srcOwnNotPrimitiveAssigningRecursive(n, e, r) {
        t.call(e, r) && (i.primitiveIs(e[r]) || i.entityAssignFieldFromContainer(n, e, r, i.entityAssignFieldFromContainer));
      };
      return n.functionFamily = "field-mapper", n;
    }
    //
    function srcOwnAssigningRecursive() {
      let n = function srcOwnAssigningRecursive(n, e, r) {
        t.call(e, r) && i.entityAssignFieldFromContainer(n, e, r, i.entityAssignFieldFromContainer);
      };
      return n.functionFamily = "field-mapper", n;
    }
    //
    function mapperFromFilter(n) {
      if (i.assert(1 === arguments.length, "Expects single argument"), i.assert(i.routineIs(n), "Expects routine but got", i.strType(n)), 
      i.assert(i.strIs(n.functionFamily)), "field-filter" === n.functionFamily) {
        function r(t, e, r) {
          let s = n(t, e, r);
          i.assert(i.boolIs(s)), !1 !== s && (t[r] = e[r]);
        }
        return r.functionFamily = "field-mapper", r;
      }
      if ("field-mapper" === n.functionFamily) return n;
      i.assert(0, "Expects routine.functionFamily");
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
        let n = _global_.wTools.field = _global_.wTools.field || Object.create(null), i = (_global_, 
    _global_.wTools), t = (Array.prototype.slice, Function.prototype.bind, Object.hasOwnProperty);
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
    let e = {
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
        let n = function dstNotConstant(n, i, t) {
          let e = Object.getOwnPropertyDescriptor(n, t);
          return !e || !!e.writable;
        };
        return n.functionFamily = "field-filter", n;
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
        let n = function dstNotOwnFromDefinition(n, e, r) {
          if (t.call(n, r)) return;
          if (t.call(n, Symbol.for(r))) return;
          let s = e[r];
          i.definitionIs(s) ? n[r] = s.valueGet() : n[r] = s;
        };
        return n.functionFamily = "field-mapper", n;
      }
      //
      ,
      dstNotOwnFromDefinitionStrictlyPrimitive: function dstNotOwnFromDefinitionStrictlyPrimitive() {
        let n = function dstNotOwnFromDefinitionStrictlyPrimitive(n, e, r) {
          if (t.call(n, r)) return;
          if (t.call(n, Symbol.for(r))) return;
          let s = e[r];
          i.definitionIs(s) ? n[r] = s.valueGet() : (i.assert(!i.consequenceIs(s) && (i.primitiveIs(s) || i.routineIs(s)), () => i.toStrShort(n) + " has non-primitive element " + i.strQuote(r) + " use _.define.own instead"), 
          n[r] = s);
        };
        return n.functionFamily = "field-mapper", n;
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
    }, s = {
      make: e,
      mapper: Object.create(null),
      filter: Object.create(null),
      and: 
      // --
      //
      // --
      function and() {
        let n = [], t = [];
        for (let e = 0; e < arguments.length; e++) {
          let r = arguments[e];
          if (i.assert(i.routineIs(r)), i.assert(i.strIs(r.functionFamily)), "field-filter" === r.functionFamily) n.push(r); else {
            if ("field-mapper" !== r.functionFamily) throw i.err("Expects routine.functionFamily");
            t.push(r);
          }
        }
        if (t.length > 1) throw i.err("can combineMethodUniform only one mapper with any number of filters");
        let e = function and(e, r, s) {
          for (let l = 0; l < n.length; l++) {
            let o = (0, n[l])(e, r, s);
            if (i.assert(i.boolIs(o)), !1 === o) return !!t.length && void 0;
          }
          for (let n = 0; n < t.length; n++) {
            let l = (0, t[n])(e, r, s);
            return void i.assert(void 0 === l);
          }
          return !t.length || void 0;
        };
        return e.functionFamily = t.length ? "field-mapper" : "field-filter", e;
      },
      mapperFromFilter: mapperFromFilter
    };
    // --
    // extend
    // --
        !function setup() {
      for (let n in e) {
        let t = e[n];
        t.length || ("field-mapper" === (t = t()).functionFamily ? s.mapper[n] = t : "field-filter" === t.functionFamily ? (s.filter[n] = t, 
        s.mapper[n] = mapperFromFilter(t)) : i.assert(0, "unexpected"));
      }
    }(), Object.assign(n, s), 
    // --
    // export
    // --
    "undefined" != typeof module && null !== module && (module.exports = n);
  }();
  // == end of file iFieldS
}();