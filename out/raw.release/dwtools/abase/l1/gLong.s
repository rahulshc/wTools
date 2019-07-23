!function gLongS() {
  // == begin of file gLongS
  !function _gLong_s_() {
    "use strict";
    //
    function bufferMove(e, t) {
      if (2 === arguments.length) {
        if (r.assert(r.longIs(e)), r.assert(r.longIs(t)), e.length !== t.length) throw r.err("_.bufferMove :", '"dst" and "src" must have same length');
        if (e.set) return e.set(t), e;
        for (let r = 0; r < t.length; r++) e[r] = t[r];
      } else if (1 === arguments.length) {
        let e = arguments[0];
        r.assertMapHasOnly(e, bufferMove.defaults);
        let t = e.src, n = e.dst;
        if (r.bufferRawIs(n) && (n = new Uint8Array(n), !r.bufferTypedIs(t) || t instanceof Uint8Array || (t = new Uint8Array(t.buffer, t.byteOffset, t.byteLength))), 
        r.assert(r.longIs(n)), r.assert(r.longIs(t)), e.dstOffset = e.dstOffset || 0, n.set) return n.set(t, e.dstOffset), 
        n;
        for (let r = 0, s = e.dstOffset; r < t.length; r++, s++) n[s] = t[r];
      } else r.assert(0, "unexpected");
      return e;
    }
    //
    function bufferFrom(e) {
      let t;
      /* same */
      if (r.assert(1 === arguments.length), r.assert(r.objectIs(e)), r.assert(r.routineIs(e.bufferConstructor), "Expects bufferConstructor"), 
      r.assertMapHasOnly(e, bufferFrom.defaults), e.src.constructor && e.src.constructor === e.bufferConstructor) return e.src;
      /* number */      if (r.numberIs(e.src) && (e.src = [ e.src ]), "ArrayBuffer" === e.bufferConstructor.name) return r.bufferRawFrom(e.src);
      if ("Buffer" === e.bufferConstructor.name) return r.bufferNodeFrom(e.src);
      /* str / buffer.node / buffer.raw */      
      /* buffer.typed */
      if ((r.strIs(e.src) || r.bufferNodeIs(e.src) || r.bufferRawIs(e.src)) && (e.src = r.bufferBytesFrom(e.src)), 
      r.bufferTypedIs(e.src)) return e.src.constructor === e.bufferConstructor ? e.src : t = new e.bufferConstructor(e.src);
      /* verification */      r.assert(r.objectLike(e.src) || r.longIs(e.src), "bufferFrom expects object-like or array-like as o.src");
      /* length */
      let n = e.src.length;
      if (!r.numberIs(n)) {
        let r = 0;
        for (;void 0 !== e.src[r]; ) r += 1;
      }
      /* make */      if (r.arrayIs(e.src)) t = new e.bufferConstructor(e.src); else {
        if (r.longIs(e.src)) throw t = new e.bufferConstructor(e.src), r.err("not tested");
        t = new e.bufferConstructor(n);
        for (let r = 0; r < n; r++) t[r] = e.src[r];
      }
      return t;
    }
    //
    function buffersSerialize(e) {
      let t = 0;
      e = e || Object.create(null), r.assertMapHasNoUndefine(e), r.assertMapHasOnly(e, buffersSerialize.defaults), 
      r.mapComplement(e, buffersSerialize.defaults), r.assert(r.objectIs(e.store));
      let n = e.store, s = (n.attributes = n.attributes || Object.create(null), e.onAttributesGet.call(e.context)), f = [];
      /* eval size */
      for (let n = 0; n < s.length; n++) {
        let a = s[n][0], l = s[n][1], u = e.onBufferGet.call(e.context, l);
        r.assert(r.bufferTypedIs(u) || null === u, "Expects buffer or null, got : " + r.strType(u));
        let o = u ? u.length * u.BYTES_PER_ELEMENT : 0;
        if (e.dropAttribute && e.dropAttribute[a]) continue;
        let i = Object.create(null);
        i.attribute = l, i.name = a, i.buffer = u, i.bufferSize = o, i.sizeOfAtom = u ? u.BYTES_PER_ELEMENT : 0, 
        f.push(i), t += o;
      }
      /* make buffer */      n.buffer || (n.buffer = new ArrayBuffer(t));
      let a = r.bufferBytesGet(n.buffer);
      if (r.assert(n.buffer.byteLength === t), n.buffer.byteLength < t) throw r.err("buffersSerialize :", "buffer does not have enough space");
      /* sort by atom size */      f.sort(function(e, r) {
        return r.sizeOfAtom - e.sizeOfAtom;
      });
      /* store into single buffer */
      let l = 0;
      for (let t = 0; t < f.length; t++) {
        let s = f[t].name, u = f[t].attribute, o = f[t].buffer, i = o ? r.bufferBytesGet(o) : new Uint8Array(), g = f[t].bufferSize;
        if (e.dropAttribute && e.dropAttribute[s]) continue;
        r.bufferMove(a.subarray(l, l + g), i);
        let c = n.attributes[s] = {
          "bufferConstructorName": o ? o.constructor.name : "null",
          "sizeOfAtom": o ? o.BYTES_PER_ELEMENT : 0,
          "offsetInCommonBuffer": l,
          "size": i.length
        };
        u.copyCustom && (c.fields = u.copyCustom({
          dst: Object.create(null),
          src: u,
          copyingComposes: 3,
          copyingAggregates: 3,
          copyingAssociates: 1,
          technique: "data"
        })), l += g;
      }
      /* return */      return n;
    }
    //
    function buffersDeserialize(t) {
      let n = (t = t || Object.create(null)).store, s = n.buffer;
      r.assertMapHasNoUndefine(t), r.assertMapHasOnly(t, buffersDeserialize.defaults), 
      r.mapComplement(t, buffersDeserialize.defaults), r.assert(r.objectIs(t.store)), 
      r.assert(r.bufferRawIs(s) || r.bufferTypedIs(s)), s = r.bufferRawFromTyped(s);
      for (let f in n.attributes) {
        let a = n.attributes[f], l = "null" === a.bufferConstructorName ? null : e[a.bufferConstructorName], u = a.offsetInCommonBuffer, o = a.size, i = a.sizeOfAtom, g = a.fields;
        if (r.assert(r.routineIs(l) || null === l, "unknown attribute' constructor :", a.bufferConstructorName), 
        r.assert(r.numberIs(u), "unknown attribute' offset in common buffer :", u), r.assert(r.numberIs(o), "unknown attribute' size of buffer :", o), 
        r.assert(r.numberIs(i), "unknown attribute' sizeOfAtom of buffer :", i), a.offset + o > s.byteLength) throw r.err("cant deserialize attribute", '"' + f + '"', "it is out of common buffer");
        /* logger.log( 'bufferConstructor( ' + commonBuffer + ', ' + offset + ', ' + size / sizeOfAtom + ' )' ); */        let c = l ? new l(s, u, o / i) : null;
        t.onAttribute.call(t.context, g, c, f);
      }
    }
    // --
    // array maker
    // --
    /**
 * The arrayMakeRandom() routine returns an array which contains random numbers.
 *
 * @param { Object } o - The options for getting random numbers.
 * @param { Number } o.length - The length of an array.
 * @param { Array } [ o.range = [ 0, 1 ] ] - The range of numbers.
 * @param { Boolean } [ o.int = false ] - Floating point numbers or not.
 *
 * @example
 * // returns [ 6, 2, 4, 7, 8 ]
 * let arr = _.arrayMakeRandom
 * ({
 *   length : 5,
 *   range : [ 1, 9 ],
 *   int : true,
 * });
 *
 * @returns { Array } - Returns an array of random numbers.
 * @function arrayMakeRandom
 * @memberof wTools
 */
    function arrayMakeRandom(e) {
      let t = [];
      r.numberIs(e) && (e = {
        length: e
      }), r.assert(1 === arguments.length, "Expects single argument"), r.routineOptions(arrayMakeRandom, e);
      debugger;
      for (let r = 0; r < e.length; r++) t[r] = e.range[0] + Math.random() * (e.range[1] - e.range[0]), 
      e.int && (t[r] = Math.floor(t[r]));
      return t;
    }
    //
    /**
 * The arrayDuplicate() routine returns an array with duplicate values of a certain number of times.
 *
 * @param { objectLike } [ o = {  } ] o - The set of arguments.
 * @param { longIs } o.src - The given initial array.
 * @param { longIs } o.result - To collect all data.
 * @param { Number } [ o.numberOfAtomsPerElement = 1 ] o.numberOfAtomsPerElement - The certain number of times
 * to append the next value from (srcArray or o.src) to the (o.result).
 * If (o.numberOfAtomsPerElement) is greater that length of a (srcArray or o.src) it appends the 'undefined'.
 * @param { Number } [ o.numberOfDuplicatesPerElement = 2 ] o.numberOfDuplicatesPerElement = 2 - The number of duplicates per element.
 *
 * @example
 * // returns [ 'a', 'a', 'b', 'b', 'c', 'c' ]
 * _.arrayDuplicate( [ 'a', 'b', 'c' ] );
 *
 * @example
 * // returns [ 'abc', 'def', 'abc', 'def', 'abc', 'def' ]
 * let options = {
 *   src : [ 'abc', 'def' ],
 *   result : [  ],
 *   numberOfAtomsPerElement : 2,
 *   numberOfDuplicatesPerElement : 3
 * };
 * _.arrayDuplicate( options, {} );
 *
 * @example
 * // returns [ 'abc', 'def', undefined, 'abc', 'def', undefined, 'abc', 'def', undefined ]
 * let options = {
 *   src : [ 'abc', 'def' ],
 *   result : [  ],
 *   numberOfAtomsPerElement : 3,
 *   numberOfDuplicatesPerElement : 3
 * };
 * _.arrayDuplicate( options, { a : 7, b : 13 } );
 *
 * @returns { Array } Returns an array with duplicate values of a certain number of times.
 * @function arrayDuplicate
 * @throws { Error } Will throw an Error if ( o ) is not an objectLike.
 * @memberof wTools
 */
    function arrayDuplicate(e) {
      if (r.assert(1 === arguments.length || 2 === arguments.length), 2 === arguments.length ? e = {
        src: arguments[0],
        numberOfDuplicatesPerElement: arguments[1]
      } : r.objectIs(e) || (e = {
        src: e
      }), r.assert(r.numberIs(e.numberOfDuplicatesPerElement) || void 0 === e.numberOfDuplicatesPerElement), 
      r.routineOptions(arrayDuplicate, e), r.assert(r.longIs(e.src), "arrayDuplicate expects o.src as longIs entity"), 
      r.assert(r.numberIsInt(e.src.length / e.numberOfAtomsPerElement)), 1 === e.numberOfDuplicatesPerElement) return e.result ? (r.assert(r.longIs(e.result) || r.bufferTypedIs(e.result), "Expects o.result as longIs or TypedArray if numberOfDuplicatesPerElement equals 1"), 
      r.bufferTypedIs(e.result) ? e.result = r.longShallowClone(e.result, e.src) : r.longIs(e.result) && e.result.push.apply(e.result, e.src)) : e.result = e.src, 
      e.result;
      let t = e.src.length * e.numberOfDuplicatesPerElement, n = e.src.length / e.numberOfAtomsPerElement;
      e.result && r.assert(e.result.length >= t), e.result = e.result || r.longMake(e.src, t);
      let s = e.result.length;
      for (let r = 0, t = n; r < t; r++) for (let t = 0, n = e.numberOfDuplicatesPerElement; t < n; t++) for (let n = 0, s = e.numberOfAtomsPerElement; n < s; n++) {
        let s = r * e.numberOfAtomsPerElement * e.numberOfDuplicatesPerElement + t * e.numberOfAtomsPerElement + n, f = r * e.numberOfAtomsPerElement + n;
        e.result[s] = e.src[f];
      }
      return r.assert(e.result.length === s), e.result;
    }
    //
    function arrayUnmask(e) {
      r.assert(1 === arguments.length || 2 === arguments.length), 2 === arguments.length && (e = {
        src: arguments[0],
        mask: arguments[1]
      }), r.assertMapHasOnly(e, arrayUnmask.defaults), r.assert(r.longIs(e.src), "arrayUnmask : expects o.src as ArrayLike");
      let t = e.mask.length, n = 0;
      for (let r = 0; r < e.mask.length; r++) e.mask[r] && (n += 1);
      let s = e.src.length / n;
      if (Math.floor(s) !== s) throw r.err("arrayMask :", "Expects mask that has component for each atom of o.src", r.toStr({
        "atomsPerElementPreserved": n,
        "o.src.length": e.src.length
      }));
      let f = new e.src.constructor(t * s), a = [];
      for (let r = 0; r < s; r++) {
        for (let t = 0, s = 0; t < e.mask.length; t++) e.mask[t] ? (a[t] = e.src[r * n + s], 
        s += 1) : a[t] = 0;
        e.onEach && e.onEach(a, r);
        for (let n = 0; n < e.mask.length; n++) f[r * t + n] = a[n];
      }
      return f;
    }
    //
    function longUniqueAre(e) {
      r.longIs(e) && (e = {
        src: e
      }), r.assert(1 === arguments.length, "Expects single argument"), r.assert(r.longIs(e.src)), 
      r.assertMapHasOnly(e, longUniqueAre.defaults);
      /* */
      // if( o.onEvaluate )
      // {
      //   o.src = _.entityMap( o.src, ( e ) => o.onEvaluate( e ) );
      // }
      /* */
      let t, n = e.src.length, s = [];
      for (let r = 0; r < e.src.length; r++) s[r] = 1;
      for (let f = 0; f < e.src.length; f++) {
        if (t = f, !s[f]) continue;
        let a = 1;
        if ((t = r.arrayLeftIndex(e.src, e.src[f], t + 1, e.onEvaluate)) >= 0) do {
          s[t] = 0, n -= 1, a = 0, t = r.arrayLeftIndex(e.src, e.src[f], t + 1, e.onEvaluate);
        } while (t >= 0);
        // if( currentUnique && o.src2 )
        // do
        // {
        //   index = o.src2.indexOf( o.src2[ i ], index+1 );
        //   if( index !== -1 )
        //   currentUnique = 0;
        // }
        // while( index !== -1 );
                e.includeFirst || a || (s[f] = 0, n -= 1);
      }
      return {
        number: n,
        is: s
      };
    }
    let e = _global_, r = _global_.wTools, t = _global_.wTools, n = (Array.prototype.indexOf, 
    Array.prototype.lastIndexOf, Array.prototype.slice), s = (Array.prototype.splice, 
    Function.prototype.bind, Object.prototype.toString);
    Object.hasOwnProperty, Object.propertyIsEnumerable, bufferMove.defaults = {
      dst: null,
      src: null,
      dstOffset: null
    }, bufferFrom.defaults = {
      src: null,
      bufferConstructor: null
    }, buffersSerialize.defaults = {
      context: null,
      store: null,
      dropAttribute: {},
      onAttributesGet: function() {
        return r.mapPairs(this.attributes);
      },
      onBufferGet: function(e) {
        return e.buffer;
      }
    }, buffersDeserialize.defaults = {
      store: null,
      context: null,
      onAttribute: function(e, r) {
        e.buffer = r, new this.AttributeOfGeometry(e).addTo(this);
      }
    }, arrayMakeRandom.defaults = {
      int: 0,
      range: [ 0, 1 ],
      length: 1
    }, arrayDuplicate.defaults = {
      src: null,
      result: null,
      numberOfAtomsPerElement: 1,
      numberOfDuplicatesPerElement: 2
    }, arrayUnmask.defaults = {
      src: null,
      mask: null,
      onEach: null
    }, longUniqueAre.defaults = {
      src: null,
      // src2 : null,
      onEvaluate: null,
      includeFirst: 0
    };
    // --
    // fields
    // --
    // let unrollSymbol = Symbol.for( 'unroll' );
    let f = {
      // buffer
      buffersTypedAreEquivalent: 
      // --
      // buffer
      // --
      function buffersTypedAreEquivalent(e, t, n) {
        if (!r.bufferTypedIs(e)) return !1;
        if (!r.bufferTypedIs(t)) return !1;
        if (e.length !== t.length) debugger;
        if (e.length !== t.length) return !1;
        debugger;
        null !== n && void 0 !== n || (n = r.accuracy);
        for (let r = 0; r < e.length; r++) if (Math.abs(e[r] - t[r]) > n) return !1;
        return !0;
      }
      //
      ,
      buffersTypedAreIdentical: function buffersTypedAreIdentical(e, t) {
        if (!r.bufferTypedIs(e)) return !1;
        if (!r.bufferTypedIs(t)) return !1;
        if (s.call(e) !== s.call(t)) return !1;
        if (e.length !== t.length) debugger;
        if (e.length !== t.length) return !1;
        for (let r = 0; r < e.length; r++) if (!Object.is(e[r], t[r])) return !1;
        return !0;
      }
      //
      ,
      buffersRawAreIdentical: function buffersRawAreIdentical(e, t) {
        if (!r.bufferRawIs(e)) return !1;
        if (!r.bufferRawIs(t)) return !1;
        if (e.byteLength !== t.byteLength) debugger;
        if (e.byteLength !== t.byteLength) return !1;
        e = new Uint8Array(e), t = new Uint8Array(t);
        for (let r = 0; r < e.length; r++) if (e[r] !== t[r]) return !1;
        return !0;
      }
      //
      ,
      buffersViewAreIdentical: function buffersViewAreIdentical(e, t) {
        debugger;
        if (!r.bufferViewIs(e)) return !1;
        if (!r.bufferViewIs(t)) return !1;
        if (e.byteLength !== t.byteLength) debugger;
        if (e.byteLength !== t.byteLength) return !1;
        for (let r = 0; r < e.byteLength; r++) if (e.getUint8(r) !== t.getUint8(r)) return !1;
        return !0;
      }
      //
      ,
      buffersNodeAreIdentical: function buffersNodeAreIdentical(e, t) {
        debugger;
        return !!r.bufferNodeIs(e) && !!r.bufferNodeIs(t) && e.equals(t);
      }
      //
      ,
      buffersAreEquivalent: function buffersAreEquivalent(e, t, n) {
        return r.assert(2 === arguments.length || 3 === arguments.length, "Expects two or three arguments"), 
        r.bufferTypedIs(e) ? r.buffersTypedAreEquivalent(e, t, n) : r.bufferRawIs(e) ? r.buffersRawAreIdentical(e, t) : r.bufferViewIs(e) ? r.buffersViewAreIdentical(e, t) : !!r.bufferNodeIs(e) && r.buffersNodeAreIdentica(e, t);
      }
      //
      ,
      buffersAreIdentical: function buffersAreIdentical(e, t) {
        return r.assert(2 === arguments.length, "Expects exactly two arguments"), s.call(e) === s.call(t) && (r.bufferTypedIs(e) ? r.buffersTypedAreIdentical(e, t) : r.bufferRawIs(e) ? r.buffersRawAreIdentical(e, t) : r.bufferViewIs(e) ? r.buffersViewAreIdentical(e, t) : !!r.bufferNodeIs(e) && r.buffersNodeAreIdentical(e, t));
      }
      //
      /**
 * The bufferMakeSimilar() routine returns a new array or a new TypedArray with length equal (length)
 * or new TypedArray with the same length of the initial array if second argument is not provided.
 *
 * @param { longIs } ins - The instance of an array.
 * @param { Number } [ length = ins.length ] - The length of the new array.
 *
 * @example
 * // returns [ , ,  ]
 * let arr = _.bufferMakeSimilar( [ 1, 2, 3 ] );
 *
 * @example
 * // returns [ , , ,  ]
 * let arr = _.bufferMakeSimilar( [ 1, 2, 3 ], 4 );
 *
 * @returns { longIs }  Returns an array with a certain (length).
 * @function bufferMakeSimilar
 * @throws { Error } If the passed arguments is less than two.
 * @throws { Error } If the (length) is not a number.
 * @throws { Error } If the first argument in not an array like object.
 * @throws { Error } If the (length === undefined) and (_.numberIs(ins.length)) is not a number.
 * @memberof wTools
 */
      /* qqq : implement */ ,
      bufferMakeSimilar: function bufferMakeSimilar(e, t) {
        throw r.err("not tested");
      }
      //
      /* qqq : implement */ ,
      bufferButRange: function bufferButRange(e, t, n) {
        throw t = r.rangeFrom(t), r.assert(r.bufferTypedIs(e)), r.assert(void 0 === n || r.longIs(n)), 
        r.assert(2 === arguments.length || 3 === arguments.length), r.err("not implemented");
      }
      //
      /**
 * The bufferRelen() routine returns a new or the same typed array {-srcMap-} with a new or the same length (len).
 *
 * It creates the variable (result) checks, if (len) is more than (src.length),
 * if true, it creates and assigns to (result) a new typed array with the new length (len) by call the function(longMake(src, len))
 * and copies each element from the {-srcMap-} into the (result) array while ensuring only valid data types, if data types are invalid they are replaced with zero.
 * Otherwise, if (len) is less than (src.length) it returns a new typed array from 0 to the (len) indexes, but not including (len).
 * Otherwise, it returns an initial typed array.
 *
 * @see {@link wTools.longMake} - See for more information.
 *
 * @param { typedArray } src - The source typed array.
 * @param { Number } len - The length of a typed array.
 *
 * @example
 * // returns [ 3, 7, 13, 0 ]
 * let ints = new Int8Array( [ 3, 7, 13 ] );
 * _.bufferRelen( ints, 4 );
 *
 * @example
 * // returns [ 3, 7, 13 ]
 * let ints2 = new Int16Array( [ 3, 7, 13, 33, 77 ] );
 * _.bufferRelen( ints2, 3 );
 *
 * @example
 * // returns [ 3, 0, 13, 0, 77, 0 ]
 * let ints3 = new Int32Array( [ 3, 7, 13, 33, 77 ] );
 * _.bufferRelen( ints3, 6 );
 *
 * @returns { typedArray } - Returns a new or the same typed array {-srcMap-} with a new or the same length (len).
 * @function bufferRelen
 * @memberof wTools
 */ ,
      bufferRelen: function bufferRelen(e, t) {
        r.assert(r.bufferTypedIs(e)), r.assert(2 === arguments.length, "Expects exactly two arguments"), 
        r.assert(r.numberIs(t));
        let n = e;
        return t > e.length ? (n = r.longMake(e, t)).set(e) : t < e.length && (n = e.subarray(0, t)), 
        n;
      }
      //
      /* qqq : implement for 2 other types of buffer and do code test coverage */ ,
      bufferResize: function bufferResize(e, t) {
        let n = e;
        if (r.assert(r.bufferRawIs(e) || r.bufferTypedIs(e)), r.assert(e.byteLength >= 0), 
        r.assert(2 === arguments.length, "Expects exactly two arguments"), t > e.byteLength) {
          n = r.longMake(e, t);
          let s = new Uint8Array(n, 0, n.byteLength), f = new Uint8Array(e, 0, e.byteLength);
          s.set(f);
        } else t < e.byteLength && (n = e.slice(0, t));
        return n;
      }
      //
      ,
      bufferBytesGet: function bufferBytesGet(e) {
        return e instanceof ArrayBuffer ? new Uint8Array(e) : "undefined" != typeof Buffer && e instanceof Buffer ? new Uint8Array(e.buffer, e.byteOffset, e.byteLength) : r.bufferTypedIs(e) ? new Uint8Array(e.buffer, e.byteOffset, e.byteLength) : r.strIs(e) ? _global_.Buffer ? new Uint8Array(r.bufferRawFrom(Buffer.from(e, "utf8"))) : new Uint8Array(r.encode.utf8ToBuffer(e)) : void r.assert(0, "wrong argument");
      }
      //
      /**
   * The bufferRetype() routine converts and returns a new instance of (bufferType) constructor.
   *
   * @param { typedArray } src - The typed array.
   * @param { typedArray } bufferType - The type of typed array.
   *
   * @example
   * // returns [ 513, 1027, 1541 ]
   * let view1 = new Int8Array( [ 1, 2, 3, 4, 5, 6 ] );
   * _.bufferRetype(view1, Int16Array);
   *
   * @example
   * // returns [ 1, 2, 3, 4, 5, 6 ]
   * let view2 = new Int16Array( [ 513, 1027, 1541 ] );
   * _.bufferRetype(view2, Int8Array);
   *
   * @returns { typedArray } Returns a new instance of (bufferType) constructor.
   * @function bufferRetype
   * @throws { Error } Will throw an Error if {-srcMap-} is not a typed array object.
   * @throws { Error } Will throw an Error if (bufferType) is not a type of the typed array.
   * @memberof wTools
   */ ,
      bufferRetype: function bufferRetype(e, t) {
        r.assert(r.bufferTypedIs(e)), r.assert(r.constructorIsBuffer(t));
        let n = e.byteOffset, s = Math.floor(e.byteLength / t.BYTES_PER_ELEMENT);
        return new t(e.buffer, n, s);
      }
      //
      ,
      bufferJoin: function bufferJoin() {
        if (arguments.length < 2) return arguments[0] || null;
        let e, t = [], n = 0;
        for (let s = 0; s < arguments.length; s++) {
          let f = arguments[s];
          null !== f && (e || (e = f), r.bufferRawIs(f) ? t.push(new Uint8Array(f)) : f instanceof Uint8Array ? t.push(f) : t.push(new Uint8Array(f.buffer, f.byteOffset, f.byteLength)), 
          r.assert(f.byteLength >= 0, "Expects buffers, but got", r.strType(f)), n += f.byteLength);
        }
        if (0 === t.length) return null;
        // if( srcs.length < 2 )
        // return firstSrc || null;
        /* */        let s = new ArrayBuffer(n), f = r.bufferRawIs(e) ? s : new e.constructor(s), a = f.constructor === Uint8Array ? f : new Uint8Array(s), l = 0;
        for (let e = 0; e < t.length; e++) {
          let r = t[e];
          if (a.set) a.set(r, l); else for (let e = 0; e < r.length; e++) a[l + e] = r[e];
          l += r.byteLength;
        }
        return f;
      },
      bufferMove: bufferMove,
      bufferToStr: 
      //
      function bufferToStr(e) {
        let t = "";
        if (e instanceof ArrayBuffer && (e = new Uint8Array(e, 0, e.byteLength)), r.assert(1 === arguments.length, "Expects single argument"), 
        r.assert(r.bufferAnyIs(e)), r.bufferNodeIs(e)) return e.toString("utf8");
        try {
          t = String.fromCharCode.apply(null, e);
        } catch (r) {
          for (let r = 0; r < e.byteLength; r++) t += String.fromCharCode(e[r]);
        }
        return t;
      }
      //
      ,
      bufferToDom: function bufferToDom(e) {
        let t;
        if ("undefined" != typeof DOMParser && DOMParser.prototype.parseFromBuffer) throw t = new DOMParser().parseFromBuffer(e, e.byteLength, "text/xml"), 
        r.err("not tested");
        {
          let n = r.bufferToStr(e);
          t = this.strToDom(n);
        }
        return t;
      }
      //
      ,
      bufferLeft: function bufferLeft(e, t) {
        r.bufferRawIs(e) || (e = r.bufferBytesGet(e)), r.bufferRawIs(t) || (t = r.bufferBytesGet(t)), 
        r.assert(e.indexOf), r.assert(t.indexOf);
        let n = e.indexOf(t[0]);
        for (;-1 !== n; ) {
          for (let r = 0; r < t.length && e[n + r] === t[r]; r++) ;
          if (i === t.length) return n;
          n += 1, n = e.indexOf(t[0], n);
        }
        return -1;
      }
      //
      ,
      bufferSplit: function bufferSplit(e, t) {
        r.bufferRawIs(e) || (e = r.bufferBytesGet(e)), r.bufferRawIs(t) || (t = r.bufferBytesGet(t)), 
        r.assert(e.indexOf), r.assert(t.indexOf);
        let n = [], s = 0, f = e.indexOf(t[0]);
        for (;-1 !== f; ) {
          for (let r = 0; r < t.length && e[f + r] === t[r]; r++) ;
          i === t.length ? (n.push(e.slice(s, f)), s = f += i) : f += 1, f = e.indexOf(t[0], f);
        }
        return 0 === s ? n.push(e) : n.push(e.slice(s, e.length)), n;
      }
      //
      ,
      bufferCutOffLeft: function bufferCutOffLeft(e, t) {
        r.bufferRawIs(e) || (e = r.bufferBytesGet(e)), r.bufferRawIs(t) || (t = r.bufferBytesGet(t)), 
        r.assert(e.indexOf), r.assert(t.indexOf);
        let n = [], s = e.indexOf(t[0]);
        for (;-1 !== s; ) {
          for (let r = 0; r < t.length && e[s + r] === t[r]; r++) ;
          if (i === t.length) return n.push(e.slice(0, s)), n.push(e.slice(s, s + i)), n.push(e.slice(s + i, e.length)), 
          n;
          s += 1, s = e.indexOf(t[0], s);
        }
        return n.push(null), n.push(null), n.push(e), n;
      }
      //
      ,
      bufferFromArrayOfArray: function bufferFromArrayOfArray(e, t) {
        if (r.objectIs(e) && (e = (t = e).buffer), e = (t = t || Object.create(null)).buffer = e || t.buffer, 
        //
        void 0 === t.BufferType && (t.BufferType = Float32Array), void 0 === t.sameLength && (t.sameLength = 1), 
        !t.sameLength) throw r.err("_.bufferFromArrayOfArray :", "differemt length of arrays is not implemented");
        if (!e.length) return new t.BufferType();
        let n = r.numberIs(e[0].length) ? e[0].length : e[0].len;
        if (!r.numberIs(n)) throw r.err("_.bufferFromArrayOfArray :", "cant find out element length");
        let s = e.length * n, f = new t.BufferType(s), a = 0;
        for (let r = 0; r < e.length; r++) {
          let t = e[r];
          for (let e = 0; e < n; e++) f[a] = t[e], a += 1;
        }
        return f;
      },
      bufferFrom: bufferFrom,
      bufferRawFromTyped: 
      //
      /**
 * The bufferRawFromTyped() routine returns a new ArrayBuffer from (buffer.byteOffset) to the end of an ArrayBuffer of a typed array (buffer)
 * or returns the same ArrayBuffer of the (buffer), if (buffer.byteOffset) is not provided.
 *
 * @param { typedArray } buffer - Entity to check.
 *
 * @example
 * // returns [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ]
 * let buffer1 = new ArrayBuffer( 10 );
 * let view1 = new Int8Array( buffer1 );
 * _.bufferRawFromTyped( view1 );
 *
 * @example
 * // returns [ 0, 0, 0, 0, 0, 0 ]
 * let buffer2 = new ArrayBuffer( 10 );
 * let view2 = new Int8Array( buffer2, 2 );
 * _.bufferRawFromTyped( view2 );
 *
 * @returns { ArrayBuffer } Returns a new or the same ArrayBuffer.
 * If (buffer) is instance of '[object ArrayBuffer]', it returns buffer.
 * @function bufferRawFromTyped
 * @throws { Error } Will throw an Error if (arguments.length) is not equal to the 1.
 * @throws { Error } Will throw an Error if (buffer) is not a typed array.
 * @memberof wTools
 */
      function bufferRawFromTyped(e) {
        if (r.assert(1 === arguments.length, "Expects single argument"), r.assert(r.bufferTypedIs(e) || r.bufferRawIs(e)), 
        r.bufferRawIs(e)) return e;
        let t = e.buffer;
        return (e.byteOffset || e.byteLength !== t.byteLength) && (t = t.slice(e.byteOffset || 0, e.byteLength)), 
        r.assert(r.bufferRawIs(t)), t;
      }
      //
      ,
      bufferRawFrom: function bufferRawFrom(t) {
        let n;
        if (r.assert(1 === arguments.length, "Expects single argument"), t instanceof ArrayBuffer) return t;
        if (r.bufferNodeIs(t) || r.arrayIs(t)) 
        // result = buffer.buffer;
        n = new Uint8Array(t).buffer; else if (r.bufferTypedIs(t) || r.bufferViewIs(t)) {
          debugger;
          // _.assert( 0, 'not implemented' );
                    n = t.buffer, (t.byteOffset || t.byteLength !== n.byteLength) && (n = n.slice(t.byteOffset || 0, t.byteLength));
        } else r.strIs(t) ? n = _global_.Buffer ? r.bufferRawFrom(Buffer.from(t, "utf8")) : r.encode.utf8ToBuffer(t).buffer : e.File && t instanceof File ? (n = new FileReaderSync().readAsArrayBuffer(t), 
        r.assert(0, "not tested")) : r.assert(0, () => "Unknown type of source " + r.strType(t));
        return r.assert(r.bufferRawIs(n)), n;
      }
      //
      ,
      bufferBytesFrom: function bufferBytesFrom(e) {
        let t;
        if (r.assert(1 === arguments.length, "Expects single argument"), r.bufferNodeIs(e)) r.assert(r.bufferRawIs(e.buffer)), 
        t = new U8x(e.buffer, e.byteOffset, e.byteLength); else if (r.bufferRawIs(e)) t = new U8x(e, 0, e.byteLength); else if (r.bufferTypedIs(e)) t = new U8x(e.buffer, e.byteOffset, e.byteLength); else {
          if (!r.bufferViewIs(e)) return r.bufferBytesFrom(r.bufferRawFrom(e));
          debugger;
          // _.assert( 0, 'not tested' );
                    t = new U8x(e.buffer, e.byteOffset, e.byteLength);
        }
        return r.assert(r.bufferBytesIs(t)), t;
      }
      //
      ,
      bufferBytesFromNode: function bufferBytesFromNode(e) {
        return r.assert(r.bufferNodeIs(e)), new Uint8Array(buffer);
      }
      //
      /*
qqq : cover it
*/ ,
      bufferNodeFrom: function bufferNodeFrom(e) {
        if (r.assert(1 === arguments.length, "Expects single argument"), r.assert(r.bufferViewIs(e) || r.bufferTypedIs(e) || r.bufferRawIs(e) || r.bufferNodeIs(e) || r.strIs(e) || r.arrayIs(e), "Expects typed or raw buffer, but got", r.strType(e)), 
        r.bufferNodeIs(e)) return e;
        /* */
        // if( toBuffer === null )
        // try
        // {
        //   toBuffer = require( 'typedarray-to-buffer' );
        // }
        // catch( err )
        // {
        //   toBuffer = false;
        // }
        /* */        let t;
        if (0 === e.length || 0 === e.byteLength) 
        // _.assert( 0, 'not tested' );
        // result = new Buffer([]);
        t = Buffer.from([]); else if (r.strIs(e)) {
          debugger;
          t = r.bufferNodeFrom(r.bufferRawFrom(e));
        } else t = e.buffer ? Buffer.from(e.buffer, e.byteOffset, e.byteLength) : Buffer.from(e);
        // if( !buffer.length && !buffer.byteLength )
        // {
        //   buffer = new Buffer([]);
        // }
        // else if( toBuffer )
        // try
        // {
        //   buffer = toBuffer( buffer );
        // }
        // catch( err )
        // {
        //   debugger;
        //   buffer = toBuffer( buffer );
        // }
        // else
        // {
        //   if( _.bufferTypedIs( buffer ) )
        //   buffer = Buffer.from( buffer.buffer );
        //   else
        //   buffer = Buffer.from( buffer );
        // }
                return r.assert(r.bufferNodeIs(t)), t;
      },
      buffersSerialize: buffersSerialize,
      /* deprecated */
      buffersDeserialize: buffersDeserialize,
      /* deprecated */
      // array maker
      arrayMakeRandom: arrayMakeRandom,
      // scalarToVector,
      arrayFromCoercing: 
      //
      /**
 * The arrayFromCoercing() routine converts an object-like {-srcMap-} into Array.
 *
 * @param { * } src - To convert into Array.
 *
 * @example
 * // returns [ 3, 7, 13, 'abc', false, undefined, null, {} ]
 * _.arrayFromCoercing( [ 3, 7, 13, 'abc', false, undefined, null, {} ] );
 *
 * @example
 * // returns [ [ 'a', 3 ], [ 'b', 7 ], [ 'c', 13 ] ]
 * _.arrayFromCoercing( { a : 3, b : 7, c : 13 } );
 *
 * @example
 * // returns [ 3, 7, 13, 3.5, 5, 7.5, 13 ]
 * _.arrayFromCoercing( "3, 7, 13, 3.5abc, 5def, 7.5ghi, 13jkl" );
 *
 * @example
 * // returns [ 3, 7, 13, 'abc', false, undefined, null, { greeting: 'Hello there!' } ]
 * let args = ( function() {
 *   return arguments;
 * } )( 3, 7, 13, 'abc', false, undefined, null, { greeting: 'Hello there!' } );
 * _.arrayFromCoercing( args );
 *
 * @returns { Array } Returns an Array.
 * @function arrayFromCoercing
 * @throws { Error } Will throw an Error if {-srcMap-} is not an object-like.
 * @memberof wTools
 */
      function arrayFromCoercing(e) {
        return r.assert(1 === arguments.length, "Expects single argument"), r.arrayIs(e) ? e : r.objectIs(e) ? r.mapToArray(e) : r.longIs(e) ? n.call(e) : r.strIs(e) ? e.split(/[, ]+/).map(function(e) {
          if (e.length) return parseFloat(e);
        }) : r.argumentsArrayIs(e) ? n.call(e) : void r.assert(0, "Unknown data type : " + r.strType(e));
      }
      //
      /**
 * The arrayFromRange() routine generate array of arithmetic progression series,
 * from the range[ 0 ] to the range[ 1 ] with increment 1.
 *
 * It iterates over loop from (range[0]) to the (range[ 1 ] - range[ 0 ]),
 * and assigns to the each index of the (result) array (range[ 0 ] + 1).
 *
 * @param { longIs } range - The first (range[ 0 ]) and the last (range[ 1 ] - range[ 0 ]) elements of the progression.
 *
 * @example
 * // returns [ 1, 2, 3, 4 ]
 * let range = _.arrayFromRange( [ 1, 5 ] );
 *
 * @example
 * // returns [ 0, 1, 2, 3, 4 ]
 * let range = _.arrayFromRange( 5 );
 *
 * @returns { array } Returns an array of numbers for the requested range with increment 1.
 * May be an empty array if adding the step would not converge toward the end value.
 * @function arrayFromRange
 * @throws { Error } If passed arguments is less than one or more than one.
 * @throws { Error } If the first argument is not an array-like object.
 * @throws { Error } If the length of the (range) is not equal to the two.
 * @memberof wTools
 */ ,
      // arrayAs,
      arrayFromRange: function arrayFromRange(e) {
        r.numberIs(e) && (e = [ 0, e ]), r.assert(1 === arguments.length, "Expects single argument"), 
        r.assert(2 === e.length), r.assert(r.longIs(e));
        let t = e[0] <= e[1] ? 1 : -1;
        return this.arrayFromRangeWithStep(e, t);
      }
      //
      ,
      arrayFromProgressionArithmetic: function arrayFromProgressionArithmetic(e, t) {
        debugger;
        r.assert(2 === arguments.length, "Expects exactly two arguments"), r.assert(r.longIs(e)), 
        r.assert(isFinite(e[0])), r.assert(isFinite(e[1])), r.assert(isFinite(t)), r.assert(r.routineIs(this.ArrayType));
        debugger;
        if (0 === t) return new this.ArrayType();
        if (1 === t) return new this.ArrayType([ e[0] ]);
        let n = [ e[0], e[0] + e[1] * (t + 1) ], s = (n[1] - n[0]) / (t - 1);
        return this.arrayFromRangeWithStep(n, s);
      }
      //
      ,
      arrayFromRangeWithStep: function arrayFromRangeWithStep(e, t) {
        let n;
        if (r.assert(2 === arguments.length, "Expects exactly two arguments"), r.assert(isFinite(e[0])), 
        r.assert(isFinite(e[1])), r.assert(void 0 === t || t < 0 || t > 0), r.assert(r.routineIs(this.ArrayType)), 
        e[0] === e[1]) return new this.ArrayType();
        if (e[0] < e[1]) {
          void 0 === t && (t = 1), r.assert(t > 0), n = new this.ArrayType(Math.round((e[1] - e[0]) / t));
          let s = 0;
          for (;e[0] < e[1]; ) n[s] = e[0], e[0] += t, s += 1;
        } else {
          debugger;
          void 0 === t && (t = -1), r.assert(t < 0), n = new this.ArrayType(Math.round(e[0] - e[1] / t));
          let s = 0;
          for (;e[0] > e[1]; ) n[s] = e[0], e[0] += t, s += 1;
        }
        return n;
      }
      //
      ,
      arrayFromRangeWithNumberOfSteps: function arrayFromRangeWithNumberOfSteps(e, t) {
        if (r.assert(2 === arguments.length, "Expects exactly two arguments"), r.assert(isFinite(e[0])), 
        r.assert(isFinite(e[1])), r.assert(t >= 0), r.assert(r.routineIs(this.ArrayType)), 
        0 === t) return new this.ArrayType();
        if (1 === t) return new this.ArrayType(e[0]);
        let n;
        return n = e[0] < e[1] ? (e[1] - e[0]) / (t - 1) : (e[0] - e[1]) / (t - 1), this.arrayFromRangeWithStep(e, n);
      }
      // --
      // array converter
      // --
      /**
 * The arrayToMap() converts an (array) into Object.
 *
 * @param { longIs } array - To convert into Object.
 *
 * @example
 * // returns {  }
 * _.arrayToMap( [  ] );
 *
 * @example
 * // returns { '0' : 3, '1' : [ 1, 2, 3 ], '2' : 'abc', '3' : false, '4' : undefined, '5' : null, '6' : {} }
 * _.arrayToMap( [ 3, [ 1, 2, 3 ], 'abc', false, undefined, null, {} ] );
 *
 * @example
 * // returns { '0' : 3, '1' : 'abc', '2' : false, '3' : undefined, '4' : null, '5' : { greeting: 'Hello there!' } }
 * let args = ( function() {
 *   return arguments;
 * } )( 3, 'abc', false, undefined, null, { greeting: 'Hello there!' } );
 * _.arrayToMap( args );
 *
 * @returns { Object } Returns an Object.
 * @function arrayToMap
 * @throws { Error } Will throw an Error if (array) is not an array-like.
 * @memberof wTools
 */ ,
      // array converter
      arrayToMap: function arrayToMap(e) {
        let t = Object.create(null);
        r.assert(1 === arguments.length, "Expects single argument"), r.assert(r.longIs(e));
        for (let r = 0; r < e.length; r++) t[r] = e[r];
        return t;
      }
      //
      /**
 * The arrayToStr() routine joins an array {-srcMap-} and returns one string containing each array element separated by space,
 * only types of integer or floating point.
 *
 * @param { longIs } src - The source array.
 * @param { objectLike } [ options = {  } ] options - The options.
 * @param { Number } [ options.precision = 5 ] - The precision of numbers.
 * @param { String } [ options.type = 'mixed' ] - The type of elements.
 *
 * @example
 * // returns "1 2 3 "
 * _.arrayToStr( [ 1, 2, 3 ], { type : 'int' } );
 *
 * @example
 * // returns "3.500 13.77 7.330"
 * _.arrayToStr( [ 3.5, 13.77, 7.33 ], { type : 'float', precission : 4 } );
 *
 * @returns { String } Returns one string containing each array element separated by space,
 * only types of integer or floating point.
 * If (src.length) is empty, it returns the empty string.
 * @function arrayToStr
 * @throws { Error } Will throw an Error If (options.type) is not the number or float.
 * @memberof wTools
 */ ,
      /* dubious */
      arrayToStr: function arrayToStr(e, t) {
        let n = "";
        if (void 0 === (t = t || Object.create(null)).precission && (t.precission = 5), 
        void 0 === t.type && (t.type = "mixed"), !e.length) return n;
        if ("float" === t.type) {
          for (var s = 0; s < e.length - 1; s++) n += e[s].toPrecision(t.precission) + " ";
          n += e[s].toPrecision(t.precission);
        } else {
          if ("int" !== t.type) throw r.err("not tested");
          for (s = 0; s < e.length - 1; s++) n += String(e[s]) + " ";
          n += String(e[s]) + " ";
        }
        return n;
      }
      // --
      // array transformer
      // --
      /**
 * The arraySub() routine returns a shallow copy of a portion of an array
 * or a new TypedArray that contains
 * the elements from (begin) index to the (end) index,
 * but not including (end).
 *
 * @param { Array } src - Source array.
 * @param { Number } begin - Index at which to begin extraction.
 * @param { Number } end - Index at which to end extraction.
 *
 * @example
 * // returns [ 3, 4 ]
 * let arr = _.arraySub( [ 1, 2, 3, 4, 5 ], 2, 4 );
 *
 * @example
 * // returns [ 2, 3 ]
 * _.arraySub( [ 1, 2, 3, 4, 5 ], -4, -2 );
 *
 * @example
 * // returns [ 1, 2, 3, 4, 5 ]
 * _.arraySub( [ 1, 2, 3, 4, 5 ] );
 *
 * @returns { Array } - Returns a shallow copy of a portion of an array into a new Array.
 * @function arraySub
 * @throws { Error } If the passed arguments is more than three.
 * @throws { Error } If the first argument is not an array.
 * @memberof wTools
 */
      /* xxx : not array */ ,
      /* dubious */
      // array transformer
      arraySub: function arraySub(e, t, n) {
        return r.assert(arguments.length <= 3), r.assert(r.longIs(e), "unknown type of (-src-) argument"), 
        r.assert(r.routineIs(e.slice) || r.routineIs(e.subarray)), r.routineIs(e.subarray) ? e.subarray(t, n) : e.slice(t, n);
      }
      //
      ,
      arrayButRange: function arrayButRange(e, t, n) {
        r.assert(r.arrayLikeResizable(e)), r.assert(void 0 === n || r.longIs(n)), r.assert(2 === arguments.length || 3 === arguments.length);
        let s = [ t[0], t[1] - t[0] ];
        n && r.arrayAppendArray(s, n);
        let f = e.slice();
        return f.splice.apply(f, s), f;
      }
      //
      /* qqq : requires good test coverage */ ,
      arraySlice: function arraySlice(e, t, n) {
        return r.assert(r.arrayLikeResizable(e)), r.assert(1 <= arguments.length && arguments.length <= 3), 
        e.slice(t, n);
      }
      //
      /**
 * Changes length of provided array( array ) by copying it elements to newly created array using begin( f ),
 * end( l ) positions of the original array and value to fill free space after copy( val ). Length of new array is equal to ( l ) - ( f ).
 * If ( l ) < ( f ) - value of index ( f ) will be assigned to ( l ).
 * If ( l ) === ( f ) - returns empty array.
 * If ( l ) > ( array.length ) - returns array that contains elements with indexies from ( f ) to ( array.length ),
 * and free space filled by value of ( val ) if it was provided.
 * If ( l ) < ( array.length ) - returns array that contains elements with indexies from ( f ) to ( l ).
 * If ( l ) < 0 and ( l ) > ( f ) - returns array filled with some amount of elements with value of argument( val ).
 * If ( f ) < 0 - prepends some number of elements with value of argument( let ) to the result array.
 * @param { Array/Buffer } array - source array or buffer;
 * @param { Number } [ f = 0 ] - index of a first element to copy into new array;
 * @param { Number } [ l = array.length ] - index of a last element to copy into new array;
 * @param { * } val - value used to fill the space left after copying elements of the original array.
 *
 * @example
 * //Just partial copy of origin array
 * let arr = [ 1, 2, 3, 4 ]
 * let result = _.arrayGrow( arr, 0, 2 );
 * console.log( result );
 * //[ 1, 2 ]
 *
 * @example
 * //Increase size, fill empty with zeroes
 * let arr = [ 1 ]
 * let result = _.arrayGrow( arr, 0, 5, 0 );
 * console.log( result );
 * //[ 1, 0, 0, 0, 0 ]
 *
 * @example
 * //Take two last elements from original, other fill with zeroes
 * let arr = [ 1, 2, 3, 4, 5 ]
 * let result = _.arrayGrow( arr, 3, 8, 0 );
 * console.log( result );
 * //[ 4, 5, 0, 0, 0 ]
 *
 * @example
 * //Add two zeroes at the beginning
 * let arr = [ 1, 2, 3, 4, 5 ]
 * let result = _.arrayGrow( arr, -2, arr.length, 0 );
 * console.log( result );
 * //[ 0, 0, 1, 2, 3, 4, 5 ]
 *
 * @example
 * //Add two zeroes at the beginning and two at end
 * let arr = [ 1, 2, 3, 4, 5 ]
 * let result = _.arrayGrow( arr, -2, arr.length + 2, 0 );
 * console.log( result );
 * //[ 0, 0, 1, 2, 3, 4, 5, 0, 0 ]
 *
 * @example
 * //Source can be also a Buffer
 * let buffer = Buffer.from( '123' );
 * let result = _.arrayGrow( buffer, 0, buffer.length + 2, 0 );
 * console.log( result );
 * //[ 49, 50, 51, 0, 0 ]
 *
 * @returns { Array } Returns resized copy of a part of an original array.
 * @function arrayGrow
 * @throws { Error } Will throw an Error if( array ) is not a Array or Buffer.
 * @throws { Error } Will throw an Error if( f ) or ( l ) is not a Number.
 * @throws { Error } Will throw an Error if not enough arguments provided.
 * @memberof wTools
 */ ,
      arrayGrow: function arrayGrow(e, t, n, s) {
        let f;
        t = void 0 !== t ? t : 0, n = void 0 !== n ? n : e.length, r.assert(r.longIs(e)), 
        r.assert(r.numberIs(t)), r.assert(r.numberIs(n)), r.assert(1 <= arguments.length && arguments.length <= 4), 
        n < t && (n = t), f = r.bufferTypedIs(e) ? new e.constructor(n - t) : new Array(n - t)
        /* */;
        let a = Math.min(e.length, n);
        for (let r = Math.max(t, 0); r < a; r++) f[r - t] = e[r];
        /* */        if (void 0 !== s) {
          for (let e = 0; e < -t; e++) f[e] = s;
          for (let e = a - t; e < f.length; e++) f[e] = s;
        }
        return f;
      }
      //
      /**
 * Routine performs two operations: slice and grow.
 * "Slice" means returning a copy of original array( array ) that contains elements from index( f ) to index( l ),
 * but not including ( l ).
 * "Grow" means returning a bigger copy of original array( array ) with free space supplemented by elements with value of ( val )
 * argument.
 *
 * Returns result of operation as new array with same type as original array, original array is not modified.
 *
 * If ( f ) > ( l ), end index( l ) becomes equal to begin index( f ).
 * If ( l ) === ( f ) - returns empty array.
 *
 * To run "Slice", first ( f ) and last ( l ) indexes must be in range [ 0, array.length ], otherwise routine will run "Grow" operation.
 *
 * Rules for "Slice":
 * If ( f ) >= 0  and ( l ) <= ( array.length ) - returns array that contains elements with indexies from ( f ) to ( l ) but not including ( l ).
 *
 * Rules for "Grow":
 *
 * If ( f ) < 0 - prepends some number of elements with value of argument( val ) to the result array.
 * If ( l ) > ( array.length ) - returns array that contains elements with indexies from ( f ) to ( array.length ),
 * and free space filled by value of ( val ) if it was provided.
 * If ( l ) < 0, ( l ) > ( f ) - returns array filled with some amount of elements with value of argument( val ).
 *
 * @param { Array/Buffer } array - Source array or buffer.
 * @param { Number } [ f = 0 ] f - begin zero-based index at which to begin extraction.
 * @param { Number } [ l = array.length ] l - end zero-based index at which to end extraction.
 * @param { * } val - value used to fill the space left after copying elements of the original array.
 *
 * @example
 * _.arrayResize( [ 1, 2, 3, 4, 5, 6, 7 ], 2, 6 );
 * // returns [ 3, 4, 5, 6 ]
 *
 * @example
 * // begin index is less then zero
 * _.arrayResize( [ 1, 2, 3, 4, 5, 6, 7 ], -1, 2 );
 * // returns [ 1, 2 ]
 *
 * @example
 * //end index is bigger then length of array
 * _.arrayResize( [ 1, 2, 3, 4, 5, 6, 7 ], 5, 100 );
 * // returns [ 6, 7 ]
 *
 * @example
 * //Increase size, fill empty with zeroes
 * let arr = [ 1 ]
 * let result = _.arrayResize( arr, 0, 5, 0 );
 * console.log( result );
 * //[ 1, 0, 0, 0, 0 ]
 *
 * @example
 * //Take two last elements from original, other fill with zeroes
 * let arr = [ 1, 2, 3, 4, 5 ]
 * let result = _.arrayResize( arr, 3, 8, 0 );
 * console.log( result );
 * //[ 4, 5, 0, 0, 0 ]
 *
 * @example
 * //Add two zeroes at the beginning
 * let arr = [ 1, 2, 3, 4, 5 ]
 * let result = _.arrayResize( arr, -2, arr.length, 0 );
 * console.log( result );
 * //[ 0, 0, 1, 2, 3, 4, 5 ]
 *
 * @example
 * //Add two zeroes at the beginning and two at end
 * let arr = [ 1, 2, 3, 4, 5 ]
 * let result = _.arrayResize( arr, -2, arr.length + 2, 0 );
 * console.log( result );
 * //[ 0, 0, 1, 2, 3, 4, 5, 0, 0 ]
 *
 * @example
 * //Source can be also a Buffer
 * let buffer = Buffer.from( '123' );
 * let result = _.arrayResize( buffer, 0, buffer.length + 2, 0 );
 * console.log( result );
 * //[ 49, 50, 51, 0, 0 ]
 *
 * @returns { Array } Returns a shallow copy of elements from the original array supplemented with value of( val ) if needed.
 * @function arrayResize
 * @throws { Error } Will throw an Error if ( array ) is not an Array-like or Buffer.
 * @throws { Error } Will throw an Error if ( f ) is not a Number.
 * @throws { Error } Will throw an Error if ( l ) is not a Number.
 * @throws { Error } Will throw an Error if no arguments provided.
 * @memberof wTools
*/ ,
      arrayResize: function arrayResize(e, t, n, s) {
        let f;
        r.assert(r.longIs(e)), t = void 0 !== t ? t : 0, n = void 0 !== n ? n : e.length, 
        r.assert(r.numberIs(t)), r.assert(r.numberIs(n)), r.assert(1 <= arguments.length && arguments.length <= 4), 
        n < t && (n = t);
        let a = Math.min(e.length, n);
        f = r.bufferTypedIs(e) ? new e.constructor(n - t) : new Array(n - t);
        for (let r = Math.max(t, 0); r < a; r++) f[r - t] = e[r];
        if (void 0 !== s && (t < 0 || n > e.length)) {
          for (let e = 0; e < -t; e++) f[e] = s;
          let e = Math.max(a - t, 0);
          for (;e < f.length; e++) f[e] = s;
        }
        return f;
      }
      //
      /* srcBuffer = _.arrayMultislice( [ originalBuffer, f ], [ originalBuffer, 0, srcAttribute.atomsPerElement ] ); */ ,
      arrayMultislice: function arrayMultislice() {
        let e = 0;
        if (0 === arguments.length) return [];
        for (let t = 0; t < arguments.length; t++) {
          let n = arguments[t], s = n[1], f = n[2];
          r.assert(r.longIs(n) && r.longIs(n[0]), "Expects array of array"), s = void 0 !== s ? s : 0, 
          (f = void 0 !== f ? f : n[0].length) < s && (f = s), r.assert(r.numberIs(s)), r.assert(r.numberIs(f)), 
          n[1] = s, n[2] = f, e += f - s;
        }
        let t = new arguments[0][0].constructor(e), n = 0;
        for (let e = 0; e < arguments.length; e++) {
          let r = arguments[e], s = r[1], f = r[2];
          for (let e = s; e < f; e++, n++) t[n] = r[0][e];
        }
        return t;
      },
      arrayDuplicate: arrayDuplicate,
      arrayMask: 
      //
      /**
 * The arrayMask() routine returns a new instance of array that contains the certain value(s) from array (srcArray),
 * if an array (mask) contains the truth-value(s).
 *
 * The arrayMask() routine checks, how much an array (mask) contain the truth value(s),
 * and from that amount of truth values it builds a new array, that contains the certain value(s) of an array (srcArray),
 * by corresponding index(es) (the truth value(s)) of the array (mask).
 * If amount is equal 0, it returns an empty array.
 *
 * @param { longIs } srcArray - The source array.
 * @param { longIs } mask - The target array.
 *
 * @example
 * // returns [  ]
 * _.arrayMask( [ 1, 2, 3, 4 ], [ undefined, null, 0, '' ] );
 *
 * @example
 * // returns [ "c", 4, 5 ]
 * _arrayMask( [ 'a', 'b', 'c', 4, 5 ], [ 0, '', 1, 2, 3 ] );
 *
 * @example
 * // returns [ 'a', 'b', 5, 'd' ]
 * _.arrayMask( [ 'a', 'b', 'c', 4, 5, 'd' ], [ 3, 7, 0, '', 13, 33 ] );
 *
 * @returns { longIs } Returns a new instance of array that contains the certain value(s) from array (srcArray),
 * if an array (mask) contains the truth-value(s).
 * If (mask) contains all falsy values, it returns an empty array.
 * Otherwise, it returns a new array with certain value(s) of an array (srcArray).
 * @function arrayMask
 * @throws { Error } Will throw an Error if (arguments.length) is less or more that two.
 * @throws { Error } Will throw an Error if (srcArray) is not an array-like.
 * @throws { Error } Will throw an Error if (mask) is not an array-like.
 * @throws { Error } Will throw an Error if length of both (srcArray and mask) is not equal.
 * @memberof wTools
 */
      function arrayMask(e, t) {
        let n = t.length, s = e.length / n;
        r.assert(2 === arguments.length, "Expects exactly two arguments"), r.assert(r.longIs(e), "arrayMask :", "Expects array-like as srcArray"), 
        r.assert(r.longIs(t), "arrayMask :", "Expects array-like as mask"), r.assert(r.numberIsInt(s), "arrayMask :", "Expects mask that has component for each atom of srcArray", r.toStr({
          "atomsPerElement": n,
          "srcArray.length": e.length
        }));
        let f = 0;
        for (let e = 0; e < t.length; e++) t[e] && (f += 1);
        let a = new e.constructor(s * f);
        if (!f) return a;
        let l = 0;
        for (let r = 0; r < s; r++) for (let s = 0; s < t.length; s++) t[s] && (a[l] = e[r * n + s], 
        l += 1);
        return a;
      },
      /* dubious */
      arrayUnmask: arrayUnmask,
      /* dubious */
      longUniqueAre: longUniqueAre,
      longUnduplicate: 
      //
      function longUnduplicate(e, t, n) {
        if (r.routineIs(arguments[1]) && void 0 === arguments[2] && (n = arguments[1], t = void 0), 
        r.assert(1 === arguments.length || 2 === arguments.length || 3 === arguments.length), 
        r.assert(null === e || r.arrayIs(e)), r.assert(void 0 === t || r.longIs(t)), r.assert(void 0 === n || r.routineIs(n)), 
        t && e && (e = r.arrayAppendArraysOnce(e, t), t = void 0), t) {
          r.assert(null === e);
          let s = r.longUniqueAre({
            src: t,
            onEvaluate: n,
            includeFirst: 1
          }), f = r.longMake(t, s.number), a = 0;
          for (let e = 0; e < t.length; e++) s.is[e] && (f[a] = t[e], a += 1);
          return f;
        }
        if (e) {
          let t = r.longUniqueAre({
            src: e,
            onEvaluate: n,
            includeFirst: 1
          });
          for (let r = e.length - 1; r >= 0; r--) t.is[r] || e.splice(r, 1);
          return e;
        }
        r.assert(0);
      }
      //
      // function longUnduplicate( dst, src, onEvaluate )
      // {
      //
      //   _.assert( arguments.length === 2 || arguments.length === 3 );
      //   _.assert( dst === null || _.arrayIs( dst ) );
      //   _.assert( src === null || _.longIs( src ) );
      //
      //   let dstUnique;
      //
      //   if( src && dst )
      //   {
      //     dst = _.arrayAppendArraysOnce( dst, src );
      //   }
      //
      //   x
      //
      //   let srcUnique = _.longUniqueAre
      //   ({
      //     src,
      //     onEvaluate,
      //     includeFirst : 1,
      //   });
      //
      //   let result = _.longMake( src, dstUnique.number + srcUnique.number );
      //
      //   let c = 0;
      //   for( let i = 0 ; i < src.length ; i++ )
      //   if( srcUnique.is[ i ] )
      //   {
      //     result[ c ] = src[ i ];
      //     c += 1;
      //   }
      //
      //   return result;
      // }
      /*

*/
      //
      /**
 * The arraySelect() routine selects elements from (srcArray) by indexes of (indicesArray).
 *
 * @param { longIs } srcArray - Values for the new array.
 * @param { ( longIs | object ) } [ indicesArray = indicesArray.indices ] - Indexes of elements from the (srcArray) or options object.
 *
 * @example
 * // returns [ 3, 4, 5 ]
 * let arr = _.arraySelect( [ 1, 2, 3, 4, 5 ], [ 2, 3, 4 ] );
 *
 * @example
 * // returns [ undefined, undefined ]
 * let arr = _.arraySelect( [ 1, 2, 3 ], [ 4, 5 ] );
 *
 * @returns { longIs } - Returns a new array with the length equal (indicesArray.length) and elements from (srcArray).
   If there is no element with necessary index than the value will be undefined.
 * @function arraySelect
 * @throws { Error } If passed arguments is not array like object.
 * @throws { Error } If the atomsPerElement property is not equal to 1.
 * @memberof wTools
 */ ,
      arraySelect: function arraySelect(e, t) {
        let n = 1;
        r.objectIs(t) && (n = t.atomsPerElement || 1, t = t.indices), r.assert(2 === arguments.length, "Expects exactly two arguments"), 
        r.assert(r.bufferTypedIs(e) || r.arrayIs(e)), r.assert(r.bufferTypedIs(t) || r.arrayIs(t));
        let s = new e.constructor(t.length);
        if (1 === n) for (let r = 0, n = t.length; r < n; r += 1) s[r] = e[t[r]]; else for (let r = 0, f = t.length; r < f; r += 1) 
        // throw _.err( 'not tested' );
        for (let f = 0; f < n; f += 1) s[r * n + f] = e[t[r] * n + f];
        return s;
      }
      // --
      // array mutator
      // --
      ,
      // array mutator
      arraySet: function arraySet(e, t, n) {
        return r.assert(3 === arguments.length, "Expects exactly three arguments"), r.assert(e.length > t), 
        e[t] = n, e;
      }
      //
      /**
 * The arraySwap() routine reverses the elements by indices (index1) and (index2) in the (dst) array.
 *
 * @param { Array } dst - The initial array.
 * @param { Number } index1 - The first index.
 * @param { Number } index2 - The second index.
 *
 * @example
 * // returns [ 5, 2, 3, 4, 1 ]
 * let arr = _.arraySwap( [ 1, 2, 3, 4, 5 ], 0, 4 );
 *
 * @returns { Array } - Returns the (dst) array that has been modified in place by indexes (index1) and (index2).
 * @function arraySwap
 * @throws { Error } If the first argument in not an array.
 * @throws { Error } If the second argument is less than 0 and more than a length initial array.
 * @throws { Error } If the third argument is less than 0 and more than a length initial array.
 * @memberof wTools
 */ ,
      arraySwap: function arraySwap(e, t, n) {
        1 === arguments.length && (t = 0, n = 1), r.assert(1 === arguments.length || 3 === arguments.length), 
        r.assert(r.longIs(e), "arraySwap :", "argument must be array"), r.assert(0 <= t && t < e.length, "arraySwap :", "index1 is out of bound"), 
        r.assert(0 <= n && n < e.length, "arraySwap :", "index2 is out of bound");
        let s = e[t];
        return e[t] = e[n], e[n] = s, e;
      }
      //
      /**
 * Removes range( range ) of elements from provided array( dstArray ) and adds elements from array( srcArray )
 * at the start position of provided range( range ) if( srcArray ) was provided.
 * On success returns array with deleted element(s), otherwise returns empty array.
 * For TypedArray's and buffers returns modified copy of ( dstArray ) or original array if nothing changed.
 *
 * @param { Array|TypedArray|Buffer } dstArray - The target array, TypedArray( Int8Array, Int16Array, Uint8Array ... etc ) or Buffer( ArrayBuffer, Buffer ).
 * @param { Array|Number } range - The range of elements or index of single element to remove from ( dstArray ).
 * @param { Array } srcArray - The array of elements to add to( dstArray ) at the start position of provided range( range ).
 * If one of ( range ) indexies is not specified it will be setted to zero.
 * If ( range ) start index is greater than the length of the array ( dstArray ), actual starting index will be set to the length of the array ( dstArray ).
 * If ( range ) start index is negative, will be setted to zero.
 * If ( range ) start index is greater than end index, the last will be setted to value of start index.
 *
 * @example
 * _.arrayCutin( [ 1, 2, 3, 4 ], 2 );
 * // returns [ 3 ]
 *
 * @example
 * _.arrayCutin( [ 1, 2, 3, 4 ], [ 1, 2 ] );
 * // returns [ 2 ]
 *
 * @example
 * _.arrayCutin( [ 1, 2, 3, 4 ], [ 0, 5 ] );
 * // returns [ 1, 2, 3, 4 ]
 *
 * @example
 * _.arrayCutin( [ 1, 2, 3, 4 ], [ -1, 5 ] );
 * // returns [ 1, 2, 3, 4 ]
 *
 * @example
 * let dst = [ 1, 2, 3, 4 ];
 * _.arrayCutin( dst, [ 0, 3 ], [ 0, 0, 0 ] );
 * console.log( dst );
 * // returns [ 0, 0, 0, 4 ]
 *
 * @example
 * let dst = new Int32Array( 4 );
 * dst.set( [ 1, 2, 3, 4 ] )
 * _.arrayCutin( dst, 0 );
 * // returns [ 2, 3, 4 ]
 *
 * @returns { Array|TypedArray|Buffer } For array returns array with deleted element(s), otherwise returns empty array.
 * For other types returns modified copy or origin( dstArray ).
 * @function arrayCutin
 * @throws { Error } If ( arguments.length ) is not equal to two or three.
 * @throws { Error } If ( dstArray ) is not an Array.
 * @throws { Error } If ( srcArray ) is not an Array.
 * @throws { Error } If ( range ) is not an Array.
 * @memberof wTools
 */ ,
      arrayCutin: function arrayCutin(e, t, n) {
        r.numberIs(t) && (t = [ t, t + 1 ]), r.assert(2 === arguments.length || 3 === arguments.length, "Expects two or three arguments"), 
        r.assert(r.arrayIs(e) || r.bufferAnyIs(e)), r.assert(r.arrayIs(t)), r.assert(void 0 === n || r.arrayIs(n));
        let s, f = r.definedIs(e.length) ? e.length : e.byteLength, a = void 0 !== t[0] ? t[0] : 0, l = void 0 !== t[1] ? t[1] : f;
        if (a < 0 && (a = 0), a > f && (a = f), l > f && (l = f), l < a && (l = a), r.bufferAnyIs(e)) {
          if (a === l) return e;
          let t = f - l + a, u = 0;
          if (n && (t += u = r.definedIs(n.length) ? n.length : n.byteLength), s = r.bufferRawIs(e) ? new ArrayBuffer(t) : r.bufferNodeIs(e) ? Buffer.alloc(t) : r.longMake(e, t), 
          a > 0) for (let r = 0; r < a; ++r) s[r] = e[r];
          if (n) for (let e = a, r = 0; r < u; ) s[e++] = n[r++];
          for (let r = l, t = a + u; r < f; ) s[t++] = e[r++];
          return s;
        }
        {
          let r = n ? n.slice() : [];
          r.unshift(l - a), r.unshift(a), s = e.splice.apply(e, r);
        }
        return s;
      }
      //
      /**
 * The arrayPut() routine puts all values of (arguments[]) after the second argument to the (dstArray)
 * in the position (dstOffset) and changes values of the following index.
 *
 * @param { longIs } dstArray - The source array.
 * @param { Number } [ dstOffset = 0 ] dstOffset - The index of element where need to put the new values.
 * @param {*} arguments[] - One or more argument(s).
 * If the (argument) is an array it iterates over array and adds each element to the next (dstOffset++) index of the (dstArray).
 * Otherwise, it adds each (argument) to the next (dstOffset++) index of the (dstArray).
 *
 * @example
 * // returns [ 1, 2, 'str', true, 7, 8, 9 ]
 * let arr = _.arrayPut( [ 1, 2, 3, 4, 5, 6, 9 ], 2, 'str', true, [ 7, 8 ] );
 *
 * @example
 * // returns [ 'str', true, 7, 8, 5, 6, 9 ]
 * let arr = _.arrayPut( [ 1, 2, 3, 4, 5, 6, 9 ], 0, 'str', true, [ 7, 8 ] );
 *
 * @returns { longIs } - Returns an array containing the changed values.
 * @function arrayPut
 * @throws { Error } Will throw an Error if (arguments.length) is less than one.
 * @throws { Error } Will throw an Error if (dstArray) is not an array-like.
 * @throws { Error } Will throw an Error if (dstOffset) is not a Number.
 * @memberof wTools
 */ ,
      arrayPut: function arrayPut(e, t) {
        r.assert(arguments.length >= 1, "Expects at least one argument"), r.assert(r.longIs(e)), 
        r.assert(r.numberIs(t)), t = t || 0;
        for (let n = 2; n < arguments.length; n++) {
          let s = arguments[n], f = r.arrayIs(s) || r.bufferTypedIs(s);
          if (f && r.bufferTypedIs(e)) e.set(s, t), t += s.length; else if (f) for (let r = 0; r < s.length; r++) e[t] = s[r], 
          t += 1; else e[t] = s, t += 1;
        }
        return e;
      }
      //
      /**
 * The arrayFill() routine fills all the elements of the given or a new array from the 0 index to an (options.times) index
 * with a static value.
 *
 * @param { ( Object | Number | Array ) } o - The options to fill the array.
 * @param { Number } [ o.times = result.length ] o.times - The count of repeats.
   If in the function passed an Array, the times will be equal the length of the array. If Number than this value.
 * @param { Number } [ o.value = 0 ] - The value for the filling.
 *
 * @example
 * // returns [ 3, 3, 3, 3, 3 ]
 * let arr = _.arrayFill( { times : 5, value : 3 } );
 *
 * @example
 * // returns [ 0, 0, 0, 0 ]
 * let arr = _.arrayFill( 4 );
 *
 * @example
 * // returns [ 0, 0, 0 ]
 * let arr = _.arrayFill( [ 1, 2, 3 ] );
 *
 * @returns { Array } - Returns an array filled with a static value.
 * @function arrayFill
 * @throws { Error } If missed argument, or got more than one argument.
 * @throws { Error } If passed argument is not an object.
 * @throws { Error } If the last element of the (o.result) is not equal to the (o.value).
 * @memberof wTools
 */ ,
      arrayFillTimes: function arrayFillTimes(e, t, n) {
        if (r.assert(2 === arguments.length || 3 === arguments.length, "Expects two or three arguments"), 
        r.assert(r.longIs(e)), void 0 === n && (n = 0), e.length < t && (e = r.arrayGrow(e, 0, t)), 
        r.routineIs(e.fill)) e.fill(n, 0, t); else {
          debugger;
          t < 0 && (t = e.length + t);
          for (let r = 0; r < t; r++) e[r] = n;
        }
        return r.assert(t <= 0 || e[t - 1] === n), e;
      }
      //
      ,
      arrayFillWhole: function arrayFillWhole(e, t) {
        return r.assert(r.longIs(e)), r.assert(1 === arguments.length || 2 === arguments.length), 
        void 0 === t && (t = 0), r.arrayFillTimes(e, e.length, t);
      }
      // {
      //   _.assert( arguments.length === 2 || arguments.length === 3, 'Expects two or three arguments' );
      //   _.assert( _.objectIs( o ) || _.numberIs( o ) || _.arrayIs( o ), 'arrayFill :', '"o" must be object' );
      //
      //   if( arguments.length === 1 )
      //   {
      //     if( _.numberIs( o ) )
      //     o = { times : o };
      //     else if( _.arrayIs( o ) )
      //     o = { result : o };
      //   }
      //   else
      //   {
      //     o = { result : arguments[ 0 ], value : arguments[ 1 ] };
      //   }
      //
      //   _.assertMapHasOnly( o, arrayFill.defaults );
      //   if( o.result )
      //   _.assert( _.longIs( o.result ) );
      //
      //   let result = o.result || [];
      //   let times = o.times !== undefined ? o.times : result.length;
      //   let value = o.value !== undefined ? o.value : 0;
      //
      //   if( _.routineIs( result.fill ) )
      //   {
      //     if( result.length < times )
      //     result.length = times;
      //     result.fill( value, 0, times );
      //   }
      //   else
      //   {
      //     for( let t = 0 ; t < times ; t++ )
      //     result[ t ] = value;
      //   }
      //
      //   _.assert( result[ times-1 ] === value );
      //   return result;
      // }
      //
      // arrayFill.defaults =
      // {
      //   result : null,
      //   times : null,
      //   value : null,
      // }
      //
      /**
 * The arraySupplement() routine returns an array (dstArray), that contains values from following arrays only type of numbers.
 * If the initial (dstArray) isn't contain numbers, they are replaced.
 *
 * It finds among the arrays the biggest array, and assigns to the variable (length), iterates over from 0 to the (length),
 * creates inner loop that iterates over (arguments[...]) from the right (arguments.length - 1) to the (arguments[0]) left,
 * checks each element of the arrays, if it contains only type of number.
 * If true, it adds element to the array (dstArray) by corresponding index.
 * Otherwise, it skips and checks following array from the last executable index, previous array.
 * If the last executable index doesn't exist, it adds 'undefined' to the array (dstArray).
 * After that it returns to the previous array, and executes again, until (length).
 *
 * @param { longIs } dstArray - The initial array.
 * @param { ...longIs } arguments[...] - The following array(s).
 *
 * @example
 * // returns ?
 * _.arraySupplement( [ 4, 5 ], [ 1, 2, 3 ], [ 6, 7, 8, true, 9 ], [ 'a', 'b', 33, 13, 'e', 7 ] );
 * @returns { longIs } - Returns an array that contains values only type of numbers.
 * @function arraySupplement
 * @throws { Error } Will throw an Error if (dstArray) is not an array-like.
 * @throws { Error } Will throw an Error if (arguments[...]) is/are not the array-like.
 * @memberof wTools
 */ ,
      arraySupplement: function arraySupplement(e) {
        let t = e;
        null === t && (t = []);
        let n = t.length;
        r.assert(r.longIs(t) || r.numberIs(t), "Expects object as argument");
        for (let e = arguments.length - 1; e >= 1; e--) r.assert(r.longIs(arguments[e]), "argument is not defined :", e), 
        n = Math.max(n, arguments[e].length);
        r.numberIs(t) && (t = arrayFill({
          value: t,
          times: n
        }));
        for (let r = 0; r < n; r++) {
          if (r in e && isFinite(e[r])) continue;
          let n;
          for (n = arguments.length - 1; n >= 1 && (!(r in arguments[n]) || isNaN(arguments[n][r])); n--) ;
          0 !== n && (t[r] = arguments[n][r]);
        }
        return t;
      }
      //
      /**
 * The arrayExtendScreening() routine iterates over (arguments[...]) from the right to the left (arguments[1]),
 * and returns a (dstArray) containing the values of the following arrays,
 * if the following arrays contains the indexes of the (screenArray).
 *
 * @param { longIs } screenArray - The source array.
 * @param { longIs } dstArray - To add the values from the following arrays,
 * if the following arrays contains indexes of the (screenArray).
 * If (dstArray) contains values, the certain values will be replaced.
 * @param { ...longIs } arguments[...] - The following arrays.
 *
 * @example
 * // returns [ 5, 6, 2 ]
 * _.arrayExtendScreening( [ 1, 2, 3 ], [  ], [ 0, 1, 2 ], [ 3, 4 ], [ 5, 6 ] );
 *
 * @example
 * // returns [ 'a', 6, 2, 13 ]
 * _.arrayExtendScreening( [ 1, 2, 3 ], [ 3, 'abc', 7, 13 ], [ 0, 1, 2 ], [ 3, 4 ], [ 'a', 6 ] );
 *
 * @example
 * // returns [ 3, 'abc', 7, 13 ]
 * _.arrayExtendScreening( [  ], [ 3, 'abc', 7, 13 ], [ 0, 1, 2 ], [ 3, 4 ], [ 'a', 6 ] )
 *
 * @returns { longIs } Returns a (dstArray) containing the values of the following arrays,
 * if the following arrays contains the indexes of the (screenArray).
 * If (screenArray) is empty, it returns a (dstArray).
 * If (dstArray) is equal to the null, it creates a new array,
 * and returns the corresponding values of the following arrays by the indexes of a (screenArray).
 * @function arrayExtendScreening
 * @throws { Error } Will throw an Error if (screenArray) is not an array-like.
 * @throws { Error } Will throw an Error if (dstArray) is not an array-like.
 * @throws { Error } Will throw an Error if (arguments[...]) is/are not an array-like.
 * @memberof wTools
 */ ,
      /* experimental */
      arrayExtendScreening: function arrayExtendScreening(e, t) {
        let n = t;
        null === n && (n = []), r.assert(r.longIs(e), "Expects object as screenArray"), 
        r.assert(r.longIs(n), "Expects object as argument");
        for (let e = arguments.length - 1; e >= 2; e--) r.assert(arguments[e], "argument is not defined :", e);
        for (let r = 0; r < e.length; r++) {
          if (void 0 === e[r]) continue;
          let t;
          for (t = arguments.length - 1; t >= 2 && !(r in arguments[t]); t--) ;
          1 !== t && (n[r] = arguments[t][r]);
        }
        return n;
      }
      //
      ,
      /* experimental */
      arrayShuffle: function arrayShuffle(e, t) {
        r.assert(1 === arguments.length || 2 === arguments.length), r.assert(r.longIs(e)), 
        void 0 === t && (t = e.length);
        let n, s, f = e.length;
        for (let r = 0; r < t; r++) {
          let t = Math.floor(Math.random() * f);
          n = e[r], s = e[t], e[r] = s, e[t] = n;
        }
        return e;
      }
      //
      ,
      arraySort: function arraySort(e, t) {
        if (r.assert(1 === arguments.length || 2 === arguments.length), r.assert(void 0 === t || r.routineIs(t)), 
        void 0 === t) {
          debugger;
          e.sort();
        } else 2 === t.length ? e.sort(t) : 1 === t.length ? e.sort(function(e, r) {
          return (e = t(e)) > (r = t(r)) ? 1 : e < r ? -1 : 0;
        }) : r.assert(0, "Expects signle-arguments evaluator or two-argument comparator");
        return e;
      }
      // --
      // array etc
      // --
      ,
      // array etc
      arrayIndicesOfGreatest: function arrayIndicesOfGreatest(e, t, n) {
        e.length;
        debugger;
        throw r.err("not tested");
      }
      //
      /**
 * The arraySum() routine returns the sum of an array {-srcMap-}.
 *
 * @param { longIs } src - The source array.
 * @param { Function } [ onEvaluate = function( e ) { return e } ] - A callback function.
 *
 * @example
 * // returns 15
 * _.arraySum( [ 1, 2, 3, 4, 5 ] );
 *
 * @example
 * // returns 29
 * _.arraySum( [ 1, 2, 3, 4, 5 ], function( e ) { return e * 2 } );
 *
 * @example
 * // returns 94
 * _.arraySum( [ true, false, 13, '33' ], function( e ) { return e * 2 } );
 *
 * @returns { Number } - Returns the sum of an array {-srcMap-}.
 * @function arraySum
 * @throws { Error } If passed arguments is less than one or more than two.
 * @throws { Error } If the first argument is not an array-like object.
 * @throws { Error } If the second argument is not a Function.
 * @memberof wTools
 */ ,
      /* dubious */
      arraySum: function arraySum(e, t) {
        let n = 0;
        r.assert(1 === arguments.length || 2 === arguments.length), r.assert(r.longIs(e), "arraySum :", "Expects ArrayLike"), 
        void 0 === t && (t = function(e) {
          return e;
        }), r.assert(r.routineIs(t));
        for (let r = 0; r < e.length; r++) n += t(e[r], r, e);
        return n;
      }
      // --
      // array set
      // --
      /**
 * Returns new array that contains difference between two arrays: ( src1 ) and ( src2 ).
 * If some element is present in both arrays, this element and all copies of it are ignored.
 * @param { longIs } src1 - source array;
 * @param { longIs} src2 - array to compare with ( src1 ).
 *
 * @example
 * // returns [ 1, 2, 3, 4, 5, 6 ]
 * _.arraySetDiff( [ 1, 2, 3 ], [ 4, 5, 6 ] );
 *
 * @example
 * // returns [ 2, 4, 3, 5 ]
 * _.arraySetDiff( [ 1, 2, 4 ], [ 1, 3, 5 ] );
 *
 * @returns { Array } Array with unique elements from both arrays.
 * @function arraySetDiff
 * @throws { Error } If arguments count is not 2.
 * @throws { Error } If one or both argument(s) are not longIs entities.
 * @memberof wTools
 */ ,
      /* dubious */
      // array set
      arraySetDiff: function arraySetDiff(e, t) {
        let n = [];
        r.assert(2 === arguments.length, "Expects exactly two arguments"), r.assert(r.longIs(e)), 
        r.assert(r.longIs(t));
        for (let r = 0; r < e.length; r++) -1 === t.indexOf(e[r]) && n.push(e[r]);
        for (let r = 0; r < t.length; r++) -1 === e.indexOf(t[r]) && n.push(t[r]);
        return n;
      }
      //
      /**
 * Returns new array that contains elements from ( src ) that are not present in ( but ).
 * All copies of ignored element are ignored too.
 * @param { longIs } src - source array;
 * @param { longIs} but - array of elements to ignore.
 *
 * @example
 * // returns []
 * _.arraySetBut( [ 1, 1, 1 ], [ 1 ] );
 *
 * @example
 * // returns [ 2, 2 ]
 * _.arraySetBut( [ 1, 1, 2, 2, 3, 3 ], [ 1, 3 ] );
 *
 * @returns { Array } Source array without elements from ( but ).
 * @function arraySetBut
 * @throws { Error } If arguments count is not 2.
 * @throws { Error } If one or both argument(s) are not longIs entities.
 * @memberof wTools
 */ ,
      arraySetBut: function arraySetBut(e) {
        let t = r.longSlice(arguments);
        if (null === e) {
          if (!(t.length > 1)) return [];
          e = r.longSlice(t[1]), t.splice(1, 1);
        }
        t[0] = e, r.assert(arguments.length >= 1, "Expects at least one argument");
        for (let e = 0; e < t.length; e++) r.assert(r.longIs(t[e]));
        for (let r = e.length - 1; r >= 0; r--) for (let n = 1; n < t.length; n++) if (-1 !== t[n].indexOf(e[r])) {
          e.splice(r, 1);
          break;
        }
        return e;
      }
      //
      /**
 * Returns array that contains elements from ( src ) that exists at least in one of arrays provided after first argument.
 * If element exists and it has copies, all copies of that element will be included into result array.
 * @param { longIs } src - source array;
 * @param { ...longIs } - sequence of arrays to compare with ( src ).
 *
 * @example
 * // returns [ 1, 3 ]
 * _.arraySetIntersection( [ 1, 2, 3 ], [ 1 ], [ 3 ] );
 *
 * @example
 * // returns [ 1, 1, 2, 2, 3, 3 ]
 * _.arraySetIntersection( [ 1, 1, 2, 2, 3, 3 ], [ 1 ], [ 2 ], [ 3 ], [ 4 ] );
 *
 * @returns { Array } Array with elements that are a part of at least one of the provided arrays.
 * @function arraySetIntersection
 * @throws { Error } If one of arguments is not an longIs entity.
 * @memberof wTools
 */ ,
      arraySetIntersection: function arraySetIntersection(e) {
        let t = 1;
        if (null === e) {
          if (!(arguments.length > 1)) return [];
          e = r.longSlice(arguments[1]), t = 2;
        }
        r.assert(arguments.length >= 1, "Expects at least one argument"), r.assert(r.longIs(e));
        for (let e = 1; e < arguments.length; e++) r.assert(r.longIs(arguments[e]));
        for (let r = e.length - 1; r >= 0; r--) for (let n = t; n < arguments.length; n++) if (-1 === arguments[n].indexOf(e[r])) {
          e.splice(r, 1);
          break;
        }
        return e;
      }
      //
      ,
      arraySetUnion: function arraySetUnion(e) {
        let t = r.longSlice(arguments);
        if (null === e) {
          if (!(arguments.length > 1)) return [];
          e = [];
        }
        r.assert(arguments.length >= 1, "Expects at least one argument"), r.assert(r.longIs(e));
        for (let e = 1; e < t.length; e++) r.assert(r.longIs(t[e]));
        for (let r = 1; r < t.length; r++) {
          let n = t[r];
          for (let r = 0; r < n.length; r++) -1 === e.indexOf(n[r]) && e.push(n[r]);
        }
        return e;
      }
      //
      /*
function arraySetContainAll( src )
{
  let result = [];

  _.assert( _.longIs( src ) );

  for( let a = 1 ; a < arguments.length ; a++ )
  {

    _.assert( _.longIs( arguments[ a ] ) );

    if( src.length > arguments[ a ].length )
    return false;

    for( let i = 0 ; i < src.length ; i++ )
    {

      throw _.err( 'Not tested' );
      if( arguments[ a ].indexOf( src[ i ] ) !== -1 )
      {
        throw _.err( 'Not tested' );
        return false;
      }

    }

  }

  return true;
}
*/
      //
      /**
   * The arraySetContainAll() routine returns true, if at least one of the following arrays (arguments[...]),
   * contains all the same values as in the {-srcMap-} array.
   *
   * @param { longIs } src - The source array.
   * @param { ...longIs } arguments[...] - The target array.
   *
   * @example
   * // returns true
   * _.arraySetContainAll( [ 1, 'b', 'c', 4 ], [ 1, 2, 3, 4, 5, 'b', 'c' ] );
   *
   * @example
   * // returns false
   * _.arraySetContainAll( [ 'abc', 'def', true, 26 ], [ 1, 2, 3, 4 ], [ 26, 'abc', 'def', true ] );
   *
   * @returns { boolean } Returns true, if at least one of the following arrays (arguments[...]),
   * contains all the same values as in the {-srcMap-} array.
   * If length of the {-srcMap-} is more than the next argument, it returns false.
   * Otherwise, it returns false.
   * @function arraySetContainAll
   * @throws { Error } Will throw an Error if {-srcMap-} is not an array-like.
   * @throws { Error } Will throw an Error if (arguments[...]) is not an array-like.
   * @memberof wTools
   */ ,
      arraySetContainAll: function arraySetContainAll(e) {
        r.assert(r.longIs(e));
        for (let e = 1; e < arguments.length; e++) r.assert(r.longIs(arguments[e]));
        for (let r = 1; r < arguments.length; r++) {
          let t = arguments[r];
          for (let r = 0; r < t.length; r++) if (-1 === e.indexOf(t[r])) return !1;
        }
        return !0;
      }
      //
      /**
 * The arraySetContainAny() routine returns true, if at least one of the following arrays (arguments[...]),
 * contains the first matching value from {-srcMap-}.
 *
 * @param { longIs } src - The source array.
 * @param { ...longIs } arguments[...] - The target array.
 *
 * @example
 * // returns true
 * _.arraySetContainAny( [ 33, 4, 5, 'b', 'c' ], [ 1, 'b', 'c', 4 ], [ 33, 13, 3 ] );
 *
 * @example
 * // returns true
 * _.arraySetContainAny( [ 'abc', 'def', true, 26 ], [ 1, 2, 3, 4 ], [ 26, 'abc', 'def', true ] );
 *
 * @example
 * // returns false
 * _.arraySetContainAny( [ 1, 'b', 'c', 4 ], [ 3, 5, 'd', 'e' ], [ 'abc', 33, 7 ] );
 *
 * @returns { Boolean } Returns true, if at least one of the following arrays (arguments[...]),
 * contains the first matching value from {-srcMap-}.
 * Otherwise, it returns false.
 * @function arraySetContainAny
 * @throws { Error } Will throw an Error if {-srcMap-} is not an array-like.
 * @throws { Error } Will throw an Error if (arguments[...]) is not an array-like.
 * @memberof wTools
 */ ,
      arraySetContainAny: function arraySetContainAny(e) {
        r.assert(r.longIs(e));
        for (let e = 1; e < arguments.length; e++) r.assert(r.longIs(arguments[e]));
        if (0 === e.length) return !0;
        for (let r = 1; r < arguments.length; r++) {
          let t, n = arguments[r];
          for (t = 0; t < n.length && -1 === e.indexOf(n[t]); t++) ;
          if (t === n.length) return !1;
        }
        return !0;
      }
      //
      ,
      arraySetContainNone: function arraySetContainNone(e) {
        r.assert(r.longIs(e));
        for (let t = 1; t < arguments.length; t++) {
          r.assert(r.longIs(arguments[t]));
          for (let r = 0; r < e.length; r++) if (-1 !== arguments[t].indexOf(e[r])) return !1;
        }
        return !0;
      }
      //
      /**
 * Returns true if ( ins1 ) and ( ins2) arrays have same length and elements, elements order doesn't matter.
 * Inner arrays of arguments are not compared and result of such combination will be false.
 * @param { longIs } ins1 - source array;
 * @param { longIs} ins2 - array to compare with.
 *
 * @example
 * // returns false
 * _.arraySetIdentical( [ 1, 2, 3 ], [ 4, 5, 6 ] );
 *
 * @example
 * // returns true
 * _.arraySetIdentical( [ 1, 2, 4 ], [ 4, 2, 1 ] );
 *
 * @returns { Boolean } Result of comparison as boolean.
 * @function arraySetIdentical
 * @throws { Error } If one of arguments is not an ArrayLike entity.
 * @throws { Error } If arguments length is not 2.
 * @memberof wTools
 */ ,
      arraySetIdentical: function arraySetIdentical(e, t) {
        return r.assert(2 === arguments.length, "Expects exactly two arguments"), r.assert(r.longIs(e)), 
        r.assert(r.longIs(t)), e.length === t.length && 0 === r.arraySetDiff(e, t).length;
      }
    };
    // --
    // routines
    // --
        //
    Object.assign(t, f), Object.assign(t, {}), 
    // --
    // export
    // --
    "undefined" != typeof module && null !== module && (module.exports = t);
  }();
  // == end of file gLongS
}();