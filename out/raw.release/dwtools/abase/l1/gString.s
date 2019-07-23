!function gStringS() {
  // == begin of file gStringS
  !function _gString_s_() {
    "use strict";
    // --
    // str
    // --
    function strIsolate_pre(t, r) {
      let n;
      return r.length > 1 ? n = {
        src: r[0],
        delimeter: r[1],
        times: r[2]
      } : (n = r[0], e.assert(1 === r.length, "Expects single argument")), e.routineOptions(t, n), 
      e.assert(1 === r.length || 2 === r.length || 3 === r.length), e.assert(2 === arguments.length, "Expects exactly two arguments"), 
      e.assert(e.strIs(n.src)), e.assert(e.strsLikeAll(n.delimeter)), e.assert(e.numberIs(n.times)), 
      n;
    }
    //
    /**
* @typedef {object} wTools.toStrInhalfOptions
* @property {string} [ o.src=null ] - Source string.
* @property {string | array} [ o.delimeter=' ' ] - Splitter of the string.
* @property {boolean} [ o.left=1 ] - Finds occurrence from begining of the string.
*/
    /**
 * Finds occurrence of delimeter( o.delimeter ) in source( o.src ) and splits string in finded position by half.
 * If function finds  more then one occurrence, it separates string in the position of the last.
 *
 * @param {wTools.toStrInhalfOptions} o - Contains data and options {@link wTools.toStrInhalfOptions}.
 * @returns {array} Returns array with separated parts of string( o.src ) or original string if nothing finded.
 *
 * @example
 * //returns [ 'sample', 'string' ]
 * _.strIsolate( { src : 'sample, string', delimeter : [ ',' ] } );
 *
 * @example
 * //returns [ 'sample', 'string' ]
 *_.strIsolate( { src : 'sample string', delimeter : ' ' } )
 *
 * @example
 * //returns [ 'sample string, name', 'string' ]
 * _.strIsolate( { src : 'sample string, name string', delimeter : [ ',', ' ' ] } )
 *
 * @method strIsolate
 * @throws { Exception } Throw an exception if no argument provided.
 * @throws { Exception } Throw an exception if( o ) is not a Map.
 * @throws { Exception } Throw an exception if( o.src ) is not a String.
 * @throws { Exception } Throw an exception if( o.delimeter ) is not a Array or String.
 * @throws { Exception } Throw an exception if( o ) is extended by uknown property.
 * @memberof wTools
 *
 */
    // function strIsolate( o )
    // {
    //   let result = [];
    //   let times = o.times;
    //   let delimeter
    //   let index = o.left ? -1 : o.src.length;
    //
    //   _.assertRoutineOptions( strIsolate, o );
    //   _.assert( arguments.length === 1, 'Expects single argument' );
    //   _.assert( _.strIs( o.src ), 'Expects string {-o.src-}, got', _.strType( o.src ) );
    //   _.assert( _.strIs( o.delimeter ) || _.arrayIs( o.delimeter ) );
    //   _.assert( _.numberIs( o.times ) );
    //
    //   /* */
    //
    //   if( !( times >= 1 ) )
    //   {
    //     return everything( o.left ^ o.none );
    //   }
    //
    //   if( _.arrayIs( o.delimeter ) && o.delimeter.length === 1 )
    //   o.delimeter = o.delimeter[ 0 ];
    //
    //   let closest = o.left ? strLeft : strRight;
    //
    //   /* */
    //
    //   while( times > 0 )
    //   {
    //
    //     index += o.left ? +1 : -1;
    //
    //     if( _.arrayIs( o.delimeter ) )
    //     {
    //
    //       if( !o.delimeter.length )
    //       {
    //         return everything( o.left ^ o.none );
    //       }
    //
    //       let c = closest( index );
    //
    //       delimeter = c.element;
    //       index = c.value;
    //
    //       if( o.times === 1 && index === o.src.length && o.left )
    //       index = -1;
    //
    //     }
    //     else
    //     {
    //
    //       delimeter = o.delimeter;
    //       index = o.left ? o.src.indexOf( delimeter, index ) : o.src.lastIndexOf( delimeter, index );
    //
    //       if( o.left && !( index >= 0 ) && o.times > 1 )
    //       {
    //         index = o.src.length;
    //         break;
    //       }
    //
    //     }
    //
    //     /* */
    //
    //     if( !o.left && times > 1 && index === 0  )
    //     {
    //       return everything( !o.none )
    //     }
    //
    //     if( !( index >= 0 ) && o.times === 1 )
    //     {
    //       return everything( o.left ^ o.none )
    //     }
    //
    //     times -= 1;
    //
    //   }
    //
    //   /* */
    //
    //   result.push( o.src.substring( 0, index ) );
    //   result.push( delimeter );
    //   result.push( o.src.substring( index + delimeter.length ) );
    //
    //   return result;
    //
    //   /* */
    //
    //   function everything( side )
    //   {
    //     return ( side ) ? [ o.src, '', '' ] : [ '', '', o.src ];
    //   }
    //
    //   /* */
    //
    //   function strLeft( index )
    //   {
    //     return _.entityMin( o.delimeter, function( a )
    //     {
    //       let i = o.src.indexOf( a, index );
    //       if( i === -1 )
    //       return o.src.length;
    //       return i;
    //     });
    //   }
    //
    //   /* */
    //
    //   function strRight( index )
    //   {
    //     return _.entityMax( o.delimeter, function( a )
    //     {
    //       let i = o.src.lastIndexOf( a, index );
    //       return i;
    //     });
    //   }
    //
    // }
    //
    // strIsolate.defaults =
    // {
    //   src : null,
    //   delimeter : ' ',
    //   quoting : null,
    //   left : 1,
    //   times : 1,
    //   none : 1,
    // }
        function strIsolate_body(t) {
      /* */
      function everything(e) {
        return e ? [ t.src, void 0, "" ] : [ "", void 0, t.src ];
      }
      /* */      let r = [], n = t.times, s = t.left ? 0 : t.src.length, l = t.left ? function strLeft(r) {
        return e._strLeftSingle(t.src, t.delimeter, r, void 0);
      }
      /* */ : function strRight(r) {
        return e._strRightSingle(t.src, t.delimeter, void 0, r);
      }, o = t.left ? 1 : -1;
      /* */
      for (e.assertRoutineOptions(strIsolate_body, arguments), 
      /* */
      e.arrayIs(t.delimeter) && 1 === t.delimeter.length && (t.delimeter = t.delimeter[0]); n > 0; ) {
        let e = l(s);
        if (void 0 === e.entry) break;
        if (n -= 1, s = t.left ? e.index + o : e.index + e.entry.length + o, 0 === n) return r.push(t.src.substring(0, e.index)), 
        r.push(e.entry), r.push(t.src.substring(e.index + e.entry.length)), r;
        /* */        if (t.left) {
          if (s >= t.src.length) break;
        } else if (s <= 0) break;
      }
      /* */      return r.length ? r : 0 === t.times ? everything(!t.left) : n === t.times ? everything(t.left ^ t.none) : everything(t.left);
    }
    //
    /**
 * Short-cut for strIsolate function.
 * Finds occurrence of delimeter( o.delimeter ) from begining of ( o.src ) and splits string in finded position by half.
 *
 * @param {wTools.toStrInhalfOptions} o - Contains data and options {@link wTools.toStrInhalfOptions}.
 * @returns {array} Returns array with separated parts of string( o.src ) or original string if nothing finded.
 *
 * @example
 * //returns [ 'sample', 'string' ]
 * _.strIsolateLeftOrNone( { src : 'sample, string', delimeter : [ ', ' ] } );
 *
 * @example
 * //returns [ 'sample', 'string' ]
 *_.strIsolateLeftOrNone( { src : 'sample string', delimeter : ' ' } )
 *
 * @example
 * //returns [ 'sample string, name', 'string' ]
 * _.strIsolateLeftOrNone( 'sample string, name string', ',' )
 *
 * @method strIsolateLeftOrNone
 * @throws { Exception } Throw an exception if no argument provided.
 * @throws { Exception } Throw an exception if( o ) is not a Map.
 * @throws { Exception } Throw an exception if( o.src ) is not a String.
 * @memberof wTools
 *
 */
    function strIsolateLeftOrNone_body(t) {
      return t.left = 1, t.none = 1, e.strIsolate.body(t);
    }
    //
    function strIsolateLeftOrAll_body(t) {
      return t.left = 1, t.none = 0, e.strIsolate.body(t);
    }
    //
    /**
 * Short-cut for strIsolate function.
 * Finds occurrence of delimeter( o.delimeter ) from end of ( o.src ) and splits string in finded position by half.
 *
 * @param {wTools.toStrInhalfOptions} o - Contains data and options {@link wTools.toStrInhalfOptions}.
 * @returns {array} Returns array with separated parts of string( o.src ) or original string if nothing finded.
 *
 * @example
 * //returns [ 'sample', 'string' ]
 * _.strIsolateRightOrNone( { src : 'sample, string', delimeter : [ ',' ] } );
 *
 * @example
 * //returns [ 'sample', 'string' ]
 *_.strIsolateRightOrNone( { src : 'sample string', delimeter : ' ' } )
 *
 * @method strIsolateRightOrNone
 * @throws { Exception } Throw an exception if no argument provided.
 * @throws { Exception } Throw an exception if( o ) is not a Map.
 * @throws { Exception } Throw an exception if( o.src ) is not a String.
 * @memberof wTools
 *
 */
    function strIsolateRightOrNone_body(t) {
      return t.left = 0, t.none = 1, e.strIsolate.body(t);
    }
    //
    function strIsolateRightOrAll_body(t) {
      return t.left = 0, t.none = 0, e.strIsolate.body(t);
    }
    _global_;
    let e = _global_.wTools, t = _global_.wTools;
    Array.prototype.slice, Function.prototype.bind, Object.prototype.toString, Object.hasOwnProperty, 
    strIsolate_body.defaults = {
      src: null,
      delimeter: " ",
      quoting: null,
      left: 1,
      times: 1,
      none: 1
    }, strIsolateLeftOrNone_body.defaults = {
      src: null,
      delimeter: " ",
      times: 1,
      quoting: null
    }, strIsolateLeftOrAll_body.defaults = {
      src: null,
      delimeter: " ",
      times: 1,
      quoting: null
    }, strIsolateRightOrNone_body.defaults = {
      src: null,
      delimeter: " ",
      times: 1,
      quoting: null
    }, strIsolateRightOrAll_body.defaults = {
      src: null,
      delimeter: " ",
      times: 1,
      quoting: null
    };
    // --
    // fields
    // --
    let r = {
      strIsolate: e.routineFromPreAndBody(strIsolate_pre, strIsolate_body),
      strIsolateLeftOrNone: e.routineFromPreAndBody(strIsolate_pre, strIsolateLeftOrNone_body),
      strIsolateLeftOrAll: e.routineFromPreAndBody(strIsolate_pre, strIsolateLeftOrAll_body),
      strIsolateRightOrNone: e.routineFromPreAndBody(strIsolate_pre, strIsolateRightOrNone_body),
      strIsolateRightOrAll: e.routineFromPreAndBody(strIsolate_pre, strIsolateRightOrAll_body),
      strIsolateInsideOrNoneSingle: 
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
  * _.strIsolateInsideOrNone( 'abcd', 'a', 'd' );
  * //returns 'bc'
  *
  * @example
  * _.strIsolateInsideOrNone( 'aabcc', 'a', 'c' );
  * //returns 'aabcc'
  *
  * @example
  * _.strIsolateInsideOrNone( 'aabcc', 'a', 'a' );
  * //returns 'a'
  *
  * @example
  * _.strIsolateInsideOrNone( 'abc', 'a', 'a' );
  * //returns undefined
  *
  * @example
  * _.strIsolateInsideOrNone( 'abcd', 'x', 'y' )
  * //returns undefined
  *
  * @example
  * //index of begin is bigger then index of end
  * _.strIsolateInsideOrNone( 'abcd', 'c', 'a' )
  * //returns undefined
  *
  * @returns { string } Returns part of source string between ( begin ) and ( end ) or undefined.
  * @throws { Exception } If all arguments are not strings;
  * @throws { Exception } If ( argumets.length ) is not equal 3.
  * @function strIsolateInsideOrNone
  * @memberof wTools
  */
      function strIsolateInsideOrNoneSingle(t, r, n) {
        e.assert(e.strIs(t), "Expects string {-src-}"), e.assert(3 === arguments.length, "Expects exactly three arguments");
        let s = e.strLeft(t, r);
        if (void 0 === s.entry) return;
        let l = e.strRight(t, n);
        return void 0 === l.entry || l.index < s.index + s.entry.length ? void 0 : [ t.substring(0, s.index), s.entry, t.substring(s.index + s.entry.length, l.index), l.entry, t.substring(l.index + l.entry.length, t.length) ];
      }
      //
      ,
      strIsolateInsideOrNone: function strIsolateInsideOrNone(t, r, n) {
        if (e.assert(3 === arguments.length, "Expects exactly three arguments"), e.arrayLike(t)) {
          let s = [];
          for (let l = 0; l < t.length; l++) s[l] = e.strIsolateInsideOrNoneSingle(t[l], r, n);
          return s;
        }
        return e.strIsolateInsideOrNoneSingle(t, r, n);
      }
      //
      ,
      strIsolateInsideOrAllSignle: function strIsolateInsideOrAllSignle(t, r, n) {
        e.assert(e.strIs(t), "Expects string {-src-}"), e.assert(3 === arguments.length, "Expects exactly three arguments");
        let s = e.strLeft(t, r);
        void 0 === s.entry && (s = {
          entry: "",
          index: 0
        });
        let l = e.strRight(t, n);
        return void 0 === l.entry && (l = {
          entry: "",
          index: t.length
        }), l.index < s.index + s.entry.length && (l.index = t.length, l.entry = ""), [ t.substring(0, s.index), s.entry, t.substring(s.index + s.entry.length, l.index), l.entry, t.substring(l.index + l.entry.length, t.length) ];
      }
      //
      ,
      strIsolateInsideOrAll: function strIsolateInsideOrAll(t, r, n) {
        if (e.assert(3 === arguments.length, "Expects exactly three arguments"), e.arrayLike(t)) {
          let s = [];
          for (let l = 0; l < t.length; l++) s[l] = e.strIsolateInsideOrAllSignle(t[l], r, n);
          return s;
        }
        return e.strIsolateInsideOrAllSignle(t, r, n);
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
    "undefined" != typeof module && null !== module && (module.exports = t);
  }();
  // == end of file gStringS
}();