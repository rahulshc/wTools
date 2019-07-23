!function iArrayDescriptorS() {
  // == begin of file iArrayDescriptorS
  !function _kArrayDescriptor_s_() {
    "use strict";
    //
    function _arrayNameSpaceApplyTo(e, a) {
      r.assert(2 === arguments.length, "Expects exactly two arguments"), r.assert(!r.mapOwnKey(e, "withArray")), 
      r.assert(!r.mapOwnKey(e, "array")), r.assert(!!o[a]), e.withArray = Object.create(null);
      for (let a in o) e.withArray[a] = Object.create(e), r.mapExtend(e.withArray[a], o[a]);
      e.array = e.withArray[a], e.ArrayNameSpaces = o;
    }
    // --
    // delcare
    // --
        function _declare(e) {
      //
      /**
 * @summary Creates new array taking elements from source array `src`.
 * @description Type of new array depends on `ArrayType`( see examples ).
 * Returns new array of type `ArrayType` or src if types are same.
 * @param {} src Source array.
 *
 * @example
 * let src =  _.withArray.Float32.makeArrayOfLength( 2 );
 * _.array.arrayFromCoercing( src );//Array [ 0,0 ]
 *
 * @example
 * let src =  _.array.makeArrayOfLength( 2 );
 * _.withArray.Float32.arrayFromCoercing( src );// Float32Array [ 0,0 ]
 *
 * @example
 * let src =  _.array.makeArrayOfLength( 2 );
 * _.array.arrayFromCoercing( src );// returns src
 *
 * @function arrayFromCoercing
 * @memberof wTools."wTools.array"
 */
      function arrayFromCoercing(e) {
        if (r.assert(r.longIs(e)), r.assert(1 === arguments.length, "Expects single argument"), 
        e.constructor === this.array.ArrayType) return e;
        return this.array.ArrayType === Array ? new (r.constructorJoin(this.array.ArrayType, e))() : new this.array.ArrayType(e);
      }
      // --
      //
      // --
            e.ArrayType;
      let a = e.ArrayName, t = {
        makeSimilar: 
        //
        /**
 * @summary Creates new array based on type of `src` array. Takes length of new array from second argument `length`.
 * @param {} src Source array
 * @param {Number} [ length ] Lengthof target array.
 * @function makeSimilar
 * @memberof wTools."wTools.array"
 */
        function makeSimilar(e, a) {
          return r.assert(1 === arguments.length || 2 === arguments.length), r.longMake(e, a);
        }
        //
        /**
 * @summary Creates new array of length( length ).
 * @description Type of array depends on `ArrayType`( see examples ).
 * @param {Number} length Lengthof new array.
 *
 * @example
 * _.array.makeArrayOfLength(1);// return instance of Array
 *
 * @example
 * _.withArray.Float32.makeArrayOfLength(1);// return instance of Float32Array
 *
 * @function makeArrayOfLength
 * @memberof wTools."wTools.array"
 */ ,
        makeArrayOfLength: function makeArrayOfLength(e) {
          return void 0 === e && (e = 0), r.assert(void 0 === e || e >= 0), r.assert(0 === arguments.length || 1 === arguments.length), 
          new this.array.ArrayType(e);
        }
        //
        /**
 * @summary Creates new array of length( length ) filled with zeroes.
 * @description Type of array depends on `ArrayType`( see examples ).
 * @param {Number} length Lengthof new array.
 *
 * @example
 * _.array.makeArrayOfLengthZeroed( 2 );//Array [ 0,0 ]
 *
 * @example
 * _.withArray.Float32.makeArrayOfLength( 2 );// Float32Array [ 0,0 ]
 *
 * @function makeArrayOfLengthZeroed
 * @memberof wTools."wTools.array"
 */ ,
        makeArrayOfLengthZeroed: function makeArrayOfLengthZeroed(e) {
          void 0 === e && (e = 0), r.assert(void 0 === e || e >= 0), r.assert(0 === arguments.length || 1 === arguments.length);
          let a = new this.array.ArrayType(e);
          if (this.array.ArrayType === Array) for (let r = 0; r < e; r++) a[r] = 0;
          return a;
        },
        arrayFrom: arrayFromCoercing,
        arrayFromCoercing: arrayFromCoercing,
        array: e = r.mapExtend(null, e)
      };
      return r.mapExtend(e, t), r.assert(!o[a]), o[a] = e, e;
    }
    // --
    //
    // --
        function makeFor_functor(e) {
      return r.assert(1 === arguments.length), r.assert(r.routineIs(e)), r.assert(r.strDefined(e.name)), 
      {
        [e.name]: function(a) {
          debugger;
          return r.assert(1 === arguments.length), new e(a);
        }
      }[e.name];
    }
    //
        function fromFor_functor(e) {
      return r.assert(1 === arguments.length), r.assert(r.routineIs(e)), r.assert(r.strDefined(e.name)), 
      {
        [e.name]: function() {
          debugger;
          return r.assert(1 === arguments.length), this instanceof e ? this : new e(src);
        }
      }[e.name];
    }
    //
        function isFor_functor(e) {
      return r.assert(1 === arguments.length), r.assert(r.routineIs(e)), r.assert(r.strDefined(e.name)), 
      {
        [e.name]: function(a) {
          debugger;
          return xxx, r.assert(1 === arguments.length), a instanceof e;
        }
      }[e.name];
    }
    //
        function longDeclare(e) {
      return r.routineOptions(longDeclare, e), r.assert(r.strDefined(e.name)), r.assert(r.strDefined(e.secondName) || null === e.secondName), 
      r.assert(r.strDefined(e.aliasName) || null === e.aliasName), r.assert(r.routineIs(e.type)), 
      r.assert(r.routineIs(e.make) || null === e.make), r.assert(r.routineIs(e.from) || null === e.from), 
      r.assert(r.routineIs(e.is) || null === e.make), r.assert(r.boolIs(e.isTyped)), r.assert(void 0 === t[e.name]), 
      e.make || (e.make = makeFor_functor(e.type)), e.from || (e.from = fromFor_functor(e.type)), 
      e.is || (e.is = isFor_functor(e.type)), Object.freeze(e), t[e.name] = e, e;
    }
    let e = _global_, r = e.wTools, a = e.wTools;
    r.assert(!r.Array), r.assert(!r.array), r.assert(!r.withArray), longDeclare.defaults = {
      name: null,
      secondName: null,
      aliasName: null,
      type: null,
      make: null,
      from: null,
      is: null,
      isTyped: null
    };
    //
    let t = {};
    longDeclare({
      name: "Array",
      type: Array,
      make: r.arrayMake,
      from: r.arrayMake,
      is: r.arrayIs,
      isTyped: !1
    }), longDeclare({
      name: "Unroll",
      type: Array,
      make: r.unrollMake,
      from: r.unrollFrom,
      is: r.unrollIs,
      isTyped: !1
    }), longDeclare({
      name: "ArgumentsArray",
      secondName: "Arguments",
      type: r._argumentsArrayMake().constructor,
      make: r.argumentsArrayFrom,
      from: r.argumentsArrayFrom,
      is: r.argumentsArrayIs,
      isTyped: !1
    }), longDeclare({
      name: "U32x",
      secondName: "Uint32",
      type: e.U32x,
      isTyped: !0
    }), longDeclare({
      name: "U16x",
      secondName: "Uint16",
      type: e.U16x,
      isTyped: !0
    }), longDeclare({
      name: "U8x",
      secondName: "Uint8",
      type: e.U8x,
      isTyped: !0
    }), longDeclare({
      name: "Ux",
      secondName: "Uint32",
      aliasName: "U32x",
      type: e.Ux,
      isTyped: !0
    }), longDeclare({
      name: "I32x",
      secondName: "Int32",
      type: e.I32x,
      isTyped: !0
    }), longDeclare({
      name: "I16x",
      secondName: "Int16",
      type: e.I16x,
      isTyped: !0
    }), longDeclare({
      name: "I8x",
      secondName: "Int8",
      type: e.I8x,
      isTyped: !0
    }), longDeclare({
      name: "Ix",
      secondName: "Int32",
      aliasName: "I32x",
      type: e.Ix,
      isTyped: !0
    }), longDeclare({
      name: "F32x",
      secondName: "Float32",
      type: e.F32x,
      isTyped: !0
    }), longDeclare({
      name: "F64x",
      secondName: "Float64",
      type: e.F64x,
      isTyped: !0
    }), longDeclare({
      name: "Fx",
      secondName: "Float32",
      aliasName: "F32x",
      type: e.Fx,
      isTyped: !0
    });
    //
    let n = {
      makeFor_functor: makeFor_functor,
      fromFor_functor: fromFor_functor,
      isFor_functor: isFor_functor,
      longDeclare: longDeclare,
      LongDescriptor: t
    };
    Object.assign(wTools, n);
    // --
    //
    // --
    let s = [ {
      ArrayType: Float32Array,
      ArrayName: "Float32"
    }, {
      ArrayType: Uint32Array,
      ArrayName: "Wrd32"
    }, {
      ArrayType: Int32Array,
      ArrayName: "Int32"
    }, {
      ArrayType: Array,
      ArrayName: "Array"
    } ];
    // if( _.Array )
    // debugger;
    // if( _.Array )
    // return;
        r.assert(!r.Array), r.assert(!r.array), r.assert(!r.withArray);
    // debugger;
    /**
 * @summary Array namespace
 * @namespace "wTools.array"
 * @memberof wTools
 */
    let o = Object.create(null);
    r._arrayNameSpaceApplyTo = _arrayNameSpaceApplyTo;
    for (let e = 0; e < s.length; e++) _declare(s[e]);
    _arrayNameSpaceApplyTo(r, "Array"), 
    // debugger;
    r.assert(!r.Array), r.assert(r.mapOwnKey(r, "withArray")), r.assert(r.mapOwnKey(r, "array")), 
    r.assert(r.mapOwnKey(r.array, "array")), r.assert(!r.mapOwnKey(r.array, "withArray")), 
    r.assert(!!r.array.withArray), r.assert(r.objectIs(r.withArray)), r.assert(r.objectIs(r.array)), 
    r.assert(r.routineIs(r.array.makeArrayOfLength)), 
    // --
    // export
    // --
    "undefined" != typeof module && null !== module && (module.exports = a);
  }();
  // == end of file iArrayDescriptorS
}();