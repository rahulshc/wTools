!function fEntityS() {
  // == begin of file fEntityS
  !function _fEntity_s_() {
    "use strict";
    // --
    // entity iterator
    // --
    /**
 * Routine eachSample() accepts the container {-o.sets-} with scalar or vector elements.
 * Routine returns an array of vectors. Each vector is a unique combination of elements of vectors
 * that is passed in option {-o.sets-}.
 *
 * Routine eachSample() accepts the options map {-o-} or two arguments. If options map
 * is used, all parameters can be set. If passed two arguments, first of them is ( sets )
 * and second is ( onEach ).
 *
 * @param {Array|Map} sets - Container with vector and scalar elements to combine new vectors.
 * @param {Routine|Null} onEach - Callback. Should not change elements of {-sample-}.
 * @param {Array|Map} sample - Container for new vectors. If not passed, routine create empty container.
 * @param {boolean} leftToRight - Sets the direction of combining. 1 - left to rigth, 0 - rigth to left. By default is 1.
 * @param {boolean} result - Sets retuned value. 1 - array with verctors, 0 - index of last element. By default is 1.
 *
 * @example
 * //returns  [ [ 0, 2 ], [ 1, 2 ] ]
 * var got = _.eachSample( { sets : [ [ 0, 1 ], 2 ] });
 *
 * @example
 * //returns  [ [ 0, 2 ], [ 1, 2 ],
 *              [ 0, 3 ], [ 1, 3 ] ]
 * var got = _.eachSample( { sets : [ [ 0, 1 ], [ 2, 3 ] ] });
 *
 * @example
 * //returns  [ { a : 0, b : 2}, { a : 1, b : 2},
 *              { a : 0, b : 3}, { a : 1, b : 3} ]
 * var got = _.eachSample( { sets : { a : [ 0, 1 ], b : [ 2, 3 ] } });
 *
 * @example
 * //returns  [ [ 3, 0 ], [ 2, 0 ],
 *              [ 3, 1 ], [ 2, 1 ] ]
 * var got = _.eachSample( { sets : [ [ 0, 1 ], [ 2, 3 ] ], leftToRight : 0 });
 *
 * @example
 * //returns  3
 * var got = _.eachSample( { sets : [ [ 0, 1 ], [ 2, 3 ] ], result : 0 });
 *
 * @function eachSample
 * @returns {Array} Returns array contained  check function.
 * @throws {exception} If ( arguments.length ) is less then one or more then two.
 * @throws {exception} If( onEach ) is not a Routine or null.
 * @throws {exception} If( o.sets ) is not array or objectLike.
 * @throws {exception} If ( sets ) is mapLike and ( onEach ) not passed.
 * @throws {exception} If( o.base ) or ( o.add) is undefined.
 * @memberof wTools
 */
    function eachSample(t) {
      /* */
      function nextSample(i) {
        let o = n[i];
        return r[i]++, r[i] >= l[i] ? (r[i] = 0, t.sample[o] = t.sets[o][r[i]], 0) : (t.sample[o] = t.sets[o][r[i]], 
        s += 1, t.result && (e.mapLike(t.sample) ? t.result.push(e.mapExtend(null, t.sample)) : t.result.push(t.sample.slice())), 
        1);
      }
      /* */      function iterate() {
        if (t.leftToRight) {
          for (let e = 0; e < i; e++) if (nextSample(e)) return 1;
        } else for (let e = i - 1; e >= 0; e--) if (nextSample(e)) return 1;
        return 0;
      }
      (2 === arguments.length || e.arrayLike(arguments[0])) && (t = {
        sets: arguments[0],
        onEach: arguments[1]
      }), e.routineOptions(eachSample, t), e.assert(1 === arguments.length || 2 === arguments.length), 
      e.assert(e.routineIs(t.onEach) || null === t.onEach), e.assert(e.arrayIs(t.sets) || e.mapLike(t.sets)), 
      e.assert(void 0 === t.base && void 0 === t.add), 
      /* sample */
      t.sample || (
      // Dmytro:
      // qqq: I think entityMakeTivial should be entityMakeTrivial. 7 missprints founded in wTools. Maybe, willbe contains this also.
      t.sample = e.entityMakeTivial(t.sets))
      /* */;
      let n = e.longIs(t.sets) ? e.arrayFromRange([ 0, t.sets.length ]) : e.mapKeys(t.sets);
      t.result && !e.arrayIs(t.result) && (t.result = []);
      let l = [], r = [], s = 0, i = e.entityLength(t.sets), o = 0;
      /* */
      if (
      // _.each( o.sets, function( e, k )
      // {
      //   let set = o.sets[ k ];
      //   _.assert( _.longIs( set ) || _.primitiveIs( set ) );
      //
      //   if( _.primitiveIs( set ) )
      //   o.sets[ k ] = [ set ]; /* qqq : should not change input data */
      //
      //   len[ sindex ] = _.entityLength( o.sets[ k ] );
      //   indexnd[ sindex ] = 0;
      //   sindex += 1;
      // });
      /* qqq : add tests */
      t.sets = e.filter(t.sets, function(n, s) {
        return e.assert(e.longIs(n) || e.primitiveIs(n)), e.primitiveIs(n) && (n = [ n ]) /* qqq : should not change input data */ , 
        l[o] = e.entityLength(t.sets[s]), r[o] = 0, o += 1, n;
      }), !
      /* */
      function firstSample() {
        let n = 0;
        return e.each(t.sets, function(e, s) {
          if (t.sample[s] = t.sets[s][r[n]], n += 1, !l[s]) return 0;
        }), t.result && (e.mapLike(t.sample) ? t.result.push(e.mapExtend(null, t.sample)) : t.result.push(t.sample.slice())), 
        1;
      }()) return t.result;
      do {
        t.onEach && t.onEach.call(t.sample, t.sample, s);
      } while (iterate());
      return t.result ? t.result : s;
    }
    //
    function entityEach(t, n) {
      /* */
      if (e.assert(2 === arguments.length), e.assert(n.length <= 3), 
      // _.assert( onEach.length <= 2 );
      e.assert(e.routineIs(n)), e.longIs(t)) for (let e = 0; e < t.length; e++) n(t[e], e, t); else if (e.objectLike(t)) for (let e in t) n(t[e], e, t); else n(t, void 0, void 0);
      /* */      return t;
    }
    //
        function entityEachKey(t, n) {
      /* */
      if (e.assert(2 === arguments.length), e.assert(n.length <= 3), 
      // _.assert( onEach.length <= 2 );
      e.assert(e.routineIs(n)), e.longIs(t)) for (let e = 0; e < t.length; e++) n(t[e], void 0, e, t); else if (e.objectLike(t)) {
        let e = 0;
        for (let l in t) n(l, t[l], e, t), e += 1;
      } else n(t, void 0, void 0, void 0);
      /* */      return t;
      // if( arguments.length === 2 )
      // o = { src : arguments[ 0 ], onUp : arguments[ 1 ] }
      //
      // _.routineOptions( eachKey, o );
      // _.assert( arguments.length === 1 || arguments.length === 2 );
      // _.assert( o.onUp && o.onUp.length <= 3 );
      //
      // /* */
      //
      // if( _.longIs( o.src ) )
      // {
      //
      //   for( let index = 0 ; index < o.src.length ; index++ )
      //   {
      //     o.onUp.call( o, o.src[ index ], undefined, index );
      //   }
      //
      // }
      // else if( _.objectLike( o.src ) )
      // {
      //
      //   let index = 0;
      //   for( let k in o.src )
      //   {
      //     o.onUp.call( o, k, o.src[ k ], index );
      //     index += 1;
      //   }
      //
      // }
      // else _.assert( 0, 'not container' );
      //
      // /* */
      //
      // return src;
        }
    //
    function entityEachOwn(t, l) {
      /* */
      if (e.assert(2 === arguments.length), e.assert(l.length <= 3), 
      // _.assert( onEach.length <= 2 );
      e.assert(e.routineIs(l)), e.longIs(t)) for (let e = 0; e < t.length; e++) l(t[e], e, t); else if (e.objectLike(t)) for (let e in t) n.call(t, e) && l(t[e], e, t); else l(t, void 0, void 0);
      /* */      return t;
    }
    //
        function entityAll(t, n) {
      let l = !0;
      // _.assert( onEach === undefined || ( _.routineIs( onEach ) && onEach.length <= 2 ) );
      /* */
      if (e.assert(1 === arguments.length || 2 === arguments.length), e.assert(void 0 === n || e.routineIs(n) && n.length <= 3), 
      e.routineIs(n)) {
        if (e.longIs(t)) {
          for (let e = 0; e < t.length; e++) if (!(l = n(t[e], e, t))) return l;
        } else if (e.objectLike(t)) {
          for (let e in t) if (!(l = n(t[e], e, t))) return l;
        } else if (!(l = n(t, void 0, void 0))) return l;
      } else if (e.longIs(t)) {
        for (let e = 0; e < t.length; e++) if (!(l = t[e])) return l;
      } else if (e.objectLike(t)) {
        for (let e in t) if (!(l = t[e])) return l;
      } else if (!(l = t)) return l;
      /* */      return !0;
    }
    //
        function entityAny(t, n) {
      let l = !1;
      // _.assert( onEach === undefined || ( _.routineIs( onEach ) && onEach.length <= 2 ) );
      /* */
      if (e.assert(1 === arguments.length || 2 === arguments.length), e.assert(void 0 === n || e.routineIs(n) && n.length <= 3), 
      e.routineIs(n)) {
        if (e.longIs(t)) {
          for (let e = 0; e < t.length; e++) if (l = n(t[e], e, void 0)) return l;
        } else if (e.objectLike(t)) {
          for (let e in t) if (l = n(t[e], e, void 0)) return l;
        } else if (l = n(t, void 0, void 0)) return l;
      } else if (e.longIs(t)) {
        for (let e = 0; e < t.length; e++) if (l = t[e]) return l;
      } else if (e.objectLike(t)) {
        for (let e in t) if (l = t[e]) return l;
      } else if (l = t) return l;
      /* */      return !1;
    }
    //
        function entityNone(t, n) {
      let l = !0;
      // _.assert( onEach === undefined || ( _.routineIs( onEach ) && onEach.length <= 2 ) );
      /* */
      if (e.assert(1 === arguments.length || 2 === arguments.length), e.assert(void 0 === n || e.routineIs(n) && n.length <= 3), 
      e.routineIs(n)) {
        if (e.longIs(t)) {
          for (let e = 0; e < t.length; e++) if (l = n(t[e], e, t)) return !l;
        } else if (e.objectLike(t)) {
          for (let e in t) if (l = n(t[e], e, t)) return !l;
        } else if (l = n(t, void 0, void 0)) return !l;
      } else if (e.longIs(t)) {
        for (let e = 0; e < t.length; e++) if (l = t[e]) return !l;
      } else if (e.objectLike(t)) {
        for (let e in t) if (l = t[e]) return !l;
      } else if (l = t) return !l;
      /* */      return !0;
    }
    //
    /**
 * Returns generated function that takes single argument( e ) and can be called to check if object( e )
 * has at least one key/value pair that is represented in( condition ).
 * If( condition ) is provided as routine, routine uses it to check condition.
 * Generated function returns origin( e ) if conditions is true, else undefined.
 *
 * @param {object|function} condition - Map to compare with( e ) or custom function.
 * @returns {function} Returns condition check function.
 *
 * @example
 * //returns Object {a: 1}
 * let check = _._filter_functor( { a : 1, b : 1, c : 1 } );
 * check( { a : 1 } );
 *
 * @example
 * //returns false
 * function condition( src ){ return src.y === 1 }
 * let check = _._filter_functor( condition );
 * check( { a : 2 } );
 *
 * @function _filter_functor
 * @throws {exception} If no argument provided.
 * @throws {exception} If( condition ) is not a Routine or Object.
 * @memberof wTools
 */    
    //
    /**
 * Function that produces an elements for entityMap result
 * @callback wTools.onEach
 * @param {*} val - The current element being processed in the entity.
 * @param {string|number} key - The index (if entity is array) or key of processed element.
 * @param {Array|Object} src - The src passed to entityMap.
 */
    /**
 * Creates new instance with same as( src ) type. Elements of new instance results of calling a provided ( onEach )
 * function on every element of src. If entity is array, the new array has the same length as source.
 *
 * @example
  let numbers = [ 3, 4, 6 ];

  function sqr( v )
  {
    return v * v
  };

  let res = wTools.entityMap(numbers, sqr);
  // [ 9, 16, 36 ]
  // numbers is still [ 3, 4, 6 ]

  function checkSidesOfTriangle( v, i, src )
  {
    let sumOthers = 0,
      l = src.length,
      j;

    for ( j = 0; j < l; j++ )
    {
      if ( i === j ) continue;
      sumOthers += src[ j ];
    }
    return v < sumOthers;
  }

  let res = wTools.entityMap( numbers, checkSidesOfTriangle );
 // [ true, true, true ]
 *
 * @param {ArrayLike|ObjectLike} src - Entity, on each elements of which will be called ( onEach ) function.
 * @param {wTools.onEach} onEach - Function that produces an element of the new entity.
 * @returns {ArrayLike|ObjectLike} New entity.
 * @thorws {Error} If number of arguments less or more than 2.
 * @thorws {Error} If( src ) is not Array or ObjectLike.
 * @thorws {Error} If( onEach ) is not function.
 * @function entityMap
 * @memberof wTools
 */
    function entityMap(t, n) {
      let l;
      if (e.assert(2 === arguments.length, "Expects exactly two arguments"), e.assert(e.routineIs(n)), 
      e.longIs(t)) {
        l = e.entityMakeTivial(t);
        for (let r = 0; r < t.length; r++) l[r] = n(t[r], r, t), e.assert(void 0 !== l[r], "{-entityMap-} onEach should return defined values, to been able return undefined to delete element use ( entityFilter )");
      } else if (e.objectLike(t)) {
        l = e.entityMakeTivial(t);
        for (let r in t) l[r] = n(t[r], r, t), e.assert(void 0 !== l[r], "{-entityMap-} onEach should return defined values, to been able return undefined to delete element use ( entityFilter )");
      } else l = n(t, void 0, void 0), e.assert(void 0 !== l, "{-entityMap-} onEach should return defined values, to been able return undefined to delete element use ( entityFilter )");
      return l;
    }
    //
    /* qqq :
cover entityFilter and entityFilterDeep
take into account unroll cases
*/    function entityFilter(t, n) {
      let l;
      /* */
      if (n = e._filter_functor(n, 1), e.assert(2 === arguments.length), 
      // _.assert( _.objectLike( src ) || _.longIs( src ), () => 'Expects objectLike or longIs src, but got ' + _.strType( src ) );
      e.assert(e.routineIs(n)), e.assert(void 0 !== t, "Expects src"), e.longIs(t)) {
        let r, s;
        for (l = e.longMake(t, 0), r = 0, s = 0; r < t.length; r++) {
          let i = n.call(t, t[r], r, t);
          e.unrollIs(i) ? (e.arrayAppendArray(l, i), s += i.length) : void 0 !== i && (l[s] = i, 
          s += 1);
        }
        s < t.length && (l = e.arraySlice(l, 0, s));
      }
      // else if( _.objectLike( src ) )
       else if (e.mapLike(t)) {
        l = e.entityMakeTivial(t);
        for (let e in t) {
          let r = n.call(t, t[e], e, t);
          void 0 !== r && (l[e] = r);
        }
      } else l = n.call(null, t, null, null);
      /* */      return l;
    }
    //
        function _entityFilterDeep(t) {
      let n, l = e._filter_functor(t.onEach, t.conditionLevels);
      /* */
      if (e.assert(1 === arguments.length, "Expects single argument"), e.assert(e.objectLike(t.src) || e.longIs(t.src), "entityFilter : expects objectLike or longIs src, but got", e.strType(t.src)), 
      e.assert(e.routineIs(l)), e.longIs(t.src)) {
        let r, s;
        for (n = e.longMake(t.src, 0), r = 0, s = 0; r < t.src.length; r++) 
        // for( let s = 0, d = 0 ; s < o.src.length ; s++, d++ )
        {
          let i = l.call(t.src, t.src[r], r, t.src);
          e.unrollIs(i) ? (e.arrayAppendArray(n, i), s += i.length) : void 0 !== i && (n[s] = i, 
          s += 1);
          // if( r === undefined )
          // d--;
          // else
          // result[ d ] = r;
                }
        debugger;
        s < t.src.length && (n = e.arraySlice(n, 0, s));
      } else {
        n = e.entityMakeTivial(t.src);
        for (let e in t.src) {
          let r = l.call(t.src, t.src[e], e, t.src);
          // r = onEach.call( o.src, o.src[ s ], s, o.src );
                    void 0 !== r && (n[e] = r);
        }
      }
      /* */      return n;
    }
    //
    function entityFilterDeep(t, n) {
      return e.assert(2 === arguments.length, "Expects exactly two arguments"), _entityFilterDeep({
        /*ttt*/ src: t,
        /*ttt*/ onEach: n,
        conditionLevels: 1024
      });
    }
    // --
    // entity modifier
    // --
        //
    /**
 * Copies entity( src ) into( dst ) or returns own copy of( src ).Result depends on several moments:
 * -If( src ) is a Object - returns clone of( src ) using ( onRecursive ) callback function if its provided;
 * -If( dst ) has own 'copy' routine - copies( src ) into( dst ) using this routine;
 * -If( dst ) has own 'set' routine - sets the fields of( dst ) using( src ) passed to( dst.set );
 * -If( src ) has own 'clone' routine - returns clone of( src ) using ( src.clone ) routine;
 * -If( src ) has own 'slice' routine - returns result of( src.slice ) call;
 * -Else returns a copy of entity( src ).
 *
 * @param {object} dst - Destination object.
 * @param {object} src - Source object.
 * @param {routine} onRecursive - The callback function to copy each [ key, value ].
 * @see {@link wTools.mapCloneAssigning} Check this function for more info about( onRecursive ) callback.
 * @returns {object} Returns result of entities copy operation.
 *
 * @example
 * let dst = { set : function( src ) { this.str = src.src } };
 * let src = { src : 'string' };
 *  _.entityAssign( dst, src );
 * console.log( dst.str )
 * //returns "string"
 *
 * @example
 * let dst = { copy : function( src ) { for( let i in src ) this[ i ] = src[ i ] } }
 * let src = { src : 'string', num : 123 }
 *  _.entityAssign( dst, src );
 * console.log( dst )
 * //returns Object {src: "string", num: 123}
 *
 * @example
 * //returns 'string'
 *  _.entityAssign( null, new String( 'string' ) );
 *
 * @function entityAssign
 * @throws {exception} If( arguments.length ) is not equal to 3 or 2.
 * @throws {exception} If( onRecursive ) is not a Routine.
 * @memberof wTools
 *
 */
    function entityAssign(t, n, l) {
      let r;
      if (e.assert(2 === arguments.length || 3 === arguments.length, "Expects two or three arguments"), 
      e.assert(arguments.length < 3 || e.routineIs(l)), null === n) r = n; else if (t && e.routineIs(t.copy)) t.copy(n); else if (n && e.routineIs(n.clone)) {
        if (t instanceof n.constructor) throw e.err("not tested");
        e.primitiveIs(t) || e.longIs(t) ? r = n.clone() : e.assert(0, "unknown");
      } else n && e.routineIs(n.slice) ? r = n.slice() : t && e.routineIs(t.set) ? t.set(n) : r = e.objectIs(n) ? l ? e.mapCloneAssigning({
        srcMap: n,
        dstMap: e.primitiveIs(t) ? Object.create(null) : t,
        onField: l
      }) : e.mapCloneAssigning({
        srcMap: n
      }) : n;
      return r;
    }
    //
    /**
 * Short-cut for entityAssign function. Copies specified( name ) field from
 * source container( srcContainer ) into( dstContainer ).
 *
 * @param {object} dstContainer - Destination object.
 * @param {object} srcContainer - Source object.
 * @param {string} name - Field name.
 * @param {mapCloneAssigning.onField} onRecursive - The callback function to copy each [ key, value ].
 * @see {@link wTools.mapCloneAssigning} Check this function for more info about( onRecursive ) callback.
 * @returns {object} Returns result of entities copy operation.
 *
 * @example
 * let dst = {};
 * let src = { a : 'string' };
 * let name = 'a';
 * _.entityAssignFieldFromContainer(dst, src, name );
 * console.log( dst.a === src.a );
 * //returns true
 *
 * @example
 * let dst = {};
 * let src = { a : 'string' };
 * let name = 'a';
 * function onRecursive( dstContainer, srcContainer, key )
 * {
 *   _.assert( _.strIs( key ) );
 *   dstContainer[ key ] = srcContainer[ key ];
 * };
 * _.entityAssignFieldFromContainer(dst, src, name, onRecursive );
 * console.log( dst.a === src.a );
 * //returns true
 *
 * @function entityAssignFieldFromContainer
 * @throws {exception} If( arguments.length ) is not equal to 3 or 4.
 * @memberof wTools
 *
 */    
    //
    /**
 * The result of _entityMost routine object.
 * @typedef {Object} wTools.entityMostResult
 * @property {Number} index - Index of found element.
 * @property {String|Number} key - If the search was on map, the value of this property sets to key of found element.
 * Else if search was on array - to index of found element.
 * @property {Number} value - The found result of onEvaluate, if onEvaluate don't set, this value will be same as element.
 * @property {Number} element - The appropriate element for found value.
 */
    /**
 * Returns object( wTools.entityMostResult ) that contains min or max element of entity, it depends on( returnMax ).
 *
 * @param {ArrayLike|Object} src - Source entity.
 * @param {Function} onEvaluate  - ( onEach ) function is called for each element of( src ).If undefined routine uses it own function.
 * @param {Boolean} returnMax  - If true - routine returns maximum, else routine returns minimum value from entity.
 * @returns {wTools.entityMostResult} Object with result of search.
 *
 * @example
 * //returns { index: 0, key: 0, value: 1, element: 1 }
 * _._entityMost([ 1, 3, 3, 9, 10 ], undefined, 0 );
 *
 * @example
 * //returns { index: 4, key: 4, value: 10, element: 10 }
 * _._entityMost( [ 1, 3, 3, 9, 10 ], undefined, 1 );
 *
 * @example
 * //returns { index: 4, key: 4, value: 10, element: 10 }
 * _._entityMost( { a : 1, b : 2, c : 3 }, undefined, 0 );
 *
 * @private
 * @function _entityMost
 * @throws {Exception} If( arguments.length ) is not equal 3.
 * @throws {Exception} If( onEvaluate ) function is not implemented.
 * @memberof wTools
 */
    function _entityMost(t, n, l) {
      void 0 === n && (n = function(e) {
        return e;
      }), e.assert(3 === arguments.length, "Expects exactly three arguments"), e.assert(1 === n.length, "not mplemented");
      let r = null;
      r = l ? function(e, t) {
        return e - t;
      } : function(e, t) {
        return t - e;
      }, e.assert(1 === n.length), e.assert(2 === r.length);
      let s = {
        index: -1,
        key: void 0,
        value: void 0,
        element: void 0
      };
      if (e.longIs(t)) {
        if (0 === t.length) return s;
        s.key = 0, s.value = n(t[0]), s.element = t[0];
        for (let e = 0; e < t.length; e++) {
          let l = n(t[e]);
          r(l, s.value) > 0 && (s.key = e, s.value = l, s.element = t[e]);
        }
        s.index = s.key;
      } else {
        debugger;
        for (let e in t) {
          s.index = 0, s.key = e, s.value = n(t[e]), s.element = t[e];
          break;
        }
        let e = 0;
        for (let l in t) {
          let i = n(t[l]);
          r(i, s.value) > 0 && (s.index = e, s.key = l, s.value = i, s.element = t[l]), e += 1;
        }
      }
      return s;
    }
    //
    /**
 * Short-cut for _entityMost() routine. Returns object( wTools.entityMostResult ) with smallest value from( src ).
 *
 * @param {ArrayLike|Object} src - Source entity.
 * @param {Function} onEvaluate  - ( onEach ) function is called for each element of( src ).If undefined routine uses it own function.
 * @returns {wTools.entityMostResult} Object with result of search.
 *
 * @example
 *  //returns { index : 2, key : 'c', value 3: , element : 9  };
 *  let obj = { a : 25, b : 16, c : 9 };
 *  let min = wTools.entityMin( obj, Math.sqrt );
 *
 * @see wTools.onEach
 * @see wTools.entityMostResult
 * @function entityMin
 * @throws {Exception} If missed arguments.
 * @throws {Exception} If passed extra arguments.
 * @memberof wTools
 */    _global_;
    let e = _global_.wTools, t = _global_.wTools, n = (Array.prototype.slice, Function.prototype.bind, 
    Object.prototype.toString, Object.hasOwnProperty);
    eachSample.defaults = {
      leftToRight: 1,
      onEach: null,
      sets: null,
      sample: null,
      result: 1
    };
    var l = entityEachKey.defaults = Object.create(null);
    l.src = null, l.onUp = function(e, t) {}, _entityFilterDeep.defaults = {
      src: null,
      onEach: null,
      conditionLevels: 1
    };
    // --
    // fields
    // --
    let r = {
      // multiplier
      dup: 
      // --
      // multiplier
      // --
      function dup(t, n, l) {
        if (e.assert(2 === arguments.length || 3 === arguments.length, "Expects two or three arguments"), 
        e.assert(e.numberIs(n) || e.longIs(n), "dup expects times as number or array"), 
        e.numberIs(n)) {
          l || (l = new Array(n));
          for (let e = 0; e < n; e++) l[e] = t;
          return l;
        }
        if (e.longIs(n)) {
          e.assert(2 === n.length);
          let r = n[1] - n[0];
          l || (l = new Array(n[1]));
          for (let e = 0; e < r; e++) l[n[0] + e] = t;
          return l;
        }
        e.assert(0, "unexpected");
      }
      //
      ,
      multiple: function multiple(t, n) {
        return e.assert(2 === arguments.length), e.arrayLike(t) ? e.assert(t.length === n, () => "Vector should have " + n + " elements, but have " + t.length) : t = e.dup(t, n), 
        t;
      }
      //
      ,
      multipleAll: function multipleAll(t) {
        let n = void 0;
        e.assert(1 === arguments.length);
        for (let l = 0; l < t.length; l++) if (e.arrayIs(t[l])) {
          n = t[l].length;
          break;
        }
        if (void 0 === n) return t;
        for (let l = 0; l < t.length; l++) t[l] = e.multiple(t[l], n);
        return t;
      },
      // entity iterator
      eachSample: eachSample,
      entityEach: entityEach,
      each: entityEach,
      entityEachKey: entityEachKey,
      eachKey: entityEachKey,
      entityEachOwn: entityEachOwn,
      eachOwn: entityEachOwn,
      entityAll: entityAll,
      all: entityAll,
      entityAny: entityAny,
      any: entityAny,
      entityNone: entityNone,
      none: entityNone,
      _filter_functor: function _filter_functor(t, n) {
        if (e.assert(2 === arguments.length, "Expects exactly two arguments"), e.assert(e.routineIs(t) || e.objectIs(t)), 
        e.objectIs(t)) {
          let l = t;
          t = function selector(t, r, s) {
            return e.assert(3 === arguments.length), t === l ? t : e.objectLike(t) && e.mapSatisfy({
              /*ttt*/ template: l,
              src: t,
              /*ttt*/ levels: n
            }) ? t : void 0;
          };
        }
        return t;
      },
      entityMap: entityMap,
      map: entityMap,
      entityFilter: entityFilter,
      filter: entityFilter,
      _entityFilterDeep: _entityFilterDeep,
      entityFilterDeep: entityFilterDeep,
      filterDeep: entityFilterDeep,
      // entity modifier
      enityExtend: function enityExtend(t, n) {
        return e.assert(2 === arguments.length, "Expects exactly two arguments"), e.objectIs(n) || e.longIs(n) ? e.each(n, function(e, n) {
          t[n] = e;
        }) : t = n, t;
      }
      //
      ,
      enityExtendAppending: function enityExtendAppending(t, n) {
        return e.assert(2 === arguments.length, "Expects exactly two arguments"), e.objectIs(n) ? e.each(n, function(e, n) {
          t[n] = e;
        }) : e.longIs(n) ? null === t || void 0 === t ? t = e.longSlice(n) : e.arrayAppendArray(t, n) : t = n, 
        t;
      }
      //
      ,
      entityMake: function entityMake(t, n) {
        return e.assert(1 === arguments.length || 2 === arguments.length), e.arrayIs(t) ? new Array(void 0 !== n ? n : t.length) : e.longIs(t) ? e.bufferTypedIs(t) || e.bufferNodeIs(t) ? new t.constructor(void 0 !== n ? n : t.length) : new Array(void 0 !== n ? n : t.length) : e.mapIs(t) ? Object.create(null) : e.objectIs(t) ? new t.constructor() : void e.assert(0, "unexpected");
      }
      //
      ,
      entityMakeTivial: function entityMakeTivial(t, n) {
        return e.assert(1 === arguments.length || 2 === arguments.length), e.arrayIs(t) ? new Array(void 0 !== n ? n : t.length) : e.longIs(t) ? e.bufferTypedIs(t) || e.bufferNodeIs(t) ? new t.constructor(void 0 !== n ? n : t.length) : new Array(void 0 !== n ? n : t.length) : e.objectIs(t) ? Object.create(null) : void e.assert(0, "unexpected");
      }
      //
      ,
      entityShallowClone: function entityShallowClone(t) {
        return e.primitiveIs(t) ? t : e.mapIs(t) ? e.mapShallowClone(t) : e.longIs(t) ? e.longShallowClone(t) : void e.assert(0, "Not clear how to shallow clone", e.strType(t));
      },
      entityAssign: entityAssign,
      /* refactor!!! */
      entityAssignFieldFromContainer: function entityAssignFieldFromContainer(t, l, r, s) {
        let i;
        e.assert(e.strIs(r) || e.symbolIs(r)), e.assert(3 === arguments.length || 4 === arguments.length);
        let o = n.call(t, r) ? t[r] : void 0, a = l[r];
        return void 0 !== (i = s ? entityAssign(o, a, s) : entityAssign(o, a)) && (t[r] = i), 
        i;
      }
      //
      /**
 * Short-cut for entityAssign function. Assigns value of( srcValue ) to container( dstContainer ) field specified by( name ).
 *
 * @param {object} dstContainer - Destination object.
 * @param {object} srcValue - Source value.
 * @param {string} name - Field name.
 * @param {mapCloneAssigning.onField} onRecursive - The callback function to copy each [ key, value ].
 * @see {@link wTools.mapCloneAssigning} Check this function for more info about( onRecursive ) callback.
 * @returns {object} Returns result of entity field assignment operation.
 *
 * @example
 * let dstContainer = { a : 1 };
 * let srcValue = 15;
 * let name = 'a';
 * _.entityAssignField( dstContainer, srcValue, name );
 * console.log( dstContainer.a );
 * //returns 15
 *
 * @function entityAssignField
 * @throws {exception} If( arguments.length ) is not equal to 3 or 4.
 * @memberof wTools
 *
 */ ,
      /* dubious */
      entityAssignField: function entityAssignField(t, n, l, r) {
        let s;
        e.assert(e.strIs(l) || e.symbolIs(l)), e.assert(3 === arguments.length || 4 === arguments.length);
        let i = t[l];
        if (r) throw e.err("not tested");
        return void 0 !== (s = entityAssign(i, n)) && (t[l] = s), s;
      },
      /* dubious */
      _entityMost: _entityMost,
      entityMin: function entityMin(t, n) {
        return e.assert(1 === arguments.length || 2 === arguments.length), _entityMost(t, n, 0);
      }
      //
      /**
 * Short-cut for _entityMost() routine. Returns object( wTools.entityMostResult ) with biggest value from( src ).
 *
 * @param {ArrayLike|Object} src - Source entity.
 * @param {Function} onEvaluate  - ( onEach ) function is called for each element of( src ).If undefined routine uses it own function.
 * @returns {wTools.entityMostResult} Object with result of search.
 *
 * @example
 *  //returns { index: 0, key: "a", value: 25, element: 25 };
 *  let obj = { a: 25, b: 16, c: 9 };
 *  let max = wTools.entityMax( obj );
 *
 * @see wTools.onEach
 * @see wTools.entityMostResult
 * @function entityMax
 * @throws {Exception} If missed arguments.
 * @throws {Exception} If passed extra arguments.
 * @memberof wTools
 */ ,
      entityMax: function entityMax(t, n) {
        return e.assert(1 === arguments.length || 2 === arguments.length), _entityMost(t, n, 1);
      }
    };
    // --
    // routines
    // --
        //
    Object.assign(t, r), Object.assign(t, {}), 
    // --
    // export
    // --
    // if( typeof module !== 'undefined' )
    // if( _global.WTOOLS_PRIVATE )
    // { /* delete require.cache[ module.id ]; */ }
    "undefined" != typeof module && null !== module && (module.exports = t);
  }();
  // == end of file fEntityS
}();