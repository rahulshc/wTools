!function fStringS() {
  // == begin of file fStringS
  !function _fString_s_() {
    "use strict";
    // let _ArraySlice = Array.prototype.slice;
    // let _FunctionBind = Function.prototype.bind;
    // // let Object.prototype.toString = Object.prototype.toString;
    // let Object.hasOwnProperty = Object.hasOwnProperty;
    // --
    // str
    // --
    /**
 * Function strIs checks incoming param whether it is string.
 * Returns "true" if incoming param is string. Othervise "false" returned
 *
 * @example
 * //returns true
 * strIsIs( 'song' );
 * @example
 * // returns false
 * strIs( 5 );
 *
 * @param {*} src.
 * @return {Boolean}.
 * @function strIs.
 * @memberof wTools
 */
    function strIs(t) {
      return "[object String]" === Object.prototype.toString.call(t);
    }
    //
        //
    function strLike(e) {
      return !!t.strIs(e) || !!t.regexpIs(e);
    }
    //
        // --
    // converter
    // --
    function toStr(e, r) {
      return t.assert(1 === arguments.length || 2 === arguments.length), t.str(e);
    }
    // --
    // decorator
    // --
    function strQuote(e) {
      if (t.mapIs(e) || (e = {
        src: e
      }), void 0 !== e.quote && null !== e.quote || (e.quote = strQuote.defaults.quote), 
      t.assertMapHasOnly(e, strQuote.defaults), t.assert(1 === arguments.length, "Expects single argument"), 
      t.arrayIs(e.src)) {
        let r = [];
        for (let s = 0; s < e.src.length; s++) r.push(t.strQuote({
          src: e.src[s],
          quote: e.quote
        }));
        return r;
      }
      let r = e.src;
      return t.primitiveIs(r) || (r = t.toStr(r)), t.assert(t.primitiveIs(r)), e.quote + String(r) + e.quote;
    }
    // //
    //
    // function _strCutOff_pre( routine, args )
    // {
    //   let o;
    //
    //   if( args.length > 1 )
    //   {
    //     o = { src : args[ 0 ], delimeter : args[ 1 ], number : args[ 2 ] };
    //   }
    //   else
    //   {
    //     o = args[ 0 ];
    //     _.assert( args.length === 1, 'Expects single argument' );
    //   }
    //
    //   _.routineOptions( routine, o );
    //   _.assert( args.length === 1 || args.length === 2 || args.length === 3 );
    //   _.assert( arguments.length === 2, 'Expects exactly two arguments' );
    //   _.assert( _.strIs( o.src ) );
    //   _.assert( _.strIs( o.delimeter ) || _.arrayIs( o.delimeter ) );
    //
    //   return o;
    // }
    //
    function strEquivalent(e, r) {
      let s = t.strIs(e), n = t.strIs(r);
      if (t.assert(2 === arguments.length, "Expects exactly two arguments"), !s && n) return t.strEquivalent(r, e);
      if (t.assert(t.strLike(e), "Expects string-like ( string or regexp )"), t.assert(t.strLike(e), "Expects string-like ( string or regexp )"), 
      s && n) return e === r;
      if (s) {
        debugger;
        let t = r.exec(e);
        debugger;
        return !!t && t[0].length === e.length;
      }
      return t.regexpIdentical(e, r);
    }
    //
        _global_;
    let t = _global_.wTools, e = _global_.wTools;
    toStr.fields = toStr, toStr.routines = toStr, strQuote.defaults = {
      src: null,
      quote: '"'
    };
    // --
    // fields
    // --
    let r = {
      strIs: strIs,
      strsAreAll: function strsAreAll(e) {
        if (t.assert(1 === arguments.length), t.arrayLike(e)) {
          for (let r = 0; r < e.length; r++) if (!t.strIs(e[r])) return !1;
          return !0;
        }
        return strIs(e);
      },
      strLike: strLike,
      strsLikeAll: function strsLikeAll(e) {
        if (t.assert(1 === arguments.length), t.arrayLike(e)) {
          for (let r = 0; r < e.length; r++) if (!t.strLike(e[r])) return !1;
          return !0;
        }
        return strLike(e);
      }
      //
      ,
      strDefined: function strDefined(t) {
        return !!t && "[object String]" === Object.prototype.toString.call(t);
      }
      //
      ,
      strsAreNotEmpty: function strsAreNotEmpty(e) {
        if (t.arrayLike(e)) {
          for (let r = 0; r < e.length; r++) if (!t.strDefined(e[r])) return !1;
          return !0;
        }
        return !1;
      },
      // converter
      toStr: toStr,
      toStrShort: toStr,
      strFrom: toStr,
      str: 
      //
      /**
  * Return in one string value of all arguments.
  * @example
   let args = _.str( 'test2' );
  * @return {string}
  * If no arguments return empty string
  * @function str
  * @memberof wTools
  */
      function str() {
        let e, r = "";
        if (!arguments.length) return r;
        for (let s = 0; s < arguments.length; s++) {
          let n = arguments[s];
          if (n && n.toStr && !Object.hasOwnProperty.call(n, "constructor")) e = n.toStr(); else try {
            e = String(n);
          } catch (r) {
            e = t.strType(n);
          }
          r += e + " ";
        }
        return r;
      }
      //
      ,
      strShort: function strShort(e) {
        let r = "";
        t.assert(1 === arguments.length, "Expects exactly one argument");
        try {
          if (t.primitiveIs(e)) return String(e);
          t.vectorIs(e) ? r += "[ Vector with " + e.length + " elements ]" : e && !t.objectIs(e) && t.numberIs(e.length) ? r += "[ " + t.strType(e) + " with " + e.length + " elements ]" : t.objectIs(e) || t.objectLike(e) ? r += "[ " + t.strType(e) + " with " + t.entityLength(e) + " elements ]" : e instanceof Date ? r += e.toISOString() : r += String(e);
        } catch (t) {
          throw t;
        }
        return r;
      }
      //
      ,
      strPrimitive: function strPrimitive(e) {
        if (t.assert(1 === arguments.length, "Expects exactly one argument"), null !== e && void 0 !== e) return t.primitiveIs(e) ? String(e) : void 0;
      }
      //
      /**
  * Return type of src.
  * @example
      let str = _.strType( 'testing' );
  * @param {*} src
  * @return {string}
  * string name of type src
  * @function strType
  * @memberof wTools
  */ ,
      strType: function strType(e) {
        if (t.assert(1 === arguments.length, "Expects single argument"), !t.primitiveIs(e) && e.constructor && e.constructor.name) return e.constructor.name;
        let r = t.strPrimitiveType(e);
        return "Object" === r && (null === Object.getPrototypeOf(e) ? r = "Map:Pure" : e.__proto__ !== Object.__proto__ && (r = "Object:Special")), 
        r;
      }
      //
      /**
  * Return primitive type of src.
  * @example
      let str = _.strPrimitiveType( 'testing' );
  * @param {*} src
  * @return {string}
  * string name of type src
  * @function strPrimitiveType
  * @memberof wTools
  */ ,
      strPrimitiveType: function strPrimitiveType(e) {
        let r = Object.prototype.toString.call(e), s = /\[(\w+) (\w+)\]/.exec(r);
        if (!s) throw t.err("strType :", "unknown type", r);
        return s[2];
      },
      // decorator
      strQuote: strQuote,
      //
      _strLeftSingle: 
      // --
      //
      // --
      function _strLeftSingle(e, r, s, n) {
        t.assert(2 === arguments.length || 3 === arguments.length || 4 === arguments.length), 
        t.assert(t.strIs(e)), t.assert(void 0 === s || t.numberIs(s)), t.assert(void 0 === n || t.numberIs(n)), 
        r = t.arrayAs(r);
        let i = e.length, g = Object.create(null);
        g.index = i, g.entry = void 0, void 0 === s && void 0 === n || (void 0 === s && (s = 0), 
        void 0 === n && (n = e.length), s < 0 && (s = e.length + s), n < 0 && (n = e.length + n), 
        t.assert(0 <= s && s <= e.length), t.assert(0 <= n && n <= e.length), e = e.substring(s, n));
        for (let s = 0, n = r.length; s < n; s++) {
          let n = r[s];
          if (t.strIs(n)) {
            let t = e.indexOf(n);
            t >= 0 && (t < g.index || void 0 === g.entry) && (g.index = t, g.entry = n);
          } else if (t.regexpIs(n)) {
            let t = e.match(n);
            t && (t.index < g.index || void 0 === g.entry) && (g.index = t.index, g.entry = t[0]);
          } else t.assert(0, "Expects string-like ( string or regexp )");
        }
        return void 0 !== s && g.index !== i && (g.index += s), g;
      }
      //
      ,
      strLeft: function strLeft(e, r, s, n) {
        if (t.assert(2 === arguments.length || 3 === arguments.length || 4 === arguments.length), 
        t.arrayLike(e)) {
          let i = [];
          for (let g = 0; g < e.length; g++) i[g] = t._strLeftSingle(e[g], r, s, n);
          return i;
        }
        return t._strLeftSingle(e, r, s, n);
      }
      //
      /*

(bb)(?!(?=.).*(?:bb))
aaa_bbb_|bb|b_ccc_ccc

.*(bb)
aaa_bbb_b|bb|_ccc_ccc

(b+)(?!(?=.).*(?:b+))
aaa_bbb_|bbb|_ccc_ccc

.*(b+)
aaa_bbb_bb|b|_ccc_ccc

*/ ,
      _strRightSingle: function _strRightSingle(e, r, s, n) {
        t.assert(2 === arguments.length || 3 === arguments.length || 4 === arguments.length), 
        t.assert(t.strIs(e)), t.assert(void 0 === s || t.numberIs(s)), t.assert(void 0 === n || t.numberIs(n)), 
        r = t.arrayAs(r), e.length;
        let i = Object.create(null);
        i.index = -1, i.entry = void 0, void 0 === s && void 0 === n || (void 0 === s && (s = 0), 
        void 0 === n && (n = e.length), s < 0 && (s = e.length + s), n < 0 && (n = e.length + n), 
        t.assert(0 <= s && s <= e.length), t.assert(0 <= n && n <= e.length), e = e.substring(s, n));
        for (let s = 0, n = r.length; s < n; s++) {
          let n = r[s];
          if (t.strIs(n)) {
            let t = e.lastIndexOf(n);
            t >= 0 && t > i.index && (i.index = t, i.entry = n);
          } else if (t.regexpIs(n)) {
            // entry = _.regexpsJoin([ entry, '(?!(?=.).*(?:))' ]);
            // debugger;
            let r = t.regexpsJoin([ ".*", "(", n, ")" ]), s = e.match(r);
 // xxx
                        if (!s) continue;
            let g, l = t.regexpsJoin([ n, "(?!(?=.).*", n, ")" ]), o = e.match(l);
            t.assert(!!o);
            let u, a = s[1], c = o[0], f = s.index + s[0].length, x = o.index + o[0].length;
            if (f === x) if (a.length < c.length) {
              debugger;
              u = x - (g = c).length;
            } else u = f - (g = a).length; else if (f < x) u = x - (g = c).length; else {
              debugger;
              u = f - (g = a).length;
            }
            u > i.index && (i.index = u, i.entry = g);
          } else t.assert(0, "Expects string-like ( string or regexp )");
        }
        return void 0 !== s && -1 !== i.index && (i.index += s), i;
      }
      //
      ,
      strRight: function strRight(e, r, s, n) {
        if (t.assert(2 === arguments.length || 3 === arguments.length || 4 === arguments.length), 
        t.arrayLike(e)) {
          let i = [];
          for (let g = 0; g < e.length; g++) i[g] = t._strRightSingle(e[g], r, s, n);
          return i;
        }
        return t._strRightSingle(e, r, s, n);
      },
      strEquivalent: strEquivalent,
      strsEquivalent: t.vectorize(strEquivalent, 2),
      strsEquivalentAll: t.vectorizeAll(strEquivalent, 2),
      strsEquivalentAny: t.vectorizeAny(strEquivalent, 2),
      strsEquivalentNone: t.vectorizeNone(strEquivalent, 2),
      _strBeginOf: 
      //
      function _strBeginOf(e, r) {
        if (t.assert(t.strIs(e), "Expects string"), t.assert(2 === arguments.length, "Expects exactly two arguments"), 
        t.strIs(r)) {
          if (0 === e.lastIndexOf(r, 0)) return r;
        } else if (t.regexpIs(r)) {
          let t = r.exec(e);
          if (t && 0 === t.index) return t[0];
        } else t.assert(0, "Expects string-like ( string or regexp )");
        return !1;
      }
      //
      ,
      _strEndOf: function _strEndOf(e, r) {
        if (t.assert(t.strIs(e), "Expects string"), t.assert(2 === arguments.length, "Expects exactly two arguments"), 
        t.strIs(r)) {
          if (-1 !== e.indexOf(r, e.length - r.length)) return r;
        } else if (t.regexpIs(r)) {
          // let matched = end.exec( src );
          let t = RegExp(r.toString().slice(1, -1) + "$").exec(e);
          debugger;
          //if( matched && matched.index === 0 )
                    if (t && t.index + t[0].length === e.length) return t[0];
        } else t.assert(0, "Expects string-like ( string or regexp )");
        return !1;
      }
      //
      /**
  * Compares two strings.
  * @param { String } src - Source string.
  * @param { String } begin - String to find at begin of source.
  *
  * @example
  * let scr = _.strBegins( "abc", "a" );
  * // returns true
  *
  * @example
  * let scr = _.strBegins( "abc", "b" );
  * // returns false
  *
  * @returns { Boolean } Returns true if param( begin ) is match with first chars of param( src ), otherwise returns false.
  * @function strBegins
  * @throws { Exception } If one of arguments is not a String.
  * @throws { Exception } If( arguments.length ) is not equal 2.
  * @memberof wTools
  */ ,
      strBegins: function strBegins(e, r) {
        if (t.assert(t.strIs(e), "Expects string {-src-}"), t.assert(t.strIs(r) || t.regexpIs(r) || t.longIs(r), "Expects string/regexp or array of strings/regexps {-begin-}"), 
        t.assert(2 === arguments.length, "Expects exactly two arguments"), !t.longIs(r)) {
          let s = t._strBeginOf(e, r);
          return !1 !== s || s;
        }
        for (let s = 0, n = r.length; s < n; s++) if (!1 !== t._strBeginOf(e, r[s])) return !0;
        return !1;
      }
      //
      /**
  * Compares two strings.
  * @param { String } src - Source string.
  * @param { String } end - String to find at end of source.
  *
  * @example
  * let scr = _.strEnds( "abc", "c" );
  * // returns true
  *
  * @example
  * let scr = _.strEnds( "abc", "b" );
  * // returns false
  *
  * @return { Boolean } Returns true if param( end ) is match with last chars of param( src ), otherwise returns false.
  * @function strEnds
  * @throws { Exception } If one of arguments is not a String.
  * @throws { Exception } If( arguments.length ) is not equal 2.
  * @memberof wTools
  */ ,
      strEnds: function strEnds(e, r) {
        if (t.assert(t.strIs(e), "Expects string {-src-}"), t.assert(t.strIs(r) || t.regexpIs(r) || t.longIs(r), "Expects string/regexp or array of strings/regexps {-end-}"), 
        t.assert(2 === arguments.length, "Expects exactly two arguments"), !t.longIs(r)) {
          let s = t._strEndOf(e, r);
          return !1 !== s || s;
        }
        for (let s = 0, n = r.length; s < n; s++) if (!1 !== t._strEndOf(e, r[s])) return !0;
        return !1;
      }
      //
      /**
  * Finds occurrence of( end ) at the end of source( src ) and removes it if exists.
  * Returns begin part of a source string if occurrence was finded or empty string if arguments are equal, otherwise returns undefined.
  *
  * @param { String } src - The source string.
  * @param { String } end - String to find.
  *
  * @example
  * _.strBeginOf( 'abc', 'c' );
  * //returns 'ab'
  *
  * @example
  * _.strBeginOf( 'abc', 'x' );
  * //returns undefined
  *
  * @returns { String } Returns part of source string without tail( end ) or undefined.
  * @throws { Exception } If all arguments are not strings;
  * @throws { Exception } If ( argumets.length ) is not equal 2.
  * @function strBeginOf
  * @memberof wTools
  */ ,
      strBeginOf: function strBeginOf(e, r) {
        if (t.assert(t.strIs(e), "Expects string {-src-}"), t.assert(t.strIs(r) || t.regexpIs(r) || t.longIs(r), "Expects string/regexp or array of strings/regexps {-begin-}"), 
        t.assert(2 === arguments.length, "Expects exactly two arguments"), !t.longIs(r)) {
          let s = t._strBeginOf(e, r);
          if (s) debugger;
          return s;
        }
        debugger;
        for (let s = 0, n = r.length; s < n; s++) {
          let n = t._strBeginOf(e, r[s]);
          if (!1 !== n) return n;
        }
        return !1;
      }
      //
      /**
  * Finds occurrence of( begin ) at the begining of source( src ) and removes it if exists.
  * Returns end part of a source string if occurrence was finded or empty string if arguments are equal, otherwise returns undefined.
  * otherwise returns undefined.
  *
  * @param { String } src - The source string.
  * @param { String } begin - String to find.
  *
  * @example
  * _.strEndOf( 'abc', 'a' );
  * //returns 'bc'
  *
  * @example
  * _.strEndOf( 'abc', 'c' );
  * //returns undefined
  *
  * @returns { String } Returns part of source string without head( begin ) or undefined.
  * @throws { Exception } If all arguments are not strings;
  * @throws { Exception } If ( argumets.length ) is not equal 2.
  * @function strEndOf
  * @memberof wTools
  */ ,
      strEndOf: function strEndOf(e, r) {
        t.assert(t.strIs(e), "Expects string {-src-}"), t.assert(t.strIs(r) || t.regexpIs(r) || t.longIs(r), "Expects string/regexp or array of strings/regexps {-end-}"), 
        t.assert(2 === arguments.length, "Expects exactly two arguments");
        debugger;
        if (!t.longIs(r)) return t._strEndOf(e, r);
        for (let s = 0, n = r.length; s < n; s++) {
          let n = t._strEndOf(e, r[s]);
          if (!1 !== n) return n;
        }
        return !1;
      }
      //
      /**
  * Returns part of a source string( src ) between first occurrence of( begin ) and last occurrence of( end ).
  * Returns result if ( begin ) and ( end ) exists in source( src ) and index of( end ) is bigger the index of( begin ).
  * Otherwise returns undefined.
  *
  * @param { String } src - The source string.
  * @param { String } begin - String to find from begin of source.
  * @param { String } end - String to find from end source.
  *
  * @example
  * _.strInsideOf( 'abcd', 'a', 'd' );
  * //returns 'bc'
  *
  * @example
  * _.strInsideOf( 'aabcc', 'a', 'c' );
  * //returns 'aabcc'
  *
  * @example
  * _.strInsideOf( 'aabcc', 'a', 'a' );
  * //returns 'a'
  *
  * @example
  * _.strInsideOf( 'abc', 'a', 'a' );
  * //returns undefined
  *
  * @example
  * _.strInsideOf( 'abcd', 'x', 'y' )
  * //returns undefined
  *
  * @example
  * //index of begin is bigger then index of end
  * _.strInsideOf( 'abcd', 'c', 'a' )
  * //returns undefined
  *
  * @returns { string } Returns part of source string between ( begin ) and ( end ) or undefined.
  * @throws { Exception } If all arguments are not strings;
  * @throws { Exception } If ( argumets.length ) is not equal 3.
  * @function strInsideOf
  * @memberof wTools
  */ ,
      strInsideOf: function strInsideOf(e, r, s) {
        let n, i;
        if (t.assert(t.strIs(e), "Expects string {-src-}"), t.assert(3 === arguments.length, "Expects exactly three arguments"), 
        !1 === (n = t.strBeginOf(e, r))) return !1;
        debugger;
        if (!1 === (i = t.strEndOf(e, s))) return !1;
        debugger;
        return e.substring(n.length, e.length - i.length);
      }
      //
      ,
      strOutsideOf: function strOutsideOf(e, r, s) {
        let n, i;
        return t.assert(t.strIs(e), "Expects string {-src-}"), t.assert(3 === arguments.length, "Expects exactly three arguments"), 
        !1 !== (n = t.strBeginOf(e, r)) && !1 !== (i = t.strEndOf(e, s)) && n + i;
      }
      //
      /**
 * Finds substring prefix ( begin ) occurrence from the very begining of source ( src ) and removes it.
 * Returns original string if source( src ) does not have occurrence of ( prefix ).
 *
 * @param { String } src - Source string to parse.
 * @param { String } prefix - String that is to be dropped.
 * @returns { String } Returns string with result of prefix removement.
 *
 * @example
 * //returns mple
 * _.strRemoveBegin( 'example', 'exa' );
 *
 * @example
 * //returns example
 * _.strRemoveBegin( 'example', 'abc' );
 *
 * @function strRemoveBegin
 * @throws { Exception } Throws a exception if( src ) is not a String.
 * @throws { Exception } Throws a exception if( prefix ) is not a String.
 * @throws { Exception } Throws a exception if( arguments.length ) is not equal 2.
 * @memberof wTools
 *
 */ ,
      strRemoveBegin: function strRemoveBegin(e, r) {
        t.assert(2 === arguments.length, "Expects exactly two arguments"), t.assert(t.strIs(e), "Expects string {-src-}"), 
        t.assert(t.strIs(r) || t.regexpIs(r), "Expects string/regexp {-begin-}");
        let s = e, n = t._strBeginOf(s, r);
        return !1 !== n && (s = s.substr(n.length, s.length)), s;
      }
      //
      /**
 * Removes occurrence of postfix ( end ) from the very end of string( src ).
 * Returns original string if no occurrence finded.
 * @param { String } src - Source string to parse.
 * @param { String } postfix - String that is to be dropped.
 * @returns { String } Returns string with result of postfix removement.
 *
 * @example
 * //returns examp
 * _.strRemoveEnd( 'example', 'le' );
 *
 * @example
 * //returns example
 * _.strRemoveEnd( 'example', 'abc' );
 *
 * @function strRemoveEnd
 * @throws { Exception } Throws a exception if( src ) is not a String.
 * @throws { Exception } Throws a exception if( postfix ) is not a String.
 * @throws { Exception } Throws a exception if( arguments.length ) is not equal 2.
 * @memberof wTools
 *
 */ ,
      strRemoveEnd: function strRemoveEnd(e, r) {
        t.assert(2 === arguments.length, "Expects exactly two arguments"), t.assert(t.strIs(e), "Expects string {-src-}"), 
        t.assert(t.strIs(r) || t.regexpIs(r), "Expects string/regexp {-end-}");
        let s = e, n = t._strEndOf(s, r);
        return !1 !== n && (s = s.substr(0, s.length - n.length)), s;
      }
      //
      /**
* Finds substring or regexp ( insStr ) first occurrence from the source string ( srcStr ) and removes it.
* Returns original string if source( src ) does not have occurrence of ( insStr ).
*
* @param { String } srcStr - Source string to parse.
* @param { String } insStr - String/RegExp that is to be dropped.
* @returns { String } Returns string with result of substring removement.
*
* @example
* //returns ource tring
* _.strRemove( 'source string', 's' );
*
* @example
* //returns example
* _.strRemove( 'example', 's' );
*
* @function strRemove
* @throws { Exception } Throws a exception if( srcStr ) is not a String.
* @throws { Exception } Throws a exception if( insStr ) is not a String or a RegExp.
* @throws { Exception } Throws a exception if( arguments.length ) is not equal 2.
* @memberof wTools
*
*/ ,
      strRemove: function strRemove(e, r) {
        t.assert(2 === arguments.length, "expects exactly two arguments"), t.assert(t.strIs(e), "expects string {-src-}"), 
        t.assert(t.strIs(r) || t.regexpIs(r), "expects string/regexp {-begin-}");
        let s = e;
        debugger;
        return s.replace(r, "");
      }
      //
      ,
      strReplaceBegin: function strReplaceBegin(e, r, s) {
        t.assert(3 === arguments.length, "Expects exactly three arguments"), t.assert(t.strIs(s), "Expects {-ins-} as string"), 
        t.assert(t.strIs(e));
        let n = e;
        return t.strBegins(n, r) && (n = s + t.strRemoveBegin(n, r)), n;
      }
      //
      ,
      strReplaceEnd: function strReplaceEnd(e, r, s) {
        t.assert(3 === arguments.length, "Expects exactly three arguments"), t.assert(t.strIs(s), "Expects {-ins-} as string"), 
        t.assert(t.strIs(e));
        let n = e;
        if (t.strEnds(n, r)) {
          let e = s;
          n = t.strRemoveEnd(n, r) + e;
        }
        return n;
      }
      //
      ,
      strReplace: function strReplace(e, r, s) {
        t.assert(3 === arguments.length, "expects exactly three arguments"), t.assert(t.strIs(e), "expects string {-src-}"), 
        t.assert(t.strIs(s), "expects string {-sub-}");
        let n = e;
        debugger;
        return n.replace(r, s);
      }
    };
    // --
    // routines
    // --
        //
    Object.assign(e, r), Object.assign(e, {}), 
    // --
    // export
    // --
    "undefined" != typeof module && null !== module && (module.exports = e);
  }();
  // == end of file fStringS
}();