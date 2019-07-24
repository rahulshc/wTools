!function EntityTestS() {
  // == begin of file EntityTestS
  !function _Entity_test_s_() {
    "use strict";
    //
    function eachSampleExperiment(t) {
      debugger;
      var n = e.eachSample({
        sets: [ [ 0, 1 ], [ 2, 3 ] ]
      }), i = [ [ 0, 2 ], [ 1, 2 ], [ 0, 3 ], [ 1, 3 ] ];
      t.identical(n, i), t.isNot(e.unrollIs(n)), t.is(e.arrayIs(n)), n = e.eachSample({
        sets: [ e.unrollMake([ 0, 1 ]), e.unrollMake([ 2, 3 ]) ]
      }), i = [ [ 0, 2 ], [ 1, 2 ], [ 0, 3 ], [ 1, 3 ] ], t.identical(n, i), t.isNot(e.unrollIs(n)), 
      t.is(e.arrayIs(n));
    }
    "undefined" != typeof module && require("../Layer2.s").include("wTesting"), _global_;
    var e = _global_.wTools, t = {};
    eachSampleExperiment.experimental = 1, t = {
      name: "Tools/base/l1/Entity",
      silencing: 1,
      // verbosity : 4,
      // importanceOfNegative : 3,
      tests: {
        eachSample: 
        // --
        // routines
        // --
        function eachSample(t) {
          t.case = "empty sets";
          var n = e.eachSample([]), i = [ [] ];
          t.identical(n, i), n = e.eachSample({
            sets: {}
          }), i = [ {} ], t.identical(n, i), n = e.eachSample({}, null), i = [ {} ], t.identical(n, i), 
          t.case = "empty sets and unroll, Array", n = e.eachSample(e.unrollMake([])), i = [ [] ], 
          t.identical(n, i), t.is(e.arrayIs(n)), t.isNot(e.unrollIs(n)), n = e.eachSample(new Array()), 
          i = [ [] ], t.identical(n, i), t.is(e.arrayIs(n));
          var a = e.arrayFrom(new Float32Array());
          n = e.eachSample(a), i = [ [] ], t.identical(n, i), t.is(e.arrayIs(n)), n = e.eachSample(e.argumentsArrayMake(0), null), 
          i = [ [] ], t.identical(n, i), t.is(e.arrayIs(n)), 
          /* - */
          t.case = "sets with primitive", n = e.eachSample([ 1 ]), i = [ [ 1 ] ], t.identical(n, i), 
          n = e.eachSample({
            a: 1
          }, null), i = [ {
            a: 1
          } ], t.identical(n, i), n = e.eachSample([ 1, 2, null ]), i = [ [ 1, 2, null ] ], 
          t.identical(n, i), n = e.eachSample({
            a: 1,
            b: 2,
            c: null
          }, null), i = [ {
            a: 1,
            b: 2,
            c: null
          } ], t.identical(n, i), t.case = "sets with primitive and unroll, Array", n = e.eachSample(e.unrollMake([ 1 ])), 
          i = [ [ 1 ] ], t.identical(n, i), t.is(e.arrayIs(n)), t.isNot(e.unrollIs(n)), n = e.eachSample(new Array([ 1 ])), 
          i = [ [ 1 ] ], t.identical(n, i), t.is(e.arrayIs(n)), a = e.arrayFrom(new Float32Array([ 1 ])), 
          n = e.eachSample(a), i = [ [ 1 ] ], t.identical(n, i), t.is(e.arrayIs(n)), n = e.eachSample(e.argumentsArrayMake([ 1 ]), null), 
          i = [ [ 1 ] ], t.identical(n, i), t.is(e.arrayIs(n)), 
          /* - */
          t.case = "sets with empty array, empty map", n = e.eachSample([ [] ]), i = [ [ void 0 ] ], 
          t.identical(n, i), n = e.eachSample({
            a: []
          }, null), i = [ {
            a: void 0
          } ], t.identical(n, i), n = e.eachSample([ [], [] ]), i = [ [ void 0, void 0 ] ], 
          t.identical(n, i), n = e.eachSample({
            a: [],
            b: []
          }, null), i = [ {
            a: void 0,
            b: void 0
          } ], t.identical(n, i), n = e.eachSample([ [], [], [] ]), i = [ [ void 0, void 0, void 0 ] ], 
          t.identical(n, i), n = e.eachSample({
            a: [],
            b: [],
            c: []
          }, null), i = [ {
            a: void 0,
            b: void 0,
            c: void 0
          } ], t.identical(n, i), t.case = "sets with empty unrolls, Arrays", n = e.eachSample(e.unrollMake([ [], [] ])), 
          i = [ [ void 0, void 0 ] ], t.identical(n, i), t.isNot(e.unrollIs(n)), t.is(e.arrayIs(n)), 
          n = e.eachSample(new Array([ [], [], [] ])), i = [ [ [] ], [ [] ], [ [] ] ], t.identical(n, i), 
          t.is(e.arrayIs(n)), a = e.arrayFrom(new Float32Array([ [], [], [] ])), n = e.eachSample(a), 
          i = [ [ 0, 0, 0 ] ], t.identical(n, i), t.is(e.arrayIs(n)), n = e.eachSample(e.argumentsArrayMake([ [], [] ])), 
          i = [ [ void 0, void 0 ] ], t.identical(n, i), t.is(e.arrayIs(n)), 
          /* - */
          t.case = "sets with primitive, result : null", n = e.eachSample({
            sets: [ 1, 2, 3 ],
            result: 0
          }), i = 0, t.identical(n, i), n = e.eachSample({
            sets: {
              a: 1,
              b: 2,
              c: null
            },
            result: 0
          }), i = 0, t.identical(n, i), t.case = "sets with unroll, Array, result : null", 
          n = e.eachSample({
            sets: e.unrollMake([ 1, 2, 3 ]),
            result: 0
          }), i = 0, t.identical(n, i), t.is(e.primitiveIs(n)), n = e.eachSample({
            sets: new Array([ 1, 2, 3 ]),
            result: 0
          }), i = 2, t.identical(n, i), t.is(e.primitiveIs(n)), a = e.arrayFrom(new Float32Array([ 1, 2, 3 ])), 
          n = e.eachSample({
            sets: a,
            result: 0
          }), i = 0, t.identical(n, i), t.is(e.primitiveIs(n)), n = e.eachSample({
            sets: e.argumentsArrayMake([ 1, 2, 3 ]),
            result: 0
          }), i = 0, t.identical(n, i), t.is(e.primitiveIs(n)), 
          /* - */
          t.case = "sets with single not empty array, single not empty map", n = e.eachSample([ [ 1, 2, null, "str" ] ]), 
          i = [ [ 1 ], [ 2 ], [ null ], [ "str" ] ], t.identical(n, i), n = e.eachSample({
            a: [ 1, 2, null, "str" ]
          }, null), i = [ {
            a: 1
          }, {
            a: 2
          }, {
            a: null
          }, {
            a: "str"
          } ], t.identical(n, i), t.case = "sets with single not empty unroll, Array", n = e.eachSample(e.unrollMake([ [ 1, 2, null, "str" ] ])), 
          i = [ [ 1 ], [ 2 ], [ null ], [ "str" ] ], t.identical(n, i), t.isNot(e.unrollIs(n)), 
          t.is(e.arrayIs(n)), n = e.eachSample(e.argumentsArrayMake([ [ 1, 2, null, "str" ] ])), 
          i = [ [ 1 ], [ 2 ], [ null ], [ "str" ] ], t.identical(n, i), t.is(e.arrayIs(n)), 
          n = e.eachSample(new Array([ [ 1, 2, null, "str" ] ])), i = [ [ [ 1, 2, null, "str" ] ] ], 
          t.identical(n, i), t.is(e.arrayIs(n)), a = e.arrayFrom(new Float32Array([ [ 1, 2, 3 ] ])), 
          n = e.eachSample(a), t.notIdentical(n, [ [ [ 1, 2, 3 ] ] ]), t.is(e.arrayIs(n)), 
          /* - */
          t.case = "simplest, leftToRight : 1", n = e.eachSample({
            sets: [ [ 0, 1 ], [ 2, 3 ] ]
          }), i = [ [ 0, 2 ], [ 1, 2 ], [ 0, 3 ], [ 1, 3 ] ], t.identical(n, i), n = e.eachSample({
            sets: {
              a: [ 0, 1 ],
              b: [ 2, 3 ]
            }
          }), i = [ {
            a: 0,
            b: 2
          }, {
            a: 1,
            b: 2
          }, {
            a: 0,
            b: 3
          }, {
            a: 1,
            b: 3
          } ], t.identical(n, i), n = e.eachSample({
            sets: [ [ 0, 1 ], [ 2, 3 ], 6 ]
          }), i = [ [ 0, 2, 6 ], [ 1, 2, 6 ], [ 0, 3, 6 ], [ 1, 3, 6 ] ], t.identical(n, i), 
          n = e.eachSample({
            sets: {
              a: [ 0, 1 ],
              b: [ 2, 3 ],
              c: 6
            }
          }), i = [ {
            a: 0,
            b: 2,
            c: 6
          }, {
            a: 1,
            b: 2,
            c: 6
          }, {
            a: 0,
            b: 3,
            c: 6
          }, {
            a: 1,
            b: 3,
            c: 6
          } ], t.identical(n, i), n = e.eachSample({
            sets: [ [ 0, 1 ], [ 2, 3 ], [ 6, null ] ]
          }), i = [ [ 0, 2, 6 ], [ 1, 2, 6 ], [ 0, 3, 6 ], [ 1, 3, 6 ], [ 0, 2, null ], [ 1, 2, null ], [ 0, 3, null ], [ 1, 3, null ] ], 
          t.identical(n, i), n = e.eachSample({
            sets: {
              a: [ 0, 1 ],
              b: [ 2, 3 ],
              c: [ 6, null ]
            }
          }), i = [ {
            a: 0,
            b: 2,
            c: 6
          }, {
            a: 1,
            b: 2,
            c: 6
          }, {
            a: 0,
            b: 3,
            c: 6
          }, {
            a: 1,
            b: 3,
            c: 6
          }, {
            a: 0,
            b: 2,
            c: null
          }, {
            a: 1,
            b: 2,
            c: null
          }, {
            a: 0,
            b: 3,
            c: null
          }, {
            a: 1,
            b: 3,
            c: null
          } ], t.identical(n, i), n = e.eachSample({
            sets: [ e.argumentsArrayMake([ 0, 1 ]), e.argumentsArrayMake([ 2, 3 ]) ]
          }), i = [ [ 0, 2 ], [ 1, 2 ], [ 0, 3 ], [ 1, 3 ] ], t.identical(n, i), t.is(e.arrayIs(n)), 
          n = e.eachSample({
            sets: [ new Array([ 0, 1 ]), new Array([ 2, 3 ]) ]
          }), i = [ [ [ 0, 1 ], [ 2, 3 ] ] ], t.identical(n, i), t.is(e.arrayIs(n));
          var r = e.arrayFrom(new Float32Array([ 0, 1 ])), l = e.arrayFrom(new Float32Array([ 2, 3 ]));
          n = e.eachSample({
            sets: [ r, l ]
          }), i = [ [ 0, 2 ], [ 1, 2 ], [ 0, 3 ], [ 1, 3 ] ], t.identical(n, i), t.is(e.arrayIs(n)), 
          /* - */
          t.case = "simplest leftToRight : 0", n = e.eachSample({
            sets: [ [ 0, 1 ], [ 5, 6 ] ],
            leftToRight: 0
          }), i = [ [ 0, 5 ], [ 0, 6 ], [ 1, 5 ], [ 1, 6 ] ], t.identical(n, i), n = e.eachSample({
            sets: {
              a: [ 0, 1 ],
              b: [ 5, 6 ]
            },
            leftToRight: 0
          }), i = [ {
            a: 0,
            b: 5
          }, {
            a: 0,
            b: 6
          }, {
            a: 1,
            b: 5
          }, {
            a: 1,
            b: 6
          } ], t.identical(n, i), n = e.eachSample({
            sets: [ [ 0, 1 ], [ "str", null ], [ !0, 2 ] ],
            leftToRight: 0
          }), i = [ [ 0, "str", !0 ], [ 0, "str", 2 ], [ 0, null, !0 ], [ 0, null, 2 ], [ 1, "str", !0 ], [ 1, "str", 2 ], [ 1, null, !0 ], [ 1, null, 2 ] ], 
          t.identical(n, i), 
          /* - */
          t.case = "simplest, leftToRight : 1, result : 0", n = e.eachSample({
            sets: [ [ 0, 1 ], [ 2, 3 ] ],
            result: 0
          }), i = 3, t.identical(n, i), n = e.eachSample({
            sets: {
              a: [ 0, 1 ],
              b: [ 2, 3 ]
            },
            result: 0
          }), i = 3, t.identical(n, i), n = e.eachSample({
            sets: [ [ 0, 1 ], [ 2, 3 ], 6 ],
            result: 0
          }), i = 3, t.identical(n, i), n = e.eachSample({
            sets: {
              a: [ 0, 1 ],
              b: [ 2, 3 ],
              c: 6
            },
            result: 0
          }), i = 3, t.identical(n, i), n = e.eachSample({
            sets: [ [ 0, 1 ], [ 2, 3 ], [ 6, null ] ],
            result: 0
          }), i = 7, t.identical(n, i), n = e.eachSample({
            sets: {
              a: [ 0, 1 ],
              b: [ 2, 3 ],
              c: [ 6, null ]
            },
            result: 0
          }), i = 7, t.identical(n, i), t.case = "simplest, leftToRight : 1, unroll, Array", 
          n = e.eachSample({
            sets: [ e.unrollMake([ 0, 1 ]), e.unrollMake([ 2, 3 ]) ],
            result: 0
          }), i = 3, t.identical(n, i), t.is(e.primitiveIs(n)), n = e.eachSample({
            sets: [ e.argumentsArrayMake([ 0, 1 ]), e.argumentsArrayMake([ 2, 3 ]) ],
            result: 0
          }), i = 3, t.identical(n, i), t.is(e.primitiveIs(n)), n = e.eachSample({
            sets: [ new Array([ 0, 1 ]), new Array([ 2, 3 ]) ],
            result: 0
          }), i = 0, t.identical(n, i), t.is(e.primitiveIs(n)), r = e.arrayFrom(new Float32Array([ 0, 1 ])), 
          l = e.arrayFrom(new Float32Array([ 2, 3 ])), n = e.eachSample({
            sets: [ r, l ],
            result: 0
          }), i = 3, t.identical(n, i), t.is(e.primitiveIs(n)), t.case = "not argument, extra arguments", 
          t.shouldThrowErrorSync(() => e.eachSample()), t.shouldThrowErrorSync(() => e.eachSample([ [ 1 ], [ 2 ] ], null, [ 1 ])), 
          t.case = "o.sets is not arraylike, not mapLike", t.shouldThrowErrorSync(() => e.eachSample({})), 
          t.shouldThrowErrorSync(() => e.eachSample(1)), t.shouldThrowErrorSync(() => e.eachSample("str", null)), 
          t.case = "onEach is not a routine or null", t.shouldThrowErrorSync(() => e.eachSample([ [ 1 ], [ 2 ] ], "str")), 
          t.case = "o.base has a value";
          var c = {
            sets: [ [ 1, 0 ], [ 2, 3 ] ],
            base: [ 5 ]
          };
          t.shouldThrowErrorSync(() => e.eachSample(c)), t.case = "o.add has a value", c = {
            sets: [ [ 1, 0 ], [ 2, 3 ] ],
            add: [ 5 ]
          }, t.shouldThrowErrorSync(() => e.eachSample(c));
        },
        eachSampleExperiment: eachSampleExperiment,
        entityEach: 
        //
        function entityEach(t) {
          t.open("src is an ArrayLike"), t.case = "empty arrayLike objects";
          var n = [];
          e.entityEach(n, e => i = typeof e), t.identical(i, void 0);
          var i = [];
          n = e.unrollMake(0), e.entityEach(n, (e, t) => i[t] = e + t), t.identical(i, []), 
          t.isNot(e.unrollIs(i)), t.is(e.arrayIs(i)), i = [], n = e.argumentsArrayMake(0), 
          e.entityEach(n, (e, t) => i[t] = e + t), t.identical(i, []), t.is(e.arrayIs(i)), 
          i = [], n = new Array(0), e.entityEach(n, (e, t) => i[t] = e + t), t.identical(i, n), 
          t.is(e.arrayIs(i)), i = [], n = new Float32Array(0), e.entityEach(n, (e, t) => i[t] = e + t), 
          t.identical(i, []), t.is(e.arrayIs(i)), 
          //
          t.case = "not empty arrayLike objects", i = [], n = [ 0, 1, 2 ], e.entityEach(n, (e, t) => i[t] = e * e + t), 
          t.identical(i, [ 0, 2, 6 ]), i = [], n = e.unrollMake([ 0, 1, e.unrollMake([ 2 ]) ]), 
          e.entityEach(n, (e, t) => i[t] = e * e + t), t.identical(i, [ 0, 2, 6 ]), t.isNot(e.unrollIs(i)), 
          t.is(e.arrayIs(n)), i = [], n = e.argumentsArrayMake([ 0, 1, 2 ]), e.entityEach(n, (e, t) => i[t] = e * e + t), 
          t.identical(i, [ 0, 2, 6 ]), t.is(e.longIs(n)), i = [], n = new Array(0, 1, 2), 
          e.entityEach(n, (e, t) => i[t] = e * e + t), t.identical(i, [ 0, 2, 6 ]), t.is(e.longIs(n)), 
          i = [], n = new Float32Array([ 0, 1, 2 ]), e.entityEach(n, (e, t) => i[t] = e * e + t), 
          t.identical(i, [ 0, 2, 6 ]), t.is(e.longIs(n)), 
          //
          t.case = "routine counter";
          var a = function(t, n) {
            e.strIs(t) && n >= 0 ? i += 10 : i -= 1;
          };
          i = 0, e.entityEach(1, a), t.identical(i, -1), i = 0, e.entityEach("abc", a), t.identical(i, -1), 
          i = 0, e.entityEach([ "abc", 1, "ab", "a" ], a), t.identical(i, 29), i = 0, e.entityEach([ {
            a: 1
          }, {
            b: 2
          } ], a), t.identical(i, -2), i = 0, n = e.unrollFrom([ 1, "str", e.unrollMake([ 2, "str" ]) ]), 
          e.entityEach(n, a), t.identical(i, 18), i = 0, n = e.argumentsArrayMake([ 1, "str", [ 2, "str" ] ]), 
          e.entityEach(n, a), t.identical(i, 8), i = 0, n = new Array(1, "str", [ 2, "str" ]), 
          e.entityEach(n, a), t.identical(i, 8), i = 0, n = new Float32Array([ 1, 1, [ 2 ] ]), 
          e.entityEach(n, a), t.identical(i, -3), t.case = "Third argument in onEach", a = function(t, n, a) {
            e.longIs(a) ? i = a : i += 10;
          }, n = [ 0, 1, 3, 5 ], e.entityEach(n, a), t.identical(i, n), n = e.unrollMake([ 0, 1, e.unrollFrom([ 3, 5 ]) ]), 
          e.entityEach(n, a), t.identical(i, [ 0, 1, 3, 5 ]), t.is(e.unrollIs(i)), t.is(e.arrayIs(i)), 
          n = e.argumentsArrayMake([ 0, 1, [ 3, 5 ] ]), e.entityEach(n, a), t.identical(i, n), 
          t.is(e.longIs(i)), n = new Array(1, 2, null, !0), e.entityEach(n, a), t.identical(i, n), 
          t.is(e.longIs(i)), n = new Float32Array([ 1, 2, 1, 3 ]), e.entityEach(n, a), t.equivalent(i, [ 1, 2, 1, 3 ]), 
          t.is(e.longIs(i)), t.close("src is an ArrayLike"), 
          /* - */
          t.open("src is an object"), i = {}, e.entityEach({}, e => i = e), t.identical(i, {}), 
          i = {}, e.entityEach(Object.create(null), (e, t) => i[t] = e + t), t.identical(i, {}), 
          i = {}, e.entityEach({
            a: 1,
            b: 3,
            c: 5
          }, (e, t) => i[t] = e * e + t), t.identical(i, {
            a: "1a",
            b: "9b",
            c: "25c"
          }), 
          //
          t.case = "routine counter", a = function(t, n) {
            e.strIs(t) && n ? i += 10 : i -= 1;
          }, i = 0, e.entityEach("abc", a), t.identical(i, -1), i = 0, e.entityEach({
            a: "abc",
            b: {
              a: 1
            },
            c: [ null ],
            d: void 0
          }, a), t.identical(i, 7), i = 0, e.entityEach({
            a: "abc",
            b: 1,
            c: "ab",
            d: "a"
          }, a), t.identical(i, 29), 
          //
          t.case = "Third argument in onEach", a = function(t, n, a) {
            e.objectIs(a) ? i = a : i += 10;
          }, i = {}, n = {
            a: 1,
            b: 2,
            c: 3
          }, e.entityEach(n, a), t.identical(i, n), t.close("src is an object"), 
          /* - */
          t.case = "src is not ArrayLike or ObjectLike", e.entityEach(null, e => i = typeof e), 
          t.identical(i, "object"), e.entityEach(1, e => i = typeof e), t.identical(i, "number"), 
          e.entityEach("a", e => i = e + 2), t.identical(i, "a2"), e.entityEach(function b() {
            return "a";
          }, e => i = typeof e), t.identical(i, "function"), e.entityEach(function b() {
            return "a";
          }, (e, t) => i = typeof e + " " + typeof t), t.identical(i, "function undefined"), 
          t.case = "without arguments", t.shouldThrowErrorSync(() => e.entityEach()), t.case = "only one argument", 
          t.shouldThrowErrorSync(() => e.entityEach([ "a" ])), t.case = "too many arguments", 
          t.shouldThrowErrorSync(() => e.entityEach([ "a" ], e => e, e => e)), t.case = "onEach has more then three args", 
          t.shouldThrowErrorSync(() => e.entityEach([ 1 ], (e, t, n, i) => e + t + n + i)), 
          t.case = "onEach is not a routine", t.shouldThrowErrorSync(() => e.entityEach({
            a: 2
          }, []));
        }
        //
        ,
        entityEachKey: function entityEachKey(t) {
          t.open("src is an ArrayLike"), t.case = "empty arrayLike objects";
          var n = [];
          e.entityEachKey(n, e => i = typeof e), t.identical(i, void 0);
          var i = [];
          n = e.unrollMake(0), e.entityEachKey(n, (e, t) => i[t] = e + t), t.identical(i, []), 
          t.isNot(e.unrollIs(i)), t.is(e.arrayIs(i)), i = [], n = e.argumentsArrayMake(0), 
          e.entityEachKey(n, (e, t) => i[t] = e + t), t.identical(i, []), t.is(e.longIs(n)), 
          i = [], n = new Array(0), e.entityEachKey(n, (e, t) => i[t] = e + t), t.identical(i, n), 
          t.is(e.longIs(n)), i = [], n = new Float32Array(0), e.entityEachKey(n, (e, t) => i[t] = e + t), 
          t.identical(i, []), 
          //
          t.case = "not empty arrayLike objects", i = [], n = [ 0, 1, 2 ], e.entityEachKey(n, (e, t, n) => i[n] = e * e), 
          t.identical(i, [ 0, 1, 4 ]), i = [], n = e.unrollMake([ 0, 1, e.unrollMake([ 2 ]) ]), 
          e.entityEachKey(n, (e, t, n) => i[n] = e * e), t.identical(i, [ 0, 1, 4 ]), t.isNot(e.unrollIs(i)), 
          t.is(e.arrayIs(n)), i = [], n = e.argumentsArrayMake([ 0, 1, 2 ]), e.entityEachKey(n, (e, t, n) => i[n] = e * e), 
          t.identical(i, [ 0, 1, 4 ]), t.is(e.longIs(n)), i = [], n = new Array(0, 1, 2), 
          e.entityEachKey(n, (e, t, n) => i[n] = e * e), t.identical(i, [ 0, 1, 4 ]), t.is(e.longIs(n)), 
          i = [], n = new Float32Array([ 0, 1, 2 ]), e.entityEachKey(n, (e, t, n) => i[n] = e * e), 
          t.identical(i, [ 0, 1, 4 ]), t.is(e.longIs(n)), 
          //
          t.case = "routine counter";
          var a = function(t, n) {
            e.strIs(t) && void 0 === n ? i += 10 : i -= 1;
          };
          i = 0, e.entityEachKey(1, a), t.identical(i, -1), i = 0, e.entityEachKey("abc", a), 
          t.identical(i, 10), i = 0, e.entityEachKey([ "abc", 1, "ab", "a", {
            a: 1
          } ], a), t.identical(i, 28), i = 0, n = e.unrollFrom([ 1, "str", e.unrollMake([ {
            a: "abc"
          }, "str" ]) ]), e.entityEachKey(n, a), t.identical(i, 18), i = 0, n = e.argumentsArrayMake([ 1, "str", [ [ "abc" ], "str" ] ]), 
          e.entityEachKey(n, a), t.identical(i, 8), i = 0, n = new Array(1, "str", [ 2, "str" ]), 
          e.entityEachKey(n, a), t.identical(i, 8), i = 0, n = new Float32Array([ 1, 1, [ 2 ] ]), 
          e.entityEachKey(n, a), t.identical(i, -3), t.case = "Third argument in onEach", 
          a = function(t, a, r) {
            e.longIs(arguments[3]) ? i = n : i += 10;
          }, n = [ 0, 1, 3, 5 ], e.entityEachKey(n, a), t.identical(i, n), n = e.unrollMake([ 0, 1, e.unrollFrom([ 3, 5 ]) ]), 
          e.entityEachKey(n, a), t.identical(i, [ 0, 1, 3, 5 ]), t.is(e.unrollIs(i)), t.is(e.arrayIs(i)), 
          n = e.argumentsArrayMake([ 0, 1, [ 3, 5 ] ]), e.entityEachKey(n, a), t.identical(i, n), 
          t.is(e.longIs(i)), n = new Array(1, 2, null, !0), e.entityEachKey(n, a), t.identical(i, n), 
          t.is(e.longIs(i)), n = new Float32Array([ 1, 2, 1, 3 ]), e.entityEachKey(n, a), 
          t.equivalent(i, [ 1, 2, 1, 3 ]), t.is(e.longIs(i)), t.close("src is an ArrayLike"), 
          /* - */
          t.open("src is an ObjectLike"), t.case = "not onEach", i = {}, e.entityEachKey({}, e => i = e), 
          t.identical(i, {}), i = {}, e.entityEachKey(Object.create(null), (e, t) => i[t] = e + t), 
          t.identical(i, {}), i = {}, e.entityEachKey({
            a: 1,
            b: 3,
            c: 5
          }, (e, t) => i[e] = t * t + e), t.identical(i, {
            a: "1a",
            b: "9b",
            c: "25c"
          }), 
          //
          t.case = "routine counter", a = function(t, n) {
            e.strIs(n) && t ? i += 10 : i -= 1;
          }, i = 0, e.entityEachKey("abc", a), t.identical(i, -1), i = 0, e.entityEachKey({
            a: "abc"
          }, a), t.identical(i, 10), i = 0, e.entityEachKey({
            a: "abc",
            b: 1,
            c: "ab",
            d: null
          }, a), t.identical(i, 18), i = 0, e.entityEachKey({
            a: [ "a", "b" ],
            b: {
              e: 1
            }
          }, a), t.identical(i, -2), 
          //
          t.case = "Third argument in onEach", a = function(e, t, n) {
            i[n] = e + t;
          }, i = {}, e.entityEachKey({
            a: 1,
            b: 2,
            c: 3
          }, a), t.identical(i, {
            0: "a1",
            1: "b2",
            2: "c3"
          }), t.close("src is an ObjectLike"), 
          /* - */
          t.case = "src is not ArrayLike or ObjectLike", e.entityEachKey(null, e => i = typeof e), 
          t.identical(i, "object"), e.entityEachKey(1, e => i = typeof e), t.identical(i, "number"), 
          e.entityEachKey("a", e => i = e + 2), t.identical(i, "a2"), e.entityEachKey(function b() {
            return "a";
          }, (e, t) => i = typeof e + " " + typeof t), t.identical(i, "function undefined"), 
          t.case = "without arguments", t.shouldThrowErrorSync(() => e.entityEachKey()), t.case = "only one argument", 
          t.shouldThrowErrorSync(() => e.entityEachKey([ "a" ])), t.case = "too many arguments", 
          t.shouldThrowErrorSync(() => e.entityEachKey([ "a" ], e => e, e => e)), t.case = "onEach has more then three arg", 
          t.shouldThrowErrorSync(() => e.entityEachKey([ 1 ], (e, t, n, i) => e + t + n + i)), 
          t.case = "onEach is not a routine", t.shouldThrowErrorSync(() => e.entityEachKey({
            a: 2
          }, []));
        }
        //
        ,
        entityEachOwn: function entityEachOwn(t) {
          t.open("src is an ArrayLike"), t.case = "empty arrayLike objects";
          var n = [];
          e.entityEachOwn(n, e => i = typeof e), t.identical(i, void 0);
          var i = [];
          n = e.unrollMake(0), e.entityEachOwn(n, (e, t) => i[t] = e + t), t.identical(i, []), 
          t.isNot(e.unrollIs(i)), t.is(e.arrayIs(i)), i = [], n = e.argumentsArrayMake(0), 
          e.entityEachOwn(n, (e, t) => i[t] = e + t), t.identical(i, []), t.is(e.arrayIs(i)), 
          i = [], n = new Array(0), e.entityEachOwn(n, (e, t) => i[t] = e + t), t.identical(i, n), 
          t.is(e.arrayIs(i)), i = [], n = new Float32Array(0), e.entityEachOwn(n, (e, t) => i[t] = e + t), 
          t.identical(i, []), t.is(e.arrayIs(i)), 
          //
          t.case = "not empty arrayLike objects", i = [], n = [ 0, 1, 2 ], e.entityEachOwn(n, (e, t) => i[t] = e * e + t), 
          t.identical(i, [ 0, 2, 6 ]), i = [], n = e.unrollMake([ 0, 1, e.unrollMake([ 2 ]) ]), 
          e.entityEachOwn(n, (e, t) => i[t] = e * e + t), t.identical(i, [ 0, 2, 6 ]), t.isNot(e.unrollIs(i)), 
          t.is(e.arrayIs(n)), i = [], n = e.argumentsArrayMake([ 0, 1, 2 ]), e.entityEachOwn(n, (e, t) => i[t] = e * e + t), 
          t.identical(i, [ 0, 2, 6 ]), t.is(e.longIs(n)), i = [], n = new Array(0, 1, 2), 
          e.entityEachOwn(n, (e, t) => i[t] = e * e + t), t.identical(i, [ 0, 2, 6 ]), t.is(e.longIs(n)), 
          i = [], n = new Float32Array([ 0, 1, 2 ]), e.entityEachOwn(n, (e, t) => i[t] = e * e + t), 
          t.identical(i, [ 0, 2, 6 ]), t.is(e.longIs(n)), 
          //
          t.case = "routine counter";
          var a = function(t, n) {
            e.strIs(t) && n >= 0 ? i += 10 : i -= 1;
          };
          i = 0, e.entityEachOwn(1, a), t.identical(i, -1), i = 0, e.entityEachOwn("abc", a), 
          t.identical(i, -1), i = 0, e.entityEachOwn([ "abc", 1, "ab", "a" ], a), t.identical(i, 29), 
          i = 0, e.entityEachOwn([ {
            a: 1
          }, {
            b: 2
          } ], a), t.identical(i, -2), i = 0, n = e.unrollFrom([ 1, "str", e.unrollMake([ 2, "str" ]) ]), 
          e.entityEachOwn(n, a), t.identical(i, 18), i = 0, n = e.argumentsArrayMake([ 1, "str", [ 2, "str" ] ]), 
          e.entityEachOwn(n, a), t.identical(i, 8), i = 0, n = new Array(1, "str", [ 2, "str" ]), 
          e.entityEachOwn(n, a), t.identical(i, 8), i = 0, n = new Float32Array([ 1, 1, [ 2 ] ]), 
          e.entityEachOwn(n, a), t.identical(i, -3), t.case = "Third argument in onEach", 
          a = function(t, n, a) {
            e.longIs(a) ? i = a : i += 10;
          }, n = [ 0, 1, 3, 5 ], e.entityEachOwn(n, a), t.identical(i, n), n = e.unrollMake([ 0, 1, e.unrollFrom([ 3, 5 ]) ]), 
          e.entityEachOwn(n, a), t.identical(i, [ 0, 1, 3, 5 ]), t.is(e.unrollIs(i)), t.is(e.arrayIs(i)), 
          n = e.argumentsArrayMake([ 0, 1, [ 3, 5 ] ]), e.entityEachOwn(n, a), t.identical(i, n), 
          t.is(e.longIs(i)), n = new Array(1, 2, null, !0), e.entityEachOwn(n, a), t.identical(i, n), 
          t.is(e.longIs(i)), n = new Float32Array([ 1, 2, 1, 3 ]), e.entityEachOwn(n, a), 
          t.equivalent(i, [ 1, 2, 1, 3 ]), t.is(e.longIs(i)), t.close("src is an ArrayLike"), 
          /* - */
          t.open("src is an ObjectLike"), i = {}, e.entityEachOwn({}, e => i = e), t.identical(i, {}), 
          i = {}, n = Object.create(null);
          var r = Object.create(n);
          e.entityEachOwn(n, (e, t) => i[t] = e + t), t.identical(i, {}), e.entityEachOwn(r, (e, t) => i[t] = e + t), 
          t.identical(i, {}), i = {}, (n = Object.create(null)).a = 1, n.b = 3, r = Object.create(n), 
          e.entityEachOwn(r, (e, t) => i[t] = e * e + t), t.identical(i, {}), e.entityEachOwn(n, (e, t) => i[t] = e * e + t), 
          t.identical(i, {
            a: "1a",
            b: "9b"
          }), t.case = "routine counter", a = function(t, n) {
            e.strIs(t) && n ? i += 10 : i -= 1;
          }, i = 0, e.entityEachOwn(1, a), t.identical(i, -1), i = 0, e.entityEachOwn({
            a: "abc",
            b: 1,
            c: "ab",
            d: null
          }, a), t.identical(i, 18), i = 0, n = {
            name: "object",
            toString: 1,
            toSource: null
          }, r = Object.create(n), e.entityEachOwn(r, a), t.identical(i, 0), e.entityEachOwn(n, a), 
          t.identical(i, 8), i = 0, (n = Object.create(null)).a = [ "a", "b" ], n.b = {
            a: 1
          }, (r = Object.create(n)).c = "str", t.identical(n.a, r.a), t.identical(n.b, r.b), 
          e.entityEachOwn(n, a), t.identical(i, -2), e.entityEachOwn(r, a), t.identical(i, 8), 
          t.case = "Third argument in onEach", a = function(t, n, a) {
            e.objectIs(a) ? i = a : i += 10;
          }, i = {}, (n = Object.create(null)).a = "str", r = Object.create(n), e.entityEachOwn(r, a), 
          t.identical(i, {}), e.entityEachOwn(n, a), t.identical(i, n), t.close("src is an ObjectLike"), 
          /* - */
          t.case = "src is not ArrayLike or ObjectLike", e.entityEachOwn(null, e => i = typeof e), 
          t.identical(i, "object"), e.entityEachOwn(1, e => i = typeof e), t.identical(i, "number"), 
          e.entityEachOwn("a", e => i = e + 2), t.identical(i, "a2"), e.entityEachOwn(function b() {
            return "a";
          }, (e, t) => i = typeof e + " " + typeof t), t.identical(i, "function undefined"), 
          t.case = "without arguments", t.shouldThrowErrorSync(() => e.entityEachOwn()), t.case = "only one argument", 
          t.shouldThrowErrorSync(() => e.entityEachOwn([ "a" ])), t.case = "too many arguments", 
          t.shouldThrowErrorSync(() => e.entityEachOwn([ "a" ], e => e, e => e)), t.case = "onEach has more then three arg", 
          t.shouldThrowErrorSync(() => e.entityEachOwn([ 1 ], (e, t, n, i) => e + t + n + i)), 
          t.case = "onEach is not a routine", t.shouldThrowErrorSync(() => e.entityEachOwn({
            a: 2
          }, []));
        }
        //
        ,
        entityAll: function entityAll(t) {
          t.open("onEach is routine"), t.case = "array";
          var n = e.entityAll([ 1, "str", void 0 ], (e, t) => !!e && t + 2 < 4);
          t.identical(n, !1), n = e.entityAll([ 1, "str", {
            a: 2
          }, 4 ], (e, t) => !!e && t + 2 < 6), t.identical(n, !0), n = e.entityAll([ 1, "str", {
            a: 2
          }, !1 ], (e, t) => !!e && t + 2 < 6), t.identical(n, !1), n = e.entityAll([ 1, "str", 3, null ], () => void 0), 
          t.identical(n, void 0), t.case = "unroll";
          var i = e.unrollFrom([ 1, 2, e.unrollFrom([ "str" ]), 3, 4 ]);
          n = e.entityAll(i, (e, t) => !!e && t + 2 < 4), t.identical(n, !1), i = e.unrollMake([ 1, 2, e.unrollFrom([ "str" ]), 3, 4 ]), 
          n = e.entityAll(i, (e, t) => !!e && t + 2 < 7), t.identical(n, !0), i = e.unrollMake([ 1, 2, e.unrollFrom([ "str" ]), void 0, 4 ]), 
          n = e.entityAll(i, (e, t) => !!e && t + 2 < 7), t.identical(n, !1), i = e.unrollMake([ 1, 2, e.unrollFrom([ "str" ]), 3, 4 ]), 
          n = e.entityAll(i, () => void 0), t.identical(n, void 0), t.case = "argument array", 
          i = e.argumentsArrayMake([ 1, 2, [ "str" ], 3, 4 ]), n = e.entityAll(i, (e, t) => !!e && t + 2 < 4), 
          t.identical(n, !1), i = e.argumentsArrayMake([ 1, 2, [ "str" ], 3, 4 ]), n = e.entityAll(i, (e, t) => !!e && t + 2 < 7), 
          t.identical(n, !0), i = e.argumentsArrayMake([ 1, 2, [ "str" ], !1, 4 ]), n = e.entityAll(i, (e, t) => !!e && t + 2 < 7), 
          t.identical(n, !1), i = e.argumentsArrayMake([ 1, 2, [ "str" ], 3, 4 ]), n = e.entityAll(i, () => void 0), 
          t.identical(n, void 0), t.case = "Array", i = new Array(1, 2, [ "str" ], 3, 4), 
          n = e.entityAll(i, (e, t) => !!e && t + 2 < 4), t.identical(n, !1), i = new Array(1, 2, [ "str" ], 3, 4), 
          n = e.entityAll(i, (e, t) => !!e && t + 2 < 7), t.identical(n, !0), i = new Array(1, 2, [ "str" ], !1, 4), 
          n = e.entityAll(i, (e, t) => !!e && t + 2 < 7), t.identical(n, !1), i = new Array(1, 2, [ "str" ], 3, 4), 
          n = e.entityAll(i, () => void 0), t.identical(n, void 0), t.case = "Float32Array", 
          i = new Float32Array([ 1, 2, [ 8 ], 3, 4 ]), n = e.entityAll(i, (e, t) => !!e && t + 2 < 4), 
          t.identical(n, !1), i = new Float32Array([ 1, 2, [ 8 ], 3, 4 ]), n = e.entityAll(i, (e, t) => !!e && t + 2 < 7), 
          t.identical(n, !0), i = new Float32Array([ 1, 2, [ 8 ], !1, 4 ]), n = e.entityAll(i, (e, t) => !!e && t + 2 < 7), 
          t.identical(n, !1), i = new Float32Array([ 1, 2, [ 8 ], 3, 4 ]), n = e.entityAll(i, () => void 0), 
          t.identical(n, void 0), t.case = "ObjectLike", n = e.entityAll({
            1: 2,
            c: 4,
            a: void 0
          }, (e, t) => e === t), t.identical(n, !1), n = e.entityAll({
            "a": "a",
            4: "4",
            "true": "true"
          }, (e, t) => e === t), t.identical(n, !0), n = e.entityAll({
            1: 2,
            2: 3,
            a: null
          }, (e, t) => e !== t), t.identical(n, !0), n = e.entityAll({
            a: 1,
            b: 3,
            c: !0
          }, (e, t) => e !== t), t.identical(n, !0), n = e.entityAll({
            "a": "a",
            "b": "str"
          }, (e, t) => typeof e == typeof t), t.identical(n, !0), n = e.entityAll({
            a: 1,
            b: !1
          }, (e, t) => e === t), t.identical(n, !1), n = e.entityAll({
            a: 1,
            b: !1
          }, (e, t, n) => n.length !== t), t.identical(n, !0), t.case = "no ArrayLike, no ObjectLike", 
          n = e.entityAll(void 0, (e, t) => e !== t), t.identical(n, !1), n = e.entityAll(null, (e, t) => e === t), 
          t.identical(n, !1), n = e.entityAll(1, (e, t) => e === t), t.identical(n, !1), n = e.entityAll("str", (e, t) => e === t), 
          t.identical(n, !1), n = e.entityAll(!1, (e, t) => e === t), t.identical(n, !1), 
          n = e.entityAll(!0, (e, t) => e !== t), t.identical(n, !0), n = e.entityAll(!0, (e, t, n) => e !== n), 
          t.identical(n, !0), t.close("onEach is routine"), 
          /* - */
          t.open("onEach is null"), t.case = "array", n = e.entityAll([ 1, "str", void 0 ]), 
          t.identical(n, void 0), n = e.entityAll([ 1, "str", {
            a: 2
          }, 4 ]), t.identical(n, !0), n = e.entityAll([ 1, "str", {
            a: 2
          }, !1 ]), t.identical(n, !1), t.case = "unroll", i = e.unrollFrom([ 1, 2, e.unrollFrom([ "str" ]), null, 4 ]), 
          n = e.entityAll(i), t.identical(n, null), i = e.unrollMake([ 1, 2, e.unrollFrom([ "str" ]), 3, 4 ]), 
          n = e.entityAll(i), t.identical(n, !0), i = e.unrollMake([ 1, 2, e.unrollFrom([ "str" ]), !1, 4 ]), 
          n = e.entityAll(i), t.identical(n, !1), t.case = "argument array", i = e.argumentsArrayMake([ 1, 2, [ "str" ], void 0, 4 ]), 
          n = e.entityAll(i), t.identical(n, void 0), i = e.argumentsArrayMake([ 1, 2, [ "str" ], 3, 4 ]), 
          n = e.entityAll(i), t.identical(n, !0), i = e.argumentsArrayMake([ 1, 2, [ "str" ], !1, 4 ]), 
          n = e.entityAll(i), t.identical(n, !1), t.case = "Array", i = new Array(1, 2, [ "str" ], null, 4), 
          n = e.entityAll(i), t.identical(n, null), i = new Array(1, 2, [ "str" ], 3, 4), 
          n = e.entityAll(i), t.identical(n, !0), i = new Array(1, 2, [ "str" ], !1, 4), n = e.entityAll(i), 
          t.identical(n, !1), t.case = "Float32Array", i = new Float32Array([ null, 2, [ 8 ], 3, 4 ]), 
          n = e.entityAll(i), t.identical(n, 0), i = new Float32Array([ 1, 2, [ 8 ], 3, 4 ]), 
          n = e.entityAll(i), t.identical(n, !0), i = new Float32Array([ 1, 2, [ 8 ], "str", 4 ]), 
          n = e.entityAll(i), t.identical(n, NaN), t.case = "ObjectLike", n = e.entityAll({
            1: 2,
            c: 4,
            a: void 0
          }), t.identical(n, void 0), n = e.entityAll({
            1: 2,
            2: 3,
            a: null
          }), t.identical(n, null), n = e.entityAll({
            a: 1,
            b: 3,
            c: !0
          }), t.identical(n, !0), n = e.entityAll({
            a: "a",
            b: "str"
          }), t.identical(n, !0), n = e.entityAll({
            a: 1,
            b: !1
          }), t.identical(n, !1), t.case = "no ArrayLike, no ObjectLike", n = e.entityAll(void 0), 
          t.identical(n, void 0), n = e.entityAll(null), t.identical(n, null), n = e.entityAll(1), 
          t.identical(n, !0), n = e.entityAll("str"), t.identical(n, !0), n = e.entityAll(!1), 
          t.identical(n, !1), n = e.entityAll(!0), t.identical(n, !0), t.close("onEach is null"), 
          t.case = "without arguments", t.shouldThrowErrorSync(() => e.entityAll()), t.case = "too many arguments", 
          t.shouldThrowErrorSync(() => e.entityAll([ "a" ], e => e, e => e)), t.case = "onEach has more then three arg", 
          t.shouldThrowErrorSync(() => e.entityAll([ 1 ], (e, t, n, i) => e + t + n + i)), 
          t.case = "onEach is not a routine", t.shouldThrowErrorSync(() => e.entityAll({
            a: 2
          }, []));
        }
        //
        ,
        entityAny: function entityAny(t) {
          t.open("onEach is routine"), t.case = "array";
          var n = e.entityAny([ 1, "str", void 0 ], (e, t) => !!e && t + 2 < 4);
          t.identical(n, !0), n = e.entityAny([ !1, !1, void 0 ], (e, t) => !!e && t + 2 < 6), 
          t.identical(n, !1), n = e.entityAny([ 1, "str", {
            a: 2
          }, !1 ], (e, t) => !!e && t + 2 < 6), t.identical(n, !0), n = e.entityAny([ 1, "str", 3, null ], () => void 0), 
          t.identical(n, !1), t.case = "unroll";
          var i = e.unrollFrom([ 1, 2, e.unrollFrom([ "str" ]), 3, 4 ]);
          n = e.entityAny(i, (e, t) => !!e && t + 2 < 4), t.identical(n, !0), i = e.unrollMake([ void 0, !1, e.unrollFrom(null) ]), 
          n = e.entityAny(i, (e, t) => !!e && t + 2 < 7), t.identical(n, !1), i = e.unrollMake([ void 0, !1, e.unrollFrom([ "str" ]) ]), 
          n = e.entityAny(i, (e, t) => !!e && t + 2 < 7), t.identical(n, !0), i = e.unrollMake([ 1, 2, e.unrollFrom([ "str" ]), 3, 4 ]), 
          n = e.entityAny(i, () => void 0), t.identical(n, !1), t.case = "argument array", 
          i = e.argumentsArrayMake([ 1, 2, [ "str" ], 3, 4 ]), n = e.entityAny(i, (e, t) => !!e && t + 2 < 4), 
          t.identical(n, !0), i = e.argumentsArrayMake([ !1, null, void 0 ]), n = e.entityAny(i, (e, t) => !!e && t + 2 < 7), 
          t.identical(n, !1), i = e.argumentsArrayMake([ 1, 2, [ "str" ], !1, 4 ]), n = e.entityAny(i, (e, t) => !!e && t + 2 < 7), 
          t.identical(n, !0), i = e.argumentsArrayMake([ 1, 2, [ "str" ], 3, 4 ]), n = e.entityAny(i, () => void 0), 
          t.identical(n, !1), t.case = "Array", i = new Array(1, 2, [ "str" ], 3, 4), n = e.entityAny(i, (e, t) => !!e && t + 2 < 4), 
          t.identical(n, !0), i = new Array(!1, void 0, null), n = e.entityAny(i, (e, t) => !!e && t + 2 < 7), 
          t.identical(n, !1), i = new Array(1, 2, [ "str" ], !1, 4), n = e.entityAny(i, (e, t) => !!e && t + 2 < 7), 
          t.identical(n, !0), i = new Array(1, 2, [ "str" ], 3, 4), n = e.entityAny(i, () => void 0), 
          t.identical(n, !1), t.case = "Float32Array", i = new Float32Array([ 1, 2, [ 8 ], 3, 4 ]), 
          n = e.entityAny(i, (e, t) => !!e && t + 2 < 4), t.identical(n, !0), i = new Float32Array([ "a", void 0, !1, null ]), 
          n = e.entityAny(i, (e, t) => !!e && t + 2 < 7), t.identical(n, !1), i = new Float32Array([ 1, 2, [ 8 ], !1, 4 ]), 
          n = e.entityAny(i, (e, t) => !!e && t + 2 < 7), t.identical(n, !0), i = new Float32Array([ 1, 2, [ 8 ], 3, 4 ]), 
          n = e.entityAny(i, () => void 0), t.identical(n, !1), t.case = "ObjectLike", n = e.entityAny({
            1: 2,
            c: 4,
            a: void 0
          }, (e, t) => e === t), t.identical(n, !1), n = e.entityAny({
            "a": !1,
            4: !1,
            "true": "true"
          }, (e, t) => e === t), t.identical(n, !0), n = e.entityAny({
            1: 2,
            2: 3,
            a: null
          }, (e, t) => typeof e == typeof t), t.identical(n, !1), n = e.entityAny({
            "a": [],
            "b": "str"
          }, (e, t) => typeof e == typeof t), t.identical(n, !0), n = e.entityAny({
            a: 1,
            b: !1
          }, (e, t) => e === t), t.identical(n, !1), n = e.entityAny({
            a: 1,
            b: !1
          }, (e, t, n) => e !== n), t.identical(n, !0), t.case = "no ArrayLike, no ObjectLike", 
          n = e.entityAny(void 0, (e, t) => e !== t), t.identical(n, !1), n = e.entityAny(null, (e, t) => e === t), 
          t.identical(n, !1), n = e.entityAny(1, (e, t) => e !== t), t.identical(n, !0), n = e.entityAny("str", (e, t) => e === t), 
          t.identical(n, !1), n = e.entityAny(!1, (e, t) => e !== t), t.identical(n, !0), 
          n = e.entityAny(!0, (e, t) => e !== t), t.identical(n, !0), n = e.entityAny(!0, (e, t, n) => e !== n), 
          t.identical(n, !0), t.close("onEach is routine"), 
          /* - */
          t.open("onEach is null"), t.case = "array", n = e.entityAny([ 1, "str", void 0 ]), 
          t.identical(n, 1), n = e.entityAny([ "str", 1, {
            a: 2
          }, 4 ]), t.identical(n, "str"), n = e.entityAny([ !1, null, void 0 ]), t.identical(n, !1), 
          t.case = "unroll", i = e.unrollFrom([ !1, 2, e.unrollFrom([ "str" ]), null, 4 ]), 
          n = e.entityAny(i), t.identical(n, 2), i = e.unrollMake([ void 0, !1, e.unrollFrom([ "str" ]), 3, 4 ]), 
          n = e.entityAny(i), t.identical(n, "str"), i = e.unrollMake([ null, void 0, !1 ]), 
          n = e.entityAny(i), t.identical(n, !1), t.case = "argument array", i = e.argumentsArrayMake([ null, !1, [ "str" ], void 0, 4 ]), 
          n = e.entityAny(i), t.identical(n, [ "str" ]), i = e.argumentsArrayMake([ 1, 2, [ "str" ], 3, 4 ]), 
          n = e.entityAny(i), t.identical(n, 1), i = e.argumentsArrayMake([ null, !1, void 0 ]), 
          n = e.entityAny(i), t.identical(n, !1), t.case = "Array", i = new Array(!1, "ab", [ "str" ], null, 4), 
          n = e.entityAny(i), t.identical(n, "ab"), i = new Array(null, 22, [ "str" ], 3, 4), 
          n = e.entityAny(i), t.identical(n, 22), i = new Array(null, !1, void 0), n = e.entityAny(i), 
          t.identical(n, !1), t.case = "Float32Array", i = new Float32Array([ 5, 2, [ "str" ], 3, 4 ]), 
          n = e.entityAny(i), t.identical(n, 5), i = new Float32Array([ void 0, [ 8 ], 3, 4 ]), 
          n = e.entityAny(i), t.identical(n, 8), i = new Float32Array([ "str", void 0, {
            a: 2
          } ]), n = e.entityAny(i), t.identical(n, !1), t.case = "ObjectLike", n = e.entityAny({
            1: 2,
            c: 4,
            a: void 0
          }), t.identical(n, 2), n = e.entityAny({
            1: 2,
            2: 3,
            a: null
          }), t.identical(n, 2), n = e.entityAny({
            a: !1,
            b: null,
            c: void 0
          }), t.identical(n, !1), n = e.entityAny({
            a: "a",
            b: "str"
          }), t.identical(n, "a"), n = e.entityAny({
            a: 1,
            b: !1
          }), t.identical(n, 1), t.case = "no ArrayLike, no ObjectLike", n = e.entityAny(void 0), 
          t.identical(n, !1), n = e.entityAny(null), t.identical(n, !1), n = e.entityAny(1), 
          t.identical(n, 1), n = e.entityAny("str"), t.identical(n, "str"), n = e.entityAny(!1), 
          t.identical(n, !1), n = e.entityAny(!0), t.identical(n, !0), t.close("onEach is null"), 
          t.case = "without arguments", t.shouldThrowErrorSync(() => e.entityAny()), t.case = "too many arguments", 
          t.shouldThrowErrorSync(() => e.entityAny([ "a" ], e => e, e => e)), t.case = "onEach has more then three arg", 
          t.shouldThrowErrorSync(() => e.entityAny([ 1 ], (e, t, n, i) => e + t + n + i)), 
          t.case = "onEach is not a routine", t.shouldThrowErrorSync(() => e.entityAny({
            a: 2
          }, []));
        }
        //
        ,
        entityNone: function entityNone(t) {
          t.open("onEach is routine"), t.case = "array";
          var n = e.entityNone([ 1, "str", void 0 ], (e, t) => !!e && t + 2 < 4);
          t.identical(n, !1), n = e.entityNone([ !1, !1, void 0 ], (e, t) => !!e && t + 2 < 6), 
          t.identical(n, !0), n = e.entityNone([ 1, "str", {
            a: 2
          }, !1 ], (e, t) => !!e && t + 2 < 6), t.identical(n, !1), n = e.entityNone([ 1, "str", 3, null ], () => void 0), 
          t.identical(n, !0), t.case = "unroll";
          var i = e.unrollFrom([ 1, 2, e.unrollFrom([ "str" ]), 3, 4 ]);
          n = e.entityNone(i, (e, t) => !!e && t + 2 < 4), t.identical(n, !1), i = e.unrollMake([ void 0, !1, e.unrollFrom(null) ]), 
          n = e.entityNone(i, (e, t) => !!e && t + 2 < 7), t.identical(n, !0), i = e.unrollMake([ void 0, !1, e.unrollFrom([ "str" ]) ]), 
          n = e.entityNone(i, (e, t) => !!e && t + 2 < 7), t.identical(n, !1), i = e.unrollMake([ 1, 2, e.unrollFrom([ "str" ]), 3, 4 ]), 
          n = e.entityNone(i, () => void 0), t.identical(n, !0), t.case = "argument array", 
          i = e.argumentsArrayMake([ 1, 2, [ "str" ], 3, 4 ]), n = e.entityNone(i, (e, t) => !!e && t + 2 < 4), 
          t.identical(n, !1), i = e.argumentsArrayMake([ !1, null, void 0 ]), n = e.entityNone(i, (e, t) => !!e && t + 2 < 7), 
          t.identical(n, !0), i = e.argumentsArrayMake([ 1, 2, [ "str" ], !1, 4 ]), n = e.entityNone(i, (e, t) => !!e && t + 2 < 7), 
          t.identical(n, !1), i = e.argumentsArrayMake([ 1, 2, [ "str" ], 3, 4 ]), n = e.entityNone(i, () => void 0), 
          t.identical(n, !0), t.case = "Array", i = new Array(1, 2, [ "str" ], 3, 4), n = e.entityNone(i, (e, t) => !!e && t + 2 < 4), 
          t.identical(n, !1), i = new Array(!1, void 0, null), n = e.entityNone(i, (e, t) => !!e && t + 2 < 7), 
          t.identical(n, !0), i = new Array(1, 2, [ "str" ], !1, 4), n = e.entityNone(i, (e, t) => !!e && t + 2 < 7), 
          t.identical(n, !1), i = new Array(1, 2, [ "str" ], 3, 4), n = e.entityNone(i, () => void 0), 
          t.identical(n, !0), t.case = "Float32Array", i = new Float32Array([ 1, 2, [ 8 ], 3, 4 ]), 
          n = e.entityNone(i, (e, t) => !!e && t + 2 < 4), t.identical(n, !1), i = new Float32Array([ "a", void 0, !1, null ]), 
          n = e.entityNone(i, (e, t) => !!e && t + 2 < 7), t.identical(n, !0), i = new Float32Array([ 1, 2, [ 8 ], !1, 4 ]), 
          n = e.entityNone(i, (e, t) => !!e && t + 2 < 7), t.identical(n, !1), i = new Float32Array([ 1, 2, [ 8 ], 3, 4 ]), 
          n = e.entityNone(i, () => void 0), t.identical(n, !0), t.case = "ObjectLike", n = e.entityNone({
            1: 2,
            c: 4,
            a: void 0
          }, (e, t) => e === t), t.identical(n, !0), n = e.entityNone({
            "a": !1,
            4: !1,
            "true": "true"
          }, (e, t) => e === t), t.identical(n, !1), n = e.entityNone({
            1: 2,
            2: 3,
            a: null
          }, (e, t) => typeof e == typeof t), t.identical(n, !0), n = e.entityNone({
            "a": [],
            "b": "str"
          }, (e, t) => typeof e == typeof t), t.identical(n, !1), n = e.entityNone({
            a: 1,
            b: !1
          }, (e, t) => e === t), t.identical(n, !0), n = e.entityNone({
            a: 1,
            b: !1
          }, (e, t, n) => n.length === e), t.identical(n, !0), t.case = "no ArrayLike, no ObjectLike", 
          n = e.entityNone(void 0, (e, t) => e !== t), t.identical(n, !0), n = e.entityNone(null, (e, t) => e === t), 
          t.identical(n, !0), n = e.entityNone(1, (e, t) => e !== t), t.identical(n, !1), 
          n = e.entityNone("str", (e, t) => e === t), t.identical(n, !0), n = e.entityNone(!1, (e, t) => e !== t), 
          t.identical(n, !1), n = e.entityNone(!0, (e, t) => e !== t), t.identical(n, !1), 
          n = e.entityNone(!0, (e, t, n) => e !== n), t.identical(n, !1), t.close("onEach is routine"), 
          /* - */
          t.open("onEach is undefined"), t.case = "array", n = e.entityNone([ 1, "str", void 0 ]), 
          t.identical(n, !1), n = e.entityNone([ "str", 1, {
            a: 2
          }, 4 ]), t.identical(n, !1), n = e.entityNone([ !1, null, void 0 ]), t.identical(n, !0), 
          t.case = "unroll", i = e.unrollFrom([ !1, 2, e.unrollFrom([ "str" ]), null, 4 ]), 
          n = e.entityNone(i), t.identical(n, !1), i = e.unrollMake([ void 0, !1, e.unrollFrom([ "str" ]), 3, 4 ]), 
          n = e.entityNone(i), t.identical(n, !1), i = e.unrollMake([ null, void 0, !1 ]), 
          n = e.entityNone(i), t.identical(n, !0), t.case = "argument array", i = e.argumentsArrayMake([ null, !1, [ "str" ], void 0, 4 ]), 
          n = e.entityNone(i), t.identical(n, !1), i = e.argumentsArrayMake([ 1, 2, [ "str" ], 3, 4 ]), 
          n = e.entityNone(i), t.identical(n, !1), i = e.argumentsArrayMake([ null, !1, void 0 ]), 
          n = e.entityNone(i), t.identical(n, !0), t.case = "Array", i = new Array(!1, "ab", [ "str" ], null, 4), 
          n = e.entityNone(i), t.identical(n, !1), i = new Array(null, 22, [ "str" ], 3, 4), 
          n = e.entityNone(i), t.identical(n, !1), i = new Array(null, !1, void 0), n = e.entityNone(i), 
          t.identical(n, !0), t.case = "Float32Array", i = new Float32Array([ 5, 2, [ "str" ], 3, 4 ]), 
          n = e.entityNone(i), t.identical(n, !1), i = new Float32Array([ void 0, [ 8 ], 3, 4 ]), 
          n = e.entityNone(i), t.identical(n, !1), i = new Float32Array([ "str", void 0, {
            a: 2
          } ]), n = e.entityNone(i), t.identical(n, !0), t.case = "ObjectLike", n = e.entityNone({
            1: 2,
            c: 4,
            a: void 0
          }), t.identical(n, !1), n = e.entityNone({
            1: 2,
            2: 3,
            a: null
          }), t.identical(n, !1), n = e.entityNone({
            a: !1,
            b: null,
            c: void 0
          }), t.identical(n, !0), n = e.entityNone({
            a: "a",
            b: "str"
          }), t.identical(n, !1), n = e.entityNone({
            a: 1,
            b: !1
          }), t.identical(n, !1), t.case = "no ArrayLike, no ObjectLike", n = e.entityNone(void 0), 
          t.identical(n, !0), n = e.entityNone(null), t.identical(n, !0), n = e.entityNone(1), 
          t.identical(n, !1), n = e.entityNone("str"), t.identical(n, !1), n = e.entityNone(!1), 
          t.identical(n, !0), n = e.entityNone(!0), t.identical(n, !1), t.close("onEach is undefined"), 
          t.case = "without arguments", t.shouldThrowErrorSync(() => e.entityNone()), t.case = "too many arguments", 
          t.shouldThrowErrorSync(() => e.entityNone([ "a" ], e => e, e => e)), t.case = "onEach has more then three arguments", 
          t.shouldThrowErrorSync(() => e.entityNone([ 1 ], (e, t, n, i) => e + t + n + i)), 
          t.case = "onEach is not a routine", t.shouldThrowErrorSync(() => e.entityNone({
            a: 2
          }, []));
        }
        //
        ,
        entityMap: function entityMap(t) {
          function constr() {
            this.a = 1, this.b = 3, this.c = 4;
          }
          t.open("src is arrayLike"), t.case = "simple test with mapping array by sqr";
          var n = e.entityMap([ 3, 4, 5 ], (e, t, n) => e * e);
          t.identical(n, [ 9, 16, 25 ]), t.case = "array";
          var i = [ 1, 2, null, "str" ];
          n = e.entityMap(i, (e, t, n) => e + t), t.identical(n, [ 1, 3, 2, "str3" ]), t.case = "unroll", 
          i = e.unrollFrom([ 1, 2, e.unrollFrom([ "str" ]), 3, 4 ]), n = e.entityMap(i, (e, t, n) => e + t), 
          t.identical(n, [ 1, 3, "str2", 6, 8 ]), t.is(e.arrayIs(n)), t.isNot(e.unrollIs(n)), 
          t.case = "argument array", i = e.argumentsArrayMake([ 1, 2, [ "str" ], 3, 4 ]), 
          n = e.entityMap(i, (e, t, n) => e + t), t.identical(n, [ 1, 3, "str2", 6, 8 ]), 
          t.is(e.arrayIs(n)), t.case = "Array", i = new Array(1, 2, [ "str" ], 3, 4), n = e.entityMap(i, (e, t, n) => e + t), 
          t.identical(n, [ 1, 3, "str2", 6, 8 ]), t.is(e.arrayIs(n)), t.case = "Float32Array", 
          i = new Float32Array([ 1, 2, [ 8 ], 3, 4 ]), n = e.entityMap(i, (e, t, n) => e + t), 
          t.equivalent(n, [ 1, 3, 10, 6, 8 ]), t.is(e.longIs(n)), t.close("src is arrayLike"), 
          /* - */
          t.open("src is objectLike"), t.case = "simple test with mapping object by sqr", 
          n = e.entityMap({
            3: 3,
            4: 4,
            5: 5
          }, (e, t, n) => e * e), t.identical(n, {
            3: 9,
            4: 16,
            5: 25
          }), t.is(e.mapIs(n)), i = {
            a: 1,
            b: 2,
            c: null,
            d: "str"
          }, n = e.entityMap(i, (e, t, n) => e + t), t.identical(n, {
            a: "1a",
            b: "2b",
            c: "nullc",
            d: "strd"
          }), t.is(e.mapIs(n)), t.case = "routine constructor", n = e.entityMap(new constr(), (e, t, n) => e * e + t), 
          t.identical(n, {
            a: "1a",
            b: "9b",
            c: "16c"
          }), t.is(!(n instanceof constr)), t.is(e.mapIs(n)), t.case = "simple test with mapping object by sqr : check callback arguments";
          var a = {};
          n = e.entityMap(Object.assign({}, {
            "a": 1,
            "b": 3,
            "c": 4
          }), function(e, t, n) {
            return a && (a = n), e * e + t;
          }), t.identical(a, {
            "a": 1,
            "b": 3,
            "c": 4
          }), t.case = "mapping object by sqr : source object should be unmodified", t.identical(Object.is(n, Object.assign({}, {
            "a": 1,
            "b": 3,
            "c": 4
          })), !1), t.close("src is objectLike"), 
          /* - */
          t.case = "no ArrayLike, no ObjectLike", n = e.entityMap(2, (e, t, n) => e + e), 
          t.identical(n, 4), n = e.entityMap("a", (e, t, n) => e + e), t.identical(n, "aa"), 
          t.case = "missed arguments", t.shouldThrowError(() => e.entityMap()), t.case = "extra argument", 
          t.shouldThrowError(() => e.entityMap([ 1, 3 ], callback1, callback2)), t.case = "passed argument has undefines", 
          t.shouldThrowError(() => e.entityMap([ 1, void 0 ], (e, t) => e)), t.shouldThrowError(() => e.entityMap({
            a: 2,
            b: void 0
          }, (e, t) => e)), t.shouldThrowError(() => e.entityMap(void 0, (e, t) => e)), t.case = "second argument is not routine", 
          t.shouldThrowError(() => e.entityMap([ 1, 2 ], {}));
        }
        //
        //TODO : need to check actuality of this test
        // it works correctly
        ,
        entityFilter: function entityFilter(t) {
          t.open("onEach is routine");
          var n = function(e, t, n) {
            if (!(e < 0)) return Math.sqrt(e);
          };
          t.case = "number";
          var i = e.entityFilter(3, n);
          t.identical(i, Math.sqrt(3)), t.case = "string", i = e.entityFilter("str", e => e + " " + e), 
          t.identical(i, "str str"), t.case = "simple test with mapping array by sqrt", i = e.entityFilter([ 9, -16, 25, 36, -49 ], n), 
          t.identical(i, [ 3, 5, 6 ]), t.notIdentical(i, [ 3, 4, 5, 6, 7 ]);
          var a = e.unrollMake([ 9, e.unrollMake([ -16, 25, e.unrollFrom([ 36, -49 ]) ]) ]);
          i = e.entityFilter(a, n), t.identical(i, [ 3, 5, 6 ]), t.notIdentical(i, [ 3, 4, 5, 6, 7 ]), 
          t.isNot(e.unrollIs(i)), a = e.argumentsArrayMake([ 9, -16, 25, 36, -49 ]), i = e.entityFilter(a, n), 
          t.identical(i, [ 3, 5, 6 ]), a = new Array(9, -16, 25, 36, -49), i = e.entityFilter(a, n), 
          t.identical(i, [ 3, 5, 6 ]), a = new Float32Array([ 9, -16, 25, 36, -49 ]), a = Array.from(a), 
          i = e.entityFilter(a, n), t.identical(i, [ 3, 5, 6 ]), t.notIdentical(i, [ 3, 4, 5, 6, 7 ]), 
          t.case = "simple test with mapping object by sqrt", i = e.entityFilter({
            3: 9,
            4: 16,
            5: 25,
            6: -36
          }, n), t.identical(i, {
            3: 3,
            4: 4,
            5: 5
          }), t.notIdentical(i, {
            3: 3,
            4: 4,
            5: 5,
            6: 6
          }), t.case = "callback in routine", i = function() {
            return e.entityFilter(arguments, n);
          }(9, -16, 25, 36, -49), t.identical(i, [ 3, 5, 6 ]), t.case = "src is array, filter make unrolls";
          var r = (t, n, i) => e.unrollMake([ t ]);
          a = [ 1, [ 2, 3 ], [ "str", null, void 0 ] ], i = e.entityFilter(a, r), t.identical(i, [ 1, [ 2, 3 ], [ "str", null, void 0 ] ]), 
          t.isNot(e.unrollIs(i)), t.is(e.arrayIs(i)), t.case = "src is array, filter check equality", 
          r = ((e, t, n) => e === t), a = [ 0, 2, 2, [ "str", null ], void 0 ], i = e.entityFilter(a, r), 
          t.identical(i, [ !0, !1, !0, !1, !1 ]), t.notIdentical(i, [ !0, !1, !0, !1, !1, !1 ]), 
          t.is(e.arrayIs(i)), t.close("onEach is routine"), 
          /* - */
          t.case = "onEach is objectLike - condition, one entry", n = {
            3: 9
          }, i = e.entityFilter({
            a: {
              3: 9
            },
            b: {
              3: 4
            }
          }, n), t.identical(i, {
            a: {
              3: 9
            }
          }), t.case = "onEach is objectLike - condition, a few entry", n = {
            3: 9
          }, a = {
            a: {
              3: 9
            },
            b: {
              3: 4
            },
            c: {
              3: 9
            },
            d: {
              3: 9
            }
          }, i = e.entityFilter(a, n), t.identical(i, {
            a: {
              3: 9
            },
            c: {
              3: 9
            },
            d: {
              3: 9
            }
          }), t.case = "onEach is objectLike - condition, entry nested to next level", n = {
            3: 9
          }, a = {
            a: {
              b: {
                3: 9
              }
            }
          }, i = e.entityFilter(a, n), t.identical(i, {}), t.notIdentical(i, {
            a: {
              b: {
                3: 9
              }
            }
          }), t.case = "onEach is objectLike - routine, entry nested to next level", n = {
            3: r = function(e) {
              return !0;
            }
          }, a = {
            a: {
              3: 9
            }
          }, i = e.entityFilter(a, n), t.identical(i, {}), t.notIdentical(i, {
            a: {
              3: 9
            }
          }), t.case = "onEach is objectLike - condition, identical entry", n = {
            3: r = function(e) {
              return !0;
            }
          }, a = {
            a: {
              3: r
            }
          }, i = e.entityFilter(a, n), t.identical(i, {
            a: {
              3: r
            }
          }), t.notIdentical(i, {}), t.case = "missed arguments", t.shouldThrowErrorSync(() => e.entityFilter()), 
          t.case = "extra argument", t.shouldThrowErrorSync(() => e.entityFilter([ 1, 3 ], () => !0, 1)), 
          t.case = "onEach is not routine", t.shouldThrowErrorSync(() => e.entityFilter([ 1, 3 ], "callback")), 
          t.case = "src is undefined", t.shouldThrowErrorSync(() => e.entityFilter(void 0, callback1));
        },
        entityFilterDeep: 
        //
        function entityFilterDeep(t) {
          t.open("onEach is routine");
          var n = function(e, t, n) {
            if (!(e < 0)) return Math.sqrt(e);
          };
          t.case = "simple test with mapping array by sqrt";
          var i = e.entityFilterDeep([ 9, -16, 25, 36, -49 ], n);
          t.identical(i, [ 3, 5, 6 ]), t.notIdentical(i, [ 3, 4, 5, 6, 7 ]);
          var a = e.unrollMake([ 9, e.unrollMake([ -16, 25, e.unrollFrom([ 36, -49 ]) ]) ]);
          i = e.entityFilterDeep(a, n), t.identical(i, [ 3, 5, 6 ]), t.notIdentical(i, [ 3, 4, 5, 6, 7 ]), 
          t.isNot(e.unrollIs(i)), a = e.argumentsArrayMake([ 9, -16, 25, 36, -49 ]), i = e.entityFilterDeep(a, n), 
          t.identical(i, [ 3, 5, 6 ]), a = new Array(9, -16, 25, 36, -49), i = e.entityFilterDeep(a, n), 
          t.identical(i, [ 3, 5, 6 ]), a = new Float32Array([ 9, -16, 25, 36, -49 ]), a = Array.from(a), 
          i = e.entityFilterDeep(a, n), t.identical(i, [ 3, 5, 6 ]), t.notIdentical(i, [ 3, 4, 5, 6, 7 ]), 
          t.case = "simple test with mapping object by sqrt", i = e.entityFilterDeep({
            3: 9,
            4: 16,
            5: 25,
            6: -36
          }, n), t.identical(i, {
            3: 3,
            4: 4,
            5: 5
          }), t.notIdentical(i, {
            3: 3,
            4: 4,
            5: 5,
            6: 6
          }), t.case = "callback in routine", i = function() {
            return e.entityFilterDeep(arguments, n);
          }(9, -16, 25, 36, -49), t.identical(i, [ 3, 5, 6 ]), t.case = "src is array, filter make unrolls";
          var r = (t, n, i) => e.unrollMake([ t ]);
          a = [ 1, [ 2, 3 ], [ "str", null, void 0 ] ], i = e.entityFilterDeep(a, r), t.identical(i, [ 1, [ 2, 3 ], [ "str", null, void 0 ] ]), 
          t.isNot(e.unrollIs(i)), t.is(e.arrayIs(i)), t.case = "src is array, filter check equality", 
          r = ((e, t, n) => e === t), a = [ 0, 2, 2, [ "str", null ], void 0 ], i = e.entityFilterDeep(a, r), 
          t.identical(i, [ !0, !1, !0, !1, !1 ]), t.notIdentical(i, [ !0, !1, !0, !1, !1, !1 ]), 
          t.is(e.arrayIs(i)), t.close("onEach is routine"), 
          /* - */
          t.case = "onEach is objectLike - condition, one entry", n = {
            3: 9
          }, i = e.entityFilterDeep({
            a: {
              3: 9
            },
            b: {
              3: 4
            }
          }, n), t.identical(i, {
            a: {
              3: 9
            }
          }), t.case = "onEach is objectLike - condition, a few entry", n = {
            3: 9
          }, a = {
            a: {
              3: 9
            },
            b: {
              4: 4
            },
            c: {
              3: 9
            },
            d: {
              3: 9
            }
          }, i = e.entityFilterDeep(a, n), t.identical(i, {
            a: {
              3: 9
            },
            c: {
              3: 9
            },
            d: {
              3: 9
            }
          }), t.case = "onEach is objectLike - condition, entry nested to next levels", n = {
            3: 9
          }, a = {
            a: {
              a: {
                b: {
                  c: {
                    3: 9,
                    4: 6
                  }
                }
              }
            }
          }, i = e.entityFilterDeep(a, n), t.identical(i, {}), t.notIdentical(i, {
            a: {
              a: {
                b: {
                  c: {
                    3: 9,
                    4: 6
                  }
                }
              }
            }
          }), t.case = "onEach is objectLike - routine, entry nested to next level", n = {
            3: r = function(e) {
              return !0;
            }
          }, a = {
            a: {
              b: {
                3: 9
              }
            }
          }, i = e.entityFilterDeep(a, n), t.identical(i, {
            a: {
              b: {
                3: 9
              }
            }
          }), t.notIdentical(i, {}), t.case = "onEach is objectLike - routine, entry nested to next level", 
          n = {
            3: r = function(e) {
              for (let t in e) if (e[t] = e[t] + 5, 10 !== e[t]) return !1;
              return !0;
            }
          }, a = {
            a: {
              b: 5,
              c: 5,
              d: 5
            }
          }, i = e.entityFilterDeep(a, n), t.identical(i, {
            a: {
              b: 5,
              c: 5,
              d: 5
            }
          }), t.notIdentical(i, {}), t.case = "onEach is objectLike - condition, identical entry", 
          n = {
            3: r = function(e) {
              return !0;
            }
          }, a = {
            a: {
              3: r
            }
          }, i = e.entityFilterDeep(a, n), t.identical(i, {
            a: {
              3: r
            }
          }), t.notIdentical(i, {}), t.case = "missed arguments", t.shouldThrowErrorSync(() => e.entityFilterDeep()), 
          t.case = "extra argument", t.shouldThrowErrorSync(() => e.entityFilterDeep([ 1, 3 ], () => !0, 1)), 
          t.case = "onEach is not routine", t.shouldThrowErrorSync(() => e.entityFilterDeep([ 1, 3 ], "callback")), 
          t.case = "src is not arrayLike or mapLike", t.shouldThrowErrorSync(() => e.entityFilterDeep(void 0, callback1));
        }
        //
        ,
        enityExtend: function enityExtend(t) {
          t.case = "src and dst is ArrayLike";
          var n = e.enityExtend([ 9, -16 ], [ 3, 5, 6 ]);
          t.identical(n, [ 3, 5, 6 ]), n = e.enityExtend([], [ 3, 5, 6 ]), t.identical(n, [ 3, 5, 6 ]), 
          t.case = "src and dst is ObjectLike", n = e.enityExtend({
            a: 1
          }, {
            a: 3,
            b: 5,
            c: 6
          }), t.identical(n, {
            a: 3,
            b: 5,
            c: 6
          }), n = e.enityExtend({}, {
            a: 3,
            b: 5,
            c: 6
          }), t.identical(n, {
            a: 3,
            b: 5,
            c: 6
          }), n = e.enityExtend({
            d: 4
          }, {
            a: 3,
            b: 5,
            c: 6
          }), t.identical(n, {
            d: 4,
            a: 3,
            b: 5,
            c: 6
          }), t.case = "dst is ObjectLike, src is ArrayLike", n = e.enityExtend({}, [ 3, 5, 6 ]), 
          t.identical(n, {
            0: 3,
            1: 5,
            2: 6
          }), n = e.enityExtend({
            a: 1
          }, [ 3, 5, 6 ]), t.identical(n, {
            a: 1,
            0: 3,
            1: 5,
            2: 6
          }), t.case = "src is ObjectLike, dst is ArrayLike", n = e.enityExtend([ 9, -16 ], {
            a: 3,
            b: 5,
            c: 6
          }), t.identical(n, [ 9, -16 ]), n = e.enityExtend([], {
            a: 3,
            b: 5,
            c: 6
          }), t.identical(n, []), n = e.enityExtend([ 1, 2, -3 ], {
            0: 3,
            1: 5,
            2: 6
          }), t.identical(n, [ 3, 5, 6 ]), t.case = "src is not ObjectLike or ArrayLike", 
          n = e.enityExtend([ 9, -16 ], 1), t.identical(n, 1), n = e.enityExtend([], "str"), 
          t.identical(n, "str"), n = e.enityExtend({
            a: 1
          }, 1), t.identical(n, 1), n = e.enityExtend({}, "str"), t.identical(n, "str"), t.case = "missed arguments", 
          t.shouldThrowError(function() {
            e.enityExtend();
          }), t.case = "extra argument", t.shouldThrowError(function() {
            e.enityExtend([ 1, 3 ], [ 1, 3 ], [ 1, 3 ]);
          }), t.case = "dst is undefined", t.shouldThrowError(function() {
            e.enityExtend(void 0, [ 0, 1 ]);
          }), t.shouldThrowError(function() {
            e.enityExtend(void 0, {
              a: 1,
              b: 2
            });
          }), t.shouldThrowError(function() {
            e.enityExtend(null, [ 0, 1 ]);
          }), t.shouldThrowError(function() {
            e.enityExtend(null, {
              a: 1,
              b: 2
            });
          });
        },
        entityAssign: 
        //
        function entityAssign(t) {
          t.case = "src null";
          var n = new String("string"), i = null, a = e.entityAssign(n, i), r = null;
          t.identical(a, r), t.case = "dst.copy", n = {
            copy: function(e) {
              for (var t in e) this[t] = e[t];
            }
          }, i = {
            src: "string",
            num: 123
          }, e.entityAssign(n, i), a = n, r = {
            copy: n.copy,
            src: "string",
            num: 123
          }, t.identical(a, r), t.case = "src.clone", n = 1, i = {
            src: "string",
            num: 123,
            clone: function() {
              return {
                src: "string",
                num: 123
              };
            }
          }, a = e.entityAssign(n, i), r = {
            src: "string",
            num: 123
          }, t.identical(a, r), t.is(a !== r), t.is(a !== i), t.case = "src.slice returns copy of array", 
          n = [], i = [ 1, 2, 3 ], a = e.entityAssign(n, i), r = i, t.identical(a, r), t.case = "dst.set ", 
          n = {
            set: function(e) {
              this.value = e.value;
            }
          }, i = {
            value: 100
          }, e.entityAssign(n, i), a = n, r = {
            set: n.set,
            value: 100
          }, t.identical(a, r), t.case = "onRecursive ", n = {}, i = {
            value: 100,
            a: {
              b: 101
            }
          }, e.entityAssign(n, i, function onRecursive(t, n, i) {
            e.assert(e.strIs(i)), t[i] = n[i];
          }), a = n, r = i, t.identical(a, r), t.case = "atomic ", i = 2, a = e.entityAssign(null, i), 
          r = i, t.identical(a, r), t.case = "missed arguments", t.shouldThrowError(function() {
            e.entityAssign();
          }), t.case = 'src.clone throws "unexpected"', t.shouldThrowError(function() {
            var t = {
              src: "string",
              num: 123,
              clone: function() {
                return e.cloneObject({
                  src: this
                });
              }
            };
            e.entityAssign({}, t);
          });
        }
        //
        ,
        entityAssignFieldFromContainer: function entityAssignFieldFromContainer(t) {
          t.case = "non recursive";
          var n = {}, i = {
            a: "string"
          }, a = "a", r = e.entityAssignFieldFromContainer(n, i, a), l = n[a];
          t.identical(r, l), t.case = "undefined", n = {}, i = {
            a: void 0
          }, a = "a", r = e.entityAssignFieldFromContainer(n, i, a), l = void 0, t.identical(r, l), 
          t.case = "recursive", n = {}, i = {
            a: "string"
          }, a = "a", r = e.entityAssignFieldFromContainer(n, i, a, function onRecursive(t, n, i) {
            e.assert(e.strIs(i)), t[i] = n[i];
          }), l = n[a], t.identical(r, l), t.case = "argument missed", t.shouldThrowError(function() {
            e.entityAssignFieldFromContainer();
          });
        }
        //
        ,
        _entityMost: function _entityMost(t) {
          function sqr(e) {
            return e * e;
          }
          var n = [ 3, 1, 9, 0, 5 ], i = [ 3, -4, 9, -16, 5, -2 ], a = {
            a: 25,
            b: 16,
            c: 9
          }, r = i.slice();
          t.case = "test entityMost with array and default onElement and returnMax = true";
          var l = e._entityMost(n, void 0, !0);
          t.identical(l, {
            index: 2,
            key: 2,
            value: 9,
            element: 9
          }), t.case = "test entityMost with array and default onElement and returnMax = false", 
          l = e._entityMost(n, void 0, !1), t.identical(l, {
            index: 3,
            key: 3,
            value: 0,
            element: 0
          }), t.case = "test entityMost with array simple onElement function and returnMax = true", 
          l = e._entityMost(i, sqr, !0), t.identical(l, {
            index: 3,
            key: 3,
            value: 256,
            element: -16
          }), t.case = "test entityMost with array : passed array should be unmodified", t.identical(i, r), 
          t.case = "test entityMost with array simple onElement function and returnMax = false", 
          l = e._entityMost(i, sqr, !1), t.identical(l, {
            index: 5,
            key: 5,
            value: 4,
            element: -2
          }), t.case = "test entityMost with map and default onElement and returnMax = true", 
          l = e._entityMost(a, void 0, !0), t.identical(l, {
            index: 0,
            key: "a",
            value: 25,
            element: 25
          }), t.case = "test entityMost with map and returnMax = false", l = e._entityMost(a, Math.sqrt, !1), 
          t.identical(l, {
            index: 2,
            key: "c",
            value: 3,
            element: 9
          }), t.case = "missed arguments", t.shouldThrowError(function() {
            e._entityMost();
          }), t.case = "extra argument", t.shouldThrowError(function() {
            e._entityMost([ 1, 3 ], sqr, !0, !1);
          }), t.case = "second argument is not routine", t.shouldThrowError(function() {
            e._entityMost([ 1, 3 ], "callback", !0);
          });
        },
        entityMin: 
        //
        function entityMin(t) {
          function sqr(e) {
            return e * e;
          }
          var n = [ 3, -4, 9, -16, 5, -2 ], i = n.slice();
          t.case = "test entityMin with array and without onElement callback";
          var a = e.entityMin([ 3, 1, 9, 0, 5 ]);
          t.identical(a, {
            index: 3,
            key: 3,
            value: 0,
            element: 0
          }), t.case = "test entityMin with array simple onElement function", a = e.entityMin(n, sqr), 
          t.identical(a, {
            index: 5,
            key: 5,
            value: 4,
            element: -2
          }), t.case = "test entityMin with array : passed array should be unmodified", t.identical(n, i), 
          t.case = "test entityMin with map", a = e.entityMin({
            a: 25,
            b: 16,
            c: 9
          }), t.identical(a, {
            index: 2,
            key: "c",
            value: 9,
            element: 9
          }), t.case = "missed arguments", t.shouldThrowError(function() {
            e.entityMin();
          }), t.case = "extra argument", t.shouldThrowError(function() {
            e.entityMin([ 1, 3 ], sqr, !0);
          }), t.case = "second argument is not routine", t.shouldThrowError(function() {
            e.entityMin([ 1, 3 ], "callback");
          });
        },
        entityMax: 
        //
        function entityMax(t) {
          function sqr(e) {
            return e * e;
          }
          var n = [ 3, -4, 9, -16, 5, -2 ], i = n.slice();
          t.case = "test entityMax with array";
          var a = e.entityMax([ 3, 1, 9, 0, 5 ]);
          t.identical(a, {
            index: 2,
            key: 2,
            value: 9,
            element: 9
          }), t.case = "test entityMax with array and simple onElement function", a = e.entityMax(n, sqr), 
          t.identical(a, {
            index: 3,
            key: 3,
            value: 256,
            element: -16
          }), t.case = "test entityMax with array : passed array should be unmodified", t.identical(n, i), 
          t.case = "test entityMax with map", a = e.entityMax({
            a: 25,
            b: 16,
            c: 9
          }, Math.sqrt), t.identical(a, {
            index: 0,
            key: "a",
            value: 5,
            element: 25
          }), t.case = "missed arguments", t.shouldThrowError(function() {
            e.entityMax();
          }), t.case = "extra argument", t.shouldThrowError(function() {
            e.entityMax([ 1, 3 ], sqr, !0);
          }), t.case = "second argument is not routine", t.shouldThrowError(function() {
            e.entityMax([ 1, 3 ], "callback");
          });
        },
        //
        entityLength: 
        //
        function entityLength(t) {
          // array like entity
          function Constr1() {
            this.a = 34, this.b = "s", this[100] = "sms";
          }
          var n = function() {
            return arguments;
          }(0, 1, 2, 4);
          Constr1.prototype.toString = function() {
            console.log("some message");
          }, Constr1.prototype.c = 99;
          var i = new Constr1(), a = {};
          Object.defineProperties(a, // add properties, only one is enumerable
          {
            "property1": {
              value: !0,
              writable: !0
            },
            "property2": {
              value: "Hello",
              writable: !0
            },
            "property3": {
              enumerable: !0,
              value: "World",
              writable: !0
            }
          }), t.case = "entity is undefined";
          var r = e.entityLength(void 0);
          t.identical(r, 0), t.case = "entity is number", r = e.entityLength(34), t.identical(r, 1), 
          t.case = "entity is string", r = e.entityLength("hello"), t.identical(r, 1), t.case = "entity is array", 
          r = e.entityLength([ 23, 17, , 34 ]), t.identical(r, 4), t.case = "entity is nested array", 
          r = e.entityLength([ 0, 1, [ 2, 4 ] ]), t.identical(r, 3), t.case = "entity is object", 
          r = e.entityLength({
            a: 1,
            b: 2,
            c: 3
          }), t.identical(r, 3), t.case = "entity is nested object", r = e.entityLength({
            a: 1,
            b: {
              e: 2,
              c: 3
            }
          }), t.identical(r, 2), t.case = "entity is array like", r = e.entityLength(n), t.identical(r, 4), 
          t.case = "entity is array like", r = e.entityLength(n), t.identical(r, 4), console.log(e.toStr(i)), 
          t.case = "entity is created instance of class", r = e.entityLength(i), t.identical(r, 3), 
          t.case = "some properties are non enumerable", r = e.entityLength(a), t.identical(r, 1);
        },
        entitySize: 
        //
        function entitySize(t) {
          t.case = "string";
          var n = e.entitySize("str"), i = 3;
          t.identical(n, i), 
          // wrong because routine has this code
          // if( _.numberIs( src ) )
          // return 8;
          // so, expected should be 8
          t.case = "atomic type", n = e.entitySize(6), i = 8, t.identical(n, i), t.case = "buffer", 
          n = e.entitySize(new ArrayBuffer(10)), i = 10, t.identical(n, i), 
          // wrong because routine has code
          // if( _.longIs( src ) )
          // {
          //   let result = 0;
          //   for( let i = 0; i < src.length; i++ )
          //   {
          //     result += _.entitySize( src[ i ] );
          //     if( isNaN( result ) )
          //     break;
          //   }
          //   return result;
          // }
          // so, expected should be 3 * 8 = 24
          t.case = "arraylike", n = e.entitySize([ 1, 2, 3 ]), i = 24, t.identical(n, i), 
          // wrong because routine has code
          // if( _.mapIs( src ) )
          // {
          //   let result = 0;
          //   for( let k in src )
          //   {
          //     result += _.entitySize( k );
          //     result += _.entitySize( src[ k ] );
          //     if( isNaN( result ) )
          //     break;
          //   }
          //   return result;
          // }
          // so, expected should be 1 + 8 + 1 + 8 = 18
          t.case = "object", n = e.entitySize({
            a: 1,
            b: 2
          }), i = 18, t.identical(n, i), 
          // wrong because routine has code
          // if( !_.definedIs( src ) )
          // return 8;
          // so, expected should be 8
          t.case = "empty call", n = e.entitySize(void 0), i = 8, t.identical(n, i), t.case = "no arguments", 
          t.shouldThrowError(function() {
            e.entitySize();
          }), t.case = "redundant arguments", t.shouldThrowError(function() {
            e.entitySize(1, 2);
          }), t.case = "redundant arguments", t.shouldThrowError(function() {
            e.entitySize(1, void 0);
          }), t.case = "redundant arguments", t.shouldThrowError(function() {
            e.entitySize([], void 0);
          });
        }
      }
    }, t = wTestSuite(t), "undefined" == typeof module || module.parent || wTester.test(t.name);
  }();
  // == end of file EntityTestS
}();