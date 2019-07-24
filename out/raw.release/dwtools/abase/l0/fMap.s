!function fMapS() {
  // == begin of file fMapS
  !function _fMap_s_() {
    "use strict";
    //
    /**
 * The mapIs() routine determines whether the passed value is an Object,
 * and not inherits through the prototype chain.
 *
 * If the {-srcMap-} is an Object, true is returned,
 * otherwise false is.
 *
 * @param { * } src - Entity to check.
 *
 * @example
 * // returns true
 * mapIs( { a : 7, b : 13 } );
 *
 * @example
 * // returns false
 * mapIs( 13 );
 *
 * @example
 * // returns false
 * mapIs( [ 3, 7, 13 ] );
 *
 * @returns { Boolean } Returns true if {-srcMap-} is an Object, and not inherits through the prototype chain.
 * @function mapIs
 * @memberof wTools
 */
    function mapIs(t) {
      if (!e.objectIs(t)) return !1;
      let n = Object.getPrototypeOf(t);
      return !(null !== n && (n.constructor && "Object" !== n.constructor.name || null !== Object.getPrototypeOf(n) && (e.assert(null === n || !!n, "unexpected"), 
      1)));
    }
    //
        //
    /**
 * Short-cut for _mapSatisfy() routine.
 * Checks if object( o.src ) has at least one key/value pair that is represented in( o.template ).
 * Also works with ( o.template ) as routine that check( o.src ) with own rules.
 * @param {wTools.mapSatisfyOptions} o - Default options {@link wTools.mapSatisfyOptions}.
 * @returns { boolean } Returns true if( o.src ) has same key/value pair(s) with( o.template )
 * or result if ( o.template ) routine call is true.
 *
 * @example
 * //returns true
 * _.mapSatisfy( {a : 1, b : 1, c : 1 }, { a : 1, b : 2 } );
 *
 * @example
 * //returns true
 * _.mapSatisfy( { template : {a : 1, b : 1, c : 1 }, src : { a : 1, b : 2 } } );
 *
 * @example
 * //returns false
 * function routine( src ){ return src.a === 12 }
 * _.mapSatisfy( { template : routine, src : { a : 1, b : 2 } } );
 *
 * @function mapSatisfy
 * @throws {exception} If( arguments.length ) is not equal to 1 or 2.
 * @throws {exception} If( o.template ) is not a Object.
 * @throws {exception} If( o.template ) is not a Routine.
 * @throws {exception} If( o.src ) is undefined.
 * @memberof wTools
*/
    function mapSatisfy(t) {
      return 2 === arguments.length && (t = {
        template: arguments[0],
        src: arguments[1]
      }), e.assert(1 === arguments.length || 2 === arguments.length), e.assert(e.objectIs(t.template) || e.routineIs(t.template)), 
      e.assert(void 0 !== t.src), e.routineOptions(mapSatisfy, t), _mapSatisfy(t.template, t.src, t.src, t.levels);
    }
    //
    /**
 * Default options for _mapSatisfy() routine.
 * @typedef {object} wTools.mapSatisfyOptions
 * @property {object|function} [ template=null ] - Map to compare with( src ) or routine that checks each value of( src ).
 * @property {object} [ src=null ] - Source map.
 * @property {number} [ levels=256 ] - Number of levels in map structure.
 *
*/
    /**
 * Checks if object( src ) has at least one key/value pair that is represented in( template ).
 * Returns true if( template ) has one or more indentical key/value pair with( src ).
 * If( template ) is provided as routine, routine uses it to check( src ).
 * @param {wTools.mapSatisfyOptions} args - Arguments list {@link wTools.mapSatisfyOptions}.
 * @returns { boolean } Returns true if( src ) has same key/value pair(s) with( template ).
 *
 * @example
 * //returns true
 * _._mapSatisfy( {a : 1, b : 1, c : 1 }, { a : 1, b : 2 } );
 *
 * @example
 * //returns false
 * _._mapSatisfy( {a : 1, b : 1, c : 1 }, { y : 1 , j : 1 } );
 *
 * @example
 * //returns true
 * function template( src ){ return src.y === 1 }
 * _._mapSatisfy( template, { y : 1 , j : 1 } );
 *
 * @function _mapSatisfy
 * @memberof wTools
*/
    function _mapSatisfy(t, n, s, r) {
      if (t === n) return !0;
      if (0 === r) return e.objectIs(t) && e.objectIs(n) && e.routineIs(t.identicalWith) && n.identicalWith === t.identicalWith ? t.identicalWith(n) : t === n;
      if (r < 0) return !1;
      if (e.routineIs(t)) return t(n);
      if (!e.objectIs(n)) return !1;
      if (e.objectIs(t)) {
        for (let e in t) {
          let a = !1;
          if (!(a = _mapSatisfy(t[e], n[e], s, r - 1))) return !1;
        }
        return !0;
      }
      debugger;
      return !1;
    }
    //
        function mapHasKey(e, t) {
      return !!e && "object" == typeof e && !!Reflect.has(e, t);
    }
    // //
    //
    // function mapHasKey( object, key )
    // {
    //
    //   _.assert( arguments.length === 2, 'Expects exactly two arguments' );
    //
    //   if( _.strIs( key ) )
    //   return ( key in object );
    //   else if( _.mapIs( key ) )
    //   return ( _.nameUnfielded( key ).coded in object );
    //   else if( _.symbolIs( key ) )
    //   return ( key in object );
    //
    //   _.assert( 0, 'mapHasKey :', 'unknown type of key :', _.strType( key ) );
    // }
    //
    /**
 * The mapOwnKey() returns true if (object) has own property.
 *
 * It takes (name) checks if (name) is a String,
 * if (object) has own property with the (name).
 * If true, it returns true.
 *
 * @param { Object } object - Object that will be check.
 * @param { name } name - Target property.
 *
 * @example
 * // returns true
 * _.mapOwnKey( { a : 7, b : 13 }, 'a' );
 *
 * @example
 * // returns false
 * _.mapOwnKey( { a : 7, b : 13 }, 'c' );
 *
 * @returns { boolean } Returns true if (object) has own property.
 * @function mapOwnKey
 * @throws { mapOwnKey } Will throw an error if the (name) is unknown.
 * @memberof wTools
 */
    //
        //
    /**
 * @callback mapCloneAssigning.onField
 * @param { objectLike } dstContainer - destination object.
 * @param { objectLike } srcContainer - source object.
 * @param { string } key - key to coping from one object to another.
 * @param { function } onField - handler of fields.
 */
    /**
 * The mapCloneAssigning() routine is used to clone the values of all
 * enumerable own properties from {-srcMap-} object to an (options.dst) object.
 *
 * It creates two variables:
 * let options = options || {}, result = options.dst || {}.
 * Iterate over {-srcMap-} object, checks if {-srcMap-} object has own properties.
 * If true, it calls the provided callback function( options.onField( result, srcMap, k ) ) for each key (k),
 * and copies each [ key, value ] of the {-srcMap-} to the (result),
 * and after cycle, returns clone with prototype of srcMap.
 *
 * @param { objectLike } srcMap - The source object.
 * @param { Object } o - The options.
 * @param { objectLike } [options.dst = Object.create( null )] - The target object.
 * @param { mapCloneAssigning.onField } [options.onField()] - The callback function to copy each [ key, value ]
 * of the {-srcMap-} to the (result).
 *
 * @example
 * // returns Example { sex : 'Male', name : 'Peter', age : 27 }
 * function Example() {
 *   this.name = 'Peter';
 *   this.age = 27;
 * }
 * mapCloneAssigning( new Example(), { dst : { sex : 'Male' } } );
 *
 * @returns { objectLike }  The (result) object gets returned.
 * @function mapCloneAssigning
 * @throws { Error } Will throw an Error if ( o ) is not an Object,
 * if ( arguments.length > 2 ), if (key) is not a String or
 * if {-srcMap-} has not own properties.
 * @memberof wTools
 */
    function mapCloneAssigning(t) {
      t.dstMap = t.dstMap || Object.create(null), e.assert(e.mapIs(t)), e.assert(1 === arguments.length, "mapCloneAssigning :", "Expects {-srcMap-} as argument"), 
      e.assert(e.objectLike(t.srcMap), "mapCloneAssigning :", "Expects {-srcMap-} as argument"), 
      e.routineOptions(mapCloneAssigning, t), t.onField || (t.onField = function onField(t, n, s) {
        e.assert(e.strIs(s)), t[s] = n[s];
      });
      for (let e in t.srcMap) n.call(t.srcMap, e) && t.onField(t.dstMap, t.srcMap, e, t.onField);
      return Object.setPrototypeOf(t.dstMap, Object.getPrototypeOf(t.srcMap)), t.dstMap;
    }
    //
    function _filterTrue() {
      return !0;
    }
    function _filterFalse() {
      return !0;
    }
    //
    function _mapExtendRecursiveConditional(t, n, s) {
      e.assert(e.mapIs(s));
      for (let r in s) e.mapIs(s[r]) ? !0 === t.onUpFilter(n, s, r) && (e.objectIs(n[r]) || (n[r] = Object.create(null)), 
      _mapExtendRecursiveConditional(t, n[r], s[r])) : !0 === t.onField(n, s, r) && (n[r] = s[r]);
    }
    //
        //
    function _mapExtendRecursive(t, n) {
      e.assert(e.objectIs(n));
      for (let s in n) e.objectIs(n[s]) ? (e.objectIs(t[s]) || (t[s] = Object.create(null)), 
      _mapExtendRecursive(t[s], n[s])) : t[s] = n[s];
    }
    //
        // --
    // map manipulator
    // --
    /*
  qqq : add test
  Dmytro : tests is added
  qqq : reflect update in tests
*/
    function mapSetWithKeys(t, n, s) {
      function set(e, t, n) {
        void 0 === n ? delete e[t] : e[t] = n;
      }
      if (null === t && (t = Object.create(null)), e.assert(e.objectIs(t)), e.assert(e.arrayIs(n) || e.strIs(n)), 
      e.assert(3 === arguments.length, "Expects exactly three arguments"), e.arrayIs(n)) for (let e = 0; e < n.length; e++) set(t, n[e], s); else set(t, n, s);
      return t;
    }
    //
    /* qqq : add test */    
    // --
    // map getter
    // --
    function mapInvert(n, s) {
      let r, a = this === t ? Object.create(null) : this;
      n && (a.src = n), s && (a.dst = s), e.routineOptions(mapInvert, a), a.dst = a.dst || Object.create(null), 
      e.assert(1 === arguments.length || 2 === arguments.length), e.assert(e.objectLike(a.src)), 
      "delete" === a.duplicate && (r = Object.create(null))
      /* */;
      for (let t in a.src) {
        let n = a.src[t];
        "delete" !== a.duplicate || void 0 === a.dst[n] ? "array" === a.duplicate || "array-with-value" === a.duplicate ? (void 0 === a.dst[n] && (a.dst[n] = "array-with-value" === a.duplicate ? [ n ] : []), 
        a.dst[n].push(t)) : (e.assert(void 0 === a.dst[n], "Cant invert the map, it has several keys with value", a.src[t]), 
        a.dst[n] = t) : r[n] = t;
      }
      /* */      return "delete" === a.duplicate && e.mapDelete(a.dst, r), a.dst;
    }
    //
    function mapsFlatten(t) {
      return e.arrayIs(t) && (t = {
        src: t
      }), e.routineOptions(mapsFlatten, t), e.assert(1 === arguments.length, "Expects single argument"), 
      e.assert(!1 === t.delimeter || 0 === t.delimeter || e.strIs(t.delimeter)), e.assert(e.arrayLike(t.src) || e.mapLike(t.src)), 
      t.dst = t.dst || Object.create(null), 
      /* */
      function extend(n, s) {
        if (e.arrayLike(n)) for (let e = 0; e < n.length; e++) extend(n[e], s); else if (e.mapLike(n)) for (let r in n) {
          let a = r;
          e.strIs(t.delimeter) && (a = (s ? s + t.delimeter : "") + r), e.mapIs(n[r]) ? extend(n[r], a) : (e.assert(!!t.allowingCollision || void 0 === t.dst[a]), 
          t.dst[a] = n[r]);
        } else e.assert(0, "Expects map or array of maps, but got " + e.strType(n));
      }(t.src, ""), t.dst;
    }
    //
    /**
 * The mapToStr() routine converts and returns the passed object {-srcMap-} to the string.
 *
 * It takes an object and two strings (keyValSep) and (tupleSep),
 * checks if (keyValSep and tupleSep) are strings.
 * If false, it assigns them defaults ( ' : ' ) to the (keyValSep) and
 * ( '; ' ) to the tupleSep.
 * Otherwise, it returns a string representing the passed object {-srcMap-}.
 *
 * @param { objectLike } src - The object to convert to the string.
 * @param { string } [ keyValSep = ' : ' ] keyValSep - colon.
 * @param { string } [ tupleSep = '; ' ] tupleSep - semicolon.
 *
 * @example
 * // returns 'a : 1; b : 2; c : 3; d : 4'
 * _.mapToStr( { a : 1, b : 2, c : 3, d : 4 }, ' : ', '; ' );
 *
 * @example
 * // returns '0 : 1; 1 : 2; 2 : 3';
 * _.mapToStr( [ 1, 2, 3 ], ' : ', '; ' );
 *
 * @example
 * // returns '0 : a; 1 : b; 2 : c';
 * _.mapToStr( 'abc', ' : ', '; ' );
 *
 * @returns { string } Returns a string (result) representing the passed object {-srcMap-}.
 * @function mapToStr
 * @memberof wTools
 */
    function mapToStr(t) {
      e.strIs(t) && (t = {
        src: t
      }), e.routineOptions(mapToStr, t), e.assert(1 === arguments.length, "Expects single argument");
      let n = "";
      for (let e in t.src) n += e + t.keyValDelimeter + t.src[e] + t.entryDelimeter;
      return n.substr(0, n.length - t.entryDelimeter.length);
    }
    //
    function _mapKeys(t) {
      /* */
      function filter(s, r) {
        if (t.selectFilter) for (let a = 0; a < r.length; a++) {
          let l = t.selectFilter(s, r[a]);
          void 0 !== l && e.arrayAppendOnce(n, l);
        } else e.arrayAppendArrayOnce(n, r);
      }
      /* */      let n = [];
      if (e.routineOptions(_mapKeys, t), e.assert(1 === arguments.length, "Expects single argument"), 
      e.assert(e.objectLike(t)), e.assert(!(t.srcMap instanceof Map), "not implemented"), 
      e.assert(null === t.selectFilter || e.routineIs(t.selectFilter)), t.enumerable) filter(t.srcMap, e._mapEnumerableKeys(t.srcMap, t.own)); else if (t.own) filter(t.srcMap, Object.getOwnPropertyNames(t.srcMap)); else {
        let e = t.srcMap;
        n = [];
        do {
          filter(e, Object.getOwnPropertyNames(e)), e = Object.getPrototypeOf(e);
        } while (e);
      }
      /* */      return n;
    }
    //
    /**
 * This routine returns an array of a given objects enumerable properties,
 * in the same order as that provided by a for...in loop.
 * Accept single object. Each element of result array is unique.
 * Unlike standard [Object.keys]{@https://developer.mozilla.org/en/docs/Web/JavaScript/Reference/Global_Objects/Object/keys}
 * which accept object only mapKeys accept any object-like entity.
 *
 * @see {@link wTools.mapOwnKeys} - Similar routine taking into account own elements only.
 * @see {@link wTools.mapVals} - Similar routine returning values.
 *
 * @example
 * // returns [ "a", "b" ]
 * _.mapKeys({ a : 7, b : 13 });
 *
 * @example
 * // returns [ "a" ]
 * let o = { own : 1, enumerable : 0 };
 * _.mapKeys.call( o, { a : 1 } );
 *
 * @param { objectLike } srcMap - object of interest to extract keys.
 * @param { objectLike } o - routine options can be provided through routine`s context.
 * @param { boolean } [ o.own = false ] - count only object`s own properties.
 * @param { boolean } [ o.enumerable = true ] - count only object`s enumerable properties.
 * @return { array } Returns an array with unique string elements.
 * corresponding to the enumerable properties found directly upon object or empty array
 * if nothing found.
 * @function mapKeys
 * @throws { Exception } Throw an exception if {-srcMap-} is not an objectLike entity.
 * @throws { Error } Will throw an Error if unknown option is provided.
 * @memberof wTools
 */
    function mapKeys(n) {
      let s = this === t ? Object.create(null) : this;
      return e.assert(1 === arguments.length, "Expects single argument"), e.routineOptions(mapKeys, s), 
      e.assert(!e.primitiveIs(n)), s.srcMap = n, s.enumerable ? e._mapEnumerableKeys(s.srcMap, s.own) : e._mapKeys(s);
    }
    //
    /**
 * The mapOwnKeys() returns an array of a given object`s own enumerable properties,
 * in the same order as that provided by a for...in loop. Each element of result array is unique.
 *
 * @param { objectLike } srcMap - The object whose properties keys are to be returned.
 * @param { objectLike } o - routine options can be provided through routine`s context.
 * @param { boolean } [ o.enumerable = true ] - count only object`s enumerable properties.
 *
 * @example
 * // returns [ "a", "b" ]
 * _.mapOwnKeys({ a : 7, b : 13 });
 *
 * * @example
 * // returns [ "a" ]
 * let o = { enumerable : 0 };
 * _.mapOwnKeys.call( o, { a : 1 } );
 *
 * @return { array } Returns an array whose elements are strings
 * corresponding to the own enumerable properties found directly upon object or empty
 * array if nothing found.
 * @function mapOwnKeys
 * @throws { Error } Will throw an Error if {-srcMap-} is not an objectLike entity.
 * @throws { Error } Will throw an Error if unknown option is provided.
 * @memberof wTools
*/
    function mapOwnKeys(n) {
      let s, r = this === t ? Object.create(null) : this;
      if (e.assert(1 === arguments.length, "Expects single argument"), e.assertMapHasOnly(r, mapOwnKeys.defaults), 
      e.assert(!e.primitiveIs(n)), r.srcMap = n, r.own = 1, s = r.enumerable ? e._mapEnumerableKeys(r.srcMap, r.own) : e._mapKeys(r), 
      !r.enumerable) debugger;
      return s;
    }
    //
    /**
 * The mapAllKeys() returns all properties of provided object as array,
 * in the same order as that provided by a for...in loop. Each element of result array is unique.
 *
 * @param { objectLike } srcMap - The object whose properties keys are to be returned.
 *
 * @example
 * // returns [ "a", "b", "__defineGetter__", ... "isPrototypeOf" ]
 * let x = { a : 1 };
 * let y = { b : 2 };
 * Object.setPrototypeOf( x, y );
 * _.mapAllKeys( x );
 *
 * @return { array } Returns an array whose elements are strings
 * corresponding to the all properties found on the object.
 * @function mapAllKeys
 * @throws { Error } Will throw an Error if {-srcMap-} is not an objectLike entity.
 * @memberof wTools
*/
    function mapAllKeys(n) {
      let s = this === t ? Object.create(null) : this;
      e.assert(1 === arguments.length, "Expects single argument"), e.assertMapHasOnly(s, mapAllKeys.defaults), 
      e.assert(!e.primitiveIs(n)), s.srcMap = n, s.own = 0, s.enumerable = 0;
      let r = e._mapKeys(s);
      debugger;
      return r;
    }
    //
    function _mapVals(t) {
      e.routineOptions(_mapVals, t), e.assert(1 === arguments.length, "Expects single argument"), 
      e.assert(null === t.selectFilter || e.routineIs(t.selectFilter)), e.assert(null === t.selectFilter);
      // let selectFilter = o.selectFilter;
      //
      // if( o.selectFilter )
      // debugger;
      //
      // if( !o.selectFilter )
      // o.selectFilter = function getVal( srcMap, k )
      // {
      //   return srcMap[ k ]
      // }
      let n = e._mapKeys(t);
      for (let e = 0; e < n.length; e++) n[e] = t.srcMap[n[e]];
      return n;
    }
    //
    /**
 * The mapVals() routine returns an array of a given object's
 * enumerable property values, in the same order as that provided by a for...in loop.
 *
 * It takes an object {-srcMap-} creates an empty array,
 * checks if {-srcMap-} is an object.
 * If true, it returns an array of values,
 * otherwise it returns an empty array.
 *
 * @param { objectLike } srcMap - The object whose property values are to be returned.
 * @param { objectLike } o - routine options can be provided through routine`s context.
 * @param { boolean } [ o.own = false ] - count only object`s own properties.
 * @param { boolean } [ o.enumerable = true ] - count only object`s enumerable properties.
 *
 * @example
 * // returns [ "7", "13" ]
 * _.mapVals( { a : 7, b : 13 } );
 *
 * @example
 * let o = { own : 1 };
 * let a = { a : 7 };
 * let b = { b : 13 };
 * Object.setPrototypeOf( a, b );
 * _.mapVals.call( o, a )
 * // returns [ 7 ]
 *
 * @returns { array } Returns an array whose elements are strings.
 * corresponding to the enumerable property values found directly upon object.
 * @function mapVals
 * @throws { Error } Will throw an Error if {-srcMap-} is not an objectLike entity.
 * @throws { Error } Will throw an Error if unknown option is provided.
 * @memberof wTools
 */
    function mapVals(n) {
      let s = this === t ? Object.create(null) : this;
      return e.assert(1 === arguments.length, "Expects single argument"), e.routineOptions(mapVals, s), 
      e.assert(!e.primitiveIs(n)), s.srcMap = n, e._mapVals(s);
    }
    //
    /**
 * The mapOwnVals() routine returns an array of a given object's
 * own enumerable property values,
 * in the same order as that provided by a for...in loop.
 *
 * It takes an object {-srcMap-} creates an empty array,
 * checks if {-srcMap-} is an object.
 * If true, it returns an array of values,
 * otherwise it returns an empty array.
 *
 * @param { objectLike } srcMap - The object whose property values are to be returned.
 * @param { objectLike } o - routine options can be provided through routine`s context.
 * @param { boolean } [ o.enumerable = true ] - count only object`s enumerable properties.
 *
 * @example
 * // returns [ "7", "13" ]
 * _.mapOwnVals( { a : 7, b : 13 } );
 *
 * @example
 * let o = { enumerable : 0 };
 * let a = { a : 7 };
 * Object.defineProperty( a, 'x', { enumerable : 0, value : 1 } )
 * _.mapOwnVals.call( o, a )
 * // returns [ 7, 1 ]
 *
 * @returns { array } Returns an array whose elements are strings.
 * corresponding to the enumerable property values found directly upon object.
 * @function mapOwnVals
 * @throws { Error } Will throw an Error if {-srcMap-} is not an objectLike entity.
 * @throws { Error } Will throw an Error if unknown option is provided.
 * @memberof wTools
 */
    function mapOwnVals(n) {
      let s = this === t ? Object.create(null) : this;
      e.assert(1 === arguments.length, "Expects single argument"), e.assertMapHasOnly(s, mapVals.defaults), 
      e.assert(!e.primitiveIs(n)), s.srcMap = n, s.own = 1;
      let r = e._mapVals(s);
      debugger;
      return r;
    }
    //
    /**
 * The mapAllVals() returns values of all properties of provided object as array,
 * in the same order as that provided by a for...in loop.
 *
 * It takes an object {-srcMap-} creates an empty array,
 * checks if {-srcMap-} is an object.
 * If true, it returns an array of values,
 * otherwise it returns an empty array.
 *
 * @param { objectLike } srcMap - The object whose property values are to be returned.
 *
 * @example
 * // returns [ "7", "13", function __defineGetter__(), ... function isPrototypeOf() ]
 * _.mapAllVals( { a : 7, b : 13 } );
 *
 * @returns { array } Returns an array whose elements are strings.
 * corresponding to the enumerable property values found directly upon object.
 * @function mapAllVals
 * @throws { Error } Will throw an Error if {-srcMap-} is not an objectLike entity.
 * @memberof wTools
 */
    function mapAllVals(n) {
      let s = this === t ? Object.create(null) : this;
      e.assert(1 === arguments.length, "Expects single argument"), e.assertMapHasOnly(s, mapAllVals.defaults), 
      e.assert(!e.primitiveIs(n)), s.srcMap = n, s.own = 0, s.enumerable = 0;
      let r = e._mapVals(s);
      debugger;
      return r;
    }
    //
    function _mapPairs(t) {
      if (e.routineOptions(_mapPairs, t), e.assert(1 === arguments.length, "Expects single argument"), 
      e.assert(null === t.selectFilter || e.routineIs(t.selectFilter)), e.assert(!e.primitiveIs(t.srcMap)), 
      t.selectFilter, t.selectFilter) debugger;
      return t.selectFilter || (t.selectFilter = function getVal(e, t) {
        return [ t, e[t] ];
      }), e._mapKeys(t);
    }
    //
    /**
 * The mapPairs() converts an object into a list of unique [ key, value ] pairs.
 *
 * It takes an object {-srcMap-} creates an empty array,
 * checks if {-srcMap-} is an object.
 * If true, it returns a list of [ key, value ] pairs if they exist,
 * otherwise it returns an empty array.
 *
 * @param { objectLike } srcMap - Object to get a list of [ key, value ] pairs.
 * @param { objectLike } o - routine options can be provided through routine`s context.
 * @param { boolean } [ o.own = false ] - count only object`s own properties.
 * @param { boolean } [ o.enumerable = true ] - count only object`s enumerable properties.
 *
 * @example
 * // returns [ [ "a", 7 ], [ "b", 13 ] ]
 * _.mapPairs( { a : 7, b : 13 } );
 *
 * @example
 * let a = { a : 1 };
 * let b = { b : 2 };
 * Object.setPrototypeOf( a, b );
 * _.mapPairs.call( { own : 1 }, a );
 * //returns [ [ "a", 1 ] ]
 *
 * @returns { array } A list of [ key, value ] pairs.
 * @function mapPairs
 * @throws { Error } Will throw an Error if {-srcMap-} is not an objectLike entity.
 * @throws { Error } Will throw an Error if unknown option is provided.
 * @memberof wTools
 */
    function mapPairs(n) {
      let s = this === t ? Object.create(null) : this;
      return e.assert(1 === arguments.length, "Expects single argument"), e.assertMapHasOnly(s, mapPairs.defaults), 
      s.srcMap = n, e._mapPairs(s);
    }
    //
    /**
 * The mapOwnPairs() converts an object's own properties into a list of [ key, value ] pairs.
 *
 *
 * It takes an object {-srcMap-} creates an empty array,
 * checks if {-srcMap-} is an object.
 * If true, it returns a list of [ key, value ] pairs of object`s own properties if they exist,
 * otherwise it returns an empty array.
 *
 * @param { objectLike } srcMap - Object to get a list of [ key, value ] pairs.
 * @param { objectLike } o - routine options can be provided through routine`s context.
 * @param { boolean } [ o.enumerable = true ] - count only object`s enumerable properties.
 *
 * @example
 * // returns [ [ "a", 7 ], [ "b", 13 ] ]
 * _.mapOwnPairs( { a : 7, b : 13 } );
 *
 * @example
 * let a = { a : 1 };
 * let b = { b : 2 };
 * Object.setPrototypeOf( a, b );
 * _.mapOwnPairs( a );
 * //returns [ [ "a", 1 ] ]
 *
 * @example
 * let a = { a : 1 };
 * _.mapOwnPairs.call( { enumerable : 0 }, a );
 *
 * @returns { array } A list of [ key, value ] pairs.
 * @function mapOwnPairs
 * @throws { Error } Will throw an Error if {-srcMap-} is not an objectLike entity.
 * @throws { Error } Will throw an Error if unknown option is provided.
 * @memberof wTools
 */
    function mapOwnPairs(n) {
      let s = this === t ? Object.create(null) : this;
      e.assert(1 === arguments.length, "Expects single argument"), e.assertMapHasOnly(s, mapPairs.defaults), 
      s.srcMap = n, s.own = 1;
      let r = e._mapPairs(s);
      debugger;
      return r;
    }
    //
    /**
 * The mapAllPairs() converts all properties of the object {-srcMap-} into a list of unique [ key, value ] pairs.
 *
 * It takes an object {-srcMap-} creates an empty array,
 * checks if {-srcMap-} is an object.
 * If true, it returns a list of [ key, value ] pairs that repesents all properties of provided object{-srcMap-},
 * otherwise it returns an empty array.
 *
 * @param { objectLike } srcMap - Object to get a list of [ key, value ] pairs.
 *
 * @example
 * // returns [ [ "a", 7 ], [ "b", 13 ], ... [ "isPrototypeOf", function isPrototypeOf() ] ]
 * _.mapAllPairs( { a : 7, b : 13 } );
 *
 * @example
 * let a = { a : 1 };
 * let b = { b : 2 };
 * Object.setPrototypeOf( a, b );
 * _.mapAllPairs( a );
 * //returns [ [ "a", 1 ], [ "b", 2 ], ... [ "isPrototypeOf", function isPrototypeOf() ]  ]
 *
 * @returns { array } A list of [ key, value ] pairs.
 * @function mapAllPairs
 * @throws { Error } Will throw an Error if {-srcMap-} is not an objectLike entity.
 * @memberof wTools
 */
    function mapAllPairs(n) {
      let s = this === t ? Object.create(null) : this;
      e.assert(1 === arguments.length, "Expects single argument"), e.assertMapHasOnly(s, mapAllPairs.defaults), 
      s.srcMap = n, s.own = 0, s.enumerable = 0;
      let r = e._mapPairs(s);
      debugger;
      return r;
    }
    //
    function _mapProperties(t) {
      let n = Object.create(null);
      e.routineOptions(_mapProperties, t), e.assert(1 === arguments.length, "Expects single argument"), 
      e.assert(!e.primitiveIs(t.srcMap));
      let s = e._mapKeys(t);
      for (let e = 0; e < s.length; e++) n[s[e]] = t.srcMap[s[e]];
      return n;
    }
    //
    /**
 * The mapProperties() gets enumerable properties of the object{-srcMap-} and returns them as new map.
 *
 * It takes an object {-srcMap-} creates an empty map,
 * checks if {-srcMap-} is an object.
 * If true, it copies unique enumerable properties of the provided object to the new map using
 * their original name/value and returns the result,
 * otherwise it returns empty map.
 *
 * @param { objectLike } srcMap - Object to get a map of enumerable properties.
 * @param { objectLike } o - routine options can be provided through routine`s context.
 * @param { boolean } [ o.own = false ] - count only object`s own properties.
 * @param { boolean } [ o.enumerable = true ] - count only object`s enumerable properties.
 *
 * @example
 * // returns { a : 7, b : 13 }
 * _.mapProperties( { a : 7, b : 13 } );
 *
 * @example
 * let a = { a : 1 };
 * let b = { b : 2 };
 * Object.setPrototypeOf( a, b );
 * _.mapProperties( a );
 * //returns { a : 1, b : 2 }
 *
 * @example
 * let a = { a : 1 };
 * let b = { b : 2 };
 * Object.setPrototypeOf( a, b );
 * _.mapProperties.call( { own : 1 }, a )
 * //returns { a : 1 }
 *
 * @returns { object } A new map with unique enumerable properties from source{-srcMap-}.
 * @function mapProperties
 * @throws { Error } Will throw an Error if {-srcMap-} is not an objectLike entity.
 * @throws { Error } Will throw an Error if unknown option is provided.
 * @memberof wTools
 */
    function mapProperties(n) {
      let s = this === t ? Object.create(null) : this;
      return e.assert(1 === arguments.length, "Expects single argument"), e.routineOptions(mapProperties, s), 
      s.srcMap = n, e._mapProperties(s);
    }
    //
    /**
 * The mapOwnProperties() gets the object's {-srcMap-} own enumerable properties and returns them as new map.
 *
 * It takes an object {-srcMap-} creates an empty map,
 * checks if {-srcMap-} is an object.
 * If true, it copies object's own enumerable properties to the new map using
 * their original name/value and returns the result,
 * otherwise it returns empty map.
 *
 * @param { objectLike } srcMap - Source to get a map of object`s own enumerable properties.
 * @param { objectLike } o - routine options can be provided through routine`s context.
 * @param { boolean } [ o.enumerable = true ] - count only object`s enumerable properties.
 *
 * @example
 * // returns { a : 7, b : 13 }
 * _.mapOwnProperties( { a : 7, b : 13 } );
 *
 * @example
 * let a = { a : 1 };
 * let b = { b : 2 };
 * Object.setPrototypeOf( a, b );
 * _.mapOwnProperties( a );
 * //returns { a : 1 }
 *
 * @example
 * let a = { a : 1 };
 * Object.defineProperty( a, 'b', { enumerable : 0, value : 2 } );
 * _.mapOwnProperties.call( { enumerable : 0 }, a )
 * //returns { a : 1, b : 2 }
 *
 * @returns { object } A new map with source {-srcMap-} own enumerable properties.
 * @function mapOwnProperties
 * @throws { Error } Will throw an Error if {-srcMap-} is not an objectLike entity.
 * @throws { Error } Will throw an Error if unknown option is provided.
 * @memberof wTools
 */
    function mapOwnProperties(n) {
      let s = this === t ? Object.create(null) : this;
      return e.assert(1 === arguments.length, "Expects single argument"), e.routineOptions(mapOwnProperties, s), 
      s.srcMap = n, s.own = 1, e._mapProperties(s);
    }
    //
    /**
 * The mapAllProperties() gets all properties from provided object {-srcMap-} and returns them as new map.
 *
 * It takes an object {-srcMap-} creates an empty map,
 * checks if {-srcMap-} is an object.
 * If true, it copies all unique object's properties to the new map using
 * their original name/value and returns the result,
 * otherwise it returns empty map.
 *
 * @param { objectLike } srcMap - Source to get a map of all object`s properties.
 *
 * @example
 * // returns { a : 7, b : 13, __defineGetter__ : function...}
 * _.mapAllProperties( { a : 7, b : 13 } );
 *
 * @example
 * let a = { a : 1 };
 * let b = { b : 2 };
 * Object.setPrototypeOf( a, b );
 * _.mapAllProperties( a );
 * //returns { a : 1, b : 2, __defineGetter__ : function...}
 *
 * @returns { object } A new map with all unique properties from source {-srcMap-}.
 * @function mapAllProperties
 * @throws { Error } Will throw an Error if {-srcMap-} is not an objectLike entity.
 * @throws { Error } Will throw an Error if unknown option is provided.
 * @memberof wTools
 */
    function mapAllProperties(n) {
      let s = this === t ? Object.create(null) : this;
      return e.assert(1 === arguments.length, "Expects single argument"), e.routineOptions(mapAllProperties, s), 
      s.srcMap = n, s.own = 0, s.enumerable = 0, e._mapProperties(s);
    }
    //
    /**
 * The mapRoutines() gets enumerable properties that contains routines as value from the object {-srcMap-} and returns them as new map.
 *
 * It takes an object {-srcMap-} creates an empty map,
 * checks if {-srcMap-} is an object.
 * If true, it copies unique enumerable properties that holds routines from source {-srcMap-} to the new map using
 * original name/value of the property and returns the result, otherwise it returns empty map.
 *
 * @param { objectLike } srcMap - Source to get a map of object`s properties.
 * @param { objectLike } o - routine options, can be provided through routine`s context.
 * @param { boolean } [ o.own = false ] - count only object`s own properties.
 * @param { boolean } [ o.enumerable = true ] - count only object`s enumerable properties.
 *
 * @example
 * // returns { f : function(){} }
 * _.mapRoutines( { a : 7, b : 13, f : function(){} } );
 *
 * @example
 * let a = { a : 1 };
 * let b = { b : 2, f : function(){} };
 * Object.setPrototypeOf( a, b );
 * _.mapRoutines( a )
 * //returns { f : function(){} }
 *
 * @example
 * let a = { a : 1 };
 * let b = { b : 2, f : function(){} };
 * Object.setPrototypeOf( a, b );
 * _.mapRoutines.call( { own : 1 }, a )
 * //returns {}
 *
 * @returns { object } A new map with unique enumerable routine properties from source {-srcMap-}.
 * @function mapRoutines
 * @throws { Error } Will throw an Error if {-srcMap-} is not an objectLike entity.
 * @throws { Error } Will throw an Error if unknown option is provided.
 * @memberof wTools
 */
    function mapRoutines(n) {
      let s = this === t ? Object.create(null) : this;
      e.assert(1 === arguments.length, "Expects single argument"), e.routineOptions(mapRoutines, s), 
      s.srcMap = n, s.selectFilter = function selectRoutine(t, n) {
        debugger;
        if (e.routineIs(t[n])) return n;
        debugger;
      };
      debugger;
      return e._mapProperties(s);
    }
    //
    /**
 * The mapOwnRoutines() gets object`s {-srcMap-} own enumerable properties that contains routines as value and returns them as new map.
 *
 * It takes an object {-srcMap-} creates an empty map,
 * checks if {-srcMap-} is an object.
 * If true, it copies object`s {-srcMap-} own unique enumerable properties that holds routines to the new map using
 * original name/value of the property and returns the result, otherwise it returns empty map.
 *
 * @param { objectLike } srcMap - Source to get a map of object`s properties.
 * @param { objectLike } o - routine options, can be provided through routine`s context.
 * @param { boolean } [ o.enumerable = true ] - count only object`s enumerable properties.
 *
 * @example
 * // returns { f : function(){} }
 * _.mapOwnRoutines( { a : 7, b : 13, f : function(){} } );
 *
 * @example
 * let a = { a : 1 };
 * let b = { b : 2, f : function(){} };
 * Object.setPrototypeOf( a, b );
 * _.mapOwnRoutines( a )
 * //returns {}
 *
 * @example
 * let a = { a : 1 };
 * Object.defineProperty( a, 'b', { enumerable : 0, value : function(){} } );
 * _.mapOwnRoutines.call( { enumerable : 0 }, a )
 * //returns { b : function(){} }
 *
 * @returns { object } A new map with unique object`s own enumerable routine properties from source {-srcMap-}.
 * @function mapOwnRoutines
 * @throws { Error } Will throw an Error if {-srcMap-} is not an objectLike entity.
 * @throws { Error } Will throw an Error if unknown option is provided.
 * @memberof wTools
 */
    function mapOwnRoutines(n) {
      let s = this === t ? Object.create(null) : this;
      e.assert(1 === arguments.length, "Expects single argument"), e.routineOptions(mapOwnRoutines, s), 
      s.srcMap = n, s.own = 1, s.selectFilter = function selectRoutine(t, n) {
        debugger;
        if (e.routineIs(t[n])) return n;
        debugger;
      };
      debugger;
      return e._mapProperties(s);
    }
    //
    /**
 * The mapAllRoutines() gets all properties of object {-srcMap-} that contains routines as value and returns them as new map.
 *
 * It takes an object {-srcMap-} creates an empty map,
 * checks if {-srcMap-} is an object.
 * If true, it copies all unique properties of source {-srcMap-} that holds routines to the new map using
 * original name/value of the property and returns the result, otherwise it returns empty map.
 *
 * @param { objectLike } srcMap - Source to get a map of object`s properties.
 *
 * @example
 * // returns { f : function, __defineGetter__ : function...}
 * _.mapAllRoutines( { a : 7, b : 13, f : function(){} } );
 *
 * @example
 * let a = { a : 1 };
 * let b = { b : 2, f : function(){} };
 * Object.setPrototypeOf( a, b );
 * _.mapAllRoutines( a )
 * // returns { f : function, __defineGetter__ : function...}
 *
 *
 * @returns { object } A new map with all unique object`s {-srcMap-} properties that are routines.
 * @function mapAllRoutines
 * @throws { Error } Will throw an Error if {-srcMap-} is not an objectLike entity.
 * @throws { Error } Will throw an Error if unknown option is provided.
 * @memberof wTools
 */
    function mapAllRoutines(n) {
      let s = this === t ? Object.create(null) : this;
      e.assert(1 === arguments.length, "Expects single argument"), e.routineOptions(mapAllRoutines, s), 
      s.srcMap = n, s.own = 0, s.enumerable = 0, s.selectFilter = function selectRoutine(t, n) {
        debugger;
        if (e.routineIs(t[n])) return n;
      };
      debugger;
      return e._mapProperties(s);
    }
    //
    /**
 * The mapFields() gets enumerable fields( all properties except routines ) of the object {-srcMap-} and returns them as new map.
 *
 * It takes an object {-srcMap-} creates an empty map,
 * checks if {-srcMap-} is an object.
 * If true, it copies unique enumerable properties of the provided object {-srcMap-} that are not routines to the new map using
 * their original name/value and returns the result, otherwise it returns empty map.
 *
 * @param { objectLike } srcMap - Object to get a map of enumerable properties.
 * @param { objectLike } o - routine options can be provided through routine`s context.
 * @param { boolean } [ o.own = false ] - count only object`s own properties.
 * @param { boolean } [ o.enumerable = true ] - count only object`s enumerable properties.
 *
 * @example
 * // returns { a : 7, b : 13 }
 * _.mapFields( { a : 7, b : 13, c : function(){} } );
 *
 * @example
 * let a = { a : 1 };
 * let b = { b : 2, c : function(){} };
 * Object.setPrototypeOf( a, b );
 * _.mapFields( a );
 * //returns { a : 1, b : 2 }
 *
 * @example
 * let a = { a : 1, x : function(){} };
 * let b = { b : 2 };
 * Object.setPrototypeOf( a, b );
 * _.mapFields.call( { own : 1 }, a )
 * //returns { a : 1 }
 *
 * @returns { object } A new map with unique enumerable fields( all properties except routines ) from source {-srcMap-}.
 * @function mapFields
 * @throws { Error } Will throw an Error if {-srcMap-} is not an objectLike entity.
 * @throws { Error } Will throw an Error if unknown option is provided.
 * @memberof wTools
 */
    function mapFields(n) {
      let s = this === t ? Object.create(null) : this;
      return e.assert(1 === arguments.length, "Expects single argument"), e.routineOptions(mapFields, s), 
      s.srcMap = n, s.selectFilter = function selectRoutine(t, n) {
        if (!e.routineIs(t[n])) return n;
      }, e._mapProperties(s);
    }
    //
    /**
 * The mapOwnFields() gets object`s {-srcMap-} own enumerable fields( all properties except routines ) and returns them as new map.
 *
 * It takes an object {-srcMap-} creates an empty map,
 * checks if {-srcMap-} is an object.
 * If true, it copies object`s own enumerable properties that are not routines to the new map using
 * their original name/value and returns the result, otherwise it returns empty map.
 *
 * @param { objectLike } srcMap - Object to get a map of enumerable properties.
 * @param { objectLike } o - routine options can be provided through routine`s context.
 * @param { boolean } [ o.enumerable = true ] - count only object`s enumerable properties.
 *
 * @example
 * // returns { a : 7, b : 13 }
 * _.mapOwnFields( { a : 7, b : 13, c : function(){} } );
 *
 * @example
 * let a = { a : 1 };
 * let b = { b : 2, c : function(){} };
 * Object.setPrototypeOf( a, b );
 * _.mapOwnFields( a );
 * //returns { a : 1 }
 *
 * @example
 * let a = { a : 1, x : function(){} };
 * Object.defineProperty( a, 'b', { enumerable : 0, value : 2 } )
 * _.mapFields.call( { enumerable : 0 }, a )
 * //returns { a : 1, b : 2 }
 *
 * @returns { object } A new map with object`s {-srcMap-} own enumerable fields( all properties except routines ).
 * @function mapOwnFields
 * @throws { Error } Will throw an Error if {-srcMap-} is not an objectLike entity.
 * @throws { Error } Will throw an Error if unknown option is provided.
 * @memberof wTools
 */
    function mapOwnFields(n) {
      let s = this === t ? Object.create(null) : this;
      return e.assert(1 === arguments.length, "Expects single argument"), e.routineOptions(mapOwnFields, s), 
      s.srcMap = n, s.own = 1, s.selectFilter = function selectRoutine(t, n) {
        if (!e.routineIs(t[n])) return n;
      }, e._mapProperties(s);
    }
    //
    /**
 * The mapAllFields() gets all object`s {-srcMap-} fields( properties except routines ) and returns them as new map.
 *
 * It takes an object {-srcMap-} creates an empty map,
 * checks if {-srcMap-} is an object.
 * If true, it copies all object`s properties that are not routines to the new map using
 * their original name/value and returns the result, otherwise it returns empty map.
 *
 * @param { objectLike } srcMap - Object to get a map of all properties.
 *
 * @example
 * // returns { a : 7, b : 13, __proto__ : Object }
 * _.mapAllFields( { a : 7, b : 13, c : function(){} } );
 *
 * @example
 * let a = { a : 1 };
 * let b = { b : 2, c : function(){} };
 * Object.setPrototypeOf( a, b );
 * _.mapAllFields( a );
 * //returns { a : 1, b : 2, __proto__ : Object }
 *
 * @example
 * let a = { a : 1, x : function(){} };
 * Object.defineProperty( a, 'b', { enumerable : 0, value : 2 } )
 * _.mapAllFields( a );
 * //returns { a : 1, b : 2, __proto__ : Object }
 *
 * @returns { object } A new map with all fields( properties except routines ) from source {-srcMap-}.
 * @function mapAllFields
 * @throws { Error } Will throw an Error if {-srcMap-} is not an objectLike entity.
 * @throws { Error } Will throw an Error if unknown option is provided.
 * @memberof wTools
 */
    function mapAllFields(n) {
      let s = this === t ? Object.create(null) : this;
      return e.assert(1 === arguments.length, "Expects single argument"), e.routineOptions(mapAllFields, s), 
      s.srcMap = n, s.own = 0, s.enumerable = 0, s.selectFilter = function selectRoutine(t, n) {
        if (!e.routineIs(t[n])) return n;
      }, e.routineIs(n) && (s.selectFilter = function selectRoutine(t, n) {
        if (!e.arrayHas([ "arguments", "caller" ], n)) return e.routineIs(t[n]) ? void 0 : n;
      }), e._mapProperties(s);
    }
    //
    /**
 * @callback  options.filter
 * @param { objectLike } dstMap - An empty object.
 * @param { objectLike } srcMaps - The target object.
 * @param { string } - The key of the (screenMap).
 */
    /**
 * The _mapOnly() returns an object filled by unique [ key, value]
 * from others objects.
 *
 * The _mapOnly() checks whether there are the keys of
 * the (screenMap) in the list of (srcMaps).
 * If true, it calls a provided callback function(filter)
 * and adds to the (dstMap) all the [ key, value ]
 * for which callback function returns true.
 *
 * @param { function } [options.filter = filter.bypass()] options.filter - The callback function.
 * @param { objectLike } options.srcMaps - The target object.
 * @param { objectLike } options.screenMaps - The source object.
 * @param { Object } [options.dstMap = Object.create( null )] options.dstMap - The empty object.
 *
 * @example
 * // returns { a : 33, c : 33, name : "Mikle" };
 * let options = Object.create( null );
 * options.dstMap = Object.create( null );
 * options.screenMaps = { 'a' : 13, 'b' : 77, 'c' : 3, 'name' : 'Mikle' };
 * options.srcMaps = { 'a' : 33, 'd' : 'name', 'name' : 'Mikle', 'c' : 33 };
 * _mapOnly( options );
 *
 * @example
 * // returns { a : "abc", c : 33, d : "name" };
 * let options = Object.create( null );
 * options.dstMap = Object.create( null );
 * options.screenMaps = { a : 13, b : 77, c : 3, d : 'name' };
 * options.srcMaps = { d : 'name', c : 33, a : 'abc' };
 * _mapOnly( options );
 *
 * @returns { Object } Returns an object filled by unique [ key, value ]
 * from others objects.
 * @function _mapOnly
 * @throws { Error } Will throw an Error if (options.dstMap or screenMap) are not objects,
 * or if (srcMaps) is not an array
 * @memberof wTools
 */
    function _mapOnly(t) {
      let n = t.dstMap || Object.create(null), s = t.screenMaps, r = t.srcMaps;
      e.arrayIs(s) && (s = e.mapMake.apply(this, s)), e.arrayIs(r) || (r = [ r ]), t.filter || (t.filter = e.field.mapper.bypass), 
      e.assert("field-mapper" === t.filter.functionFamily), e.assert(1 === arguments.length, "Expects single argument"), 
      e.assert(e.objectLike(n), "Expects object-like {-dstMap-}"), e.assert(!e.primitiveIs(s), "Expects not primitive {-screenMap-}"), 
      e.assert(e.arrayIs(r), "Expects array {-srcMaps-}"), e.assertMapHasOnly(t, _mapOnly.defaults);
      for (let t = r.length - 1; t >= 0; t--) e.assert(!e.primitiveIs(r[t]), "Expects {-srcMaps-}");
      for (let e in s) {
        if (void 0 === s[e]) continue;
        let a;
        for (a = r.length - 1; a >= 0 && !(e in r[a]); a--) ;
        -1 !== a && t.filter.call(this, n, r[a], e);
      }
      return n;
    }
    _global_;
    let e = _global_.wTools, t = _global_.wTools, n = (Array.prototype.slice, Function.prototype.bind, 
    Object.hasOwnProperty);
    mapSatisfy.defaults = {
      template: null,
      src: null,
      levels: 1
    }, mapCloneAssigning.defaults = {
      srcMap: null,
      dstMap: null,
      onField: null
    }, _filterTrue.functionFamily = "field-filter", _filterFalse.functionFamily = "field-filter", 
    mapInvert.defaults = {
      src: null,
      dst: null,
      duplicate: "error"
    }, mapsFlatten.defaults = {
      src: null,
      dst: null,
      allowingCollision: 0,
      delimeter: "/"
    }, mapToStr.defaults = {
      src: null,
      keyValDelimeter: ":",
      entryDelimeter: ";"
    }, _mapKeys.defaults = {
      srcMap: null,
      own: 0,
      enumerable: 1,
      selectFilter: null
    }, mapKeys.defaults = {
      own: 0,
      enumerable: 1
    }, mapOwnKeys.defaults = {
      enumerable: 1
    }, mapAllKeys.defaults = {}, _mapVals.defaults = {
      srcMap: null,
      own: 0,
      enumerable: 1,
      selectFilter: null
    }, mapVals.defaults = {
      own: 0,
      enumerable: 1
    }, mapOwnVals.defaults = {
      enumerable: 1
    }, mapAllVals.defaults = {}, _mapPairs.defaults = {
      srcMap: null,
      own: 0,
      enumerable: 1,
      selectFilter: null
    }, mapPairs.defaults = {
      own: 0,
      enumerable: 1
    }, mapOwnPairs.defaults = {
      enumerable: 1
    }, mapAllPairs.defaults = {}, _mapProperties.defaults = {
      srcMap: null,
      own: 0,
      enumerable: 1,
      selectFilter: null
    }, mapProperties.defaults = {
      own: 0,
      enumerable: 1
    }, mapOwnProperties.defaults = {
      enumerable: 1
    }, mapAllProperties.defaults = {}, mapRoutines.defaults = {
      own: 0,
      enumerable: 1
    }, mapOwnRoutines.defaults = {
      enumerable: 1
    }, mapAllRoutines.defaults = {}, mapFields.defaults = {
      own: 0,
      enumerable: 1
    }, mapOwnFields.defaults = {
      enumerable: 1
    }, mapAllFields.defaults = {}, _mapOnly.defaults = {
      dstMap: null,
      srcMaps: null,
      screenMaps: null,
      filter: null
    };
    // --
    // fields
    // --
    let s = {
      // map checker
      objectIs: 
      // --
      // map checker
      // --
      /**
 * Function objectIs checks incoming param whether it is object.
 * Returns "true" if incoming param is object. Othervise "false" returned.
 *
 * @example
 * // returns true
 * let obj = { x : 100 };
 * objectIs(obj);
 * @example
 * // returns false
 * objectIs( 10 );
 *
 * @param { * } src.
 * @return { Boolean }.
 * @function objectIs
 * @memberof wTools
 */
      function objectIs(e) {
        // if( !src )
        // return false;
        // if( _ObjectHasOwnProperty.call( src, 'callee' ) )
        // return false;
        // if( src instanceof Array )
        // return true;
        // if( src instanceof Object )
        // return true;
        // let prototype = Object.getPrototypeOf( src );
        // return prototype === null;
        return "[object Object]" === Object.prototype.toString.call(e);
      }
      //
      ,
      objectLike: function objectLike(t) {
        if (e.objectIs(t)) return !0;
        if (e.primitiveIs(t)) return !1;
        if (e.longIs(t)) return !1;
        if (e.routineIsPure(t)) return !1;
        if (e.strIs(t)) return !1;
        for (let e in t) return !0;
        return !1;
      }
      //
      ,
      objectLikeOrRoutine: function objectLikeOrRoutine(t) {
        return !!e.routineIs(t) || e.objectLike(t);
      },
      mapIs: mapIs,
      mapIsEmpty: function mapIsEmpty(t) {
        return !!e.mapIs(t) && 0 === Object.keys(t).length;
      }
      //
      ,
      mapIsPure: function mapIsPure(e) {
        if (e) return null === Object.getPrototypeOf(e);
      }
      //
      ,
      mapIsPopulated: function mapIsPopulated(t) {
        return !!e.mapIs(t) && Object.keys(t).length > 0;
      }
      //
      ,
      mapLike: function mapLike(t) {
        return !!mapIs(t) || !!t && (t.constructor === Object || null === t.constructor || !!e.objectLike(t) && !e.instanceIs(t));
      }
      //
      /**
 * The mapsAreIdentical() returns true, if the second object (src2)
 * has the same values as the first object(src1).
 *
 * It takes two objects (scr1, src2), checks
 * if both object have the same length and [key, value] return true
 * otherwise it returns undefined.
 *
 * @param { objectLike } src1 - First object.
 * @param { objectLike } src2 - Target object.
 * Objects to compare values.
 *
 * @example
 * // returns true
 * mapsAreIdentical( { a : 7, b : 13 }, { a : 7, b : 13 } );
 *
 * @example
 * returns false
 * _.mapsAreIdentical( { a : 7, b : 13 }, { a : 33, b : 13 } );
 *
 * @example
 * returns false
 * _.mapsAreIdentical( { a : 7, b : 13, c : 33 }, { a : 7, b : 13 } );
 *
 * @returns { boolean } Returns true, if the second object (src2)
 * has the same values as the first object(src1).
 * @function mapsAreIdentical
 * @throws Will throw an error if ( arguments.length !== 2 ).
 * @memberof wTools
 */ ,
      mapsAreIdentical: function mapsAreIdentical(t, n) {
        if (e.assert(2 === arguments.length, "Expects exactly two arguments"), e.assert(e.objectLike(t)), 
        e.assert(e.objectLike(n)), Object.keys(t).length !== Object.keys(n).length) return !1;
        for (let e in t) if (t[e] !== n[e]) return !1;
        return !0;
      }
      //
      /**
 * The mapContain() returns true, if the first object {-srcMap-}
 * has the same values as the second object(ins).
 *
 * It takes two objects (scr, ins),
 * checks if the first object {-srcMap-} has the same [key, value] as
 * the second object (ins).
 * If true, it returns true,
 * otherwise it returns false.
 *
 * @param { objectLike } src - Target object.
 * @param { objectLike } ins - Second object.
 * Objects to compare values.
 *
 * @example
 * // returns true
 * mapContain( { a : 7, b : 13, c : 15 }, { a : 7, b : 13 } );
 *
 * @example
 * returns false
 * mapContain( { a : 7, b : 13 }, { a : 7, b : 13, c : 15 } );
 *
 * @returns { boolean } Returns true, if the first object {-srcMap-}
 * has the same values as the second object(ins).
 * @function mapContain
 * @throws Will throw an error if ( arguments.length !== 2 ).
 * @memberof wTools
 */ ,
      mapContain: function mapContain(t, n) {
        e.assert(2 === arguments.length, "Expects exactly two arguments");
        /*
  if( Object.keys( src ).length < Object.keys( ins ).length )
  return false;
*/
        for (let e in n) if (void 0 !== n[e] && t[e] !== n[e]) return !1;
        return !0;
      },
      mapSatisfy: mapSatisfy,
      _mapSatisfy: _mapSatisfy,
      mapHas: mapHasKey,
      mapHasKey: mapHasKey,
      mapOwnKey: function mapOwnKey(t, s) {
        return e.assert(2 === arguments.length, "Expects exactly two arguments"), e.strIs(s) ? n.call(t, s) : e.mapIs(s) ? n.call(t, e.nameUnfielded(s).coded) : e.symbolIs(s) ? n.call(t, s) : void e.assert(0, "mapOwnKey :", "unknown type of key :", e.strType(s));
      }
      //
      ,
      mapHasVal: function mapHasVal(t, n) {
        return -1 !== e.mapVals(t).indexOf(n);
      }
      //
      ,
      mapOwnVal: function mapOwnVal(t, n) {
        return -1 !== e.mapOwnVals(t).indexOf(n);
      }
      //
      /**
 * The mapHasAll() returns true if object( src ) has all enumerable keys from object( screen ).
 * Values of properties are not checked, only names.
 *
 * Uses for..in to get each key name from object( screen ) and checks if source( src ) has property with same name.
 * Returns true if all keys from( screen ) exists on object( src ), otherwise returns false.
 *
 * @param { ObjectLike } src - Map that will be checked for keys from( screen ).
 * @param { ObjectLike } screen - Map that hold keys.
 *
 * @example
 * // returns true
 * _.mapHasAll( {}, {} );
 *
 * // returns false
 * _.mapHasAll( {}, { a : 1 } );
 *
 * @returns { boolean } Returns true if object( src ) has all enumerable keys from( screen ).
 * @function mapHasAll
 * @throws { Exception } Will throw an error if the ( src ) is not a ObjectLike entity.
 * @throws { Exception } Will throw an error if the ( screen ) is not a ObjectLike entity.
 * @memberof wTools
 */ ,
      mapHasAll: function mapHasAll(t, n) {
        e.assert(2 === arguments.length, "Expects exactly two arguments"), e.assert(e.objectLike(t)), 
        e.assert(e.objectLike(n));
        for (let e in n) if (!(e in t)) return !1;
        return !0;
      }
      //
      /**
 * The mapHasAny() returns true if object( src ) has at least one enumerable key from object( screen ).
 * Values of properties are not checked, only names.
 *
 * Uses for..in to get each key name from object( screen ) and checks if source( src ) has at least one property with same name.
 * Returns true if any key from( screen ) exists on object( src ), otherwise returns false.
 *
 * @param { ObjectLike } src - Map that will be checked for keys from( screen ).
 * @param { ObjectLike } screen - Map that hold keys.
 *
 * @example
 * // returns false
 * _.mapHasAny( {}, {} );
 *
 * // returns true
 * _.mapHasAny( { a : 1, b : 2 }, { a : 1 } );
 *
 * // returns false
 * _.mapHasAny( { a : 1, b : 2 }, { c : 1 } );
 *
 * @returns { boolean } Returns true if object( src ) has at least one enumerable key from( screen ).
 * @function mapHasAny
 * @throws { Exception } Will throw an error if the ( src ) is not a ObjectLike entity.
 * @throws { Exception } Will throw an error if the ( screen ) is not a ObjectLike entity.
 * @memberof wTools
 */ ,
      mapHasAny: function mapHasAny(t, n) {
        e.assert(2 === arguments.length, "Expects exactly two arguments"), e.assert(e.objectLike(t)), 
        e.assert(e.objectLike(n));
        for (let e in n) {
          if (e in t) debugger;
          if (e in t) return !0;
        }
        debugger;
        return !1;
      }
      //
      /**
 * The mapHasAny() returns true if object( src ) has no one enumerable key from object( screen ).
 * Values of properties are not checked, only names.
 *
 * Uses for..in to get each key name from object( screen ) and checks if source( src ) has no one property with same name.
 * Returns true if all keys from( screen ) not exists on object( src ), otherwise returns false.
 *
 * @param { ObjectLike } src - Map that will be checked for keys from( screen ).
 * @param { ObjectLike } screen - Map that hold keys.
 *
 * @example
 * // returns true
 * _.mapHasNone( {}, {} );
 *
 * // returns false
 * _.mapHasNone( { a : 1, b : 2 }, { a : 1 } );
 *
 * // returns true
 * _.mapHasNone( { a : 1, b : 2 }, { c : 1 } );
 *
 * @returns { boolean } Returns true if object( src ) has at least one enumerable key from( screen ).
 * @function mapHasNone
 * @throws { Exception } Will throw an error if the ( src ) is not a ObjectLike entity.
 * @throws { Exception } Will throw an error if the ( screen ) is not a ObjectLike entity.
 * @memberof wTools
 */ ,
      mapHasNone: function mapHasNone(t, n) {
        e.assert(2 === arguments.length, "Expects exactly two arguments"), e.assert(e.objectLike(t)), 
        e.assert(e.objectLike(n));
        for (let e in n) if (e in t) return !1;
        return !0;
      }
      //
      /**
 * The mapOwnAll() returns true if object( src ) has all own keys from object( screen ).
 * Values of properties are not checked, only names.
 *
 * Uses for..in to get each key name from object( screen ) and checks if source( src ) has own property with that key name.
 * Returns true if all keys from( screen ) exists on object( src ), otherwise returns false.
 *
 * @param { Object } src - Map that will be checked for keys from( screen ).
 * @param { Object } screen - Map that hold keys.
 *
 * @example
 * // returns true
 * _.mapOwnAll( {}, {} );
 *
 * // returns true
 * _.mapOwnAll( { a : 1, b : 2 }, { a : 1 } );
 *
 * // returns false
 * _.mapOwnAll( { a : 1, b : 2 }, { c : 1 } );
 *
 * @returns { boolean } Returns true if object( src ) has own properties from( screen ).
 * @function mapOwnAll
 * @throws { Exception } Will throw an error if the ( src ) is not a ObjectLike entity.
 * @throws { Exception } Will throw an error if the ( screen ) is not a ObjectLike entity.
 * @memberof wTools
 */ ,
      mapOwnAll: function mapOwnAll(t, s) {
        e.assert(2 === arguments.length, "Expects exactly two arguments"), e.assert(e.mapIs(t)), 
        e.assert(e.mapIs(s));
        for (let e in s) {
          if (!n.call(t, e)) debugger;
          if (!n.call(t, e)) return !1;
        }
        debugger;
        return !0;
      }
      //
      /**
 * The mapOwnAny() returns true if map( src ) has at least one own property from map( screen ).
 * Values of properties are not checked, only names.
 *
 * Uses for..in to get each key name from map( screen ) and checks if source( src ) has at least one property with that key name.
 * Returns true if one of keys from( screen ) exists on object( src ), otherwise returns false.
 *
 * @param { Object } src - Map that will be checked for keys from( screen ).
 * @param { Object } screen - Map that hold keys.
 *
 * @example
 * // returns false
 * _.mapOwnAny( {}, {} );
 *
 * // returns true
 * _.mapOwnAny( { a : 1, b : 2 }, { a : 1 } );
 *
 * // returns false
 * _.mapOwnAny( { a : 1, b : 2 }, { c : 1 } );
 *
 * @returns { boolean } Returns true if object( src ) has own properties from( screen ).
 * @function mapOwnAny
 * @throws { Exception } Will throw an error if the ( src ) is not a map.
 * @throws { Exception } Will throw an error if the ( screen ) is not a map.
 * @memberof wTools
 */ ,
      mapOwnAny: function mapOwnAny(t, s) {
        e.assert(2 === arguments.length, "Expects exactly two arguments"), e.assert(e.mapIs(t)), 
        e.assert(e.mapIs(s));
        for (let e in s) {
          if (n.call(t, e)) debugger;
          if (n.call(t, e)) return !0;
        }
        debugger;
        return !1;
      }
      //
      /**
 * The mapOwnNone() returns true if map( src ) not owns properties from map( screen ).
 * Values of properties are not checked, only names.
 *
 * Uses for..in to get each key name from object( screen ) and checks if source( src ) has own property with that key name.
 * Returns true if no one key from( screen ) exists on object( src ), otherwise returns false.
 *
 * @param { Object } src - Map that will be checked for keys from( screen ).
 * @param { Object } screen - Map that hold keys.
 *
 * @example
 * // returns true
 * _.mapOwnNone( {}, {} );
 *
 * // returns false
 * _.mapOwnNone( { a : 1, b : 2 }, { a : 1 } );
 *
 * // returns true
 * _.mapOwnNone( { a : 1, b : 2 }, { c : 1 } );
 *
 * @returns { boolean } Returns true if map( src ) not owns properties from( screen ).
 * @function mapOwnNone
 * @throws { Exception } Will throw an error if the ( src ) is not a map.
 * @throws { Exception } Will throw an error if the ( screen ) is not a map.
 * @memberof wTools
 */ ,
      mapOwnNone: function mapOwnNone(t, s) {
        e.assert(2 === arguments.length, "Expects exactly two arguments"), e.assert(e.mapIs(t)), 
        e.assert(e.mapIs(s));
        for (let e in s) {
          if (n.call(t, e)) debugger;
          if (n.call(t, e)) return !1;
        }
        debugger;
        return !0;
      }
      //
      ,
      mapHasExactly: function mapHasExactly(t, n) {
        let s = !0;
        return e.assert(2 === arguments.length), s = (s = s && e.mapHasOnly(t, n)) && e.mapHasAll(t, n), 
        !0;
      }
      //
      ,
      mapOwnExactly: function mapOwnExactly(t, n) {
        let s = !0;
        return e.assert(2 === arguments.length), s = (s = s && e.mapOwnOnly(t, n)) && e.mapOwnAll(t, n), 
        !0;
      }
      //
      ,
      mapHasOnly: function mapHasOnly(t, n) {
        return e.assert(2 === arguments.length), arguments.length, !(Object.keys(e.mapBut(t, n)).length > 0);
      }
      //
      ,
      mapOwnOnly: function mapOwnOnly(t, n) {
        return e.assert(2 === arguments.length), arguments.length, !(Object.keys(e.mapOwnBut(t, n)).length > 0);
      }
      // //
      //
      // function mapHasAll( srcMap, all )
      // {
      //
      //   _.assert( arguments.length === 2 );
      //
      //   let but = Object.keys( _.mapBut( all, srcMap ) );
      //
      //   if( but.length > 0 )
      //   return false;
      //
      //   return true;
      // }
      //
      //
      //
      // function mapOwnAll( srcMap, all )
      // {
      //
      //   _.assert( arguments.length === 2 );
      //
      //   let but = Object.keys( _.mapOwnBut( all, srcMap ) );
      //
      //   if( but.length > 0 )
      //   return false;
      //
      //   return true;
      // }
      //
      // //
      //
      // function mapHasNone( srcMap, screenMaps )
      // {
      //
      //   _.assert( arguments.length === 2 );
      //
      //   let but = _.mapOnly( srcMap, screenMaps );
      //   let keys = Object.keys( but );
      //   if( keys.length )
      //   return false;
      //
      //   return true;
      // }
      //
      // //
      //
      // function mapOwnNone( srcMap, screenMaps )
      // {
      //
      //   _.assert( arguments.length === 2 );
      //
      //   let but = Object.keys( _.mapOnlyOwn( srcMap, screenMaps ) );
      //
      //   if( but.length )
      //   return false;
      //
      //   return true;
      // }
      //
      ,
      mapHasNoUndefine: function mapHasNoUndefine(t) {
        e.assert(1 === arguments.length), arguments.length;
        for (let e in t) if (void 0 === t[e]) return !1;
        return !0;
      }
      // --
      // map move
      // --
      /**
 * The mapMake() routine is used to copy the values of all properties
 * from one or more source objects to the new object.
 *
 * @param { ...objectLike } arguments[] - The source object(s).
 *
 * @example
 * // returns { a : 7, b : 13, c : 3, d : 33, e : 77 }
 * _.mapMake( { a : 7, b : 13 }, { c : 3, d : 33 }, { e : 77 } );
 *
 * @returns { objectLike } It will return the new object filled by [ key, value ]
 * from one or more source objects.
 * @function mapMake
 * @memberof wTools
 */ ,
      // map extend
      mapMake: function mapMake() {
        if (arguments.length <= 1 && (void 0 === arguments[0] || null === arguments[0])) return Object.create(null);
        let t = e.longSlice(arguments);
        return t.unshift(Object.create(null)), e.assert(!e.primitiveIs(arguments[0]) || null === arguments[0]), 
        e.mapExtend.apply(e, t);
      }
      //
      ,
      mapShallowClone: function mapShallowClone(t) {
        return e.assert(1 === arguments.length), e.assert(e.objectIs(t)), e.mapExtend(null, t);
      },
      mapCloneAssigning: mapCloneAssigning,
      /* dubious */
      mapExtend: 
      //
      /**
 * The mapExtend() is used to copy the values of all properties
 * from one or more source objects to a target object.
 *
 * It takes first object (dstMap)
 * creates variable (result) and assign first object.
 * Checks if arguments equal two or more and if (result) is an object.
 * If true,
 * it extends (result) from the next objects.
 *
 * @param{ objectLike } dstMap - The target object.
 * @param{ ...objectLike } arguments[] - The source object(s).
 *
 * @example
 * // returns { a : 7, b : 13, c : 3, d : 33, e : 77 }
 * mapExtend( { a : 7, b : 13 }, { c : 3, d : 33 }, { e : 77 } );
 *
 * @returns { objectLike } It will return the target object.
 * @function mapExtend
 * @throws { Error } Will throw an error if ( arguments.length < 2 ),
 * if the (dstMap) is not an Object.
 * @memberof wTools
 */
      function mapExtend(t, n) {
        if (null === t && (t = Object.create(null)), 2 === arguments.length && null === Object.getPrototypeOf(n)) return Object.assign(t, n);
        e.assert(arguments.length >= 2, "Expects at least two arguments"), e.assert(!e.primitiveIs(t), "Expects non primitive as the first argument");
        for (let n = 1; n < arguments.length; n++) {
          let s = arguments[n];
          if (e.assert(!e.primitiveIs(s), "Expects non primitive"), null === Object.getPrototypeOf(s)) Object.assign(t, s); else for (let e in s) t[e] = s[e];
        }
        return t;
      }
      //
      ,
      mapsExtend: function mapsExtend(t, n) {
        if (null === t && (t = Object.create(null)), 1 === n.length && null === Object.getPrototypeOf(n[0])) return Object.assign(t, n[0]);
        e.arrayLike(n) || (n = [ n ]), e.assert(2 === arguments.length, "Expects exactly two arguments"), 
        e.assert(e.arrayLike(n)), e.assert(!e.primitiveIs(t), "Expects non primitive as the first argument");
        for (let s = 0; s < n.length; s++) {
          let r = n[s];
          if (e.assert(!e.primitiveIs(r), "Expects non primitive"), null === Object.getPrototypeOf(r)) Object.assign(t, r); else for (let e in r) t[e] = r[e];
        }
        return t;
      }
      //
      /**
 * The mapExtendConditional() creates a new [ key, value ]
 * from the next objects if callback function(filter) returns true.
 *
 * It calls a provided callback function(filter) once for each key in an (argument),
 * and adds to the {-srcMap-} all the [ key, value ] for which callback
 * function(filter) returns true.
 *
 * @param { function } filter - The callback function to test each [ key, value ]
 * of the (dstMap) object.
 * @param { objectLike } dstMap - The target object.
 * @param { ...objectLike } arguments[] - The next object.
 *
 * @example
 * // returns { a : 1, b : 2, c : 3 }
 * _.mapExtendConditional( _.field.mapper.dstNotHas, { a : 1, b : 2 }, { a : 1 , c : 3 } );
 *
 * @returns { objectLike } Returns the unique [ key, value ].
 * @function mapExtendConditional
 * @throws { Error } Will throw an Error if ( arguments.length < 3 ), (filter)
 * is not a Function, (result) and (argument) are not the objects.
 * @memberof wTools
 */ ,
      mapExtendConditional: function mapExtendConditional(t, n) {
        null === n && (n = Object.create(null)), e.assert(!!t), e.assert("field-mapper" === t.functionFamily), 
        e.assert(arguments.length >= 3, "Expects more arguments"), e.assert(e.routineIs(t), "Expects filter"), 
        e.assert(!e.primitiveIs(n), "Expects non primitive as argument");
        for (let s = 2; s < arguments.length; s++) {
          let r = arguments[s];
          e.assert(!e.primitiveIs(r), () => "Expects object-like entity to extend, but got : " + e.strType(r));
          for (let e in r) t.call(this, n, r, e);
        }
        return n;
      }
      //
      ,
      mapsExtendConditional: function mapsExtendConditional(t, n, s) {
        null === n && (n = Object.create(null)), e.assert(!!t), e.assert("field-mapper" === t.functionFamily), 
        e.assert(3 === arguments.length, "Expects exactly three arguments"), e.assert(e.routineIs(t), "Expects filter"), 
        e.assert(!e.primitiveIs(n), "Expects non primitive as argument");
        for (let r = 0; r < s.length; r++) {
          let a = s[r];
          e.assert(!e.primitiveIs(a), () => "Expects object-like entity to extend, but got : " + e.strType(a));
          for (let e in a) t.call(this, n, a, e);
        }
        return n;
      }
      //
      ,
      mapExtendHiding: function mapExtendHiding(t) {
        let n = e.longSlice(arguments);
        return n.unshift(e.field.mapper.hiding), e.mapExtendConditional.apply(this, n);
      }
      //
      ,
      mapsExtendHiding: function mapsExtendHiding(t, n) {
        return e.assert(2 === arguments.length, "Expects exactly two arguments"), e.mapsExtendConditional(e.field.mapper.hiding, t, n);
      }
      //
      ,
      mapExtendAppendingAnything: function mapExtendAppendingAnything(t) {
        if (null === t && 2 === arguments.length) return Object.assign(Object.create(null), srcMap);
        let n = e.longSlice(arguments);
        return n.unshift(e.field.mapper.appendingAnything), e.mapExtendConditional.apply(this, n);
      }
      //
      ,
      mapsExtendAppendingAnything: function mapsExtendAppendingAnything(t, n) {
        return e.assert(2 === arguments.length, "Expects exactly two arguments"), null === t ? e.mapExtend(null, n[0]) : e.mapsExtendConditional(e.field.mapper.appendingAnything, t, n);
      }
      //
      ,
      mapExtendAppendingArrays: function mapExtendAppendingArrays(t) {
        if (null === t && 2 === arguments.length) return Object.assign(Object.create(null), srcMap);
        let n = e.longSlice(arguments);
        return n.unshift(e.field.mapper.appendingArrays), e.mapExtendConditional.apply(this, n);
      }
      //
      ,
      mapsExtendAppendingArrays: function mapsExtendAppendingArrays(t, n) {
        return e.assert(2 === arguments.length, "Expects exactly two arguments"), null === t ? e.mapExtend(null, n[0]) : e.mapsExtendConditional(e.field.mapper.appendingArrays, t, n);
      }
      //
      ,
      mapExtendByDefined: function mapExtendByDefined(t) {
        if (null === t && 2 === arguments.length) return Object.assign(Object.create(null), srcMap);
        let n = e.longSlice(arguments);
        return n.unshift(e.field.mapper.srcDefined), e.mapExtendConditional.apply(this, n);
      }
      //
      ,
      mapsExtendByDefined: function mapsExtendByDefined(t, n) {
        return e.assert(2 === arguments.length, "Expects exactly two arguments"), e.mapsExtendConditional(e.field.mapper.srcDefined, t, n);
      }
      //
      ,
      mapExtendNulls: function mapExtendNulls(t) {
        let n = e.longSlice(arguments);
        return n.unshift(e.field.mapper.srcNull), e.mapExtendConditional.apply(this, n);
      }
      //
      ,
      mapsExtendNulls: function mapsExtendNulls(t, n) {
        return e.assert(2 === arguments.length, "Expects exactly two arguments"), e.mapsExtendConditional(e.field.mapper.srcNull, t, n);
      }
      //
      /**
 * The mapSupplement() supplement destination map by source maps.
 * Pairs of destination map are not overwritten by pairs of source maps if any overlap.
 * Routine rewrite pairs of destination map which has key === undefined.
 *
 * @param { ...objectLike } arguments[] - The source object(s).
 *
 * @example
 * // returns { a : 1, b : 2, c : 3 }
 * let r = mapSupplement( { a : 1, b : 2 }, { a : 1, c : 3 } );
 *
 * @returns { objectLike } Returns an object with unique [ key, value ].
 * @function mapSupplement
 * @memberof wTools
 */ ,
      mapSupplement: function mapSupplement(t, n) {
        if (null === t && 2 === arguments.length) return Object.assign(Object.create(null), n);
        null === t && (t = Object.create(null)), e.assert(!e.primitiveIs(t));
        for (let e = 1; e < arguments.length; e++) {
          n = arguments[e];
          for (let e in n) e in t || (t[e] = n[e]);
        }
        return t;
      }
      //
      ,
      mapSupplementStructureless: function mapSupplementStructureless(t, n) {
        if (null === t && 2 === arguments.length) return Object.assign(Object.create(null), n);
        null === t && (t = Object.create(null));
        for (let s = 1; s < arguments.length; s++) {
          n = arguments[s];
          for (let s in n) if (void 0 === t[s]) {
            if (e.objectLike(n[s]) || e.arrayLike(n[s])) {
              debugger;
              throw Error("Source map should have only primitive elements, but have " + e.strType(n));
            }
            t[s] = n[s];
          }
        }
        return t;
      }
      //
      ,
      mapSupplementNulls: 
      //
      function mapSupplementNulls(t) {
        let n = e.longSlice(arguments);
        return n.unshift(e.field.mapper.dstNotHasOrHasNull), e.mapExtendConditional.apply(this, n);
      }
      //
      ,
      mapSupplementNils: function mapSupplementNils(t) {
        let n = e.longSlice(arguments);
        return n.unshift(e.field.mapper.dstNotHasOrHasNil), e.mapExtendConditional.apply(this, n);
      }
      //
      ,
      mapSupplementAssigning: function mapSupplementAssigning(t) {
        let n = e.longSlice(arguments);
        // args.unshift( _.field.mapper.dstNotOwnAssigning );
                return n.unshift(e.field.mapper.dstNotHasAssigning), e.mapExtendConditional.apply(this, n);
      }
      //
      ,
      mapSupplementAppending: function mapSupplementAppending(t) {
        if (null === t && 2 === arguments.length) return Object.assign(Object.create(null), srcMap);
        let n = e.longSlice(arguments);
        return n.unshift(e.field.mapper.dstNotHasAppending), e.mapExtendConditional.apply(this, n);
      }
      //
      ,
      mapsSupplementAppending: function mapsSupplementAppending(t, n) {
        return e.assert(2 === arguments.length, "Expects exactly two arguments"), e.mapsExtendConditional(e.field.mapper.dstNotHasAppending, t, n);
      }
      //
      // function mapStretch( dstMap )
      ,
      mapSupplementOwn: function mapSupplementOwn(t, n) {
        if (null === t && 2 === arguments.length) return e.mapExtend(t, n);
        let s = e.longSlice(arguments);
        return s.unshift(e.field.mapper.dstNotOwn), e.mapExtendConditional.apply(this, s);
      }
      //
      ,
      mapsSupplementOwn: function mapsSupplementOwn(t, n) {
        return e.assert(2 === arguments.length, "Expects exactly two arguments"), null === t ? e.mapExtend(null, n[0]) : e.mapsExtendConditional(e.field.mapper.dstNotOwn, t, n);
      }
      //
      ,
      mapSupplementOwnAssigning: function mapSupplementOwnAssigning(t) {
        let n = e.longSlice(arguments);
        return n.unshift(e.field.mapper.dstNotOwnAssigning), e.mapExtendConditional.apply(this, n);
      }
      //
      ,
      mapSupplementOwnFromDefinition: function mapSupplementOwnFromDefinition(t, n) {
        let s = e.longSlice(arguments);
        return s.unshift(e.field.mapper.dstNotOwnFromDefinition), e.mapExtendConditional.apply(this, s);
      }
      //
      ,
      mapSupplementOwnFromDefinitionStrictlyPrimitives: function mapSupplementOwnFromDefinitionStrictlyPrimitives(t, n) {
        let s = e.longSlice(arguments);
        return s.unshift(e.field.mapper.dstNotOwnFromDefinitionStrictlyPrimitive), e.mapExtendConditional.apply(this, s);
      }
      //
      /**
 * The mapComplement() complement ( dstMap ) by one or several ( srcMap ).
 *
 * @param { ...objectLike } arguments[] - The source object(s).
 *
 * @example
 * // returns { a : 1, b : 'ab', c : 3 };
 * _.mapComplement( { a : 1, b : 'ab' }, { a : 12 , c : 3 } );
 *
 * @returns { objectLike } Returns an object filled by all unique, clone [ key, value ].
 * @function mapComplement
 * @memberof wTools
 */
      /* qqq : need to explain how undefined handled and write good documentation */ ,
      mapComplement: function mapComplement(t, s) {
        function dstNotOwnOrUndefinedAssigning(t, s, r) {
          n.call(t, r) && void 0 !== t[r] || e.entityAssignFieldFromContainer(t, s, r);
        }
        // _.assert( !!_.field.mapper );
        if (dstNotOwnOrUndefinedAssigning.functionFamily = "field-mapper", 2 === arguments.length) return e.mapExtendConditional(dstNotOwnOrUndefinedAssigning, t, s);
        let r = e.longSlice(arguments);
        return r.unshift(dstNotOwnOrUndefinedAssigning), e.mapExtendConditional.apply(this, r);
        /*
    filter should be defined explicitly instead of using _.field.mapper.dstNotOwnOrUndefinedAssigning
    to have mapComplement available as soon as possible
  */      }
      //
      ,
      mapsComplement: function mapsComplement(t, n) {
        return e.assert(2 === arguments.length, "Expects exactly two arguments"), e.mapsExtendConditional(e.field.mapper.dstNotOwnOrUndefinedAssigning, t, n);
      }
      //
      ,
      mapComplementReplacingUndefines: function mapComplementReplacingUndefines(t, n) {
        if (e.assert(!!e.field.mapper), 2 === arguments.length) return e.mapExtendConditional(e.field.mapper.dstNotOwnOrUndefinedAssigning, t, n);
        let s = e.longSlice(arguments);
        return s.unshift(e.field.mapper.dstNotOwnOrUndefinedAssigning), e.mapExtendConditional.apply(this, s);
      }
      //
      ,
      mapsComplementReplacingUndefines: function mapsComplementReplacingUndefines(t, n) {
        return e.assert(2 === arguments.length, "Expects exactly two arguments"), e.mapsExtendConditional(e.field.mapper.dstNotOwnOrUndefinedAssigning, t, n);
      }
      //
      ,
      mapComplementPreservingUndefines: function mapComplementPreservingUndefines(t) {
        let n = e.longSlice(arguments);
        return n.unshift(e.field.mapper.dstNotOwnAssigning), e.mapExtendConditional.apply(this, n);
      }
      //
      ,
      mapsComplementPreservingUndefines: function mapsComplementPreservingUndefines(t, n) {
        return e.assert(2 === arguments.length, "Expects exactly two arguments"), e.mapsExtendConditional(e.field.mapper.dstNotOwnAssigning, t, n);
      }
      //
      ,
      // map extend recursive
      mapExtendRecursiveConditional: 
      // --
      // map recursive
      // --
      function mapExtendRecursiveConditional(n, s, r) {
        e.assert(arguments.length >= 3, "Expects at least three arguments"), e.assert(this === t);
        let a = e.longSlice(arguments, 2);
        return e.mapsExtendRecursiveConditional(n, s, a);
      },
      mapsExtendRecursiveConditional: function mapsExtendRecursiveConditional(n, s, r) {
        e.assert(3 === arguments.length, "Expects exactly three arguments"), e.assert(this === t), 
        e.routineIs(n) && (n = {
          onUpFilter: n,
          onField: n
        }), void 0 === n.onUpFilter ? n.onUpFilter = n.onField : !0 === n.onUpFilter ? n.onUpFilter = _filterTrue : !1 === n.onUpFilter && (n.onUpFilter = _filterFalse), 
        !0 === n.onField ? n.onField = _filterTrue : !1 === n.onField && (n.onField = _filterFalse), 
        e.assert(e.routineIs(n.onUpFilter)), e.assert(e.routineIs(n.onField)), e.assert("field-filter" === n.onUpFilter.functionFamily), 
        e.assert("field-filter" === n.onField.functionFamily || "field-mapper" === n.onField.functionFamily);
        for (let e = 0; e < r.length; e++) _mapExtendRecursiveConditional(n, s, r[e]);
        return s;
      },
      _mapExtendRecursiveConditional: _mapExtendRecursiveConditional,
      mapExtendRecursive: function mapExtendRecursive(n, s) {
        e.assert(arguments.length >= 2, "Expects at least two arguments"), e.assert(this === t);
        for (let e = 1; e < arguments.length; e++) _mapExtendRecursive(n, arguments[e]);
        return n;
      }
      //
      ,
      mapsExtendRecursive: function mapsExtendRecursive(n, s) {
        e.assert(2 === arguments.length, "Expects exactly two arguments"), e.assert(this === t);
        for (let e = 1; e < s.length; e++) _mapExtendRecursive(n, s[e]);
        return n;
      },
      _mapExtendRecursive: _mapExtendRecursive,
      mapExtendAppendingAnythingRecursive: function mapExtendAppendingAnythingRecursive(n, s) {
        e.assert(this === t), e.assert(arguments.length >= 2, "Expects at least two arguments");
        let r = {
          onField: e.field.mapper.appendingAnything,
          onUpFilter: !0
        }, a = e.longSlice(arguments);
        return a.unshift(r), e.mapExtendRecursiveConditional.apply(e, a);
      }
      //
      ,
      mapsExtendAppendingAnythingRecursive: function mapsExtendAppendingAnythingRecursive(n, s) {
        e.assert(this === t), e.assert(2 === arguments.length, "Expects exactly two arguments");
        let r = {
          onField: e.field.mapper.appendingAnything,
          onUpFilter: !0
        };
        return e.mapsExtendRecursiveConditional.call(e, r, n, s);
      }
      //
      ,
      mapExtendAppendingArraysRecursive: function mapExtendAppendingArraysRecursive(n, s) {
        e.assert(this === t), e.assert(arguments.length >= 2, "Expects at least two arguments");
        let r = {
          onField: e.field.mapper.appendingArrays,
          onUpFilter: !0
        }, a = e.longSlice(arguments);
        return a.unshift(r), e.mapExtendRecursiveConditional.apply(e, a);
      }
      //
      ,
      mapsExtendAppendingArraysRecursive: function mapsExtendAppendingArraysRecursive(n, s) {
        e.assert(this === t), e.assert(2 === arguments.length, "Expects exactly two arguments");
        let r = {
          onField: e.field.mapper.appendingArrays,
          onUpFilter: !0
        };
        return e.mapsExtendRecursiveConditional.call(e, r, n, s);
      }
      //
      ,
      mapExtendAppendingOnceRecursive: function mapExtendAppendingOnceRecursive(n, s) {
        e.assert(this === t), e.assert(arguments.length >= 2, "Expects at least two arguments");
        let r = {
          onField: e.field.mapper.appendingOnce,
          onUpFilter: !0
        }, a = e.longSlice(arguments);
        return a.unshift(r), e.mapExtendRecursiveConditional.apply(e, a);
      }
      //
      ,
      mapsExtendAppendingOnceRecursive: function mapsExtendAppendingOnceRecursive(n, s) {
        e.assert(this === t), e.assert(2 === arguments.length, "Expects exactly two arguments");
        let r = {
          onField: e.field.mapper.appendingOnce,
          onUpFilter: !0
        };
        return e.mapsExtendRecursiveConditional.call(e, r, n, s);
      }
      //
      ,
      mapSupplementRecursive: function mapSupplementRecursive(n, s) {
        e.assert(this === t), e.assert(arguments.length >= 2, "Expects at least two arguments");
        let r = {
          onField: e.field.mapper.dstNotHas,
          onUpFilter: !0
        }, a = e.longSlice(arguments);
        return a.unshift(r), e.mapExtendRecursiveConditional.apply(e, a);
      }
      //
      ,
      mapSupplementByMapsRecursive: function mapSupplementByMapsRecursive(n, s) {
        e.assert(this === t), e.assert(2 === arguments.length, "Expects exactly two arguments");
        let r = {
          onField: e.field.mapper.dstNotHas,
          onUpFilter: !0
        };
        return e.mapsExtendRecursiveConditional.call(e, r, n, s);
      }
      //
      ,
      mapSupplementOwnRecursive: function mapSupplementOwnRecursive(n, s) {
        e.assert(this === t), e.assert(arguments.length >= 2, "Expects at least two arguments");
        let r = {
          onField: e.field.mapper.dstNotOwn,
          onUpFilter: !0
        }, a = e.longSlice(arguments);
        return a.unshift(r), e.mapExtendRecursiveConditional.apply(e, a);
      }
      //
      ,
      mapsSupplementOwnRecursive: function mapsSupplementOwnRecursive(n, s) {
        e.assert(this === t), e.assert(2 === arguments.length, "Expects exactly two arguments");
        let r = {
          onField: e.field.mapper.dstNotOwn,
          onUpFilter: !0
        };
        return e.mapsExtendRecursiveConditional.call(e, r, n, s);
      }
      //
      ,
      mapSupplementRemovingRecursive: function mapSupplementRemovingRecursive(n, s) {
        e.assert(this === t), e.assert(arguments.length >= 2, "Expects at least two arguments");
        let r = {
          onField: e.field.mapper.removing,
          onUpFilter: !0
        }, a = e.longSlice(arguments);
        return a.unshift(r), e.mapExtendRecursiveConditional.apply(e, a);
      }
      //
      ,
      mapSupplementByMapsRemovingRecursive: function mapSupplementByMapsRemovingRecursive(n, s) {
        e.assert(this === t), e.assert(2 === arguments.length, "Expects exactly two arguments");
        let r = {
          onField: e.field.mapper.removing,
          onUpFilter: !0
        };
        return e.mapsExtendRecursiveConditional.call(e, r, n, s);
      },
      // map manipulator
      mapSetWithKeys: mapSetWithKeys,
      mapSet: mapSetWithKeys,
      mapSetStrictly: function mapSetStrictly(t, n, s) {
        function set(t, n, s) {
          void 0 === s ? delete t[n] : (e.assert(void 0 === t[n] || t[n] === s), t[n] = s);
        }
        if (null === t && (t = Object.create(null)), e.assert(e.objectIs(t)), e.assert(e.arrayIs(n) || e.strIs(n)), 
        e.assert(3 === arguments.length, "Expects exactly three arguments"), e.arrayIs(n)) for (let e = 0; e < n.length; e++) set(t, n[e], s); else set(t, n, s);
        return t;
      },
      mapDelete: function mapDelete(t, n) {
        if (e.assert(1 === arguments.length || 2 === arguments.length), e.assert(e.objectLike(t)), 
        void 0 !== n) {
          e.assert(e.objectLike(n));
          for (let e in n) delete t[e];
        } else for (let e in t) delete t[e];
        return t;
      },
      // map transformer
      mapInvert: mapInvert,
      mapInvertDroppingDuplicates: 
      //
      function mapInvertDroppingDuplicates(t, n) {
        let s;
        n = n || Object.create(null), e.assert(1 === arguments.length || 2 === arguments.length), 
        e.assert(e.objectLike(t));
        for (let e in t) void 0 !== n[t[e]] && ((s = s || Object.create(null))[t[e]] = !0), 
        n[t[e]] = e;
        if (s) for (let e in s) delete n[e];
        return n;
      },
      mapsFlatten: mapsFlatten,
      mapToArray: 
      //
      /**
 * The mapToArray() converts an object {-srcMap-} into array [ [ key, value ] ... ].
 *
 * It takes an object {-srcMap-} creates an empty array,
 * checks if ( arguments.length === 1 ) and {-srcMap-} is an object.
 * If true, it returns a list of [ [ key, value ] ... ] pairs.
 * Otherwise it throws an Error.
 *
 * @param { objectLike } src - object to get a list of [ key, value ] pairs.
 *
 * @example
 * // returns [ [ 'a', 3 ], [ 'b', 13 ], [ 'c', 7 ] ]
 * _.mapToArray( { a : 3, b : 13, c : 7 } );
 *
 * @returns { array } Returns a list of [ [ key, value ] ... ] pairs.
 * @function mapToArray
 * @throws { Error } Will throw an Error if( arguments.length !== 1 ) or {-srcMap-} is not an object.
 * @memberof wTools
 */
      function mapToArray(t) {
        return e.mapPairs(t);
      },
      /* qqq : test required */
      mapToStr: mapToStr,
      /* experimental */
      // map selector
      _mapEnumerableKeys: 
      // --
      // map selector
      // --
      function _mapEnumerableKeys(t, s) {
        let r = [];
        if (e.assert(2 === arguments.length, "Expects exactly two arguments"), e.assert(!e.primitiveIs(t)), 
        s) for (let e in t) n.call(t, e) && r.push(e); else for (let e in t) r.push(e);
        return r;
      },
      _mapKeys: _mapKeys,
      mapKeys: mapKeys,
      mapOwnKeys: mapOwnKeys,
      mapAllKeys: mapAllKeys,
      _mapVals: _mapVals,
      mapVals: mapVals,
      mapOwnVals: mapOwnVals,
      mapAllVals: mapAllVals,
      _mapPairs: _mapPairs,
      mapPairs: mapPairs,
      mapOwnPairs: mapOwnPairs,
      mapAllPairs: mapAllPairs,
      _mapProperties: _mapProperties,
      mapProperties: mapProperties,
      mapProperties: mapProperties,
      mapOwnProperties: mapOwnProperties,
      mapAllProperties: mapAllProperties,
      mapRoutines: mapRoutines,
      mapRoutines: mapRoutines,
      mapOwnRoutines: mapOwnRoutines,
      mapAllRoutines: mapAllRoutines,
      mapFields: mapFields,
      mapFields: mapFields,
      mapOwnFields: mapOwnFields,
      mapAllFields: mapAllFields,
      mapOnlyPrimitives: 
      //
      /**
 * The mapOnlyPrimitives() gets all object`s {-srcMap-} enumerable atomic fields( null, undef, number, string, symbol ) and returns them as new map.
 *
 * It takes an object {-srcMap-} creates an empty map,
 * checks if {-srcMap-} is an object.
 * If true, it copies object`s {-srcMap-} enumerable atomic properties to the new map using
 * their original name/value and returns the result, otherwise it returns empty map.
 *
 * @param { objectLike } srcMap - Object to get a map of atomic properties.
 *
 * @example
 * let a = {};
 * Object.defineProperty( a, 'x', { enumerable : 0, value : 3 } )
 * _.mapOnlyPrimitives( a );
 * // returns { }
 *
 * @example
 * let a = { a : 1 };
 * let b = { b : 2, c : function(){} };
 * Object.setPrototypeOf( a, b );
 * _.mapOnlyPrimitives( a );
 * //returns { a : 1, b : 2 }
 *
 * @returns { object } A new map with all atomic fields from source {-srcMap-}.
 * @function mapOnlyPrimitives
 * @throws { Error } Will throw an Error if {-srcMap-} is not an Object.
 * @memberof wTools
 */
      function mapOnlyPrimitives(t) {
        return e.assert(1 === arguments.length, "Expects single argument"), e.assert(!e.primitiveIs(t)), 
        e.mapExtendConditional(e.field.mapper.primitive, Object.create(null), t);
      }
      //
      /**
 * The mapFirstPair() routine returns first pair [ key, value ] as array.
 *
 * @param { objectLike } srcMap - An object like entity of get first pair.
 *
 * @example
 * // returns [ 'a', 3 ]
 * _.mapFirstPair( { a : 3, b : 13 } );
 *
 * @example
 * // returns 'undefined'
 * _.mapFirstPair( {  } );
 *
 * @example
 * // returns [ '0', [ 'a', 7 ] ]
 * _.mapFirstPair( [ [ 'a', 7 ] ] );
 *
 * @returns { Array } Returns pair [ key, value ] as array if {-srcMap-} has fields, otherwise, undefined.
 * @function mapFirstPair
 * @throws { Error } Will throw an Error if (arguments.length) less than one, if {-srcMap-} is not an object-like.
 * @memberof wTools
 */ ,
      mapFirstPair: function mapFirstPair(t) {
        e.assert(1 === arguments.length, "Expects single argument"), e.assert(e.objectLike(t));
        for (let e in t) return [ e, t[e] ];
        return [];
      }
      //
      ,
      mapValsSet: function mapValsSet(t, n) {
        e.assert(2 === arguments.length, "Expects exactly two arguments");
        for (let e in t) t[e] = n;
        return t;
      }
      //
      ,
      mapSelect: function mapSelect(t, n) {
        let s = Object.create(null);
        e.assert(e.arrayLike(n)), e.assert(!e.primitiveIs(t));
        for (let r = 0; r < n.length; r++) {
          let a = n[r];
          e.assert(e.strIs(a) || e.numberIs(a)), s[a] = t[a];
        }
        return s;
      }
      //
      /**
 * The mapValWithIndex() returns value of {-srcMap-} by corresponding (index).
 *
 * It takes {-srcMap-} and (index), creates a variable ( i = 0 ),
 * checks if ( index > 0 ), iterate over {-srcMap-} object-like and match
 * if ( i == index ).
 * If true, it returns value of {-srcMap-}.
 * Otherwise it increment ( i++ ) and iterate over {-srcMap-} until it doesn't match index.
 *
 * @param { objectLike } srcMap - An object-like.
 * @param { number } index - To find the position an element.
 *
 * @example
 * // returns 7
 * _.mapValWithIndex( [ 3, 13, 'c', 7 ], 3 );
 *
 * @returns { * } Returns value of {-srcMap-} by corresponding (index).
 * @function mapValWithIndex
 * @throws { Error } Will throw an Error if( arguments.length > 2 ) or {-srcMap-} is not an Object.
 * @memberof wTools
 */ ,
      mapValWithIndex: function mapValWithIndex(t, n) {
        if (e.assert(2 === arguments.length, "Expects exactly two arguments"), e.assert(!e.primitiveIs(t)), 
        n < 0) return;
        let s = 0;
        for (let e in t) {
          if (s == n) return t[e];
          s++;
        }
      }
      //
      /**
 * The mapKeyWithIndex() returns key of {-srcMap-} by corresponding (index).
 *
 * It takes {-srcMap-} and (index), creates a variable ( i = 0 ),
 * checks if ( index > 0 ), iterate over {-srcMap-} object-like and match
 * if ( i == index ).
 * If true, it returns value of {-srcMap-}.
 * Otherwise it increment ( i++ ) and iterate over {-srcMap-} until it doesn't match index.
 *
 * @param { objectLike } srcMap - An object-like.
 * @param { number } index - To find the position an element.
 *
 * @example
 * // returns '1'
 * _.mapKeyWithIndex( [ 'a', 'b', 'c', 'd' ], 1 );
 *
 * @returns { string } Returns key of {-srcMap-} by corresponding (index).
 * @function mapKeyWithIndex
 * @throws { Error } Will throw an Error if( arguments.length > 2 ) or {-srcMap-} is not an Object.
 * @memberof wTools
 */ ,
      mapKeyWithIndex: function mapKeyWithIndex(t, n) {
        if (e.assert(2 === arguments.length, "Expects exactly two arguments"), e.assert(!e.primitiveIs(t)), 
        n < 0) return;
        let s = 0;
        for (let e in t) {
          if (s == n) return e;
          s++;
        }
      }
      //
      ,
      mapKeyWithValue: function mapKeyWithValue(t, n) {
        e.assert(2 === arguments.length, "Expects exactly two arguments"), e.assert(!e.primitiveIs(t));
      }
      //
      ,
      mapIndexWithKey: function mapIndexWithKey(t, n) {
        e.assert(2 === arguments.length, "Expects exactly two arguments"), e.assert(!e.primitiveIs(t));
        for (let e in t) if (e === n) return e;
      }
      //
      ,
      mapIndexWithValue: function mapIndexWithValue(t, n) {
        e.assert(2 === arguments.length, "Expects exactly two arguments"), e.assert(!e.primitiveIs(t));
        for (let e in t) if (t[e] === n) return e;
      }
      //
      ,
      mapNulls: function mapNulls(t) {
        let n = Object.create(null);
        e.assert(1 === arguments.length), e.assert(!e.primitiveIs(t));
        for (let e in t) null === t[e] && (n[e] = null);
        return n;
      }
      //
      ,
      mapButNulls: function mapButNulls(t) {
        let n = Object.create(null);
        e.assert(1 === arguments.length), e.assert(!e.primitiveIs(t));
        for (let e in t) null !== t[e] && (n[e] = t[e]);
        return n;
      }
      // --
      // map logic operator
      // --
      /**
 * The mapButConditional() routine returns a new object (result)
 * whose (values) are not equal to the arrays or objects.
 *
 * Takes any number of objects.
 * If the first object has same key any other object has
 * then this pair [ key, value ] will not be included into (result) object.
 * Otherwise,
 * it calls a provided callback function( _.field.mapper.primitive )
 * once for each key in the {-srcMap-}, and adds to the (result) object
 * all the [ key, value ],
 * if values are not equal to the array or object.
 *
 * @param { function } filter.primitive() - Callback function to test each [ key, value ] of the {-srcMap-} object.
 * @param { objectLike } srcMap - The target object.
 * @param { ...objectLike } arguments[] - The next objects.
 *
 * @example
 * // returns { a : 1, b : "b" }
 * mapButConditional( _.field.mapper.primitive, { a : 1, b : 'b', c : [ 1, 2, 3 ] } );
 *
 * @returns { object } Returns an object whose (values) are not equal to the arrays or objects.
 * @function mapButConditional
 * @throws { Error } Will throw an Error if {-srcMap-} is not an object.
 * @memberof wTools
 */ ,
      // map logic operator
      mapButConditional: function mapButConditional(t, n, s) {
        let r = Object.create(null);
        if (e.assert(3 === arguments.length, "Expects exactly three arguments"), e.assert(!e.primitiveIs(s), "Expects map {-butMap-}"), 
        e.assert(!e.primitiveIs(n) && !e.longIs(n), "Expects map {-srcMap-}"), e.assert(t && 3 === t.length && "field-filter" === t.functionFamily, "Expects field-filter {-fieldFilter-}"), 
        e.arrayLike(s)) for (let e in n) {
          let a;
          for (a = 0; a < s.length && t(s[a], n, e); a++) ;
          a === s.length && (r[e] = n[e]);
        } else for (let e in n) t(s, n, e) && (r[e] = n[e]);
        return r;
      }
      //
      /**
 * Returns new object with unique keys.
 *
 * Takes any number of objects.
 * Returns new object filled by unique keys
 * from the first {-srcMap-} original object.
 * Values for result object come from original object {-srcMap-}
 * not from second or other one.
 * If the first object has same key any other object has
 * then this pair( key/value ) will not be included into result object.
 * Otherwise pair( key/value ) from the first object goes into result object.
 *
 * @param{ objectLike } srcMap - original object.
 * @param{ ...objectLike } arguments[] - one or more objects.
 * Objects to return an object without repeating keys.
 *
 * @example
 * // returns { c : 3 }
 * mapBut( { a : 7, b : 13, c : 3 }, { a : 7, b : 13 } );
 *
 * @throws { Error }
 *  In debug mode it throws an error if any argument is not object like.
 * @returns { object } Returns new object made by unique keys.
 * @function mapBut
 * @memberof wTools
 */ ,
      mapBut: function mapBut(t, n) {
        let s = Object.create(null);
        if (e.arrayLike(t) && (t = e.mapMake.apply(this, t)), e.assert(2 === arguments.length, "Expects exactly two arguments"), 
        e.assert(!e.primitiveIs(n), "Expects map {-butMap-}"), e.assert(!e.primitiveIs(t) && !e.arrayLike(t), "Expects map {-srcMap-}"), 
        e.arrayLike(n)) for (let e in t) {
          let r;
          for (r = 0; r < n.length && !(e in n[r]); r++) ;
          r === n.length && (s[e] = t[e]);
        } else for (let e in t) e in n || (s[e] = t[e]);
        return s;
      }
      //
      /**
 * Returns new object with unique keys.
 *
 * Takes any number of objects.
 * Returns new object filled by unique keys
 * from the first {-srcMap-} original object.
 * Values for result object come from original object {-srcMap-}
 * not from second or other one.
 * If the first object has same key any other object has
 * then this pair( key/value ) will not be included into result object.
 * Otherwise pair( key/value ) from the first object goes into result object.
 *
 * @param{ objectLike } srcMap - original object.
 * @param{ ...objectLike } arguments[] - one or more objects.
 * Objects to return an object without repeating keys.
 *
 * @example
 * // returns { c : 3 }
 * mapButIgnoringUndefines( { a : 7, b : 13, c : 3 }, { a : 7, b : 13 } );
 *
 * @throws { Error }
 *  In debug mode it throws an error if any argument is not object like.
 * @returns { object } Returns new object made by unique keys.
 * @function mapButIgnoringUndefines
 * @memberof wTools
 */ ,
      mapButIgnoringUndefines: function mapButIgnoringUndefines(t, n) {
        return Object.create(null), e.assert(2 === arguments.length, "Expects exactly two arguments"), 
        e.mapButConditional(e.field.filter.dstUndefinedSrcNotUndefined, t, n);
        // return _.mapButConditional( _.field.filter.dstHasButUndefined, butMap, srcMap );
            }
      // function mapButIgnoringUndefines( srcMap, butMap )
      // {
      //   let result = Object.create( null );
      //
      //   _.assert( arguments.length === 2, 'Expects exactly two arguments' );
      //   _.assert( !_.primitiveIs( butMap ), 'Expects map {-butMap-}' );
      //   _.assert( !_.primitiveIs( srcMap ) && !_.longIs( srcMap ), 'Expects map {-srcMap-}' );
      //
      //   if( _.arrayLike( butMap ) )
      //   {
      //
      //     for( let s in srcMap )
      //     {
      //
      //       if( srcMap[ k ] === undefined )
      //       continue;
      //
      //       for( let m = 0 ; m < butMap.length ; m++ )
      //       {
      //         if( butMap[ m ][ s ] === undefined )
      //         break;
      //       }
      //
      //       if( m === butMap.length )
      //       result[ s ] = srcMap[ s ];
      //
      //     }
      //
      //   }
      //   else
      //   {
      //
      //     for( let s in srcMap )
      //     {
      //
      //       if( srcMap[ k ] === undefined )
      //       continue;
      //
      //       if( butMap[ s ] === undefined )
      //       {
      //         result[ s ] = srcMap[ s ];
      //       }
      //
      //     }
      //
      //   }
      //
      //   return result;
      // }
      //
      //
      //
      // function mapButIgnoringUndefines( srcMap )
      // {
      //   let result = Object.create( null );
      //   let a, k;
      //
      //   _.assert( arguments.length >= 2 );
      //   _.assert( !_.primitiveIs( srcMap ), 'Expects object as argument' );
      //
      //   for( k in srcMap )
      //   {
      //
      //     for( a = 1 ; a < arguments.length ; a++ )
      //     {
      //       let argument = arguments[ a ];
      //
      //       _.assert( !_.primitiveIs( argument ), 'argument', '#'+a, 'is not object' );
      //
      //       if( k in argument )
      //       if( argument[ k ] !== undefined )
      //       break;
      //
      //     }
      //     if( a === arguments.length )
      //     {
      //       result[ k ] = srcMap[ k ];
      //     }
      //   }
      //
      //   return result;
      // }
      //
      // //
      //
      // function mapBut( srcMap )
      // {
      //   let result = Object.create( null );
      //   let a, k;
      //
      //   _.assert( arguments.length >= 2 );
      //   _.assert( !_.primitiveIs( srcMap ), 'mapBut :', 'Expects object as argument' );
      //
      //   for( k in srcMap )
      //   {
      //     for( a = 1 ; a < arguments.length ; a++ )
      //     {
      //       let argument = arguments[ a ];
      //
      //       _.assert( !_.primitiveIs( argument ), 'argument', '#'+a, 'is not object' );
      //
      //       if( k in argument )
      //       break;
      //
      //     }
      //     if( a === arguments.length )
      //     {
      //       result[ k ] = srcMap[ k ];
      //     }
      //   }
      //
      //   return result;
      // }
      //
      //
      /**
 * The mapOwnBut() returns new object with unique own keys.
 *
 * Takes any number of objects.
 * Returns new object filled by unique own keys
 * from the first {-srcMap-} original object.
 * Values for (result) object come from original object {-srcMap-}
 * not from second or other one.
 * If {-srcMap-} does not have own properties it skips rest of code and checks another properties.
 * If the first object has same key any other object has
 * then this pair( key/value ) will not be included into result object.
 * Otherwise pair( key/value ) from the first object goes into result object.
 *
 * @param { objectLike } srcMap - The original object.
 * @param { ...objectLike } arguments[] - One or more objects.
 *
 * @example
 * // returns { a : 7 }
 * mapBut( { a : 7, 'toString' : 5 }, { b : 33, c : 77 } );
 *
 * @returns { object } Returns new (result) object with unique own keys.
 * @function mapOwnBut
 * @throws { Error } Will throw an Error if {-srcMap-} is not an object.
 * @memberof wTools
 */ ,
      mapOwnBut: function mapOwnBut(t, n) {
        return Object.create(null), e.assert(2 === arguments.length, "Expects exactly two arguments"), 
        e.mapButConditional(e.field.filter.dstNotHasSrcOwn, t, n);
      }
      //
      /**
 * @namespace
 * @property { objectLike } screenMaps.screenMap - The first object.
 * @property { ...objectLike } srcMap.arguments[1, ...] -
 * The pseudo array (arguments[]) from the first [1] index to the end.
 * @property { object } dstMap - The empty object.
 */
      /**
 * The mapOnly() returns an object filled by unique [ key, value ]
 * from others objects.
 *
 * It takes number of objects, creates a new object by three properties
 * and calls the _mapOnly( {} ) with created object.
 *
 * @see  {@link wTools._mapOnly} - See for more information.
 *
 * @param { objectLike } screenMap - The first object.
 * @param { ...objectLike } arguments[] - One or more objects.
 *
 * @example
 * // returns { a : "abc", c : 33, d : "name" };
 * _.mapOnly( { a : 13, b : 77, c : 3, d : 'name' }, { d : 'name', c : 33, a : 'abc' } );
 *
 * @returns { Object } Returns the object filled by unique [ key, value ]
 * from others objects.
 * @function mapOnly
 * @throws { Error } Will throw an Error if (arguments.length < 2) or (arguments.length !== 2).
 * @memberof wTools
 */ ,
      mapOnly: function mapOnly(t, n) {
        return 1 === arguments.length ? e.mapsExtend(null, t) : (e.assert(1 === arguments.length || 2 === arguments.length, "Expects single or two arguments"), 
        _mapOnly({
          srcMaps: t,
          screenMaps: n,
          dstMap: Object.create(null)
        }));
      }
      //
      ,
      mapOnlyOwn: function mapOnlyOwn(t, n) {
        return 1 === arguments.length ? e.mapsExtendConditional(e.field.mapper.srcOwn, null, t) : (e.assert(1 === arguments.length || 2 === arguments.length, "Expects single or two arguments"), 
        _mapOnly({
          filter: e.field.mapper.srcOwn,
          srcMaps: t,
          screenMaps: n,
          dstMap: Object.create(null)
        }));
      }
      //
      ,
      mapOnlyComplementing: function mapOnlyComplementing(t, n) {
        return e.assert(1 === arguments.length || 2 === arguments.length, "Expects single or two arguments"), 
        _mapOnly({
          filter: e.field.mapper.dstNotOwnOrUndefinedAssigning,
          srcMaps: t,
          screenMaps: n,
          dstMap: Object.create(null)
        });
      },
      _mapOnly: _mapOnly,
      // map surer
      sureMapHasExactly: 
      // --
      // map sure
      // --
      function sureMapHasExactly(t, n, s) {
        let r = !0;
        return r = (r = r && e.sureMapHasOnly.apply(this, arguments)) && e.sureMapHasAll.apply(this, arguments), 
        !0;
      }
      //
      ,
      sureMapOwnExactly: function sureMapOwnExactly(t, n, s) {
        let r = !0;
        return r = (r = r && e.sureMapOwnOnly.apply(this, arguments)) && e.sureMapOwnAll.apply(this, arguments), 
        !0;
      }
      //
      /**
 * Checks if map passed by argument {-srcMap-} has only properties represented in object(s) passed after first argument. Checks all enumerable properties.
 * Works only in debug mode. Uses StackTrace level 2. {@link wTools.err See err}
 * If routine found some unique properties in source it generates and throws exception, otherwise returns without exception.
 * Also generates error using message passed after last object. Message may be a string, an array, or a function.
 *
 * @param { Object } srcMap - source map.
 * @param { Object } screenMaps - object to compare with.
 * @param { * } [ msg ] - error message for generated exception.
 * @param { * } [ msg ] - error message that adds to the message in third argument.
 *
 * @example
 * let a = { a : 1, b : 3 };
 * let b = { a : 2, b : 3 };
 * wTools.sureMapHasOnly( a, b );
 *
 * // no exception
 *
 * @example
 * let a = { a : 1, c : 3 };
 * let b = { a : 2, b : 3 };
 * wTools.sureMapHasOnly( a, b );
 *
 * // caught <anonymous>:3:8
 * // Object should have no fields : c
 * //
 * // at _err (file:///.../wTools/staging/Base.s:3707)
 * // at sureMapHasOnly (file:///.../wTools/staging/Base.s:4188)
 * // at <anonymous>:3
 *
 * @example
 * let x = { d : 1 };
 * let a = Object.create( x );
 * let b = { a : 1 };
 * wTools.sureMapHasOnly( a, b, 'message' )
 *
 * // caught <anonymous>:4:8
 * // message Object should have no fields : d
 * //
 * // at _err (file:///.../wTools/staging/Base.s:3707)
 * // at sureMapHasOnly (file:///.../wTools/staging/Base.s:4188)
 * // at <anonymous>:4
 *
 * @example
 * let x = { d : 1 };
 * let a = Object.create( x );
 * let b = { a : 1 };
 * wTools.sureMapHasOnly( a, b, () => 'message, ' + 'map`, ' should have no fields :'  )
 *
 * // caught <anonymous>:4:8
 * // message Object should have no fields : d
 * //
 * // at _err (file:///.../wTools/staging/Base.s:3707)
 * // at sureMapHasOnly (file:///.../wTools/staging/Base.s:4188)
 * // at <anonymous>:4
 *
 * @function sureMapHasOnly
 * @throws {Exception} If no arguments are provided or more than four arguments are provided.
 * @throws {Exception} If map {-srcMap-} contains unique property.
 * @memberof wTools
 *
 */ ,
      sureMapHasOnly: function sureMapHasOnly(t, n, s) {
        e.assert(2 === arguments.length || 3 === arguments.length || 4 === arguments.length, "Expects two, three or four arguments");
        let r = Object.keys(e.mapBut(t, n));
        if (r.length > 0) {
          debugger;
          if (2 === arguments.length) throw e._err({
            args: [ e.strType(t) + " should have no fields :", e.strQuote(r).join(", ") ],
            level: 2
          });
          {
            let t = [];
            for (let n = 2; n < arguments.length; n++) e.routineIs(arguments[n]) && (arguments[n] = arguments[n]()), 
            t[n] = arguments[n];
            throw e._err({
              args: [ t.join(" "), e.strQuote(r).join(", ") ],
              level: 2
            });
          }
        }
        return !0;
      }
      //
      /**
 * Checks if map passed by argument {-srcMap-} has only properties represented in object(s) passed after first argument. Checks only own properties of the objects.
 * Works only in debug mode. Uses StackTrace level 2.{@link wTools.err See err}
 * If routine found some unique properties in source it generates and throws exception, otherwise returns without exception.
 * Also generates error using message passed after last object. Message may be a string, an array, or a function.
 *
 * @param { Object } srcMap - source map.
 * @param { Object } screenMaps - object to compare with.
 * @param { * } [ msg ] - error message for generated exception.
 * @param { * } [ msg ] - error message that adds to the message in third argument.
 *
 * @example
 * let x = { d : 1 };
 * let a = Object.create( x );
 * a.a = 5;
 * let b = { a : 2 };
 * wTools.sureMapOwnOnly( a, b );
 *
 * //no exception
 *
 * @example
 * let a = { d : 1 };
 * let b = { a : 2 };
 * wTools.sureMapOwnOnly( a, b );
 *
 * // caught <anonymous>:3:10
 * // Object should have no own fields : d
 * //
 * // at _err (file:///.../wTools/staging/Base.s:3707)
 * // at sureMapOwnOnly (file:///.../wTools/staging/Base.s:4215)
 * // at <anonymous>:3
 *
 * @example
 * let a = { x : 0, y : 2 };
 * let b = { c : 0, d : 3};
 * let c = { a : 1 };
 * wTools.sureMapOwnOnly( a, b, 'error msg' );
 *
 * // caught <anonymous>:4:8
 * // error msg Object should have no own fields : x, y
 * //
 * // at _err (file:///.../wTools/staging/Base.s:3707)
 * // at sureMapOwnOnly (file:///.../wTools/staging/Base.s:4215)
 * // at <anonymous>:4
 *
 * @example
 * let a = { x : 0, y : 2 };
 * let b = { c : 0, d : 3};
 * let c = { a : 1 };
 * wTools.sureMapOwnOnly( a, b, () => 'error, ' + 'map should', ' no own fields :' );
 *
 * // caught <anonymous>:4:9
 * // error, map should have no own fields : x, y
 * //
 * // at _err (file:///.../wTools/staging/Base.s:3707)
 * // at sureMapOwnOnly (file:///.../wTools/staging/Base.s:4215)
 * // at <anonymous>:3
 *
 * @function sureMapOwnOnly
 * @throws {Exception} If no arguments are provided or more than four arguments are provided.
 * @throws {Exception} If map {-srcMap-} contains unique property.
 * @memberof wTools
 *
 */ ,
      sureMapOwnOnly: function sureMapOwnOnly(t, n, s) {
        e.assert(2 === arguments.length || 3 === arguments.length || 4 === arguments.length, "Expects two, three or four arguments");
        let r = Object.keys(e.mapOwnBut(t, n));
        if (r.length > 0) {
          debugger;
          if (2 === arguments.length) throw e._err({
            args: [ e.strType(t) + " should own no fields :", e.strQuote(r).join(", ") ],
            level: 2
          });
          {
            let t = [];
            for (let n = 2; n < arguments.length; n++) e.routineIs(arguments[n]) && (arguments[n] = arguments[n]()), 
            t[n] = arguments[n];
            throw e._err({
              args: [ t.join(" "), e.strQuote(r).join(", ") ],
              level: 2
            });
          }
        }
        return !0;
      }
      //
      /**
 * Checks if map passed by argument {-srcMap-} has all properties represented in object passed by argument( all ). Checks all enumerable properties.
 * Works only in debug mode. Uses StackTrace level 2.{@link wTools.err See err}
 * If routine did not find some properties in source it generates and throws exception, otherwise returns without exception.
 * Also generates error using message passed after last object. Message may be a string, an array, or a function.
 *
 * @param { Object } srcMap - source map.
 * @param { Object } all - object to compare with.
 * @param { * } [ msg ] - error message for generated exception.
 * @param { * } [ msg ] - error message that adds to the message in third argument.
 *
 * @example
 * let x = { a : 1 };
 * let a = Object.create( x );
 * let b = { a : 2 };
 * wTools.sureMapHasAll( a, b );
 *
 * // no exception
 *
 * @example
 * let a = { d : 1 };
 * let b = { a : 2 };
 * wTools.sureMapHasAll( a, b );
 *
 * // caught <anonymous>:3:10
 * // Object should have fields : a
 * //
 * // at _err (file:///.../wTools/staging/Base.s:3707)
 * // at sureMapHasAll (file:///.../wTools/staging/Base.s:4242)
 * // at <anonymous>:3
 *
 * @example
 * let a = { x : 0, y : 2 };
 * let b = { x : 0, d : 3};
 * wTools.sureMapHasAll( a, b, 'error msg' );
 *
 * // caught <anonymous>:4:9
 * // error msg Object should have fields : d
 * //
 * // at _err (file:///.../wTools/staging/Base.s:3707)
 * // at sureMapHasAll (file:///.../wTools/staging/Base.s:4242)
 * // at <anonymous>:3
 *
 * @example
 * let a = { x : 0 };
 * let b = { x : 1, y : 0};
 * wTools.sureMapHasAll( a, b, () => 'error, ' + 'map should', ' have fields :' );
 *
 * // caught <anonymous>:4:9
 * // error, map should have fields : y
 * //
 * // at _err (file:///.../wTools/staging/Base.s:3707)
 * // at sureMapHasAll (file:///.../wTools/staging/Base.s:4242)
 * // at <anonymous>:3
 *
 * @function sureMapHasAll
 * @throws {Exception} If no arguments are provided or more than four arguments are provided.
 * @throws {Exception} If map {-srcMap-} not contains some properties from argument( all ).
 * @memberof wTools
 *
 */ ,
      sureMapHasAll: function sureMapHasAll(t, n, s) {
        e.assert(2 === arguments.length || 3 === arguments.length || 4 === arguments.length, "Expects two, three or four arguments");
        let r = Object.keys(e.mapBut(n, t));
        if (r.length > 0) {
          debugger;
          if (2 === arguments.length) throw e._err({
            args: [ e.strType(t) + " should have fields :", e.strQuote(r).join(", ") ],
            level: 2
          });
          {
            let t = [];
            for (let n = 2; n < arguments.length; n++) e.routineIs(arguments[n]) && (arguments[n] = arguments[n]()), 
            t[n] = arguments[n];
            throw e._err({
              args: [ t.join(" "), e.strQuote(r).join(", ") ],
              level: 2
            });
          }
        }
        return !0;
      }
      //
      /**
 * Checks if map passed by argument {-srcMap-} has all properties represented in object passed by argument( all ). Checks only own properties of the objects.
 * Works only in Config.debug mode. Uses StackTrace level 2. {@link wTools.err See err}
 * If routine did not find some properties in source it generates and throws exception, otherwise returns without exception.
 * Also generates error using message passed after last object. Message may be a string, an array, or a function.
 *
 * @param { Object } srcMap - source map.
 * @param { Object } all - object to compare with.
 * @param { * } [ msg ] - error message for generated exception.
 * @param { * } [ msg ] - error message that adds to the message in third argument.
 *
 * @example
 * let a = { a : 1 };
 * let b = { a : 2 };
 * wTools.sureMapOwnAll( a, b );
 *
 * // no exception
 *
 * @example
 * let a = { a : 1 };
 * let b = { a : 2, b : 2 }
 * wTools.sureMapOwnAll( a, b );
 *
 * // caught <anonymous>:3:8
 * // Object should have own fields : b
 * //
 * // at _err (file:///.../wTools/staging/Base.s:3707)
 * // at sureMapOwnAll (file:///.../wTools/staging/Base.s:4269)
 * // at <anonymous>:3
 *
 * @example
 * let a = { x : 0 };
 * let b = { x : 1, y : 0};
 * wTools.sureMapOwnAll( a, b, 'error, should own fields' );
 *
 * // caught <anonymous>:4:9
 * // error, should own fields : y
 * //
 * // at _err (file:///.../wTools/staging/Base.s:3707)
 * // at sureMapOwnAll (file:///.../wTools/staging/Base.s:4269)
 * // at <anonymous>:3
 *
 * @example
 * let a = { x : 0 };
 * let b = { x : 1, y : 0};
 * wTools.sureMapOwnAll( a, b, () => 'error, ' + 'map should', ' own fields :' );
 *
 * // caught <anonymous>:4:9
 * // error, map should own fields : y
 * //
 * // at _err (file:///.../wTools/staging/Base.s:3707)
 * // at sureMapOwnAll (file:///.../wTools/staging/Base.s:4269)
 * // at <anonymous>:3
 *
 * @function sureMapOwnAll
 * @throws {Exception} If no arguments are provided or more than four arguments are provided.
 * @throws {Exception} If map {-srcMap-} not contains some properties from argument( all ).
 * @memberof wTools
 *
 */ ,
      sureMapOwnAll: function sureMapOwnAll(t, n, s) {
        e.assert(2 === arguments.length || 3 === arguments.length || 4 === arguments.length, "Expects two, three or four arguments");
        let r = Object.keys(e.mapOwnBut(n, t));
        if (r.length > 0) {
          debugger;
          if (2 === arguments.length) throw e._err({
            args: [ e.strType(t) + " should own fields :", e.strQuote(r).join(", ") ],
            level: 2
          });
          {
            let t = [];
            for (let n = 2; n < arguments.length; n++) e.routineIs(arguments[n]) && (arguments[n] = arguments[n]()), 
            t[n] = arguments[n];
            throw e._err({
              args: [ t.join(" "), e.strQuote(r).join(", ") ],
              level: 2
            });
          }
        }
        return !0;
      }
      //
      /**
 * Checks if map passed by argument {-srcMap-} has no properties represented in object(s) passed after first argument. Checks all enumerable properties.
 * Works only in debug mode. Uses StackTrace level 2. {@link wTools.err See err}
 * If routine found some properties in source it generates and throws exception, otherwise returns without exception.
 * Also generates error using message passed after last object. Message may be a string, an array, or a function.
 *
 * @param { Object } srcMap - source map.
 * @param {...Object} screenMaps - object(s) to compare with.
 * @param { * } [ msg ] - error message for generated exception.
 * @param { * } [ msg ] - error message that adds to the message in third argument.
 *
 * @example
 * let a = { a : 1 };
 * let b = { b : 2 };
 * wTools.sureMapHasNone( a, b );
 *
 * // no exception
 *
 * @example
 * let x = { a : 1 };
 * let a = Object.create( x );
 * let b = { a : 2, b : 2 }
 * wTools.sureMapHasNone( a, b );
 *
 * // caught <anonymous>:4:8
 * // Object should have no fields : a
 * //
 * // at _err (file:///.../wTools/staging/Base.s:3707)
 * // at sureMapHasAll (file:///.../wTools/staging/Base.s:4518)
 * // at <anonymous>:4
 *
 * @example
 * let a = { x : 0, y : 1 };
 * let b = { x : 1, y : 0 };
 * wTools.sureMapHasNone( a, b, 'error, map should have no fields' );
 *
 * // caught <anonymous>:3:9
 * // error, map should have no fields : x, y
 * //
 * // at _err (file:///.../wTools/staging/Base.s:3707)
 * // at sureMapHasNone (file:///.../wTools/staging/Base.s:4518)
 * // at <anonymous>:3
 *
 * @example
 * let a = { x : 0, y : 1 };
 * let b = { x : 1, y : 0 };
 * wTools.sureMapHasNone( a, b, () => 'error, ' + 'map should have', 'no fields :' );
 *
 * // caught <anonymous>:3:9
 * // error, map should have no fields : x, y
 * //
 * // at _err (file:///.../wTools/staging/Base.s:3707)
 * // at sureMapHasNone (file:///.../wTools/staging/Base.s:4518)
 * // at <anonymous>:3
 *
 * @function sureMapHasNone
 * @throws {Exception} If no arguments are provided or more than four arguments are provided.
 * @throws {Exception} If map {-srcMap-} contains some properties from other map(s).
 * @memberof wTools
 *
 */ ,
      sureMapHasNone: function sureMapHasNone(t, n, s) {
        e.assert(2 === arguments.length || 3 === arguments.length || 4 === arguments.length, "Expects two, three or four arguments");
        let r = Object.keys(e.mapOnly(t, n));
        if (r.length > 0) {
          debugger;
          if (2 === arguments.length) throw e._err({
            args: [ e.strType(t) + " should have no fields :", e.strQuote(r).join(", ") ],
            level: 2
          });
          {
            let t = [];
            for (let n = 2; n < arguments.length; n++) e.routineIs(arguments[n]) && (arguments[n] = arguments[n]()), 
            t[n] = arguments[n];
            throw e._err({
              args: [ t.join(" "), e.strQuote(r).join(", ") ],
              level: 2
            });
          }
        }
        return !0;
      }
      //
      ,
      sureMapOwnNone: function sureMapOwnNone(t, n, s) {
        e.assert(2 === arguments.length || 3 === arguments.length || 4 === arguments.length, "Expects two, three or four arguments");
        let r = Object.keys(e.mapOnlyOwn(t, n));
        if (r.length > 0) {
          debugger;
          if (2 === arguments.length) throw e._err({
            args: [ e.strType(t) + " should own no fields :", e.strQuote(r).join(", ") ],
            level: 2
          });
          {
            let t = [];
            for (let n = 2; n < arguments.length; n++) e.routineIs(arguments[n]) && (arguments[n] = arguments[n]()), 
            t[n] = arguments[n];
            throw e._err({
              args: [ t.join(" "), e.strQuote(r).join(", ") ],
              level: 2
            });
          }
        }
        return !0;
      }
      //
      /**
 * Checks if map passed by argument {-srcMap-} not contains undefined properties. Works only in debug mode. Uses StackTrace level 2. {@link wTools.err See err}
 * If routine found undefined property it generates and throws exception, otherwise returns without exception.
 * Also generates error using messages passed after first argument. Message may be a string, an array, or a function.
 *
 * @param { Object } srcMap - source map.
 * @param { * } [ msg ] - error message for generated exception.
 * @param { * } [ msg ] - error message that adds to the message in third argument.
 *
 * @example
 * let map = { a : '1', b : 'name' };
 * wTools.sureMapHasNoUndefine( map );
 *
 * // no exception
 *
 * @example
 * let map = { a : '1', b : undefined };
 * wTools.sureMapHasNoUndefine( map );
 *
 * // caught <anonymous>:2:8
 * // Object  should have no undefines, but has : b
 * //
 * // at _err (file:///.../wTools/staging/Base.s:3707)
 * // at sureMapHasNoUndefine (file:///.../wTools/staging/Base.s:4087)
 * // at <anonymous>:2
 *
 * @example
 * let map = { a : undefined, b : '1' };
 * wTools.sureMapHasNoUndefine( map, '"map" has undefines :');
 *
 * // caught <anonymous>:2:8
 * // "map" has undefines : a
 * //
 * // at _err (file:///.../wTools/staging/Base.s:3707)
 * // at sureMapHasNoUndefine (file:///.../wTools/staging/Base.s:4087)
 * // at <anonymous>:2
 *
 * @example
 * let map = { a : undefined, b : '1' };
 * wTools.sureMapHasNoUndefine( map, '"map"', () => 'should have ' + 'no undefines, but has :' );
 *
 * // caught <anonymous>:2:8
 * // "map" should have no undefines, but has : a
 * //
 * // at _err (file:///.../wTools/staging/Base.s:3707)
 * // at sureMapHasNoUndefine (file:///.../wTools/staging/Base.s:4087)
 * // at <anonymous>:2
 *
 * @function sureMapHasNoUndefine
 * @throws {Exception} If no arguments passed or than three arguments passed.
 * @throws {Exception} If map {-srcMap-} contains undefined property.
 * @memberof wTools
 *
 */ ,
      sureMapHasNoUndefine: function sureMapHasNoUndefine(t, n) {
        e.assert(1 === arguments.length || 2 === arguments.length || 3 === arguments.length, "Expects one, two or three arguments");
        let s = [];
        for (let e in t) void 0 === t[e] && s.push(e);
        if (s.length > 0) {
          debugger;
          if (1 === arguments.length) throw e._err({
            args: [ e.strType(t) + " should have no undefines, but has :", e.strQuote(s).join(", ") ],
            level: 2
          });
          {
            let t = [];
            for (let n = 1; n < arguments.length; n++) e.routineIs(arguments[n]) && (arguments[n] = arguments[n]()), 
            t[n] = arguments[n];
            throw e._err({
              args: [ t.join(" "), e.strQuote(s).join(", ") ],
              level: 2
            });
          }
        }
        return !0;
      }
      // --
      // map assert
      // --
      ,
      // map assert
      assertMapHasFields: function assertMapHasFields(t, n, s) {
        return e.sureMapHasExactly.apply(this, arguments);
      }
      //
      ,
      assertMapOwnFields: function assertMapOwnFields(t, n, s) {
        return e.sureMapOwnExactly.apply(this, arguments);
      }
      //
      /**
 * Checks if map passed by argument {-srcMap-} has only properties represented in object(s) passed after first argument. Checks all enumerable properties.
 * Works only in debug mode. Uses StackTrace level 2. {@link wTools.err See err}
 * If routine found some unique properties in source it generates and throws exception, otherwise returns without exception.
 * Also generates error using message passed after second argument. Message may be a string, an array, or a function.
 *
 * @param { Object } srcMap - source map.
 * @param { Object } screenMaps - object to compare with.
 * @param { * } [ msg ] - error message for generated exception.
 * @param { * } [ msg ] - error message that adds to the message in third argument.
 *
 * @example
 * let a = { a : 1, b : 3 };
 * let b = { a : 2, b : 3 };
 * wTools.assertMapHasOnly( a, b );
 *
 * //no exception
 *
 * @example
 * let a = { a : 1, c : 3 };
 * let b = { a : 2, b : 3 };
 * wTools.assertMapHasOnly( a, b );
 *
 * // caught <anonymous>:3:8
 * // Object should have no fields : c
 * //
 * // at _err (file:///.../wTools/staging/Base.s:3707)
 * // at assertMapHasOnly (file:///.../wTools/staging/Base.s:4188)
 * // at <anonymous>:3
 *
 * @example
 * let x = { d : 1 };
 * let a = Object.create( x );
 * let b = { a : 1 };
 * wTools.assertMapHasOnly( a, b, 'map should have no fields :' )
 *
 * // caught <anonymous>:4:8
 * // map should have no fields : d
 * //
 * // at _err (file:///.../wTools/staging/Base.s:3707)
 * // at assertMapHasOnly (file:///.../wTools/staging/Base.s:4188)
 * // at <anonymous>:4
 *
 * @example
 * let x = { d : 1 };
 * let a = Object.create( x );
 * let b = { a : 1 };
 * wTools.assertMapHasOnly( a, b, 'map', () => ' should' + ' have no fields :' )
 *
 * // caught <anonymous>:4:8
 * // map should have no fields : d
 * //
 * // at _err (file:///.../wTools/staging/Base.s:3707)
 * // at assertMapHasOnly (file:///.../wTools/staging/Base.s:4188)
 * // at <anonymous>:4
 *
 * @function assertMapHasOnly
 * @throws {Exception} If no arguments provided or more than four arguments passed.
 * @throws {Exception} If map {-srcMap-} contains unique property.
 * @memberof wTools
 *
 */ ,
      assertMapHasOnly: function assertMapHasOnly(t, n, s) {
        return e.sureMapHasOnly.apply(this, arguments);
      }
      //
      /**
 * Checks if map passed by argument {-srcMap-} has only properties represented in object(s) passed after first argument. Checks only own properties of the objects.
 * Works only in debug mode. Uses StackTrace level 2.{@link wTools.err See err}
 * If routine found some unique properties in source it generates and throws exception, otherwise returns without exception.
 * Also generates error using message passed after second argument. Message may be a string, an array, or a function.
 *
 * @param { Object } srcMap - source map.
 * @param { Object } screenMaps - object to compare with.
 * @param { * } [ msg ] - error message for generated exception.
 * @param { * } [ msg ] - error message that adds to the message in third argument.
 *
 * @example
 * let x = { d : 1 };
 * let a = Object.create( x );
 * a.a = 5;
 * let b = { a : 2 };
 * wTools.assertMapOwnOnly( a, b );
 *
 * //no exception
 *
 * @example
 * let a = { d : 1 };
 * let b = { a : 2 };
 * wTools.assertMapOwnOnly( a, b );
 *
 * // caught <anonymous>:3:10
 * // Object should have no own fields : d
 * //
 * // at _err (file:///.../wTools/staging/Base.s:3707)
 * // at assertMapOwnOnly (file:///.../wTools/staging/Base.s:4215)
 * // at <anonymous>:3
 *
 * @example
 * let a = { x : 0, y : 2 };
 * let b = { c : 0, d : 3};
 * let c = { a : 1 };
 * wTools.assertMapOwnOnly( a, b, 'error, map should have no own fields :' );
 *
 * // caught <anonymous>:4:8
 * // error, map should have no own fields : x, y
 * //
 * // at _err (file:///.../wTools/staging/Base.s:3707)
 * // at assertMapOwnOnly (file:///.../wTools/staging/Base.s:4215)
 * // at <anonymous>:4
 *
 * @example
 * let a = { x : 0, y : 2 };
 * let b = { c : 0, d : 3};
 * let c = { a : 1 };
 * wTools.assertMapOwnOnly( a, b, () => 'error, ' + 'map', ' should have no own fields :' );
 *
 * // caught <anonymous>:4:8
 * // error, map should have no own fields : x, y
 * //
 * // at _err (file:///.../wTools/staging/Base.s:3707)
 * // at assertMapOwnOnly (file:///.../wTools/staging/Base.s:4215)
 * // at <anonymous>:4
 *
 * @function assertMapOwnOnly
 * @throws {Exception} If no arguments provided or more than four arguments passed.
 * @throws {Exception} If map {-srcMap-} contains unique property.
 * @memberof wTools
 *
 */ ,
      assertMapOwnOnly: function assertMapOwnOnly(t, n, s) {
        return e.sureMapOwnOnly.apply(this, arguments);
      }
      //
      /**
 * Checks if map passed by argument {-srcMap-} has no properties represented in object(s) passed after first argument. Checks all enumerable properties.
 * Works only in debug mode. Uses StackTrace level 2. {@link wTools.err See err}
 * If routine found some properties in source it generates and throws exception, otherwise returns without exception.
 * Also generates error using message passed after second argument. Message may be a string, an array, or a function.
 *
 * @param { Object } srcMap - source map.
 * @param { Object } screenMaps - object to compare with.
 * @param { * } [ msg ] - error message for generated exception.
 * @param { * } [ msg ] - error message that adds to the message in third argument.
 *
 * @example
 * let a = { a : 1 };
 * let b = { b : 2 };
 * wTools.assertMapHasNone( a, b );
 *
 * // no exception
 *
 * @example
 * let x = { a : 1 };
 * let a = Object.create( x );
 * let b = { a : 2, b : 2 }
 * wTools.assertMapHasNone( a, b );
 *
 * // caught <anonymous>:4:8
 * // Object should have no fields : a
 * //
 * // at _err (file:///.../wTools/staging/Base.s:3707)
 * // at assertMapHasAll (file:///.../wTools/staging/Base.s:4518)
 * // at <anonymous>:4
 *
 * @example
 * let a = { x : 0, y : 1 };
 * let b = { x : 1, y : 0 };
 * wTools.assertMapHasNone( a, b, 'map should have no fields :' );
 *
 * // caught <anonymous>:3:9
 * // map should have no fields : x, y
 * //
 * // at _err (file:///.../wTools/staging/Base.s:3707)
 * // at assertMapHasNone (file:///.../wTools/staging/Base.s:4518)
 * // at <anonymous>:3
 *
 * @example
 * let a = { x : 0, y : 1 };
 * let b = { x : 1, y : 0 };
 * wTools.assertMapHasNone( a, b, () => 'map ' + 'should ', 'have no fields :' );
 *
 * // caught <anonymous>:3:9
 * // map should have no fields : x, y
 * //
 * // at _err (file:///.../wTools/staging/Base.s:3707)
 * // at assertMapHasNone (file:///.../wTools/staging/Base.s:4518)
 * // at <anonymous>:3
 *
 * @function assertMapHasNone
 * @throws {Exception} If no arguments provided or more than four arguments passed.
 * @throws {Exception} If map {-srcMap-} contains some properties from other map(s).
 * @memberof wTools
 *
 */ ,
      assertMapHasNone: function assertMapHasNone(t, n, s) {
        return e.sureMapHasNone.apply(this, arguments);
      }
      //
      ,
      assertMapOwnNone: function assertMapOwnNone(t, n, s) {
        return e.sureMapOwnNone.apply(this, arguments);
      }
      //
      /**
 * Checks if map passed by argument {-srcMap-} has all properties represented in object passed by argument( all ). Checks all enumerable properties.
 * Works only in debug mode. Uses StackTrace level 2.{@link wTools.err See err}
 * If routine did not find some properties in source it generates and throws exception, otherwise returns without exception.
 * Also generates error using message passed after second argument. Message may be a string, an array, or a function.
 *
 * @param { Object } srcMap - source map.
 * @param { Object } all - object to compare with.
 * @param { * } [ msg ] - error message for generated exception.
 * @param { * } [ msg ] - error message that adds to the message in third argument.
 *
 * @example
 * let x = { a : 1 };
 * let a = Object.create( x );
 * let b = { a : 2 };
 * wTools.assertMapHasAll( a, b );
 *
 * // no exception
 *
 * @example
 * let a = { d : 1 };
 * let b = { a : 2 };
 * wTools.assertMapHasAll( a, b );
 *
 * // caught <anonymous>:3:10
 * // Object should have fields : a
 * //
 * // at _err (file:///.../wTools/staging/Base.s:3707)
 * // at assertMapHasAll (file:///.../wTools/staging/Base.s:4242)
 * // at <anonymous>:3
 *
 * @example
 * let a = { x : 0, y : 2 };
 * let b = { x : 0, d : 3};
 * wTools.assertMapHasAll( a, b, 'map should have fields :' );
 *
 * // caught <anonymous>:4:9
 * // map should have fields : d
 * //
 * // at _err (file:///.../wTools/staging/Base.s:3707)
 * // at assertMapHasAll (file:///.../wTools/staging/Base.s:4242)
 * // at <anonymous>:3
 *
 * @example
 * let a = { x : 0, y : 2 };
 * let b = { x : 0, d : 3};
 * wTools.assertMapHasAll( a, b, () => 'map' + ' should', ' have fields :' );
 *
 * // caught <anonymous>:4:9
 * // map should have fields : d
 * //
 * // at _err (file:///.../wTools/staging/Base.s:3707)
 * // at assertMapHasAll (file:///.../wTools/staging/Base.s:4242)
 * // at <anonymous>:3
 *
 * @function assertMapHasAll
 * @throws {Exception} If no arguments provided or more than four arguments passed.
 * @throws {Exception} If map {-srcMap-} not contains some properties from argument( all ).
 * @memberof wTools
 *
 */ ,
      assertMapHasAll: function assertMapHasAll(t, n, s) {
        return e.sureMapHasAll.apply(this, arguments);
      }
      //
      /**
 * Checks if map passed by argument {-srcMap-} has all properties represented in object passed by argument( all ). Checks only own properties of the objects.
 * Works only in Config.debug mode. Uses StackTrace level 2. {@link wTools.err See err}
 * If routine did not find some properties in source it generates and throws exception, otherwise returns without exception.
 * Also generates error using message passed after second argument. Message may be a string, an array, or a function.
 *
 * @param { Object } srcMap - source map.
 * @param { Object } all - object to compare with.
 * @param { * } [ msg ] - error message for generated exception.
 * @param { * } [ msg ] - error message that adds to the message in third argument.
 *
 * @example
 * let a = { a : 1 };
 * let b = { a : 2 };
 * wTools.assertMapOwnAll( a, b );
 *
 * // no exception
 *
 * @example
 * let a = { a : 1 };
 * let b = { a : 2, b : 2 }
 * wTools.assertMapOwnAll( a, b );
 *
 * // caught <anonymous>:3:8
 * // Object should own fields : b
 * //
 * // at _err (file:///.../wTools/staging/Base.s:3707)
 * // at assertMapHasAll (file:///.../wTools/staging/Base.s:4269)
 * // at <anonymous>:3
 *
 * @example
 * let a = { x : 0 };
 * let b = { x : 1, y : 0};
 * wTools.assertMapOwnAll( a, b, 'error msg, map should own fields :' );
 *
 * // caught <anonymous>:4:9
 * // error msg, map should own fields : y
 * //
 * // at _err (file:///.../wTools/staging/Base.s:3707)
 * // at assertMapOwnAll (file:///.../wTools/staging/Base.s:4269)
 * // at <anonymous>:3
 *
 * @example
 * let a = { x : 0 };
 * let b = { x : 1, y : 0};
 * wTools.assertMapOwnAll( a, b, 'error msg, ', () => 'map' + ' should own fields :' );
 *
 * // caught <anonymous>:4:9
 * // error msg, map should own fields : y
 * //
 * // at _err (file:///.../wTools/staging/Base.s:3707)
 * // at assertMapOwnAll (file:///.../wTools/staging/Base.s:4269)
 * // at <anonymous>:3
 *
 * @function assertMapOwnAll
 * @throws {Exception} If no arguments passed or more than four arguments passed.
 * @throws {Exception} If map {-srcMap-} not contains some properties from argument( all ).
 * @memberof wTools
 *
 */ ,
      assertMapOwnAll: function assertMapOwnAll(t, n, s) {
        return e.sureMapOwnAll.apply(this, arguments);
      }
      //
      /**
 * Checks if map passed by argument {-srcMap-} not contains undefined properties. Works only in debug mode. Uses StackTrace level 2. {@link wTools.err See err}
 * If routine found undefined property it generates and throws exception, otherwise returns without exception.
 * Also generates error using messages passed after first argument. Message may be a string, an array, or a function.
 *
 * @param { Object } srcMap - source map.
 * @param { * } [ msg ] - error message for generated exception.
 * @param { * } [ msg ] - error message that adds to the message in second argument.
 *
 * @example
 * let map = { a : '1', b : 'name' };
 * wTools.assertMapHasNoUndefine( map );
 *
 * // no exception
 *
 * @example
 * let map = { a : '1', b : undefined };
 * wTools.assertMapHasNoUndefine( map );
 *
 * // caught <anonymous>:2:8
 * // Object should have no undefines, but has : b
 * //
 * // at _err (file:///.../wTools/staging/Base.s:3707)
 * // at assertMapHasNoUndefine (file:///.../wTools/staging/Base.s:4087)
 * // at <anonymous>:2
 *
 * @example
 * let map = { a : undefined, b : '1' };
 * wTools.assertMapHasNoUndefine( map, '"map" has undefines :');
 *
 * // caught <anonymous>:2:8
 * // "map" has undefines : a
 * //
 * // at _err (file:///.../wTools/staging/Base.s:3707)
 * // at assertMapHasNoUndefine (file:///.../wTools/staging/Base.s:4087)
 * // at <anonymous>:2
 *
 * @example
 * let map = { a : undefined, b : '1' };
 * wTools.assertMapHasNoUndefine( map, 'map', () => ' has ' + 'undefines :');
 *
 * // caught <anonymous>:2:8
 * // map has undefines : a
 * //
 * // at _err (file:///.../wTools/staging/Base.s:3707)
 * // at assertMapHasNoUndefine (file:///.../wTools/staging/Base.s:4087)
 * // at <anonymous>:2
 *
 * @function assertMapHasNoUndefine
 * @throws {Exception} If no arguments provided or more than three arguments passed.
 * @throws {Exception} If map {-srcMap-} contains undefined property.
 * @memberof wTools
 *
 */ ,
      assertMapHasNoUndefine: function assertMapHasNoUndefine(t, n) {
        return e.sureMapHasNoUndefine.apply(this, arguments);
      }
    };
    // --
    // routines
    // --
        //
    Object.assign(t, s), Object.assign(t, {}), 
    // --
    // export
    // --
    "undefined" != typeof module && null !== module && (module.exports = t);
  }();
  // == end of file fMapS
}();