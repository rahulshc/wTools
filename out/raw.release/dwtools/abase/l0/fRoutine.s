!function fRoutineS() {
  // == begin of file fRoutineS
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
      let n = t.routine, r = t.args, s = t.context, o = function act() {
        if (void 0 !== s && void 0 !== r) {
          if (!0 === t.sealing) {
            let t = n.name || "__sealedContextAndArguments";
            return e.assert(e.strIs(t)), {
              [t]: function() {
                return n.apply(s, r);
              }
            }[t];
          }
          {
            let t = e.arrayAppendArray([ s ], r);
            return Function.prototype.bind.apply(n, t);
          }
        }
        if (void 0 !== s && void 0 === r) {
          if (!0 === t.sealing) {
            let e = n.name || "__sealedContext";
            return {
              [e]: function() {
                return n.call(s);
              }
            }[e];
          }
          return Function.prototype.bind.call(n, s);
        }
        if (void 0 === s && void 0 !== r) // xxx
        {
          if (!0 === t.sealing) {
            let t = n.name || "__sealedArguments";
            return e.assert(e.strIs(t)), {
              [t]: function() {
                return n.apply(this, r);
              }
            }[t];
          }
          {
            let t = n.name || "__joinedArguments";
            return {
              [t]: function() {
                let t = e.arrayAppendArrays(null, [ r, arguments ]);
                return n.apply(this, t);
              }
            }[t];
          }
        }
        if (void 0 === s && void 0 === r) return n;
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
      return t.extending && (e.mapExtend(o, n), Object.defineProperty(o, "originalRoutine", {
        value: n,
        enumerable: !1
      }), void 0 !== s && Object.defineProperty(o, "boundContext", {
        value: s,
        enumerable: !1
      }), void 0 !== r && Object.defineProperty(o, "boundArguments", {
        value: r,
        enumerable: !1
      })), o;
    }
    //
        //
    function _routinesCompose_body(t) {
      null === t.chainer && (t.chainer = e.compose.chainer.original), t.elements = e.arrayFlatten(null, t.elements);
      /* qqq xxx : single argument call should be ( no-copy call ) */
      let n = [];
      for (let r = 0; r < t.elements.length; r++) {
        let s = t.elements[r];
        if (e.assert(e.routineIs(s)), s.composed) if (s.composed.chainer === t.chainer && s.composed.supervisor === t.supervisor) e.arrayAppendArray(n, s.composed.elements); else {
          debugger;
          e.arrayAppendElement(n, s);
        } else e.arrayAppendElement(n, s);
      }
      t.elements = n;
      let r, s = t.supervisor, o = t.chainer;
      if (e.assert(e.routineIs(o)), e.assert(null === s || e.routineIs(s)), 
      /* */
      r = 0 === n.length ? function empty() {
        return [];
      }
      // else if( elements.length === 1 ) /* xxx : optimize the case */
      // {
      //   act = elements[ 0 ];
      // }
       : function composition() {
        let r = [], s = e.unrollFrom(arguments);
        // let args = _.unrollAppend( _.unrollFrom( null ), arguments );
        // debugger;
                for (let i = 0; i < n.length; i++) {
          e.assert(e.unrollIs(s), () => "Expects unroll, but got", e.strType(s));
          let u = n[i].apply(this, s);
          // if( args === undefined )
          if (e.assert(!1 /* && r !== undefined */ !== u, "Temporally forbidden type of result", u), 
          e.assert(!e.argumentsArrayIs(u)), void 0 !== u && e.unrollAppend(r, u), 
          // args = chainer( r, k, args, o );
          s = o(s, u, t, i), e.assert(void 0 !== s && !1 !== s), s === e.dont) break;
          s = e.unrollFrom(s);
        }
        return r;
      }, t.act = r, r.composed = t, s) {
        function compositionSupervise() {
          return s(this, arguments, r, t);
        }
        return e.routineExtend(compositionSupervise, r), compositionSupervise;
      }
      return r;
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
        let n = e.routinesCompose(t.pre, function(t, n, r, o) {
          return e.assert(4 === arguments.length), e.assert(!e.unrollIs(n)), e.assert(e.objectIs(n)), 
          e.unrollAppend([ s, [ n ] ]);
        });
        e.assert(e.routineIs(n)), t.pre = function pre() {
          let e = n.apply(this, arguments);
          return e[e.length - 1];
        };
      }
      let n = t.pre, r = t.body;
      t.name || (e.assert(e.strDefined(t.body.name), "Body routine should have name"), 
      t.name = t.body.name, t.name.indexOf("_body") === t.name.length - 5 && t.name.length > 5 && (t.name = t.name.substring(0, t.name.length - 5)));
      let s = {
        [t.name]: function() {
          let t = n.call(this, s, arguments);
          return e.assert(!e.argumentsArrayIs(t), "does not expect arguments array"), e.unrollIs(t) ? r.apply(this, t) : r.call(this, t);
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
    function _routinesCompose_pre(t, n) {
      let r = n[0];
      return e.mapIs(r) || (r = {
        elements: n[0]
      }), void 0 !== n[1] && (r.chainer = n[1]), r.elements = e.arrayAppendArrays([], [ r.elements ]), 
      r.elements = r.elements.filter(e => null !== e && e), e.routineOptions(t, r), e.assert(e.routinesAre(r.elements)), 
      e.assert(2 === arguments.length, "Expects exactly two arguments"), e.assert(1 === n.length || 2 === n.length), 
      e.assert(1 === n.length || !e.objectIs(n[0])), e.assert(e.arrayIs(r.elements) || e.routineIs(r.elements)), 
      e.assert(e.routineIs(n[1]) || void 0 === n[1] || null === n[1]), e.assert(null === r.chainer || e.routineIs(r.chainer)), 
      e.assert(null === r.supervisor || e.routineIs(r.supervisor)), r;
    }, routinesCompose.body = _routinesCompose_body, routinesCompose.defaults = Object.create(routinesCompose.body.defaults), 
    routineFromPreAndBody_body.defaults = {
      pre: null,
      body: null,
      name: null
    }, routineFromPreAndBody.pre = 
    //
    function routineFromPreAndBody_pre(t, n) {
      let r = n[0];
      return void 0 !== n[1] && (r = {
        pre: n[0],
        body: n[1],
        name: n[2]
      }), e.routineOptions(t, r), e.assert(1 === n.length || 2 === n.length || 3 === n.length), 
      e.assert(2 === arguments.length), e.assert(e.routineIs(r.pre) || e.routinesAre(r.pre), "Expects routine or routines {-o.pre-}"), 
      e.assert(e.routineIs(r.body), "Expects routine {-o.body-}"), e.assert(void 0 !== r.body.defaults, "Body should have defaults"), 
      r;
    }, routineFromPreAndBody.body = routineFromPreAndBody_body, routineFromPreAndBody.defaults = Object.create(routineFromPreAndBody_body.defaults);
    // --
    // fields
    // --
    let n = {
      routineIs: routineIs,
      routinesAre: function routinesAre(t) {
        if (e.assert(1 === arguments.length, "Expects single argument"), e.longIs(t)) {
          for (let n = 0; n < t.length; n++) if (!e.routineIs(t[n])) return !1;
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
      constructorJoin: function constructorJoin(t, n) {
        return e.assert(e.routineIs(t), "Expects routine in the first argument"), e.assert(e.longIs(n), "Expects array-like in the second argument"), 
        e.assert(1 === arguments.length || 2 === arguments.length), _routineJoin({
          routine: t,
          context: t,
          args: n || [],
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
      function routineJoin(t, n, r) {
        return e.assert(e.routineIs(n), "routineJoin :", "second argument must be a routine"), 
        e.assert(arguments.length <= 3, "routineJoin :", "Expects 3 or less arguments"), 
        _routineJoin({
          routine: n,
          context: t,
          args: r,
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
      routineSeal: function routineSeal(t, n, r) {
        return e.assert(e.routineIs(n), "routineSeal :", "second argument must be a routine"), 
        e.assert(arguments.length <= 3, "routineSeal :", "Expects 3 or less arguments"), 
        _routineJoin({
          routine: n,
          context: t,
          args: r,
          sealing: !0,
          extending: !0
        });
      }
      //
      ,
      routineOptions: function routineOptions(t, n, r) {
        e.argumentsArrayIs(n) || (n = [ n ]);
        let s = n[0];
        return void 0 === s && (s = Object.create(null)), r = r || (t ? t.defaults : null), 
        e.assert(2 === arguments.length || 3 === arguments.length, "Expects 2 or 3 arguments"), 
        e.assert(e.routineIs(t) || null === t, "Expects routine"), e.assert(e.objectIs(r), "Expects routine with defined defaults or defaults in third argument"), 
        e.assert(e.objectIs(s), "Expects object"), e.assert(0 === n.length || 1 === n.length, "Expects single options map, but got", n.length, "arguments"), 
        e.assertMapHasOnly(s, r), 
        // _.mapSupplementStructureless( options, defaults ); /* xxx qqq : use instead of mapComplement */
        e.mapComplement(s, r), e.assertMapHasNoUndefine(s), s;
      }
      //
      ,
      assertRoutineOptions: function assertRoutineOptions(t, n, r) {
        e.argumentsArrayIs(n) || (n = [ n ]);
        let s = n[0];
        return r = r || (t ? t.defaults : null), e.assert(2 === arguments.length || 3 === arguments.length, "Expects 2 or 3 arguments"), 
        e.assert(e.routineIs(t) || null === t, "Expects routine"), e.assert(e.objectIs(r), "Expects routine with defined defaults or defaults in third argument"), 
        e.assert(e.objectIs(s), "Expects object"), e.assert(0 === n.length || 1 === n.length, "Expects single options map, but got", n.length, "arguments"), 
        e.assertMapHasOnly(s, r), e.assertMapHasAll(s, r), e.assertMapHasNoUndefine(s), 
        s;
      }
      //
      ,
      routineOptionsPreservingUndefines: function routineOptionsPreservingUndefines(t, n, r) {
        e.argumentsArrayIs(n) || (n = [ n ]);
        let s = n[0];
        return void 0 === s && (s = Object.create(null)), r = r || t.defaults, e.assert(2 === arguments.length || 3 === arguments.length, "Expects 2 or 3 arguments"), 
        e.assert(e.routineIs(t), "Expects routine"), e.assert(e.objectIs(r), "Expects routine with defined defaults"), 
        e.assert(e.objectIs(s), "Expects object"), e.assert(0 === n.length || 1 === n.length, "routineOptions : expects single options map, but got", n.length, "arguments"), 
        e.assertMapHasOnly(s, r), e.mapComplementPreservingUndefines(s, r), s;
      }
      //
      ,
      assertRoutineOptionsPreservingUndefines: 
      //
      function assertRoutineOptionsPreservingUndefines(t, n, r) {
        e.argumentsArrayIs(n) || (n = [ n ]);
        let s = n[0];
        return r = r || t.defaults, e.assert(2 === arguments.length || 3 === arguments.length, "Expects 2 or 3 arguments"), 
        e.assert(e.routineIs(t), "Expects routine"), e.assert(e.objectIs(r), "Expects routine with defined defaults or defaults in third argument"), 
        e.assert(e.objectIs(s), "Expects object"), e.assert(0 === n.length || 1 === n.length, "Expects single options map, but got", n.length, "arguments"), 
        e.assertMapHasOnly(s, r), e.assertMapHasAll(s, r), s;
      }
      //
      ,
      routineOptionsFromThis: function routineOptionsFromThis(t, n, r) {
        e.assert(3 === arguments.length, "routineOptionsFromThis : expects 3 arguments");
        let s = n || Object.create(null);
        return (Object.isPrototypeOf.call(r, n) || r === n) && (s = Object.create(null)), 
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
          let n = Object.create(null);
          for (let t = 0; t < arguments.length; t++) {
            let r = arguments[t];
            null !== r && e.mapExtend(n, r);
          }
          n.pre && n.body ? t = e.routineFromPreAndBody(n.pre, n.body) : e.assert(0, "Not clear how to construct the routine");
        }
        /* shallow clone properties of dst routine */        for (let n in t) {
          let r = t[n];
          e.mapIs(r) && (r = e.mapExtend(null, r), t[n] = r);
        }
        /* extend dst routine */        for (let n = 0; n < arguments.length; n++) {
          let r = arguments[n];
          if (null !== r) {
            e.assert(!e.primitiveIs(r));
            for (let n in r) {
              let s = r[n], o = Object.getOwnPropertyDescriptor(t, n);
              o && !o.writable || (e.objectIs(s) && (e.assert(!e.mapHas(t, n) || e.mapIs(t[n])), 
              s = Object.create(s), t[n] && e.mapSupplement(s, t[n])), t[n] = s);
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
    Object.assign(t, n), Object.assign(t, {}), 
    // --
    // export
    // --
    "undefined" != typeof module && null !== module && (module.exports = t);
  }();
  // == end of file fRoutineS
}();