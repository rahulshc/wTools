!function RoutineTestS() {
  // == begin of file RoutineTestS
  !function _Routine_test_s_() {
    "use strict";
    //
    function testFunction1(e, n) {
      return e + n;
    }
    function testFunction2(e, n) {
      return this;
    }
    function testFunction3(e, n) {
      return e + n + this.k;
    }
    function testFunction4(e, n) {
      return this;
    }
    function contextConstructor3() {
      this.k = 15;
    }
    //
    function routineExtendExperiment(n) {
      n.case = "map saves";
      var i = function() {};
      Object.defineProperties(i, {
        "b": {
          value: {
            a: 2
          },
          enumerable: !0,
          writable: !0
        }
      });
      var t = e.routineExtend(i);
      n.identical(t.b, {
        a: 2
      }), n.case = "resulted map is empty, but should not", (i = function(e) {}).b = {
        map: 2
      }, t = e.routineExtend(i, {
        b: {
          map: 3
        }
      }), n.identical(t.b, {
        map: 2
      });
    }
    "undefined" != typeof module && require("../Layer2.s").include("wTesting"), _global_;
    var e = _global_.wTools, n = new contextConstructor3();
    routineExtendExperiment.experimental = 1;
    //
    var i = {
      name: "Tools/base/l1/Routine",
      silencing: 1,
      tests: {
        /* qqq : tests for constructorJoin, extend tests for routineJoin */
        _routineJoin: 
        //
        function _routineJoin(i) {
          function srcRoutine() {}
          var t = {
            sealing: !1,
            routine: testFunction1,
            args: [ 4 ],
            // x
            extending: !0
          }, o = {
            sealing: !0,
            routine: testFunction2,
            args: [ 4 ],
            // x
            extending: !0
          }, r = {
            sealing: !1,
            routine: testFunction3,
            args: [ 4 ],
            // x
            context: n,
            extending: !0
          }, c = {
            sealing: !1,
            routine: testFunction4,
            args: [ 4 ],
            // x
            context: n,
            extending: !0
          }, a = {
            sealing: !0,
            routine: testFunction3,
            args: [ 2, 4 ],
            // x
            context: n,
            extending: !0
          }, l = {
            sealing: !0,
            routine: {},
            args: [ 2, 4 ],
            // x
            context: n,
            extending: !0
          }, s = {
            sealing: !0,
            routine: testFunction3,
            args: "wrong",
            // x
            context: n,
            extending: !0
          };
          i.case = "simple function without context with arguments bind without seal : result check";
          var u = e._routineJoin(t)(2);
          i.identical(u, 6), i.case = "simple function without context and seal : context test", 
          u = e._routineJoin(o)(2), i.identical(u, void 0), i.case = "simple function with context and arguments : result check", 
          u = e._routineJoin(r)(2), i.identical(u, 21), i.case = "simple function with context and arguments : context check", 
          u = e._routineJoin(c)(2), i.identical(u instanceof contextConstructor3, !0), i.case = "simple function with context and arguments : result check, seal == true ", 
          u = e._routineJoin(a)(2), i.identical(u, 21), i.case = "simple function with context and arguments : result check, seal == true ", 
          u = e._routineJoin(a)(0, 0), i.identical(u, 21), i.case = "extending", srcRoutine.defaults = {
            a: 10
          };
          var d = e.routineJoin(void 0, srcRoutine, []);
          i.identical(d.defaults, srcRoutine.defaults), i.case = "missed argument", i.shouldThrowError(function() {
            e._routineJoin();
          }), i.case = "extra argument", i.shouldThrowError(function() {
            e._routineJoin(t, o);
          }), i.case = "passed non callable object", i.shouldThrowError(function() {
            e._routineJoin(l);
          }), i.case = "passed arguments as primitive value", i.shouldThrowError(function() {
            e._routineJoin(s);
          });
        },
        constructorJoin: 
        //
        //
        // function routineBind( test )
        // {
        //
        //   var testParam1 = 2,
        //     testParam2 = 4,
        //     expected1 = 6,
        //     expected2 = undefined,
        //     expected3 = 21;
        //
        //   test.case = 'simple function without context with arguments bind : result check';
        //   var gotfn = _.routineBind( testFunction1, undefined, [ testParam2 ]);
        //   var got = gotfn( testParam1 );
        //   test.identical( got,expected1 );
        //
        //   test.case = 'simple function without /*ttt*/context test';
        //   var gotfn = _.routineBind(testFunction2, undefined, [ testParam2 ]);
        //   var got = gotfn( testParam1 );
        //   test.identical( got, expected2 );
        //
        //   test.case = 'simple function with context and arguments : result check';
        //   var gotfn = _.routineBind(testFunction3, context3, [ testParam2 ]);
        //   var got = gotfn( testParam1 );
        //   test.identical( got, expected3 );
        //
        //   test.case = 'simple function with context and arguments : context check';
        //   var gotfn = _.routineBind(testFunction4, context3, [ testParam2 ]);
        //   var got = gotfn( testParam1 );
        //   test.identical( got instanceof contextConstructor3, true );
        //
        //   if( !Config.debug )
        //   return;
        //
        //   test.case = 'missed argument';
        //   test.shouldThrowError( function()
        //   {
        //     _.routineBind();
        //   });
        //
        //   test.case = 'extra argument';
        //   test.shouldThrowError( function()
        //   {
        //     _.routineBind( testFunction4, context3, [ testParam2 ], [ testParam1 ] );
        //   });
        //
        //   test.case = 'passed non callable object';
        //   test.shouldThrowError( function()
        //   {
        //     _.routineBind( {}, context3, [ testParam2 ] );
        //   });
        //
        //   test.case = 'passed arguments as primitive value';
        //   test.shouldThrowError( function()
        //   {
        //     _.routineBind( testFunction4, context3, testParam2 );
        //   });
        //
        // };
        //
        function constructorJoin(n) {
          function srcRoutine() {
            return {
              context: this,
              args: e.longSlice(arguments)
            };
          }
          srcRoutine.prop = !0;
          var i = [], t = e.constructorJoin(srcRoutine, i);
          n.is(e.routineIs(t));
          var o = t();
          n.identical(e.mapKeys(srcRoutine), [ "prop" ]), n.identical(e.mapKeys(t), []), n.identical(o.args, i), 
          n.identical(o.context, srcRoutine), n.isNot(o.context instanceof srcRoutine), i = [], 
          t = e.constructorJoin(srcRoutine, i), n.is(e.routineIs(t)), o = new t(), n.identical(e.mapKeys(srcRoutine), [ "prop" ]), 
          n.identical(e.mapKeys(t), []), n.identical(o.args, i), n.notIdentical(o.context, srcRoutine), 
          n.is(o.context instanceof srcRoutine), i = [ {
            a: 1
          } ], t = e.constructorJoin(srcRoutine, i), n.is(e.routineIs(t)), o = t(), n.identical(e.mapKeys(srcRoutine), [ "prop" ]), 
          n.identical(e.mapKeys(t), []), n.identical(o.args, i), n.identical(o.context, srcRoutine), 
          n.isNot(o.context instanceof srcRoutine), i = [ {
            a: 1
          } ], t = e.constructorJoin(srcRoutine, i), n.is(e.routineIs(t)), o = t({
            b: 1
          }), n.identical(e.mapKeys(srcRoutine), [ "prop" ]), n.identical(e.mapKeys(t), []), 
          n.identical(o.args, [ {
            a: 1
          }, {
            b: 1
          } ]), n.identical(o.context, srcRoutine), n.isNot(o.context instanceof srcRoutine), 
          i = [ {
            a: 1
          } ], t = e.constructorJoin(srcRoutine, i), n.is(e.routineIs(t)), o = new t(), n.identical(e.mapKeys(srcRoutine), [ "prop" ]), 
          n.identical(e.mapKeys(t), []), n.identical(o.args, i), n.notIdentical(o.context, srcRoutine), 
          n.is(o.context instanceof srcRoutine), i = [ {
            a: 1
          } ], t = e.constructorJoin(srcRoutine, i), n.is(e.routineIs(t)), o = new t({
            b: 1
          }), n.identical(e.mapKeys(srcRoutine), [ "prop" ]), n.identical(e.mapKeys(t), []), 
          n.identical(o.args, [ {
            a: 1
          }, {
            b: 1
          } ]), n.notIdentical(o.context, srcRoutine), n.is(o.context instanceof srcRoutine), 
          n.shouldThrowError(() => e.constructorJoin()), n.shouldThrowError(() => e.constructorJoin([], [])), 
          n.shouldThrowError(() => e.constructorJoin(srcRoutine, srcRoutine));
        }
        //
        ,
        routineJoin: function routineJoin(i) {
          function srcRoutine() {}
          i.case = "simple function without context with arguments bind : result check";
          var t = e.routineJoin(void 0, testFunction1, [ 4 ])(2);
          i.identical(t, 6), i.case = "simple function without /*ttt*/context test", t = e.routineJoin(void 0, testFunction2, [ 4 ])(2), 
          i.identical(t, void 0), i.case = "simple function with context and arguments : result check", 
          t = e.routineJoin(n, testFunction3, [ 4 ])(2), i.identical(t, 21), i.case = "simple function with context and arguments : context check", 
          t = e.routineJoin(n, testFunction4, [ 4 ])(2), i.identical(t instanceof contextConstructor3, !0), 
          i.case = "extending", srcRoutine.defaults = {
            a: 10
          };
          var o = e.routineJoin(void 0, srcRoutine, []);
          i.identical(o.defaults, srcRoutine.defaults), i.case = "missed argument", i.shouldThrowError(function() {
            e.routineJoin();
          }), i.case = "extra argument", i.shouldThrowError(function() {
            e.routineJoin(n, testFunction4, [ 4 ], [ 2 ]);
          }), i.case = "passed non callable object", i.shouldThrowError(function() {
            e.routineJoin(n, {}, [ 4 ]);
          }), i.case = "passed arguments as primitive value", i.shouldThrowError(function() {
            e.routineJoin(n, testFunction4, 4);
          });
        }
        //
        ,
        routineSeal: function routineSeal(i) {
          function srcRoutine() {}
          i.case = "simple function with seal arguments : result check";
          var t = e.routineSeal(void 0, testFunction1, [ 2, 4 ])(2);
          i.identical(t, 6), i.case = "simple function with seal arguments : context check", 
          t = e.routineSeal(void 0, testFunction2, [ 2, 4 ])(2), i.identical(t, void 0), i.case = "simple function with seal context and arguments : result check", 
          t = e.routineSeal(n, testFunction3, [ 2, 4 ])(2), i.identical(t, 21), i.case = "simple function with seal context and arguments : context check", 
          t = e.routineSeal(n, testFunction4, [ 2, 4 ])(2), i.identical(t instanceof contextConstructor3, !0), 
          i.case = "simple function with seal context and arguments : result check", t = e.routineSeal(n, testFunction3, [ 2, 4 ])(0, 0), 
          i.identical(t, 21), i.case = "extending", srcRoutine.defaults = {
            a: 10
          };
          var o = e.routineJoin(void 0, srcRoutine, []);
          i.identical(o.defaults, srcRoutine.defaults), i.case = "missed argument", i.shouldThrowError(function() {
            e.routineSeal();
          }), i.case = "extra argument", i.shouldThrowError(function() {
            e.routineSeal(n, testFunction4, [ 4 ], [ 2 ]);
          }), i.case = "passed non callable object", i.shouldThrowError(function() {
            e.routineSeal(n, {}, [ 2, 4 ]);
          }), i.case = "passed arguments as primitive value", i.shouldThrowError(function() {
            e.routineSeal(n, testFunction4, 4);
          });
        }
        //
        ,
        routinesCompose: function routinesCompose(n) {
          function routineUnrolling() {
            i += 10;
            for (var n = 0; n < arguments.length; n++) i += arguments[n];
            return e.unrollAppend(e.unrollMake(null), e.unrollMake(arguments), i);
          }
          function routineNotUnrolling() {
            i += 10;
            for (var n = 0; n < arguments.length; n++) i += arguments[n];
            return e.arrayAppend_(null, arguments, i);
          }
          function r2() {
            i += 100;
            for (var e = 0; e < arguments.length; e++) i += 2 * arguments[e];
            return i;
          }
          function _break() {
            return e.dont;
          }
          function chainer1(e, n, i, t) {
            return n;
          }
          /* - */          n.case = "empty";
          var i = 0, t = [], o = e.routinesCompose(t)(1, 2, 3), r = [];
          n.identical(o, r), n.identical(i, 0), 
          /* - */
          n.open("unrolling:1")
          /* */ , n.case = "without chainer", i = 0, t = [ null, routineUnrolling, null, r2, null ], 
          o = e.routinesCompose(t)(1, 2, 3), r = [ 1, 2, 3, 16, 128 ], n.identical(o, r), 
          n.identical(i, 128), 
          /* */
          n.case = "with chainer", i = 0, t = [ null, routineUnrolling, null, r2, null ], 
          o = e.routinesCompose(t, chainer1)(1, 2, 3), r = [ 1, 2, 3, 16, 160 ], n.identical(o, r), 
          n.identical(i, 160), 
          /* */
          n.case = "with chainer and break", i = 0, t = [ null, routineUnrolling, null, _break, null, r2, null ], 
          o = e.routinesCompose(t, chainer1)(1, 2, 3), r = [ 1, 2, 3, 16, e.dont ], n.identical(o, r), 
          n.identical(i, 16), 
          /* */
          n.close("unrolling:1")
          /* - */ , n.open("unrolling:0")
          /* */ , n.case = "without chainer", i = 0, t = [ null, routineNotUnrolling, null, r2, null ], 
          o = e.routinesCompose(t)(1, 2, 3), r = [ [ 1, 2, 3, 16 ], 128 ], n.identical(o, r), 
          n.identical(i, 128), 
          /* */
          n.case = "with chainer", i = 0, t = [ null, routineNotUnrolling, null, r2, null ], 
          o = e.routinesCompose(t, chainer1)(1, 2, 3), r = [ [ 1, 2, 3, 16 ], 160 ], n.identical(o, r), 
          n.identical(i, 160), 
          /* */
          n.case = "with chainer and break", i = 0, t = [ null, routineNotUnrolling, null, _break, null, r2, null ], 
          o = e.routinesCompose(t, chainer1)(1, 2, 3), r = [ [ 1, 2, 3, 16 ], e.dont ], n.identical(o, r), 
          n.identical(i, 16), 
          /* */
          n.close("unrolling:0")
          /* - */ , n.case = "bad arguments", n.shouldThrowErrorSync(() => e.routinesComposeAll()), 
          n.shouldThrowErrorSync(() => e.routinesComposeAll(t, function() {}, function() {}));
        }
        //
        ,
        routinesComposeAll: function routinesComposeAll(n) {
          function routineUnrolling() {
            i += 10;
            for (var n = 0; n < arguments.length; n++) i += arguments[n];
            return e.unrollAppend(e.unrollMake(null), e.unrollMake(arguments), i);
          }
          function r2() {
            i += 100;
            for (var e = 0; e < arguments.length; e++) i += 2 * arguments[e];
            return i;
          }
          function _nothing() {}
          n.case = "with nothing";
          var i = 0, t = [ null, routineUnrolling, null, _nothing, null, r2, null ], o = e.routinesComposeAll(t)(1, 2, 3), r = [ 1, 2, 3, 16, 128 ];
          n.identical(o, r), n.identical(i, 128), n.case = "last nothing", i = 0, t = [ null, routineUnrolling, null, _nothing ], 
          o = e.routinesComposeAll(t)(1, 2, 3), r = [ 1, 2, 3, 16 ], n.identical(o, r), n.identical(i, 16), 
          n.case = "not unrolling and last nothing", i = 0, t = [ null, function routineNotUnrolling() {
            i += 10;
            for (var n = 0; n < arguments.length; n++) i += arguments[n];
            return e.arrayAppend_(null, arguments, i);
          }, null, _nothing ], o = e.routinesComposeAll(t)(1, 2, 3), r = [ [ 1, 2, 3, 16 ] ], 
          n.identical(o, r), n.identical(i, 16), n.case = "with nothing and dont", i = 0, 
          t = [ null, routineUnrolling, null, _nothing, null, function _dont() {
            return e.dont;
          }, null, r2, null ], o = e.routinesComposeAll(t)(1, 2, 3), r = !1, n.identical(o, r), 
          n.identical(i, 16), n.case = "bad arguments", n.shouldThrowErrorSync(() => e.routinesComposeAll()), 
          n.shouldThrowErrorSync(() => e.routinesComposeAll(t, function() {})), n.shouldThrowErrorSync(() => e.routinesComposeAll(t, function() {}, function() {}));
        }
        //
        ,
        routinesComposeAllReturningLast: function routinesComposeAllReturningLast(n) {
          function routineUnrolling() {
            i += 10;
            for (var n = 0; n < arguments.length; n++) i += arguments[n];
            debugger;
            return e.unrollAppend(e.unrollMake(null), e.unrollMake(arguments), i);
          }
          function r2() {
            i += 100;
            for (var e = 0; e < arguments.length; e++) i += 2 * arguments[e];
            return i;
          }
          function _nothing() {}
          n.case = "with nothing";
          var i = 0, t = [ null, routineUnrolling, null, _nothing, null, r2, null ], o = e.routinesComposeAllReturningLast(t)(1, 2, 3), r = 128;
          n.identical(o, r), n.identical(i, 128), n.case = "last nothing", i = 0, t = [ null, routineUnrolling, null, _nothing ], 
          o = e.routinesComposeAllReturningLast(t)(1, 2, 3), r = 16, n.identical(o, r), n.identical(i, 16), 
          n.case = "not unrolling and last nothing", i = 0, t = [ null, function routineNotUnrolling() {
            i += 10;
            for (var n = 0; n < arguments.length; n++) i += arguments[n];
            debugger;
            return e.arrayAppend_(null, arguments, i);
          }, null, _nothing ], o = e.routinesComposeAllReturningLast(t)(1, 2, 3), r = [ 1, 2, 3, 16 ], 
          n.identical(o, r), n.identical(i, 16), n.case = "with nothing and dont", i = 0, 
          t = [ null, routineUnrolling, null, _nothing, null, function _dont() {
            return e.dont;
          }, null, r2, null ], o = e.routinesComposeAllReturningLast(t)(1, 2, 3), r = e.dont, 
          n.identical(o, r), n.identical(i, 16), n.case = "bad arguments", n.shouldThrowErrorSync(() => e.routinesComposeAllReturningLast()), 
          n.shouldThrowErrorSync(() => e.routinesComposeAllReturningLast(t, function() {})), 
          n.shouldThrowErrorSync(() => e.routinesComposeAllReturningLast(t, function() {}, function() {}));
        }
        //
        ,
        routinesChain: function routinesChain(n) {
          function routineUnrolling() {
            i += 10;
            for (var n = 0; n < arguments.length; n++) i += arguments[n];
            return e.unrollAppend(e.unrollMake(null), e.unrollMake(arguments), i);
          }
          function r2() {
            i += 100;
            for (var e = 0; e < arguments.length; e++) i += 2 * arguments[e];
            return i;
          }
          /* */
          n.case = "without break";
          var i = 0, t = [ null, routineUnrolling, null, r2, null ], o = e.routinesChain(t)(1, 2, 3), r = [ 1, 2, 3, 16, 160 ];
          n.identical(o, r), n.identical(i, 160), 
          /* */
          n.case = "with break", i = 0, t = [ null, routineUnrolling, null, function _break() {
            return e.dont;
          }, null, r2, null ], o = e.routinesChain(t)(1, 2, 3), r = [ 1, 2, 3, 16 ], n.identical(o, r), 
          n.identical(i, 16), 
          /* */
          n.case = "with dont include", i = 0, t = [ null, routineUnrolling, null, function dontInclude() {}, null, r2, null ], 
          o = e.routinesChain(t)(1, 2, 3), r = [ 1, 2, 3, 16, 160 ], n.identical(o, r), n.identical(i, 160), 
          n.case = "bad arguments", n.shouldThrowErrorSync(() => e.routinesComposeAll()), 
          n.shouldThrowErrorSync(() => e.routinesComposeAll(t, function() {})), n.shouldThrowErrorSync(() => e.routinesComposeAll(t, function() {}, function() {}));
        }
        //
        ,
        routineExtend: function routineExtend(n) {
          // debugger;
          // var got = _.routineExtend( dst, { c : { s : 1 } } );
          // test.identical( got.c, {} ); // true
          // debugger;
          n.open("dst is null, src has pre and body properties"), n.case = "dst is null, src is routine maked by routineFromPreAndBody";
          var i = e.routineExtend(null, e.routineFromPreAndBody);
          n.identical(i.pre, e.routineFromPreAndBody.pre), n.identical(i.body, e.routineFromPreAndBody.body), 
          n.identical(typeof i, "function"), i = e.routineExtend(null, e.routinesCompose), 
          n.identical(i.pre, e.routinesCompose.pre), n.identical(i.body, e.routinesCompose.body), 
          n.identical(typeof i, "function"), n.case = "dst is null, src is map with pre and body properties";
          var t = {
            pre: e.routineFromPreAndBody.pre,
            body: e.routineFromPreAndBody.body,
            map: {
              a: 2
            }
          };
          i = e.routineExtend(null, t), n.identical(i.pre, e.routineFromPreAndBody.pre), n.identical(i.body, e.routineFromPreAndBody.body), 
          n.equivalent(i.map, {}), n.identical(typeof i, "function"), n.case = "dst is null, src is map with pre and body properties", 
          t = {
            pre: e.routineFromPreAndBody.pre,
            body: e.routineFromPreAndBody.body,
            map: {
              a: 2
            }
          }, i = e.routineExtend(null, t), n.identical(i.pre, e.routineFromPreAndBody.pre), 
          n.identical(i.body, e.routineFromPreAndBody.body), n.identical(i.map, {}), n.identical(typeof i, "function"), 
          n.case = "dst is null, src is map with pre and body properties", t = {
            pre: e.routineFromPreAndBody.pre,
            body: e.routineFromPreAndBody.body,
            a: [ 1 ],
            b: "str",
            c: {
              str: "str"
            }
          }, i = e.routineExtend(null, t), n.identical(i.pre, e.routineFromPreAndBody.pre), 
          n.identical(i.body, e.routineFromPreAndBody.body), n.identical(i.a, [ 1 ]), n.identical(i.b, "str"), 
          n.identical(i.c, {}), n.identical(typeof i, "function"), n.close("dst is null, src has pre and body properties"), 
          /* - */
          n.open("single dst"), n.case = "single dst";
          var o = function(e) {};
          i = e.routineExtend(o), n.identical(i, o), n.identical(typeof i, "function"), n.case = "single dst is routine, has properties", 
          (o = function(e) {}).a = 0, o.b = 0, i = e.routineExtend(o), n.identical(i, o), 
          n.identical(typeof i, "function"), n.identical(i.a, 0), n.identical(i.b, 0), n.case = "single dst is routine, has hiden properties", 
          o = function(e) {}, Object.defineProperties(o, {
            "a": {
              value: 0,
              enumerable: !0,
              writable: !1
            },
            "b": {
              value: {
                a: 2
              },
              enumerable: !1,
              writable: !1
            }
          }), i = e.routineExtend(o), n.identical(i, o), n.identical(typeof i, "function"), 
          n.identical(i.a, 0), n.identical(i.b, {
            a: 2
          }), i = Object.getOwnPropertyDescriptor(i, "b"), n.isNot(i.enumerable), n.close("single dst"), 
          n.case = "dst has properties, src map has different properties", (o = function(e) {}).a = 0, 
          o.b = 0, i = e.routineExtend(o, {
            c: 1,
            d: 1,
            e: {
              s: 1
            }
          }), n.identical(typeof i, "function"), n.identical(i.a, 0), n.identical(i.b, 0), 
          n.identical(i.c, 1), n.identical(i.e, {}), n.case = "dst has properties, src map has the same properties", 
          (o = function(e) {}).a = 0, o.b = 0, i = e.routineExtend(o, {
            a: 1,
            b: 1
          }), n.identical(typeof i, "function"), n.identical(i.a, 1), n.identical(i.b, 1), 
          /* */
          n.case = "dst has non-writable properties", o = function(e) {}, Object.defineProperties(o, {
            "a": {
              enumerable: !0,
              writable: !1,
              value: 0
            },
            "b": {
              enumerable: !0,
              writable: !1,
              value: 0
            }
          }), i = e.routineExtend(o, {
            a: 3,
            b: 2
          }), n.identical(typeof i, "function"), n.identical(i.a, 0), n.identical(i.b, 0), 
          n.case = "src has non-writable properties", (o = function(e) {}).a = 0, o.b = 0, 
          t = {}, Object.defineProperties(t, {
            "a": {
              enumerable: !0,
              writable: !1,
              value: 3
            },
            "b": {
              enumerable: !0,
              writable: !1,
              value: 2
            }
          }), i = e.routineExtend(o, t), n.identical(typeof i, "function"), n.identical(i.a, 3), 
          n.identical(i.b, 2), n.case = "src is an array", o = function(e) {}, i = e.routineExtend(o, [ "a", 1 ]), 
          n.identical(typeof i, "function"), n.identical(i[0], "a"), n.identical(i[1], 1), 
          n.open("a few extends"), n.case = "null extends other routine, null extends result", 
          t = e.routineExtend(null, e.routinesCompose), i = e.routineExtend(null, t), n.identical(i.pre, e.routinesCompose.pre), 
          n.identical(i.body, e.routinesCompose.body), n.identical(typeof i, "function"), 
          n.case = "src extends routine, result extends map ";
          var r = {
            pre: e.routineFromPreAndBody.pre,
            body: e.routineFromPreAndBody.body,
            a: "str",
            b: {
              b: 3
            }
          };
          t = e.routineExtend(null, e.routinesCompose), i = e.routineExtend(t, r), n.identical(i.pre, e.routineFromPreAndBody.pre), 
          n.identical(i.body, e.routineFromPreAndBody.body), n.identical(i.b, {}), n.is("str" === i.a), 
          n.identical(typeof i, "function"), n.case = "dst extends map, dst extends other map", 
          o = function() {}, r = {
            pre: e.routinesCompose.pre,
            body: e.routinesCompose.body,
            a: [ "str" ],
            c: {
              d: 2
            }
          }, t = e.routineExtend(o, {
            c: {},
            b: "str"
          }), i = e.routineExtend(o, r), n.identical(i.pre, e.routinesCompose.pre), n.identical(i.body, e.routinesCompose.body), 
          n.identical(i.a, [ "str" ]), n.identical(i.b, "str"), n.identical(i.c, {}), n.identical(typeof i, "function"), 
          n.case = "dst has map property, dst extends other map", (o = function() {}).map = {
            a: "str"
          }, r = {
            pre: e.routinesCompose.pre,
            body: e.routinesCompose.body,
            a: [ "str" ],
            map: {
              d: 2
            }
          }, t = e.routineExtend(o, {
            c: {}
          }), i = e.routineExtend(o, r), n.identical(i.pre, e.routinesCompose.pre), n.identical(i.body, e.routinesCompose.body), 
          n.identical(i.a, [ "str" ]), n.identical(i.map, {
            a: "str"
          }), n.identical(i.c, {}), n.identical(typeof i, "function"), n.case = "dst extends routine1, src extends routine, dst extends src", 
          o = function() {}, t = function() {};
          var c = function() {};
          c.a = 0, c.b = [ "str" ];
          var a = function() {};
          a.a = 2, a.c = "str", r = e.routineExtend(t, c);
          var l = e.routineExtend(o, a);
          i = e.routineExtend(l, r), n.identical(i.a, 0), n.identical(i.b, [ "str" ]), n.identical(i.c, "str"), 
          n.identical(o.a, i.a), n.identical(o.b, i.b), n.identical(o.c, i.c), n.identical(typeof i, "function"), 
          n.case = "dst extends map, src extends map, dst extends src", o = function() {}, 
          t = function() {}, r = e.routineExtend(t, {
            o1: 1,
            o2: "str"
          }), l = e.routineExtend(o, {
            o3: "o3",
            o1: "map"
          }), i = e.routineExtend(l, r), n.identical(i.o1, 1), n.identical(i.o2, "str"), n.identical(i.o3, "o3"), 
          n.identical(o.a, i.a), n.identical(o.b, i.b), n.identical(o.c, i.c), n.identical(typeof i, "function"), 
          n.close("a few extends"), n.case = "no arguments", n.shouldThrowErrorSync(function() {
            e.routineExtend();
          }), n.case = "three arguments", n.shouldThrowErrorSync(function() {
            e.routineExtend(null, {
              a: 1
            }, {
              b: 2
            });
          }), n.case = "single dst is null", n.shouldThrowErrorSync(function() {
            e.routineExtend(null);
          }), n.case = "second arg has not pre and body properties", n.shouldThrowErrorSync(function() {
            e.routineExtend(null, e.unrollIs);
          }), n.case = "second arg is primitive", n.shouldThrowErrorSync(function() {
            e.routineExtend(e.unrollIs, "str");
          }), n.shouldThrowErrorSync(function() {
            e.routineExtend(e.unrollIs, 1);
          }), n.case = "dst is not routine or null", n.shouldThrowErrorSync(function() {
            e.routineExtend(1, {
              a: 1
            });
          }), n.shouldThrowErrorSync(function() {
            e.routineExtend("str", {
              a: 1
            });
          });
        },
        routineExtendExperiment: routineExtendExperiment,
        vectorize: 
        //
        function vectorize(n) {
          function srcRoutine(n, i) {
            return e.longSlice(arguments);
          }
          n.open("defaults"), (c = {
            vectorizingArray: 1,
            vectorizingMapVals: 0,
            select: 1
          }).routine = srcRoutine;
          var i = e.vectorize(c);
          n.case = "single argument", n.identical(i(1), [ 1 ]), n.identical(i([ 1 ]), [ [ 1 ] ]), 
          n.identical(i([ 1, 2, 3 ]), [ [ 1 ], [ 2 ], [ 3 ] ]), n.case = "multiple argument", 
          n.identical(i(1, 0), [ 1, 0 ]), n.identical(i([ 1, 2, 3 ], 2), [ [ 1, 2 ], [ 2, 2 ], [ 3, 2 ] ]), 
          n.identical(i(2, [ 1, 2, 3 ]), [ 2, [ 1, 2, 3 ] ]), n.identical(i([ 1, 2 ], [ 1, 2 ]), [ [ 1, [ 1, 2 ] ], [ 2, [ 1, 2 ] ] ]), 
          n.close("defaults"), 
          //
          n.open("vectorizingArray 0"), (c = {
            vectorizingArray: 0,
            vectorizingMapVals: 0,
            select: 1
          }).routine = srcRoutine, i = e.vectorize(c), n.identical(i, srcRoutine), n.close("vectorizingArray 0"), 
          //
          n.open("vectorizingMapVals : 1"), (c = {
            vectorizingArray: 0,
            vectorizingMapVals: 1,
            select: 1
          }).routine = srcRoutine;
          debugger;
          i = e.vectorize(c), n.case = "single argument", n.identical(i(1), [ 1 ]), n.identical(i([ 1 ]), [ [ 1 ] ]), 
          n.identical(i([ 1, 2, 3 ]), [ [ 1, 2, 3 ] ]), n.identical(i({
            1: 1,
            2: 2,
            3: 3
          }), {
            1: [ 1 ],
            2: [ 2 ],
            3: [ 3 ]
          }), n.case = "multiple argument", n.identical(i(1, 0), [ 1, 0 ]), n.identical(i([ 1, 2, 3 ], 2), [ [ 1, 2, 3 ], 2 ]), 
          n.identical(i(2, [ 1, 2, 3 ]), [ 2, [ 1, 2, 3 ] ]), n.identical(i([ 1, 2 ], [ 1, 2 ]), [ [ 1, 2 ], [ 1, 2 ] ]), 
          n.identical(i({
            a: 1
          }, 0), {
            a: [ 1, 0 ]
          }), n.identical(i(0, {
            a: 1
          }), [ 0, {
            a: 1
          } ]), n.identical(i({
            a: 1
          }, {
            b: 2
          }), {
            a: [ 1, {
              b: 2
            } ]
          }), n.identical(i({
            a: 1
          }, 2, 3), {
            a: [ 1, 2, 3 ]
          }), n.identical(i({
            a: 1
          }, {
            b: 2
          }, {
            c: 3
          }), {
            a: [ 1, {
              b: 2
            }, {
              c: 3
            } ]
          }), n.close("vectorizingMapVals : 1"), 
          //
          n.open("vectorizingArray : 1, vectorizingMapVals : 1"), (c = {
            vectorizingArray: 1,
            vectorizingMapVals: 1,
            select: 1
          }).routine = srcRoutine, i = e.vectorize(c), n.case = "single argument", n.identical(i(1), [ 1 ]), 
          n.identical(i([ 1 ]), [ [ 1 ] ]), n.identical(i([ 1, 2, 3 ]), [ [ 1 ], [ 2 ], [ 3 ] ]), 
          n.identical(i({
            1: 1,
            2: 2,
            3: 3
          }), {
            1: [ 1 ],
            2: [ 2 ],
            3: [ 3 ]
          }), n.case = "multiple argument", n.identical(i(1, 0), [ 1, 0 ]), n.identical(i([ 1, 2, 3 ], 2), [ [ 1, 2 ], [ 2, 2 ], [ 3, 2 ] ]), 
          n.identical(i(2, [ 1, 2, 3 ]), [ 2, [ 1, 2, 3 ] ]), n.identical(i([ 1, 2 ], [ 1, 2 ]), [ [ 1, [ 1, 2 ] ], [ 2, [ 1, 2 ] ] ]), 
          n.identical(i({
            a: 1
          }, 0), {
            a: [ 1, 0 ]
          }), n.identical(i(0, {
            a: 1
          }), [ 0, {
            a: 1
          } ]), n.identical(i({
            a: 1
          }, {
            b: 2
          }), {
            a: [ 1, {
              b: 2
            } ]
          }), n.identical(i({
            a: 1
          }, 2, 3), {
            a: [ 1, 2, 3 ]
          }), n.identical(i({
            a: 1
          }, {
            b: 2
          }, {
            c: 3
          }), {
            a: [ 1, {
              b: 2
            }, {
              c: 3
            } ]
          }), n.identical(i([ 1 ], {
            a: 2
          }), [ [ 1, {
            a: 2
          } ] ]), n.identical(i({
            a: 1
          }, [ 2 ]), {
            a: [ 1, [ 2 ] ]
          }), n.identical(i([ 1 ], {
            a: 2
          }, 3), [ [ 1, {
            a: 2
          }, 3 ] ]), n.identical(i({
            a: 1
          }, [ 2 ], 3), {
            a: [ 1, [ 2 ], 3 ]
          }), n.close("vectorizingArray : 1, vectorizingMapVals : 1"), 
          //
          n.open("vectorizingArray : 1, select : key "), (c = {
            vectorizingArray: 1,
            vectorizingMapVals: 0,
            select: "b"
          }).routine = srcRoutine, i = e.vectorize(c), n.case = "single argument", n.identical(i("1"), [ "1" ]), 
          n.identical(i([ 1 ]), [ [ 1 ] ]), n.identical(i({
            a: 0
          }), [ {
            a: 0
          } ]), n.identical(i({
            a: 0,
            b: "1"
          }), [ {
            a: 0,
            b: "1"
          } ]), n.identical(i({
            a: 0,
            b: [ 1 ]
          }), [ [ {
            a: 0,
            b: 1
          } ] ]), n.identical(i({
            a: 0,
            b: [ 1, 2 ]
          }), [ [ {
            a: 0,
            b: 1
          } ], [ {
            a: 0,
            b: 2
          } ] ]), n.case = "multiple argument", n.shouldThrowError(() => i({
            a: 0,
            b: [ 1 ]
          }, 2)), n.close("vectorizingArray : 1, select : key "), 
          //
          n.open("vectorizingArray : 1, select : multiple keys "), (c = {
            vectorizingArray: 1,
            vectorizingMapVals: 0,
            select: [ "a", "b" ]
          }).routine = srcRoutine, i = e.vectorize(c), n.case = "single argument";
          var t, o = i(t = "a"), r = [ [ t ], [ t ] ];
          n.identical(o, r), o = i(t = [ 1 ]), r = [ [ t ], [ t ] ], n.identical(o, r), o = i(t = {
            c: 1
          }), r = [ [ t ], [ t ] ], n.identical(o, r), o = i({
            a: 0,
            b: [ 1 ]
          }), r = [ [ {
            a: 0,
            b: [ 1 ]
          } ], [ [ {
            a: 0,
            b: 1
          } ] ] ], n.identical(o, r), o = i({
            a: 0,
            b: [ 1, 2 ]
          }), r = [ [ {
            a: 0,
            b: [ 1, 2 ]
          } ], [ [ {
            a: 0,
            b: 1
          } ], [ {
            a: 0,
            b: 2
          } ] ] ], n.identical(o, r), n.case = "multiple argument", n.shouldThrowError(() => i({
            a: 0,
            b: [ 1 ]
          }, 2)), n.close("vectorizingArray : 1, select : multiple keys "), 
          //
          n.open("vectorizingArray : 1,select : 2"), (c = {
            vectorizingArray: 1,
            vectorizingMapVals: 0,
            select: 2
          }).routine = srcRoutine, i = e.vectorize(c), n.identical(i([ 1, 2 ], 1), [ [ 1, 1 ], [ 2, 1 ] ]), 
          n.identical(i(1, [ 1, 2 ]), [ [ 1, 1 ], [ 1, 2 ] ]), n.identical(i([ 1, 2 ], [ 1, 2 ]), [ [ 1, 1 ], [ 2, 2 ] ]), 
          n.identical(i(1, 2), [ 1, 2 ]), n.identical(i({
            a: 1
          }, 1), [ {
            a: 1
          }, 1 ]), n.identical(i(1, {
            a: 1
          }), [ 1, {
            a: 1
          } ]), n.identical(i({
            a: 1
          }, {
            b: 2
          }), [ {
            a: 1
          }, {
            b: 2
          } ]), n.identical(i([ 1 ], {
            a: 2
          }), [ [ 1, {
            a: 2
          } ] ]), n.identical(i([ 1, 2 ], {
            a: 3
          }), [ [ 1, {
            a: 3
          } ], [ 2, {
            a: 3
          } ] ]), n.identical(i({
            a: 3
          }, [ 1, 2 ]), [ [ {
            a: 3
          }, 1 ], [ {
            a: 3
          }, 2 ] ]), n.shouldThrowError(() => i(1)), n.shouldThrowError(() => i(1, 2, 3)), 
          n.shouldThrowError(() => i([ 1, 2 ], [ 1, 2, 3 ])), n.shouldThrowError(() => i([ 1 ], [ 2 ], [ 3 ])), 
          n.close("vectorizingArray : 1,select : 2"), 
          //
          n.open("vectorizingMapVals : 1,select : 2"), (c = {
            vectorizingArray: 0,
            vectorizingMapVals: 1,
            select: 2
          }).routine = srcRoutine, i = e.vectorize(c), n.identical(i([ 1, 2 ], 3), [ [ 1, 2 ], 3 ]), 
          n.identical(i(1, [ 1, 2 ]), [ 1, [ 1, 2 ] ]), n.identical(i([ 1, 2 ], [ 1, 2 ]), [ [ 1, 2 ], [ 1, 2 ] ]), 
          n.identical(i(1, 2), [ 1, 2 ]), n.identical(i({
            a: 1
          }, 1), {
            a: [ 1, 1 ]
          }), n.identical(i(1, {
            a: 1
          }), {
            a: [ 1, 1 ]
          }), n.identical(i({
            a: 1
          }, {
            a: 2
          }), {
            a: [ 1, 2 ]
          }), n.identical(i({
            a: 1,
            b: 1
          }, {
            b: 2,
            a: 2
          }), {
            a: [ 1, 2 ],
            b: [ 1, 2 ]
          }), n.shouldThrowError(() => i(1)), n.shouldThrowError(() => i({
            a: 1
          }, {
            b: 1
          })), n.close("vectorizingMapVals : 1,select : 2"), 
          //
          n.open("vectorizingArray : 1, vectorizingMapVals : 1,select : 2"), (c = {
            vectorizingArray: 1,
            vectorizingMapVals: 1,
            select: 2
          }).routine = srcRoutine, i = e.vectorize(c), n.identical(i([ 1, 2 ], 3), [ [ 1, 3 ], [ 2, 3 ] ]), 
          n.identical(i(1, [ 1, 2 ]), [ [ 1, 1 ], [ 1, 2 ] ]), n.identical(i([ 1, 2 ], [ 1, 2 ]), [ [ 1, 1 ], [ 2, 2 ] ]), 
          n.identical(i(1, 2), [ 1, 2 ]), n.identical(i({
            a: 1
          }, 1), {
            a: [ 1, 1 ]
          }), n.identical(i(1, {
            a: 1
          }), {
            a: [ 1, 1 ]
          }), n.identical(i({
            a: 1
          }, {
            a: 2
          }), {
            a: [ 1, 2 ]
          }), n.identical(i({
            a: 1,
            b: 1
          }, {
            b: 2,
            a: 2
          }), {
            a: [ 1, 2 ],
            b: [ 1, 2 ]
          }), n.shouldThrowError(() => i([ 1, 2 ], [ 1, 2, 3 ])), n.shouldThrowError(() => i(1, 2, 3)), 
          n.shouldThrowError(() => i({
            a: 1
          }, {
            b: 1
          })), n.shouldThrowError(() => i([ 1 ], {
            b: 1
          })), n.shouldThrowError(() => i({
            b: 1
          }, [ 1 ])), n.shouldThrowError(() => i(1, [ 1 ], {
            b: 1
          })), n.shouldThrowError(() => i([ 1 ], 1, {
            b: 1
          })), n.shouldThrowError(() => i({
            b: 1
          }, 1, [ 1 ])), n.shouldThrowError(() => i({
            b: 1
          }, [ 1 ], 1)), n.close("vectorizingArray : 1, vectorizingMapVals : 1,select : 2"), 
          n.open(" vectorizingMapKeys : 1"), (c = {
            vectorizingArray: 0,
            vectorizingMapVals: 0,
            vectorizingMapKeys: 1,
            select: 1
          }).routine = srcRoutine, i = e.vectorize(c), n.identical(i(1), [ 1 ]), n.identical(i([ 1 ]), [ [ 1 ] ]), 
          n.identical(i({
            a: 1
          }), {
            a: 1
          }), n.shouldThrowError(() => i(1, 2)), n.close(" vectorizingMapKeys : 1"), n.open("vectorizingMapKeys : 1, select : 2"), 
          (c = {
            vectorizingArray: 0,
            vectorizingMapVals: 0,
            vectorizingMapKeys: 1,
            select: 2
          }).routine = srcRoutine, i = e.vectorize(c), n.identical(i(1, 1), [ 1, 1 ]), n.identical(i([ 1 ], 1), [ [ 1 ], 1 ]), 
          n.identical(i({
            a: 1
          }, "b"), {
            "a,b": 1
          }), n.identical(i("a", {
            b: 1,
            c: 2
          }), {
            "a,b": 1,
            "a,c": 2
          }), n.identical(i([ "a" ], {
            b: 1,
            c: 2
          }), {
            "a,b": 1,
            "a,c": 2
          }), n.identical(i({
            b: 1,
            c: 2
          }, [ "a" ]), {
            "b,a": 1,
            "c,a": 2
          }), n.shouldThrowError(() => i(1, 2, 3)), n.close("vectorizingMapKeys : 1, select : 2"), 
          n.open("vectorizingMapKeys : 1, vectorizingArray : 1, select : 2"), (c = {
            vectorizingArray: 1,
            vectorizingMapVals: 0,
            vectorizingMapKeys: 1,
            select: 2
          }).routine = srcRoutine, i = e.vectorize(c), n.identical(i([ 1, 2 ], 3), [ [ 1, 3 ], [ 2, 3 ] ]), 
          n.identical(i(1, [ 1, 2 ]), [ [ 1, 1 ], [ 1, 2 ] ]), n.identical(i([ 1, 2 ], [ 1, 2 ]), [ [ 1, 1 ], [ 2, 2 ] ]), 
          n.identical(i(1, 2), [ 1, 2 ]), n.identical(i({
            a: 1
          }, "b"), {
            "a,b": 1
          }), n.identical(i("a", {
            b: 1,
            c: 2
          }), {
            "a,b": 1,
            "a,c": 2
          }), n.identical(i({
            a: 1
          }, 1), {
            "a,1": 1
          }), n.identical(i(1, {
            b: 1,
            c: 2
          }), {
            "1,b": 1,
            "1,c": 2
          }), n.identical(i([ 1 ], {
            b: !0
          }), {
            "1,b": !0
          }), n.identical(i([ 1, 2 ], {
            b: !0
          }), {
            "1,b": !0,
            "2,b": !0
          }), n.shouldThrowError(() => i(1, 2, 3)), n.shouldThrowError(() => i({
            a: 1
          }, {
            b: 1
          })), 
          // test.shouldThrowError( () => routine( [ 1 ], { b : 1 } ) );
          // test.shouldThrowError( () => routine( { b : 1 }, [ 1 ] ) );
          // test.shouldThrowError( () => routine( 1, [ 1 ], { b : 1 } ) );
          n.shouldThrowError(() => i([ 1 ], 1, {
            b: 1
          })), n.shouldThrowError(() => i({
            b: 1
          }, 1, [ 1 ])), n.shouldThrowError(() => i({
            b: 1
          }, [ 1 ], 1)), n.close("vectorizingMapKeys : 1, vectorizingArray : 1, select : 2"), 
          n.open("vectorizingMapKeys : 1, vectorizingArray : 1, select : 3"), (c = {
            vectorizingArray: 1,
            vectorizingMapVals: 0,
            vectorizingMapKeys: 1,
            select: 3
          }).routine = srcRoutine, i = e.vectorize(c), n.identical(i([ 1 ], {
            b: !0
          }, "c"), {
            "1,b,c": !0
          }), n.identical(i([ 1 ], {
            b: !0
          }, [ "c" ]), {
            "1,b,c": !0
          }), n.identical(i([ 1 ], {
            b: !0,
            c: !1
          }, "d"), {
            "1,b,d": !0,
            "1,c,d": !1
          }), n.identical(i([ 1, 2 ], {
            b: !0
          }, "c"), {
            "1,b,c": !0,
            "2,b,c": !0
          }), o = i([ 1, 2 ], {
            b: !0,
            c: !1
          }, [ "d", "e" ]), r = {
            "1,b,d": !0,
            "1,c,d": !1,
            "2,b,e": !0,
            "2,c,e": !1
          }, n.identical(o, r), o = i([ 1, 2 ], [ "d", "e" ], {
            b: !0,
            c: !1
          }), r = {
            "1,d,b": !0,
            "1,d,c": !1,
            "2,e,b": !0,
            "2,e,c": !1
          }, n.identical(o, r), o = i({
            b: !0,
            c: !1
          }, [ 1, 2 ], [ "d", "e" ]), r = {
            "b,1,d": !0,
            "c,1,d": !1,
            "b,2,e": !0,
            "c,2,e": !1
          }, n.identical(o, r), o = i([ 1, 2 ], {
            b: !0,
            c: !1,
            d: !0
          }, [ "e", "f" ]), r = {
            "1,b,e": !0,
            "1,c,e": !1,
            "1,d,e": !0,
            "2,b,f": !0,
            "2,c,f": !1,
            "2,d,f": !0
          }, n.identical(o, r), o = i([ 1, 2 ], [ "e", "f" ], {
            b: !0,
            c: !1,
            d: !0
          }), r = {
            "1,e,b": !0,
            "1,e,c": !1,
            "1,e,d": !0,
            "2,f,b": !0,
            "2,f,c": !1,
            "2,f,d": !0
          }, n.identical(o, r), o = i({
            b: !0,
            c: !1,
            d: !0
          }, [ 1, 2 ], [ "e", "f" ]), r = {
            "b,1,e": !0,
            "c,1,e": !1,
            "d,1,e": !0,
            "b,2,f": !0,
            "c,2,f": !1,
            "d,2,f": !0
          }, n.identical(o, r), o = i(1, {
            b: !0,
            c: !1,
            d: !0
          }, 2), r = {
            "1,b,2": !0,
            "1,c,2": !1,
            "1,d,2": !0
          }, n.identical(o, r), o = i({
            b: !0,
            c: !1,
            d: !0
          }, 1, 2), r = {
            "b,1,2": !0,
            "c,1,2": !1,
            "d,1,2": !0
          }, n.identical(o, r), o = i(1, 2, {
            b: !0,
            c: !1,
            d: !0
          }), r = {
            "1,2,b": !0,
            "1,2,c": !1,
            "1,2,d": !0
          }, n.identical(o, r), o = i([ 1, 2 ], {
            b: !0
          }, "c"), r = {
            "1,b,c": !0,
            "2,b,c": !0
          }, n.identical(o, r), o = i({
            b: !0
          }, [ 1, 2 ], "c"), r = {
            "b,1,c": !0,
            "b,2,c": !0
          }, n.identical(o, r), o = i([ 1, 2 ], "c", {
            b: !0
          }), r = {
            "1,c,b": !0,
            "2,c,b": !0
          }, n.identical(o, r), o = i([ 1, 2 ], {
            b: !0,
            c: !1
          }, "d"), r = {
            "1,b,d": !0,
            "1,c,d": !1,
            "2,b,d": !0,
            "2,c,d": !1
          }, n.identical(o, r), o = i({
            b: !0,
            c: !1
          }, [ 1, 2 ], "d"), r = {
            "b,1,d": !0,
            "b,2,d": !0,
            "c,1,d": !1,
            "c,2,d": !1
          }, n.identical(o, r), o = i([ 1, 2 ], "d", {
            b: !0,
            c: !1
          }), r = {
            "1,d,b": !0,
            "1,d,c": !1,
            "2,d,b": !0,
            "2,d,c": !1
          }, n.identical(o, r), n.shouldThrowError(() => i({
            a: 1
          }, "c", {
            b: 1
          })), n.shouldThrowError(() => i([ 1 ], {
            b: !0
          }, [ "c", "d" ])), n.close("vectorizingMapKeys : 1, vectorizingArray : 1, select : 3"), 
          n.open("vectorizingMapKeys : 1, vectorizingArray : 1, vectorizingMapVals : 1, select : 1");
          var c = {
            vectorizingArray: 1,
            vectorizingMapVals: 1,
            vectorizingMapKeys: 1,
            select: 1,
            routine: function srcRoutine2(e) {
              return e + 1;
            }
          };
          i = e.vectorize(c), n.identical(i(1), 2), n.identical(i([ 1 ]), [ 2 ]), n.identical(i([ 1, 2, 3 ]), [ 2, 3, 4 ]), 
          n.identical(i({
            1: 1,
            2: 2,
            3: 3
          }), {
            11: 2,
            21: 3,
            31: 4
          }), n.close("vectorizingMapKeys : 1, vectorizingArray : 1, vectorizingMapVals : 1, select : 1");
        }
        //
        ,
        /* qqq : split test routine vectorize */
        /* qqq : add tests for vectorize* routines */
        vectorizeBypassingEmpty: function vectorizeBypassingEmpty(n) {
          function srcRoutine() {
            return e.sure(arguments.length), e.longSlice(arguments);
          }
          function srcRoutine2() {
            return e.sure(arguments.length), arguments[0] + 1;
          }
          //
                    function srcRoutine3(e) {
            return e;
          }
          function srcRoutine3(e) {
            return e;
          }
          n.open("vectorizing off, bypassingEmpty:0");
          var i = e.vectorize({
            routine: srcRoutine,
            bypassingEmpty: 0,
            vectorizingArray: 0,
            vectorizingMapVals: 0,
            vectorizingMapKeys: 0,
            select: 1
          });
          n.case = "no arg", n.shouldThrowErrorSync(() => i()), n.case = "with arg";
          var t = i(1), o = [ 1 ];
          n.identical(t, o), n.close("vectorizing off, bypassingEmpty:0"), 
          //
          n.open("vectorizing off, bypassingEmpty:0"), i = e.vectorize({
            routine: srcRoutine,
            bypassingEmpty: 1,
            vectorizingArray: 0,
            vectorizingMapVals: 0,
            vectorizingMapKeys: 0,
            select: 1
          }), n.case = "no arg", n.shouldThrowErrorSync(() => i()), n.case = "with arg", t = i(1), 
          o = [ 1 ], n.identical(t, o), n.close("vectorizing off, bypassingEmpty:0"), 
          //
          n.open("vectorizingArray:1, bypassingEmpty:0"), i = e.vectorize({
            routine: srcRoutine,
            bypassingEmpty: 0,
            vectorizingArray: 1,
            vectorizingMapVals: 0,
            vectorizingMapKeys: 0,
            select: 1
          }), n.case = "no arg", n.shouldThrowErrorSync(() => i()), n.case = "with arg", t = i(1), 
          o = [ 1 ], n.identical(t, o), n.close("vectorizingArray:1, bypassingEmpty:0"), 
          //
          n.open("vectorizingArray:1, bypassingEmpty:1"), i = e.vectorize({
            routine: srcRoutine,
            bypassingEmpty: 1,
            vectorizingArray: 1,
            vectorizingMapVals: 0,
            vectorizingMapKeys: 0,
            select: 1
          }), n.case = "no arg", t = i(), o = [], n.identical(t, o), n.case = "with arg", 
          t = i(1), o = [ 1 ], n.identical(t, o), n.close("vectorizingArray:1, bypassingEmpty:1"), 
          //
          n.open("vectorizingMapVals:1, bypassingEmpty:1"), i = e.vectorize({
            routine: srcRoutine2,
            bypassingEmpty: 1,
            vectorizingArray: 0,
            vectorizingMapVals: 1,
            vectorizingMapKeys: 0,
            select: 1
          }), n.case = "no arg", t = i(), o = [], n.identical(t, o), n.identical(i(1), 2), 
          n.identical(i([ 1 ]), "11"), n.identical(i([ 1, 2, 3 ]), "1,2,31"), n.identical(i({
            1: 1,
            2: 2,
            3: 3
          }), {
            1: 2,
            2: 3,
            3: 4
          }), n.close("vectorizingMapVals:1, bypassingEmpty:1"), 
          //
          n.open("vectorizingMapVals:1, bypassingEmpty:0"), i = e.vectorize({
            routine: srcRoutine2,
            bypassingEmpty: 0,
            vectorizingArray: 0,
            vectorizingMapVals: 1,
            vectorizingMapKeys: 0,
            select: 1
          }), n.case = "no arg", n.shouldThrowErrorSync(() => i()), n.identical(i(1), 2), 
          n.identical(i([ 1 ]), "11"), n.identical(i([ 1, 2, 3 ]), "1,2,31"), n.identical(i({
            1: 1,
            2: 2,
            3: 3
          }), {
            1: 2,
            2: 3,
            3: 4
          }), n.close("vectorizingMapVals:1, bypassingEmpty:0"), 
          //
          n.open("vectorizingArray:1, vectorizingMapVals:1, bypassingEmpty:1"), i = e.vectorize({
            routine: srcRoutine2,
            bypassingEmpty: 1,
            vectorizingArray: 1,
            vectorizingMapVals: 1,
            vectorizingMapKeys: 0,
            select: 1
          }), n.case = "no arg", t = i(), o = [], n.identical(t, o), n.identical(i(1), 2), 
          n.identical(i([ 1 ]), [ 2 ]), n.identical(i([ 1, 2, 3 ]), [ 2, 3, 4 ]), n.identical(i({
            1: 1,
            2: 2,
            3: 3
          }), {
            1: 2,
            2: 3,
            3: 4
          }), n.close("vectorizingArray:1, vectorizingMapVals:1, bypassingEmpty:1"), 
          //
          n.open("vectorizingArray:1, vectorizingMapVals:1, bypassingEmpty:0"), i = e.vectorize({
            routine: srcRoutine2,
            bypassingEmpty: 0,
            vectorizingArray: 1,
            vectorizingMapVals: 1,
            vectorizingMapKeys: 0,
            select: 1
          }), n.case = "no arg", n.shouldThrowErrorSync(() => i()), n.identical(i(1), 2), 
          n.identical(i([ 1 ]), [ 2 ]), n.identical(i([ 1, 2, 3 ]), [ 2, 3, 4 ]), n.identical(i({
            1: 1,
            2: 2,
            3: 3
          }), {
            1: 2,
            2: 3,
            3: 4
          }), n.close("vectorizingArray:1, vectorizingMapVals:1, bypassingEmpty:0"), 
          //
          n.open("vectorizingMapKeys:1, bypassingEmpty:1"), i = e.vectorize({
            routine: srcRoutine2,
            bypassingEmpty: 1,
            vectorizingArray: 0,
            vectorizingMapVals: 0,
            vectorizingMapKeys: 1,
            select: 1
          }), n.case = "no arg", t = i(), o = [], n.identical(t, o), n.identical(i(1), 2), 
          n.identical(i([ 1 ]), "11"), n.identical(i([ 1, 2, 3 ]), "1,2,31"), n.identical(i({
            1: 1,
            2: 2,
            3: 3
          }), {
            11: 1,
            21: 2,
            31: 3
          }), n.close("vectorizingMapKeys:1, bypassingEmpty:1"), 
          //
          n.open("vectorizingMapKeys:1, bypassingEmpty:0"), i = e.vectorize({
            routine: srcRoutine2,
            bypassingEmpty: 0,
            vectorizingArray: 0,
            vectorizingMapVals: 0,
            vectorizingMapKeys: 1,
            select: 1
          }), n.case = "no arg", n.shouldThrowErrorSync(() => i()), n.identical(i(1), 2), 
          n.identical(i([ 1 ]), "11"), n.identical(i([ 1, 2, 3 ]), "1,2,31"), n.identical(i({
            1: 1,
            2: 2,
            3: 3
          }), {
            11: 1,
            21: 2,
            31: 3
          }), n.close("vectorizingMapKeys:1, bypassingEmpty:0"), 
          //
          n.open("vectorizingArray:1, vectorizingMapKeys:1, bypassingEmpty:1"), i = e.vectorize({
            routine: srcRoutine2,
            bypassingEmpty: 1,
            vectorizingArray: 1,
            vectorizingMapVals: 0,
            vectorizingMapKeys: 1,
            select: 1
          }), n.case = "no arg", t = i(), o = [], n.identical(t, o), n.identical(i(1), 2), 
          n.identical(i([ 1 ]), [ 2 ]), n.identical(i([ 1, 2, 3 ]), [ 2, 3, 4 ]), n.identical(i({
            1: 1,
            2: 2,
            3: 3
          }), {
            11: 1,
            21: 2,
            31: 3
          }), n.close("vectorizingArray:1, vectorizingMapKeys:1, bypassingEmpty:1"), 
          //
          n.open("vectorizingArray:1, vectorizingMapKeys:1, bypassingEmpty:0"), i = e.vectorize({
            routine: srcRoutine2,
            bypassingEmpty: 0,
            vectorizingArray: 1,
            vectorizingMapVals: 0,
            vectorizingMapKeys: 1,
            select: 1
          }), n.case = "no arg", n.shouldThrowErrorSync(() => i()), n.identical(i(1), 2), 
          n.identical(i([ 1 ]), [ 2 ]), n.identical(i([ 1, 2, 3 ]), [ 2, 3, 4 ]), n.identical(i({
            1: 1,
            2: 2,
            3: 3
          }), {
            11: 1,
            21: 2,
            31: 3
          }), n.close("vectorizingArray:1, vectorizingMapKeys:1, bypassingEmpty:0"), 
          //
          n.open("vectorizingArray:1, vectorizingMapKeys:1, vectorizingMapVals : 1, bypassingEmpty:1"), 
          i = e.vectorize({
            routine: srcRoutine2,
            bypassingEmpty: 1,
            vectorizingArray: 1,
            vectorizingMapVals: 1,
            vectorizingMapKeys: 1,
            select: 1
          }), n.case = "no arg", t = i(), o = [], n.identical(t, o), n.identical(i(1), 2), 
          n.identical(i([ 1 ]), [ 2 ]), n.identical(i([ 1, 2, 3 ]), [ 2, 3, 4 ]), n.identical(i({
            1: 1,
            2: 2,
            3: 3
          }), {
            11: 2,
            21: 3,
            31: 4
          }), n.close("vectorizingArray:1, vectorizingMapKeys:1, vectorizingMapVals : 1, bypassingEmpty:1"), 
          //
          n.open("vectorizingArray:1, vectorizingMapKeys:1, vectorizingMapVals : 1, bypassingEmpty:0"), 
          i = e.vectorize({
            routine: srcRoutine2,
            bypassingEmpty: 0,
            vectorizingArray: 1,
            vectorizingMapVals: 1,
            vectorizingMapKeys: 1,
            select: 1
          }), n.case = "no arg", n.shouldThrowErrorSync(() => i()), n.identical(i(1), 2), 
          n.identical(i([ 1 ]), [ 2 ]), n.identical(i([ 1, 2, 3 ]), [ 2, 3, 4 ]), n.identical(i({
            1: 1,
            2: 2,
            3: 3
          }), {
            11: 2,
            21: 3,
            31: 4
          }), n.close("vectorizingArray:1, vectorizingMapKeys:1, vectorizingMapVals : 1, bypassingEmpty:0"), 
          // vectorizeForOptionsMapForKeys
          n.open("vectorizingArray:1, select : array, bypassingEmpty:0"), i = e.vectorize({
            routine: srcRoutine3,
            bypassingEmpty: 0,
            vectorizingArray: 1,
            vectorizingMapVals: 0,
            vectorizingMapKeys: 0,
            select: [ "0" ]
          }), n.case = "no arg", n.shouldThrowErrorSync(() => i()), n.identical(i(1), [ 1 ]), 
          n.identical(i([ 1 ]), [ [ 1 ] ]), n.identical(i([ [ 1 ] ]), [ [ {
            0: 1
          } ] ]), n.identical(i({
            0: [ 1 ]
          }), [ [ {
            0: 1
          } ] ]), n.close("vectorizingArray:1, select : array, bypassingEmpty:0"), 
          //
          n.open("vectorizingArray:1, select : array, bypassingEmpty:1"), i = e.vectorize({
            routine: srcRoutine3,
            bypassingEmpty: 1,
            vectorizingArray: 1,
            vectorizingMapVals: 0,
            vectorizingMapKeys: 0,
            select: [ "0" ]
          }), n.identical(i(), []), n.identical(i(1), [ 1 ]), n.identical(i([ 1 ]), [ [ 1 ] ]), 
          n.identical(i([ [ 1 ] ]), [ [ {
            0: 1
          } ] ]), n.identical(i({
            0: [ 1 ]
          }), [ [ {
            0: 1
          } ] ]), n.close("vectorizingArray:1, select : array, bypassingEmpty:1");
        }
      }
    };
    i = wTestSuite(i), "undefined" == typeof module || module.parent || wTester.test(i.name);
  }();
  // == end of file RoutineTestS
}();