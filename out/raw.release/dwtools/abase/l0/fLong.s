!function fLongS() {
  // == begin of file fLongS
  !function _fLong_s_() {
    "use strict";
    //
    function _argumentsArrayMake() {
      return arguments;
    }
    //
        //
    function bufferBytesIs(e) {
      return !n.bufferNodeIs(e) && e instanceof Uint8Array;
    }
    //
        //
    function arrayPrepended(e, r) {
      return n.assert(2 === arguments.length), n.assert(n.arrayIs(e)), e.unshift(r), 0;
    }
    //
    /**
 * Method adds a value of argument( ins ) to the beginning of an array( dstArray )
 * if destination( dstArray ) doesn't have the value of ( ins ).
 * Additionaly takes callback( onEqualize ) that checks if element from( dstArray ) is equal to( ins ).
 *
 * @param { Array } dstArray - The destination array.
 * @param { * } ins - The value to add.
 * @param { wTools~compareCallback } onEqualize - A callback function. By default, it checks the equality of two arguments.
 *
 * @example
 * // returns 0
 * _.arrayPrependedOnce( [ 1, 2, 3, 4 ], 5 );
 *
 * @example
 * // returns -1
 * _.arrayPrependedOnce( [ 1, 2, 3, 4, 5 ], 5 );
 *
 * @example
 * // returns 0
 * _.arrayPrependedOnce( [ 'Petre', 'Mikle', 'Oleg' ], 'Dmitry' );
 *
 * @example
 * // returns -1
 * _.arrayPrependedOnce( [ 'Petre', 'Mikle', 'Oleg', 'Dmitry' ], 'Dmitry' );
 *
 * @example
 * function onEqualize( a, b )
 * {
 *  return a.value === b.value;
 * };
 * _.arrayPrependedOnce( [ { value : 1 }, { value : 2 } ], { value : 1 }, onEqualize );
 * // returns -1
 *
 * @returns { Array } Returns zero if elements was succesfully added, otherwise returns -1.
 *
 * @function arrayPrependedOnce
 * @throws { Error } An Error if ( dstArray ) is not an Array.
 * @throws { Error } An Error if ( onEqualize ) is not an Function.
 * @throws { Error } An Error if ( arguments.length ) is not equal two or three.
 * @memberof wTools
 */    function arrayPrependedOnce(e, r, t, a) {
      return n.assert(n.arrayIs(e)), -1 === n.arrayLeftIndex.apply(n, arguments) ? (e.unshift(r), 
      0) : -1;
    }
    //
        /*
function arrayPrependOnceStrictly( dstArray, ins, evaluator1, evaluator2 )
{

  let result = arrayPrependedOnce.apply( this, arguments );
  _.assert( result >= 0, () => 'Array should have only unique elements, but has several ' + _.strShort( ins ) );

  return dstArray;
}
*/
    //
    /**
 * Method adds a value of argument( ins ) to the beginning of an array( dstArray )
 * and returns zero if value was succesfully added.
 *
 * @param { Array } dstArray - The destination array.
 * @param { * } ins - The element to add.
 *
 * @example
 * // returns 0
 * _.arrayPrependedElement( [ 1, 2, 3, 4 ], 5 );
 *
 * @returns { Array } Returns updated array, that contains new element( ins ).
 * @function arrayPrependedElement
 * @throws { Error } An Error if ( dstArray ) is not an Array.
 * @throws { Error } An Error if ( arguments.length ) is not equal to two.
 * @memberof wTools
 */
    function arrayPrependedElement(e, r) {
      /* xxx qqq : should return element, not index */
      // return 0;
      return n.assert(2 === arguments.length), n.assert(n.arrayIs(e)), e.unshift(r), r;
    }
    //
        function arrayPrependedElementOnce(e, r, t, a) {
      if (n.assert(n.arrayIs(e)), -1 === n.arrayLeftIndex.apply(n, arguments)) return e.unshift(r), 
      e[0];
    }
    //
        /*
function arrayPrependArrayOnceStrictly( dstArray, insArray, evaluator1, evaluator2 )
{
  let result = arrayPrependedArrayOnce.apply( this, arguments );
  _.assert( result === insArray.length );
  return dstArray;
}
*/
    //
    /**
 * Method adds all elements from array( insArray ) to the beginning of an array( dstArray ).
 * Returns count of added elements.
 *
 * @param { Array } dstArray - The destination array.
 * @param { ArrayLike } insArray - The source array.
 *
 * @example
 * let dst = [ 1, 2, 3, 4 ];
 * _.arrayPrependedArray( dst, [ 5, 6, 7 ] );
 * // returns 3
 * console.log( dst );
 * //returns [ 5, 6, 7, 1, 2, 3, 4 ]
 *
 * @returns { Array } Returns count of added elements.
 * @function arrayPrependedArray
 * @throws { Error } An Error if ( dstArray ) is not an Array.
 * @throws { Error } An Error if ( insArray ) is not an ArrayLike entity.
 * @throws { Error } An Error if ( arguments.length ) is less or more than two.
 * @memberof wTools
 */
    function arrayPrependedArray(e, r) {
      return n.assert(2 === arguments.length, "Expects exactly two arguments"), n.assert(n.arrayIs(e), "arrayPrependedArray :", "Expects array"), 
      n.assert(n.longIs(r), "arrayPrependedArray :", "Expects longIs"), e.unshift.apply(e, r), 
      r.length;
    }
    //
    /**
 * Method adds all unique elements from array( insArray ) to the beginning of an array( dstArray )
 * Additionaly takes callback( onEqualize ) that checks if element from( dstArray ) is equal to( ins ).
 * Returns count of added elements.
 *
 * @param { Array } dstArray - The destination array.
 * @param { ArrayLike } insArray - The source array.
 * @param { wTools~compareCallback } onEqualize - A callback function. By default, it checks the equality of two arguments.
 *
 * @example
 * // returns 3
 * _.arrayPrependedArrayOnce( [ 1, 2, 3 ], [ 4, 5, 6] );
 *
 * @example
 * // returns 1
 * _.arrayPrependedArrayOnce( [ 0, 2, 3, 4 ], [ 1, 1, 1 ] );
 *
 * @example
 * // returns 0
 * _.arrayPrependedArrayOnce( [ 'Petre', 'Mikle', 'Oleg', 'Dmitry' ], [ 'Dmitry' ] );
 *
 * @example
 * function onEqualize( a, b )
 * {
 *  return a.value === b.value;
 * };
 * _.arrayPrependedArrayOnce( [ { value : 1 }, { value : 2 } ], [ { value : 1 } ], onEqualize );
 * // returns 0
 *
 * @returns { Array } Returns count of added elements.
 * @function arrayPrependedArrayOnce
 * @throws { Error } An Error if ( dstArray ) is not an Array.
 * @throws { Error } An Error if ( insArray ) is not an ArrayLike entity.
 * @throws { Error } An Error if ( onEqualize ) is not an Function.
 * @throws { Error } An Error if ( arguments.length ) is not equal two or three.
 * @memberof wTools
 */    function arrayPrependedArrayOnce(e, r, t, a) {
      n.assert(n.arrayIs(e)), n.assert(n.longIs(r)), n.assert(e !== r), n.assert(2 <= arguments.length && arguments.length <= 4);
      let l = 0;
      for (let s = r.length - 1; s >= 0; s--) -1 === n.arrayLeftIndex(e, r[s], t, a) && (e.unshift(r[s]), 
      l += 1);
      return l;
    }
    //
        /*
function arrayPrependArraysOnceStrictly( dstArray, insArray, evaluator1, evaluator2 )
{
  let result = arrayPrependedArraysOnce.apply( this, arguments );
  let expected = 0;

  if( Config.debug )
  {

    for( let i = insArray.length - 1; i >= 0; i-- )
    {
      if( _.longIs( insArray[ i ] ) )
      expected += insArray[ i ].length;
      else
      expected += 1;
    }

    _.assert( result === expected, '{-dstArray-} should have none element from {-insArray-}' );

  }

  return dstArray;
}
*/
    //
    /**
 * Method adds all elements from provided arrays to the beginning of an array( dstArray ) in same order
 * that they are in( arguments ).
 * If argument provided after( dstArray ) is not a ArrayLike entity it will be prepended to destination array as usual element.
 * If argument is an ArrayLike entity and contains inner arrays, routine looks for elements only on first two levels.
 * Example: _.arrayPrependArrays( [], [ [ 1 ], [ [ 2 ] ] ] ) -> [ 1, [ 2 ] ];
 * Throws an error if one of arguments is undefined. Even if error was thrown, elements that was prepended to( dstArray ) stays in the destination array.
 *
 * @param { Array } dstArray - The destination array.
 * @param{ longIs | * } arguments[...] - Source arguments.
 *
 * @example
 * // returns 3
 * _.arrayPrependedArrays( [ 1, 2, 3, 4 ], [ 5 ], [ 6 ], 7 );
 *
 * @example
 * let dst = [ 1, 2, 3, 4 ];
 * _.arrayPrependedArrays( dst, [ 5 ], [ 6 ], undefined );
 * // throws error, but dst becomes equal [ 5, 6, 1, 2, 3, 4 ]
 *
 * @returns { Array } Returns count of added elements.
 * @function arrayPrependedArrays
 * @throws { Error } An Error if ( dstArray ) is not an Array.
 * @memberof wTools
 */
    function arrayPrependedArrays(e, r) {
      n.assert(2 === arguments.length, "Expects exactly two arguments"), n.assert(n.arrayIs(e), "arrayPrependedArrays :", "Expects array"), 
      n.assert(n.longIs(r), "arrayPrependedArrays :", "Expects longIs entity");
      let t = 0;
      for (let a = r.length - 1; a >= 0; a--) n.longIs(r[a]) ? (e.unshift.apply(e, r[a]), 
      t += r[a].length) : (e.unshift(r[a]), t += 1);
      return t;
    }
    //
    /**
 * Method adds all unique elements from provided arrays to the beginning of an array( dstArray ) in same order
 * that they are in( arguments ).
 * If argument provided after( dstArray ) is not a ArrayLike entity it will be prepended to destination array as usual element.
 * If argument is an ArrayLike entity and contains inner arrays, routine looks for elements only on first two levels.
 * Example: _.arrayPrependArrays( [], [ [ 1 ], [ [ 2 ] ] ] ) -> [ 1, [ 2 ] ];
 * Throws an error if one of arguments is undefined. Even if error was thrown, elements that was prepended to( dstArray ) stays in the destination array.
 *
 * @param { Array } dstArray - The destination array.
 * @param{ longIs | * } arguments[...] - Source arguments.
 *
 * @example
 * // returns 0
 * _.arrayPrependedArraysOnce( [ 1, 2, 3, 4, 5, 6, 7 ], [ 5 ], [ 6 ], 7 );
 *
 * @example
 * // returns 3
 * _.arrayPrependedArraysOnce( [ 1, 2, 3, 4 ], [ 5 ], 5, [ 6 ], 6, 7, [ 7 ] );
 *
 * @example
 * let dst = [ 1, 2, 3, 4 ];
 * _.arrayPrependedArraysOnce( dst, [ 5 ], [ 6 ], undefined );
 * // throws error, but dst becomes equal [ 5, 6, 1, 2, 3, 4 ]
 *
 * @returns { Array } Returns count of added elements.
 * @function arrayPrependedArraysOnce
 * @throws { Error } An Error if ( dstArray ) is not an Array.
 * @memberof wTools
 */    function arrayPrependedArraysOnce(e, r, t, a) {
      function _prependOnce(r) {
        -1 === n.arrayLeftIndex(e, r, t, a) && (
        // dstArray.unshift( argument );
        e.splice(l, 0, r), l += 1);
      }
      // for( let ii = insArray.length - 1; ii >= 0; ii-- )
            n.assert(2 <= arguments.length && arguments.length <= 4), n.assert(n.arrayIs(e), "arrayPrependedArraysOnce :", "Expects array"), 
      n.assert(n.longIs(r), "arrayPrependedArraysOnce :", "Expects longIs entity");
      let l = 0;
      for (let e = 0; e < r.length; e++) if (n.longIs(r[e])) {
        let t = r[e];
        // for( let a = array.length - 1; a >= 0; a-- )
                for (let e = 0; e < t.length; e++) _prependOnce(t[e]);
      } else _prependOnce(r[e]);
      return l;
    }
    //
        //
    function arrayAppended(e, r) {
      return n.assert(2 === arguments.length), n.assert(n.arrayIs(e)), e.push(r), e.length - 1;
    }
    //
        function arrayAppendedOnce(e, r, t, a) {
      return -1 === n.arrayLeftIndex.apply(n, arguments) ? (e.push(r), e.length - 1) : -1;
    }
    //
    function arrayAppendedElement(e, r) {
      return n.assert(2 === arguments.length), n.assert(n.arrayIs(e)), e.push(r), e.length - 1;
    }
    //
        function arrayAppendedElementOnce(e, r) {
      return -1 === n.arrayLeftIndex.apply(n, arguments) && (e.push(r), e[e.length - 1]);
    }
    //
        /*
function arrayAppendArrayOnceStrictly( dstArray, insArray, evaluator1, evaluator2 )
{
  let result = arrayAppendedArrayOnce.apply( this, arguments )
  _.assert( result === insArray.length );
  return dstArray;
}
*/
    //
    function arrayAppendedArray(e, r) {
      return n.assert(2 === arguments.length), n.assert(n.arrayIs(e), "arrayPrependedArray :", "Expects array"), 
      n.assert(n.longIs(r), "arrayPrependedArray :", "Expects longIs"), e.push.apply(e, r), 
      r.length;
    }
    //
        function arrayAppendedArrayOnce(e, r, t, a) {
      n.assert(n.longIs(r)), n.assert(e !== r), n.assert(2 <= arguments.length && arguments.length <= 4);
      let l = 0;
      for (let s = 0; s < r.length; s++) -1 === n.arrayLeftIndex(e, r[s], t, a) && (e.push(r[s]), 
      l += 1);
      return l;
    }
    //
        //
    function arrayAppendedArraysOnce(e, r, t, a) {
      function _appendOnce(r) {
        -1 === n.arrayLeftIndex(e, r, t, a) && (e.push(r), l += 1);
      }
      if (n.assert(2 <= arguments.length && arguments.length <= 4), void 0 === e) return r;
      n.arrayIs(r) || void 0 === r || (r = [ r ]), n.assert(n.arrayIs(e), "Expects array"), 
      n.assert(n.longIs(r), "Expects longIs entity");
      let l = 0;
      for (let e = 0, t = r.length; e < t; e++) if (n.longIs(r[e])) {
        let t = r[e];
        for (let e = 0, r = t.length; e < r; e++) _appendOnce(t[e]);
      } else _appendOnce(r[e]);
      return l;
    }
    //
        //
    function arrayRemoved(e, r, t, n) {
      return arrayRemovedElement.apply(this, arguments);
    }
    //
    /**
 * ArrayRemovedOnce and arrayRemovedOnceStrictly behave just like arrayRemovedElementOnce and arrayRemovedElementOnceStrictly,
 * but return the index of the removed element, instead of the removed element
 */    function arrayRemovedOnce(e, r, t, a) {
      let l = n.arrayLeftIndex.apply(n, arguments);
      return l >= 0 && e.splice(l, 1), l;
    }
    //
        //
    function arrayRemoveElementOnceStrictly(e, r, t, a) {
      {
        let e = arrayRemovedElementOnce.apply(this, arguments), t = n.arrayLeftIndex.apply(n, arguments);
        n.assert(t < 0), n.assert(e >= 0, () => "Array does not have element " + n.toStrShort(r));
      }
      return e;
    }
    /*
function arrayRemoveElementOnceStrictly( dstArray, ins, evaluator1, evaluator2 )
{
  let result = arrayRemovedElementOnce.apply( this, arguments );
  _.assert( result >= 0, () => 'Array does not have element ' + _.toStrShort( ins ) );
  return dstArray;
}
*/
    //
        function arrayRemovedElement(e, r, t, a) {
      let l = n.arrayLeftIndex.apply(this, arguments), s = 0;
      for (let r = 0; r < e.length; r++) -1 !== l && (e.splice(l, 1), s += 1, r -= 1), 
      l = n.arrayLeftIndex.apply(this, arguments);
      return s;
    }
    //
    /**
 * The callback function to compare two values.
 *
 * @callback wTools~compareCallback
 * @param { * } el - The element of the array.
 * @param { * } ins - The value to compare.
 */
    /**
 * The arrayRemovedElementOnce() routine returns the index of the first matching element from (dstArray)
 * that corresponds to the condition in the callback function and remove this element.
 *
 * It takes two (dstArray, ins) or three (dstArray, ins, onEvaluate) arguments,
 * checks if arguments passed two, it calls built in function(dstArray.indexOf(ins))
 * that looking for the value of the (ins) in the (dstArray).
 * If true, it removes the value (ins) from (dstArray) array by corresponding index.
 * Otherwise, if passed three arguments, it calls the routine
 * [arrayLeftIndex( dstArray, ins, onEvaluate )]{@link wTools.arrayLeftIndex}
 * If callback function(onEvaluate) returns true, it returns the index that will be removed from (dstArray).
 * @see {@link wTools.arrayLeftIndex} - See for more information.
 *
 * @param { Array } dstArray - The source array.
 * @param { * } ins - The value to remove.
 * @param { wTools~compareCallback } [ onEvaluate ] - The callback that compares (ins) with elements of the array.
 * By default, it checks the equality of two arguments.
 *
 * @example
 * // returns 1
 * let arr = _.arrayRemovedElementOnce( [ 2, 4, 6 ], 4, function( el ) {
 *   return el;
 * });
 *
 * @example
 * // returns 0
 * let arr = _.arrayRemovedElementOnce( [ 2, 4, 6 ], 2 );
 *
 * @returns { Number } - Returns the index of the value (ins) that was removed from (dstArray).
 * @function arrayRemovedElementOnce
 * @throws { Error } If the first argument is not an array-like.
 * @throws { Error } If passed less than two or more than three arguments.
 * @throws { Error } If the third argument is not a function.
 * @memberof wTools
 */    function arrayRemovedElementOnce(e, r, t, a) {
      let l = n.arrayLeftIndex.apply(n, arguments);
      return l >= 0 && e.splice(l, 1), l;
      /* "!!! : breaking" */
      /* // arrayRemovedElementOnce should return the removed element
  let result;
  let index = _.arrayLeftIndex.apply( _, arguments );

  if( index >= 0 )
  {
    result = dstArray[ index ];
    dstArray.splice( index, 1 );
  }

  return result;
  */    }
    //
        /*
function arrayRemoveArrayOnceStrictly( dstArray, insArray, evaluator1, evaluator2 )
{
  let result = arrayRemovedArrayOnce.apply( this, arguments );
  _.assert( result === insArray.length );
  return dstArray;
}
*/
    //
    function arrayRemovedArray(e, r) {
      n.assert(2 === arguments.length), n.assert(n.arrayIs(e)), n.assert(n.longIs(r)), 
      n.assert(e !== r);
      let t = 0, a = -1;
      for (let n = 0, l = r.length; n < l; n++) for (a = e.indexOf(r[n]); -1 !== a; ) e.splice(a, 1), 
      t += 1, a = e.indexOf(r[n], a);
      return t;
    }
    //
    /**
 * The callback function to compare two values.
 *
 * @callback arrayRemovedArrayOnce~onEvaluate
 * @param { * } el - The element of the (dstArray[n]) array.
 * @param { * } ins - The value to compare (insArray[n]).
 */
    /**
 * The arrayRemovedArrayOnce() determines whether a (dstArray) array has the same values as in a (insArray) array,
 * and returns amount of the deleted elements from the (dstArray).
 *
 * It takes two (dstArray, insArray) or three (dstArray, insArray, onEqualize) arguments, creates variable (let result = 0),
 * checks if (arguments[..]) passed two, it iterates over the (insArray) array and calls for each element built in function(dstArray.indexOf(insArray[i])).
 * that looking for the value of the (insArray[i]) array in the (dstArray) array.
 * If true, it removes the value (insArray[i]) from (dstArray) array by corresponding index,
 * and incrementing the variable (result++).
 * Otherwise, if passed three (arguments[...]), it iterates over the (insArray) and calls for each element the routine
 *
 * If callback function(onEqualize) returns true, it returns the index that will be removed from (dstArray),
 * and then incrementing the variable (result++).
 *
 * @see wTools.arrayLeftIndex
 *
 * @param { longIs } dstArray - The target array.
 * @param { longIs } insArray - The source array.
 * @param { function } onEqualize - The callback function. By default, it checks the equality of two arguments.
 *
 * @example
 * // returns 0
 * _.arrayRemovedArrayOnce( [  ], [  ] );
 *
 * @example
 * // returns 2
 * _.arrayRemovedArrayOnce( [ 1, 2, 3, 4, 5 ], [ 6, 2, 7, 5, 8 ] );
 *
 * @example
 * // returns 4
 * let got = _.arrayRemovedArrayOnce( [ 1, 2, 3, 4, 5 ], [ 6, 2, 7, 5, 8 ], function( a, b ) {
 *   return a < b;
 * } );
 *
 * @returns { number }  Returns amount of the deleted elements from the (dstArray).
 * @function arrayRemovedArrayOnce
 * @throws { Error } Will throw an Error if (dstArray) is not an array-like.
 * @throws { Error } Will throw an Error if (insArray) is not an array-like.
 * @throws { Error } Will throw an Error if (arguments.length < 2  || arguments.length > 3).
 * @memberof wTools
 */    function arrayRemovedArrayOnce(e, r, t, a) {
      n.assert(n.arrayIs(e)), n.assert(n.longIs(r)), n.assert(e !== r), n.assert(2 <= arguments.length && arguments.length <= 4);
      let l = 0, s = -1;
      for (let y = 0, o = r.length; y < o; y++) (s = n.arrayLeftIndex(e, r[y], t, a)) >= 0 && (e.splice(s, 1), 
      l += 1);
      return l;
    }
    //
        /*
function arrayRemoveArraysOnceStrictly( dstArray, insArray, evaluator1, evaluator2 )
{
  let result = arrayRemovedArraysOnce.apply( this, arguments );

  let expected = 0;
  for( let i = insArray.length - 1; i >= 0; i-- )
  {
    if( _.longIs( insArray[ i ] ) )
    expected += insArray[ i ].length;
    else
    expected += 1;
  }

  _.assert( result === expected );

  return dstArray;
}
*/
    //
    function arrayRemovedArrays(e, r) {
      function _remove(r) {
        let n = e.indexOf(r);
        for (;-1 !== n; ) e.splice(n, 1), t += 1, n = e.indexOf(r, n);
      }
      n.assert(2 === arguments.length, "Expects exactly two arguments"), n.assert(n.arrayIs(e), "arrayRemovedArrays :", "Expects array"), 
      n.assert(n.longIs(r), "arrayRemovedArrays :", "Expects longIs entity");
      let t = 0;
      for (let e = r.length - 1; e >= 0; e--) if (n.longIs(r[e])) {
        let t = r[e];
        for (let e = t.length - 1; e >= 0; e--) _remove(t[e]);
      } else _remove(r[e]);
      return t;
    }
    //
        function arrayRemovedArraysOnce(e, r, t, a) {
      function _removeOnce(r) {
        let s = n.arrayLeftIndex(e, r, t, a);
        s >= 0 && (e.splice(s, 1), l += 1);
      }
      n.assert(2 <= arguments.length && arguments.length <= 4), n.assert(n.arrayIs(e), "arrayRemovedArraysOnce :", "Expects array"), 
      n.assert(n.longIs(r), "arrayRemovedArraysOnce :", "Expects longIs entity");
      let l = 0;
      for (let e = r.length - 1; e >= 0; e--) if (n.longIs(r[e])) {
        let t = r[e];
        for (let e = t.length - 1; e >= 0; e--) _removeOnce(t[e]);
      } else _removeOnce(r[e]);
      return l;
    }
    //
        //
    function arrayFlattened(e, r) {
      /* */
      function onLong(r, t) {
        for (let a = 0, l = r.length; a < l; a++) n.longIs(r[a]) ? onLong(r[a], t) : e.splice(t++, 0, r[a]);
      }
      if (n.assert(arguments.length >= 1), n.assert(n.objectIs(this)), n.assert(n.arrayIs(e)), 
      1 === arguments.length) {
        for (let r = e.length - 1; r >= 0; --r) if (n.longIs(e[r])) {
          let t = e[r];
          e.splice(r, 1), onLong(t, r);
        }
        return e;
      }
      let t = 0;
      for (let r = 1; r < arguments.length; r++) {
        let a = arguments[r];
        if (n.longIs(a)) for (let r = 0, l = a.length; r < l; r++) n.longIs(a[r]) ? t += n.arrayFlattened(e, a[r]) : (n.assert(void 0 !== a[r], "The Array should have no undefined"), 
        e.push(a[r]), t += 1); else n.assert(void 0 !== a, "The Array should have no undefined"), 
        e.push(a), t += 1;
      }
      return t;
    }
    //
        function arrayFlattenedOnce(e, r, t, a) {
      /* */
      function onLongOnce(r, t) {
        for (let a = 0, l = r.length; a < l; a++) n.longIs(r[a]) ? onLongOnce(r[a], t) : -1 === n.arrayLeftIndex(e, r[a]) && e.splice(t++, 0, r[a]);
      }
      if (n.assert(arguments.length && arguments.length <= 4), n.assert(n.arrayIs(e)), 
      1 === arguments.length) {
        n.arrayRemoveDuplicates(e);
        for (let r = e.length - 1; r >= 0; --r) if (n.longIs(e[r])) {
          let t = e[r];
          e.splice(r, 1), onLongOnce(t, r);
        }
        return e;
      }
      let l = 0;
      if (n.longIs(r)) for (let s = 0, y = r.length; s < y; s++) n.assert(void 0 !== r[s], "The Array should have no undefined"), 
      n.longIs(r[s]) ? l += n.arrayFlattenedOnce(e, r[s], t, a) : -1 === n.arrayLeftIndex(e, r[s], t, a) && (e.push(r[s]), 
      l += 1); else n.assert(void 0 !== r, "The Array should have no undefined"), -1 === n.arrayLeftIndex(e, r, t, a) && (e.push(r), 
      l += 1);
      return l;
    }
    //
        function arrayFlattenedOnceStrictly(e, r, t, a) {
      /* */
      function onLongOnce(r, t) {
        for (let a = 0, l = r.length; a < l; a++) n.longIs(r[a]) ? onLongOnce(r[a], t) : -1 === n.arrayLeftIndex(e, r[a]) ? e.splice(t++, 0, r[a]) : n.assert(-1 === n.arrayLeftIndex(e, r[a]), "Elements must not be repeated");
      }
      n.assert(arguments.length && arguments.length <= 4), n.assert(n.arrayIs(e));
      let l = e.length;
      n.arrayRemoveDuplicates(e);
      let s = e.length;
      if (n.assert(l === s, "Elements in dstArray must not be repeated"), 1 === arguments.length) {
        for (let r = e.length - 1; r >= 0; --r) if (n.longIs(e[r])) {
          let t = e[r];
          e.splice(r, 1), onLongOnce(t, r);
        }
        return e;
      }
      let y = 0;
      if (n.longIs(r)) for (let l = 0, s = r.length; l < s; l++) if (n.assert(void 0 !== r[l], "The Array should have no undefined"), 
      n.longIs(r[l])) y += n.arrayFlattenedOnceStrictly(e, r[l], t, a); else {
        let s = n.arrayLeftIndex(e, r[l], t, a);
        n.assert(-1 === s, "Elements must not be repeated"), -1 === s && (e.push(r[l]), 
        y += 1);
      } else {
        n.assert(void 0 !== r, "The Array should have no undefined");
        let l = n.arrayLeftIndex(e, r, t, a);
        n.assert(-1 === l, "Elements must not be repeated"), -1 === l && (e.push(r), y += 1);
      }
      return y;
    }
    //
        //
    function arrayFlattenedDefined(e, r) {
      /* */
      function onLong(r, t) {
        for (let a = 0, l = r.length; a < l; a++) n.longIs(r[a]) ? onLong(r[a], t) : e.splice(t++, 0, r[a]);
      }
      if (n.assert(arguments.length >= 1), n.assert(n.objectIs(this)), n.assert(n.arrayIs(e)), 
      1 === arguments.length) {
        for (let r = e.length - 1; r >= 0; --r) if (n.longIs(e[r])) {
          let t = e[r];
          e.splice(r, 1), onLong(t, r);
        }
        return e;
      }
      let t = 0;
      for (let r = 1; r < arguments.length; r++) {
        let a = arguments[r];
        if (n.longIs(a)) for (let r = 0, l = a.length; r < l; r++) n.longIs(a[r]) ? t += n.arrayFlattenedDefined(e, a[r]) : 
        // _.assert( insArray[ i ] !== undefined, 'The Array should have no undefined' );
        void 0 !== a[r] && (e.push(a[r]), t += 1); else n.assert(void 0 !== a, "The Array should have no undefined"), 
        void 0 !== a && (e.push(a), t += 1);
      }
      return t;
    }
    //
        function arrayFlattenedDefinedOnce(e, r, t, a) {
      /* */
      function onLongOnce(r, t) {
        for (let a = 0, l = r.length; a < l; a++) n.longIs(r[a]) ? onLongOnce(r[a], t) : -1 === n.arrayLeftIndex(e, r[a]) && e.splice(t++, 0, r[a]);
      }
      if (n.assert(arguments.length && arguments.length <= 4), n.assert(n.arrayIs(e)), 
      1 === arguments.length) {
        n.arrayRemoveDuplicates(e);
        for (let r = e.length - 1; r >= 0; --r) if (n.longIs(e[r])) {
          let t = e[r];
          e.splice(r, 1), onLongOnce(t, r);
        }
        return e;
      }
      let l = 0;
      if (n.longIs(r)) for (let s = 0, y = r.length; s < y; s++) n.assert(void 0 !== r[s]), 
      n.longIs(r[s]) ? l += n.arrayFlattenedDefinedOnce(e, r[s], t, a) : -1 === n.arrayLeftIndex(e, r[s], t, a) && (e.push(r[s]), 
      l += 1); else void 0 !== r && -1 === n.arrayLeftIndex(e, r, t, a) && (e.push(r), 
      l += 1);
      return l;
    }
    //
        function arrayFlattenedDefinedOnceStrictly(e, r, t, a) {
      /* */
      function onLongOnce(r, t) {
        for (let a = 0, l = r.length; a < l; a++) n.longIs(r[a]) ? onLongOnce(r[a], t) : -1 === n.arrayLeftIndex(e, r[a]) ? e.splice(t++, 0, r[a]) : n.assert(-1 === n.arrayLeftIndex(e, r[a]), "Elements must not be repeated");
      }
      n.assert(arguments.length && arguments.length <= 4), n.assert(n.arrayIs(e));
      let l = e.length;
      n.arrayRemoveDuplicates(e);
      let s = e.length;
      if (n.assert(l === s, "Elements in dstArray must not be repeated"), 1 === arguments.length) {
        for (let r = e.length - 1; r >= 0; --r) if (n.longIs(e[r])) {
          let t = e[r];
          e.splice(r, 1), onLongOnce(t, r);
        }
        return e;
      }
      let y = 0;
      if (n.longIs(r)) for (let l = 0, s = r.length; l < s; l++) 
      // _.assert( insArray[ i ] !== undefined );
      if (void 0 === r[l]) ; else if (n.longIs(r[l])) y += n.arrayFlattenedDefinedOnceStrictly(e, r[l], t, a); else {
        let s = n.arrayLeftIndex(e, r[l], t, a);
        n.assert(-1 === s, "Elements must not be repeated"), -1 === s && (e.push(r[l]), 
        y += 1);
      } else if (void 0 !== r) {
        let l = n.arrayLeftIndex(e, r, t, a);
        n.assert(-1 === l, "Elements must not be repeated"), -1 === l && (e.push(r), y += 1);
      }
      return y;
    }
    // --
    // array replace
    // --
    //
        //
    function arrayReplacedOnce(e, r, t, a, l) {
      n.assert(3 <= arguments.length && arguments.length <= 5), n.longIs(r) && (n.assert(n.longIs(t)), 
      n.assert(r.length === t.length));
      let s = -1;
      return (s = n.arrayLeftIndex(e, r, a, l)) >= 0 && e.splice(s, 1, t), s;
    }
    //
        //
    function arrayReplacedElementOnce(e, r, t, a, l) {
      n.assert(3 <= arguments.length && arguments.length <= 5), n.longIs(r) && (n.assert(n.longIs(t)), 
      n.assert(r.length === t.length));
      let s = -1;
      if ((s = n.arrayLeftIndex(e, r, a, l)) >= 0) return e.splice(s, 1, t), r;
    }
    //
        /*
function arrayReplaceArrayOnceStrictly( dstArray, ins, sub, evaluator1, evaluator2  )
{
  let result = arrayReplacedArrayOnce.apply( this, arguments );
  _.assert( result === ins.length, '{-dstArray-} should have each element of {-insArray-}' );
  _.assert( ins.length === sub.length, '{-subArray-} should have the same length {-insArray-} has' );
  return dstArray;
}
*/
    //
    function arrayReplacedArray(e, r, t, a, l) {
      n.assert(3 <= arguments.length && arguments.length <= 5), n.assert(n.longIs(r)), 
      n.assert(n.longIs(t)), n.assert(r.length === t.length, "{-subArray-} should have the same length {-insArray-} has");
      let s = -1, y = 0, o = e.slice();
      // Array with src values stored
      for (let c = 0, u = r.length; c < u; c++) {
        let u = o.slice();
 // Array modified for each ins element
                for (s = n.arrayLeftIndex(u, r[c], a, l); -1 !== s; ) {
          let o = t[c];
          void 0 === o ? (e.splice(s, 1), u.splice(s, 1)) : (e.splice(s, 1, o), u.splice(s, 1, o)), 
          y += 1, s = n.arrayLeftIndex(u, r[c], a, l);
        }
      }
      return y;
    }
    //
        function arrayReplacedArrayOnce(e, r, t, a, l) {
      n.assert(n.longIs(r)), n.assert(n.longIs(t)), n.assert(r.length === t.length, "{-subArray-} should have the same length {-insArray-} has"), 
      n.assert(3 <= arguments.length && arguments.length <= 5);
      let s = -1, y = 0;
      //let oldDstArray = dstArray.slice();  // Array with src values stored
      for (let o = 0, c = r.length; o < c; o++) if ((s = n.arrayLeftIndex(e, r[o], a, l)) >= 0) {
        let r = t[o];
        void 0 === r ? e.splice(s, 1) : e.splice(s, 1, r), y += 1;
      }
      return y;
    }
    //
        //
    function arrayReplacedArrays(e, r, t, a, l) {
      // Array with src values stored
      function _replace(e, r, t, a, l) {
        let o = y.slice(), c = n.arrayLeftIndex(o, r, a, l);
        //let index = dstArray.indexOf( argument );
                for (;-1 !== c; ) o.splice(c, 1, t), e.splice(c, 1, t), s += 1, c = n.arrayLeftIndex(o, r, a, l);
      }
      n.assert(3 <= arguments.length && arguments.length <= 5), n.assert(n.arrayIs(e), "arrayReplacedArrays :", "Expects array"), 
      n.assert(n.longIs(t), "arrayReplacedArrays :", "Expects longIs entity"), n.assert(n.longIs(r), "arrayReplacedArrays :", "Expects longIs entity"), 
      n.assert(r.length === t.length, "{-subArray-} should have the same length {-insArray-} has");
      let s = 0, y = e.slice();
      for (let s = r.length - 1; s >= 0; s--) if (n.longIs(r[s])) {
        let n = r[s], y = t[s];
        for (let r = n.length - 1; r >= 0; r--) _replace(e, n[r], y[r], a, l);
      } else _replace(e, r[s], t[s], a, l);
      return s;
    }
    //
        function arrayReplacedArraysOnce(e, r, t, a, l) {
      // Array with src values stored
      function _replace(e, r, t, a, l) {
        let o = y.slice(), c = n.arrayLeftIndex(o, r, a, l);
        //let index = dstArray.indexOf( argument );
                -1 !== c && (o.splice(c, 1, t), e.splice(c, 1, t), s += 1);
      }
      n.assert(3 <= arguments.length && arguments.length <= 5), n.assert(n.arrayIs(e), "arrayReplacedArrays :", "Expects array"), 
      n.assert(n.longIs(t), "arrayReplacedArrays :", "Expects longIs entity"), n.assert(n.longIs(r), "arrayReplacedArrays :", "Expects longIs entity"), 
      n.assert(r.length === t.length, "{-subArray-} should have the same length {-insArray-} has");
      let s = 0, y = e.slice();
      for (let s = r.length - 1; s >= 0; s--) if (n.longIs(r[s])) {
        let n = r[s], y = t[s];
        for (let r = n.length - 1; r >= 0; r--) _replace(e, n[r], y[r], a, l);
      } else _replace(e, r[s], t[s], a, l);
      return s;
    }
    //
        let e = Array.prototype.indexOf, r = Array.prototype.lastIndexOf, t = Array.prototype.slice, n = (_global_, 
    _global_.wTools), a = _global_.wTools, l = {
      ArrayType: Array,
      accuracy: 1e-7,
      accuracySqrt: 1e-4,
      accuracySqr: 1e-14
    }, s = {
      // arguments array
      argumentsArrayIs: 
      // --
      // arguments array
      // --
      function argumentsArrayIs(e) {
        return "[object Arguments]" === Object.prototype.toString.call(e);
      }
      //
      ,
      argumentsArrayMake: function argumentsArrayMake(e) {
        return n.assert(1 === arguments.length), n.assert(n.numberIs(e) || n.longIs(e)), 
        n.numberIs(e) ? _argumentsArrayMake.apply(n, Array(e)) : _argumentsArrayMake.apply(n, e);
      },
      _argumentsArrayMake: _argumentsArrayMake,
      argumentsArrayFrom: function argumentsArrayFrom(e) {
        return n.assert(1 === arguments.length, "Expects single argument"), n.argumentsArrayIs(e) ? e : n.argumentsArrayMake(e);
      }
      // --
      // unroll
      // --
      /**
 * The routine unrollIs() determines whether the passed value is an instance of type unroll ( unroll-array ).
 *
 * If {-src-} is an unroll, then returns true, otherwise returns false.
 *
 * @param { * } src - The object to be checked.
 *
 * @example
 * // returns true
 * _.unrollIs( _.unrollMake( [ 1, 'str' ] ) );
 *
 * @example
 * // returns false
 * _.unrollIs( [] );
 *
 * @example
 * // returns false
 * _.unrollIs( 1 );
 *
 * @returns { boolean } Returns true if {-src-} is an unroll.
 * @function unrollIs
 * @memberof wTools
 */ ,
      // unroll
      unrollIs: function unrollIs(e) {
        return !!n.arrayIs(e) && !!e[n.unroll];
      }
      //
      /**
 * The routine unrollIsPopulated() determines whether the unroll-array has elements (length).
 *
 * If {-src-} is an unroll-array and has one or more elements, then returns true, otherwise returns false.
 *
 * @param { * } src - The object to be checked.
 *
 * @example
 * // returns true
 * _.unrollIs( _.unrollMake( [ 1, 'str' ] ) );
 *
 * @example
 * // returns false
 * _.unrollIs( _.unrollMake( [] ) );
 *
 * @example
 * // returns false
 * _.unrollIs( 1 );
 *
 * @returns { boolean } Returns true if argument ( src ) is an unroll-array and has one or more elements ( length ).
 * @function unrollIsPopulated
 * @memberof wTools
 */ ,
      unrollIsPopulated: function unrollIsPopulated(e) {
        return !!n.unrollIs(e) && e.length > 0;
      }
      //
      /**
 * The routine unrollMake() returns a new unroll-array maked from {-src-}.
 *
 * Unroll constructed by attaching symbol _.unroll Symbol to ordinary array.
 * Making an unroll normalizes its content.
 *
 * @param { * } src - The number or array-like object to make unroll-array. Passing null returns an empty unroll.
 *
 * @example
 * // returns true  & false
 * let unroll = _.unrollMake( null );
 * _.unrollIs( unroll );
 * _.unrollIsPopulated( unroll );
 *
 * @example
 * // returns true
 * let unroll = _.unrollMake( [ 1, 2, 'str' ] );
 * _.unrollIs( unroll );
 *
 * @example
 * //returns false
 * let arr = new Array( 1, 2, 'str' );
 * let unroll = _.unrollMake( [ 1, 2, 'str' ] );
 * console.log( arr === unroll );
 *
 * @returns { Unroll } Returns a new unroll-array maked from {-src-}.
 * Otherwise, it returns the empty unroll.
 * @function unrollMake
 * @throws { Error } If ( arguments.length ) is less or more then one.
 * @throws { Error } If argument ( src ) is not number, not array, not null.
 * @memberof wTools
 */ ,
      unrollMake: function unrollMake(e) {
        let r = n.arrayMake(e);
        return n.assert(1 === arguments.length), n.assert(n.arrayIs(r)), r[n.unroll] = !0, 
        n.unrollIs(e) || (r = n.unrollNormalize(r)), r;
      }
      //
      /**
 * The routine unrollFrom() performs conversion of {-src-} to unroll-array.
 *
 * If {-src-} is not unroll-array, routine unrollFrom() returns new unroll-array.
 * If {-src-} is unroll-array, then routine returns {-src-}.
 *
 * @param { * } src - The number, array-like object or unroll-array. Passing null returns an empty unroll.
 *
 * @example
 * // returns true, false
 * let unroll = _.unrollFrom( null );
 * _.unrollIs( unroll );
 * _.unrollIsPopulated( unroll );
 *
 * @example
 * // returns true
 * let unroll = _.unrollMake( [ 1, 2, 'str' ] );
 * let result = _.unrollFrom( unroll );
 * console.log ( unroll === result );
 *
 * @example
 * //returns true, false
 * let arr = new Array( 1, 2, 'str' );
 * let unroll = _.unrollFrom( [ 1, 2, 'str' ] );
 * console.log( _.unrollIs( unroll ) );
 * console.log( arr === unroll );
 *
 * @returns { Unroll } Returns unroll-array converted from {-src-}.
 * If {-src-} is unroll-array, then routine returns {-src-}.
 * @function unrollFrom
 * @throws { Error } If (arguments.length) is less or more then one.
 * @throws { Error } If argument {-src-} is not number, not long-like, not null.
 * @memberof wTools
 */ ,
      unrollFrom: function unrollFrom(e) {
        return n.assert(1 === arguments.length), n.unrollIs(e) ? e : n.unrollMake(e);
      }
      //
      /**
 * The routine unrollsFrom() performs conversion of each argument to unroll-array.
 * The routine returns unroll-array contained unroll-arrays converted from arguments.
 *
 * @param { * } srcs - The objects to be converted into unrolls.
 *
 * @example
 * // returns [ [] ], true, true
 * let unroll = _.unrollsFrom( null );
 * console.log( unroll );
 * console.log( _.unrollIs( unroll ) );
 * console.log( _.unrollIsPopulated( unroll ) );
 *
 * @example
 * // returns [ [ 1, 2, 'str' ] ], true, true
 * let unroll = _.unrollsFrom( [ 1, 2, 'str' ] );
 * console.log ( unroll );
 * console.log( _.unrollIs( unroll ) );
 * console.log( _.unrollIs( unroll[ 0 ] ) );
 *
 * @example
 * //returns true, false
 * let arr = new Array( 1, 2, 'str' );
 * let unroll = _.unrollsFrom( [ 1, 2, 'str' ] );
 * console.log( _.unrollIs( unroll ) );
 * console.log( arr === unroll );
 *
 * @example
 * // returns [ [], [ undefined ], [], [ 1, [] ] ], true, true, true, true, true
 * let unroll = _.unrollsFrom( [], 1, null, [ 1, [] ] );
 * console.log( unroll );
 * console.log( _.unrollIs( unroll ) );
 * console.log( _.unrollIs( unroll[ 0 ] ) );
 * console.log( _.unrollIs( unroll[ 1 ] ) );
 * console.log( _.unrollIs( unroll[ 2 ] ) );
 * console.log( _.unrollIs( unroll[ 3 ] ) );
 *
 * @returns { Unroll } Returns unroll-array contained unroll-arrays converted from arguments.
 * @function unrollsFrom
 * @throws { Error } If (arguments.length) is less then one.
 * @throws { Error } If any of the arguments is not number, not long-like, not null.
 * @memberof wTools
 */ ,
      unrollsFrom: function unrollsFrom(e) {
        n.assert(arguments.length >= 1);
        let r = n.unrollMake(null);
        for (let e = 0; e < arguments.length; e++) n.unrollIs(arguments[e]) ? r.push(arguments[e]) : r.push(n.unrollMake(arguments[e]));
        return r;
      }
      /**
 * The routine unrollFromMaybe() performs conversion of {-src-} to unroll-array.
 *
 * If {-src-} is not unroll-array, routine unrollFromMaybe() returns new unroll-array.
 * If {-src-} is unroll-array, then routine returns {-src-}.
 * If {-src-} has incompatible type, then routine returns {-src-}.
 *
 * @param { * } src - The object to make unroll-array.
 *
 * @example
 * // returns false, true
 * var src = 'str';
 * let got = _.unrollFromMaybe( src );
 * console.log( _.unrollIs( got ) );
 * console.log( got === src );
 *
 * @example
 * // returns true, false
 * let unroll = _.unrollFromMaybe( null );
 * console.log( _.unrollIs( unroll ) );
 * console.log( _.unrollIsPopulated( unroll ) );
 *
 * @example
 * // returns true
 * let unroll = _.unrollMake( [ 1, 2, 'str' ] );
 * let result = _.unrollFromMaybe( unroll );
 * console.log ( unroll === result );
 *
 * @example
 * //returns true, false
 * let arr = new Array( 1, 2, 'str' );
 * let unroll = _.unrollFromMaybe( [ 1, 2, 'str' ] );
 * console.log( _.unrollIs( unroll ) );
 * console.log( arr === unroll );
 *
 * @returns { Unroll } Returns unroll-array converted from {-src-}.
 * If {-src-} is unroll-array or incompatible type, then routine returns {-src-}.
 * @function unrollFromMaybe
 * @throws { Error } If (arguments.length) is less or more then one.
 * @memberof wTools
 */ ,
      unrollFromMaybe: function unrollFromMaybe(e) {
        return n.assert(1 === arguments.length), n.unrollIs(e) || n.strIs(e) || n.boolIs(e) || n.mapIs(e) || void 0 === e ? e : n.unrollMake(e);
      }
      //
      /**
 * The routine unrollNormalize() performs normalization of {-dstArray-}.
 * Normalization is unrolling of unroll-arrays, which is elements of {-dstArray-}.
 *
 * If {-dstArray-} is unroll-array, routine unrollNormalize() returns unroll-array
 * with normalized elements.
 * If {-dstArray-} is array, routine unrollNormalize() returns array with unrolled elements.
 *
 * @param { arrayIs|Unroll } dstArray - The array to be unrolled (normalized).
 *
 * @example
 * // returns [ 1, 2, 3, 'str' ], true
 * let unroll = _.unrollFrom( [ 1, 2, _.unrollMake( [ 3, 'str' ] ) ] );
 * let result = _.unrollNormalize( unroll )
 * console.log( result );
 * console.log( _.unrollIs( result ) );
 *
 * @example
 * // returns [ 1, 1, 'str', [ 1, 'str' ] ], false
 * let unroll = _.unrollFrom( [ 1,'str' ] );
 * let result = _.unrollNormalize( [ 1, unroll, [ unroll ] ] );
 * console.log( result );
 * console.log( _.unrollIs( result ) );
 *
 * @returns { Array } If {-dstArray-} is array, routine returns an array with normalized elements.
 * @returns { Unroll } If {-dstArray-} is unroll-array, routine returns an unroll-array with normalized elements.
 * @function unrollNormalize
 * @throws { Error } If ( arguments.length ) is not equal to one.
 * @throws { Error } If argument ( dstArray ) is not arrayLike.
 * @memberof wTools
 */ ,
      unrollNormalize: function unrollNormalize(e) {
        n.assert(n.arrayIs(e)), n.assert(1 === arguments.length);
        for (let r = 0; r < e.length; r++) if (n.unrollIs(e[r])) {
          let t = [ r, 1 ];
          t.push.apply(t, e[r]), e.splice.apply(e, t), 
          // a -= 1; // yyy
          r += t.length - 2 - 1;
        } else n.arrayIs(e[r]) && n.unrollNormalize(e[r]);
        return e;
      }
      //
      /*
qqq : в unrollPrepend, unrollAppend бракує прикладів
коли src unroll і dst не null
із виводом результату
і більше ніж одним елементом

Dmytro: correct JSdoc in unrollFrom, unrollNormalize.
Improve examples in unrollPrepend, unrollAppend.
*/
      /**
 * The routine unrollPrepend() returns an array with elements added to the begin of destination array {-dstArray-}.
 * During the operation unrolling of unrolls happens.
 *
 * If {-dstArray-} is unroll-array, routine unrollPrepend() returns unroll-array
 * with normalized elements.
 * If {-dstArray-} is array, routine unrollPrepend() returns array with unrolled elements.
 *
 * @param { Array|Unroll } dstArray - The destination array.
 * @param { * } args - The elements to be added.
 *
 * @example
 * // returns [ [ 1, 2, 'str' ] ], false
 * let result = _.unrollPrepend( null, [ 1, 2, 'str' ] );
 * console.log( result );
 * console.log( _.unrollIs( result ) );
 *
 * @example
 * // returns [ 1, 2, str ], false
 * let result = _.unrollPrepend( null, _.unrollMake( [ 1, 2, 'str' ] ) );
 * console.log( result );
 * console.log( _.unrollIs( result ) );
 *
 * @example
 * // returns [ [ 1, 2 ], 1, 'str' ], true
 * let result = _.unrollPrepend( _.unrollFrom( [ 1, 'str' ] ), [ 1, 2 ] );
 * console.log( result );
 * console.log( _.unrollIs( result ) );
 *
 * @example
 * // returns [ 2, 3, 1, 'str' ], false
 * let result = _.unrollPrepend( [ 1, 'str' ],  _.unrollFrom( [ 2, 3 ] ) );
 * console.log( result );
 * console.log( _.unrollIs( result ) );
 *
 * @example
 * // returns [ 2, 3, 1, 'str' ], true
 * let result = _.unrollPrepend( _.unrollMake( [ 1, 'str' ] ),  _.unrollFrom( [ 2, 3 ] ) );
 * console.log( result );
 * console.log( _.unrollIs( result ) );
 *
 * @returns { Unroll } If {-dstArray-} is unroll-array, routine returns updated unroll-array
 * with normalized elements that are added to the begin of {-dstArray-}.
 * @returns { Array } If {-dstArray-} is array, routine returns updated array
 * with normalized elements that are added to the begin of {-dstArray-}.
 * If {-dstArray-} is null, routine returns empty array.
 * @function unrollPrepend
 * @throws { Error } An Error if {-dstArray-} is not an Array or not null.
 * @throws { Error } An Error if ( arguments.length ) is less then one.
 * @memberof wTools
 */ ,
      unrollPrepend: function unrollPrepend(e) {
        return n.assert(arguments.length >= 1), n.assert(n.longIs(e) || null === e, "Expects long or unroll"), 
        function _unrollPrepend(e, r) {
          n.assert(2 === arguments.length);
          for (let t = r.length - 1; t >= 0; t--) n.unrollIs(r[t]) ? _unrollPrepend(e, r[t]) : (n.arrayIs(r[t]) && n.unrollNormalize(r[t]), 
          e.unshift(r[t]));
          return e;
        }(e = e || [], n.longSlice(arguments, 1)), e;
      }
      //
      /**
 * The routine unrollAppend() returns an array with elements added to the end of destination array {-dstArray-}.
 * During the operation unrolling of unrolls happens.
 *
 * If {-dstArray-} is unroll-array, routine unrollAppend() returns unroll-array
 * with normalized elements.
 * If {-dstArray-} is array, routine unrollAppend() returns array with unrolled elements.
 *
 * @param { Array|Unroll } dstArray - The destination array.
 * @param { * } args - The elements to be added.
 *
 * @example
 * // returns [ [ 1, 2, 'str' ] ], false
 * let result = _.unrollAppend( null, [ 1, 2, 'str' ] );
 * console.log( result );
 * console.log( _.unrollIs( result ) );
 *
 * @example
 * // returns [ 1, 2, str ], false
 * let result = _.unrollAppend( null, _.unrollMake( [ 1, 2, 'str' ] ) );
 * console.log( result );
 * console.log( _.unrollIs( result ) );
 *
 * @example
 * // returns [ 1, 'str', [ 1, 2 ] ], true
 * let result = _.unrollAppend( _.unrollFrom( [ 1, 'str' ] ), [ 1, 2 ] );
 * console.log( result );
 * console.log( _.unrollIs( result ) );
 *
 * @example
 * // returns [ 1, 'str', 2, 3 ], false
 * let result = _.unrollAppend( [ 1, 'str' ],  _.unrollFrom( [ 2, 3 ] ) );
 * console.log( result );
 * console.log( _.unrollIs( result ) );
 *
 * @example
 * // returns [ 1, 'str', 2, 3 ], true
 * let result = _.unrollAppend( _.unrollMake( [ 1, 'str' ] ),  _.unrollFrom( [ 2, 3 ] ) );
 * console.log( result );
 * console.log( _.unrollIs( result ) );
 *
 * @returns { Unroll } If {-dstArray-} is unroll-array, routine returns updated unroll-array
 * with normalized elements that are added to the end of {-dstArray-}.
 * @returns { Array } If {-dstArray-} is array, routine returns updated array
 * with normalized elements that are added to the end of {-dstArray-}.
 * If {-dstArray-} is null, routine returns empty array.
 * @function unrollAppend
 * @throws { Error } An Error if {-dstArray-} is not an Array or not null.
 * @throws { Error } An Error if ( arguments.length ) is less then one.
 * @memberof wTools
 */ ,
      unrollAppend: function unrollAppend(e) {
        return n.assert(arguments.length >= 1), n.assert(n.longIs(e) || null === e, "Expects long or unroll"), 
        function _unrollAppend(e, r) {
          n.assert(2 === arguments.length);
          for (let t = 0, a = r.length; t < a; t++) n.unrollIs(r[t]) ? _unrollAppend(e, r[t]) : (n.arrayIs(r[t]) && n.unrollNormalize(r[t]), 
          e.push(r[t]));
          return e;
        }(e = e || [], n.longSlice(arguments, 1)), e;
      }
      /*

let a1 = _.unrollFrom([ 3, 4, _.unrollFrom([ 5, 6 ]) ]);
let a2 = [ 7, _.unrollFrom([ 8, 9 ]) ] ];
_.unrollAppend( null, [ 1, 2, a1, a2, 10 ] );

let a1 = _.unrollFrom([ 3, 4, _.unrollFrom([ 5, 6 ]) ]);
let a2 = [ 7, _.unrollFrom([ 8, 9 ]) ] ];
_.unrollAppend( null, [ 1, 2, a1, a2, 10 ] );

*/
      // //
      //
      // function unrollPrepend( dstArray )
      // {
      //   _.assert( arguments.length >= 1 );
      //   _.assert( _.arrayIs( dstArray ) || dstArray === null, 'Expects array' );
      //
      //   dstArray = dstArray || [];
      //
      //   for( let a = arguments.length - 1 ; a >= 1 ; a-- )
      //   {
      //     if( _.longIs( arguments[ a ] ) )
      //     {
      //       dstArray.unshift.apply( dstArray, arguments[ a ] );
      //     }
      //     else
      //     {
      //       dstArray.unshift( arguments[ a ] );
      //     }
      //   }
      //
      //   dstArray[ _.unroll ] = true;
      //
      //   return dstArray;
      // }
      //
      // //
      //
      // function unrollAppend( dstArray )
      // {
      //   _.assert( arguments.length >= 1 );
      //   _.assert( _.arrayIs( dstArray ) || dstArray === null, 'Expects array' );
      //
      //   dstArray = dstArray || [];
      //
      //   for( let a = 1, len = arguments.length ; a < len; a++ )
      //   {
      //     if( _.longIs( arguments[ a ] ) )
      //     {
      //       dstArray.push.apply( dstArray, arguments[ a ] );
      //     }
      //     else
      //     {
      //       dstArray.push( arguments[ a ] );
      //     }
      //   }
      //
      //   dstArray[ _.unroll ] = true;
      //
      //   return dstArray;
      // }
      //
      /**
 * The routine unrollRemove() removes all matching elements in destination array {-dstArray-}
 * and returns a modified {-dstArray-}. During the operation unrolling of unrolls happens.
 *
 * @param { Array|Unroll } dstArray - The destination array.
 * @param { * } args - The elements to be removed.
 *
 * @example
 * // returns [], false
 * let result = _.unrollRemove( null, [ 1, 2, 'str' ] );
 * console.log( result );
 * console.log( _.unrollIs( result ) );
 *
 * @example
 * // returns [], true
 * let result = _.unrollRemove( _.unrollMake( null ), [ 1, 2, 'str' ] );
 * console.log( result );
 * console.log( _.unrollIs( result ) );
 *
 * @example
 * // returns [ 1, 2, 1, 3, 'str' ], false
 * let result = _.unrollRemove( [ 1, 2, 1, 3, 'str' ], [ 1, 'str', 0, 5 ] );
 * console.log( result );
 * console.log( _.unrollIs( result ) );
 *
 * @example
 * // returns [ 2, 3 ], false
 * let result = _.unrollRemove( [ 1, 2, 1, 3, 'str' ], _.unrollFrom( [ 1, 'str', 0, 5 ] ) );
 * console.log( result );
 * console.log( _.unrollIs( result ) );
 *
 * @example
 * // returns [ 1, 2, 1, 3, 'str' ], true
 * let result = _.unrollRemove( _.unrollFrom( [ 1, 2, 1, 3, 'str' ] ), [ 1, 'str', 0, 5 ] );
 * console.log( result );
 * console.log( _.unrollIs( result ) );
 *
 * @example
 * // returns [ 2, 3 ], false
 * let dstArray = _.unrollFrom( [ 1, 2, 1, 3, 'str' ] );
 * let ins = _.unrollFrom( [ 1, 'str', 0, 5 ] );
 * let result = _.unrollRemove( dstArray, ins );
 * console.log( result );
 * console.log( _.unrollIs( result ) );
 *
 * @example
 * // returns [ 2, 3 ], false
 * let dstArray = _.unrollFrom( [ 1, 2, 1, 3, 'str' ] );
 * let ins = _.unrollFrom( [ 1, _.unrollMake( [ 'str', 0, 5 ] ) ] );
 * let result = _.unrollRemove( dstArray, ins );
 * console.log( result );
 * console.log( _.unrollIs( result ) );
 *
 * @returns { Unroll } If {-dstArray-} is unroll-array, routine removes all matching elements
 * and returns updated unroll-array.
 * @returns { Array } If {-dstArray-} is array, routine removes all matching elements
 * and returns updated array. If {-dstArray-} is null, routine returns empty array.
 * @function unrollAppend
 * @throws { Error } An Error if {-dstArray-} is not an Array or not null.
 * @throws { Error } An Error if ( arguments.length ) is less then one.
 * @memberof wTools
 */ ,
      unrollRemove: function unrollRemove(e) {
        return n.assert(arguments.length >= 2), n.assert(n.longIs(e) || null === e, "Expects long or unroll"), 
        function _unrollRemove(e, r) {
          n.assert(2 === arguments.length);
          for (let t = 0, a = r.length; t < a; t++) if (n.unrollIs(r[t])) _unrollRemove(e, r[t]); else for (n.arrayIs(r[t]) && n.unrollNormalize(r[t]); e.indexOf(r[t]) >= 0; ) e.splice(e.indexOf(r[t]), 1);
          return e;
        }(e = e || [], n.longSlice(arguments, 1)), e;
      }
      //
      // --
      // long
      // --
      /**
 * The longIs() routine determines whether the passed value is an array-like or an Array.
 * Imortant : longIs returns false for Object, even if the object has length field.
 *
 * If {-srcMap-} is an array-like or an Array, true is returned,
 * otherwise false is.
 *
 * @param { * } src - The object to be checked.
 *
 * @example
 * // returns true
 * longIs( [ 1, 2 ] );
 *
 * @example
 * // returns false
 * longIs( 10 );
 *
 * @example
 * // returns true
 * let isArr = ( function() {
 *   return _.longIs( arguments );
 * } )( 'Hello there!' );
 *
 * @returns { boolean } Returns true if {-srcMap-} is an array-like or an Array.
 * @function longIs.
 * @memberof wTools
 */ ,
      // long
      longIs: function longIs(e) {
        return !(n.primitiveIs(e) || n.routineIs(e) || n.objectIs(e) || n.strIs(e) || Object.propertyIsEnumerable.call(e, "length") || !n.numberIs(e.length));
      }
      //
      ,
      longIsPopulated: function longIsPopulated(e) {
        return !!n.longIs(e) && e.length > 0;
      }
      //
      /**
 * The longMake() routine returns a new array or a new TypedArray with length equal (length)
 * or new TypedArray with the same length of the initial array if second argument is not provided.
 *
 * @param { longIs } ins - The instance of an array.
 * @param { Number } [ length = ins.length ] - The length of the new array.
 *
 * @example
 * // returns [ , ,  ]
 * let arr = _.longMake( [ 1, 2, 3 ] );
 *
 * @example
 * // returns [ , , ,  ]
 * let arr = _.longMake( [ 1, 2, 3 ], 4 );
 *
 * @returns { longIs }  Returns an array with a certain (length).
 * @function longMake
 * @throws { Error } If the passed arguments is less than two.
 * @throws { Error } If the (length) is not a number.
 * @throws { Error } If the first argument in not an array like object.
 * @throws { Error } If the (length === undefined) and (_.numberIs(ins.length)) is not a number.
 * @memberof wTools
 */ ,
      longMake: function longMake(e, r) {
        let a;
        return n.routineIs(e) && n.assert(2 === arguments.length, "Expects exactly two arguments"), 
        void 0 === r ? a = e.length : n.longIs(r) ? a = r.length : n.numberIs(r) ? a = r : n.assert(0), 
        n.argumentsArrayIs(e) && (e = []), n.assert(1 === arguments.length || 2 === arguments.length), 
        n.assert(n.numberIsFinite(a)), n.assert(n.routineIs(e) || n.longIs(e) || n.bufferRawIs(e), "unknown type of array", n.strType(e)), 
        n.longIs(r) ? e.constructor === Array ? new (n.constructorJoin(e.constructor, r))() : n.routineIs(e) ? "Array" === e.prototype.constructor.name ? t.call(r) : new e(r) : new e.constructor(r) : n.routineIs(e) ? new e(a) : new e.constructor(a);
      }
      //
      ,
      longMakeZeroed: function longMakeZeroed(e, r) {
        let t, a;
        if (n.routineIs(e) && n.assert(2 === arguments.length, "Expects exactly two arguments"), 
        void 0 === r ? a = e.length : n.longIs(r) ? a = r.length : n.numberIs(r) ? a = r : n.assert(0, "Expects long or number as the second argument, got", n.strType(r)), 
        n.argumentsArrayIs(e) && (e = []), n.assert(1 === arguments.length || 2 === arguments.length), 
        n.assert(n.numberIs(a)), n.assert(n.routineIs(e) || n.longIs(e) || n.bufferRawIs(e), "unknown type of array", n.strType(e)), 
        t = n.routineIs(e) ? new e(a) : new e.constructor(a), !n.bufferTypedIs(t) && !n.bufferRawIs(t)) for (let e = 0; e < a; e++) t[e] = 0;
        return t;
      }
      //
      ,
      _longClone: function _longClone(e) {
        if (n.assert(1 === arguments.length, "Expects single argument"), n.assert(n.longIs(e) || n.bufferAnyIs(e)), 
        n.assert(!n.bufferNodeIs(e), "not tested"), n.bufferViewIs(e)) debugger;
        return n.bufferRawIs(e) ? new Uint8Array(new Uint8Array(e)).buffer : n.bufferTypedIs(e) || n.bufferNodeIs(e) ? new e.constructor(e) : n.arrayIs(e) ? e.slice() : n.bufferViewIs(e) ? new e.constructor(e.buffer, e.byteOffset, e.byteLength) : void n.assert(0, "unknown kind of buffer", n.strType(e));
      }
      //
      ,
      longShallowClone: function longShallowClone() {
        let e, r, t = 0;
        if (1 === arguments.length) return n._longClone(arguments[0]);
        /* eval length */        for (let e = 0; e < arguments.length; e++) {
          let r = arguments[e];
          if (void 0 === r) throw n.err("argument is not defined");
          n.longIs(r) ? t += r.length : n.bufferRawIs(r) ? t += r.byteLength : t += 1;
        }
        /* make result */        n.arrayIs(arguments[0]) || n.bufferTypedIs(arguments[0]) ? e = n.longMake(arguments[0], t) : n.bufferRawIs(arguments[0]) && (e = new ArrayBuffer(t));
        let a = 0;
        n.bufferRawIs(arguments[0]) && (r = new Uint8Array(e))
        /* copy */;
        for (let t = 0, l = 0; t < arguments.length; t++) {
          let s = arguments[t];
          if (n.bufferRawIs(s)) r.set(new Uint8Array(s), a), a += s.byteLength; else if (n.bufferTypedIs(arguments[0])) e.set(s, a), 
          a += s.length; else if (n.longIs(s)) for (let r = 0; r < s.length; r++) e[l] = s[r], 
          l += 1; else e[l] = s, l += 1;
        }
        return e;
      }
      //
      /**
 * Returns a copy of original array( array ) that contains elements from index( f ) to index( l ),
 * but not including ( l ).
 *
 * If ( l ) is omitted or ( l ) > ( array.length ), longSlice extracts through the end of the sequence ( array.length ).
 * If ( f ) > ( l ), end index( l ) becomes equal to begin index( f ).
 * If ( f ) < 0, zero is assigned to begin index( f ).

 * @param { Array/Buffer } array - Source array or buffer.
 * @param { Number } [ f = 0 ] f - begin zero-based index at which to begin extraction.
 * @param { Number } [ l = array.length ] l - end zero-based index at which to end extraction.
 *
 * @example
 * _.longSlice( [ 1, 2, 3, 4, 5, 6, 7 ], 2, 6 );
 * // returns [ 3, 4, 5, 6 ]
 *
 * @example
 * // begin index is less then zero
 * _.longSlice( [ 1, 2, 3, 4, 5, 6, 7 ], -1, 2 );
 * // returns [ 1, 2 ]
 *
 * @example
 * //end index is bigger then length of array
 * _.longSlice( [ 1, 2, 3, 4, 5, 6, 7 ], 5, 100 );
 * // returns [ 6, 7 ]
 *
 * @returns { Array } Returns a shallow copy of elements from the original array.
 * @function longSlice
 * @throws { Error } Will throw an Error if ( array ) is not an Array or Buffer.
 * @throws { Error } Will throw an Error if ( f ) is not a Number.
 * @throws { Error } Will throw an Error if ( l ) is not a Number.
 * @throws { Error } Will throw an Error if no arguments provided.
 * @memberof wTools
*/ ,
      longSlice: function longSlice(e, r, t) {
        let a;
        if (n.argumentsArrayIs(e) && void 0 === r && void 0 === t) {
          if (2 === e.length) return [ e[0], e[1] ];
          if (1 === e.length) return [ e[0] ];
          if (0 === e.length) return [];
        }
        if (n.assert(n.longIs(e)), n.assert(1 <= arguments.length && arguments.length <= 3), 
        n.arrayLikeResizable(e)) return n.assert(void 0 === r || n.numberIs(r)), n.assert(void 0 === t || n.numberIs(t)), 
        e.slice(r, t);
        r = void 0 !== r ? r : 0, t = void 0 !== t ? t : e.length, n.assert(n.numberIs(r)), 
        n.assert(n.numberIs(t)), r < 0 && (r = e.length + r), t < 0 && (t = e.length + t), 
        r < 0 && (r = 0), t > e.length && (t = e.length), t < r && (t = r), a = n.bufferTypedIs(e) ? new e.constructor(t - r) : new Array(t - r);
        for (let n = r; n < t; n++) a[n - r] = e[n];
        return a;
      }
      //
      ,
      longButRange: function longButRange(e, r, t) {
        if (n.assert(n.longIs(e)), n.assert(void 0 === t || n.longIs(t)), n.assert(2 === arguments.length || 3 === arguments.length), 
        n.arrayIs(e)) return n.arrayButRange(e, r, t);
        let a;
        r = n.rangeFrom(r), n.rangeClamp(r, [ 0, e.length ]);
        let l = r[1] - r[0], s = e.length - l + (t ? t.length : 0);
        a = n.longMake(e, s);
        debugger;
        n.assert(0, "not tested");
        for (let t = 0; t < r[0]; t++) a[t] = e[t];
        for (let t = r[1]; t < s; t++) a[t - l] = e[t];
        return a;
      }
      //
      /**
 * The longRemoveDuplicates( dstLong, onEvaluator ) routine returns the dstlong with the duplicated elements removed.
 * The dstLong instance will be returned when possible, if not a new instance of the same type is created.
 *
 * @param { longIs } dstLong - The source and destination long.
 * @param { Function } [ onEvaluate = function( e ) { return e } ] - A callback function.
 *
 * @example
 * // returns [ 1, 2, 'abc', 4, true ]
 * _.longRemoveDuplicates( [ 1, 1, 2, 'abc', 'abc', 4, true, true ] );
 *
 * @example
 * // [ 1, 2, 3, 4, 5 ]
 * _.longRemoveDuplicates( [ 1, 2, 3, 4, 5 ] );
 *
 * @returns { Number } - Returns the source long without the duplicated elements.
 * @function longRemoveDuplicates
 * @throws { Error } If passed arguments is less than one or more than two.
 * @throws { Error } If the first argument is not an long.
 * @throws { Error } If the second argument is not a Function.
 * @memberof wTools
 */
      // function longRemoveDuplicates( dstLong, onEvaluate )
      // {
      //   _.assert( 1 <= arguments.length || arguments.length <= 3 );
      //   _.assert( _.longIs( dstLong ), 'longRemoveDuplicates :', 'Expects Long' );
      //   if( _.arrayIs( dstLong ) )
      //   {
      //     _.arrayRemoveDuplicates( dstLong, onEvaluate );
      //   }
      //   else if( Object.prototype.toString.call( dstLong ) === "[object Arguments]")
      //   {
      //     let newElement;
      //     for( let i = 0; i < dstLong.length; i++ )
      //     {
      //       newElement = dstLong[ i ];
      //       for( let j = i + 1; j < dstLong.length; j++ )
      //       {
      //         if( newElement === dstLong[ j ] )
      //         {
      //           let array = Array.from( dstLong );
      //           _.arrayRemoveDuplicates( array, onEvaluate );
      //           dstLong = new dstLong.constructor( array );
      //         }
      //       }
      //     }
      //   }
      //   else
      //   {
      //     if( !onEvaluate )
      //     {
      //       for( let i = 0 ; i < dstLong.length ; i++ )
      //       {
      //         function isDuplicated( element, index, array )
      //         {
      //           return ( element !== dstLong[ i ] || index === i );
      //         }
      //         dstLong = dstLong.filter( isDuplicated );
      //       }
      //     }
      //     else
      //     {
      //       if( onEvaluate.length === 2 )
      //       {
      //         for( let i = 0 ; i < dstLong.length ; i++ )
      //         {
      //           function isDuplicated( element, index, array )
      //           {
      //             return ( !onEvaluate( element, dstLong[ i ] ) || index === i );
      //           }
      //           dstLong = dstLong.filter( isDuplicated );
      //         }
      //       }
      //       else
      //       {
      //         for( let i = 0 ; i < dstLong.length ; i++ )
      //         {
      //           function isDuplicated( element, index, array )
      //           {
      //             return ( onEvaluate( element ) !== onEvaluate( dstLong[ i ] ) || index === i );
      //           }
      //           dstLong = dstLong.filter( isDuplicated );
      //         }
      //       }
      //     }
      //   }
      //   return dstLong;
      // }
      ,
      longRemoveDuplicates: function longRemoveDuplicates(e, r) {
        if (n.assert(1 <= arguments.length || arguments.length <= 3), n.assert(n.longIs(e), "longRemoveDuplicates :", "Expects Long"), 
        n.arrayIs(e)) return n.arrayRemoveDuplicates(e, r);
        if (!e.length) return e;
        let t = e.length;
        for (let a = 0; a < e.length; a++) -1 !== n.arrayLeftIndex(e, e[a], a + 1, r) && t--;
        if (t === e.length) return e;
        let a = n.longMake(e, t);
        a[0] = e[0];
        let l = 1;
        for (let s = 1; s < e.length && l < t; s++) -1 === n.arrayRightIndex(a, e[s], l - 1, r) && (a[l++] = e[s]);
        return n.assert(l === t), a;
      }
      /* qqq : not optimal, no redundant copy */
      /*
function longRemoveDuplicates( dstLong, onEvaluate )
{
  _.assert( 1 <= arguments.length || arguments.length <= 3 );
  _.assert( _.longIs( dstLong ), 'longRemoveDuplicates :', 'Expects Long' );

  if( _.arrayIs( dstLong ) )
  {
    _.arrayRemoveDuplicates( dstLong, onEvaluate )
    return dstLong;
  }

  let array = Array.from( dstLong );
  _.arrayRemoveDuplicates( array, onEvaluate )

  if( array.length === dstLong.length )
  {
    return dstLong;
  }
  else
  {
    return new dstLong.constructor( array );
  }

}
*/
      //
      ,
      longAreRepeatedProbe: function longAreRepeatedProbe(e, r) {
        n.longMake(e);
        let t = Object.create(null);
        t.array = n.arrayMake(e.length), t.uniques = e.length, t.condensed = e.length, n.assert(1 === arguments.length || 2 === arguments.length), 
        n.assert(n.longIs(e));
        for (let a = 0; a < e.length; a++) {
          let l = e[a];
          if (t.array[a] > 0) continue;
          t.array[a] = 0;
          let s = n.arrayLeftIndex(e, l, a + 1, r);
          if (s >= 0) {
            t.array[a] = 1, t.uniques -= 1;
            do {
              t.uniques -= 1, t.condensed -= 1, t.array[s] = 1, s = n.arrayLeftIndex(e, l, s + 1, r);
            } while (s >= 0);
          }
        }
        return t;
      }
      //
      ,
      longAllAreRepeated: function longAllAreRepeated(e, r) {
        return !n.longAreRepeatedProbe.apply(this, arguments).uniques;
      }
      //
      ,
      longAnyAreRepeated: function longAnyAreRepeated(e, r) {
        return n.longAreRepeatedProbe.apply(this, arguments).uniques !== e.length;
      }
      //
      ,
      longNoneAreRepeated: function longNoneAreRepeated(e, r) {
        return n.longAreRepeatedProbe.apply(this, arguments).uniques === e.length;
      }
      // --
      // buffer checker
      // --
      ,
      // buffer checker
      bufferRawIs: function bufferRawIs(e) {
        return "[object ArrayBuffer]" === Object.prototype.toString.call(e);
      }
      //
      ,
      bufferTypedIs: function bufferTypedIs(e) {
        let r = Object.prototype.toString.call(e);
        return !!/\wArray/.test(r) && !n.bufferNodeIs(e);
      }
      //
      ,
      bufferViewIs: function bufferViewIs(e) {
        return "[object DataView]" === Object.prototype.toString.call(e);
      }
      //
      ,
      bufferNodeIs: function bufferNodeIs(e) {
        return "undefined" != typeof Buffer && e instanceof Buffer;
      }
      //
      ,
      bufferAnyIs: function bufferAnyIs(e) {
        return !!e && "object" == typeof e && !!Reflect.has(e, "byteLength");
      },
      bufferBytesIs: bufferBytesIs,
      bufferBytesIs: bufferBytesIs,
      constructorIsBuffer: function constructorIsBuffer(e) {
        return !!e && !!n.numberIs(e.BYTES_PER_ELEMENT) && !!n.strIs(e.name) && -1 !== e.name.indexOf("Array");
      }
      //
      /**
 * The arrayIs() routine determines whether the passed value is an Array.
 *
 * If the {-srcMap-} is an Array, true is returned,
 * otherwise false is.
 *
 * @param { * } src - The object to be checked.
 *
 * @example
 * // returns true
 * arrayIs( [ 1, 2 ] );
 *
 * @example
 * // returns false
 * arrayIs( 10 );
 *
 * @returns { boolean } Returns true if {-srcMap-} is an Array.
 * @function arrayIs
 * @memberof wTools
 */ ,
      // array checker
      arrayIs: function arrayIs(e) {
        return "[object Array]" === Object.prototype.toString.call(e);
      }
      //
      ,
      arrayIsPopulated: function arrayIsPopulated(e) {
        return !!n.arrayIs(e) && e.length > 0;
      }
      //
      ,
      arrayLikeResizable: function arrayLikeResizable(e) {
        return "[object Array]" === Object.prototype.toString.call(e);
      }
      //
      ,
      arrayLike: function arrayLike(e) {
        return !!n.arrayIs(e) || !!n.argumentsArrayIs(e);
      }
      //
      ,
      constructorLikeArray: function constructorLikeArray(e) {
        return !!e && e !== Function && e !== Object && e !== String && !n.primitiveIs(e) && "length" in e.prototype && !Object.propertyIsEnumerable.call(e.prototype, "length");
      }
      //
      /**
 * The hasLength() routine determines whether the passed value has the property (length).
 *
 * If {-srcMap-} is equal to the (undefined) or (null) false is returned.
 * If {-srcMap-} has the property (length) true is returned.
 * Otherwise false is.
 *
 * @param { * } src - The object to be checked.
 *
 * @example
 * // returns true
 * hasLength( [ 1, 2 ] );
 *
 * @example
 * // returns true
 * hasLength( 'Hello there!' );
 *
 * @example
 * // returns true
 * let isLength = ( function() {
 *   return _.hasLength( arguments );
 * } )( 'Hello there!' );
 *
 * @example
 * // returns false
 * hasLength( 10 );
 *
 * @example
 * // returns false
 * hasLength( { } );
 *
 * @returns { boolean } Returns true if {-srcMap-} has the property (length).
 * @function hasLength
 * @memberof wTools
 */ ,
      hasLength: function hasLength(e) {
        return void 0 !== e && null !== e && !!n.numberIs(e.length);
      }
      //
      ,
      arrayHasArray: function arrayHasArray(e) {
        if (!n.arrayLike(e)) return !1;
        for (let r = 0; r < e.length; r += 1) if (n.arrayLike(e[r])) return !0;
        return !1;
      }
      //
      /**
 * The arrayCompare() routine returns the first difference between the values of the first array from the second.
 *
 * @param { longIs } src1 - The first array.
 * @param { longIs } src2 - The second array.
 *
 * @example
 * // returns 3
 * let arr = _.arrayCompare( [ 1, 5 ], [ 1, 2 ] );
 *
 * @returns { Number } - Returns the first difference between the values of the two arrays.
 * @function arrayCompare
 * @throws { Error } Will throw an Error if (arguments.length) is less or more than two.
 * @throws { Error } Will throw an Error if (src1 and src2) are not the array-like.
 * @throws { Error } Will throw an Error if (src2.length) is less or not equal to the (src1.length).
 * @memberof wTools
 */ ,
      arrayCompare: function arrayCompare(e, r) {
        n.assert(2 === arguments.length, "Expects exactly two arguments"), n.assert(n.longIs(e) && n.longIs(r)), 
        n.assert(r.length >= e.length);
        let t = 0;
        for (let n = 0; n < e.length; n++) if (0 != (t = e[n] - r[n])) return t;
        return t;
      }
      //
      /**
 * The arraysAreIdentical() routine checks the equality of two arrays.
 *
 * @param { longIs } src1 - The first array.
 * @param { longIs } src2 - The second array.
 *
 * @example
 * // returns true
 * let arr = _.arraysAreIdentical( [ 1, 2, 3 ], [ 1, 2, 3 ] );
 *
 * @returns { Boolean } - Returns true if all values of the two arrays are equal. Otherwise, returns false.
 * @function arraysAreIdentical
 * @throws { Error } Will throw an Error if (arguments.length) is less or more than two.
 * @memberof wTools
 */ ,
      arraysAreIdentical: function arraysAreIdentical(e, r) {
        n.assert(2 === arguments.length, "Expects exactly two arguments"), n.assert(n.longIs(e)), 
        n.assert(n.longIs(r));
        let t = !0;
        if (e.length !== r.length) return !1;
        for (let n = 0; n < e.length; n++) if (0 == (t = e[n] === r[n])) return !1;
        return t;
      }
      //
      ,
      arrayHas: function arrayHas(r, t, a, l) {
        return n.assert(2 <= arguments.length && arguments.length <= 4), n.assert(n.arrayLike(r)), 
        void 0 === a ? -1 !== e.call(r, t) : n.arrayLeftIndex(r, t, a, l) >= 0;
      }
      //
      /**
 * The arrayHasAny() routine checks if the {-srcMap-} array has at least one value of the following arguments.
 *
 * It iterates over array-like (arguments[]) copies each argument to the array (ins) by the routine
 * [arrayAs()]{@link wTools.arrayAs}
 * Checks, if {-srcMap-} array has at least one value of the (ins) array.
 * If true, it returns true.
 * Otherwise, it returns false.
 *
 * @see {@link wTools.arrayAs} - See for more information.
 *
 * @param { longIs } src - The source array.
 * @param {...*} arguments - One or more argument(s).
 *
 * @example
 * // returns true
 * let arr = _.arrayHasAny( [ 5, 'str', 42, false ], false, 7 );
 *
 * @returns { Boolean } - Returns true, if {-srcMap-} has at least one value of the following argument(s), otherwise false is returned.
 * @function arrayHasAny
 * @throws { Error } If the first argument in not an array.
 * @memberof wTools
 */ ,
      arrayHasAny: function arrayHasAny(e) {
        let r = !0;
        r = !1, n.assert(arguments.length >= 1, "Expects at least one argument"), n.assert(n.arrayLike(e) || n.bufferTypedIs(e), "arrayHasAny :", "array expected");
        for (let t = 1; t < arguments.length; t++) {
          r = !1;
          let a = n.arrayAs(arguments[t]);
          for (let r = 0; r < a.length; r++) if (-1 !== e.indexOf(a[r])) return !0;
        }
        return r;
      }
      //
      ,
      /* qqq : remake, make it expect only 2 mandatory arguments and optional evaluator / equalizer */
      arrayHasAll: function arrayHasAll(e) {
        n.assert(arguments.length >= 1, "Expects at least one argument"), n.assert(n.arrayLike(e) || n.bufferTypedIs(e), "arrayHasAll :", "array expected");
        for (let r = 1; r < arguments.length; r++) {
          let t = n.arrayAs(arguments[r]);
          for (let r = 0; r < t.length; r++) if (-1 === e.indexOf(t[r])) return !1;
        }
        return !0;
      }
      //
      ,
      /* qqq : remake, make it expect only 2 mandatory arguments and optional evaluator / equalizer */
      arrayHasNone: function arrayHasNone(e) {
        n.assert(arguments.length >= 1, "Expects at least one argument"), n.assert(n.arrayLike(e) || n.bufferTypedIs(e), "arrayHasNone :", "array expected");
        for (let r = 1; r < arguments.length; r++) {
          let t = n.arrayAs(arguments[r]);
          for (let r = 0; r < t.length; r++) if (-1 !== e.indexOf(t[r])) return !1;
        }
        return !0;
      }
      //
      ,
      /* qqq : remake, make it expect only 2 mandatory arguments and optional evaluator / equalizer */
      arrayAll: function arrayAll(e) {
        n.assert(1 === arguments.length, "Expects single argument"), n.assert(n.longIs(e));
        for (let r = 0; r < e.length; r += 1) if (!e[r]) return !1;
        return !0;
      }
      //
      ,
      arrayAny: function arrayAny(e) {
        n.assert(1 === arguments.length, "Expects single argument"), n.assert(n.longIs(e));
        debugger;
        for (let r = 0; r < e.length; r += 1) if (e[r]) return !0;
        debugger;
        return !1;
      }
      //
      ,
      arrayNone: function arrayNone(e) {
        n.assert(1 === arguments.length, "Expects single argument"), n.assert(n.longIs(e));
        for (let r = 0; r < e.length; r += 1) if (e[r]) return !1;
        return !0;
      }
      // --
      // scalar
      // --
      /**
 * Produce a single array from all arguments if cant return single argument as a scalar.
 * If {-scalarAppend-} gets a single argument it returns the argument as is.
 * If {-scalarAppend-} gets an argument and one or more undefined it returns the argument as is.
 * If {-scalarAppend-} gets more than one or less than one defined arguments then it returns array having all defined arguments.
 * If some argument is a long ( for example array ) then each element of the long is treated as an argument, not recursively.
 *
 * @function scalarAppend.
 * @memberof wTools
 */ ,
      // scalar
      scalarAppend: function scalarAppend(e, r) {
        if (arguments.length > 2) {
          for (let r = 1; r < arguments.length; r++) e = n.scalarAppend(e, arguments[r]);
          return e;
        }
        if (n.assert(arguments.length <= 2), void 0 === e) {
          if (!n.longIs(r)) return void 0 === r ? [] : r;
          e = [];
        }
        return n.longIs(e) ? (n.arrayIs(e) || (e = n.arrayFrom(e)), void 0 === r || (n.longIs(r) ? n.arrayAppendArray(e, r) : e.push(r))) : void 0 === r || (e = n.longIs(r) ? n.arrayAppendArray([ e ], r) : [ e, r ]), 
        e;
      }
      //
      /**
 * The scalarToVector() routine returns a new array
 * which containing the static elements only type of Number.
 *
 * It takes two arguments (dst) and (length)
 * checks if the (dst) is a Number, If the (length) is greater than or equal to zero.
 * If true, it returns the new array of static (dst) numbers.
 * Otherwise, if the first argument (dst) is an Array,
 * and its (dst.length) is equal to the (length),
 * it returns the original (dst) Array.
 * Otherwise, it throws an Error.
 *
 * @param { ( Number | Array ) } dst - A number or an Array.
 * @param { Number } length - The length of the new array.
 *
 * @example
 * // returns [ 3, 3, 3, 3, 3, 3, 3 ]
 * let arr = _.scalarToVector( 3, 7 );
 *
 * @example
 * // returns [ 3, 7, 13 ]
 * let arr = _.scalarToVector( [ 3, 7, 13 ], 3 );
 *
 * @returns { Number[] | Array } - Returns the new array of static numbers or the original array.
 * @function scalarToVector
 * @throws { Error } If missed argument, or got less or more than two arguments.
 * @throws { Error } If type of the first argument is not a number or array.
 * @throws { Error } If the second argument is less than 0.
 * @throws { Error } If (dst.length) is not equal to the (length).
 * @memberof wTools
 */
      // function arrayFromNumber( dst, length )
      ,
      scalarToVector: function scalarToVector(e, r) {
        return n.assert(2 === arguments.length, "Expects exactly two arguments"), n.assert(n.numberIs(e) || n.arrayIs(e), "Expects array of number as argument"), 
        n.assert(r >= 0), n.numberIs(e) ? e = n.arrayFillTimes([], r, e) : n.assert(e.length === r, () => "Expects array of length " + r + " but got " + e.length), 
        e;
      }
      //
      ,
      scalarFrom: function scalarFrom(e) {
        return n.longIs(e) && 1 === e.length ? e[0] : e;
      }
      //
      ,
      scalarFromOrNull: function scalarFromOrNull(e) {
        if (n.longIs(e)) {
          if (1 === e.length) return e[0];
          if (0 === e.length) return null;
        }
        return e;
      }
      // --
      // array producer
      // --
      /* qqq
add good coverage for arrayMake
take into account unroll cases
*/ ,
      // array producer
      arrayMake: function arrayMake(e) {
        return n.assert(1 === arguments.length), n.assert(n.numberIs(e) || n.longIs(e) || null === e), 
        null === e ? Array() : n.numberIs(e) ? Array(e) : 1 === e.length ? [ e[0] ] : Array.apply(Array, e);
      }
      //
      /* qqq
add good coverage for arrayFrom
take into account unroll cases
*/ ,
      arrayFrom: function arrayFrom(e) {
        return n.assert(1 === arguments.length), n.arrayIs(e) && !n.unrollIs(e) ? e : n.arrayMake.call(n, e);
      }
      //
      /**
 * The arrayAs() routine copies passed argument to the array.
 *
 * @param { * } src - The source value.
 *
 * @example
 * // returns [ false ]
 * let arr = _.arrayAs( false );
 *
 * @example
 * // returns [ { a : 1, b : 2 } ]
 * let arr = _.arrayAs( { a : 1, b : 2 } );
 *
 * @returns { Array } - If passed null or undefined than return the empty array. If passed an array then return it.
 * Otherwise return an array which contains the element from argument.
 * @function arrayAs
 * @memberof wTools
 */ ,
      arrayAs: function arrayAs(e) {
        return n.assert(1 === arguments.length), n.assert(void 0 !== e), null === e ? [] : n.longIs(e) ? e : [ e ];
      }
      //
      ,
      arrayAsShallowing: function arrayAsShallowing(e) {
        return n.assert(1 === arguments.length), n.assert(void 0 !== e), null === e ? [] : n.longIs(e) ? n.arraySlice(e) : [ e ];
      }
      // --
      // array sequential search
      // --
      ,
      // array sequential search
      arrayLeftIndex: function arrayLeftIndex(r, t, a, l) {
        let s = 0;
        if (n.numberIs(arguments[2]) && (s = arguments[2], a = arguments[3], l = arguments[4]), 
        n.assert(2 <= arguments.length && arguments.length <= 5), n.assert(n.longIs(r)), 
        n.assert(n.numberIs(s)), n.assert(void 0 === a || 1 === a.length || 2 === a.length), 
        n.assert(void 0 === a || n.routineIs(a)), n.assert(void 0 === l || 1 === l.length), 
        n.assert(void 0 === l || n.routineIs(l)), !a) return n.assert(!l), e.call(r, t, s);
        if (2 === a.length) /* equalizer */
        {
          n.assert(!l);
          for (let e = s; e < r.length; e++) if (a(r[e], t)) return e;
        } else {
          t = l ? l(t) : a(t);
          for (let e = s; e < r.length; e++) if (a(r[e]) === t) return e;
        }
        return -1;
      }
      //
      ,
      arrayRightIndex: function arrayRightIndex(e, t, a, l) {
        let s = e.length - 1;
        if (n.numberIs(arguments[2]) && (s = arguments[2], a = arguments[3], l = arguments[4]), 
        n.assert(2 <= arguments.length && arguments.length <= 5), n.assert(n.numberIs(s)), 
        n.assert(void 0 === a || 1 === a.length || 2 === a.length), n.assert(void 0 === a || n.routineIs(a)), 
        n.assert(void 0 === l || 1 === l.length), n.assert(void 0 === l || n.routineIs(l)), 
        !a) {
          if (n.assert(!l), !n.arrayIs(e)) debugger;
          return r.call(e, t, s);
        }
        if (2 === a.length) /* equalizer */
        {
          n.assert(!l);
          for (let r = s; r >= 0; r--) if (a(e[r], t)) return r;
        } else {
          t = l ? l(t) : a(t);
          for (let r = s; r >= 0; r--) if (a(e[r]) === t) return r;
        }
        return -1;
      }
      //
      /**
 * The arrayLeft() routine returns a new object containing the properties, (index, element),
 * corresponding to a found value (ins) from an array (arr).
 *
 * It creates the variable (i), assigns and calls to it the function( _.arrayLeftIndex( arr, ins, evaluator1 ) ),
 * that returns the index of the value (ins) in the array (arr).
 * [wTools.arrayLeftIndex()]{@link wTools.arrayLeftIndex}
 * If (i) is more or equal to the zero, it returns the object containing the properties ({ index : i, element : arr[ i ] }).
 * Otherwise, it returns the empty object.
 *
 * @see {@link wTools.arrayLeftIndex} - See for more information.
 *
 * @param { longIs } arr - Entity to check.
 * @param { * } ins - Element to locate in the array.
 * @param { wTools~compareCallback } evaluator1 - A callback function.
 *
 * @example
 * // returns { index : 3, element : 'str' }
 * _.arrayLeft( [ 1, 2, false, 'str', 5 ], 'str', function( a, b ) { return a === b } );
 *
 * @example
 * // returns {  }
 * _.arrayLeft( [ 1, 2, 3, 4, 5 ], 6 );
 *
 * @returns { Object } Returns a new object containing the properties, (index, element),
 * corresponding to the found value (ins) from the array (arr).
 * Otherwise, it returns the empty object.
 * @function arrayLeft
 * @throws { Error } Will throw an Error if (evaluator1) is not a Function.
 * @memberof wTools
 */ ,
      arrayLeft: function arrayLeft(e, r, t, a) {
        let l = Object.create(null), s = n.arrayLeftIndex(e, r, t, a);
        return n.assert(2 <= arguments.length && arguments.length <= 4), s >= 0 && (l.index = s, 
        l.element = e[s]), l;
      }
      //
      ,
      arrayRight: function arrayRight(e, r, t, a) {
        let l = Object.create(null), s = n.arrayRightIndex(e, r, t, a);
        return n.assert(2 <= arguments.length && arguments.length <= 4), s >= 0 && (l.index = s, 
        l.element = e[s]), l;
      }
      //
      ,
      arrayLeftDefined: function arrayLeftDefined(e) {
        return n.assert(1 === arguments.length, "Expects single argument"), n.arrayLeft(e, !0, function(e) {
          return void 0 !== e;
        });
      }
      //
      ,
      arrayRightDefined: function arrayRightDefined(e) {
        return n.assert(1 === arguments.length, "Expects single argument"), n.arrayRight(e, !0, function(e) {
          return void 0 !== e;
        });
      }
      //
      /**
 * The arrayCountElement() routine returns the count of matched elements in the {-srcArray-} array with the input { element }.
 * Returns 0 if no { element } is provided. It can take equalizer or evaluators for the routine equalities.
 *
 * @param { Array } src - The source array.
 * @param { * } element - The value to search.
 * @param { * } [ onEvaluate1 ] - It's a routine. If the routine has two parameters, it is used as an equalizer, and if it has only one, then routine used as the first part of the evaluator.
 * @param { * } [ onEvaluate2 ] - The second part of evaluator. Change the value to search.
 *
 * @example
 * // Simple exapmle. Returns 2
 * let arr = _.arrayCountElement( [ 1, 2, 'str', 10, 10, true ], 10 );
 *
 * @example
 * // With equalizer. Returns 4
 * let arr = _.arrayCountElement( [ 1, 2, 'str', 10, 10, true ], 10, ( a, b ) => _.typeOf( a ) === _.typeOf( b ) );
 *
 * @example
 * // With evaluator. Returns 4
 * let arr = _.arrayCountElement( [ [ 10, 2 ], [ 10, 2 ], [ 'str', 10 ], [ 10, true ], [ false, 10 ] ], 10, ( e ) => e[ 0 ], ( e ) => e );
 *
 * @returns { Number } - Returns the count of matched elements in the {-srcArray-} with the { element } element.
 * @function arrayCountElement
 * @throws { Error } If passed arguments is less than two or more than four.
 * @throws { Error } If the first argument is not an array-like object.
 * @throws { Error } If the third or fourth argument is not a routine.
 * @throws { Error } If the routine in third argument has less than one or more than two arguments.
 * @throws { Error } If the routine in third argument has two arguments and fourth argument is passed into routine arrayCountElement.
 * @throws { Error } If the routine in fourth argument has less than one or more than one arguments.
 * @memberof wTools
 */ ,
      arrayCountElement: function arrayCountElement(e, r, t, a) {
        let l = 0;
        n.assert(2 <= arguments.length && arguments.length <= 4), n.assert(n.longIs(e), "Expects long");
        let s = n.arrayLeftIndex(e, r, t, a);
        // let index = srcArray.indexOf( element );
                for (;s >= 0; ) l += 1, s = n.arrayLeftIndex(e, r, s + 1, t, a);
        return l;
      }
      //
      /**
 * The arrayCountTotal() adds all the elements in { -srcArray- }, elements can be numbers or booleans ( it considers them 0 or 1 ).
 *
 * @param { Array } srcArray - The source array.
 *
 * @example
 * // returns 23;
 * let arr = _.arrayCountTotal( [ 1, 2, 10, 10 ] );
 *
 * @example
 * // returns 1;
 * let arr = _.arrayCountTotal( [ true, false, false ] );
 *
 * @returns { Number } - Returns the sum of the elements in { srcArray }.
 * @function arrayCountTotal
 * @throws { Error } If passed arguments is different than one.
 * @throws { Error } If the first argument is not an array-like object.
 * @throws { Error } If { srcArray} doesn´t contain number-like elements.
 * @memberof wTools
 */ ,
      /* qqq : cover by tests */
      arrayCountTotal: function arrayCountTotal(e) {
        let r = 0;
        n.assert(1 === arguments.length), n.assert(n.longIs(e), "Expects long");
        for (let t = 0; t < e.length; t++) n.assert(n.boolIs(e[t]) || n.numberIs(e[t]) || null === e[t]), 
        r += e[t];
        return r;
      }
      //
      /**
 * The arrayCountUnique() routine returns the count of matched pairs ([ 1, 1, 2, 2, ., . ]) in the array {-srcMap-}.
 *
 * @param { longIs } src - The source array.
 * @param { Function } [ onEvaluate = function( e ) { return e } ] - A callback function.
 *
 * @example
 * // returns 3
 * _.arrayCountUnique( [ 1, 1, 2, 'abc', 'abc', 4, true, true ] );
 *
 * @example
 * // returns 0
 * _.arrayCountUnique( [ 1, 2, 3, 4, 5 ] );
 *
 * @returns { Number } - Returns the count of matched pairs ([ 1, 1, 2, 2, ., . ]) in the array {-srcMap-}.
 * @function arrayCountUnique
 * @throws { Error } If passed arguments is less than one or more than two.
 * @throws { Error } If the first argument is not an array-like object.
 * @throws { Error } If the second argument is not a Function.
 * @memberof wTools
 */ ,
      /* qqq : cover by tests */
      arrayCountUnique: function arrayCountUnique(e, r) {
        let t = [];
        r = r || function(e) {
          return e;
        }, n.assert(1 === arguments.length || 2 === arguments.length), n.assert(n.longIs(e), "arrayCountUnique :", "Expects ArrayLike"), 
        n.assert(n.routineIs(r)), n.assert(1 === r.length);
        for (let n = 0; n < e.length; n++) {
          let a = r(e[n]);
          if (-1 === t.indexOf(a)) for (let l = n + 1; l < e.length; l++) {
            let n = r(e[l]);
            -1 === t.indexOf(n) && a === n && t.push(a);
          }
        }
        return t.length;
      }
      // --
      // array prepend
      // --
      /*

qqq : optimize *OnlyStrict* routines
qqq : use for documentation

alteration Routines :

- array { Op } { Tense } { Second } { How }

alteration Op : [ Append , Prepend , Remove, Flatten ]        // operation
alteration Tense : [ - , ed ]                                 // what to return
alteration Second : [ -, element, array, array ]              // how to treat src arguments
alteration How : [ - , Once , OnceStrictly ]                  // how to treat repeats

~ 60 routines

*/
      //
      ,
      // array prepend
      arrayPrepend_: function arrayPrepend_(e) {
        n.assert(arguments.length >= 1), n.assert(n.arrayIs(e) || null === e, "Expects array"), 
        e = e || [];
        for (let r = arguments.length - 1; r >= 1; r--) n.longIs(arguments[r]) ? e.unshift.apply(e, arguments[r]) : e.unshift(arguments[r]);
        return e;
      }
      //
      ,
      arrayPrepend: function arrayPrepend(e, r) {
        return null === e && (e = [], arguments[0] = e), arrayPrepended.apply(this, arguments), 
        e;
      }
      //
      /**
 * Method adds a value of argument( ins ) to the beginning of an array( dstArray )
 * if destination( dstArray ) doesn't have the value of ( ins ).
 * Additionaly takes callback( onEqualize ) that checks if element from( dstArray ) is equal to( ins ).
 *
 * @param { Array } dstArray - The destination array.
 * @param { * } ins - The value to add.
 * @param { wTools~compareCallback } onEqualize - A callback function. By default, it checks the equality of two arguments.
 *
 * @example
 * // returns [ 5, 1, 2, 3, 4 ]
 * _.arrayPrependOnce( [ 1, 2, 3, 4 ], 5 );
 *
 * @example
 * // returns [ 1, 2, 3, 4, 5 ]
 * _.arrayPrependOnce( [ 1, 2, 3, 4, 5 ], 5 );
 *
 * @example
 * // returns [ 'Dmitry', 'Petre', 'Mikle', 'Oleg' ]
 * _.arrayPrependOnce( [ 'Petre', 'Mikle', 'Oleg' ], 'Dmitry' );
 *
 * @example
 * // returns [ 'Petre', 'Mikle', 'Oleg', 'Dmitry' ]
 * _.arrayPrependOnce( [ 'Petre', 'Mikle', 'Oleg', 'Dmitry' ], 'Dmitry' );
 *
 * @example
 * function onEqualize( a, b )
 * {
 *  return a.value === b.value;
 * };
 * _.arrayPrependOnce( [ { value : 1 }, { value : 2 } ], { value : 1 }, onEqualize );
 * // returns [ { value : 1 }, { value : 2 } ]
 *
 * @returns { Array } If an array ( dstArray ) doesn't have a value ( ins ) it returns the updated array ( dstArray ) with the new length,
 * otherwise, it returns the original array ( dstArray ).
 * @function arrayPrependOnce
 * @throws { Error } An Error if ( dstArray ) is not an Array.
 * @throws { Error } An Error if ( onEqualize ) is not an Function.
 * @throws { Error } An Error if ( arguments.length ) is not equal two or three.
 * @memberof wTools
 */ ,
      arrayPrependOnce: function arrayPrependOnce(e, r, t, n) {
        return null === e && (e = [], arguments[0] = e), arrayPrependedOnce.apply(this, arguments), 
        e;
      }
      //
      /**
 * Method adds a value of argument( ins ) to the beginning of an array( dstArray )
 * if destination( dstArray ) doesn't have the value of ( ins ).
 * Additionaly takes callback( onEqualize ) that checks if element from( dstArray ) is equal to( ins ).
 * Returns updated array( dstArray ) if( ins ) was added, otherwise throws an Error.
 *
 * @param { Array } dstArray - The destination array.
 * @param { * } ins - The value to add.
 * @param { wTools~compareCallback } onEqualize - A callback function. By default, it checks the equality of two arguments.
 *
 * @example
 * // returns [ 5, 1, 2, 3, 4 ]
 * _.arrayPrependOnceStrictly( [ 1, 2, 3, 4 ], 5 );
 *
 * @example
 * // throws error
 * _.arrayPrependOnceStrictly( [ 1, 2, 3, 4, 5 ], 5 );
 *
 * @example
 * // returns [ 'Dmitry', 'Petre', 'Mikle', 'Oleg' ]
 * _.arrayPrependOnceStrictly( [ 'Petre', 'Mikle', 'Oleg' ], 'Dmitry' );
 *
 * @example
 * // throws error
 * _.arrayPrependOnceStrictly( [ 'Petre', 'Mikle', 'Oleg', 'Dmitry' ], 'Dmitry' );
 *
 * @example
 * function onEqualize( a, b )
 * {
 *  return a.value === b.value;
 * };
 * _.arrayPrependOnceStrictly( [ { value : 1 }, { value : 2 } ], { value : 0 }, onEqualize );
 * // returns [ { value : 0 }, { value : 1 }, { value : 2 } ]
 *
 * @returns { Array } If an array ( dstArray ) doesn't have a value ( ins ) it returns the updated array ( dstArray ) with the new length,
 * otherwise, it throws an Error.
 * @function arrayPrependOnceStrictly
 * @throws { Error } An Error if ( dstArray ) is not an Array.
 * @throws { Error } An Error if ( onEqualize ) is not an Function.
 * @throws { Error } An Error if ( arguments.length ) is not equal two or three.
 * @throws { Error } An Error if ( ins ) already exists on( dstArray ).
 * @memberof wTools
 */ ,
      arrayPrependOnceStrictly: function arrayPrependOnceStrictly(e, r, t, a) {
        let l;
        null === e && (e = [], arguments[0] = e);
        debugger;
        return l = arrayPrependedOnce.apply(this, arguments), n.assert(l >= 0, () => "Array should have only unique elements, but has several " + n.strShort(r)), 
        e;
      },
      arrayPrepended: arrayPrepended,
      arrayPrependedOnce: arrayPrependedOnce,
      arrayPrependedOnceStrictly: function arrayPrependedOnceStrictly(e, r, t, a) {
        let l;
        debugger;
        return l = arrayPrependedOnce.apply(this, arguments), n.assert(l >= 0, () => "Array should have only unique elements, but has several " + n.strShort(r)), 
        l;
      }
      //
      /**
 * Routine adds a value of argument( ins ) to the beginning of an array( dstArray ).
 *
 * @param { Array } dstArray - The destination array.
 * @param { * } ins - The element to add.
 *
 * @example
 * // returns [ 5, 1, 2, 3, 4 ]
 * _.arrayPrependElement( [ 1, 2, 3, 4 ], 5 );
 *
 * @example
 * // returns [ 5, 1, 2, 3, 4, 5 ]
 * _.arrayPrependElement( [ 1, 2, 3, 4, 5 ], 5 );
 *
 * @returns { Array } Returns updated array, that contains new element( ins ).
 * @function arrayPrependElement
 * @throws { Error } An Error if ( dstArray ) is not an Array.
 * @throws { Error } An Error if ( arguments.length ) is less or more than two.
 * @memberof wTools
 */ ,
      arrayPrependElement: function arrayPrependElement(e, r) {
        return null === e && (e = [], arguments[0] = e), arrayPrependedElement.apply(this, arguments), 
        e;
      }
      //
      ,
      arrayPrependElementOnce: function arrayPrependElementOnce(e, r, t, n) {
        return null === e && (e = [], arguments[0] = e), arrayPrependedElementOnce.apply(this, arguments), 
        e;
      }
      //
      ,
      arrayPrependElementOnceStrictly: function arrayPrependElementOnceStrictly(e, r, t, a) {
        let l;
        null === e && (e = [], arguments[0] = e);
        debugger;
        return l = arrayPrependedElementOnce.apply(this, arguments), n.assert(void 0 !== l, "Array should have only unique elements, but has several", r), 
        e;
      },
      arrayPrependedElement: arrayPrependedElement,
      arrayPrependedElementOnce: arrayPrependedElementOnce,
      arrayPrependedElementOnceStrictly: function arrayPrependedElementOnceStrictly(e, r, t, a) {
        let l;
        debugger;
        return l = arrayPrependedElementOnce.apply(this, arguments), n.assert(void 0 !== l, "Array should have only unique elements, but has several", r), 
        l;
      }
      //
      /**
 * Method adds all elements from array( insArray ) to the beginning of an array( dstArray ).
 *
 * @param { Array } dstArray - The destination array.
 * @param { ArrayLike } insArray - The source array.
 *
 * @example
 * // returns [ 5, 1, 2, 3, 4 ]
 * _.arrayPrependArray( [ 1, 2, 3, 4 ], [ 5 ] );
 *
 * @example
 * // returns [ 5, 1, 2, 3, 4, 5 ]
 * _.arrayPrependArray( [ 1, 2, 3, 4, 5 ], [ 5 ] );
 *
 * @returns { Array } Returns updated array, that contains elements from( insArray ).
 * @function arrayPrependArray
 * @throws { Error } An Error if ( dstArray ) is not an Array.
 * @throws { Error } An Error if ( insArray ) is not an ArrayLike entity.
 * @throws { Error } An Error if ( arguments.length ) is less or more than two.
 * @memberof wTools
 */ ,
      arrayPrependArray: function arrayPrependArray(e, r) {
        return null === e && (e = [], arguments[0] = e), arrayPrependedArray.apply(this, arguments), 
        e;
      }
      //
      /**
 * Method adds all unique elements from array( insArray ) to the beginning of an array( dstArray )
 * Additionaly takes callback( onEqualize ) that checks if element from( dstArray ) is equal to( ins ).
 *
 * @param { Array } dstArray - The destination array.
 * @param { ArrayLike } insArray - The source array.
 * @param { wTools~compareCallback } onEqualize - A callback function. By default, it checks the equality of two arguments.
 *
 * @example
 * // returns [ 0, 1, 2, 3, 4 ]
 * _.arrayPrependArrayOnce( [ 1, 2, 3, 4 ], [ 0, 1, 2, 3, 4 ] );
 *
 * @example
 * // returns [ 'Petre', 'Mikle', 'Oleg', 'Dmitry' ]
 * _.arrayPrependArrayOnce( [ 'Petre', 'Mikle', 'Oleg', 'Dmitry' ], [ 'Dmitry' ] );
 *
 * @example
 * function onEqualize( a, b )
 * {
 *  return a.value === b.value;
 * };
 * _.arrayPrependArrayOnce( [ { value : 1 }, { value : 2 } ], [ { value : 1 } ], onEqualize );
 * // returns [ { value : 1 }, { value : 2 } ]
 *
 * @returns { Array } Returns updated array( dstArray ) or original if nothing added.
 * @function arrayPrependArrayOnce
 * @throws { Error } An Error if ( dstArray ) is not an Array.
 * @throws { Error } An Error if ( insArray ) is not an ArrayLike entity.
 * @throws { Error } An Error if ( onEqualize ) is not an Function.
 * @throws { Error } An Error if ( arguments.length ) is not equal two or three.
 * @memberof wTools
 */ ,
      arrayPrependArrayOnce: function arrayPrependArrayOnce(e, r, t, n) {
        return null === e && (e = [], arguments[0] = e), arrayPrependedArrayOnce.apply(this, arguments), 
        e;
      }
      //
      /**
 * Method adds all unique elements from array( insArray ) to the beginning of an array( dstArray )
 * Additionaly takes callback( onEqualize ) that checks if element from( dstArray ) is equal to( ins ).
 * Returns updated array( dstArray ) if all elements from( insArray ) was added, otherwise throws error.
 * Even error was thrown, elements that was prepended to( dstArray ) stays in the destination array.
 *
 * @param { Array } dstArray - The destination array.
 * @param { ArrayLike } insArray - The source array.
 * @param { wTools~compareCallback } onEqualize - A callback function. By default, it checks the equality of two arguments.
 *
 * @example
 * // returns [ 0, 1, 2, 3, 4 ]
 * _.arrayPrependArrayOnceStrictly( [ 1, 2, 3, 4 ], [ 0, 1, 2, 3, 4 ] );
 *
 * @example
 * function onEqualize( a, b )
 * {
 *  return a.value === b.value;
 * };
 * _.arrayPrependArrayOnceStrictly( [ { value : 1 }, { value : 2 } ], { value : 1 }, onEqualize );
 * // returns [ { value : 1 }, { value : 2 } ]
 *
 * * @example
 * let dst = [ 'Petre', 'Mikle', 'Oleg', 'Dmitry' ];
 * _.arrayPrependArrayOnceStrictly( dst, [ 'Antony', 'Dmitry' ] );
 * // throws error, but dstArray was updated by one element from insArray
 *
 * @returns { Array } Returns updated array( dstArray ) or throws an error if not all elements from source
 * array( insArray ) was added.
 * @function arrayPrependArrayOnceStrictly
 * @throws { Error } An Error if ( dstArray ) is not an Array.
 * @throws { Error } An Error if ( insArray ) is not an ArrayLike entity.
 * @throws { Error } An Error if ( onEqualize ) is not an Function.
 * @throws { Error } An Error if ( arguments.length ) is not equal two or three.
 * @memberof wTools
 */ ,
      arrayPrependArrayOnceStrictly: function arrayPrependArrayOnceStrictly(e, r, t, a) {
        let l;
        return null === e && (e = [], arguments[0] = e), l = arrayPrependedArrayOnce.apply(this, arguments), 
        n.assert(l === r.length), e;
      },
      arrayPrependedArray: arrayPrependedArray,
      arrayPrependedArrayOnce: arrayPrependedArrayOnce,
      arrayPrependedArrayOnceStrictly: function arrayPrependedArrayOnceStrictly(e, r, t, a) {
        let l;
        return l = arrayPrependedArrayOnce.apply(this, arguments), n.assert(l === r.length), 
        l;
      }
      //
      /**
 * Method adds all elements from provided arrays to the beginning of an array( dstArray ) in same order
 * that they are in( arguments ).
 * If argument provided after( dstArray ) is not a ArrayLike entity it will be prepended to destination array as usual element.
 * If argument is an ArrayLike entity and contains inner arrays, routine looks for elements only on first two levels.
 * Example: _.arrayPrependArrays( [], [ [ 1 ], [ [ 2 ] ] ] ) -> [ 1, [ 2 ] ];
 * Throws an error if one of arguments is undefined. Even if error was thrown, elements that was prepended to( dstArray ) stays in the destination array.
 *
 * @param { Array } dstArray - The destination array.
 * @param{ longIs | * } arguments[...] - Source arguments.
 *
 * @example
 * // returns [ 5, 6, 7, 1, 2, 3, 4 ]
 * _.arrayPrependArrays( [ 1, 2, 3, 4 ], [ 5 ], [ 6 ], 7 );
 *
 * @example
 * let dst = [ 1, 2, 3, 4 ];
 * _.arrayPrependArrays( dst, [ 5 ], [ 6 ], undefined );
 * // throws error, but dst becomes equal [ 5, 6, 1, 2, 3, 4 ]
 *
 * @returns { Array } Returns updated array( dstArray ).
 * @function arrayPrependArrays
 * @throws { Error } An Error if ( dstArray ) is not an Array.
 * @throws { Error } An Error if one of ( arguments ) is undefined.
 * @memberof wTools
 */ ,
      arrayPrependArrays: function arrayPrependArrays(e, r) {
        return null === e && (e = [], arguments[0] = e), arrayPrependedArrays.apply(this, arguments), 
        e;
      }
      //
      /**
 * Method adds all unique elements from provided arrays to the beginning of an array( dstArray ) in same order
 * that they are in( arguments ).
 * If argument provided after( dstArray ) is not a ArrayLike entity it will be prepended to destination array as usual element.
 * If argument is an ArrayLike entity and contains inner arrays, routine looks for elements only on first two levels.
 * Example: _.arrayPrependArrays( [], [ [ 1 ], [ [ 2 ] ] ] ) -> [ 1, [ 2 ] ];
 * Throws an error if one of arguments is undefined. Even if error was thrown, elements that was prepended to( dstArray ) stays in the destination array.

 * @param { Array } dstArray - The destination array.
 * @param{ longIs | * } arguments[...] - Source arguments.
 *
 * @example
 * // returns [ 5, 6, 7, 1, 2, 3, 4 ]
 * _.arrayPrependArraysOnce( [ 1, 2, 3, 4 ], [ 5 ], 5, [ 6 ], 6, 7, [ 7 ] );
 *
 * @example
 * let dst = [ 1, 2, 3, 4 ];
 * _.arrayPrependArraysOnce( dst, [ 5 ], 5, [ 6 ], 6, undefined );
 * // throws error, but dst becomes equal [ 5, 6, 1, 2, 3, 4 ]
 *
 * @returns { Array } Returns updated array( dstArray ).
 * @function arrayPrependArraysOnce
 * @throws { Error } An Error if ( dstArray ) is not an Array.
 * @throws { Error } An Error if one of ( arguments ) is undefined.
 * @memberof wTools
 */ ,
      arrayPrependArraysOnce: function arrayPrependArraysOnce(e, r, t, n) {
        return null === e && (e = [], arguments[0] = e), arrayPrependedArraysOnce.apply(this, arguments), 
        e;
      }
      //
      /**
 * Method adds all unique elements from provided arrays to the beginning of an array( dstArray ) in same order
 * that they are in( arguments ).
 * Throws an error if one of arguments is undefined.
 * If argument provided after( dstArray ) is not a ArrayLike entity it will be prepended to destination array as usual element.
 * If argument is an ArrayLike entity and contains inner arrays, routine looks for elements only on first two levels.
 * Example: _.arrayPrependArraysOnce( [], [ [ 1 ], [ [ 2 ] ] ] ) -> [ 1, [ 2 ] ];
 * After copying checks if all elements( from first two levels ) was copied, if true returns updated array( dstArray ), otherwise throws an error.
 * Even if error was thrown, elements that was prepended to( dstArray ) stays in the destination array.

 * @param { Array } dstArray - The destination array.
 * @param { longIs | * } arguments[...] - Source arguments.
 * @param { wTools~compareCallback } onEqualize - A callback function that can be provided through routine`s context. By default, it checks the equality of two arguments.
 *
 * @example
 * // returns [ 5, 6, 7, 8, 1, 2, 3, 4 ]
 * _.arrayPrependArraysOnceStrictly( [ 1, 2, 3, 4 ], 5, [ 6, [ 7 ] ], 8 );
 *
 * @example
 * // throws error
 * _.arrayPrependArraysOnceStrictly( [ 1, 2, 3, 4 ], [ 5 ], 5, [ 6 ], 6, 7, [ 7 ] );
 *
 * @example
 * function onEqualize( a, b )
 * {
 *  return a === b;
 * };
 * let dst = [];
 * let arguments = [ dst, [ 1, [ 2 ], [ [ 3 ] ] ], 4 ];
 * _.arrayPrependArraysOnceStrictly.apply( { onEqualize }, arguments );
 * //returns [ 1, 2, [ 3 ], 4 ]
 *
 * @returns { Array } Returns updated array( dstArray ).
 * @function arrayPrependArraysOnceStrictly
 * @throws { Error } An Error if ( dstArray ) is not an Array.
 * @throws { Error } An Error if one of ( arguments ) is undefined.
 * @throws { Error } An Error if count of added elements is not equal to count of elements from( arguments )( only first two levels inside of array are counted ).
 * @memberof wTools
 */ ,
      arrayPrependArraysOnceStrictly: function arrayPrependArraysOnceStrictly(e, r, t, a) {
        let l;
        null === e && (e = [], arguments[0] = e);
        {
          l = arrayPrependedArraysOnce.apply(this, arguments);
          let e = 0;
          for (let t = r.length - 1; t >= 0; t--) n.longIs(r[t]) ? e += r[t].length : e += 1;
          n.assert(l === e, "{-dstArray-} should have none element from {-insArray-}");
        }
        return e;
      },
      arrayPrependedArrays: arrayPrependedArrays,
      arrayPrependedArraysOnce: arrayPrependedArraysOnce,
      arrayPrependedArraysOnceStrictly: function arrayPrependedArraysOnceStrictly(e, r, t, a) {
        let l;
        {
          l = arrayPrependedArraysOnce.apply(this, arguments);
          let e = 0;
          for (let t = r.length - 1; t >= 0; t--) n.longIs(r[t]) ? e += r[t].length : e += 1;
          n.assert(l === e, "{-dstArray-} should have none element from {-insArray-}");
        }
        return l;
      }
      // --
      // array append
      // --
      ,
      // array append
      arrayAppend_: function arrayAppend_(e) {
        n.assert(arguments.length >= 1), n.assert(n.arrayIs(e) || null === e, "Expects array"), 
        e = e || [];
        for (let r = 1, t = arguments.length; r < t; r++) n.longIs(arguments[r]) ? e.push.apply(e, arguments[r]) : e.push(arguments[r]);
        return e;
      }
      //
      ,
      arrayAppend: function arrayAppend(e, r) {
        return null === e && (e = [], arguments[0] = e), arrayAppended.apply(this, arguments), 
        e;
      }
      //
      /**
 * The arrayAppendOnce() routine adds at the end of an array (dst) a value {-srcMap-},
 * if the array (dst) doesn't have the value {-srcMap-}.
 *
 * @param { Array } dst - The source array.
 * @param { * } src - The value to add.
 *
 * @example
 * // returns [ 1, 2, 3, 4, 5 ]
 * _.arrayAppendOnce( [ 1, 2, 3, 4 ], 5 );
 *
 * @example
 * // returns [ 1, 2, 3, 4, 5 ]
 * _.arrayAppendOnce( [ 1, 2, 3, 4, 5 ], 5 );
 *
 * @example
 * // returns [ 'Petre', 'Mikle', 'Oleg', 'Dmitry' ]
 * _.arrayAppendOnce( [ 'Petre', 'Mikle', 'Oleg' ], 'Dmitry' );
 *
 * @example
 * // returns [ 'Petre', 'Mikle', 'Oleg', 'Dmitry' ]
 * _.arrayAppendOnce( [ 'Petre', 'Mikle', 'Oleg', 'Dmitry' ], 'Dmitry' );
 *
 * @returns { Array } If an array (dst) doesn't have a value {-srcMap-} it returns the updated array (dst) with the new length,
 * otherwise, it returns the original array (dst).
 * @function arrayAppendOnce
 * @throws { Error } Will throw an Error if (dst) is not an Array.
 * @throws { Error } Will throw an Error if (arguments.length) is less or more than two.
 * @memberof wTools
 */ ,
      arrayAppendOnce: function arrayAppendOnce(e, r, t, n) {
        return null === e && (e = [], arguments[0] = e), arrayAppendedOnce.apply(this, arguments), 
        e;
      }
      //
      ,
      arrayAppendOnceStrictly: function arrayAppendOnceStrictly(e, r, t, a) {
        let l;
        return null === e && (e = [], arguments[0] = e), l = arrayAppendedOnce.apply(this, arguments), 
        n.assert(l >= 0, () => "Array should have only unique elements, but has several " + n.strShort(r)), 
        e;
      },
      arrayAppended: arrayAppended,
      arrayAppendedOnce: arrayAppendedOnce,
      arrayAppendedOnceStrictly: function arrayAppendedOnceStrictly(e, r, t, a) {
        let l;
        return l = arrayAppendedOnce.apply(this, arguments), n.assert(l >= 0, () => "Array should have only unique elements, but has several " + n.strShort(r)), 
        l;
      }
      //
      ,
      arrayAppendElement: function arrayAppendElement(e, r) {
        return null === e && (e = [], arguments[0] = e), arrayAppendedElement.apply(this, arguments), 
        e;
      }
      //
      ,
      /* qqq : fill gaps */
      arrayAppendElementOnce: function arrayAppendElementOnce(e, r) {
        return null === e && (e = [], arguments[0] = e), arrayAppendedElementOnce.apply(this, arguments), 
        e;
      }
      //
      ,
      arrayAppendElementOnceStrictly: function arrayAppendElementOnceStrictly(e, r) {
        let t;
        return null === e && (e = [], arguments[0] = e), t = arrayAppendedElementOnce.apply(this, arguments), 
        n.assert(!1 !== t, "Array should have only unique elements, but has several", r), 
        e;
      },
      arrayAppendedElement: arrayAppendedElement,
      arrayAppendedElementOnce: arrayAppendedElementOnce,
      arrayAppendedElementOnceStrictly: function arrayAppendedElementOnceStrictly(e, r) {
        let t;
        return t = arrayAppendedElementOnce.apply(this, arguments), n.assert(!1 !== t, "Array should have only unique elements, but has several", r), 
        t;
      }
      //
      /**
* The arrayAppendArray() routine adds one or more elements to the end of the (dst) array
* and returns the new length of the array.
*
* It creates two variables the (result) - array and the (argument) - elements of array-like object (arguments[]),
* iterate over array-like object (arguments[]) and assigns to the (argument) each element,
* checks, if (argument) is equal to the 'undefined'.
* If true, it throws an Error.
* If (argument) is an array-like.
* If true, it merges the (argument) into the (result) array.
* Otherwise, it adds element to the result.
*
* @param { Array } dst - Initial array.
* @param {*} arguments[] - One or more argument(s) to add to the end of the (dst) array.
*
* @example
* // returns [ 1, 2, 'str', false, { a : 1 }, 42, 3, 7, 13 ];
* let arr = _.arrayAppendArray( [ 1, 2 ], 'str', false, { a : 1 }, 42, [ 3, 7, 13 ] );
*
* @returns { Array } - Returns an array (dst) with all of the following argument(s) that were added to the end of the (dst) array.
* @function arrayAppendArray
* @throws { Error } If the first argument is not an array.
* @throws { Error } If type of the argument is equal undefined.
* @memberof wTools
*/ ,
      arrayAppendArray: function arrayAppendArray(e, r) {
        return null === e && (e = [], arguments[0] = e), arrayAppendedArray.apply(this, arguments), 
        e;
      }
      //
      /**
 * The arrayAppendArrayOnce() routine returns an array of elements from (dst)
 * and appending only unique following arguments to the end.
 *
 * It creates two variables the (result) - array and the (argument) - elements of array-like object (arguments[]),
 * iterate over array-like object (arguments[]) and assigns to the (argument) each element,
 * checks, if (argument) is equal to the 'undefined'.
 * If true, it throws an Error.
 * if (argument) is an array-like.
 * If true, it iterate over array (argument) and checks if (result) has the same values as the (argument).
 * If false, it adds elements of (argument) to the end of the (result) array.
 * Otherwise, it checks if (result) has not the same values as the (argument).
 * If true, it adds elements to the end of the (result) array.
 *
 * @param { Array } dst - Initial array.
 * @param {*} arguments[] - One or more argument(s).
 *
 * @example
 * // returns [ 1, 2, 'str', {}, 5 ]
 * let arr = _.arrayAppendArrayOnce( [ 1, 2 ], 'str', 2, {}, [ 'str', 5 ] );
 *
 * @returns { Array } - Returns an array (dst) with only unique following argument(s) that were added to the end of the (dst) array.
 * @function arrayAppendArrayOnce
 * @throws { Error } If the first argument is not array.
 * @throws { Error } If type of the argument is equal undefined.
 * @memberof wTools
 */ ,
      arrayAppendArrayOnce: function arrayAppendArrayOnce(e, r, t, n) {
        return null === e && (e = [], arguments[0] = e), arrayAppendedArrayOnce.apply(this, arguments), 
        e;
      }
      //
      ,
      arrayAppendArrayOnceStrictly: function arrayAppendArrayOnceStrictly(e, r, t, a) {
        let l;
        return null === e && (e = [], arguments[0] = e), l = arrayAppendedArrayOnce.apply(this, arguments), 
        n.assert(l === r.length), e;
      },
      arrayAppendedArray: arrayAppendedArray,
      arrayAppendedArrayOnce: arrayAppendedArrayOnce,
      arrayAppendedArrayOnceStrictly: function arrayAppendedArrayOnceStrictly(e, r) {
        let t;
        return t = arrayAppendedArrayOnce.apply(this, arguments), n.assert(t === r.length, "Array should have only unique elements, but has several", r), 
        t;
      }
      //
      ,
      arrayAppendArrays: function arrayAppendArrays(e, r) {
        return null === e && (e = [], arguments[0] = e), void 0 === e ? (n.assert(2 === arguments.length), 
        r) : (n.arrayAppendedArrays.apply(this, arguments), e);
      }
      //
      ,
      arrayAppendArraysOnce: function arrayAppendArraysOnce(e, r, t, a) {
        if (null === e) e = [], arguments[0] = e; else if (void 0 === e) {
          if (!n.arrayIs(r)) return n.assert(2 <= arguments.length && arguments.length <= 4), 
          r;
          e = [], arguments[0] = e;
        }
        return arrayAppendedArraysOnce.apply(this, arguments), e;
      }
      //
      ,
      arrayAppendArraysOnceStrictly: function arrayAppendArraysOnceStrictly(e, r, t, a) {
        let l;
        null === e && (e = [], arguments[0] = e);
        {
          l = arrayAppendedArraysOnce.apply(this, arguments);
          let e = 0;
          for (let t = r.length - 1; t >= 0; t--) n.longIs(r[t]) ? e += r[t].length : e += 1;
          n.assert(l === e, "{-dstArray-} should have none element from {-insArray-}");
        }
        return e;
      }
      //
      ,
      arrayAppendedArrays: function arrayAppendedArrays(e, r) {
        n.assert(2 === arguments.length, "Expects exactly two arguments"), n.longIs(r) || void 0 === r || (r = [ r ]), 
        // if( !_.longIs( insArray ) )
        // {
        //   if( !_.arrayIs( dstArray ) )
        //   return [ dstArray, insArray ];
        //   else
        //   dstArray.push( insArray );
        //   return 1;
        // }
        // if( !_.arrayIs( insArray ) && insArray !== undefined )
        // insArray = [ insArray ];
        // if( !_.arrayIs( insArray ) && insArray !== undefined )
        // insArray = [ insArray ];
        n.assert(n.arrayIs(e), "Expects array"), n.assert(n.longIs(r), "Expects longIs entity");
        let t = 0;
        for (let a = 0, l = r.length; a < l; a++) n.longIs(r[a]) ? (e.push.apply(e, r[a]), 
        t += r[a].length) : (e.push(r[a]), t += 1);
        return t;
      },
      arrayAppendedArraysOnce: arrayAppendedArraysOnce,
      arrayAppendedArraysOnceStrictly: function arrayAppendedArraysOnceStrictly(e, r) {
        let t;
        {
          t = arrayAppendedArraysOnce.apply(this, arguments);
          let e = 0;
          for (let t = r.length - 1; t >= 0; t--) n.longIs(r[t]) ? e += r[t].length : e += 1;
          n.assert(t === e, "{-dstArray-} should have none element from {-insArray-}");
        }
        return t;
      }
      // --
      // array remove
      // --
      /**
 * ArrayRemove, arrayRemoveOnce, arrayRemoveOnceStrictly and arrayRemoved behave just like
 * arrayRemoveElement, arrayRemoveElementOnce, arrayRemoveElementOnceStrictly and arrayRemovedElement.
 */ ,
      // array remove
      arrayRemove: function arrayRemove(e, r, t, n) {
        return arrayRemoved.apply(this, arguments), e;
      }
      //
      ,
      arrayRemoveOnce: function arrayRemoveOnce(e, r, t, n) {
        return arrayRemovedOnce.apply(this, arguments), e;
      }
      //
      ,
      arrayRemoveOnceStrictly: function arrayRemoveOnceStrictly(e, r, t, n) {
        return arrayRemoveElementOnceStrictly.apply(this, arguments), e;
      },
      arrayRemoved: arrayRemoved,
      arrayRemovedOnce: arrayRemovedOnce,
      arrayRemovedOnceStrictly: function arrayRemovedOnceStrictly(e, r, t, a) {
        let l = n.arrayLeftIndex.apply(n, arguments);
        l >= 0 ? e.splice(l, 1) : n.assert(0, () => "Array does not have element " + n.toStrShort(r));
        let s = n.arrayLeftIndex.apply(n, arguments);
        return n.assert(s < 0, () => "The element " + n.toStrShort(r) + " is several times in dstArray"), 
        l;
      }
      //
      ,
      arrayRemoveElement: function arrayRemoveElement(e, r, t, n) {
        return arrayRemovedElement.apply(this, arguments), e;
      }
      //
      /**
 * The arrayRemoveElementOnce() routine removes the first matching element from (dstArray)
 * that corresponds to the condition in the callback function and returns a modified array.
 *
 * It takes two (dstArray, ins) or three (dstArray, ins, onEvaluate) arguments,
 * checks if arguments passed two, it calls the routine
 * [arrayRemovedElementOnce( dstArray, ins )]{@link wTools.arrayRemovedElementOnce}
 * Otherwise, if passed three arguments, it calls the routine
 * [arrayRemovedElementOnce( dstArray, ins, onEvaluate )]{@link wTools.arrayRemovedElementOnce}
 * @see  wTools.arrayRemovedElementOnce
 * @param { Array } dstArray - The source array.
 * @param { * } ins - The value to remove.
 * @param { wTools~compareCallback } [ onEvaluate ] - The callback that compares (ins) with elements of the array.
 * By default, it checks the equality of two arguments.
 *
 * @example
 * // returns [ 1, 2, 3, 'str' ]
 * let arr = _.arrayRemoveElementOnce( [ 1, 'str', 2, 3, 'str' ], 'str' );
 *
 * @example
 * // returns [ 3, 7, 13, 33 ]
 * let arr = _.arrayRemoveElementOnce( [ 3, 7, 33, 13, 33 ], 13, function( el, ins ) {
 *   return el > ins;
 * });
 *
 * @returns { Array } - Returns the modified (dstArray) array with the new length.
 * @function arrayRemoveElementOnce
 * @throws { Error } If the first argument is not an array.
 * @throws { Error } If passed less than two or more than three arguments.
 * @throws { Error } If the third argument is not a function.
 * @memberof wTools
 */ ,
      /* should remove all */
      arrayRemoveElementOnce: function arrayRemoveElementOnce(e, r, t, n) {
        return arrayRemovedElementOnce.apply(this, arguments), e;
      },
      arrayRemoveElementOnceStrictly: arrayRemoveElementOnceStrictly,
      arrayRemovedElement: arrayRemovedElement,
      arrayRemovedElementOnce: arrayRemovedElementOnce,
      arrayRemovedElementOnceStrictly: function arrayRemovedElementOnceStrictly(e, r, t, a) {
        let l, s = n.arrayLeftIndex.apply(n, arguments);
        return s >= 0 ? (l = e[s], e.splice(s, 1)) : n.assert(0, () => "Array does not have element " + n.toStrShort(r)), 
        s = n.arrayLeftIndex.apply(n, arguments), n.assert(s < 0, () => "The element " + n.toStrShort(r) + " is several times in dstArray"), 
        l;
      }
      /*
function arrayRemovedElementOnceStrictly( dstArray, ins, evaluator1, evaluator2 )
{

  let result;
  let index = _.arrayLeftIndex.apply( _, arguments );
  if( index >= 0 )
  {
    result = dstArray[ index ];
    dstArray.splice( index, 1 );
  }
  else _.assert( 0, () => 'Array does not have element ' + _.toStrShort( ins ) );

  return result;
}
*/
      //
      ,
      arrayRemoveArray: function arrayRemoveArray(e, r) {
        return arrayRemovedArray.apply(this, arguments), e;
      }
      //
      ,
      arrayRemoveArrayOnce: function arrayRemoveArrayOnce(e, r, t, n) {
        return arrayRemovedArrayOnce.apply(this, arguments), e;
      }
      //
      ,
      arrayRemoveArrayOnceStrictly: function arrayRemoveArrayOnceStrictly(e, r, t, a) {
        let l;
        {
          l = arrayRemovedArrayOnce.apply(this, arguments);
          let t = -1;
          for (let a = 0, l = r.length; a < l; a++) t = e.indexOf(r[a]), n.assert(t < 0);
          n.assert(l === r.length);
        }
        return e;
      },
      arrayRemovedArray: arrayRemovedArray,
      arrayRemovedArrayOnce: arrayRemovedArrayOnce,
      arrayRemovedArrayOnceStrictly: function arrayRemovedArrayOnceStrictly(e, r, t, a) {
        let l;
        {
          l = arrayRemovedArrayOnce.apply(this, arguments);
          let t = -1;
          for (let a = 0, l = r.length; a < l; a++) t = e.indexOf(r[a]), n.assert(t < 0);
          n.assert(l === r.length);
        }
        return l;
      }
      //
      ,
      arrayRemoveArrays: function arrayRemoveArrays(e, r) {
        return arrayRemovedArrays.apply(this, arguments), e;
      }
      //
      ,
      arrayRemoveArraysOnce: function arrayRemoveArraysOnce(e, r, t, n) {
        return arrayRemovedArraysOnce.apply(this, arguments), e;
      }
      //
      ,
      arrayRemoveArraysOnceStrictly: function arrayRemoveArraysOnceStrictly(e, r, t, a) {
        let l;
        {
          l = arrayRemovedArraysOnce.apply(this, arguments);
          let e = 0;
          for (let t = r.length - 1; t >= 0; t--) n.longIs(r[t]) ? e += r[t].length : e += 1;
          n.assert(l === e), n.assert(0 === arrayRemovedArraysOnce.apply(this, arguments));
        }
        return e;
      },
      arrayRemovedArrays: arrayRemovedArrays,
      arrayRemovedArraysOnce: arrayRemovedArraysOnce,
      arrayRemovedArraysOnceStrictly: function arrayRemovedArraysOnceStrictly(e, r, t, a) {
        let l;
        {
          l = arrayRemovedArraysOnce.apply(this, arguments);
          let e = 0;
          for (let t = r.length - 1; t >= 0; t--) n.longIs(r[t]) ? e += r[t].length : e += 1;
          n.assert(l === e), n.assert(0 === arrayRemovedArraysOnce.apply(this, arguments));
        }
        return l;
      }
      //
      /**
 * Callback for compare two value.
 *
 * @callback arrayRemoveAll~compareCallback
 * @param { * } el - Element of the array.
 * @param { * } ins - Value to compare.
 */
      /**
 * The arrayRemoveAll() routine removes all (ins) values from (dstArray)
 * that corresponds to the condition in the callback function and returns the modified array.
 *
 * It takes two (dstArray, ins) or three (dstArray, ins, onEvaluate) arguments,
 * checks if arguments passed two, it calls the routine
 * [arrayRemovedElement( dstArray, ins )]{@link wTools.arrayRemovedElement}
 * Otherwise, if passed three arguments, it calls the routine
 * [arrayRemovedElement( dstArray, ins, onEvaluate )]{@link wTools.arrayRemovedElement}
 *
 * @see wTools.arrayRemovedElement
 *
 * @param { Array } dstArray - The source array.
 * @param { * } ins - The value to remove.
 * @param { wTools~compareCallback } [ onEvaluate ] - The callback that compares (ins) with elements of the array.
 * By default, it checks the equality of two arguments.
 *
 * @example
 * // returns [ 2, 2, 3, 5 ]
 * let arr = _.arrayRemoveAll( [ 1, 2, 2, 3, 5 ], 2, function( el, ins ) {
 *   return el < ins;
 * });
 *
 * @example
 * // returns [ 1, 3, 5 ]
 * let arr = _.arrayRemoveAll( [ 1, 2, 2, 3, 5 ], 2 );
 *
 * @returns { Array } - Returns the modified (dstArray) array with the new length.
 * @function arrayRemoveAll
 * @throws { Error } If the first argument is not an array-like.
 * @throws { Error } If passed less than two or more than three arguments.
 * @throws { Error } If the third argument is not a function.
 * @memberof wTools
 */
      // function arrayRemoveAll( dstArray, ins, evaluator1, evaluator2 )
      // {
      //   arrayRemovedAll.apply( this, arguments );
      //   return dstArray;
      // }
      //
      // //
      //
      // function arrayRemovedAll( dstArray, ins, evaluator1, evaluator2  )
      // {
      //   let index = _.arrayLeftIndex.apply( _, arguments );
      //   let result = 0;
      //
      //   while( index >= 0 )
      //   {
      //     dstArray.splice( index, 1 );
      //     result += 1;
      //     index = _.arrayLeftIndex.apply( _, arguments );
      //   }
      //
      //   return result;
      // }
      //
      /**
 * The arrayRemoveDuplicates( dstArray, evaluator ) routine returns the dstArray with the duplicated elements removed.
 *
 * @param { ArrayIs } dstArray - The source and destination array.
 * @param { Function } [ evaluator = function( e ) { return e } ] - A callback function.
 *
 * @example
 * // returns [ 1, 2, 'abc', 4, true ]
 * _.arrayRemoveDuplicates( [ 1, 1, 2, 'abc', 'abc', 4, true, true ] );
 *
 * @example
 * // [ 1, 2, 3, 4, 5 ]
 * _.arrayRemoveDuplicates( [ 1, 2, 3, 4, 5 ] );
 *
 * @returns { Number } - Returns the source array without the duplicated elements.
 * @function arrayRemoveDuplicates
 * @throws { Error } If passed arguments is less than one or more than two.
 * @throws { Error } If the first argument is not an array.
 * @throws { Error } If the second argument is not a Function.
 * @memberof wTools
 */ ,
      // arrayRemoveAll,
      // arrayRemovedAll,
      arrayRemoveDuplicates: function arrayRemoveDuplicates(e, r) {
        n.assert(1 <= arguments.length || arguments.length <= 2), n.assert(n.arrayIs(e), "Expects Array");
        for (let t = 0; t < e.length; t++) {
          let a;
          do {
            (a = n.arrayRightIndex(e, e[t], r)) !== t && e.splice(a, 1);
          } while (a !== t);
        }
        return e;
      }
      /* qqq : use do .. while instead */
      /*
function arrayRemoveDuplicates( dstArray, evaluator )
{
  _.assert( 1 <= arguments.length || arguments.length <= 2 );
  _.assert( _.arrayIs( dstArray ), 'arrayRemoveDuplicates :', 'Expects Array' );

  for( let i1 = 0 ; i1 < dstArray.length ; i1++ )
  {
    let element1 = dstArray[ i1 ];
    let index = _.arrayRightIndex( dstArray, element1, evaluator );

    while ( index !== i1 )
    {
      dstArray.splice( index, 1 );
      index = _.arrayRightIndex( dstArray, element1, evaluator );
    }
  }

  return dstArray;
}
*/
      // --
      // array flatten
      // --
      /**
 * The arrayFlatten() routine returns an array that contains all the passed arguments.
 *
 * It creates two variables the (result) - array and the {-srcMap-} - elements of array-like object (arguments[]),
 * iterate over array-like object (arguments[]) and assigns to the {-srcMap-} each element,
 * checks if {-srcMap-} is not equal to the 'undefined'.
 * If true, it adds element to the result.
 * If {-srcMap-} is an Array and if element(s) of the {-srcMap-} is not equal to the 'undefined'.
 * If true, it adds to the (result) each element of the {-srcMap-} array.
 * Otherwise, if {-srcMap-} is an Array and if element(s) of the {-srcMap-} is equal to the 'undefined' it throws an Error.
 *
 * @param {...*} arguments - One or more argument(s).
 *
 * @example
 * // returns [ 'str', {}, 1, 2, 5, true ]
 * let arr = _.arrayFlatten( 'str', {}, [ 1, 2 ], 5, true );
 *
 * @returns { Array } - Returns an array of the passed argument(s).
 * @function arrayFlatten
 * @throws { Error } If (arguments[...]) is an Array and has an 'undefined' element.
 * @memberof wTools
 */ ,
      // array flatten
      arrayFlatten: function arrayFlatten(e, r) {
        return null === e && (e = [], arguments[0] = e), arrayFlattened.apply(this, arguments), 
        e;
      }
      //
      ,
      arrayFlattenOnce: function arrayFlattenOnce(e, r, t, n) {
        return null === e && (e = [], arguments[0] = e), arrayFlattenedOnce.apply(this, arguments), 
        e;
      }
      //
      ,
      arrayFlattenOnceStrictly: function arrayFlattenOnceStrictly(e, r, t, n) {
        return arrayFlattenedOnceStrictly.apply(this, arguments), e;
      },
      arrayFlattened: arrayFlattened,
      arrayFlattenedOnce: arrayFlattenedOnce,
      arrayFlattenedOnceStrictly: arrayFlattenedOnceStrictly,
      arrayFlattenDefined: function arrayFlattenDefined(e, r) {
        return null === e && (e = [], arguments[0] = e), arrayFlattenedDefined.apply(this, arguments), 
        e;
      }
      //
      ,
      arrayFlattenDefinedOnce: function arrayFlattenDefinedOnce(e, r, t, n) {
        return null === e && (e = [], arguments[0] = e), arrayFlattenedDefinedOnce.apply(this, arguments), 
        e;
      }
      //
      ,
      arrayFlattenDefinedOnceStrictly: function arrayFlattenDefinedOnceStrictly(e, r, t, n) {
        return arrayFlattenedDefinedOnceStrictly.apply(this, arguments), e;
      },
      arrayFlattenedDefined: arrayFlattenedDefined,
      arrayFlattenedDefinedOnce: arrayFlattenedDefinedOnce,
      arrayFlattenedDefinedOnceStrictly: arrayFlattenedDefinedOnceStrictly,
      // array replace
      arrayReplace: function arrayReplace(e, r, t, a, l) {
        n.assert(3 <= arguments.length && arguments.length <= 5);
        let s = -1, y = 0;
        for (s = n.arrayLeftIndex(e, r, a, l); -1 !== s; ) e.splice(s, 1, t), y += 1, s = n.arrayLeftIndex(e, r, a, l);
        return e;
      }
      /**
 * The arrayReplaceOnce() routine returns the index of the (dstArray) array which will be replaced by (sub),
 * if (dstArray) has the value (ins).
 *
 * It takes three arguments (dstArray, ins, sub), calls built in function(dstArray.indexOf(ins)),
 * that looking for value (ins) in the (dstArray).
 * If true, it replaces (ins) value of (dstArray) by (sub) and returns the index of the (ins).
 * Otherwise, it returns (-1) index.
 *
 * @param { Array } dstArray - The source array.
 * @param { * } ins - The value to find.
 * @param { * } sub - The value to replace.
 *
 * @example
 * // returns -1
 * _.arrayReplaceOnce( [ 2, 4, 6, 8, 10 ], 12, 14 );
 *
 * @example
 * // returns 1
 * _.arrayReplaceOnce( [ 1, undefined, 3, 4, 5 ], undefined, 2 );
 *
 * @example
 * // returns 3
 * _.arrayReplaceOnce( [ 'Petre', 'Mikle', 'Oleg', 'Dmitry' ], 'Dmitry', 'Bob' );
 *
 * @example
 * // returns 4
 * _.arrayReplaceOnce( [ true, true, true, true, false ], false, true );
 *
 * @returns { number }  Returns the index of the (dstArray) array which will be replaced by (sub),
 * if (dstArray) has the value (ins).
 * @function arrayReplaceOnce
 * @throws { Error } Will throw an Error if (dstArray) is not an array.
 * @throws { Error } Will throw an Error if (arguments.length) is less than three.
 * @memberof wTools
 */ ,
      arrayReplaceOnce: function arrayReplaceOnce(e, r, t, n, a) {
        return arrayReplacedOnce.apply(this, arguments), e;
      }
      //
      ,
      arrayReplaceOnceStrictly: function arrayReplaceOnceStrictly(e, r, t, a, l) {
        let s;
        return s = arrayReplacedOnce.apply(this, arguments), n.assert(s >= 0, () => "Array does not have element " + n.toStrShort(r)), 
        s = arrayReplacedOnce.apply(this, arguments), n.assert(s < 0, () => "The element " + n.toStrShort(r) + "is several times in dstArray"), 
        e;
      }
      /*
function arrayReplaceOnceStrictly( dstArray, ins, sub, evaluator1, evaluator2 )
{
  let result = arrayReplacedOnce.apply( this, arguments );
  _.assert( result >= 0, () => 'Array does not have element ' + _.toStrShort( ins ) );
  return dstArray;
}
*/
      //
      ,
      arrayReplaced: function arrayReplaced(e, r, t, a, l) {
        n.assert(3 <= arguments.length && arguments.length <= 5);
        let s = -1, y = 0;
        for (s = n.arrayLeftIndex(e, r, a, l); -1 !== s; ) e.splice(s, 1, t), y += 1, s = n.arrayLeftIndex(e, r, a, l);
        return y;
      },
      arrayReplacedOnce: arrayReplacedOnce,
      arrayReplacedOnceStrictly: function arrayReplacedOnceStrictly(e, r, t, a, l) {
        let s;
        {
          s = arrayReplacedOnce.apply(this, arguments), n.assert(s >= 0, () => "Array does not have element " + n.toStrShort(r));
          let e = arrayReplacedOnce.apply(this, arguments);
          n.assert(e < 0, () => "The element " + n.toStrShort(r) + "is several times in dstArray");
        }
        return s;
      }
      //
      ,
      /* qqq implement */
      arrayReplaceElement: function arrayReplaceElement(e, r, t, a, l) {
        n.assert(3 <= arguments.length && arguments.length <= 5);
        let s = -1, y = 0;
        for (s = n.arrayLeftIndex(e, r, a, l); -1 !== s; ) e.splice(s, 1, t), y += 1, s = n.arrayLeftIndex(e, r, a, l);
        return e;
      }
      //
      ,
      arrayReplaceElementOnce: function arrayReplaceElementOnce(e, r, t, n, a) {
        return arrayReplacedElementOnce.apply(this, arguments), e;
      }
      //
      ,
      arrayReplaceElementOnceStrictly: function arrayReplaceElementOnceStrictly(e, r, t, a, l) {
        let s;
        return s = arrayReplacedElementOnce.apply(this, arguments), n.assert(void 0 !== s, () => "Array does not have element " + n.toStrShort(r)), 
        s = arrayReplacedElementOnce.apply(this, arguments), n.assert(void 0 === s, () => "The element " + n.toStrShort(r) + "is several times in dstArray"), 
        e;
      }
      //
      ,
      arrayReplacedElement: function arrayReplacedElement(e, r, t, a, l) {
        n.assert(3 <= arguments.length && arguments.length <= 5);
        let s = -1, y = 0;
        for (s = n.arrayLeftIndex(e, r, a, l); -1 !== s; ) e.splice(s, 1, t), y += 1, s = n.arrayLeftIndex(e, r, a, l);
        return y;
      },
      arrayReplacedElementOnce: arrayReplacedElementOnce,
      arrayReplacedElementOnceStrictly: function arrayReplacedElementOnceStrictly(e, r, t, a, l) {
        let s;
        {
          s = arrayReplacedElementOnce.apply(this, arguments), n.assert(void 0 !== s, () => "Array does not have element " + n.toStrShort(r));
          let e = arrayReplacedElementOnce.apply(this, arguments);
          n.assert(void 0 === e, () => "The element " + n.toStrShort(r) + "is several times in dstArray");
        }
        return s;
      }
      /*
function arrayReplacedOnceStrictly( dstArray, ins, sub, evaluator1, evaluator2 )
{
  let result = arrayReplacedOnce.apply( this, arguments );
  _.assert( result >= 0, () => 'Array does not have element ' + _.toStrShort( ins ) );
  return result;
}
*/
      //
      ,
      arrayReplaceArray: function arrayReplaceArray(e, r, t, n, a) {
        return arrayReplacedArray.apply(this, arguments), e;
      }
      //
      ,
      arrayReplaceArrayOnce: function arrayReplaceArrayOnce(e, r, t, n, a) {
        return arrayReplacedArrayOnce.apply(this, arguments), e;
      }
      //
      ,
      arrayReplaceArrayOnceStrictly: function arrayReplaceArrayOnceStrictly(e, r, t, a, l) {
        let s;
        {
          s = arrayReplacedArrayOnce.apply(this, arguments), n.assert(s === r.length, "{-dstArray-} should have each element of {-insArray-}"), 
          n.assert(r.length === t.length, "{-subArray-} should have the same length {-insArray-} has");
          let e = arrayReplacedArrayOnce.apply(this, arguments);
          n.assert(0 === e, () => "The element " + n.toStrShort(r) + "is several times in dstArray");
        }
        return e;
      },
      arrayReplacedArray: arrayReplacedArray,
      arrayReplacedArrayOnce: arrayReplacedArrayOnce,
      arrayReplacedArrayOnceStrictly: function arrayReplacedArrayOnceStrictly(e, r, t, a, l) {
        let s;
        {
          s = arrayReplacedArrayOnce.apply(this, arguments), n.assert(s === r.length, "{-dstArray-} should have each element of {-insArray-}"), 
          n.assert(r.length === t.length, "{-subArray-} should have the same length {-insArray-} has");
          let e = arrayReplacedArrayOnce.apply(this, arguments);
          n.assert(0 === e, () => "One element of " + n.toStrShort(r) + "is several times in dstArray");
        }
        return s;
      }
      //
      ,
      arrayReplaceArrays: function arrayReplaceArrays(e, r, t, n, a) {
        return arrayReplacedArrays.apply(this, arguments), e;
      }
      //
      ,
      arrayReplaceArraysOnce: function arrayReplaceArraysOnce(e, r, t, n, a) {
        return arrayReplacedArraysOnce.apply(this, arguments), e;
      }
      //
      ,
      arrayReplaceArraysOnceStrictly: function arrayReplaceArraysOnceStrictly(e, r, t, a, l) {
        let s;
        {
          s = arrayReplacedArraysOnce.apply(this, arguments);
          let e = 0;
          for (let t = r.length - 1; t >= 0; t--) n.longIs(r[t]) ? e += r[t].length : e += 1;
          n.assert(s === e, "{-dstArray-} should have each element of {-insArray-}"), n.assert(r.length === t.length, "{-subArray-} should have the same length {-insArray-} has");
          let a = arrayReplacedArrayOnce.apply(this, arguments);
          n.assert(0 === a, () => "One element of " + n.toStrShort(r) + "is several times in dstArray");
        }
        return e;
      },
      arrayReplacedArrays: arrayReplacedArrays,
      arrayReplacedArraysOnce: arrayReplacedArraysOnce,
      arrayReplacedArraysOnceStrictly: function arrayReplacedArraysOnceStrictly(e, r, t, a, l) {
        let s;
        {
          s = arrayReplacedArraysOnce.apply(this, arguments);
          let e = 0;
          for (let t = r.length - 1; t >= 0; t--) n.longIs(r[t]) ? e += r[t].length : e += 1;
          n.assert(s === e, "{-dstArray-} should have each element of {-insArray-}"), n.assert(r.length === t.length, "{-subArray-} should have the same length {-insArray-} has");
          let a = arrayReplacedArrayOnce.apply(this, arguments);
          n.assert(0 === a, () => "The element " + n.toStrShort(r) + "is several times in dstArray");
        }
        return s;
      }
      // //
      //
      // function arrayReplaceAll( dstArray, ins, sub, evaluator1, evaluator2 )
      // {
      //   arrayReplacedAll.apply( this, arguments );
      //   return dstArray;
      // }
      //
      // //
      //
      // function arrayReplacedAll( dstArray, ins, sub, evaluator1, evaluator2 )
      // {
      //   _.assert( 3 <= arguments.length && arguments.length <= 5 );
      //
      //   let index = -1;
      //   let result = 0;
      //
      //   index = _.arrayLeftIndex( dstArray, ins, evaluator1, evaluator2 );
      //
      //   while( index !== -1 )
      //   {
      //     dstArray.splice( index, 1, sub );
      //     result += 1;
      //     index = _.arrayLeftIndex( dstArray, ins, evaluator1, evaluator2 );
      //   }
      //
      //   return result;
      // }
      //
      /**
 * The arrayUpdate() routine adds a value (sub) to an array (dstArray) or replaces a value (ins) of the array (dstArray) by (sub),
 * and returns the last added index or the last replaced index of the array (dstArray).
 *
 * It creates the variable (index) assigns and calls to it the function(arrayReplaceOnce( dstArray, ins, sub ).
 * [arrayReplaceOnce( dstArray, ins, sub )]{@link wTools.arrayReplaceOnce}.
 * Checks if (index) equal to the -1.
 * If true, it adds to an array (dstArray) a value (sub), and returns the last added index of the array (dstArray).
 * Otherwise, it returns the replaced (index).
 *
 * @see wTools.arrayReplaceOnce
 *
 * @param { Array } dstArray - The source array.
 * @param { * } ins - The value to change.
 * @param { * } sub - The value to add or replace.
 *
 * @example
 * // returns 3
 * let add = _.arrayUpdate( [ 'Petre', 'Mikle', 'Oleg' ], 'Dmitry', 'Dmitry' );
 * console.log( add ) = > [ 'Petre', 'Mikle', 'Oleg', 'Dmitry' ];
 *
 * @example
 * // returns 5
 * let add = _.arrayUpdate( [ 1, 2, 3, 4, 5 ], 6, 6 );
 * console.log( add ) => [ 1, 2, 3, 4, 5, 6 ];
 *
 * @example
 * // returns 4
 * let replace = _.arrayUpdate( [ true, true, true, true, false ], false, true );
 * console.log( replace ) => [ true, true true, true, true ];
 *
 * @returns { number } Returns the last added or the last replaced index.
 * @function arrayUpdate
 * @throws { Error } Will throw an Error if (dstArray) is not an array-like.
 * @throws { Error } Will throw an Error if (arguments.length) is less or more than three.
 * @memberof wTools
 */ ,
      // arrayReplaceAll, // use arrayReplaceElement instead
      // arrayReplacedAll, // use arrayReplacedElement instead
      arrayUpdate: function arrayUpdate(e, r, t, n, a) {
        let l = arrayReplacedOnce.apply(this, arguments);
        return -1 === l && (e.push(t), l = e.length - 1), l;
      }
      // --
      // fields
      // --
      // let unrollSymbol = Symbol.for( 'unroll' );
        };
    //
    Object.assign(a, s), Object.assign(a, l), 
    // --
    // export
    // --
    "undefined" != typeof module && null !== module && (module.exports = a);
  }();
  // == end of file fLongS
}();