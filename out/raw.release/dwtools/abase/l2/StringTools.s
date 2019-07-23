!function StringToolsS() {
  // == begin of file StringToolsS
  !function _StringTools_s_() {
    "use strict";
    /*

= articles

- strIsolate* difference

*/
    //
        //
    function strHas(t, s) {
      return e.assert(2 === arguments.length, "Expects exactly two arguments"), e.assert(e.strIs(t)), 
      e.assert(e.strLike(s)), e.strIs(s) ? -1 !== t.indexOf(s) : s.test(t);
    }
    //
        //
    /**
 * Returns source string( src ) with limited number( limit ) of characters.
 * For example: src : 'string', limit : 4, result -> ''st'...'ng''.
 * Function can be called in two ways:
 * - First to pass only source string and limit;
 * - Second to pass all options map. Example: ( { src : 'string', limit : 4, wrap : 0, escaping : 0 } ).
 *
 * @param {string|object} o - String to parse or object with options.
 * @param {string} [ o.src=null ] - Source string.
 * @param {number} [ o.limit=40 ] - Limit of characters in output.
 * @param {string} [ o.wrap='\'' ] - String wrapper. Use zero or false to disable.
 * @param {string} [ o.escaping=1 ] - Escaping characters appears in output.
 * @returns {string} Returns simplified source string.
 *
 * @example
 * //returns ''st' ... 'ng''
 * _.strStrShort( 'string', 4 );
 *
 * @example
 * //returns ''s' ... 'ng''
 * _.strStrShort( 's\ntring', 4 );
 *
 * @example
 * //returns 'string'
 * _.strStrShort( 'string', 0 );
 *
 * @example
 * //returns ''st' ... 'ng''
 * _.strStrShort( { src : 'string', limit : 4, wrap : '\'' } );
 *
 * @example
 * //returns 'si ... le'
 *  _.strStrShort( { src : 'simple', limit : 4, wrap : 0 } );
 *
 * @example
 * //returns ''si' ... 'le''
 *  _.strStrShort( { src : 'si\x01mple', limit : 5, wrap : '\'' } );
 *
 * @example
 * //returns ''s\u0001' ... ' string''
 *  _.strStrShort( 's\x01t\x01ing string string', 14 );
 *
 * @method strStrShort
 * @throws { Exception } If no argument provided.
 * @throws { Exception } If( arguments.length ) is not equal 1 or 2.
 * @throws { Exception } If( o ) is extended with unknown property.
 * @throws { Exception } If( o.src ) is not a String.
 * @throws { Exception } If( o.limit ) is not a Number.
 * @throws { Exception } If( o.wrap ) is not a String.
 *
 * @memberof wTools
 *
 */
    function strStrShort(t) {
      e.assert(1 === arguments.length || 2 === arguments.length), 2 === arguments.length ? t = {
        src: arguments[0],
        limit: arguments[1]
      } : 1 === arguments.length && e.strIs(t) && (t = {
        src: arguments[0]
      }), e.routineOptions(strStrShort, t), e.assert(e.strIs(t.src)), e.assert(e.numberIs(t.limit));
      let s = t.src;
      if (s.length > t.limit && t.limit > 0) {
        let r = Math.ceil(t.limit / 2), n = t.limit - r, i = s.substr(0, r), l = s.slice(-n);
        if (t.escaping) {
          function check(t, s) {
            let r = e.strEscape(t);
            if (r.length > s) for (let n = t.length - 1; n >= 0 && !(r.length <= s); --n) r = r.slice(0, -e.strEscape(t[n]).length);
            return r;
          }
          i = check(i, r), l = check(l, n);
        }
        t.wrap && (e.assert(e.strIs(t.wrap)), i = t.wrap + i + t.wrap, l = t.wrap + l + t.wrap), 
        s = 1 === t.limit ? i : i + " ... " + l;
      } else t.escaping && (s = e.strEscape(s));
      return s;
    }
    //
    /**
 * Disables escaped characters in source string( src ).
 * Example: '\n' -> '\\n', '\u001b' -> '\\u001b' etc.
 * Returns string with disabled escaped characters, source string if nothing changed or  empty string if source is zero length.
 * @param {string} src - Source string.
 * @returns {string} Returns string with disabled escaped characters.
 *
 * @example
 * //returns '\nhello\u001bworld\n'
 * _.strEscape( '\nhello\u001bworld\n' );
 *
 * @example
 * //returns 'string'
 * _.strEscape( 'string' );
 *
 * @example
 * //returns 'str\''
 * _.strEscape( 'str\'' );
 *
 * @example
 * //returns ''
 * _.strEscape( '' );
 *
 * @method strEscape
 * @throw { Exception } If( src ) is not a String.
 * @memberof wTools
 *
 */
    function strEscape(t) {
      // 007f : ''
      // . . .
      // 009f : ''
      // 00ad : '­'
      // \' 	single quote 	byte 0x27 in ASCII encoding
      // \' 	double quote 	byte 0x22 in ASCII encoding
      // \\ 	backslash 	byte 0x5c in ASCII encoding
      // \b 	backspace 	byte 0x08 in ASCII encoding
      // \f 	form feed - new page 	byte 0x0c in ASCII encoding
      // \n 	line feed - new line 	byte 0x0a in ASCII encoding
      // \r 	carriage return 	byte 0x0d in ASCII encoding
      // \t 	horizontal tab 	byte 0x09 in ASCII encoding
      // \v 	vertical tab 	byte 0x0b in ASCII encoding
      // source : http://en.cppreference.com/w/cpp/language/escape
      // console.log( _.appMemoryUsageInfo(), o.src.length );
      // if( o.src.length === 111691 )
      // debugger;
      e.strIs(t) && (t = {
        src: t
      }), e.assert(e.strIs(t.src), "Expects string {-o.src-}, but got", e.strType(t.src)), 
      e.routineOptions(strEscape, t);
      let s = "", r = t.stringWrapper.charCodeAt(0);
      // let src = o.src.split( '' );
      // debugger;
            for (let n = 0; n < t.src.length; n++) {
        // let c = o.src[ s ];
        // let c = src[ s ];
        // let code = c.charCodeAt( 0 );
        let i = t.src.charCodeAt(n);
        // if( o.stringWrapper === '`' && c === '$' )
                if ("`" === t.stringWrapper && 36 /* $ */ === i) s += "\\$"; else if (t.stringWrapper && i === r) s += "\\" + t.stringWrapper; else if (127 <= i && i <= 159 || 173 /*|| code >= 65533*/ === i) 
        // result += _.strUnicodeEscape( c );
        s += e.strCodeUnicodeEscape(i); else switch (i) {
         case 92 /* '\\' */ :
          s += "\\\\";
          break;

         case 8 /* '\b' */ :
          s += "\\b";
          break;

         case 12 /* '\f' */ :
          s += "\\f";
          break;

         case 10 /* '\n' */ :
          s += "\\n";
          break;

         case 13 /* '\r' */ :
          s += "\\r";
          break;

         case 9 /* '\t' */ :
          s += "\\t";
          break;

         default:
          s += i < 32 ? e.strCodeUnicodeEscape(i) : String.fromCharCode(i);
        }
      }
      return s;
    }
    // --
    // stripper
    // --
    /**
 * Removes leading and trailing characters occurrences from source string( o.src ) finded by mask( o.stripper ).
 * If( o.stripper ) is not defined function removes leading and trailing whitespaces and escaped characters from( o.src ).
 * Function can be called in two ways:
 * - First to pass only source string and use default options;
 * - Second to pass map like ({ src : ' acb ', stripper : ' ' }).
 *
 * @param {string|object} o - Source string to parse or map with source( o.src ) and options.
 * @param {string} [ o.src=null ]- Source string to strip.
 * @param {string|array} [ o.stripper=' ' ]- Contains characters to remove.
 * @returns {string} Returns result of removement in a string.
 *
 * @example
 * //returns 'b'
 * _.strStrip( { src : 'aabaa', stripper : 'a' } );
 *
 * @example
 * //returns 'b'
 * _.strStrip( { src : 'xaabaax', stripper : [ 'a', 'x' ] } )
 *
 * @example
 * //returns 'b'
 * _.strStrip( { src : '   b  \n' } )
 *
 * @method strStrip
 * @throws { Exception } Throw an exception if( arguments.length ) is not equal 1.
 * @throws { Exception } Throw an exception if( o ) is not Map.
 * @throws { Exception } Throw an exception if( o.src ) is not a String.
 * @throws { Exception } Throw an exception if( o.stripper ) is not a String or Array.
 * @throws { Exception } Throw an exception if object( o ) has been extended by invalid property.
 * @memberof wTools
 *
 */
    function strStrip(t) {
      if ((e.strIs(t) || e.arrayIs(t)) && (t = {
        src: t
      }), e.routineOptions(strStrip, t), e.assert(1 === arguments.length, "Expects single argument"), 
      e.arrayIs(t.src)) {
        let s = [];
        for (let r = 0; r < t.src.length; r++) {
          let n = e.mapExtend(null, t);
          n.src = n.src[r], s[r] = strStrip(n);
        }
        return s;
      }
      if (e.assert(e.strIs(t.src), "Expects string or array o.src, got", e.strType(t.src)), 
      e.assert(e.strIs(t.stripper) || e.arrayIs(t.stripper) || e.regexpIs(t.stripper), "Expects string or array or regexp ( o.stripper )"), 
      e.strIs(t.stripper) || e.regexpIs(t.stripper)) {
        let s = t.stripper;
        return e.strIs(s) && (s = e.regexpEscape(s), s = new RegExp(s, "g")), t.src.replace(s, "");
      }
      {
        e.assert(e.arrayIs(t.stripper));
        for (let s of t.stripper) e.assert(e.strIs(s, "Expects string {-stripper[ * ]-}"));
        let s = 0;
        for (;s < t.src.length && -1 !== t.stripper.indexOf(t.src[s]); s++) ;
        let r = t.src.length - 1;
        for (;r >= 0 && -1 !== t.stripper.indexOf(t.src[r]); r--) ;
        return s >= r ? "" : t.src.substring(s, r + 1);
      }
    }
    //
    /**
 * Same as _.strStrip with one difference:
 * If( o.stripper ) is not defined, function removes only leading whitespaces and escaped characters from( o.src ).
 *
 * @example
 * //returns 'a '
 * _.strStripLeft( ' a ' )
 *
 * @method strStripLeft
 * @memberof wTools
 *
 */
    function strStripLeft(t) {
      return (e.strIs(t) || e.arrayIs(t)) && (t = {
        src: t
      }), e.routineOptions(strStripLeft, t), e.assert(1 === arguments.length, "Expects single argument"), 
      e.strStrip(t);
    }
    //
    /**
 * Same as _.strStrip with one difference:
 * If( o.stripper ) is not defined, function removes only trailing whitespaces and escaped characters from( o.src ).
 *
 * @example
 * //returns ' a'
 * _.strStripRight( ' a ' )
 *
 * @method strStripRight
 * @memberof wTools
 *
 */
    function strStripRight(t) {
      return (e.strIs(t) || e.arrayIs(t)) && (t = {
        src: t
      }), e.routineOptions(strStripRight, t), e.assert(1 === arguments.length, "Expects single argument"), 
      e.strStrip(t);
    }
    //
    function strSplitChunks(t) {
      /* - */
      function makeChunkStatic(t) {
        let o = Object.create(null);
        o.line = n, o.text = r.substring(0, t), o.index = l, o.kind = "static", s.chunks.push(o), 
        r = r.substring(t), n += e.strLinesCount(o.text) - 1, l += 1, 
        /* - */
        function colAccount(t) {
          let s = t.lastIndexOf("\n");
          -1 === s ? i += t.length : i = t.length - s, e.assert(i >= 0);
        }(o.text);
      }
      /* - */      function makeChunkDynamic() {
        let e = Object.create(null);
        return e.line = n, e.column = i, e.index = l, e.kind = "dynamic", e.prefix = r.match(t.prefix)[0], 
        e.code = r.substring(e.prefix.length, a), t.investigate && (e.lines = e.code.split("\n"), 
        e.tab = /^\s*/.exec(e.lines[e.lines.length - 1])[0])
        /* postfix */ , r = r.substring(e.prefix.length + e.code.length), e.postfix = r.match(t.postfix)[0], 
        r = r.substring(e.postfix.length), s.chunks.push(e), e;
      }
      let s = Object.create(null);
      s.chunks = [], 2 === arguments.length ? (t = arguments[1] || Object.create(null)).src = arguments[0] : (e.assert(1 === arguments.length, "Expects single argument"), 
      e.strIs(arguments[0]) && (t = {
        src: arguments[0]
      })), e.routineOptions(strSplitChunks, t), e.assert(e.strIs(t.src), "Expects string (-o.src-), but got", e.strType(t.src)), 
      e.regexpIs(t.prefix) || (t.prefix = RegExp(e.regexpEscape(t.prefix), "m")), e.regexpIs(t.postfix) || (t.postfix = RegExp(e.regexpEscape(t.postfix), "m"));
      let r = t.src, n = 0, i = 0, l = 0, o = -1, a = -1;
      /* */      do {
        /* break */
        if (
        /* begin */
        -1 === (o = r.search(t.prefix)) && (o = r.length)
        /* text chunk */ , o > 0 && makeChunkStatic(o), !r) {
          s.chunks.length || makeChunkStatic(0);
          break;
        }
        /* end */        if (-1 === (a = r.search(t.postfix))) return s.lines = r.split("\n").length, 
        s.error = e.err("Openning prefix", t.prefix, "of chunk #" + s.chunks.length, "at" + n, "line does not have closing tag :", t.postfix), 
        s;
        /* code chunk */        let i = makeChunkDynamic();
        /* wind */        l += 1, n += e.strLinesCount(i.prefix + i.code + i.postfix) - 1;
      } while (r);
      return s;
    }
    //
    function strSplitsCoupledGroup(t) {
      e.arrayIs(t) && (t = {
        splits: t
      }), (t = e.routineOptions(strSplitsCoupledGroup, t)).prefix = e.arrayAs(t.prefix), 
      t.postfix = e.arrayAs(t.postfix), e.assert(1 === arguments.length), e.assert(e.regexpsLike(t.prefix)), 
      e.assert(e.regexpsLike(t.postfix));
      let s = [];
      for (let r = 0; r < t.splits.length; r++) {
        let n = t.splits[r];
        if (e.regexpsTestAny(t.prefix, n)) s.push(r); else if (e.regexpsTestAny(t.postfix, n)) {
          if (0 === s.length && !t.allowingUncoupledPostfix) throw e.err(e.strQuote(n), "does not have complementing openning\n");
          if (0 === s.length) continue;
          let i = s.pop(), l = r - i;
          e.assert(l >= 0);
          let o = t.splits.splice(i, l + 1, null);
          t.splits[i] = o, r -= l;
        }
      }
      if (s.length && !t.allowingUncoupledPrefix) throw e.err(e.strQuote(s[s.length - 1]), "does not have complementing closing\n");
      return t.splits;
    }
    //
    function strSplitsUngroupedJoin(t) {
      /* */
      function join() {
        if (s + 1 < r) {
          let e = t.splits.slice(s + 1, r + 1).join("");
          t.splits.splice(s + 1, r + 1, e);
        }
        r = null;
      }
      e.arrayIs(t) && (t = {
        splits: t
      });
      let s = (t = e.routineOptions(strSplitsUngroupedJoin, t)).splits.length - 1, r = null;
      for (;s >= 0; ) {
        let n = t.splits[s];
        e.strIs(n) ? null === r && (r = s) : null !== r && join(), s -= 1;
      }
      return null !== r && join(), t.splits;
    }
    //
    function strSplitsQuotedRejoin_body(t) {
      /* quoting */
      if (e.assert(1 === arguments.length), e.assert(e.arrayIs(t.splits)), t.quoting) for (let s = 1; s < t.splits.length; s += 1) {
        let r, n = t.splits[s], i = t.quotingPrefixes.indexOf(n);
        if (i >= 0) {
          let e = t.quotingPostfixes[i];
          for (r = s + 2; r < t.splits.length; r += 1) if (t.splits[r] === e) {
            let e = 0, n = 0;
            t.inliningQuoting && (s -= 1, e += 1, r += 1, n += 1);
            let i = t.splits.splice(s, r - s + 1, null);
            t.preservingQuoting || (i.splice(e, 1), i.splice(i.length - 1 - n, 1)), i = i.join(""), 
            t.splits[s] = i, r = s;
            break;
          }
        }
        /* if complementing postfix not found */        if (r >= t.splits.length && !e.arrayHas(t.delimeter, n)) {
          let e = t.splits.splice(s, 2).join("");
          t.splits[s - 1] = t.splits[s - 1] + e;
        }
      }
      return t.splits;
    }
    //
    function strSplitsDropDelimeters_body(t) {
      /* stripping */
      if (e.assert(1 === arguments.length), e.assert(e.arrayIs(t.splits)), t.delimeter.some(t => e.regexpIs(t))) debugger;
      for (let s = t.splits.length - 1; s >= 0; s--) {
        let r = t.splits[s];
        e.regexpsTestAny(t.delimeter, r) && t.splits.splice(s, 1);
        // if( _.arrayHas( o.delimeter, split ) )
        // o.splits.splice( s, 1 );
        //
        // if( s % 2 === 1 )
        // o.splits.splice( s, 1 );
            }
      return t.splits;
    }
    //
    function strSplitsStrip_body(t) {
      e.assert(1 === arguments.length), e.assert(e.arrayIs(t.splits));
      /* stripping */
      for (let s = 0; s < t.splits.length; s++) {
        let r = t.splits[s];
        t.stripping && (r = e.strStrip({
          src: r,
          stripper: t.stripping
        })), t.splits[s] = r;
      }
      return t.splits;
    }
    //
    function strSplitsDropEmpty_body(t) {
      e.assert(1 === arguments.length), e.assert(e.arrayIs(t.splits));
      /* stripping */
      for (let e = 0; e < t.splits.length; e++) t.splits[e] || (t.splits.splice(e, 1), 
      e -= 1);
      return t.splits;
    }
    // --
    //
    // --
    function strSplitFast_pre(t, s) {
      let r = s[0];
      return 2 === s.length ? r = {
        src: s[0],
        delimeter: s[1]
      } : e.strIs(s[0]) && (r = {
        src: s[0]
      }), e.routineOptions(t, r), e.assert(2 === arguments.length, "Expects exactly two arguments"), 
      e.assert(1 === s.length || 2 === s.length, "Expects one or two arguments"), e.assert(e.strIs(r.src)), 
      e.assert(e.objectIs(r)), r;
    }
    //
        function strSplitFast_body(t) {
      /* */
      function delimeterAdd(e) {
        t.preservingDelimeters && (t.preservingEmpty || e) && s.push(e);
      }
      /*  */      function ordinaryAdd(e) {
        (t.preservingEmpty || e) && s.push(e);
      }
      /* */      function closestWhich() {
        i = t.src.length, l = -1;
        for (let e = 0; e < t.delimeter.length; e++) r[e] < t.src.length && r[e] < i && (i = r[e], 
        l = e);
        a = g[l];
      }
      /* */      function delimeterNext(s, r) {
        e.assert(r <= t.src.length);
        let n, i = t.delimeter[s];
        if (e.strIs(i)) n = t.src.indexOf(i, r); else {
          let e = i.exec(t.src.substring(r));
          e && (n = e.index + r, g[s] = e[0]);
        }
        return -1 === n ? t.src.length : n;
      }
      let s, r, n, i, l, o, a;
      t.delimeter = e.arrayAs(t.delimeter);
      let g = t.delimeter.slice();
      /* */
      if (e.assert(1 === arguments.length), e.assert(e.arrayIs(t.delimeter)), e.assert(e.boolLike(t.preservingDelimeters)), 
      t.preservingDelimeters || 1 !== t.delimeter.length) {
        if (!t.delimeter.length) return s = [ t.src ];
        s = [], r = [], n = 0, i = 0, l = -1, o = !1;
        for (let s = 0; s < t.delimeter.length; s++) {
          let i = t.delimeter[s];
          e.regexpIs(i) ? (e.assert(!i.sticky), "" !== i.source && "()" !== i.source && "(?:)" !== i.source || (o = !0)) : 0 === i.length && (o = !0), 
          r[s] = delimeterNext(s, n);
        }
        // let delimeter;
                do {
          if (closestWhich(), i === t.src.length) break;
          a.length || (n += 1), ordinaryAdd(t.src.substring(n, i)), (a.length > 0 || n < t.src.length) && delimeterAdd(a), 
          n = r[l] + (a.length ? a.length : 1);
          // debugger;
          for (let e = 0; e < t.delimeter.length; e++) r[e] < n && (r[e] = delimeterNext(e, n));
          // debugger;
                } while (n < t.src.length);
        !a && o || ordinaryAdd(t.src.substring(n, t.src.length));
      } else s = t.src.split(t.delimeter[0]), t.preservingEmpty || (s = s.filter(t => t || !1));
      return s;
    }
    //
    function strSplit_body(t) {
      if (t.delimeter = e.arrayAs(t.delimeter), !t.stripping && !t.quoting && !t.onDelimeter) return e.strSplitFast.body(e.mapOnly(t, e.strSplitFast.defaults));
      /* */      e.assert(1 === arguments.length);
      /* */
      let s = e.mapOnly(t, e.strSplitFast.defaults);
      /* */
      return s.preservingEmpty = 1, s.preservingDelimeters = 1, t.quoting && (s.delimeter = e.arrayPrependArraysOnce([], [ t.quotingPrefixes, t.quotingPostfixes, s.delimeter ])), 
      t.splits = e.strSplitFast.body(s), t.quoting && e.strSplitsQuotedRejoin.body(t), 
      t.preservingDelimeters || e.strSplitsDropDelimeters.body(t), t.stripping && e.strSplitsStrip.body(t), 
      t.preservingEmpty || e.strSplitsDropEmpty.body(t), t.splits;
    }
    //
    function _strExtractInlined_body(t) {
      /* */
      function handleTriplet() {
        let l = s[i + 1], o = s[i + 2], a = s[i + 3];
        return t.onInlined && (o = t.onInlined(o, t, [ l, a ])), void 0 === o ? (e.assert(e.strIs(s[i + 4])), 
        s[i + 2] = s[i + 0] + s[i + 1] + s[i + 2], s.splice(i, 2), i -= 4, !1) : (r = n.length, 
        t.preservingDelimeters && void 0 !== l && (t.preservingEmpty || l) && n.push(l), 
        t.preservingInlined && void 0 !== o && (t.preservingEmpty || o) && n.push(o), t.preservingDelimeters && void 0 !== a && (t.preservingEmpty || a) && n.push(a), 
        !0);
      }
      /* */      function handleOrdinary() {
        let e = s[i + 0];
        t.onOrdinary && (e = t.onOrdinary(e, t)), t.preservingOrdinary && void 0 !== e && (t.preservingEmpty || e) && n.splice(r, 0, e), 
        r = n.length;
      }
      e.assert(1 === arguments.length, "Expects single options map"), null === t.delimeter && (t.delimeter = "#");
      let s = e.strSplit({
        src: t.src,
        delimeter: t.delimeter,
        stripping: t.stripping,
        quoting: t.quoting,
        preservingEmpty: 1,
        preservingDelimeters: 1
      });
      if (s.length <= 1) return t.preservingEmpty || "" === s[0] && s.splice(0, 1), s;
      /*
  first - for tracking index to insert ordinary text
  onInlined should be called first and
  if undefined returned escaped text shoud be treated as ordinary
  so tracking index to insert ordinary text ( in case not undefined returned ) required
  */      let r = 0, n = [], i = 0;
      for (;i < s.length; i += 4) s.length - i >= 4 ? handleTriplet() && handleOrdinary() : (s.length > i + 1 && (s[i] = s.slice(i, s.length).join(""), 
      s.splice(i + 1, s.length - i - 1)), handleOrdinary(), e.assert(i + 1 === s.length, "Openning delimeter", t.delimeter, "does not have closing"));
      return n;
    }
    //
    /**
 * Extracts words enclosed by prefix( o.prefix ) and postfix( o.postfix ) delimeters
 * Function can be called in two ways:
 * - First to pass only source string and use default options;
 * - Second to pass source string and options map like ( { prefix : '#', postfix : '#' } ) as function context.
 *
 * Returns result as array of strings.
 *
 * Function extracts words in two attempts:
 * First by splitting source string by ( o.prefix ).
 * Second by splitting each element of the result of first attempt by( o.postfix ).
 * If splitting by ( o.prefix ) gives only single element then second attempt is skipped, otherwise function
 * splits all elements except first by ( o.postfix ) into two halfs and calls provided ( o.onInlined ) function on first half.
 * If result of second splitting( by o.postfix ) is undefined function appends value of element from first splitting attempt
 * with ( o.prefix ) prepended to the last element of result array.
 *
 * @param {string} src - Source string.
 * @param {object} o - Options map.
 * @param {string} [ o.prefix = '#' ] - delimeter that marks begining of enclosed string
 * @param {string} [ o.postfix = '#' ] - delimeter that marks ending of enclosed string
 * @param {string} [ o.onInlined = null ] - function called on each splitted part of a source string
 * @returns {object} Returns an array of strings separated by( o.delimeter ).
 *
 * @example
 * _.strExtractInlinedStereo( '#abc#' );
 * //returns [ '', 'abc', '' ]
 *
 * @example
 * _.strExtractInlinedStereo.call( { prefix : '#', postfix : '$' }, '#abc$' );
 * //returns [ 'abc' ]
 *
 * @example
 * function onInlined( strip )
 * {
 *   if( strip.length )
 *   return strip.toUpperCase();
 * }
 * _.strExtractInlinedStereo.call( { postfix : '$', onInlined }, '#abc$' );
 * //returns [ 'ABC' ]
 *
 * @method strExtractInlinedStereo
 * @throws { Exception } Throw an exception if( arguments.length ) is not equal 1 or 2.
 * @throws { Exception } Throw an exception if( o.src ) is not a String.
 * @throws { Exception } Throw an exception if( o.delimeter ) is not a String or an Array.
 * @throws { Exception } Throw an exception if object( o ) has been extended by invalid property.
 * @memberof wTools
 *
 */
    // let strExtractInlinedStereo = _.routineFromPreAndBody( strSplitFast_pre, _strExtractInlinedStereo_body );
    function strExtractInlinedStereo(t) {
      e.strIs(t) && (t = {
        src: t
      }), e.assert(this === e), e.assert(e.strIs(t.src)), e.assert(e.objectIs(t)), e.assert(1 === arguments.length, "Expects single argument"), 
      e.routineOptions(strExtractInlinedStereo, t);
      let s = [], r = t.src.split(t.prefix);
      if (1 === r.length) return r;
      /* */      r[0] && s.push(r[0])
      /* */;
      for (let n = 1; n < r.length; n++) {
        let i = e.strIsolateLeftOrNone(r[n], t.postfix), l = t.onInlined ? t.onInlined(i[0]) : i[0];
        if (e.assert(3 === i.length), void 0 !== l) s.push(l), i[2] && s.push(i[2]); else {
          if (s.length) debugger; else debugger;
          s.length ? s[s.length - 1] += t.prefix + r[n] : s.push(t.prefix + r[n]);
        }
      }
      return s;
    }
    //
    /**
 * Splits string( srcStr ) into parts using array( maskArray ) as mask and returns them as array.
 * Mask( maskArray ) contains string(s) separated by marker( strUnjoin.any ). Mask must starts/ends with first/last letter from source
 * or can be replaced with marker( strUnjoin.any ). Position of( strUnjoin.any ) determines which part of source string will be splited:
 * - If( strUnjoin.any ) is before string it marks everything before that string. Example: ( [ _.strUnjoin.any, 'postfix' ] ).
 * - If( strUnjoin.any ) is after string it marks everything after that string. Example: ( [ 'prefix', _.strUnjoin.any ] ).
 * - If( strUnjoin.any ) is between two strings it marks everything between them. Example: ( [ 'prefix', _.strUnjoin.any, 'postfix' ] ).
 * - If( strUnjoin.any ) is before and after string it marks all except that string. Example: ( [ '_.strUnjoin.any', something, '_.strUnjoin.any' ] ).
 *
 * @param {string} srcStr - Source string.
 * @param {array} maskArray - Contains mask for source string.
 * @returns {array} Returns array with unjoined string part.
 *
 * @example
 * //returns [ 'prefix', '_something_', 'postfix' ]
 * _.strUnjoin( 'prefix_something_postfix', [ 'prefix', _.strUnjoin.any, 'postfix' ] );
 *
 * @example
 * //returns [ 'prefix_', 'something', '_', 'postfix' ]
 * _.strUnjoin( 'prefix_something_postfix', [ _.strUnjoin.any, 'something', _.strUnjoin.any, 'postfix' ] );
 *
 * @example
 * //returns [ 'prefix_something_', 'postfix' ]
 * _.strUnjoin( 'prefix_something_postfix', [ _.strUnjoin.any, 'postfix' ] );
 *
 * @example
 * //returns [ 'prefix', '_something_postfix' ]
 * _.strUnjoin( 'prefix_something_postfix', [ 'prefix', _.strUnjoin.any ] );
 *
 * @example
 * //returns [ 'prefi', 'x', '_something_', 'p', 'ostfix' ]
 * _.strUnjoin( 'prefix_something_postfix', [ _.strUnjoin.any, 'x', _.strUnjoin.any, 'p', _.strUnjoin.any ] );
 *
 * @method strUnjoin
 * @throws { Exception } If no arguments provided.
 * @throws { Exception } If( srcStr ) is not a String.
 * @throws { Exception } If( maskArray ) is not a Array.
 * @throws { Exception } If( maskArray ) value is not String or strUnjoin.any.
 * @memberof wTools
 *
 */
    function strUnjoin(t, s) {
      /**/
      function checkToken() {
        return -1 !== i && (e.assert(i <= n), r.push(t.substring(i, n)), i = -1, !0);
      }
      /**/      function checkMask(s) {
        if (e.assert(e.strIs(s) || s === strUnjoin.any, "Expects string or strUnjoin.any, got", e.strType(s)), 
        e.strIs(s)) {
          if (-1 === (n = t.indexOf(s, n))) return !1;
          if (-1 === i && 0 !== n) return !1;
          checkToken(), r.push(s), n += s.length;
        } else s === strUnjoin.any ? i = n : e.assert(0, "unexpected mask");
        return !0;
      }
      e.assert(2 === arguments.length, "Expects exactly two arguments"), e.assert(e.strIs(t)), 
      e.assert(e.arrayIs(s));
      let r = [], n = 0, i = -1;
      /**/
      for (let t = 0; t < s.length; t++) if (!checkMask(s[t])) return;
      if ((-1 === i || (n = t.length, checkToken())) && n === t.length) 
      /**/
      return r;
    }
    //
    // function strJoin_body( srcs, delimeter )
    function strJoin_body(t) {
      // let result = [ '' ];
      // let arrayEncountered = 0;
      let s;
      e.assertRoutineOptions(strJoin_body, arguments);
      let r = t.join || "";
      // debugger;
      if ((null === t.join || e.strIs(t.join)) && (t.join = 
      /* */
      function join(t, e, s) {
        return r && s > 0 ? t + r + e : t + e;
      }), !t.srcs.length) return [];
      /* */      for (let r = 0; r < t.srcs.length; r++) {
        let n = t.srcs[r];
        e.arrayIs(n) && (e.assert(void 0 === s || s === n.length, "All arrays should have the same length"), 
        s = n.length);
      }
      if (0 === s) return [];
      /* */      if (void 0 === s) {
        let s = "";
        for (let r = 0; r < t.srcs.length; r++) {
          let n = t.srcs[r], i = t.str(n);
          e.assert(e.strIs(i), () => "Expects primitive or array, but got " + e.strType(n)), 
          s = t.join(s, i, r);
        }
        return s;
      }
      /* */      {
        let r = [];
        for (let t = 0; t < s; t++) r[t] = "";
        for (let s = 0; s < t.srcs.length; s++) {
          let n = t.srcs[s];
          // _.assert( _.strIs( srcStr ) || _.arrayIs( src ), () => 'Expects primitive or array, but got ' + _.strType( src ) );
          // _.assert( _.strIs( src ) || _.numberIs( src ) || _.arrayIs( src ) );
                    if (e.arrayIs(n)) 
          // if( arrayEncountered === 0 )
          // for( let s = 1 ; s < src.length ; s++ )
          // result[ s ] = result[ 0 ];
          // _.assert( arrayLength === undefined || arrayLength === src.length, 'All arrays should have the same length' );
          // arrayLength = src.length;
          // arrayEncountered = 1;
          for (let e = 0; e < r.length; e++) r[e] = t.join(r[e], n[e], s); else {
            let i = t.str(n);
            e.assert(e.strIs(i), () => "Expects primitive or array, but got " + e.strType(n));
            for (let e = 0; e < r.length; e++) r[e] = t.join(r[e], i, s);
          }
        }
        return r;
      }
    }
    //
    function strConcat(t, s) {
      if (s = e.routineOptions(strConcat, s || Object.create(null)), e.assert(1 === arguments.length || 2 === arguments.length), 
      e.assert(this.strConcat === strConcat), s.optionsForToStr = e.mapSupplement(s.optionsForToStr, {
        stringWrapper: ""
      }, strConcat.defaults.optionsForToStr), e.routineIs(t)) return t();
      e.arrayLike(t) || (t = [ t ]);
      let r = "";
      if (!t.length) return r;
      /* */      let n = 1;
      for (let i = 0; i < t.length; i++) {
        let l = t[i];
        if (l = e.toStr(l, s.optionsForToStr), !n) {
          let t = l.trim().lastIndexOf(s.lineDelimter);
          -1 === t ? " " !== r[r.length - 1] && " " !== l[0] && (r += s.delimeter) : 0 !== t && (r += s.lineDelimter);
        }
        l.length && (n = l[l.length - 1] === s.lineDelimter), r += l;
      }
      /* */      
      /* */
      return (s.linePrefix || s.linePostfix) && (r = r.split(s.lineDelimter), r = s.linePrefix + r.join(s.linePostfix + s.lineDelimter + s.linePrefix) + s.linePostfix), 
      r;
    }
    //
    /**
 * Puts line counter before each line/element of provided source( o.src ).
 * If( o.src ) is a string, function splits it into array using new line as splitter, then puts line counter at the begining of each line( element ).
 * If( o.src ) is a array, function puts line counter at the begining of each line( element ).
 * Initial value of a counter can be changed by defining( o.first ) options( o ) property.
 * Can be called in two ways:
 * - First by passing all options in one object;
 * - Second by passing source only and using default value of( first ).
 *
 * @param { Object } o - options.
 * @param { String/Array } [ o.src=null ] - Source string or array of lines( not array of texts ).
 * With line we mean it does not have eol. Otherwise please join the array to let the routine to resplit the text,
 * like that: _.strLinesNumber( array.join( '\n' ) ).
 * @param { Number} [ o.first=1 ] - Sets initial value of a counter.
 * @returns { String } Returns string with line enumeration.
 *
 * @example
 * _.strLinesNumber( 'line' );
 * //returns '1 : line'
 *
 * @example
 * _.strLinesNumber( 'line1\nline2\nline3' );
 * //returns
 * // 1: line1
 * // 2: line2
 * // 3: line3
 *
 * @example
 * _.strLinesNumber( [ 'line', 'line', 'line' ] );
 * //returns
 * // 1: line1
 * // 2: line2
 * // 3: line3
 *
 * @example
 * _.strLinesNumber( { src:'line1\nline2\nline3', first : 2 } );
 * //returns
 * // 2: line1
 * // 3: line2
 * // 4: line3
 *
 * @method strLinesNumber
 * @throws { Exception } Throw an exception if no argument provided.
 * @throws { Exception } Throw an exception if( o.src ) is not a String or Array.
 * @memberof wTools
 */
    function strLinesNumber(t) {
      /* */
      if (e.objectIs(t) || (t = {
        src: arguments[0],
        first: arguments[1]
      }), e.routineOptions(strLinesNumber, t), e.assert(1 === arguments.length || 2 === arguments.length), 
      e.assert(e.strIs(t.src) || e.strsAreAll(t.src), "Expects string or strings {-o.src-}"), 
      null === t.first) if (null === t.firstChar) t.first = 1; else if (e.numberIs(t.firstChar)) {
        debugger;
        let s = e.arrayIs(t.src) ? t.src.join("\n") : t.src;
        t.first = e.strLinesCount(s.substring(0, t.firstChar + 1));
      }
      /* */      let s = e.strIs(t.src) ? t.src.split("\n") : t.src;
      /* */      if (t.onLine) for (let r = 0; r < s.length; r += 1) s[r] = t.onLine([ r + t.first, " : ", s[r] ], t), 
      void 0 === s[r] && (s.splice(r, 1), r -= 1), e.assert(e.strIs(s[r])); else for (let e = 0; e < s.length; e += 1) s[e] = e + t.first + " : " + s[e];
      return s.join("\n");
    }
    //
    // function strLinesAt( code, line, radius )
    // {
    //   _.assert( arguments.length === 3, 'Expects exactly three arguments' );
    //   _.assert( _.strIs( code ) || _.arrayIs( code ) );
    //   _.assert( _.numberIs( line ) );
    //
    //   if( radius === undefined )
    //   radius = 2;
    //
    //   debugger;
    //
    //   let lines = code.split( '\n' );
    //   let result = lines.slice( line-radius, line+radius-1 );
    //   result = _.strLinesNumber( result, line-radius+1 );
    //
    //   return result;
    // }
    //
    /**
 * Selects range( o.range ) of lines from source string( o.src ).
 * If( o.range ) is not specified and ( o.line ) is provided function uses it with ( o.selectMode ) option to generate new range.
 * If( o.range ) and ( o.line ) are both not provided function generates range by formula: [ 0, n + 1 ], where n: number of ( o.delimteter ) in source( o.src ).
 * Returns selected lines range as string or empty string if nothing selected.
 * Can be called in three ways:
 * - First by passing all parameters in one options object( o ) ;
 * - Second by passing source string( o.src ) and range( o.range ) as array or number;
 * - Third by passing source string( o.src ), range start and end position.
 *
 * @param {Object} o - Options.
 * @param {String} [ o.src=null ] - Source string.
 * @param {Array|Number} [ o.range=null ] - Sets range of lines to select from( o.src ) or single line number.
 * @param {Number} [ o.zero=1 ] - Sets base value for a line counter.
 * @param {Number} [ o.number=0 ] - If true, puts line counter before each line by using o.range[ 0 ] as initial value of a counter.
 * @param {String} [ o.delimteter='\n' ] - Sets new line character.
 * @param {String} [ o.line=null ] - Sets line number from which to start selecting, is used only if ( o.range ) is null.
 * @param {Number} [ o.numberOfLines=3 ] - Sets maximal number of lines to select, is used only if ( o.range ) is null and ( o.line ) option is specified.
 * @param {String} [ o.selectMode='center' ] - Determines in what way funtion must select lines, works only if ( o.range ) is null and ( o.line ) option is specified.
 * Possible values:
 * - 'center' - uses ( o.line ) index as center point and selects ( o.numberOfLines ) lines in both directions.
 * - 'begin' - selects ( o.numberOfLines ) lines from start point ( o.line ) in forward direction;
 * - 'end' - selects ( o.numberOfLines ) lines from start point ( o.line ) in backward direction.
 * @returns {string} Returns selected lines as new string or empty if nothing selected.
 *
 * @example
 * //selecting single line
 * _.strLinesSelect( 'a\nb\nc', 1 );
 * //returns 'a'
 *
 * @example
 * //selecting first two lines
 * _.strLinesSelect( 'a\nb\nc', [ 1, 3 ] );
 * //returns
 * 'a
 * b'
 *
 * @example
 * //selecting first two lines, second way
 * _.strLinesSelect( 'a\nb\nc', 1, 3 );
 * //returns
 * 'a
 * b'
 *
 * @example
 * //custom new line character
 * _.strLinesSelect({ src : 'a b c', range : [ 1, 3 ], delimteter : ' ' });
 * //returns 'a b'
 *
 * @example
 * //setting preferred number of lines to select, line option must be specified
 * _.strLinesSelect({ src : 'a\nb\nc', line : 2, numberOfLines : 1 });
 * //returns 'b'
 *
 * @example
 * //selecting 2 two next lines starting from second
 * _.strLinesSelect({ src : 'a\nb\nc', line : 2, numberOfLines : 2, selectMode : 'begin' });
 * //returns
 * 'b
 * c'
 *
 * @example
 * //selecting 2 two lines starting from second in backward direction
 * _.strLinesSelect({ src : 'a\nb\nc', line : 2, numberOfLines : 2, selectMode : 'end' });
 * //returns
 * 'a
 * b'
 *
 * @method strLinesSelect
 * @throws { Exception } Throw an exception if no argument provided.
 * @throws { Exception } Throw an exception if( o.src ) is not a String.
 * @throws { Exception } Throw an exception if( o.range ) is not a Array or Number.
 * @throws { Exception } Throw an exception if( o ) is extended by unknown property.
 * @memberof wTools
 */
    function strLinesSelect(t) {
      2 === arguments.length ? e.arrayIs(arguments[1]) ? t = {
        src: arguments[0],
        range: arguments[1]
      } : e.numberIs(arguments[1]) ? t = {
        src: arguments[0],
        range: [ arguments[1], arguments[1] + 1 ]
      } : e.assert(0, "unexpected argument", e.strType(range)) : 3 === arguments.length && (t = {
        src: arguments[0],
        range: [ arguments[1], arguments[2] ]
      }), e.assert(arguments.length <= 3), e.assert(e.strIs(t.src)), e.routineOptions(strLinesSelect, t), 
      /* range */
      t.range || (null !== t.line ? "center" === t.selectMode ? t.range = [ t.line - Math.ceil((t.numberOfLines + 1) / 2) + 1, t.line + Math.floor((t.numberOfLines - 1) / 2) + 1 ] : "begin" === t.selectMode ? t.range = [ t.line, t.line + t.numberOfLines ] : "end" === t.selectMode && (t.range = [ t.line - t.numberOfLines + 1, t.line + 1 ]) : t.range = [ 0, e.strCount(t.src, t.delimteter) + 1 ]), 
      e.assert(e.longIs(t.range));
      /* */
      let s = 0, r = t.zero;
      for (;r < t.range[0]; ) {
        if (-1 === (s = t.src.indexOf(t.delimteter, s))) return "";
        s += t.delimteter.length, r += 1;
      }
      /* */      let n = s - 1;
      for (;r < t.range[1]; ) {
        if (n += 1, -1 === (n = t.src.indexOf(t.delimteter, n))) {
          n = t.src.length;
          break;
        }
        r += 1;
      }
      /* */      let i = s < n ? t.src.substring(s, n) : "";
      /* number */      return t.number && (i = e.strLinesNumber(i, t.range[0])), i;
    }
    //
    /**
 * Get the nearest ( o.numberOfLines ) lines to the range ( o.charsRange ) from source string( o.src ).
 * Returns object with two elements: .
 * Can be called in two ways:
 * - First by passing all parameters in one options object( o ) ;
 * - Second by passing source string( o.src ) and range( o.range ) as array or number;
 *
 * @param { Object } o - Options.
 * @param { String } [ o.src ] - Source string.
 * @param { Array|Number } [ o.range ] - Sets range of lines to select from( o.src ) or single line number.
 * @param { Number } [ o.numberOfLines ] - Sets number of lines to select.
 * @returns { Object } o - Returns object with Options with fields:
 * @returns { Array } [ o.splits ] - Array with three entries:
 * o.splits[ 0 ] and o.splits[ 2 ] contains a string with the nearest lines,
 * and o.splits[ 1 ] contains the substring corresponding to the range.
 * @returns { Array } [ o.spans ] - Array with indexes of begin and end of nearest lines.
 *
 * @example
 * //selecting single line
 * _.strLinesNearest
 * ({
 *   src : `\na\nbc\ndef\nghij\n\n`,
 *   charsRange : [ 2, 4 ],
 *   numberOfLines : 1,
 * });
 * //returns o.splits = [ 'a', '\nb', 'c' ];
 * //returns o.spans = [ 1, 2, 4, 5 ];
 *
 * @example
 * //selecting single line
 * _.strLinesNearest
 * ({
 *   src : `\na\nbc\ndef\nghij\n\n`,
 *   charsRange : 3,
 *   numberOfLines : 2,
 * });
 * //returns o.splits = [ 'a\n', 'b', 'c' ];
 * //returns o.spans = [ 1, 3, 4, 5 ];
 *
 * @method strLinesNearest
 * @throws { Exception } Throw an exception if no argument provided.
 * @throws { Exception } Throw an exception if( o.src ) is not a String.
 * @throws { Exception } Throw an exception if( o.charsRange ) is not a Array or Number.
 * @throws { Exception } Throw an exception if( o ) is extended by unknown property.
 * @memberof wTools
 */
    function strLinesNearest_pre(t, s) {
      let r = s[0];
      return void 0 !== s[1] && (r = {
        src: s[0],
        charsRange: s[1]
      }), e.routineOptions(t, r), e.numberIs(r.charsRange) && (r.charsRange = [ r.charsRange, r.charsRange + 1 ]), 
      e.assert(e.rangeIs(r.charsRange)), r;
    }
    //
        function strLinesNearest_body(t) {
      let e, s, r = Object.create(null);
      // let resultCharRange = [];
            /* */
      if (r.splits = [], r.spans = [ t.charsRange[0], t.charsRange[0], t.charsRange[1], t.charsRange[1] ], 
      logger.log("Result", r), logger.log(), 0 === t.numberOfLines) 
      // result = [];
      return r.splits = [], r.splits[0] = "", r.splits[1] = t.src.substring(t.charsRange[0], t.charsRange[1]), 
      r.splits[2] = "", r;
      /* */      let n = Math.ceil((t.numberOfLines + 1) / 2);
      if ((s = n) > 0) {
        for (e = t.charsRange[0] - 1; e >= 0 && ("\n" === t.src[e] && (s -= 1), !(s <= 0)); e--) ;
        e += 1;
      }
      if (r.spans[0] = e, (s = t.numberOfLines + 1 - n) > 0) for (e = t.charsRange[1]; e < t.src.length && ("\n" === t.src[e] && (s -= 1), 
      !(s <= 0)); e++) ;
      // result.splits[ 0 ] = o.src.substring( resultCharRange[ 0 ], o.charsRange[ 0 ] );
      // result.splits[ 1 ] = o.src.substring( o.charsRange[ 0 ], o.charsRange[ 1 ] );
      // result.splits[ 2 ] = o.src.substring( o.charsRange[ 1 ], resultCharRange[ 1 ] );
      return r.spans[3] = e, 
      /* */
      r.splits[0] = t.src.substring(r.spans[0], r.spans[1]), r.splits[1] = t.src.substring(r.spans[1], r.spans[2]), 
      r.splits[2] = t.src.substring(r.spans[2], r.spans[3]), r;
    }
    //
    function strLinesNearestReport_body(t) {
      let s = Object.create(null);
      debugger;
      s.nearest = e.strLinesNearest.body(t).splits, 
      // result.linesRange = _.strLinesRangeWithCharRange.body( o );
      s.report = s.nearest.slice(), t.gray || (s.report[1] = e.color.strUnescape(e.color.strFormat(s.report[1], {
        fg: "yellow"
      }))), s.report = s.report.join(""), s.report = e.strLinesSplit(s.report), t.gray || (s.report = e.color.strEscape(s.report));
      let r = e.strLinesCount(t.src.substring(0, t.charsRange[0])) - 1;
      s.report = e.strLinesNumber({
        src: s.report,
        first: r,
        onLine: s => {
          return t.gray || (s[0] = e.color.strFormat(s[0], {
            fg: "bright black"
          }), s[1] = e.color.strFormat(s[1], {
            fg: "bright black"
          })), s.join("");
        }
      });
      debugger;
      return s;
    }
    //
    function strLinesRangeWithCharRange_body(t) {
      let s = t.src.substring(0, t.charsRange[0]), r = t.src.substring(t.charsRange[0], t.charsRange[1]), n = [];
      return n[0] = e.strLinesCount(s) - 1, n[1] = n[0] + e.strLinesCount(r), n;
    }
    let t = _global_.wTools, e = (_global_, _global_.wTools);
    Array.prototype.slice, Function.prototype.bind, Object.prototype.toString, Object.hasOwnProperty, 
    e.longSlice, e.strType, strStrShort.defaults = {
      src: null,
      limit: 40,
      wrap: "'",
      escaping: 1
    }, strEscape.defaults = {
      src: null,
      stringWrapper: "'"
    }, strStrip.defaults = {
      src: null,
      stripper: /^(\s|\n|\0)+|(\s|\n|\0)+$/gm
    }, strStripLeft.defaults = {
      stripper: /^(\s|\n|\0)+/gm
    }, strStripLeft.defaults.__proto__ = strStrip.defaults, strStripRight.defaults = {
      stripper: /(\s|\n|\0)+$/gm
    }, strStripRight.defaults.__proto__ = strStrip.defaults, strSplitChunks.defaults = {
      src: null,
      investigate: 1,
      prefix: "//>--\x3e//",
      postfix: "//<--<//"
    }, strSplitsCoupledGroup.defaults = {
      splits: null,
      prefix: '"',
      postfix: '"',
      allowingUncoupledPrefix: 0,
      allowingUncoupledPostfix: 0
    }, strSplitsUngroupedJoin.defaults = {
      splits: null
    }, strSplitsQuotedRejoin_body.defaults = {
      quoting: 1,
      quotingPrefixes: null,
      quotingPostfixes: null,
      preservingQuoting: 1,
      inliningQuoting: 1,
      splits: null,
      delimeter: null
    };
    //
    let s = e.routineFromPreAndBody(
    //
    function strSplitsQuotedRejoin_pre(t, s) {
      let r = s[0];
      return e.routineOptions(t, r), e.assert(2 === arguments.length, "Expects exactly two arguments"), 
      e.assert(1 === s.length, "Expects one or two arguments"), e.assert(e.objectIs(r)), 
      r.quoting && (e.boolLike(r.quoting) ? (r.quotingPrefixes || (r.quotingPrefixes = [ '"' ]), 
      r.quotingPostfixes || (r.quotingPostfixes = [ '"' ])) : e.strIs(r.quoting) || e.regexpIs(r.quoting) || e.arrayIs(r.quoting) ? (e.assert(!r.quotingPrefixes), 
      e.assert(!r.quotingPostfixes), r.quoting = e.arrayAs(r.quoting), r.quotingPrefixes = r.quoting, 
      r.quotingPostfixes = r.quoting, r.quoting = !0) : e.assert(0, "unexpected type of {-o.quoting-}"), 
      e.assert(r.quotingPrefixes.length === r.quotingPostfixes.length), e.assert(e.boolLike(r.quoting))), 
      r;
    }, strSplitsQuotedRejoin_body);
    // --
    //
    // --
        strSplitsDropDelimeters_body.defaults = {
      splits: null,
      delimeter: null
    };
    //
        let r = e.routineFromPreAndBody(function strSplitsDropDelimeters_pre(t, s) {
      let r = s[0];
      return e.routineOptions(t, r), e.strIs(r.delimeter) && (r.delimeter = [ r.delimeter ]), 
      e.assert(2 === arguments.length, "Expects exactly two arguments"), e.assert(1 === s.length), 
      e.assert(e.objectIs(r)), r;
    }, strSplitsDropDelimeters_body);
    // --
    //
    // --
        strSplitsStrip_body.defaults = {
      stripping: 1,
      splits: null
    };
    //
        let n = e.routineFromPreAndBody(function strSplitsStrip_pre(t, s) {
      let r = s[0];
      return e.routineOptions(t, r), r.stripping && e.boolLike(r.stripping) && (r.stripping = e.strStrip.defaults.stripper), 
      e.assert(2 === arguments.length, "Expects exactly two arguments"), e.assert(1 === s.length), 
      e.assert(e.objectIs(r)), e.assert(!r.stripping || e.strIs(r.stripping) || e.regexpIs(r.stripping)), 
      r;
    }, strSplitsStrip_body);
    // --
    //
    // --
        strSplitsDropEmpty_body.defaults = {
      splits: null
    };
    //
        let i = e.routineFromPreAndBody(function strSplitsDropEmpty_pre(t, s) {
      let r = s[0];
      return e.routineOptions(t, r), e.assert(2 === arguments.length, "Expects exactly two arguments"), 
      e.assert(1 === s.length), e.assert(e.objectIs(r)), r;
    }, strSplitsDropEmpty_body);
    strSplitFast_body.defaults = {
      src: null,
      delimeter: " ",
      preservingEmpty: 1,
      preservingDelimeters: 1
    };
    //
    /**
 * Divides source string( o.src ) into parts using delimeter provided by argument( o.delimeter ).
 * If( o.stripping ) is true - removes leading and trailing whitespace characters.
 * If( o.preservingEmpty ) is true - empty lines are saved in the result array.
 * If( o.preservingDelimeters ) is true - leaves word delimeters in result array, otherwise removes them.
 * Function can be called in two ways:
 * - First to pass only source string and use default options;
 * - Second to pass map like ( { src : 'a, b, c', delimeter : ', ', stripping : 1 } ).
 * Returns result as array of strings.
 *
 * @param {string|object} o - Source string to split or map with source( o.src ) and options.
 * @param {string} [ o.src=null ] - Source string.
 * @param {string|array} [ o.delimeter=' ' ] - Word divider in source string.
 * @param {boolean} [ o.preservingEmpty=false ] - Leaves empty strings in the result array.
 * @param {boolean} [ o.preservingDelimeters=false ] - Puts delimeters into result array in same order how they was in the source string.
 * @param {boolean} [ o.stripping=true ] - Removes leading and trailing whitespace characters occurrences from source string.
 * @returns {object} Returns an array of strings separated by( o.delimeter ).
 *
 * @example
 * //returns [ 'first', 'second', 'third' ]
 * _.strSplitFast( ' first second third ' );
 *
 * @example
 * //returns [ 'a', 'b', 'c', 'd' ]
 * _.strSplitFast( { src : 'a, b, c, d', delimeter : ', '  } );
 *
 * @example
 * //returns [ 'a', 'b', 'c', 'd' ]
 * _.strSplitFast( { src : 'a.b, c.d', delimeter : [ '.', ', ' ]  } );
 *
 * @example
 * //returns [ '    a', 'b', 'c', 'd   ' ]
   * _.strSplitFast( { src : '    a, b, c, d   ', delimeter : [ ', ' ], stripping : 0  } );
 *
 * @example
 * //returns [ 'a', ', ', 'b', ', ', 'c', ', ', 'd' ]
 * _.strSplitFast( { src : 'a, b, c, d', delimeter : [ ', ' ], preservingDelimeters : 1  } );
 *
 * @example
 * //returns [ 'a', '', 'b', '', 'c', '', 'd' ]
 * _.strSplitFast( { src : 'a ., b ., c ., d', delimeter : [ ', ', '.' ], preservingEmpty : 1  } );
 *
 * @method strSplitFast
 * @throws { Exception } Throw an exception if( arguments.length ) is not equal 1 or 2.
 * @throws { Exception } Throw an exception if( o.src ) is not a String.
 * @throws { Exception } Throw an exception if( o.delimeter ) is not a String or an Array.
 * @throws { Exception } Throw an exception if object( o ) has been extended by invalid property.
 * @memberof wTools
 *
 */    let l = e.routineFromPreAndBody(strSplitFast_pre, strSplitFast_body);
    e.assert(l.pre === strSplitFast_pre), e.assert(l.body === strSplitFast_body), e.assert(e.objectIs(l.defaults)), 
    (p = strSplit_body.defaults = Object.create(strSplitFast_body.defaults)).preservingEmpty = 1, 
    p.preservingDelimeters = 1, p.preservingQuoting = 1, p.inliningQuoting = 1, p.stripping = 1, 
    p.quoting = 1, p.quotingPrefixes = null, p.quotingPostfixes = null, p.onDelimeter = null, 
    p.onQuote = null;
    //
    /**
 * Divides source string( o.src ) into parts using delimeter provided by argument( o.delimeter ).
 * If( o.stripping ) is true - removes leading and trailing whitespace characters.
 * If( o.preservingEmpty ) is true - empty lines are saved in the result array.
 * If( o.preservingDelimeters ) is true - leaves word delimeters in result array, otherwise removes them.
 * Function can be called in two ways:
 * - First to pass only source string and use default options;
 * - Second to pass map like ( { src : 'a, b, c', delimeter : ', ', stripping : 1 } ).
 * Returns result as array of strings.
 *
 * @param {string|object} o - Source string to split or map with source( o.src ) and options.
 * @param {string} [ o.src=null ] - Source string.
 * @param {string|array} [ o.delimeter=' ' ] - Word divider in source string.
 * @param {boolean} [ o.preservingEmpty=false ] - Leaves empty strings in the result array.
 * @param {boolean} [ o.preservingDelimeters=false ] - Puts delimeters into result array in same order how they was in the source string.
 * @param {boolean} [ o.stripping=true ] - Removes leading and trailing whitespace characters occurrences from source string.
 * @returns {object} Returns an array of strings separated by( o.delimeter ).
 *
 * @example
 * //returns [ 'first', 'second', 'third' ]
 * _.strSplit( ' first second third ' );
 *
 * @example
 * //returns [ 'a', 'b', 'c', 'd' ]
 * _.strSplit( { src : 'a, b, c, d', delimeter : ', '  } );
 *
 * @example
 * //returns [ 'a', 'b', 'c', 'd' ]
 * _.strSplit( { src : 'a.b, c.d', delimeter : [ '.', ', ' ]  } );
 *
 * @example
 * //returns [ '    a', 'b', 'c', 'd   ' ]
   * _.strSplit( { src : '    a, b, c, d   ', delimeter : [ ', ' ], stripping : 0  } );
 *
 * @example
 * //returns [ 'a', ', ', 'b', ', ', 'c', ', ', 'd' ]
 * _.strSplit( { src : 'a, b, c, d', delimeter : [ ', ' ], preservingDelimeters : 1  } );
 *
 * @example
 * //returns [ 'a', '', 'b', '', 'c', '', 'd' ]
 * _.strSplit( { src : 'a ., b ., c ., d', delimeter : [ ', ', '.' ], preservingEmpty : 1  } );
 *
 * @method strSplit
 * @throws { Exception } Throw an exception if( arguments.length ) is not equal 1 or 2.
 * @throws { Exception } Throw an exception if( o.src ) is not a String.
 * @throws { Exception } Throw an exception if( o.delimeter ) is not a String or an Array.
 * @throws { Exception } Throw an exception if object( o ) has been extended by invalid property.
 * @memberof wTools
 *
 */
    let o = [ l.pre, s.pre, r.pre, n.pre, i.pre ], a = e.routineFromPreAndBody(o, strSplit_body);
    e.assert(a.pre !== l.pre), e.assert(e.routineIs(a.pre)), e.assert(a.body === strSplit_body), 
    e.assert(e.objectIs(a.defaults));
    //
    let g = e.routineFromPreAndBody(a.pre, a.body);
    var p;
    (p = g.defaults).preservingEmpty = 0, p.preservingDelimeters = 0, _strExtractInlined_body.defaults = {
      src: null,
      delimeter: null,
      // delimeterLeft : null,
      // delimeterRight : null,
      stripping: 0,
      quoting: 0,
      onOrdinary: null,
      onInlined: t => [ t ],
      preservingEmpty: 1,
      preservingDelimeters: 0,
      preservingOrdinary: 1,
      preservingInlined: 1
    };
    //
    let u = e.routineFromPreAndBody(strSplitFast_pre, _strExtractInlined_body);
    //
        strExtractInlinedStereo.defaults = {
      src: null,
      prefix: "#",
      postfix: "#",
      onInlined: null
    }, strUnjoin.any = e.any, e.assert(e.routineIs(strUnjoin.any)), strJoin_body.defaults = {
      srcs: null,
      join: null,
      str: e.strPrimitive
    };
    let c = e.routineFromPreAndBody(
    //
    /**
 * Joins objects inside the source array, by concatenating their values in order that they are specified.
 * The source array can contain strings, numbers and arrays. If arrays are provided, they must have same length.
 * Joins arrays by concatenating all elements with same index into one string and puts it into new array at same position.
 * Joins array with other object by concatenating each array element with that object value. Examples: ( [ [ 1, 2 ], 3 ] ) -> ( [ '13', '23' ] ),
 * ( [ [ 1, 2 ], [ 1, 2] ] ) -> ( [ '11', '22' ] ).
 * An optional second string argument can be passed to the function. This argument ( joiner ) defines the string that joins the
 * srcArray objects.  Examples: ( [ [ 1, 2 ], 3 ], '*' ) -> ( [ '1*3', '2*3' ] ),
 * ( [ [ 1, 2 ], [ 1, 2 ] ], ' to ' ) -> ( [ '1 to 1', '2 to 2' ] ).
 *
 * @param { Array-like } srcs - Source array with the provided objects.
 * @param { String } joiner - Optional joiner parameter.
 * @returns { Object } Returns concatenated objects as string or array. Return type depends from arguments type.
 *
 * @example
 * //returns '123'
 * _.strJoin([ 1, 2, 3 ]);
 *
 * @example
 * //returns [ '12', '22', '32' ]
 * _.strJoin([ [ 1, 2, 3 ], 2 ]);
 *
 * @example
 * //returns [ '11', '23' ]
 * _.strJoin([ [ 1, 2 ], [ 1, 3 ] ]);
 *
 * @example
 * //returns [ '1236', '1247', '1258' ]
 * _.strJoin([ 1, 2, [ 3, 4, 5 ], [ 6, 7, 8 ] ]);
 *
 * @example
 * //returns [ '1 2 3 6', '1 2 4 7', '1 2 5 8' ]
 * _.strJoin([ 1, 2, [ 3, 4, 5 ], [ 6, 7, 8 ] ], ' ');
 *
 * @method strJoin
 * @throws { Exception } If ( arguments.length ) is not one or two.
 * @throws { Exception } If some object from( srcs ) is not a Array, String or Number.
 * @throws { Exception } If length of arrays in srcs is different.
 * @throws { Exception } If ( joiner ) is not undefined or a string .
 * @memberof wTools
 *
 */
    function strJoin_pre(t, s) {
      let r = s[0];
      return (void 0 !== s[1] || e.arrayLike(s[0])) && (r = {
        srcs: s[0],
        join: s[1]
      }), e.routineOptions(t, r), e.assert(2 === arguments.length), e.assert(1 === s.length || 2 === s.length, () => "Expects an array of string and optional join, but got " + s.length + " arguments"), 
      e.assert(e.arrayLike(r.srcs), () => "Expects an array of strings, but got " + e.strType(r.srcs)), 
      e.assert(null === r.join || e.strIs(r.join), () => "Expects optional join, but got " + e.strType(r.join)), 
      r;
    }, strJoin_body);
    //
        strConcat.defaults = {
      linePrefix: "",
      linePostfix: "",
      lineDelimter: "\n",
      delimeter: " ",
      optionsForToStr: null
    }, strLinesNumber.defaults = {
      src: null,
      first: null,
      firstChar: null,
      onLine: null
    }, strLinesSelect.defaults = {
      src: null,
      range: null,
      line: null,
      numberOfLines: 3,
      selectMode: "center",
      number: 0,
      zero: 1,
      delimteter: "\n"
    }, strLinesNearest_body.defaults = {
      src: null,
      charsRange: null,
      numberOfLines: 3
    };
    // --
    // liner
    // --
    /**
 * Adds indentation character(s) to passed string.
 * If( src ) is a multiline string, function puts indentation character( tab ) before first
 * and every next new line in a source string( src ).
 * If( src ) represents single line, function puts indentation at the begining of the string.
 * If( src ) is a Array, function prepends indentation character( tab ) to each line( element ) of passed array.
 *
 * @param { String/Array } src - Source string to parse or array of lines( not array of texts ).
 * With line we mean it does not have eol. Otherwise please join the array to let the routine to resplit the text,
 * like that: _.strIndentation( array.join( '\n' ), '_' ).
 * @param { String } tab - Indentation character.
 * @returns { String } Returns indented string.
 *
 * @example
 *  _.strIndentation( 'abc', '_' )
 * //returns '_abc'
 *
 * @example
 * _.strIndentation( 'a\nb\nc', '_' )
 * //returns
 * _a
 * _b
 * _c
 *
 * @example
 * _.strIndentation( [ 'a', 'b', 'c' ], '_' )
 * //returns
 * _a
 * _b
 * _c
 *
 * @example
 * let array = [ 'a\nb', 'c\nd' ];
 * _.strIndentation( array.join( '\n' ), '_' )
 * //returns
 * _a
 * _b
 * _c
 * _d
 *
 * @method strIndentation
 * @throws { Exception } Throw an exception if( src ) is not a String or Array.
 * @throws { Exception } Throw an exception if( tab ) is not a String.
 * @throws { Exception } Throw an exception if( arguments.length ) is not a equal 2.
 * @memberof wTools
 *
 */
    /*
qqq : extend coverage of strIndentation
*/    let f = e.routineFromPreAndBody(strLinesNearest_pre, strLinesNearest_body);
    strLinesNearestReport_body.defaults = {
      src: null,
      charsRange: null,
      numberOfLines: 3,
      gray: 0
    };
    let h = e.routineFromPreAndBody(strLinesNearest_pre, strLinesNearestReport_body);
    //
    /**
 * Returns a count of lines in a string.
 * Expects one object: the string( src ) to be processed.
 *
 * @param {string} src - Source string.
 * @returns {number} Returns a number of lines in string.
 *
 * @example
 * //returns 2
 * _.strLinesCount( 'first\nsecond' );
 *
 * @example
 * //returns 4
 * _.strLinesCount( 'first\nsecond\nthird\n' );
 *
 * @method strLinesCount
 * @throws { Exception } Throw an exception if( src ) is not a String.
 * @throws { Exception } Throw an exception if no argument provided.
 * @memberof wTools
 *
*/    strLinesRangeWithCharRange_body.defaults = {
      src: null,
      charsRange: null
    };
    let d = e.routineFromPreAndBody(
    //
    function strLinesRangeWithCharRange_pre(t, s) {
      let r = s[0];
      return void 0 !== s[1] && (r = {
        src: s[0],
        charsRange: s[1]
      }), e.assert(2 === arguments.length), e.assert(1 === s.length || 2 === s.length), 
      e.assert(e.rangeIs(r.charsRange)), e.assert(e.strIs(r.src)), e.routineOptions(t, r), 
      r;
    }, strLinesRangeWithCharRange_body), m = {
      // checker
      strIsHex: 
      // --
      // checker
      // --
      function strIsHex(t) {
        e.assert(e.strIs(t)), e.assert(1 === arguments.length);
        let s = parseInt(t, 16);
        return !isNaN(s) && s.toString(16).length === t.length;
      }
      //
      ,
      strIsMultilined: function strIsMultilined(t) {
        return !!e.strIs(t) && -1 !== t.indexOf("\n");
      },
      strHas: strHas,
      strHasAny: function strHasAny(t, s) {
        if (e.assert(2 === arguments.length, "Expects exactly two arguments"), e.arrayIs(s)) {
          for (let e = 0; e < s.length; e++) if (strHas(t, s[e])) return !0;
          return !1;
        }
        return strHas(t, s);
      }
      //
      ,
      strHasAll: function strHasAll(t, s) {
        if (e.assert(2 === arguments.length, "Expects exactly two arguments"), e.arrayIs(s)) {
          for (let e = 0; e < s.length; e++) if (!strHas(t, s[e])) return !1;
          return !0;
        }
        return strHas(t, s);
      }
      //
      ,
      strHasNone: function strHasNone(t, s) {
        if (e.assert(2 === arguments.length, "Expects exactly two arguments"), e.arrayIs(s)) {
          for (let e = 0; e < s.length; e++) if (strHas(t, s[e])) return !1;
          return !0;
        }
        return !strHas(t, s);
      }
      //
      ,
      strHasSeveral: function strHasSeveral(t, s) {
        let r = 0;
        if (e.assert(2 === arguments.length, "Expects exactly two arguments"), e.arrayIs(s)) {
          for (let e = 0; e < s.length; e++) strHas(t, s[e]) && (r += 1);
          return r;
        }
        return strHas(t, s) ? 1 : 0;
      }
      //
      ,
      strsAnyHas: function strsAnyHas(t, s) {
        return e.assert(e.strIs(t) || e.strsAreAll(t)), e.assert(e.strIs(s)), e.strIs(t) ? e.strHas(t, s) : t.some(t => e.strHas(t, s));
      }
      //
      ,
      strsAllHas: function strsAllHas(t, s) {
        return e.assert(e.strIs(t) || e.strsAreAll(t)), e.assert(e.strIs(s)), e.strIs(t) ? e.strHas(t, s) : t.every(t => e.strHas(t, s));
      }
      //
      ,
      strsNoneHas: function strsNoneHas(t, s) {
        return e.assert(e.strIs(t) || e.strsAreAll(t)), e.assert(e.strIs(s)), e.strIs(t) ? !e.strHas(t, s) : t.every(t => !e.strHas(t, s));
      }
      // --
      // evaluator
      // --
      /**
 * Returns number of occurrences of a substring( ins ) in a string( src ),
 * Expects two objects in order: source string, substring.
 * Returns zero if one of arguments is empty string.
 *
 * @param {string} src - Source string.
 * @param {string} ins - Substring.
 * @returns {Number} Returns number of occurrences of a substring in a string.
 *
 * @example
 * //returns 2
 * _.strCount( 'aabab', 'ab' );
 *
 * @example
 * //returns 0
 * _.strCount( 'aabab', '' );
 *
 * @method strCount
 * @throws { Exception } Throw an exception if( src ) is not a String.
 * @throws { Exception } Throw an exception if( ins ) is not a String.
 * @throws { Exception } Throw an exception if( arguments.length ) is not equal 2.
 * @memberof wTools
 *
 */ ,
      // evaluator
      strCount: function strCount(t, s) {
        let r = 0;
        e.assert(2 === arguments.length, "Expects exactly two arguments"), e.assert(e.strIs(t)), 
        e.assert(e.strLike(s));
        let n = 0;
        do {
          let i = e.strLeft(t, s, n);
          if (void 0 === i.entry) break;
          n = i.index + i.entry.length, i.entry.length || (n += 1), r += 1, e.assert(-1 !== n, "not tested");
        } while (-1 !== n && n < t.length);
        return r;
      }
      // //
      //
      // function strCountLeft( src, ins )
      // {
      //   let result = 0;
      //
      //   _.assert( arguments.length === 2, 'Expects exactly two arguments' );
      //   _.assert( _.strIs( src ) );
      //   _.assert( _.strIs( ins ) );
      //
      //   if( !ins.length )
      //   return 0;
      //
      //   let i = 0;
      //   do
      //   {
      //     if( src.substring( i, i+ins.length ) !== ins )
      //     break;
      //     result += 1;
      //     i += ins.length;
      //   }
      //   while( i < src.length );
      //
      //   return result;
      // }
      //
      // //
      //
      // function strCountRight( src, ins )
      // {
      //   let result = 0;
      //
      //   _.assert( arguments.length === 2, 'Expects exactly two arguments' );
      //   _.assert( _.strIs( src ) );
      //   _.assert( _.strIs( ins ) );
      //
      //   throw _.err( 'not tested' );
      //
      //   if( !ins.length )
      //   return 0;
      //
      //   let i = src.length;
      //   do
      //   {
      //     if( src.substring( i-ins.length, i ) !== ins )
      //     break;
      //     result += 1;
      //     i -= ins.length;
      //   }
      //   while( i > 0 );
      //
      //   return result;
      // }
      //
      ,
      // strCountLeft,
      // strCountRight,
      strsShortest: function strsShortest(t) {
        return e.assert(1 === arguments.length), e.assert(e.strIs(t) || e.arrayLike(t)), 
        e.strIs(t) ? t : t.sort((t, e) => t.length - e.length)[0];
      }
      //
      ,
      strsLongest: function strsLongest() {
        return e.assert(1 === arguments.length), e.assert(e.strIs(src) || e.arrayLike(src)), 
        e.strIs(src) ? src : src.sort((t, e) => e.length - t.length)[0];
      }
      // --
      // replacer
      // --
      ,
      // replacer
      _strRemovedBegin: function _strRemovedBegin(t, s) {
        e.assert(2 === arguments.length, "Expects exactly two arguments"), e.assert(e.strIs(t), "Expects string {-src-}");
        let r = t, n = e._strBeginOf(r, s);
        return !1 !== n && (r = r.substr(n.length, r.length)), r;
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
      strRemoveBegin: function strRemoveBegin(t, s) {
        e.assert(2 === arguments.length, "Expects exactly two arguments"), e.assert(e.longIs(t) || e.strIs(t), "Expects string or array of strings {-src-}"), 
        e.assert(e.longIs(s) || e.strIs(s) || e.regexpIs(s), "Expects string/regexp or array of strings/regexps {-begin-}");
        let r = [], n = e.longIs(t);
        if (e.strIs(t) && !e.longIs(s)) return e._strRemovedBegin(t, s);
        t = e.arrayAs(t), s = e.arrayAs(s);
        for (let n = 0, i = t.length; n < i; n++) {
          let i = !1, l = t[n];
          for (let t = 0, r = s.length; t < r && !1 === (i = e._strBeginOf(l, s[t])); t++) ;
          !1 !== i && (l = l.substr(i.length, l.length)), r[n] = l;
        }
        return n ? r : r[0];
      }
      //
      ,
      _strRemovedEnd: function _strRemovedEnd(t, s) {
        e.assert(2 === arguments.length, "Expects exactly two arguments"), e.assert(e.strIs(t), "Expects string {-src-}");
        let r = t, n = e._strEndOf(r, s);
        return !1 !== n && (r = r.substr(0, r.length - n.length)), r;
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
      strRemoveEnd: function strRemoveEnd(t, s) {
        e.assert(2 === arguments.length, "Expects exactly two arguments"), e.assert(e.longIs(t) || e.strIs(t), "Expects string or array of strings {-src-}"), 
        e.assert(e.longIs(s) || e.strIs(s) || e.regexpIs(s), "Expects string/regexp or array of strings/regexps {-end-}");
        let r = [], n = e.longIs(t);
        if (e.strIs(t) && !e.longIs(s)) return e._strRemovedEnd(t, s);
        t = e.arrayAs(t), s = e.arrayAs(s);
        for (let n = 0, i = t.length; n < i; n++) {
          let i = !1, l = t[n];
          for (let t = 0, r = s.length; t < r && !1 === (i = e._strEndOf(l, s[t])); t++) ;
          !1 !== i && (l = l.substr(0, l.length - i.length)), r[n] = l;
        }
        return n ? r : r[0];
      }
      //
      ,
      _strRemoved: function _strRemoved(t, s) {
        let r = t;
        if (e.assert(2 === arguments.length, "expects exactly two arguments"), e.assert(e.strIs(t), "expects string {-src-}"), 
        e.longIs(s)) for (let t = 0; t < s.length; t++) r = r.replace(s[t], ""); else r = r.replace(s, "");
        return r;
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
      strRemove: function strRemove(t, s) {
        e.assert(2 === arguments.length, "expects exactly two arguments"), e.assert(e.longIs(t) || e.strIs(t), "expects string or array of strings {-src-}"), 
        e.assert(e.longIs(s) || e.strIs(s) || e.regexpIs(s), "expects string/regexp or array of strings/regexps {-begin-}");
        let r = [], n = e.longIs(t);
        if (e.strIs(t) && !e.longIs(t)) return e._strRemoved(t, s);
        t = e.arrayAs(t);
        for (let n = 0; n < t.length; n++) {
          let i = t[n];
          r[n] = e._strRemoved(i, s);
        }
        return n ? r : r[0];
      }
      //
      ,
      strReplaceBegin: function strReplaceBegin(t, s, r) {
        e.assert(3 === arguments.length, "Expects exactly three arguments"), e.assert(e.strIs(r) || e.longIs(r), "Expects {-ins-} as string/array of strings"), 
        e.longIs(s) && e.longIs(r) && e.assert(s.length === r.length), s = e.arrayAs(s);
        let n = e.arrayAs(t).slice();
        for (let t = 0, i = n.length; t < i; t++) for (let i = 0, l = s.length; i < l; i++) if (e.strBegins(n[t], s[i])) {
          let l = e.longIs(r) ? r[i] : r;
          e.assert(e.strIs(l)), n[t] = l + e.strRemoveBegin(n[t], s[i]);
          break;
        }
        return 1 === n.length && e.strIs(t) ? n[0] : n;
      }
      //
      ,
      strReplaceEnd: function strReplaceEnd(t, s, r) {
        e.assert(3 === arguments.length, "Expects exactly three arguments"), e.assert(e.strIs(r) || e.longIs(r), "Expects {-ins-} as string/array of strings"), 
        e.longIs(s) && e.longIs(r) && e.assert(s.length === r.length), s = e.arrayAs(s);
        let n = e.arrayAs(t).slice();
        for (let t = 0, i = n.length; t < i; t++) for (let i = 0, l = s.length; i < l; i++) if (e.strEnds(n[t], s[i])) {
          let l = e.longIs(r) ? r[i] : r;
          e.assert(e.strIs(l)), n[t] = e.strRemoveEnd(n[t], s[i]) + l;
        }
        return 1 === n.length && e.strIs(t) ? n[0] : n;
      }
      //
      ,
      _strReplaced: function _strReplaced(t, s, r) {
        e.assert(3 === arguments.length, "expects exactly three arguments"), e.assert(e.strIs(t), "expects string {-src-}");
        let n = t;
        if (e.longIs(s)) {
          e.assert(s.length === r.length, "Search and replace strings must have same length");
          for (let t = 0; t < s.length; t++) e.assert(e.strIs(r[t]), "expects string {-sub-}"), 
          n = n.replace(s[t], r[t]);
        } else e.assert(e.strIs(r), "expects string {-sub-}"), n = n.replace(s, r);
        return n;
      }
      //
      /**
* Finds substring or regexp ( insStr ) occurrence from the source string ( srcStr ) and replaces them
* with the subStr values.
* Returns original string if source( src ) does not have occurrence of ( insStr ).
*
* @param { String } srcStr - Source string to parse.
* @param { String } insStr - String/RegExp that is to be replaced.
* @param { String } subStr - Replacement String/RegExp.
* @returns { String } Returns string with result of substring replacement.
*
* @example
* //returns Source string
* _.strReplace( 'source string', 's', 'S' );
*
* @example
* //returns example
* _.strReplace( 'example', 's' );
*
* @function strReplace
* @throws { Exception } Throws a exception if( srcStr ) is not a String.
* @throws { Exception } Throws a exception if( insStr ) is not a String or a RegExp.
* @throws { Exception } Throws a exception if( subStr ) is not a String.
* @throws { Exception } Throws a exception if( arguments.length ) is not equal 3.
* @memberof wTools
*
*/ ,
      strReplace: function strReplace(t, s, r) {
        e.assert(3 === arguments.length, "expects exactly three arguments"), e.assert(e.longIs(t) || e.strIs(t), "expects string or array of strings {-src-}"), 
        e.assert(e.longIs(s) || e.strIs(s) || e.regexpIs(s), "expects string/regexp or array of strings/regexps {-begin-}"), 
        e.assert(e.longIs(r) || e.strIs(r), "expects string or array of strings {-src-}");
        let n = [], i = e.longIs(t);
        if (e.strIs(t) && !e.longIs(t)) return e._strReplaced(t, s, r);
        t = e.arrayAs(t);
        for (let i = 0; i < t.length; i++) {
          let l = t[i];
          n[i] = e._strReplaced(l, s, r);
        }
        return i ? n : n[0];
      }
      //
      /**
  * Prepends string( begin ) to the source( src ) if prefix( begin ) is not match with first chars of string( src ),
  * otherwise returns original string.
  * @param { String } src - Source string to parse.
  * @param { String } begin - String to prepend.
  *
  * @example
  * _.strPrependOnce( 'test', 'test' );
  * //returns 'test'
  *
  * @example
  * _.strPrependOnce( 'abc', 'x' );
  * //returns 'xabc'
  *
  * @returns { String } Returns result of prepending string( begin ) to source( src ) or original string.
  * @function strPrependOnce
  * @memberof wTools
  */ ,
      strPrependOnce: function strPrependOnce(t, s) {
        return e.assert(e.strIs(t) && e.strIs(s), "Expects {-src-} and {-begin-} as strings"), 
        0 === t.lastIndexOf(s, 0) ? t : s + t;
      }
      //
      /**
  * Appends string( end ) to the source( src ) if postfix( end ) is not match with last chars of string( src ),
  * otherwise returns original string.
  * @param {string} src - Source string to parse.
  * @param {string} end - String to append.
  *
  * @example
  * _.strAppendOnce( 'test', 'test' );
  * //returns 'test'
  *
  * @example
  * _.strAppendOnce( 'abc', 'x' );
  * //returns 'abcx'
  *
  * @returns {string} Returns result of appending string( end ) to source( src ) or original string.
  * @function strAppendOnce
  * @memberof wTools
  */ ,
      strAppendOnce: function strAppendOnce(t, s) {
        return e.assert(e.strIs(t) && e.strIs(s), "Expects {-src-} and {-end-} as strings"), 
        -1 !== t.indexOf(s, t.length - s.length) ? t : t + s;
      }
      // --
      // etc
      // --
      /**
 * Replaces occurrence of each word from array( ins ) in string( src ) with word
 * from array( sub ) considering it position.
 * @param {string} src - Source string to parse.
 * @param {array} ins - Array with strings to replace.
 * @param {string} sub - Array with new strings.
 * @returns {string} Returns string with result of replacements.
 *
 * @example
 * //returns ' your cars are'
 * _.strReplaceWords( ' my name is', [ 'my', 'name', 'is' ], [ 'your', 'cars', 'are' ] )
 *
 * @method strReplaceWords
 * @throws { Exception } Throws a exception if( ins ) is not a Array.
 * @throws { Exception } Throws a exception if( sub ) is not a Array.
 * @throws { TypeError } Throws a exception if( src ) is not a String.
 * @throws { Exception } Throws a exception if( arguments.length ) is not equal 3.
 * @memberof wTools
 *
 */ ,
      strReplaceWords: function strReplaceWords(t, s, r) {
        e.assert(3 === arguments.length, "Expects exactly three arguments"), e.assert(e.strIs(t)), 
        e.assert(e.arrayIs(s)), e.assert(e.arrayIs(r)), e.assert(s.length === r.length);
        let n = t;
        for (let t = 0; t < s.length; t++) {
          e.assert(e.strIs(s[t]));
          let i = new RegExp("(\\W|^)" + s[t] + "(?=\\W|$)", "gm");
          n = n.replace(i, function(e) {
            return e[0] !== r[t][0] ? e[0] + r[t] : r[t];
          });
        }
        return n;
      }
      // --
      // etc
      // --
      /**
 * Find common symbols from the begining of all strings passed to arguments list. Uses first argument( ins ) as pattern.
 * If some string doesn`t have the same first symbols as the pattern ( ins ), the function returns an empty string.
 * Otherwise, it returns the symbol sequence that appears from the start of each string.
 *
 * @param {string} ins - Sequence of possible symbols.
 * @returns {string} Returns found common symbols.
 *
 * @example
 * //returns 'a'
 * _.strCommonLeft( 'abcd', 'ab', 'abc', 'a' );
 *
 * @example
 * //returns 'abc'
 * _.strCommonLeft( 'abcd', 'abc', 'abcd' );
 *
 * @example
 * //returns ''
 * _.strCommonLeft( 'abcd', 'abc', 'd' )
 *
 * @method strCommonLeft
 * @throws {exception} If ( ins ) is not a String.
 * @memberof wTools
 *
 */ ,
      // etc
      strCommonLeft: function strCommonLeft(t) {
        if (0 === arguments.length) return "";
        if (1 === arguments.length) return t;
        e.assert(e.strIs(t));
        let s = Infinity;
        for (let t = 0; t < arguments.length; t++) {
          let e = arguments[t];
          s = Math.min(s, e.length);
        }
        let r = 0;
        for (;r < s; r++) for (let e = 1; e < arguments.length; e++) if (arguments[e][r] !== t[r]) return t.substring(0, r);
        return t.substring(0, r);
      }
      //
      /**
 * Finds common symbols from the end of all strings passed to arguments list. Uses first argument( ins ) as pattern.
 * If some string doesn`t have same last symbol with pattern( ins ), the function returns an empty string.
 * Otherwise, it returns the symbol sequence that appears from the end of each string.
 *
 * @param { String } ins - Sequence of possible symbols.
 * @returns { String } Returns found common symbols.
 *
 * @example 'ame'
 * _.strCommonRight( 'ame', 'same', 'name' );
 *
 * @example 'c'
 * _.strCommonRight( 'abc', 'dbc', 'ddc', 'aac' );
 *
 * @example ''
 * _.strCommonRight( 'abc', 'dba', 'abc' );
 *
 * @method strCommonRight
 * @throws {exception} If( ins ) is not a String.
 * @memberof wTools
 *
 */ ,
      /* document me */
      strCommonRight: function strCommonRight(t) {
        if (0 === arguments.length) return "";
        if (1 === arguments.length) return t;
        e.assert(e.strIs(t));
        let s = Infinity;
        for (let t = 0; t < arguments.length; t++) {
          let e = arguments[t];
          s = Math.min(s, e.length);
        }
        let r = 0;
        for (;r < s; r++) for (let e = 1; e < arguments.length; e++) {
          let s = arguments[e];
          if (s[s.length - r - 1] !== t[t.length - r - 1]) return t.substring(t.length - r);
        }
        return t.substring(t.length - r);
      }
      // --
      // formatter
      // --
      ,
      /* document me */
      // formatter
      strForRange: function strForRange(t) {
        return e.assert(1 === arguments.length), e.assert(e.arrayIs(t)), "[ " + t[0] + ".." + t[1] + " ]";
      }
      //
      ,
      /* experimental */
      strForCall: function strForCall(t, s, r, n) {
        let i = t + "( ", l = !0;
        return e.assert(e.arrayIs(s) || e.objectIs(s)), e.assert(arguments.length <= 4), 
        e.each(s, function(t, s) {
          !1 === l && (i += ", "), e.objectIs(t) ? i += s + " :" + e.toStr(t, n) : i += e.toStr(t, n), 
          l = !1;
        }), i += " )", arguments.length >= 3 && (i += " -> " + e.toStr(r, n)), i;
      },
      /* experimental */
      strStrShort: strStrShort,
      strDifference: 
      //
      function strDifference(t, s, r) {
        if (e.assert(e.strIs(t)), e.assert(e.strIs(s)), t === s) return !1;
        for (var n = 0, i = Math.min(t.length, s.length); n < i; n++) if (t[n] !== s[n]) return t.substr(0, n) + "*";
        return t.substr(0, n) + "*";
      }
      // --
      // transformer
      // --
      /**
 * Returns string with first letter converted to upper case.
 * Expects one object: the string to be formatted.
 *
 * @param {string} src - Source string.
 * @returns {String} Returns a string with the first letter capitalized.
 *
 * @example
 * //returns Test string
 * _.strCapitalize( 'test string' );
 *
 * @example
 * //returns Another_test_string
 * _.strCapitalize( 'another_test_string' );
 *
 * @method strCapitalize
 * @throws { Exception } Throw an exception if( src ) is not a String.
 * @throws { Exception } Throw an exception if( arguments.length ) is not equal 1.
 * @memberof wTools
 *
 */ ,
      // transformer
      strCapitalize: function strCapitalize(t) {
        /*_.assert( src.length > 0 );*/
        /*_.assert( src.match(/(^\W)/) === null );*/
        return e.assert(e.strIs(t)), e.assert(1 === arguments.length, "Expects single argument"), 
        0 === t.length ? t : t[0].toUpperCase() + t.substring(1);
      }
      //
      ,
      strDecapitalize: function strDecapitalize(t) {
        return e.assert(e.strIs(t)), e.assert(1 === arguments.length, "Expects single argument"), 
        0 === t.length ? t : t[0].toLowerCase() + t.substring(1);
      },
      strEscape: strEscape,
      strCodeUnicodeEscape: 
      //
      /**
 * Converts source string( src ) into unicode representation by replacing each symbol with its escaped unicode equivalent.
 * Example: ( 't' -> '\u0074' ). Returns result of conversion as new string or empty string if source has zero length.
 * @param {string} str - Source string to parse.
 * @returns {string} Returns string with result of conversion.
 *
 * @example
 * //returns \u0061\u0062\u0063;
 * _.strUnicodeEscape( 'abc' );
 *
 * @example
 * //returns \u0077\u006f\u0072\u006c\u0064
 * _.strUnicodeEscape( 'world' );
 *
 * @example
 * //returns \u002f\u002f\u0074\u0065\u0073\u0074\u002f\u002f
 * _.strUnicodeEscape( '//test//' );
 *
 * @method strUnicodeEscape
 * @throws { Exception } Throws a exception if no argument provided.
 * @throws { Exception } Throws a exception if( src ) is not a String.
 * @memberof wTools
 *
 */
      function strCodeUnicodeEscape(t) {
        e.assert(e.numberIs(t)), e.assert(1 === arguments.length, "Expects single argument");
        let s = t.toString(16);
        return "\\u" + (e.strDup("0", 4 - s.length) + s);
      }
      //
      /**
 * Converts source string( src ) into unicode representation by replacing each symbol with its escaped unicode equivalent.
 * Example: ( 't' -> '\u0074' ). Returns result of conversion as new string or empty string if source has zero length.
 * @param {string} str - Source string to parse.
 * @returns {string} Returns string with result of conversion.
 *
 * @example
 * //returns \u0061\u0062\u0063;
 * _.strUnicodeEscape( 'abc' );
 *
 * @example
 * //returns \u0077\u006f\u0072\u006c\u0064
 * _.strUnicodeEscape( 'world' );
 *
 * @example
 * //returns \u002f\u002f\u0074\u0065\u0073\u0074\u002f\u002f
 * _.strUnicodeEscape( '//test//' );
 *
 * @method strUnicodeEscape
 * @throws { Exception } Throws a exception if no argument provided.
 * @throws { Exception } Throws a exception if( src ) is not a String.
 * @memberof wTools
 *
 */ ,
      strUnicodeEscape: function strUnicodeEscape(t) {
        let s = "";
        e.assert(e.strIs(t)), e.assert(1 === arguments.length, "Expects single argument");
        for (let r = 0; r < t.length; r++) {
          let n = t.charCodeAt(r);
          s += e.strCodeUnicodeEscape(n);
        }
        return s;
      }
      //
      ,
      /* document me */
      strReverse: function strReverse(t) {
        e.assert(1 === arguments.length, "Expects single argument");
        let s = "";
        for (let e = 0; e < t.length; e++) s = t[e] + s;
        return s;
      },
      // stripper
      strStrip: strStrip,
      strsStrip: e.routineVectorize_functor(strStrip),
      strStripLeft: strStripLeft,
      strsStripLeft: e.routineVectorize_functor(strStripLeft),
      strStripRight: strStripRight,
      strsStripRight: e.routineVectorize_functor(strStripRight),
      strRemoveAllSpaces: e.routineVectorize_functor(
      //
      /**
 * Removes whitespaces from source( src ).
 * If argument( sub ) is defined, function replaces whitespaces with it.
 *
 * @param {string} src - Source string to parse.
 * @param {string} sub - Substring that replaces whitespaces.
 * @returns {string} Returns a string with removed whitespaces.
 *
 * @example
 * //returns abcde
 * _.strRemoveAllSpaces( 'a b c d e' );
 *
 * @example
 * //returns a*b*c*d*e
 * _.strRemoveAllSpaces( 'a b c d e', '*' );
 *
 * @method strRemoveAllSpaces
 * @memberof wTools
 *
*/
      function _strRemoveAllSpaces(t, s) {
        return e.assert(1 === arguments.length || 2 === arguments.length), e.assert(e.strIs(t)), 
        void 0 === s && (s = ""), t.replace(/\s/g, s);
      }
      //
      /**
 * Removes empty lines from the string passed by argument( srcStr ).
 *
 * @param {string} srcStr - Source string to parse.
 * @returns {string} Returns a string with empty lines removed.
 *
 * @example
 * //returns
 * //first
 * //second
 * _.strStripEmptyLines( 'first\n\nsecond' );
 *
 * @example
 * //returns
 * //zero
 * //first
 * //second
 * _.strStripEmptyLines( 'zero\n\nfirst\n\nsecond' );
 *
 * @method strStripEmptyLines
 * @throws { Exception } Throw an exception if( srcStr ) is not a String.
 * @throws { Exception } Throw an exception if( arguments.length ) is not equal 1.
 * @memberof wTools
 *
 */),
      strStripEmptyLines: e.routineVectorize_functor(function _strStripEmptyLines(t) {
        let s = "", r = t.split("\n");
        e.assert(e.strIs(t)), e.assert(1 === arguments.length, "Expects single argument");
        for (let t = 0; t < r.length; t += 1) {
          let n = r[t];
          e.strStrip(n) && (s += n + "\n");
        }
        return s.substring(0, s.length - 1);
      }
      // --
      // splitter
      // --
      /**
 * Parses a source string( src ) and separates numbers and string values
 * in to object with two properties: 'str' and 'number', example of result: ( { str: 'bd', number: 1 } ).
 *
 * @param {string} src - Source string.
 * @returns {object} Returns the object with two properties:( str ) and ( number ),
 * with values parsed from source string. If a string( src ) doesn't contain number( s ),
 * function returns the object with value of string( src ).
 *
 * @example
 * //returns { str: 'bd', number: 1 }
 * _.strSplitStrNumber( 'bd1' );
 *
 * @example
 * //returns { str: 'bdxf' }
 * _.strSplitStrNumber( 'bdxf' );
 *
 * @method strSplitStrNumber
 * @throws { Exception } Throw an exception if( src ) is not a String.
 * @throws { Exception } Throw an exception if no argument provided.
 * @memberof wTools
 *
 */),
      // splitter
      strSplitStrNumber: function strSplitStrNumber(t) {
        let s = Object.create(null);
        e.assert(1 === arguments.length, "Expects single argument"), e.assert(e.strIs(t));
        let r = t.match(/\d+/);
        if (r && r.length) {
          let n = t.match(/[^\d]*/);
          s.str = n[0], s.number = e.numberFrom(r[0]);
        } else s.str = t;
        return s;
      },
      /* experimental */
      strSplitChunks: strSplitChunks,
      /* experimental */
      strSplitsCoupledGroup: strSplitsCoupledGroup,
      strSplitsUngroupedJoin: strSplitsUngroupedJoin,
      strSplitsQuotedRejoin: s,
      strSplitsDropDelimeters: r,
      strSplitsStrip: n,
      strSplitsDropEmpty: i,
      strSplitFast: l,
      strSplit: a,
      strSplitNonPreserving: g,
      strSplitCamel: 
      //
      /*
qqq : cover it by test
*/
      function strSplitCamel(t) {
        let s = e.strSplitFast(t, /[A-Z]/);
        for (let t = s.length - 2; t >= 0; t--) t % 2 == 1 && s.splice(t, 2, s[t].toLowerCase() + s[t + 1]);
        return s;
      }
      // --
      // extractor
      // --
      /**
 * Gets substring out of source string according to a given range.
 * The end value of the range is not included in the substring.
 * Returns result as string.
 *
 * @param {string} srcStr - Source string.
 * @param {range} range - Source range.
 * @returns {string} Returns the corresponding substring.
 *
 * @example
 * //returns [ 'first', [ 0, 2 ] ]
 * _.strSub( 'fi' );
 *
 * @method strSub
 * @throws { Exception } Throw an exception if( arguments.length ) is not equal 2.
 * @throws { Exception } Throw an exception if( srcStr ) is not a String.
 * @throws { Exception } Throw an exception if( range ) is not a range.
 * @memberof wTools
 *
 */ ,
      // strSplitNaive,
      // extractor
      strSub: e.routineVectorize_functor(function _strSub(t, s) {
        return e.assert(2 === arguments.length, "Expects exactly two arguments"), e.assert(e.strIs(t)), 
        e.assert(e.rangeIs(s)), t.substring(s[0], s[1]);
      }),
      strExtractInlined: u,
      strExtractInlinedStereo: strExtractInlinedStereo,
      strUnjoin: strUnjoin,
      /* document me */
      // joiner
      strDup: e.routineVectorize_functor(
      // --
      // joiner
      // --
      /**
 * Returns a string with the source string appended to itself n-times.
 * Expects two objects: source string( s ) ( or array of strings ) and number of concatenations( times ).
 * The string ( s ) and the number ( times ) remain unchanged.
 *
 * @param { Array/String } s - Source array of strings / source string.
 * @param { Number } times - Number of concatenation cycles.
 * @returns { String } - Returns a string containing the src string concatenated n-times.
 *
 * @example
 * //returns WordWordWordWordWord
 * _.strDup( 'Word', 5 );
 *
 * @example
 * //returns 1 21 2
 * _.strDup( '1 '+'2', 2 );
 *
 * @example
 * //returns [ 'abab', 'dd', '3 43 4']
 * _.strDup( [ 'ab', 'd', '3 4'], 2 );
 *
 * @method strDup
 * @throws { Exception } Throw an exception if( s ) is not a String or an array of strings.
 * @throws { Exception } Throw an exception if( times ) is not a Number.
 * @throws { Exception } Throw an exception if( arguments.length ) is not equal 2.
 * @memberof wTools
 *
 */
      function _strDup(t, s) {
        let r = "";
        e.assert(2 === arguments.length, "Expects exactly two arguments"), e.assert(e.strIs(t)), 
        e.assert(e.numberIs(s));
        for (let e = 0; e < s; e++) r += t;
        return r;
      }),
      /* document me */
      strJoin: c,
      strJoinPath: function strJoinPath(t, s) {
        /* */
        function join(t, r, i) {
          if (e.numberIs(t) && (t = t.toString()), i > 0 && s) {
            let i = e.strEnds(n[r], s), l = e.strBegins(t, s);
            l && i ? n[r] = e.strRemoveEnd(n[r], s) + t : n[r] += l || i ? t : s + t;
          } else n[r] += t;
        }
        let r, n = [ "" ], i = 0;
        e.assert(2 === arguments.length, () => "Expects an array of string and joiner, but got " + arguments.length + " arguments"), 
        e.assert(e.arrayLike(t), () => "Expects an array of strings, but got " + e.strType(t)), 
        e.assert(e.strIs(s), () => "Expects joiner, but got " + e.strType(s));
        /* xxx */
        for (let s = 0; s < t.length; s++) {
          let l = t[s];
          if (e.assert(e.strIs(l) || e.numberIs(l) || e.arrayIs(l)), e.arrayIs(l)) {
            if (0 === i) for (let t = 1; t < l.length; t++) n[t] = n[0];
            e.assert(void 0 === r || r === l.length, "All arrays should have the same length"), 
            r = l.length, i = 1;
            for (let t = 0; t < l.length; t++) join(l[t], t, s);
          } else for (let t = 0; t < n.length; t++) join(l, t, s);
        }
        return i ? n : n[0];
      },
      /* qqq : cover and document me */
      strConcat: strConcat,
      // liner
      strIndentation: function strIndentation(t, s) {
        if (e.assert(e.strIs(t) || e.arrayIs(t), "Expects src as string or array"), e.assert(e.strIs(s), "Expects string tab"), 
        e.assert(2 === arguments.length, "Expects two arguments"), e.strIs(t)) {
          if (-1 === t.indexOf("\n")) return t;
          // if( src.indexOf( '\n' ) === -1 )
          // return tab + src;
                    t = t.split("\n");
        }
        /*
  should be no tab in prolog
*/        
        // let result = tab + src.join( '\n' + tab );
        return t.join("\n" + s);
      }
      // //
      //
      // function strIndentationButFirst( src, tab )
      // {
      //
      //   _.assert( _.strIs( src ) || _.arrayIs( src ), 'Expects src as string or array' );
      //   _.assert( _.strIs( tab ), 'Expects string tab' );
      //   _.assert( arguments.length === 2, 'Expects two arguments' );
      //
      //   if( _.strIs( src ) )
      //   {
      //
      //     if( src.indexOf( '\n' ) === -1 )
      //     return tab + src;
      //
      //     src = src.split( '\n' );
      //
      //   }
      //
      // /*
      //   should be no tab in prolog
      // */
      //
      //   let result = src.join( '\n' + tab );
      //
      //   return result;
      // }
      //
      ,
      strLinesSplit: function strLinesSplit(t) {
        return e.assert(e.strIs(t) || e.arrayIs(t)), e.assert(1 === arguments.length), e.arrayIs(t) ? t : t.split("\n");
      }
      //
      ,
      strLinesJoin: function strLinesJoin(t) {
        e.assert(e.strIs(t) || e.arrayIs(t)), e.assert(1 === arguments.length);
        let s = t;
        return e.arrayIs(t) && (s = t.join("\n")), s;
      }
      //
      /**
 * Remove espace characters and white spaces at the begin or at the end of each line.
 * Input arguments can be strings or arrays of strings. If input is a string, it splits it in lines and
 * removes the white/escape characters from the beggining and the end of each line. If input is an array,
 * it treats it as a single string split into lines, where each entry corresponds to a line. Therefore,
 * it removes the white/escape characters only from the beggining and the end of the strings in the array.
 *
 * @param { String/Array } [ src ] - Source string or array of strings.
 * @returns { String/Array } Returns string/array with empty lines and spaces removed.
 *
 * @example input string
 * _.strLinesStrip( '  Hello \r\n\t World \n\n ' );
 * //returns 'Hello\nWorld'
 *
 * @example input array
 * _.strLinesStrip( [ '  Hello \r\n\t world \n\n ', '\n! \n' ] );
 * //returns  [ 'Hello \r\n\t world', '!' ]
 *
 * @example input strings
 * _.strLinesStrip( '  Hello \r\n\t', ' World \n\n  ! \n\n', '\n\n' );
 * //returns [ 'Hello', 'World\n!', '' ]
 *
 * @example input arrays
 * _.strLinesStrip( [ '  Hello \r\n\t world \n\n ', '\n! \n' ], [ '\n\nHow\n\nAre  ', '  \r\nyou ? \n'], [ '\t\r\n  ' ] );
 * //returns [ [ 'Hello \r\n\t world', '!' ], [ 'How\n\nAre', 'you ?' ], [] ]
 *
 * @method strLinesStrip
 * @throws { Exception } Throw an exception if( src ) is not a String or Array.
 * @memberof wTools
 */ ,
      strLinesStrip: function strLinesStrip(t) {
        if (arguments.length > 1) {
          let t = e.unrollMake(null);
          for (let e = 0; e < arguments.length; e++) t[e] = strLinesStrip(arguments[e]);
          return t;
        }
        e.assert(e.strIs(t) || e.arrayIs(t)), e.assert(1 === arguments.length);
        let s = e.strLinesSplit(t);
        return s = s.map(t => t.trim()).filter(t => t), e.strIs(t) && (s = e.strLinesJoin(s)), 
        s;
      },
      /* qqq : test coverage */
      strLinesNumber: strLinesNumber,
      strLinesSelect: strLinesSelect,
      strLinesNearest: f,
      /* qqq : check coverage */
      strLinesNearestReport: h,
      strLinesCount: function strLinesCount(t) {
        return e.assert(1 === arguments.length, "Expects single argument"), e.assert(e.strIs(t)), 
        -1 !== t.indexOf("\n") ? t.split("\n").length : 1;
      },
      strLinesRangeWithCharRange: d
    };
    // --
    // declare
    // --
        e.mapExtend(t, m), 
    // --
    // export
    // --
    "undefined" != typeof module && null !== module && (module.exports = t);
  }();
  // == end of file StringToolsS
}();