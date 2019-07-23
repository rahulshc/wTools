!function LongTestS() {
  // == begin of file LongTestS
  !function _Long_test_s_() {
    "use strict";
    //
    /*
qqq : improve, add exception checking ceases
*/
    function longSlice(e) {
      function makeU8() {
        return new U8x(arguments);
      }
      /* */      function runFor(a) {
        e.case = "empty";
        var n = a(), i = r.longSlice(n), t = a();
        e.identical(i, t), e.is(n !== i), n = a(), i = r.longSlice(n, 0), t = a(), e.identical(i, t), 
        e.is(n !== i), n = a(), i = r.longSlice(n, 0, 5), t = a(), e.identical(i, t), e.is(n !== i), 
        n = a(), i = r.longSlice(n, -1, 5), t = a(), e.identical(i, t), e.is(n !== i), n = a(), 
        i = r.longSlice(n, 0, -1), t = a(), e.identical(i, t), e.is(n !== i), e.case = "single element", 
        n = a(3), i = r.longSlice(n), t = a(3), e.identical(i, t), e.is(n !== i), n = a(3), 
        i = r.longSlice(n, 0), t = a(3), e.identical(i, t), e.is(n !== i), n = a(3), i = r.longSlice(n, 0, -1), 
        t = a(), e.identical(i, t), e.is(n !== i), n = a(3), i = r.longSlice(n, 0, 10), 
        t = a(3), e.identical(i, t), e.is(n !== i), n = a(3), i = r.longSlice(n, 0, -10), 
        t = a(), e.identical(i, t), e.is(n !== i), n = a(3), i = r.longSlice(n, -1), t = a(3), 
        e.identical(i, t), e.is(n !== i), n = a(3), i = r.longSlice(n, -1, 10), t = a(3), 
        e.identical(i, t), e.is(n !== i), n = a(3), i = r.longSlice(n, -1, -2), t = a(), 
        e.identical(i, t), e.is(n !== i), e.case = "just pass srcLong", n = a(1, 2, 3, 4, 5, 6, 7), 
        i = r.longSlice(n), t = n, e.identical(i, t), e.is(n !== i), e.case = "make copy of source", 
        n = a(1, 2, 3, 4, 5, 6, 7), i = r.longSlice(n, 0), t = a(1, 2, 3, 4, 5, 6, 7), e.identical(i, t), 
        e.is(n !== i), n = a(1, 2, 3, 4, 5, 6, 7), i = r.longSlice(n, -1), t = a(7), e.identical(i, t), 
        e.case = "third argument is not provided", n = a(1, 2, 3, 4, 5, 6, 7), i = r.longSlice(n, 2), 
        t = a(3, 4, 5, 6, 7), e.identical(i, t), e.case = "second argument is undefined", 
        n = a(1, 2, 3, 4, 5, 6, 7), i = r.longSlice(n, void 0, 4), t = a(1, 2, 3, 4), e.identical(i, t), 
        e.case = "from two to six", n = a(1, 2, 3, 4, 5, 6, 7), i = r.longSlice(n, 2, 6), 
        t = a(3, 4, 5, 6), e.identical(i, t), e.case = "indexes are out of bound", n = a(1, 2, 3), 
        i = r.longSlice(n, 5, 8), t = a(), e.identical(i, t), e.case = "left bound is negative", 
        n = a(1, 2, 3, 4, 5, 6, 7), i = r.longSlice(n, -1, n.length), t = a(7), e.identical(i, t), 
        e.is(n !== i), e.case = "rigth bound is negative", n = a(1, 2, 3, 4, 5, 6, 7), i = r.longSlice(n, 0, -1), 
        t = a(1, 2, 3, 4, 5, 6), e.identical(i, t), e.is(n !== i), e.case = "rigth bound is out of range", 
        n = a(1, 2, 3, 4, 5, 6, 7), i = r.longSlice(n, 0, n.length + 2), t = n, e.identical(i, t), 
        e.is(n !== i), e.case = "etc", n = a(1, 2, 3, 4, 5, 6, 7), i = r.longSlice(n), e.is(i.constructor === n.constructor), 
        e.is(i !== n), e.identical(i, n), n = a(1, 2, 3, 4, 5, 6, 7), i = r.longSlice(n, 0), 
        e.is(i.constructor === n.constructor), e.is(i !== n), e.identical(i, n), n = a(1, 2, 3, 4, 5, 6, 7), 
        t = a(7), i = r.longSlice(n, -1), e.is(i.constructor === n.constructor), e.is(i !== n), 
        e.identical(i, t), n = a(1, 2, 3, 4, 5, 6, 7), i = r.longSlice(n, 0, 1), e.is(i.constructor === n.constructor), 
        e.is(i !== n), e.identical(i, a(1)), n = a(1, 2, 3, 4, 5, 6, 7), i = r.longSlice(n, n.length, n.length), 
        e.is(i.constructor === n.constructor), e.is(i !== n), e.identical(i, a()), n = a(1, 2, 3, 4, 5, 6, 7), 
        i = r.longSlice(n, -1, n.length + 1), e.is(i.constructor === n.constructor), e.is(i !== n), 
        e.identical(i, a(7)), e.case = "no arguments", e.shouldThrowErrorSync(function() {
          r.longSlice();
        }), e.case = "wrong type of argument", e.shouldThrowErrorSync(function() {
          r.longSlice("x");
        }), e.case = "wrong type of argument", e.shouldThrowErrorSync(function() {
          r.longSlice([ 1 ], "x", 1);
        }), e.case = "wrong type of argument", e.shouldThrowErrorSync(function() {
          r.longSlice([ 1 ], 0, "x");
        }), e.case = "wrong type of argument", e.shouldThrowErrorSync(function() {
          var e = new ArrayBuffer();
          r.longSlice(e);
        });
      }
      e.open("Array"), runFor(
      /* */
      function makeArray() {
        for (var r = [], e = 0; e < arguments.length; e++) r.push(arguments[e]);
        return r;
      }), e.close("Array"), e.open("ArgumentsArray"), runFor(makeU8), e.close("ArgumentsArray"), 
      e.open("F32x"), runFor(function makeF32() {
        return new F32x(arguments);
      }), e.close("F32x"), e.open("U8x"), runFor(makeU8), e.close("U8x"), e.case = "raw buffer", 
      e.shouldThrowErrorSync(function() {
        r.longSlice(new ArrayBuffer());
      });
    }
    "undefined" != typeof module && require("../Layer2.s").include("wTesting");
    var r = wTools;
    // --
    // buffer
    // --
        longSlice.timeOut = 2e4;
    //
    var a = {
      name: "Tools/base/l1/Long",
      silencing: 1,
      enabled: 1,
      // verbosity : 9,
      // routine : 'bufferRelen',
      tests: {
        // buffer
        bufferFrom: function bufferFrom(e) {
          /*src: number,str,array,raw,typed,node */
          /*bufferConstructor: typed,raw,node */
          /* typed buffer */
          e.case = "src:number,bufferConstructor:typed buffer";
          var a = 1, n = r.bufferFrom({
            src: a,
            bufferConstructor: Uint8Array
          }), i = new Uint8Array([ a ]);
          e.identical(n, i), e.case = "src:str,bufferConstructor:typed buffer", a = "abc", 
          n = r.bufferFrom({
            src: a,
            bufferConstructor: Uint8Array
          }), i = new Uint8Array([ 97, 98, 99 ]), e.identical(n, i), e.case = "src:array,bufferConstructor:typed buffer", 
          a = [ 97, 98, 99 ], n = r.bufferFrom({
            src: a,
            bufferConstructor: Uint8Array
          }), i = new Uint8Array([ 97, 98, 99 ]), e.identical(n, i), e.case = "src:raw buffer,bufferConstructor:typed buffer", 
          a = new ArrayBuffer(3), n = r.bufferFrom({
            src: a,
            bufferConstructor: Uint8Array
          }), i = new Uint8Array([ 0, 0, 0 ]), e.identical(n, i), e.case = "src:typed,bufferConstructor:typed buffer", 
          a = new Int32Array([ 97, 98, 99 ]), n = r.bufferFrom({
            src: a,
            bufferConstructor: Uint8Array
          }), i = new Uint8Array([ 97, 98, 99 ]), e.identical(n, i), "nodejs" === Config.platform && (e.case = "src:node buffer,bufferConstructor:typed buffer", 
          a = Buffer.from([ 97, 98, 99 ]), n = r.bufferFrom({
            src: a,
            bufferConstructor: Uint8Array
          }), i = new Uint8Array([ 97, 98, 99 ]), e.identical(n, i))
          /* raw buffer */ , e.case = "src:number,bufferConstructor:raw buffer", a = 1, n = r.bufferFrom({
            src: a,
            bufferConstructor: ArrayBuffer
          }), i = new Uint8Array([ 1 ]).buffer, e.identical(n, i), e.case = "src:str,bufferConstructor:raw buffer", 
          a = "abc", n = r.bufferFrom({
            src: a,
            bufferConstructor: ArrayBuffer
          }), i = new Uint8Array([ 97, 98, 99 ]).buffer, e.identical(n, i), e.case = "src:array,bufferConstructor:raw buffer", 
          a = [ 97, 98, 99 ], n = r.bufferFrom({
            src: a,
            bufferConstructor: ArrayBuffer
          }), i = new Uint8Array([ 97, 98, 99 ]).buffer, e.identical(n, i), e.case = "src:raw buffer,bufferConstructor:raw buffer", 
          a = new ArrayBuffer(3), n = r.bufferFrom({
            src: a,
            bufferConstructor: ArrayBuffer
          }), i = a, e.identical(n, i), e.case = "src:typed,bufferConstructor:raw buffer", 
          a = new Int32Array([ 97, 98, 99 ]), n = r.bufferFrom({
            src: a,
            bufferConstructor: ArrayBuffer
          }), i = new Int32Array([ 97, 98, 99 ]).buffer, e.identical(n, i), "nodejs" === Config.platform && (e.case = "src:node buffer,bufferConstructor:raw buffer", 
          a = Buffer.from([ 97, 98, 99 ]), n = r.bufferFrom({
            src: a,
            bufferConstructor: ArrayBuffer
          }), i = new Uint8Array([ 97, 98, 99 ]).buffer, e.identical(n, i)), "nodejs" !== !Config.platform && (
          /* node buffer */
          e.case = "src:number,bufferConstructor:node buffer", a = 1, n = r.bufferFrom({
            src: a,
            bufferConstructor: Buffer
          }), i = Buffer.from([ a ]), e.identical(n, i), e.case = "src:str,bufferConstructor:node buffer", 
          a = "abc", n = r.bufferFrom({
            src: a,
            bufferConstructor: Buffer
          }), i = Buffer.from(a), e.identical(n, i), e.case = "src:array,bufferConstructor:node buffer", 
          a = [ 97, 98, 99 ], n = r.bufferFrom({
            src: a,
            bufferConstructor: Buffer
          }), i = Buffer.from(a), e.identical(n, i), e.case = "src:raw buffer,bufferConstructor:node buffer", 
          a = new ArrayBuffer(3), n = r.bufferFrom({
            src: a,
            bufferConstructor: Buffer
          }), i = Buffer.from(a), e.identical(n, i), e.case = "src:typed,bufferConstructor:node buffer", 
          a = new Int32Array([ 97, 98, 99 ]), n = r.bufferFrom({
            src: a,
            bufferConstructor: Buffer
          }), i = Buffer.from(a.buffer, a.buteOffset, a.byteLength), e.identical(n, i), e.case = "src:node buffer,bufferConstructor:node buffer", 
          a = Buffer.from([ 97, 98, 99 ]), n = r.bufferFrom({
            src: a,
            bufferConstructor: Buffer
          }), i = a, e.identical(n, i));
        }
        //
        ,
        bufferRelen: function bufferRelen(e) {
          e.case = "second argument is more than ints.length";
          var a = new Int8Array([ 3, 7, 13 ]), n = c = r.bufferRelen(a, 4);
          // [ 3, 7, 13, 0 ];
          e.identical(c, n), e.case = "second argument is less than ints2.length";
          var i = new Int16Array([ 3, 7, 13, 33, 77 ]);
          n = c = r.bufferRelen(i, 3), // [ 3, 7, 13 ];
          e.identical(c, n), e.case = "invalid values are replaced by zero";
          var t = new Int32Array([ 3, "a", 13, "b", 77 ]);
          n = c = r.bufferRelen(t, 6), // [ 3, 0, 13, 0, 77, 0 ];
          e.identical(c, n), e.case = "returns the initial typed array";
          var c, l = new Float32Array([ 3.35, 7.5, 13.35, 33.75, 77.25 ]);
          n = c = r.bufferRelen(l, 5), // [ 3.3499999046325684, 7.5, 13.350000381469727, 33.75, 77.25 ];
          e.identical(c, n), e.case = "no arguments", e.shouldThrowErrorSync(function() {
            r.bufferRelen();
          });
        },
        bufferRetype: 
        //
        function bufferRetype(e) {
          e.case = "converts and returns the new type of Int16Array";
          var a, n = new Int8Array([ 1, 2, 3, 4, 5, 6 ]), i = a = r.bufferRetype(n, Int16Array);
          // [ 513, 1027, 1541 ];
          e.identical(a, i), e.case = "converts and returns the new type of Int8Array", n = new Int16Array([ 513, 1027, 1541 ]), 
          i = a = r.bufferRetype(n, Int8Array), // [ 1, 2, 3, 4, 5, 6 ];
          e.identical(a, i), e.case = "no arguments", e.shouldThrowErrorSync(function() {
            r.bufferRetype();
          }), e.case = "arguments are wrong", e.shouldThrowErrorSync(function() {
            r.bufferRetype("wrong argument", "wrong argument");
          });
        },
        bufferRawFrom: 
        //
        function bufferRawFrom(e) {
          e.case = "typed";
          var a = new Uint8Array(3), n = r.bufferRawFrom(a), i = new ArrayBuffer(3);
          e.identical(n, i), e.case = "raw", a = new ArrayBuffer(3), n = r.bufferRawFrom(a), 
          i = a, e.identical(n, i), e.case = "view";
          var t = new ArrayBuffer(10);
          a = new DataView(t), n = r.bufferRawFrom(a), i = t, e.identical(n, i), e.case = "str", 
          a = "abc", n = r.bufferRawFrom(a), i = new Uint8Array([ 97, 98, 99 ]).buffer, e.identical(n, i), 
          "nodejs" === Config.platform && (e.case = "node-buffer", a = Buffer.from("abc"), 
          n = r.bufferRawFrom(a), i = new Uint8Array([ 97, 98, 99 ]).buffer, e.identical(n, i))
          /* - */ , e.case = "unknown source", e.shouldThrowErrorSync(() => r.bufferRawFrom(5)), 
          e.shouldThrowErrorSync(() => r.bufferRawFrom({}));
        }
        //
        ,
        bufferBytesFrom: function bufferBytesFrom(e) {
          e.case = "raw";
          var a = new ArrayBuffer(3), n = r.bufferBytesFrom(a), i = new Uint8Array([ 0, 0, 0 ]);
          e.identical(n, i), e.case = "arr", a = [ 97, 98, 99 ], n = r.bufferBytesFrom(a), 
          i = new Uint8Array([ 97, 98, 99 ]), e.identical(n, i), e.case = "typed", a = new Int8Array([ 97, 98, 99 ]), 
          n = r.bufferBytesFrom(a), i = new Uint8Array([ 97, 98, 99 ]), e.identical(n, i), 
          e.case = "view";
          var t = new ArrayBuffer(3);
          a = new DataView(t), n = r.bufferBytesFrom(a), i = new Uint8Array([ 0, 0, 0 ]), 
          e.identical(n, i), e.case = "str", a = "abc", n = r.bufferBytesFrom(a), i = new Uint8Array([ 97, 98, 99 ]), 
          e.identical(n, i), "nodejs" === Config.platform && (e.case = "node", a = Buffer.from("abc"), 
          n = r.bufferBytesFrom(a), i = new Uint8Array([ 97, 98, 99 ]), e.identical(n, i))
          /* - */ , e.case = "unknown source", e.shouldThrowErrorSync(() => r.bufferBytesFrom(5)), 
          // test.shouldThrowErrorSync( () => _.bufferBytesFrom( [] ) );
          e.shouldThrowErrorSync(() => r.bufferBytesFrom({}));
        }
        //
        ,
        bufferNodeFrom: function bufferNodeFrom(e) {
          if ("nodejs" === Config.platform) {
            e.case = "raw";
            var a = new ArrayBuffer(3), n = r.bufferNodeFrom(a), i = Buffer.from([ 0, 0, 0 ]);
            e.identical(n, i), e.case = "typed", a = new Int8Array([ 97, 98, 99 ]), n = r.bufferNodeFrom(a), 
            i = Buffer.from([ 97, 98, 99 ]), e.identical(n, i), e.case = "view";
            var t = new ArrayBuffer(3);
            a = new DataView(t), n = r.bufferNodeFrom(a), i = Buffer.from([ 0, 0, 0 ]), e.identical(n, i), 
            e.case = "str", a = "abc", n = r.bufferNodeFrom(a), i = Buffer.from(a), e.identical(n, i), 
            e.case = "node", a = Buffer.from("abc"), n = r.bufferNodeFrom(a), i = a, e.identical(n, i), 
            e.case = "empty raw", a = new ArrayBuffer(0), n = r.bufferNodeFrom(a), i = Buffer.alloc(0), 
            e.identical(n, i), e.case = "empty typed", a = new Int8Array([]), n = r.bufferNodeFrom(a), 
            i = Buffer.alloc(0), e.identical(n, i), e.case = "empty node", a = Buffer.alloc(0), 
            n = r.bufferNodeFrom(a), i = a, e.identical(n, i), e.case = "array", a = [ 97, 98, 99 ], 
            n = r.bufferNodeFrom(a), i = Buffer.from(a), e.identical(n, i), e.case = "object", 
            a = new String("abc"), n = r.bufferNodeFrom(a), i = Buffer.from([ 97, 98, 99 ]), 
            e.identical(n, i), e.case = "unknown source", e.shouldThrowErrorSync(() => r.bufferNodeFrom(5)), 
            // test.shouldThrowErrorSync( () => _.bufferNodeFrom( [] ) );
            e.shouldThrowErrorSync(() => r.bufferNodeFrom({}));
          }
        }
        //
        ,
        bufferRawFromTyped: function bufferRawFromTyped(e) {
          var a = new ArrayBuffer(10), n = new Int8Array(a);
          e.case = "returns the same length of typed array";
          var i = t = r.bufferRawFromTyped(n);
          // [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ]
          e.identical(t, i);
          var t, c = new ArrayBuffer(10), l = new Int8Array(c, 2);
          e.case = "returns the new sub typed array", i = t = r.bufferRawFromTyped(l), // [ 0, 0, 0, 0, 0, 0 ]
          e.identical(t, i), e.case = "no arguments", e.shouldThrowErrorSync(function() {
            r.bufferRawFromTyped();
          }), e.case = "arguments are wrong", e.shouldThrowErrorSync(function() {
            r.bufferRawFromTyped("wrong argument");
          });
        }
        //
        ,
        // type test
        arrayIs: function arrayIs(e) {
          e.case = "an empty array";
          var a = r.arrayIs([]), n = !0;
          e.identical(a, n), e.case = "an array", a = r.arrayIs([ 1, 2, 3 ]), n = !0, e.identical(a, n), 
          e.case = "object", a = r.arrayIs({}), n = !1, e.identical(a, n), e.case = "number", 
          a = r.arrayIs(6), n = !1, e.identical(a, n), e.case = "string", a = r.arrayIs("abc"), 
          n = !1, e.identical(a, n), e.case = "boolean", a = r.arrayIs(!0), n = !1, e.identical(a, n), 
          e.case = "function", a = r.arrayIs(function() {}), n = !1, e.identical(a, n), e.case = "a pseudo array", 
          a = function() {
            return r.arrayIs(arguments);
          }("Hello there!"), n = !1, e.identical(a, n), e.case = "no argument", a = r.arrayIs(), 
          n = !1, e.identical(a, n), e.case = "null", a = r.arrayIs(), n = !1, e.identical(a, n);
        }
        //
        ,
        longIs: function longIs(e) {
          e.case = "an empty array";
          var a = r.longIs([]), n = !0;
          e.identical(a, n), e.case = "an array", a = r.longIs([ 1, 2, 3 ]), n = !0, e.identical(a, n), 
          e.case = "a pseudo array", a = r.longIs(arguments), n = !0, e.identical(a, n), e.case = "raw array buffer", 
          a = r.longIs(new ArrayBuffer(10)), n = !1, e.identical(a, n), e.case = "typed array buffer", 
          a = r.longIs(new Float32Array(10)), n = !0, e.identical(a, n), e.case = "no argument", 
          a = r.longIs(), n = !1, e.identical(a, n), e.case = "null", a = r.longIs(null), 
          n = !1, e.identical(a, n), e.case = "function", a = r.longIs(function() {}), n = !1, 
          e.identical(a, n), e.case = "string", a = r.longIs("x"), n = !1, e.identical(a, n), 
          e.case = "number", a = r.longIs(1), n = !1, e.identical(a, n), e.case = "boolean", 
          a = r.longIs(!0), n = !1, e.identical(a, n), e.case = "object", a = r.longIs({}), 
          n = !1, e.identical(a, n);
        }
        //
        ,
        constructorLikeArray: function constructorLikeArray(e) {
          e.case = "an array";
          var a = r.constructorLikeArray([].constructor), n = !0;
          e.identical(a, n), e.case = "arguments, not possible to say yes by constructor", 
          a = r.constructorLikeArray(arguments.constructor), n = !1, e.identical(a, n), e.case = "raw array buffer";
          debugger;
          a = r.constructorLikeArray(new ArrayBuffer(10).constructor), n = !1, e.identical(a, n), 
          e.case = "typed array buffer", a = r.constructorLikeArray(new Float32Array(10).constructor), 
          n = !0, e.identical(a, n), e.case = "no argument", a = r.constructorLikeArray(), 
          n = !1, e.identical(a, n), e.case = "null", a = r.constructorLikeArray(null), n = !1, 
          e.identical(a, n), e.case = "number", a = r.constructorLikeArray(1), n = !1, e.identical(a, n), 
          e.case = "function", a = r.constructorLikeArray(function() {}.constructor), n = !1, 
          e.identical(a, n), e.case = "string", a = r.constructorLikeArray("x".constructor), 
          n = !1, e.identical(a, n), e.case = "string", a = r.constructorLikeArray("x"), n = !1, 
          e.identical(a, n), e.case = "object", a = r.constructorLikeArray({}.constructor), 
          n = !1, e.identical(a, n);
        }
        //
        ,
        hasLength: function hasLength(e) {
          e.case = "an empty array";
          var a = r.hasLength([]), n = !0;
          e.identical(a, n), e.case = "an array", a = r.hasLength([ 1, 2, 3 ]), n = !0, e.identical(a, n), 
          e.case = "a pseudo array", a = function() {
            return r.hasLength(arguments);
          }("Hello there!"), n = !0, e.identical(a, n), e.case = "an array-like", a = r.hasLength({
            0: 1,
            1: 2,
            2: 3,
            "length": 3
          }), n = !0, e.identical(a, n), e.case = "a Function.length", a = r.hasLength(function fn(r, e, a) {}), 
          n = !0, e.identical(a, n), e.case = 'a "string".length', a = r.hasLength("Hello there!"), 
          n = !0, e.identical(a, n), e.case = "no arguments", a = r.hasLength(), n = !1, e.identical(a, n), 
          e.case = "null", a = r.hasLength(), n = !1, e.identical(a, n);
        },
        // producer
        argumentsArrayMake: 
        // --
        // producer
        // --
        function argumentsArrayMake(e) {
          e.case = "empty";
          var a = [], n = r.argumentsArrayMake(a), i = [];
          e.equivalent(n, i), e.is(r.argumentsArrayIs(n)), e.is(a !== n), e.case = "single number", 
          a = [ 0 ], n = r.argumentsArrayMake(a), i = [ 0 ], e.equivalent(n, i), e.is(r.argumentsArrayIs(n)), 
          e.is(a !== n), e.case = "single string", a = [ "a" ], n = r.argumentsArrayMake(a), 
          i = [ "a" ], e.equivalent(n, i), e.is(r.argumentsArrayIs(n)), e.is(a !== n), e.case = "several", 
          a = [ 1, 2, 3 ], n = r.argumentsArrayMake(a), i = [ 1, 2, 3 ], e.equivalent(n, i), 
          e.is(r.argumentsArrayIs(n)), e.is(a !== n), e.case = "zero length", n = r.argumentsArrayMake(0), 
          i = new Array(0), e.equivalent(n, i), e.is(r.argumentsArrayIs(n)), e.is(a !== n), 
          e.case = "length", n = r.argumentsArrayMake(3), i = new Array(3), e.equivalent(n, i), 
          e.is(r.argumentsArrayIs(n)), e.is(a !== n), e.shouldThrowErrorSync(function() {
            r.argumentsArrayMake();
          }), e.shouldThrowErrorSync(function() {
            r.argumentsArrayMake(1, 3);
          }), e.shouldThrowErrorSync(function() {
            r.argumentsArrayMake([], 3);
          }), e.shouldThrowErrorSync(function() {
            r.argumentsArrayMake([], []);
          }), e.shouldThrowErrorSync(function() {
            r.argumentsArrayMake({});
          }), e.shouldThrowErrorSync(function() {
            r.argumentsArrayMake("1");
          });
        }
        //
        ,
        argumentsArrayFrom: function argumentsArrayFrom(e) {
          e.case = "empty";
          var a = [], n = r.argumentsArrayFrom(a), i = [];
          e.equivalent(n, i), e.is(r.argumentsArrayIs(n)), e.is(a !== n), e.case = "single number", 
          a = [ 0 ], n = r.argumentsArrayFrom(a), i = [ 0 ], e.equivalent(n, i), e.is(r.argumentsArrayIs(n)), 
          e.is(a !== n), e.case = "single string", a = [ "a" ], n = r.argumentsArrayFrom(a), 
          i = [ "a" ], e.equivalent(n, i), e.is(r.argumentsArrayIs(n)), e.is(a !== n), e.case = "several", 
          a = [ 1, 2, 3 ], n = r.argumentsArrayFrom(a), i = [ 1, 2, 3 ], e.equivalent(n, i), 
          e.is(r.argumentsArrayIs(n)), e.is(a !== n), e.case = "zero length", n = r.argumentsArrayFrom(0), 
          i = new Array(0), e.equivalent(n, i), e.is(r.argumentsArrayIs(n)), e.is(a !== n), 
          e.case = "length", n = r.argumentsArrayFrom(3), i = new Array(3), e.equivalent(n, i), 
          e.is(r.argumentsArrayIs(n)), e.is(a !== n), 
          /* */
          e.case = "preserving empty", a = r.argumentsArrayMake([]), n = r.argumentsArrayFrom(a), 
          i = [], e.equivalent(n, i), e.is(r.argumentsArrayIs(n)), e.is(a === n), e.case = "preserving single number", 
          a = r.argumentsArrayMake([ 0 ]), n = r.argumentsArrayFrom(a), i = [ 0 ], e.equivalent(n, i), 
          e.is(r.argumentsArrayIs(n)), e.is(a === n), e.case = "preserving single string", 
          a = r.argumentsArrayMake([ "a" ]), n = r.argumentsArrayFrom(a), i = [ "a" ], e.equivalent(n, i), 
          e.is(r.argumentsArrayIs(n)), e.is(a === n), e.case = "preserving several", a = r.argumentsArrayMake([ 1, 2, 3 ]), 
          n = r.argumentsArrayFrom(a), i = [ 1, 2, 3 ], e.equivalent(n, i), e.is(r.argumentsArrayIs(n)), 
          e.is(a === n), e.shouldThrowErrorSync(function() {
            r.argumentsArrayFrom();
          }), e.shouldThrowErrorSync(function() {
            r.argumentsArrayFrom(1, 3);
          }), e.shouldThrowErrorSync(function() {
            r.argumentsArrayFrom([], 3);
          }), e.shouldThrowErrorSync(function() {
            r.argumentsArrayFrom([], []);
          }), e.shouldThrowErrorSync(function() {
            r.argumentsArrayFrom({});
          }), e.shouldThrowErrorSync(function() {
            r.argumentsArrayFrom("1");
          });
        }
        //
        /* qqq : implement bufferMakeSimilar */ ,
        longMake: function longMake(e) {
          e.case = "an empty array";
          var a = r.longMake([], 0), n = [];
          e.identical(a, n), e.case = "length = 1", a = r.longMake([], 1), n = [ ,  ], e.identical(a, n), 
          e.case = "length = 2", a = r.longMake([ 1, 2, 3 ], 2), n = [ , ,  ], e.identical(a, n), 
          e.case = "length = 4", a = r.longMake([ 1, 2, 3 ], 4), n = [ , , , ,  ], e.identical(a, n), 
          e.case = "same length";
          var i = [ 1, 2, 3 ];
          a = r.longMake(i), e.identical(a.length, 3), e.is(a !== i), i = [];
          var t = r.arrayFillWhole(Buffer.alloc(5), 1);
          a = r.longMake(i, Array.from(t)), e.identical(a.length, 5), e.is(r.arrayIs(a)), 
          e.identical(a, [ 1, 1, 1, 1, 1 ]), (i = new Uint8Array(5))[0] = 1, a = r.longMake(i), 
          e.is(r.bufferTypedIs(a)), e.identical(a.length, 5), e.is(a !== i), i = new Uint8Array(5), 
          t = [ 1, 2, 3, 4, 5 ], a = r.longMake(i, t), e.is(r.bufferTypedIs(a)), e.is(a instanceof Uint8Array), 
          e.identical(a.length, 5);
          for (var c = !0, l = 0; l < t.length; l++) c = a[l] === t[l];
          for (e.is(c), e.case = "typedArray", (i = new Uint8Array(5))[0] = 1, a = r.longMake(i, 4), 
          e.is(r.bufferTypedIs(a)), e.identical(a.length, 4), e.is(a !== i), e.case = "ArrayBuffer", 
          i = new ArrayBuffer(5), a = r.longMake(i, 4), e.is(r.bufferRawIs(a)), e.identical(a.byteLength, 4), 
          e.case = "NodeBuffer", a = r.longMake(Buffer.alloc(5)), e.is(r.bufferNodeIs(a)), 
          e.identical(a.length, 5), e.case = "NodeBuffer and src", t = r.arrayFillWhole(new Uint8Array(5), 1), 
          a = r.longMake(Buffer.alloc(5), t), e.is(r.bufferNodeIs(a)), e.identical(a.length, 5), 
          c = !0, l = 0; l < t.length; l++) c = a[l] === t[l];
          for (e.is(c), e.case = "NodeBuffer as src", t = Buffer.alloc(10), l = 0; l < t.length; l++) t[l] = l;
          for (a = r.longMake([], Array.from(t)), e.is(r.arrayIs(a)), e.identical(a.length, t.length), 
          c = !0, l = 0; l < t.length; l++) c = a[l] === t[l];
          for (e.is(c), e.case = "ins as Array", a = r.longMake(Array, 5), e.is(r.arrayIs(a)), 
          e.identical(a.length, 5), e.case = "ins as Array", t = [ 1, 2, 3 ], a = r.longMake(Array, t), 
          e.is(r.arrayIs(a)), e.identical(a.length, 3), e.identical(a, t), e.case = "ins as Array", 
          t = r.arrayFillWhole(new Float32Array(5), 1), a = r.longMake(Array, t), e.is(r.arrayIs(a)), 
          e.identical(a.length, 5), e.identical(a, [ 1, 1, 1, 1, 1 ]), e.case = "ins as Buffer", 
          t = r.arrayFillWhole(new Float32Array(5), 1), a = r.longMake(Buffer, t), e.is(r.bufferNodeIs(a)), 
          e.identical(a.length, 5), c = !0, l = 0; l < t.length; l++) c = a[l] === t[l];
          for (e.is(c), e.case = "ins as Array", t = r.arrayFillWhole(Buffer.alloc(5), 1), 
          a = r.longMake(Array, t), e.is(r.arrayIs(a)), e.identical(a.length, 5), c = !0, 
          l = 0; l < t.length; l++) c = a[l] === t[l];
          for (e.is(c), e.case = "ins as TypedArray", t = [ 1, 2, 3 ], a = r.longMake(Uint8Array, t), 
          e.is(r.bufferTypedIs(a)), e.identical(a.length, 3), c = !0, l = 0; l < t.length; l++) c = a[l] === t[l];
          for (e.is(c), e.case = "ins as TypedArray", t = r.arrayFillWhole(Buffer.alloc(5), 1), 
          a = r.longMake(Float32Array, t), e.is(r.bufferTypedIs(a)), e.identical(a.length, 5), 
          c = !0, l = 0; l < t.length; l++) c = a[l] === t[l];
          e.is(c), e.case = "no arguments", e.shouldThrowErrorSync(function() {
            r.longMake();
          }), e.case = "wrong type of argument", e.shouldThrowErrorSync(function() {
            r.longMake("wrong argument");
          }), e.case = "arguments[1] is wrong", e.shouldThrowErrorSync(function() {
            r.longMake([ 1, 2, 3 ], "wrong type of argument");
          }), e.case = "extra argument", e.shouldThrowErrorSync(function() {
            r.longMake([ 1, 2, 3 ], 4, "redundant argument");
          }), e.case = "argument is not wrapped into array", e.shouldThrowErrorSync(function() {
            r.longMake(1, 2, 3, 4);
          });
        },
        longMakeZeroed: 
        //
        /*

qqq : implement bufferMakeZeroed routine and test routine

*/
        function longMakeZeroed(e) {
          e.case = "Array";
          var a = r.longMakeZeroed(Array, 1), n = [ 0 ];
          e.identical(a, n), 
          //
          e.case = "Array", a = r.longMakeZeroed(Array, new Float32Array(2)), n = [ 0, 0 ], 
          e.identical(a, n), 
          //
          e.case = "ArrayBuffer", a = r.longMakeZeroed(ArrayBuffer, 3), e.is(r.bufferRawIs(a)), 
          e.identical(a.byteLength, 3), 
          //
          e.case = "Uint8Array", a = r.longMakeZeroed(Uint8Array, [ 1, 2, 3 ]), e.is(r.bufferTypedIs(a)), 
          e.identical(a.length, 3);
          for (var i = !0, t = 0; t < a.length; t++) i = 0 === a[t];
          e.is(i), 
          //
          // test.case = 'Uint8Array';
          // var got = _.longMakeZeroed( Buffer, new ArrayBuffer( 3) );
          // test.is( _.bufferNodeIs( got ) );
          // test.identical( got.length, 3 );
          // var isEqual = true;
          // for( var i = 0; i < got.length; i++ )
          // isEqual = got[ i ] === 0 ? true : false;
          // test.is( isEqual );
          //
          e.case = "an empty array", a = r.longMakeZeroed([], 0), n = [], e.identical(a, n), 
          //
          e.case = "length = 1", a = r.longMakeZeroed([], 1), n = [ 0 ], e.identical(a, n), 
          //
          e.case = "length = 2", a = r.longMakeZeroed([ 1, 2, 3 ], 2), n = [ 0, 0 ], e.identical(a, n), 
          //
          e.case = "length = 4", a = r.longMakeZeroed([ 1, 2, 3 ], 4), n = [ 0, 0, 0, 0 ], 
          e.identical(a, n), 
          //
          e.case = "same length";
          var c = [ 1, 2, 3 ];
          for (a = r.longMakeZeroed(c), e.identical(a.length, 3), e.identical(a, [ 0, 0, 0 ]), 
          //
          // test.case = 'same length';
          // var ins = new ArrayBuffer(5);
          // var got = _.longMakeZeroed( ins );
          // test.is( _.bufferRawIs( got ) );
          // test.identical( got.byteLength, 5 );
          //
          e.case = "same length", a = r.longMakeZeroed(ArrayBuffer, 5), e.is(r.bufferRawIs(a)), 
          e.identical(a.byteLength, 5), 
          //
          e.case = "same length, ins is a typed array", c = r.arrayFillWhole(new Uint8Array(5), 1), 
          a = r.longMakeZeroed(c), e.identical(a.length, 5), i = !0, t = 0; t < a.length; t++) i = 0 === a[t];
          for (e.is(i), 
          //
          e.case = "same length, ins is a node buffer", c = r.arrayFillWhole(Buffer.alloc(5), 1), 
          a = r.longMakeZeroed(c), e.identical(a.length, 5), i = !0, t = 0; t < a.length; t++) i = 0 === a[t];
          e.is(i), c = [];
          //
          var l = r.arrayFillWhole(Buffer.alloc(5), 1);
          for (a = r.longMakeZeroed(c, l), e.identical(a.length, 5), e.is(r.arrayIs(a)), e.identical(a, [ 0, 0, 0, 0, 0 ]), 
          (c = new Uint8Array(5))[0] = 1, a = r.longMakeZeroed(c), e.is(r.bufferTypedIs(a)), 
          e.identical(a.length, 5), i = !0, t = 0; t < a.length; t++) i = 0 === a[t];
          for (e.is(i), 
          //
          e.case = "typedArray", (c = new Uint8Array(5))[0] = 1, a = r.longMakeZeroed(c, 4), 
          e.is(r.bufferTypedIs(a)), e.identical(a.length, 4), i = !0, t = 0; t < a.length; t++) i = 0 === a[t];
          for (e.is(i), 
          //
          e.case = "ArrayBuffer", c = new ArrayBuffer(5), a = r.longMakeZeroed(c, 4), e.is(r.bufferRawIs(a)), 
          e.identical(a.byteLength, 4), a = new Uint8Array(a), i = !0, t = 0; t < a.length; t++) i = 0 === a[t];
          for (e.is(i), 
          //
          // test.case = 'ArrayBuffer';
          // var ins = [];
          // var src = new ArrayBuffer( 5 );
          // var got = _.longMakeZeroed( ins, src );
          // test.is( _.arrayIs( got ) );
          // test.identical( got.length, 5 );
          // var isEqual = true;
          // for( var i = 0; i < got.length; i++ )
          // isEqual = got[ i ] === 0 ? true : false;
          // test.is( isEqual );
          //
          e.case = "NodeBuffer", a = r.longMakeZeroed(Buffer.alloc(5)), e.is(r.bufferNodeIs(a)), 
          e.identical(a.length, 5), i = !0, t = 0; t < a.length; t++) i = 0 === a[t];
          for (e.is(i), 
          //
          e.case = "NodeBuffer and src", l = new Int8Array(5), t = 0; t < l.length; t++) l[t] = t;
          for (a = r.longMakeZeroed(Buffer.alloc(5), l), e.is(r.bufferNodeIs(a)), e.identical(a.length, 5), 
          i = !0, t = 0; t < a.length; t++) i = 0 === a[t];
          e.is(i), e.case = "no arguments", e.shouldThrowErrorSync(function() {
            r.longMakeZeroed();
          }), e.case = "wrong type of argument", e.shouldThrowErrorSync(function() {
            r.longMakeZeroed("wrong argument");
          }), e.case = "arguments[1] is wrong", e.shouldThrowErrorSync(function() {
            r.longMakeZeroed([ 1, 2, 3 ], "wrong type of argument");
          }), e.case = "extra argument", e.shouldThrowErrorSync(function() {
            r.longMakeZeroed([ 1, 2, 3 ], 4, "redundant argument");
          }), e.case = "argument is not wrapped into array", e.shouldThrowErrorSync(function() {
            r.longMakeZeroed(1, 2, 3, 4);
          });
        }
        //
        ,
        arrayMake: function arrayMake(e) {
          e.case = "empty";
          var a = [], n = r.arrayMake(a), i = [];
          e.equivalent(n, i), e.is(r.arrayIs(n)), e.is(a !== n), e.case = "single number", 
          a = [ 0 ], n = r.arrayMake(a), i = [ 0 ], e.equivalent(n, i), e.is(r.arrayIs(n)), 
          e.is(a !== n), e.case = "single string", a = [ "a" ], n = r.arrayMake(a), i = [ "a" ], 
          e.equivalent(n, i), e.is(r.arrayIs(n)), e.is(a !== n), e.case = "several", a = [ 1, 2, 3 ], 
          n = r.arrayMake(a), i = [ 1, 2, 3 ], e.equivalent(n, i), e.is(r.arrayIs(n)), e.is(a !== n), 
          e.case = "zero length", n = r.arrayMake(0), i = new Array(0), e.equivalent(n, i), 
          e.is(r.arrayIs(n)), e.is(a !== n), e.case = "length", n = r.arrayMake(3), i = new Array(3), 
          e.equivalent(n, i), e.is(r.arrayIs(n)), e.is(a !== n), e.case = "from empty Float32", 
          a = new Float32Array(), n = r.arrayMake(a), i = [], e.equivalent(n, i), e.is(r.arrayIs(n)), 
          e.is(a !== n), e.case = "from Float32", a = new Float32Array([ 1, 2, 3 ]), n = r.arrayMake(a), 
          i = [ 1, 2, 3 ], e.equivalent(n, i), e.is(r.arrayIs(n)), e.is(a !== n), e.case = "from empty arguments array", 
          a = r.argumentsArrayMake([]), n = r.arrayMake(a), i = [], e.equivalent(n, i), e.is(r.arrayIs(n)), 
          e.is(a !== n), e.case = "from arguments array", a = r.argumentsArrayMake([ 1, 2, 3 ]), 
          n = r.arrayMake(a), i = [ 1, 2, 3 ], e.equivalent(n, i), e.is(r.arrayIs(n)), e.is(a !== n), 
          e.case = "from empty unroll", a = r.unrollMake([]), n = r.arrayMake(a), i = [], 
          e.equivalent(n, i), e.is(r.arrayIs(n)), e.is(a !== n), e.case = "from unroll", a = r.unrollMake([ 1, 2, 3 ]), 
          n = r.arrayMake(a), i = [ 1, 2, 3 ], e.equivalent(n, i), e.is(r.arrayIs(n)), e.is(a !== n), 
          e.shouldThrowErrorSync(function() {
            r.arrayMake();
          }), e.shouldThrowErrorSync(function() {
            r.arrayMake(1, 3);
          }), e.shouldThrowErrorSync(function() {
            r.arrayMake([], 3);
          }), e.shouldThrowErrorSync(function() {
            r.arrayMake([], []);
          }), e.shouldThrowErrorSync(function() {
            r.arrayMake({});
          }), e.shouldThrowErrorSync(function() {
            r.arrayMake("1");
          });
        }
        //
        ,
        arrayFrom: function arrayFrom(e) {
          e.case = "empty";
          var a = new Float32Array([]), n = r.arrayFrom(a), i = [];
          e.equivalent(n, i), e.is(r.arrayIs(n)), e.is(a !== n), e.case = "single number", 
          a = new Float32Array([ 0 ]), n = r.arrayFrom(a), i = [ 0 ], e.equivalent(n, i), 
          e.is(r.arrayIs(n)), e.is(a !== n), e.case = "single string", a = r.argumentsArrayMake([ "a" ]), 
          n = r.arrayFrom(a), i = [ "a" ], e.equivalent(n, i), e.is(r.arrayIs(n)), e.is(a !== n), 
          e.case = "several", a = new Float32Array([ 1, 2, 3 ]), n = r.arrayFrom(a), i = [ 1, 2, 3 ], 
          e.equivalent(n, i), e.is(r.arrayIs(n)), e.is(a !== n), e.case = "zero length", n = r.arrayFrom(0), 
          i = new Array(0), e.equivalent(n, i), e.is(r.arrayIs(n)), e.is(a !== n), e.case = "length", 
          n = r.arrayFrom(3), i = new Array(3), e.equivalent(n, i), e.is(r.arrayIs(n)), e.is(a !== n), 
          /* */
          e.case = "preserving empty", a = r.arrayMake([]), n = r.arrayFrom(a), i = [], e.equivalent(n, i), 
          e.is(r.arrayIs(n)), e.is(a === n), e.case = "preserving single number", a = r.arrayMake([ 0 ]), 
          n = r.arrayFrom(a), i = [ 0 ], e.equivalent(n, i), e.is(r.arrayIs(n)), e.is(a === n), 
          e.case = "preserving single string", a = r.arrayMake([ "a" ]), n = r.arrayFrom(a), 
          i = [ "a" ], e.equivalent(n, i), e.is(r.arrayIs(n)), e.is(a === n), e.case = "preserving several", 
          a = r.arrayMake([ 1, 2, 3 ]), n = r.arrayFrom(a), i = [ 1, 2, 3 ], e.equivalent(n, i), 
          e.is(r.arrayIs(n)), e.is(a === n), e.shouldThrowErrorSync(function() {
            r.arrayFrom();
          }), e.shouldThrowErrorSync(function() {
            r.arrayFrom(1, 3);
          }), e.shouldThrowErrorSync(function() {
            r.arrayFrom([], 3);
          }), e.shouldThrowErrorSync(function() {
            r.arrayFrom([], []);
          }), e.shouldThrowErrorSync(function() {
            r.arrayFrom({});
          }), e.shouldThrowErrorSync(function() {
            r.arrayFrom("1");
          });
        }
        //
        ,
        arrayFromCoercing: function arrayFromCoercing(e) {
          e.case = "an array";
          var a = r.arrayFromCoercing([ 3, 7, 13, "abc", !1, void 0, null, {} ]), n = [ 3, 7, 13, "abc", !1, void 0, null, {} ];
          e.identical(a, n), e.case = "an object", a = r.arrayFromCoercing({
            a: 3,
            b: 7,
            c: 13
          }), n = [ [ "a", 3 ], [ "b", 7 ], [ "c", 13 ] ], e.identical(a, n), e.case = "a string", 
          a = r.arrayFromCoercing("3, 7, 13, 3.5abc, 5def, 7.5ghi, 13jkl"), n = [ 3, 7, 13, 3.5, 5, 7.5, 13 ], 
          e.identical(a, n), e.case = "arguments[...]";
          var i = function() {
            return arguments;
          }(3, 7, 13, "abc", !1, void 0, null, {
            greeting: "Hello there!"
          });
          a = r.arrayFromCoercing(i), n = [ 3, 7, 13, "abc", !1, void 0, null, {
            greeting: "Hello there!"
          } ], e.identical(a, n), e.case = "no argument", e.shouldThrowErrorSync(function() {
            r.arrayFromCoercing();
          }), e.case = "wrong type of argument", e.shouldThrowErrorSync(function() {
            r.arrayFromCoercing(6);
          }), e.case = "wrong type of argument", e.shouldThrowErrorSync(function() {
            r.arrayFromCoercing(!0);
          });
        }
        //
        ,
        scalarAppend: function scalarAppend(e) {
          e.case = "none arguments";
          var a = r.scalarAppend();
          e.identical(a, []), e.case = "single undefined", a = r.scalarAppend(void 0), e.identical(a, []), 
          e.case = "two undefined", a = r.scalarAppend(void 0, void 0), e.identical(a, []), 
          e.case = "three undefined", a = r.scalarAppend(void 0, void 0, void 0), e.identical(a, []), 
          e.case = "dstArray is undefined, src is scalar", a = r.scalarAppend(void 0, 1), 
          e.identical(a, 1), e.case = "dstArray is undefined, src is array";
          var n = [ 1 ];
          a = r.scalarAppend(void 0, n), e.identical(a, [ 1 ]), e.is(n !== a), e.case = "dstArray is scalar, src is undefined", 
          a = r.scalarAppend(1, void 0), e.identical(a, 1), e.case = "dstArray is array, src is undefined";
          var i = [ 1 ];
          a = r.scalarAppend(i, void 0), e.identical(a, [ 1 ]), e.is(i === a), e.case = "dstArray is null, src is scalar", 
          a = r.scalarAppend(null, 1), e.identical(a, [ null, 1 ]), e.case = "dstArray is null, src is array", 
          n = [ 1 ], a = r.scalarAppend(null, n), e.identical(a, [ null, 1 ]), e.is(n !== a), 
          e.case = "nothing", a = r.scalarAppend([], []), e.identical(a, []), e.case = "simple", 
          i = [], a = r.scalarAppend(i, [ 1, 2, 3 ]), e.identical(i, [ 1, 2, 3 ]), e.is(a === i), 
          i = [ 1, 2, 3 ], a = r.scalarAppend(i, [ 4, 5 ]), e.identical(i, [ 1, 2, 3, 4, 5 ]), 
          e.is(a === i), i = [ 1, 1, 1 ], a = r.scalarAppend(i, [ 1, 1 ]), e.identical(i, [ 1, 1, 1, 1, 1 ]), 
          e.is(a === i), i = [ 1, 2, 3 ], a = r.scalarAppend(i, [ 1 ], [ 2 ], [ 3, [ 5 ] ]), 
          e.identical(i, [ 1, 2, 3, 1, 2, 3, [ 5 ] ]), e.is(a === i), i = [ 1, 2, 3 ];
          var t = [ [ 1 ], [ 2 ], [ 3, [ 5 ] ] ];
          a = r.scalarAppend(i, t), e.identical(i, [ 1, 2, 3, [ 1 ], [ 2 ], [ 3, [ 5 ] ] ]), 
          e.is(a === i), e.case = "arguments are not arrays", i = [], a = r.scalarAppend(i, [ 1, 2, 3 ]), 
          e.identical(i, [ 1, 2, 3 ]), e.is(a === i), e.case = "mixed arguments types", i = [ 1 ], 
          t = [ "a", 1, [ {
            a: 1
          } ], {
            b: 2
          } ], a = r.scalarAppend(i, t), e.identical(i, [ 1, "a", 1, [ {
            a: 1
          } ], {
            b: 2
          } ]), e.is(a === i), e.case = "mixed arguments types", i = [ 1 ], a = r.scalarAppend(i, "a", 1, [ {
            a: 1
          } ], {
            b: 2
          }), e.identical(i, [ 1, "a", 1, {
            a: 1
          }, {
            b: 2
          } ]), e.is(a === i), e.case = "argument is undefined", i = [ 1 ], a = r.scalarAppend(i, void 0), 
          e.identical(i, [ 1 ]), e.is(a === i), e.case = "argument is undefined", i = [], 
          a = r.scalarAppend(i, [ 1 ], [ 3 ]), e.identical(i, [ 1, 3 ]), e.is(a === i), e.case = "argument is undefined", 
          i = [ 0 ], a = r.scalarAppend(i, [ 1 ], [ 3 ]), e.identical(i, [ 0, 1, 3 ]), e.is(a === i), 
          e.case = "argument is undefined", i = [], a = r.scalarAppend(i, void 0), e.identical(i, []), 
          e.is(a === i), e.case = "array has undefined", i = [ 1 ], a = r.scalarAppend(i, [ void 0, 2 ]), 
          e.identical(i, [ 1, void 0, 2 ]), e.is(a === i), e.case = "array has undefined", 
          a = r.scalarAppend(1, [ 2 ]), e.identical(a, [ 1, 2 ]);
        }
        //
        ,
        arrayMakeRandom: function arrayMakeRandom(e) {
          e.case = "an empty object";
          var a = r.arrayMakeRandom({});
          e.identical(a.length, 1), e.is(a[0] >= 0 && a[0] <= 1), e.case = "a number";
          var n = a = r.arrayMakeRandom(5);
          e.identical(a.length, 5), a = r.arrayMakeRandom(-1), n = [], e.identical(a, n), 
          e.case = "an object", n = a = r.arrayMakeRandom({
            length: 5,
            range: [ 1, 9 ],
            int: !0
          }), e.identical(a, n), e.case = "no arguments", e.shouldThrowErrorSync(function() {
            r.arrayMakeRandom();
          }), e.case = "wrong argument", e.shouldThrowErrorSync(function() {
            r.arrayMakeRandom("wrong argument");
          });
        },
        scalarToVector: 
        //
        function scalarToVector(e) {
          e.case = "nothing";
          var a = r.scalarToVector([], 0), n = [];
          e.identical(a, n), e.case = "static array", a = r.scalarToVector(3, 7), n = [ 3, 3, 3, 3, 3, 3, 3 ], 
          e.identical(a, n), e.case = "original array", a = r.scalarToVector([ 3, 7, 13 ], 3), 
          n = [ 3, 7, 13 ], e.identical(a, n), e.case = "no arguments", e.shouldThrowErrorSync(function() {
            r.scalarToVector();
          }), e.case = "not enough arguments", e.shouldThrowErrorSync(function() {
            r.scalarToVector([ 1, 2, 3 ]);
          }), e.case = "extra argument", e.shouldThrowErrorSync(function() {
            r.scalarToVector([ 1, 2, 3 ], 3, "redundant argument");
          }), e.case = "wrong type of arguments", e.shouldThrowErrorSync(function() {
            r.scalarToVector("wrong argument", "wrong argument");
          }), e.case = "second argument too much", e.shouldThrowErrorSync(function() {
            r.scalarToVector([ 1, 2, 3 ], 4);
          }), e.case = "first three arguments are not wrapped into array", e.shouldThrowErrorSync(function() {
            r.scalarToVector(1, 2, 3, 3);
          });
        },
        arrayFromRange: 
        //
        function arrayFromRange(e) {
          e.case = "single zero";
          var a = r.arrayFromRange([ 0, 1 ]), n = [ 0 ];
          e.identical(a, n), e.case = "nothing", a = r.arrayFromRange([ 1, 1 ]), n = [], e.identical(a, n), 
          e.case = "single not zero", a = r.arrayFromRange([ 1, 2 ]), n = [ 1 ], e.identical(a, n), 
          e.case = "couple of elements", a = r.arrayFromRange([ 1, 3 ]), n = [ 1, 2 ], e.identical(a, n), 
          e.case = "single number as argument", a = r.arrayFromRange(3), n = [ 0, 1, 2 ], 
          e.identical(a, n), e.case = "complex case", a = r.arrayFromRange([ 3, 9 ]), n = [ 3, 4, 5, 6, 7, 8 ], 
          e.identical(a, n), e.case = "extra argument", e.shouldThrowErrorSync(function() {
            r.arrayFromRange([ 1, 3 ], "wrong arguments");
          }), e.case = "argument not wrapped into array", e.shouldThrowErrorSync(function() {
            r.arrayFromRange(1, 3);
          }), e.case = "wrong type of argument", e.shouldThrowErrorSync(function() {
            r.arrayFromRange("wrong arguments");
          }), e.case = "no arguments", e.shouldThrowErrorSync(function() {
            r.arrayFromRange();
          });
        },
        arrayAs: 
        //
        function arrayAs(e) {
          e.case = "an empty array";
          var a = r.arrayAs([]), n = [];
          e.identical(a, n), e.case = "null", a = r.arrayAs(null), n = [], e.identical(a, n), 
          e.case = "array contains an object", a = r.arrayAs({
            a: 1,
            b: 2
          }), n = [ {
            a: 1,
            b: 2
          } ], e.identical(a, n), e.case = "array contains boolean", a = r.arrayAs(!0), n = [ !0 ], 
          e.identical(a, n), e.case = "nothing", e.shouldThrowErrorSync(() => r.arrayAs()), 
          e.case = "undefined", e.shouldThrowErrorSync(() => r.arrayAs(void 0));
        },
        arrayToMap: 
        //
        function arrayToMap(e) {
          e.case = "an empty object";
          var a = r.arrayToMap([]), n = {};
          e.identical(a, n), e.case = "an object", a = r.arrayToMap([ 3, [ 1, 2, 3 ], "abc", !1, void 0, null, {} ]), 
          n = {
            0: 3,
            1: [ 1, 2, 3 ],
            2: "abc",
            3: !1,
            4: void 0,
            5: null,
            6: {}
          }, e.identical(a, n), e.case = "arguments[...]";
          var i = function() {
            return arguments;
          }(3, "abc", !1, void 0, null, {
            greeting: "Hello there!"
          });
          a = r.arrayToMap(i), n = {
            0: 3,
            1: "abc",
            2: !1,
            3: void 0,
            4: null,
            5: {
              greeting: "Hello there!"
            }
          }, e.identical(a, n), e.case = "longIs";
          var t = [];
          t.a = 1, a = r.arrayToMap(t), n = {}, e.identical(a, n), e.case = "no argument", 
          e.shouldThrowErrorSync(function() {
            r.arrayToMap();
          }), e.case = "wrong type of argument", e.shouldThrowErrorSync(function() {
            r.arrayToMap("wrong argument");
          });
        },
        arrayToStr: 
        //
        function arrayToStr(e) {
          e.case = "nothing";
          var a = r.arrayToStr([]), n = "";
          e.identical(a, n), e.case = "returns the string", a = r.arrayToStr("abcdefghijklmnopqrstuvwxyz", {
            type: "int"
          }), n = "a b c d e f g h i j k l m n o p q r s t u v w x y z ", e.identical(a, n), 
          e.case = "returns a single string representing the integer values", a = r.arrayToStr([ 1, 2, 3 ], {
            type: "int"
          }), n = "1 2 3 ", e.identical(a, n), e.case = "returns a single string representing the float values", 
          a = r.arrayToStr([ 3.5, 13.77, 7.33 ], {
            type: "float",
            precission: 4
          }), n = "3.500 13.77 7.330", e.identical(a, n), e.case = "no arguments", e.shouldThrowErrorSync(function() {
            r.arrayToStr();
          }), e.case = "in second argument property (type) is wrong", e.shouldThrowErrorSync(function() {
            r.arrayToStr([ 1, 2, 3 ], {
              type: "wrong type"
            });
          }), e.case = "in second argument property (type) is not provided", e.shouldThrowErrorSync(function() {
            r.arrayToStr([ 1, 2, 3 ], {
              precission: 4
            });
          }), e.case = "first argument is string", e.shouldThrowErrorSync(function() {
            r.arrayToStr("wrong argument", {
              type: "float"
            });
          });
        }
        // --
        // unroll
        // --
        ,
        // unroll
        unrollIs: function unrollIs(e) {
          e.case = "unroll from empty array";
          var a = [], n = r.unrollMake(a);
          e.is(r.unrollIs(n)), e.is(r.arrayIs(n)), e.is(a !== n), e.case = "unroll from not empty array", 
          a = [ 1 ], n = r.unrollMake(a), e.is(r.unrollIs(n)), e.is(r.arrayIs(n)), e.is(a !== n), 
          a = [ "str" ], n = r.unrollFrom(a), e.is(r.unrollIs(n)), e.is(r.arrayIs(n)), e.is(a !== n), 
          e.case = "not unroll", n = new Float32Array([ 3, 1, 2 ]), e.identical(r.unrollIs(n), !1), 
          e.identical(r.unrollIs([]), !1), e.identical(r.unrollIs(1), !1), e.identical(r.unrollIs("str"), !1), 
          e.case = "second argument is unroll", n = r.unrollMake([ 2, 4 ]), e.identical(r.unrollIs([ 1, "str" ], n), !1), 
          e.is(r.arrayIs(n)), n = r.unrollFrom([ 2, 4 ]), e.identical(r.unrollIs(1, n), !1), 
          e.is(r.arrayIs(n)), n = r.unrollMake([ 2, 4 ]), e.identical(r.unrollIs("str", n), !1), 
          e.is(r.arrayIs(n));
        }
        //
        ,
        unrollIsPopulated: function unrollIsPopulated(e) {
          e.case = "unroll from not empty array";
          var a = [ 1 ], n = r.unrollMake(a);
          e.is(r.unrollIsPopulated(n)), e.is(r.arrayIs(n)), e.is(a !== n), a = [ "str" ], 
          n = r.unrollFrom(a), e.is(r.unrollIsPopulated(n)), e.is(r.arrayIs(n)), e.is(a !== n), 
          a = [ [] ], n = r.unrollFrom(a), e.is(r.unrollIsPopulated(n)), e.is(r.arrayIs(n)), 
          e.is(a !== n), a = [ null ], n = r.unrollMake(a), e.is(r.unrollIsPopulated(n)), 
          e.is(r.arrayIs(n)), e.is(a !== n), e.case = "unroll from empty array", a = [], n = r.unrollFrom(a), 
          e.identical(r.unrollIsPopulated(n), !1), e.is(r.arrayIs(n)), e.is(a !== n), e.case = "not unroll", 
          n = new Float32Array([ 3, 1, 2 ]), e.identical(r.unrollIs(n), !1), e.identical(r.unrollIsPopulated([]), !1), 
          e.identical(r.unrollIsPopulated(1), !1), e.identical(r.unrollIsPopulated("str"), !1), 
          e.case = "second argument is unroll", n = r.unrollMake([ 2, 4 ]), e.identical(r.unrollIsPopulated([ 1, "str" ], n), !1), 
          e.is(r.arrayIs(n)), n = r.unrollFrom([ 2, 4 ]), e.identical(r.unrollIsPopulated(1, n), !1), 
          e.is(r.arrayIs(n)), n = r.unrollMake([ 2, 4 ]), e.identical(r.unrollIsPopulated("str", n), !1), 
          e.is(r.arrayIs(n));
        }
        //
        ,
        unrollMake: function unrollMake(e) {
          e.case = "null";
          var a = r.unrollMake(null);
          e.equivalent(a, []), e.is(r.arrayIs(a)), e.is(r.unrollIs(a)), e.case = "empty";
          var n = [];
          a = r.unrollMake(n), e.equivalent(a, []), e.is(r.arrayIs(a)), e.is(r.unrollIs(a)), 
          e.is(n !== a), e.case = "single number", n = [ 0 ], a = r.unrollMake(n), e.equivalent(a, [ 0 ]), 
          e.is(r.arrayIs(a)), e.is(r.unrollIs(a)), e.is(n !== a), e.case = "single string", 
          n = [ "a" ], a = r.unrollMake(n), e.equivalent(a, [ "a" ]), e.is(r.arrayIs(a)), 
          e.is(r.unrollIs(a)), e.is(n !== a), e.case = "several", n = [ 1, 2, 3 ], a = r.unrollMake(n), 
          e.equivalent(a, [ 1, 2, 3 ]), e.is(r.arrayIs(a)), e.is(r.unrollIs(a)), e.is(n !== a), 
          e.case = "zero length", a = r.unrollMake(0);
          var i = new Array(0);
          e.equivalent(a, i), e.is(r.arrayIs(a)), e.is(r.unrollIs(a)), e.is(i !== a), e.case = "length", 
          a = r.unrollMake(3), i = new Array(3), e.equivalent(a, i), e.is(r.arrayIs(a)), e.is(r.unrollIs(a)), 
          e.is(i !== a), e.case = "from empty Float32", n = new Float32Array(), a = r.unrollMake(n), 
          e.equivalent(a, []), e.is(r.arrayIs(a)), e.is(r.unrollIs(a)), e.is(n !== a), e.case = "from Float32", 
          n = new Float32Array([ 1, 2, 3 ]), a = r.unrollMake(n), e.equivalent(a, [ 1, 2, 3 ]), 
          e.is(r.arrayIs(a)), e.is(r.unrollIs(a)), e.is(n !== a), e.case = "from empty arguments array", 
          n = r.argumentsArrayMake([]), a = r.unrollMake(n), e.equivalent(a, []), e.is(r.arrayIs(a)), 
          e.is(r.unrollIs(a)), e.is(n !== a), e.case = "from arguments array", n = r.argumentsArrayMake([ 1, 2, 3 ]), 
          a = r.unrollMake(n), e.equivalent(a, [ 1, 2, 3 ]), e.is(r.arrayIs(a)), e.is(r.unrollIs(a)), 
          e.is(n !== a), e.case = "from empty array", n = r.arrayMake([]), a = r.unrollMake(n), 
          e.equivalent(a, []), e.is(r.arrayIs(a)), e.is(r.unrollIs(a)), e.is(n !== a), e.case = "from array", 
          n = r.arrayMake([ 1, 2, 3 ]), a = r.unrollMake(n), e.equivalent(a, [ 1, 2, 3 ]), 
          e.is(r.arrayIs(a)), e.is(r.unrollIs(a)), e.is(n !== a), e.shouldThrowErrorSync(function() {
            r.unrollMake();
          }), e.shouldThrowErrorSync(function() {
            r.unrollMake(1, 3);
          }), e.shouldThrowErrorSync(function() {
            r.unrollMake([], 3);
          }), e.shouldThrowErrorSync(function() {
            r.unrollMake([], []);
          }), e.shouldThrowErrorSync(function() {
            r.unrollMake({});
          }), e.shouldThrowErrorSync(function() {
            r.unrollMake("1");
          });
        }
        //
        /*
qqq : split all groups of test cases by / * - * / for all test routines
*/
        /*
qqq : test routine unrollFrom is poor
*/ ,
        unrollFrom: function unrollFrom(e) {
          e.case = "null";
          var a = r.unrollFrom(null);
          e.equivalent(a, []), e.is(r.arrayIs(a)), e.is(r.unrollIs(a)), e.case = "src is unroll";
          var n = r.unrollMake(0);
          a = r.unrollFrom(n), e.identical(a, []), e.is(r.arrayIs(a)), e.is(r.unrollIs(a)), 
          e.is(a !== []), n = r.unrollMake(2), a = r.unrollFrom(n), e.identical(a, [ void 0, void 0 ]), 
          e.is(r.arrayIs(a)), e.is(r.unrollIs(a)), n = r.unrollMake([ 1, "str", 3 ]), a = r.unrollFrom(n), 
          e.identical(a, [ 1, "str", 3 ]), e.is(r.arrayIs(a)), e.is(r.unrollIs(a)), e.is(a !== [ 1, "str", 3 ]), 
          e.case = "from empty", n = [], a = r.unrollFrom(n), e.equivalent(a, n), e.is(r.arrayIs(a)), 
          e.is(r.unrollIs(a)), e.is(n !== a), e.case = "from array with single element", n = [ 0 ], 
          a = r.unrollFrom(n), e.equivalent(a, n), e.is(r.arrayIs(a)), e.is(r.unrollIs(a)), 
          e.is(n !== a), e.case = "several", n = [ 1, 2, "str" ], a = r.unrollFrom(n), e.equivalent(a, n), 
          e.is(r.arrayIs(a)), e.is(r.unrollIs(a)), e.is(n !== a), e.case = "unroll from number", 
          a = r.unrollFrom(0);
          var i = new Array(0);
          e.equivalent(a, i), e.is(r.arrayIs(a)), e.is(r.unrollIs(a)), e.is(i !== a), a = r.unrollFrom(3), 
          i = new Array(3), e.equivalent(a, i), e.is(r.arrayIs(a)), e.is(r.unrollIs(a)), e.is(i !== a), 
          e.case = "from Float32", n = new Float32Array(), a = r.unrollFrom(n), e.equivalent(a, []), 
          e.is(r.arrayIs(a)), e.is(r.unrollIs(a)), e.is(n !== a), n = new Float32Array([ 1, 2, 3 ]), 
          a = r.unrollFrom(n), e.equivalent(a, [ 1, 2, 3 ]), e.is(r.arrayIs(a)), e.is(r.unrollIs(a)), 
          e.is(n !== a), e.case = "from arguments array", n = r.argumentsArrayMake([]), a = r.unrollFrom(n), 
          e.equivalent(a, []), e.is(r.arrayIs(a)), e.is(r.unrollIs(a)), e.is(n !== a), n = r.argumentsArrayMake([ 1, 2, 3 ]), 
          a = r.unrollFrom(n), e.equivalent(a, [ 1, 2, 3 ]), e.is(r.arrayIs(a)), e.is(r.unrollIs(a)), 
          e.is(n !== a), e.shouldThrowErrorSync(function() {
            r.unrollFrom();
          }), e.shouldThrowErrorSync(function() {
            r.unrollFrom(1, 3);
          }), e.shouldThrowErrorSync(function() {
            r.unrollFrom([], 3);
          }), e.shouldThrowErrorSync(function() {
            r.unrollFrom([], []);
          }), e.shouldThrowErrorSync(function() {
            r.unrollFrom({});
          }), e.shouldThrowErrorSync(function() {
            r.unrollFrom("1");
          });
        }
        //
        ,
        unrollsFrom: function unrollsFrom(e) {
          e.case = "src has null";
          var a = r.unrollsFrom(null);
          e.equivalent(a, [ [] ]), e.is(r.arrayIs(a)), e.is(r.unrollIs(a)), e.is(r.unrollIs(a[0])), 
          a = r.unrollsFrom(1, [], null, [ 1, {
            a: 2
          } ]);
          var n = [ [ void 0 ], [], [], [ 1, {
            a: 2
          } ] ];
          e.equivalent(a, n), e.is(r.arrayIs(a)), e.is(r.unrollIs(a)), e.is(r.unrollIs(a[0])), 
          e.is(r.unrollIs(a[3])), e.is(a !== n), e.case = "src has unroll";
          var i = r.unrollMake(0);
          a = r.unrollsFrom(i), e.identical(a, [ [] ]), e.is(r.arrayIs(a)), e.is(r.unrollIs(a)), 
          e.is(r.unrollIs(a[0])), e.is(a !== [ [] ]), i = r.unrollMake(2), a = r.unrollsFrom(i), 
          e.identical(a, [ [ void 0, void 0 ] ]), e.is(r.arrayIs(a)), e.is(r.unrollIs(a)), 
          e.is(r.unrollIs(a[0])), i = r.unrollMake([ 1, "str", 3 ]), a = r.unrollsFrom(i), 
          e.identical(a, [ [ 1, "str", 3 ] ]), e.is(r.arrayIs(a)), e.is(r.unrollIs(a)), e.is(r.unrollIs(a[0])), 
          e.is(a !== [ [ 1, "str", 3 ] ]), i = r.unrollMake([ 1, "str", 3 ]), a = r.unrollsFrom(1, [], i), 
          n = [ [ void 0 ], [], [ 1, "str", 3 ] ], e.identical(a, n), e.is(r.arrayIs(a)), 
          e.is(r.unrollIs(a)), e.is(r.unrollIs(a[0])), e.is(r.unrollIs(a[2])), e.is(a !== n), 
          e.case = "src has unrolls from Array", i = new Array(0), a = r.unrollsFrom(i), e.equivalent(a, [ i ]), 
          e.is(r.arrayIs(a)), e.is(r.unrollIs(a)), e.is(r.unrollIs(a[0])), e.is([ i ] !== a), 
          i = new Array(3), a = r.unrollsFrom(i), e.equivalent(a, [ i ]), e.is(r.arrayIs(a)), 
          e.is(r.unrollIs(a)), e.is(r.unrollIs(a[0])), e.is([ i ] !== a), i = new Array(3), 
          a = r.unrollsFrom(1, [], [ "str", {} ], i), e.equivalent(a, [ [ void 0 ], [], [ "str", {} ], i ]), 
          e.is(r.arrayIs(a)), e.is(r.unrollIs(a)), e.is(r.unrollIs(a[0])), e.is(r.unrollIs(a[3])), 
          e.is([ i ] !== a), e.case = "src has unroll from Float32", i = new Float32Array(), 
          a = r.unrollsFrom(i), e.equivalent(a, [ [] ]), e.is(r.arrayIs(a)), e.is(r.unrollIs(a)), 
          e.is(r.unrollIs(a[0])), e.is([ i ] !== a), i = new Float32Array([ 1, 2, 3 ]), a = r.unrollsFrom(i), 
          e.equivalent(a, [ [ 1, 2, 3 ] ]), e.is(r.arrayIs(a)), e.is(r.unrollIs(a)), e.is(r.unrollIs(a[0])), 
          e.is([ i ] !== a), i = new Float32Array([ 1, 2, 3 ]), a = r.unrollsFrom([], 1, i), 
          e.equivalent(a, [ [], [ void 0 ], [ 1, 2, 3 ] ]), e.is(r.arrayIs(a)), e.is(r.unrollIs(a)), 
          e.is(r.unrollIs(a[0])), e.is(r.unrollIs(a[1])), e.is(r.unrollIs(a[2])), e.is([ i ] !== a), 
          e.case = "from arguments array", i = r.argumentsArrayMake([]), a = r.unrollsFrom(i), 
          e.equivalent(a, [ [] ]), e.is(r.arrayIs(a)), e.is(r.unrollIs(a)), e.is(r.unrollIs(a[0])), 
          e.is([ i ] !== a), i = r.argumentsArrayMake([ 1, 2, 3 ]), a = r.unrollsFrom(i), 
          e.equivalent(a, [ [ 1, 2, 3 ] ]), e.is(r.arrayIs(a)), e.is(r.unrollIs(a)), e.is(r.unrollIs(a[0])), 
          e.is([ i ] !== a), i = r.argumentsArrayMake([ 1, 2, 3 ]), a = r.unrollsFrom([], 1, i), 
          e.equivalent(a, [ [], [ void 0 ], [ 1, 2, 3 ] ]), e.is(r.arrayIs(a)), e.is(r.unrollIs(a)), 
          e.is(r.unrollIs(a[0])), e.is(r.unrollIs(a[1])), e.is(r.unrollIs(a[2])), e.is([ i ] !== a), 
          e.case = "not argument", e.shouldThrowError(function() {
            r.unrollsFrom();
          }), e.case = "argument is not array, not null", e.shouldThrowError(function() {
            r.unrollsFrom({});
          }), e.shouldThrowError(function() {
            r.unrollsFrom("1");
          }), e.shouldThrowError(function() {
            r.unrollsFrom(2, {});
          }), e.shouldThrowError(function() {
            r.unrollsFrom([ "1" ], [ 1, "str" ], "abc");
          });
        }
        //
        ,
        unrollFromMaybe: function unrollFromMaybe(e) {
          e.case = "src is unroll";
          var a = r.unrollMake(0), n = r.unrollFromMaybe(a);
          e.identical(n, []), e.is(r.arrayIs(n)), e.is(r.unrollIs(n)), e.is(n !== []), a = r.unrollMake(2), 
          n = r.unrollFromMaybe(a), e.identical(n, [ void 0, void 0 ]), e.is(r.arrayIs(n)), 
          e.is(r.unrollIs(n)), a = r.unrollMake([ 1, "str", 3 ]), n = r.unrollFromMaybe(a), 
          e.identical(n, [ 1, "str", 3 ]), e.is(r.arrayIs(n)), e.is(r.unrollIs(n)), e.is(n !== [ 1, "str", 3 ]), 
          e.case = "src is undefined", n = r.unrollFromMaybe(void 0), e.identical(n, void 0), 
          e.case = "src is map", n = r.unrollFromMaybe({}), e.identical(n, {}), e.is(r.mapIs(n)), 
          n = r.unrollFromMaybe({
            a: 0,
            b: "str"
          }), e.identical(n, {
            a: 0,
            b: "str"
          }), e.is(r.mapIs(n)), e.case = "src is incompatible primitive", n = r.unrollFromMaybe("str"), 
          e.identical(n, "str"), e.is(r.primitiveIs(n)), n = r.unrollFromMaybe(!0), e.identical(n, !0), 
          e.is(r.primitiveIs(n)), n = r.unrollFromMaybe(!1), e.identical(n, !1), e.is(r.primitiveIs(n)), 
          e.case = "from null", n = r.unrollFromMaybe(null), e.equivalent(n, []), e.is(r.arrayIs(n)), 
          e.is(r.unrollIs(n)), e.is([] !== n), e.case = "from empty", a = [], n = r.unrollFromMaybe(a), 
          e.equivalent(n, a), e.is(r.arrayIs(n)), e.is(r.unrollIs(n)), e.is(a !== n), e.case = "from array with single element", 
          a = [ 0 ], n = r.unrollFromMaybe(a), e.equivalent(n, a), e.is(r.arrayIs(n)), e.is(r.unrollIs(n)), 
          e.is(a !== n), e.case = "several", a = [ 1, 2, "str" ], n = r.unrollFromMaybe(a), 
          e.equivalent(n, a), e.is(r.arrayIs(n)), e.is(r.unrollIs(n)), e.is(a !== n), e.case = "unroll from number", 
          n = r.unrollFromMaybe(0);
          var i = new Array(0);
          e.equivalent(n, i), e.is(r.arrayIs(n)), e.is(r.unrollIs(n)), e.is(i !== n), n = r.unrollFromMaybe(3), 
          i = new Array(3), e.equivalent(n, i), e.is(r.arrayIs(n)), e.is(r.unrollIs(n)), e.is(i !== n), 
          e.case = "from Float32", a = new Float32Array(), n = r.unrollFromMaybe(a), e.equivalent(n, []), 
          e.is(r.arrayIs(n)), e.is(r.unrollIs(n)), e.is(a !== n), a = new Float32Array([ 1, 2, 3 ]), 
          n = r.unrollFromMaybe(a), e.equivalent(n, [ 1, 2, 3 ]), e.is(r.arrayIs(n)), e.is(r.unrollIs(n)), 
          e.is(a !== n), e.case = "from arguments array", a = r.argumentsArrayMake([]), n = r.unrollFromMaybe(a), 
          e.equivalent(n, []), e.is(r.arrayIs(n)), e.is(r.unrollIs(n)), e.is(a !== n), a = r.argumentsArrayMake([ 1, 2, 3 ]), 
          n = r.unrollFromMaybe(a), e.equivalent(n, [ 1, 2, 3 ]), e.is(r.arrayIs(n)), e.is(r.unrollIs(n)), 
          e.is(a !== n), e.case = "routine has not argument", e.shouldThrowError(function() {
            r.unrollFromMaybe();
          }), e.case = "many arguments", e.shouldThrowError(function() {
            r.unrollFromMaybe(1, 3);
          }), e.shouldThrowError(function() {
            r.unrollFromMaybe([], 3);
          }), e.shouldThrowError(function() {
            r.unrollFromMaybe([], []);
          });
        }
        //
        ,
        unrollNormalize: function unrollNormalize(e) {
          e.case = "dst is array";
          var a = r.unrollNormalize([]);
          e.identical(a, []), e.is(r.arrayIs(a)), a = r.unrollNormalize([ 1, "str" ]), e.identical(a, [ 1, "str" ]), 
          e.is(r.arrayIs(a)), e.case = "dst is unroll", a = r.unrollNormalize(r.unrollMake([])), 
          e.identical(a, []), e.is(r.arrayIs(a)), a = r.unrollNormalize(r.unrollMake([ 1, "str" ])), 
          e.identical(a, [ 1, "str" ]), e.is(r.arrayIs(a)), e.case = "dst is unroll from array";
          var n = new Array(0);
          a = r.unrollNormalize(r.unrollFrom(n)), e.identical(a, []), e.is(r.arrayIs(a)), 
          n = new Array([]), a = r.unrollNormalize(r.unrollFrom(n)), e.identical(a, [ [] ]), 
          e.is(r.arrayIs(a)), n = new Array([ 1, 2, "str" ]), a = r.unrollNormalize(r.unrollFrom(n)), 
          e.identical(a, [ [ 1, 2, "str" ] ]), e.is(r.arrayIs(a)), e.case = "dst is unroll from array", 
          n = new Float32Array([]), a = r.unrollNormalize(r.unrollFrom(n)), e.identical(a, []), 
          e.is(r.arrayIs(a)), n = new Float32Array([ 1, 2, 3 ]), a = r.unrollNormalize(r.unrollFrom(n)), 
          e.identical(a, [ 1, 2, 3 ]), e.is(r.arrayIs(a)), e.case = "dst is complex unroll", 
          a = r.unrollNormalize(r.unrollFrom([ 1, r.unrollFrom([ 2, r.unrollFrom([ "str" ]) ]) ])), 
          e.identical(a, [ 1, 2, "str" ]), e.is(r.arrayIs(a)), e.case = "mixed types";
          var i = r.unrollMake([ "a", "b" ]), t = r.unrollFrom([ 1, 2 ]);
          a = r.unrollNormalize([ 0, null, i, t, void 0 ]), e.identical(a, [ 0, null, "a", "b", 1, 2, void 0 ]), 
          e.is(r.arrayIs(a)), i = r.unrollMake([ "a", "b" ]), t = r.unrollFrom([ 1, 2 ]), 
          a = r.unrollNormalize([ 0, [ null, i ], r.unrollFrom([ t, void 0 ]) ]), e.identical(a, [ 0, [ null, "a", "b" ], 1, 2, void 0 ]), 
          e.is(r.arrayIs(a)), e.case = "dst is empty", e.shouldThrowErrorSync(function() {
            r.unrollNormalize();
          }), e.case = "two arguments", e.shouldThrowErrorSync(function() {
            r.unrollNormalize([], []);
          }), e.case = "dst is not array", e.shouldThrowErrorSync(function() {
            r.unrollNormalize(null);
          }), e.shouldThrowErrorSync(function() {
            r.unrollNormalize(1);
          }), e.shouldThrowErrorSync(function() {
            r.unrollNormalize("str");
          });
        }
        //
        /* qqq
unrollAppend, unrollPrepend should have test groups :
- dst is null / unroll / array
- one argument / two arguments / three arguments
- first argument have array / unroll / complex unroll( unroll in unroll in unroll )
- non-first argument have array / unroll / complex unroll( unroll in unroll in unroll / Float32Array / ArgumentsArray

Dmytro: all tests is added
qqq: In unrollPrepend and unrollAppend test cases groups by number of arguments and it includes other test cases - array, unroll, complex unroll.
In previus routines improve unrollMake and unrollFrom tests.
Notice that unrollIs, unrollIsPopulated have not asserts.
*/
        //
        ,
        unrollPrepend: function unrollPrepend(e) {
          e.open("one argument"), e.case = "dst is null";
          var a = r.unrollPrepend(null);
          e.identical(a, []), e.is(r.arrayIs(a)), e.isNot(r.unrollIs(a)), e.case = "dst is unroll", 
          a = r.unrollPrepend(r.unrollMake([ 1, 2, "str" ])), e.identical(a, [ 1, 2, "str" ]), 
          e.is(r.arrayIs(a)), e.is(r.unrollIs(a)), e.case = "dst is complex unroll";
          var n = r.unrollFrom([ 1, 2, r.unrollMake([ 1, [] ]), r.unrollFrom([ "str", r.unrollMake([ "str2" ]) ]) ]);
          a = r.unrollPrepend(n), e.identical(a, [ 1, 2, 1, [], "str", "str2" ]), e.is(r.arrayIs(a)), 
          e.is(r.unrollIs(a)), e.case = "dst is array", a = r.unrollPrepend([ 1, 2, "str" ]), 
          e.identical(a, [ 1, 2, "str" ]), e.is(r.arrayIs(a)), e.isNot(r.unrollIs(a)), e.close("one argument"), 
          /* - */
          e.open("two arguments"), e.case = "dst is null, second arg is null", a = r.unrollPrepend(null, null), 
          e.identical(a, [ null ]), e.is(r.arrayIs(a)), e.isNot(r.unrollIs(a)), e.case = "dst is null, second arg is unroll", 
          a = r.unrollPrepend(null, r.unrollMake([ 1, "str" ])), e.identical(a, [ 1, "str" ]), 
          e.is(r.arrayIs(a)), e.isNot(r.unrollIs(a)), e.case = "dst is null, second arg is complex unroll", 
          n = r.unrollFrom([ 1, 2, r.unrollMake([ 1, [] ]), r.unrollFrom([ "str", r.unrollMake([ "str2" ]) ]) ]), 
          a = r.unrollPrepend(null, n), e.identical(a, [ 1, 2, 1, [], "str", "str2" ]), e.is(r.arrayIs(a)), 
          e.isNot(r.unrollIs(a)), e.case = "dst is null, second arg is complex unroll";
          var i = r.unrollFrom([ 3, 4, r.unrollFrom([ 5, 6 ]) ]), t = [ 7, r.unrollFrom([ 8, 9 ]) ], c = (a = r.unrollPrepend(null, r.unrollFrom([ 1, 2, i, t, 10 ])), 
          [ 1, 2, 3, 4, 5, 6, [ 7, 8, 9 ], 10 ]);
          e.identical(a, c), e.isNot(r.unrollIs(a)), e.case = "dst is null, second arg is array", 
          a = r.unrollPrepend(null, [ 1, 2, "str" ]), e.identical(a, [ [ 1, 2, "str" ] ]), 
          e.is(r.arrayIs(a)), e.isNot(r.unrollIs(a)), e.case = "dst is null, second arg makes from Float32Array", 
          n = r.unrollMake(new Float32Array([ 1, 2, 3 ])), a = r.unrollPrepend(null, n), e.identical(a, [ 1, 2, 3 ]), 
          e.is(r.arrayIs(a)), e.is(n !== a), e.isNot(r.unrollIs(a)), e.case = "dst is null, second arg makes from argumentsArray", 
          n = r.unrollMake(r.argumentsArrayMake([ 1, 2, "str" ])), a = r.unrollPrepend(null, n), 
          e.identical(a, [ 1, 2, "str" ]), e.is(r.arrayIs(a)), e.is(n !== a), e.isNot(r.unrollIs(a)), 
          //
          e.case = "dst is array, second arg is null", a = r.unrollPrepend([ 1 ], null), e.identical(a, [ null, 1 ]), 
          e.is(r.arrayIs(a)), e.isNot(r.unrollIs(a)), e.case = "dst is array, second arg is unroll", 
          a = r.unrollPrepend([ 1 ], r.unrollMake([ 1, "str" ])), e.identical(a, [ 1, "str", 1 ]), 
          e.is(r.arrayIs(a)), e.isNot(r.unrollIs(a)), e.case = "dst is array, second arg is complex unroll", 
          n = r.unrollFrom([ 1, 2, r.unrollMake([ 1, [] ]), r.unrollFrom([ "str", r.unrollMake([ "str2" ]) ]) ]), 
          a = r.unrollPrepend([ "str", 3 ], n), e.identical(a, [ 1, 2, 1, [], "str", "str2", "str", 3 ]), 
          e.is(r.arrayIs(a)), e.isNot(r.unrollIs(a)), e.case = "dst is array, second arg is array", 
          a = r.unrollPrepend([ "str", 2 ], [ 1, 2, "str" ]), e.identical(a, [ [ 1, 2, "str" ], "str", 2 ]), 
          e.is(r.arrayIs(a)), e.isNot(r.unrollIs(a)), e.case = "dst is array, second arg makes from Float32Array", 
          n = r.unrollMake(new Float32Array([ 1, 2, 3 ])), a = r.unrollPrepend([ "str", 0 ], n), 
          e.identical(a, [ 1, 2, 3, "str", 0 ]), e.is(r.arrayIs(a)), e.isNot(r.unrollIs(a)), 
          e.case = "dst is array, second arg makes from argumentsArray", n = r.unrollMake(r.argumentsArrayMake([ 1, 2, "str" ])), 
          a = r.unrollPrepend([ "str", 0 ], n), e.identical(a, [ 1, 2, "str", "str", 0 ]), 
          e.is(r.arrayIs(a)), e.isNot(r.unrollIs(a)), 
          //
          e.case = "dst is unroll, second arg is null";
          var l = r.unrollMake([ 1 ]);
          a = r.unrollPrepend(l, null), e.identical(a, [ null, 1 ]), e.is(r.arrayIs(a)), e.is(r.unrollIs(a)), 
          e.case = "dst is unroll, second arg is unroll", l = r.unrollMake([ 1 ]), a = r.unrollPrepend(l, r.unrollMake([ 1, "str" ])), 
          e.identical(a, [ 1, "str", 1 ]), e.is(r.arrayIs(a)), e.is(r.unrollIs(a)), e.case = "dst is unroll, second arg is complex unroll", 
          l = r.unrollMake([ 1 ]), n = r.unrollFrom([ 1, 2, r.unrollMake([ 1, [] ]), r.unrollFrom([ "str", r.unrollMake([ "str2" ]) ]) ]), 
          a = r.unrollPrepend(l, n), e.identical(a, [ 1, 2, 1, [], "str", "str2", 1 ]), e.is(r.arrayIs(a)), 
          e.is(r.unrollIs(a)), e.case = "dst is unroll, second arg is array", l = r.unrollMake([ 1 ]), 
          a = r.unrollPrepend(l, [ 1, 2, "str" ]), e.identical(a, [ [ 1, 2, "str" ], 1 ]), 
          e.is(r.arrayIs(a)), e.is(r.unrollIs(a)), e.case = "dst is unroll, second arg makes from Float32Array", 
          n = r.unrollMake(new Float32Array([ 1, 2, 3 ])), l = r.unrollMake([ "str", 0 ]), 
          a = r.unrollPrepend(l, n), e.identical(a, [ 1, 2, 3, "str", 0 ]), e.is(r.arrayIs(a)), 
          e.is(r.unrollIs(a)), e.case = "dst is unroll, second arg makes from argumentsArray", 
          n = r.unrollMake(r.argumentsArrayMake([ 1, 2, "str" ])), l = r.unrollMake([ "str", 0 ]), 
          a = r.unrollPrepend(l, n), e.identical(a, [ 1, 2, "str", "str", 0 ]), e.is(r.arrayIs(a)), 
          e.is(r.unrollIs(a)), 
          //
          e.case = "dst is complex unroll, second arg is null", l = r.unrollFrom([ 1, 2, r.unrollMake([ 1, [] ]), r.unrollFrom([ "str", r.unrollMake([ "str2" ]) ]) ]), 
          a = r.unrollPrepend(l, null), e.identical(a, [ null, 1, 2, 1, [], "str", "str2" ]), 
          e.is(r.arrayIs(a)), e.is(r.unrollIs(a)), e.case = "dst is complex unroll, second arg is unroll", 
          l = r.unrollFrom([ 1, 2, r.unrollMake([ 1, [] ]), r.unrollFrom([ "str", r.unrollMake([ "str2" ]) ]) ]), 
          a = r.unrollPrepend(l, r.unrollMake([ 1, "str" ])), e.identical(a, [ 1, "str", 1, 2, 1, [], "str", "str2" ]), 
          e.is(r.arrayIs(a)), e.is(r.unrollIs(a)), e.case = "dst is complex unroll, second arg is complex unroll", 
          l = r.unrollFrom([ 1, 2, r.unrollMake([ 1, [] ]), r.unrollFrom([ "str", r.unrollMake([ "str2" ]) ]) ]), 
          n = r.unrollFrom([ 1, 2, r.unrollMake([ 1, [] ]), r.unrollFrom([ "str", r.unrollMake([ "str2" ]) ]) ]), 
          a = r.unrollPrepend(l, n), e.identical(a, [ 1, 2, 1, [], "str", "str2", 1, 2, 1, [], "str", "str2" ]), 
          e.is(r.arrayIs(a)), e.is(r.unrollIs(a)), e.case = "dst is complex unroll, second arg is array", 
          l = r.unrollFrom([ 1, 2, r.unrollMake([ 1, [] ]), r.unrollFrom([ "str", r.unrollMake([ "str2" ]) ]) ]), 
          a = r.unrollPrepend(l, [ 1, 2, "str" ]), e.identical(a, [ [ 1, 2, "str" ], 1, 2, 1, [], "str", "str2" ]), 
          e.is(r.arrayIs(a)), e.is(r.unrollIs(a)), e.case = "dst is complex unroll, second arg makes from Float32Array", 
          l = r.unrollFrom([ 1, 2, r.unrollMake([ 1, [] ]), r.unrollFrom([ "str", r.unrollMake([ "str2" ]) ]) ]), 
          n = r.unrollMake(new Float32Array([ 1, 2, 3 ])), a = r.unrollPrepend(l, n), e.identical(a, [ 1, 2, 3, 1, 2, 1, [], "str", "str2" ]), 
          e.is(r.arrayIs(a)), e.is(r.unrollIs(a)), e.case = "dst is complex unroll, second arg makes from argumentsArray", 
          l = r.unrollFrom([ 1, 2, r.unrollMake([ 1, [] ]), r.unrollFrom([ "str", r.unrollMake([ "str2" ]) ]) ]), 
          n = r.unrollMake(r.argumentsArrayMake([ 1, 2, "str" ])), a = r.unrollPrepend(l, n), 
          e.identical(a, [ 1, 2, "str", 1, 2, 1, [], "str", "str2" ]), e.is(r.arrayIs(a)), 
          e.is(r.unrollIs(a)), e.close("two arguments"), 
          /* - */
          e.open("three arguments or more"), e.case = "dst is null, complex unrolls", i = r.unrollFrom([ 3, 4, r.unrollFrom([ 5, 6 ]) ]), 
          t = [ 7, r.unrollFrom([ 8, 9 ]) ], a = r.unrollPrepend(null, [ 1, 2, i ], [ t, 10 ]), 
          c = [ [ 1, 2, 3, 4, 5, 6 ], [ [ 7, 8, 9 ], 10 ] ], e.identical(a, c), e.isNot(r.unrollIs(a)), 
          e.case = "dst is null, manually unrolled src", i = r.unrollFrom([ 3, 4, r.unrollFrom([ 5, 6 ]) ]), 
          t = [ 7, r.unrollFrom([ 8, 9 ]) ], a = r.unrollPrepend(null, 1, 2, i, t, 10), c = [ 1, 2, 3, 4, 5, 6, [ 7, 8, 9 ], 10 ], 
          e.identical(a, c), e.isNot(r.unrollIs(a)), e.case = "dst is null, next args have unroll from argumentsArray", 
          i = [ 7, r.unrollFrom([ 8, 9 ]) ], t = r.unrollFrom(r.argumentsArrayMake([ 3, 4, r.unrollMake([ 5, 6 ]) ])), 
          a = r.unrollPrepend(null, [ 1, 2, t ], [ i, 10 ]), c = [ [ 1, 2, 3, 4, 5, 6 ], [ [ 7, 8, 9 ], 10 ] ], 
          e.identical(a, c), e.isNot(r.unrollIs(a)), e.case = "dst is null, next args have unroll from Float32Array", 
          i = [ 7, r.unrollFrom([ 8, 9 ]) ], t = r.unrollFrom(new Float32Array([ 3, 4 ])), 
          a = r.unrollPrepend(null, [ 1, 2, t ], [ i, 10 ]), c = [ [ 1, 2, 3, 4 ], [ [ 7, 8, 9 ], 10 ] ], 
          e.identical(a, c), e.isNot(r.unrollIs(a)), e.case = "dst is unroll, complex unrolls", 
          i = r.unrollFrom([ 3, 4, r.unrollFrom([ 5, 6 ]) ]), t = [ 7, r.unrollFrom([ 8, 9 ]) ], 
          a = r.unrollPrepend(r.unrollFrom([]), [ 1, 2 ], i, [ t, 10 ]), c = [ [ 1, 2 ], 3, 4, 5, 6, [ [ 7, 8, 9 ], 10 ] ], 
          e.identical(a, c), e.is(r.unrollIs(a)), e.case = "dst is unroll, next args have unroll from argumentsArray", 
          i = [ 7, r.unrollFrom([ 8, 9 ]) ], t = r.unrollFrom(r.argumentsArrayMake([ 3, 4, r.unrollMake([ 5, 6 ]) ])), 
          a = r.unrollPrepend(r.unrollMake([ 0 ]), [ 1, 2, t ], [ i, 10 ]), c = [ [ 1, 2, 3, 4, 5, 6 ], [ [ 7, 8, 9 ], 10 ], 0 ], 
          e.identical(a, c), e.is(r.unrollIs(a)), e.case = "dst is unroll, next args have unroll from Float32Array", 
          i = [ 7, r.unrollFrom([ 8, 9 ]) ], t = r.unrollFrom(new Float32Array([ 3, 4 ])), 
          a = r.unrollPrepend(r.unrollMake([ 0 ]), [ 1, 2, t ], [ i, 10 ]), c = [ [ 1, 2, 3, 4 ], [ [ 7, 8, 9 ], 10 ], 0 ], 
          e.identical(a, c), e.is(r.unrollIs(a)), e.case = "dst is array, complex unrolls", 
          i = r.unrollFrom([ 3, 4, r.unrollFrom([ 5, 6 ]) ]), t = [ 7, r.unrollFrom([ 8, 9 ]) ], 
          a = r.unrollPrepend([], [ 1, 2 ], i, [ t, 10 ]), c = [ [ 1, 2 ], 3, 4, 5, 6, [ [ 7, 8, 9 ], 10 ] ], 
          e.identical(a, c), e.isNot(r.unrollIs(a)), e.case = "dst is array, next args have unroll from argumentsArray", 
          i = [ 7, r.unrollFrom([ 8, 9 ]) ], t = r.unrollFrom(r.argumentsArrayMake([ 3, 4, r.unrollMake([ 5, 6 ]) ])), 
          a = r.unrollPrepend([ 0 ], [ 1, 2, t ], [ i, 10 ]), c = [ [ 1, 2, 3, 4, 5, 6 ], [ [ 7, 8, 9 ], 10 ], 0 ], 
          e.identical(a, c), e.isNot(r.unrollIs(a)), e.case = "dst is array, next args have unroll from Float32Array", 
          i = [ 7, r.unrollFrom([ 8, 9 ]) ], t = r.unrollFrom(new Float32Array([ 3, 4 ])), 
          a = r.unrollPrepend([ 0 ], [ 1, 2, t ], [ i, 10 ]), c = [ [ 1, 2, 3, 4 ], [ [ 7, 8, 9 ], 10 ], 0 ], 
          e.identical(a, c), e.isNot(r.unrollIs(a)), e.close("three arguments or more"), e.case = "no args", 
          e.shouldThrowErrorSync(function() {
            r.unrollPrepend();
          }), e.case = "dst is not an array", e.shouldThrowErrorSync(function() {
            r.unrollPrepend(1, 1);
          }), e.shouldThrowErrorSync(function() {
            r.unrollPrepend("str", 1);
          }), e.shouldThrowErrorSync(function() {
            r.unrollPrepend(void 0, 1);
          });
        }
        //
        ,
        unrollAppend: function unrollAppend(e) {
          e.open("one argument"), e.case = "dst is null";
          var a = r.unrollAppend(null);
          e.identical(a, []), e.is(r.arrayIs(a)), e.isNot(r.unrollIs(a)), e.case = "dst is unroll", 
          a = r.unrollAppend(r.unrollMake([ 1, 2, "str" ])), e.identical(a, [ 1, 2, "str" ]), 
          e.is(r.arrayIs(a)), e.is(r.unrollIs(a)), e.case = "dst is complex unroll";
          var n = r.unrollFrom([ 1, 2, r.unrollMake([ 1, [] ]), r.unrollFrom([ "str", r.unrollMake([ "str2" ]) ]) ]);
          a = r.unrollAppend(n), e.identical(a, [ 1, 2, 1, [], "str", "str2" ]), e.is(r.arrayIs(a)), 
          e.is(r.unrollIs(a)), e.case = "dst is array", a = r.unrollAppend([ 1, 2, "str" ]), 
          e.identical(a, [ 1, 2, "str" ]), e.is(r.arrayIs(a)), e.isNot(r.unrollIs(a)), e.close("one argument"), 
          /* - */
          e.open("two arguments"), e.case = "dst is null, second arg is null", a = r.unrollAppend(null, null), 
          e.identical(a, [ null ]), e.is(r.arrayIs(a)), e.isNot(r.unrollIs(a)), e.case = "dst is null, second arg is unroll", 
          a = r.unrollAppend(null, r.unrollMake([ 1, "str" ])), e.identical(a, [ 1, "str" ]), 
          e.is(r.arrayIs(a)), e.isNot(r.unrollIs(a)), e.case = "dst is null, second arg is complex unroll", 
          n = r.unrollFrom([ 1, 2, r.unrollMake([ 1, [] ]), r.unrollFrom([ "str", r.unrollMake([ "str2" ]) ]) ]), 
          a = r.unrollAppend(null, n), e.identical(a, [ 1, 2, 1, [], "str", "str2" ]), e.is(r.arrayIs(a)), 
          e.isNot(r.unrollIs(a)), e.case = "dst is null, second arg is complex unroll";
          var i = r.unrollFrom([ 3, 4, r.unrollFrom([ 5, 6 ]) ]), t = [ 7, r.unrollFrom([ 8, 9 ]) ], c = (a = r.unrollAppend(null, r.unrollFrom([ 1, 2, i, t, 10 ])), 
          [ 1, 2, 3, 4, 5, 6, [ 7, 8, 9 ], 10 ]);
          e.identical(a, c), e.isNot(r.unrollIs(a)), e.case = "dst is null, second arg is array", 
          a = r.unrollAppend(null, [ 1, 2, "str" ]), e.identical(a, [ [ 1, 2, "str" ] ]), 
          e.is(r.arrayIs(a)), e.isNot(r.unrollIs(a)), e.case = "dst is null, second arg makes from Float32Array", 
          n = r.unrollMake(new Float32Array([ 1, 2, 3 ])), a = r.unrollAppend(null, n), e.identical(a, [ 1, 2, 3 ]), 
          e.is(r.arrayIs(a)), e.isNot(r.unrollIs(a)), e.is(n !== a), e.case = "dst is null, second arg makes from argumentsArray", 
          n = r.unrollMake(r.argumentsArrayMake([ 1, 2, "str" ])), a = r.unrollAppend(null, n), 
          e.identical(a, [ 1, 2, "str" ]), e.is(r.arrayIs(a)), e.isNot(r.unrollIs(a)), e.is(n !== a), 
          //
          e.case = "dst is array, second arg is null", a = r.unrollAppend([ 1 ], null), e.identical(a, [ 1, null ]), 
          e.is(r.arrayIs(a)), e.isNot(r.unrollIs(a)), e.case = "dst is array, second arg is unroll", 
          a = r.unrollAppend([ 1 ], r.unrollMake([ 1, "str" ])), e.identical(a, [ 1, 1, "str" ]), 
          e.is(r.arrayIs(a)), e.isNot(r.unrollIs(a)), e.case = "dst is array, second arg is complex unroll", 
          n = r.unrollFrom([ 1, 2, r.unrollMake([ 1, [] ]), r.unrollFrom([ "str", r.unrollMake([ "str2" ]) ]) ]), 
          a = r.unrollAppend([ "str", 3 ], n), e.identical(a, [ "str", 3, 1, 2, 1, [], "str", "str2" ]), 
          e.is(r.arrayIs(a)), e.isNot(r.unrollIs(a)), e.case = "dst is array, second arg is array", 
          a = r.unrollAppend([ "str", 2 ], [ 1, 2, "str" ]), e.identical(a, [ "str", 2, [ 1, 2, "str" ] ]), 
          e.is(r.arrayIs(a)), e.isNot(r.unrollIs(a)), e.case = "dst is array, second arg makes from Float32Array", 
          n = r.unrollMake(new Float32Array([ 1, 2, 3 ])), a = r.unrollAppend([ "str", 0 ], n), 
          e.identical(a, [ "str", 0, 1, 2, 3 ]), e.is(r.arrayIs(a)), e.isNot(r.unrollIs(a)), 
          e.case = "dst is array, second arg makes from argumentsArray", n = r.unrollMake(r.argumentsArrayMake([ 1, 2, "str" ])), 
          a = r.unrollAppend([ "str", 0 ], n), e.identical(a, [ "str", 0, 1, 2, "str" ]), 
          e.is(r.arrayIs(a)), e.isNot(r.unrollIs(a)), 
          //
          e.case = "dst is unroll, second arg is null";
          var l = r.unrollMake([ 1 ]);
          a = r.unrollAppend(l, null), e.identical(a, [ 1, null ]), e.is(r.arrayIs(a)), e.is(r.unrollIs(a)), 
          e.case = "dst is unroll, second arg is unroll", l = r.unrollMake([ 1 ]), a = r.unrollAppend(l, r.unrollMake([ 1, "str" ])), 
          e.identical(a, [ 1, 1, "str" ]), e.is(r.arrayIs(a)), e.is(r.unrollIs(a)), e.case = "dst is unroll, second arg is complex unroll", 
          l = r.unrollMake([ 1 ]), n = r.unrollFrom([ 1, 2, r.unrollMake([ 1, [] ]), r.unrollFrom([ "str", r.unrollMake([ "str2" ]) ]) ]), 
          a = r.unrollAppend(l, n), e.identical(a, [ 1, 1, 2, 1, [], "str", "str2" ]), e.is(r.arrayIs(a)), 
          e.is(r.unrollIs(a)), e.case = "dst is unroll, second arg is array", l = r.unrollMake([ 1 ]), 
          a = r.unrollAppend(l, [ 1, 2, "str" ]), e.identical(a, [ 1, [ 1, 2, "str" ] ]), 
          e.is(r.arrayIs(a)), e.is(r.unrollIs(a)), e.case = "dst is unroll, second arg makes from Float32Array", 
          n = r.unrollMake(new Float32Array([ 1, 2, 3 ])), l = r.unrollMake([ "str", 0 ]), 
          a = r.unrollAppend(l, n), e.identical(a, [ "str", 0, 1, 2, 3 ]), e.is(r.arrayIs(a)), 
          e.is(r.unrollIs(a)), e.case = "dst is unroll, second arg makes from argumentsArray", 
          n = r.unrollMake(r.argumentsArrayMake([ 1, 2, "str" ])), l = r.unrollMake([ "str", 0 ]), 
          a = r.unrollAppend(l, n), e.identical(a, [ "str", 0, 1, 2, "str" ]), e.is(r.arrayIs(a)), 
          e.is(r.unrollIs(a)), 
          //
          e.case = "dst is complex unroll, second arg is null", l = r.unrollFrom([ 1, 2, r.unrollMake([ 1, [] ]), r.unrollFrom([ "str", r.unrollMake([ "str2" ]) ]) ]), 
          a = r.unrollAppend(l, null), e.identical(a, [ 1, 2, 1, [], "str", "str2", null ]), 
          e.is(r.arrayIs(a)), e.is(r.unrollIs(a)), e.case = "dst is complex unroll, second arg is unroll", 
          l = r.unrollFrom([ 1, 2, r.unrollMake([ 1, [] ]), r.unrollFrom([ "str", r.unrollMake([ "str2" ]) ]) ]), 
          a = r.unrollAppend(l, r.unrollMake([ 1, "str" ])), e.identical(a, [ 1, 2, 1, [], "str", "str2", 1, "str" ]), 
          e.is(r.arrayIs(a)), e.is(r.unrollIs(a)), e.case = "dst is complex unroll, second arg is complex unroll", 
          l = r.unrollFrom([ 1, 2, r.unrollMake([ 1, [] ]), r.unrollFrom([ "str", r.unrollMake([ "str2" ]) ]) ]), 
          n = r.unrollFrom([ 1, 2, r.unrollMake([ 1, [] ]), r.unrollFrom([ "str", r.unrollMake([ "str2" ]) ]) ]), 
          a = r.unrollAppend(l, n), e.identical(a, [ 1, 2, 1, [], "str", "str2", 1, 2, 1, [], "str", "str2" ]), 
          e.is(r.arrayIs(a)), e.is(r.unrollIs(a)), e.case = "dst is complex unroll, second arg is array", 
          l = r.unrollFrom([ 1, 2, r.unrollMake([ 1, [] ]), r.unrollFrom([ "str", r.unrollMake([ "str2" ]) ]) ]), 
          a = r.unrollAppend(l, [ 1, 2, "str" ]), e.identical(a, [ 1, 2, 1, [], "str", "str2", [ 1, 2, "str" ] ]), 
          e.is(r.arrayIs(a)), e.is(r.unrollIs(a)), e.case = "dst is complex unroll, second arg makes from Float32Array", 
          l = r.unrollFrom([ 1, 2, r.unrollMake([ 1, [] ]), r.unrollFrom([ "str", r.unrollMake([ "str2" ]) ]) ]), 
          n = r.unrollMake(new Float32Array([ 1, 2, 3 ])), a = r.unrollAppend(l, n), e.identical(a, [ 1, 2, 1, [], "str", "str2", 1, 2, 3 ]), 
          e.is(r.arrayIs(a)), e.is(r.unrollIs(a)), e.case = "dst is complex unroll, second arg makes from argumentsArray", 
          l = r.unrollFrom([ 1, 2, r.unrollMake([ 1, [] ]), r.unrollFrom([ "str", r.unrollMake([ "str2" ]) ]) ]), 
          n = r.unrollMake(r.argumentsArrayMake([ 1, 2, "str" ])), a = r.unrollAppend(l, n), 
          e.identical(a, [ 1, 2, 1, [], "str", "str2", 1, 2, "str" ]), e.is(r.arrayIs(a)), 
          e.is(r.unrollIs(a)), e.close("two arguments"), 
          /* - */
          e.open("three arguments or more"), e.case = "dst is null, complex unrolls", i = r.unrollFrom([ 3, 4, r.unrollFrom([ 5, 6 ]) ]), 
          t = [ 7, r.unrollFrom([ 8, 9 ]) ], a = r.unrollAppend(null, [ 1, 2, i ], [ t, 10 ]), 
          c = [ [ 1, 2, 3, 4, 5, 6 ], [ [ 7, 8, 9 ], 10 ] ], e.identical(a, c), e.isNot(r.unrollIs(a)), 
          e.case = "dst is null, manually unrolled src", i = r.unrollFrom([ 3, 4, r.unrollFrom([ 5, 6 ]) ]), 
          t = [ 7, r.unrollFrom([ 8, 9 ]) ], a = r.unrollAppend(null, 1, 2, i, t, 10), c = [ 1, 2, 3, 4, 5, 6, [ 7, 8, 9 ], 10 ], 
          e.identical(a, c), e.isNot(r.unrollIs(a)), e.case = "dst is null, next args have unroll from argumentsArray", 
          i = [ 7, r.unrollFrom([ 8, 9 ]) ], t = r.unrollFrom(r.argumentsArrayMake([ 3, 4, r.unrollMake([ 5, 6 ]) ])), 
          a = r.unrollAppend(null, [ 1, 2, t ], [ i, 10 ]), c = [ [ 1, 2, 3, 4, 5, 6 ], [ [ 7, 8, 9 ], 10 ] ], 
          e.identical(a, c), e.isNot(r.unrollIs(a)), e.case = "dst is null, next args have unroll from Float32Array", 
          i = [ 7, r.unrollFrom([ 8, 9 ]) ], t = r.unrollFrom(new Float32Array([ 3, 4 ])), 
          a = r.unrollAppend(null, [ 1, 2, t ], [ i, 10 ]), c = [ [ 1, 2, 3, 4 ], [ [ 7, 8, 9 ], 10 ] ], 
          e.identical(a, c), e.isNot(r.unrollIs(a)), e.case = "dst is unroll, complex unrolls", 
          i = r.unrollFrom([ 3, 4, r.unrollFrom([ 5, 6 ]) ]), t = [ 7, r.unrollFrom([ 8, 9 ]) ], 
          a = r.unrollAppend(r.unrollFrom([]), [ 1, 2 ], i, [ t, 10 ]), c = [ [ 1, 2 ], 3, 4, 5, 6, [ [ 7, 8, 9 ], 10 ] ], 
          e.identical(a, c), e.is(r.unrollIs(a)), e.case = "dst is unroll, next args have unroll from argumentsArray", 
          i = [ 7, r.unrollFrom([ 8, 9 ]) ], t = r.unrollFrom(r.argumentsArrayMake([ 3, 4, r.unrollMake([ 5, 6 ]) ])), 
          a = r.unrollAppend(r.unrollMake([ 0 ]), [ 1, 2, t ], [ i, 10 ]), c = [ 0, [ 1, 2, 3, 4, 5, 6 ], [ [ 7, 8, 9 ], 10 ] ], 
          e.identical(a, c), e.is(r.unrollIs(a)), e.case = "dst is unroll, next args have unroll from Float32Array", 
          i = [ 7, r.unrollFrom([ 8, 9 ]) ], t = r.unrollFrom(new Float32Array([ 3, 4 ])), 
          a = r.unrollAppend(r.unrollMake([ 0 ]), [ 1, 2, t ], [ i, 10 ]), c = [ 0, [ 1, 2, 3, 4 ], [ [ 7, 8, 9 ], 10 ] ], 
          e.identical(a, c), e.is(r.unrollIs(a)), e.case = "dst is array, complex unrolls", 
          i = r.unrollFrom([ 3, 4, r.unrollFrom([ 5, 6 ]) ]), t = [ 7, r.unrollFrom([ 8, 9 ]) ], 
          a = r.unrollAppend([], [ 1, 2 ], i, [ t, 10 ]), c = [ [ 1, 2 ], 3, 4, 5, 6, [ [ 7, 8, 9 ], 10 ] ], 
          e.identical(a, c), e.isNot(r.unrollIs(a)), e.case = "dst is array, next args have unroll from argumentsArray", 
          i = [ 7, r.unrollFrom([ 8, 9 ]) ], t = r.unrollFrom(r.argumentsArrayMake([ 3, 4, r.unrollMake([ 5, 6 ]) ])), 
          a = r.unrollAppend([ 0 ], [ 1, 2, t ], [ i, 10 ]), c = [ 0, [ 1, 2, 3, 4, 5, 6 ], [ [ 7, 8, 9 ], 10 ] ], 
          e.identical(a, c), e.isNot(r.unrollIs(a)), e.case = "dst is array, next args have unroll from Float32Array", 
          i = [ 7, r.unrollFrom([ 8, 9 ]) ], t = r.unrollFrom(new Float32Array([ 3, 4 ])), 
          a = r.unrollAppend([ 0 ], [ 1, 2, t ], [ i, 10 ]), c = [ 0, [ 1, 2, 3, 4 ], [ [ 7, 8, 9 ], 10 ] ], 
          e.identical(a, c), e.isNot(r.unrollIs(a)), e.close("three arguments or more"), e.case = "no args", 
          e.shouldThrowErrorSync(function() {
            r.unrollAppend();
          }), e.case = "dst is not an array", e.shouldThrowErrorSync(function() {
            r.unrollAppend(1, 1);
          }), e.shouldThrowErrorSync(function() {
            r.unrollAppend("str", 1);
          }), e.shouldThrowErrorSync(function() {
            r.unrollAppend(void 0, 1);
          });
        }
        //
        ,
        unrollRemove: function unrollRemove(e) {
          e.case = "dst is null";
          var a = r.unrollRemove(null, 0);
          e.equivalent(a, []), e.is(r.arrayIs(a)), e.isNot(r.unrollIs(a)), a = r.unrollRemove(null, "str"), 
          e.equivalent(a, []), e.is(r.arrayIs(a)), e.isNot(r.unrollIs(a)), a = r.unrollRemove(null, null), 
          e.equivalent(a, []), e.is(r.arrayIs(a)), e.isNot(r.unrollIs(a)), a = r.unrollRemove(null, [ 1, 2, "str" ]), 
          e.equivalent(a, []), e.is(r.arrayIs(a)), e.isNot(r.unrollIs(a)), a = r.unrollRemove(null, r.unrollMake([ 1 ])), 
          e.equivalent(a, []), e.is(r.arrayIs(a)), e.isNot(r.unrollIs(a)), e.case = "dst is unroll from null", 
          a = r.unrollRemove(r.unrollMake(null), "str"), e.equivalent(a, []), e.is(r.arrayIs(a)), 
          e.is(r.unrollIs(a)), a = r.unrollRemove(r.unrollMake(null), r.unrollMake([ 1 ])), 
          e.equivalent(a, []), e.is(r.arrayIs(a)), e.is(r.unrollIs(a)), a = r.unrollRemove(r.unrollMake(null), r.unrollMake(null)), 
          e.equivalent(a, []), e.is(r.arrayIs(a)), e.is(r.unrollIs(a)), 
          /* - */
          e.open("dstArray is array"), e.case = "array remove element", a = r.unrollRemove([ 1, 1, 2, "str" ], 1), 
          e.equivalent(a, [ 2, "str" ]), e.is(r.arrayIs(a)), e.isNot(r.unrollIs(a)), a = r.unrollRemove([ 1, 1, 2, "str" ], "str"), 
          e.equivalent(a, [ 1, 1, 2 ]), e.is(r.arrayIs(a)), e.isNot(r.unrollIs(a)), a = r.unrollRemove([ 1, 1, 2, "str", {} ], 0), 
          e.equivalent(a, [ 1, 1, 2, "str", {} ]), e.is(r.arrayIs(a)), e.isNot(r.unrollIs(a)), 
          e.case = "array remove array or object", a = r.unrollRemove([ 1, 1, 2, "str", [ 0 ] ], [ 0 ]), 
          e.equivalent(a, [ 1, 1, 2, "str", [ 0 ] ]), e.is(r.arrayIs(a)), e.isNot(r.unrollIs(a)), 
          a = r.unrollRemove([ 1, 1, 2, "str", {
            a: 1,
            b: "str"
          } ], {
            a: 1,
            b: "str"
          }), e.equivalent(a, [ 1, 1, 2, "str", {
            a: 1,
            b: "str"
          } ]), e.is(r.arrayIs(a)), e.isNot(r.unrollIs(a)), e.case = "array remove elements", 
          a = r.unrollRemove([ 1, 1, 2, "str", [ 1 ] ], 1, [ 1 ]), e.equivalent(a, [ 2, "str", [ 1 ] ]), 
          e.is(r.arrayIs(a)), e.isNot(r.unrollIs(a)), a = r.unrollRemove([ 1, 1, 2, "str", {
            a: 2
          }, "str" ], 0, {
            a: 2
          }, 4, "str"), e.equivalent(a, [ 1, 1, 2, {
            a: 2
          } ]), e.is(r.arrayIs(a)), e.isNot(r.unrollIs(a)), a = r.unrollRemove([ 1, 1, 2, "str", {
            a: 2
          } ], null, void 0, 4, []), e.equivalent(a, [ 1, 1, 2, "str", {
            a: 2
          } ]), e.is(r.arrayIs(a)), e.isNot(r.unrollIs(a)), e.case = "array remove elements included array or object", 
          a = r.unrollRemove([ 1, 1, 2, "str", [ 0 ] ], 1, [ 0 ]), e.equivalent(a, [ 2, "str", [ 0 ] ]), 
          e.is(r.arrayIs(a)), e.isNot(r.unrollIs(a)), a = r.unrollRemove([ 1, 1, 2, "str", {
            a: 1,
            b: "str"
          } ], 2, "str", {
            a: 1,
            b: "str"
          }), e.equivalent(a, [ 1, 1, {
            a: 1,
            b: "str"
          } ]), e.is(r.arrayIs(a)), e.isNot(r.unrollIs(a)), e.case = "array remove unroll", 
          a = r.unrollRemove([ 1, 1, 2, 3, "str", 3 ], r.unrollFrom([ 1, 3 ])), e.equivalent(a, [ 2, "str" ]), 
          e.is(r.arrayIs(a)), e.isNot(r.unrollIs(a)), a = r.unrollRemove([ 1, 2, 1, 3, "str", [ 1 ] ], r.unrollFrom([ 1, 3, "str", [ 1 ] ])), 
          e.equivalent(a, [ 2, [ 1 ] ]), e.is(r.arrayIs(a)), e.isNot(r.unrollIs(a)), a = r.unrollRemove([ 1, 2, 3, "str", [ 1 ] ], r.unrollFrom([ 0, "a", [ 2 ] ])), 
          e.equivalent(a, [ 1, 2, 3, "str", [ 1 ] ]), e.is(r.arrayIs(a)), e.isNot(r.unrollIs(a));
          var n = r.unrollFrom([ 1, r.unrollMake([ 2, 3, r.unrollMake([ "str", [ 1 ] ]) ]) ]);
          a = r.unrollRemove([ 1, 2, 3, "str", [ 1 ] ], n), e.equivalent(a, [ [ 1 ] ]), e.is(r.arrayIs(a)), 
          e.isNot(r.unrollIs(a)), e.close("dstArray is array"), 
          /* - */
          e.open("dstArray is unroll"), e.case = "unroll remove element";
          var i = r.unrollMake([ 1, 1, 2, "str", [ 1 ] ]);
          a = r.unrollRemove(i, 1), e.equivalent(a, [ 2, "str", [ 1 ] ]), e.is(r.arrayIs(a)), 
          e.is(r.unrollIs(a)), i = r.unrollMake([ 1, 1, 2, "str", {
            a: 2
          }, "str" ]), a = r.unrollRemove(i, "str"), e.equivalent(a, [ 1, 1, 2, {
            a: 2
          } ]), e.is(r.arrayIs(a)), e.is(r.unrollIs(a)), i = r.unrollMake([ 1, 1, 2, "str", {
            a: 2
          } ]), a = r.unrollRemove(i, 4), e.equivalent(a, [ 1, 1, 2, "str", {
            a: 2
          } ]), e.is(r.arrayIs(a)), e.is(r.unrollIs(a)), e.case = "unroll remove elements", 
          i = r.unrollMake([ 1, 1, 2, "str", [ 1 ] ]), a = r.unrollRemove(i, 1, [ 1 ]), e.equivalent(a, [ 2, "str", [ 1 ] ]), 
          e.is(r.arrayIs(a)), e.is(r.unrollIs(a)), i = r.unrollMake([ 1, 1, 2, "str", {
            a: 2
          }, "str" ]), a = r.unrollRemove(i, 0, {
            a: 2
          }, 4, "str"), e.equivalent(a, [ 1, 1, 2, {
            a: 2
          } ]), e.is(r.arrayIs(a)), e.is(r.unrollIs(a)), i = r.unrollMake([ 1, 1, 2, "str", {
            a: 2
          } ]), a = r.unrollRemove(i, null, void 0, 4, []), e.equivalent(a, [ 1, 1, 2, "str", {
            a: 2
          } ]), e.is(r.arrayIs(a)), e.is(r.unrollIs(a)), e.case = "unroll remove unroll", 
          i = r.unrollMake([ 1, 1, 2, 3, "str", 3 ]), a = r.unrollRemove(i, r.unrollFrom([ 1, 3 ])), 
          e.equivalent(a, [ 2, "str" ]), e.is(r.arrayIs(a)), e.is(r.unrollIs(a)), i = r.unrollMake([ 1, 2, 1, 3, "str", [ 1 ] ]), 
          a = r.unrollRemove(i, r.unrollFrom([ 1, 3, "str", [ 1 ] ])), e.equivalent(a, [ 2, [ 1 ] ]), 
          e.is(r.arrayIs(a)), e.is(r.unrollIs(a)), i = r.unrollMake([ 1, 2, 3, "str", [ 1 ] ]), 
          a = r.unrollRemove(i, r.unrollFrom([ 0, "a", [ 2 ] ])), e.equivalent(a, [ 1, 2, 3, "str", [ 1 ] ]), 
          e.is(r.arrayIs(a)), e.is(r.unrollIs(a)), n = r.unrollFrom([ 1, r.unrollMake([ 2, 3, r.unrollMake([ "str", [ 1 ] ]) ]) ]), 
          a = r.unrollRemove(r.unrollFrom([ 1, 2, 3, "str", [ 1 ] ]), n), e.equivalent(a, [ [ 1 ] ]), 
          e.is(r.arrayIs(a)), e.is(r.unrollIs(a)), e.close("dstArray is unroll"), e.case = "no args", 
          e.shouldThrowError(function() {
            r.unrollRemove();
          }), e.case = "dst is not an array", e.shouldThrowError(function() {
            r.unrollRemove(1, 1);
          }), e.shouldThrowError(function() {
            r.unrollRemove("str", 1);
          }), e.shouldThrowError(function() {
            r.unrollRemove(void 0, 1);
          });
        }
        // !!!
        ,
        // long
        longAreRepeatedProbe: function longAreRepeatedProbe(e) {
          r.diagnosticEachLongType((a, n) => {
            r.diagnosticEachElementComparator(a, (a, i, t) => {
              r.arrayIs(i) || n.isTyped && i || (e.open(n.name + ", " + t), function group(a, n) {
                e.case = "empty";
                var i = a([]), t = {
                  uniques: 0,
                  condensed: 0,
                  array: []
                }, c = r.longAreRepeatedProbe(i, n);
                e.identical(c, t), e.case = "single", i = a([ 0 ]), t = {
                  uniques: 1,
                  condensed: 1,
                  array: [ 0 ]
                }, c = r.longAreRepeatedProbe(i, n), e.identical(c, t), e.case = "two zeros", i = a([ 0, 0 ]), 
                t = {
                  uniques: 0,
                  condensed: 1,
                  array: [ 1, 1 ]
                }, c = r.longAreRepeatedProbe(i, n), e.identical(c, t), e.case = "none unique", 
                i = a([ 1, 2, 3, 1, 2, 3 ]), t = {
                  uniques: 0,
                  condensed: 3,
                  array: [ 1, 1, 1, 1, 1, 1 ]
                }, c = r.longAreRepeatedProbe(i, n), e.identical(c, t), e.case = "several uniques", 
                i = a([ 0, 1, 2, 3, 4, 1, 2, 3, 5 ]), t = {
                  uniques: 3,
                  condensed: 6,
                  array: [ 0, 1, 1, 1, 0, 1, 1, 1, 0 ]
                }, c = r.longAreRepeatedProbe(i, n), e.identical(c, t);
              }(a, i), e.close(n.name + ", " + t));
            });
          });
        }
        //
        ,
        longAllAreRepeated: function longAllAreRepeated(e) {
          var a = r.longAllAreRepeated([]);
          e.identical(a, !0), a = r.longAllAreRepeated([ 1, 1 ]), e.identical(a, !0), a = r.longAllAreRepeated([ 1 ]), 
          e.identical(a, !1), a = r.longAllAreRepeated([ 1, 2, 2 ]), e.identical(a, !1);
        }
        //
        ,
        longAnyAreRepeated: function longAnyAreRepeated(e) {
          var a = r.longAnyAreRepeated([]);
          e.identical(a, !1), a = r.longAnyAreRepeated([ 1, 1 ]), e.identical(a, !0), a = r.longAnyAreRepeated([ 1 ]), 
          e.identical(a, !1), a = r.longAnyAreRepeated([ 1, 2, 2 ]), e.identical(a, !0);
        }
        //
        ,
        longNoneAreRepeated: function longNoneAreRepeated(e) {
          var a = r.longNoneAreRepeated([]);
          e.identical(a, !0), a = r.longNoneAreRepeated([ 1, 1 ]), e.identical(a, !1), a = r.longNoneAreRepeated([ 1 ]), 
          e.identical(a, !0), a = r.longNoneAreRepeated([ 1, 2, 2 ]), e.identical(a, !1);
        }
        //
        ,
        // array transformer
        arraySub: function arraySub(e) {
          e.case = "nothing";
          var a = r.arraySub([], 0, 0), n = [];
          e.identical(a, n), e.case = "two arguments", a = r.arraySub([], 0), n = [], e.identical(a, n), 
          e.case = "full copy of an array", a = r.arraySub([ 1, 2, 3, 4, 5 ]), n = [ 1, 2, 3, 4, 5 ], 
          e.identical(a, n), e.case = "an array of two elements", a = r.arraySub([ 1, 2, 3, 4, 5 ], 2, 4), 
          n = [ 3, 4 ], e.identical(a, n), e.case = "from second index to the (arr.length - 1)", 
          a = r.arraySub([ 1, 2, 3, 4, 5 ], 2), n = [ 3, 4, 5 ], e.identical(a, n), e.case = "an offset from the end of the sequence", 
          a = r.arraySub([ 1, 2, 3, 4, 5 ], -4), n = [ 2, 3, 4, 5 ], e.identical(a, n), e.case = "the two negative index", 
          a = r.arraySub([ 1, 2, 3, 4, 5 ], -4, -2), n = [ 2, 3 ], e.identical(a, n), e.case = "the third index is negative", 
          a = r.arraySub([ 1, 2, 3, 4, 5 ], 1, -1), n = [ 2, 3, 4 ], e.identical(a, n), e.case = "no arguments", 
          e.shouldThrowErrorSync(function() {
            r.arraySub();
          }), e.case = "first argument is wrong", e.shouldThrowErrorSync(function() {
            r.arraySub("wrong argument", 1, -1);
          }), e.case = "argument is not wrapped into array", e.shouldThrowErrorSync(function() {
            r.arraySub(1, 2, 3, 4, 5, 2, 4);
          }), e.case = "extra argument", e.shouldThrowErrorSync(function() {
            r.arraySub([ 1, 2, 3, 4, 5 ], 2, 4, "redundant argument");
          });
        },
        // arrayJoin,
        arrayGrow: 
        //
        //function arrayJoin( test )
        //{
        //  test.case = 'empty call';
        //  test.identical( _.arrayJoin(), null );
        //
        //  test.case = 'empty arrays';
        //  test.identical( _.arrayJoin( [], [] ), null );
        //
        //  test.case = 'simple';
        //
        //  var src = [ 1 ];
        //  var got = _.arrayJoin( src );
        //  var expected = src;
        //  test.identical( got, expected );
        //
        //  var src = [ 1 ];
        //  var got = _.arrayJoin( src, src );
        //  var expected = [ 1,1 ];
        //  test.identical( got, expected );
        //
        //  test.case = 'array + typedArray';
        //  var got = _.arrayJoin( [ 1 ], new Uint8Array([ 1,2 ]) );
        //  var expected = [ 1,1,2 ];
        //  test.identical( got, expected );
        //
        //  var got = _.arrayJoin( new Uint8Array( [ 1,2 ] ), [ 1 ] );
        //  var expected = new Uint8Array( [ 1,2,1 ] );
        //  test.identical( got, expected );
        //
        //  test.case = 'typedArray + typedArray';
        //  var got = _.arrayJoin( new Uint8Array( [ 1,2 ] ), new Uint8Array( [ 1,2 ] ) );
        //  var expected = new Uint8Array( [ 1,2,1,2 ] );
        //  test.identical( got, expected );
        //
        //  var got = _.arrayJoin( new Uint8Array( [ 1,2 ] ), new Uint16Array( [ 1,2 ] ) );
        //  var expected = new Uint8Array( [ 1,2,1,0,2,0 ] );
        //  test.identical( got, expected );
        //
        //  test.case = 'arrayBuffer + arrayBuffer';
        //  var src = new Uint8Array( [ 1,2 ] );
        //  var got = _.arrayJoin( src.buffer, src.buffer );
        //  test.is( _.bufferRawIs( got ) );
        //  var expected = new Uint8Array( [ 1,2,1,2 ] );
        //  test.identical( new Uint8Array( got ), expected );
        //
        //  test.case = 'arrayBuffer + array';
        //  var src = new Uint8Array( [ 1,2 ] );
        //  var got = _.arrayJoin( src.buffer, [ 1,2 ] );
        //  test.is( _.bufferRawIs( got ) );
        //  var expected = new Uint8Array( [ 1,2,1,2 ] );
        //  test.identical( new Uint8Array( got ), expected );
        //
        //  test.case = 'arrayBuffer + typedArray';
        //  var src = new Uint8Array( [ 1,2 ] );
        //  var got = _.arrayJoin( src.buffer, src );
        //  test.is( _.bufferRawIs( got ) );
        //  var expected = new Uint8Array( [ 1,2,1,2 ] );
        //  test.identical( new Uint8Array( got ), expected );
        //
        //  test.case = 'typedArray + arrayBuffer';
        //  var src = new Uint8Array( [ 1,2 ] );
        //  var got = _.arrayJoin( src, src.buffer );
        //  var expected = new Uint8Array( [ 1,2,1,2 ] );
        //  test.identical( got, expected );
        //
        //  test.case = 'typedArray + arrayBuffer + array';
        //  var src = new Uint8Array( [ 1 ] );
        //  var got = _.arrayJoin( src, src.buffer, [ 1 ] );
        //  var expected = new Uint8Array( [ 1,1,1 ] );
        //  test.identical( got, expected );
        //
        //  test.case = 'array + typedArray + arrayBuffer';
        //  var src = new Uint8Array( [ 1 ] );
        //  var got = _.arrayJoin( [ 1 ], src, src.buffer );
        //  var expected = [ 1,1,1 ];
        //  test.identical( got, expected );
        //
        //  test.case = 'arrayBuffer + array + typedArray';
        //  var src = new Uint8Array( [ 1 ] );
        //  var got = _.arrayJoin( src.buffer, [ 1 ], src  );
        //  test.is( _.bufferRawIs( got ) );
        //  var expected = new Uint8Array( [ 1,1,1 ] );
        //  test.identical( new Uint8Array( got ), expected );
        //
        //  if( Config.platform === 'nodejs' )
        //  {
        //    test.case = 'buffer';
        //    var got = _.arrayJoin( Buffer.from( '1' ), [ 1 ] );
        //    var expected = Buffer.from( [ 49,1 ] );
        //    test.identical( got, expected );
        //
        //    test.case = 'buffer + arrayBuffer';
        //    var raw = new Uint8Array( [ 1 ] ).buffer;
        //    var got = _.arrayJoin( Buffer.from( '1' ), raw );
        //    var expected = Buffer.from( [ 49,1 ] );
        //    test.identical( got, expected );
        //
        //    test.case = 'buffer + typedArray';
        //    var typed = new Uint8Array( [ 1 ] );
        //    var got = _.arrayJoin( Buffer.from( '1' ), typed );
        //    var expected = Buffer.from( [ 49,1 ] );
        //    test.identical( got, expected );
        //
        //    test.case = 'buffer + typedArray + raw + array';
        //    var typed = new Uint8Array( [ 1 ] );
        //    var got = _.arrayJoin( Buffer.from( '1' ), typed, typed.buffer, [ 1 ] );
        //    var expected = Buffer.from( [ 49,1,1,1 ] );
        //    test.identical( got, expected );
        //
        //    test.case = 'typedArray + buffer + raw + array';
        //    var typed = new Uint8Array( [ 1 ] );
        //    var got = _.arrayJoin( typed, Buffer.from( '1' ), typed.buffer, [ 1 ] );
        //    var expected = new Uint8Array( [ 1,49,1,1 ] );
        //    test.identical( got, expected );
        //
        //    test.case = 'raw + typedArray + buffer + array';
        //    var typed = new Uint8Array( [ 1 ] );
        //    var got = _.arrayJoin( typed.buffer, typed, Buffer.from( '1' ), [ 1 ] );
        //    var expected = new Uint8Array( [ 1,1,49,1 ] );
        //    test.identical( new Uint8Array( got ), expected );
        //
        //    test.case = 'array + raw + typedArray + buffer ';
        //    var typed = new Uint8Array( [ 1 ] );
        //    var got = _.arrayJoin( [ 1 ], typed.buffer, typed, Buffer.from( '1' )  );
        //    var expected = new Uint8Array( [ 1,1,1,49 ] );
        //    test.identical( new Uint8Array( got ), expected );
        //  }
        //
        //  if( !Config.debug )
        //  return;
        //
        //  test.shouldThrowErrorSync( () => _.arrayJoin( [ 1 ], '1' ) );
        //  test.shouldThrowErrorSync( () => _.arrayJoin( [ 1 ], { byteLength : 5 } ) );
        //
        //}
        //
        function arrayGrow(e) {
          var a = [ 1, 2, 3, 4, 5 ];
          //
          if (e.case = "defaults", 
          /* default call returns copy */
          n = r.arrayGrow(a), i = a, e.identical(n, i), e.case = "increase size of array", 
          /* without setting value */
          n = r.arrayGrow(a, 0, a.length + 2), i = a.length + 2, e.identical(n.length, i), 
          /* by setting value */
          n = r.arrayGrow(a, 0, a.length + 2, 0), i = [ 1, 2, 3, 4, 5, 0, 0 ], e.identical(n, i), 
          /* by taking only last element of source array */
          n = r.arrayGrow(a, a.length - 1, 2 * a.length, 0), i = [ 5, 0, 0, 0, 0, 0 ], e.identical(n, i), 
          e.case = "decrease size of array", 
          /**/
          n = r.arrayGrow(a, 0, 3), i = [ 1, 2, 3 ], e.identical(n, i), 
          /* setting value not affects on array */
          n = r.arrayGrow(a, 0, 3, 0), i = [ 1, 2, 3 ], e.identical(n, i), 
          /* begin index is negative */
          n = r.arrayGrow(a, -1, 3), i = [ void 0, 1, 2, 3 ], e.identical(n, i), 
          /* end index is negative */
          n = r.arrayGrow(a, 0, -1), i = [], e.identical(n, i), 
          /* begin index negative, set value */
          n = r.arrayGrow(a, -1, 3, 0), i = [ 0, 1, 2, 3 ], e.identical(n, i), "nodejs" === Config.platform) {
            e.case = "buffer";
            var n = r.arrayGrow(Buffer.from("123"), 0, 5, 0), i = [ 49, 50, 51, 0, 0 ];
            e.identical(n, i);
          }
          //
                    e.case = "invalid arguments type", 
          /**/
          e.shouldThrowErrorSync(function() {
            r.arrayGrow(1);
          })
          /**/ , e.shouldThrowErrorSync(function() {
            r.arrayGrow(a, "1", a.length);
          })
          /**/ , e.shouldThrowErrorSync(function() {
            r.arrayGrow(a, 0, "1");
          });
        },
        arrayResize: function arrayResize(e) {
          e.case = "defaults";
          var a, n = [ 1, 2, 3, 4, 5, 6, 7 ];
          /* Buffer */
          if (n.src = !0, 
          /* just pass array */
          i = r.arrayResize(n), e.identical(i.src, void 0), e.identical(i, n), 
          //
          e.case = "make copy of source", 
          /* third argument is not provided */
          i = r.arrayResize(n, 2), e.identical(i.src, void 0), t = [ 3, 4, 5, 6, 7 ], e.identical(i, t), 
          /* second argument is undefined */
          i = r.arrayResize(n, void 0, 4), e.identical(i.src, void 0), t = [ 1, 2, 3, 4 ], 
          e.identical(i, t), 
          /**/
          i = r.arrayResize(n, 0, 3), e.identical(i.src, void 0), t = [ 1, 2, 3 ], e.identical(i, t), 
          /* from two to six */
          e.case = "from two to six", i = r.arrayResize(n, 2, 6), e.identical(i.src, void 0), 
          t = [ 3, 4, 5, 6 ], e.identical(i, t), 
          /* rigth bound is negative */
          i = r.arrayResize(n, 0, -1), e.identical(i.src, void 0), t = [], e.identical(i, t), 
          /* both bounds are negative */
          i = r.arrayResize(n, -1, -3), e.identical(i.src, void 0), t = [], e.identical(i, t), 
          (a = new Uint16Array(n)).src = !0, i = r.arrayResize(a, 0, 3), e.identical(i.src, void 0), 
          t = new Uint16Array([ 1, 2, 3 ]), e.identical(i, t), "nodejs" === Config.platform) {
            e.case = "buffer";
            var i = r.arrayResize(Buffer.from("123"), 0, 5, 0), t = [ 49, 50, 51, 0, 0 ];
            e.identical(i, t);
          }
          /**/          e.case = "increase size of array", 
          /* rigth bound is out of range */
          i = r.arrayResize(n, 0, n.length + 2), e.identical(i.src, void 0), (t = n.slice()).push(void 0, void 0), 
          e.identical(i, t), 
          /* indexes are out of bound */
          i = r.arrayResize(n, n.length + 1, n.length + 3), e.identical(i.src, void 0), t = [ void 0, void 0 ], 
          e.identical(i, t), 
          /* left bound is negative */
          i = r.arrayResize(n, -1, n.length), e.identical(i.src, void 0), (t = n.slice()).unshift(void 0), 
          e.identical(i, t), 
          /* without setting value */
          i = r.arrayResize(n, 0, n.length + 2), e.identical(i.src, void 0), e.identical(i.length, n.length + 2), 
          /* by setting value */
          i = r.arrayResize(n, 0, n.length + 2, 0), e.identical(i.src, void 0), t = [ 1, 2, 3, 4, 5, 6, 7, 0, 0 ], 
          e.identical(i, t), 
          /* by taking only last element of source array */
          i = r.arrayResize(n, n.length - 1, n.length + 2, 0), e.identical(i.src, void 0), 
          t = [ 7, 0, 0 ], e.identical(i, t), e.case = "decrease size of array", 
          /* setting value not affects on array */
          i = r.arrayResize(n, 0, 3, 0), e.identical(i.src, void 0), t = [ 1, 2, 3 ], e.identical(i, t), 
          /* begin index is negative */
          i = r.arrayResize(n, -1, 3, 0), e.identical(i.src, void 0), t = [ 0, 1, 2, 3 ], 
          e.identical(i, t), 
          /* end index is negative */
          i = r.arrayResize(n, 0, -1), e.identical(i.src, void 0), t = [], e.identical(i, t), 
          /* begin index negative, set value */
          i = r.arrayResize(n, -1, 3, 0), e.identical(i.src, void 0), t = [ 0, 1, 2, 3 ], 
          e.identical(i, t), (a = new Uint16Array(n)).src = !0, i = r.arrayResize(a, 0, 4, 4), 
          e.identical(i.src, void 0), t = new Uint16Array([ 1, 2, 3, 4 ]), e.identical(i, t), 
          //
          "nodejs" === Config.platform && (e.case = "buffer", i = r.arrayResize(Buffer.from("123"), 0, 5, 0), 
          t = [ 49, 50, 51, 0, 0 ], e.identical(i, t)), e.case = "no arguments", e.shouldThrowErrorSync(function() {
            r.arrayResize();
          }), 
          /**/
          e.case = "invalid arguments type", 
          /**/
          e.shouldThrowErrorSync(function() {
            r.arrayResize(1);
          })
          /**/ , e.shouldThrowErrorSync(function() {
            r.arrayResize(n, "1", n.length);
          })
          /**/ , e.shouldThrowErrorSync(function() {
            r.arrayResize(n, 0, "1");
          })
          /**/ , e.case = "buffer", 
          /**/
          i = r.arrayResize(Buffer.from("123"), 0, 1), t = [ 49 ], e.identical(i, t), 
          //
          e.case = "wrong type of argument", e.shouldThrowErrorSync(function() {
            r.arrayResize("wrong argument", "wrong argument", "wrong argument");
          });
        },
        longSlice: longSlice,
        arrayDuplicate: 
        //
        function arrayDuplicate(e) {
          e.case = "couple of repeats";
          var a = r.arrayDuplicate([ "a", "b", "c" ]), n = [ "a", "a", "b", "b", "c", "c" ];
          e.identical(a, n), 
          /* */
          e.case = "numberOfAtomsPerElement 1 numberOfDuplicatesPerElement 1";
          var i = {
            src: [ 10, 20 ],
            numberOfAtomsPerElement: 1,
            numberOfDuplicatesPerElement: 1
          };
          a = r.arrayDuplicate(i), n = [ 10, 20 ], e.identical(a, n), 
          /* */
          e.case = "numberOfAtomsPerElement 1 numberOfDuplicatesPerElement 2", i = {
            src: [ 10, 20 ],
            numberOfAtomsPerElement: 1,
            numberOfDuplicatesPerElement: 2
          }, a = r.arrayDuplicate(i), n = [ 10, 10, 20, 20 ], e.identical(a, n), 
          /* */
          e.case = "numberOfAtomsPerElement 2 numberOfDuplicatesPerElement 1", i = {
            src: [ 10, 20 ],
            numberOfAtomsPerElement: 2,
            numberOfDuplicatesPerElement: 1
          }, a = r.arrayDuplicate(i), n = [ 10, 20 ], e.identical(a, n), 
          /* */
          e.case = "numberOfAtomsPerElement 2 numberOfDuplicatesPerElement 2", i = {
            src: [ 10, 20 ],
            numberOfAtomsPerElement: 2,
            numberOfDuplicatesPerElement: 2
          }, a = r.arrayDuplicate(i), n = [ 10, 20, 10, 20 ], e.identical(a, n), 
          /* */
          e.case = "result provided", i = {
            src: [ 10, 20 ],
            result: [ 1, 1, 1, 1 ],
            numberOfAtomsPerElement: 1,
            numberOfDuplicatesPerElement: 2
          }, a = r.arrayDuplicate(i), n = [ 10, 10, 20, 20 ], e.identical(a, n), 
          /* */
          e.case = "different options", i = {
            src: [ "abc", "def" ],
            result: new Array(6),
            numberOfAtomsPerElement: 2,
            numberOfDuplicatesPerElement: 3
          }, a = r.arrayDuplicate(i), n = [ "abc", "def", "abc", "def", "abc", "def" ], e.identical(a, n), 
          /* */
          e.case = "different options", i = {
            src: [ "abc", "def" ],
            result: [],
            numberOfAtomsPerElement: 1,
            numberOfDuplicatesPerElement: 1
          }, a = r.arrayDuplicate(i), n = [ "abc", "def" ], e.identical(a, n), 
          /* */
          e.case = "different options", i = {
            src: [ "abc", "def" ],
            result: [ 1, 2 ],
            numberOfAtomsPerElement: 1,
            numberOfDuplicatesPerElement: 1
          }, a = r.arrayDuplicate(i), n = [ 1, 2, "abc", "def" ], e.identical(a, n), 
          /* */
          e.case = "different options";
          var t = new Uint8Array(1);
          t[0] = 5, i = {
            src: [ 1, 2 ],
            result: t,
            numberOfAtomsPerElement: 1,
            numberOfDuplicatesPerElement: 1
          }, a = r.arrayDuplicate(i), n = [ 5, 1, 2 ];
          for (var c = !0, l = 0; l < n.length; l++) n[l] !== a[l] && (c = !1);
          e.is(c), e.identical(a.length, n.length), 
          /* */
          e.case = "second argument is replaced and non-existent elements from options.src is replaced undefined", 
          i = {
            src: [ "abc", "def", void 0 ],
            numberOfAtomsPerElement: 3,
            numberOfDuplicatesPerElement: 3
          }, a = r.arrayDuplicate(i), n = [ "abc", "def", void 0, "abc", "def", void 0, "abc", "def", void 0 ], 
          e.identical(a, n), e.case = "no arguments", e.shouldThrowErrorSync(function() {
            r.arrayDuplicate();
          }), e.case = "second argument is wrong", e.shouldThrowErrorSync(function() {
            r.arrayDuplicate([ "a", "b", "c" ], "wrong argument");
          }), e.case = 'options.src is not provided or "undefined"', i = {
            src: void 0,
            result: [],
            numberOfAtomsPerElement: 3,
            numberOfDuplicatesPerElement: 3
          }, e.shouldThrowErrorSync(function() {
            r.arrayDuplicate(i, {
              a: 13
            });
          }), e.case = "result provided, but not enough length", i = {
            src: [ 10, 20 ],
            result: [],
            numberOfAtomsPerElement: 1,
            numberOfDuplicatesPerElement: 2
          }, e.shouldThrowErrorSync(function() {
            r.arrayDuplicate(i);
          });
        },
        arrayMask: 
        //
        function arrayMask(e) {
          e.case = "nothing";
          var a = r.arrayMask([ 1, 2, 3, 4 ], [ void 0, null, 0, "" ]), n = [];
          e.identical(a, n), e.case = "adds last three values", a = r.arrayMask([ "a", "b", "c", 4, 5 ], [ 0, "", 1, 2, 3 ]), 
          n = [ "c", 4, 5 ], e.identical(a, n), e.case = "adds the certain values", a = r.arrayMask([ "a", "b", "c", 4, 5, "d" ], [ 3, 7, 0, "", 13, 33 ]), 
          n = [ "a", "b", 5, "d" ], e.identical(a, n), e.case = "no arguments", e.shouldThrowErrorSync(function() {
            r.arrayMask();
          }), e.case = "not enough arguments", e.shouldThrowErrorSync(function() {
            r.arrayMask([ 1, 2, 3, 4 ]);
          }), e.case = "extra argument", e.shouldThrowErrorSync(function() {
            r.arrayMask([ "a", "b", "c", 4, 5 ], [ 0, "", 1, 2, 3 ], "redundant argument");
          }), e.case = "wrong type of arguments", e.shouldThrowErrorSync(function() {
            r.arrayMask("wrong argument", "wrong argument");
          }), e.case = "both arrays are empty", e.shouldThrowErrorSync(function() {
            r.arrayMask([], []);
          }), e.case = "length of the first array is not equal to the second array", e.shouldThrowErrorSync(function() {
            r.arrayMask([ 1, 2, 3 ], [ void 0, null, 0, "" ]);
          }), e.case = "length of the second array is not equal to the first array", e.shouldThrowErrorSync(function() {
            r.arrayMask([ 1, 2, 3, 4 ], [ void 0, null, 0 ]);
          });
        }
        //
        ,
        longUnduplicate: function longUnduplicate(e) {
          /* */
          function evaluator(r) {
            return r.v;
          }
          function equalizer(r, e) {
            return r.v === e.v;
          }
          /* */
          e.case = "dst=empty, two args";
          var a = [], n = void 0, i = r.longUnduplicate(a, n), t = [];
          e.identical(i, t), e.is(i === a), e.is(i !== n), e.case = "dst=empty, single arg", 
          a = [], n = void 0, i = r.longUnduplicate(a), t = [], e.identical(i, t), e.is(i === a), 
          e.is(i !== n), e.case = "src=empty", a = null, n = [], i = r.longUnduplicate(a, n), 
          t = [], e.identical(i, t), e.is(i !== a), e.is(i !== n), e.case = "dst=empty, src=empty", 
          a = [], n = [], i = r.longUnduplicate(a, n), t = [], e.identical(i, t), e.is(i === a), 
          e.is(i !== n), 
          /* */
          e.case = "dst=array", a = [ 1, 1, 2, 3, 3, 4, 5, 5 ], n = void 0, i = r.longUnduplicate(a, n), 
          t = [ 1, 2, 3, 4, 5 ], e.identical(i, t), e.is(i === a), e.is(i !== n), e.case = "src=array", 
          a = null, n = [ 2, 2, 4, 4, 6, 6 ], i = r.longUnduplicate(a, n), t = [ 2, 4, 6 ], 
          e.identical(i, t), e.is(i !== a), e.is(i !== n), e.case = "dst=array, src=array", 
          a = [ 1, 1, 2, 3, 3, 4, 5, 5 ], n = [ 2, 2, 4, 4, 6, 6 ], i = r.longUnduplicate(a, n), 
          t = [ 1, 2, 3, 4, 5, 6 ], e.identical(i, t), e.is(i === a), e.is(i !== n), 
          /* */
          e.case = "dst=F32x", a = [ 1, 1, 2, 3, 3, 4, 5, 5 ], n = void 0, i = r.longUnduplicate(a, n), 
          t = [ 1, 2, 3, 4, 5 ], e.identical(i, t), e.is(i === a), e.is(i !== n), e.case = "src=F32x", 
          a = null, n = new F32x([ 2, 2, 4, 4, 6, 6 ]), i = r.longUnduplicate(a, n), t = new F32x([ 2, 4, 6 ]), 
          e.identical(i, t), e.is(i !== a), e.is(i !== n), e.is(i instanceof F32x), e.case = "dst=F32x, src=F32x", 
          a = [ 1, 1, 2, 3, 3, 4, 5, 5 ], n = new F32x([ 2, 2, 4, 4, 6, 6 ]), i = r.longUnduplicate(a, n), 
          t = [ 1, 2, 3, 4, 5, 6 ], e.identical(i, t), e.is(i === a), e.is(i !== n), 
          /* */
          e.case = "dst=array, with evaluator", a = null, n = [ {
            v: 2
          }, {
            v: 2
          }, {
            v: 4
          }, {
            v: 4
          }, {
            v: 6
          }, {
            v: 6
          } ], i = r.longUnduplicate(a, n, evaluator), t = [ {
            v: 2
          }, {
            v: 4
          }, {
            v: 6
          } ], e.identical(i, t), e.is(i !== a), e.is(i !== n), e.case = "dst=array, src=undefined, with evaluator", 
          a = [ {
            v: 1
          }, {
            v: 1
          }, {
            v: 2
          }, {
            v: 3
          }, {
            v: 3
          }, {
            v: 4
          }, {
            v: 5
          }, {
            v: 5
          } ], n = void 0, i = r.longUnduplicate(a, n, evaluator), t = [ {
            v: 1
          }, {
            v: 2
          }, {
            v: 3
          }, {
            v: 4
          }, {
            v: 5
          } ], e.identical(i, t), e.is(i === a), e.is(i !== n), e.case = "dst=array, src=undefined, with evaluator in 2th argument", 
          a = [ {
            v: 1
          }, {
            v: 1
          }, {
            v: 2
          }, {
            v: 3
          }, {
            v: 3
          }, {
            v: 4
          }, {
            v: 5
          }, {
            v: 5
          } ], n = void 0, i = r.longUnduplicate(a, evaluator), t = [ {
            v: 1
          }, {
            v: 2
          }, {
            v: 3
          }, {
            v: 4
          }, {
            v: 5
          } ], e.identical(i, t), e.is(i === a), e.is(i !== n), e.case = "dst=array, src=array, with evaluator", 
          a = [ {
            v: 1
          }, {
            v: 1
          }, {
            v: 2
          }, {
            v: 3
          }, {
            v: 3
          }, {
            v: 4
          }, {
            v: 5
          }, {
            v: 5
          } ], n = [ {
            v: 2
          }, {
            v: 2
          }, {
            v: 4
          }, {
            v: 4
          }, {
            v: 6
          }, {
            v: 6
          } ], i = r.longUnduplicate(a, n, evaluator), t = [ {
            v: 1
          }, {
            v: 2
          }, {
            v: 3
          }, {
            v: 4
          }, {
            v: 5
          }, {
            v: 6
          } ], e.identical(i, t), e.is(i === a), e.is(i !== n), 
          /* */
          e.case = "dst=array, with equalizer", a = null, n = [ {
            v: 2
          }, {
            v: 2
          }, {
            v: 4
          }, {
            v: 4
          }, {
            v: 6
          }, {
            v: 6
          } ], i = r.longUnduplicate(a, n, equalizer), t = [ {
            v: 2
          }, {
            v: 4
          }, {
            v: 6
          } ], e.identical(i, t), e.is(i !== a), e.is(i !== n), e.case = "dst=array, src=undefined, with equalizer", 
          a = [ {
            v: 1
          }, {
            v: 1
          }, {
            v: 2
          }, {
            v: 3
          }, {
            v: 3
          }, {
            v: 4
          }, {
            v: 5
          }, {
            v: 5
          } ], n = void 0, i = r.longUnduplicate(a, n, equalizer), t = [ {
            v: 1
          }, {
            v: 2
          }, {
            v: 3
          }, {
            v: 4
          }, {
            v: 5
          } ], e.identical(i, t), e.is(i === a), e.is(i !== n), e.case = "dst=array, src=undefined, with equalizer in 2th argument", 
          a = [ {
            v: 1
          }, {
            v: 1
          }, {
            v: 2
          }, {
            v: 3
          }, {
            v: 3
          }, {
            v: 4
          }, {
            v: 5
          }, {
            v: 5
          } ], n = void 0, i = r.longUnduplicate(a, equalizer), t = [ {
            v: 1
          }, {
            v: 2
          }, {
            v: 3
          }, {
            v: 4
          }, {
            v: 5
          } ], e.identical(i, t), e.is(i === a), e.is(i !== n), e.case = "dst=array, src=array, with equalizer", 
          a = [ {
            v: 1
          }, {
            v: 1
          }, {
            v: 2
          }, {
            v: 3
          }, {
            v: 3
          }, {
            v: 4
          }, {
            v: 5
          }, {
            v: 5
          } ], n = [ {
            v: 2
          }, {
            v: 2
          }, {
            v: 4
          }, {
            v: 4
          }, {
            v: 6
          }, {
            v: 6
          } ], i = r.longUnduplicate(a, n, equalizer), t = [ {
            v: 1
          }, {
            v: 2
          }, {
            v: 3
          }, {
            v: 4
          }, {
            v: 5
          }, {
            v: 6
          } ], e.identical(i, t), e.is(i === a), e.is(i !== n);
        }
        //
        ,
        arraySelect: function arraySelect(e) {
          e.case = "nothing";
          var a = r.arraySelect([], []), n = [];
          e.identical(a, n), e.case = "certain elements", a = r.arraySelect([ 1, 2, 3, 4, 5 ], [ 2, 3, 4 ]), 
          n = [ 3, 4, 5 ], e.identical(a, n), e.case = "array of undefined", a = r.arraySelect([ 1, 2, 3 ], [ 4, 5 ]), 
          n = [ void 0, void 0 ], e.identical(a, n), e.case = "using object", a = r.arraySelect([ 1, 1, 2, 2, 3, 3 ], {
            atomsPerElement: 2,
            indices: [ 0, 1, 2 ]
          }), n = [ 1, 1, 2, 2, 3, 3 ], e.identical(a, n), e.case = "no arguments", e.shouldThrowErrorSync(function() {
            r.arraySelect();
          }), e.case = "not enough arguments", e.shouldThrowErrorSync(function() {
            r.arraySelect([ 1, 2, 3 ]);
          }), e.case = "wrong type of arguments", e.shouldThrowErrorSync(function() {
            r.arraySelect("wrong argument", "wrong argument");
          }), e.case = "arguments are not wrapped into array", e.shouldThrowErrorSync(function() {
            r.arraySelect(1, 2, 3, 4, 5);
          });
        },
        // array manipulator
        arraySwap: 
        //
        function arraySwap(e) {
          e.case = "an element";
          var a = r.arraySwap([ 7 ], 0, 0), n = [ 7 ];
          e.identical(a, n), e.case = "reverses first index and last index", a = r.arraySwap([ 1, 2, 3, 4, 5 ], 0, 4), 
          n = [ 5, 2, 3, 4, 1 ], e.identical(a, n), e.case = "swaps first two", a = r.arraySwap([ 1, 2, 3 ]), 
          n = [ 2, 1, 3 ], e.identical(a, n), e.case = "no arguments", e.shouldThrowErrorSync(function() {
            r.arraySwap();
          }), e.case = "wrong type of arguments", e.shouldThrowErrorSync(function() {
            r.arraySwap("wrong argument", "wrong argument", "wrong argument");
          }), e.case = "arguments[1] and arguments[2] are out of bound", e.shouldThrowErrorSync(function() {
            r.arraySwap([ 1, 2, 3, 4, 5 ], -1, -4);
          }), e.case = "first five arguments are not wrapped into array", e.shouldThrowErrorSync(function() {
            r.arraySwap(1, 2, 3, 4, 5, 0, 4);
          });
        },
        arrayCutin: 
        //
        function arrayCutin(e) {
          debugger;
          e.case = "range as single number";
          /* */
          var a = [ 1, 2, 3, 4 ], n = r.arrayCutin(a, 2), i = [ 3 ];
          e.identical(n, i), e.identical(a, [ 1, 2, 4 ])
          /* */ , a = [ 1, 2, 3, 4 ], n = r.arrayCutin(a, -1), i = [], e.identical(n, i), 
          e.identical(a, [ 1, 2, 3, 4 ])
          /* */ , a = [ 1, 2, 3, 4 ], n = r.arrayCutin(a, 0, [ 0 ]), i = [ 1 ], e.identical(n, i), 
          e.identical(a, [ 0, 2, 3, 4 ])
          /* */ , a = [ 1, 2, 3, 4 ], n = r.arrayCutin(a, 0, []), i = [ 1 ], e.identical(n, i), 
          e.identical(a, [ 2, 3, 4 ])
          /* */ , a = [ 1, 2, 3, 4 ], n = r.arrayCutin(a, [ 0 ], []), i = [ 1, 2, 3, 4 ], 
          e.identical(n, i), e.identical(a, [])
          /* */ , i = (a = [ 1, 2, 3, 4 ]).slice().splice(1), n = r.arrayCutin(a, [ 1 ], [ 5 ]), 
          e.identical(n, i), e.identical(a, [ 1, 5 ])
          /* */ , a = [ 1, 2, 3, 4 ], n = r.arrayCutin(a, [ void 0, 1 ], [ 5 ]), e.identical(n, [ 1 ]), 
          e.identical(a, [ 5, 2, 3, 4 ]), 
          //
          e.case = "empth", a = [];
          var t = r.arrayCutin([], [], []);
          e.identical(t, []), e.identical(a, []), 
          /* */
          e.case = "remove two elements", a = [ 1, 2, 3, 4, 5 ], t = r.arrayCutin(a, [ 1, 3 ], []), 
          i = [ 1, 4, 5 ], e.identical(a, i), i = [ 2, 3 ], e.identical(t, i), 
          /* */
          e.case = "remove two elements and incut three", a = [ 1, 2, 3, 4, 5 ], t = r.arrayCutin(a, [ 1, 3 ], [ 11, 22, 33 ]), 
          i = [ 1, 11, 22, 33, 4, 5 ], e.identical(a, i), i = [ 2, 3 ], e.identical(t, i), 
          /* */
          e.case = "pass only begin of range", a = [ 1, 2, 3, 4, 5 ], t = r.arrayCutin(a, [ 1 ], [ 11, 22, 33 ]), 
          i = [ 1, 11, 22, 33 ], e.identical(a, i), i = [ 2, 3, 4, 5 ], e.identical(t, i), 
          /* */
          e.case = "pass empty range", a = [ 1, 2, 3, 4, 5 ], t = r.arrayCutin(a, [], [ 11, 22, 33 ]), 
          i = [ 11, 22, 33 ], e.identical(a, i), i = [ 1, 2, 3, 4, 5 ], e.identical(t, i), 
          /* */
          e.case = "pass number instead of range", a = [ 1, 2, 3, 4, 5 ], t = r.arrayCutin(a, 1, [ 11, 22, 33 ]), 
          i = [ 1, 11, 22, 33, 3, 4, 5 ], e.identical(a, i), i = [ 2 ], e.identical(t, i), 
          /* */
          e.case = "no source, number istead of range", a = [ 1, 2, 3, 4, 5 ], t = r.arrayCutin(a, 1), 
          i = [ 1, 3, 4, 5 ], e.identical(a, i), i = [ 2 ], e.identical(t, i), 
          /* */
          e.case = "no source", a = [ 1, 2, 3, 4, 5 ], t = r.arrayCutin(a, [ 1, 3 ]), i = [ 1, 4, 5 ], 
          e.identical(a, i), i = [ 2, 3 ], e.identical(t, i), 
          /* */
          e.case = "out of bound, begin", a = [ 1, 2, 3, 4, 5 ], t = r.arrayCutin(a, [ -10, 2 ], [ 11, 22, 33 ]), 
          i = [ 11, 22, 33, 3, 4, 5 ], e.identical(a, i), i = [ 1, 2 ], e.identical(t, i), 
          /* */
          e.case = "out of bound, end", a = [ 1, 2, 3, 4, 5 ], t = r.arrayCutin(a, [ 3, 10 ], [ 11, 22, 33 ]), 
          i = [ 1, 2, 3, 11, 22, 33 ], e.identical(a, i), i = [ 4, 5 ], e.identical(t, i), 
          /* */
          e.case = "out of bound, both sides", a = [ 1, 2, 3, 4, 5 ], t = r.arrayCutin(a, [ -10, 10 ], [ 11, 22, 33 ]), 
          i = [ 11, 22, 33 ], e.identical(a, i), i = [ 1, 2, 3, 4, 5 ], e.identical(t, i), 
          /* */
          e.case = "negative, both sides", a = [ 1, 2, 3, 4, 5 ], t = r.arrayCutin(a, [ -1, -1 ], [ 11, 22, 33 ]), 
          i = a, e.identical(a, i), i = [], e.identical(t, i), 
          /* */
          e.case = "zero, both sides", a = [ 1, 2, 3, 4, 5 ], t = r.arrayCutin(a, [ 0, 0 ], [ 11, 22, 33 ]), 
          i = a, e.identical(a, i), i = [], e.identical(t, i), 
          /* first > last */
          e.case = "first > last", a = [ 1, 2, 3, 4, 5 ], t = r.arrayCutin(a, [ 9, 0 ], [ 11, 22, 33 ]), 
          i = a, e.identical(a, i), i = [], e.identical(t, i);
          /* Buffers */
          var c = [ Int8Array, Uint8Array, Uint8ClampedArray, Int16Array, Uint16Array, Int32Array, Uint32Array, Float32Array, Float64Array, ArrayBuffer ];
          "nodejs" === Config.platform && c.push(Buffer);
          for (var l = 0; l < c.length; l++) {
            e.case = "buffers: " + c[l].name;
            for (var o = new c[l](5), s = 0; s < 5; s++) o[s] = s + 1;
            //array [ 1,2,3,4,5 ]
            /* simple cut */            n = r.arrayCutin(o, 0), i = [ 2, 3, 4, 5 ], i = r.arrayCutin(new c[l](1), 0, i), 
            e.identical(n, i), n = r.arrayCutin(o, 0, [ 9 ]), i = [ 9, 2, 3, 4, 5 ], i = r.arrayCutin(new c[l](1), 0, i), 
            e.identical(n, i), n = r.arrayCutin(o, 4), i = [ 1, 2, 3, 4 ], i = r.arrayCutin(new c[l](1), 0, i), 
            e.identical(n, i), n = r.arrayCutin(o, [ 0, 1 ]), i = [ 2, 3, 4, 5 ], i = r.arrayCutin(new c[l](1), 0, i), 
            e.identical(n, i), n = r.arrayCutin(o, [ 2, 5 ]), i = [ 1, 2 ], i = r.arrayCutin(new c[l](1), 0, i), 
            e.identical(n, i), n = r.arrayCutin(o, 4, [ 6, 7 ]), i = [ 1, 2, 3, 4, 6, 7 ], i = r.arrayCutin(new c[l](1), 0, i), 
            e.identical(n, i), n = r.arrayCutin(o, [ 4, 5 ], [ 6, 7 ]), i = [ 1, 2, 3, 4, 6, 7 ], 
            i = r.arrayCutin(new c[l](1), 0, i), e.identical(n, i), n = r.arrayCutin(o, 10, [ 6, 7 ]), 
            i = o, e.identical(n, i), n = r.arrayCutin(o, [ 0, 99 ]), i = new c[l](0), e.identical(n.byteLength, i.byteLength), 
            n = r.arrayCutin(o, [ 0, 99 ], [ 1, 2, 3, 4, 5 ]), i = o, e.identical(n, i), n = r.arrayCutin(o, [ 0, -1 ]), 
            i = o, e.identical(n, i), n = r.arrayCutin(o, [ -1, -1 ]), i = o, e.identical(n, i), 
            n = r.arrayCutin(o, [ 0, 0 ], [ 1 ]), i = o, e.identical(n, i), n = r.arrayCutin(o, [], []), 
            n = r.definedIs(n.length) ? n.length : n.byteLength, e.identical(n, 0);
          }
          e.case = "no arguments", e.shouldThrowErrorSync(function() {
            r.arrayCutin();
          }), e.case = "not enough arguments", e.shouldThrowErrorSync(function() {
            r.arrayCutin([ 1, 2, 3, 4, 5 ]);
          }), e.case = "redundant argument", e.shouldThrowErrorSync(function() {
            r.arrayCutin([ 1, "a", "b", "c", 5 ], [ 2, 3, 4 ], 1, 3, "redundant argument");
          }), e.case = "wrong type of arguments", e.shouldThrowErrorSync(function() {
            r.arrayCutin("wrong argument", "wrong argument", "wrong argument", "wrong argument");
          }), e.case = "wrong type of argument", e.shouldThrowErrorSync(function() {
            r.arrayCutin([], [ "x" ], 3);
          });
        },
        arrayPut: 
        //
        function arrayPut(e) {
          e.case = "adds after second element";
          var a = r.arrayPut([ 1, 2, 3, 4, 5, 6, 9 ], 2, "str", !0, [ 7, 8 ]), n = [ 1, 2, "str", !0, 7, 8, 9 ];
          e.identical(a, n), e.case = "adds at the beginning", a = r.arrayPut([ 1, 2, 3, 4, 5, 6, 9 ], 0, "str", !0, [ 7, 8 ]), 
          n = [ "str", !0, 7, 8, 5, 6, 9 ], e.identical(a, n), e.case = "add to end", a = r.arrayPut([ 1, 2, 3 ], 3, 4, 5, 6), 
          n = [ 1, 2, 3, 4, 5, 6 ], e.identical(a, n), e.case = "offset is negative", a = r.arrayPut([ 1, 2, 3 ], -1, 4, 5, 6), 
          n = [ 5, 6, 3 ], e.identical(a, n), e.case = "no arguments", e.shouldThrowErrorSync(function() {
            r.arrayPut();
          }), e.case = "wrong type of arguments", e.shouldThrowErrorSync(function() {
            r.arrayPut("wrong argument", "wrong argument", "str", !0, [ 7, 8 ]);
          });
        },
        // arrayFill,
        arrayFillTimes: 
        //
        function arrayFillTimes(e) {
          e.case = "empty array";
          var a = r.arrayFillTimes([], 1), n = [ 0 ];
          e.identical(a, n), e.case = "times is negative, times = length + times", a = r.arrayFillTimes([ 0, 0, 0 ], -1, 1), 
          n = [ 1, 1, 0 ], e.identical(a, n), e.case = "times is negative", a = r.arrayFillTimes([ 0, 0 ], -2, 1), 
          n = [ 0, 0 ], e.identical(a, n), e.case = "empty array, value passed", a = r.arrayFillTimes([], 1, 1), 
          n = [ 1 ], e.identical(a, n), e.case = "empty array, value is an array", a = r.arrayFillTimes([], 1, [ 1, 2, 3 ]), 
          n = [ [ 1, 2, 3 ] ], e.identical(a, n), e.case = "times > array.length", a = r.arrayFillTimes([ 0 ], 3, 1), 
          n = [ 1, 1, 1 ], e.identical(a, n), e.case = "times < array.length", a = r.arrayFillTimes([ 0, 0, 0 ], 1, 1), 
          n = [ 1, 0, 0 ], e.identical(a, n), e.case = "TypedArray";
          var i = new Uint16Array();
          a = r.arrayFillTimes(i, 3, 1), n = new Uint16Array([ 1, 1, 1 ]), e.identical(a, n), 
          e.case = "ArrayLike without fill routine", i = (() => arguments)(1), a = r.arrayFillTimes(i, 3, 1), 
          n = [ 1, 1, 1 ], e.identical(a, n), e.case = "no fill routine, times is negative", 
          (i = [ 1, 1, 1 ]).fill = null, a = r.arrayFillTimes(i, -1, 3), n = [ 3, 3, 1 ], 
          e.identical(a, n), e.case = "no arguments", e.shouldThrowErrorSync(function() {
            r.arrayFillTimes();
          }), e.case = "zero", e.shouldThrowErrorSync(function() {
            r.arrayFillTimes(0);
          }), e.case = "only one argument", e.shouldThrowErrorSync(function() {
            r.arrayFillTimes([]);
          }), e.case = "wrong argument type", e.shouldThrowErrorSync(function() {
            r.arrayFillTimes(new ArrayBuffer(), 1);
          });
        },
        arrayFillWhole: function arrayFillWhole(e) {
          e.case = "empty array";
          var a = r.arrayFillWhole([]), n = [];
          e.identical(a, n), e.case = "empty array, value passed", a = r.arrayFillWhole([], 1), 
          n = [], e.identical(a, n), e.case = "array with elements", a = r.arrayFillWhole([ 1, 1, 1 ]), 
          n = [ 0, 0, 0 ], e.identical(a, n), e.case = "array with elements", a = r.arrayFillWhole([ 1, 1, 1 ], 5), 
          n = [ 5, 5, 5 ], e.identical(a, n), e.case = "array with elements", (i = []).length = 3, 
          a = r.arrayFillWhole(i, 5), n = [ 5, 5, 5 ], e.identical(a, n), e.case = "TypedArray";
          var i = new Uint16Array(3);
          a = r.arrayFillWhole(i), n = new Uint16Array([ 0, 0, 0 ]), e.identical(a, n), e.case = "no fill routine", 
          (i = [ 1, 1, 1 ]).fill = null, a = r.arrayFillWhole(i, 2), n = [ 2, 2, 2 ], e.identical(a, n), 
          e.case = "no arguments", e.shouldThrowErrorSync(function() {
            r.arrayFillWhole();
          }), e.case = "wrong argument type", e.shouldThrowErrorSync(function() {
            r.arrayFillTimes(new ArrayBuffer(), 1);
          });
        },
        arraySupplement: 
        //
        function arraySupplement(e) {
          e.case = "nothing";
          var a = r.arraySupplement([]), n = [];
          e.identical(a, n), e.case = "only numbers", a = r.arraySupplement([ 4, 5 ], [ 1, 2, 3 ], [ 6, 7, 8, !0, 9 ], [ "a", "b", 33, 13, "e", 7 ]), 
          n = [ 4, 5, 33, 13, 9, 7 ], e.identical(a, n), e.case = "only numbers and undefined", 
          a = r.arraySupplement([ 4, 5 ], [ 1, 2, 3 ], [ 6, 7, !0, 9 ], [ "a", "b", 33, 13, "e", 7 ]), 
          n = [ 4, 5, 33, 13, void 0, 7 ], e.identical(a, n), e.case = "only numbers", a = r.arraySupplement([ "a", "b" ], [ 1, 2, 3 ], [ 6, 7, 8, !0, 9 ], [ "a", "b", 33, 13, "e", 7 ]), 
          n = [ 6, 7, 33, 13, 9, 7 ], e.identical(a, n), e.case = "no arguments", e.shouldThrowErrorSync(function() {
            r.arraySupplement();
          }), e.case = "arguments are wrong", e.shouldThrowErrorSync(function() {
            r.arraySupplement("wrong argument", "wrong arguments");
          });
        },
        arrayExtendScreening: 
        //
        function arrayExtendScreening(e) {
          e.case = "returns an empty array";
          var a = r.arrayExtendScreening([], [], [ 0, 1, 2 ], [ 3, 4 ], [ 5, 6 ]), n = [];
          e.identical(a, n), e.case = "returns the corresponding values by indexes of the first argument", 
          a = r.arrayExtendScreening([ 1, 2, 3 ], [], [ 0, 1, 2 ], [ 3, 4 ], [ 5, 6 ]), n = [ 5, 6, 2 ], 
          e.identical(a, n), e.case = "creates a new array and returns the corresponding values by indexes of the first argument", 
          a = r.arrayExtendScreening([ 1, 2, 3 ], null, [ 0, 1, 2 ], [ 3, 4 ], [ 5, 6 ]), 
          n = [ 5, 6, 2 ], e.identical(a, n), e.case = "returns the corresponding values by indexes of the first argument", 
          a = r.arrayExtendScreening([ 1, 2, 3 ], [ 3, "abc", 7, 13 ], [ 0, 1, 2 ], [ 3, 4 ], [ "a", 6 ]), 
          n = [ "a", 6, 2, 13 ], e.identical(a, n), e.case = "returns the second argument", 
          a = r.arrayExtendScreening([], [ 3, "abc", 7, 13 ], [ 0, 1, 2 ], [ 3, 4 ], [ "a", 6 ]), 
          n = [ 3, "abc", 7, 13 ], e.identical(a, n), e.case = "no arguments", e.shouldThrowErrorSync(function() {
            r.arrayExtendScreening();
          }), e.case = "not enough arguments", e.shouldThrowErrorSync(function() {
            r.arrayExtendScreening([ 1, 2, 3, "abc", 13 ]);
          }), e.case = "next arguments are wrong", e.shouldThrowErrorSync(function() {
            r.arrayExtendScreening([ 1, 2, 3 ], [ 3, "abc", 7, 13 ], [ 3, 7 ], "wrong arguments");
          }), e.case = "arguments are wrong", e.shouldThrowErrorSync(function() {
            r.arrayExtendScreening("wrong argument", "wrong argument", "wrong arguments");
          });
        },
        // array checker
        arrayCompare: 
        //
        function arrayCompare(e) {
          e.case = "empty arrays";
          var a = r.arrayCompare([], []), n = 0;
          e.identical(a, n), e.case = "first array is empty", a = r.arrayCompare([], [ 1, 2 ]), 
          n = 0, e.identical(a, n), e.case = "length of the first array is less than second", 
          a = r.arrayCompare([ 4 ], [ 1, 2 ]), n = 3, e.identical(a, n), e.case = "arrays are equal", 
          a = r.arrayCompare([ 1, 5 ], [ 1, 5 ]), n = 0, e.identical(a, n), e.case = "a difference", 
          a = r.arrayCompare([ 1, 5 ], [ 1, 2 ]), n = 3, e.identical(a, n), e.case = "a negative difference", 
          a = r.arrayCompare([ 1, 5 ], [ 1, 6 ]), n = -1, e.identical(a, n), e.case = "array-like arguments";
          var i = function src1() {
            return arguments;
          }(1, 5), t = function src2() {
            return arguments;
          }(1, 2);
          a = r.arrayCompare(i, t), n = 3, e.identical(a, n), e.case = "no arguments", e.shouldThrowErrorSync(function() {
            r.arrayCompare();
          }), e.case = "not enough arguments", e.shouldThrowErrorSync(function() {
            r.arrayCompare([ 1, 5 ]);
          }), e.case = "extra argument", e.shouldThrowErrorSync(function() {
            r.arrayCompare([ 1, 5 ], [ 1, 2 ], "redundant argument");
          }), e.case = "wrong type of arguments", e.shouldThrowErrorSync(function() {
            r.arrayCompare("wrong argument", "wrong argument");
          }), e.case = "second array is empty", e.shouldThrowErrorSync(function() {
            r.arrayCompare([ 1, 5 ], []);
          }), e.case = "length of the second array is less than first", e.shouldThrowErrorSync(function() {
            r.arrayCompare([ 1, 5 ], [ 1 ]);
          });
        },
        arraysAreIdentical: 
        //
        function arraysAreIdentical(e) {
          e.case = "empty arrays";
          var a = r.arraysAreIdentical([], []), n = !0;
          e.identical(a, n), e.case = "arrays are equal", a = r.arraysAreIdentical([ 1, 2, 3 ], [ 1, 2, 3 ]), 
          n = !0, e.identical(a, n), e.case = "array-like arguments", a = r.arraysAreIdentical(function src1() {
            return arguments;
          }(3, 7, 33), function src2() {
            return arguments;
          }(3, 7, 13)), n = !1, e.identical(a, n), e.case = "arrays are not equal", a = r.arraysAreIdentical([ 1, 2, 3, "Hi!" ], [ 1, 2, 3, "Hello there!" ]), 
          n = !1, e.identical(a, n), e.case = "arrays length are not equal", a = r.arraysAreIdentical([ 1, 2, 3 ], [ 1, 2 ]), 
          n = !1, e.identical(a, n), e.case = "no arguments", e.shouldThrowErrorSync(function() {
            r.arraysAreIdentical();
          }), e.case = "not enough arguments", e.shouldThrowErrorSync(function() {
            r.arraysAreIdentical([ 1, 2, 3 ]);
          }), e.case = "extra argument", e.shouldThrowErrorSync(function() {
            r.arraysAreIdentical([ 1, 2, 3 ], [ 1, 2 ], "redundant argument");
          });
        },
        arrayHasAny: 
        //
        function arrayHasAny(e) {
          e.case = "false";
          var a = r.arrayHasAny([]), n = !1;
          e.identical(a, n), e.case = "false", a = r.arrayHasAny([], !1, 7), n = !1, e.identical(a, n), 
          e.case = "true", a = r.arrayHasAny([ 5, "str", 42, !1 ], !1, 7), n = !0, e.identical(a, n), 
          e.case = "no arguments", e.shouldThrowErrorSync(function() {
            r.arrayHasAny();
          }), e.case = "first argument is wrong", e.shouldThrowErrorSync(function() {
            r.arrayHasAny("wrong argument", !1, 7);
          });
        },
        // array sequential search
        arrayLeftIndex: 
        //
        function arrayLeftIndex(e) {
          e.case = "nothing";
          var a = r.arrayLeftIndex([], 3), n = -1;
          e.identical(a, n), e.case = "second index", a = r.arrayLeftIndex([ 1, 2, 3 ], 3), 
          n = 2, e.identical(a, n), e.case = "zero index", a = r.arrayLeftIndex([ 1, 2, 3 ], 3, function(r, e) {
            return r < e;
          }), n = 0, e.identical(a, n), e.case = "nothing", a = r.arrayLeftIndex([ 1, 2, 3 ], 4), 
          n = -1, e.identical(a, n), e.case = "nothing", a = r.arrayLeftIndex([ 1, 2, 3 ], 3, function(r, e) {
            return r > e;
          }), n = -1, e.identical(a, n), e.case = "array-like arguments";
          var i = function arr() {
            return arguments;
          }(3, 7, 13);
          a = r.arrayLeftIndex(i, 13), n = 2, e.identical(a, n), e.case = "fromIndex", a = r.arrayLeftIndex([ 0, 0, 0, 0 ], 0, 0), 
          n = 0, e.identical(a, n), e.case = "fromIndex", a = r.arrayLeftIndex([ 0, 0, 0, 0 ], 0, 3), 
          n = 3, e.identical(a, n), e.case = "fromIndex", a = r.arrayLeftIndex([ 0, 0, 0, 0 ], 0, -1), 
          n = 3, e.identical(a, n), e.case = "fromIndex + evaluator", a = r.arrayLeftIndex([ 1, 1, 2, 2, 3, 3 ], 3, 2, function(r, e) {
            return r < e;
          }), n = 2, e.identical(a, n), e.case = "fromIndex + evaluator x2", a = r.arrayLeftIndex([ 6, 6, 5, 5 ], 3, 2, function(r) {
            return r + 1;
          }, function(r) {
            return 2 * r;
          }), n = 2, e.identical(a, n), e.case = "one argument", e.shouldThrowErrorSync(function() {
            r.arrayLeftIndex([ 1, 2, 3 ]);
          }), e.case = "no arguments", e.shouldThrowErrorSync(function() {
            r.arrayLeftIndex();
          }), e.case = "third argument is wrong", e.shouldThrowErrorSync(function() {
            r.arrayLeftIndex([ 1, 2, 3 ], 2, "wrong argument");
          });
        },
        arrayRightIndex: 
        //
        function arrayRightIndex(e) {
          e.case = "nothing";
          var a = r.arrayRightIndex([], 3), n = -1;
          e.identical(a, n), e.case = "second index", a = r.arrayRightIndex([ 1, 2, 3 ], 3), 
          n = 2, e.identical(a, n), e.case = "zero index", a = r.arrayRightIndex([ 1, 2, 3 ], 3, function(r, e) {
            return r < e;
          }), n = 1, e.identical(a, n), e.case = "nothing", a = r.arrayRightIndex([ 1, 2, 3 ], 4), 
          n = -1, e.identical(a, n), e.case = "nothing", a = r.arrayRightIndex([ 1, 2, 3 ], 3, function(r, e) {
            return r > e;
          }), n = -1, e.identical(a, n), e.case = "array-like arguments";
          var i = function arr() {
            return arguments;
          }(3, 7, 13);
          a = r.arrayRightIndex(i, 13), n = 2, e.identical(a, n), e.case = "fifth index", 
          a = r.arrayRightIndex("abcdef", "e", function(r, e) {
            return r > e;
          }), n = 5, e.identical(a, n), e.case = "third index", a = r.arrayRightIndex("abcdef", "d"), 
          n = 3, e.identical(a, n), e.case = "second index", a = r.arrayRightIndex("abcdef", "c", function(r) {
            return r;
          }), n = 2, e.identical(a, n), e.case = "fromIndex", a = r.arrayRightIndex([ 0, 0, 0, 0 ], 0, 0), 
          n = 0, e.identical(a, n), e.case = "fromIndex", a = r.arrayRightIndex([ 0, 0, 0, 0 ], 0, 3), 
          n = 3, e.identical(a, n), e.case = "fromIndex", a = r.arrayRightIndex([ 0, 1, 1, 0 ], 0, 1), 
          n = 0, e.identical(a, n), e.case = "fromIndex", a = r.arrayRightIndex([ 0, 1, 1, 0 ], 1, 2), 
          n = 2, e.identical(a, n), e.case = "fromIndex + evaluator", a = r.arrayRightIndex([ 1, 1, 2, 2, 3, 3 ], 3, 4, function(r, e) {
            return r < e;
          }), n = 3, e.identical(a, n), e.case = "fromIndex + evaluator x2", a = r.arrayRightIndex([ 6, 6, 5, 5 ], 3, 2, function(r) {
            return r + 1;
          }, function(r) {
            return 2 * r;
          }), n = 2, e.identical(a, n), e.case = "one argument", e.shouldThrowErrorSync(function() {
            r.arrayRightIndex([ 1, 2, 3 ]);
          }), e.case = "no arguments", e.shouldThrowErrorSync(function() {
            r.arrayRightIndex();
          }), e.case = "third argument is wrong", e.shouldThrowErrorSync(function() {
            r.arrayRightIndex([ 1, 2, 3 ], 2, "wrong argument");
          });
        },
        arrayLeft: 
        //
        function arrayLeft(e) {
          e.case = "returns an object";
          var a = r.arrayLeft([ 1, 2, 3, 4, 5 ], 3), n = {
            index: 2,
            element: 3
          };
          e.identical(a, n), e.case = "returns an object", a = r.arrayLeft([ 1, 2, !1, "str", 5 ], "str", function(r, e) {
            return r === e;
          }), n = {
            index: 3,
            element: "str"
          }, e.identical(a, n), e.case = "returns an object", a = r.arrayLeft([ 1, 2, !1, "str", 5 ], 5, function(r) {
            return r;
          }), n = {
            index: 4,
            element: 5
          }, e.identical(a, n), e.case = "no arguments", e.shouldThrowErrorSync(function() {
            r.arrayLeft();
          }), e.case = "not enough arguments", e.shouldThrowErrorSync(function() {
            r.arrayLeft([]);
          }), e.case = "third argument is wrong", e.shouldThrowErrorSync(function() {
            r.arrayLeft([ 1, 2, 3 ], 2, "wrong argument");
          });
        },
        arrayCountElement: 
        //
        function arrayCountElement(a) {
          a.case = "Empty array";
          var n = r.arrayCountElement([], 3), i = 0;
          a.identical(n, i), a.case = "Undefined element", n = r.arrayCountElement([], void 0), 
          i = 0, a.identical(n, i), a.case = "Null element", n = r.arrayCountElement([], null), 
          i = 0, a.identical(n, i), a.case = "No match", n = r.arrayCountElement([ 1, 2, "str", 10, 10, !0 ], "hi"), 
          i = 0, a.identical(n, i), a.case = "One match - bool", n = r.arrayCountElement([ 1, 2, "str", 10, 10, !0 ], !0), 
          i = 1, a.identical(n, i), a.case = "Two matching - number", n = r.arrayCountElement([ 1, 2, "str", 10, 10, !0 ], 10), 
          i = 2, a.identical(n, i), a.case = "Three matching - string", n = r.arrayCountElement([ "str", 10, "str", 10, !0, "str" ], "str"), 
          i = 3, a.identical(n, i), a.case = "longIs";
          var t = [ 1, 2, 3 ];
          t.a = 1, n = r.arrayCountElement(t, 1), i = 1, a.identical(n, i), 
          // Evaluators
          a.case = "Without evaluators - no match", n = r.arrayCountElement([ [ 0 ], [ 0 ], [ 0 ], [ 0 ], [ 1 ] ], 0), 
          i = 0, a.identical(n, i), a.case = "With evaluators - 1 matches", n = r.arrayCountElement([ [ 1, 3 ], [ 2, 2 ], [ 3, 1 ] ], 1, r => r[1], r => r + 2), 
          i = 1, a.identical(n, i), a.case = "With evaluators - 4 matches", n = r.arrayCountElement([ [ 0 ], [ 0 ], [ 0 ], [ 0 ], [ 1 ] ], 0, r => r[0], r => r), 
          i = 4, a.identical(n, i), a.case = "Without equalizer - two matches", n = r.arrayCountElement([ !0, !1, !0, !1 ], !0), 
          i = 2, a.identical(n, i), a.case = "With equalizer - 4 matches", n = r.arrayCountElement([ !0, !1, !0, !1 ], !0, (e, a) => r.typeOf(e) === r.typeOf(a)), 
          i = 4, a.identical(n, i), a.case = "With equalizer - 4 matches", n = r.arrayCountElement([ 1, 2, "str", 10, 10, !0 ], 10, (e, a) => r.typeOf(e) === r.typeOf(a)), 
          i = 4, a.identical(n, i), a.case = "no arguments", a.shouldThrowErrorSync(function() {
            r.arrayCountElement();
          }), a.case = "not enough arguments", a.shouldThrowErrorSync(function() {
            r.arrayCountElement([ 1, 2, 3, "abc", 13 ]);
          }), a.case = "extra argument", a.shouldThrowErrorSync(function() {
            r.arrayCountElement([ 1, 2, 3, !0 ], !0, "redundant argument");
          }), a.case = "first argument is wrong - undefined", a.shouldThrowErrorSync(function() {
            r.arrayCountElement(void 0, !0);
          }), a.case = "first argument is wrong - null", a.shouldThrowErrorSync(function() {
            r.arrayCountElement(null, !0);
          }), a.case = "first argument is wrong - string", a.shouldThrowErrorSync(function() {
            r.arrayCountElement("wrong argument", !0);
          }), a.case = "first argument is wrong - number", a.shouldThrowErrorSync(function() {
            r.arrayCountElement(3, !0);
          }), a.case = "third argument is wrong - have no arguments", a.shouldThrowErrorSync(function() {
            r.arrayCountElement([ 3, 4, 5, !0 ], 3, () => 3);
          }), a.case = "third argument is wrong - have three arguments", a.shouldThrowErrorSync(function() {
            r.arrayCountElement([ 3, 4, 5, !0 ], 3, (e, a, n) => r.typeOf(e) === r.typeOf(a) === r.typeOf(n));
          }), a.case = "fourth element is unnacessary", a.shouldThrowErrorSync(function() {
            r.arrayCountElement([ 3, 4, 5, !0 ], 3, (e, a) => r.typeOf(e) === r.typeOf(a), r => r);
          }), a.case = "fourth argument is wrong - have no arguments", a.shouldThrowErrorSync(function() {
            r.arrayCountElement([ 3, 4, 5, !0 ], 3, (e, a) => r.typeOf(e) === r.typeOf(a), () => e);
          }), a.case = "fourth argument is wrong - have two arguments", a.shouldThrowErrorSync(function() {
            r.arrayCountElement([ 3, 4, 5, !0 ], 3, (e, a) => r.typeOf(e) === r.typeOf(a), (r, a) => e);
          });
        },
        arrayCountTotal: 
        //
        function arrayCountTotal(e) {
          // Zero
          e.case = "Empty array";
          var a = r.arrayCountTotal([]), n = 0;
          e.identical(a, n), e.case = "null", a = r.arrayCountTotal([ null ]), n = 0, e.identical(a, n), 
          e.case = "several nulls", a = r.arrayCountTotal([ null, null, null ]), n = 0, e.identical(a, n), 
          e.case = "Zero", a = r.arrayCountTotal([ 0 ]), n = 0, e.identical(a, n), e.case = "Several zeros", 
          a = r.arrayCountTotal([ 0, 0, 0, 0 ]), n = 0, e.identical(a, n), e.case = "Mix of nulls and zeros", 
          a = r.arrayCountTotal([ 0, null, null, 0, 0, 0, null ]), n = 0, e.identical(a, n), 
          // Array elements are numbers
          e.case = "Sum of no repeated elements", a = r.arrayCountTotal([ 1, 3, 5, 7, 9 ]), 
          n = 25, e.identical(a, n), e.case = "Sum of repeated elements", a = r.arrayCountTotal([ 2, 2, 4, 4, 6, 6 ]), 
          n = 24, e.identical(a, n), e.case = "Sum with negative numbers", a = r.arrayCountTotal([ 2, -3, 4, -4, 6, -7, 8 ]), 
          n = 6, e.identical(a, n), e.case = "Negative result", a = r.arrayCountTotal([ 2, -3, 4, -4, 6, -7 ]), 
          n = -2, e.identical(a, n), e.case = "Zero", a = r.arrayCountTotal([ 2, -2, 4, -4, 6, -6 ]), 
          n = 0, e.identical(a, n), 
          // Array elements are booleans
          e.case = "All true", a = r.arrayCountTotal([ !0, !0, !0, !0 ]), n = 4, e.identical(a, n), 
          e.case = "All false", a = r.arrayCountTotal([ !1, !1, !1, !1, !1 ]), n = 0, e.identical(a, n), 
          e.case = "Mix of true and false", a = r.arrayCountTotal([ !1, !1, !0, !1, !0, !1, !1, !0 ]), 
          n = 3, e.identical(a, n), 
          // Array elements are numbers and booleans
          e.case = "All true and numbers", a = r.arrayCountTotal([ !0, 2, 1, !0, !0, 0, !0 ]), 
          n = 7, e.identical(a, n), e.case = "All false and numbers", a = r.arrayCountTotal([ 1, !1, 0, !1, !1, 4, 3, !1, !1 ]), 
          n = 8, e.identical(a, n), e.case = "Mix of true, false and numbers", a = r.arrayCountTotal([ !1, !1, 0, !0, !1, 10, !0, !1, !1, !0, 2 ]), 
          n = 15, e.identical(a, n), e.case = "Mix of true, false, numbers and null", a = r.arrayCountTotal([ null, !1, !1, 0, !0, null, !1, 10, !0, !1, !1, !0, 2, null ]), 
          n = 15, e.identical(a, n), e.case = "Mix of true, false, numbers and null - negative result", 
          a = r.arrayCountTotal([ null, !1, !1, 0, !0, null, -8, !1, 10, !0, !1, -9, !1, !0, 2, null ]), 
          n = -2, e.identical(a, n), e.case = "no arguments", e.shouldThrowErrorSync(function() {
            r.arrayCountTotal();
          }), e.case = "Too many arguments", e.shouldThrowErrorSync(function() {
            r.arrayCountTotal([ 1, 2, 3, "abc", 13 ], []);
          }), e.case = "srcArray is undefined", e.shouldThrowErrorSync(function() {
            r.arrayCountTotal(void 0);
          }), e.case = "srcArray is null", e.shouldThrowErrorSync(function() {
            r.arrayCountTotal(null);
          }), e.case = "srcArray is string", e.shouldThrowErrorSync(function() {
            r.arrayCountTotal("wrong argument");
          }), e.case = "srcArray is number", e.shouldThrowErrorSync(function() {
            r.arrayCountTotal(3);
          }), e.case = "srcArray contains strings", e.shouldThrowErrorSync(function() {
            r.arrayCountTotal([ 1, "2", 3, "a" ]);
          }), e.case = "srcArray contains arrays", e.shouldThrowErrorSync(function() {
            r.arrayCountTotal([ 1, [ 2 ], 3, [ null ] ]);
          });
        },
        arrayCountUnique: 
        //
        function arrayCountUnique(e) {
          e.case = "nothing";
          var a = r.arrayCountUnique([]), n = 0;
          e.identical(a, n), e.case = "nothing", a = r.arrayCountUnique([ 1, 2, 3, 4, 5 ]), 
          n = 0, e.identical(a, n), e.case = "three pairs", a = r.arrayCountUnique([ 1, 1, 2, "abc", "abc", 4, !0, !0 ]), 
          n = 3, e.identical(a, n), e.case = "no arguments", e.shouldThrowErrorSync(function() {
            r.arrayCountUnique();
          }), e.case = "extra argument", e.shouldThrowErrorSync(function() {
            r.arrayCountUnique([ 1, 1, 2, "abc", "abc", 4, !0, !0 ], function(r) {
              return r;
            }, "redundant argument");
          }), e.case = "first argument is wrong", e.shouldThrowErrorSync(function() {
            r.arrayCountUnique("wrong argument", function(r) {
              return r;
            });
          }), e.case = "second argument is wrong", e.shouldThrowErrorSync(function() {
            r.arrayCountUnique([ 1, 1, 2, "abc", "abc", 4, !0, !0 ], "wrong argument");
          });
        },
        // array etc
        arraySum: 
        //
        function arraySum(e) {
          e.case = "nothing";
          var a = r.arraySum([]), n = 0;
          e.identical(a, n), e.case = "returns sum", a = r.arraySum([ 1, 2, 3, 4, 5 ]), n = 15, 
          e.identical(a, n), e.case = "returns sum", a = r.arraySum([ !0, !1, 13, "33" ], function(r) {
            return 2 * r;
          }), n = 94, e.identical(a, n), e.case = "converts and returns sum", a = r.arraySum([ 1, 2, 3, 4, 5 ], function(r) {
            return 2 * r;
          }), n = 30, e.identical(a, n), e.case = "no arguments", e.shouldThrowErrorSync(function() {
            r.arraySum();
          }), e.case = "extra argument", e.shouldThrowErrorSync(function() {
            r.arraySum([ 1, 2, 3, 4, 5 ], function(r) {
              return 2 * r;
            }, "redundant argument");
          }), e.case = "first argument is wrong", e.shouldThrowErrorSync(function() {
            r.arraySum("wrong argument", function(r) {
              return r / 2;
            });
          }), e.case = "second argument is wrong", e.shouldThrowErrorSync(function() {
            r.arraySum([ 1, 2, 3, 4, 5 ], "wrong argument");
          });
        },
        // array prepend
        arrayPrepend: 
        // ---
        // array transformation
        // ---
        function arrayPrepend(e) {
          e.case = "dstArray is null";
          var a = r.arrayPrepend(null, 1);
          e.identical(a, [ 1 ]), e.case = "dstArray is empty";
          var n = [];
          a = r.arrayPrepend(n, null), e.identical(a, [ null ]), e.is(a === n), n = [], a = r.arrayPrepend(n, void 0), 
          e.identical(a, [ void 0 ]), e.is(a === n), n = [], a = r.arrayPrepend(n, 1), e.identical(a, [ 1 ]), 
          e.is(a === n), n = [], a = r.arrayPrepend(n, "1"), e.identical(a, [ "1" ]), e.is(a === n), 
          n = [], a = r.arrayPrepend(n, [ 1, 2 ]), e.identical(a, [ [ 1, 2 ] ]), e.is(a === n), 
          e.case = "simple", n = [ 1 ], a = r.arrayPrepend(n, 1), e.identical(a, [ 1, 1 ]), 
          e.is(a === n), n = [ 1 ], a = r.arrayPrepend(n, 2), e.identical(a, [ 2, 1 ]), e.is(a === n), 
          n = [ 1, 2, 3 ], a = r.arrayPrepend(n, 3), e.identical(a, [ 3, 1, 2, 3 ]), e.is(a === n), 
          n = [ 1 ], a = r.arrayPrepend(n, "1"), e.identical(a, [ "1", 1 ]), e.is(a === n), 
          n = [ 1 ], a = r.arrayPrepend(n, void 0), e.identical(a, [ void 0, 1 ]), e.is(a === n), 
          n = [ 1 ], a = r.arrayPrepend(n, -1), e.identical(a, [ -1, 1 ]), e.is(a === n), 
          e.case = "Array prepended as an element", n = [ 1 ], a = r.arrayPrepend(n, [ 1 ]), 
          e.identical(a, [ [ 1 ], 1 ]), e.is(a === n), n = [ "Choose an option" ], a = r.arrayPrepend(n, [ 1, 0, -1 ]), 
          e.identical(a, [ [ 1, 0, -1 ], "Choose an option" ]), e.is(a === n), e.case = "no args", 
          e.shouldThrowErrorSync(function() {
            r.arrayPrepend();
          }), e.case = "too many args", e.shouldThrowErrorSync(function() {
            r.arrayPrepend([], 1, 1);
          }), e.case = "dst is not an array", e.shouldThrowErrorSync(function() {
            r.arrayPrepend(1, 1);
          });
        }
        //
        ,
        arrayPrependOnce: function arrayPrependOnce(e) {
          e.case = "dstArray is null";
          var a = r.arrayPrependOnce(null, 1);
          e.identical(a, [ 1 ]), e.case = "simple";
          var n = [];
          a = r.arrayPrependOnce(n, 1), e.identical(a, [ 1 ]), e.is(a === n), n = [ 1 ], a = r.arrayPrependOnce(n, 1), 
          e.identical(a, [ 1 ]), e.is(a === n), n = [ 1 ], a = r.arrayPrependOnce(n, 2), e.identical(a, [ 2, 1 ]), 
          e.is(a === n), n = [ 1, 2, 3 ], a = r.arrayPrependOnce(n, 3), e.identical(a, [ 1, 2, 3 ]), 
          e.is(a === n), n = [ 1 ], a = r.arrayPrependOnce(n, "1"), e.identical(a, [ "1", 1 ]), 
          e.is(a === n), n = [ 1 ], a = r.arrayPrependOnce(n, -1), e.identical(a, [ -1, 1 ]), 
          e.is(a === n), n = [ 1 ], a = r.arrayPrependOnce(n, [ 1 ]), e.identical(a, [ [ 1 ], 1 ]), 
          e.is(a === n), e.case = "equalizer 2 args", n = [ {
            num: 1
          }, {
            num: 2
          }, {
            num: 3
          } ];
          var i = function(r, e) {
            return r.num === e.num;
          };
          a = r.arrayPrependOnce(n, {
            num: 4
          }, i), e.identical(a, [ {
            num: 4
          }, {
            num: 1
          }, {
            num: 2
          }, {
            num: 3
          } ]), e.is(a === n), n = [ {
            num: 1
          }, {
            num: 2
          }, {
            num: 3
          } ], i = function(r, e) {
            return r.num === e.num;
          }, a = r.arrayPrependOnce(n, {
            num: 1
          }, i), e.identical(a, [ {
            num: 1
          }, {
            num: 2
          }, {
            num: 3
          } ]), e.is(a === n), e.case = "equalizer 1 arg", n = [ {
            num: 1
          }, {
            num: 2
          }, {
            num: 3
          } ], a = r.arrayPrependOnce(n, 4, r => r.num, r => r), e.identical(a, [ 4, {
            num: 1
          }, {
            num: 2
          }, {
            num: 3
          } ]), e.is(a === n), n = [ {
            num: 1
          }, {
            num: 2
          }, {
            num: 3
          } ], a = r.arrayPrependOnce(n, 1, r => r.num, r => r), e.identical(a, [ {
            num: 1
          }, {
            num: 2
          }, {
            num: 3
          } ]), e.is(a === n), e.case = "no args", e.shouldThrowErrorSync(function() {
            r.arrayPrependOnce();
          }), e.case = "dst is not an array", e.shouldThrowErrorSync(function() {
            r.arrayPrependOnce(1, 1);
          }), e.case = "onEqualize is not a function", e.shouldThrowErrorSync(function() {
            r.arrayPrependOnce(1, 1, 1);
          });
        }
        //
        ,
        arrayPrependOnceStrictly: function arrayPrependOnceStrictly(e) {
          e.case = "dstArray is null";
          var a = r.arrayPrependOnceStrictly(null, 1);
          e.identical(a, [ 1 ]), e.case = "simple";
          var n = [];
          a = r.arrayPrependOnceStrictly(n, 1), e.identical(a, [ 1 ]), e.is(a === n), n = [ 1 ], 
          a = r.arrayPrependOnceStrictly(n, 2), e.identical(a, [ 2, 1 ]), e.is(a === n), n = [ 1 ], 
          a = r.arrayPrependOnceStrictly(n, "1"), e.identical(a, [ "1", 1 ]), e.is(a === n), 
          n = [ 1 ], a = r.arrayPrependOnceStrictly(n, -1), e.identical(a, [ -1, 1 ]), e.is(a === n), 
          n = [ 1 ], a = r.arrayPrependOnceStrictly(n, [ 1 ]), e.identical(a, [ [ 1 ], 1 ]), 
          e.is(a === n), n = [ 1, 2, 2, 3, 3 ], a = r.arrayPrependOnceStrictly(n, 0), e.identical(a, [ 0, 1, 2, 2, 3, 3 ]), 
          e.is(a === n), e.case = "equalizer 2 args", n = [ {
            num: 1
          }, {
            num: 2
          }, {
            num: 3
          } ];
          var i = function(r, e) {
            return r.num === e.num;
          };
          a = r.arrayPrependOnceStrictly(n, {
            num: 4
          }, i), e.identical(a, [ {
            num: 4
          }, {
            num: 1
          }, {
            num: 2
          }, {
            num: 3
          } ]), e.is(a === n), e.case = "equalizer 1 arg", n = [ {
            num: 1
          }, {
            num: 2
          }, {
            num: 3
          } ], i = function(r) {
            return r.num;
          }, a = r.arrayPrependOnceStrictly(n, 4, i), e.identical(a, [ 4, {
            num: 1
          }, {
            num: 2
          }, {
            num: 3
          } ]), e.is(a === n), e.case = "no args", e.shouldThrowErrorSync(function() {
            r.arrayPrependOnceStrictly();
          }), e.case = "dst is not an array", e.shouldThrowErrorSync(function() {
            r.arrayPrependOnceStrictly(1, 1);
          }), e.case = "ins already exists in dst", e.shouldThrowErrorSync(function() {
            r.arrayPrependOnceStrictly([ 1 ], 1);
          }), e.shouldThrowErrorSync(function() {
            r.arrayPrependOnceStrictly([ 1, 2, 3 ], 3);
          }), 
          // test.case = 'onEqualize is not a routine';
          // test.shouldThrowErrorSync( function()
          // {
          //    _.arrayPrependOnceStrictly( [ 1,2,3 ], 3, 3 );
          // });
          e.shouldThrowErrorSync(function() {
            r.arrayPrependOnceStrictly([ {
              num: 1
            }, {
              num: 2
            }, {
              num: 3
            } ], {
              num: 1
            }, function(r, e) {
              return r.num === e.num;
            });
          });
        }
        //
        ,
        arrayPrepended: function arrayPrepended(e) {
          e.case = "dstArray is empty";
          var a = [], n = r.arrayPrepended(a, 1);
          e.identical(a, [ 1 ]), e.identical(n, 0), a = [], n = r.arrayPrepended(a, null), 
          e.identical(a, [ null ]), e.identical(n, 0), a = [], n = r.arrayPrepended(a, void 0), 
          e.identical(a, [ void 0 ]), e.identical(n, 0), e.case = "simple", a = [ 1 ], n = r.arrayPrepended(a, 1), 
          e.identical(a, [ 1, 1 ]), e.identical(n, 0), a = [ 1 ], n = r.arrayPrepended(a, 2), 
          e.identical(a, [ 2, 1 ]), e.identical(n, 0), a = [ 1, 2, 3 ], n = r.arrayPrepended(a, 3), 
          e.identical(a, [ 3, 1, 2, 3 ]), e.identical(n, 0), a = [ 1 ], n = r.arrayPrepended(a, "1"), 
          e.identical(a, [ "1", 1 ]), e.identical(n, 0), a = [ 1 ], n = r.arrayPrepended(a, -1), 
          e.identical(a, [ -1, 1 ]), e.identical(n, 0), e.case = "Array prepended as an element", 
          a = [ 1 ], n = r.arrayPrepended(a, [ 1 ]), e.identical(a, [ [ 1 ], 1 ]), e.identical(n, 0), 
          a = [ "Choose an option" ], n = r.arrayPrepended(a, [ 1, 0, -1 ]), e.identical(a, [ [ 1, 0, -1 ], "Choose an option" ]), 
          e.identical(n, 0), e.case = "no args", e.shouldThrowErrorSync(function() {
            r.arrayPrepended();
          }), e.case = "too many args", e.shouldThrowErrorSync(function() {
            r.arrayPrepended([], 1, 1);
          }), e.case = "dst is not an array", e.shouldThrowErrorSync(function() {
            r.arrayPrepended(1, 1);
          });
        }
        //
        ,
        arrayPrependedOnce: function arrayPrependedOnce(e) {
          e.case = "simple";
          var a = [], n = r.arrayPrependedOnce(a, 1);
          e.identical(a, [ 1 ]), e.identical(n, 0), a = [ 1 ], n = r.arrayPrependedOnce(a, 1), 
          e.identical(a, [ 1 ]), e.identical(n, -1), a = [ 1 ], n = r.arrayPrependedOnce(a, 2), 
          e.identical(a, [ 2, 1 ]), e.identical(n, 0), a = [ 1, 2, 3 ], n = r.arrayPrependedOnce(a, 3), 
          e.identical(a, [ 1, 2, 3 ]), e.identical(n, -1), a = [ 1 ], n = r.arrayPrependedOnce(a, "1"), 
          e.identical(a, [ "1", 1 ]), e.identical(n, 0), a = [ 1 ], n = r.arrayPrependedOnce(a, -1), 
          e.identical(a, [ -1, 1 ]), e.identical(n, 0), a = [ 1 ], n = r.arrayPrependedOnce(a, [ 1 ]), 
          e.identical(a, [ [ 1 ], 1 ]), e.identical(n, 0), e.case = "equalizer 2 args", a = [ {
            num: 1
          }, {
            num: 2
          }, {
            num: 3
          } ];
          var i = function(r, e) {
            return r.num === e.num;
          };
          n = r.arrayPrependedOnce(a, {
            num: 4
          }, i), e.identical(a, [ {
            num: 4
          }, {
            num: 1
          }, {
            num: 2
          }, {
            num: 3
          } ]), e.identical(n, 0), a = [ {
            num: 1
          }, {
            num: 2
          }, {
            num: 3
          } ], i = function(r, e) {
            return r.num === e.num;
          }, n = r.arrayPrependedOnce(a, {
            num: 1
          }, i), e.identical(a, [ {
            num: 1
          }, {
            num: 2
          }, {
            num: 3
          } ]), e.identical(n, -1), e.case = "equalizer 1 arg", a = [ {
            num: 1
          }, {
            num: 2
          }, {
            num: 3
          } ], i = function(r) {
            return r.num;
          }, n = r.arrayPrependedOnce(a, 4, i), e.identical(a, [ 4, {
            num: 1
          }, {
            num: 2
          }, {
            num: 3
          } ]), e.identical(n, 0), a = [ {
            num: 1
          }, {
            num: 2
          }, {
            num: 3
          } ], n = r.arrayPrependedOnce(a, 1, r => r.num, r => r), e.identical(a, [ {
            num: 1
          }, {
            num: 2
          }, {
            num: 3
          } ]), e.identical(n, -1), e.case = "no args", e.shouldThrowErrorSync(function() {
            r.arrayPrependedOnce();
          }), e.case = "fourth is not a routine", e.shouldThrowErrorSync(function() {
            r.arrayPrependedOnce([], 1, 1, 1);
          }), e.case = "dst is not an array", e.shouldThrowErrorSync(function() {
            r.arrayPrependedOnce(1, 1);
          });
        }
        //
        ,
        arrayPrependedOnceStrictly: function arrayPrependedOnceStrictly(e) {
          e.case = "simple";
          var a = [], n = r.arrayPrependedOnceStrictly(a, 1);
          e.identical(a, [ 1 ]), e.identical(n, 0), a = [ 1 ], n = r.arrayPrependedOnceStrictly(a, 2), 
          e.identical(a, [ 2, 1 ]), e.identical(n, 0), a = [ 1 ], n = r.arrayPrependedOnceStrictly(a, "1"), 
          e.identical(a, [ "1", 1 ]), e.identical(n, 0), a = [ 1 ], n = r.arrayPrependedOnceStrictly(a, -1), 
          e.identical(a, [ -1, 1 ]), e.identical(n, 0), a = [ 1 ], n = r.arrayPrependedOnceStrictly(a, [ 1 ]), 
          e.identical(a, [ [ 1 ], 1 ]), e.identical(n, 0), a = [ 1, 2, 2, 3, 3 ], n = r.arrayPrependedOnceStrictly(a, 0), 
          e.identical(a, [ 0, 1, 2, 2, 3, 3 ]), e.identical(n, 0), e.case = "equalizer 2 args", 
          a = [ {
            num: 1
          }, {
            num: 2
          }, {
            num: 3
          } ];
          var i = function(r, e) {
            return r.num === e.num;
          };
          n = r.arrayPrependedOnceStrictly(a, {
            num: 4
          }, i), e.identical(a, [ {
            num: 4
          }, {
            num: 1
          }, {
            num: 2
          }, {
            num: 3
          } ]), e.identical(n, 0), e.case = "equalizer 1 arg", a = [ {
            num: 1
          }, {
            num: 2
          }, {
            num: 3
          } ], i = function(r) {
            return r.num;
          }, n = r.arrayPrependedOnceStrictly(a, 4, i), e.identical(a, [ 4, {
            num: 1
          }, {
            num: 2
          }, {
            num: 3
          } ]), e.identical(n, 0), e.case = "no args", e.shouldThrowErrorSync(function() {
            r.arrayPrependedOnceStrictly();
          }), e.case = "dst is not an array", e.shouldThrowErrorSync(function() {
            r.arrayPrependedOnceStrictly(1, 1);
          }), e.case = "ins already exists in dst", e.shouldThrowErrorSync(function() {
            r.arrayPrependedOnceStrictly([ 1 ], 1);
          }), e.shouldThrowErrorSync(function() {
            r.arrayPrependedOnceStrictly([ 1, 2, 3 ], 3);
          }), e.shouldThrowErrorSync(function() {
            r.arrayPrependedOnceStrictly([ {
              num: 1
            }, {
              num: 2
            }, {
              num: 3
            } ], {
              num: 1
            }, function(r, e) {
              return r.num === e.num;
            });
          });
        }
        //
        ,
        arrayPrependElement: function arrayPrependElement(e) {
          e.case = "dstArray is null";
          var a = r.arrayPrependElement(null, 1);
          e.identical(a, [ 1 ]), e.case = "simple";
          var n = [];
          a = r.arrayPrependElement(n, 1), e.identical(a, [ 1 ]), e.is(a === n), n = [ 1 ], 
          a = r.arrayPrependElement(n, 1), e.identical(a, [ 1, 1 ]), e.is(a === n), n = [ 1 ], 
          a = r.arrayPrependElement(n, 2), e.identical(a, [ 2, 1 ]), e.is(a === n), n = [ 1, 2, 3 ], 
          a = r.arrayPrependElement(n, 3), e.identical(a, [ 3, 1, 2, 3 ]), e.is(a === n), 
          n = [ 1 ], a = r.arrayPrependElement(n, "1"), e.identical(a, [ "1", 1 ]), e.is(a === n), 
          n = [ 1 ], a = r.arrayPrependElement(n, -1), e.identical(a, [ -1, 1 ]), e.is(a === n), 
          n = [ 1 ], a = r.arrayPrependElement(n, [ 1 ]), e.identical(a, [ [ 1 ], 1 ]), e.is(a === n), 
          e.case = "no args", e.shouldThrowErrorSync(function() {
            r.arrayPrependElement();
          }), e.case = "too many args", e.shouldThrowErrorSync(function() {
            r.arrayPrependElement([], 1, 1);
          }), e.case = "dst is not an array", e.shouldThrowErrorSync(function() {
            r.arrayPrependElement(1, 1);
          });
        }
        //
        ,
        arrayPrependElementOnce: function arrayPrependElementOnce(e) {
          e.case = "dstArray is null";
          var a = r.arrayPrependElementOnce(null, 1);
          e.identical(a, [ 1 ]), e.case = "simple";
          var n = [];
          a = r.arrayPrependElementOnce(n, 1), e.identical(a, [ 1 ]), e.is(a === n), n = [ 1 ], 
          a = r.arrayPrependElementOnce(n, 2), e.identical(a, [ 2, 1 ]), e.is(a === n), n = [ 1 ], 
          a = r.arrayPrependElementOnce(n, "1"), e.identical(a, [ "1", 1 ]), e.is(a === n), 
          n = [ 1 ], a = r.arrayPrependElementOnce(n, -1), e.identical(a, [ -1, 1 ]), e.is(a === n), 
          n = [ 1 ], a = r.arrayPrependElementOnce(n, [ 1 ]), e.identical(a, [ [ 1 ], 1 ]), 
          e.is(a === n), e.case = "ins already in srcArray", n = [ 1 ], a = r.arrayPrependElementOnce(n, 1), 
          e.identical(a, [ 1 ]), e.is(a === n), n = [ 1, 2, 3 ], a = r.arrayPrependElementOnce(n, 3), 
          e.identical(a, [ 1, 2, 3 ]), e.is(a === n), n = [ !0, !1, !0 ], a = r.arrayPrependElementOnce(n, !1), 
          e.identical(a, [ !0, !1, !0 ]), e.is(a === n), e.case = "equalizer 2 args", n = [ {
            num: 1
          }, {
            num: 2
          }, {
            num: 3
          } ];
          var i = function(r, e) {
            return r.num === e.num;
          };
          a = r.arrayPrependElementOnce(n, {
            num: 4
          }, i), e.identical(a, [ {
            num: 4
          }, {
            num: 1
          }, {
            num: 2
          }, {
            num: 3
          } ]), e.is(a === n), n = [ {
            num: 1
          }, {
            num: 2
          }, {
            num: 3
          } ], i = function(r, e) {
            return r.num === e.num;
          }, a = r.arrayPrependElementOnce(n, {
            num: 1
          }, i), e.identical(a, [ {
            num: 1
          }, {
            num: 2
          }, {
            num: 3
          } ]), e.is(a === n), e.case = "equalizer 1 arg", n = [ {
            num: 1
          }, {
            num: 2
          }, {
            num: 3
          } ], a = r.arrayPrependElementOnce(n, 4, r => r.num, r => r), e.identical(a, [ 4, {
            num: 1
          }, {
            num: 2
          }, {
            num: 3
          } ]), e.is(a === n), n = [ {
            num: 1
          }, {
            num: 2
          }, {
            num: 3
          } ], a = r.arrayPrependElementOnce(n, 1, r => r.num, r => r), e.identical(a, [ {
            num: 1
          }, {
            num: 2
          }, {
            num: 3
          } ]), e.is(a === n), e.case = "no args", e.shouldThrowErrorSync(function() {
            r.arrayPrependElementOnce();
          }), e.case = "dst is not an array", e.shouldThrowErrorSync(function() {
            r.arrayPrependElementOnce(1, 1);
          }), e.case = "onEqualize is not a function", e.shouldThrowErrorSync(function() {
            r.arrayPrependElementOnce(1, 1, 1);
          });
        }
        //
        ,
        arrayPrependElementOnceStrictly: function arrayPrependElementOnceStrictly(e) {
          e.case = "dstArray is null";
          var a = r.arrayPrependElementOnceStrictly(null, 1);
          e.identical(a, [ 1 ]), e.case = "dstArray is null", a = r.arrayPrependElementOnceStrictly(null, 1), 
          e.identical(a, [ 1 ]), e.case = "simple";
          var n = [];
          a = r.arrayPrependElementOnceStrictly(n, 1), e.identical(a, [ 1 ]), e.is(a === n), 
          n = [ 1 ], a = r.arrayPrependElementOnceStrictly(n, 2), e.identical(a, [ 2, 1 ]), 
          e.is(a === n), n = [ 1 ], a = r.arrayPrependElementOnceStrictly(n, "1"), e.identical(a, [ "1", 1 ]), 
          e.is(a === n), n = [ 1 ], a = r.arrayPrependElementOnceStrictly(n, -1), e.identical(a, [ -1, 1 ]), 
          e.is(a === n), n = [ 1 ], a = r.arrayPrependElementOnceStrictly(n, [ 1 ]), e.identical(a, [ [ 1 ], 1 ]), 
          e.is(a === n), n = [ 1, 2, 2, 3, 3 ], a = r.arrayPrependElementOnceStrictly(n, 0), 
          e.identical(a, [ 0, 1, 2, 2, 3, 3 ]), e.is(a === n), e.case = "equalizer 2 args", 
          n = [ {
            num: 1
          }, {
            num: 2
          }, {
            num: 3
          } ];
          var i = function(r, e) {
            return r.num === e.num;
          };
          a = r.arrayPrependElementOnceStrictly(n, {
            num: 4
          }, i), e.identical(a, [ {
            num: 4
          }, {
            num: 1
          }, {
            num: 2
          }, {
            num: 3
          } ]), e.is(a === n), e.case = "equalizer 1 arg", n = [ {
            num: 1
          }, {
            num: 2
          }, {
            num: 3
          } ], i = function(r) {
            return r.num;
          }, a = r.arrayPrependElementOnceStrictly(n, 4, i), e.identical(a, [ 4, {
            num: 1
          }, {
            num: 2
          }, {
            num: 3
          } ]), e.is(a === n), e.case = "no args", e.shouldThrowErrorSync(function() {
            r.arrayPrependElementOnceStrictly();
          }), e.case = "dst is not an array", e.shouldThrowErrorSync(function() {
            r.arrayPrependElementOnceStrictly(1, 1);
          }), e.case = "ins already exists in dst", e.shouldThrowErrorSync(function() {
            r.arrayPrependElementOnceStrictly([ 1 ], 1);
          }), e.shouldThrowErrorSync(function() {
            r.arrayPrependElementOnceStrictly([ 1, 2, 3 ], 3);
          }), e.shouldThrowErrorSync(function() {
            r.arrayPrependElementOnceStrictly([ {
              num: 1
            }, {
              num: 2
            }, {
              num: 3
            } ], {
              num: 1
            }, function(r, e) {
              return r.num === e.num;
            });
          });
        }
        //
        ,
        arrayPrependedElement: function arrayPrependedElement(e) {
          e.case = "simple";
          var a = [], n = r.arrayPrependedElement(a, 1);
          e.identical(a, [ 1 ]), e.identical(n, 1), a = [ 1 ], n = r.arrayPrependedElement(a, 1), 
          e.identical(a, [ 1, 1 ]), e.identical(n, 1), a = [ 1 ], n = r.arrayPrependedElement(a, 2), 
          e.identical(a, [ 2, 1 ]), e.identical(n, 2), a = [ 1, 2, 3 ], n = r.arrayPrependedElement(a, 3), 
          e.identical(a, [ 3, 1, 2, 3 ]), e.identical(n, 3), a = [ 1 ], n = r.arrayPrependedElement(a, "1"), 
          e.identical(a, [ "1", 1 ]), e.identical(n, "1"), a = [ 1 ], n = r.arrayPrependedElement(a, -1), 
          e.identical(a, [ -1, 1 ]), e.identical(n, -1), a = [ 1 ], n = r.arrayPrependedElement(a, [ 1 ]), 
          e.identical(a, [ [ 1 ], 1 ]), e.identical(n, [ 1 ]), e.case = "no args", e.shouldThrowErrorSync(function() {
            r.arrayPrependedElement();
          }), e.case = "too many args", e.shouldThrowErrorSync(function() {
            r.arrayPrependedElement([], 1, 1);
          }), e.case = "dst is not an array", e.shouldThrowErrorSync(function() {
            r.arrayPrependedElement(1, 1);
          });
        }
        //
        ,
        arrayPrependedElementOnce: function arrayPrependedElementOnce(e) {
          e.case = "simple";
          var a = [], n = r.arrayPrependedElementOnce(a, 1);
          e.identical(a, [ 1 ]), e.identical(n, 1), a = [ 1 ], n = r.arrayPrependedElementOnce(a, 2), 
          e.identical(a, [ 2, 1 ]), e.identical(n, 2), a = [ 1 ], n = r.arrayPrependedElementOnce(a, "1"), 
          e.identical(a, [ "1", 1 ]), e.identical(n, "1"), a = [ 1 ], n = r.arrayPrependedElementOnce(a, -1), 
          e.identical(a, [ -1, 1 ]), e.identical(n, -1), a = [ 1 ], n = r.arrayPrependedElementOnce(a, [ 1 ]), 
          e.identical(a, [ [ 1 ], 1 ]), e.identical(n, [ 1 ]), e.case = "ins already in dstArray", 
          a = [ 1 ], n = r.arrayPrependedElementOnce(a, 1), e.identical(a, [ 1 ]), e.identical(n, void 0), 
          a = [ 1, 2, 3 ], n = r.arrayPrependedElementOnce(a, 3), e.identical(a, [ 1, 2, 3 ]), 
          e.identical(n, void 0), a = [ !1, !0, !1, !0 ], n = r.arrayPrependedElementOnce(a, !0), 
          e.identical(a, [ !1, !0, !1, !0 ]), e.identical(n, void 0), e.case = "equalizer 2 args", 
          a = [ {
            num: 1
          }, {
            num: 2
          }, {
            num: 3
          } ];
          var i = function(r, e) {
            return r.num === e.num;
          };
          n = r.arrayPrependedElementOnce(a, {
            num: 4
          }, i), e.identical(a, [ {
            num: 4
          }, {
            num: 1
          }, {
            num: 2
          }, {
            num: 3
          } ]), e.identical(n, {
            num: 4
          }), a = [ {
            num: 1
          }, {
            num: 2
          }, {
            num: 3
          } ], i = function(r, e) {
            return r.num === e.num;
          }, n = r.arrayPrependedElementOnce(a, {
            num: 1
          }, i), e.identical(a, [ {
            num: 1
          }, {
            num: 2
          }, {
            num: 3
          } ]), e.identical(n, void 0), e.case = "equalizer 1 arg", a = [ {
            num: 1
          }, {
            num: 2
          }, {
            num: 3
          } ], i = function(r) {
            return r.num;
          }, n = r.arrayPrependedElementOnce(a, 4, i), e.identical(a, [ 4, {
            num: 1
          }, {
            num: 2
          }, {
            num: 3
          } ]), e.identical(n, 4), a = [ {
            num: 1
          }, {
            num: 2
          }, {
            num: 3
          } ], n = r.arrayPrependedElementOnce(a, 1, r => r.num, r => r), e.identical(a, [ {
            num: 1
          }, {
            num: 2
          }, {
            num: 3
          } ]), e.identical(n, void 0), e.case = "no args", e.shouldThrowErrorSync(function() {
            r.arrayPrependedElementOnce();
          }), e.case = "fourth is not a routine", e.shouldThrowErrorSync(function() {
            r.arrayPrependedElementOnce([], 1, 1, 1);
          }), e.case = "dst is not an array", e.shouldThrowErrorSync(function() {
            r.arrayPrependedElementOnce(1, 1);
          });
        }
        //
        ,
        arrayPrependedElementOnceStrictly: function arrayPrependedElementOnceStrictly(e) {
          e.case = "simple";
          var a = [], n = r.arrayPrependedElementOnceStrictly(a, 1);
          e.identical(a, [ 1 ]), e.identical(n, 1), a = [ 1 ], n = r.arrayPrependedElementOnceStrictly(a, 2), 
          e.identical(a, [ 2, 1 ]), e.identical(n, 2), a = [ 1 ], n = r.arrayPrependedElementOnceStrictly(a, "1"), 
          e.identical(a, [ "1", 1 ]), e.identical(n, "1"), a = [ 1 ], n = r.arrayPrependedElementOnceStrictly(a, -1), 
          e.identical(a, [ -1, 1 ]), e.identical(n, -1), a = [ 1 ], n = r.arrayPrependedElementOnceStrictly(a, [ 1 ]), 
          e.identical(a, [ [ 1 ], 1 ]), e.identical(n, [ 1 ]), a = [ 1, 2, 2, 3, 3 ], n = r.arrayPrependedElementOnceStrictly(a, 0), 
          e.identical(a, [ 0, 1, 2, 2, 3, 3 ]), e.identical(n, 0), e.case = "equalizer 2 args", 
          a = [ {
            num: 1
          }, {
            num: 2
          }, {
            num: 3
          } ];
          var i = function(r, e) {
            return r.num === e.num;
          };
          n = r.arrayPrependedElementOnceStrictly(a, {
            num: 4
          }, i), e.identical(a, [ {
            num: 4
          }, {
            num: 1
          }, {
            num: 2
          }, {
            num: 3
          } ]), e.identical(n, {
            num: 4
          }), e.case = "equalizer 1 arg", a = [ {
            num: 1
          }, {
            num: 2
          }, {
            num: 3
          } ], i = function(r) {
            return r.num;
          }, n = r.arrayPrependedElementOnceStrictly(a, 4, i), e.identical(a, [ 4, {
            num: 1
          }, {
            num: 2
          }, {
            num: 3
          } ]), e.identical(n, 4), e.case = "no args", e.shouldThrowErrorSync(function() {
            r.arrayPrependedElementOnceStrictly();
          }), e.case = "dst is not an array", e.shouldThrowErrorSync(function() {
            r.arrayPrependedElementOnceStrictly(1, 1);
          }), e.case = "ins already exists in dst", e.shouldThrowErrorSync(function() {
            r.arrayPrependedElementOnceStrictly([ 1 ], 1);
          }), e.shouldThrowErrorSync(function() {
            r.arrayPrependedElementOnceStrictly([ 1, 2, 3 ], 3);
          }), e.shouldThrowErrorSync(function() {
            r.arrayPrependedElementOnceStrictly([ {
              num: 1
            }, {
              num: 2
            }, {
              num: 3
            } ], {
              num: 1
            }, function(r, e) {
              return r.num === e.num;
            });
          });
        }
        //
        ,
        arrayPrependArray: function arrayPrependArray(e) {
          e.case = "dstArray is null";
          var a = r.arrayPrependArray(null, [ 1 ]);
          e.identical(a, [ 1 ]), e.case = "nothing", a = r.arrayPrependArray([], []), e.identical(a, []), 
          e.case = "simple";
          var n = [];
          a = r.arrayPrependArray(n, [ 1, 2, 3 ]), e.identical(n, [ 1, 2, 3 ]), e.is(a === n), 
          n = [ 1, 2, 3 ], a = r.arrayPrependArray(n, [ 4, 5 ]), e.identical(n, [ 4, 5, 1, 2, 3 ]), 
          e.is(a === n), n = [ 1, 1, 1 ], a = r.arrayPrependArray(n, [ 1, 1 ]), e.identical(n, [ 1, 1, 1, 1, 1 ]), 
          e.is(a === n), e.case = "mixed arguments types", n = [ 1 ], a = r.arrayPrependArray(n, [ "a", 1, [ {
            a: 1
          } ], {
            b: 2
          } ]), e.identical(n, [ "a", 1, [ {
            a: 1
          } ], {
            b: 2
          }, 1 ]), e.is(a === n), e.case = "argument is undefined", n = [ 1 ], e.shouldThrowErrorSync(function() {
            r.arrayPrependArray(n, void 0);
          }), e.identical(n, [ 1 ]), e.case = "array has undefined", n = [ 1 ], a = r.arrayPrependArray(n, [ void 0, 2 ]), 
          e.identical(n, [ void 0, 2, 1 ]), e.is(a === n), e.case = "no arguments", e.shouldThrowErrorSync(function() {
            r.arrayPrependArray();
          }), e.case = "too many args", e.shouldThrowErrorSync(function() {
            r.arrayPrependArray([ 1, 2 ], [ 1 ], [ 2 ]);
          }), e.case = "second args is not longIs", e.shouldThrowErrorSync(function() {
            r.arrayPrependArray([ 1, 2 ], 2);
          });
        },
        arrayPrependArrayOnce: 
        //
        function arrayPrependArrayOnce(e) {
          e.case = "dstArray is null";
          var a = r.arrayPrependArrayOnce(null, [ 1 ]);
          e.identical(a, [ 1 ]), e.case = "nothing", a = r.arrayPrependArrayOnce([], []), 
          e.identical(a, []), e.case = "simple";
          var n = [];
          a = r.arrayPrependArrayOnce(n, [ 1, 2, 3 ]), e.identical(n, [ 1, 2, 3 ]), e.is(a === n), 
          e.case = "prepends only unique elements", n = [ 1, 2, 3 ], a = r.arrayPrependArrayOnce(n, [ 2, 4, 5 ]), 
          e.identical(n, [ 4, 5, 1, 2, 3 ]), e.is(a === n), n = [ 1, 1, 1 ], a = r.arrayPrependArrayOnce(n, [ 1 ]), 
          e.identical(n, [ 1, 1, 1 ]), e.is(a === n), e.case = "mixed arguments types", n = [ 1 ], 
          a = r.arrayPrependArrayOnce(n, [ "a", 1, [ {
            a: 1
          } ], {
            b: 2
          } ]), e.identical(n, [ "a", [ {
            a: 1
          } ], {
            b: 2
          }, 1 ]), e.is(a === n), e.case = "argument is undefined", n = [ 1 ], e.shouldThrowErrorSync(function() {
            r.arrayPrependArrayOnce(n, void 0);
          }), e.identical(n, [ 1 ]), e.case = "array has undefined", n = [ 1 ], e.mustNotThrowError(function() {
            r.arrayPrependArrayOnce(n, [ void 0, 2 ]);
          }), e.identical(n, [ void 0, 2, 1 ]), e.case = "no arguments", e.shouldThrowErrorSync(function() {
            r.arrayPrependArrayOnce();
          }), e.case = "too many args", e.shouldThrowErrorSync(function() {
            r.arrayPrependArrayOnce([ 1, 2 ], [ 1 ], [ 2 ]);
          }), e.case = "second args is not longIs", e.shouldThrowErrorSync(function() {
            r.arrayPrependArrayOnce([ 1, 2 ], 2);
          });
        }
        //
        ,
        arrayPrependArrayOnceStrictly: function arrayPrependArrayOnceStrictly(e) {
          e.case = "dstArray is null";
          var a = r.arrayPrependArrayOnceStrictly(null, [ 1 ]);
          e.identical(a, [ 1 ]), e.case = "nothing", a = r.arrayPrependArrayOnceStrictly([], []), 
          e.identical(a, []), e.case = "simple";
          var n = [];
          a = r.arrayPrependArrayOnceStrictly(n, [ 1, 2, 3 ]), e.identical(n, [ 1, 2, 3 ]), 
          e.is(a === n), n = [ 1, 2, 3 ], a = r.arrayPrependArrayOnceStrictly(n, [ 4, 5 ]), 
          e.identical(n, [ 4, 5, 1, 2, 3 ]), e.is(a === n), n = [ 1, 2, 3, 1, 2, 3 ], a = r.arrayPrependArrayOnceStrictly(n, [ 4, 5 ]), 
          e.identical(n, [ 4, 5, 1, 2, 3, 1, 2, 3 ]), e.is(a === n), e.case = "argument is undefined", 
          n = [ 1 ], e.shouldThrowErrorSync(function() {
            r.arrayPrependArrayOnceStrictly(n, void 0);
          }), e.identical(n, [ 1 ]), e.case = "array has undefined", n = [ 1 ], e.mustNotThrowError(function() {
            r.arrayPrependArrayOnceStrictly(n, [ void 0, 2 ]);
          }), e.identical(n, [ void 0, 2, 1 ]), e.case = "no arguments", e.shouldThrowErrorSync(function() {
            r.arrayPrependArrayOnceStrictly();
          }), e.case = "too many args", e.shouldThrowErrorSync(function() {
            r.arrayPrependArrayOnceStrictly([ 1, 2 ], [ 1 ], [ 2 ]);
          }), e.case = "second args is not longIs", e.shouldThrowErrorSync(function() {
            r.arrayPrependArrayOnceStrictly([ 1, 2 ], 2);
          }), e.case = "one of elements is not unique", n = [ 1, 2, 3 ], e.shouldThrowErrorSync(function() {
            r.arrayPrependArrayOnceStrictly(n, [ 4, 5, 2 ]);
          }), e.identical(n, [ 4, 5, 1, 2, 3 ]), n = [ 1, 1, 1 ], e.shouldThrowErrorSync(function() {
            r.arrayPrependArrayOnceStrictly(n, [ 1 ]);
          }), e.identical(n, [ 1, 1, 1 ]);
        }
        //
        ,
        arrayPrependedArray: function arrayPrependedArray(e) {
          e.case = "nothing";
          var a = [], n = r.arrayPrependedArray(a, []);
          e.identical(a, []), e.identical(n, 0), e.case = "simple", a = [], n = r.arrayPrependedArray(a, [ 1, 2, 3 ]), 
          e.identical(a, [ 1, 2, 3 ]), e.identical(n, 3), e.case = "prepends only unique elements", 
          a = [ 1, 2, 3 ], n = r.arrayPrependedArray(a, [ 2, 4, 5 ]), e.identical(a, [ 2, 4, 5, 1, 2, 3 ]), 
          e.identical(n, 3), a = [ 1, 1, 1 ], n = r.arrayPrependedArray(a, [ 1 ]), e.identical(a, [ 1, 1, 1, 1 ]), 
          e.identical(n, 1), e.case = "mixed arguments types", a = [ 1 ], n = r.arrayPrependedArray(a, [ "a", 1, [ {
            a: 1
          } ], {
            b: 2
          } ]), e.identical(a, [ "a", 1, [ {
            a: 1
          } ], {
            b: 2
          }, 1 ]), e.identical(n, 4), e.case = "argument is undefined", a = [ 1 ], e.shouldThrowErrorSync(function() {
            r.arrayPrependedArray(a, void 0);
          }), e.identical(a, [ 1 ]), e.case = "array has undefined", a = [ 1 ], e.mustNotThrowError(function() {
            r.arrayPrependedArray(a, [ void 0, 2 ]);
          }), e.identical(a, [ void 0, 2, 1 ]), e.case = "no arguments", e.shouldThrowErrorSync(function() {
            r.arrayPrependedArray();
          }), e.case = "too many args", e.shouldThrowErrorSync(function() {
            r.arrayPrependedArray([ 1, 2 ], [ 1 ], [ 2 ]);
          }), e.case = "second args is not longIs", e.shouldThrowErrorSync(function() {
            r.arrayPrependedArray([ 1, 2 ], 2);
          });
        }
        //
        ,
        arrayPrependedArrayOnce: function arrayPrependedArrayOnce(e) {
          e.case = "nothing";
          var a = [], n = r.arrayPrependedArrayOnce(a, []);
          e.identical(a, []), e.identical(n, 0), e.case = "simple", a = [], n = r.arrayPrependedArrayOnce(a, [ 1, 2, 3 ]), 
          e.identical(a, [ 1, 2, 3 ]), e.identical(n, 3), e.case = "prepends only unique elements", 
          a = [ 1, 2, 3 ], n = r.arrayPrependedArrayOnce(a, [ 2, 4, 5 ]), e.identical(a, [ 4, 5, 1, 2, 3 ]), 
          e.identical(n, 2), a = [ 1, 1, 1 ], n = r.arrayPrependedArrayOnce(a, [ 1 ]), e.identical(a, [ 1, 1, 1 ]), 
          e.identical(n, 0), e.case = "mixed arguments types", a = [ 1 ], n = r.arrayPrependedArrayOnce(a, [ "a", 1, [ {
            a: 1
          } ], {
            b: 2
          } ]), e.identical(a, [ "a", [ {
            a: 1
          } ], {
            b: 2
          }, 1 ]), e.identical(n, 3), e.case = "argument is undefined", a = [ 1 ], e.shouldThrowErrorSync(function() {
            r.arrayPrependedArrayOnce(a, void 0);
          }), e.identical(a, [ 1 ]), e.case = "array has undefined", a = [ 1 ], e.mustNotThrowError(function() {
            r.arrayPrependedArrayOnce(a, [ void 0, 2 ]);
          }), e.identical(a, [ void 0, 2, 1 ]), e.case = "no arguments", e.shouldThrowErrorSync(function() {
            r.arrayPrependedArrayOnce();
          }), e.case = "too many args", e.shouldThrowErrorSync(function() {
            r.arrayPrependedArrayOnce([ 1, 2 ], [ 1 ], [ 2 ]);
          }), e.case = "second args is not longIs", e.shouldThrowErrorSync(function() {
            r.arrayPrependedArrayOnce([ 1, 2 ], 2);
          });
        }
        //
        ,
        arrayPrependedArrayOnceStrictly: function arrayPrependedArrayOnceStrictly(e) {
          e.case = "nothing";
          var a = [], n = r.arrayPrependedArrayOnceStrictly(a, []);
          e.identical(a, []), e.identical(n, 0), e.case = "simple", a = [], n = r.arrayPrependedArrayOnceStrictly(a, [ 1, 2, 3 ]), 
          e.identical(a, [ 1, 2, 3 ]), e.identical(n, 3), e.case = "prepends only if all elements are unique", 
          a = [ 1, 2, 3 ], n = r.arrayPrependedArrayOnceStrictly(a, [ 3.5, 4, 5 ]), e.identical(a, [ 3.5, 4, 5, 1, 2, 3 ]), 
          e.identical(n, 3), a = [ 1, 1, 1 ], n = r.arrayPrependedArrayOnceStrictly(a, [ 0 ]), 
          e.identical(a, [ 0, 1, 1, 1 ]), e.identical(n, 1), e.case = "mixed arguments types", 
          a = [ 1 ], n = r.arrayPrependedArrayOnceStrictly(a, [ "a", 0, [ {
            a: 1
          } ], {
            b: 2
          } ]), e.identical(a, [ "a", 0, [ {
            a: 1
          } ], {
            b: 2
          }, 1 ]), e.identical(n, 4), e.case = "argument is undefined", a = [ 1 ], e.shouldThrowErrorSync(function() {
            r.arrayPrependedArrayOnceStrictly(a, void 0);
          }), e.identical(a, [ 1 ]), e.case = "array has undefined", a = [ 1 ], e.mustNotThrowError(function() {
            r.arrayPrependedArrayOnceStrictly(a, [ void 0, 2 ]);
          }), e.identical(a, [ void 0, 2, 1 ]), e.case = "no arguments", e.shouldThrowErrorSync(function() {
            r.arrayPrependedArrayOnceStrictly();
          }), e.case = "too many args", e.shouldThrowErrorSync(function() {
            r.arrayPrependedArrayOnceStrictly([ 1, 2 ], [ 1 ], [ 2 ]);
          }), e.case = "second args is not longIs", e.shouldThrowErrorSync(function() {
            r.arrayPrependedArrayOnceStrictly([ 1, 2 ], 2);
          }), e.case = "One of args is not unique", e.shouldThrowErrorSync(function() {
            r.arrayPrependedArrayOnceStrictly([ 1, 1, 1 ], [ 1 ]);
          }), e.shouldThrowErrorSync(function() {
            r.arrayPrependedArrayOnceStrictly([ 1, 2, 3 ], [ 2, 4, 5 ]);
          });
        }
        // --
        //arrayPrependElement*Arrays*
        // --
        ,
        arrayPrependArrays: function arrayPrependArrays(e) {
          e.case = "dstArray is null";
          var a = r.arrayPrependArrays(null, [ 1 ]);
          e.identical(a, [ 1 ]), e.case = "nothing", a = r.arrayPrependArrays([], []), e.identical(a, []), 
          e.case = "simple";
          var n = [];
          a = r.arrayPrependArrays(n, [ 1, 2, 3 ]), e.identical(n, [ 1, 2, 3 ]), e.is(a === n), 
          n = [ 1, 2, 3 ], a = r.arrayPrependArrays(n, [ 4, 5 ]), e.identical(n, [ 4, 5, 1, 2, 3 ]), 
          e.is(a === n), n = [ 1, 1, 1 ], a = r.arrayPrependArrays(n, [ 1, 1 ]), e.identical(n, [ 1, 1, 1, 1, 1 ]), 
          e.is(a === n), n = [];
          var i = [ [ 1 ], [ 2 ], [ 3, [ 4 ] ] ];
          a = r.arrayPrependArrays(n, i), e.identical(n, [ 1, 2, 3, [ 4 ] ]), e.is(a === n), 
          n = [], i = [ 1, 2, 3 ], a = r.arrayPrependArrays(n, i), e.identical(n, [ 1, 2, 3 ]), 
          e.is(a === n), e.case = "mixed arguments types", n = [ 1 ], i = [ "a", 1, [ {
            a: 1
          } ], {
            b: 2
          } ], a = r.arrayPrependArrays(n, i), e.identical(n, [ "a", 1, {
            a: 1
          }, {
            b: 2
          }, 1 ]), e.is(a === n), e.case = "array has undefined", n = [ 1 ], a = r.arrayPrependArrays(n, [ void 0, 2 ]), 
          e.identical(n, [ void 0, 2, 1 ]), e.is(a === n), e.case = "argument is undefined", 
          n = [ 1 ], e.shouldThrowErrorSync(function() {
            r.arrayPrependArrays(n, void 0);
          }), e.identical(n, [ 1 ]), e.case = "no arguments", e.shouldThrowErrorSync(function() {
            r.arrayPrependArrays();
          }), e.case = "dst is not a array", e.shouldThrowErrorSync(function() {
            r.arrayPrependArrays(1, [ 2 ]);
          }), e.case = "second arg is no a ArrayLike", e.shouldThrowErrorSync(function() {
            r.arrayPrependArrays([], 2);
          }), e.case = "too many args", e.shouldThrowErrorSync(function() {
            r.arrayPrependArrays([], [ 1 ], [ 2 ]);
          });
        }
        //
        ,
        arrayPrependArraysOnce: function arrayPrependArraysOnce(e) {
          e.case = "dstArray is null";
          var a = r.arrayPrependArraysOnce(null, [ 1 ]);
          e.identical(a, [ 1 ]), e.case = "nothing", a = r.arrayPrependArraysOnce([], []), 
          e.identical(a, []), e.case = "simple";
          var n = [];
          a = r.arrayPrependArraysOnce(n, [ 1, 2, 3 ]), e.identical(n, [ 1, 2, 3 ]), e.is(a === n), 
          e.case = "should keep sequence", n = [ 6 ];
          var i = [ [ 1, 2 ], 3, [ 6, 4, 5, 1, 2, 3 ] ];
          a = r.arrayPrependArraysOnce(n, i), e.identical(n, [ 1, 2, 3, 4, 5, 6 ]), e.identical(i, [ [ 1, 2 ], 3, [ 6, 4, 5, 1, 2, 3 ] ]), 
          e.is(a === n), e.case = "prepends only unique elements", n = [ 1, 2, 3 ], a = r.arrayPrependArraysOnce(n, [ 2, 4, 5 ]), 
          e.identical(n, [ 4, 5, 1, 2, 3 ]), e.is(a === n), n = [ 1, 1, 1 ], a = r.arrayPrependArraysOnce(n, [ 1 ]), 
          e.identical(n, [ 1, 1, 1 ]), e.is(a === n), e.case = "mixed arguments types", n = [ 1 ], 
          a = r.arrayPrependArraysOnce(n, [ "a", 1, [ {
            a: 1
          } ], {
            b: 2
          } ]), e.identical(n, [ "a", {
            a: 1
          }, {
            b: 2
          }, 1 ]), e.is(a === n), n = [ 1, 2, 3, 4 ], a = r.arrayPrependArraysOnce(n, [ [ 1 ], [ 2 ], [ 3, [ 4 ], 5 ] ]), 
          e.identical(n, [ [ 4 ], 5, 1, 2, 3, 4 ]), e.is(a === n), n = [ 1, 3 ], a = r.arrayPrependArraysOnce(n, [ 1, 2, 3 ]), 
          e.identical(a, [ 2, 1, 3 ]), e.identical(n, a), e.case = "onEqualize", n = [ 1, 3 ], 
          a = r.arrayPrependArraysOnce(n, [ 1, 2, 3 ], function onEqualize(r, e) {
            return r === e;
          }), e.identical(a, [ 2, 1, 3 ]), e.identical(n, a), e.case = "argument is undefined", 
          n = [ 1 ], e.shouldThrowErrorSync(function() {
            r.arrayPrependArraysOnce(n, void 0);
          }), e.identical(n, [ 1 ]), e.case = "array has undefined", n = [ 1 ], e.mustNotThrowError(function() {
            r.arrayPrependArraysOnce(n, [ void 0, 2 ]);
          }), e.identical(n, [ void 0, 2, 1 ]), e.case = "no arguments", e.shouldThrowErrorSync(function() {
            r.arrayPrependArraysOnce();
          }), e.case = "dst is not a array", e.shouldThrowErrorSync(function() {
            r.arrayPrependArraysOnce(1, [ 2 ]);
          }), e.case = "onEqualize is not a routine", e.shouldThrowErrorSync(function() {
            r.arrayPrependArraysOnce([], [ 1, 2, 3 ], {});
          }), e.case = "second arg is no a ArrayLike", e.shouldThrowErrorSync(function() {
            r.arrayPrependArraysOnce([], 2);
          });
        }
        //
        ,
        arrayPrependArraysOnceStrictly: function arrayPrependArraysOnceStrictly(e) {
          e.case = "dstArray is null";
          var a = r.arrayPrependArraysOnceStrictly(null, [ 1 ]);
          e.identical(a, [ 1 ]), e.case = "nothing", a = r.arrayPrependArraysOnceStrictly([], []), 
          e.identical(a, []), e.case = "simple";
          var n = [];
          a = r.arrayPrependArraysOnceStrictly(n, [ 1, 2, 3 ]), e.identical(n, [ 1, 2, 3 ]), 
          e.is(a === n), e.case = "should keep sequence", n = [ 6 ];
          var i = [ [ 1, 2 ], 3, [ 4, 5 ] ];
          a = r.arrayPrependArraysOnceStrictly(n, i), e.identical(n, [ 1, 2, 3, 4, 5, 6 ]), 
          e.identical(i, [ [ 1, 2 ], 3, [ 4, 5 ] ]), e.is(a === n), e.case = "mixed arguments types", 
          n = [ 1 ];
          var t = [ [ "a" ], [ {
            a: 1
          } ], {
            b: 2
          } ];
          a = r.arrayPrependArraysOnceStrictly(n, t), e.identical(n, [ "a", {
            a: 1
          }, {
            b: 2
          }, 1 ]), e.is(a === n), n = [ 0 ], t = [ [ 1 ], [ 2 ], [ 3, [ 4, [ 5 ] ] ] ], a = r.arrayPrependArraysOnceStrictly(n, t), 
          e.identical(n, [ 1, 2, 3, [ 4, [ 5 ] ], 0 ]), e.is(a === n), e.case = "onEqualize", 
          n = [ 4, 5 ], a = r.arrayPrependArraysOnceStrictly(n, [ 1, 2, 3 ], function onEqualize(r, e) {
            return r === e;
          }), e.identical(a, [ 1, 2, 3, 4, 5 ]), e.identical(n, a), e.case = "array has undefined", 
          n = [ 1 ], e.mustNotThrowError(function() {
            r.arrayPrependArraysOnceStrictly(n, [ void 0, 2 ]);
          }), e.identical(n, [ void 0, 2, 1 ]), e.case = "no arguments", e.shouldThrowErrorSync(function() {
            r.arrayPrependArraysOnceStrictly();
          }), e.case = "dst is not a array", e.shouldThrowErrorSync(function() {
            r.arrayPrependArraysOnceStrictly(1, [ 2 ]);
          }), e.case = "onEqualize is not a routine", e.shouldThrowErrorSync(function() {
            r.arrayPrependArraysOnceStrictly([], [ 1, 2, 3 ], {});
          }), e.case = "Same element in insArray and in dstArray", n = [ 1, 2, 3 ], e.shouldThrowErrorSync(function() {
            r.arrayPrependArraysOnceStrictly(n, [ 4, 2, 5 ]);
          }), e.identical(n, [ 4, 5, 1, 2, 3 ]), n = [ 1, 1, 1 ], e.shouldThrowErrorSync(function() {
            r.arrayPrependArraysOnceStrictly(n, [ 1 ]);
          }), e.identical(n, [ 1, 1, 1 ]), e.case = "argument is undefined", n = [ 1 ], e.shouldThrowErrorSync(function() {
            r.arrayPrependArraysOnceStrictly(n, void 0);
          }), e.identical(n, [ 1 ]), e.case = "second arg is no a ArrayLike", e.shouldThrowErrorSync(function() {
            r.arrayPrependArraysOnceStrictly([], 2);
          });
        }
        //
        ,
        arrayPrependedArrays: function arrayPrependedArrays(e) {
          e.case = "nothing";
          var a = [], n = r.arrayPrependedArrays(a, []);
          e.identical(a, []), e.identical(n, 0), e.case = "simple", a = [], n = r.arrayPrependedArrays(a, [ 1, 2, 3 ]), 
          e.identical(a, [ 1, 2, 3 ]), e.identical(n, 3), a = [ 1, 2, 3 ], n = r.arrayPrependedArrays(a, [ 4, 5 ]), 
          e.identical(a, [ 4, 5, 1, 2, 3 ]), e.identical(n, 2), a = [ 1, 1, 1 ], n = r.arrayPrependedArrays(a, [ 1, 1 ]), 
          e.identical(a, [ 1, 1, 1, 1, 1 ]), e.identical(n, 2), a = [], n = r.arrayPrependedArrays(a, [ [ 1 ], [ 2 ], [ 3, [ 4 ], 5 ] ]), 
          e.identical(a, [ 1, 2, 3, [ 4 ], 5 ]), e.identical(n, 5), a = [], n = r.arrayPrependedArrays(a, [ 1, 2, 3 ]), 
          e.identical(a, [ 1, 2, 3 ]), e.identical(n, 3), e.case = "mixed arguments types", 
          a = [ 1 ], n = r.arrayPrependedArrays(a, [ "a", 1, [ {
            a: 1
          } ], {
            b: 2
          } ]), e.identical(a, [ "a", 1, {
            a: 1
          }, {
            b: 2
          }, 1 ]), e.identical(n, 4), e.case = "argument is undefined", a = [ 1 ], e.shouldThrowErrorSync(function() {
            r.arrayPrependedArrays(a, void 0);
          }), e.identical(a, [ 1 ]), e.case = "array has undefined", a = [ 1 ], n = r.arrayPrependedArrays(a, [ void 0, 2 ]), 
          e.identical(a, [ void 0, 2, 1 ]), e.identical(n, 2), e.case = "no arguments", e.shouldThrowErrorSync(function() {
            r.arrayPrependedArrays();
          }), e.case = "dst is not a array", e.shouldThrowErrorSync(function() {
            r.arrayPrependedArrays(1, [ 2 ]);
          }), e.case = "second arg is no a ArrayLike", e.shouldThrowErrorSync(function() {
            r.arrayPrependedArrays([], 2);
          }), e.case = "too many args", e.shouldThrowErrorSync(function() {
            r.arrayPrependedArrays([], [ 1 ], [ 2 ]);
          });
        }
        //
        ,
        arrayPrependedArraysOnce: function arrayPrependedArraysOnce(e) {
          e.case = "nothing";
          var a = [], n = r.arrayPrependedArraysOnce(a, []);
          e.identical(a, []), e.identical(n, 0), e.case = "simple", a = [], n = r.arrayPrependedArraysOnce(a, [ 1, 2, 3 ]), 
          e.identical(a, [ 1, 2, 3 ]), e.identical(n, 3), e.case = "simple", a = [], n = r.arrayPrependedArraysOnce(a, [ 1, 2, 3 ]), 
          e.identical(a, [ 1, 2, 3 ]), e.identical(n, 3), e.case = "should keep sequence", 
          a = [ 6 ];
          var i = [ [ 1, 2 ], 3, [ 6, 4, 5, 1, 2, 3 ] ];
          n = r.arrayPrependedArraysOnce(a, i), e.identical(a, [ 1, 2, 3, 4, 5, 6 ]), e.identical(i, [ [ 1, 2 ], 3, [ 6, 4, 5, 1, 2, 3 ] ]), 
          e.identical(n, 5), e.case = "prepends only unique elements", a = [ 1, 2, 3 ], n = r.arrayPrependedArraysOnce(a, [ 2, 4, 5 ]), 
          e.identical(a, [ 4, 5, 1, 2, 3 ]), e.identical(n, 2), a = [ 1, 1, 1 ], n = r.arrayPrependedArraysOnce(a, [ 1 ]), 
          e.identical(a, [ 1, 1, 1 ]), e.identical(n, 0), e.case = "mixed arguments types", 
          a = [ 1 ], n = r.arrayPrependedArraysOnce(a, [ "a", 1, [ {
            a: 1
          } ], {
            b: 2
          } ]), e.identical(a, [ "a", {
            a: 1
          }, {
            b: 2
          }, 1 ]), e.identical(n, 3), a = [];
          var t = [ [ 1 ], [ 2 ], [ 3, [ 4, [ 5 ] ] ] ];
          n = r.arrayPrependedArraysOnce(a, t), e.identical(a, [ 1, 2, 3, [ 4, [ 5 ] ] ]), 
          e.identical(n, 4), a = [ 1, 3 ], n = r.arrayPrependedArraysOnce(a, [ 1, 2, 3 ]), 
          e.identical(a, [ 2, 1, 3 ]), e.identical(n, 1), e.case = "onEqualize", a = [ 1, 3 ], 
          t = [ 1, 2, 3 ], n = r.arrayPrependedArraysOnce(a, t, function onEqualize(r, e) {
            return r === e;
          }), e.identical(a, [ 2, 1, 3 ]), e.identical(n, 1), e.case = "argument is undefined", 
          a = [ 1 ], e.shouldThrowErrorSync(function() {
            r.arrayPrependedArraysOnce(a, void 0);
          }), e.identical(a, [ 1 ]), e.case = "array has undefined", a = [ 1 ], e.mustNotThrowError(function() {
            r.arrayPrependedArraysOnce(a, [ void 0, 2 ]);
          }), e.identical(a, [ void 0, 2, 1 ]), e.case = "no arguments", e.shouldThrowErrorSync(function() {
            r.arrayPrependedArraysOnce();
          }), 
          // test.case = 'dst is not a array';
          // test.shouldThrowErrorSync( function()
          // {
          //   _.arrayPrependedArraysOnce( 1, [ 2 ] );
          // });
          e.case = "onEqualize is not a routine", e.shouldThrowErrorSync(function() {
            r.arrayPrependedArraysOnce([], [ 1, 2, 3 ], []);
          }), e.case = "second arg is not a ArrayLike entity", e.shouldThrowErrorSync(function() {
            r.arrayPrependedArraysOnce([ 1 ], 2);
          });
        }
        //
        ,
        arrayPrependedArraysOnceStrictly: function arrayPrependedArraysOnceStrictly(e) {
          e.case = "nothing";
          var a = [], n = r.arrayPrependedArraysOnceStrictly(a, []);
          e.identical(a, []), e.identical(n, 0), e.case = "simple", a = [], n = r.arrayPrependedArraysOnceStrictly(a, [ 1, 2, 3 ]), 
          e.identical(a, [ 1, 2, 3 ]), e.identical(n, 3), e.case = "simple", a = [], n = r.arrayPrependedArraysOnceStrictly(a, [ 1, 2, 3 ]), 
          e.identical(a, [ 1, 2, 3 ]), e.identical(n, 3), e.case = "prepends only unique elements", 
          a = [ 1, 2, 3 ], n = r.arrayPrependedArraysOnceStrictly(a, [ 4, 5, 6 ]), e.identical(a, [ 4, 5, 6, 1, 2, 3 ]), 
          e.identical(n, 3), a = [ 0, 0, 0 ], n = r.arrayPrependedArraysOnceStrictly(a, [ 1 ]), 
          e.identical(a, [ 1, 0, 0, 0 ]), e.identical(n, 1), e.case = "mixed arguments types", 
          a = [ 1 ], n = r.arrayPrependedArraysOnceStrictly(a, [ "a", 0, [ {
            a: 1
          } ], {
            b: 2
          } ]), e.identical(a, [ "a", 0, {
            a: 1
          }, {
            b: 2
          }, 1 ]), e.identical(n, 4), a = [];
          var i = [ [ 1 ], [ 2 ], [ 3, [ 4, [ 5 ] ] ] ];
          n = r.arrayPrependedArraysOnceStrictly(a, i), e.identical(a, [ 1, 2, 3, [ 4, [ 5 ] ] ]), 
          e.identical(n, 4), a = [ "1", "3" ], n = r.arrayPrependedArraysOnceStrictly(a, [ 1, 2, 3 ]), 
          e.identical(a, [ 1, 2, 3, "1", "3" ]), e.identical(n, 3), e.case = "onEqualize", 
          a = [ 1, 3 ], i = [ 0, 2, 4 ], n = r.arrayPrependedArraysOnceStrictly(a, i, function onEqualize(r, e) {
            return r === e;
          }), e.identical(a, [ 0, 2, 4, 1, 3 ]), e.identical(n, 3), e.case = "argument is undefined", 
          a = [ 1 ], e.shouldThrowErrorSync(function() {
            r.arrayPrependedArraysOnceStrictly(a, void 0);
          }), e.identical(a, [ 1 ]), e.case = "array has undefined", a = [ 1 ], e.mustNotThrowError(function() {
            r.arrayPrependedArraysOnceStrictly(a, [ void 0, 2 ]);
          }), e.identical(a, [ void 0, 2, 1 ]), e.case = "no arguments", e.shouldThrowErrorSync(function() {
            r.arrayPrependedArraysOnceStrictly();
          }), 
          // test.case = 'dst is not a array';
          // test.shouldThrowErrorSync( function()
          // {
          //   _.arrayPrependedArraysOnceStrictly( 1, [ 2 ] );
          // }); sfkldb fiubds lkfbds gbkdsfb gkldsfg fdsbfkldsfbdsl gbjs,fn kgn d
          e.case = "onEqualize is not a routine", e.shouldThrowErrorSync(function() {
            r.arrayPrependedArraysOnceStrictly([], [ 1, 2, 3 ], []);
          }), e.case = "second arg is not a ArrayLike entity", e.shouldThrowErrorSync(function() {
            r.arrayPrependedArraysOnceStrictly([ 1 ], 2);
          }), e.case = "Elements must be unique", e.shouldThrowErrorSync(function() {
            r.arrayPrependedArraysOnceStrictly([ 1, 1, 1 ], [ [ 1 ] ]);
          }), e.shouldThrowErrorSync(function() {
            r.arrayPrependedArraysOnceStrictly([ 1, 2, 3 ], [ [ 4, 5 ], 2 ]);
          }), e.shouldThrowErrorSync(function() {
            r.arrayPrependedArraysOnceStrictly([ 6 ], [ [ 1, 2 ], 3, [ 6, 4, 5, 1, 2, 3 ] ]);
          });
        }
        //
        ,
        // array append
        arrayAppend: function arrayAppend(e) {
          e.case = "dstArray is null";
          var a = r.arrayAppend(null, 1);
          e.identical(a, [ 1 ]), e.case = "simple", a = r.arrayAppend([], 1), e.identical(a, [ 1 ]), 
          a = r.arrayAppend([ 1 ], 1), e.identical(a, [ 1, 1 ]), a = r.arrayAppend([ 1 ], 2), 
          e.identical(a, [ 1, 2 ]), a = r.arrayAppend([ 1, 2, 3 ], 3), e.identical(a, [ 1, 2, 3, 3 ]), 
          a = r.arrayAppend([ 1 ], "1"), e.identical(a, [ 1, "1" ]), a = r.arrayAppend([ 1 ], -1), 
          e.identical(a, [ 1, -1 ]), a = r.arrayAppend([ 1 ], [ 1 ]), e.identical(a, [ 1, [ 1 ] ]), 
          e.case = "no args", e.shouldThrowErrorSync(function() {
            r.arrayAppend();
          }), e.case = "too many args", e.shouldThrowErrorSync(function() {
            r.arrayAppend([], 1, 1, 1);
          }), e.case = "dst is not an array", e.shouldThrowErrorSync(function() {
            r.arrayAppend(1, 1);
          });
        }
        //
        ,
        arrayAppendOnce: function arrayAppendOnce(e) {
          e.case = "dstArray is null";
          var a = r.arrayAppendOnce(null, 1);
          e.identical(a, [ 1 ]), e.case = "simple", a = r.arrayAppendOnce([], 1), e.identical(a, [ 1 ]), 
          a = r.arrayAppendOnce([ 1 ], 1), e.identical(a, [ 1 ]), a = r.arrayAppendOnce([ 1 ], 2), 
          e.identical(a, [ 1, 2 ]), a = r.arrayAppendOnce([ 1, 2, 3 ], 3), e.identical(a, [ 1, 2, 3 ]), 
          a = r.arrayAppendOnce([ 1 ], "1"), e.identical(a, [ 1, "1" ]), a = r.arrayAppendOnce([ 1 ], -1), 
          e.identical(a, [ 1, -1 ]), a = r.arrayAppendOnce([ 1 ], [ 1 ]), e.identical(a, [ 1, [ 1 ] ]), 
          e.case = "equalizer 2 args";
          var n = [ {
            num: 1
          }, {
            num: 2
          }, {
            num: 3
          } ], i = function(r, e) {
            return r.num === e.num;
          };
          a = r.arrayAppendOnce(n, {
            num: 4
          }, i), e.identical(a, [ {
            num: 1
          }, {
            num: 2
          }, {
            num: 3
          }, {
            num: 4
          } ]), n = [ {
            num: 1
          }, {
            num: 2
          }, {
            num: 3
          } ], i = function(r, e) {
            return r.num === e.num;
          }, a = r.arrayAppendOnce(n, {
            num: 1
          }, i), e.identical(a, [ {
            num: 1
          }, {
            num: 2
          }, {
            num: 3
          } ]), e.case = "equalizer 1 arg", n = [ {
            num: 1
          }, {
            num: 2
          }, {
            num: 3
          } ], i = function(r) {
            return r.num;
          }, a = r.arrayAppendOnce(n, 4, i), e.identical(a, [ {
            num: 1
          }, {
            num: 2
          }, {
            num: 3
          }, 4 ]), n = [ {
            num: 1
          }, {
            num: 2
          }, {
            num: 3
          } ], a = r.arrayAppendOnce(n, 1, r => r.num, r => r), e.identical(a, [ {
            num: 1
          }, {
            num: 2
          }, {
            num: 3
          } ]), e.case = "no args", e.shouldThrowErrorSync(function() {
            r.arrayAppendOnce();
          }), e.case = "dst is not an array", e.shouldThrowErrorSync(function() {
            r.arrayAppendOnce(1, 1);
          }), e.case = "onEqualize is not a function", e.shouldThrowErrorSync(function() {
            r.arrayAppendOnce(1, 1, 1);
          });
        }
        //
        ,
        arrayAppendOnceStrictly: function arrayAppendOnceStrictly(e) {
          e.case = "dstArray is null";
          var a = r.arrayAppendOnceStrictly(null, 1);
          e.identical(a, [ 1 ]), e.case = "simple";
          var n = [];
          a = r.arrayAppendOnceStrictly(n, 1), e.identical(a, [ 1 ]), e.is(a === n), n = [ 1 ], 
          a = r.arrayAppendOnceStrictly(n, 2), e.identical(a, [ 1, 2 ]), e.is(a === n), n = [ 1 ], 
          a = r.arrayAppendOnceStrictly(n, "1"), e.identical(a, [ 1, "1" ]), e.is(a === n), 
          n = [ 1 ], a = r.arrayAppendOnceStrictly(n, -1), e.identical(a, [ 1, -1 ]), e.is(a === n), 
          n = [ 1 ], a = r.arrayAppendOnceStrictly(n, [ 1 ]), e.identical(a, [ 1, [ 1 ] ]), 
          e.case = "equalizer 2 args", n = [ {
            num: 1
          }, {
            num: 2
          }, {
            num: 3
          } ];
          var i = function(r, e) {
            return r.num === e.num;
          };
          a = r.arrayAppendOnceStrictly(n, {
            num: 4
          }, i), e.identical(a, [ {
            num: 1
          }, {
            num: 2
          }, {
            num: 3
          }, {
            num: 4
          } ]), e.is(a === n), e.case = "equalizer 1 arg", n = [ {
            num: 1
          }, {
            num: 2
          }, {
            num: 3
          } ], i = function(r) {
            return r.num;
          }, a = r.arrayAppendOnceStrictly(n, 4, i), e.identical(a, [ {
            num: 1
          }, {
            num: 2
          }, {
            num: 3
          }, 4 ]), e.is(a === n), e.case = "no args", e.shouldThrowErrorSync(function() {
            r.arrayAppendOnceStrictly();
          }), e.case = "dst is not an array", e.shouldThrowErrorSync(function() {
            r.arrayAppendOnceStrictly(1, 1);
          }), e.case = "ins already exists in dst", e.shouldThrowErrorSync(function() {
            r.arrayAppendOnceStrictly([ 1 ], 1);
          }), e.shouldThrowErrorSync(function() {
            r.arrayAppendOnceStrictly([ 1, 2, 3 ], 3);
          }), 
          // test.case = 'onEqualize is not a routine';
          // test.shouldThrowErrorSync( function()
          // {
          //   _.arrayAppendOnceStrictly( [ 1,2,3 ], 3, 3 );
          // });
          e.shouldThrowErrorSync(function() {
            r.arrayAppendOnceStrictly([ {
              num: 1
            }, {
              num: 2
            }, {
              num: 3
            } ], {
              num: 1
            }, function(r, e) {
              return r.num === e.num;
            });
          });
        }
        //
        ,
        arrayAppended: function arrayAppended(e) {
          e.case = "simple";
          var a = [], n = r.arrayAppended(a, 1);
          e.identical(a, [ 1 ]), e.identical(n, 0), a = [ 1 ], n = r.arrayAppended(a, 1), 
          e.identical(a, [ 1, 1 ]), e.identical(n, 1), a = [ 1 ], n = r.arrayAppended(a, 2), 
          e.identical(a, [ 1, 2 ]), e.identical(n, 1), a = [ 1, 2, 3 ], n = r.arrayAppended(a, 3), 
          e.identical(a, [ 1, 2, 3, 3 ]), e.identical(n, 3), a = [ 1 ], n = r.arrayAppended(a, "1"), 
          e.identical(a, [ 1, "1" ]), e.identical(n, 1), a = [ 1 ], n = r.arrayAppended(a, -1), 
          e.identical(a, [ 1, -1 ]), e.identical(n, 1), a = [ 1 ], n = r.arrayAppended(a, [ 1 ]), 
          e.identical(a, [ 1, [ 1 ] ]), e.identical(n, 1), e.case = "no args", e.shouldThrowErrorSync(function() {
            r.arrayAppended();
          }), e.case = "too many args", e.shouldThrowErrorSync(function() {
            r.arrayAppended([], 1, 1, 1);
          }), e.case = "dst is not an array", e.shouldThrowErrorSync(function() {
            r.arrayAppended(1, 1);
          });
        }
        //
        ,
        arrayAppendedOnce: function arrayAppendedOnce(e) {
          e.case = "simple";
          var a = [], n = r.arrayAppendedOnce(a, 1);
          e.identical(a, [ 1 ]), e.identical(n, 0), a = [ 1 ], n = r.arrayAppendedOnce(a, 1), 
          e.identical(a, [ 1 ]), e.identical(n, -1), a = [ 1 ], n = r.arrayAppendedOnce(a, 2), 
          e.identical(a, [ 1, 2 ]), e.identical(n, 1), a = [ 1, 2, 3 ], n = r.arrayAppendedOnce(a, 3), 
          e.identical(a, [ 1, 2, 3 ]), e.identical(n, -1), a = [ 1 ], n = r.arrayAppendedOnce(a, "1"), 
          e.identical(a, [ 1, "1" ]), e.identical(n, 1), a = [ 1 ], n = r.arrayAppendedOnce(a, -1), 
          e.identical(a, [ 1, -1 ]), e.identical(n, 1), a = [ 1 ], n = r.arrayAppendedOnce(a, [ 1 ]), 
          e.identical(a, [ 1, [ 1 ] ]), e.identical(n, 1), e.case = "equalizer 2 args", a = [ {
            num: 1
          }, {
            num: 2
          }, {
            num: 3
          } ];
          var i = function(r, e) {
            return r.num === e.num;
          };
          n = r.arrayAppendedOnce(a, {
            num: 4
          }, i), e.identical(a, [ {
            num: 1
          }, {
            num: 2
          }, {
            num: 3
          }, {
            num: 4
          } ]), e.identical(n, 3), a = [ {
            num: 1
          }, {
            num: 2
          }, {
            num: 3
          } ], i = function(r, e) {
            return r.num === e.num;
          }, n = r.arrayAppendedOnce(a, {
            num: 1
          }, i), e.identical(a, [ {
            num: 1
          }, {
            num: 2
          }, {
            num: 3
          } ]), e.identical(n, -1), e.case = "equalizer 1 arg", a = [ {
            num: 1
          }, {
            num: 2
          }, {
            num: 3
          } ], i = function(r) {
            return r.num;
          }, n = r.arrayAppendedOnce(a, 4, i), e.identical(a, [ {
            num: 1
          }, {
            num: 2
          }, {
            num: 3
          }, 4 ]), e.identical(n, 3), a = [ {
            num: 1
          }, {
            num: 2
          }, {
            num: 3
          } ], n = r.arrayAppendedOnce(a, 1, r => r.num, r => r), e.identical(a, [ {
            num: 1
          }, {
            num: 2
          }, {
            num: 3
          } ]), e.identical(n, -1), e.case = "no args", e.shouldThrowErrorSync(function() {
            r.arrayAppendedOnce();
          }), e.case = "third is not a routine", e.shouldThrowErrorSync(function() {
            r.arrayAppendedOnce([], 1, 1, 1);
          }), e.case = "dst is not an array", e.shouldThrowErrorSync(function() {
            r.arrayAppendedOnce(1, 1);
          }), e.case = "onEqualize is not a function", e.shouldThrowErrorSync(function() {
            r.arrayAppendedOnce(1, 1, 1);
          });
        }
        //
        ,
        arrayAppendedOnceStrictly: function arrayAppendedOnceStrictly(e) {
          e.case = "simple";
          var a = [], n = r.arrayAppendedOnceStrictly(a, 1);
          e.identical(a, [ 1 ]), e.identical(n, 0), a = [ 1 ], n = r.arrayAppendedOnceStrictly(a, 2), 
          e.identical(a, [ 1, 2 ]), e.identical(n, 1), a = [ 1 ], n = r.arrayAppendedOnceStrictly(a, "1"), 
          e.identical(a, [ 1, "1" ]), e.identical(n, 1), a = [ 1 ], n = r.arrayAppendedOnceStrictly(a, -1), 
          e.identical(a, [ 1, -1 ]), e.identical(n, 1), a = [ 1 ], n = r.arrayAppendedOnceStrictly(a, [ 1 ]), 
          e.identical(a, [ 1, [ 1 ] ]), e.identical(n, 1), e.case = "equalizer 2 args", a = [ {
            num: 1
          }, {
            num: 2
          }, {
            num: 3
          } ];
          var i = function(r, e) {
            return r.num === e.num;
          };
          n = r.arrayAppendedOnceStrictly(a, {
            num: 4
          }, i), e.identical(a, [ {
            num: 1
          }, {
            num: 2
          }, {
            num: 3
          }, {
            num: 4
          } ]), e.identical(n, 3), e.case = "equalizer 1 arg", a = [ {
            num: 1
          }, {
            num: 2
          }, {
            num: 3
          } ], i = function(r) {
            return r.num;
          }, n = r.arrayAppendedOnceStrictly(a, 4, i), e.identical(a, [ {
            num: 1
          }, {
            num: 2
          }, {
            num: 3
          }, 4 ]), e.identical(n, 3), e.case = "no args", e.shouldThrowErrorSync(function() {
            r.arrayAppendedOnceStrictly();
          }), e.case = "third is not a routine", e.shouldThrowErrorSync(function() {
            r.arrayAppendedOnceStrictly([], 1, 1, 1);
          }), e.case = "dst is not an array", e.shouldThrowErrorSync(function() {
            r.arrayAppendedOnceStrictly(1, 1);
          }), e.case = "onEqualize is not a function", e.shouldThrowErrorSync(function() {
            r.arrayAppendedOnceStrictly(1, 1, 1);
          }), e.case = "ins already exists in dst", e.shouldThrowErrorSync(function() {
            r.arrayAppendedOnceStrictly([ 1 ], 1);
          }), e.shouldThrowErrorSync(function() {
            r.arrayAppendedOnceStrictly([ 1, 2, 3 ], 3);
          }), e.shouldThrowErrorSync(function() {
            r.arrayAppendedOnceStrictly([ {
              num: 1
            }, {
              num: 2
            }, {
              num: 3
            } ], {
              num: 1
            }, function(r, e) {
              return r.num === e.num;
            });
          });
        }
        //
        ,
        arrayAppendElement: function arrayAppendElement(e) {
          e.case = "dstArray is null";
          var a = r.arrayAppendElement(null, 1);
          e.identical(a, [ 1 ]), e.case = "simple", a = r.arrayAppendElement([], 1), e.identical(a, [ 1 ]), 
          a = r.arrayAppendElement([ 1 ], 1), e.identical(a, [ 1, 1 ]), a = r.arrayAppendElement([ 1 ], 2), 
          e.identical(a, [ 1, 2 ]), a = r.arrayAppendElement([ 1, 2, 3 ], 3), e.identical(a, [ 1, 2, 3, 3 ]), 
          a = r.arrayAppendElement([ 1 ], "1"), e.identical(a, [ 1, "1" ]), a = r.arrayAppendElement([ 1 ], -1), 
          e.identical(a, [ 1, -1 ]), a = r.arrayAppendElement([ 1 ], [ 1 ]), e.identical(a, [ 1, [ 1 ] ]), 
          e.case = "no args", e.shouldThrowErrorSync(function() {
            r.arrayAppendElement();
          }), e.case = "too many args", e.shouldThrowErrorSync(function() {
            r.arrayAppendElement([], 1, 1, 1);
          }), e.case = "dst is not an array", e.shouldThrowErrorSync(function() {
            r.arrayAppendElement(1, 1);
          });
        }
        //
        ,
        arrayAppendElementOnce: function arrayAppendElementOnce(e) {
          e.case = "dstArray is null";
          var a = r.arrayAppendElementOnce(null, 1);
          e.identical(a, [ 1 ]), e.case = "simple", a = r.arrayAppendElementOnce([], 1), e.identical(a, [ 1 ]), 
          a = r.arrayAppendElementOnce([ 1 ], 1), e.identical(a, [ 1 ]), a = r.arrayAppendElementOnce([ 1 ], 2), 
          e.identical(a, [ 1, 2 ]), a = r.arrayAppendElementOnce([ 1, 2, 3 ], 3), e.identical(a, [ 1, 2, 3 ]), 
          a = r.arrayAppendElementOnce([ 1 ], "1"), e.identical(a, [ 1, "1" ]), a = r.arrayAppendElementOnce([ 1 ], -1), 
          e.identical(a, [ 1, -1 ]), a = r.arrayAppendElementOnce([ 1 ], [ 1 ]), e.identical(a, [ 1, [ 1 ] ]), 
          e.case = "equalizer 2 args";
          var n = [ {
            num: 1
          }, {
            num: 2
          }, {
            num: 3
          } ], i = function(r, e) {
            return r.num === e.num;
          };
          a = r.arrayAppendElementOnce(n, {
            num: 4
          }, i), e.identical(a, [ {
            num: 1
          }, {
            num: 2
          }, {
            num: 3
          }, {
            num: 4
          } ]), n = [ {
            num: 1
          }, {
            num: 2
          }, {
            num: 3
          } ], i = function(r, e) {
            return r.num === e.num;
          }, a = r.arrayAppendElementOnce(n, {
            num: 1
          }, i), e.identical(a, [ {
            num: 1
          }, {
            num: 2
          }, {
            num: 3
          } ]), e.case = "equalizer 1 arg", n = [ {
            num: 1
          }, {
            num: 2
          }, {
            num: 3
          } ], i = function(r) {
            return r.num;
          }, a = r.arrayAppendElementOnce(n, 4, i), e.identical(a, [ {
            num: 1
          }, {
            num: 2
          }, {
            num: 3
          }, 4 ]), n = [ {
            num: 1
          }, {
            num: 2
          }, {
            num: 3
          } ], a = r.arrayAppendElementOnce(n, 1, r => r.num, r => r), e.identical(a, [ {
            num: 1
          }, {
            num: 2
          }, {
            num: 3
          } ]), e.case = "no args", e.shouldThrowErrorSync(function() {
            r.arrayAppendElementOnce();
          }), e.case = "dst is not an array", e.shouldThrowErrorSync(function() {
            r.arrayAppendElementOnce(1, 1);
          }), e.case = "onEqualize is not a function", e.shouldThrowErrorSync(function() {
            r.arrayAppendElementOnce(1, 1, 1);
          });
        }
        //
        ,
        arrayAppendElementOnceStrictly: function arrayAppendElementOnceStrictly(e) {
          e.case = "dstArray is null";
          var a = r.arrayAppendElementOnceStrictly(null, 1);
          e.identical(a, [ 1 ]), e.case = "simple";
          var n = [];
          a = r.arrayAppendElementOnceStrictly(n, 1), e.identical(a, [ 1 ]), e.is(a === n), 
          n = [ 1 ], a = r.arrayAppendElementOnceStrictly(n, 2), e.identical(a, [ 1, 2 ]), 
          e.is(a === n), n = [ 1 ], a = r.arrayAppendElementOnceStrictly(n, "1"), e.identical(a, [ 1, "1" ]), 
          e.is(a === n), n = [ 1 ], a = r.arrayAppendElementOnceStrictly(n, -1), e.identical(a, [ 1, -1 ]), 
          e.is(a === n), n = [ 1 ], a = r.arrayAppendElementOnceStrictly(n, [ 1 ]), e.identical(a, [ 1, [ 1 ] ]), 
          e.case = "equalizer 2 args", n = [ {
            num: 1
          }, {
            num: 2
          }, {
            num: 3
          } ];
          var i = function(r, e) {
            return r.num === e.num;
          };
          a = r.arrayAppendElementOnceStrictly(n, {
            num: 4
          }, i), e.identical(a, [ {
            num: 1
          }, {
            num: 2
          }, {
            num: 3
          }, {
            num: 4
          } ]), e.is(a === n), e.case = "equalizer 1 arg", n = [ {
            num: 1
          }, {
            num: 2
          }, {
            num: 3
          } ], i = function(r) {
            return r.num;
          }, a = r.arrayAppendElementOnceStrictly(n, 4, i), e.identical(a, [ {
            num: 1
          }, {
            num: 2
          }, {
            num: 3
          }, 4 ]), e.is(a === n), e.case = "no args", e.shouldThrowErrorSync(function() {
            r.arrayAppendElementOnceStrictly();
          }), e.case = "dst is not an array", e.shouldThrowErrorSync(function() {
            r.arrayAppendElementOnceStrictly(1, 1);
          }), e.case = "ins already exists in dst", e.shouldThrowErrorSync(function() {
            r.arrayAppendElementOnceStrictly([ 1 ], 1);
          }), e.shouldThrowErrorSync(function() {
            r.arrayAppendElementOnceStrictly([ 1, 2, 3 ], 3);
          }), 
          // test.case = 'onEqualize is not a routine';
          // test.shouldThrowErrorSync( function()
          // {
          //   _.arrayAppendOnceStrictly( [ 1,2,3 ], 3, 3 );
          // });
          e.shouldThrowErrorSync(function() {
            r.arrayAppendElementOnceStrictly([ {
              num: 1
            }, {
              num: 2
            }, {
              num: 3
            } ], {
              num: 1
            }, function(r, e) {
              return r.num === e.num;
            });
          });
        }
        //
        ,
        arrayAppendedElement: function arrayAppendedElement(e) {
          e.case = "simple";
          var a = [], n = r.arrayAppendedElement(a, 1);
          e.identical(a, [ 1 ]), e.identical(n, 0), a = [ 1 ], n = r.arrayAppendedElement(a, 1), 
          e.identical(a, [ 1, 1 ]), e.identical(n, 1), a = [ 1 ], n = r.arrayAppendedElement(a, 2), 
          e.identical(a, [ 1, 2 ]), e.identical(n, 1), a = [ 1, 2, 3 ], n = r.arrayAppendedElement(a, 3), 
          e.identical(a, [ 1, 2, 3, 3 ]), e.identical(n, 3), a = [ 1 ], n = r.arrayAppendedElement(a, "1"), 
          e.identical(a, [ 1, "1" ]), e.identical(n, 1), a = [ 1 ], n = r.arrayAppendedElement(a, -1), 
          e.identical(a, [ 1, -1 ]), e.identical(n, 1), a = [ 1 ], n = r.arrayAppendedElement(a, [ 1 ]), 
          e.identical(a, [ 1, [ 1 ] ]), e.identical(n, 1), e.case = "no args", e.shouldThrowErrorSync(function() {
            r.arrayAppendedElement();
          }), e.case = "too many args", e.shouldThrowErrorSync(function() {
            r.arrayAppendedElement([], 1, 1);
          }), e.case = "dst is not an array", e.shouldThrowErrorSync(function() {
            r.arrayAppendedElement(1, 1);
          });
        }
        //
        ,
        arrayAppendedElementOnce: function arrayAppendedElementOnce(e) {
          e.case = "simple";
          var a = [], n = r.arrayAppendedElementOnce(a, 1);
          e.identical(a, [ 1 ]), e.identical(n, 1), a = [ 1 ], n = r.arrayAppendedElementOnce(a, 1), 
          e.identical(a, [ 1 ]), e.identical(n, !1), a = [ 1 ], n = r.arrayAppendedElementOnce(a, 2), 
          e.identical(a, [ 1, 2 ]), e.identical(n, 2), a = [ 1, 2, 3 ], n = r.arrayAppendedElementOnce(a, 3), 
          e.identical(a, [ 1, 2, 3 ]), e.identical(n, !1), a = [ 1 ], n = r.arrayAppendedElementOnce(a, "1"), 
          e.identical(a, [ 1, "1" ]), e.identical(n, "1"), a = [ 1 ], n = r.arrayAppendedElementOnce(a, -1), 
          e.identical(a, [ 1, -1 ]), e.identical(n, -1), a = [ 1 ], n = r.arrayAppendedElementOnce(a, [ 1 ]), 
          e.identical(a, [ 1, [ 1 ] ]), e.identical(n, [ 1 ]), a = [ 0, 1, 2 ], n = r.arrayAppendedElementOnce(a, NaN), 
          e.identical(a, [ 0, 1, 2, NaN ]), e.identical(n, NaN), e.case = "equalizer 2 args", 
          a = [ {
            num: 1
          }, {
            num: 2
          }, {
            num: 3
          } ];
          var i = function(r, e) {
            return r.num === e.num;
          };
          n = r.arrayAppendedElementOnce(a, {
            num: 4
          }, i), e.identical(a, [ {
            num: 1
          }, {
            num: 2
          }, {
            num: 3
          }, {
            num: 4
          } ]), e.identical(n, {
            num: 4
          }), a = [ {
            num: 1
          }, {
            num: 2
          }, {
            num: 3
          } ], i = function(r, e) {
            return r.num === e.num;
          }, n = r.arrayAppendedElementOnce(a, {
            num: 1
          }, i), e.identical(a, [ {
            num: 1
          }, {
            num: 2
          }, {
            num: 3
          } ]), e.identical(n, !1), e.case = "equalizer 1 arg", a = [ {
            num: 1
          }, {
            num: 2
          }, {
            num: 3
          } ], i = function(r) {
            return r.num;
          }, n = r.arrayAppendedElementOnce(a, 4, i), e.identical(a, [ {
            num: 1
          }, {
            num: 2
          }, {
            num: 3
          }, 4 ]), e.identical(n, 4), a = [ {
            num: 1
          }, {
            num: 2
          }, {
            num: 3
          } ], n = r.arrayAppendedElementOnce(a, 1, r => r.num, r => r), e.identical(a, [ {
            num: 1
          }, {
            num: 2
          }, {
            num: 3
          } ]), e.identical(n, !1), e.case = "no args", e.shouldThrowErrorSync(function() {
            r.arrayAppendedElementOnce();
          }), e.case = "third is not a routine", e.shouldThrowErrorSync(function() {
            r.arrayAppendedElementOnce([], 1, 1, 1);
          }), e.case = "dst is not an array", e.shouldThrowErrorSync(function() {
            r.arrayAppendedElementOnce(1, 1);
          }), e.case = "onEqualize is not a function", e.shouldThrowErrorSync(function() {
            r.arrayAppendedElementOnce(1, 1, 1);
          });
        }
        //
        ,
        arrayAppendedElementOnceStrictly: function arrayAppendedElementOnceStrictly(e) {
          e.case = "simple";
          var a = [], n = r.arrayAppendedElementOnceStrictly(a, 1);
          e.identical(a, [ 1 ]), e.identical(n, 1), a = [ 1 ], n = r.arrayAppendedElementOnceStrictly(a, 2), 
          e.identical(a, [ 1, 2 ]), e.identical(n, 2), a = [ 1 ], n = r.arrayAppendedElementOnceStrictly(a, "1"), 
          e.identical(a, [ 1, "1" ]), e.identical(n, "1"), a = [ 1 ], n = r.arrayAppendedElementOnceStrictly(a, -1), 
          e.identical(a, [ 1, -1 ]), e.identical(n, -1), a = [ 1 ], n = r.arrayAppendedElementOnceStrictly(a, [ 1 ]), 
          e.identical(a, [ 1, [ 1 ] ]), e.identical(n, [ 1 ]), e.case = "equalizer 2 args", 
          a = [ {
            num: 1
          }, {
            num: 2
          }, {
            num: 3
          } ];
          var i = function(r, e) {
            return r.num === e.num;
          };
          n = r.arrayAppendedElementOnceStrictly(a, {
            num: 4
          }, i), e.identical(a, [ {
            num: 1
          }, {
            num: 2
          }, {
            num: 3
          }, {
            num: 4
          } ]), e.identical(n, {
            num: 4
          }), e.case = "equalizer 1 arg", a = [ {
            num: 1
          }, {
            num: 2
          }, {
            num: 3
          } ], i = function(r) {
            return r.num;
          }, n = r.arrayAppendedElementOnceStrictly(a, 4, i), e.identical(a, [ {
            num: 1
          }, {
            num: 2
          }, {
            num: 3
          }, 4 ]), e.identical(n, 4), e.case = "no args", e.shouldThrowErrorSync(function() {
            r.arrayAppendedElementOnceStrictly();
          }), e.case = "fourth is not a routine", e.shouldThrowErrorSync(function() {
            r.arrayAppendedOnceStrictly([], 1, 1, 1);
          }), e.case = "dst is not an array", e.shouldThrowErrorSync(function() {
            r.arrayAppendedElementOnceStrictly(1, 1);
          }), e.case = "onEqualize is not a function", e.shouldThrowErrorSync(function() {
            r.arrayAppendedElementOnceStrictly(1, 1, 1);
          }), e.case = "ins already exists in dst", e.shouldThrowErrorSync(function() {
            r.arrayAppendedElementOnceStrictly([ 1 ], 1);
          }), e.shouldThrowErrorSync(function() {
            r.arrayAppendedElementOnceStrictly([ 1, 2, 3 ], 3);
          }), e.shouldThrowErrorSync(function() {
            r.arrayAppendedElementOnceStrictly([ {
              num: 1
            }, {
              num: 2
            }, {
              num: 3
            } ], {
              num: 1
            }, function(r, e) {
              return r.num === e.num;
            });
          });
        }
        // //
        //
        // function arrayAppendArray( test )
        // {
        //
        //   test.case = 'nothing';
        //   var got = _.arrayAppendArray( [  ] );
        //   var expected = [  ];
        //   test.identical( got, expected );
        //
        //   test.case = 'an argument';
        //   var got = _.arrayAppendArray( [ 1, 2, undefined ] );
        //   var expected = [ 1, 2, undefined ];
        //   test.identical( got, expected );
        //
        //   test.case = 'an array';
        //   var got = _.arrayAppendArray( [ 1, 2 ], 'str', false, { a : 1 }, 42, [ 3, 7, 13 ] );
        //   var expected = [ 1, 2, 'str', false, { a : 1 }, 42, 3, 7, 13 ];
        //   test.identical( got, expected );
        //
        //   /**/
        //
        //   if( !Config.debug )
        //   return;
        //
        //   test.case = 'no arguments';
        //   test.shouldThrowErrorSync( function()
        //   {
        //     _.arrayAppendArray();
        //   });
        //
        //   test.case = 'arguments[0] is wrong, has to be an array';
        //   test.shouldThrowErrorSync( function()
        //   {
        //     _.arrayAppendArray( 'wrong argument', 'str', false, { a : 1 }, 42, [ 3, 7, 13 ] );
        //   });
        //
        //   test.case = 'arguments[1] is undefined';
        //   test.shouldThrowErrorSync( function()
        //   {
        //     _.arrayAppendArray( [ 1, 2 ], undefined, false, { a : 1 }, 42, [ 3, 7, 13 ] );
        //   });
        //
        // };
        //
        ,
        arrayAppendArray: function arrayAppendArray(e) {
          e.case = "dstArray is null";
          var a = r.arrayAppendArray(null, [ 1 ]);
          e.identical(a, [ 1 ]), e.case = "nothing", a = r.arrayAppendArray([], []), e.identical(a, []), 
          e.case = "simple";
          var n = [];
          a = r.arrayAppendArray(n, [ 1, 2, 3 ]), e.identical(n, [ 1, 2, 3 ]), e.is(a === n), 
          n = [ 1, 2, 3 ], a = r.arrayAppendArray(n, [ 4, 5 ]), e.identical(n, [ 1, 2, 3, 4, 5 ]), 
          e.is(a === n), n = [ 1, 1, 1 ], a = r.arrayAppendArray(n, [ 1, 1 ]), e.identical(n, [ 1, 1, 1, 1, 1 ]), 
          e.is(a === n), e.case = "mixed arguments types", n = [ 1 ], a = r.arrayAppendArray(n, [ "a", 1, [ {
            a: 1
          } ], {
            b: 2
          } ]), e.identical(n, [ 1, "a", 1, [ {
            a: 1
          } ], {
            b: 2
          } ]), e.is(a === n), e.case = "argument is undefined", n = [ 1 ], e.shouldThrowErrorSync(function() {
            r.arrayAppendArray(n, void 0);
          }), e.identical(n, [ 1 ]), e.case = "array has undefined", n = [ 1 ], a = r.arrayAppendArray(n, [ void 0, 2 ]), 
          e.identical(n, [ 1, void 0, 2 ]), e.is(a === n), e.case = "no arguments", e.shouldThrowErrorSync(function() {
            r.arrayAppendArray();
          }), e.case = "too many args", e.shouldThrowErrorSync(function() {
            r.arrayAppendArray([ 1, 2 ], [ 1 ], [ 2 ]);
          }), e.case = "second args is not longIs", e.shouldThrowErrorSync(function() {
            r.arrayAppendArray([ 1, 2 ], 2);
          });
        },
        arrayAppendArrayOnce: 
        //
        function arrayAppendArrayOnce(e) {
          e.case = "dstArray is null";
          var a = r.arrayAppendArrayOnce(null, [ 1 ]);
          e.identical(a, [ 1 ]), e.case = "nothing", a = r.arrayAppendArrayOnce([], []), e.identical(a, []), 
          e.case = "simple";
          var n = [];
          a = r.arrayAppendArrayOnce(n, [ 1, 2, 3 ]), e.identical(n, [ 1, 2, 3 ]), e.is(a === n), 
          e.case = "appends only unique elements", n = [ 1, 2, 3 ], a = r.arrayAppendArrayOnce(n, [ 2, 4, 5 ]), 
          e.identical(n, [ 1, 2, 3, 4, 5 ]), e.is(a === n), n = [ 1, 1, 1 ], a = r.arrayAppendArrayOnce(n, [ 1 ]), 
          e.identical(n, [ 1, 1, 1 ]), e.is(a === n), e.case = "mixed arguments types", n = [ 1 ], 
          a = r.arrayAppendArrayOnce(n, [ "a", 1, [ {
            a: 1
          } ], {
            b: 2
          } ]), e.identical(n, [ 1, "a", [ {
            a: 1
          } ], {
            b: 2
          } ]), e.is(a === n), e.case = "argument is undefined", n = [ 1 ], e.shouldThrowErrorSync(function() {
            r.arrayAppendArrayOnce(n, void 0);
          }), e.identical(n, [ 1 ]), e.case = "array has undefined", n = [ 1 ], e.mustNotThrowError(function() {
            r.arrayAppendArrayOnce(n, [ void 0, 2 ]);
          }), e.identical(n, [ 1, void 0, 2 ]), e.case = "no arguments", e.shouldThrowErrorSync(function() {
            r.arrayAppendArrayOnce();
          }), e.case = "too many args", e.shouldThrowErrorSync(function() {
            r.arrayAppendArrayOnce([ 1, 2 ], [ 1 ], [ 2 ]);
          }), e.case = "second args is not longIs", e.shouldThrowErrorSync(function() {
            r.arrayAppendArrayOnce([ 1, 2 ], 2);
          });
        }
        //
        ,
        arrayAppendArrayOnceStrictly: function arrayAppendArrayOnceStrictly(e) {
          e.case = "dstArray is null";
          var a = r.arrayAppendArrayOnceStrictly(null, [ 1 ]);
          e.identical(a, [ 1 ]), e.case = "nothing", a = r.arrayAppendArrayOnceStrictly([], []), 
          e.identical(a, []), e.case = "simple";
          var n = [];
          a = r.arrayAppendArrayOnceStrictly(n, [ 1, 2, 3 ]), e.identical(n, [ 1, 2, 3 ]), 
          e.is(a === n), n = [ 1, 2, 3 ], a = r.arrayAppendArrayOnceStrictly(n, [ 4, 5 ]), 
          e.identical(n, [ 1, 2, 3, 4, 5 ]), e.is(a === n), e.case = "argument is undefined", 
          n = [ 1 ], e.shouldThrowErrorSync(function() {
            r.arrayAppendArrayOnceStrictly(n, void 0);
          }), e.identical(n, [ 1 ]), e.case = "array has undefined", n = [ 1 ], e.mustNotThrowError(function() {
            r.arrayAppendArrayOnceStrictly(n, [ void 0, 2 ]);
          }), e.identical(n, [ 1, void 0, 2 ]), e.case = "no arguments", e.shouldThrowErrorSync(function() {
            r.arrayAppendArrayOnceStrictly();
          }), e.case = "too many args", e.shouldThrowErrorSync(function() {
            r.arrayAppendArrayOnceStrictly([ 1, 2 ], [ 1 ], [ 2 ]);
          }), e.case = "second args is not longIs", e.shouldThrowErrorSync(function() {
            r.arrayAppendArrayOnceStrictly([ 1, 2 ], 2);
          }), e.case = "one of elements is not unique", n = [ 1, 2, 3 ], e.shouldThrowErrorSync(function() {
            r.arrayAppendArrayOnceStrictly(n, [ 4, 5, 2 ]);
          }), e.identical(n, [ 1, 2, 3, 4, 5 ]), n = [ 1, 1, 1 ], e.shouldThrowErrorSync(function() {
            r.arrayAppendArrayOnceStrictly(n, [ 1 ]);
          }), e.identical(n, [ 1, 1, 1 ]);
        }
        //
        ,
        arrayAppendedArray: function arrayAppendedArray(e) {
          e.case = "nothing";
          var a = [], n = r.arrayAppendedArray(a, []);
          e.identical(a, []), e.identical(n, 0), e.case = "simple", a = [], n = r.arrayAppendedArray(a, [ 1, 2, 3 ]), 
          e.identical(a, [ 1, 2, 3 ]), e.identical(n, 3), e.case = "prepends only unique elements", 
          a = [ 1, 2, 3 ], n = r.arrayAppendedArray(a, [ 2, 4, 5 ]), e.identical(a, [ 1, 2, 3, 2, 4, 5 ]), 
          e.identical(n, 3), a = [ 1, 1, 1 ], n = r.arrayAppendedArray(a, [ 1 ]), e.identical(a, [ 1, 1, 1, 1 ]), 
          e.identical(n, 1), e.case = "mixed arguments types", a = [ 1 ], n = r.arrayAppendedArray(a, [ "a", 1, [ {
            a: 1
          } ], {
            b: 2
          } ]), e.identical(a, [ 1, "a", 1, [ {
            a: 1
          } ], {
            b: 2
          } ]), e.identical(n, 4), e.case = "argument is undefined", a = [ 1 ], e.shouldThrowErrorSync(function() {
            r.arrayAppendedArray(a, void 0);
          }), e.identical(a, [ 1 ]), e.case = "array has undefined", a = [ 1 ], e.mustNotThrowError(function() {
            r.arrayAppendedArray(a, [ void 0, 2 ]);
          }), e.identical(a, [ 1, void 0, 2 ]), e.case = "no arguments", e.shouldThrowErrorSync(function() {
            r.arrayAppendedArray();
          }), e.case = "too many args", e.shouldThrowErrorSync(function() {
            r.arrayAppendedArray([ 1, 2 ], [ 1 ], [ 2 ]);
          }), e.case = "second args is not longIs", e.shouldThrowErrorSync(function() {
            r.arrayAppendedArray([ 1, 2 ], 2);
          });
        }
        //
        ,
        arrayAppendedArrayOnce: function arrayAppendedArrayOnce(e) {
          e.case = "nothing";
          var a = [], n = r.arrayAppendedArrayOnce(a, []);
          e.identical(a, []), e.identical(n, 0), e.case = "simple", a = [], n = r.arrayAppendedArrayOnce(a, [ 1, 2, 3 ]), 
          e.identical(a, [ 1, 2, 3 ]), e.identical(n, 3), e.case = "prepends only unique elements", 
          a = [ 1, 2, 3 ], n = r.arrayAppendedArrayOnce(a, [ 2, 4, 5 ]), e.identical(a, [ 1, 2, 3, 4, 5 ]), 
          e.identical(n, 2), a = [ 1, 1, 1 ], n = r.arrayAppendedArrayOnce(a, [ 1 ]), e.identical(a, [ 1, 1, 1 ]), 
          e.identical(n, 0), e.case = "mixed arguments types", a = [ 1 ], n = r.arrayAppendedArrayOnce(a, [ "a", 1, [ {
            a: 1
          } ], {
            b: 2
          } ]), e.identical(a, [ 1, "a", [ {
            a: 1
          } ], {
            b: 2
          } ]), e.identical(n, 3), e.case = "array has undefined", a = [ 1 ], e.mustNotThrowError(function() {
            r.arrayAppendedArrayOnce(a, [ void 0, 2 ]);
          }), e.identical(a, [ 1, void 0, 2 ]), e.case = "argument is undefined", a = [ 1 ], 
          e.shouldThrowErrorSync(function() {
            r.arrayAppendedArrayOnce(a, void 0);
          }), e.identical(a, [ 1 ]), e.case = "no arguments", e.shouldThrowErrorSync(function() {
            r.arrayAppendedArrayOnce();
          }), e.case = "too many args", e.shouldThrowErrorSync(function() {
            r.arrayAppendedArrayOnce([ 1, 2 ], [ 1 ], [ 2 ]);
          }), e.case = "second args is not longIs", e.shouldThrowErrorSync(function() {
            r.arrayAppendedArrayOnce([ 1, 2 ], 2);
          });
        }
        //
        ,
        arrayAppendedArrayOnceWithSelector: function arrayAppendedArrayOnceWithSelector(e) {
          e.case = "nothing, single equalizer";
          var a = [], n = r.arrayAppendedArrayOnce(a, [], r => r.a);
          e.identical(a, []), e.identical(n, 0), e.case = "simple, single equalizer", a = [], 
          n = r.arrayAppendedArrayOnce(a, [ {
            a: 1
          }, {
            a: 2
          }, {
            a: 3
          } ], r => r.a), e.identical(a, [ {
            a: 1
          }, {
            a: 2
          }, {
            a: 3
          } ]), e.identical(n, 3), e.case = "prepends only unique elements, single equalizer", 
          a = [ {
            a: 1
          }, {
            a: 2
          }, {
            a: 3
          } ], n = r.arrayAppendedArrayOnce(a, [ {
            a: 2
          }, {
            a: 3
          }, {
            a: 4
          } ], r => r.a), e.identical(a, [ {
            a: 1
          }, {
            a: 2
          }, {
            a: 3
          }, {
            a: 4
          } ]), e.identical(n, 1), a = [ {
            a: 1
          }, {
            a: 1
          }, {
            a: 1
          } ], n = r.arrayAppendedArrayOnce(a, [ {
            a: 1
          } ], r => r.a), e.identical(a, [ {
            a: 1
          }, {
            a: 1
          }, {
            a: 1
          } ]), e.identical(n, 0), e.case = "mixed arguments types, single equalizer", a = [ {
            a: 1
          } ], n = r.arrayAppendedArrayOnce(a, [ {
            a: "a"
          }, {
            a: 1
          }, {
            a: [ {
              y: 2
            } ]
          } ], r => r.a), e.identical(a, [ {
            a: 1
          }, {
            a: "a"
          }, {
            a: [ {
              y: 2
            } ]
          } ]), e.identical(n, 2), e.case = "array has undefined, single equalizer", a = [ {
            a: 1
          } ], n = r.arrayAppendedArrayOnce(a, [ {
            a: void 0
          }, {
            a: 2
          } ], r => r.a), e.identical(a, [ {
            a: 1
          }, {
            a: void 0
          }, {
            a: 2
          } ]), e.identical(n, 2), a = [ {
            a: 1
          }, {
            a: void 0
          } ], n = r.arrayAppendedArrayOnce(a, [ {
            a: void 0
          }, {
            a: 2
          } ], r => r.a), e.identical(a, [ {
            a: 1
          }, {
            a: void 0
          }, {
            a: 2
          } ]), e.identical(n, 1), 
          /* */
          e.case = "nothing, two equalizers", a = [], n = r.arrayAppendedArrayOnce(a, [], r => r.a, r => r.b), 
          e.identical(a, []), e.identical(n, 0), e.case = "simple, two equalizers", a = [], 
          n = r.arrayAppendedArrayOnce(a, [ {
            b: 1
          }, {
            b: 2
          }, {
            b: 3
          } ], r => r.a, r => r.b), e.identical(a, [ {
            b: 1
          }, {
            b: 2
          }, {
            b: 3
          } ]), e.identical(n, 3), e.case = "prepends only unique elements, two equalizers", 
          a = [ {
            a: 1
          }, {
            a: 2
          }, {
            a: 3
          } ], n = r.arrayAppendedArrayOnce(a, [ {
            b: 2
          }, {
            b: 3
          }, {
            b: 4
          } ], r => r.a, r => r.b), e.identical(a, [ {
            a: 1
          }, {
            a: 2
          }, {
            a: 3
          }, {
            b: 4
          } ]), e.identical(n, 1), a = [ {
            a: 1
          }, {
            a: 1
          }, {
            a: 1
          } ], n = r.arrayAppendedArrayOnce(a, [ {
            b: 1
          } ], r => r.a, r => r.b), e.identical(a, [ {
            a: 1
          }, {
            a: 1
          }, {
            a: 1
          } ]), e.identical(n, 0), e.case = "mixed arguments types, two equalizers", a = [ {
            a: 1
          } ], n = r.arrayAppendedArrayOnce(a, [ {
            b: "a"
          }, {
            b: 1
          }, {
            b: [ {
              y: 2
            } ]
          } ], r => r.a, r => r.b), e.identical(a, [ {
            a: 1
          }, {
            b: "a"
          }, {
            b: [ {
              y: 2
            } ]
          } ]), e.identical(n, 2), e.case = "array has undefined, two equalizers", a = [ {
            a: 1
          } ], e.mustNotThrowError(function() {
            r.arrayAppendedArrayOnce(a, [ {
              b: void 0
            }, {
              b: 2
            } ], r => r.a, r => r.b);
          }), e.identical(a, [ {
            a: 1
          }, {
            b: void 0
          }, {
            b: 2
          } ]), e.identical(n, 2), a = [ {
            a: 1
          }, {
            a: void 0
          } ], n = r.arrayAppendedArrayOnce(a, [ {
            b: void 0
          }, {
            b: 2
          } ], r => r.a, r => r.b), e.identical(a, [ {
            a: 1
          }, {
            b: void 0
          }, {
            b: 2
          } ]), e.identical(n, 1), e.case = "argument is undefined", a = [ 1 ], e.shouldThrowErrorSync(function() {
            r.arrayAppendedArrayOnce(a, void 0, r => r.a);
          }), e.identical(a, [ 1 ]), e.case = "no arguments", e.shouldThrowErrorSync(function() {
            r.arrayAppendedArrayOnce();
          }), e.case = "too many args", e.shouldThrowErrorSync(function() {
            r.arrayAppendedArrayOnce([ 1, 2 ], [ 1 ], [ 2 ]);
          }), e.case = "second args is not longIs", e.shouldThrowErrorSync(function() {
            r.arrayAppendedArrayOnce([ 1, 2 ], 2, r => r.a);
          });
        }
        //
        ,
        arrayAppendedArrayOnceStrictly: function arrayAppendedArrayOnceStrictly(e) {
          e.case = "nothing";
          var a = r.arrayAppendedArrayOnceStrictly([], []);
          e.identical(a, 0), e.case = "simple";
          var n = [];
          a = r.arrayAppendedArrayOnceStrictly(n, [ 1, 2, 3 ]), e.identical(n, [ 1, 2, 3 ]), 
          e.identical(a, 3), n = [ 1, 2, 3 ], a = r.arrayAppendedArrayOnceStrictly(n, [ 4, 5 ]), 
          e.identical(n, [ 1, 2, 3, 4, 5 ]), e.identical(a, 2), e.case = "argument is undefined", 
          n = [ 1 ], e.shouldThrowErrorSync(function() {
            r.arrayAppendedArrayOnceStrictly(n, void 0);
          }), e.identical(n, [ 1 ]), e.case = "array has undefined", n = [ 1 ], e.mustNotThrowError(function() {
            r.arrayAppendedArrayOnceStrictly(n, [ void 0, 2 ]);
          }), e.identical(n, [ 1, void 0, 2 ]), e.case = "no arguments", e.shouldThrowErrorSync(function() {
            r.arrayAppendedArrayOnceStrictly();
          }), e.case = "too many args", e.shouldThrowErrorSync(function() {
            r.arrayAppendedArrayOnceStrictly([ 1, 2 ], [ 1 ], [ 2 ]);
          }), e.case = "second args is not longIs", e.shouldThrowErrorSync(function() {
            r.arrayAppendedArrayOnceStrictly([ 1, 2 ], 2);
          }), e.case = "one of elements is not unique", n = [ 1, 2, 3 ], e.shouldThrowErrorSync(function() {
            r.arrayAppendedArrayOnceStrictly(n, [ 4, 5, 2 ]);
          }), e.identical(n, [ 1, 2, 3, 4, 5 ]), n = [ 1, 1, 1 ], e.shouldThrowErrorSync(function() {
            r.arrayAppendedArrayOnceStrictly(n, [ 1 ]);
          }), e.identical(n, [ 1, 1, 1 ]);
        }
        //
        ,
        arrayAppendArrays: function arrayAppendArrays(e) {
          e.case = "dstArray is null, src is scalar";
          var a = r.arrayAppendArrays(null, 1);
          e.identical(a, [ 1 ]), e.case = "dstArray is null, src is array", a = r.arrayAppendArrays(null, [ 1 ]), 
          e.identical(a, [ 1 ]), 
          // test.case = 'dstArray is undefined, src is scalar';
          // var got = _.arrayAppendArrays( undefined, 1 );
          // test.identical( got, 1 );
          //
          // test.case = 'dstArray is undefined, src is array';
          // let src = [ 1 ];
          // var got = _.arrayAppendArrays( undefined, src );
          // test.identical( got, [ 1 ] );
          // test.is( src === got );
          e.case = "nothing", a = r.arrayAppendArrays([], []), e.identical(a, []), e.case = "simple";
          var n = [];
          a = r.arrayAppendArrays(n, [ 1, 2, 3 ]), e.identical(n, [ 1, 2, 3 ]), e.is(a === n), 
          n = [ 1, 2, 3 ], a = r.arrayAppendArrays(n, [ 4, 5 ]), e.identical(n, [ 1, 2, 3, 4, 5 ]), 
          e.is(a === n), n = [ 1, 1, 1 ], a = r.arrayAppendArrays(n, [ 1, 1 ]), e.identical(n, [ 1, 1, 1, 1, 1 ]), 
          e.is(a === n), n = [ 1, 2, 3 ];
          var i = [ [ 1 ], [ 2 ], [ 3, [ 5 ] ] ];
          a = r.arrayAppendArrays(n, i), e.identical(n, [ 1, 2, 3, 1, 2, 3, [ 5 ] ]), e.is(a === n), 
          e.case = "arguments are not arrays", n = [], a = r.arrayAppendArrays(n, [ 1, 2, 3 ]), 
          e.identical(n, [ 1, 2, 3 ]), e.is(a === n), e.case = "mixed arguments types", n = [ 1 ], 
          i = [ "a", 1, [ {
            a: 1
          } ], {
            b: 2
          } ], a = r.arrayAppendArrays(n, i), e.identical(n, [ 1, "a", 1, {
            a: 1
          }, {
            b: 2
          } ]), e.is(a === n), e.case = "argument is undefined", n = [ 1 ], e.shouldThrowErrorSync(function() {
            r.arrayAppendArrays(n, void 0);
          }), e.identical(n, [ 1 ]), e.case = "array has undefined", n = [ 1 ], a = r.arrayAppendArrays(n, [ void 0, 2 ]), 
          e.identical(n, [ 1, void 0, 2 ]), e.is(a === n), e.case = "no arguments", e.shouldThrowErrorSync(function() {
            r.arrayAppendArrays();
          }), e.case = "dst is not a array", e.shouldThrowErrorSync(function() {
            r.arrayAppendArrays(1, [ 2 ]);
          }), e.case = "second arg is not a ArrayLike entity", e.shouldThrowErrorSync(function() {
            r.arrayAppendArrays([], void 0);
          }), e.case = "too many args", e.shouldThrowErrorSync(function() {
            r.arrayAppendArrays([], [ 1 ], [ 2 ]);
          });
        },
        arrayAppendArraysOnce: 
        //
        function arrayAppendArraysOnce(e) {
          e.case = "dstArray is null";
          var a = r.arrayAppendArraysOnce(null, [ 1 ]);
          e.identical(a, [ 1 ]), e.case = "nothing", a = r.arrayAppendArraysOnce([], []), 
          e.identical(a, []), e.case = "simple";
          var n = [];
          a = r.arrayAppendArraysOnce(n, [ 1, 2, 3 ]), e.identical(n, [ 1, 2, 3 ]), e.is(a === n), 
          e.case = "prepends only unique elements", n = [ 1, 2, 3 ], a = r.arrayAppendArraysOnce(n, [ 2, 4, 5 ]), 
          e.identical(n, [ 1, 2, 3, 4, 5 ]), e.is(a === n), n = [ 1, 1, 1 ], a = r.arrayAppendArraysOnce(n, [ 1 ]), 
          e.identical(n, [ 1, 1, 1 ]), e.is(a === n), e.case = "mixed arguments types", n = [ 1 ];
          var i = [ "a", 1, [ {
            a: 1
          } ], {
            b: 2
          } ];
          a = r.arrayAppendArraysOnce(n, i), e.identical(n, [ 1, "a", {
            a: 1
          }, {
            b: 2
          } ]), e.is(a === n), n = [ 1, 2, 3, 5 ], i = [ [ 1 ], [ 2 ], [ 3, [ 4, [ 5 ] ], 6 ] ], 
          a = r.arrayAppendArraysOnce(n, i), e.identical(n, [ 1, 2, 3, 5, [ 4, [ 5 ] ], 6 ]), 
          e.is(a === n), n = [ 1, 3 ], a = r.arrayAppendArraysOnce(n, [ 1, 2, 3 ]), e.identical(a, [ 1, 3, 2 ]), 
          e.identical(n, a), e.case = "onEqualize", n = [ 1, 3 ], a = r.arrayAppendArraysOnce(n, [ 1, 2, 3 ], function onEqualize(r, e) {
            return r === e;
          }), e.identical(a, [ 1, 3, 2 ]), e.identical(n, a), e.case = "array has undefined", 
          n = [ 1 ], e.mustNotThrowError(function() {
            r.arrayAppendArraysOnce(n, [ void 0, 2 ]);
          }), e.identical(n, [ 1, void 0, 2 ]), e.case = "no arguments", e.shouldThrowErrorSync(function() {
            r.arrayAppendArraysOnce();
          }), e.case = "dst is not a array", e.shouldThrowErrorSync(function() {
            r.arrayAppendArraysOnce(1, [ 2 ]);
          }), e.case = "onEqualize is not a routine", e.shouldThrowErrorSync(function() {
            r.arrayAppendArraysOnce([], [ 1, 2, 3 ], []);
          }), e.case = "argument is undefined", n = [ 1 ], e.shouldThrowErrorSync(function() {
            r.arrayAppendArraysOnce(n, void 0);
          }), e.identical(n, [ 1 ]);
        }
        //
        ,
        arrayAppendArraysOnceStrictly: function arrayAppendArraysOnceStrictly(e) {
          e.case = "dstArray is null";
          var a = r.arrayAppendArraysOnceStrictly(null, [ 1 ]);
          e.identical(a, [ 1 ]), e.case = "nothing", a = r.arrayAppendArraysOnceStrictly([], []), 
          e.identical(a, []), e.case = "simple";
          var n = [];
          a = r.arrayAppendArraysOnceStrictly(n, [ 1, 2, 3 ]), e.identical(n, [ 1, 2, 3 ]), 
          e.is(a === n), e.case = "mixed arguments types", n = [ 1 ];
          var i = [ [ "a" ], [ {
            a: 1
          } ], {
            b: 2
          } ];
          a = r.arrayAppendArraysOnceStrictly(n, i), e.identical(n, [ 1, "a", {
            a: 1
          }, {
            b: 2
          } ]), e.is(a === n), n = [ 0 ], i = [ [ 1 ], [ 2 ], [ 3, [ 4, [ 5 ] ], 6 ] ], a = r.arrayAppendArraysOnceStrictly(n, i), 
          e.identical(n, [ 0, 1, 2, 3, [ 4, [ 5 ] ], 6 ]), e.is(a === n), e.case = "onEqualize", 
          n = [ 4, 5 ], a = r.arrayAppendArraysOnceStrictly(n, [ 1, 2, 3 ], function onEqualize(r, e) {
            return r === e;
          }), e.identical(a, [ 4, 5, 1, 2, 3 ]), e.identical(n, a), e.case = "ins has existing element", 
          e.case = "array has undefined", n = [ 1 ], e.mustNotThrowError(function() {
            r.arrayAppendArraysOnceStrictly(n, [ void 0, 2 ]);
          }), e.identical(n, [ 1, void 0, 2 ]), e.case = "no arguments", e.shouldThrowErrorSync(function() {
            r.arrayAppendArraysOnceStrictly();
          }), e.case = "dst is not a array", e.shouldThrowErrorSync(function() {
            r.arrayAppendArraysOnceStrictly(1, [ 2 ]);
          }), e.case = "onEqualize is not a routine", e.shouldThrowErrorSync(function() {
            r.arrayAppendArraysOnceStrictly([], [ 1, 2, 3 ], []);
          }), e.case = "One of ins elements is not unique", n = [ 1, 2, 3 ], e.shouldThrowErrorSync(function() {
            r.arrayAppendArraysOnceStrictly(n, [ 4, 2, 5 ]);
          }), e.identical(n, [ 1, 2, 3, 4, 5 ]), n = [ 1, 1, 1 ], e.shouldThrowErrorSync(function() {
            r.arrayAppendArraysOnceStrictly(n, [ 1 ]);
          }), e.identical(n, [ 1, 1, 1 ]), e.case = "argument is undefined", n = [ 1 ], e.shouldThrowErrorSync(function() {
            r.arrayAppendArraysOnceStrictly(n, void 0);
          }), e.identical(n, [ 1 ]), e.case = "second arg is not a ArrayLike entity", e.shouldThrowErrorSync(function() {
            r.arrayAppendArraysOnceStrictly([], 1);
          });
        }
        //
        ,
        arrayAppendedArrays: function arrayAppendedArrays(e) {
          e.case = "nothing";
          var a = [], n = r.arrayAppendedArrays(a, []);
          e.identical(a, []), e.identical(n, 0), e.case = "simple", a = [], n = r.arrayAppendedArrays(a, [ 1, 2, 3 ]), 
          e.identical(a, [ 1, 2, 3 ]), e.identical(n, 3), a = [ 1, 2, 3 ], n = r.arrayAppendedArrays(a, [ 4, 5 ]), 
          e.identical(a, [ 1, 2, 3, 4, 5 ]), e.identical(n, 2), a = [ 1, 1, 1 ], n = r.arrayAppendedArrays(a, [ 1, 1 ]), 
          e.identical(a, [ 1, 1, 1, 1, 1 ]), e.identical(n, 2), a = [ 1, 2, 3 ];
          var i = [ [ 1 ], [ 2 ], [ 3, [ 4, 5 ], 6 ] ];
          n = r.arrayAppendedArrays(a, i), e.identical(a, [ 1, 2, 3, 1, 2, 3, [ 4, 5 ], 6 ]), 
          e.identical(n, 5), e.case = "arguments are not arrays", a = [], n = r.arrayAppendedArrays(a, [ 1, 2, 3 ]), 
          e.identical(a, [ 1, 2, 3 ]), e.identical(n, 3), e.case = "mixed arguments types", 
          a = [ 1 ], i = [ "a", 1, [ {
            a: 1
          } ], {
            b: 2
          } ], n = r.arrayAppendedArrays(a, i), e.identical(a, [ 1, "a", 1, {
            a: 1
          }, {
            b: 2
          } ]), e.identical(n, 4), e.case = "array has undefined", a = [ 1 ], n = r.arrayAppendedArrays(a, [ void 0, 2 ]), 
          e.identical(a, [ 1, void 0, 2 ]), e.identical(n, 2), e.case = "no arguments", e.shouldThrowErrorSync(function() {
            r.arrayAppendedArrays();
          }), e.case = "dst is not a array", e.shouldThrowErrorSync(function() {
            r.arrayAppendedArrays(1, [ 2 ]);
          }), e.case = "argument is undefined", a = [ 1 ], e.shouldThrowErrorSync(function() {
            r.arrayAppendedArrays(a, void 0);
          }), e.identical(a, [ 1 ]), e.case = "second arg is not a ArrayLike entity", e.shouldThrowErrorSync(function() {
            r.arrayAppendedArrays([], void 0);
          }), e.case = "too many args", e.shouldThrowErrorSync(function() {
            r.arrayAppendedArrays([], [ 1 ], [ 2 ]);
          });
        }
        //
        ,
        arrayAppendedArraysOnce: function arrayAppendedArraysOnce(e) {
          e.case = "nothing";
          var a = [], n = r.arrayAppendedArraysOnce(a, []);
          e.identical(a, []), e.identical(n, 0), e.case = "simple", a = [], n = r.arrayAppendedArraysOnce(a, [ 1, 2, 3 ]), 
          e.identical(a, [ 1, 2, 3 ]), e.identical(n, 3), e.case = "prepends only unique elements", 
          a = [ 1, 2, 3 ], n = r.arrayAppendedArraysOnce(a, [ 2, 4, 5 ]), e.identical(a, [ 1, 2, 3, 4, 5 ]), 
          e.identical(n, 2), a = [ 1, 1, 1 ], n = r.arrayAppendedArraysOnce(a, [ 1 ]), e.identical(a, [ 1, 1, 1 ]), 
          e.identical(n, 0), e.case = "mixed arguments types", a = [ 1 ];
          var i = [ "a", 1, [ {
            a: 1
          } ], {
            b: 2
          } ];
          n = r.arrayAppendedArraysOnce(a, i), e.identical(a, [ 1, "a", {
            a: 1
          }, {
            b: 2
          } ]), e.identical(n, 3), a = [ 1, 2, 3, 5 ], i = [ [ 1 ], [ 2 ], [ 3, [ 4, [ 5 ] ], 6 ] ], 
          n = r.arrayAppendedArraysOnce(a, i), e.identical(a, [ 1, 2, 3, 5, [ 4, [ 5 ] ], 6 ]), 
          e.identical(n, 2), a = [ 1, 3 ], n = r.arrayAppendedArraysOnce(a, [ 1, 2, 3 ]), 
          e.identical(a, [ 1, 3, 2 ]), e.identical(n, 1), e.case = "onEqualize", a = [ 1, 3 ], 
          n = r.arrayAppendedArraysOnce(a, [ 1, 2, 3 ], function onEqualize(r, e) {
            return r === e;
          }), e.identical(a, [ 1, 3, 2 ]), e.identical(n, 1), e.case = "array has undefined", 
          a = [ 1 ], e.mustNotThrowError(function() {
            r.arrayAppendedArraysOnce(a, [ void 0, 2 ]);
          }), e.identical(a, [ 1, void 0, 2 ]), e.case = "no arguments", e.shouldThrowErrorSync(function() {
            r.arrayAppendedArraysOnce();
          }), e.case = "dst is not a array", e.shouldThrowErrorSync(function() {
            r.arrayAppendedArraysOnce(1, [ 2 ]);
          }), e.case = "onEqualize is not a routine", e.shouldThrowErrorSync(function() {
            r.arrayAppendedArraysOnce([], [ 1, 2, 3 ], []);
          }), e.case = "argument is undefined", a = [ 1 ], e.shouldThrowErrorSync(function() {
            r.arrayAppendedArraysOnce(a, void 0);
          }), e.identical(a, [ 1 ]), e.case = "second arg is not a ArrayLike entity", e.shouldThrowErrorSync(function() {
            r.arrayAppendedArraysOnce([], void 0);
          });
        }
        //
        ,
        arrayAppendedArraysOnceStrictly: function arrayAppendedArraysOnceStrictly(e) {
          e.case = "nothing";
          var a = r.arrayAppendedArraysOnceStrictly([], []);
          e.identical(a, 0), e.case = "simple";
          var n = [];
          a = r.arrayAppendedArraysOnceStrictly(n, [ 1, 2, 3 ]), e.identical(n, [ 1, 2, 3 ]), 
          e.identical(a, 3), e.case = "mixed arguments types", n = [ 1 ];
          var i = [ [ "a" ], [ {
            a: 1
          } ], {
            b: 2
          } ];
          a = r.arrayAppendedArraysOnceStrictly(n, i), e.identical(n, [ 1, "a", {
            a: 1
          }, {
            b: 2
          } ]), e.identical(a, 3), n = [ 0 ], i = [ [ 1 ], [ 2 ], [ 3, [ 4, [ 5 ] ], 6 ] ], 
          a = r.arrayAppendedArraysOnceStrictly(n, i), e.identical(n, [ 0, 1, 2, 3, [ 4, [ 5 ] ], 6 ]), 
          e.identical(a, 5), e.case = "onEqualize", n = [ 4, 5 ], a = r.arrayAppendedArraysOnceStrictly(n, [ 1, 2, 3 ], function onEqualize(r, e) {
            return r === e;
          }), e.identical(n, [ 4, 5, 1, 2, 3 ]), e.identical(a, 3), e.case = "ins has existing element", 
          e.case = "array has undefined", n = [ 1 ], e.mustNotThrowError(function() {
            r.arrayAppendedArraysOnceStrictly(n, [ void 0, 2 ]);
          }), e.identical(n, [ 1, void 0, 2 ]), e.case = "no arguments", e.shouldThrowErrorSync(function() {
            r.arrayAppendedArraysOnceStrictly();
          }), e.case = "dst is not a array", e.shouldThrowErrorSync(function() {
            r.arrayAppendedArraysOnceStrictly(1, [ 2 ]);
          }), e.case = "onEqualize is not a routine", e.shouldThrowErrorSync(function() {
            r.arrayAppendedArraysOnceStrictly([], [ 1, 2, 3 ], []);
          }), e.case = "One of ins elements is not unique", n = [ 1, 2, 3 ], e.shouldThrowErrorSync(function() {
            r.arrayAppendedArraysOnceStrictly(n, [ 4, 2, 5 ]);
          }), e.identical(n, [ 1, 2, 3, 4, 5 ]), n = [ 1, 1, 1 ], e.shouldThrowErrorSync(function() {
            r.arrayAppendedArraysOnceStrictly(n, [ 1 ]);
          }), e.identical(n, [ 1, 1, 1 ]), e.case = "argument is undefined", n = [ 1 ], e.shouldThrowErrorSync(function() {
            r.arrayAppendedArraysOnceStrictly(n, void 0);
          }), e.identical(n, [ 1 ]), e.case = "second arg is not a ArrayLike entity", e.shouldThrowErrorSync(function() {
            r.arrayAppendedArraysOnceStrictly([], 1);
          });
        }
        // --
        // arrayRemove
        // --
        ,
        // array remove
        arrayRemove: function arrayRemove(e) {
          e.case = "simple";
          var a = [];
          r.arrayRemove(a, 1), e.identical(a, []), a = [ 1 ], r.arrayRemove(a, 1), e.identical(a, []), 
          a = [ 2, 2, 1 ], r.arrayRemove(a, 2), e.identical(a, [ 1 ]), a = [ 2, 2, 1 ], r.arrayRemove(a, 1), 
          e.identical(a, [ 2, 2 ]), a = [ 1, 1, 1 ], r.arrayRemove(a, 1), e.identical(a, []), 
          a = [ 1, 1, 1 ], r.arrayRemove(a, [ 1 ]), e.identical(a, [ 1, 1, 1 ]), a = [ 1 ], 
          r.arrayRemove(a, "1"), e.identical(a, [ 1 ]), a = [ 1 ], r.arrayRemove(a, -1), e.identical(a, [ 1 ]), 
          a = [ 1 ], r.arrayRemove(a, [ 1 ]), e.identical(a, [ 1 ]), a = [ {
            x: 1
          } ], r.arrayRemove(a, {
            x: 1
          }), e.identical(a, [ {
            x: 1
          } ]), e.case = "equalizer 2 args", a = [ {
            num: 1
          }, {
            num: 2
          }, {
            num: 3
          } ];
          var n = function(r, e) {
            return r.num === e.num;
          };
          r.arrayRemove(a, {
            num: 4
          }, n), e.identical(a, [ {
            num: 1
          }, {
            num: 2
          }, {
            num: 3
          } ]), a = [ {
            num: 1
          }, {
            num: 2
          }, {
            num: 3
          } ], n = function(r, e) {
            return r.num === e.num;
          }, r.arrayRemove(a, {
            num: 1
          }, n), e.identical(a, [ {
            num: 2
          }, {
            num: 3
          } ]), e.case = "equalizer 1 arg", a = [ {
            num: 1
          }, {
            num: 2
          }, {
            num: 3
          } ], n = function(r) {
            return r.num;
          }, r.arrayRemove(a, 4, n), e.identical(a, [ {
            num: 1
          }, {
            num: 2
          }, {
            num: 3
          } ]), a = [ {
            num: 1
          }, {
            num: 2
          }, {
            num: 3
          } ], r.arrayRemove(a, 1, r => r.num, r => r), e.identical(a, [ {
            num: 2
          }, {
            num: 3
          } ]), e.case = "equalizer 1 arg", a = [ [ 1 ], [ 1 ], [ 1 ] ], n = function(r) {
            return r[0];
          }, r.arrayRemove(a, [ 1 ], n), e.identical(a, []), e.case = "equalizer 2 args", 
          a = [ [ 1 ], [ 1 ], [ 1 ] ], n = function(r) {
            return r[0];
          }, r.arrayRemove(a, 1, n, function(r) {
            return r;
          }), e.identical(a, []), e.case = "no args", e.shouldThrowErrorSync(function() {
            r.arrayRemove();
          }), e.case = "fourth is not a routine", e.shouldThrowErrorSync(function() {
            r.arrayRemove([], 1, 1, 1);
          }), e.case = "dst is not an array", e.shouldThrowErrorSync(function() {
            r.arrayRemove(1, 1);
          });
        }
        //
        ,
        arrayRemoveOnce: function arrayRemoveOnce(e) {
          e.case = "simple";
          var a = r.arrayRemoveOnce([], 1);
          e.identical(a, []), a = r.arrayRemoveOnce([ 1 ], 1), e.identical(a, []), a = r.arrayRemoveOnce([ 1, 2, 2 ], 2), 
          e.identical(a, [ 1, 2 ]), a = r.arrayRemoveOnce([ 1, 3, 2, 3 ], 3), e.identical(a, [ 1, 2, 3 ]), 
          a = r.arrayRemoveOnce([ 1 ], "1"), e.identical(a, [ 1 ]), a = r.arrayRemoveOnce([ 1 ], -1), 
          e.identical(a, [ 1 ]), a = r.arrayRemoveOnce([ 1 ], [ 1 ]), e.identical(a, [ 1 ]), 
          e.case = "equalizer 1 arg";
          var n = [ {
            num: 1
          }, {
            num: 2
          }, {
            num: 3
          } ], i = function(r, e) {
            return r.num === e.num;
          };
          a = r.arrayRemoveOnce(n, {
            num: 4
          }, i), e.identical(a, [ {
            num: 1
          }, {
            num: 2
          }, {
            num: 3
          } ]), n = [ {
            num: 1
          }, {
            num: 2
          }, {
            num: 3
          } ], i = function(r, e) {
            return r.num === e.num;
          }, a = r.arrayRemoveOnce(n, {
            num: 1
          }, i), e.identical(a, [ {
            num: 2
          }, {
            num: 3
          } ]), e.case = "equalizer 2 args", n = [ {
            num: 1
          }, {
            num: 2
          }, {
            num: 3
          } ], i = function(r) {
            return r.num;
          }, a = r.arrayRemoveOnce(n, 4, i), e.identical(a, [ {
            num: 1
          }, {
            num: 2
          }, {
            num: 3
          } ]), n = [ {
            num: 1
          }, {
            num: 2
          }, {
            num: 3
          } ], a = r.arrayRemoveOnce(n, 1, r => r.num, r => r), e.identical(a, [ {
            num: 2
          }, {
            num: 3
          } ]), n = [ {
            num: 1
          }, {
            num: 2
          }, {
            num: 1
          }, {
            num: 3
          } ], a = r.arrayRemoveOnce(n, 1, i, function(r) {
            return r;
          }), e.identical(a, [ {
            num: 2
          }, {
            num: 1
          }, {
            num: 3
          } ]), e.case = "no args", e.shouldThrowErrorSync(function() {
            r.arrayRemoveOnce();
          }), e.case = "dst is not an array", e.shouldThrowErrorSync(function() {
            r.arrayRemoveOnce(1, 1);
          }), e.case = "onEqualize is not a function", e.shouldThrowErrorSync(function() {
            r.arrayRemoveOnce(1, 1, 1);
          });
        }
        //
        ,
        arrayRemoveOnceStrictly: function arrayRemoveOnceStrictly(e) {
          e.case = "simple";
          var a = [ 1, 2, 3 ], n = r.arrayRemoveOnceStrictly(a, 2);
          e.identical(n, [ 1, 3 ]), e.is(n === a), e.case = "equalizer 2 args", a = [ {
            num: 1
          }, {
            num: 2
          }, {
            num: 3
          } ], n = r.arrayRemoveOnceStrictly(a, {
            num: 3
          }, function(r, e) {
            return r.num === e.num;
          }), e.identical(n, [ {
            num: 1
          }, {
            num: 2
          } ]), e.is(n === a), e.case = "equalizer 1 arg", a = [ {
            num: 1
          }, {
            num: 2
          }, {
            num: 3
          } ], n = r.arrayRemoveOnceStrictly(a, 3, r => r.num, r => r), e.identical(n, [ {
            num: 1
          }, {
            num: 2
          } ]), e.is(n === a), e.case = "no args", e.shouldThrowErrorSync(function() {
            r.arrayRemoveOnceStrictly();
          }), e.case = "dst is not an array", e.shouldThrowErrorSync(function() {
            r.arrayRemoveOnceStrictly(1, 1);
          }), e.case = "ins doesn´t exist", e.shouldThrowErrorSync(function() {
            r.arrayRemoveOnceStrictly([ 1 ], 2);
          }), e.case = "ins is not unique in dstArray", e.shouldThrowErrorSync(function() {
            r.arrayRemoveOnceStrictly([ 1, 2, 2 ], 2);
          }), e.case = "onEqualize is not a routine", e.shouldThrowErrorSync(function() {
            r.arrayRemoveOnceStrictly([ 1, 2, 3 ], 3, 3);
          }), e.case = "onEqualize", a = [ {
            num: 1
          }, {
            num: 2
          }, {
            num: 3
          } ], e.shouldThrowErrorSync(function() {
            r.arrayRemoveOnceStrictly(a, {
              num: 4
            }, function(r, e) {
              return r.num === e.num;
            });
          }), e.identical(a, [ {
            num: 1
          }, {
            num: 2
          }, {
            num: 3
          } ]), e.shouldThrowErrorSync(function() {
            r.arrayRemoveOnceStrictly(a, 4, function(r) {
              return r.num;
            });
          }), e.identical(a, [ {
            num: 1
          }, {
            num: 2
          }, {
            num: 3
          } ]);
        }
        //
        ,
        arrayRemoved: function arrayRemoved(e) {
          e.case = "simple";
          var a = [], n = r.arrayRemoved(a, 1);
          e.identical(a, []), e.identical(n, 0), a = [ 1 ], n = r.arrayRemoved(a, 1), e.identical(a, []), 
          e.identical(n, 1), a = [ 2, 2, 1 ], n = r.arrayRemoved(a, 2), e.identical(a, [ 1 ]), 
          e.identical(n, 2), a = [ 2, 2, 1 ], n = r.arrayRemoved(a, 1), e.identical(a, [ 2, 2 ]), 
          e.identical(n, 1), a = [ 1 ], n = r.arrayRemoved(a, "1"), e.identical(a, [ 1 ]), 
          e.identical(n, 0), a = [ 1 ], n = r.arrayRemoved(a, -1), e.identical(a, [ 1 ]), 
          e.identical(n, 0), a = [ 1 ], n = r.arrayRemoved(a, [ 1 ]), e.identical(a, [ 1 ]), 
          e.identical(n, 0), a = [ 1, 1, 1 ], n = r.arrayRemoved(a, 1), e.identical(a, []), 
          e.identical(n, 3), a = [ 1, 1, 1 ], n = r.arrayRemoved(a, [ 1 ]), e.identical(a, [ 1, 1, 1 ]), 
          e.identical(n, 0), a = [ {
            x: 1
          } ], n = r.arrayRemoved(a, {
            x: 1
          }), e.identical(a, [ {
            x: 1
          } ]), e.identical(n, 0), e.case = "equalizer 1 arg", a = [ {
            num: 1
          }, {
            num: 2
          }, {
            num: 3
          } ];
          var i = function(r, e) {
            return r.num === e.num;
          };
          n = r.arrayRemoved(a, {
            num: 4
          }, i), e.identical(a, [ {
            num: 1
          }, {
            num: 2
          }, {
            num: 3
          } ]), e.identical(n, 0), a = [ {
            num: 1
          }, {
            num: 2
          }, {
            num: 3
          } ], i = function(r, e) {
            return r.num === e.num;
          }, n = r.arrayRemoved(a, {
            num: 1
          }, i), e.identical(a, [ {
            num: 2
          }, {
            num: 3
          } ]), e.identical(n, 1), e.case = "evaluator 2 args", a = [ {
            num: 1
          }, {
            num: 2
          }, {
            num: 3
          } ];
          var t = function(r) {
            return r.num;
          };
          n = r.arrayRemoved(a, 4, t), e.identical(a, [ {
            num: 1
          }, {
            num: 2
          }, {
            num: 3
          } ]), e.identical(n, 0), a = [ {
            num: 1
          }, {
            num: 2
          }, {
            num: 3
          } ], n = r.arrayRemoved(a, 1, r => r.num, r => r), e.identical(a, [ {
            num: 2
          }, {
            num: 3
          } ]), e.identical(n, 1), a = [ {
            num: 1
          }, {
            num: 2
          }, {
            num: 1
          }, {
            num: 3
          } ], n = r.arrayRemoved(a, 1, t, function(r) {
            return r;
          }), e.identical(a, [ {
            num: 2
          }, {
            num: 3
          } ]), e.identical(n, 2), e.case = "no args", e.shouldThrowErrorSync(function() {
            r.arrayRemoved();
          }), e.case = "fourth is not a routine", e.shouldThrowErrorSync(function() {
            r.arrayRemoved([], 1, 1, 1);
          }), e.case = "dst is not an array", e.shouldThrowErrorSync(function() {
            r.arrayRemoved(1, 1);
          });
        }
        //
        ,
        arrayRemovedOnce: function arrayRemovedOnce(e) {
          e.case = "simple";
          var a = [], n = r.arrayRemovedOnce(a, 1);
          e.identical(a, []), e.identical(n, -1), a = [ 1 ], n = r.arrayRemovedOnce(a, 1), 
          e.identical(a, []), e.identical(n, 0), a = [ 1, 2, 3 ], n = r.arrayRemovedOnce(a, 3), 
          e.identical(a, [ 1, 2 ]), e.identical(n, 2), a = [ 2, 2, 1 ], n = r.arrayRemovedOnce(a, 2), 
          e.identical(a, [ 2, 1 ]), e.identical(n, 0), a = [ 1 ], n = r.arrayRemovedOnce(a, "1"), 
          e.identical(a, [ 1 ]), e.identical(n, -1), a = [ 1 ], n = r.arrayRemovedOnce(a, -1), 
          e.identical(a, [ 1 ]), e.identical(n, -1), a = [ 1 ], n = r.arrayRemovedOnce(a, [ 1 ]), 
          e.identical(a, [ 1 ]), e.identical(n, -1), e.case = "equalizer 2 args", a = [ {
            num: 1
          }, {
            num: 2
          }, {
            num: 3
          } ];
          var i = function(r, e) {
            return r.num === e.num;
          };
          n = r.arrayRemovedOnce(a, {
            num: 4
          }, i), e.identical(a, [ {
            num: 1
          }, {
            num: 2
          }, {
            num: 3
          } ]), e.identical(n, -1), a = [ {
            num: 1
          }, {
            num: 2
          }, {
            num: 3
          } ], i = function(r, e) {
            return r.num === e.num;
          }, n = r.arrayRemovedOnce(a, {
            num: 1
          }, i), e.identical(a, [ {
            num: 2
          }, {
            num: 3
          } ]), e.identical(n, 0), e.case = "equalizer 1 arg", a = [ {
            num: 1
          }, {
            num: 2
          }, {
            num: 3
          } ], i = function(r) {
            return r.num;
          }, n = r.arrayRemovedOnce(a, 4, i), e.identical(a, [ {
            num: 1
          }, {
            num: 2
          }, {
            num: 3
          } ]), e.identical(n, -1), a = [ {
            num: 1
          }, {
            num: 2
          }, {
            num: 3
          } ], n = r.arrayRemovedOnce(a, 1, r => r.num, r => r), e.identical(a, [ {
            num: 2
          }, {
            num: 3
          } ]), e.identical(n, 0), e.case = "no args", e.shouldThrowErrorSync(function() {
            r.arrayRemovedOnce();
          }), e.case = "third is not a routine", e.shouldThrowErrorSync(function() {
            r.arrayRemovedOnce([], 1, 1, 1);
          }), e.case = "dst is not an array", e.shouldThrowErrorSync(function() {
            r.arrayRemovedOnce(1, 1);
          });
        }
        //
        ,
        arrayRemovedOnceStrictly: function arrayRemovedOnceStrictly(e) {
          e.case = "simple";
          var a = [ 1 ], n = r.arrayRemovedOnceStrictly(a, 1);
          e.identical(a, []), e.identical(n, 0), a = [ 1, 2, 3 ], n = r.arrayRemovedOnceStrictly(a, 2), 
          e.identical(a, [ 1, 3 ]), e.identical(n, 1), e.case = "equalizer 2 args", a = [ {
            num: 1
          }, {
            num: 2
          }, {
            num: 3
          } ];
          var i = function(r, e) {
            return r.num === e.num;
          };
          n = r.arrayRemovedOnceStrictly(a, {
            num: 3
          }, i), e.identical(a, [ {
            num: 1
          }, {
            num: 2
          } ]), e.identical(n, 2), e.case = "equalizer 1 arg", a = [ {
            num: 1
          }, {
            num: 2
          }, {
            num: 3
          } ], n = r.arrayRemovedOnceStrictly(a, 1, r => r.num, r => r), e.identical(a, [ {
            num: 2
          }, {
            num: 3
          } ]), e.identical(n, 0), e.case = "no args", e.shouldThrowErrorSync(function() {
            r.arrayRemovedOnceStrictly();
          }), e.case = "onEqualize is not a routine", e.shouldThrowErrorSync(function() {
            r.arrayRemovedOnceStrictly([], 1, 1);
          }), e.case = "dst is not an array", e.shouldThrowErrorSync(function() {
            r.arrayRemovedOnceStrictly(1, 1);
          }), e.case = "Simple no match element", e.shouldThrowErrorSync(function() {
            r.arrayRemovedOnceStrictly([], 1);
          }), e.shouldThrowErrorSync(function() {
            r.arrayRemovedOnceStrictly([ 1 ], "1");
          }), e.shouldThrowErrorSync(function() {
            r.arrayRemovedOnceStrictly([ 1 ], -1);
          }), e.shouldThrowErrorSync(function() {
            r.arrayRemovedOnceStrictly([ 1 ], [ 1 ]);
          }), e.shouldThrowErrorSync(function() {
            r.arrayRemovedOnceStrictly([ 1 ], 2);
          }), e.shouldThrowErrorSync(function() {
            r.arrayRemovedOnceStrictly([ 1 ], -1);
          }), e.case = "Ins several times in srcArray", e.shouldThrowErrorSync(function() {
            r.arrayRemovedOnceStrictly([ 2, 2, 1 ], 2);
          }), e.case = "equalizer 2 args", a = [ {
            num: 1
          }, {
            num: 2
          }, {
            num: 3
          } ], i = function(r, e) {
            return r.num === e.num;
          }, e.shouldThrowErrorSync(function() {
            r.arrayRemovedOnceStrictly(a, {
              num: 4
            }, i);
          });
        }
        //
        ,
        arrayRemoveElement: function arrayRemoveElement(e) {
          function onEqualize(r, e) {
            return r.value === e;
          }
          e.case = "simple";
          var a = [], n = r.arrayRemoveElement(a, 1);
          e.identical(a, []), a = [ 1 ], n = r.arrayRemoveElement(a, 1), e.identical(a, []), 
          a = [ 2, 2, 1 ], n = r.arrayRemoveElement(a, 2), e.identical(a, [ 1 ]), a = [ 2, 2, 1 ], 
          n = r.arrayRemoveElement(a, 1), e.identical(a, [ 2, 2 ]), a = [ 1, 1, 1 ], n = r.arrayRemoveElement(a, 1), 
          e.identical(a, []), a = [ 1, 1, 1 ], n = r.arrayRemoveElement(a, [ 1 ]), e.identical(a, [ 1, 1, 1 ]), 
          a = [ 1 ], n = r.arrayRemoveElement(a, "1"), e.identical(a, [ 1 ]), a = [ 1 ], n = r.arrayRemoveElement(a, -1), 
          e.identical(a, [ 1 ]), a = [ 1 ], n = r.arrayRemoveElement(a, [ 1 ]), e.identical(a, [ 1 ]), 
          a = [ {
            x: 1
          } ], n = r.arrayRemoveElement(a, {
            x: 1
          }), e.identical(a, [ {
            x: 1
          } ]), n = r.arrayRemoveElement([ 1 ], "1"), e.identical(n, [ 1 ]), n = r.arrayRemoveElement([ 1 ], -1), 
          e.identical(n, [ 1 ]), n = r.arrayRemoveElement([ 1 ], [ 1 ]), e.identical(n, [ 1 ]), 
          n = r.arrayRemoveElement([ {
            value: 1
          }, {
            value: 1
          }, {
            value: 2
          } ], 1, onEqualize), e.identical(n, [ {
            value: 2
          } ]);
          var i = [ 1, 2, 3, 1, 2, 3 ];
          n = r.arrayRemoveElement(i, 1, 1), e.identical(n, [ 1, 2, 3, 2, 3 ]), e.is(i == n), 
          e.case = "equalizer 2 args", a = [ {
            num: 1
          }, {
            num: 2
          }, {
            num: 3
          } ], onEqualize = function(r, e) {
            return r.num === e.num;
          }, n = r.arrayRemoveElement(a, {
            num: 4
          }, onEqualize), e.identical(a, [ {
            num: 1
          }, {
            num: 2
          }, {
            num: 3
          } ]), a = [ {
            num: 1
          }, {
            num: 2
          }, {
            num: 3
          } ], onEqualize = function(r, e) {
            return r.num === e.num;
          }, n = r.arrayRemoveElement(a, {
            num: 1
          }, onEqualize), e.identical(a, [ {
            num: 2
          }, {
            num: 3
          } ]), e.case = "equalizer 1 arg", a = [ {
            num: 1
          }, {
            num: 2
          }, {
            num: 3
          } ], onEqualize = function(r) {
            return r.num;
          }, n = r.arrayRemoveElement(a, 4, onEqualize), e.identical(a, [ {
            num: 1
          }, {
            num: 2
          }, {
            num: 3
          } ]), a = [ {
            num: 1
          }, {
            num: 2
          }, {
            num: 3
          } ], n = r.arrayRemoveElement(a, 1, r => r.num, r => r), e.identical(a, [ {
            num: 2
          }, {
            num: 3
          } ]), e.case = "equalizer 1 arg", a = [ [ 1 ], [ 1 ], [ 1 ] ], onEqualize = function(r) {
            return r[0];
          }, n = r.arrayRemoveElement(a, [ 1 ], onEqualize), e.identical(a, []), e.case = "equalizer 2 args", 
          a = [ [ 1 ], [ 1 ], [ 1 ] ];
          var onEqualize = function(r) {
            return r[0];
          };
          n = r.arrayRemoveElement(a, 1, onEqualize, function(r) {
            return r;
          }), e.identical(a, []), e.case = "no args", e.shouldThrowErrorSync(function() {
            r.arrayRemoveElement();
          }), e.case = "dst is not an array", e.shouldThrowErrorSync(function() {
            r.arrayRemoveElement(1, 1);
          }), e.case = "fourth argument is not a routine", e.shouldThrowErrorSync(function() {
            r.arrayRemoveElement([ 1 ], 1, 1, 1);
          });
        }
        //
        ,
        arrayRemoveElementOnce: function arrayRemoveElementOnce(e) {
          e.case = "simple";
          var a = r.arrayRemoveElementOnce([], 1);
          e.identical(a, []), a = r.arrayRemoveElementOnce([ 1 ], 1), e.identical(a, []), 
          a = r.arrayRemoveElementOnce([ 1, 2, 2 ], 2), e.identical(a, [ 1, 2 ]), a = r.arrayRemoveElementOnce([ 1, 3, 2, 3 ], 3), 
          e.identical(a, [ 1, 2, 3 ]), a = r.arrayRemoveElementOnce([ 1 ], "1"), e.identical(a, [ 1 ]), 
          a = r.arrayRemoveElementOnce([ 1 ], -1), e.identical(a, [ 1 ]), a = r.arrayRemoveElementOnce([ 1 ], [ 1 ]), 
          e.identical(a, [ 1 ]), e.case = "equalizer 1 arg";
          var n = [ {
            num: 1
          }, {
            num: 2
          }, {
            num: 3
          } ], i = function(r, e) {
            return r.num === e.num;
          };
          a = r.arrayRemoveElementOnce(n, {
            num: 4
          }, i), e.identical(a, [ {
            num: 1
          }, {
            num: 2
          }, {
            num: 3
          } ]), n = [ {
            num: 1
          }, {
            num: 2
          }, {
            num: 3
          } ], i = function(r, e) {
            return r.num === e.num;
          }, a = r.arrayRemoveElementOnce(n, {
            num: 1
          }, i), e.identical(a, [ {
            num: 2
          }, {
            num: 3
          } ]), e.case = "equalizer 2 args", n = [ {
            num: 1
          }, {
            num: 2
          }, {
            num: 3
          } ], i = function(r) {
            return r.num;
          }, a = r.arrayRemoveElementOnce(n, 4, i), e.identical(a, [ {
            num: 1
          }, {
            num: 2
          }, {
            num: 3
          } ]), n = [ {
            num: 1
          }, {
            num: 2
          }, {
            num: 3
          } ], a = r.arrayRemoveElementOnce(n, 1, r => r.num, r => r), e.identical(a, [ {
            num: 2
          }, {
            num: 3
          } ]), n = [ {
            num: 1
          }, {
            num: 2
          }, {
            num: 1
          }, {
            num: 3
          } ], a = r.arrayRemoveElementOnce(n, 1, i, function(r) {
            return r;
          }), e.identical(a, [ {
            num: 2
          }, {
            num: 1
          }, {
            num: 3
          } ]), e.case = "no args", e.shouldThrowErrorSync(function() {
            r.arrayRemoveElementOnce();
          }), e.case = "dst is not an array", e.shouldThrowErrorSync(function() {
            r.arrayRemoveElementOnce(1, 1);
          }), e.case = "onEqualize is not a function", e.shouldThrowErrorSync(function() {
            r.arrayRemoveElementOnce(1, 1, 1);
          });
        }
        //
        // function arrayRemoveElementOnce( test ) {
        //
        //   test.case = 'nothing';
        //   var got = _.arrayRemoveElementOnce( [  ], 2 );
        //   var expected = [  ];
        //   test.identical( got, expected );
        //
        //   test.case = 'one element left';
        //   var got = _.arrayRemoveElementOnce( [ 2, 4 ], 4 );
        //   var expected = [ 2 ];
        //   test.identical( got, expected );
        //
        //   test.case = 'two elements left';
        //   var got = _.arrayRemoveElementOnce( [ true, false, 6 ], true );
        //   var expected = [ false, 6 ];
        //   test.identical( got, expected );
        //
        //   /**/
        //
        //   if( !Config.debug )
        //   return;
        //
        //   test.case = 'no arguments';
        //   test.shouldThrowErrorSync( function()
        //   {
        //     _.arrayRemoveElementOnce();
        //   });
        //
        //   test.case = 'not enough arguments';
        //   test.shouldThrowErrorSync( function()
        //   {
        //     _.arrayRemoveElementOnce( [ 2, 4, 6 ] );
        //   });
        //
        //   test.case = 'extra argument';
        //   test.shouldThrowErrorSync( function()
        //   {
        //     _.arrayRemoveElementOnce( [ 2, 4, 6 ], 2, function( el, ins ) { return el > ins }, 'redundant argument' );
        //   });
        //
        //   test.case = 'arguments[0] is wrong';
        //   test.shouldThrowErrorSync( function()
        //   {
        //     _.arrayRemoveElementOnce( 'wrong argument', 2 );
        //   });
        //
        //   test.case = 'arguments[2] is wrong';
        //   test.shouldThrowErrorSync( function()
        //   {
        //     _.arrayRemoveElementOnce( [ 2, 4, 6 ], 2, 'wrong argument' );
        //   });
        //
        // };
        //
        ,
        arrayRemoveElementOnceStrictly: function arrayRemoveElementOnceStrictly(e) {
          e.case = "simple";
          var a = [ 1, 2, 3 ], n = r.arrayRemoveElementOnceStrictly(a, 2);
          e.identical(n, [ 1, 3 ]), e.is(n === a), e.case = "equalizer 2 args", a = [ {
            num: 1
          }, {
            num: 2
          }, {
            num: 3
          } ], n = r.arrayRemoveElementOnceStrictly(a, {
            num: 3
          }, function(r, e) {
            return r.num === e.num;
          }), e.identical(n, [ {
            num: 1
          }, {
            num: 2
          } ]), e.is(n === a), e.case = "equalizer 1 arg", a = [ {
            num: 1
          }, {
            num: 2
          }, {
            num: 3
          } ], n = r.arrayRemoveElementOnceStrictly(a, 3, r => r.num, r => r), e.identical(n, [ {
            num: 1
          }, {
            num: 2
          } ]), e.is(n === a), e.case = "no args", e.shouldThrowErrorSync(function() {
            r.arrayRemoveElementOnceStrictly();
          }), e.case = "dst is not an array", e.shouldThrowErrorSync(function() {
            r.arrayRemoveElementOnceStrictly(1, 1);
          }), e.case = "ins doesn´t exist", e.shouldThrowErrorSync(function() {
            r.arrayRemoveElementOnceStrictly([ 1 ], 2);
          }), e.case = "ins is not unique in dstArray", e.shouldThrowErrorSync(function() {
            r.arrayRemoveElementOnceStrictly([ 1, 2, 2 ], 2);
          }), e.case = "onEqualize is not a routine", e.shouldThrowErrorSync(function() {
            r.arrayRemoveElementOnceStrictly([ 1, 2, 3 ], 3, 3);
          }), e.case = "onEqualize", a = [ {
            num: 1
          }, {
            num: 2
          }, {
            num: 3
          } ], e.shouldThrowErrorSync(function() {
            r.arrayRemoveElementOnceStrictly(a, {
              num: 4
            }, function(r, e) {
              return r.num === e.num;
            });
          }), e.identical(a, [ {
            num: 1
          }, {
            num: 2
          }, {
            num: 3
          } ]), e.shouldThrowErrorSync(function() {
            r.arrayRemoveElementOnceStrictly(a, 4, function(r) {
              return r.num;
            });
          }), e.identical(a, [ {
            num: 1
          }, {
            num: 2
          }, {
            num: 3
          } ]);
        }
        //
        ,
        arrayRemovedElement: function arrayRemovedElement(e) {
          function onEqualize(r, e) {
            return r.value === e;
          }
          e.case = "simple";
          var a = [], n = r.arrayRemovedElement(a, 1);
          e.identical(a, []), e.identical(n, 0), a = [ 1 ], n = r.arrayRemovedElement(a, 1), 
          e.identical(a, []), e.identical(n, 1), a = [ 2, 2, 1 ], n = r.arrayRemovedElement(a, 2), 
          e.identical(a, [ 1 ]), e.identical(n, 2), a = [ 2, 2, 1 ], n = r.arrayRemovedElement(a, 1), 
          e.identical(a, [ 2, 2 ]), e.identical(n, 1), a = [ 1 ], n = r.arrayRemovedElement(a, "1"), 
          e.identical(a, [ 1 ]), e.identical(n, 0), a = [ 1 ], n = r.arrayRemovedElement(a, -1), 
          e.identical(a, [ 1 ]), e.identical(n, 0), a = [ 1 ], n = r.arrayRemovedElement(a, [ 1 ]), 
          e.identical(a, [ 1 ]), e.identical(n, 0), a = [ 1, 1, 1 ], n = r.arrayRemovedElement(a, 1), 
          e.identical(a, []), e.identical(n, 3), a = [ 1, 1, 1 ], n = r.arrayRemovedElement(a, [ 1 ]), 
          e.identical(a, [ 1, 1, 1 ]), e.identical(n, 0), a = [ {
            x: 1
          } ], n = r.arrayRemovedElement(a, {
            x: 1
          }), e.identical(a, [ {
            x: 1
          } ]), e.identical(n, 0), a = [ 1 ], n = r.arrayRemovedElement(a, "1"), e.identical(a, [ 1 ]), 
          e.identical(n, 0), a = [ 1 ], n = r.arrayRemovedElement(a, -1), e.identical(a, [ 1 ]), 
          e.identical(n, 0), a = [ 1 ], n = r.arrayRemovedElement(a, [ 1 ]), e.identical(a, [ 1 ]), 
          e.identical(n, 0), a = [ {
            value: 1
          }, {
            value: 1
          }, {
            value: 2
          } ], n = r.arrayRemovedElement(a, 1, onEqualize), e.identical(a, [ {
            value: 2
          } ]), e.identical(n, 2);
          var i = [ 1, 2, 3, 1, 2, 3 ];
          n = r.arrayRemovedElement(i, 1, 1), e.identical(n, 1), e.identical(i, [ 1, 2, 3, 2, 3 ]), 
          e.case = "equalizer 1 arg", a = [ {
            num: 1
          }, {
            num: 2
          }, {
            num: 3
          } ], onEqualize = function(r, e) {
            return r.num === e.num;
          }, n = r.arrayRemovedElement(a, {
            num: 4
          }, onEqualize), e.identical(a, [ {
            num: 1
          }, {
            num: 2
          }, {
            num: 3
          } ]), e.identical(n, 0), a = [ {
            num: 1
          }, {
            num: 2
          }, {
            num: 3
          } ];
          var onEqualize = function(r, e) {
            return r.num === e.num;
          };
          n = r.arrayRemovedElement(a, {
            num: 1
          }, onEqualize), e.identical(a, [ {
            num: 2
          }, {
            num: 3
          } ]), e.identical(n, 1), e.case = "evaluator 2 args", a = [ {
            num: 1
          }, {
            num: 2
          }, {
            num: 3
          } ];
          var t = function(r) {
            return r.num;
          };
          n = r.arrayRemovedElement(a, 4, t), e.identical(a, [ {
            num: 1
          }, {
            num: 2
          }, {
            num: 3
          } ]), e.identical(n, 0), a = [ {
            num: 1
          }, {
            num: 2
          }, {
            num: 3
          } ], n = r.arrayRemovedElement(a, 1, r => r.num, r => r), e.identical(a, [ {
            num: 2
          }, {
            num: 3
          } ]), e.identical(n, 1), a = [ {
            num: 1
          }, {
            num: 2
          }, {
            num: 1
          }, {
            num: 3
          } ], n = r.arrayRemovedElement(a, 1, t, function(r) {
            return r;
          }), e.identical(a, [ {
            num: 2
          }, {
            num: 3
          } ]), e.identical(n, 2), e.case = "no args", e.shouldThrowErrorSync(function() {
            r.arrayRemovedElement();
          }), e.case = "fourth argument is not a routine", e.shouldThrowErrorSync(function() {
            r.arrayRemovedElement([ 1 ], 1, 1, 1);
          }), e.case = "dst is not an array", e.shouldThrowErrorSync(function() {
            r.arrayRemovedElement(1, 1);
          });
        }
        //
        ,
        arrayRemovedElementOnce: function arrayRemovedElementOnce(e) {
          e.case = "simple";
          var a = [], n = r.arrayRemovedElementOnce(a, 1);
          e.identical(a, []), e.identical(n, -1), a = [ 1 ], n = r.arrayRemovedElementOnce(a, 1), 
          e.identical(a, []), e.identical(n, 0), a = [ 1, 2, 3 ], n = r.arrayRemovedElementOnce(a, 3), 
          e.identical(a, [ 1, 2 ]), e.identical(n, 2), a = [ 2, 2, 1 ], n = r.arrayRemovedElementOnce(a, 2), 
          e.identical(a, [ 2, 1 ]), e.identical(n, 0), a = [ 1 ], n = r.arrayRemovedElementOnce(a, "1"), 
          e.identical(a, [ 1 ]), e.identical(n, -1), a = [ 1 ], n = r.arrayRemovedElementOnce(a, -1), 
          e.identical(a, [ 1 ]), e.identical(n, -1), a = [ 1 ], n = r.arrayRemovedElementOnce(a, [ 1 ]), 
          e.identical(a, [ 1 ]), e.identical(n, -1), e.case = "equalizer 2 args", a = [ {
            num: 1
          }, {
            num: 2
          }, {
            num: 3
          } ];
          var i = function(r, e) {
            return r.num === e.num;
          };
          n = r.arrayRemovedElementOnce(a, {
            num: 4
          }, i), e.identical(a, [ {
            num: 1
          }, {
            num: 2
          }, {
            num: 3
          } ]), e.identical(n, -1), a = [ {
            num: 1
          }, {
            num: 2
          }, {
            num: 3
          } ], i = function(r, e) {
            return r.num === e.num;
          }, n = r.arrayRemovedElementOnce(a, {
            num: 1
          }, i), e.identical(a, [ {
            num: 2
          }, {
            num: 3
          } ]), e.identical(n, 0), e.case = "equalizer 1 arg", a = [ {
            num: 1
          }, {
            num: 2
          }, {
            num: 3
          } ], i = function(r) {
            return r.num;
          }, n = r.arrayRemovedElementOnce(a, 4, i), e.identical(a, [ {
            num: 1
          }, {
            num: 2
          }, {
            num: 3
          } ]), e.identical(n, -1), a = [ {
            num: 1
          }, {
            num: 2
          }, {
            num: 3
          } ], n = r.arrayRemovedElementOnce(a, 1, r => r.num, r => r), e.identical(a, [ {
            num: 2
          }, {
            num: 3
          } ]), e.identical(n, 0), e.case = "no args", e.shouldThrowErrorSync(function() {
            r.arrayRemovedElementOnce();
          }), e.case = "fourth is not a routine", e.shouldThrowErrorSync(function() {
            r.arrayRemovedElementOnce([], 1, 1, 1);
          }), e.case = "dst is not an array", e.shouldThrowErrorSync(function() {
            r.arrayRemovedElementOnce(1, 1);
          });
        }
        //
        ,
        arrayRemovedElementOnceStrictly: function arrayRemovedElementOnceStrictly(e) {
          e.case = "simple";
          var a = [ 1 ], n = r.arrayRemovedElementOnceStrictly(a, 1);
          e.identical(a, []), e.identical(n, 1), a = [ 1, 2, 3 ], n = r.arrayRemovedElementOnceStrictly(a, 2), 
          e.identical(a, [ 1, 3 ]), e.identical(n, 2), e.case = "equalizer 2 args", a = [ {
            num: 1
          }, {
            num: 2
          }, {
            num: 3
          } ];
          var i = function(r, e) {
            return r.num === e.num;
          };
          n = r.arrayRemovedElementOnceStrictly(a, {
            num: 3
          }, i), e.identical(a, [ {
            num: 1
          }, {
            num: 2
          } ]), e.identical(n, {
            num: 3
          }), e.case = "equalizer 1 arg", a = [ {
            num: 1
          }, {
            num: 2
          }, {
            num: 3
          } ], n = r.arrayRemovedElementOnceStrictly(a, 1, r => r.num, r => r), e.identical(a, [ {
            num: 2
          }, {
            num: 3
          } ]), e.identical(n, {
            num: 1
          }), e.case = "no args", e.shouldThrowErrorSync(function() {
            r.arrayRemovedElementOnceStrictly();
          }), e.case = "onEqualize is not a routine", e.shouldThrowErrorSync(function() {
            r.arrayRemovedElementOnceStrictly([], 1, 1);
          }), e.case = "dst is not an array", e.shouldThrowErrorSync(function() {
            r.arrayRemovedElementOnceStrictly(1, 1);
          }), e.case = "Simple no match element", e.shouldThrowErrorSync(function() {
            r.arrayRemovedElementOnceStrictly([], 1);
          }), e.shouldThrowErrorSync(function() {
            r.arrayRemovedElementOnceStrictly([ 1 ], "1");
          }), e.shouldThrowErrorSync(function() {
            r.arrayRemovedElementOnceStrictly([ 1 ], -1);
          }), e.shouldThrowErrorSync(function() {
            r.arrayRemovedElementOnceStrictly([ 1 ], [ 1 ]);
          }), e.shouldThrowErrorSync(function() {
            r.arrayRemovedElementOnceStrictly([ 1 ], 2);
          }), e.shouldThrowErrorSync(function() {
            r.arrayRemovedElementOnceStrictly([ 1 ], -1);
          }), e.case = "Ins several times in srcArray", e.shouldThrowErrorSync(function() {
            r.arrayRemovedElementOnceStrictly([ 2, 2, 1 ], 2);
          }), e.case = "equalizer 2 args", a = [ {
            num: 1
          }, {
            num: 2
          }, {
            num: 3
          } ], i = function(r, e) {
            return r.num === e.num;
          }, e.shouldThrowErrorSync(function() {
            r.arrayRemovedElementOnceStrictly(a, {
              num: 4
            }, i);
          });
        }
        //
        ,
        // arrayRemovedOnceStrictly,
        // arrayRemovedElementOnce2,
        // arrayRemovedOnceElementStrictly,
        arrayRemoveArray: function arrayRemoveArray(e) {
          e.case = "nothing";
          var a = r.arrayRemoveArray([], []);
          e.identical(a, []), e.case = "simple";
          var n = [];
          a = r.arrayRemoveArray(n, [ 1, 2, 3 ]), e.identical(n, []), e.is(a === n), n = [ 1, 2, 3 ], 
          a = r.arrayRemoveArray(n, [ 4, 5 ]), e.identical(n, [ 1, 2, 3 ]), e.is(a === n), 
          n = [ 1, 2, 3 ], a = r.arrayRemoveArray(n, [ 1, 3 ]), e.identical(n, [ 2 ]), e.is(a === n), 
          n = [ 1, 1, 1 ], a = r.arrayRemoveArray(n, [ 1, 1 ]), e.identical(n, []), e.is(a === n), 
          n = [ 1, 1, 1 ], a = r.arrayRemoveArray(n, [ 1 ]), e.identical(n, []), e.is(a === n), 
          e.case = "array has undefined", n = [ 1 ], a = r.arrayRemoveArray(n, [ void 0, 2 ]), 
          e.identical(n, [ 1 ]), e.is(a === n), e.case = "argument is undefined", e.shouldThrowErrorSync(function() {
            r.arrayRemoveArray([ 1 ], void 0);
          }), e.case = "no arguments", e.shouldThrowErrorSync(function() {
            r.arrayRemoveArray();
          }), e.case = "too many args", e.shouldThrowErrorSync(function() {
            r.arrayRemoveArray([ 1, 2 ], [ 1 ], [ 2 ]);
          }), e.case = "second args is not longIs", e.shouldThrowErrorSync(function() {
            r.arrayRemoveArray([ 1, 2 ], 2);
          });
        },
        arrayRemoveArrayOnce: 
        //
        function arrayRemoveArrayOnce(e) {
          e.case = "nothing";
          var a = r.arrayRemoveArrayOnce([], []);
          e.identical(a, []), e.case = "simple";
          var n = [];
          a = r.arrayRemoveArrayOnce(n, [ 1, 2, 3 ]), e.identical(n, []), e.is(a === n), e.case = "prepends only unique elements", 
          n = [ 1, 2, 3 ], a = r.arrayRemoveArrayOnce(n, [ 2, 4, 5 ]), e.identical(n, [ 1, 3 ]), 
          e.is(a === n), n = [ 1, 1, 1 ], a = r.arrayRemoveArrayOnce(n, [ 1 ]), e.identical(n, [ 1, 1 ]), 
          e.is(a === n), e.case = "array has undefined", n = [ 1 ], e.mustNotThrowError(function() {
            var a = r.arrayRemoveArrayOnce(n, [ void 0, 2 ]);
            e.identical(n, [ 1 ]), e.is(a === n);
          }), e.case = "no arguments", e.shouldThrowErrorSync(function() {
            r.arrayRemoveArrayOnce();
          }), e.case = "too many args", e.shouldThrowErrorSync(function() {
            r.arrayRemoveArrayOnce([ 1, 2 ], [ 1 ], [ 2 ]);
          }), e.case = "second args is not longIs", e.shouldThrowErrorSync(function() {
            r.arrayRemoveArrayOnce([ 1, 2 ], 2);
          });
        }
        //
        ,
        arrayRemoveArrayOnceStrictly: function arrayRemoveArrayOnceStrictly(e) {
          e.case = "simple";
          var a = [ 1, 2, 3 ], n = r.arrayRemoveArrayOnceStrictly(a, [ 2 ]);
          e.identical(n, [ 1, 3 ]), e.is(n === a), e.case = "ins has several values", a = [ 1, 2, 3, 4, 5, 6, 6 ], 
          n = r.arrayRemoveArrayOnceStrictly(a, [ 1, 3, 5 ]), e.identical(n, [ 2, 4, 6, 6 ]), 
          e.is(n === a), e.case = "equalizer 1 arg", a = [ {
            num: 1
          }, {
            num: 2
          }, {
            num: 3
          } ], n = r.arrayRemoveArrayOnceStrictly(a, [ {
            num: 3
          } ], function(r, e) {
            return r.num === e.num;
          }), e.identical(n, [ {
            num: 1
          }, {
            num: 2
          } ]), e.is(n === a), e.case = "equalizer 2 args", a = [ {
            num: 1
          }, {
            num: 2
          }, {
            num: 3
          } ], n = r.arrayRemoveArrayOnceStrictly(a, [ 3 ], r => r.num, r => r), e.identical(n, [ {
            num: 1
          }, {
            num: 2
          } ]), e.is(n === a), e.case = "equalizer 2 args - ins several values", a = [ {
            num: 1
          }, {
            num: 2
          }, {
            num: 3
          } ], n = r.arrayRemoveArrayOnceStrictly(a, [ 3, 1 ], r => r.num, r => r), e.identical(n, [ {
            num: 2
          } ]), e.is(n === a), e.case = "no args", e.shouldThrowErrorSync(function() {
            r.arrayRemoveArrayOnceStrictly();
          }), e.case = "dst is not an array", e.shouldThrowErrorSync(function() {
            r.arrayRemoveArrayOnceStrictly(1, 1);
          }), e.case = "ins not exists", e.shouldThrowErrorSync(function() {
            r.arrayRemoveArrayOnceStrictly([ 1 ], [ 2 ]);
          }), e.case = "ins repeated in dstArray", e.shouldThrowErrorSync(function() {
            r.arrayRemoveArrayOnceStrictly([ 1, 2, 2 ], [ 2 ]);
          }), e.case = "onEqualize is not a routine", e.shouldThrowErrorSync(function() {
            r.arrayRemoveArrayOnceStrictly([ 1, 2, 3 ], 3, 3);
          }), e.case = "onEqualize", a = [ {
            num: 1
          }, {
            num: 2
          }, {
            num: 3
          } ], e.shouldThrowErrorSync(function() {
            r.arrayRemoveArrayOnceStrictly(a, [ {
              num: 4
            } ], function(r, e) {
              return r.num === e.num;
            });
          }), e.identical(a, [ {
            num: 1
          }, {
            num: 2
          }, {
            num: 3
          } ]), e.shouldThrowErrorSync(function() {
            r.arrayRemoveArrayOnceStrictly(a, [ 4 ], function(r) {
              return r.num;
            });
          }), e.identical(a, [ {
            num: 1
          }, {
            num: 2
          }, {
            num: 3
          } ]);
        }
        //
        ,
        arrayRemovedArray: function arrayRemovedArray(e) {
          e.case = "nothing";
          var a = [], n = r.arrayRemovedArray(a, []);
          e.identical(a, []), e.identical(n, 0), e.case = "simple", a = [], n = r.arrayRemovedArray(a, [ 1, 2, 3 ]), 
          e.identical(a, []), e.identical(n, 0), e.case = "prepends only unique elements", 
          a = [ 1, 2, 3 ], n = r.arrayRemovedArray(a, [ 2, 4, 5 ]), e.identical(a, [ 1, 3 ]), 
          e.identical(n, 1), a = [ 1, 1, 1 ], n = r.arrayRemovedArray(a, [ 1 ]), e.identical(a, []), 
          e.identical(n, 3), e.case = "array has undefined", a = [ 1 ], n = r.arrayRemovedArray(a, [ void 0, 2 ]), 
          e.identical(a, [ 1 ]), e.identical(n, 0), e.case = "argument is undefined", e.shouldThrowErrorSync(function() {
            r.arrayRemovedArray([ 1 ], void 0);
          }), e.case = "no arguments", e.shouldThrowErrorSync(function() {
            r.arrayRemovedArray();
          }), e.case = "too many args", e.shouldThrowErrorSync(function() {
            r.arrayRemovedArray([ 1, 2 ], [ 1 ], [ 2 ]);
          }), e.case = "second args is not longIs", e.shouldThrowErrorSync(function() {
            r.arrayRemovedArray([ 1, 2 ], 2);
          });
        }
        //
        ,
        arrayRemovedArrayOnce: function arrayRemovedArrayOnce(e) {
          e.case = "nothing";
          var a = [], n = r.arrayRemovedArrayOnce(a, []);
          e.identical(a, []), e.identical(n, 0), e.case = "simple", a = [], n = r.arrayRemovedArrayOnce(a, [ 1, 2, 3 ]), 
          e.identical(a, []), e.identical(n, 0), e.case = "prepends only unique elements", 
          a = [ 1, 2, 3 ], n = r.arrayRemovedArrayOnce(a, [ 2, 4, 5 ]), e.identical(a, [ 1, 3 ]), 
          e.identical(n, 1), a = [ 1, 1, 1 ], n = r.arrayRemovedArrayOnce(a, [ 1 ]), e.identical(a, [ 1, 1 ]), 
          e.identical(n, 1), e.case = "array has undefined", a = [ 1 ], e.mustNotThrowError(function() {
            var n = r.arrayRemovedArrayOnce(a, [ void 0, 2 ]);
            e.identical(a, [ 1 ]), e.identical(n, 0);
          }), e.case = "no arguments", e.shouldThrowErrorSync(function() {
            r.arrayRemovedArrayOnce();
          }), e.case = "too many args", e.shouldThrowErrorSync(function() {
            r.arrayRemovedArrayOnce([ 1, 2 ], [ 1 ], [ 2 ]);
          }), e.case = "second args is not longIs", e.shouldThrowErrorSync(function() {
            r.arrayRemovedArrayOnce([ 1, 2 ], 2);
          });
        }
        //
        ,
        arrayRemovedArrayOnceStrictly: function arrayRemovedArrayOnceStrictly(e) {
          e.case = "simple";
          var a = [ 1, 2, 3 ], n = r.arrayRemovedArrayOnceStrictly(a, [ 2 ]);
          e.identical(a, [ 1, 3 ]), e.identical(n, 1), e.case = "ins has several values", 
          a = [ 1, 2, 3, 4, 5, 6, 6 ], n = r.arrayRemovedArrayOnceStrictly(a, [ 1, 3, 5 ]), 
          e.identical(a, [ 2, 4, 6, 6 ]), e.identical(n, 3), e.case = "equalizer 1 arg", a = [ {
            num: 1
          }, {
            num: 2
          }, {
            num: 3
          } ], n = r.arrayRemovedArrayOnceStrictly(a, [ {
            num: 3
          } ], function(r, e) {
            return r.num === e.num;
          }), e.identical(a, [ {
            num: 1
          }, {
            num: 2
          } ]), e.identical(n, 1), e.case = "equalizer 2 args", a = [ {
            num: 1
          }, {
            num: 2
          }, {
            num: 3
          } ], n = r.arrayRemovedArrayOnceStrictly(a, [ 3 ], r => r.num, r => r), e.identical(a, [ {
            num: 1
          }, {
            num: 2
          } ]), e.identical(n, 1), e.case = "equalizer 2 args - ins several values", a = [ {
            num: 1
          }, {
            num: 2
          }, {
            num: 3
          } ], n = r.arrayRemovedArrayOnceStrictly(a, [ 3, 1 ], r => r.num, r => r), e.identical(a, [ {
            num: 2
          } ]), e.identical(n, 2), e.case = "no args", e.shouldThrowErrorSync(function() {
            r.arrayRemovedArrayOnceStrictly();
          }), e.case = "dst is not an array", e.shouldThrowErrorSync(function() {
            r.arrayRemovedArrayOnceStrictly(1, 1);
          }), e.case = "ins not exists", e.shouldThrowErrorSync(function() {
            r.arrayRemovedArrayOnceStrictly([ 1 ], [ 2 ]);
          }), e.case = "ins repeated in dstArray", e.shouldThrowErrorSync(function() {
            r.arrayRemovedArrayOnceStrictly([ 1, 2, 2 ], [ 2 ]);
          }), e.case = "onEqualize is not a routine", e.shouldThrowErrorSync(function() {
            r.arrayRemovedArrayOnceStrictly([ 1, 2, 3 ], 3, 3);
          }), e.case = "onEqualize", a = [ {
            num: 1
          }, {
            num: 2
          }, {
            num: 3
          } ], e.shouldThrowErrorSync(function() {
            r.arrayRemovedArrayOnceStrictly(a, [ {
              num: 4
            } ], function(r, e) {
              return r.num === e.num;
            });
          }), e.identical(a, [ {
            num: 1
          }, {
            num: 2
          }, {
            num: 3
          } ]), e.shouldThrowErrorSync(function() {
            r.arrayRemovedArrayOnceStrictly(a, [ 4 ], function(r) {
              return r.num;
            });
          }), e.identical(a, [ {
            num: 1
          }, {
            num: 2
          }, {
            num: 3
          } ]);
        }
        //
        ,
        arrayRemoveArrays: function arrayRemoveArrays(e) {
          e.case = "nothing";
          var a = r.arrayRemoveArrays([], []);
          e.identical(a, []), e.case = "simple";
          var n = [];
          a = r.arrayRemoveArrays(n, [ 1, 2, 3 ]), e.identical(n, []), e.is(a === n), n = [ 1, 2, 3 ], 
          a = r.arrayRemoveArrays(n, [ 4, 5 ]), e.identical(n, [ 1, 2, 3 ]), e.is(a === n), 
          n = [ 1, 2, 3 ], a = r.arrayRemoveArrays(n, [ 1, 3 ]), e.identical(n, [ 2 ]), e.is(a === n), 
          n = [ 1, 1, 1, 2, 2, 2 ], a = r.arrayRemoveArrays(n, [ [ 1 ], [ 2 ] ]), e.identical(n, []), 
          e.is(a === n), n = [ 1, 2, 3, 4, 5 ];
          var i = [ [ 1 ], [ 2, [ 3 ] ], [ [ [ 4 ] ], 5 ] ];
          a = r.arrayRemoveArrays(n, i), e.identical(n, [ 3, 4 ]), e.is(a === n), n = [ 5 ], 
          i = [ [ 5 ] ], a = r.arrayRemoveArrays(n, i), e.identical(n, []), e.is(a === n), 
          n = [ [ 5 ] ], i = [ [ 5 ] ], a = r.arrayRemoveArrays(n, i), e.identical(n, [ [ 5 ] ]), 
          e.is(a === n), n = [ [ 5 ] ], i = [ [ [ 5 ] ] ], a = r.arrayRemoveArrays(n, i), 
          e.identical(n, [ [ 5 ] ]), e.is(a === n), e.case = "array has undefined", n = [ 1 ], 
          a = r.arrayRemoveArrays(n, [ void 0, 2 ]), e.identical(n, [ 1 ]), e.is(a === n), 
          e.case = "no arguments", e.shouldThrowErrorSync(function() {
            r.arrayRemoveArrays();
          }), e.case = "argument is undefined", n = [ 1 ], e.shouldThrowErrorSync(function() {
            r.arrayRemoveArrays(n, void 0);
          }), e.identical(n, [ 1 ]), e.case = "second arg is not longIs entity", e.shouldThrowErrorSync(function() {
            r.arrayRemoveArrays([], 1);
          }), e.case = "too many args", e.shouldThrowErrorSync(function() {
            r.arrayRemoveArrays([], [ 1 ], [ 1 ]);
          });
        },
        arrayRemoveArraysOnce: 
        //
        function arrayRemoveArraysOnce(e) {
          function onEqualize(r, e) {
            return r === e;
          }
          e.case = "nothing";
          var a = r.arrayRemoveArraysOnce([], []);
          e.identical(a, []), e.case = "simple";
          var n = [];
          a = r.arrayRemoveArraysOnce(n, [ 1, 2, 3 ]), e.identical(a, []), e.is(a === n), 
          e.case = "prepends only unique elements", n = [ 1, 2, 3 ], a = r.arrayRemoveArraysOnce(n, [ 2, 4, 5 ]), 
          e.identical(n, [ 1, 3 ]), e.is(a === n), n = [ 1, 1, 1 ], a = r.arrayRemoveArraysOnce(n, [ 1 ]), 
          e.identical(n, [ 1, 1 ]), e.is(a === n), n = [ 1, 1, 2, 3, 3, 4, 5, 5 ];
          var i = [ [ 1 ], [ 2, [ 3 ] ], [ [ [ 4 ] ], 5 ] ];
          a = r.arrayRemoveArraysOnce(n, i), e.identical(a, [ 1, 3, 3, 4, 5 ]), e.is(a === n), 
          n = [ 1, 1, 2, 2, 3, 4, 4, 5 ], i = [ [ 1, 1 ], 2, [ 3 ], 4, 4, [ 5 ] ], a = r.arrayRemoveArraysOnce(n, i), 
          e.identical(n, [ 2 ]), e.is(a === n), n = [ 1, 2, 3, 4, 5 ], i = [ [ 1 ], [ 2, [ 3 ] ], [ [ [ 4 ] ], 5 ] ], 
          a = r.arrayRemoveArraysOnce(n, i), e.identical(a, [ 3, 4 ]), e.is(a === n), n = [ 5, 5 ], 
          i = [ [ 5 ] ], a = r.arrayRemoveArraysOnce(n, i), e.identical(a, [ 5 ]), e.is(a === n), 
          n = [ [ 5 ], [ 5 ] ], i = [ [ 5 ] ], a = r.arrayRemoveArraysOnce(n, i), e.identical(n, [ [ 5 ], [ 5 ] ]), 
          e.is(a === n), n = [ [ 5 ], [ 5 ] ], i = [ [ [ 5 ] ] ], a = r.arrayRemoveArraysOnce(n, i), 
          e.identical(n, [ [ 5 ], [ 5 ] ]), e.is(a === n), n = [ 1, 2, [ 3 ] ], i = [ 1, 2, [ 3 ] ], 
          a = r.arrayRemoveArraysOnce(n, i, onEqualize), e.identical(a, [ [ 3 ] ]), e.is(a === n), 
          e.case = "array has undefined", n = [ 1 ], e.mustNotThrowError(function() {
            var a = r.arrayRemoveArraysOnce(n, [ void 0, 2 ]);
            e.identical(n, [ 1 ]), e.is(a === n);
          }), e.case = "equalizer 2 args", n = [ {
            num: 1
          }, {
            num: 2
          }, {
            num: 3
          } ];
          var onEqualize = function(r, e) {
            return r.num === e.num;
          };
          i = [ [ {
            num: 3
          } ], {
            num: 1
          } ], a = r.arrayRemoveArraysOnce(n, i, onEqualize), e.identical(a, [ {
            num: 2
          } ]), e.is(a === n), e.case = "equalizer 1 arg", n = [ {
            num: 1
          }, {
            num: 2
          }, {
            num: 3
          } ], i = [ [ 3 ], 1 ], a = r.arrayRemoveArraysOnce(n, i, r => r.num, r => r), e.identical(a, [ {
            num: 2
          } ]), e.is(a === n), e.case = "no arguments", e.shouldThrowErrorSync(function() {
            r.arrayRemoveArraysOnce();
          }), e.case = "dst is not a array", e.shouldThrowErrorSync(function() {
            r.arrayRemoveArraysOnce(1, [ 2 ]);
          }), e.case = "onEqualize is not a routine", e.shouldThrowErrorSync(function() {
            r.arrayRemoveArraysOnce([], [ 1, 2, 3 ], []);
          }), e.case = "second arg is not longIs entity", e.shouldThrowErrorSync(function() {
            r.arrayRemoveArraysOnce([], 1);
          });
        }
        //
        ,
        arrayRemoveArraysOnceStrictly: function arrayRemoveArraysOnceStrictly(e) {
          e.case = "simple";
          var a = [ 1, 2, 3 ], n = r.arrayRemoveArraysOnceStrictly(a, [ 2 ]);
          e.identical(n, [ 1, 3 ]), e.is(n === a), a = [ 1, 2, 3 ], n = r.arrayRemoveArraysOnceStrictly(a, [ 1, 2, 3 ]), 
          e.identical(n, []), e.is(n === a), a = [ 1, 2, 3, 4 ];
          var i = [ [ 1 ], [ 2 ], [ 3 ], [ 4 ] ];
          n = r.arrayRemoveArraysOnceStrictly(a, i), e.identical(n, []), e.is(n === a), a = [ 1, 2, 3, 4, 5 ], 
          i = [ [ 1 ], [ 2, 3 ], [ 4 ], 5 ], n = r.arrayRemoveArraysOnceStrictly(a, i), e.identical(n, []), 
          e.is(n === a), a = [ 5, 6, 7, 8 ], i = [ [ 5, 6 ], 7 ], n = r.arrayRemoveArraysOnceStrictly(a, i), 
          e.identical(n, [ 8 ]), e.is(n === a), e.case = "equalizer 2 args", a = [ {
            num: 1
          }, {
            num: 2
          }, {
            num: 3
          } ], i = [ [ {
            num: 3
          } ], {
            num: 1
          } ], n = r.arrayRemoveArraysOnceStrictly(a, i, function(r, e) {
            return r.num === e.num;
          }), e.identical(n, [ {
            num: 2
          } ]), e.is(n === a), e.case = "equalizer 1 arg", a = [ {
            num: 1
          }, {
            num: 2
          }, {
            num: 3
          } ], i = [ [ 3 ], 1 ], n = r.arrayRemoveArraysOnceStrictly(a, i, r => r.num, r => r), 
          e.identical(n, [ {
            num: 2
          } ]), e.is(n === a), e.case = "no args", e.shouldThrowErrorSync(function() {
            r.arrayRemoveArraysOnceStrictly();
          }), e.case = "dst is not an array", e.shouldThrowErrorSync(function() {
            r.arrayRemoveArraysOnceStrictly(1, 1);
          }), e.case = "ins not exists", e.shouldThrowErrorSync(function() {
            r.arrayRemoveArraysOnceStrictly([ 1 ], [ 2 ]);
          }), e.case = "ins repeated in dstArray", e.shouldThrowErrorSync(function() {
            r.arrayRemoveArraysOnceStrictly([ 1, 2, 2 ], [ [ 2 ] ]);
          }), e.case = "ins element repeated", e.shouldThrowErrorSync(function() {
            r.arrayRemoveArraysOnceStrictly([ 1, 2, 3, 4, 5 ], [ [ 2, 3 ], 2 ]);
          }), e.case = "onEqualize is not a routine", e.shouldThrowErrorSync(function() {
            r.arrayRemoveArraysOnceStrictly([], [ 1, 2, 3 ], []);
          }), e.case = "onEqualize", a = [ {
            num: 1
          }, {
            num: 2
          }, {
            num: 3
          } ], e.shouldThrowErrorSync(function() {
            r.arrayRemoveArraysOnceStrictly(a, [ [ {
              num: 4
            } ] ], function(r, e) {
              return r.num === e.num;
            });
          }), e.identical(a, [ {
            num: 1
          }, {
            num: 2
          }, {
            num: 3
          } ]), e.shouldThrowErrorSync(function() {
            r.arrayRemoveArraysOnceStrictly(a, [ [ 4 ] ], function(r) {
              return r.num;
            });
          }), e.identical(a, [ {
            num: 1
          }, {
            num: 2
          }, {
            num: 3
          } ]);
        }
        //
        ,
        arrayRemovedArrays: function arrayRemovedArrays(e) {
          e.case = "nothing";
          var a = [], n = r.arrayRemovedArrays(a, []);
          e.identical(a, []), e.identical(n, 0), e.case = "simple", a = [], n = r.arrayRemovedArrays(a, [ 1, 2, 3 ]), 
          e.identical(a, []), e.identical(n, 0), e.case = "prepends only unique elements", 
          a = [ 1, 2, 3 ], n = r.arrayRemovedArrays(a, [ 2, 4, 5 ]), e.identical(a, [ 1, 3 ]), 
          e.identical(n, 1), a = [ 1, 1, 1 ], n = r.arrayRemovedArrays(a, [ 1 ]), e.identical(a, []), 
          e.identical(n, 3), a = [ 1, 2, 3, 4, 5 ];
          var i = [ [ 1 ], [ 2, [ 3 ] ], [ [ [ 4 ] ], 5 ] ];
          n = r.arrayRemovedArrays(a, i), e.identical(a, [ 3, 4 ]), e.identical(n, 3), a = [ 1, 2, 3, 4, 5 ], 
          i = [ [ 1 ], 2, [ 3 ], 4, [ 5 ] ], n = r.arrayRemovedArrays(a, i), e.identical(a, []), 
          e.identical(n, 5), a = [ 1, 2, 3, 4, 5 ], i = [ [ 1 ], [ 2, [ 3 ] ], [ [ [ 4 ] ], 5 ] ], 
          n = r.arrayRemovedArrays(a, i), e.identical(a, [ 3, 4 ]), e.identical(n, 3), a = [ 5 ], 
          i = [ [ 5 ] ], n = r.arrayRemovedArrays(a, i), e.identical(a, []), e.identical(n, 1), 
          a = [ [ 5 ] ], i = [ [ 5 ] ], n = r.arrayRemovedArrays(a, i), e.identical(a, [ [ 5 ] ]), 
          e.identical(n, 0), a = [ [ 5 ] ], i = [ [ [ 5 ] ] ], n = r.arrayRemovedArrays(a, i), 
          e.identical(a, [ [ 5 ] ]), e.identical(n, 0), e.case = "array has undefined", a = [ 1 ], 
          n = r.arrayRemovedArrays(a, [ void 0, 2 ]), e.identical(a, [ 1 ]), e.identical(n, 0), 
          e.case = "no arguments", e.shouldThrowErrorSync(function() {
            r.arrayRemovedArrays();
          }), e.case = "argument is undefined", a = [ 1 ], e.shouldThrowErrorSync(function() {
            r.arrayRemovedArrays(a, void 0);
          }), e.identical(a, [ 1 ]), e.case = "second arg is not longIs entity", e.shouldThrowErrorSync(function() {
            r.arrayRemovedArrays([], 1);
          }), e.case = "too many args", e.shouldThrowErrorSync(function() {
            r.arrayRemovedArrays([], [ 1 ], [ 1 ]);
          });
        }
        //
        ,
        arrayRemovedArraysOnce: function arrayRemovedArraysOnce(e) {
          e.case = "nothing";
          var a = [], n = r.arrayRemovedArraysOnce(a, []);
          e.identical(a, []), e.identical(n, 0), e.case = "simple", a = [], n = r.arrayRemovedArraysOnce(a, [ 1, 2, 3 ]), 
          e.identical(a, []), e.identical(n, 0), e.case = "prepends only unique elements", 
          a = [ 1, 2, 3 ], n = r.arrayRemovedArraysOnce(a, [ 2, 4, 5 ]), e.identical(a, [ 1, 3 ]), 
          e.identical(n, 1), a = [ 1, 1, 1 ], n = r.arrayRemovedArraysOnce(a, [ 1 ]), e.identical(a, [ 1, 1 ]), 
          e.identical(n, 1), a = [ 1, 1, 2, 3, 3, 4, 5, 5 ];
          var i = [ [ 1 ], [ 2, [ 3 ] ], [ [ [ 4 ] ], 5 ] ];
          n = r.arrayRemovedArraysOnce(a, i), e.identical(a, [ 1, 3, 3, 4, 5 ]), e.identical(n, 3), 
          a = [ 1, 1, 2, 2, 3, 4, 4, 5 ], i = [ [ 1, 1 ], 2, [ 3 ], 4, 4, [ 5 ] ], n = r.arrayRemovedArraysOnce(a, i), 
          e.identical(a, [ 2 ]), e.identical(n, 7), a = [ 1, 2, 3, 4, 5 ], i = [ [ 1 ], [ 2, [ 3 ] ], [ [ [ 4 ] ], 5 ] ], 
          n = r.arrayRemovedArraysOnce(a, i), e.identical(a, [ 3, 4 ]), e.identical(n, 3), 
          a = [ 5, 5 ], i = [ [ 5 ] ], n = r.arrayRemovedArraysOnce(a, i), e.identical(a, [ 5 ]), 
          e.identical(n, 1), a = [ [ 5 ], [ 5 ] ], i = [ [ 5 ] ], n = r.arrayRemovedArraysOnce(a, i), 
          e.identical(a, [ [ 5 ], [ 5 ] ]), e.identical(n, 0), a = [ [ 5 ], [ 5 ] ], i = [ [ [ 5 ] ] ], 
          n = r.arrayRemovedArraysOnce(a, i), e.identical(a, [ [ 5 ], [ 5 ] ]), e.identical(n, 0), 
          a = [ 1, 2, [ 3 ] ], i = [ 1, 2, [ 3 ] ], n = r.arrayRemovedArraysOnce(a, i, function onEqualize(r, e) {
            return r === e;
          }), e.identical(a, [ [ 3 ] ]), e.identical(n, 2), e.case = "array has undefined", 
          a = [ 1 ], e.mustNotThrowError(function() {
            var n = r.arrayRemovedArraysOnce(a, [ void 0, 2 ]);
            e.identical(a, [ 1 ]), e.identical(n, 0);
          }), e.case = "no arguments", e.shouldThrowErrorSync(function() {
            r.arrayRemovedArraysOnce();
          }), e.case = "dst is not a array", e.shouldThrowErrorSync(function() {
            r.arrayRemovedArraysOnce(1, [ 2 ]);
          }), e.case = "onEqualize is not a routine", e.shouldThrowErrorSync(function() {
            r.arrayRemovedArraysOnce([], [ 1, 2, 3 ], []);
          }), e.case = "second arg is not longIs entity", e.shouldThrowErrorSync(function() {
            r.arrayRemovedArraysOnce([], 1);
          });
        }
        //
        ,
        arrayRemovedArraysOnceStrictly: function arrayRemovedArraysOnceStrictly(e) {
          e.case = "simple";
          var a = [ 1, 2, 3 ], n = r.arrayRemovedArraysOnceStrictly(a, [ 2 ]);
          e.identical(a, [ 1, 3 ]), e.identical(n, 1), a = [ 1, 2, 3 ], n = r.arrayRemovedArraysOnceStrictly(a, [ 1, 2, 3 ]), 
          e.identical(a, []), e.identical(n, 3), a = [ 1, 2, 3, 4 ];
          var i = [ [ 1 ], [ 2 ], [ 3 ], [ 4 ] ];
          n = r.arrayRemovedArraysOnceStrictly(a, i), e.identical(a, []), e.identical(n, 4), 
          a = [ 1, 2, 3, 4, 5 ], i = [ [ 1 ], [ 2, 3 ], [ 4 ], 5 ], n = r.arrayRemovedArraysOnceStrictly(a, i), 
          e.identical(a, []), e.identical(n, 5), a = [ 5, 6, 7, 8 ], i = [ [ 5, 6 ], 7 ], 
          n = r.arrayRemovedArraysOnceStrictly(a, i), e.identical(a, [ 8 ]), e.identical(n, 3), 
          e.case = "equalizer 2 args", a = [ {
            num: 1
          }, {
            num: 2
          }, {
            num: 3
          } ], i = [ [ {
            num: 3
          } ], {
            num: 1
          } ], n = r.arrayRemovedArraysOnceStrictly(a, i, function(r, e) {
            return r.num === e.num;
          }), e.identical(a, [ {
            num: 2
          } ]), e.identical(n, 2), e.case = "equalizer 1 arg", a = [ {
            num: 1
          }, {
            num: 2
          }, {
            num: 3
          } ], i = [ [ 3 ], 1 ], n = r.arrayRemovedArraysOnceStrictly(a, i, r => r.num, r => r), 
          e.identical(a, [ {
            num: 2
          } ]), e.identical(n, 2), e.case = "no args", e.shouldThrowErrorSync(function() {
            r.arrayRemovedArraysOnceStrictly();
          }), e.case = "dst is not an array", e.shouldThrowErrorSync(function() {
            r.arrayRemovedArraysOnceStrictly(1, 1);
          }), e.case = "ins not exists", e.shouldThrowErrorSync(function() {
            r.arrayRemovedArraysOnceStrictly([ 1 ], [ 2 ]);
          }), e.case = "ins repeated in dstArray", e.shouldThrowErrorSync(function() {
            r.arrayRemovedArraysOnceStrictly([ 1, 2, 2 ], [ [ 2 ] ]);
          }), e.case = "ins element repeated", e.shouldThrowErrorSync(function() {
            r.arrayRemovedArraysOnceStrictly([ 1, 2, 3, 4, 5 ], [ [ 2, 3 ], 2 ]);
          }), e.case = "onEqualize is not a routine", e.shouldThrowErrorSync(function() {
            r.arrayRemovedArraysOnceStrictly([], [ 1, 2, 3 ], []);
          }), e.case = "onEqualize", a = [ {
            num: 1
          }, {
            num: 2
          }, {
            num: 3
          } ], e.shouldThrowErrorSync(function() {
            r.arrayRemovedArraysOnceStrictly(a, [ [ {
              num: 4
            } ] ], function(r, e) {
              return r.num === e.num;
            });
          }), e.identical(a, [ {
            num: 1
          }, {
            num: 2
          }, {
            num: 3
          } ]), e.shouldThrowErrorSync(function() {
            r.arrayRemovedArraysOnceStrictly(a, [ [ 4 ] ], function(r) {
              return r.num;
            });
          }), e.identical(a, [ {
            num: 1
          }, {
            num: 2
          }, {
            num: 3
          } ]);
        }
        //
        ,
        arrayRemoveDuplicates: function arrayRemoveDuplicates(e) {
          e.case = "empty";
          var a = [], n = r.arrayRemoveDuplicates(a), i = [];
          e.identical(a, i), e.identical(n, i), e.case = "No duplicates - One element", a = [ 1 ], 
          n = r.arrayRemoveDuplicates(a), i = [ 1 ], e.identical(a, i), e.identical(n, i), 
          e.case = "No duplicates - Several elements", a = [ 1, 2, 3, "4", "5" ], n = r.arrayRemoveDuplicates(a), 
          i = [ 1, 2, 3, "4", "5" ], e.identical(a, i), e.identical(n, i), e.case = "One duplicated element", 
          a = [ 1, 2, 2 ], n = r.arrayRemoveDuplicates(a), i = [ 1, 2 ], e.identical(a, i), 
          e.identical(n, i), e.case = "One duplicated element - Several elements", a = [ 1, 2, 1, 1, 1 ], 
          n = r.arrayRemoveDuplicates(a), i = [ 1, 2 ], e.identical(a, i), e.identical(n, i), 
          e.case = "Several duplicates several times", a = [ 1, 2, 3, "4", "4", 1, 2, 1, 5 ], 
          n = r.arrayRemoveDuplicates(a), i = [ 1, 2, 3, "4", 5 ], e.identical(a, i), e.identical(n, i), 
          e.case = "onEqualize", a = [ 1, 2, 3, "4", "4", 1, 2, 1, 5 ], n = r.arrayRemoveDuplicates(a, function(r, e) {
            return r === e;
          }), i = [ 1, 2, 3, "4", 5 ], e.identical(a, i), e.identical(n, i), e.case = "Evaluator", 
          a = [ {
            "num": 0
          }, {
            "num": 1
          }, {
            "num": 2
          }, {
            "num": 0
          } ], n = r.arrayRemoveDuplicates(a, function(r) {
            return r.num;
          }), i = [ {
            "num": 0
          }, {
            "num": 1
          }, {
            "num": 2
          } ], e.identical(a, i), e.identical(n, i), e.case = "no args", e.shouldThrowErrorSync(function() {
            r.arrayRemoveDuplicates();
          }), 
          // test.case = 'more than two args';
          // test.shouldThrowErrorSync( function()
          // {
          //   _.arrayRemoveDuplicates( [ 1 ], 1, 1 );
          // })
          e.case = "dst is not an array", e.shouldThrowErrorSync(function() {
            r.arrayRemoveDuplicates(1);
          }), e.case = "dst is not an array", e.shouldThrowErrorSync(function() {
            r.arrayRemoveDuplicates(new Uint8Array([ 1, 2, 3, 4, 5 ]));
          }), e.case = "second arg is not a function", e.shouldThrowErrorSync(function() {
            r.arrayRemoveDuplicates(1, 1);
          });
        }
        //
        ,
        longRemoveDuplicates: function longRemoveDuplicates(e) {
          // dst is arguments
          function returnArgs() {
            return r.longRemoveDuplicates(arguments);
          }
          // dst is an array
          e.case = "empty";
          var a = [], n = r.longRemoveDuplicates(a), i = [];
          e.identical(a, i), e.identical(n, i), e.case = "No duplicates - One element", a = [ 1 ], 
          n = r.longRemoveDuplicates(a), i = [ 1 ], e.identical(a, i), e.identical(n, i), 
          e.case = "No duplicates - Several elements", a = [ 1, 2, 3, "4", "5" ], n = r.longRemoveDuplicates(a), 
          i = [ 1, 2, 3, "4", "5" ], e.identical(a, i), e.identical(n, i), e.case = "One duplicated element", 
          a = [ 1, 2, 2 ], n = r.longRemoveDuplicates(a), i = [ 1, 2 ], e.identical(a, i), 
          e.identical(n, i), e.case = "One duplicated element - Several elements", a = [ 1, 2, 1, 1, 1 ], 
          n = r.longRemoveDuplicates(a), i = [ 1, 2 ], e.identical(a, i), e.identical(n, i), 
          e.case = "Several duplicates several times", a = [ 1, 2, 3, "4", "4", 1, 2, 1, 5 ], 
          n = r.longRemoveDuplicates(a), i = [ 1, 2, 3, "4", 5 ], e.identical(a, i), e.identical(n, i), 
          // dst is a typed array
          e.case = "empty", a = new Uint8Array(0), n = r.longRemoveDuplicates(a), i = new Uint8Array([]), 
          e.identical(a, i), e.identical(n, i), e.case = "No duplicates - One element", a = new Uint8ClampedArray([ 300 ]), 
          n = r.longRemoveDuplicates(a), i = new Uint8ClampedArray([ 255 ]), e.identical(a, i), 
          e.identical(n, i), e.case = "No duplicates - Several elements", a = new Int8Array([ 1, 2, 3, "4", "5" ]), 
          n = r.longRemoveDuplicates(a), i = new Int8Array([ 1, 2, 3, "4", "5" ]), e.identical(a, i), 
          e.identical(n, i), e.case = "One duplicated element - new returned instance", a = new Int8Array([ 1, 2, 2 ]), 
          n = r.longRemoveDuplicates(a), i = new Int8Array([ 1, 2 ]), e.identical(n, i), e.is(a !== n), 
          e.case = "One duplicated element - Several elements", a = new Uint8ClampedArray([ -12, 2, -1, 0, -11 ]), 
          n = r.longRemoveDuplicates(a), i = new Uint8ClampedArray([ 0, 2 ]), e.identical(n, i), 
          e.is(a !== n), e.case = "Several duplicates several times", a = new Int8Array([ 1, 2, 3, "4", "4", 1, 2, 1, 5 ]), 
          n = r.longRemoveDuplicates(a), i = new Int8Array([ 1, 2, 3, "4", 5 ]), e.identical(n, i), 
          e.is(a !== n), e.case = "No duplicates", n = returnArgs(1, "2", 3), i = [ 1, "2", 3 ], 
          e.identical(n.length, i.length), e.identical(n[0], i[0]), e.identical(n[1], i[1]), 
          e.identical(n[2], i[2]), e.case = "Duplicates", n = returnArgs(1, "2", 3, 1, "2", 3), 
          i = [ 1, "2", 3 ], e.identical(n, i), 
          // Evaluators
          e.case = "onEqualize", a = new Int8Array([ 1, 2, 3, "4", "4", 1, 2, 1, 5 ]), n = r.longRemoveDuplicates(a, function(r, e) {
            return r === e;
          }), i = new Int8Array([ 1, 2, 3, "4", 5 ]), e.identical(n, i), e.is(a !== n), e.case = "Evaluator", 
          a = new Float32Array([ 1, 1.1, 1.48483, 1.578292, 1.9 ]), n = r.longRemoveDuplicates(a, function(r) {
            return Math.floor(r);
          }), i = new Float32Array([ 1 ]), e.identical(n, i), e.is(a !== n), e.case = "no args", 
          e.shouldThrowErrorSync(function() {
            r.longRemoveDuplicates();
          }), 
          // test.case = 'more than two args';
          // test.shouldThrowErrorSync( function()
          // {
          //   _.longRemoveDuplicates( [ 1 ], 1, 1 );
          // })
          e.case = "dst is not an long", e.shouldThrowErrorSync(function() {
            r.longRemoveDuplicates(1);
          }), e.case = "second arg is not a function", e.shouldThrowErrorSync(function() {
            r.longRemoveDuplicates(1, 1);
          });
        }
        //
        ,
        // array flatten
        arrayFlatten: function arrayFlatten(e) {
          e.case = "make array flat, dst is empty";
          var a = r.arrayFlatten(null, []);
          e.identical(a, []), a = r.arrayFlatten([], []), e.identical(a, []), a = r.arrayFlatten(null, [ 1, 2, 3 ]), 
          e.identical(a, [ 1, 2, 3 ]), a = r.arrayFlatten([], [ 1, 2, 3 ]), e.identical(a, [ 1, 2, 3 ]), 
          a = r.arrayFlatten([], [ [ 1 ], [ 2 ], [ 3 ] ]), e.identical(a, [ 1, 2, 3 ]), a = r.arrayFlatten([], [ [ 1, [ 2, [ 3 ] ] ] ]), 
          e.identical(a, [ 1, 2, 3 ]), a = r.arrayFlatten([], [ [ [ [ [ 1 ] ] ] ] ]), e.identical(a, [ 1 ]), 
          a = r.arrayFlatten([], 1, 2, "3"), e.identical(a, [ 1, 2, "3" ]), e.case = "make array flat, dst is not empty", 
          a = r.arrayFlatten([ 1, 2, 3 ], [ 4 ]), e.identical(a, [ 1, 2, 3, 4 ]), a = r.arrayFlatten([ 1, 2, 3 ], [ 1, 2, 3 ]), 
          e.identical(a, [ 1, 2, 3, 1, 2, 3 ]), a = r.arrayFlatten([ 1, 2, 3 ], [ [ 1 ], [ 2 ], [ 3 ] ]), 
          e.identical(a, [ 1, 2, 3, 1, 2, 3 ]), a = r.arrayFlatten([ 1, 2, 3 ], [ [ 1, [ 2, [ 3 ] ] ] ]), 
          e.identical(a, [ 1, 2, 3, 1, 2, 3 ]), a = r.arrayFlatten([ 1 ], [ [ [ [ [ 1 ] ] ] ] ]), 
          e.identical(a, [ 1, 1 ]), a = r.arrayFlatten([], 1), e.identical(a, [ 1 ]), 
          /*
  var got  = _.arrayFlatten( [ 1 ], 2, 3 );
  test.identical( got, [ 1, 2, 3 ] );
  */
          e.case = "make array flat from multiple arrays as one arg", a = r.arrayFlatten([], [ [ 1 ], [ [ 2 ] ], [ 3, [ [ [ 4 ] ] ] ] ]), 
          e.identical(a, [ 1, 2, 3, 4 ]), e.case = "make array flat from different inputs -  null dstArray", 
          a = r.arrayFlatten(null, "str", {}, [ 1, 2 ], 5, !0), e.identical(a, [ "str", {}, 1, 2, 5, !0 ]), 
          a = r.arrayFlatten([ 1, 1, 3, 3, [ 5, 5 ] ], 5);
          var n = [ 1, 1, 3, 3, [ 5, 5 ], 5 ];
          e.identical(a, n), a = r.arrayFlatten(null, [ 1, 1, 3, 3, [ 5, 5 ] ]), n = [ 1, 1, 3, 3, 5, 5 ], 
          e.identical(a, n), a = r.arrayFlatten([ [ 0 ], [ [ -1, -2 ] ] ], [ 1, 1, 3, 3, [ 5, 5 ] ]), 
          n = [ [ 0 ], [ [ -1, -2 ] ], 1, 1, 3, 3, 5, 5 ], e.identical(a, n), 
          //
          e.open("another criteria"), e.open("single argument"), a = r.arrayFlatten([ 0, 1, 2, 3 ]), 
          n = [ 0, 1, 2, 3 ], e.identical(a, n), a = r.arrayFlatten([ 0, 1, 0, 1 ]), n = [ 0, 1, 0, 1 ], 
          e.identical(a, n), a = r.arrayFlatten([ [ 0, 0 ], [ 1, 1 ] ]), n = [ 0, 0, 1, 1 ], 
          e.identical(a, n), a = r.arrayFlatten([ [ 0 ], 0, 1, [ 0, 1 ] ]), n = [ 0, 0, 1, 0, 1 ], 
          e.identical(a, n), a = r.arrayFlatten([ [ [ 0 ] ] ]), n = [ 0 ], e.identical(a, n), 
          a = r.arrayFlatten([ 1, 1, 3, 3, [ 5, 5 ] ]), n = [ 1, 1, 3, 3, 5, 5 ], e.identical(a, n), 
          e.close("single argument"), //
          e.open("two arguments"), a = r.arrayFlatten([ 0, 1, 2, 3 ]), n = [ 0, 1, 2, 3 ], 
          e.identical(a, n), a = r.arrayFlatten([ 0, 1, 0, 1 ]), n = [ 0, 1, 0, 1 ], e.identical(a, n), 
          a = r.arrayFlatten([ [ 0, 0 ], [ 1, 1 ] ]), n = [ 0, 0, 1, 1 ], e.identical(a, n), 
          a = r.arrayFlatten([ [ 0 ], 0, 1, [ 0, 1 ] ]), n = [ 0, 0, 1, 0, 1 ], e.identical(a, n), 
          a = r.arrayFlatten([ [ [ 0 ] ] ]), n = [ 0 ], e.identical(a, n), a = r.arrayFlatten([ 1, 1, 3, 3, [ 5, 5 ] ]), 
          n = [ 1, 1, 3, 3, 5, 5 ], e.identical(a, n), e.close("two arguments"), //
          e.close("another criteria"), e.case = "Empty", e.shouldThrowErrorSync(function() {
            r.arrayFlatten();
          });
        }
        //
        ,
        arrayFlattenOnce: function arrayFlattenOnce(e) {
          e.case = "make array flat, dst is empty";
          var a = r.arrayFlattenOnce([], []);
          e.identical(a, []), a = r.arrayFlattenOnce([], [ 1, 1, 2, 2, 3, 3 ]), e.identical(a, [ 1, 2, 3 ]), 
          a = r.arrayFlattenOnce([], [ [ 1 ], [ 1 ], [ 2 ], [ 2 ], [ 3 ], [ 3 ] ]), e.identical(a, [ 1, 2, 3 ]), 
          a = r.arrayFlattenOnce([], [ [ 1, 1, [ 2, 2, [ 3, 3 ] ] ] ]), e.identical(a, [ 1, 2, 3 ]), 
          a = r.arrayFlattenOnce([], [ [ [ [ [ 1, 1, 1 ] ] ] ] ]), e.identical(a, [ 1 ]), 
          e.case = "make array flat, dst is not empty", a = r.arrayFlattenOnce([ 1, 2, 3, 4 ], [ 4 ]), 
          e.identical(a, [ 1, 2, 3, 4 ]), a = r.arrayFlattenOnce([ 1, 2, 3 ], [ 1, 2, 3, [ [ 4 ] ] ]), 
          e.identical(a, [ 1, 2, 3, 4 ]), a = r.arrayFlattenOnce([ 1, 2, 3 ], [ [ 1 ], [ 2 ], [ 3 ], [ 4 ] ]), 
          e.identical(a, [ 1, 2, 3, 4 ]), a = r.arrayFlattenOnce([ 1, 2, 3 ], [ [ 1, [ 2, [ 3 ] ] ], 4 ]), 
          e.identical(a, [ 1, 2, 3, 4 ]), a = r.arrayFlattenOnce([ 1 ], [ [ [ [ [ 1, 1, 1 ] ] ] ] ]), 
          e.identical(a, [ 1 ]), e.case = "make array flat from multiple arrays as one arg", 
          a = r.arrayFlattenOnce([ 1, 4 ], [ [ 1 ], [ [ 2 ] ], [ 3, [ [ [ 4 ] ] ] ] ]), e.identical(a, [ 1, 4, 2, 3 ]), 
          e.case = "onEqualize", a = r.arrayFlattenOnce([ 1, 2, 3, 4 ], [ 1, 4, 2, 5 ], function(r, e) {
            return r === e;
          }), e.identical(a, [ 1, 2, 3, 4, 5 ]);
          debugger;
          a = r.arrayFlattenOnce([], 1), e.identical(a, [ 1 ]), a = r.arrayFlattenOnce([ 1, 1, 3, 3, [ 5, 5 ] ], 5);
          var n = [ 1, 1, 3, 3, [ 5, 5 ], 5 ];
          e.identical(a, n), a = r.arrayFlattenOnce(null, [ 1, 1, 3, 3, [ 5, 5 ] ]), n = [ 1, 3, 5 ], 
          e.identical(a, n), 
          //
          e.open("single argument"), a = r.arrayFlattenOnce([ 0, 1, 2, 3 ]), n = [ 0, 1, 2, 3 ], 
          e.identical(a, n), a = r.arrayFlattenOnce([ 0, 1, 0, 1 ]), n = [ 0, 1 ], e.identical(a, n), 
          a = r.arrayFlattenOnce([ [ 0, 0 ], [ 1, 1 ] ]), n = [ 0, 1 ], e.identical(a, n), 
          a = r.arrayFlattenOnce([ [ 0 ], 0, 1, [ 0, 1 ] ]), n = [ 0, 1 ], e.identical(a, n), 
          a = r.arrayFlattenOnce([ 1, [ [ 0 ], 1 ], 1, 0 ]), n = [ 1, 0 ], e.identical(a, n), 
          a = r.arrayFlattenOnce([ 1, 1, 3, 3, [ 5, 5 ] ]), n = [ 1, 3, 5 ], e.identical(a, n), 
          e.close("single argument"), e.case = "not enough arguments", e.shouldThrowErrorSync(function() {
            r.arrayFlattenOnce();
          }), e.case = "first is not longIs", e.shouldThrowErrorSync(function() {
            r.arrayFlattenOnce(1, [ 1 ]);
          }), e.case = "onEqualize is not a routine", e.shouldThrowErrorSync(function() {
            r.arrayFlattenOnce([], [ 1 ], []);
          });
        }
        //
        ,
        arrayFlattenOnceStrictly: function arrayFlattenOnceStrictly(e) {
          e.case = "make array flat, dst is empty";
          var a = r.arrayFlattenOnceStrictly([], []);
          e.identical(a, []);
          var n = [];
          a = r.arrayFlattenOnceStrictly(n, [ 1, 2, 3, 4 ]), e.identical(a, [ 1, 2, 3, 4 ]), 
          e.identical(n, a), n = [], a = r.arrayFlattenOnceStrictly(n, [ [ 1 ], [ 2 ], [ 3 ], [ 4 ] ]), 
          e.identical(a, [ 1, 2, 3, 4 ]), e.identical(n, a), n = [], a = r.arrayFlattenOnceStrictly(n, [ [ 1, [ 2, [ 3 ], 4 ] ] ]), 
          e.identical(a, [ 1, 2, 3, 4 ]), e.identical(n, a), n = [], a = r.arrayFlattenOnceStrictly(n, [ 1, [ 2, [ [ 3, [ 4 ] ] ] ] ]), 
          e.identical(a, [ 1, 2, 3, 4 ]), e.identical(n, a), e.case = "make array flat, dst is not empty", 
          a = r.arrayFlattenOnceStrictly([ 1, 2, 3, 4 ], [ 5 ]), e.identical(a, [ 1, 2, 3, 4, 5 ]), 
          a = r.arrayFlattenOnceStrictly([ 1, 2, 3 ], [ [ [ 4 ] ] ]), e.identical(a, [ 1, 2, 3, 4 ]), 
          a = r.arrayFlattenOnceStrictly([ 1 ], [ [ [ [ [ 0, 2, 3 ] ] ] ] ]), e.identical(a, [ 1, 0, 2, 3 ]), 
          e.case = "make array flat from multiple arrays as one arg", a = r.arrayFlattenOnceStrictly([ 1, 4 ], [ [ [ 2 ] ], [ 3, [ [ [ 5 ] ] ] ] ]), 
          e.identical(a, [ 1, 4, 2, 3, 5 ]), e.case = "onEqualize", a = r.arrayFlattenOnceStrictly([ 1, 2, 3, 4 ], [ 5 ], function(r, e) {
            return r === e;
          }), e.identical(a, [ 1, 2, 3, 4, 5 ]);
          debugger;
          e.case = "dstArray has sub arrays", a = r.arrayFlattenOnceStrictly([ 1, 3, [ 5 ] ], 6);
          var i = [ 1, 3, [ 5 ], 6 ];
          e.identical(a, i), a = r.arrayFlattenOnceStrictly([ [ 1, [ 3, [ 5 ] ] ], 2 ], 6), 
          i = [ [ 1, [ 3, [ 5 ] ] ], 2, 6 ], e.identical(a, i), a = r.arrayFlattenOnceStrictly([ 1, 3, [ 5 ] ], 5), 
          i = [ 1, 3, [ 5 ], 5 ], e.identical(a, i), a = r.arrayFlattenOnceStrictly([], [ 1, 3, [ 5, 6 ] ]), 
          i = [ 1, 3, 5, 6 ], e.identical(a, i), 
          //
          e.open("single argument"), a = r.arrayFlattenOnceStrictly([ 0, 1, 2, 3 ]), i = [ 0, 1, 2, 3 ], 
          e.identical(a, i), a = r.arrayFlattenOnceStrictly([ 0, [ 1 ] ]), i = [ 0, 1 ], e.identical(a, i), 
          a = r.arrayFlattenOnceStrictly([ [ 0 ], [ 1 ] ]), i = [ 0, 1 ], e.identical(a, i), 
          a = r.arrayFlattenOnceStrictly([ [ 0 ], 1, 2, [ 3, 4 ] ]), i = [ 0, 1, 2, 3, 4 ], 
          e.identical(a, i), a = r.arrayFlattenOnceStrictly([ 0, [ [ 2 ], 1 ], 3, 4 ]), i = [ 0, 1, 2, 3, 4 ], 
          e.identical(a, i), a = r.arrayFlattenOnceStrictly([ 1, 3, [ 5, 7 ] ]), i = [ 1, 3, 5, 7 ], 
          e.identical(a, i), e.close("single argument"), e.case = "not enough arguments", 
          e.shouldThrowErrorSync(function() {
            r.arrayFlattenOnceStrictly();
          }), e.case = "first is not longIs", e.shouldThrowErrorSync(function() {
            r.arrayFlattenOnceStrictly(1, [ 1 ]);
          }), 
          // test.case = 'second is not longIs';
          // test.shouldThrowErrorSync( function()
          // {
          //   _.arrayFlattenOnceStrictly( [], 1 );
          // });
          e.case = "onEqualize is not a routine", e.shouldThrowErrorSync(function() {
            r.arrayFlattenOnceStrictly([], [ 1 ], []);
          }), e.case = "Elements must not be repeated", e.shouldThrowErrorSync(function() {
            r.arrayFlattenOnceStrictly([], [ 1, 1, 2, 2, 3, 3 ]);
          }), e.shouldThrowErrorSync(function() {
            r.arrayFlattenOnceStrictly([], [ [ 1 ], [ 1 ], [ 2 ], [ 2 ], [ 3 ], [ 3 ] ]);
          }), e.shouldThrowErrorSync(function() {
            r.arrayFlattenOnceStrictly([], [ [ 1, 1, [ 2, 2, [ 3, 3 ] ] ] ]);
          }), e.shouldThrowErrorSync(function() {
            r.arrayFlattenOnceStrictly([], [ [ [ [ [ 1, 1, 1 ] ] ] ] ]);
          }), e.shouldThrowErrorSync(function() {
            r.arrayFlattenOnceStrictly([ 0, 1, 2, 3 ], [ [ 4, [ 5, [ 6 ] ] ], 2 ]);
          }), e.shouldThrowErrorSync(function() {
            r.arrayFlattenOnceStrictly([ 0 ], 0);
          }), e.shouldThrowErrorSync(function() {
            r.arrayFlattenOnceStrictly([ 0, 1, 2, 3 ], [ [ 4, [ 5, [ 0 ] ] ], 7 ]);
          }), e.shouldThrowErrorSync(function() {
            r.arrayFlattenOnceStrictly([ 0, 0 ]);
          }), e.shouldThrowErrorSync(function() {
            r.arrayFlattenOnceStrictly([ 0, 0, 1, 1 ]);
          }), e.shouldThrowErrorSync(function() {
            r.arrayFlattenOnceStrictly([ 0, 0 ], 1);
          }), e.shouldThrowErrorSync(function() {
            r.arrayFlattenOnceStrictly([ 0, 0, 1, 1 ], 2);
          }), e.shouldThrowErrorSync(function() {
            r.arrayFlattenOnceStrictly([ 0, 0 ], [ 1, 2 ]);
          }), e.shouldThrowErrorSync(function() {
            r.arrayFlattenOnceStrictly([ 0, 0, 1, 1 ], [ 3, 4, [ 5, [ 6 ] ] ]);
          });
        }
        //
        ,
        arrayFlattened: function arrayFlattened(e) {
          e.case = "make array flat, dst is empty";
          var a = [], n = r.arrayFlattened(a, []);
          e.identical(a, []), e.identical(n, 0), a = [], n = r.arrayFlattened(a, [ 1, 2, 3 ]), 
          e.identical(a, [ 1, 2, 3 ]), e.identical(n, 3), a = [], n = r.arrayFlattened(a, [ [ 1 ], [ 2 ], [ 3 ] ]), 
          e.identical(a, [ 1, 2, 3 ]), e.identical(n, 3), a = [], n = r.arrayFlattened(a, [ [ 1, [ 2, [ 3 ] ] ] ]), 
          e.identical(a, [ 1, 2, 3 ]), e.identical(n, 3), a = [], n = r.arrayFlattened(a, [ [ [ [ [ 1 ] ] ] ] ]), 
          e.identical(a, [ 1 ]), e.identical(n, 1), e.case = "make array flat, dst is not empty", 
          a = [ 1, 2, 3 ], n = r.arrayFlattened(a, [ 4 ]), e.identical(a, [ 1, 2, 3, 4 ]), 
          e.identical(n, 1), a = [ 1, 2, 3 ], n = r.arrayFlattened(a, [ 1, 2, 3 ]), e.identical(a, [ 1, 2, 3, 1, 2, 3 ]), 
          e.identical(n, 3), a = [ 1, 2, 3 ], n = r.arrayFlattened(a, [ [ 1 ], [ 2 ], [ 3 ] ]), 
          e.identical(a, [ 1, 2, 3, 1, 2, 3 ]), e.identical(n, 3), a = [ 1, 2, 3 ], n = r.arrayFlattened(a, [ [ 1, [ 2, [ 3 ] ] ] ]), 
          e.identical(a, [ 1, 2, 3, 1, 2, 3 ]), e.identical(n, 3), a = [ 1 ], n = r.arrayFlattened(a, [ [ [ [ [ 1 ] ] ] ] ]), 
          e.identical(a, [ 1, 1 ]), e.identical(n, 1), a = [ 1, [ 2, 3 ] ], n = r.arrayFlattened(a, [ 4 ]), 
          e.identical(a, [ 1, [ 2, 3 ], 4 ]), e.identical(n, 1), e.case = "make array flat from multiple arrays as one arg", 
          a = [], n = r.arrayFlattened(a, [ [ 1 ], [ [ 2 ] ], [ 3, [ [ [ 4 ] ] ] ] ]), e.identical(a, [ 1, 2, 3, 4 ]), 
          e.identical(n, 4), e.case = "Second is not long", a = [], n = r.arrayFlattened(a, 1), 
          e.identical(a, [ 1 ]), e.identical(n, 1), a = [], n = r.arrayFlattened(a, 1, 2, "3"), 
          e.identical(a, [ 1, 2, "3" ]), e.identical(n, 3), a = [ 1, 1, 3, 3, [ 5, 5 ] ], 
          n = r.arrayFlattened(a, 5);
          var i = [ 1, 1, 3, 3, [ 5, 5 ], 5 ];
          e.identical(a, i), e.identical(n, 1), 
          //
          e.open("single argument"), n = r.arrayFlattened([ 0, 1, 2, 3 ]), i = [ 0, 1, 2, 3 ], 
          e.identical(n, i), n = r.arrayFlattened([ 0, 1, 0, 1 ]), i = [ 0, 1, 0, 1 ], e.identical(n, i), 
          n = r.arrayFlattened([ [ 0, 0 ], [ 1, 1 ] ]), i = [ 0, 0, 1, 1 ], e.identical(n, i), 
          n = r.arrayFlattened([ [ 0 ], 0, 1, [ 0, 1 ] ]), i = [ 0, 0, 1, 0, 1 ], e.identical(n, i), 
          n = r.arrayFlattened([ [ [ 0 ] ] ]), i = [ 0 ], e.identical(n, i), n = r.arrayFlattened([ 1, 1, 3, 3, [ 5, 5 ] ]), 
          i = [ 1, 1, 3, 3, 5, 5 ], e.identical(n, i), n = r.arrayFlattened([ 1, 1, 3, 3, [ 5, 5 ] ]), 
          i = [ 1, 1, 3, 3, 5, 5 ], e.identical(n, i), e.close("single argument"), e.case = "not enough arguments", 
          e.shouldThrowErrorSync(function() {
            r.arrayFlattened();
          }), e.case = "first is not longIs", e.shouldThrowErrorSync(function() {
            r.arrayFlattened(1, [ 1 ]);
          });
        }
        //
        ,
        arrayFlattenedOnce: function arrayFlattenedOnce(e) {
          e.case = "make array flat, dst is empty";
          var a = [], n = r.arrayFlattenedOnce(a, []);
          e.identical(a, []), e.identical(n, 0), a = [], n = r.arrayFlattenedOnce(a, [ 1, 1, 2, 2, 3, 3 ]), 
          e.identical(a, [ 1, 2, 3 ]), e.identical(n, 3), a = [], n = r.arrayFlattenedOnce(a, [ [ 1 ], [ 1 ], [ 2 ], [ 2 ], [ 3 ], [ 3 ] ]), 
          e.identical(a, [ 1, 2, 3 ]), e.identical(n, 3), a = [], n = r.arrayFlattenedOnce(a, [ [ 1, 1, [ 2, 2, [ 3, 3 ] ] ] ]), 
          e.identical(a, [ 1, 2, 3 ]), e.identical(n, 3), a = [], n = r.arrayFlattenedOnce(a, [ [ [ [ [ 1, 1, 1 ] ] ] ] ]), 
          e.identical(a, [ 1 ]), e.identical(n, 1), e.case = "make array flat, dst is not empty", 
          a = [ 1, 2, 3, 4 ], n = r.arrayFlattenedOnce(a, [ 4 ]), e.identical(a, [ 1, 2, 3, 4 ]), 
          e.identical(n, 0), a = [ 1, 2, 3 ], n = r.arrayFlattenedOnce(a, [ 1, 2, 3, [ [ 4 ] ] ]), 
          e.identical(a, [ 1, 2, 3, 4 ]), e.identical(n, 1), a = [ 1, 2, 3 ], n = r.arrayFlattenedOnce(a, [ [ 1 ], [ 2 ], [ 3 ], [ 4 ] ]), 
          e.identical(a, [ 1, 2, 3, 4 ]), e.identical(n, 1), a = [ 1, 2, 3 ], n = r.arrayFlattenedOnce(a, [ [ 1, [ 2, [ 3 ] ] ], 4 ]), 
          e.identical(a, [ 1, 2, 3, 4 ]), e.identical(n, 1), a = [ 1 ], n = r.arrayFlattenedOnce(a, [ [ [ [ [ 1, 1, 1 ] ] ] ] ]), 
          e.identical(a, [ 1 ]), e.identical(n, 0), e.case = "dst contains some inner arrays", 
          a = [ [ 1 ], [ 2 ], [ 3 ] ], n = r.arrayFlattenedOnce(a, [ 1, 2, 3 ]), e.identical(a, [ [ 1 ], [ 2 ], [ 3 ], 1, 2, 3 ]), 
          e.identical(n, 3), a = [ [ 1 ], [ 2 ], [ 3 ] ], n = r.arrayFlattenedOnce(a, [ 4, 5, 6 ]), 
          e.identical(a, [ [ 1 ], [ 2 ], [ 3 ], 4, 5, 6 ]), e.identical(n, 3), e.case = "make array flat from multiple arrays as one arg", 
          a = [ 1, 4 ], n = r.arrayFlattenedOnce(a, [ [ 1 ], [ [ 2 ] ], [ 3, [ [ [ 4 ] ] ] ] ]), 
          e.identical(a, [ 1, 4, 2, 3 ]), e.identical(n, 2), e.case = "onEqualize", a = [ 1, 2, 3, 4 ], 
          n = r.arrayFlattenedOnce(a, [ 1, 4, 2, 5 ], function(r, e) {
            return r === e;
          }), e.identical(a, [ 1, 2, 3, 4, 5 ]), e.identical(n, 1), 
          //
          e.open("single argument"), n = r.arrayFlattenedOnce([ 0, 1, 2, 3 ]);
          var i = [ 0, 1, 2, 3 ];
          e.identical(n, i), n = r.arrayFlattenedOnce([ 0, 1, 0, 1 ]), i = [ 0, 1 ], e.identical(n, i), 
          n = r.arrayFlattenedOnce([ [ 0, 0 ], [ 1, 1 ] ]), i = [ 0, 1 ], e.identical(n, i), 
          n = r.arrayFlattenedOnce([ [ 0 ], 0, 1, [ 0, 1 ] ]), i = [ 0, 1 ], e.identical(n, i), 
          n = r.arrayFlattenedOnce([ 1, [ [ 0 ], 1 ], 1, 0 ]), i = [ 1, 0 ], e.identical(n, i), 
          n = r.arrayFlattenedOnce([ 1, 1, 3, 3, [ 5, 5 ] ]), i = [ 1, 3, 5 ], e.identical(n, i), 
          e.close("single argument"), a = [], n = r.arrayFlattenedOnce(a, 1), e.identical(a, [ 1 ]), 
          e.identical(n, 1), a = [ 1, 1, 3, 3, [ 5, 5 ] ], n = r.arrayFlattenedOnce(a, 6), 
          i = 1, e.identical(a, [ 1, 1, 3, 3, [ 5, 5 ], 6 ]), e.identical(n, i), e.case = "not enough arguments", 
          e.shouldThrowErrorSync(function() {
            r.arrayFlattenedOnce();
          }), e.case = "first is not longIs", e.shouldThrowErrorSync(function() {
            r.arrayFlattenedOnce(1, [ 1 ]);
          }), 
          /*
test.case = 'Too many args';
test.shouldThrowErrorSync( function()
{
  _.arrayFlattenedOnce( [ 1 ], 2, 3  );
});
*/
          e.case = "onEqualize is not a routine", e.shouldThrowErrorSync(function() {
            r.arrayFlattenedOnce([], [ 1 ], []);
          });
        }
        //
        ,
        arrayFlattenedOnceStrictly: function arrayFlattenedOnceStrictly(e) {
          e.case = "make array flat, dst is empty";
          var a = [], n = r.arrayFlattenedOnceStrictly(a, []);
          e.identical(a, []), e.identical(n, 0), a = [], n = r.arrayFlattenedOnceStrictly(a, [ 1, 2, 3 ]), 
          e.identical(a, [ 1, 2, 3 ]), e.identical(n, 3), a = [], n = r.arrayFlattenedOnceStrictly(a, [ [ 1 ], [ 2 ], 3 ]), 
          e.identical(a, [ 1, 2, 3 ]), e.identical(n, 3), a = [], n = r.arrayFlattenedOnceStrictly(a, [ [ 1, [ 2, [ 3, 4 ] ] ] ]), 
          e.identical(a, [ 1, 2, 3, 4 ]), e.identical(n, 4), a = [], n = r.arrayFlattenedOnceStrictly(a, [ [ [ [ [ 1 ] ] ] ] ]), 
          e.identical(a, [ 1 ]), e.identical(n, 1), e.case = "make array flat, dst is not empty", 
          a = [ 1, 2, 3, 4 ], n = r.arrayFlattenedOnceStrictly(a, []), e.identical(a, [ 1, 2, 3, 4 ]), 
          e.identical(n, 0), a = [ 1, 2, 3 ], n = r.arrayFlattenedOnceStrictly(a, [ [ [ 4 ] ] ]), 
          e.identical(a, [ 1, 2, 3, 4 ]), e.identical(n, 1), a = [ 1, 2, 3 ], n = r.arrayFlattenedOnceStrictly(a, [ [ 4 ], [ 5 ], [ 6 ], [ 7 ] ]), 
          e.identical(a, [ 1, 2, 3, 4, 5, 6, 7 ]), e.identical(n, 4), a = [ 1, 2, 3 ], n = r.arrayFlattenedOnceStrictly(a, [ [ 0, [ -1, [ -2 ] ] ], -3 ]), 
          e.identical(a, [ 1, 2, 3, 0, -1, -2, -3 ]), e.identical(n, 4), a = [ 1 ], n = r.arrayFlattenedOnceStrictly(a, [ [ [ [ [ 2 ] ] ] ] ]), 
          e.identical(a, [ 1, 2 ]), e.identical(n, 1), e.case = "dst contains some inner arrays", 
          a = [ [ 1 ], [ 2 ], [ 3 ] ], n = r.arrayFlattenedOnceStrictly(a, [ [ 1 ], [ 2 ], [ 3 ] ]), 
          e.identical(a, [ [ 1 ], [ 2 ], [ 3 ], 1, 2, 3 ]), e.identical(n, 3), a = [ [ 1 ], [ 2 ], [ 3 ] ], 
          n = r.arrayFlattenedOnceStrictly(a, [ 4, 5, 6 ]), e.identical(a, [ [ 1 ], [ 2 ], [ 3 ], 4, 5, 6 ]), 
          e.identical(n, 3), e.case = "make array flat from multiple arrays as one arg", a = [ -1, 0 ], 
          n = r.arrayFlattenedOnceStrictly(a, [ [ 1 ], [ [ 2 ] ], [ 3, [ [ [ 4 ] ] ] ] ]), 
          e.identical(a, [ -1, 0, 1, 2, 3, 4 ]), e.identical(n, 4), e.case = "onEqualize", 
          a = [ 1, 2, 3, 4 ], n = r.arrayFlattenedOnceStrictly(a, [ 5, 6, 7, 8 ], function(r, e) {
            return r === e;
          }), e.identical(a, [ 1, 2, 3, 4, 5, 6, 7, 8 ]), e.identical(n, 4), e.case = "Second arg is not long", 
          a = [ 1, 3, [ 5 ] ], n = r.arrayFlattenedOnceStrictly(a, 5);
          var i = [ 1, 3, [ 5 ], 5 ];
          e.identical(a, i), e.identical(n, 1), a = [ 1, 3, [ 5 ] ], n = r.arrayFlattenedOnceStrictly(a, 6), 
          i = [ 1, 3, [ 5 ], 6 ], e.identical(a, i), e.identical(n, 1), 
          //
          e.open("single argument"), n = r.arrayFlattenedOnceStrictly([ 0, 1, 2, 3 ]), i = [ 0, 1, 2, 3 ], 
          e.identical(n, i), n = r.arrayFlattenedOnceStrictly([ 0, [ 1 ] ]), i = [ 0, 1 ], 
          e.identical(n, i), n = r.arrayFlattenedOnceStrictly([ [ 0 ], [ 1 ] ]), i = [ 0, 1 ], 
          e.identical(n, i), n = r.arrayFlattenedOnceStrictly([ [ 0 ], 1, 2, [ 3, 4 ] ]), 
          i = [ 0, 1, 2, 3, 4 ], e.identical(n, i), n = r.arrayFlattenedOnceStrictly([ 0, [ [ 1 ], 2 ], 3, 4 ]), 
          i = [ 0, 2, 1, 3, 4 ], e.identical(n, i), n = r.arrayFlattenedOnceStrictly([ 1, 3, [ 5, 7 ] ]), 
          i = [ 1, 3, 5, 7 ], e.identical(n, i), e.close("single argument"), e.case = "Second arg is not long", 
          a = [], n = r.arrayFlattenedOnceStrictly(a, 2), e.identical(a, [ 2 ]), e.identical(n, 1), 
          e.case = "not enough arguments", e.shouldThrowErrorSync(function() {
            r.arrayFlattenedOnceStrictly();
          }), e.case = "first is not longIs", e.shouldThrowErrorSync(function() {
            r.arrayFlattenedOnceStrictly(1, [ 1 ]);
          }), e.case = "onEqualize is not a routine", e.shouldThrowErrorSync(function() {
            r.arrayFlattenedOnceStrictly([], [ 1 ], []);
          }), e.case = "Elements must not be repeated", e.shouldThrowErrorSync(function() {
            r.arrayFlattenedOnceStrictly([], [ 1, 1, 2, 2, 3, 3 ]);
          }), e.shouldThrowErrorSync(function() {
            r.arrayFlattenedOnceStrictly([], [ [ 1 ], [ 1 ], [ 2 ], [ 2 ], [ 3 ], [ 3 ] ]);
          }), e.shouldThrowErrorSync(function() {
            r.arrayFlattenedOnceStrictly([], [ [ 1, 1, [ 2, 2, [ 3, 3 ] ] ] ]);
          }), e.shouldThrowErrorSync(function() {
            r.arrayFlattenedOnceStrictly([], [ [ [ [ [ 1, 1, 1 ] ] ] ] ]);
          }), e.shouldThrowErrorSync(function() {
            r.arrayFlattenedOnceStrictly([ 0, 1, 2, 3 ], [ [ 4, [ 5, [ 6 ] ] ], 2 ]);
          }), e.shouldThrowErrorSync(function() {
            r.arrayFlattenedOnceStrictly([ 0 ], 0);
          }), e.shouldThrowErrorSync(function() {
            r.arrayFlattenedOnceStrictly([ 0, 1, 2, 3 ], [ [ 4, [ 5, [ 0 ] ] ], 7 ]);
          }), e.shouldThrowErrorSync(function() {
            r.arrayFlattenedOnceStrictly([ 0, 0 ]);
          }), e.shouldThrowErrorSync(function() {
            r.arrayFlattenedOnceStrictly([ 0, 0, 1, 1 ]);
          }), e.shouldThrowErrorSync(function() {
            r.arrayFlattenedOnceStrictly([ 0, 0 ], 1);
          }), e.shouldThrowErrorSync(function() {
            r.arrayFlattenedOnceStrictly([ 0, 0, 1, 1 ], 2);
          }), e.shouldThrowErrorSync(function() {
            r.arrayFlattenedOnceStrictly([ 0, 0 ], [ 1, 2 ]);
          }), e.shouldThrowErrorSync(function() {
            r.arrayFlattenedOnceStrictly([ 0, 0, 1, 1 ], [ 3, 4, [ 5, [ 6 ] ] ]);
          });
        }
        //
        ,
        arrayFlatten2: function arrayFlatten2(e) {
          e.case = "array of the passed arguments";
          var a = r.arrayFlatten([], [ "str", {}, [ 1, 2 ], 5, !0 ]), n = [ "str", {}, 1, 2, 5, !0 ];
          e.identical(a, n), e.case = "without undefined", a = r.arrayFlatten([ 1, 2, 3 ], [ 13, "abc", null ]), 
          n = [ 1, 2, 3, 13, "abc", null ], e.identical(a, n), e.case = "Args are not long", 
          a = r.arrayFlatten([ 1, 2 ], 13, "abc", {}), n = [ 1, 2, 13, "abc", {} ], e.identical(a, n), 
          e.case = "bad arguments", e.shouldThrowErrorSync(() => r.arrayFlatten([ 1, 2, 3 ], [ 13, "abc", void 0, null ]));
        },
        arrayFlattenDefined: function arrayFlattenDefined(e) {
          e.case = "make array flat, dst is empty";
          var a = r.arrayFlattenDefined([], []);
          e.identical(a, []), a = r.arrayFlattenDefined([], [ 1, 2, 3 ]), e.identical(a, [ 1, 2, 3 ]), 
          a = r.arrayFlattenDefined([], [ [ 1 ], [ 2 ], [ 3 ] ]), e.identical(a, [ 1, 2, 3 ]), 
          a = r.arrayFlattenDefined([], [ [ 1, [ 2, [ 3 ] ] ] ]), e.identical(a, [ 1, 2, 3 ]), 
          a = r.arrayFlattenDefined([], [ [ [ [ [ 1 ] ] ] ] ]), e.identical(a, [ 1 ]), a = r.arrayFlattenDefined([], 1, 2, "3"), 
          e.identical(a, [ 1, 2, "3" ]), e.case = "make array flat, dst is not empty", a = r.arrayFlattenDefined([ 1, 2, 3 ], [ 4 ]), 
          e.identical(a, [ 1, 2, 3, 4 ]), a = r.arrayFlattenDefined([ 1, 2, 3 ], [ 1, 2, 3 ]), 
          e.identical(a, [ 1, 2, 3, 1, 2, 3 ]), a = r.arrayFlattenDefined([ 1, 2, 3 ], [ [ 1 ], [ 2 ], [ 3 ] ]), 
          e.identical(a, [ 1, 2, 3, 1, 2, 3 ]), a = r.arrayFlattenDefined([ 1, 2, 3 ], [ [ 1, [ 2, [ 3 ] ] ] ]), 
          e.identical(a, [ 1, 2, 3, 1, 2, 3 ]), a = r.arrayFlattenDefined([ 1 ], [ [ [ [ [ 1 ] ] ] ] ]), 
          e.identical(a, [ 1, 1 ]), a = r.arrayFlattenDefined([], 1), e.identical(a, [ 1 ]), 
          e.case = "make array flat from multiple arrays as one arg", a = r.arrayFlattenDefined([], [ [ 1 ], [ [ 2 ] ], [ 3, [ [ [ 4 ] ] ] ] ]), 
          e.identical(a, [ 1, 2, 3, 4 ]), e.case = "make array flat from different inputs -  null dstArray", 
          a = r.arrayFlattenDefined(null, "str", {}, [ 1, 2 ], 5, !0), e.identical(a, [ "str", {}, 1, 2, 5, !0 ]), 
          a = r.arrayFlattenDefined([ 1, 1, 3, 3, [ 5, 5 ] ], 5), e.identical(a, [ 1, 1, 3, 3, [ 5, 5 ], 5 ]), 
          a = r.arrayFlattenDefined(null, [ 1, 1, 3, 3, [ 5, 5 ] ]), e.identical(a, [ 1, 1, 3, 3, 5, 5 ]), 
          a = r.arrayFlattenDefined([ [ 0 ], [ [ -1, -2 ] ] ], [ 1, 1, 3, 3, [ 5, 5 ] ]), 
          e.identical(a, [ [ 0 ], [ [ -1, -2 ] ], 1, 1, 3, 3, 5, 5 ]), 
          //
          e.case = "single argument", a = r.arrayFlattenDefined([ 0, 1, 2, 3 ]), e.identical(a, [ 0, 1, 2, 3 ]), 
          a = r.arrayFlattenDefined([ [ 0, 0 ], [ 1, 1 ] ]), e.identical(a, [ 0, 0, 1, 1 ]), 
          a = r.arrayFlattenDefined([ [ 0 ], 0, 1, [ 0, 1 ] ]), e.identical(a, [ 0, 0, 1, 0, 1 ]), 
          a = r.arrayFlattenDefined([ [ [ 0 ] ] ]), e.identical(a, [ 0 ]), a = r.arrayFlattenDefined([ 1, 1, 3, 3, [ 5, 5 ] ]), 
          e.identical(a, [ 1, 1, 3, 3, 5, 5 ]), e.case = "Empty", e.shouldThrowErrorSync(function() {
            r.arrayFlattenDefined();
          }), e.case = "dstArray is not array", e.shouldThrowErrorSync(function() {
            r.arrayFlattenDefined(1, [ 1 ]);
          }), e.case = "insArray is undefined", e.shouldThrowErrorSync(function() {
            r.arrayFlattenDefined([ 1 ], void 0);
          });
        }
        //
        ,
        arrayFlattenDefinedOnce: function arrayFlattenDefinedOnce(e) {
          e.case = "make array flat, dst is empty";
          var a = r.arrayFlattenDefinedOnce([], []);
          e.identical(a, []), a = r.arrayFlattenDefinedOnce([], [ 1, 1, 2, 2, 3, 3, 3 ]), 
          e.identical(a, [ 1, 2, 3 ]), a = r.arrayFlattenDefinedOnce([], [ [ 1 ], [ 1 ], [ 2 ], [ 2 ], [ 3 ], [ 3 ] ]), 
          e.identical(a, [ 1, 2, 3 ]), a = r.arrayFlattenDefinedOnce([], [ [ 1, 1, [ 2, 2, 2, [ 3, 3 ] ] ] ]), 
          e.identical(a, [ 1, 2, 3 ]), a = r.arrayFlattenDefinedOnce([], [ [ [ [ [ 1, 1, 1 ] ] ] ] ]), 
          e.identical(a, [ 1 ]), e.case = "make array flat, dst is not empty", a = r.arrayFlattenDefinedOnce([ 1, 2, 3, 4 ], [ 4, 2 ]), 
          e.identical(a, [ 1, 2, 3, 4 ]), a = r.arrayFlattenDefinedOnce([ 1, 2, 3 ], [ 1, 2, 3, [ [ 4 ] ] ]), 
          e.identical(a, [ 1, 2, 3, 4 ]), a = r.arrayFlattenDefinedOnce([ "a", 2, 3 ], [ [ 1 ], [ 4 ], [ "a" ], [ 4 ] ]), 
          e.identical(a, [ "a", 2, 3, 1, 4 ]), a = r.arrayFlattenDefinedOnce([ 1, 2, 3 ], [ [ 1, [ 2, [ 3 ] ] ], 4 ]), 
          e.identical(a, [ 1, 2, 3, 4 ]), a = r.arrayFlattenDefinedOnce([ 1 ], [ [ [ [ [ 1, 1, 1 ] ] ] ] ]), 
          e.identical(a, [ 1 ]), e.case = "make array flat from multiple arrays as one arg", 
          a = r.arrayFlattenDefinedOnce([ 1, 4 ], [ [ 1 ], [ [ 2 ] ], [ 3, [ [ [ 4 ] ] ] ] ]), 
          e.identical(a, [ 1, 4, 2, 3 ]), 
          //
          e.case = "onEqualize", a = r.arrayFlattenDefinedOnce([ 1, 2, 3, 4 ], [ 1, 4, 2, 5 ], (r, e) => r === e), 
          e.identical(a, [ 1, 2, 3, 4, 5 ]), e.case = "onEvaluate - one evaluator", a = r.arrayFlattenDefinedOnce([ 1, 2, 3, 4 ], [ 1, 4, 2, 5 ], r => r), 
          e.identical(a, [ 1, 2, 3, 4, 5 ]), e.case = "onEvaluate - two evaluator", a = r.arrayFlattenDefinedOnce([ [ 1 ], [ 2 ], [ 3 ], [ 4 ] ], [ 1, 4, 2, 5 ], r => r[0], r => r), 
          e.identical(a, [ [ 1 ], [ 2 ], [ 3 ], [ 4 ], 5 ]), a = r.arrayFlattenDefinedOnce([ [ 1 ], 5, [ 2 ], [ 3 ], [ 4 ] ], [ 1, 4, 2, 5, [ 6 ] ], r => r[0], r => r), 
          e.identical(a, [ [ 1 ], 5, [ 2 ], [ 3 ], [ 4 ], 5, 6 ]), 
          //
          e.case = "single argument", a = r.arrayFlattenDefinedOnce([ 0, 1, 2, 3 ]), e.identical(a, [ 0, 1, 2, 3 ]), 
          a = r.arrayFlattenDefinedOnce([ 0, 1, 0, 1 ]), e.identical(a, [ 0, 1 ]), a = r.arrayFlattenDefinedOnce([ [ 0, 0 ], [ 1, 1 ] ]), 
          e.identical(a, [ 0, 1 ]), a = r.arrayFlattenDefinedOnce([ [ 0 ], 0, 1, [ 0, 1 ] ]), 
          e.identical(a, [ 0, 1 ]), a = r.arrayFlattenDefinedOnce([ 1, [ [ 0 ], 1 ], 1, 0 ]), 
          e.identical(a, [ 1, 0 ]), e.case = "not enough arguments", e.shouldThrowErrorSync(function() {
            r.arrayFlattenDefinedOnce();
          }), e.case = "too many arguments", e.shouldThrowErrorSync(function() {
            r.arrayFlattenDefinedOnce([], [ 1 ], r => r, r => r, r => r);
          }), e.case = "first is not longIs", e.shouldThrowErrorSync(function() {
            r.arrayFlattenDefinedOnce(1, [ 1 ]);
          }), e.case = "onEqualize is not a routine", e.shouldThrowErrorSync(function() {
            r.arrayFlattenDefinedOnce([], [ 1 ], []);
          });
        }
        //
        ,
        arrayFlattenDefinedOnceStrictly: function arrayFlattenDefinedOnceStrictly(e) {
          e.case = "make array flat, dst is empty";
          var a = r.arrayFlattenDefinedOnceStrictly([], []);
          e.identical(a, []), a = r.arrayFlattenDefinedOnceStrictly([], [ 1, 2, 3, 4 ]), e.identical(a, [ 1, 2, 3, 4 ]), 
          a = r.arrayFlattenDefinedOnceStrictly([], [ [ 1 ], [ 2 ], [ 3 ], [ 4 ] ]), e.identical(a, [ 1, 2, 3, 4 ]), 
          a = r.arrayFlattenDefinedOnceStrictly([], [ [ 1, [ 2, [ 3 ], 4 ] ] ]), e.identical(a, [ 1, 2, 3, 4 ]), 
          a = r.arrayFlattenDefinedOnceStrictly([], [ 1, [ 2, [ [ 3, [ 4 ] ] ] ] ]), e.identical(a, [ 1, 2, 3, 4 ]), 
          e.case = "make array flat, dst is not empty", a = r.arrayFlattenDefinedOnceStrictly([ 1, 2, 3, 4 ], [ 5 ]), 
          e.identical(a, [ 1, 2, 3, 4, 5 ]), a = r.arrayFlattenDefinedOnceStrictly([ 1, 2, 3 ], [ [ [ 4 ] ] ]), 
          e.identical(a, [ 1, 2, 3, 4 ]), a = r.arrayFlattenDefinedOnceStrictly([ 1 ], [ [ [ [ [ 0, 2, 3 ] ] ] ] ]), 
          e.identical(a, [ 1, 0, 2, 3 ]), e.case = "make array flat from multiple arrays as one arg", 
          a = r.arrayFlattenDefinedOnceStrictly([ 1, 4 ], [ [ [ 2 ] ], [ 3, [ [ [ 5 ] ] ] ] ]), 
          e.identical(a, [ 1, 4, 2, 3, 5 ]), 
          //
          e.case = "onEqualize", a = r.arrayFlattenDefinedOnceStrictly([ 1, 2, 3, 4 ], [ 5 ], function(r, e) {
            return r === e;
          }), e.identical(a, [ 1, 2, 3, 4, 5 ]), e.case = "onEvaluate - one evaluator", a = r.arrayFlattenDefinedOnceStrictly([ 1, 2, 3, 4 ], [ 5 ], r => r), 
          e.identical(a, [ 1, 2, 3, 4, 5 ]), e.case = "onEvaluate - two evaluators", a = r.arrayFlattenDefinedOnceStrictly([ 1, 2, 3, 4, 5 ], [ [ 5 ] ], r => r, r => r[0]), 
          e.identical(a, [ 1, 2, 3, 4, 5, 5 ]), 
          //
          e.case = "dstArray has sub arrays", a = r.arrayFlattenDefinedOnceStrictly([ 1, 3, [ 5 ] ], 6), 
          e.identical(a, [ 1, 3, [ 5 ], 6 ]), a = r.arrayFlattenDefinedOnceStrictly([ [ 1, [ 3, [ 5 ] ] ], 2 ], 6), 
          e.identical(a, [ [ 1, [ 3, [ 5 ] ] ], 2, 6 ]), e.case = "single argument", a = r.arrayFlattenDefinedOnceStrictly([ 0, [ 1 ] ]), 
          e.identical(a, [ 0, 1 ]), a = r.arrayFlattenDefinedOnceStrictly([ [ 0 ], [ 1 ] ]), 
          e.identical(a, [ 0, 1 ]), a = r.arrayFlattenDefinedOnceStrictly([ [ 0 ], 1, 2, [ 3, 4 ] ]), 
          e.identical(a, [ 0, 1, 2, 3, 4 ]), a = r.arrayFlattenDefinedOnceStrictly([ 0, [ [ 2 ], 1 ], 3, 4 ]), 
          e.identical(a, [ 0, 1, 2, 3, 4 ]), a = r.arrayFlattenDefinedOnceStrictly([ 1, 3, [ 7, 5 ] ]), 
          e.identical(a, [ 1, 3, 7, 5 ]), e.case = "not enough arguments", e.shouldThrowErrorSync(function() {
            r.arrayFlattenDefinedOnceStrictly();
          }), e.case = "too many arguments", e.shouldThrowErrorSync(function() {
            r.arrayFlattenDefinedOnceStrictly([], [ 1 ], r => r, r => r, r => r);
          }), e.case = "first is not longIs", e.shouldThrowErrorSync(function() {
            r.arrayFlattenDefinedOnceStrictly(1, [ 1 ]);
          }), e.case = "onEqualize is not a routine", e.shouldThrowErrorSync(function() {
            r.arrayFlattenDefinedOnceStrictly([], [ 1 ], []);
          }), e.case = "second evaluator is not a routine", e.shouldThrowErrorSync(function() {
            r.arrayFlattenDefinedOnceStrictly([], [ 1 ], r => r, []);
          }), e.case = "Elements must not be repeated", e.shouldThrowErrorSync(function() {
            r.arrayFlattenDefinedOnceStrictly([], [ 1, 1, 2, 2, 3, 3 ]);
          }), e.shouldThrowErrorSync(function() {
            r.arrayFlattenDefinedOnceStrictly([], [ [ 1 ], [ 1 ], [ 2 ], [ 2 ], [ 3 ], [ 3 ] ]);
          }), e.shouldThrowErrorSync(function() {
            r.arrayFlattenDefinedOnceStrictly([], [ [ 1, 1, [ 2, 2, [ 3, 3 ] ] ] ]);
          }), e.shouldThrowErrorSync(function() {
            r.arrayFlattenDefinedOnceStrictly([], [ [ [ [ [ 1, 1 ] ] ] ] ]);
          }), e.shouldThrowErrorSync(function() {
            r.arrayFlattenDefinedOnceStrictly([ 0, 1, 7, 6 ], [ [ 4, [ 5, [ 6 ] ] ], 2 ]);
          }), e.shouldThrowErrorSync(function() {
            r.arrayFlattenDefinedOnceStrictly([ 0 ], 0);
          }), e.shouldThrowErrorSync(function() {
            r.arrayFlattenDefinedOnceStrictly([ 0, 1, 2, 3 ], [ [ 4, [ 5, [ 0 ] ] ], 7 ]);
          }), e.shouldThrowErrorSync(function() {
            r.arrayFlattenDefinedOnceStrictly([ 0, 0, 1, 1 ], [ 3, 4, [ 5, [ 6 ] ] ]);
          });
        }
        //
        ,
        arrayFlattenedDefined: function arrayFlattenedDefined(e) {
          e.case = "make array flat, dst is empty";
          var a = r.arrayFlattenedDefined([], []);
          e.identical(a, 0), a = r.arrayFlattenedDefined([], [ 1, 2, 3 ]), e.identical(a, 3), 
          a = r.arrayFlattenedDefined([], [ [ 1 ], [ 2 ], [ 3 ] ]), e.identical(a, 3), a = r.arrayFlattenedDefined([], [ [ 1, [ 2, [ 3 ] ] ] ]), 
          e.identical(a, 3), a = r.arrayFlattenedDefined([], [ [ [ [ [ 1 ] ] ] ] ]), e.identical(a, 1), 
          a = r.arrayFlattenedDefined([], 1, 2, "3"), e.identical(a, 3), e.case = "make array flat, dst is not empty", 
          a = r.arrayFlattenedDefined([ 1, 2, 3 ], [ 4 ]), e.identical(a, 1), a = r.arrayFlattenedDefined([ 1, 2, 3 ], [ 1, 2, 3 ]), 
          e.identical(a, 3), a = r.arrayFlattenedDefined([ 1, 2, 3 ], [ [ 1 ], [ 2 ], [ 3 ] ]), 
          e.identical(a, 3), a = r.arrayFlattenedDefined([ 1, 2, 3 ], [ [ 1, [ 2, [ 3 ] ] ] ]), 
          e.identical(a, 3), a = r.arrayFlattenedDefined([ 1 ], [ [ [ [ [ 1 ] ] ] ] ]), e.identical(a, 1), 
          a = r.arrayFlattenedDefined([], 1), e.identical(a, 1), e.case = "make array flat from multiple arrays as one arg", 
          a = r.arrayFlattenedDefined([], [ [ 1 ], [ [ 2 ] ], [ 3, [ [ [ 4 ] ] ] ] ]), e.identical(a, 4), 
          e.case = "make array flat from different inputs", a = r.arrayFlattenedDefined([ 1, 1, 3, 3, [ 5, 5 ] ], 5), 
          e.identical(a, 1), a = r.arrayFlattenedDefined([ [ 0 ], [ [ -1, -2 ] ] ], [ 1, 1, 3, 3, [ 5, 5 ] ]), 
          e.identical(a, 6), 
          //
          e.case = "single argument", a = r.arrayFlattenedDefined([ 0, 1, 2, 3 ]), e.identical(a, [ 0, 1, 2, 3 ]), 
          a = r.arrayFlattenedDefined([ [ 0, 0 ], [ 1, 1 ] ]), e.identical(a, [ 0, 0, 1, 1 ]), 
          a = r.arrayFlattenedDefined([ [ 0 ], 0, 1, [ 0, 1 ] ]), e.identical(a, [ 0, 0, 1, 0, 1 ]), 
          a = r.arrayFlattenedDefined([ [ [ 0 ] ] ]), e.identical(a, [ 0 ]), a = r.arrayFlattenedDefined([ 1, 1, 3, 3, [ 5, 5 ] ]), 
          e.identical(a, [ 1, 1, 3, 3, 5, 5 ]), e.case = "Empty", e.shouldThrowErrorSync(function() {
            r.arrayFlattenedDefined();
          }), e.case = "dstArray is not array", e.shouldThrowErrorSync(function() {
            r.arrayFlattenedDefined(1, [ 1 ]);
          }), e.case = "insArray is undefined", e.shouldThrowErrorSync(function() {
            r.arrayFlattenedDefined([ 1 ], void 0);
          });
        }
        //
        ,
        arrayFlattenedDefinedOnce: function arrayFlattenedDefinedOnce(e) {
          e.case = "make array flat, dst is empty or null";
          var a = r.arrayFlattenedDefinedOnce([], []);
          e.identical(a, 0), a = r.arrayFlattenedDefinedOnce([], [ 1, 1, 2, 2, 3, 3, 3 ]), 
          e.identical(a, 3), a = r.arrayFlattenedDefinedOnce([], [ [ 1 ], [ 1 ], [ 2 ], [ 2 ], [ 3 ], [ 3 ] ]), 
          e.identical(a, 3), a = r.arrayFlattenedDefinedOnce([], [ [ 1, 1, [ 2, 2, 2, [ 3, 3 ] ] ] ]), 
          e.identical(a, 3), a = r.arrayFlattenedDefinedOnce([], [ [ [ [ [ 1, 1, 1 ] ] ] ] ]), 
          e.identical(a, 1), e.case = "make array flat, dst is not empty", a = r.arrayFlattenedDefinedOnce([ 1, 2, 3, 4 ], [ 4, 2 ]), 
          e.identical(a, 0), a = r.arrayFlattenedDefinedOnce([ 1, 2, 3 ], [ 1, 2, 3, [ [ 4 ] ] ]), 
          e.identical(a, 1), a = r.arrayFlattenedDefinedOnce([ "a", 2, 3 ], [ [ 1 ], [ 4 ], [ "a" ], [ 4 ] ]), 
          e.identical(a, 2), a = r.arrayFlattenedDefinedOnce([ 1, 2, 3 ], [ [ 1, [ 2, [ 3 ] ] ], 4 ]), 
          e.identical(a, 1), a = r.arrayFlattenedDefinedOnce([ 1 ], [ [ [ [ [ 1, 1, 1 ] ] ] ] ]), 
          e.identical(a, 0), e.case = "make array flat from multiple arrays as one arg", a = r.arrayFlattenedDefinedOnce([ 1, 4 ], [ [ 1 ], [ [ 2 ] ], [ 3, [ [ [ 4 ] ] ] ] ]), 
          e.identical(a, 2), 
          //
          e.case = "onEqualize", a = r.arrayFlattenedDefinedOnce([ 1, 2, 3, 4 ], [ 1, 4, 2, 5 ], (r, e) => r === e), 
          e.identical(a, 1), e.case = "onEvaluate - one evaluator", a = r.arrayFlattenedDefinedOnce([ 1, 2, 3, 4 ], [ 1, 4, 2, 5 ], r => r), 
          e.identical(a, 1), e.case = "onEvaluate - two evaluator", a = r.arrayFlattenedDefinedOnce([ [ 1 ], [ 2 ], [ 3 ], [ 4 ] ], [ 1, 4, 2, 5 ], r => r[0], r => r), 
          e.identical(a, 1), a = r.arrayFlattenedDefinedOnce([ [ 1 ], 5, [ 2 ], [ 3 ], [ 4 ] ], [ 1, 4, 2, 5, [ 6 ] ], r => r[0], r => r), 
          e.identical(a, 2), 
          //
          e.case = "single argument", a = r.arrayFlattenedDefinedOnce([ 0, 1, 2, 3 ]), e.identical(a, [ 0, 1, 2, 3 ]), 
          a = r.arrayFlattenedDefinedOnce([ 0, 1, 0, 1 ]), e.identical(a, [ 0, 1 ]), a = r.arrayFlattenedDefinedOnce([ [ 0, 0 ], [ 1, 1 ] ]), 
          e.identical(a, [ 0, 1 ]), a = r.arrayFlattenedDefinedOnce([ [ 0 ], 0, 1, [ 0, 1 ] ]), 
          e.identical(a, [ 0, 1 ]), a = r.arrayFlattenedDefinedOnce([ 1, [ [ 0 ], 1 ], 1, 0 ]), 
          e.identical(a, [ 1, 0 ]), e.case = "not enough arguments", e.shouldThrowErrorSync(function() {
            r.arrayFlattenedDefinedOnce();
          }), e.case = "too many arguments", e.shouldThrowErrorSync(function() {
            r.arrayFlattenedDefinedOnce([], [ 1 ], r => r, r => r, r => r);
          }), e.case = "first is not longIs", e.shouldThrowErrorSync(function() {
            r.arrayFlattenedDefinedOnce(1, [ 1 ]);
          }), e.case = "onEqualize is not a routine", e.shouldThrowErrorSync(function() {
            r.arrayFlattenedDefinedOnce([], [ 1 ], []);
          });
        }
        //
        ,
        arrayFlattenedDefinedOnceStrictly: function arrayFlattenedDefinedOnceStrictly(e) {
          e.case = "make array flat, dst is empty";
          var a = r.arrayFlattenedDefinedOnceStrictly([], []);
          e.identical(a, 0), a = r.arrayFlattenedDefinedOnceStrictly([], [ 1, 2, 3, 4 ]), 
          e.identical(a, 4), a = r.arrayFlattenedDefinedOnceStrictly([], [ [ 1 ], [ 2 ], [ 3 ], [ 4 ] ]), 
          e.identical(a, 4), a = r.arrayFlattenedDefinedOnceStrictly([], [ [ 1, [ 2, [ 3 ], 4 ] ] ]), 
          e.identical(a, 4), a = r.arrayFlattenedDefinedOnceStrictly([], [ 1, [ 2, [ [ 3, [ 4 ] ] ] ] ]), 
          e.identical(a, 4), e.case = "make array flat, dst is not empty", a = r.arrayFlattenedDefinedOnceStrictly([ 1, 2, 3, 4 ], [ 5 ]), 
          e.identical(a, 1), a = r.arrayFlattenedDefinedOnceStrictly([ 1, 2, 3 ], [ [ [ 4 ] ] ]), 
          e.identical(a, 1), a = r.arrayFlattenedDefinedOnceStrictly([ 1 ], [ [ [ [ [ 0, 2, 3 ] ] ] ] ]), 
          e.identical(a, 3), e.case = "make array flat from multiple arrays as one arg", a = r.arrayFlattenedDefinedOnceStrictly([ 1, 4 ], [ [ [ 2 ] ], [ 3, [ [ [ 5 ] ] ] ] ]), 
          e.identical(a, 3), 
          //
          e.case = "onEqualize", a = r.arrayFlattenedDefinedOnceStrictly([ 1, 2, 3, 4 ], [ 5 ], function(r, e) {
            return r === e;
          }), e.identical(a, 1), e.case = "onEvaluate - one evaluator", a = r.arrayFlattenedDefinedOnceStrictly([ 1, 2, 3, 4 ], [ 5 ], r => r), 
          e.identical(a, 1), e.case = "onEvaluate - two evaluators", a = r.arrayFlattenedDefinedOnceStrictly([ 1, 2, 3, 4, 5 ], [ [ 5 ] ], r => r, r => r[0]), 
          e.identical(a, 1), 
          //
          e.case = "dstArray has sub arrays", a = r.arrayFlattenedDefinedOnceStrictly([ 1, 3, [ 5 ] ], 6), 
          e.identical(a, 1), a = r.arrayFlattenedDefinedOnceStrictly([ [ 1, [ 3, [ 5 ] ] ], 2 ], 6), 
          e.identical(a, 1), e.case = "single argument", a = r.arrayFlattenedDefinedOnceStrictly([ 0, [ 1 ] ]), 
          e.identical(a, [ 0, 1 ]), a = r.arrayFlattenedDefinedOnceStrictly([ [ 0 ], [ 1 ] ]), 
          e.identical(a, [ 0, 1 ]), a = r.arrayFlattenedDefinedOnceStrictly([ [ 0 ], 1, 2, [ 3, 4 ] ]), 
          e.identical(a, [ 0, 1, 2, 3, 4 ]), a = r.arrayFlattenedDefinedOnceStrictly([ 0, [ [ 2 ], 1 ], 3, 4 ]), 
          e.identical(a, [ 0, 1, 2, 3, 4 ]), a = r.arrayFlattenedDefinedOnceStrictly([ 1, 3, [ 7, 5 ] ]), 
          e.identical(a, [ 1, 3, 7, 5 ]), e.case = "not enough arguments", e.shouldThrowErrorSync(function() {
            r.arrayFlattenedDefinedOnceStrictly();
          }), e.case = "too many arguments", e.shouldThrowErrorSync(function() {
            r.arrayFlattenedDefinedOnceStrictly([], [ 1 ], r => r, r => r, r => r);
          }), e.case = "first is not longIs", e.shouldThrowErrorSync(function() {
            r.arrayFlattenedDefinedOnceStrictly(1, [ 1 ]);
          }), e.case = "onEqualize is not a routine", e.shouldThrowErrorSync(function() {
            r.arrayFlattenedDefinedOnceStrictly([], [ 1 ], []);
          }), e.case = "second evaluator is not a routine", e.shouldThrowErrorSync(function() {
            r.arrayFlattenedDefinedOnceStrictly([], [ 1 ], r => r, []);
          }), e.case = "Elements must not be repeated", e.shouldThrowErrorSync(function() {
            r.arrayFlattenedDefinedOnceStrictly([], [ 1, 1, 2, 2, 3, 3 ]);
          }), e.shouldThrowErrorSync(function() {
            r.arrayFlattenedDefinedOnceStrictly([], [ [ 1 ], [ 1 ], [ 2 ], [ 2 ], [ 3 ], [ 3 ] ]);
          }), e.shouldThrowErrorSync(function() {
            r.arrayFlattenedDefinedOnceStrictly([], [ [ 1, 1, [ 2, 2, [ 3, 3 ] ] ] ]);
          }), e.shouldThrowErrorSync(function() {
            r.arrayFlattenedDefinedOnceStrictly([], [ [ [ [ [ 1, 1 ] ] ] ] ]);
          }), e.shouldThrowErrorSync(function() {
            r.arrayFlattenedDefinedOnceStrictly([ 0, 1, 7, 6 ], [ [ 4, [ 5, [ 6 ] ] ], 2 ]);
          }), e.shouldThrowErrorSync(function() {
            r.arrayFlattenedDefinedOnceStrictly([ 0 ], 0);
          }), e.shouldThrowErrorSync(function() {
            r.arrayFlattenedDefinedOnceStrictly([ 0, 1, 2, 3 ], [ [ 4, [ 5, [ 0 ] ] ], 7 ]);
          }), e.shouldThrowErrorSync(function() {
            r.arrayFlattenedDefinedOnceStrictly([ 0, 0, 1, 1 ], [ 3, 4, [ 5, [ 6 ] ] ]);
          });
        }
        //
        // array replace
        //
        ,
        // array replace
        arrayReplace: function arrayReplace(e) {
          e.case = "nothing";
          var a = [], n = r.arrayReplace(a, void 0, 0);
          e.identical(n, []), e.is(n === a), e.case = "nothing", a = [], n = r.arrayReplace(a, 0, 0);
          var i = [];
          e.identical(n, i), e.is(n === a), e.case = "second element", a = [ 1, void 0, 3, 4, 5 ], 
          n = r.arrayReplace(a, void 0, 2), i = [ 1, 2, 3, 4, 5 ], e.identical(n, i), e.is(n === a), 
          e.case = "third element", a = [ "Petre", "Mikle", "Oleg", "Dmitry" ], n = r.arrayReplace(a, "Dmitry", "Bob"), 
          i = [ "Petre", "Mikle", "Oleg", "Bob" ], e.identical(n, i), e.is(n === a), e.case = "Several elements", 
          a = [ !0, !0, !0, !0, !1, !1 ], n = r.arrayReplace(a, !1, !0), i = [ !0, !0, !0, !0, !0, !0 ], 
          e.identical(n, i), e.is(n === a), a = [ 1, 1, 1 ], n = r.arrayReplace(a, 1, 0), 
          e.identical(n, [ 0, 0, 0 ]), e.is(n === a), a = [ 1, 2, 1 ], n = r.arrayReplace(a, 1, 0), 
          e.identical(n, [ 0, 2, 0 ]), e.is(n === a), e.case = "No match", a = [ 1, 2, 3 ], 
          n = r.arrayReplace(a, 4, 0), e.identical(n, [ 1, 2, 3 ]), e.is(n === a), a = [ {
            value: 1
          }, {
            value: 1
          }, {
            value: 2
          } ], n = r.arrayReplace(a, 1, {
            value: 0
          }, function onEqualize(r, e) {
            return r.value === e;
          }), e.identical(n, [ {
            value: 0
          }, {
            value: 0
          }, {
            value: 2
          } ]), e.is(n === a), e.case = "no args", e.shouldThrowErrorSync(function() {
            r.arrayReplace();
          }), e.case = "first arg is not longIs", e.shouldThrowErrorSync(function() {
            r.arrayReplace(1, 1, 1);
          }), e.case = "fourth argument is not a routine", e.shouldThrowErrorSync(function() {
            r.arrayReplace(1, 1, 1, 1);
          });
        }
        //
        ,
        arrayReplaceOnce: function arrayReplaceOnce(e) {
          e.case = "nothing";
          var a = [], n = r.arrayReplaceOnce(a, 0, 0), i = [];
          e.identical(n, i), e.is(n === a), e.case = "second element", a = [ 1, void 0, 3, 4, 5 ], 
          n = r.arrayReplaceOnce(a, void 0, 2), i = [ 1, 2, 3, 4, 5 ], e.identical(n, i), 
          e.is(n === a), e.case = "third element", a = [ "Petre", "Mikle", "Oleg", "Dmitry" ], 
          n = r.arrayReplaceOnce(a, "Dmitry", "Bob"), i = [ "Petre", "Mikle", "Oleg", "Bob" ], 
          e.identical(n, i), e.is(n === a), e.case = "fourth element", a = [ !0, !0, !0, !0, !1, !1 ], 
          n = r.arrayReplaceOnce(a, !1, !0), i = [ !0, !0, !0, !0, !0, !1 ], e.is(n === a), 
          e.case = "element not exists", a = [ 1, 2, 3 ], n = r.arrayReplaceOnce(a, [ 1 ], [ 4 ]), 
          i = [ 1, 2, 3 ], e.identical(n, i), e.is(n === a), e.case = "replace just first match", 
          a = [ 0, 0, 0, 0, 0, 0 ], n = r.arrayReplaceOnce(a, 0, 1), i = [ 1, 0, 0, 0, 0, 0 ], 
          e.identical(n, i), e.is(n === a), e.case = "equalize", a = [ 1, 2, 3 ], n = r.arrayReplaceOnce(a, [ 1 ], [ 4 ], function onEqualize(r, e) {
            return r === e[0];
          }), i = [ [ 4 ], 2, 3 ], e.identical(n, i), e.is(n === a), e.case = "no arguments", 
          e.shouldThrowErrorSync(function() {
            r.arrayReplaceOnce();
          }), e.case = "not enough arguments", e.shouldThrowErrorSync(function() {
            r.arrayReplaceOnce([ 1, 2, void 0, 4, 5 ]);
          }), e.case = "fourth argument is not a routine", e.shouldThrowErrorSync(function() {
            r.arrayReplaceOnce([ 1, 2, void 0, 4, 5 ], void 0, 3, "argument");
          }), e.case = "arguments[0] is wrong", e.shouldThrowErrorSync(function() {
            r.arrayReplaceOnce("wrong argument", void 0, 3);
          });
        }
        //
        ,
        arrayReplaceOnceStrictly: function arrayReplaceOnceStrictly(e) {
          e.case = "repeated element";
          var a = [ 1, void 0, 3, 4, 5 ], n = r.arrayReplaceOnceStrictly(a, void 0, 2), i = [ 1, 2, 3, 4, 5 ];
          e.identical(n, i), e.is(n === a), e.case = "second element", a = [ 1, void 0, 3, 4, 5 ], 
          n = r.arrayReplaceOnceStrictly(a, void 0, 2), i = [ 1, 2, 3, 4, 5 ], e.identical(n, i), 
          e.is(n === a), e.case = "third element", a = [ "Petre", "Mikle", "Oleg", "Dmitry" ], 
          n = r.arrayReplaceOnceStrictly(a, "Dmitry", "Bob"), i = [ "Petre", "Mikle", "Oleg", "Bob" ], 
          e.identical(n, i), e.is(n === a), e.case = "fourth element", a = [ !0, !0, !0, !0, !1 ], 
          n = r.arrayReplaceOnceStrictly(a, !1, !0), i = [ !0, !0, !0, !0, !0 ], e.identical(n, i), 
          e.is(n === a), e.case = "equalize", a = [ 1, 2, 3 ], n = r.arrayReplaceOnceStrictly(a, [ 1 ], [ 4 ], function onEqualize(r, e) {
            return r === e[0];
          }), i = [ [ 4 ], 2, 3 ], e.identical(n, i), e.is(n === a), e.case = "no arguments", 
          e.shouldThrowErrorSync(function() {
            r.arrayReplaceOnceStrictly();
          }), e.case = "nothing", e.shouldThrowErrorSync(function() {
            r.arrayReplaceOnceStrictly([], 0, 0);
          }), e.case = "element doesn´t exist", e.shouldThrowErrorSync(function() {
            r.arrayReplaceOnceStrictly([ 1, 2, 3 ], [ 1 ], [ 4 ]);
          }), e.case = "element two times in dstArray", e.shouldThrowErrorSync(function() {
            r.arrayReplaceOnceStrictly([ 1, 2, 3, 1 ], [ 1 ], [ 4 ]);
          }), e.case = "element several times in dstArray", e.shouldThrowErrorSync(function() {
            r.arrayReplaceOnceStrictly([ 0, 0, 0, 0, 0, 0 ], 0, 1);
          }), e.case = "not enough arguments", e.shouldThrowErrorSync(function() {
            r.arrayReplaceOnceStrictly([ 1, 2, void 0, 4, 5 ]);
          }), e.case = "fourth argument is not a routine", e.shouldThrowErrorSync(function() {
            r.arrayReplaceOnceStrictly([ 1, 2, void 0, 4, 5 ], void 0, 3, "argument");
          }), e.case = "arguments[0] is wrong", e.shouldThrowErrorSync(function() {
            r.arrayReplaceOnceStrictly("wrong argument", void 0, 3);
          });
        }
        //
        ,
        arrayReplaced: function arrayReplaced(e) {
          e.case = "nothing";
          var a = [], n = r.arrayReplaced(a, void 0, 0);
          e.identical(a, []), e.identical(n, 0), e.case = "nothing", a = [], n = r.arrayReplaced(a, 0, 0), 
          e.identical(a, []), e.identical(n, 0), e.case = "second element", a = [ 1, void 0, 3, 4, 5 ], 
          n = r.arrayReplaced(a, void 0, 2);
          var i = [ 1, 2, 3, 4, 5 ];
          e.identical(a, i), e.identical(n, 1), e.case = "fourth element", a = [ "Petre", "Mikle", "Oleg", "Dmitry" ], 
          n = r.arrayReplaced(a, "Dmitry", "Bob"), i = [ "Petre", "Mikle", "Oleg", "Bob" ], 
          e.identical(a, i), e.identical(n, 1), e.case = "Several elements", a = [ !0, !0, !0, !0, !1, !1 ], 
          n = r.arrayReplaced(a, !1, !0), i = [ !0, !0, !0, !0, !0, !0 ], e.identical(a, i), 
          e.identical(n, 2), a = [ 1, 1, 1 ], n = r.arrayReplaced(a, 1, 0), e.identical(a, [ 0, 0, 0 ]), 
          e.identical(n, 3), a = [ 1, 2, 1 ], n = r.arrayReplaced(a, 1, 0), e.identical(a, [ 0, 2, 0 ]), 
          e.identical(n, 2), e.case = "No match", a = [ 1, 2, 3 ], n = r.arrayReplaced(a, 4, 0), 
          e.identical(a, [ 1, 2, 3 ]), e.identical(n, 0), a = [ {
            value: 1
          }, {
            value: 1
          }, {
            value: 2
          } ], n = r.arrayReplaced(a, 1, {
            value: 0
          }, function onEqualize(r, e) {
            return r.value === e;
          }), e.identical(a, [ {
            value: 0
          }, {
            value: 0
          }, {
            value: 2
          } ]), e.identical(n, 2), e.case = "no args", e.shouldThrowErrorSync(function() {
            r.arrayReplaced();
          }), e.case = "first arg is not longIs", e.shouldThrowErrorSync(function() {
            r.arrayReplaced(1, 1, 1);
          }), e.case = "fourth argument is not a routine", e.shouldThrowErrorSync(function() {
            r.arrayReplaced(1, 1, 1, 1);
          });
        }
        //
        ,
        arrayReplacedOnce: function arrayReplacedOnce(e) {
          e.case = "nothing";
          var a = [], n = r.arrayReplacedOnce(a, 0, 0);
          e.identical(a, []), e.identical(n, -1), e.case = "second element", a = [ 1, void 0, 3, 4, 5 ], 
          n = r.arrayReplacedOnce(a, void 0, 2);
          var i = [ 1, 2, 3, 4, 5 ];
          e.identical(a, i), e.identical(n, 1), e.case = "fourth element", a = [ "Petre", "Mikle", "Oleg", "Dmitry" ], 
          n = r.arrayReplacedOnce(a, "Dmitry", "Bob"), i = [ "Petre", "Mikle", "Oleg", "Bob" ], 
          e.identical(a, i), e.identical(n, 3), e.case = "fourth element", a = [ !0, !0, !0, !0, !1 ], 
          n = r.arrayReplacedOnce(a, !1, !0), i = [ !0, !0, !0, !0, !0 ], e.identical(a, i), 
          e.identical(n, 4), e.case = "first of several elements", a = [ !0, !0, !0, !0, !1 ], 
          n = r.arrayReplacedOnce(a, !0, !1), i = [ !1, !0, !0, !0, !1 ], e.identical(a, i), 
          e.identical(n, 0), e.case = "element not exists", a = [ 1, 2, 3 ], n = r.arrayReplacedOnce(a, [ 1 ], [ 4 ]), 
          i = [ 1, 2, 3 ], e.identical(a, i), e.identical(n, -1), e.case = "equalize", a = [ 1, 2, 3 ], 
          n = r.arrayReplacedOnce(a, [ 1 ], [ 4 ], function onEqualize(r, e) {
            return r === e[0];
          }), i = [ [ 4 ], 2, 3 ], e.identical(a, i), e.identical(n, 0), e.case = "no arguments", 
          e.shouldThrowErrorSync(function() {
            r.arrayReplacedOnce();
          }), e.case = "not enough arguments", e.shouldThrowErrorSync(function() {
            r.arrayReplacedOnce([ 1, 2, void 0, 4, 5 ]);
          }), e.case = "fourth argument is not a routine", e.shouldThrowErrorSync(function() {
            r.arrayReplacedOnce([ 1, 2, void 0, 4, 5 ], void 0, 3, "argument");
          }), e.case = "arguments[0] is wrong", e.shouldThrowErrorSync(function() {
            r.arrayReplacedOnce("wrong argument", void 0, 3);
          });
        }
        //
        ,
        arrayReplacedOnceStrictly: function arrayReplacedOnceStrictly(e) {
          e.case = "first element";
          var a = [ 1, 2, 3, 4, 5 ], n = r.arrayReplacedOnceStrictly(a, 1, 2), i = [ 2, 2, 3, 4, 5 ];
          e.identical(a, i), e.identical(n, 0), e.case = "second element", a = [ 1, void 0, 3, 4, 5 ], 
          n = r.arrayReplacedOnceStrictly(a, void 0, 2), i = [ 1, 2, 3, 4, 5 ], e.identical(a, i), 
          e.identical(n, 1), e.case = "third element", a = [ "Petre", "Mikle", "Oleg", "Dmitry" ], 
          n = r.arrayReplacedOnceStrictly(a, "Dmitry", "Bob"), i = [ "Petre", "Mikle", "Oleg", "Bob" ], 
          e.identical(a, i), e.identical(n, 3), e.case = "fourth element", a = [ !0, !0, !0, !0, !1 ], 
          n = r.arrayReplacedOnceStrictly(a, !1, !0), i = [ !0, !0, !0, !0, !0 ], e.identical(a, i), 
          e.identical(n, 4), e.case = "equalize", a = [ 1, 2, 3 ], n = r.arrayReplacedOnceStrictly(a, [ 1 ], [ 4 ], function onEqualize(r, e) {
            return r === e[0];
          }), i = [ [ 4 ], 2, 3 ], e.identical(a, i), e.identical(n, 0), e.case = "no arguments", 
          e.shouldThrowErrorSync(function() {
            r.arrayReplacedOnceStrictly();
          }), e.case = "nothing", e.shouldThrowErrorSync(function() {
            r.arrayReplacedOnceStrictly([], 0, 0);
          }), e.case = "element several times in dstArray", e.shouldThrowErrorSync(function() {
            r.arrayReplacedOnceStrictly([ 1, 2, 3, 1, 2, 3 ], 1, 4);
          }), e.case = "element doesn´t exist", e.shouldThrowErrorSync(function() {
            r.arrayReplacedOnceStrictly([ 1, 2, 3 ], [ 1 ], [ 4 ]);
          }), e.case = "not enough arguments", e.shouldThrowErrorSync(function() {
            r.arrayReplacedOnceStrictly([ 1, 2, void 0, 4, 5 ]);
          }), e.case = "fourth argument is not a routine", e.shouldThrowErrorSync(function() {
            r.arrayReplacedOnceStrictly([ 1, 2, void 0, 4, 5 ], void 0, 3, "argument");
          }), e.case = "arguments[0] is wrong", e.shouldThrowErrorSync(function() {
            r.arrayReplacedOnceStrictly("wrong argument", void 0, 3);
          });
        }
        //
        ,
        arrayReplaceElement: function arrayReplaceElement(e) {
          e.case = "nothing";
          var a = [], n = r.arrayReplaceElement(a, void 0, 0);
          e.identical(n, []), e.is(n === a), e.case = "nothing", a = [], n = r.arrayReplaceElement(a, 0, 0);
          var i = [];
          e.identical(n, i), e.is(n === a), e.case = "second element", a = [ 1, void 0, 3, 4, 5 ], 
          n = r.arrayReplaceElement(a, void 0, 2), i = [ 1, 2, 3, 4, 5 ], e.identical(n, i), 
          e.is(n === a), e.case = "third element", a = [ "Petre", "Mikle", "Oleg", "Dmitry" ], 
          n = r.arrayReplaceElement(a, "Dmitry", "Bob"), i = [ "Petre", "Mikle", "Oleg", "Bob" ], 
          e.identical(n, i), e.is(n === a), e.case = "Several elements", a = [ !0, !0, !0, !0, !1, !1 ], 
          n = r.arrayReplaceElement(a, !1, !0), i = [ !0, !0, !0, !0, !0, !0 ], e.identical(n, i), 
          e.is(n === a), a = [ 1, 1, 1 ], n = r.arrayReplaceElement(a, 1, 0), e.identical(n, [ 0, 0, 0 ]), 
          e.is(n === a), a = [ 1, 2, 1 ], n = r.arrayReplaceElement(a, 1, 0), e.identical(n, [ 0, 2, 0 ]), 
          e.is(n === a), e.case = "No match", a = [ 1, 2, 3 ], n = r.arrayReplaceElement(a, 4, 0), 
          e.identical(n, [ 1, 2, 3 ]), a = [ {
            value: 1
          }, {
            value: 1
          }, {
            value: 2
          } ], n = r.arrayReplaceElement(a, 1, {
            value: 0
          }, function onEqualize(r, e) {
            return r.value === e;
          }), e.identical(n, [ {
            value: 0
          }, {
            value: 0
          }, {
            value: 2
          } ]), e.is(n === a), e.case = "no args", e.shouldThrowErrorSync(function() {
            r.arrayReplaceElement();
          }), e.case = "first arg is not longIs", e.shouldThrowErrorSync(function() {
            r.arrayReplaceElement(1, 1, 1);
          }), e.case = "fourth argument is not a routine", e.shouldThrowErrorSync(function() {
            r.arrayReplaceElement(1, 1, 1, 1);
          });
        }
        //
        ,
        arrayReplaceElement2: function arrayReplaceElement2(e) {
          e.case = "replace all ins with sub";
          var a = [], n = r.arrayReplaceElement(a, void 0, 0);
          e.identical(n, []), a = [ 1, 1, 1 ], n = r.arrayReplaceElement(a, 1, 0), e.identical(n, [ 0, 0, 0 ]), 
          a = [ 1, 2, 1 ], n = r.arrayReplaceElement(a, 1, 0), e.identical(n, [ 0, 2, 0 ]), 
          a = [ 1, 2, 3 ], n = r.arrayReplaceElement(a, 4, 0), e.identical(n, [ 1, 2, 3 ]), 
          a = [ {
            value: 1
          }, {
            value: 1
          }, {
            value: 2
          } ], n = r.arrayReplaceElement(a, 1, {
            value: 0
          }, function onEqualize(r, e) {
            return r.value === e;
          }), e.identical(n, [ {
            value: 0
          }, {
            value: 0
          }, {
            value: 2
          } ]), e.case = "no args", e.shouldThrowErrorSync(function() {
            r.arrayReplaceElement();
          }), e.case = "first arg is not longIs", e.shouldThrowErrorSync(function() {
            r.arrayReplaceElement(1, 1, 1);
          }), e.case = "fourth argument is not a routine", e.shouldThrowErrorSync(function() {
            r.arrayReplaceElement(1, 1, 1, 1);
          });
        }
        //
        ,
        arrayReplaceElementOnce: function arrayReplaceElementOnce(e) {
          e.case = "nothing";
          var a = [], n = r.arrayReplaceElementOnce(a, 0, 0), i = [];
          e.identical(n, i), e.is(n === a), e.case = "second element", a = [ 1, void 0, 3, 4, 5 ], 
          n = r.arrayReplaceElementOnce(a, void 0, 2), i = [ 1, 2, 3, 4, 5 ], e.identical(n, i), 
          e.is(n === a), e.case = "third element", a = [ "Petre", "Mikle", "Oleg", "Dmitry" ], 
          n = r.arrayReplaceElementOnce(a, "Dmitry", "Bob"), i = [ "Petre", "Mikle", "Oleg", "Bob" ], 
          e.identical(n, i), e.is(n === a), e.case = "fourth element", a = [ !0, !0, !0, !0, !1, !1 ], 
          n = r.arrayReplaceElementOnce(a, !1, !0), i = [ !0, !0, !0, !0, !0, !1 ], e.identical(n, i), 
          e.is(n === a), e.case = "element not exists", a = [ 1, 2, 3 ], n = r.arrayReplaceElementOnce(a, [ 1 ], [ 4 ]), 
          i = [ 1, 2, 3 ], e.identical(n, i), e.is(n === a), e.case = "replace just first match", 
          a = [ 0, 0, 0, 0, 0, 0 ], n = r.arrayReplaceElementOnce(a, 0, 1), i = [ 1, 0, 0, 0, 0, 0 ], 
          e.identical(n, i), e.is(n === a), e.case = "equalize", a = [ 1, 2, 3 ], n = r.arrayReplaceElementOnce(a, [ 1 ], [ 4 ], function onEqualize(r, e) {
            return r === e[0];
          }), i = [ [ 4 ], 2, 3 ], e.identical(n, i), e.is(n === a), e.case = "no arguments", 
          e.shouldThrowErrorSync(function() {
            r.arrayReplaceElementOnce();
          }), e.case = "not enough arguments", e.shouldThrowErrorSync(function() {
            r.arrayReplaceElementOnce([ 1, 2, void 0, 4, 5 ]);
          }), e.case = "fourth argument is not a routine", e.shouldThrowErrorSync(function() {
            r.arrayReplaceElementOnce([ 1, 2, void 0, 4, 5 ], void 0, 3, "argument");
          }), e.case = "arguments[0] is wrong", e.shouldThrowErrorSync(function() {
            r.arrayReplaceElementOnce("wrong argument", void 0, 3);
          });
        }
        //
        ,
        arrayReplaceElementOnceStrictly: function arrayReplaceElementOnceStrictly(e) {
          e.case = "second element";
          var a = [ 1, 0, 3, 4, 5 ], n = r.arrayReplaceElementOnceStrictly(a, 0, 2), i = [ 1, 2, 3, 4, 5 ];
          e.identical(n, i), e.is(n === a), e.case = "third element", a = [ "Petre", "Mikle", "Oleg", "Dmitry" ], 
          n = r.arrayReplaceElementOnceStrictly(a, "Dmitry", "Bob"), i = [ "Petre", "Mikle", "Oleg", "Bob" ], 
          e.identical(n, i), e.is(n === a), e.case = "fourth element", a = [ !0, !0, !0, !0, !1 ], 
          n = r.arrayReplaceElementOnceStrictly(a, !1, !0), i = [ !0, !0, !0, !0, !0 ], e.identical(n, i), 
          e.is(n === a), e.case = "equalize", a = [ 1, 2, 3 ], n = r.arrayReplaceElementOnceStrictly(a, [ 1 ], [ 4 ], function onEqualize(r, e) {
            return r === e[0];
          }), i = [ [ 4 ], 2, 3 ], e.identical(n, i), e.is(n === a), e.case = "no arguments", 
          e.shouldThrowErrorSync(function() {
            r.arrayReplaceElementOnceStrictly();
          }), e.case = "nothing", e.shouldThrowErrorSync(function() {
            r.arrayReplaceElementOnceStrictly([], 0, 0);
          }), e.case = "element doesn´t exist", e.shouldThrowErrorSync(function() {
            r.arrayReplaceElementOnceStrictly([ 1, 2, 3 ], [ 1 ], [ 4 ]);
          }), e.case = "element two times in dstArray", e.shouldThrowErrorSync(function() {
            r.arrayReplaceElementOnceStrictly([ 1, 2, 3, 1 ], [ 1 ], [ 4 ]);
          }), e.case = "element several times in dstArray", e.shouldThrowErrorSync(function() {
            r.arrayReplaceElementOnceStrictly([ 0, 0, 0, 0, 0, 0 ], 0, 1);
          }), e.case = "not enough arguments", e.shouldThrowErrorSync(function() {
            r.arrayReplaceElementOnceStrictly([ 1, 2, void 0, 4, 5 ]);
          }), e.case = "fourth argument is not a routine", e.shouldThrowErrorSync(function() {
            r.arrayReplaceElementOnceStrictly([ 1, 2, void 0, 4, 5 ], void 0, 3, "argument");
          }), e.case = "arguments[0] is wrong", e.shouldThrowErrorSync(function() {
            r.arrayReplaceElementOnceStrictly("wrong argument", void 0, 3);
          });
        }
        //
        ,
        arrayReplacedElement: function arrayReplacedElement(e) {
          e.case = "nothing";
          var a = [], n = r.arrayReplacedElement(a, void 0, 0);
          e.identical(a, []), e.identical(n, 0), e.case = "nothing", a = [], n = r.arrayReplacedElement(a, 0, 0), 
          e.identical(a, []), e.identical(n, 0), e.case = "second element", a = [ 1, void 0, 3, 4, 5 ], 
          n = r.arrayReplacedElement(a, void 0, 2);
          var i = [ 1, 2, 3, 4, 5 ];
          e.identical(a, i), e.identical(n, 1), e.case = "fourth element", a = [ "Petre", "Mikle", "Oleg", "Dmitry" ], 
          n = r.arrayReplacedElement(a, "Dmitry", "Bob"), i = [ "Petre", "Mikle", "Oleg", "Bob" ], 
          e.identical(a, i), e.identical(n, 1), e.case = "Several elements", a = [ !0, !0, !0, !0, !1, !1 ], 
          n = r.arrayReplacedElement(a, !1, !0), i = [ !0, !0, !0, !0, !0, !0 ], e.identical(a, i), 
          e.identical(n, 2), a = [ 1, 1, 1 ], n = r.arrayReplacedElement(a, 1, 0), e.identical(a, [ 0, 0, 0 ]), 
          e.identical(n, 3), a = [ 1, 2, 1 ], n = r.arrayReplacedElement(a, 1, 0), e.identical(a, [ 0, 2, 0 ]), 
          e.identical(n, 2), e.case = "No match", a = [ 1, 2, 3 ], n = r.arrayReplacedElement(a, 4, 0), 
          e.identical(a, [ 1, 2, 3 ]), e.identical(n, 0), a = [ {
            value: 1
          }, {
            value: 1
          }, {
            value: 2
          } ], n = r.arrayReplacedElement(a, 1, {
            value: 0
          }, function onEqualize(r, e) {
            return r.value === e;
          }), e.identical(a, [ {
            value: 0
          }, {
            value: 0
          }, {
            value: 2
          } ]), e.identical(n, 2), e.case = "no args", e.shouldThrowErrorSync(function() {
            r.arrayReplacedElement();
          }), e.case = "first arg is not longIs", e.shouldThrowErrorSync(function() {
            r.arrayReplacedElement(1, 1, 1);
          }), e.case = "fourth argument is not a routine", e.shouldThrowErrorSync(function() {
            r.arrayReplacedElement(1, 1, 1, 1);
          });
        }
        //
        ,
        arrayReplacedElement2: function arrayReplacedElement2(e) {
          e.case = "replace all ins with sub";
          var a = [], n = r.arrayReplacedElement(a, void 0, 0);
          e.identical(n, 0), e.identical(a, []), a = [ 1, 1, 1 ], n = r.arrayReplacedElement(a, 1, 0), 
          e.identical(n, 3), e.identical(a, [ 0, 0, 0 ]), a = [ 1, 2, 1 ], n = r.arrayReplacedElement(a, 1, 0), 
          e.identical(n, 2), e.identical(a, [ 0, 2, 0 ]), a = [ 1, 2, 3 ], n = r.arrayReplacedElement(a, 4, 0), 
          e.identical(n, 0), e.identical(a, [ 1, 2, 3 ]), a = [ {
            value: 1
          }, {
            value: 1
          }, {
            value: 2
          } ], n = r.arrayReplacedElement(a, 1, {
            value: 0
          }, function onEqualize(r, e) {
            return r.value === e;
          }), e.identical(n, 2), e.identical(a, [ {
            value: 0
          }, {
            value: 0
          }, {
            value: 2
          } ]), e.case = "no args", e.shouldThrowErrorSync(function() {
            r.arrayReplacedElement();
          }), e.case = "first arg is not longIs";
          debugger;
          e.shouldThrowErrorSync(function() {
            debugger;
            r.arrayReplacedElement(1, 1, 1);
          });
          debugger;
          e.case = "fourth argument is not a routine", e.shouldThrowErrorSync(function() {
            r.arrayReplacedElement(1, 1, 1, 1);
          });
        }
        //
        ,
        arrayReplacedElementOnce: function arrayReplacedElementOnce(e) {
          e.case = "nothing";
          var a = [], n = r.arrayReplacedElementOnce(a, 0, 0);
          e.identical(a, []), e.identical(n, void 0), e.case = "second element", a = [ 1, void 0, 3, 4, 5 ], 
          n = r.arrayReplacedElementOnce(a, void 0, 2);
          var i = [ 1, 2, 3, 4, 5 ];
          e.identical(a, i), e.identical(n, void 0), e.case = "fourth element", a = [ "Petre", "Mikle", "Oleg", "Dmitry" ], 
          n = r.arrayReplacedElementOnce(a, "Dmitry", "Bob"), i = [ "Petre", "Mikle", "Oleg", "Bob" ], 
          e.identical(a, i), e.identical(n, "Dmitry"), e.case = "fourth element", a = [ !0, !0, !0, !0, !1 ], 
          n = r.arrayReplacedElementOnce(a, !1, !0), i = [ !0, !0, !0, !0, !0 ], e.identical(a, i), 
          e.identical(n, !1), e.case = "first of several elements", a = [ !0, !0, !0, !0, !1 ], 
          n = r.arrayReplacedElementOnce(a, !0, !1), i = [ !1, !0, !0, !0, !1 ], e.identical(a, i), 
          e.identical(n, !0), e.case = "element not exists", a = [ 1, 2, 3 ], n = r.arrayReplacedElementOnce(a, [ 1 ], [ 4 ]), 
          i = [ 1, 2, 3 ], e.identical(a, i), e.identical(n, void 0), e.case = "equalize", 
          a = [ 1, 2, 3 ], n = r.arrayReplacedElementOnce(a, [ 1 ], [ 4 ], function onEqualize(r, e) {
            return r === e[0];
          }), i = [ [ 4 ], 2, 3 ], e.identical(a, i), e.identical(n, [ 1 ]), e.case = "no arguments", 
          e.shouldThrowErrorSync(function() {
            r.arrayReplacedElementOnce();
          }), e.case = "not enough arguments", e.shouldThrowErrorSync(function() {
            r.arrayReplacedElementOnce([ 1, 2, void 0, 4, 5 ]);
          }), e.case = "fourth argument is not a routine", e.shouldThrowErrorSync(function() {
            r.arrayReplacedElementOnce([ 1, 2, void 0, 4, 5 ], void 0, 3, "argument");
          }), e.case = "arguments[0] is wrong", e.shouldThrowErrorSync(function() {
            r.arrayReplacedElementOnce("wrong argument", void 0, 3);
          });
        }
        //
        ,
        arrayReplacedElementOnceStrictly: function arrayReplacedElementOnceStrictly(e) {
          e.case = "first element";
          var a = [ 1, 2, 3, 4, 5 ], n = r.arrayReplacedElementOnceStrictly(a, 1, 2), i = [ 2, 2, 3, 4, 5 ];
          e.identical(a, i), e.identical(n, 1), e.case = "second element", a = [ 1, 0, 3, 4, 5 ], 
          n = r.arrayReplacedElementOnceStrictly(a, 0, 2), i = [ 1, 2, 3, 4, 5 ], e.identical(a, i), 
          e.identical(n, 0), e.case = "third element", a = [ "Petre", "Mikle", "Oleg", "Dmitry" ], 
          n = r.arrayReplacedElementOnceStrictly(a, "Dmitry", "Bob"), i = [ "Petre", "Mikle", "Oleg", "Bob" ], 
          e.identical(a, i), e.identical(n, "Dmitry"), e.case = "fourth element", a = [ !0, !0, !0, !0, !1 ], 
          n = r.arrayReplacedElementOnceStrictly(a, !1, !0), i = [ !0, !0, !0, !0, !0 ], e.identical(a, i), 
          e.identical(n, !1), e.case = "equalize", a = [ 1, 2, 3 ], n = r.arrayReplacedElementOnceStrictly(a, [ 1 ], [ 4 ], function onEqualize(r, e) {
            return r === e[0];
          }), i = [ [ 4 ], 2, 3 ], e.identical(a, i), e.identical(n, [ 1 ]), e.case = "no arguments", 
          e.shouldThrowErrorSync(function() {
            r.arrayReplacedElementOnceStrictly();
          }), e.case = "nothing", e.shouldThrowErrorSync(function() {
            r.arrayReplacedElementOnceStrictly([], 0, 0);
          }), e.case = "element several times in dstArray", e.shouldThrowErrorSync(function() {
            r.arrayReplacedElementOnceStrictly([ 1, 2, 3, 1, 2, 3 ], 1, 4);
          }), e.case = "element doesn´t exist", e.shouldThrowErrorSync(function() {
            r.arrayReplacedElementOnceStrictly([ 1, 2, 3 ], [ 1 ], [ 4 ]);
          }), e.case = "not enough arguments", e.shouldThrowErrorSync(function() {
            r.arrayReplacedElementOnceStrictly([ 1, 2, 3, 4, 5 ]);
          }), e.case = "fourth argument is not a routine", e.shouldThrowErrorSync(function() {
            r.arrayReplacedElementOnceStrictly([ 1, 2, 0, 4, 5 ], 0, 3, "argument");
          }), e.case = "arguments[0] is wrong", e.shouldThrowErrorSync(function() {
            r.arrayReplacedElementOnceStrictly("wrong argument", 0, 3);
          }), e.case = "second argument is undefined", e.shouldThrowErrorSync(function() {
            r.arrayReplacedElementOnceStrictly([ 1, 2, void 0, 4, 5 ], void 0, 3, "argument");
          });
        }
        //
        ,
        arrayReplaceArray: function arrayReplaceArray(e) {
          e.case = "dst, ins, sub are empty";
          var a = [], n = r.arrayReplaceArray(a, [], []);
          e.identical(n, []), e.is(n === a), e.case = "ins, sub are empty, dst is not", a = [ "a", "b", "c", "d" ], 
          n = r.arrayReplaceArray(a, [], []), e.identical(n, [ "a", "b", "c", "d" ]), e.is(n === a), 
          e.case = "other", a = [ 1, 2, 3 ], n = r.arrayReplaceArray(a, [ 1 ], [ 2 ]), e.identical(n, [ 2, 2, 3 ]), 
          e.is(n === a), a = [ 1, 2, 3 ], n = r.arrayReplaceArray(a, [ 1, 0, 4 ], [ 3, 5, 6 ]), 
          e.identical(n, [ 3, 2, 3 ]), e.is(n === a), a = [ 1, 2, 3, 1 ], n = r.arrayReplaceArray(a, [ 1, 0, 4 ], [ 3, 5, 6 ]), 
          e.identical(n, [ 3, 2, 3, 3 ]), e.is(n === a), a = [ 1, 2, 3, 4, 5, 4, 3, 2, 1 ], 
          n = r.arrayReplaceArray(a, [ 1, 0, 4 ], [ 3, 5, 6 ]), e.identical(n, [ 3, 2, 3, 6, 5, 6, 3, 2, 3 ]), 
          e.is(n === a), e.case = "ins has undefined", a = [ 1, 2, 3 ], n = r.arrayReplaceArray(a, [ void 0 ], [ 0 ]), 
          e.identical(n, [ 1, 2, 3 ]), e.is(n === a), e.case = "ins and dst have undefined", 
          a = [ 1, void 0, 3 ], n = r.arrayReplaceArray(a, [ void 0 ], [ 0 ]), e.identical(n, [ 1, 0, 3 ]), 
          e.is(n === a), e.case = "sub has undefined", a = [ 1, 2, 3 ], n = r.arrayReplaceArray(a, [ 1 ], [ void 0 ]), 
          e.identical(n, [ 2, 3 ]), e.is(n === a), e.case = "ins and sub have mirror elements", 
          a = [ 0, 0, 0, 1, 1, 1, 0, 1 ], n = r.arrayReplaceArray(a, [ 1, 0 ], [ 0, 1 ]), 
          e.identical(n, [ 1, 1, 1, 0, 0, 0, 1, 0 ]), e.is(n === a), a = [ "a", "b", "c", !1, "c", "b", "a", !0, 2 ], 
          n = r.arrayReplaceArray(a, [ "a", "b", "c", !1, !0 ], [ "c", "a", "b", !0, !1 ]), 
          e.identical(n, [ "c", "a", "b", !0, "b", "a", "c", !1, 2 ]), e.is(n === a), e.case = "onEqualize", 
          a = [ [ 1 ], [ 2 ], [ 3 ] ], n = r.arrayReplaceArray(a, [ [ 1 ] ], [ [ 0 ] ], function onEqualize(r, e) {
            return r[0] === e[0];
          }), e.identical(n, [ [ 0 ], [ 2 ], [ 3 ] ]), e.is(n === a), e.case = "no arguments", 
          e.shouldThrowErrorSync(function() {
            r.arrayReplaceArray();
          }), e.case = "sub is not a longIs", e.shouldThrowErrorSync(function() {
            r.arrayReplaceArray([ 1 ], [ 1 ], 1);
          }), e.case = "dstArray is not a longIs", e.shouldThrowErrorSync(function() {
            r.arrayReplaceArray(1, [ 1 ], [ 1 ]);
          }), e.case = "ins is not a longIs", e.shouldThrowErrorSync(function() {
            r.arrayReplaceArray([ 1, 2 ], 1, [ 1 ]);
          }), 
          // test.case = 'onEqualize is not a routine';
          // test.shouldThrowErrorSync( function()
          // {
          //   _.arrayReplaceArray( [ 1, 2 ], [ 1 ], [ 1 ], 1 );
          // });
          e.case = "not equal length of ins and sub", e.shouldThrowErrorSync(function() {
            r.arrayReplaceArray([ 1, 2, 3 ], [ 1, 2 ], [ 3 ]);
          });
        }
        //
        ,
        arrayReplaceArrayOnce: function arrayReplaceArrayOnce(e) {
          e.case = "dst, ins, sub are empty";
          var a = [], n = r.arrayReplaceArrayOnce(a, [], []);
          e.identical(n, []), e.is(n === a), e.case = "ins, sub are empty, dst is not", a = [ "a", "b", "c", "d" ], 
          n = r.arrayReplaceArrayOnce(a, [], []), e.identical(n, [ "a", "b", "c", "d" ]), 
          e.is(n === a), e.case = "other", a = [ 1, 2, 3 ], n = r.arrayReplaceArrayOnce(a, [ 1 ], [ 2 ]), 
          e.identical(n, [ 2, 2, 3 ]), e.is(n === a), a = [ 1, 2, 3 ], n = r.arrayReplaceArrayOnce(a, [ 1, 0, 4 ], [ 3, 5, 6 ]), 
          e.identical(n, [ 3, 2, 3 ]), e.is(n === a), a = [ 1, 2, 3, 1 ], n = r.arrayReplaceArrayOnce(a, [ 1, 0, 4 ], [ 3, 5, 6 ]), 
          e.identical(n, [ 3, 2, 3, 1 ]), e.is(n === a), e.case = "ins has undefined", a = [ 1, 2, 3 ], 
          n = r.arrayReplaceArrayOnce(a, [ void 0 ], [ 0 ]), e.identical(n, [ 1, 2, 3 ]), 
          e.is(n === a), e.case = "ins and dst has undefined", a = [ 1, void 0, 3 ], n = r.arrayReplaceArrayOnce(a, [ void 0 ], [ 0 ]), 
          e.identical(n, [ 1, 0, 3 ]), e.is(n === a), e.case = "sub has undefined", a = [ 1, 2, 3 ], 
          n = r.arrayReplaceArrayOnce(a, [ 1 ], [ void 0 ]), e.identical(n, [ 2, 3 ]), e.is(n === a), 
          e.case = "onEqualize", a = [ [ 1 ], [ 2 ], [ 3 ] ], n = r.arrayReplaceArrayOnce(a, [ [ 1 ] ], [ [ 0 ] ], function onEqualize(r, e) {
            return r[0] === e[0];
          }), e.identical(n, [ [ 0 ], [ 2 ], [ 3 ] ]), e.is(n === a), e.case = "ins and sub have mirror elements", 
          a = [ 0, 0, 0, 1, 1, 1, 0, 1 ], n = r.arrayReplaceArrayOnce(a, [ 1, 0 ], [ 0, 1 ]), 
          e.identical(n, [ 1, 0, 0, 0, 1, 1, 0, 1 ]), e.is(n === a), e.case = "no arguments", 
          e.shouldThrowErrorSync(function() {
            r.arrayReplaceArrayOnce();
          }), e.case = "sub is not a longIs", e.shouldThrowErrorSync(function() {
            r.arrayReplaceArrayOnce([ 1 ], [ 1 ], 1);
          }), e.case = "dstArray is not a longIs", e.shouldThrowErrorSync(function() {
            r.arrayReplaceArrayOnce(1, [ 1 ], [ 1 ]);
          }), e.case = "ins is not a longIs", e.shouldThrowErrorSync(function() {
            r.arrayReplaceArrayOnce([ 1, 2 ], 1, [ 1 ]);
          }), 
          // test.case = 'onEqualize is not a routine';
          // test.shouldThrowErrorSync( function()
          // {
          //   _.arrayReplaceArrayOnce( [ 1, 2 ], [ 1 ], [ 1 ], 1 );
          // });
          e.case = "not equal length of ins and sub", e.shouldThrowErrorSync(function() {
            r.arrayReplaceArrayOnce([ 1, 2, 3 ], [ 1, 2 ], [ 3 ]);
          });
        }
        //
        ,
        arrayReplaceArrayOnceStrictly: function arrayReplaceArrayOnceStrictly(e) {
          e.case = "trivial";
          var a = [ "a", "b", "c", "d" ], n = r.arrayReplaceArrayOnceStrictly(a, [ "a", "b", "c" ], [ "x", "y", void 0 ]);
          e.identical(n, [ "x", "y", "d" ]), e.is(n === a), e.case = "dst, ins, sub are empty", 
          a = [], n = r.arrayReplaceArrayOnceStrictly(a, [], []), e.identical(n, []), e.is(n === a), 
          e.case = "ins, sub are empty, dst is not", a = [ "a", "b", "c", "d" ], n = r.arrayReplaceArrayOnceStrictly(a, [], []), 
          e.identical(n, [ "a", "b", "c", "d" ]), e.is(n === a), e.case = "only sub is empty", 
          a = [ "a", "b", "c", "d" ], n = r.arrayReplaceArrayOnceStrictly(a, [ "a", "b", "c" ], [ void 0, void 0, void 0 ]), 
          e.identical(n, [ "d" ]), e.is(n === a), e.case = "other", a = [ 1, 2, 3 ], n = r.arrayReplaceArrayOnceStrictly(a, [ 1 ], [ 2 ]), 
          e.identical(n, [ 2, 2, 3 ]), e.is(n === a), a = [ 1, 2, 3 ], n = r.arrayReplaceArrayOnceStrictly(a, [ 1, 2 ], [ 3, void 0 ]), 
          e.identical(n, [ 3, 3 ]), e.is(n === a), e.case = "ins and dst has undefined", a = [ 1, void 0, 3 ], 
          n = r.arrayReplaceArrayOnceStrictly(a, [ void 0 ], [ 0 ]), e.identical(n, [ 1, 0, 3 ]), 
          e.is(n === a), e.case = "onEqualize", a = [ [ 1 ], [ 2 ], [ 3 ] ], n = r.arrayReplaceArrayOnceStrictly(a, [ [ 1 ] ], [ [ 0 ] ], function onEqualize(r, e) {
            return r[0] === e[0];
          }), e.identical(n, [ [ 0 ], [ 2 ], [ 3 ] ]), e.is(n === a), e.case = "no arguments", 
          e.shouldThrowErrorSync(function() {
            r.arrayReplaceArrayOnceStrictly();
          }), e.shouldThrowErrorSync(function() {
            r.arrayReplaceArrayOnceStrictly([ 1, 2, 3 ], [ void 0 ], 0);
          }), e.case = "only one replaced", e.shouldThrowErrorSync(function() {
            r.arrayReplaceArrayOnceStrictly([ 1, 2, 3 ], [ 1, 0, 4 ], 3);
          }), e.case = "sub is not a longIs", e.shouldThrowErrorSync(function() {
            r.arrayReplaceArrayOnceStrictly([ 1 ], [ 1 ], 1);
          }), e.case = "ins element several times in dstArray", e.shouldThrowErrorSync(function() {
            r.arrayReplaceArrayOnceStrictly([ 1, 1 ], 1, 2);
          }), e.shouldThrowErrorSync(function() {
            r.arrayReplaceArrayOnceStrictly([ 1, 2, 3, 4, 1, 2, 3 ], [ 1, 2, 3 ], [ 6, 7, 8 ]);
          }), e.case = "dstArray is not a longIs", e.shouldThrowErrorSync(function() {
            r.arrayReplaceArrayOnceStrictly(1, [ 1 ], [ 1 ]);
          }), e.case = "ins is not a longIs", e.shouldThrowErrorSync(function() {
            r.arrayReplaceArrayOnceStrictly([ 1, 2 ], 1, [ 1 ]);
          }), e.case = "onEqualize is not a routine", e.shouldThrowErrorSync(function() {
            r.arrayReplaceArrayOnceStrictly([ 1, 2 ], [ 1 ], [ 1 ], 1);
          }), e.case = "dst, ins are empty, sub is not, dst does not has ins", e.shouldThrowErrorSync(function() {
            r.arrayReplaceArrayOnceStrictly([], [ void 0 ], [ "x" ]);
          }), e.case = "dst does not has ins", e.shouldThrowErrorSync(function() {
            r.arrayReplaceArrayOnceStrictly([ "b", "c" ], [ "a" ], [ "x" ]);
          }), e.case = "dst, sub are empty, ins is not", e.shouldThrowErrorSync(function() {
            r.arrayReplaceArrayOnceStrictly([], [ "a", "b" ], []);
          }), e.case = "only ins is empty", e.shouldThrowErrorSync(function() {
            r.arrayReplaceArrayOnceStrictly([ "a", "b", "c", "d" ], [], [ "x", "y" ]);
          }), e.case = "not equal length of ins and sub", e.shouldThrowErrorSync(function() {
            r.arrayReplaceArrayOnceStrictly([ 1, 2, 3 ], [ 1, 2 ], [ 3 ]);
          });
        }
        //
        ,
        arrayReplacedArray: function arrayReplacedArray(e) {
          e.case = "dst, ins, sub are empty";
          var a = [], n = r.arrayReplacedArray(a, [], []);
          e.identical(a, []), e.identical(n, 0), e.case = "ins, sub are empty, dst is not", 
          a = [ "a", "b", "c", "d" ], n = r.arrayReplacedArray(a, [], []), e.identical(a, [ "a", "b", "c", "d" ]), 
          e.identical(n, 0), e.case = "other", a = [ 1, 2, 3 ], n = r.arrayReplacedArray(a, [ 1 ], [ 2 ]), 
          e.identical(a, [ 2, 2, 3 ]), e.identical(n, 1), a = [ 1, 2, 3 ], n = r.arrayReplacedArray(a, [ 1, 2 ], [ 3, 4 ]), 
          e.identical(a, [ 3, 4, 3 ]), e.identical(n, 2), a = [ 1, 2, 3 ], n = r.arrayReplacedArray(a, [ 1, 0, 4 ], [ 3, 5, 6 ]), 
          e.identical(a, [ 3, 2, 3 ]), e.identical(n, 1), e.case = "Repeated elements in dstArray", 
          a = [ 1, 2, 3, 1, 2, 3 ], n = r.arrayReplacedArray(a, [ 1 ], [ 2 ]), e.identical(a, [ 2, 2, 3, 2, 2, 3 ]), 
          e.identical(n, 2), a = [ 1, 2, 3, 4, 3, 2, 1 ], n = r.arrayReplacedArray(a, [ 1, 2 ], [ 3, 4 ]), 
          e.identical(a, [ 3, 4, 3, 4, 3, 4, 3 ]), e.identical(n, 4), a = [ 0, 0, 1, 1, 2, 2, 3, 3, 4, 4 ], 
          n = r.arrayReplacedArray(a, [ 1, 0, 4 ], [ 3, 5, 6 ]), e.identical(a, [ 5, 5, 3, 3, 2, 2, 3, 3, 6, 6 ]), 
          e.identical(n, 6), e.case = "ins has undefined", a = [ 1, 2, 3 ], n = r.arrayReplacedArray(a, [ void 0 ], [ 0 ]), 
          e.identical(a, [ 1, 2, 3 ]), e.identical(n, 0), e.case = "ins and dst has undefined", 
          a = [ 1, void 0, 3 ], n = r.arrayReplacedArray(a, [ void 0 ], [ 0 ]), e.identical(a, [ 1, 0, 3 ]), 
          e.identical(n, 1), e.case = "sub has undefined", a = [ 1, 2, 3 ], n = r.arrayReplacedArray(a, [ 2 ], [ void 0 ]), 
          e.identical(a, [ 1, 3 ]), e.identical(n, 1), e.case = "Element repeated in ins", 
          a = [ 1, 2, 3 ], n = r.arrayReplacedArray(a, [ 2, 2, 2 ], [ "a", "b", "c" ]), e.identical(a, [ 1, "c", 3 ]), 
          e.identical(n, 3), e.case = "ins and sub have mirror elements", a = [ 0, 0, 0, 1, 1, 1 ], 
          n = r.arrayReplacedArray(a, [ 0, 1 ], [ 1, 0 ]), e.identical(a, [ 1, 1, 1, 0, 0, 0 ]), 
          e.identical(n, 6), a = [ 0, 0, 0, 1, 1, 1, 0, 1 ], n = r.arrayReplacedArray(a, [ 1, 0 ], [ 0, 1 ]), 
          e.identical(a, [ 1, 1, 1, 0, 0, 0, 1, 0 ]), e.identical(n, 8), a = [ "a", "b", "c", !1, "c", "b", "a", !0, 2 ], 
          n = r.arrayReplacedArray(a, [ "a", "b", "c", !1, !0 ], [ "c", "a", "b", !0, !1 ]), 
          e.identical(a, [ "c", "a", "b", !0, "b", "a", "c", !1, 2 ]), e.identical(n, 8), 
          e.case = "onEqualize", a = [ [ 1 ], [ 2 ], [ 3 ] ], n = r.arrayReplacedArray(a, [ [ 1 ] ], [ [ 0 ] ], function onEqualize(r, e) {
            return r[0] === e[0];
          }), e.identical(a, [ [ 0 ], [ 2 ], [ 3 ] ]), e.identical(n, 1), e.case = "no arguments", 
          e.shouldThrowErrorSync(function() {
            r.arrayReplacedArray();
          }), e.case = "sub is not a longIs", e.shouldThrowErrorSync(function() {
            r.arrayReplacedArray([ 1 ], [ 1 ], 1);
          }), e.case = "dstArray is not a longIs", e.shouldThrowErrorSync(function() {
            r.arrayReplacedArray(1, [ 1 ], [ 1 ]);
          }), e.case = "ins is not a longIs", e.shouldThrowErrorSync(function() {
            r.arrayReplacedArray([ 1, 2 ], 1, [ 1 ]);
          }), 
          // test.case = 'onEqualize is not a routine';
          // test.shouldThrowErrorSync( function()
          // {
          //   _.arrayReplacedArray( [ 1, 2 ], [ 1 ], [ 1 ], 1 );
          // });
          e.case = "ins and sub don´t have the same length ", e.shouldThrowErrorSync(function() {
            r.arrayReplacedArray([ "a", "b", "c", "d" ], [ "a", "b", "c" ], [ "x", "y" ]);
          });
        }
        //
        ,
        arrayReplacedArrayOnce: function arrayReplacedArrayOnce(e) {
          e.case = "dst, ins, sub are empty";
          var a = [], n = r.arrayReplacedArrayOnce(a, [], []);
          e.identical(a, []), e.identical(n, 0), e.case = "ins, sub are empty, dst is not", 
          a = [ "a", "b", "c", "d" ], n = r.arrayReplacedArrayOnce(a, [], []), e.identical(a, [ "a", "b", "c", "d" ]), 
          e.identical(n, 0), e.case = "other", a = [ 1, 2, 3 ], n = r.arrayReplacedArrayOnce(a, [ 1 ], [ 2 ]), 
          e.identical(a, [ 2, 2, 3 ]), e.identical(n, 1), a = [ 1, 2, 3 ], n = r.arrayReplacedArrayOnce(a, [ 1, 2 ], [ 3, 4 ]), 
          e.identical(a, [ 3, 4, 3 ]), e.identical(n, 2), a = [ 1, 2, 3 ], n = r.arrayReplacedArrayOnce(a, [ 1, 0, 4 ], [ 3, 5, 6 ]), 
          e.identical(a, [ 3, 2, 3 ]), e.identical(n, 1), e.case = "Repeated elements in dstArray", 
          a = [ 1, 2, 3, 1, 2, 3 ], n = r.arrayReplacedArrayOnce(a, [ 1 ], [ 2 ]), e.identical(a, [ 2, 2, 3, 1, 2, 3 ]), 
          e.identical(n, 1), a = [ 1, 2, 3, 4, 3, 2, 1 ], n = r.arrayReplacedArrayOnce(a, [ 1, 2 ], [ 3, 4 ]), 
          e.identical(a, [ 3, 4, 3, 4, 3, 2, 1 ]), e.identical(n, 2), a = [ 0, 0, 1, 1, 2, 2, 3, 3, 4, 4 ], 
          n = r.arrayReplacedArrayOnce(a, [ 1, 0, 4 ], [ 3, 5, 6 ]), e.identical(a, [ 5, 0, 3, 1, 2, 2, 3, 3, 6, 4 ]), 
          e.identical(n, 3), e.case = "ins has undefined", a = [ 1, 2, 3 ], n = r.arrayReplacedArrayOnce(a, [ void 0 ], [ 0 ]), 
          e.identical(a, [ 1, 2, 3 ]), e.identical(n, 0), e.case = "ins and dst has undefined", 
          a = [ 1, void 0, 3 ], n = r.arrayReplacedArrayOnce(a, [ void 0 ], [ 0 ]), e.identical(a, [ 1, 0, 3 ]), 
          e.identical(n, 1), e.case = "sub has undefined", a = [ 1, 2, 3 ], n = r.arrayReplacedArrayOnce(a, [ 2 ], [ void 0 ]), 
          e.identical(a, [ 1, 3 ]), e.identical(n, 1), e.case = "onEqualize", a = [ [ 1 ], [ 2 ], [ 3 ] ], 
          n = r.arrayReplacedArrayOnce(a, [ [ 1 ] ], [ [ 0 ] ], function onEqualize(r, e) {
            return r[0] === e[0];
          }), e.identical(a, [ [ 0 ], [ 2 ], [ 3 ] ]), e.identical(n, 1), e.case = "no arguments", 
          e.shouldThrowErrorSync(function() {
            r.arrayReplacedArrayOnce();
          }), e.case = "sub is not a longIs", e.shouldThrowErrorSync(function() {
            r.arrayReplacedArrayOnce([ 1 ], [ 1 ], 1);
          }), e.case = "dstArray is not a longIs", e.shouldThrowErrorSync(function() {
            r.arrayReplacedArrayOnce(1, [ 1 ], [ 1 ]);
          }), e.case = "ins is not a longIs", e.shouldThrowErrorSync(function() {
            r.arrayReplacedArrayOnce([ 1, 2 ], 1, [ 1 ]);
          }), 
          // test.case = 'onEqualize is not a routine';
          // test.shouldThrowErrorSync( function()
          // {
          //   _.arrayReplacedArrayOnce( [ 1, 2 ], [ 1 ], [ 1 ], 1 );
          // });
          e.case = "ins and sub don´t have the same length ", e.shouldThrowErrorSync(function() {
            r.arrayReplacedArrayOnce([ "a", "b", "c", "d" ], [ "a", "b", "c" ], [ "x", "y" ]);
          });
        }
        //
        ,
        arrayReplacedArrayOnceStrictly: function arrayReplacedArrayOnceStrictly(e) {
          e.case = "dst, ins, sub are empty";
          var a = [], n = r.arrayReplacedArrayOnceStrictly(a, [], []);
          e.identical(a, []), e.identical(n, 0), e.case = "ins, sub are empty, dst is not", 
          a = [ "a", "b", "c", "d" ], n = r.arrayReplacedArrayOnceStrictly(a, [], []), e.identical(a, [ "a", "b", "c", "d" ]), 
          e.identical(n, 0), e.case = "other", a = [ 1, 2, 3 ], n = r.arrayReplacedArrayOnceStrictly(a, [ 1 ], [ 2 ]), 
          e.identical(a, [ 2, 2, 3 ]), e.identical(n, 1), a = [ 1, 2, 3 ], n = r.arrayReplacedArrayOnceStrictly(a, [ 1, 2 ], [ 3, 4 ]), 
          e.identical(a, [ 3, 4, 3 ]), e.identical(n, 2), e.case = "ins and dst have undefined", 
          a = [ 1, void 0, 3 ], n = r.arrayReplacedArrayOnceStrictly(a, [ void 0 ], [ 0 ]), 
          e.identical(a, [ 1, 0, 3 ]), e.identical(n, 1), e.case = "sub has undefined", a = [ 1, 2, 3 ], 
          n = r.arrayReplacedArrayOnceStrictly(a, [ 2 ], [ void 0 ]), e.identical(a, [ 1, 3 ]), 
          e.identical(n, 1), e.case = "onEqualize", a = [ [ 1 ], [ 2 ], [ 3 ] ], n = r.arrayReplacedArrayOnceStrictly(a, [ [ 1 ] ], [ [ 0 ] ], function onEqualize(r, e) {
            return r[0] === e[0];
          }), e.identical(a, [ [ 0 ], [ 2 ], [ 3 ] ]), e.identical(n, 1), e.case = "no arguments", 
          e.shouldThrowErrorSync(function() {
            r.arrayReplacedArrayOnceStrictly();
          }), e.case = "sub is not a longIs", e.shouldThrowErrorSync(function() {
            r.arrayReplacedArrayOnceStrictly([ 1 ], [ 1 ], 1);
          }), e.case = "dstArray is not a longIs", e.shouldThrowErrorSync(function() {
            r.arrayReplacedArrayOnceStrictly(1, [ 1 ], [ 1 ]);
          }), e.case = "ins is not a longIs", e.shouldThrowErrorSync(function() {
            r.arrayReplacedArrayOnceStrictly([ 1, 2 ], 1, [ 1 ]);
          }), e.case = "onEqualize is not a routine", e.shouldThrowErrorSync(function() {
            r.arrayReplacedArrayOnceStrictly([ 1, 2 ], [ 1 ], [ 1 ], 1);
          }), e.case = "ins and sub don´t have the same length ", e.shouldThrowErrorSync(function() {
            r.arrayReplacedArrayOnceStrictly([ "a", "b", "c", "d" ], [ "a", "b", "c" ], [ "x", "y" ]);
          }), e.case = "Repeated elements in dstArray", e.shouldThrowErrorSync(function() {
            r.arrayReplacedArrayOnceStrictly([ 1, 2, 3, 1, 2, 3 ], [ 1 ], [ 2 ]);
          }), e.shouldThrowErrorSync(function() {
            r.arrayReplacedArrayOnceStrictly([ 1, 2, 3, 4, 3, 2, 1 ], [ 1, 2 ], [ 3, 4 ]);
          }), e.shouldThrowErrorSync(function() {
            r.arrayReplacedArrayOnceStrictly([ 0, 0, 1, 1, 2, 2, 3, 3, 4, 4 ], [ 1, 0, 4 ], [ 3, 5, 6 ]);
          }), e.case = "Element not found in dstArray", e.shouldThrowErrorSync(function() {
            r.arrayReplacedArrayOnceStrictly([ 1, 2, 3 ], [ 1, 0, 4 ], [ 3, 5, 6 ]);
          }), e.shouldThrowErrorSync(function() {
            r.arrayReplacedArrayOnceStrictly([ 1, 2, 3, 4, 3, 2, 1 ], [ void 0 ], [ 10 ]);
          });
        }
        //
        ,
        arrayReplaceArrays: function arrayReplaceArrays(e) {
          e.case = "dst, ins, sub are empty";
          var a = [], n = r.arrayReplaceArrays(a, [], []);
          e.identical(n, []), e.is(n === a), e.case = "ins, sub are empty, dst is not", a = [ "a", "b", "c", "d" ], 
          n = r.arrayReplaceArrays(a, [], []), e.identical(n, [ "a", "b", "c", "d" ]), e.is(n === a), 
          e.case = "other", a = [ 1, 2, 3 ], n = r.arrayReplaceArrays(a, [ 1 ], [ 2 ]), e.identical(n, [ 2, 2, 3 ]), 
          e.is(n === a), a = [ 1, 2, 3 ], n = r.arrayReplaceArrays(a, [ 1, 2 ], [ 3, 4 ]), 
          e.identical(n, [ 3, 4, 3 ]), e.is(n === a), a = [ 1, 2, 3 ], n = r.arrayReplaceArrays(a, [ 1, 0, 4 ], [ 3, 5, 6 ]), 
          e.identical(n, [ 3, 2, 3 ]), e.is(n === a), e.case = "Repeated elements in dstArray", 
          a = [ 1, 2, 3, 1, 2, 3 ], n = r.arrayReplaceArrays(a, [ 1 ], [ 2 ]), e.identical(n, [ 2, 2, 3, 2, 2, 3 ]), 
          e.is(n === a), a = [ 1, 2, 3, 4, 3, 2, 1 ], n = r.arrayReplaceArrays(a, [ 1, 2 ], [ 3, 4 ]), 
          e.identical(n, [ 3, 4, 3, 4, 3, 4, 3 ]), e.is(n === a), a = [ 0, 0, 1, 1, 2, 2, 3, 3, 4, 4 ], 
          n = r.arrayReplaceArrays(a, [ 1, 0, 4 ], [ 3, 5, 6 ]), e.identical(n, [ 5, 5, 3, 3, 2, 2, 3, 3, 6, 6 ]), 
          e.is(n === a), e.case = "ins has undefined", a = [ 1, 2, 3 ], n = r.arrayReplaceArrays(a, [ void 0 ], [ 0 ]), 
          e.identical(n, [ 1, 2, 3 ]), e.is(n === a), e.case = "ins and dst has undefined", 
          a = [ 1, void 0, 3 ], n = r.arrayReplaceArrays(a, [ void 0 ], [ 0 ]), e.identical(n, [ 1, 0, 3 ]), 
          e.is(n === a), e.case = "sub has undefined", a = [ 1, 2, 3 ], n = r.arrayReplaceArrays(a, [ 2 ], [ void 0 ]), 
          e.identical(n, [ 1, void 0, 3 ]), e.is(n === a), e.case = "ins and sub Array of arrays", 
          a = [ 0, 1, 2, 3, 4, 5, 0 ], n = r.arrayReplaceArrays(a, [ [ 0, 1 ], 2, [ 5 ] ], [ [ "0", "1" ], "2", [ "5" ] ]), 
          e.identical(n, [ "0", "1", "2", 3, 4, "5", "0" ]), e.is(n === a), a = [ 0, "a", "b", !1, !0, "c", 0 ], 
          n = r.arrayReplaceArrays(a, [ [ 0, !1 ] ], [ [ 1, !0 ] ]), e.identical(n, [ 1, "a", "b", !0, !0, "c", 1 ]), 
          e.is(n === a), a = [ 0, 0, 0, 2, 1, 0, 0 ], n = r.arrayReplaceArrays(a, [ [ 0, 1 ], 0 ], [ [ 1, 0 ], "0" ]), 
          e.identical(n, [ 1, 1, 1, 2, 0, 1, 1 ]), e.is(n === a), e.case = "ins and sub Array of arrays with mirror elements", 
          a = [ 1, 1, 0, 0 ], n = r.arrayReplaceArrays(a, [ [ 0, 1 ], [ "a", "b" ], [ !0, !1 ] ], [ [ 1, 0 ], [ "b", "a" ], [ !1, !0 ] ]), 
          e.identical(n, [ 0, 0, 1, 1 ]), e.is(n === a), a = [ "a", "b", "c" ], n = r.arrayReplaceArrays(a, [ [ 0, 1 ], [ "a", "b" ], [ !0, !1 ] ], [ [ 1, 0 ], [ "b", "a" ], [ !1, !0 ] ]), 
          e.identical(n, [ "b", "a", "c" ]), e.is(n === a), a = [ !0, !1, !0, !1 ], n = r.arrayReplaceArrays(a, [ [ 0, 1 ], [ "a", "b" ], [ !0, !1 ] ], [ [ 1, 0 ], [ "b", "a" ], [ !1, !0 ] ]), 
          e.identical(n, [ !1, !0, !1, !0 ]), e.is(n === a), a = [ 0, "a", !0, 2, "c", !1, "b", 1 ], 
          n = r.arrayReplaceArrays(a, [ [ 0, 1 ], [ "a", "b" ], [ !0, !1 ] ], [ [ 1, 0 ], [ "b", "a" ], [ !1, !0 ] ]), 
          e.identical(n, [ 1, "b", !1, 2, "c", !0, "a", 0 ]), e.is(n === a), e.case = "onEqualize", 
          a = [ [ 1 ], [ 2 ], [ 3 ] ], n = r.arrayReplaceArrays(a, [ [ 1 ] ], [ [ 0 ] ], function onEqualize1(r, e) {
            return r[0] === e;
          }), e.identical(n, [ 0, [ 2 ], [ 3 ] ]), e.is(n === a), e.case = "onEqualize", a = [ 1, 2, 3 ], 
          n = r.arrayReplaceArrays(a, [ [ [ 1 ] ] ], [ [ [ 0 ] ] ], function onEqualize(r, e) {
            return r === e[0];
          }), e.identical(n, [ [ 0 ], 2, 3 ]), e.is(n === a), e.case = "no arguments", e.shouldThrowErrorSync(function() {
            r.arrayReplaceArrays();
          }), e.case = "sub is not a longIs", e.shouldThrowErrorSync(function() {
            r.arrayReplaceArrays([ 1 ], [ 1 ], 1);
          }), e.case = "dstArray is not a longIs", e.shouldThrowErrorSync(function() {
            r.arrayReplaceArrays(1, [ 1 ], [ 1 ]);
          }), e.case = "ins is not a longIs", e.shouldThrowErrorSync(function() {
            r.arrayReplaceArrays([ 1, 2 ], 1, [ 1 ]);
          }), e.case = "ins and sub don´t have the same length ", e.shouldThrowErrorSync(function() {
            r.arrayReplaceArrays([ "a", "b", "c", "d" ], [ "a", "b", "c" ], [ "x", "y" ]);
          });
        }
        //
        ,
        arrayReplaceArraysOnce: function arrayReplaceArraysOnce(e) {
          e.case = "dst, ins, sub are empty";
          var a = [], n = r.arrayReplaceArraysOnce(a, [], []);
          e.identical(n, []), e.is(n === a), e.case = "ins, sub are empty, dst is not", a = [ "a", "b", "c", "d" ], 
          n = r.arrayReplaceArraysOnce(a, [], []), e.identical(n, [ "a", "b", "c", "d" ]), 
          e.is(n === a), e.case = "other", a = [ 1, 2, 3 ], n = r.arrayReplaceArraysOnce(a, [ 1 ], [ 2 ]), 
          e.identical(n, [ 2, 2, 3 ]), e.is(n === a), a = [ 1, 2, 3 ], n = r.arrayReplaceArraysOnce(a, [ 1, 2 ], [ 3, 4 ]), 
          e.identical(n, [ 3, 4, 3 ]), e.is(n === a), a = [ 1, 2, 3 ], n = r.arrayReplaceArraysOnce(a, [ 1, 0, 4 ], [ 3, 5, 6 ]), 
          e.identical(n, [ 3, 2, 3 ]), e.is(n === a), e.case = "Repeated elements in dstArray", 
          a = [ 1, 2, 3, 1, 2, 3 ], n = r.arrayReplaceArraysOnce(a, [ 1 ], [ 2 ]), e.identical(n, [ 2, 2, 3, 1, 2, 3 ]), 
          e.is(n === a), a = [ 1, 2, 3, 4, 3, 2, 1 ], n = r.arrayReplaceArraysOnce(a, [ 1, 2 ], [ 3, 4 ]), 
          e.identical(n, [ 3, 4, 3, 4, 3, 2, 1 ]), e.is(n === a), a = [ 0, 0, 1, 1, 2, 2, 3, 3, 4, 4 ], 
          n = r.arrayReplaceArraysOnce(a, [ 1, 0, 4 ], [ 3, 5, 6 ]), e.identical(n, [ 5, 0, 3, 1, 2, 2, 3, 3, 6, 4 ]), 
          e.is(n === a), e.case = "ins has undefined", a = [ 1, 2, 3 ], n = r.arrayReplaceArraysOnce(a, [ void 0 ], [ 0 ]), 
          e.identical(n, [ 1, 2, 3 ]), e.is(n === a), e.case = "ins and dst has undefined", 
          a = [ 1, void 0, 3 ], n = r.arrayReplaceArraysOnce(a, [ void 0 ], [ 0 ]), e.identical(n, [ 1, 0, 3 ]), 
          e.is(n === a), e.case = "sub has undefined", a = [ 1, 2, 3 ], n = r.arrayReplaceArraysOnce(a, [ 2 ], [ void 0 ]), 
          e.identical(n, [ 1, void 0, 3 ]), e.is(n === a), e.case = "ins and sub Array of arrays", 
          a = [ 0, 1, 2, 3, 4, 5, 0 ], n = r.arrayReplaceArraysOnce(a, [ [ 0, 1 ], 2, [ 5 ] ], [ [ "0", "1" ], "2", [ "5" ] ]), 
          e.identical(n, [ "0", "1", "2", 3, 4, "5", 0 ]), e.is(n === a), a = [ 0, "a", "b", !1, !0, "c", 0 ], 
          n = r.arrayReplaceArraysOnce(a, [ [ 0, !1 ] ], [ [ 1, !0 ] ]), e.identical(n, [ 1, "a", "b", !0, !0, "c", 0 ]), 
          e.is(n === a), a = [ 0, 0, 0, 2, 1, 0, 0 ], n = r.arrayReplaceArraysOnce(a, [ [ 0, 1 ], 0 ], [ [ 1, 0 ], "0" ]), 
          e.identical(n, [ 1, 0, 0, 2, 0, 0, 0 ]), e.is(n === a), e.case = "ins and sub Array of arrays with mirror elements", 
          a = [ 1, 1, 0, 0 ], n = r.arrayReplaceArraysOnce(a, [ [ 0, 1 ], [ "a", "b" ], [ !0, !1 ] ], [ [ 1, 0 ], [ "b", "a" ], [ !1, !0 ] ]), 
          e.identical(n, [ 0, 1, 1, 0 ]), e.is(n === a), a = [ "a", "b", "c" ], n = r.arrayReplaceArraysOnce(a, [ [ 0, 1 ], [ "a", "b" ], [ !0, !1 ] ], [ [ 1, 0 ], [ "b", "a" ], [ !1, !0 ] ]), 
          e.identical(n, [ "b", "a", "c" ]), e.is(n === a), a = [ !0, !1, !0, !1 ], n = r.arrayReplaceArraysOnce(a, [ [ 0, 1 ], [ "a", "b" ], [ !0, !1 ] ], [ [ 1, 0 ], [ "b", "a" ], [ !1, !0 ] ]), 
          e.identical(n, [ !1, !0, !0, !1 ]), e.is(n === a), a = [ 0, "a", !0, 2, "c", !1, "b", 1 ], 
          n = r.arrayReplaceArraysOnce(a, [ [ 0, 1 ], [ "a", "b" ], [ !0, !1 ] ], [ [ 1, 0 ], [ "b", "a" ], [ !1, !0 ] ]), 
          e.identical(n, [ 1, "b", !1, 2, "c", !0, "a", 0 ]), e.is(n === a), e.case = "onEqualize", 
          a = [ [ 1 ], [ 2 ], [ 3 ] ], n = r.arrayReplaceArraysOnce(a, [ [ 1 ] ], [ [ 0 ] ], function onEqualize1(r, e) {
            return r[0] === e;
          }), e.identical(n, [ 0, [ 2 ], [ 3 ] ]), e.is(n === a), e.case = "onEqualize", a = [ 1, 2, 3 ], 
          n = r.arrayReplaceArraysOnce(a, [ [ [ 1 ] ] ], [ [ [ 0 ] ] ], function onEqualize(r, e) {
            return r === e[0];
          }), e.identical(n, [ [ 0 ], 2, 3 ]), e.is(n === a), e.case = "no arguments", e.shouldThrowErrorSync(function() {
            r.arrayReplaceArraysOnce();
          }), e.case = "sub is not a longIs", e.shouldThrowErrorSync(function() {
            r.arrayReplaceArraysOnce([ 1 ], [ 1 ], 1);
          }), e.case = "dstArray is not a longIs", e.shouldThrowErrorSync(function() {
            r.arrayReplaceArraysOnce(1, [ 1 ], [ 1 ]);
          }), e.case = "ins is not a longIs", e.shouldThrowErrorSync(function() {
            r.arrayReplaceArraysOnce([ 1, 2 ], 1, [ 1 ]);
          }), e.case = "ins and sub don´t have the same length ", e.shouldThrowErrorSync(function() {
            r.arrayReplaceArraysOnce([ "a", "b", "c", "d" ], [ "a", "b", "c" ], [ "x", "y" ]);
          });
        }
        //
        ,
        arrayReplaceArraysOnceStrictly: function arrayReplaceArraysOnceStrictly(e) {
          e.case = "dst, ins, sub are empty";
          var a = [], n = r.arrayReplaceArraysOnceStrictly(a, [], []);
          e.identical(n, []), e.is(n === a), e.case = "ins, sub are empty, dst is not", a = [ "a", "b", "c", "d" ], 
          n = r.arrayReplaceArraysOnceStrictly(a, [], []), e.identical(n, [ "a", "b", "c", "d" ]), 
          e.is(n === a), e.case = "other", a = [ 1, 2, 3 ], n = r.arrayReplaceArraysOnceStrictly(a, [ 1 ], [ 2 ]), 
          e.identical(n, [ 2, 2, 3 ]), e.is(n === a), a = [ 1, 2, 3 ], n = r.arrayReplaceArraysOnceStrictly(a, [ 1, 2 ], [ 3, 4 ]), 
          e.identical(n, [ 3, 4, 3 ]), e.is(n === a), a = [ 1, 2, 3 ], n = r.arrayReplaceArraysOnceStrictly(a, [ 1, 2, 3 ], [ 4, 5, 6 ]), 
          e.identical(n, [ 4, 5, 6 ]), e.is(n === a), e.case = "ins has undefined", e.case = "ins and dst has undefined", 
          a = [ 1, void 0, 3 ], n = r.arrayReplaceArraysOnceStrictly(a, [ void 0 ], [ 0 ]), 
          e.identical(n, [ 1, 0, 3 ]), e.is(n === a), e.case = "sub has undefined", a = [ 1, 2, 3 ], 
          n = r.arrayReplaceArraysOnceStrictly(a, [ 2 ], [ void 0 ]), e.identical(n, [ 1, void 0, 3 ]), 
          e.is(n === a), e.case = "ins and sub Array of arrays", a = [ 0, 1, 2, 3, 4, 5, 0 ], 
          n = r.arrayReplaceArraysOnceStrictly(a, [ [ 0, 1 ], 2, [ 5 ] ], [ [ "0", "1" ], "2", [ "5" ] ]), 
          e.identical(n, [ "0", "1", "2", 3, 4, "5", 0 ]), e.is(n === a), a = [ 0, "a", "b", !1, !0, "c", 0 ], 
          n = r.arrayReplaceArraysOnceStrictly(a, [ [ 0, !1 ] ], [ [ 1, !0 ] ]), e.identical(n, [ 1, "a", "b", !0, !0, "c", 0 ]), 
          e.is(n === a), e.case = "ins and sub Array of arrays with mirror elements", a = [ 1, 0 ], 
          n = r.arrayReplaceArraysOnceStrictly(a, [ [ 0, 1 ] ], [ [ 1, 0 ] ]), e.identical(n, [ 0, 1 ]), 
          e.is(n === a), a = [ "a", "b", "c" ], n = r.arrayReplaceArraysOnceStrictly(a, [ [ "a", "b" ] ], [ [ "b", "a" ] ]), 
          e.identical(n, [ "b", "a", "c" ]), e.is(n === a), a = [ !0, !1, !0, !1 ], n = r.arrayReplaceArraysOnceStrictly(a, [ [ !0, !1 ] ], [ [ !1, !0 ] ]), 
          e.identical(n, [ !1, !0, !0, !1 ]), e.is(n === a), a = [ 0, "a", !0, 2, "c", !1, "b", 1 ], 
          n = r.arrayReplaceArraysOnceStrictly(a, [ [ 0, 1 ], [ "a", "b" ], [ !0, !1 ] ], [ [ 1, 0 ], [ "b", "a" ], [ !1, !0 ] ]), 
          e.identical(n, [ 1, "b", !1, 2, "c", !0, "a", 0 ]), e.is(n === a), e.case = "onEqualize", 
          a = [ [ 1 ], [ 2 ], [ 3 ] ], n = r.arrayReplaceArraysOnceStrictly(a, [ [ 1 ] ], [ [ 0 ] ], function onEqualize1(r, e) {
            return r[0] === e;
          }), e.identical(n, [ 0, [ 2 ], [ 3 ] ]), e.is(n === a), e.case = "onEqualize", a = [ 1, 2, 3 ], 
          n = r.arrayReplaceArraysOnceStrictly(a, [ [ [ 1 ] ] ], [ [ [ 0 ] ] ], function onEqualize(r, e) {
            return r === e[0];
          }), e.identical(n, [ [ 0 ], 2, 3 ]), e.is(n === a), e.case = "no arguments", e.shouldThrowErrorSync(function() {
            r.arrayReplaceArraysOnceStrictly();
          }), e.case = "sub is not a longIs", e.shouldThrowErrorSync(function() {
            r.arrayReplaceArraysOnceStrictly([ 1 ], [ 1 ], 1);
          }), e.case = "dstArray is not a longIs", e.shouldThrowErrorSync(function() {
            r.arrayReplaceArraysOnceStrictly(1, [ 1 ], [ 1 ]);
          }), e.case = "ins is not a longIs", e.shouldThrowErrorSync(function() {
            r.arrayReplaceArraysOnceStrictly([ 1, 2 ], 1, [ 1 ]);
          }), e.case = "ins and sub don´t have the same length ", e.shouldThrowErrorSync(function() {
            r.arrayReplaceArraysOnceStrictly([ "a", "b", "c", "d" ], [ "a", "b", "c" ], [ "x", "y" ]);
          }), e.case = "ins element is not in dstArray", e.shouldThrowErrorSync(function() {
            r.arrayReplaceArraysOnceStrictly([ 1, 2, 3 ], [ 1, 0, 4 ], [ 3, 5, 6 ]);
          }), e.shouldThrowErrorSync(function() {
            r.arrayReplaceArraysOnceStrictly([ 1, 2, 3 ], [ void 0 ], [ 0 ]);
          }), e.case = "Repeated elements in dstArray", e.shouldThrowErrorSync(function() {
            r.arrayReplaceArraysOnceStrictly([ 1, 2, 3, 1, 2, 3 ], [ 1 ], [ 2 ]);
          }), e.shouldThrowErrorSync(function() {
            r.arrayReplaceArraysOnceStrictly([ 1, 2, 3, 4, 3, 2, 1 ], [ 1, 2 ], [ 3, 4 ]);
          }), e.shouldThrowErrorSync(function() {
            r.arrayReplaceArraysOnceStrictly([ 0, 0, 1, 1, 2, 2, 3, 3, 4, 4 ], [ 1, 0, 4 ], [ 3, 5, 6 ]);
          }), e.shouldThrowErrorSync(function() {
            r.arrayReplaceArraysOnceStrictly([ 0, 0, 0, 2, 1, 0, 0 ], [ [ 0, 1 ], 0 ], [ [ 1, 0 ], "0" ]);
          });
        }
        //
        ,
        arrayReplacedArrays: function arrayReplacedArrays(e) {
          e.case = "dst, ins, sub are empty";
          var a = [], n = r.arrayReplacedArrays(a, [], []);
          e.identical(a, []), e.identical(n, 0), e.case = "ins, sub are empty, dst is not", 
          a = [ "a", "b", "c", "d" ], n = r.arrayReplacedArrays(a, [], []), e.identical(a, [ "a", "b", "c", "d" ]), 
          e.identical(n, 0), e.case = "other", a = [ 1, 2, 3 ], n = r.arrayReplacedArrays(a, [ 1 ], [ 2 ]), 
          e.identical(a, [ 2, 2, 3 ]), e.identical(n, 1), a = [ 1, 2, 3 ], n = r.arrayReplacedArrays(a, [ 1, 2 ], [ 3, 4 ]), 
          e.identical(a, [ 3, 4, 3 ]), e.identical(n, 2), a = [ 1, 2, 3 ], n = r.arrayReplacedArrays(a, [ 1, 0, 4 ], [ 3, 5, 6 ]), 
          e.identical(a, [ 3, 2, 3 ]), e.identical(n, 1), e.case = "Repeated elements in dstArray", 
          a = [ 1, 2, 3, 1, 2, 3 ], n = r.arrayReplacedArrays(a, [ 1 ], [ 2 ]), e.identical(a, [ 2, 2, 3, 2, 2, 3 ]), 
          e.identical(n, 2), a = [ 1, 2, 3, 4, 3, 2, 1 ], n = r.arrayReplacedArrays(a, [ 1, 2 ], [ 3, 4 ]), 
          e.identical(a, [ 3, 4, 3, 4, 3, 4, 3 ]), e.identical(n, 4), a = [ 0, 0, 1, 1, 2, 2, 3, 3, 4, 4 ], 
          n = r.arrayReplacedArrays(a, [ 1, 0, 4 ], [ 3, 5, 6 ]), e.identical(a, [ 5, 5, 3, 3, 2, 2, 3, 3, 6, 6 ]), 
          e.identical(n, 6), e.case = "ins has undefined", a = [ 1, 2, 3 ], n = r.arrayReplacedArrays(a, [ void 0 ], [ 0 ]), 
          e.identical(a, [ 1, 2, 3 ]), e.identical(n, 0), e.case = "ins and dst has undefined", 
          a = [ 1, void 0, 3 ], n = r.arrayReplacedArrays(a, [ void 0 ], [ 0 ]), e.identical(a, [ 1, 0, 3 ]), 
          e.identical(n, 1), e.case = "sub has undefined", a = [ 1, 2, 3 ], n = r.arrayReplacedArrays(a, [ 2 ], [ void 0 ]), 
          e.identical(a, [ 1, void 0, 3 ]), e.identical(n, 1), e.case = "ins and sub Array of arrays", 
          a = [ 0, 1, 2, 3, 4, 5, 0 ], n = r.arrayReplacedArrays(a, [ [ 0, 1 ], 2, [ 5 ] ], [ [ "0", "1" ], "2", [ "5" ] ]), 
          e.identical(a, [ "0", "1", "2", 3, 4, "5", "0" ]), e.identical(n, 5), a = [ 0, "a", "b", !1, !0, "c", 0 ], 
          n = r.arrayReplacedArrays(a, [ [ 0, !1 ] ], [ [ 1, !0 ] ]), e.identical(a, [ 1, "a", "b", !0, !0, "c", 1 ]), 
          e.identical(n, 3), a = [ 0, 0, 0, 2, 1, 0, 0 ], n = r.arrayReplacedArrays(a, [ [ 0, 1 ], 0 ], [ [ 1, 0 ], "0" ]), 
          e.identical(a, [ 1, 1, 1, 2, 0, 1, 1 ]), e.identical(n, 11), e.case = "ins and sub Array of arrays with mirror elements", 
          a = [ 1, 1, 0, 0 ], n = r.arrayReplacedArrays(a, [ [ 0, 1 ], [ "a", "b" ], [ !0, !1 ] ], [ [ 1, 0 ], [ "b", "a" ], [ !1, !0 ] ]), 
          e.identical(a, [ 0, 0, 1, 1 ]), e.identical(n, 4), a = [ "a", "b", "c" ], n = r.arrayReplacedArrays(a, [ [ 0, 1 ], [ "a", "b" ], [ !0, !1 ] ], [ [ 1, 0 ], [ "b", "a" ], [ !1, !0 ] ]), 
          e.identical(a, [ "b", "a", "c" ]), e.identical(n, 2), a = [ !0, !1, !0, !1 ], n = r.arrayReplacedArrays(a, [ [ 0, 1 ], [ "a", "b" ], [ !0, !1 ] ], [ [ 1, 0 ], [ "b", "a" ], [ !1, !0 ] ]), 
          e.identical(a, [ !1, !0, !1, !0 ]), e.identical(n, 4), a = [ 0, "a", !0, 2, "c", !1, "b", 1 ], 
          n = r.arrayReplacedArrays(a, [ [ 0, 1 ], [ "a", "b" ], [ !0, !1 ] ], [ [ 1, 0 ], [ "b", "a" ], [ !1, !0 ] ]), 
          e.identical(a, [ 1, "b", !1, 2, "c", !0, "a", 0 ]), e.identical(n, 6), e.case = "onEqualize", 
          a = [ [ 1 ], [ 2 ], [ 3 ] ], n = r.arrayReplacedArrays(a, [ [ 1 ] ], [ [ 0 ] ], function onEqualize1(r, e) {
            return r[0] === e;
          }), e.identical(a, [ 0, [ 2 ], [ 3 ] ]), e.identical(n, 1), e.case = "onEqualize", 
          a = [ 1, 2, 3 ], n = r.arrayReplacedArrays(a, [ [ [ 1 ] ] ], [ [ [ 0 ] ] ], function onEqualize(r, e) {
            return r === e[0];
          }), e.identical(a, [ [ 0 ], 2, 3 ]), e.identical(n, 1), e.case = "no arguments", 
          e.shouldThrowErrorSync(function() {
            r.arrayReplacedArrays();
          }), e.case = "sub is not a longIs", e.shouldThrowErrorSync(function() {
            r.arrayReplacedArrays([ 1 ], [ 1 ], 1);
          }), e.case = "dstArray is not a longIs", e.shouldThrowErrorSync(function() {
            r.arrayReplacedArrays(1, [ 1 ], [ 1 ]);
          }), e.case = "ins is not a longIs", e.shouldThrowErrorSync(function() {
            r.arrayReplacedArrays([ 1, 2 ], 1, [ 1 ]);
          }), e.case = "ins and sub don´t have the same length ", e.shouldThrowErrorSync(function() {
            r.arrayReplacedArrays([ "a", "b", "c", "d" ], [ "a", "b", "c" ], [ "x", "y" ]);
          });
        }
        //
        ,
        arrayReplacedArraysOnce: function arrayReplacedArraysOnce(e) {
          e.case = "dst, ins, sub are empty";
          var a = [], n = r.arrayReplacedArraysOnce(a, [], []);
          e.identical(a, []), e.identical(n, 0), e.case = "ins, sub are empty, dst is not", 
          a = [ "a", "b", "c", "d" ], n = r.arrayReplacedArraysOnce(a, [], []), e.identical(a, [ "a", "b", "c", "d" ]), 
          e.identical(n, 0), e.case = "other", a = [ 1, 2, 3 ], n = r.arrayReplacedArraysOnce(a, [ 1 ], [ 2 ]), 
          e.identical(a, [ 2, 2, 3 ]), e.identical(n, 1), a = [ 1, 2, 3 ], n = r.arrayReplacedArraysOnce(a, [ 1, 2 ], [ 3, 4 ]), 
          e.identical(a, [ 3, 4, 3 ]), e.identical(n, 2), a = [ 1, 2, 3 ], n = r.arrayReplacedArraysOnce(a, [ 1, 0, 4 ], [ 3, 5, 6 ]), 
          e.identical(a, [ 3, 2, 3 ]), e.identical(n, 1), e.case = "Repeated elements in dstArray", 
          a = [ 1, 2, 3, 1, 2, 3 ], n = r.arrayReplacedArraysOnce(a, [ 1 ], [ 2 ]), e.identical(a, [ 2, 2, 3, 1, 2, 3 ]), 
          e.identical(n, 1), a = [ 1, 2, 3, 4, 3, 2, 1 ], n = r.arrayReplacedArraysOnce(a, [ 1, 2 ], [ 3, 4 ]), 
          e.identical(a, [ 3, 4, 3, 4, 3, 2, 1 ]), e.identical(n, 2), a = [ 0, 0, 1, 1, 2, 2, 3, 3, 4, 4 ], 
          n = r.arrayReplacedArraysOnce(a, [ 1, 0, 4 ], [ 3, 5, 6 ]), e.identical(a, [ 5, 0, 3, 1, 2, 2, 3, 3, 6, 4 ]), 
          e.identical(n, 3), e.case = "ins has undefined", a = [ 1, 2, 3 ], n = r.arrayReplacedArraysOnce(a, [ void 0 ], [ 0 ]), 
          e.identical(a, [ 1, 2, 3 ]), e.identical(n, 0), e.case = "ins and dst has undefined", 
          a = [ 1, void 0, 3 ], n = r.arrayReplacedArraysOnce(a, [ void 0 ], [ 0 ]), e.identical(a, [ 1, 0, 3 ]), 
          e.identical(n, 1), e.case = "sub has undefined", a = [ 1, 2, 3 ], n = r.arrayReplacedArraysOnce(a, [ 2 ], [ void 0 ]), 
          e.identical(a, [ 1, void 0, 3 ]), e.identical(n, 1), e.case = "ins and sub Array of arrays", 
          a = [ 0, 1, 2, 3, 4, 5, 0 ], n = r.arrayReplacedArraysOnce(a, [ [ 0, 1 ], 2, [ 5 ] ], [ [ "0", "1" ], "2", [ "5" ] ]), 
          e.identical(a, [ "0", "1", "2", 3, 4, "5", 0 ]), e.identical(n, 4), a = [ 0, "a", "b", !1, !0, "c", 0 ], 
          n = r.arrayReplacedArraysOnce(a, [ [ 0, !1 ] ], [ [ 1, !0 ] ]), e.identical(a, [ 1, "a", "b", !0, !0, "c", 0 ]), 
          e.identical(n, 2), a = [ 0, 0, 0, 2, 1, 0, 0 ], n = r.arrayReplacedArraysOnce(a, [ [ 0, 1 ], 0 ], [ [ 1, 0 ], "0" ]), 
          e.identical(a, [ 1, 0, 0, 2, 0, 0, 0 ]), e.identical(n, 3), e.case = "ins and sub Array of arrays with mirror elements", 
          a = [ 1, 1, 0, 0 ], n = r.arrayReplacedArraysOnce(a, [ [ 0, 1 ], [ "a", "b" ], [ !0, !1 ] ], [ [ 1, 0 ], [ "b", "a" ], [ !1, !0 ] ]), 
          e.identical(a, [ 0, 1, 1, 0 ]), e.identical(n, 2), a = [ "a", "b", "c" ], n = r.arrayReplacedArraysOnce(a, [ [ 0, 1 ], [ "a", "b" ], [ !0, !1 ] ], [ [ 1, 0 ], [ "b", "a" ], [ !1, !0 ] ]), 
          e.identical(a, [ "b", "a", "c" ]), e.identical(n, 2), a = [ !0, !1, !0, !1 ], n = r.arrayReplacedArraysOnce(a, [ [ 0, 1 ], [ "a", "b" ], [ !0, !1 ] ], [ [ 1, 0 ], [ "b", "a" ], [ !1, !0 ] ]), 
          e.identical(a, [ !1, !0, !0, !1 ]), e.identical(n, 2), a = [ 0, "a", !0, 2, "c", !1, "b", 1 ], 
          n = r.arrayReplacedArraysOnce(a, [ [ 0, 1 ], [ "a", "b" ], [ !0, !1 ] ], [ [ 1, 0 ], [ "b", "a" ], [ !1, !0 ] ]), 
          e.identical(a, [ 1, "b", !1, 2, "c", !0, "a", 0 ]), e.identical(n, 6), e.case = "onEqualize", 
          a = [ [ 1 ], [ 2 ], [ 3 ] ], n = r.arrayReplacedArraysOnce(a, [ [ 1 ] ], [ [ 0 ] ], function onEqualize1(r, e) {
            return r[0] === e;
          }), e.identical(a, [ 0, [ 2 ], [ 3 ] ]), e.identical(n, 1), e.case = "onEqualize", 
          a = [ 1, 2, 3 ], n = r.arrayReplacedArraysOnce(a, [ [ [ 1 ] ] ], [ [ [ 0 ] ] ], function onEqualize(r, e) {
            return r === e[0];
          }), e.identical(a, [ [ 0 ], 2, 3 ]), e.identical(n, 1), e.case = "no arguments", 
          e.shouldThrowErrorSync(function() {
            r.arrayReplacedArraysOnce();
          }), e.case = "sub is not a longIs", e.shouldThrowErrorSync(function() {
            r.arrayReplacedArraysOnce([ 1 ], [ 1 ], 1);
          }), e.case = "dstArray is not a longIs", e.shouldThrowErrorSync(function() {
            r.arrayReplacedArraysOnce(1, [ 1 ], [ 1 ]);
          }), e.case = "ins is not a longIs", e.shouldThrowErrorSync(function() {
            r.arrayReplacedArraysOnce([ 1, 2 ], 1, [ 1 ]);
          }), e.case = "ins and sub don´t have the same length ", e.shouldThrowErrorSync(function() {
            r.arrayReplacedArraysOnce([ "a", "b", "c", "d" ], [ "a", "b", "c" ], [ "x", "y" ]);
          });
        }
        //
        ,
        arrayReplacedArraysOnceStrictly: function arrayReplacedArraysOnceStrictly(e) {
          e.case = "dst, ins, sub are empty";
          var a = [], n = r.arrayReplacedArraysOnceStrictly(a, [], []);
          e.identical(a, []), e.identical(n, 0), e.case = "ins, sub are empty, dst is not", 
          a = [ "a", "b", "c", "d" ], n = r.arrayReplacedArraysOnceStrictly(a, [], []), e.identical(a, [ "a", "b", "c", "d" ]), 
          e.identical(n, 0), e.case = "other", a = [ 1, 2, 3 ], n = r.arrayReplacedArraysOnceStrictly(a, [ 1 ], [ 2 ]), 
          e.identical(a, [ 2, 2, 3 ]), e.identical(n, 1), a = [ 1, 2, 3 ], n = r.arrayReplacedArraysOnceStrictly(a, [ 1, 2 ], [ 3, 4 ]), 
          e.identical(a, [ 3, 4, 3 ]), e.identical(n, 2), a = [ 1, 2, 3 ], n = r.arrayReplacedArraysOnceStrictly(a, [ 1, 2, 3 ], [ 4, 5, 6 ]), 
          e.identical(a, [ 4, 5, 6 ]), e.identical(n, 3), e.case = "ins has undefined", e.case = "ins and dst has undefined", 
          a = [ 1, void 0, 3 ], n = r.arrayReplacedArraysOnceStrictly(a, [ void 0 ], [ 0 ]), 
          e.identical(a, [ 1, 0, 3 ]), e.identical(n, 1), e.case = "sub has undefined", a = [ 1, 2, 3 ], 
          n = r.arrayReplacedArraysOnceStrictly(a, [ 2 ], [ void 0 ]), e.identical(a, [ 1, void 0, 3 ]), 
          e.identical(n, 1), e.case = "ins and sub Array of arrays", a = [ 0, 1, 2, 3, 4, 5, 0 ], 
          n = r.arrayReplacedArraysOnceStrictly(a, [ [ 0, 1 ], 2, [ 5 ] ], [ [ "0", "1" ], "2", [ "5" ] ]), 
          e.identical(a, [ "0", "1", "2", 3, 4, "5", 0 ]), e.identical(n, 4), a = [ 0, "a", "b", !1, !0, "c", 0 ], 
          n = r.arrayReplacedArraysOnceStrictly(a, [ [ 0, !1 ] ], [ [ 1, !0 ] ]), e.identical(a, [ 1, "a", "b", !0, !0, "c", 0 ]), 
          e.identical(n, 2), e.case = "ins and sub Array of arrays with mirror elements", 
          a = [ 1, 0 ], n = r.arrayReplacedArraysOnceStrictly(a, [ [ 0, 1 ] ], [ [ 1, 0 ] ]), 
          e.identical(a, [ 0, 1 ]), e.identical(n, 2), a = [ "a", "b", "c" ], n = r.arrayReplacedArraysOnceStrictly(a, [ [ "a", "b" ] ], [ [ "b", "a" ] ]), 
          e.identical(a, [ "b", "a", "c" ]), e.identical(n, 2), a = [ !0, !1, !0, !1 ], n = r.arrayReplacedArraysOnceStrictly(a, [ [ !0, !1 ] ], [ [ !1, !0 ] ]), 
          e.identical(a, [ !1, !0, !0, !1 ]), e.identical(n, 2), a = [ 0, "a", !0, 2, "c", !1, "b", 1 ], 
          n = r.arrayReplacedArraysOnceStrictly(a, [ [ 0, 1 ], [ "a", "b" ], [ !0, !1 ] ], [ [ 1, 0 ], [ "b", "a" ], [ !1, !0 ] ]), 
          e.identical(a, [ 1, "b", !1, 2, "c", !0, "a", 0 ]), e.identical(n, 6), e.case = "onEqualize", 
          a = [ [ 1 ], [ 2 ], [ 3 ] ], n = r.arrayReplacedArraysOnceStrictly(a, [ [ 1 ] ], [ [ 0 ] ], function onEqualize1(r, e) {
            return r[0] === e;
          }), e.identical(a, [ 0, [ 2 ], [ 3 ] ]), e.identical(n, 1), e.case = "onEqualize", 
          a = [ 1, 2, 3 ], n = r.arrayReplacedArraysOnceStrictly(a, [ [ [ 1 ] ] ], [ [ [ 0 ] ] ], function onEqualize(r, e) {
            return r === e[0];
          }), e.identical(a, [ [ 0 ], 2, 3 ]), e.identical(n, 1), e.case = "no arguments", 
          e.shouldThrowErrorSync(function() {
            r.arrayReplacedArraysOnceStrictly();
          }), e.case = "sub is not a longIs", e.shouldThrowErrorSync(function() {
            r.arrayReplacedArraysOnceStrictly([ 1 ], [ 1 ], 1);
          }), e.case = "dstArray is not a longIs", e.shouldThrowErrorSync(function() {
            r.arrayReplacedArraysOnceStrictly(1, [ 1 ], [ 1 ]);
          }), e.case = "ins is not a longIs", e.shouldThrowErrorSync(function() {
            r.arrayReplacedArraysOnceStrictly([ 1, 2 ], 1, [ 1 ]);
          }), e.case = "ins and sub don´t have the same length ", e.shouldThrowErrorSync(function() {
            r.arrayReplacedArraysOnceStrictly([ "a", "b", "c", "d" ], [ "a", "b", "c" ], [ "x", "y" ]);
          }), e.case = "ins element is not in dstArray", e.shouldThrowErrorSync(function() {
            r.arrayReplacedArraysOnceStrictly([ 1, 2, 3 ], [ 1, 0, 4 ], [ 3, 5, 6 ]);
          }), e.shouldThrowErrorSync(function() {
            r.arrayReplacedArraysOnceStrictly([ 1, 2, 3 ], [ void 0 ], [ 0 ]);
          }), e.case = "Repeated elements in dstArray", e.shouldThrowErrorSync(function() {
            r.arrayReplacedArraysOnceStrictly([ 1, 2, 3, 1, 2, 3 ], [ 1 ], [ 2 ]);
          }), e.shouldThrowErrorSync(function() {
            r.arrayReplacedArraysOnceStrictly([ 1, 2, 3, 4, 3, 2, 1 ], [ 1, 2 ], [ 3, 4 ]);
          }), e.shouldThrowErrorSync(function() {
            r.arrayReplacedArraysOnceStrictly([ 0, 0, 1, 1, 2, 2, 3, 3, 4, 4 ], [ 1, 0, 4 ], [ 3, 5, 6 ]);
          }), e.shouldThrowErrorSync(function() {
            r.arrayReplacedArraysOnceStrictly([ 0, 0, 0, 2, 1, 0, 0 ], [ [ 0, 1 ], 0 ], [ [ 1, 0 ], "0" ]);
          });
        }
        // //
        //
        // function arrayReplaceArraysOnce( test )
        // {
        //   test.case = 'replace elements from arrays from ins with relevant values from sub';
        //
        //   var dst = [];
        //   var got = _.arrayReplaceArraysOnce( dst, [ [] ], [ [] ] );
        //   test.identical( got, [] );
        //
        //   var dst = [ 1, 2, 3 ];
        //   var got = _.arrayReplaceArraysOnce( dst, [ [ 1 ] ], [ [ 3 ] ] );
        //   test.identical( got, [ 3, 2, 3 ] );
        //
        //   var dst = [ 1, 2, 3 ];
        //   var got = _.arrayReplaceArraysOnce( dst, [ [ 1 ], [ 2 ] ], [ [ 3 ],[ 3 ] ] );
        //   test.identical( got, [ 3, 3, 3 ] );
        //
        //   var dst = [ 1, 2, 3 ];
        //   var got = _.arrayReplaceArraysOnce( dst, [ [ 1 ], [ 2 ] ], [ [ 3 ], 3 ] );
        //   test.identical( got, [ 3, 3, 3 ] );
        //
        //   var dst = [ 1, 2, 3 ];
        //   var got = _.arrayReplaceArraysOnce( dst, [ [ 1 ], [ 2 ] ], [ 3, 3 ] );
        //   test.identical( got, [ 3, 3, 3 ] );
        //
        //   var dst = [ 1, 2, 3 ];
        //   var got = _.arrayReplaceArraysOnce( dst, [ [ 1, 2, 3 ] ], [ 3 ] );
        //   test.identical( got, [ 3, 3, 3 ] );
        //
        //   var dst = [ 1, 2, 3 ];
        //   var got = _.arrayReplaceArraysOnce( dst, [ [ 1, 2, 3 ] ], [ [ 3,3,3, ] ] );
        //   test.identical( got, [ 3, 3, 3 ] );
        //
        //   var dst = [ 1, 2, 3 ];
        //   var got = _.arrayReplaceArraysOnce( dst, [ [ 1, 2, 3 ] ], [ [ 3 ] ] );
        //   test.identical( got, [ 3, 3, 3 ] );
        //
        //   var dst = [ 1, 2, 3 ];
        //   var got = _.arrayReplaceArraysOnce( dst, [ [ 1 ], [ 2 ] ], [ [ 3 ], [ 4 ] ] );
        //   test.identical( got, [ 3, 4, 3 ] );
        //
        //   var dst = [ 1, 2, 3 ];
        //   var got = _.arrayReplaceArraysOnce( dst, [ [ [ 1 ] ] ], [ 0 ] );
        //   test.identical( got, [ 1, 2, 3 ] );
        //
        //   var dst = [ 1, 2, 3 ];
        //   var got = _.arrayReplaceArraysOnce( dst, [ [ 1, [ 2 ], 3 ] ], [ 0 ] );
        //   test.identical( got, [ 0, 2, 0 ] );
        //
        //   var dst = [ [ 1 ], [ 2 ], [ 3 ] ];
        //   function onEqualize( a, b )
        //   {
        //     return a[ 0 ] === b[ 0 ];
        //   }
        //   var got = _.arrayReplaceArraysOnce( dst, [ [ [ 1 ], [ 2 ], [ 3 ] ] ], [ [ [ 0 ] ] ], onEqualize );
        //   test.identical( got, [ [ 0 ], [ 0 ], [ 0 ] ] );
        //
        //   //
        //
        //   if( !Config.debug )
        //   return;
        //
        //   test.case = 'no arguments';
        //   test.shouldThrowErrorSync( function()
        //   {
        //     _.arrayReplaceArraysOnce();
        //   })
        //
        //   test.case = 'dstArray is not a longIs';
        //   test.shouldThrowErrorSync( function()
        //   {
        //     _.arrayReplaceArraysOnce( 1, [ [ 1 ] ], [ 1 ] );
        //   })
        //
        //   test.case = 'ins is not a longIs';
        //   test.shouldThrowErrorSync( function()
        //   {
        //     _.arrayReplaceArraysOnce( [ 1, 2 ], 1, [ 1 ] );
        //   })
        //
        //   test.case = 'ins must be array of arrays';
        //   test.shouldThrowErrorSync( function()
        //   {
        //     _.arrayReplaceArraysOnce( [ 1, 2 ],[ 1 ], [ 1 ] );
        //   })
        //
        //   test.case = 'onEqualize is not a routine';
        //   test.shouldThrowErrorSync( function()
        //   {
        //     _.arrayReplaceArraysOnce( [ 1, 2 ], [ [ 1 ] ], [ 1 ], 1 );
        //   })
        //
        //   test.case = 'ins and sub length are different';
        //   test.shouldThrowErrorSync( function()
        //   {
        //     _.arrayReplaceArraysOnce( [ 1 ], [ [ 1 ] ], [ 10, 20 ] );
        //   })
        //
        //   test.shouldThrowErrorSync( function()
        //   {
        //     _.arrayReplaceArraysOnce( [ 1 ], [ [ 1, 2 ] ], [ 10,20 ] );
        //   })
        //
        //   test.case = 'ins[ 0 ] and sub[ 0 ] length are different';
        //   test.shouldThrowErrorSync( function()
        //   {
        //     _.arrayReplaceArraysOnce( [ 1 ], [ [ 1 ] ], [ [ 10,20 ] ] );
        //   })
        // }
        //
        // //
        //
        // function arrayReplaceArraysOnceStrictly( test )
        // {
        //   test.case = 'replace elements from arrays from ins with relevant values from sub';
        //
        //   var dst = [];
        //   var got = _.arrayReplaceArraysOnceStrictly( dst, [ [] ], [ [] ] );
        //   test.identical( got, [] );
        //
        //   var dst = [ 1, 2, 3 ];
        //   var got = _.arrayReplaceArraysOnceStrictly( dst, [ [ 1 ] ], [ [ 3 ] ] );
        //   test.identical( got, [ 3, 2, 3 ] );
        //
        //   var dst = [ 1, 2, 3 ];
        //   var got = _.arrayReplaceArraysOnceStrictly( dst, [ [ 1 ], [ 2 ] ], [ [ 3 ],[ 3 ] ] );
        //   test.identical( got, [ 3, 3, 3 ] );
        //
        //   var dst = [ 1, 2, 3 ];
        //   var got = _.arrayReplaceArraysOnceStrictly( dst, [ [ 1 ], [ 2 ] ], [ [ 3 ], 3 ] );
        //   test.identical( got, [ 3, 3, 3 ] );
        //
        //   var dst = [ 1, 2, 3 ];
        //   var got = _.arrayReplaceArraysOnceStrictly( dst, [ [ 1 ], [ 2 ] ], [ 3, 3 ] );
        //   test.identical( got, [ 3, 3, 3 ] );
        //
        //   var dst = [ 1, 2, 3 ];
        //   var got = _.arrayReplaceArraysOnceStrictly( dst, [ [ 1, 2, 3 ] ], [ 3 ] );
        //   test.identical( got, [ 3, 3, 3 ] );
        //
        //   var dst = [ 1, 2, 3 ];
        //   var got = _.arrayReplaceArraysOnceStrictly( dst, [ [ 1, 2, 3 ] ], [ [ 3,3,3, ] ] );
        //   test.identical( got, [ 3, 3, 3 ] );
        //
        //   var dst = [ 1, 2, 3 ];
        //   var got = _.arrayReplaceArraysOnceStrictly( dst, [ [ 1, 2, 3 ] ], [ [ 3 ] ] );
        //   test.identical( got, [ 3, 3, 3 ] );
        //
        //   var dst = [ 1, 2, 3 ];
        //   var got = _.arrayReplaceArraysOnceStrictly( dst, [ [ 1 ], [ 2 ] ], [ [ 3 ], [ 4 ] ] );
        //   test.identical( got, [ 3, 4, 3 ] );
        //
        //   var dst = [ [ 1 ], [ 2 ], [ 3 ] ];
        //   function onEqualize( a, b )
        //   {
        //     return a[ 0 ] === b[ 0 ];
        //   }
        //   var got = _.arrayReplaceArraysOnceStrictly( dst, [ [ [ 1 ], [ 2 ], [ 3 ] ] ], [ [ [ 0 ] ] ], onEqualize );
        //   test.identical( got, [ [ 0 ], [ 0 ], [ 0 ] ] );
        //
        //   //
        //
        //   if( !Config.debug )
        //   return;
        //
        //   test.case = 'no arguments';
        //   test.shouldThrowErrorSync( function()
        //   {
        //     _.arrayReplaceArraysOnceStrictly();
        //   })
        //
        //   test.shouldThrowErrorSync( function()
        //   {
        //     var dst = [ 1, 2, 3 ];
        //     _.arrayReplaceArraysOnceStrictly( dst, [ [ [ 1 ] ] ], [ 0 ] );
        //   })
        //
        //   test.case = 'one element is not replaced';
        //   test.shouldThrowErrorSync( function()
        //   {
        //     var dst = [ 1, 2, 3 ];
        //     _.arrayReplaceArraysOnceStrictly( dst, [ [ 1, [ 2 ], 3 ] ], [ 0 ] );
        //   })
        //
        //   test.case = 'dstArray is not a longIs';
        //   test.shouldThrowErrorSync( function()
        //   {
        //     _.arrayReplaceArraysOnceStrictly( 1, [ [ 1 ] ], [ 1 ] );
        //   })
        //
        //   test.case = 'ins is not a longIs';
        //   test.shouldThrowErrorSync( function()
        //   {
        //     _.arrayReplaceArraysOnceStrictly( [ 1, 2 ], 1, [ 1 ] );
        //   })
        //
        //   test.case = 'ins must be array of arrays';
        //   test.shouldThrowErrorSync( function()
        //   {
        //     _.arrayReplaceArraysOnceStrictly( [ 1, 2 ],[ 1 ], [ 1 ] );
        //   })
        //
        //   test.case = 'onEqualize is not a routine';
        //   test.shouldThrowErrorSync( function()
        //   {
        //     _.arrayReplaceArraysOnceStrictly( [ 1, 2 ], [ [ 1 ] ], [ 1 ], 1 );
        //   })
        //
        //   test.case = 'ins and sub length are different';
        //   test.shouldThrowErrorSync( function()
        //   {
        //     _.arrayReplaceArraysOnceStrictly( [ 1 ], [ [ 1 ] ], [ 10, 20 ] );
        //   })
        //
        //   test.shouldThrowErrorSync( function()
        //   {
        //     _.arrayReplaceArraysOnceStrictly( [ 1 ], [ [ 1, 2 ] ], [ 10,20 ] );
        //   })
        //
        //   test.case = 'ins[ 0 ] and sub[ 0 ] length are different';
        //   test.shouldThrowErrorSync( function()
        //   {
        //     _.arrayReplaceArraysOnceStrictly( [ 1 ], [ [ 1 ] ], [ [ 10,20 ] ] );
        //   })
        // }
        //
        // //
        //
        // function arrayReplacedArraysOnce( test )
        // {
        //   test.case = 'replace elements from arrays from ins with relevant values from sub';
        //
        //   var dst = [];
        //   var got = _.arrayReplacedArraysOnce( dst, [ [] ], [ [] ] );
        //   test.identical( got, 0 );
        //   test.identical( dst, [] );
        //
        //   var dst = [ 1, 2, 3 ];
        //   var got = _.arrayReplacedArraysOnce( dst, [ [ 1 ] ], [ [ 3 ] ] );
        //   test.identical( got, 1 );
        //   test.identical( dst, [ 3, 2, 3 ] );
        //
        //   var dst = [ 1, 2, 3 ];
        //   var got = _.arrayReplacedArraysOnce( dst, [ [ 1 ], [ 2 ] ], [ [ 3 ],[ 3 ] ] );
        //   test.identical( got, 2 );
        //   test.identical( dst, [ 3, 3, 3 ] );
        //
        //   var dst = [ 1, 2, 3 ];
        //   var got = _.arrayReplacedArraysOnce( dst, [ [ 1 ], [ 2 ] ], [ [ 3 ], 3 ] );
        //   test.identical( got, 2 );
        //   test.identical( dst, [ 3, 3, 3 ] );
        //
        //   var dst = [ 1, 2, 3 ];
        //   var got = _.arrayReplacedArraysOnce( dst, [ [ 1 ], [ 2 ] ], [ 3, 3 ] );
        //   test.identical( got, 2 );
        //   test.identical( dst, [ 3, 3, 3 ] );
        //
        //   var dst = [ 1, 2, 3 ];
        //   var got = _.arrayReplacedArraysOnce( dst, [ [ 1, 2, 3 ] ], [ 3 ] );
        //   test.identical( got, 3 );
        //   test.identical( dst, [ 3, 3, 3 ] );
        //
        //   var dst = [ 1, 2, 3 ];
        //   var got = _.arrayReplacedArraysOnce( dst, [ [ 1, 2, 3 ] ], [ [ 3,3,3, ] ] );
        //   test.identical( got, 3 );
        //   test.identical( dst, [ 3, 3, 3 ] );
        //
        //   var dst = [ 1, 2, 3 ];
        //   var got = _.arrayReplacedArraysOnce( dst, [ [ 1, 2, 3 ] ], [ [ 3 ] ] );
        //   test.identical( got, 3 );
        //   test.identical( dst, [ 3, 3, 3 ] );
        //
        //   var dst = [ 1, 2, 3 ];
        //   var got = _.arrayReplacedArraysOnce( dst, [ [ 1 ], [ 2 ] ], [ [ 3 ], [ 4 ] ] );
        //   test.identical( got, 2 );
        //   test.identical( dst, [ 3, 4, 3 ] );
        //
        //   var dst = [ 1, 2, 3 ];
        //   var got = _.arrayReplacedArraysOnce( dst, [ [ [ 1 ] ] ], [ 0 ] );
        //   test.identical( dst, [ 1, 2, 3 ] );
        //   test.identical( got, 0 );
        //
        //   var dst = [ 1, 2, 3 ];
        //   var got = _.arrayReplacedArraysOnce( dst, [ [ 1, [ 2 ], 3 ] ], [ 0 ] );
        //   test.identical( dst, [ 0, 2, 0 ] );
        //   test.identical( got, 2 );
        //
        //   var dst = [ [ 1 ], [ 2 ], [ 3 ] ];
        //   function onEqualize( a, b )
        //   {
        //     return a[ 0 ] === b[ 0 ];
        //   }
        //   var got = _.arrayReplacedArraysOnce( dst, [ [ [ 1 ], [ 2 ], [ 3 ] ] ], [ [ [ 0 ] ] ], onEqualize );
        //   test.identical( dst, [ [ 0 ], [ 0 ], [ 0 ] ] );
        //   test.identical( got, 3 );
        //
        //   //
        //
        //   if( !Config.debug )
        //   return;
        //
        //   test.case = 'no arguments';
        //   test.shouldThrowErrorSync( function()
        //   {
        //     _.arrayReplacedArraysOnce();
        //   })
        //
        //   test.case = 'dstArray is not a longIs';
        //   test.shouldThrowErrorSync( function()
        //   {
        //     _.arrayReplacedArraysOnce( 1, [ [ 1 ] ], [ 1 ] );
        //   })
        //
        //   test.case = 'ins is not a longIs';
        //   test.shouldThrowErrorSync( function()
        //   {
        //     _.arrayReplacedArraysOnce( [ 1, 2 ], 1, [ 1 ] );
        //   })
        //
        //   test.case = 'ins must be array of arrays';
        //   test.shouldThrowErrorSync( function()
        //   {
        //     _.arrayReplacedArraysOnce( [ 1, 2 ],[ 1 ], [ 1 ] );
        //   })
        //
        //   test.case = 'onEqualize is not a routine';
        //   test.shouldThrowErrorSync( function()
        //   {
        //     _.arrayReplacedArraysOnce( [ 1, 2 ], [ [ 1 ] ], [ 1 ], 1 );
        //   })
        //
        //   test.case = 'ins and sub length are different';
        //   test.shouldThrowErrorSync( function()
        //   {
        //     _.arrayReplacedArraysOnce( [ 1 ], [ [ 1 ] ], [ 10, 20 ] );
        //   })
        //
        //   test.shouldThrowErrorSync( function()
        //   {
        //     _.arrayReplacedArraysOnce( [ 1 ], [ [ 1, 2 ] ], [ 10,20 ] );
        //   })
        //
        //   test.case = 'ins[ 0 ] and sub[ 0 ] length are different';
        //   test.shouldThrowErrorSync( function()
        //   {
        //     _.arrayReplacedArraysOnce( [ 1 ], [ [ 1 ] ], [ [ 10,20 ] ] );
        //   })
        // }
        //
        //
        //
        // function arrayReplaceAll( test )
        // {
        //   test.case = 'replace all ins with sub';
        //
        //   var dst = [];
        //   var got = _.arrayReplaceAll( dst, undefined, 0 );
        //   test.identical( got, [] );
        //
        //   var dst = [ 1, 1, 1 ];
        //   var got = _.arrayReplaceAll( dst, 1, 0 );
        //   test.identical( got, [ 0, 0, 0 ] );
        //
        //   var dst = [ 1, 2, 1 ];
        //   var got = _.arrayReplaceAll( dst, 1, 0 );
        //   test.identical( got, [ 0, 2, 0 ] );
        //
        //   var dst = [ 1, 2, 3 ];
        //   var got = _.arrayReplaceAll( dst, 4, 0 );
        //   test.identical( got, [ 1, 2, 3 ] );
        //
        //   function onEqualize( a, b )
        //   {
        //     return a.value === b;
        //   }
        //
        //   var dst = [ { value : 1 }, { value : 1 }, { value : 2 } ];
        //   var got = _.arrayReplaceAll( dst, 1, { value : 0 }, onEqualize );
        //   test.identical( got, [ { value : 0 }, { value : 0 }, { value : 2 } ] );
        //
        //   if( !Config.debug )
        //   return;
        //
        //   test.case = 'no args';
        //   test.shouldThrowErrorSync( function()
        //   {
        //     _.arrayReplaceAll( );
        //   });
        //
        //   test.case = 'first arg is not longIs';
        //   test.shouldThrowErrorSync( function()
        //   {
        //     _.arrayReplaceAll( 1, 1, 1 );
        //   });
        //
        //   test.case = 'fourth argument is not a routine';
        //   test.shouldThrowErrorSync( function()
        //   {
        //     _.arrayReplaceAll( 1, 1, 1, 1);
        //   });
        // }
        //
        // //
        //
        // function arrayReplacedAll( test )
        // {
        //   test.case = 'replace all ins with sub';
        //
        //   var dst = [];
        //   var got = _.arrayReplacedAll( dst, undefined, 0 );
        //   test.identical( got, 0 );
        //   test.identical( dst, [] );
        //
        //   var dst = [ 1, 1, 1 ];
        //   var got = _.arrayReplacedAll( dst, 1, 0 );
        //   test.identical( got, 3 );
        //   test.identical( dst, [ 0, 0, 0 ] );
        //
        //   var dst = [ 1, 2, 1 ];
        //   var got = _.arrayReplacedAll( dst, 1, 0 );
        //   test.identical( got, 2 );
        //   test.identical( dst, [ 0, 2, 0 ] );
        //
        //   var dst = [ 1, 2, 3 ];
        //   var got = _.arrayReplacedAll( dst, 4, 0 );
        //   test.identical( got, 0 );
        //   test.identical( dst, [ 1, 2, 3 ] );
        //
        //   function onEqualize( a, b )
        //   {
        //     return a.value === b;
        //   }
        //
        //   var dst = [ { value : 1 }, { value : 1 }, { value : 2 } ];
        //   var got = _.arrayReplacedAll( dst, 1, { value : 0 }, onEqualize );
        //   test.identical( got, 2 );
        //   test.identical( dst, [ { value : 0 }, { value : 0 }, { value : 2 } ] );
        //
        //   if( !Config.debug )
        //   return;
        //
        //   test.case = 'no args';
        //   test.shouldThrowErrorSync( function()
        //   {
        //     _.arrayReplacedAll( );
        //   });
        //
        //   test.case = 'first arg is not longIs';
        //   debugger;
        //   test.shouldThrowErrorSync( function()
        //   {
        //     debugger;
        //     _.arrayReplacedAll( 1, 1, 1 );
        //   });
        //   debugger;
        //
        //   test.case = 'fourth argument is not a routine';
        //   test.shouldThrowErrorSync( function()
        //   {
        //     _.arrayReplacedAll( 1, 1, 1, 1 );
        //   });
        //
        // }
        //
        ,
        // arrayReplaceAll,
        // arrayReplacedAll,
        arrayUpdate: function arrayUpdate(e) {
          e.case = "add a new element";
          var a = r.arrayUpdate([], 1, 1), n = 0;
          e.identical(a, n), e.case = "add a new element", a = r.arrayUpdate([ 1, 2, 3, 4, 5 ], 6, 6), 
          n = 5, e.identical(a, n), e.case = "add a new element", a = r.arrayUpdate([ "Petre", "Mikle", "Oleg" ], "Dmitry", "Dmitry"), 
          n = 3, e.identical(a, n), e.case = "change the fourth element", a = r.arrayUpdate([ !0, !0, !0, !0, !1 ], !1, !0), 
          n = 4, e.identical(a, n), e.case = "no arguments", e.shouldThrowErrorSync(function() {
            r.arrayUpdate();
          }), e.case = "not enough arguments", e.shouldThrowErrorSync(function() {
            r.arrayUpdate([ 1, 2, 3, 4, 5 ]);
          }), e.case = "extra argument", e.shouldThrowErrorSync(function() {
            r.arrayUpdate([ 1, 2, 3, 4, 5 ], 6, 6, "redundant argument");
          }), e.case = "arguments[0] is wrong", e.shouldThrowErrorSync(function() {
            r.arrayUpdate("wrong argument", 6, 6);
          });
        }
        // --
        // array set
        // --
        ,
        // array set
        arraySetDiff: function arraySetDiff(e) {
          e.case = "first argument has single extra element, second argument has single extra element either";
          var a = [ 1, 2, 3, 4, 15 ], n = [ 1, 2, 3, 4, 5 ], i = r.arraySetDiff(a, n), t = [ 15, 5 ];
          e.identical(i, t), e.is(i !== a), e.is(i !== n), e.case = "first argument is an empty array", 
          a = [], n = [ 1, 2, 3, 4 ], i = r.arraySetDiff(a, n), t = [ 1, 2, 3, 4 ], e.identical(i, t), 
          e.is(i !== a), e.is(i !== n), e.case = "second argument is an empty array", a = [ 1, 2, 3, 4 ], 
          n = [], i = r.arraySetDiff(a, n), t = [ 1, 2, 3, 4 ], e.identical(i, t), e.is(i !== a), 
          e.is(i !== n), e.case = "both arguments are empty arrays", a = [], n = [], i = r.arraySetDiff(a, n), 
          t = [], e.identical(i, t), e.is(i !== a), e.is(i !== n), e.case = "all of the elements is present in both arrays", 
          a = [ 3, 3, 3 ], n = [ 3, 3, 3, 3 ], i = r.arraySetDiff(a, n), t = [], e.identical(i, t), 
          e.is(i !== a), e.is(i !== n), 
          /* */
          e.case = "extra";
          for (var c = [ {
            src1: [],
            src2: [],
            expected: []
          }, {
            src1: [ 1, 2, 3 ],
            src2: [],
            expected: [ 1, 2, 3 ]
          }, {
            src1: [],
            src2: [ 1, 2, 3 ],
            expected: [ 1, 2, 3 ]
          }, {
            src1: [ 1, 2, 3 ],
            src2: [ 4, 5, 6 ],
            expected: [ 1, 2, 3, 4, 5, 6 ]
          }, {
            src1: [ 1, 2, 3 ],
            src2: [ 3, 4, 5 ],
            expected: [ 1, 2, 4, 5 ]
          }, {
            src1: [ 1, 1, 2, 2, 3, 3 ],
            src2: [ 1, 2, 3 ],
            expected: []
          }, {
            src1: [ 1, 1, 2, 3, 3 ],
            src2: [ 3, 3, 4, 5, 5 ],
            expected: [ 1, 1, 2, 4, 5, 5 ]
          }, {
            src1: 1,
            src2: 1,
            error: !0
          } ], l = 0; l < c.length; l++) {
            var o = c[l];
            o.error ? e.shouldThrowErrorSync(() => r.arraySetDiff(o.src1, o.src2)) : e.identical(r.arraySetDiff(o.src1, o.src2), o.expected);
          }
          /* */          e.case = "no arguments", e.shouldThrowErrorSync(function() {
            r.arraySetDiff();
          }), e.case = "too few arguments", e.shouldThrowErrorSync(function() {
            r.arraySetDiff([ 1, 2, 3, 4 ]);
          }), e.case = "too many arguments", e.shouldThrowErrorSync(function() {
            r.arraySetDiff([ 1, 2, 3, 4 ], [ 5, 7, 8, 9 ], [ 13, 15, 17 ]);
          }), e.case = "one or both arguments are not longIs entities, numeric arguments", 
          e.shouldThrowErrorSync(function() {
            r.arraySetDiff(10, 15);
          }), e.case = "one or both arguments are not longIs entities, string like arguments", 
          e.shouldThrowErrorSync(function() {
            r.arraySetDiff("a", "c");
          }), e.case = "one or both arguments are not longIs entities, map arguments", e.shouldThrowErrorSync(function() {
            r.arraySetDiff({
              a: 1
            }, {
              b: 3,
              c: 8
            });
          }), e.case = "wrong argument", e.shouldThrowErrorSync(function() {
            r.arraySetDiff([ 1, 2, 3 ], "wrong argument");
          }), e.case = "both arguments are null", e.shouldThrowErrorSync(function() {
            r.arraySetDiff(null, null);
          }), e.case = "both arguments are undefined", e.shouldThrowErrorSync(function() {
            r.arraySetDiff(void 0, void 0);
          });
        }
        //
        ,
        arraySetBut: function arraySetBut(e) {
          e.case = "first argument has single extra element, second argument has single extra element either";
          var a = [ 1, 2, 3, 4, 15 ], n = [ 1, 2, 3, 4, 5 ], i = r.arraySetBut(a, n), t = [ 15 ];
          e.identical(i, t), e.is(i === a), e.is(i !== n), e.case = "first argument has single extra element, second argument has single extra element either", 
          a = [ 1, 2, 3, 4, 15 ], n = [ 1, 2, 3, 4, 5 ], i = r.arraySetBut(null, a, n), t = [ 15 ], 
          e.identical(i, t), e.is(i !== a), e.is(i !== n), e.case = "first argument has several elements that are not present in second argument", 
          a = [ 1, 4, 9 ], n = [ 2, 5 ], i = r.arraySetBut(a, n), t = [ 1, 4, 9 ], e.identical(i, t), 
          e.is(i === a), e.is(i !== n), e.case = "first argument has several elements that are not present in second argument", 
          a = [ 1, 4, 9 ], n = [ 2, 5 ], i = r.arraySetBut(null, a, n), t = [ 1, 4, 9 ], e.identical(i, t), 
          e.is(i !== a), e.is(i !== n), e.case = "first argument is the same as second", a = [ 1, 2, 3, 4 ], 
          n = [ 1, 2, 3, 4 ], i = r.arraySetBut(a, n), t = [], e.identical(i, t), e.is(i === a), 
          e.is(i !== n), e.case = "first argument is the same as second", a = [ 1, 2, 3, 4 ], 
          n = [ 1, 2, 3, 4 ], i = r.arraySetBut(null, a, n), t = [], e.identical(i, t), e.is(i !== a), 
          e.is(i !== n), e.case = "first argument is an empty array", a = [], n = [ 1, 2, 3, 4 ], 
          i = r.arraySetBut(a, n), t = [], e.identical(i, t), e.is(i === a), e.is(i !== n), 
          e.case = "first argument is an empty array", a = [], n = [ 1, 2, 3, 4 ], i = r.arraySetBut(null, a, n), 
          t = [], e.identical(i, t), e.is(i !== a), e.is(i !== n), e.case = "second argument is an empty array", 
          a = [ 1, 2, 3, 4 ], n = [], i = r.arraySetBut(a, n), t = [ 1, 2, 3, 4 ], e.identical(i, t), 
          e.is(i === a), e.is(i !== n), e.case = "second argument is an empty array", a = [ 1, 2, 3, 4 ], 
          n = [], i = r.arraySetBut(null, a, n), t = [ 1, 2, 3, 4 ], e.identical(i, t), e.is(i !== a), 
          e.is(i !== n), e.case = "first array has the same element as the second ", a = [ 1, 1, 1 ], 
          n = [ 1 ], i = r.arraySetBut(a, n), t = [], e.identical(i, t), e.is(i === a), e.is(i !== n), 
          e.case = "first array has the same element as the second ", a = [ 1, 1, 1 ], n = [ 1 ], 
          i = r.arraySetBut(null, a, n), t = [], e.identical(i, t), e.is(i !== a), e.is(i !== n), 
          e.case = "both arguments are empty arrays", a = [], n = [], i = r.arraySetBut(a, n), 
          t = [], e.identical(i, t), e.is(i === a), e.is(i !== n), e.case = "both arguments are empty arrays", 
          a = [], n = [], i = r.arraySetBut(null, a, n), t = [], e.identical(i, t), e.is(i !== a), 
          e.is(i !== n), e.case = "single empty argument", a = [], i = r.arraySetBut(a), t = [], 
          e.identical(i, t), e.is(i === a), e.case = "single empty argument", a = [], i = r.arraySetBut(null, a), 
          t = [], e.identical(i, t), e.is(i !== a), e.case = "single not empty argument", 
          a = [ 3, 4, 5 ], i = r.arraySetBut(a), t = [ 3, 4, 5 ], e.identical(i, t), e.is(i === a), 
          e.case = "single not empty argument", a = [ 3, 4, 5 ], i = r.arraySetBut(null, a), 
          t = [ 3, 4, 5 ], e.identical(i, t), e.is(i !== a), e.case = "three arguments, same elements", 
          a = [ 3, 4, 5 ], n = [ 3, 4, 5 ];
          var c = [ 3, 4, 5 ];
          i = r.arraySetBut(a, n, c), t = [], e.identical(i, t), e.is(i === a), e.is(i !== n), 
          e.is(i !== c), e.case = "three arguments, same elements", a = [ 3, 4, 5 ], n = [ 3, 4, 5 ], 
          c = [ 3, 4, 5 ], i = r.arraySetBut(null, a, n, c), t = [], e.identical(i, t), e.is(i !== a), 
          e.is(i !== n), e.is(i !== c), e.case = "three arguments, differet elements", a = [ 3, 4, 5 ], 
          n = [ 5 ], c = [ 3 ], i = r.arraySetBut(a, n, c), t = [ 4 ], e.identical(i, t), 
          e.is(i === a), e.is(i !== n), e.is(i !== c), e.case = "three arguments, differet elements", 
          a = [ 3, 4, 5 ], n = [ 5 ], c = [ 3 ], i = r.arraySetBut(null, a, n, c), t = [ 4 ], 
          e.identical(i, t), e.is(i !== a), e.is(i !== n), e.is(i !== c), e.case = "three arguments, no elements in the second and third", 
          a = [ 3, 4, 5 ], n = [], c = [], i = r.arraySetBut(a, n, c), t = [ 3, 4, 5 ], e.identical(i, t), 
          e.is(i === a), e.is(i !== n), e.is(i !== c), e.case = "three arguments, no elements in the second and third", 
          a = [ 3, 4, 5 ], n = [], c = [], i = r.arraySetBut(null, a, n, c), t = [ 3, 4, 5 ], 
          e.identical(i, t), e.is(i !== a), e.is(i !== n), e.is(i !== c), e.case = "three arguments, no elements in the first", 
          a = [], n = [ 3, 4, 5 ], c = [ 3, 4, 5 ], i = r.arraySetBut(a, n, c), t = [], e.identical(i, t), 
          e.is(i === a), e.is(i !== n), e.is(i !== c), e.case = "three arguments, no elements in the first", 
          a = [], n = [ 3, 4, 5 ], c = [ 3, 4, 5 ], i = r.arraySetBut(null, a, n, c), t = [], 
          e.identical(i, t), e.is(i !== a), e.is(i !== n), e.is(i !== c), e.case = "complex case", 
          i = r.arraySetBut([ 1, 10, 0, 5 ], [ 5, 8, 2 ], [ 3, 1, 6, 4 ], [ 0 ]), t = [ 10 ], 
          e.identical(i, t), e.case = "1 argument, repeats", a = [ 1, 1, 1, 3, 4, 15 ], i = r.arraySetBut(null, a), 
          t = [ 1, 1, 1, 3, 4, 15 ], e.identical(i, t), e.is(i !== a), e.is(i !== n), e.is(i !== c), 
          e.case = "1 argument, repeats", a = [ 1, 1, 1, 3, 4, 15 ], i = r.arraySetBut(a), 
          t = [ 1, 1, 1, 3, 4, 15 ], e.identical(i, t), e.is(i === a), e.is(i !== n), e.is(i !== c), 
          e.case = "1 null", i = r.arraySetBut(null), t = [], e.identical(i, t);
          for (
          /* */
          var l = [ {
            src: [],
            but: [],
            expected: []
          }, {
            src: [ 1, 2, 3 ],
            but: [],
            expected: [ 1, 2, 3 ]
          }, {
            src: [],
            but: [ 1, 2, 3 ],
            expected: []
          }, {
            src: [ 1, 1, 1 ],
            but: [ 1 ],
            expected: []
          }, {
            src: [ 1, 2, 3 ],
            but: [ 3, 2, 1 ],
            expected: []
          }, {
            src: [ 1, 2, 3 ],
            but: [ 3 ],
            expected: [ 1, 2 ]
          }, {
            src: [ 1, 2, 3 ],
            but: [ 4, 5, 6 ],
            expected: [ 1, 2, 3 ]
          }, {
            src: 1,
            but: 1,
            error: !0
          } ], o = 0; o < l.length; o++) (c = l[o]).error ? e.shouldThrowErrorSync(() => r.arraySetBut(c.src, c.but)) : e.identical(r.arraySetBut(c.src, c.but), c.expected);
          /* */          
          /* bad arguments */
          e.case = "not array", e.shouldThrowErrorSync(function() {
            r.arraySetBut("3");
          }), e.case = "no arguments, the count of arguments doesn't match 2", e.shouldThrowErrorSync(function() {
            r.arraySetBut();
          }), e.case = "one or both arguments are not longIs entities, numerical arguments", 
          e.shouldThrowErrorSync(function() {
            r.arraySetBut(5, 8);
          }), e.case = "one or both arguments are not longIs entities, string like arguments", 
          e.shouldThrowErrorSync(function() {
            r.arraySetBut("a", "c");
          }), e.case = "one or both arguments are not longIs entities, map like arguments", 
          e.shouldThrowErrorSync(function() {
            r.arraySetBut({
              a: 1
            }, {
              b: 3,
              c: 8
            });
          }), e.case = "wrong argument", e.shouldThrowErrorSync(function() {
            r.arraySetBut([ 1, 2, 3 ], "wrong argument");
          }), e.case = "both arguments are null", e.shouldThrowErrorSync(function() {
            r.arraySetBut(null, null);
          }), e.case = "both arguments are undefined", e.shouldThrowErrorSync(function() {
            r.arraySetBut(void 0, void 0);
          });
        }
        //
        ,
        arraySetIntersection: function arraySetIntersection(e) {
          e.case = "second argument has extra element, third argument has two extra elements";
          var a = [ 1, 2, 3, 4, 15 ], n = [ 1, 2, 3, 4, 5 ], i = r.arraySetIntersection(a, n), t = [ 1, 2, 3, 4 ];
          e.identical(i, t), e.is(i === a), e.is(i !== n), e.case = "second argument has extra element, third argument has two extra elements", 
          a = [ 1, 2, 3, 4, 15 ], n = [ 1, 2, 3, 4, 5 ], i = r.arraySetIntersection(null, a, n), 
          t = [ 1, 2, 3, 4 ], e.identical(i, t), e.is(i !== a), e.is(i !== n), e.case = "single array argument", 
          a = [ 1, 2, 3, 4, 15 ], i = r.arraySetIntersection(a), t = [ 1, 2, 3, 4, 15 ], e.identical(i, t), 
          e.is(i === a), e.case = "single array argument", a = [ 1, 2, 3, 4, 15 ], i = r.arraySetIntersection(null, a), 
          t = [ 1, 2, 3, 4, 15 ], e.identical(i, t), e.is(i !== a), e.case = "first argument is an empty array", 
          a = [], n = [ 1, 2, 3, 4, 15 ], i = r.arraySetIntersection(a, n), t = [], e.identical(i, t), 
          e.is(i === a), e.is(i !== n), e.case = "first argument is an empty array", a = [], 
          n = [ 1, 2, 3, 4, 15 ], i = r.arraySetIntersection(null, a, n), t = [], e.identical(i, t), 
          e.is(i !== a), e.is(i !== n), e.case = "first and second argument are empty arrays", 
          a = [], n = [], i = r.arraySetIntersection(a, n), t = [], e.identical(i, t), e.is(i === a), 
          e.is(i !== n), e.case = "first and second argument are empty arrays", a = [], n = [], 
          i = r.arraySetIntersection(null, a, n), t = [], e.identical(i, t), e.is(i !== a), 
          e.is(i !== n), e.case = "3 arguments, nothing in common", a = [ 1, 2, 3, 4, 15 ], 
          n = [ 1, 2, 3, 4, 5 ];
          var c = [ 15, 16, 17 ];
          i = r.arraySetIntersection(a, n, c), t = [], e.identical(i, t), e.is(i === a), e.is(i !== n), 
          e.is(i !== c), e.case = "3 arguments, nothing in common", a = [ 1, 2, 3, 4, 15 ], 
          n = [ 1, 2, 3, 4, 5 ], c = [ 15, 16, 17 ], i = r.arraySetIntersection(null, a, n, c), 
          t = [], e.identical(i, t), e.is(i !== a), e.is(i !== n), e.is(i !== c), e.case = "3 arguments, something in common", 
          a = [ 1, 2, 3, 4, 15 ], n = [ 1, 2, 3, 4, 5 ], c = [ 3, 15, 16, 17, 1 ], i = r.arraySetIntersection(null, a, n, c), 
          t = [ 1, 3 ], e.identical(i, t), e.is(i !== a), e.is(i !== n), e.is(i !== c), e.case = "3 arguments, something in common", 
          a = [ 1, 2, 3, 4, 15 ], n = [ 3 ], c = [ 1, 3 ], i = r.arraySetIntersection(null, a, n, c), 
          t = [ 3 ], e.identical(i, t), e.is(i !== a), e.is(i !== n), e.is(i !== c), e.case = "3 arguments, repeats", 
          a = [ 1, 1, 1, 3, 4, 15 ], n = [ 3, 1 ], c = [ 1, 3 ], i = r.arraySetIntersection(null, a, n, c), 
          t = [ 1, 1, 1, 3 ], e.identical(i, t), e.is(i !== a), e.is(i !== n), e.is(i !== c), 
          e.case = "1 argument, repeats", a = [ 1, 1, 1, 3, 4, 15 ], i = r.arraySetIntersection(null, a), 
          t = [ 1, 1, 1, 3, 4, 15 ], e.identical(i, t), e.is(i !== a), e.is(i !== n), e.is(i !== c), 
          e.case = "1 argument, repeats", a = [ 1, 1, 1, 3, 4, 15 ], i = r.arraySetIntersection(a), 
          t = [ 1, 1, 1, 3, 4, 15 ], e.identical(i, t), e.is(i === a), e.is(i !== n), e.is(i !== c), 
          e.case = "1 null", i = r.arraySetIntersection(null), t = [], e.identical(i, t);
          for (
          /* extra */
          var l = [ {
            args: [ [] ],
            expected: []
          }, {
            args: [ [ 1 ], [] ],
            expected: []
          }, {
            args: [ [], [ 1 ] ],
            expected: []
          }, {
            args: [ [ 1 ], [ 2 ] ],
            expected: []
          }, {
            args: [ [ 1, 2, 3 ], [ 2 ] ],
            expected: [ 2 ]
          }, {
            args: [ [ 1, 2, 3 ], [ 2 ], [ 1 ], [ 3 ] ],
            expected: []
          }, {
            args: [ [ 1, 1, 1 ], [ 1 ] ],
            expected: [ 1, 1, 1 ]
          }, {
            args: [ [ 1, 2, 3 ], [ 0 ], [ 4 ], [ 0, 0, 3 ] ],
            expected: []
          }, {
            args: [ [ 1, 2, 3 ], [ 0 ], 1, [ 3 ] ],
            error: !0
          }, {
            args: [ 1 ],
            error: !0
          } ], o = 0; o < l.length; o++) (c = l[o]).error ? e.shouldThrowErrorSync(() => r.arraySetIntersection.apply(r, c.args)) : e.identical(r.arraySetIntersection.apply(r, c.args), c.expected);
          /* */          e.case = "no arguments", e.shouldThrowErrorSync(function() {
            r.arraySetIntersection();
          }), e.case = "one or several arguments are not longIs entities, numerical arguments", 
          e.shouldThrowErrorSync(function() {
            r.arraySetIntersection(10, 15, 25);
          }), e.case = "one or both arguments are not longIs entities, string like arguments", 
          e.shouldThrowErrorSync(function() {
            r.arraySetIntersection("a", "c");
          }), e.case = "one or both arguments are not longIs entities, map arguments", e.shouldThrowErrorSync(function() {
            r.arraySetIntersection({
              a: 1
            }, {
              b: 3,
              c: 8
            });
          }), e.case = "wrong argument", e.shouldThrowErrorSync(function() {
            r.arraySetIntersection([ 1, 2, 3 ], "wrong argument");
          }), e.case = "one or more arguments are null", e.shouldThrowErrorSync(function() {
            r.arraySetIntersection(null, null);
          }), e.case = "one or more arguments are undefined", e.shouldThrowErrorSync(function() {
            r.arraySetIntersection(void 0, void 0);
          });
        }
        //
        ,
        arraySetUnion: function arraySetUnion(e) {
          e.case = "second argument has extra element, third argument has two extra elements";
          var a = [ 1, 2, 3, 4, 15 ], n = [ 1, 2, 3, 4, 5 ], i = r.arraySetUnion(a, n), t = [ 1, 2, 3, 4, 15, 5 ];
          e.identical(i, t), e.is(i === a), e.is(i !== n), e.case = "second argument has extra element, third argument has two extra elements", 
          a = [ 1, 2, 3, 4, 15 ], n = [ 1, 2, 3, 4, 5 ], i = r.arraySetUnion(null, a, n), 
          t = [ 1, 2, 3, 4, 15, 5 ], e.identical(i, t), e.is(i !== a), e.is(i !== n), e.case = "single array argument", 
          a = [ 1, 2, 3, 4, 15 ], i = r.arraySetUnion(a), t = [ 1, 2, 3, 4, 15 ], e.identical(i, t), 
          e.is(i === a), e.case = "single array argument", a = [ 1, 2, 3, 4, 15 ], i = r.arraySetUnion(null, a), 
          t = [ 1, 2, 3, 4, 15 ], e.identical(i, t), e.is(i !== a), e.case = "first argument is an empty array", 
          a = [], n = [ 1, 2, 3, 4, 15 ], i = r.arraySetUnion(a, n), t = [ 1, 2, 3, 4, 15 ], 
          e.identical(i, t), e.is(i === a), e.is(i !== n), e.case = "first argument is an empty array", 
          a = [], n = [ 1, 2, 3, 4, 15 ], i = r.arraySetUnion(null, a, n), t = [ 1, 2, 3, 4, 15 ], 
          e.identical(i, t), e.is(i !== a), e.is(i !== n), e.case = "first and second argument are empty arrays", 
          a = [], n = [], i = r.arraySetUnion(a, n), t = [], e.identical(i, t), e.is(i === a), 
          e.is(i !== n), e.case = "first and second argument are empty arrays", a = [], n = [], 
          i = r.arraySetUnion(null, a, n), t = [], e.identical(i, t), e.is(i !== a), e.is(i !== n), 
          e.case = "3 arguments, nothing in common", a = [ 1, 2, 3, 4, 15 ], n = [ 1, 2, 3, 4, 5 ];
          var c = [ 15, 16, 17 ];
          i = r.arraySetUnion(a, n, c), t = [ 1, 2, 3, 4, 15, 5, 16, 17 ], e.identical(i, t), 
          e.is(i === a), e.is(i !== n), e.is(i !== c), e.case = "3 arguments, nothing in common", 
          a = [ 1, 2, 3, 4, 15 ], n = [ 1, 2, 3, 4, 5 ], c = [ 15, 16, 17 ], i = r.arraySetUnion(null, a, n, c), 
          t = [ 1, 2, 3, 4, 15, 5, 16, 17 ], e.identical(i, t), e.is(i !== a), e.is(i !== n), 
          e.is(i !== c), e.case = "3 arguments, something in common", a = [ 1, 2, 3, 4, 15 ], 
          n = [ 1, 2, 3, 4, 5 ], c = [ 3, 15, 16, 17, 1 ], i = r.arraySetUnion(null, a, n, c), 
          t = [ 1, 2, 3, 4, 15, 5, 16, 17 ], e.identical(i, t), e.is(i !== a), e.is(i !== n), 
          e.is(i !== c), e.case = "3 arguments, something in common", a = [ 1, 2, 3, 4, 15 ], 
          n = [ 3 ], c = [ 1, 3 ], i = r.arraySetUnion(null, a, n, c), t = [ 1, 2, 3, 4, 15 ], 
          e.identical(i, t), e.is(i !== a), e.is(i !== n), e.is(i !== c), e.case = "3 arguments, repeats", 
          a = [ 1, 1, 1, 3, 4, 15 ], n = [ 3, 1 ], c = [ 1, 3 ], i = r.arraySetUnion(null, a, n, c), 
          t = [ 1, 3, 4, 15 ], e.identical(i, t), e.is(i !== a), e.is(i !== n), e.is(i !== c), 
          e.case = "1 argument, repeats", a = [ 1, 1, 1, 3, 4, 15 ], i = r.arraySetUnion(null, a), 
          t = [ 1, 3, 4, 15 ], e.identical(i, t), e.is(i !== a), e.is(i !== n), e.is(i !== c), 
          e.case = "1 argument, repeats", a = [ 1, 1, 1, 3, 4, 15 ], i = r.arraySetUnion(a), 
          t = [ 1, 1, 1, 3, 4, 15 ], e.identical(i, t), e.is(i === a), e.is(i !== n), e.is(i !== c), 
          e.case = "1 null", i = r.arraySetUnion(null), t = [], e.identical(i, t), e.case = "no arguments", 
          e.shouldThrowErrorSync(function() {
            r.arraySetUnion();
          }), e.case = "one or several arguments are not longIs entities, numerical arguments", 
          e.shouldThrowErrorSync(function() {
            r.arraySetUnion(10, 15, 25);
          }), e.case = "one or both arguments are not longIs entities, string like arguments", 
          e.shouldThrowErrorSync(function() {
            r.arraySetUnion("a", "c");
          }), e.case = "one or both arguments are not longIs entities, map arguments", e.shouldThrowErrorSync(function() {
            r.arraySetUnion({
              a: 1
            }, {
              b: 3,
              c: 8
            });
          }), e.case = "wrong argument", e.shouldThrowErrorSync(function() {
            r.arraySetUnion([ 1, 2, 3 ], "wrong argument");
          }), e.case = "one or more arguments are null", e.shouldThrowErrorSync(function() {
            r.arraySetUnion(null, null);
          }), e.case = "one or more arguments are undefined", e.shouldThrowErrorSync(function() {
            r.arraySetUnion(void 0, void 0);
          });
        }
        //
        ,
        arraySetContainAll: function arraySetContainAll(e) {
          e.case = "1 argument, empty";
          var a = [], n = r.arraySetContainAll(a), i = !0;
          e.identical(n, i), e.case = "1 argument, repeats", a = [ 1, 1, 1, 3, 4, 15 ], n = r.arraySetContainAll(a), 
          i = !0, e.identical(n, i), e.case = "2 arguments, empty", a = [];
          var t = [];
          n = r.arraySetContainAll(a, t), i = !0, e.identical(n, i), e.case = "2 arguments, src empty", 
          a = [], t = [ 1 ], n = r.arraySetContainAll(a, t), i = !1, e.identical(n, i), e.case = "2 arguments, ins empty", 
          a = [ 1 ], t = [], n = r.arraySetContainAll(a, t), i = !0, e.identical(n, i), e.case = "bigger second argument", 
          a = [ 1, 3 ], t = [ 1, 1, 1, 1 ], n = r.arraySetContainAll(a, t), i = !0, e.identical(n, i), 
          e.case = "bigger third argument", a = [ 1, 3 ], t = [ 1, 1 ];
          var c = [ 1, 1, 1, 1 ];
          n = r.arraySetContainAll(a, t, c), i = !0, e.identical(n, i), e.case = "4 arguments", 
          a = [ 1, 2, 3, 4 ], t = [ 1 ], c = [ 3, 1 ];
          var l = [ 4, 1, 3, 2 ];
          n = r.arraySetContainAll(a, t, c, l), i = !0, e.identical(n, i), e.case = "one argument have redundant element", 
          a = [ 1, 2, 3, 4 ], t = [ 0 ], c = [ 3, 1 ], l = [ 4, 1, 3, 2 ], n = r.arraySetContainAll(a, t, c, l), 
          i = !1, e.identical(n, i), e.case = "one argument have redundant element", a = [ 1, 2, 3, 4 ], 
          t = [ 1 ], c = [ 0, 1 ], l = [ 4, 1, 3, 2 ], n = r.arraySetContainAll(a, t, c, l), 
          i = !1, e.identical(n, i), e.case = "one argument have redundant element", a = [ 1, 2, 3, 4 ], 
          t = [ 1 ], c = [ 3, 0 ], l = [ 4, 1, 3, 2 ], n = r.arraySetContainAll(a, t, c, l), 
          i = !1, e.identical(n, i), e.case = "one argument have redundant element", a = [ 1, 2, 3, 4 ], 
          t = [ 1 ], c = [ 3, 1 ], l = [ 4, 1, 0, 2 ], n = r.arraySetContainAll(a, t, c, l), 
          i = !1, e.identical(n, i), e.case = "Second argument contains all the same values as in the (src), and new ones", 
          a = [ 1, "b", "c", 4 ], t = [ 1, 2, 3, 4, 5, "b", "c" ], n = r.arraySetContainAll(a, t), 
          i = !1, e.identical(n, i), e.is(n !== a), e.is(n !== t), e.case = "length of the first argument is more than second argument", 
          a = [ 1, 2, 3, 4, 5 ], t = [ 1, 2, 3, 4 ], n = r.arraySetContainAll(a, t), i = !0, 
          e.identical(n, i), e.is(n !== a), e.is(n !== t), e.case = "length of the first argument is more than second argument", 
          a = [ "abc", "def", !0, 26 ], t = [ 1, 2, 3, 4 ], c = [ 26, "abc", "def", !0 ], 
          n = r.arraySetContainAll(a, t, c), i = !1, e.identical(n, i), e.is(n !== a), e.is(n !== t), 
          e.is(n !== c), e.case = "second argument is an empty array", a = [ 1, 2, 3 ], t = [], 
          n = r.arraySetContainAll(a, t), i = !0, e.identical(n, i), e.is(n !== a), e.is(n !== t), 
          e.case = "first argument is an empty array", a = [], t = [ 1, 2, 3 ], n = r.arraySetContainAll(a, t), 
          i = !1, e.identical(n, i), e.is(n !== a), e.is(n !== t), e.case = "both arguments are empty", 
          a = [], t = [], n = r.arraySetContainAll(a, t), i = !0, e.identical(n, i), e.is(n !== a), 
          e.is(n !== t);
          for (
          /* */
          var o = [ {
            args: [ [], [] ],
            expected: !0
          }, {
            args: [ [ 1 ], [] ],
            expected: !0
          }, {
            args: [ [ 1 ], [ 1 ] ],
            expected: !0
          }, {
            args: [ [ 1, 1 ], [ 1, 1, 1 ] ],
            expected: !0
          }, {
            args: [ [ 1, 1, 1 ], [ 1, 1 ] ],
            expected: !0
          }, {
            args: [ [ 1 ], [ 1 ], [ 1 ], [] ],
            expected: !0
          }, {
            args: [ [ 1 ], [ 1 ], [ 1 ], [ 1, 1, 1 ] ],
            expected: !0
          }, {
            args: [ [ 1 ], [ 0, 1 ], [ 3, 2, 1 ], [ 1 ] ],
            expected: !1
          }, {
            args: [ [ 1, 2, 3 ], [ 1, 2, 3 ], [ 3, 2, 1 ], [ 1, 2 ] ],
            expected: !0
          }, {
            args: [ [], [ 1, 2, 3 ], [ 3, 2, 1 ], [ 1, 2 ] ],
            expected: !1
          }, {
            args: [ [], 1, [ 3, 2, 1 ], [ 1, 2 ] ],
            error: !0
          }, {
            args: [ 1 ],
            error: !0
          } ], s = 0; s < o.length; s++) {
            var d = o[s];
            console.log(r.toStr(d, {
              levels: 3
            })), d.error ? e.shouldThrowErrorSync(() => r.arraySetContainAll.apply(r, d.args)) : e.identical(r.arraySetContainAll.apply(r, d.args), d.expected);
          }
          /* special cases */          e.case = "no arguments", e.shouldThrowErrorSync(function() {
            r.arraySetContainAll();
          }), e.case = "one or both arguments are not longIs entities, numerical arguments", 
          e.shouldThrowErrorSync(function() {
            r.arraySetContainAll(5, 8);
          }), e.case = "one or both arguments are not longIs entities, string like arguments", 
          e.shouldThrowErrorSync(function() {
            r.arraySetContainAll("a", "c");
          }), e.case = "one or both arguments are not longIs entities, map like arguments", 
          e.shouldThrowErrorSync(function() {
            r.arraySetContainAll({
              a: 1,
              b: 2
            }, {
              c: 3
            });
          }), e.case = "wrong arguments", e.shouldThrowErrorSync(function() {
            r.arraySetContainAll([ 1, 2, 3, 4 ], "wrong arguments");
          }), e.case = "both arguments are null", e.shouldThrowErrorSync(function() {
            r.arraySetContainAll(null, null);
          }), e.case = "both arguments are undefined", e.shouldThrowErrorSync(function() {
            r.arraySetContainAll(void 0, void 0);
          });
        }
        //
        ,
        arraySetContainAny: function arraySetContainAny(e) {
          e.case = "1 argument, empty";
          var a = [], n = r.arraySetContainAny(a), i = !0;
          e.identical(n, i), e.case = "1 argument, repeats", a = [ 1, 1, 1, 3, 4, 15 ], n = r.arraySetContainAny(a), 
          i = !0, e.identical(n, i), e.case = "2 arguments, empty", a = [];
          var t = [];
          n = r.arraySetContainAny(a, t), i = !0, e.identical(n, i), e.case = "2 arguments, src empty", 
          a = [], t = [ 1 ], n = r.arraySetContainAny(a, t), i = !0, e.identical(n, i), e.case = "2 arguments, ins empty", 
          a = [ 1 ], t = [], n = r.arraySetContainAny(a, t), i = !1, e.identical(n, i), e.case = "bigger second argument", 
          a = [ 1, 3 ], t = [ 1, 1, 1, 1 ];
          debugger;
          n = r.arraySetContainAny(a, t), i = !0, e.identical(n, i), e.case = "bigger third argument", 
          a = [ 1, 3 ], t = [ 1, 1 ];
          var c = [ 1, 1, 1, 1 ];
          n = r.arraySetContainAny(a, t, c), i = !0, e.identical(n, i), e.case = "3 arguments, the first is empty", 
          a = [], t = [ 1 ], c = [ 2, 3 ], n = r.arraySetContainAny(a, t, c), i = !0, e.identical(n, i), 
          e.case = "4 arguments", a = [ 1, 2, 3, 4 ], t = [ 1 ], c = [ 3, 1 ];
          var l = [ 4, 1, 3, 2 ];
          n = r.arraySetContainAny(a, t, c, l), i = !0, e.identical(n, i), e.case = "one argument have redundant element", 
          a = [ 1, 2, 3, 4 ], t = [ 0 ], c = [ 3, 1 ], l = [ 4, 1, 3, 2 ], n = r.arraySetContainAny(a, t, c, l), 
          i = !1, e.identical(n, i), e.case = "one argument have redundant element", a = [ 1, 2, 3, 4 ], 
          t = [ 1 ], c = [ 0, 1 ], l = [ 4, 1, 3, 2 ], n = r.arraySetContainAny(a, t, c, l), 
          i = !0, e.identical(n, i), e.case = "one argument have redundant element", a = [ 1, 2, 3, 4 ], 
          t = [ 1 ], c = [ 3, 0 ], l = [ 4, 1, 3, 2 ], n = r.arraySetContainAny(a, t, c, l), 
          i = !0, e.identical(n, i), e.case = "one argument have redundant element", a = [ 1, 2, 3, 4 ], 
          t = [ 1 ], c = [ 3, 1 ], l = [ 4, 1, 0, 2 ], n = r.arraySetContainAny(a, t, c, l), 
          i = !0, e.identical(n, i), e.case = "second and third arrays contains several values from (src) array", 
          a = [ 33, 4, 5, "b", "c" ], t = [ 1, "b", "c", 4 ], c = [ 33, 13, 3 ], n = r.arraySetContainAny(a, t, c), 
          i = !0, e.identical(n, i), e.is(n !== a), e.is(n !== t), e.is(n !== c), e.case = "second array is empty, third array contains elements from (src) array", 
          a = [ 33, 4, 5, "b", "c" ], t = [], c = [ 33 ], n = r.arraySetContainAny(a, t, c), 
          i = !1, e.identical(n, i), e.is(n !== a), e.is(n !== t), e.is(n !== c), e.case = "second and third arrays doesn't contains matching elemets from (src) array", 
          a = [ 33, 4, 5, "b", "c" ], t = [ 1, "bcda", "ce", 8 ], c = [ 45, 13, 3 ], n = r.arraySetContainAny(a, t, c), 
          i = !1, e.identical(n, i), e.is(n !== a), e.is(n !== t), e.is(n !== c), e.case = "first argument is an empty array", 
          a = [], t = [ 1, "bcda", "ce", 8 ], c = [ 45, 13, 3 ], n = r.arraySetContainAny(a, t, c), 
          i = !0, e.identical(n, i), e.is(n !== a), e.is(n !== t), e.is(n !== c), e.case = "following array are empty, (src) array is not empty", 
          a = [ 33, 4, 5, "b", "c" ], t = [], c = [], n = r.arraySetContainAny(a, t, c), i = !1, 
          e.identical(n, i), e.is(n !== a), e.is(n !== t), e.is(n !== c), e.case = "all the array are empty", 
          a = [], t = [], c = [], n = r.arraySetContainAny(a, t, c), i = !0, e.identical(n, i), 
          e.is(n !== a), e.is(n !== t), e.is(n !== c), e.case = "single argument", n = r.arraySetContainAny([ 33, 4, 5, "b", "c" ]), 
          i = !0, e.identical(n, i);
          for (
          /**/
          var o = [ {
            args: [ [], [] ],
            expected: !0
          }, {
            args: [ [ 1, 2, 3 ], [ 1 ] ],
            expected: !0
          }, {
            args: [ [ 1, 2, 3 ], [], [ 3 ] ],
            expected: !1
          }, {
            args: [ [ 1, 2, 3 ], [ 0, 1 ], [ 9, 3 ] ],
            expected: !0
          }, {
            args: [ [ 1, 2, 3 ], [ 4 ], [ 3 ] ],
            expected: !1
          }, {
            args: [ [], [ 0 ], [ 4 ], [ 3 ] ],
            expected: !0
          }, {
            args: [ [ 1, 2, 3 ], [ 4 ], [ 5 ] ],
            expected: !1
          }, {
            args: [ [ 0, 0, 0, 1 ], [ 5 ], [ 6 ], [ 2, 1 ] ],
            expected: !1
          }, {
            args: [ [ 1, 2, 3 ], [ 4 ], 1 ],
            error: !0
          }, {
            args: [ 1, [ 4 ], 1 ],
            error: !0
          } ], s = 0; s < o.length; s++) (c = o[s]).error ? e.shouldThrowErrorSync(() => r.arraySetContainAny.apply(r, c.args)) : e.identical(r.arraySetContainAny.apply(r, c.args), c.expected);
          /* */          e.case = "no arguments", e.shouldThrowErrorSync(function() {
            r.arraySetContainAny();
          }), e.case = "one or several arguments are not longIs entities,numeric arguments", 
          e.shouldThrowErrorSync(function() {
            r.arraySetContainAny([ 33, 4, 5, "b", "c" ], 15, 25);
          }), e.case = "one or several arguments are not longIs entities,string like arguments", 
          e.shouldThrowErrorSync(function() {
            r.arraySetContainAny([ 33, 4, 5, "b", "c" ], "dfdf", "ab");
          }), e.case = "one or several arguments are not longIs entities,map like arguments", 
          e.shouldThrowErrorSync(function() {
            r.arraySetContainAny([ 33, 4, 5, "b", "c" ], {
              a: 33
            }, {
              b: 44
            });
          }), e.case = "wrong argument", e.shouldThrowErrorSync(function() {
            r.arraySetContainAny([ 1, 2, 3 ], "wrong argument");
          });
        }
        //
        ,
        arraySetIdentical: function arraySetIdentical(e) {
          console.log("xxx"), e.case = "2 arguments, empty";
          var a = [], n = [], i = r.arraySetIdentical(a, n), t = !0;
          e.identical(i, t), e.case = "2 arguments, src empty", a = [], n = [ 1 ], i = r.arraySetIdentical(a, n), 
          t = !1, e.identical(i, t), e.case = "2 arguments, ins empty", a = [ 1 ], n = [], 
          i = r.arraySetIdentical(a, n), t = !1, e.identical(i, t), e.case = "repeats, bigger second argument", 
          a = [ 1 ], n = [ 1, 1, 1, 1 ], i = r.arraySetIdentical(a, n), t = !1, e.identical(i, t), 
          e.case = "repeats, bigger first argument", a = [ 1, 1, 1, 1 ], n = [ 1 ], i = r.arraySetIdentical(a, n), 
          t = !1, e.identical(i, t), e.case = "repeats", a = [ 1, 3 ], n = [ 1, 1, 1, 1 ], 
          i = r.arraySetIdentical(a, n), t = !1, e.identical(i, t), e.case = "arguments have the same elements but the order is differ", 
          a = [ 1, 2, 4, 7, 5 ], n = [ 4, 2, 1, 5, 7 ], i = r.arraySetIdentical(a, n), t = !0, 
          e.identical(i, t), e.is(i !== a), e.is(i !== n), e.case = "argument length mismatch", 
          a = [ 1, 2, 4, 7, 5 ], n = [ 1, 5, 7 ], i = r.arraySetIdentical(a, n), t = !1, e.identical(i, t), 
          e.is(i !== a), e.is(i !== n), e.case = "arguments have the same elements have inner arrays", 
          a = [ 1, 2, [ 1, 3 ], 7, 5 ], n = [ [ 1, 3 ], 2, 1, 5, 7 ], i = r.arraySetIdentical(a, n), 
          t = !1, e.identical(i, t), e.is(i !== a), e.is(i !== n), e.case = "both arrays are empty", 
          a = [], n = [], i = r.arraySetIdentical(a, n), t = !0, e.identical(i, t), e.is(i !== a), 
          e.is(i !== n);
          for (
          /* */
          var c = [ {
            args: [ [], [] ],
            expected: !0
          }, {
            args: [ [ 1 ], [] ],
            expected: !1
          }, {
            args: [ [ 1 ], [ 1 ] ],
            expected: !0
          }, {
            args: [ [ 1, 1 ], [ 1 ] ],
            expected: !1
          }, {
            args: [ [ 1 ], [ 1, 1 ] ],
            expected: !1
          }, {
            args: [ [ 1, 2, 3 ], [ 1, 2, 4 ] ],
            expected: !1
          }, {
            args: [ [ 1, 2, 3 ], [ 3, 2, 1 ] ],
            expected: !0
          }, {
            args: [ [ 1, 2, 3 ], [ 3, 2, 1 ] ],
            expected: !0
          }, {
            args: [ [ [ 1 ], 2, 3 ], [ 3, 2, [ 1 ] ] ],
            expected: !1
          }, {
            args: [ 1, [ 1 ] ],
            error: !0
          }, {
            args: [ [ 1 ], 1 ],
            error: !0
          } ], l = 0; l < c.length; l++) {
            var o = c[l];
            o.error ? e.shouldThrowErrorSync(() => r.arraySetIdentical.apply(r, o.args)) : e.identical(r.arraySetIdentical.apply(r, o.args), o.expected);
          }
          /* */          e.case = "no arguments", e.shouldThrowErrorSync(function() {
            r.arraySetIdentical();
          }), e.case = "one or 2 arguments are not longIs entities, numeric argument", e.shouldThrowErrorSync(function() {
            r.arraySetIdentical([ 1, 2, 4, 7, 5 ], 15);
          }), e.case = "one or 2 arguments are not longIs entities, string like arguments", 
          e.shouldThrowErrorSync(function() {
            r.arraySetIdentical("a", "a");
          }), e.case = "one or 2 arguments are not longIs entities, map like arguments", e.shouldThrowErrorSync(function() {
            r.arraySetIdentical({
              a: 1
            }, {
              b: 3,
              c: 8
            });
          }), e.case = "wrong argument", e.shouldThrowErrorSync(function() {
            r.arraySetIdentical([ 1, 2, 4, 7, 5 ], "wrong argument");
          }), e.case = "both arguments are null", e.shouldThrowErrorSync(function() {
            r.arraySetIdentical(null, null);
          }), e.case = "both arguments are undefined", e.shouldThrowErrorSync(function() {
            r.arraySetIdentical(void 0, void 0);
          });
        }
      }
    };
    a = wTestSuite(a), "undefined" == typeof module || module.parent || wTester.test(a.name);
  }();
  // == end of file LongTestS
}();