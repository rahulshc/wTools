!function gRegexpS() {
  // == begin of file gRegexpS
  !function _gRegexp_s_() {
    "use strict";
    // --
    // regexp
    // --
    // function regexpIs( src )
    // {
    //   return _ObjectToString.call( src ) === '[object RegExp]';
    // }
    //
    // //
    //
    // function regexpObjectIs( src )
    // {
    //   if( !_.RegexpObject )
    //   return false;
    //   return src instanceof _.RegexpObject;
    // }
    //
    // //
    //
    // function regexpLike( src )
    // {
    //   if( _.regexpIs( src ) || _.strIs( src ) )
    //   return true;
    //   return false;
    // }
    //
    // //
    //
    // function regexpsLike( srcs )
    // {
    //   if( !_.arrayIs( srcs ) )
    //   return false;
    //   for( let s = 0 ; s < srcs.length ; s++ )
    //   if( !_.regexpLike( srcs[ s ] ) )
    //   return false;
    //   return true;
    // }
    //
    // //
    //
    // function regexpIdentical( src1,src2 )
    // {
    //   _.assert( arguments.length === 2, 'Expects exactly two arguments' );
    //
    //   if( !_.regexpIs( src1 ) || !_.regexpIs( src2 ) )
    //   return false;
    //
    //   return src1.source === src2.source && src1.flags === src2.flags;
    // }
    //
    // //
    //
    // function _regexpTest( regexp, str )
    // {
    //   _.assert( arguments.length === 2 );
    //   _.assert( _.regexpLike( regexp ) );
    //   _.assert( _.strIs( str ) );
    //
    //   if( _.strIs( regexp ) )
    //   return regexp === str;
    //   else
    //   return regexp.test( str );
    //
    // }
    //
    // //
    //
    // function regexpTest( regexp, strs )
    // {
    //   _.assert( arguments.length === 2 );
    //   _.assert( _.regexpLike( regexp ) );
    //
    //   if( _.strIs( strs ) )
    //   return _._regexpTest( regexp, strs );
    //   else if( _.arrayLike( strs ) )
    //   return strs.map( ( str ) => _._regexpTest( regexp, str ) )
    //   else _.assert( 0 );
    //
    // }
    //
    // //
    //
    // function regexpTestAll( regexp, strs )
    // {
    //   _.assert( arguments.length === 2 );
    //   _.assert( _.regexpLike( regexp ) );
    //
    //   if( _.strIs( strs ) )
    //   return _._regexpTest( regexp, strs );
    //   else if( _.arrayLike( strs ) )
    //   return strs.every( ( str ) => _._regexpTest( regexp, str ) )
    //   else _.assert( 0 );
    //
    // }
    //
    // //
    //
    // function regexpTestAny( regexp, strs )
    // {
    //   _.assert( arguments.length === 2 );
    //   _.assert( _.regexpLike( regexp ) );
    //
    //   if( _.strIs( strs ) )
    //   return _._regexpTest( regexp, strs );
    //   else if( _.arrayLike( strs ) )
    //   return strs.some( ( str ) => _._regexpTest( regexp, str ) )
    //   else _.assert( 0 );
    //
    // }
    //
    // //
    //
    // function regexpTestNone( regexp, strs )
    // {
    //   _.assert( arguments.length === 2 );
    //   _.assert( _.regexpLike( regexp ) );
    //
    //   if( _.strIs( strs ) )
    //   return !_._regexpTest( regexp, strs );
    //   else if( _.arrayLike( strs ) )
    //   return !strs.some( ( str ) => _._regexpTest( regexp, str ) )
    //   else _.assert( 0 );
    //
    // }
    //
    // //
    //
    // function regexpsTestAll( regexps, strs )
    // {
    //   _.assert( arguments.length === 2 );
    //
    //   if( !_.arrayIs( regexps ) )
    //   return _.regexpTestAll( regexps, strs );
    //
    //   _.assert( _.regexpsLike( regexps ) );
    //
    //   return regexps.every( ( regexp ) => _.regexpTestAll( regexp, strs ) );
    // }
    //
    // //
    //
    // function regexpsTestAny( regexps, strs )
    // {
    //   _.assert( arguments.length === 2 );
    //
    //   if( !_.arrayIs( regexps ) )
    //   return _.regexpTestAny( regexps, strs );
    //
    //   _.assert( _.regexpsLike( regexps ) );
    //
    //   return regexps.some( ( regexp ) => _.regexpTestAny( regexp, strs ) );
    // }
    //
    // //
    //
    // function regexpsTestNone( regexps, strs )
    // {
    //   _.assert( arguments.length === 2 );
    //
    //   if( !_.arrayIs( regexps ) )
    //   return _.regexpTestNone( regexps, strs );
    //
    //   _.assert( _.regexpsLike( regexps ) );
    //
    //   return regexps.every( ( regexp ) => _.regexpTestNone( regexp, strs ) );
    // }
    //
    /**
 * Escapes special characters with a slash ( \ ). Supports next set of characters : .*+?^=! :${}()|[]/\
 *
 * @example
 * wTools.regexpEscape( 'Hello. How are you?' ); // "Hello\. How are you\?"
 * @param {String} src Regexp string
 * @returns {String} Escaped string
 * @function regexpEscape
 * @memberof wTools
 */
    function regexpEscape(s) {
      return e.assert(e.strIs(s)), e.assert(1 === arguments.length, "Expects single argument"), 
      s.replace(/([.*+?^=!:${}()|\[\]\/\\])/g, "\\$1");
    }
    //
        //
    function regexpMaybeFrom(s) {
      e.objectIs(s) || (s = {
        srcStr: arguments[0]
      }), e.assert(1 === arguments.length, "Expects single argument"), e.assert(e.strIs(s.srcStr) || e.regexpIs(s.srcStr)), 
      e.routineOptions(regexpMaybeFrom, s);
      let r = s.srcStr;
      if (e.strIs(r)) {
        // let optionsExtract =
        // {
        //   prefix : '//',
        //   postfix : '//',
        //   src : result,
        // }
        // let strips = _.strExtractInlinedStereo( optionsExtract );
        if (s.stringWithRegexp) {
          let s = {
            delimeter: "//",
            src: r
          };
          e.strExtractInlined(s);
        }
        for (let r = 0; r < strips.length; r++) {
          let t = strips[r];
          r % 2 == 0 && (t = e.regexpEscape(t), s.toleratingSpaces && (t = t.replace(/\s+/g, "\\s*"))), 
          strips[r] = t;
        }
        r = RegExp(strips.join(""), s.flags);
      }
      return r;
    }
    //
    function regexpsSources(s) {
      e.arrayIs(arguments[0]) && ((s = Object.create(null)).sources = arguments[0]), 
      // o.sources = o.sources ? _.longSlice( o.sources ) : [];
      s.sources = e.longSlice(s.sources), void 0 === s.flags && (s.flags = null), e.assert(1 === arguments.length, "Expects single argument"), 
      e.routineOptions(regexpsSources, s);
      /* */
      for (let r = 0; r < s.sources.length; r++) {
        let t = s.sources[r];
        e.regexpIs(t) ? (s.sources[r] = t.source, e.assert(null === s.flags || t.flags === s.flags, () => "All RegExps should have flags field with the same value " + e.strQuote(t.flags) + " != " + e.strQuote(s.flags)), 
        null === s.flags && (s.flags = t.flags)) : s.escaping && (s.sources[r] = e.regexpEscape(t)), 
        e.assert(e.strIs(s.sources[r]));
      }
      /* */      return s;
    }
    //
    function regexpsJoin(s) {
      e.objectIs(s) || (s = {
        sources: s
      }), e.routineOptions(regexpsJoin, s), e.assert(1 === arguments.length, "Expects single argument");
      let r = s.sources[0];
      if (1 === (s = e.regexpsSources(s)).sources.length && e.regexpIs(r)) return r;
      let t = s.sources.join("");
      return new RegExp(t, s.flags || "");
    }
    //
    function regexpsJoinEscaping(s) {
      return e.objectIs(s) || (s = {
        sources: s
      }), e.routineOptions(regexpsJoinEscaping, s), e.assert(1 === arguments.length, "Expects single argument"), 
      e.assert(!!s.escaping), e.regexpsJoin(s);
    }
    //
    function regexpsAtLeastFirst(s) {
      e.objectIs(s) || (s = {
        sources: s
      }), e.routineOptions(regexpsAtLeastFirst, s), e.assert(1 === arguments.length, "Expects single argument");
      let r = s.sources[0];
      if (1 === (s = e.regexpsSources(s)).sources.length && e.regexpIs(r)) return r;
      let t = "", n = "", g = "";
      for (let e = 0; e < s.sources.length; e++) {
        let r = s.sources[e];
        0 === e ? n += r : (n = n + "(?:" + r, g = ")?" + g);
      }
      return new RegExp(t = n + g, s.flags || "");
    }
    //
    /**
 *  Generates "but" regular expression pattern. Accepts a list of words, which will be used in regexp.
 *  The result regexp matches the strings that do not contain any of those words.
 *
 * @example
 * wTools.regexpsNone( 'yellow', 'red', 'green' ); //   /^(?:(?!yellow|red|green).)+$/
 *
 * let options =
 * {
 *    but : [ 'yellow', 'red', 'green' ],
 *    atLeastOnce : false
 * };
 * wTools.regexpsNone(options); // /^(?:(?!yellow|red|green).)*$/
 *
 * @param {Object} [options] options for generate regexp. If this argument omitted then default options will be used
 * @param {String[]} [options.but=null] a list of words,from each will consist regexp
 * @param {boolean} [options.atLeastOne=true] indicates whether search matches at least once
 * @param {...String} [words] a list of words, from each will consist regexp. This arguments can be used instead
 * options object.
 * @returns {RegExp} Result regexp
 * @throws {Error} If passed arguments are not strings or options object.
 * @throws {Error} If options contains any different from 'but' or 'atLeastOnce' properties.
 * @function regexpsNone
 * @memberof wTools
 */
    function regexpsNone(s) {
      e.objectIs(s) || (s = {
        sources: s
      }), e.routineOptions(regexpsNone, s), e.assert(1 === arguments.length, "Expects single argument");
      /* ^(?:(?!(?:abc)).)+$ */
      let r = "^(?:(?!(?:";
      return r += (s = e.regexpsSources(s)).sources.join(")|(?:"), r += ")).)+$", new RegExp(r, s.flags || "");
    }
    //
    function regexpsAny(s) {
      if (e.objectIs(s) || (s = {
        sources: s
      }), e.routineOptions(regexpsAny, s), e.assert(1 === arguments.length, "Expects single argument"), 
      e.regexpIs(s.sources)) return e.assert(s.sources.flags === s.flags || null === s.flags), 
      s.sources;
      e.assert(!!s.sources);
      let r = s.sources[0];
      if (1 === (s = e.regexpsSources(s)).sources.length && e.regexpIs(r)) return r;
      let t = "(?:";
      return t += s.sources.join(")|(?:"), t += ")", new RegExp(t, s.flags || "");
    }
    //
    function regexpsAll(s) {
      if (e.objectIs(s) || (s = {
        sources: s
      }), e.routineOptions(regexpsAll, s), e.assert(1 === arguments.length, "Expects single argument"), 
      e.regexpIs(s.sources)) return e.assert(s.sources.flags === s.flags || null === s.flags), 
      s.sources;
      let r = s.sources[0];
      if (1 === (s = e.regexpsSources(s)).sources.length && e.regexpIs(r)) return r;
      let t = "";
      return s.sources.length > 0 && (s.sources.length > 1 && (t += "(?=", t += s.sources.slice(0, s.sources.length - 1).join(")(?="), 
      t += ")"), t += "(?:", t += s.sources[s.sources.length - 1], t += ")"), new RegExp(t, s.flags || "");
    }
    //
    /**
 * Wraps regexp(s) into array and returns it. If in `src` passed string - turn it into regexp
 *
 * @example
 * wTools.regexpArrayMake( ['red', 'white', /[a-z]/] ); // [ /red/, /white/, /[a-z]/ ]
 * @param {String[]|String} src - array of strings/regexps or single string/regexp
 * @returns {RegExp[]} Array of regexps
 * @throw {Error} if `src` in not string, regexp, or array
 * @function regexpArrayMake
 * @memberof wTools
 */
    function regexpArrayMake(s) {
      e.assert(e.regexpLike(s) || e.arrayLike(s), "Expects array/regexp/string, got " + e.strType(s));
      for (let r = (s = e.arrayFlatten([], e.arrayAs(s))).length - 1; r >= 0; r--) {
        let t = s[r];
        null !== t ? s[r] = e.regexpFrom(t) : s.splice(r, 1);
      }
      return s;
    }
    //
    /**
 * regexpArrayIndex() returns the index of the first regular expression that matches substring
  Otherwise, it returns -1.
 * @example
 *
   let str = "The RGB color model is an additive color model in which red, green, and blue light are added together in various ways to reproduce a broad array of colors";
   let regArr1 = [/white/, /green/, /blue/];
   wTools.regexpArrayIndex(regArr1, str); // 1

 * @param {RegExp[]} arr Array for regular expressions.
 * @param {String} ins String, inside which will be execute search
 * @returns {number} Index of first matching or -1.
 * @throws {Error} If first argument is not array.
 * @throws {Error} If second argument is not string.
 * @throws {Error} If element of array is not RegExp.
 * @function regexpArrayIndex
 * @memberof wTools
 */    _global_;
    let e = _global_.wTools, s = _global_.wTools;
    Array.prototype.indexOf, Array.prototype.lastIndexOf, Array.prototype.slice, Array.prototype.splice, 
    Function.prototype.bind, Object.prototype.toString, Object.hasOwnProperty, Object.propertyIsEnumerable, 
    Math.ceil, Math.floor, regexpMaybeFrom.defaults = {
      srcStr: null,
      stringWithRegexp: 1,
      toleratingSpaces: 1,
      flags: "g"
    }, regexpsSources.defaults = {
      sources: null,
      flags: null,
      escaping: 0
    }, regexpsJoin.defaults = {
      flags: null,
      sources: null,
      escaping: 0
    }, (regexpsJoinEscaping.defaults = Object.create(regexpsJoin.defaults)).escaping = 1, 
    regexpsAtLeastFirst.defaults = {
      flags: null,
      sources: null,
      escaping: 0
    }, regexpsAtLeastFirst.defaults = {
      flags: null,
      sources: null,
      escaping: 0
    }, regexpsNone.defaults = {
      flags: null,
      sources: null,
      escaping: 0
    }, regexpsAny.defaults = {
      flags: null,
      sources: null,
      escaping: 0
    }, regexpsAll.defaults = {
      flags: null,
      sources: null,
      escaping: 0
    };
    // --
    // fields
    // --
    let r = {
      // regexp
      regexpEscape: regexpEscape,
      regexpsEscape: e.routineVectorize_functor(regexpEscape),
      regexpArrayMake: regexpArrayMake,
      regexpFrom: 
      //
      /**
 * Make regexp from string.
 *
 * @example
 * wTools.regexpFrom( 'Hello. How are you?' ); // /Hello\. How are you\?/
 * @param {RegexpLike} src - string or regexp
 * @returns {String} Regexp
 * @throws {Error} Throw error with message 'unknown type of expression, expects regexp or string, but got' error
 if src not string-like ( string or regexp )
 * @function regexpFrom
 * @memberof wTools
 */
      function regexpFrom(s, r) {
        return e.assert(1 === arguments.length || 2 === arguments.length), e.assert(void 0 === r || e.strIs(r)), 
        e.regexpIs(s) ? s : (e.assert(e.strIs(s)), new RegExp(e.regexpEscape(s), r));
      },
      regexpMaybeFrom: regexpMaybeFrom,
      regexpsMaybeFrom: e.routineVectorize_functor({
        routine: regexpMaybeFrom,
        select: "srcStr"
      }),
      regexpsSources: regexpsSources,
      regexpsJoin: regexpsJoin,
      regexpsJoinEscaping: regexpsJoinEscaping,
      regexpsAtLeastFirst: regexpsAtLeastFirst,
      regexpsAtLeastFirstOnly: 
      //
      function regexpsAtLeastFirstOnly(s) {
        e.objectIs(s) || (s = {
          sources: s
        }), e.routineOptions(regexpsAtLeastFirst, s), e.assert(1 === arguments.length, "Expects single argument");
        let r = s.sources[0];
        if (1 === (s = e.regexpsSources(s)).sources.length && e.regexpIs(r)) return r;
        let t = "";
        if (1 === s.sources.length) t = s.sources[0]; else for (let e = 0; e < s.sources.length; e++) s.sources[e], 
        e < s.sources.length - 1 ? t += "(?:" + s.sources.slice(0, e + 1).join("") + "$)|" : t += "(?:" + s.sources.slice(0, e + 1).join("") + ")";
        return new RegExp(t, s.flags || "");
      },
      regexpsNone: regexpsNone,
      regexpsAny: regexpsAny,
      regexpsAll: regexpsAll,
      regexpArrayMake: regexpArrayMake,
      regexpArrayIndex: function regexpArrayIndex(s, r) {
        e.assert(e.arrayIs(s)), e.assert(e.strIs(r));
        for (let t = 0; t < s.length; t++) {
          let n = s[t];
          if (e.assert(e.regexpIs(n)), n.test(r)) return t;
        }
        return -1;
      }
      //
      /**
 * Checks if any regexp passed in `arr` is found in string `ins`
 * If match was found - returns match index
 * If no matches found and regexp array is not empty - returns false
 * If regexp array is empty - returns some default value passed in the `ifEmpty` input param
 *
 * @example
 * let str = "The RGB color model is an additive color model in which red, green, and blue light are added together in various ways to reproduce a broad array of colors";
 *
 * let regArr2 = [/yellow/, /blue/, /red/];
 * wTools.regexpArrayAny(regArr2, str, false); // 1
 *
 * let regArr3 = [/yellow/, /white/, /greey/]
 * wTools.regexpArrayAny(regArr3, str, false); // false
 * @param {String[]} arr Array of regular expressions strings
 * @param {String} ins - string that is tested by regular expressions passed in `arr` parameter
 * @param {*} none - Default return value if array is empty
 * @returns {*} Returns the first match index, false if input array of regexp was empty or default value otherwise
 * @thows {Error} If missed one of arguments
 * @function regexpArrayAny
 * @memberof wTools
 */ ,
      regexpArrayAny: function regexpArrayAny(s, r, t) {
        e.assert(e.arrayIs(s) || e.regexpIs(src)), e.assert(3 === arguments.length, "Expects exactly three arguments"), 
        s = e.arrayAs(s);
        for (let t = 0; t < s.length; t++) if (e.assert(e.routineIs(s[t].test)), s[t].test(r)) return t;
        return !s.length && t;
      }
      //
      /**
 * Checks if all regexps passed in `arr` are found in string `ins`
 * If any of regex was not found - returns match index
 * If regexp array is not empty and all regexps passed test - returns true
 * If regexp array is empty - returns some default value passed in the `ifEmpty` input param
 *
 * @example
 * let str = "The RGB color model is an additive color model in which red, green, and blue light are added together in various ways to reproduce a broad array of colors";
 *
 * let regArr1 = [/red/, /green/, /blue/];
 * wTools.regexpArrayAll(regArr1, str, false); // true
 *
 * let regArr2 = [/yellow/, /blue/, /red/];
 * wTools.regexpArrayAll(regArr2, str, false); // 0
 * @param {String[]} arr Array of regular expressions strings
 * @param {String} ins - string that is tested by regular expressions passed in `arr` parameter
 * @param {*} none - Default return value if array is empty
 * @returns {*} Returns the first match index, false if input array of regexp was empty or default value otherwise
 * @thows {Error} If missed one of arguments
 * @function regexpArrayAll
 * @memberof wTools
 */ ,
      regexpArrayAll: function regexpArrayAll(s, r, t) {
        e.assert(e.arrayIs(s) || e.regexpIs(src)), e.assert(3 === arguments.length, "Expects exactly three arguments"), 
        s = e.arrayAs(s);
        for (let e = 0; e < s.length; e++) if (!s[e].test(r)) return e;
        return !!s.length || t;
      }
      //
      ,
      regexpArrayNone: function regexpArrayNone(s, r, t) {
        e.assert(e.arrayIs(s) || e.regexpIs(src)), e.assert(3 === arguments.length, "Expects exactly three arguments"), 
        s = e.arrayAs(s);
        for (let t = 0; t < s.length; t++) if (e.assert(e.routineIs(s[t].test)), s[t].test(r)) return !1;
        return !!s.length || t;
      }
    };
    // --
    // routines
    // --
        //
    Object.assign(s, r), Object.assign(s, {}), 
    // --
    // export
    // --
    "undefined" != typeof module && null !== module && (module.exports = s);
  }();
  // == end of file gRegexpS
}();