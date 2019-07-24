!function MapTestS() {
  // == begin of file MapTestS
  !function _Map_test_s() {
    "use strict";
    //
    // map manipulator
    //
    function mapSetWithKeys(a) {
      a.case = "dstMap is null or empty";
      var n = e.mapSetWithKeys(null, [], 2);
      a.identical(n, {}), n = e.mapSetWithKeys({}, [], 2), a.identical(n, {}), n = e.mapSetWithKeys(null, "a", 2), 
      a.identical(n, {
        "a": 2
      }), n = e.mapSetWithKeys({}, "a", 2), a.identical(n, {
        "a": 2
      }), n = e.mapSetWithKeys(null, [ "a", "b" ], 2), a.identical(n, {
        "a": 2,
        "b": 2
      }), n = e.mapSetWithKeys({}, [ "a", "b" ], 2), a.identical(n, {
        "a": 2,
        "b": 2
      }), n = e.mapSetWithKeys({}, [ 1, 2 ], 2), a.identical(n, {
        1: 2,
        2: 2
      }), a.case = "dstMap is not null", n = e.mapSetWithKeys({
        "a": 2
      }, "a", "abc"), a.identical(n, {
        "a": "abc"
      }), n = e.mapSetWithKeys({
        "a": 2
      }, "b", 3), a.identical(n, {
        "a": 2,
        "b": 3
      }), n = e.mapSetWithKeys({
        "a": 2,
        "b": 1,
        "c": "a"
      }, [ "b", "c" ], 3), a.identical(n, {
        "a": 2,
        "b": 3,
        "c": 3
      }), n = e.mapSetWithKeys({
        0: 0
      }, [ 1, 2 ], 2), a.identical(n, {
        0: 0,
        1: 2,
        2: 2
      }), a.case = "val is array", n = e.mapSetWithKeys({
        "a": 2,
        "b": 1,
        "c": "a"
      }, [ "b", "c" ], [ 3 ]), a.identical(n, {
        "a": 2,
        "b": [ 3 ],
        "c": [ 3 ]
      }), n = e.mapSetWithKeys({
        "a": 2,
        "b": 1,
        "c": "a"
      }, [ "b", "c" ], [ 3, "aa" ]), a.identical(n, {
        "a": 2,
        "b": [ 3, "aa" ],
        "c": [ 3, "aa" ]
      }), n = e.mapSetWithKeys({
        0: 0
      }, [ 0, 2 ], [ 3, "aa" ]), a.identical(n, {
        0: [ 3, "aa" ],
        2: [ 3, "aa" ]
      }), a.case = "val is object", n = e.mapSetWithKeys({
        "a": 2,
        "b": 1,
        "c": "a"
      }, [ "b", "c" ], {
        "cc": 1
      }), a.identical(n, {
        "a": 2,
        "b": {
          "cc": 1
        },
        "c": {
          "cc": 1
        }
      }), n = e.mapSetWithKeys({
        "a": 2,
        "b": 1,
        "c": "a"
      }, [ "b", "c" ], {
        "d": void 0
      }), a.identical(n, {
        "a": 2,
        "b": {
          "d": void 0
        },
        "c": {
          "d": void 0
        }
      }), n = e.mapSetWithKeys({
        0: 0
      }, [ 0, 2 ], {
        3: "aa"
      }), a.identical(n, {
        0: {
          3: "aa"
        },
        2: {
          3: "aa"
        }
      }), a.case = "src has null or undefined values", n = e.mapSetWithKeys({
        "a": 2,
        "b": 1,
        "c": "a"
      }, [ null, "c" ], "aa"), a.identical(n, {
        "a": 2,
        "b": 1,
        "c": "aa",
        null: "aa"
      }), n = e.mapSetWithKeys({
        "a": 2,
        "b": 1,
        "c": "a"
      }, [ void 0, "c" ], "aa"), a.identical(n, {
        "a": 2,
        "b": 1,
        "c": "aa",
        undefined: "aa"
      }), a.case = "no arguments", a.shouldThrowErrorSync(() => e.mapSetWithKeys()), a.case = "too many arguments", 
      a.shouldThrowErrorSync(() => e.mapSetWithKeys({}, "a", "a", 1)), a.case = "dstMap is not object or null", 
      a.shouldThrowErrorSync(() => e.mapSetWithKeys([], "a", "a")), a.case = "src is not array of strings or string", 
      a.shouldThrowErrorSync(() => e.mapSetWithKeys({
        "a": 1
      }, 1, "a")), a.shouldThrowErrorSync(() => e.mapSetWithKeys({
        "a": 1
      }, {
        "k": 2
      }, "a"));
    }
    //
        "undefined" != typeof module && require("../Layer2.s").include("wTesting"), 
    _global_;
    var e = _global_.wTools, a = {
      name: "Tools/base/l1/Map",
      silencing: 1,
      tests: {
        // map tester
        mapIs: 
        //
        function mapIs(a) {
          a.case = "an empty object";
          var n = e.mapIs({}), r = !0;
          a.identical(n, r), a.case = "an object", n = e.mapIs({
            a: 7,
            b: 13
          }), r = !0, a.identical(n, r), a.case = "no argument", n = e.mapIs(), r = !1, a.identical(n, r), 
          a.case = "an array", n = e.mapIs([]), r = !1, a.identical(n, r), a.case = "a string", 
          n = e.mapIs("str"), r = !1, a.identical(n, r), a.case = "a number", n = e.mapIs(13), 
          r = !1, a.identical(n, r), a.case = "a boolean", n = e.mapIs(!0), r = !1, a.identical(n, r), 
          a.case = "a function", n = e.mapIs(function() {}), r = !1, a.identical(n, r), a.case = "a string", 
          n = e.mapIs(Object.create({
            a: 7
          })), r = !1, a.identical(n, r);
        }
        //
        ,
        // map move
        mapCloneAssigning: function mapCloneAssigning(a) {
          a.case = "an Example";
          var n = new function Example() {
            this.name = "Peter", this.age = 27;
          }(), r = {
            sex: "Male"
          }, t = e.mapCloneAssigning({
            srcMap: n,
            dstMap: r
          });
          a.is(r === t), a.identical(t, {
            sex: "Male",
            name: "Peter",
            age: 27
          }), a.case = "no arguments", a.shouldThrowError(function() {
            e.mapCloneAssigning();
          }), a.case = "redundant argument", a.shouldThrowError(function() {
            e.mapCloneAssigning({}, {}, "wrong arguments");
          }), a.case = "wrong type of array", a.shouldThrowError(function() {
            e.mapCloneAssigning([]);
          }), a.case = "wrong type of arguments", a.shouldThrowError(function() {
            e.mapCloneAssigning("wrong arguments");
          });
        }
        //
        ,
        mapExtendConditional: function mapExtendConditional(a) {
          a.case = "an unique object";
          debugger;
          var n = e.mapExtendConditional(e.field.mapper.dstNotHas, {
            a: 1,
            b: 2
          }, {
            a: 1,
            c: 3
          });
          a.identical(n, {
            a: 1,
            b: 2,
            c: 3
          }), a.case = "no arguments", a.shouldThrowError(function() {
            e.mapExtendConditional();
          }), a.case = "few argument", a.shouldThrowError(function() {
            e.mapExtendConditional(e.field.mapper.dstNotHas);
          }), a.case = "wrong type of array", a.shouldThrowError(function() {
            e.mapExtendConditional([]);
          }), a.case = "wrong type of arguments", a.shouldThrowError(function() {
            e.mapExtendConditional("wrong arguments");
          });
        }
        //
        ,
        mapExtend: function mapExtend(a) {
          /* */
          a.open("first argument is null"), a.case = "trivial";
          /* */
          var n = {
            a: 1,
            b: 2
          }, r = {
            a: 1,
            b: 2
          }, t = {
            c: 3,
            d: 4
          }, i = {
            c: 3,
            d: 4
          }, s = e.mapExtend(null, n, t), o = {
            a: 1,
            b: 2,
            c: 3,
            d: 4
          };
          a.will = "return", a.identical(s, o), a.will = "preserve src1", a.identical(n, r), 
          a.will = "preserve src2", a.identical(t, i), a.will = "return not src1", a.is(s !== n), 
          a.will = "return not src2", a.is(s !== t), a.case = "rewriting", n = {
            a: 1,
            b: 2
          }, r = {
            a: 1,
            b: 2
          }, t = {
            b: 22,
            c: 3,
            d: 4
          }, i = {
            b: 22,
            c: 3,
            d: 4
          }, s = e.mapExtend(null, n, t), o = {
            a: 1,
            b: 22,
            c: 3,
            d: 4
          }, a.will = "return", a.identical(s, o), a.will = "preserve src1", a.identical(n, r), 
          a.will = "preserve src2", a.identical(t, i), a.will = "return not src1", a.is(s !== n), 
          a.will = "return not src2", a.is(s !== t), a.close("first argument is null"), 
          /* */
          a.open("first argument is dst"), a.case = "trivial";
          /* */
          var c = {
            a: 1,
            b: 2
          };
          t = {
            c: 3,
            d: 4
          }, i = {
            c: 3,
            d: 4
          }, s = e.mapExtend(c, t), o = {
            a: 1,
            b: 2,
            c: 3,
            d: 4
          }, a.will = "return", a.identical(s, o), a.will = "preserve src2", a.identical(t, i), 
          a.will = "return dst", a.is(s === c), a.will = "return not src2", a.is(s !== t), 
          a.case = "rewriting", c = {
            a: 1,
            b: 2
          }, t = {
            b: 22,
            c: 3,
            d: 4
          }, i = {
            b: 22,
            c: 3,
            d: 4
          }, s = e.mapExtend(c, t), o = {
            a: 1,
            b: 22,
            c: 3,
            d: 4
          }, a.will = "return", a.identical(s, o), a.will = "preserve src2", a.identical(t, i), 
          a.will = "return not dst", a.is(s === c), a.will = "return not src2", a.is(s !== t), 
          a.close("first argument is dst"), 
          /* */
          a.case = "trivial, first argument", n = {
            a: 7,
            b: 13
          }, r = {
            a: 7,
            b: 13
          }, t = {
            c: 3,
            d: 33
          }, i = {
            c: 3,
            d: 33
          }, s = e.mapExtend(n, t), o = {
            a: 7,
            b: 13,
            c: 3,
            d: 33
          }, a.identical(s, o), a.identical(t, i), a.is(s === n), a.is(s !== t), a.case = "complex, first argument is null", 
          n = {
            a: 1,
            b: 1,
            c: 1,
            z: 1
          }, r = {
            a: 1,
            b: 1,
            c: 1,
            z: 1
          }, t = {
            a: 2,
            c: 2,
            d: 2
          }, i = {
            a: 2,
            c: 2,
            d: 2
          };
          var l = {
            a: 3,
            b: 3,
            e: 3
          }, m = {
            a: 3,
            b: 3,
            e: 3
          };
          s = e.mapExtend(null, n, t, l), o = {
            a: 3,
            b: 3,
            c: 2,
            d: 2,
            e: 3,
            z: 1
          }, a.identical(s, o), a.identical(n, r), a.identical(t, i), a.identical(l, m), a.is(s !== n), 
          a.is(s !== t), a.is(s !== l), a.case = "complex, first argument is not null", n = {
            a: 1,
            b: 1,
            c: 1,
            z: 1
          }, r = {
            a: 1,
            b: 1,
            c: 1,
            z: 1
          }, t = {
            a: 2,
            c: 2,
            d: 2
          }, i = {
            a: 2,
            c: 2,
            d: 2
          }, l = {
            a: 3,
            b: 3,
            e: 3
          }, m = {
            a: 3,
            b: 3,
            e: 3
          }, s = e.mapExtend(n, t, l), o = {
            a: 3,
            b: 3,
            c: 2,
            d: 2,
            e: 3,
            z: 1
          }, a.identical(s, o), a.identical(t, i), a.identical(l, m), a.is(s === n), a.is(s !== t), 
          a.is(s !== l), a.case = "extend pure map by empty strings, first argument is null", 
          (n = Object.create(null)).a = "1", n.b = "1", n.c = "1", n.z = "1", (r = Object.create(null)).a = "1", 
          r.b = "1", r.c = "1", r.z = "1", (t = Object.create(null)).a = "", t.c = "", t.d = "", 
          t.e = "2", (i = Object.create(null)).a = "", i.c = "", i.d = "", i.e = "2", s = e.mapExtend(null, n, t), 
          o = {
            a: "",
            b: "1",
            c: "",
            d: "",
            e: "2",
            z: "1"
          }, a.identical(s, o), a.identical(n, r), a.identical(t, i), a.is(s !== n), a.is(s !== t), 
          a.case = "extend pure map by empty strings, first argument is not null", (n = Object.create(null)).a = "1", 
          n.b = "1", n.c = "1", n.z = "1", (r = Object.create(null)).a = "1", r.b = "1", r.c = "1", 
          r.z = "1", (t = Object.create(null)).a = "", t.c = "", t.d = "", t.e = "2", (i = Object.create(null)).a = "", 
          i.c = "", i.d = "", i.e = "2", s = e.mapExtend(n, t), o = {
            a: "",
            b: "1",
            c: "",
            d: "",
            e: "2",
            z: "1"
          }, a.identical(s, o), a.identical(t, i), a.is(s === n), a.is(s !== t), a.case = "object like array", 
          s = e.mapExtend(null, [ 3, 7, 13, 73 ]), o = {
            0: 3,
            1: 7,
            2: 13,
            3: 73
          }, a.identical(s, o), 
          /**/
          a.case = "extend complex map by complex map", (c = Object.create(null)).x1 = "1", 
          c.x2 = 2, (c = Object.create(c)).x3 = 3, c.x4 = 4;
          var p = Object.create(null);
          p.x1 = "11", p.y2 = 12, (p = Object.create(p)).x3 = 13, p.y4 = 14, (o = Object.create(null)).x1 = "1", 
          o.x2 = 2, (o = Object.create(o)).x4 = 4, o.x1 = "11", o.y2 = 12, o.x3 = 13, o.y4 = 14, 
          s = e.mapExtend(c, p), a.identical(s, o), a.is(s === c);
        }
        //
        ,
        mapSupplement: function mapSupplement(a) {
          a.case = "an object";
          var n = e.mapSupplement({
            a: 1,
            b: 2
          }, {
            a: 1,
            c: 3
          });
          a.identical(n, {
            a: 1,
            b: 2,
            c: 3
          }), a.case = "no argument", a.shouldThrowError(function() {
            e.mapSupplement();
          }), 
          // test.case = 'wrong type of array';
          // test.shouldThrowError( function()
          // {
          //   _.mapSupplement( [] );
          // });
          a.case = "wrong type of arguments", a.shouldThrowError(function() {
            e.mapSupplement("wrong arguments");
          });
        }
        //
        ,
        mapComplement: function mapComplement(a) {
          a.case = "an object";
          var n = e.mapComplement({
            a: 1,
            b: "ab"
          }, {
            a: 12,
            c: 3
          });
          a.identical(n, {
            a: 1,
            b: "ab",
            c: 3
          }), a.case = "no argument", a.shouldThrowError(function() {
            e.mapComplement();
          }), a.case = "wrong type of array", a.shouldThrowError(function() {
            e.mapComplement([]);
          }), a.case = "wrong type of arguments", a.shouldThrowError(function() {
            e.mapComplement("wrong arguments");
          });
        }
        //
        ,
        mapMake: function mapMake(a) {
          a.case = "empty";
          /**/
          var n = e.mapMake(), r = {};
          a.identical(n, r), a.is(e.mapIsPure(n)), n = e.mapMake(null), r = {}, a.identical(n, r), 
          a.is(e.mapIsPure(n)), n = e.mapMake(void 0), r = {}, a.identical(n, r), a.is(e.mapIsPure(n)), 
          a.case = "empty map";
          /**/
          var t = {}, i = e.mapExtend(null, t);
          n = e.mapMake(t), r = {}, a.identical(n, r), a.is(e.mapIsPure(n)), a.identical(t, i), 
          a.is(n !== t), a.case = "single map", t = {
            a: 7,
            b: 13
          }, i = e.mapExtend(null, t), n = e.mapMake(t), r = {
            a: 7,
            b: 13
          }, a.identical(n, r), a.is(e.mapIsPure(n)), a.identical(t, i), a.is(n !== t), a.case = "trivial", 
          t = {
            a: 7,
            b: 13
          };
          /**/
          var s = {
            a: 77,
            c: 3,
            d: 33
          }, o = {
            a: "x",
            e: 77
          }, c = (i = e.mapExtend(null, t), e.mapExtend(null, s)), l = e.mapExtend(null, o);
          n = e.mapMake(t, s, o), r = {
            a: "x",
            b: 13,
            c: 3,
            d: 33,
            e: 77
          }, a.identical(n, r), a.is(e.mapIsPure(n)), a.identical(t, i), a.identical(s, c), 
          a.identical(o, l), a.is(n !== t), a.is(n !== s), a.is(n !== o), 
          /* */
          a.case = "bad arguments", /**/
          a.shouldThrowError(function() {
            e.mapMake("");
          }), a.case = "bad arguments", /**/
          a.shouldThrowError(function() {
            e.mapMake("x");
          }), a.case = "bad arguments", /**/
          a.shouldThrowError(function() {
            e.mapMake(null, "x");
          }), a.case = "bad arguments";
        },
        // map manipulator
        mapSetWithKeys: mapSetWithKeys,
        mapSet: mapSetWithKeys,
        // map convert
        mapFirstPair: function mapFirstPair(a) {
          a.case = "first pair [ key, value ]";
          var n = e.mapFirstPair({
            a: 3,
            b: 13
          }), r = [ "a", 3 ];
          a.identical(n, r), a.case = "undefined", n = e.mapFirstPair({}), r = [], a.identical(n, r), 
          a.case = "pure map";
          var t = Object.create(null);
          t.a = 7, n = e.mapFirstPair(t), r = [ "a", 7 ], a.identical(n, r), a.case = "no argument", 
          a.shouldThrowError(function() {
            e.mapFirstPair();
          }), a.case = "wrong type of argument", a.shouldThrowError(function() {
            e.mapFirstPair("wrong argument");
          });
        }
        //
        ,
        mapValWithIndex: function mapValWithIndex(a) {
          a.case = "second index";
          var n = e.mapValWithIndex({
            0: 3,
            1: 13,
            2: "c",
            3: 7
          }, 2), r = "c";
          a.identical(n, r), a.case = "an element", n = e.mapValWithIndex({
            0: [ "a", 3 ]
          }, 0), r = [ "a", 3 ], a.identical(n, r), a.case = "a list of arrays", n = e.mapValWithIndex({
            0: [ "a", 3 ],
            1: [ "b", 13 ],
            2: [ "c", 7 ]
          }, 2), r = [ "c", 7 ], a.identical(n, r), a.case = "a list of objects", n = e.mapValWithIndex({
            0: {
              a: 3
            },
            1: {
              b: 13
            },
            2: {
              c: 7
            }
          }, 2), r = {
            c: 7
          }, a.identical(n, r), a.case = "no arguments", a.shouldThrowError(function() {
            e.mapValWithIndex();
          }), a.case = "few argument", a.shouldThrowError(function() {
            e.mapValWithIndex([ [] ]);
          }), a.case = "first the four argument not wrapped into array", a.shouldThrowError(function() {
            e.mapValWithIndex(3, 13, "c", 7, 2);
          }), a.case = "redundant argument", a.shouldThrowError(function() {
            e.mapValWithIndex([ [] ], 2, "wrong arguments");
          }), a.case = "wrong type of argument", a.shouldThrowError(function() {
            e.mapValWithIndex("wrong argumetns");
          });
        }
        //
        ,
        mapKeyWithIndex: function mapKeyWithIndex(a) {
          a.case = "last key";
          var n = e.mapKeyWithIndex({
            "a": 3,
            "b": 13,
            "c": 7
          }, 2), r = "c";
          a.identical(n, r), a.case = "first key", n = e.mapKeyWithIndex({
            0: {
              a: 3
            },
            1: 13,
            2: "c",
            3: 7
          }, 3), r = "3", a.identical(n, r), a.case = "no argument", a.shouldThrowError(function() {
            e.mapKeyWithIndex();
          }), a.case = "few arguments", a.shouldThrowError(function() {
            e.mapKeyWithIndex([]);
          }), a.case = "redundant argument", a.shouldThrowError(function() {
            e.mapKeyWithIndex([], 2, "wrong arguments");
          }), a.case = "wrong type of argument", a.shouldThrowError(function() {
            e.mapKeyWithIndex("wrong argumetns");
          });
        }
        //
        ,
        mapToStr: function mapToStr(a) {
          a.case = "returns an empty string";
          var n = e.mapToStr({
            src: [],
            keyValDelimeter: " : ",
            entryDelimeter: "; "
          }), r = "";
          a.identical(n, r), a.case = "returns a string representing an object", n = e.mapToStr({
            src: {
              a: 1,
              b: 2,
              c: 3,
              d: 4
            },
            keyValDelimeter: " : ",
            entryDelimeter: "; "
          }), r = "a : 1; b : 2; c : 3; d : 4", a.identical(n, r), a.case = "returns a string representing an array", 
          n = e.mapToStr({
            src: [ 1, 2, 3 ],
            keyValDelimeter: " : ",
            entryDelimeter: "; "
          }), r = "0 : 1; 1 : 2; 2 : 3", a.identical(n, r), a.case = "returns a string representing an array-like object", 
          n = e.mapToStr({
            src: function args() {
              return arguments;
            }(1, 2, 3, 4, 5),
            keyValDelimeter: " : ",
            entryDelimeter: "; "
          }), r = "0 : 1; 1 : 2; 2 : 3; 3 : 4; 4 : 5", a.identical(n, r), a.case = "returns a string representing a string", 
          n = e.mapToStr({
            src: "abc",
            keyValDelimeter: " : ",
            entryDelimeter: "; "
          }), r = "0 : a; 1 : b; 2 : c", a.identical(n, r), a.case = "no argument", a.shouldThrowError(function() {
            e.mapToStr();
          }), a.case = "wrong type of number", a.shouldThrowError(function() {
            e.mapToStr(13);
          }), a.case = "wrong type of arguments", a.shouldThrowError(function() {
            e.mapToStr(!0);
          });
        }
        //
        ,
        mapsFlatten: function mapsFlatten(a) {
          a.case = "empty map";
          var n = {}, r = {}, t = e.mapsFlatten({
            src: n
          });
          a.identical(t, r), a.case = "empty array", n = [], r = {}, t = e.mapsFlatten(n), 
          a.identical(t, r), a.case = "array of empty maps", n = [ {}, {} ], r = {}, t = e.mapsFlatten(n), 
          a.identical(t, r), a.case = "trivial", n = [ {
            a: 1,
            b: {
              c: 1,
              d: 1
            }
          }, {
            e: 2,
            f: {
              g: {
                h: 2
              }
            }
          } ], r = {
            a: 1,
            "b/c": 1,
            "b/d": 1,
            e: 2,
            "f/g/h": 2
          }, t = e.mapsFlatten(n), a.identical(t, r), a.case = "delimeter : .", n = [ {
            a: 1,
            dir: {
              b: 2
            }
          }, {
            c: 3
          } ], r = {
            "a": 1,
            "dir.b": 2,
            "c": 3
          }, t = e.mapsFlatten({
            src: n,
            delimeter: "."
          }), a.identical(t, r), a.case = "delimeter : ", n = [ {
            a: 1,
            dir: {
              b: 2
            }
          }, {
            c: 3
          } ], r = {
            "a": 1,
            "dirb": 2,
            "c": 3
          }, t = e.mapsFlatten({
            src: n,
            delimeter: ""
          }), a.identical(t, r), a.case = "delimeter : 0", n = [ {
            a: 1,
            dir: {
              b: 2
            }
          }, {
            c: 3
          } ], r = {
            "a": 1,
            "b": 2,
            "c": 3
          }, t = e.mapsFlatten({
            src: n,
            delimeter: 0
          }), a.identical(t, r), a.case = "delimeter : false", n = [ {
            a: 1,
            dir: {
              b: 2
            }
          }, {
            c: 3
          } ], r = {
            "a": 1,
            "b": 2,
            "c": 3
          }, t = e.mapsFlatten({
            src: n,
            delimeter: !1
          }), a.identical(t, r), a.case = "allowingCollision : 1", n = [ {
            a: 1,
            dir: {
              b: 2
            }
          }, {
            a: 3,
            dir: {
              b: 4,
              c: 5
            }
          } ], r = {
            "a": 3,
            "dir/b": 4,
            "dir/c": 5
          }, t = e.mapsFlatten({
            src: n,
            allowingCollision: 1
          }), a.identical(t, r), a.case = "delimeter : 0, allowingCollision : 1", n = [ {
            a: 1,
            dir: {
              b: 2
            }
          }, {
            a: 3,
            dir: {
              b: 4,
              c: 5
            }
          } ], r = {
            "a": 3,
            "b": 4,
            "c": 5
          }, t = e.mapsFlatten({
            src: n,
            delimeter: 0,
            allowingCollision: 1
          }), a.identical(t, r), a.case = "delimeter : 0, allowingCollision : 1", n = [ {
            a: 1,
            dir: {
              b: 2
            }
          }, {
            a: 3,
            dir: {
              b: 4,
              c: 5
            }
          } ], r = {
            "a": 3,
            "b": 4,
            "c": 5,
            "d": 6
          }, t = e.mapsFlatten({
            src: n,
            dst: {
              a: 0,
              d: 6
            },
            delimeter: 0,
            allowingCollision: 1
          }), a.identical(t, r), a.case = "collision", a.shouldThrowErrorSync(() => {
            e.mapsFlatten({
              src: {
                dir: {
                  a: 2
                }
              },
              dst: {
                "dir/a": 1
              }
            });
          }), a.shouldThrowErrorSync(() => {
            e.mapsFlatten({
              src: [ {
                dir: {
                  a: 2
                }
              }, {
                dir: {
                  a: 2
                }
              } ]
            });
          }), a.shouldThrowErrorSync(() => {
            e.mapsFlatten({
              src: [ {
                dir: {
                  a: 2
                }
              }, {
                dir: {
                  a: 2
                }
              } ],
              allowingCollision: 0
            });
          }), a.shouldThrowErrorSync(() => {
            e.mapsFlatten({
              src: [ {
                dir: {
                  a: 2
                }
              }, {
                dir: {
                  a: 2
                }
              } ],
              delimeter: 0
            });
          }), a.shouldThrowErrorSync(() => {
            e.mapsFlatten({
              src: [ {
                dir: {
                  a: 2
                }
              }, {
                dir: {
                  a: 2
                }
              } ],
              delimeter: 0,
              allowingCollision: 0
            });
          }), a.case = "bad arguments", a.shouldThrowErrorSync(() => e.mapsFlatten()), a.shouldThrowErrorSync(() => e.mapsFlatten({})), 
          a.shouldThrowErrorSync(() => e.mapsFlatten({}, {})), a.shouldThrowErrorSync(() => e.mapsFlatten("a")), 
          a.shouldThrowErrorSync(() => e.mapsFlatten(1)), a.shouldThrowErrorSync(() => e.mapsFlatten(null)), 
          a.shouldThrowErrorSync(() => e.mapsFlatten([ "a" ])), a.shouldThrowErrorSync(() => e.mapsFlatten([ 1 ])), 
          a.shouldThrowErrorSync(() => e.mapsFlatten([ null ])), a.shouldThrowErrorSync(() => e.mapsFlatten({
            src: void 0
          })), a.shouldThrowErrorSync(() => e.mapsFlatten({
            src: "a"
          })), a.shouldThrowErrorSync(() => e.mapsFlatten({
            src: 1
          })), a.shouldThrowErrorSync(() => e.mapsFlatten({
            src: null
          })), a.shouldThrowErrorSync(() => e.mapsFlatten({
            src: [ "a" ]
          })), a.shouldThrowErrorSync(() => e.mapsFlatten({
            src: [ 1 ]
          })), a.shouldThrowErrorSync(() => e.mapsFlatten({
            src: [ null ]
          }));
        }
        //
        ,
        // map properties
        mapKeys: function mapKeys(a) {
          a.case = "trivial";
          var n = e.mapKeys({}), r = [];
          a.identical(n, r), n = e.mapKeys({
            a: 1,
            b: void 0
          }), r = [ "a", "b" ], a.identical(n, r), n = e.mapKeys({
            a: 7,
            b: 13
          }), r = [ "a", "b" ], a.identical(n, r), n = e.mapKeys({
            7: "a",
            3: "b",
            13: "c"
          }), r = [ "3", "7", "13" ], a.identical(n, r);
          var t = function() {};
          Object.setPrototypeOf(t, String), t.a = 1, n = e.mapKeys(t), r = [ "a" ], a.identical(n, r), 
          n = e.mapKeys(new Date()), r = [], a.identical(n, r), 
          //
          a.case = "options";
          var i = {
            a: 1
          }, s = {
            b: 2
          };
          Object.setPrototypeOf(i, s), n = e.mapKeys(i), r = [ "a", "b" ], a.identical(n, r);
          /* own on */
          var o = {
            own: 1
          };
          n = e.mapKeys.call(o, i), r = [ "a" ], a.identical(n, r), o = {
            enumerable: 0,
            own: 0
          }, Object.defineProperty(s, "k", {
            enumerable: 0
          }), n = e.mapKeys.call(o, i), r = e.mapAllKeys(i), a.identical(n, r), o = {
            enumerable: 0,
            own: 1
          }, Object.defineProperty(i, "k", {
            enumerable: 0
          }), n = e.mapKeys.call(o, i), r = [ "a", "k" ], a.identical(n, r), a.case = "no argument", 
          a.shouldThrowError(function() {
            e.mapKeys();
          }), a.case = "wrong type of argument", a.shouldThrowError(function() {
            e.mapKeys("wrong arguments");
          }), a.case = "unknown option", a.shouldThrowError(function() {
            debugger;
            e.mapKeys.call({
              x: 1
            }, {});
            debugger;
          });
        }
        //
        ,
        mapOwnKeys: function mapOwnKeys(a) {
          a.case = "empty";
          var n = e.mapOwnKeys({}), r = [];
          a.identical(n, r), 
          //
          a.case = "simplest", n = e.mapOwnKeys({
            a: "1",
            b: "2"
          }), r = [ "a", "b" ], a.identical(n, r), n = e.mapOwnKeys(new Date()), r = [], a.identical(n, r), 
          //
          a.case = "";
          var t = {
            a: 1
          }, i = {
            b: 2
          }, s = {
            c: 3
          };
          Object.setPrototypeOf(t, i), Object.setPrototypeOf(i, s), n = e.mapOwnKeys(t), r = [ "a" ], 
          a.identical(n, r), n = e.mapOwnKeys(i), r = [ "b" ], a.identical(n, r), n = e.mapOwnKeys(s), 
          r = [ "c" ], a.identical(n, r), 
          //
          a.case = "enumerable on/off", t = {
            a: "1"
          }, n = e.mapOwnKeys(t), r = [ "a" ], a.identical(n, r), Object.defineProperty(t, "k", {
            enumerable: !1
          }), n = e.mapOwnKeys.call({
            enumerable: 0
          }, t), r = [ "a", "k" ], a.identical(n, r), a.case = "no args", a.shouldThrowError(function() {
            e.mapOwnKeys();
          }), a.case = "invalid type", a.shouldThrowError(function() {
            e.mapOwnKeys(1);
          }), a.case = "unknown option", a.shouldThrowError(function() {
            e.mapOwnKeys.call({
              own: 0
            }, {});
          });
        }
        //
        ,
        mapAllKeys: function mapAllKeys(a) {
          var n = [ "__defineGetter__", "__defineSetter__", "hasOwnProperty", "__lookupGetter__", "__lookupSetter__", "propertyIsEnumerable", "__proto__", "constructor", "toString", "toLocaleString", "valueOf", "isPrototypeOf" ];
          //
                    a.case = "empty";
          var r = e.mapAllKeys({});
          a.identical(r.sort(), n.sort()), 
          //
          a.case = "one own property", r = e.mapAllKeys({
            a: 1
          }), (i = n.slice()).push("a"), a.identical(r.sort(), i.sort()), 
          //
          a.case = "date", r = e.mapAllKeys(new Date()), a.identical(r.length, 55), 
          //
          a.case = "not enumerable";
          var t = {};
          Object.defineProperty(t, "k", {
            enumerable: 0
          }), r = e.mapAllKeys(t), (i = n.slice()).push("k"), a.identical(r.sort(), i.sort()), 
          //
          a.case = "from prototype", t = {
            a: 1
          };
          var i, s = {
            b: 1
          };
          Object.setPrototypeOf(t, s), Object.defineProperty(t, "k", {
            enumerable: 0
          }), Object.defineProperty(s, "y", {
            enumerable: 0
          }), r = e.mapAllKeys(t), i = (i = n.slice()).concat([ "a", "b", "k", "y" ]), a.identical(r.sort(), i.sort()), 
          a.case = "no args", a.shouldThrowError(function() {
            e.mapAllKeys();
          }), a.case = "invalid argument", a.shouldThrowError(function() {
            e.mapAllKeys();
          }), a.case = "unknown option", a.shouldThrowError(function() {
            e.mapAllKeys.call({
              own: 0
            }, {});
          });
        }
        //
        ,
        mapVals: function mapVals(a) {
          a.case = "trivial";
          var n = e.mapVals({}), r = [];
          a.identical(n, r), n = e.mapVals({
            a: 1,
            b: void 0
          }), r = [ 1, void 0 ], a.identical(n, r), n = e.mapVals({
            a: 7,
            b: 13
          }), r = [ 7, 13 ], a.identical(n, r), n = e.mapVals({
            7: "a",
            3: "b",
            13: "c"
          }), r = [ "b", "a", "c" ], a.identical(n, r), n = e.mapVals(new Date()), r = [], 
          a.identical(n, r), 
          /* */
          a.case = "own";
          var t = {
            a: 1
          };
          Object.setPrototypeOf(t, {
            b: 2
          }), n = e.mapVals.call({
            own: 0,
            enumerable: 1
          }, t), r = [ 1, 2 ], a.identical(n, r), n = e.mapVals.call({
            own: 1,
            enumerable: 1
          }, t), r = [ 1 ], a.identical(n, r), 
          //
          a.case = "enumerable", t = {
            a: 1
          }, Object.defineProperty(t, "k", {
            enumerable: 0,
            value: 2
          }), n = e.mapVals.call({
            enumerable: 1,
            own: 0
          }, t), r = [ 1 ], a.identical(n, r), n = e.mapVals.call({
            enumerable: 0,
            own: 0
          }, t);
          for (
          /**/
          var i = !1, s = 0; s < n.length && (i = e.mapContain(t, n[s])); s++) ;
          a.is(i), a.case = "no argument", a.shouldThrowError(function() {
            e.mapVals();
          }), a.case = "wrong type of argument", a.shouldThrowError(function() {
            e.mapVals("wrong argument");
          }), a.case = "wrong option", a.shouldThrowError(function() {
            e.mapVals.call({
              a: 1
            }, {});
          });
        }
        //
        ,
        mapOwnVals: function mapOwnVals(a) {
          a.case = "trivial";
          var n = e.mapOwnVals({}), r = [];
          a.identical(n, r), n = e.mapOwnVals({
            a: 7,
            b: 13
          }), r = [ 7, 13 ], a.identical(n, r), n = e.mapOwnVals({
            7: "a",
            3: "b",
            13: "c"
          }), r = [ "b", "a", "c" ], a.identical(n, r), n = e.mapOwnVals(new Date()), r = [], 
          a.identical(n, r), 
          //
          a.case = " only own values";
          var t = {
            a: 1
          }, i = {
            b: 2
          };
          Object.setPrototypeOf(t, i), n = e.mapOwnVals(t), r = [ 1 ], a.identical(n, r), 
          /* enumerable off */
          Object.defineProperty(t, "k", {
            enumerable: 0,
            value: 3
          }), Object.defineProperty(i, "y", {
            enumerable: 0,
            value: 4
          }), n = e.mapOwnVals.call({
            enumerable: 0
          }, t), r = [ 1, 3 ], a.identical(n, r), a.case = "no argument", a.shouldThrowError(function() {
            e.mapOwnVals();
          }), a.case = "wrong type of argument", a.shouldThrowError(function() {
            e.mapOwnVals("wrong argument");
          }), a.case = "wrong option", a.shouldThrowError(function() {
            e.mapOwnVals.call({
              a: 1
            }, {});
          });
        }
        //
        ,
        mapAllVals: function mapAllVals(a) {
          a.case = "trivial";
          var n = e.mapAllVals({});
          a.is(n.length), n = e.mapAllVals({
            a: 7,
            b: 13
          }), a.is(n.length), a.is(-1 !== n.indexOf(7)), a.is(-1 !== n.indexOf(13)), n = e.mapAllVals(new Date()), 
          a.is(n.length > e.mapAllVals({}).length), 
          //
          a.case = "from prototype";
          var r = {
            a: 1
          };
          Object.setPrototypeOf(r, {
            b: 2
          }), n = e.mapAllVals(r), a.is(n.length > e.mapAllVals({}).length), a.is(-1 !== n.indexOf(1)), 
          a.is(-1 !== n.indexOf(2)), a.case = "no argument", a.shouldThrowError(function() {
            e.mapAllVals();
          }), a.case = "wrong type of argument", a.shouldThrowError(function() {
            e.mapAllVals("wrong argument");
          }), a.case = "wrong option", a.shouldThrowError(function() {
            e.mapAllVals.call({
              a: 1
            }, {});
          });
        }
        //
        ,
        mapPairs: function mapPairs(a) {
          a.case = "empty";
          var n = e.mapPairs({}), r = [];
          a.identical(n, r), n = e.mapPairs([]), r = [], a.identical(n, r), 
          /**/
          a.case = "a list of [ key, value ] pairs", n = e.mapPairs({
            a: 7,
            b: 13
          }), r = [ [ "a", 7 ], [ "b", 13 ] ], a.identical(n, r), a.case = "a list of [ key, value ] pairs", 
          n = e.mapPairs({
            a: 3,
            b: 13,
            c: 7
          }), r = [ [ "a", 3 ], [ "b", 13 ], [ "c", 7 ] ], a.identical(n, r);
          /**/
          var t = [];
          t.k = 1, n = e.mapPairs(t), r = [ [ "k", 1 ] ], a.identical(n, r), n = e.mapPairs(new Date()), 
          r = [], a.identical(n, r), 
          /* */
          a.case = "from prototype";
          var i = {
            a: 1
          };
          Object.setPrototypeOf(i, {
            b: 2
          }), n = e.mapPairs(i), r = [ [ "a", 1 ], [ "b", 2 ] ], a.identical(n, r), n = e.mapPairs.call({
            own: 1
          }, i), r = [ [ "a", 1 ] ], a.identical(n, r), 
          /* using enumerable off, own on */
          Object.defineProperty(i, "k", {
            enumerable: 0,
            value: 3
          }), n = e.mapPairs.call({
            enumerable: 0,
            own: 1
          }, i), r = [ [ "a", 1 ], [ "k", 3 ] ], a.identical(n, r), 
          /* using enumerable off, own off */
          Object.defineProperty(i, "k", {
            enumerable: 0,
            value: 3
          }), n = e.mapPairs.call({
            enumerable: 0,
            own: 0
          }, i), a.is(n.length > 2), a.identical(n[0], [ "a", 1 ]), a.identical(n[1], [ "k", 3 ]), 
          a.case = "no argument", a.shouldThrowError(function() {
            e.mapPairs();
          }), a.case = "primitive", a.shouldThrowError(function() {
            e.mapPairs(1);
          }), a.case = "wrong type of argument", a.shouldThrowError(function() {
            e.mapPairs("wrong argument");
          }), a.case = "redundant argument", a.shouldThrowError(function() {
            e.mapPairs({}, "wrong arguments");
          }), a.case = "wrong type of array", a.shouldThrowError(function() {
            e.mapPairs(null);
          });
        }
        //
        ,
        mapOwnPairs: function mapOwnPairs(a) {
          a.case = "empty";
          var n = e.mapOwnPairs({}), r = [];
          a.identical(n, r), 
          //
          a.case = "a list of [ key, value ] pairs", n = e.mapOwnPairs({
            a: 7,
            b: 13
          }), r = [ [ "a", 7 ], [ "b", 13 ] ], a.identical(n, r);
          /**/
          var t = [];
          t.k = 1, n = e.mapOwnPairs(t), r = [ [ "k", 1 ] ], a.identical(n, r), n = e.mapOwnPairs(new Date()), 
          r = [], a.identical(n, r), 
          //
          a.case = "from prototype";
          var i = {
            a: 1
          };
          Object.setPrototypeOf(i, {
            b: 2
          }), n = e.mapOwnPairs(i), r = [ [ "a", 1 ] ], a.identical(n, r), 
          /* using enumerable off */
          Object.defineProperty(i, "k", {
            enumerable: 0,
            value: 3
          }), n = e.mapOwnPairs.call({
            enumerable: 0
          }, i), r = [ [ "a", 1 ], [ "k", 3 ] ], a.identical(n, r), a.case = "no argument", 
          a.shouldThrowError(function() {
            e.mapOwnPairs();
          }), a.case = "primitive", a.shouldThrowError(function() {
            e.mapOwnPairs(1);
          }), a.case = "wrong type of argument", a.shouldThrowError(function() {
            e.mapOwnPairs("wrong argument");
          });
        }
        //
        ,
        mapAllPairs: function mapAllPairs(a) {
          a.case = "empty";
          var n = e.mapAllPairs({});
          a.is(n.length), 
          //
          a.case = "a list of [ key, value ] pairs", n = e.mapAllPairs({
            a: 7,
            b: 13
          }), a.is(n.length > 2), a.identical(n[0], [ "a", 7 ]), a.identical(n[1], [ "b", 13 ]);
          /**/
          var r = [];
          r.k = 1, n = e.mapAllPairs(r), a.is(n.length > 1), n = e.arrayFlatten([], n), a.is(-1 !== n.indexOf("k")), 
          a.identical(n[n.indexOf("k") + 1], 1), n = e.mapAllPairs(new Date()), a.is(n.length > 1), 
          n = e.arrayFlatten([], n), a.is(-1 !== n.indexOf("constructor")), a.identical(n[n.indexOf("constructor") + 1].name, "Date"), 
          //
          a.case = "from prototype";
          var t = {
            a: 1
          };
          Object.setPrototypeOf(t, {
            b: 2
          }), n = e.mapAllPairs(t), a.is(n.length > 2), a.identical(n[0], [ "a", 1 ]), a.identical(n[1], [ "b", 2 ]), 
          a.case = "no argument", a.shouldThrowError(function() {
            e.mapAllPairs();
          }), a.case = "primitive", a.shouldThrowError(function() {
            e.mapAllPairs(1);
          }), a.case = "wrong type of argument", a.shouldThrowError(function() {
            e.mapAllPairs("wrong argument");
          });
        }
        //
        ,
        mapProperties: function mapProperties(a) {
          a.case = "empty";
          var n = e.mapProperties({});
          a.identical(n, {}), n = e.mapProperties([]), a.identical(n, {}), 
          //
          a.case = "trivial", n = e.mapProperties({
            a: 1
          });
          var r = {
            a: 1
          };
          a.identical(n, r), (t = []).a = 1, n = e.mapProperties(t), r = {
            a: 1
          }, a.identical(n, r), n = e.mapProperties(new Date()), r = {}, a.identical(n, r), 
          //
          a.case = "prototype";
          var t = {
            a: 1
          };
          Object.setPrototypeOf(t, {
            b: 2
          }), n = e.mapProperties(t), r = {
            a: 1,
            b: 2
          }, a.identical(n, r), n = e.mapProperties.call({
            own: 1,
            enumerable: 1
          }, t), r = {
            a: 1
          }, a.identical(n, r), 
          /**/
          Object.defineProperty(t, "k", {
            enumerable: 0,
            value: 3
          }), n = e.mapProperties.call({
            enumerable: 0,
            own: 1
          }, t), r = {
            a: 1,
            k: 3
          }, a.identical(n, r), 
          /**/
          Object.defineProperty(t, "k", {
            enumerable: 0,
            value: 3
          }), n = e.mapProperties.call({
            enumerable: 0,
            own: 0
          }, t), a.is(Object.keys(n).length > 3), a.is(1 === n.a), a.is(2 === n.b), a.is(3 === n.k), 
          n = e.mapProperties.call({
            enumerable: 0,
            own: 0
          }, new Date()), a.is(Object.keys(n).length), a.is("Date" === n.constructor.name), 
          a.is(e.routineIs(n.getDate)), a.is(!!n.__proto__), a.case = "no argument", a.shouldThrowError(function() {
            e.mapProperties();
          }), a.case = "primitive", a.shouldThrowError(function() {
            e.mapProperties(1);
          }), a.case = "wrong type of argument", a.shouldThrowError(function() {
            e.mapProperties("wrong argument");
          }), a.case = "unknown option", a.shouldThrowError(function() {
            e.mapProperties.call({
              x: 1
            }, {});
          });
        }
        //
        ,
        mapOwnProperties: function mapOwnProperties(a) {
          a.case = "empty";
          var n = e.mapOwnProperties({});
          a.identical(n, {}), n = e.mapOwnProperties([]), a.identical(n, {}), 
          //
          a.case = "trivial", n = e.mapOwnProperties({
            a: 1
          });
          var r = {
            a: 1
          };
          a.identical(n, r), (t = []).a = 1, n = e.mapOwnProperties(t), r = {
            a: 1
          }, a.identical(n, r), n = e.mapOwnProperties(new Date()), r = {}, a.identical(n, r), 
          //
          a.case = "prototype";
          var t = {
            a: 1
          };
          Object.setPrototypeOf(t, {
            b: 2
          }), n = e.mapOwnProperties(t), r = {
            a: 1
          }, a.identical(n, r), 
          /**/
          Object.defineProperty(t, "k", {
            enumerable: 0,
            value: 3
          }), n = e.mapOwnProperties.call({
            enumerable: 0
          }, t), r = {
            a: 1,
            k: 3
          }, a.identical(n, r), n = e.mapOwnProperties.call({
            enumerable: 0
          }, new Date()), a.identical(n, {}), a.case = "no argument", a.shouldThrowError(function() {
            e.mapOwnProperties();
          }), a.case = "primitive", a.shouldThrowError(function() {
            e.mapOwnProperties(1);
          }), a.case = "wrong type of argument", a.shouldThrowError(function() {
            e.mapOwnProperties("wrong argument");
          }), a.case = "unknown option", a.shouldThrowError(function() {
            e.mapOwnProperties.call({
              x: 1
            }, {});
          });
        }
        //
        ,
        mapAllProperties: function mapAllProperties(a) {
          a.case = "empty";
          var n = e.mapAllProperties({});
          a.is(Object.keys(n).length), a.identical(n.constructor.name, "Object"), n = e.mapAllProperties([]), 
          a.is(Object.keys(n).length), a.identical(n.constructor.name, "Array"), 
          //
          a.case = "trivial", n = e.mapAllProperties({
            a: 1
          }), a.is(Object.keys(n).length > 1), a.identical(n.a, 1), (r = []).a = 1, n = e.mapAllProperties(r), 
          a.is(Object.keys(n).length > 1), a.identical(n.a, 1), n = e.mapAllProperties(new Date()), 
          a.is(e.routineIs(n.getDate)), a.identical(n.constructor.name, "Date"), 
          //
          a.case = "prototype";
          var r = {
            a: 1
          }, t = {
            b: 2
          };
          Object.setPrototypeOf(r, t), n = e.mapAllProperties(r), a.is(Object.keys(n).length > 2), 
          a.identical(n.a, 1), a.identical(n.b, 2), 
          /**/
          Object.defineProperty(t, "k", {
            enumerable: 0,
            value: 3
          }), n = e.mapAllProperties(r), a.is(Object.keys(n).length > 3), a.identical(n.a, 1), 
          a.identical(n.b, 2), a.identical(n.k, 3), r = {
            a: 1
          }, t = {
            b: 2
          }, Object.setPrototypeOf(r, t), Object.defineProperty(t, "k", {
            enumerable: 0,
            value: void 0
          }), n = e.mapAllProperties(r), a.is(Object.keys(n).length > 3), a.identical(n.a, 1), 
          a.identical(n.b, 2), a.identical(n.k, void 0), a.case = "no argument", a.shouldThrowError(function() {
            e.mapAllProperties();
          }), a.case = "primitive", a.shouldThrowError(function() {
            e.mapAllProperties(1);
          }), a.case = "wrong type of argument", a.shouldThrowError(function() {
            e.mapAllProperties("wrong argument");
          }), a.case = "unknown option", a.shouldThrowError(function() {
            e.mapAllProperties.call({
              x: 1
            }, {});
          });
        }
        //
        ,
        mapRoutines: function mapRoutines(a) {
          a.case = "empty";
          var n = e.mapRoutines({});
          a.identical(n, {}), n = e.mapRoutines([]), a.identical(n, {}), 
          //
          a.case = "trivial", n = e.mapRoutines({
            a: 1,
            b: function() {}
          }), a.is(1 === Object.keys(n).length), a.is(e.routineIs(n.b)), (r = []).a = function() {}, 
          n = e.mapRoutines(r), a.is(1 === Object.keys(n).length), a.is(e.routineIs(n.a)), 
          n = e.mapRoutines(new Date()), a.identical(n, {}), 
          //
          a.case = "prototype";
          var r = {
            a: 1
          }, t = {
            b: 2,
            c: function() {}
          };
          Object.setPrototypeOf(r, t), n = e.mapRoutines(r), a.is(1 === Object.keys(n).length), 
          a.is(e.routineIs(n.c)), 
          /**/
          Object.defineProperty(t, "k", {
            enumerable: 0,
            value: 3
          }), n = e.mapRoutines(r), a.is(1 === Object.keys(n).length), a.is(e.routineIs(n.c)), 
          /* enumerable : 0 */
          Object.defineProperty(t, "k", {
            enumerable: 0,
            value: 3
          }), n = e.mapRoutines.call({
            enumerable: 0
          }, r), a.is(Object.keys(n).length > 1), a.is(e.routineIs(n.c)), a.is(e.routineIs(n.__defineGetter__)), 
          a.is(e.routineIs(n.__defineSetter__)), 
          /**/
          r.y = function() {}, n = e.mapRoutines.call({
            own: 1
          }, r), a.is(1 === Object.keys(n).length), a.is(e.routineIs(n.y)), r = {
            a: 1,
            y: function() {}
          }, t = {
            b: 2,
            c: function() {}
          }, Object.setPrototypeOf(r, t), n = e.mapRoutines.call({
            own: 0
          }, r), a.is(2 === Object.keys(n).length), a.is(e.routineIs(n.y)), a.is(e.routineIs(n.c)), 
          r = {
            a: 1,
            y: function() {}
          }, t = {
            b: 2,
            c: function() {}
          }, Object.setPrototypeOf(r, t), Object.defineProperty(t, "k", {
            enumerable: 0,
            value: function() {}
          }), n = e.mapRoutines.call({
            own: 0,
            enumerable: 0
          }, r), a.is(Object.keys(n).length > 3), a.is(e.routineIs(n.y)), a.is(e.routineIs(n.c)), 
          a.is(e.routineIs(n.k)), a.is(e.routineIs(n.__defineGetter__)), a.is(e.routineIs(n.__defineSetter__)), 
          a.case = "no argument", a.shouldThrowError(function() {
            e.mapRoutines();
          }), a.case = "primitive", a.shouldThrowError(function() {
            e.mapRoutines(1);
          }), a.case = "wrong type of argument", a.shouldThrowError(function() {
            e.mapRoutines("wrong argument");
          }), a.case = "unknown option", a.shouldThrowError(function() {
            e.mapRoutines.call({
              x: 1
            }, {});
          });
        }
        //
        ,
        mapOwnRoutines: function mapOwnRoutines(a) {
          a.case = "empty";
          var n = e.mapOwnRoutines({});
          a.identical(n, {}), n = e.mapOwnRoutines([]), a.identical(n, {}), 
          //
          a.case = "trivial", n = e.mapOwnRoutines({
            a: 1,
            b: function() {}
          }), a.is(1 === Object.keys(n).length), a.is(e.routineIs(n.b)), (r = []).a = function() {}, 
          n = e.mapOwnRoutines(r), a.is(1 === Object.keys(n).length), a.is(e.routineIs(n.a)), 
          n = e.mapRoutines(new Date()), a.identical(n, {}), 
          //
          a.case = "prototype";
          var r = {
            a: 1
          }, t = {
            b: 2,
            c: function() {}
          };
          Object.setPrototypeOf(r, t), n = e.mapOwnRoutines(r), a.identical(n, {}), 
          /* enumerable : 0 */
          Object.defineProperty(t, "k", {
            enumerable: 0,
            value: 3
          }), n = e.mapOwnRoutines(r), a.identical(n, {}), r = {}, t = {}, Object.setPrototypeOf(r, t), 
          Object.defineProperty(t, "k", {
            enumerable: 0,
            value: function() {}
          }), n = e.mapOwnRoutines(r), a.identical(n, {}), 
          /* enumerable : 0 */
          Object.defineProperty(r, "k", {
            enumerable: 0,
            value: 3
          }), n = e.mapOwnRoutines.call({
            enumerable: 0
          }, r), a.identical(n, {}), r = {}, t = {}, Object.defineProperty(r, "k", {
            enumerable: 0,
            value: function() {}
          }), n = e.mapOwnRoutines.call({
            enumerable: 0
          }, r), a.identical(n.k, r.k), a.is(e.routineIs(n.k)), a.case = "no argument", a.shouldThrowError(function() {
            e.mapOwnRoutines();
          }), a.case = "primitive", a.shouldThrowError(function() {
            e.mapOwnRoutines(1);
          }), a.case = "wrong type of argument", a.shouldThrowError(function() {
            e.mapOwnRoutines("wrong argument");
          }), a.case = "unknown option", a.shouldThrowError(function() {
            e.mapOwnRoutines.call({
              x: 1
            }, {});
          });
        }
        //
        ,
        mapAllRoutines: function mapAllRoutines(a) {
          a.case = "empty";
          var n = e.mapAllRoutines({});
          a.is(Object.keys(n).length), a.is(e.routineIs(n.__defineGetter__)), a.is(e.routineIs(n.__defineSetter__)), 
          n = e.mapAllRoutines([]), a.is(Object.keys(n).length), a.is(e.routineIs(n.__defineGetter__)), 
          a.is(e.routineIs(n.__defineSetter__)), 
          //
          a.case = "trivial", n = e.mapAllRoutines({
            a: 1,
            b: function() {}
          }), a.is(Object.keys(n).length), a.is(e.routineIs(n.__defineGetter__)), a.is(e.routineIs(n.__defineSetter__)), 
          a.is(e.routineIs(n.b)), (r = []).a = function() {}, n = e.mapAllRoutines(r), a.is(Object.keys(n).length), 
          a.is(e.routineIs(n.__defineGetter__)), a.is(e.routineIs(n.__defineSetter__)), a.is(e.routineIs(n.a)), 
          n = e.mapAllRoutines(new Date()), a.is(Object.keys(n).length), a.identical(n.constructor.name, "Date"), 
          a.is(e.routineIs(n.getDate)), 
          //
          a.case = "prototype";
          var r = {
            a: 1
          }, t = {
            b: 2,
            c: function() {}
          };
          Object.setPrototypeOf(r, t), n = e.mapAllRoutines(r), a.is(Object.keys(n).length > 1), 
          a.is(e.routineIs(n.c)), 
          /**/
          Object.defineProperty(t, "k", {
            enumerable: 0,
            value: 3
          }), n = e.mapAllRoutines(r), a.is(Object.keys(n).length > 1), a.is(e.routineIs(n.c)), 
          /**/
          Object.defineProperty(r, "z", {
            enumerable: 0,
            value: function() {}
          }), Object.defineProperty(t, "y", {
            enumerable: 0,
            value: function() {}
          }), n = e.mapAllRoutines(r), a.is(Object.keys(n).length > 2), a.is(e.routineIs(n.c)), 
          a.is(e.routineIs(n.y)), a.is(e.routineIs(n.z)), a.case = "no argument", a.shouldThrowError(function() {
            e.mapAllRoutines();
          }), a.case = "primitive", a.shouldThrowError(function() {
            e.mapAllRoutines(1);
          }), a.case = "wrong type of argument", a.shouldThrowError(function() {
            e.mapAllRoutines("wrong argument");
          }), a.case = "unknown option", a.shouldThrowError(function() {
            e.mapAllRoutines.call({
              x: 1
            }, {});
          });
        }
        //
        ,
        mapFields: function mapFields(a) {
          a.case = "empty";
          var n = e.mapFields({});
          a.identical(n, {}), n = e.mapFields([]), a.identical(n, {}), 
          //
          a.case = "trivial", n = e.mapFields({
            a: 1,
            b: function() {}
          }), a.is(1 === Object.keys(n).length), a.is(1 === n.a), (r = []).a = function() {}, 
          r.b = 1, n = e.mapFields(r), a.is(1 === Object.keys(n).length), a.is(1 === n.b), 
          n = e.mapFields(new Date()), a.identical(n, {}), 
          //
          a.case = "prototype";
          var r = {
            a: 1
          }, t = {
            b: 2,
            c: function() {}
          };
          Object.setPrototypeOf(r, t), n = e.mapFields(r), a.is(2 === Object.keys(n).length), 
          a.identical(n.a, 1), a.identical(n.b, 2), 
          /**/
          Object.defineProperty(t, "k", {
            enumerable: 0,
            value: 3
          }), n = e.mapFields(r), a.is(2 === Object.keys(n).length), a.identical(n.a, 1), 
          a.identical(n.b, 2), 
          /* enumerable : 0 */
          Object.defineProperty(t, "k", {
            enumerable: 0,
            value: 3
          }), n = e.mapFields.call({
            enumerable: 0
          }, r), a.is(4 === Object.keys(n).length), a.identical(n.a, 1), a.identical(n.b, 2), 
          a.identical(n.k, 3), 
          /**/
          r.y = function() {}, n = e.mapFields.call({
            own: 1
          }, r), a.is(1 === Object.keys(n).length), a.identical(n.a, 1), r = {
            a: 1,
            y: function() {}
          }, t = {
            b: 2,
            c: function() {}
          }, Object.setPrototypeOf(r, t), n = e.mapFields.call({
            own: 0,
            enumerable: 1
          }, r), a.is(2 === Object.keys(n).length), a.identical(n.a, 1), a.identical(n.b, 2), 
          r = {
            a: 1,
            y: function() {}
          }, t = {
            b: 2,
            c: function() {}
          }, Object.setPrototypeOf(r, t), Object.defineProperty(t, "k", {
            enumerable: 0,
            value: function() {}
          }), Object.defineProperty(t, "z", {
            enumerable: 0,
            value: 3
          }), n = e.mapFields.call({
            enumerable: 0
          }, r), a.identical(Object.keys(n).length, 4), a.identical(n.a, 1), a.identical(n.b, 2), 
          a.identical(n.z, 3), a.case = "no argument", a.shouldThrowError(function() {
            e.mapFields();
          }), a.case = "primitive", a.shouldThrowError(function() {
            e.mapFields(1);
          }), a.case = "wrong type of argument", a.shouldThrowError(function() {
            e.mapFields("wrong argument");
          }), a.case = "unknown option", a.shouldThrowError(function() {
            e.mapFields.call({
              x: 1
            }, {});
          });
        }
        //
        ,
        mapOwnFields: function mapOwnFields(a) {
          a.case = "empty";
          var n = e.mapOwnFields({});
          a.identical(n, {}), n = e.mapOwnFields([]), a.identical(n, {}), 
          /* */
          a.case = "trivial", n = e.mapOwnFields({
            a: 1,
            b: function() {}
          }), a.is(1 === Object.keys(n).length), a.is(1 === n.a), (r = []).a = function() {}, 
          r.b = 1, n = e.mapOwnFields(r), a.is(1 === Object.keys(n).length), a.is(1 === n.b), 
          n = e.mapOwnFields(new Date()), a.identical(n, {}), 
          /* */
          a.case = "prototype";
          var r = {
            a: 1
          };
          Object.setPrototypeOf(r, {
            b: 2,
            c: function() {}
          }), n = e.mapOwnFields(r), a.is(1 === Object.keys(n).length), a.identical(n.a, 1), 
          /* */
          Object.defineProperty(r, "k", {
            enumerable: 0,
            value: 3
          }), n = e.mapOwnFields(r), a.is(1 === Object.keys(n).length), a.identical(n.a, 1), 
          /* enumerable : 0 */
          Object.defineProperty(r, "y", {
            enumerable: 0,
            value: 3
          }), n = e.mapOwnFields.call({
            enumerable: 0
          }, r), a.is(3 === Object.keys(n).length), a.identical(n.a, 1), a.identical(n.y, 3), 
          a.case = "no argument", a.shouldThrowError(function() {
            e.mapOwnFields();
          }), a.case = "primitive", a.shouldThrowError(function() {
            e.mapOwnFields("x");
          }), a.case = "primitive", a.shouldThrowError(function() {
            e.mapOwnFields(1);
          }), a.case = "wrong type of argument", a.shouldThrowError(function() {
            e.mapOwnFields("wrong argument");
          }), a.case = "unknown option", a.shouldThrowError(function() {
            e.mapOwnFields.call({
              x: 1
            }, {});
          });
        }
        //
        ,
        mapAllFields: function mapAllFields(a) {
          a.case = "empty";
          var n = e.mapAllFields({});
          a.is(1 === Object.keys(n).length), a.identical(n.__proto__, {}.__proto__), n = e.mapAllFields([]), 
          a.is(2 === Object.keys(n).length), a.identical(n.__proto__, [].__proto__), a.identical(n.length, 0), 
          //
          a.case = "trivial", n = e.mapAllFields({
            a: 1,
            b: function() {}
          }), a.is(2 === Object.keys(n).length), a.is(1 === n.a), a.is(n.__proto__ === {}.__proto__), 
          (t = []).a = function() {}, t.b = 1, n = e.mapAllFields(t), console.log(n), a.is(3 === Object.keys(n).length), 
          a.is(0 === n.length), a.is(1 === n.b), a.is(n.__proto__ === [].__proto__);
          var r = new Date();
          n = e.mapAllFields(r), a.identical(n.__proto__, r.__proto__), 
          //
          a.case = "prototype";
          var t = {
            a: 1
          }, i = {
            b: 2,
            c: function() {}
          };
          Object.setPrototypeOf(t, i), n = e.mapAllFields(t), a.is(3 === Object.keys(n).length), 
          a.identical(n.a, 1), a.identical(n.b, 2), a.identical(n.__proto__, i), 
          /**/
          Object.defineProperty(i, "k", {
            enumerable: 0,
            value: 3
          }), n = e.mapAllFields(t), a.is(4 === Object.keys(n).length), a.identical(n.a, 1), 
          a.identical(n.b, 2), a.identical(n.k, 3), a.identical(n.__proto__, i), a.case = "no argument", 
          a.shouldThrowError(function() {
            e.mapAllFields();
          }), a.case = "primitive", a.shouldThrowError(function() {
            e.mapAllFields(1);
          }), a.case = "wrong type of argument", a.shouldThrowError(function() {
            e.mapAllFields("wrong argument");
          }), a.case = "unknown option", a.shouldThrowError(function() {
            e.mapAllFields.call({
              x: 1
            }, {});
          });
        }
        //
        ,
        mapOnlyPrimitives: function mapOnlyPrimitives(a) {
          a.case = "emtpy";
          var n = e.mapOnlyPrimitives({});
          a.identical(n, {}), a.case = "primitives";
          var r = {
            a: null,
            b: void 0,
            c: 5,
            e: !1,
            f: "a",
            g: function() {},
            h: [ 1 ],
            i: new Date(),
            j: new ArrayBuffer(5)
          }, t = (n = e.mapOnlyPrimitives(r), {
            a: null,
            b: void 0,
            c: 5,
            e: !1,
            f: "a"
          });
          a.identical(n, t), 
          /* */
          a.case = "only enumerable";
          var i = {};
          Object.defineProperty(i, "k", {
            enumerable: 0,
            value: 3
          }), n = e.mapOnlyPrimitives(i), a.identical(n, {}), 
          /* */
          a.case = "from prototype", i = {};
          var s = {
            a: 1,
            c: function() {}
          };
          Object.defineProperty(s, "k", {
            enumerable: 0,
            value: 3
          }), Object.setPrototypeOf(i, s), n = e.mapOnlyPrimitives(i), a.identical(n, {
            a: 1
          }), a.case = "invalid arg type", a.shouldThrowError(function() {
            e.mapOnlyPrimitives(null);
          }), a.case = "no args", a.shouldThrowError(function() {
            e.mapOnlyPrimitives();
          });
        }
        //
        ,
        // map logic
        mapButConditional: function mapButConditional(a) {
          a.case = "an object";
          var n = e.mapButConditional(e.field.filter.dstNotHasSrcPrimitive, {
            a: 1,
            b: "ab",
            c: [ 1, 2, 3 ]
          }, {
            a: 1,
            b: "ab",
            d: [ 1, 2, 3 ]
          });
          a.identical(n, {}), a.case = "no argument", a.shouldThrowError(function() {
            e.mapButConditional();
          }), a.case = "few arguments", a.shouldThrowError(function() {
            e.mapButConditional(e.field.mapper.primitive);
          }), a.case = "second argument is wrong type of array", a.shouldThrowError(function() {
            e.mapButConditional(e.field.mapper.primitive, []);
          }), a.case = "wrong type of arguments", a.shouldThrowError(function() {
            e.mapButConditional("wrong arguments");
          });
        }
        //
        ,
        mapBut: function mapBut(a) {
          a.case = "empty src map";
          /* */
          var n = {}, r = {
            a: 13,
            b: 77,
            c: 3,
            d: "name"
          }, t = e.mapExtend(null, n), i = e.mapExtend(null, r), s = e.mapBut(n, r), o = {};
          a.identical(s, o), a.is(s !== n), a.identical(n, t), a.identical(r, i), a.case = "empty src array", 
          r = {
            a: 13,
            b: 77,
            c: 3,
            d: "name"
          }, t = (n = []).slice(), i = e.mapExtend(null, r), s = e.mapBut(n, r), o = {}, a.identical(s, o), 
          a.is(s !== n), a.identical(n, t), a.identical(r, i), a.case = "empty screen", n = {
            d: "name",
            c: 33,
            a: "abc"
          }, r = {}, t = e.mapExtend(null, n), i = e.mapExtend(null, r), s = e.mapBut(n, r), 
          o = {
            d: "name",
            c: 33,
            a: "abc"
          }, a.identical(s, o), a.is(s !== n), a.identical(n, t), a.identical(r, i), a.case = "trivial", 
          n = {
            d: "name",
            c: 33,
            a: "abc"
          }, r = {
            a: 13,
            b: 77,
            c: 3,
            d: "name"
          }, t = e.mapExtend(null, n), i = e.mapExtend(null, r), s = e.mapBut(n, r), o = {}, 
          a.identical(s, o), a.is(s !== n), a.identical(n, t), a.identical(r, i), n = {
            d: "name",
            c: 33,
            a: "abc",
            x: 13
          }, r = {
            b: 77,
            c: 3,
            d: "name"
          }, t = e.mapExtend(null, n), i = e.mapExtend(null, r), s = e.mapBut(n, r), o = {
            a: "abc",
            x: 13
          }, a.identical(s, o), a.is(s !== n), a.identical(n, t), a.identical(r, i), a.case = "several screens", 
          n = {
            d: "name",
            c: 33,
            a: "abc"
          }, r = [ {
            a: 13
          }, {
            b: 77
          }, {
            c: 3
          }, {
            d: "name"
          } ], t = e.mapExtend(null, n), i = r.slice(), s = e.mapBut(n, r), o = {}, a.identical(s, o), 
          a.is(s !== n), a.identical(n, t), a.identical(r, i), a.case = "several srcs", r = {
            a: 2,
            b: 2,
            d: 2
          }, t = (n = [ {
            a: 1
          }, {
            b: 1
          }, {
            c: 1
          } ]).slice(), i = e.mapExtend(null, r), s = e.mapBut(n, r), o = {
            c: 1
          }, a.identical(s, o), a.is(s !== n), a.identical(n, t), a.identical(r, i), a.case = "several srcs and screens", 
          r = [ {
            a: 2
          }, {
            b: 2
          }, {
            d: 2
          } ], t = (n = [ {
            a: 1
          }, {
            b: 1
          }, {
            c: 1
          } ]).slice(), i = r.slice(), s = e.mapBut(n, r), o = {
            c: 1
          }, a.identical(s, o), a.is(s !== n), a.identical(n, t), a.identical(r, i), a.case = "no arguments", 
          a.shouldThrowError(function() {
            e.mapBut();
          }), a.case = "wrong type of arguments", a.shouldThrowError(function() {
            e.mapBut("wrong arguments");
          }), a.case = "only src map", a.shouldThrowError(function() {
            e.mapBut(n);
          }), a.case = "first argument is not an object-like", a.shouldThrowError(function() {
            e.mapBut(3, []);
          }), a.case = "second argument is not an object-like", a.shouldThrowError(function() {
            e.mapBut([], "");
          }), a.case = "redundant arguments", a.shouldThrowError(function() {
            e.mapBut([], [], {});
          }), a.case = "wrong type of arguments", a.shouldThrowError(function() {
            e.mapBut({}, "wrong arguments");
          }), a.case = "wrong type of arguments", a.shouldThrowError(function() {
            e.mapBut("wrong arguments", {});
          });
        }
        //
        ,
        mapOwnBut: function mapOwnBut(a) {
          a.case = "an empty object";
          var n = e.mapOwnBut({}, {}), r = {};
          a.identical(n, r), a.case = "an object", n = e.mapOwnBut({
            a: 7,
            b: 13,
            c: 3
          }, {
            a: 7,
            b: 13
          }), r = {
            c: 3
          }, a.identical(n, r), a.case = "an object", n = e.mapOwnBut({
            a: 7,
            "toString": 5
          }, {
            b: 33,
            c: 77
          }), r = {
            a: 7
          }, a.identical(n, r), a.case = "no arguments", a.shouldThrowError(function() {
            e.mapOwnBut();
          }), a.case = "not enough arguments", a.shouldThrowError(function() {
            e.mapOwnBut({});
          }), a.case = "not enough arguments", a.shouldThrowError(function() {
            e.mapOwnBut([]);
          }), a.case = "wrong type of arguments", a.shouldThrowError(function() {
            e.mapOwnBut("wrong arguments");
          });
        }
        //
        ,
        mapOnly: function mapOnly(a) {
          a.case = "empty src map";
          /* */
          var n = {}, r = {
            a: 13,
            b: 77,
            c: 3,
            d: "name"
          }, t = e.mapExtend(null, n), i = e.mapExtend(null, r), s = e.mapOnly(n, r), o = {};
          a.identical(s, o), a.is(s !== n), a.identical(n, t), a.identical(r, i), a.case = "empty src array", 
          r = {
            a: 13,
            b: 77,
            c: 3,
            d: "name"
          }, t = (n = []).slice(), i = e.mapExtend(null, r), s = e.mapOnly(n, r), o = {}, 
          a.identical(s, o), a.is(s !== n), a.identical(n, t), a.identical(r, i), a.case = "empty screen", 
          n = {
            d: "name",
            c: 33,
            a: "abc"
          }, r = {}, t = e.mapExtend(null, n), i = e.mapExtend(null, r), s = e.mapOnly(n, r), 
          o = {}, a.identical(s, o), a.is(s !== n), a.identical(n, t), a.identical(r, i), 
          a.case = "only srcMap", n = {
            d: "name",
            c: 33,
            a: "abc"
          }, t = e.mapExtend(null, n), s = e.mapOnly(n), o = {
            d: "name",
            c: 33,
            a: "abc"
          }, a.identical(s, o), a.is(s !== n), a.case = "trivial", n = {
            d: "name",
            c: 33,
            a: "abc"
          }, r = {
            a: 13,
            b: 77,
            c: 3,
            d: "name"
          }, t = e.mapExtend(null, n), i = e.mapExtend(null, r), s = e.mapOnly(n, r), o = {
            a: "abc",
            c: 33,
            d: "name"
          }, a.identical(s, o), a.is(s !== n), a.identical(n, t), a.identical(r, i), a.case = "several screens", 
          n = {
            d: "name",
            c: 33,
            a: "abc"
          }, r = [ {
            a: 13
          }, {
            b: 77
          }, {
            c: 3
          }, {
            d: "name"
          } ], t = e.mapExtend(null, n), i = r.slice(), s = e.mapOnly(n, r), o = {
            a: "abc",
            c: 33,
            d: "name"
          }, a.identical(s, o), a.is(s !== n), a.identical(n, t), a.identical(r, i), a.case = "several srcs", 
          r = {
            a: 2,
            b: 2,
            d: 2
          }, t = (n = [ {
            a: 1
          }, {
            b: 1
          }, {
            c: 1
          } ]).slice(), i = e.mapExtend(null, r), s = e.mapOnly(n, r), o = {
            a: 1,
            b: 1
          }, a.identical(s, o), a.is(s !== n), a.identical(n, t), a.identical(r, i), a.case = "several srcs and screens", 
          r = [ {
            a: 2
          }, {
            b: 2
          }, {
            d: 2
          } ], t = (n = [ {
            a: 1
          }, {
            b: 1
          }, {
            c: 1
          } ]).slice(), i = r.slice(), s = e.mapOnly(n, r), o = {
            a: 1,
            b: 1
          }, a.identical(s, o), a.is(s !== n), a.identical(n, t), a.identical(r, i), a.case = "no arguments", 
          a.shouldThrowError(function() {
            e.mapOnly();
          }), a.case = "wrong type of arguments", a.shouldThrowError(function() {
            e.mapOnly("wrong arguments");
          }), a.case = "first argument is not an object-like", a.shouldThrowError(function() {
            e.mapOnly(3, []);
          }), a.case = "second argument is not an object-like", a.shouldThrowError(function() {
            e.mapOnly([], "");
          }), a.case = "redundant arguments", a.shouldThrowError(function() {
            e.mapOnly([], [], {});
          }), a.case = "wrong type of arguments", a.shouldThrowError(function() {
            e.mapOnly({}, "wrong arguments");
          }), a.case = "wrong type of arguments", a.shouldThrowError(function() {
            e.mapOnly("wrong arguments", {});
          });
        }
        //
        ,
        _mapOnly: function _mapOnly(a) {
          a.case = "an object";
          var n = {
            screenMaps: {
              "a": 13,
              "b": 77,
              "c": 3,
              "name": "Mikle"
            },
            srcMaps: {
              "a": 33,
              "d": "name",
              "name": "Mikle",
              "c": 33
            }
          }, r = e._mapOnly(n), t = {
            a: 33,
            c: 33,
            name: "Mikle"
          };
          a.identical(r, t), a.case = "an object2", n = {
            screenMaps: {
              a: 13,
              b: 77,
              c: 3,
              d: "name"
            },
            srcMaps: {
              d: "name",
              c: 33,
              a: "abc"
            }
          }, r = e._mapOnly(n), t = {
            a: "abc",
            c: 33,
            d: "name"
          }, a.identical(r, t), a.case = "no arguments", a.shouldThrowError(function() {
            e._mapOnly();
          }), a.case = "redundant arguments", a.shouldThrowError(function() {
            e._mapOnly({}, "wrong arguments");
          }), a.case = "wrong type of array", a.shouldThrowError(function() {
            e._mapOnly([]);
          }), a.case = "wrong type of arguments", a.shouldThrowError(function() {
            e._mapOnly("wrong arguments");
          });
        }
        //
        ,
        mapsAreIdentical: function mapsAreIdentical(a) {
          a.case = "same values";
          var n = e.mapsAreIdentical({
            a: 7,
            b: 13
          }, {
            a: 7,
            b: 13
          }), r = !0;
          a.identical(n, r), a.case = "not the same values in", n = e.mapsAreIdentical({
            "a": 7,
            "b": 13
          }, {
            "a": 7,
            "b": 14
          }), r = !1, a.identical(n, r), a.case = "different number of keys, more in the first argument", 
          n = e.mapsAreIdentical({
            "a": 7,
            "b": 13,
            "с": 15
          }, {
            "a": 7,
            "b": 13
          }), r = !1, a.identical(n, r), a.case = "different number of keys, more in the second argument", 
          n = e.mapsAreIdentical({
            "a": 7,
            "b": 13
          }, {
            "a": 7,
            "b": 13,
            "с": 15
          }), r = !1, a.identical(n, r), 
          /* special cases */
          a.case = "empty maps, standrard", n = e.mapsAreIdentical({}, {}), r = !0, a.identical(n, r), 
          a.case = "empty maps, pure", n = e.mapsAreIdentical(Object.create(null), Object.create(null)), 
          r = !0, a.identical(n, r), a.case = "empty maps, one standard another pure", n = e.mapsAreIdentical({}, Object.create(null)), 
          r = !0, a.identical(n, r), a.case = "no arguments", a.shouldThrowError(function() {
            e.mapsAreIdentical();
          }), a.case = "not object-like arguments", a.shouldThrowError(function() {
            e.mapsAreIdentical([ "a", 7, "b", 13 ], [ "a", 7, "b", 14 ]);
          }), a.shouldThrowError(function() {
            e.mapsAreIdentical("a", "b");
          }), a.shouldThrowError(function() {
            e.mapsAreIdentical(1, 3);
          }), a.shouldThrowError(function() {
            e.mapsAreIdentical(null, null);
          }), a.shouldThrowError(function() {
            e.mapsAreIdentical(void 0, void 0);
          }), a.case = "too few arguments", a.shouldThrowError(function() {
            e.mapsAreIdentical({});
          }), a.case = "too many arguments", a.shouldThrowError(function() {
            e.mapsAreIdentical({}, {}, "redundant argument");
          });
        }
        //
        ,
        mapContain: function mapContain(a) {
          a.case = "first has same keys like second";
          var n = e.mapContain({
            a: 7,
            b: 13,
            c: 15
          }, {
            a: 7,
            b: 13
          }), r = !0;
          a.identical(n, r), a.case = "in the array", n = e.mapContain([ "a", 7, "b", 13, "c", 15 ], [ "a", 7, "b", 13 ]), 
          r = !0, a.identical(n, r), a.case = "number of keys in first not equal", n = e.mapContain({
            a: 1
          }, {
            a: 1,
            b: 2
          }), r = !1, a.identical(n, r), a.case = "no arguments", a.shouldThrowError(function() {
            e.mapContain();
          }), a.case = "few arguments", a.shouldThrowError(function() {
            e.mapContain({});
          }), a.case = "too many arguments", a.shouldThrowError(function() {
            e.mapContain({}, {}, "redundant argument");
          });
        }
        //
        ,
        mapOwnKey: function mapOwnKey(a) {
          a.case = "second argument is string";
          var n = e.mapOwnKey({
            a: 7,
            b: 13
          }, "a"), r = !0;
          a.identical(n, r), a.case = "second argument is object", n = e.mapOwnKey({
            a: 7,
            b: 13
          }, Object.create(null).a = "a"), r = !0, a.identical(n, r), a.case = "second argument is symbol";
          var t = Symbol("b"), i = {
            a: 7,
            [t]: 13
          };
          n = e.mapOwnKey(i, t), r = !0, a.identical(n, r), a.case = "false", n = e.mapOwnKey(Object.create({
            a: 7,
            b: 13
          }), "a"), r = !1, a.identical(n, r), a.case = "no argument", a.shouldThrowError(function() {
            e.mapOwnKey();
          }), a.case = "few arguments", a.shouldThrowError(function() {
            e.mapOwnKey({}, "a", "b");
          }), a.case = "wrong type of key", a.shouldThrowError(function() {
            e.mapOwnKey([], 1);
          }), a.case = "wrong type of argument", a.shouldThrowError(function() {
            e.mapOwnKey(1);
          }), a.case = "wrong type of second argument", a.shouldThrowError(function() {
            e.mapOwnKey({}, 13);
          }), a.case = "wrong type of arguments", a.shouldThrowError(function() {
            e.mapOwnKey("", 7);
          });
        }
        //
        ,
        mapHasAll: function mapHasAll(a) {
          a.case = "empty";
          var n = e.mapHasAll({}, {});
          a.is(n), a.case = "screen empty", n = e.mapHasAll({
            a: 1
          }, {}), a.is(n), a.case = "same keys", n = e.mapHasAll({
            a: 1
          }, {
            a: 2
          }), a.is(n), a.case = "has only one", n = e.mapHasAll({
            a: 1,
            b: 2,
            c: 3
          }, {
            b: 2
          }), a.is(n), a.case = "has all", n = e.mapHasAll({
            a: 1,
            b: 2,
            c: 3
          }, {
            b: 2,
            a: 3,
            c: 4
          }), a.is(n), a.case = "one is mising", n = e.mapHasAll({
            a: 1,
            b: 2
          }, {
            b: 2,
            a: 3,
            c: 1
          }), a.is(!n), a.case = "src has enumerable";
          var r = {};
          Object.defineProperty(r, "a", {
            enumerable: 0
          }), n = e.mapHasAll(r, {
            a: 1
          }), a.is(n), n = e.mapHasAll(r, r), a.is(n), a.case = "screen has enumerable";
          /* for..in skips enumerable */
          var t = {};
          Object.defineProperty(t, "a", {
            enumerable: 0,
            value: 3
          }), n = e.mapHasAll({
            a: 1
          }, t), a.is(n), a.case = "screen has undefined", r = {}, Object.defineProperty(r, "a", {
            enumerable: 0
          }), n = e.mapHasAll(r, {
            a: void 0
          }), a.is(n), n = e.mapHasAll({
            a: void 0
          }, {
            a: void 0
          }), a.is(n), a.case = "src has toString on proto", n = e.mapHasAll({}, {
            toString: 1
          }), a.is(n), a.case = "map has on proto", r = {}, Object.setPrototypeOf(r, {
            a: 1
          }), n = e.mapHasAll(r, {
            a: 1
          }), a.is(n), 
          //
          Config.degub && (a.case = "src is no object like", a.shouldThrowError(function() {
            e.mapHasAll(1, {});
          }), a.case = "screen is no object like", a.shouldThrowError(function() {
            e.mapHasAll({}, 1);
          }), a.case = "too much args", a.shouldThrowError(function() {
            e.mapHasAll({}, {}, {});
          }));
        }
        //
        ,
        mapHasAny: function mapHasAny(a) {
          a.case = "empty";
          var n = e.mapHasAny({}, {});
          a.is(!n), a.case = "screen empty", n = e.mapHasAny({
            a: 1
          }, {}), a.is(!n), a.case = "same keys", n = e.mapHasAny({
            a: 1
          }, {
            a: 2
          }), a.is(n), a.case = "has only one", n = e.mapHasAny({
            a: 1,
            b: 2,
            c: 3
          }, {
            b: 2,
            x: 1
          }), a.is(n), a.case = "has all", n = e.mapHasAny({
            a: 1,
            b: 2,
            c: 3
          }, {
            b: 2,
            a: 3,
            c: 4
          }), a.is(n), a.case = "one is mising", n = e.mapHasAny({
            a: 1,
            b: 2
          }, {
            b: 2,
            a: 3,
            c: 1
          }), a.is(n), a.case = "has no one", n = e.mapHasAny({
            a: 1,
            b: 2
          }, {
            x: 1,
            y: 1
          }), a.is(!n), a.case = "src has enumerable";
          var r = {};
          Object.defineProperty(r, "a", {
            enumerable: 0
          }), n = e.mapHasAny(r, {
            a: 1
          }), a.is(n), n = e.mapHasAny(r, r), a.is(!n), a.case = "screen has enumerable";
          /* for..in skips enumerable */
          var t = {};
          Object.defineProperty(t, "a", {
            enumerable: 0,
            value: 3
          }), n = e.mapHasAny({
            a: 1
          }, t), a.is(!n), a.case = "screen has undefined", r = {}, Object.defineProperty(r, "a", {
            enumerable: 0
          }), n = e.mapHasAny(r, {
            a: void 0
          }), a.is(n), n = e.mapHasAny({
            a: void 0
          }, {
            a: void 0
          }), a.is(n), a.case = "src has toString on proto", n = e.mapHasAny({}, {
            x: 1,
            toString: 1
          }), a.is(n), a.case = "map has on proto", r = {}, Object.setPrototypeOf(r, {
            a: 1
          }), n = e.mapHasAny(r, {
            a: 1,
            x: 1
          }), a.is(n), 
          //
          Config.degub && (a.case = "src is no object like", a.shouldThrowError(function() {
            e.mapHasAny(1, {});
          }), a.case = "screen is no object like", a.shouldThrowError(function() {
            e.mapHasAny({}, 1);
          }), a.case = "too much args", a.shouldThrowError(function() {
            e.mapHasAny({}, {}, {});
          }));
        }
        //
        ,
        mapHasNone: function mapHasNone(a) {
          a.case = "empty";
          var n = e.mapHasNone({}, {});
          a.is(n), a.case = "screen empty", n = e.mapHasNone({
            a: 1
          }, {}), a.is(n), a.case = "same keys", n = e.mapHasNone({
            a: 1
          }, {
            a: 2
          }), a.is(!n), a.case = "has only one", n = e.mapHasNone({
            a: 1,
            b: 2,
            c: 3
          }, {
            b: 2,
            x: 1
          }), a.is(!n), a.case = "has all", n = e.mapHasNone({
            a: 1,
            b: 2,
            c: 3
          }, {
            b: 2,
            a: 3,
            c: 4
          }), a.is(!n), a.case = "one is mising", n = e.mapHasNone({
            a: 1,
            b: 2
          }, {
            b: 2,
            a: 3,
            c: 1
          }), a.is(!n), a.case = "has no one", n = e.mapHasNone({
            a: 1,
            b: 2
          }, {
            x: 1,
            y: 1
          }), a.is(n), a.case = "src has non enumerable";
          var r = {};
          Object.defineProperty(r, "a", {
            enumerable: 0
          });
          debugger;
          n = e.mapHasNone(r, {
            a: 1
          });
          debugger;
          a.is(!n), n = e.mapHasNone(r, r), a.is(n), a.case = "screen has enumerable";
          /* for..in skips enumerable */
          var t = {};
          Object.defineProperty(t, "a", {
            enumerable: 0,
            value: 3
          }), n = e.mapHasNone({
            a: 1
          }, t), a.is(n), a.case = "screen has undefined", r = {}, Object.defineProperty(r, "a", {
            enumerable: 0
          }), n = e.mapHasNone(r, {
            a: void 0
          }), a.is(!n), n = e.mapHasNone({
            a: void 0
          }, {
            a: void 0
          }), a.is(!n), a.case = "src has toString on proto", n = e.mapHasNone({}, {
            x: 1,
            toString: 1
          }), a.is(!n), a.case = "map has on proto", r = {}, Object.setPrototypeOf(r, {
            a: 1
          }), n = e.mapHasNone(r, {
            x: 1
          }), a.is(n), n = e.mapHasNone(r, {
            a: 1
          }), a.is(!n), 
          //
          Config.degub && (a.case = "src is no object like", a.shouldThrowError(function() {
            e.mapHasNone(1, {});
          }), a.case = "screen is no object like", a.shouldThrowError(function() {
            e.mapHasNone({}, 1);
          }), a.case = "too much args", a.shouldThrowError(function() {
            e.mapHasNone({}, {}, {});
          }));
        }
        //
        ,
        mapOwnAll: function mapOwnAll(a) {
          a.case = "empty";
          var n = e.mapOwnAll({}, {});
          a.is(n), a.case = "screen empty", n = e.mapOwnAll({
            a: 1
          }, {}), a.is(n), a.case = "same keys", n = e.mapOwnAll({
            a: 1
          }, {
            a: 2
          }), a.is(n), a.case = "has only one", n = e.mapOwnAll({
            a: 1,
            b: 2,
            c: 3
          }, {
            b: 2,
            x: 1
          }), a.is(!n), a.case = "has all", n = e.mapOwnAll({
            a: 1,
            b: 2,
            c: 3
          }, {
            b: 2,
            a: 3,
            c: 4
          }), a.is(n), a.case = "one is mising", n = e.mapOwnAll({
            a: 1,
            b: 2
          }, {
            b: 2,
            a: 3,
            c: 1
          }), a.is(!n), a.case = "has no one", n = e.mapOwnAll({
            a: 1,
            b: 2
          }, {
            x: 1,
            y: 1
          }), a.is(!n), a.case = "src has enumerable";
          var r = {};
          Object.defineProperty(r, "a", {
            enumerable: 0
          }), n = e.mapOwnAll(r, {
            a: 1
          }), a.is(n), n = e.mapOwnAll(r, r), a.is(n), a.case = "screen has enumerable";
          /* for..in skips enumerable */
          var t = {};
          Object.defineProperty(t, "a", {
            enumerable: 0,
            value: 3
          }), n = e.mapOwnAll({
            a: 1
          }, t), a.is(n), a.case = "screen has undefined", r = {}, Object.defineProperty(r, "a", {
            enumerable: 0
          }), n = e.mapOwnAll(r, {
            a: void 0
          }), a.is(n), n = e.mapOwnAll({
            a: void 0
          }, {
            a: void 0
          }), a.is(n), a.case = "src has toString on proto", n = e.mapOwnAll({}, {
            x: 1,
            toString: 1
          }), a.is(!n), 
          //
          Config.degub && (a.case = "src is no object like", a.shouldThrowError(function() {
            e.mapOwnAll(1, {});
          }), a.case = "screen is no object like", a.shouldThrowError(function() {
            e.mapOwnAll({}, 1);
          }), a.case = "too much args", a.shouldThrowError(function() {
            e.mapOwnAll({}, {}, {});
          }), a.case = "src is not a map", a.shouldThrowError(function() {
            var a = {};
            Object.setPrototypeOf(a, {
              a: 1
            }), e.mapOwnAll(a, {
              a: 1
            });
          }), a.case = "screen is not a map", a.shouldThrowError(function() {
            var a = {};
            Object.setPrototypeOf(a, {
              a: 1
            }), e.mapOwnAll({
              a: 1
            }, a);
          }));
        }
        //
        ,
        mapOwnAny: function mapOwnAny(a) {
          a.case = "empty";
          var n = e.mapOwnAny({}, {});
          a.is(!n), a.case = "screen empty", n = e.mapOwnAny({
            a: 1
          }, {}), a.is(!n), a.case = "same keys", n = e.mapOwnAny({
            a: 1
          }, {
            a: 2
          }), a.is(n), a.case = "has only one", n = e.mapOwnAny({
            a: 1,
            b: 2,
            c: 3
          }, {
            b: 2,
            x: 1
          }), a.is(n), a.case = "has all", n = e.mapOwnAny({
            a: 1,
            b: 2,
            c: 3
          }, {
            b: 2,
            a: 3,
            c: 4
          }), a.is(n), a.case = "one is mising", n = e.mapOwnAny({
            a: 1,
            b: 2
          }, {
            b: 2,
            a: 3,
            c: 1
          }), a.is(n), a.case = "has no one", n = e.mapOwnAny({
            a: 1,
            b: 2
          }, {
            x: 1,
            y: 1
          }), a.is(!n), a.case = "src has enumerable";
          var r = {};
          Object.defineProperty(r, "a", {
            enumerable: 0
          }), n = e.mapOwnAny(r, {
            a: 1
          }), a.is(n), n = e.mapOwnAny(r, r), a.is(!n), a.case = "screen has enumerable";
          /* for..in skips enumerable */
          var t = {};
          Object.defineProperty(t, "a", {
            enumerable: 0,
            value: 3
          }), n = e.mapOwnAny({
            a: 1
          }, t), a.is(!n), a.case = "screen has undefined", r = {}, Object.defineProperty(r, "a", {
            enumerable: 0
          }), n = e.mapOwnAny(r, {
            a: void 0
          }), a.is(n), n = e.mapOwnAny({
            a: void 0
          }, {
            a: void 0
          }), a.is(n), a.case = "src has toString on proto", n = e.mapOwnAny({}, {
            x: 1,
            toString: 1
          }), a.is(!n), 
          //
          Config.degub && (a.case = "src is no object like", a.shouldThrowError(function() {
            e.mapOwnAny(1, {});
          }), a.case = "screen is no object like", a.shouldThrowError(function() {
            e.mapOwnAny({}, 1);
          }), a.case = "too much args", a.shouldThrowError(function() {
            e.mapOwnAny({}, {}, {});
          }), a.case = "src is not a map", a.shouldThrowError(function() {
            var a = {};
            Object.setPrototypeOf(a, {
              a: 1
            }), e.mapOwnAny(a, {
              a: 1
            });
          }), a.case = "screen is not a map", a.shouldThrowError(function() {
            var a = {};
            Object.setPrototypeOf(a, {
              a: 1
            }), e.mapOwnAny({
              a: 1
            }, a);
          }));
        }
        //
        ,
        mapOwnNone: function mapOwnNone(a) {
          a.case = "empty";
          var n = e.mapOwnNone({}, {});
          a.is(n), a.case = "screen empty", n = e.mapOwnNone({
            a: 1
          }, {}), a.is(n), a.case = "same keys", n = e.mapOwnNone({
            a: 1
          }, {
            a: 2
          }), a.is(!n), a.case = "has only one", n = e.mapOwnNone({
            a: 1,
            b: 2,
            c: 3
          }, {
            b: 2,
            x: 1
          }), a.is(!n), a.case = "has all", n = e.mapOwnNone({
            a: 1,
            b: 2,
            c: 3
          }, {
            b: 2,
            a: 3,
            c: 4
          }), a.is(!n), a.case = "one is mising", n = e.mapOwnNone({
            a: 1,
            b: 2
          }, {
            b: 2,
            a: 3,
            c: 1
          }), a.is(!n), a.case = "has no one", n = e.mapOwnNone({
            a: 1,
            b: 2
          }, {
            x: 1,
            y: 1
          }), a.is(n), a.case = "src has enumerable";
          var r = {};
          Object.defineProperty(r, "a", {
            enumerable: 0
          }), n = e.mapOwnNone(r, {
            a: 1
          }), a.is(!n), n = e.mapOwnNone(r, r), a.is(n), a.case = "screen has enumerable";
          /* for..in skips enumerable */
          var t = {};
          Object.defineProperty(t, "a", {
            enumerable: 0,
            value: 3
          }), n = e.mapOwnNone({
            a: 1
          }, t), a.is(n), a.case = "screen has undefined", r = {}, Object.defineProperty(r, "a", {
            enumerable: 0
          }), n = e.mapOwnNone(r, {
            a: void 0
          }), a.is(!n), n = e.mapOwnNone({
            a: void 0
          }, {
            a: void 0
          }), a.is(!n), a.case = "src has toString on proto", n = e.mapOwnNone({}, {
            x: 1,
            toString: 1
          }), a.is(n), 
          //
          Config.degub && (a.case = "src is no object like", a.shouldThrowError(function() {
            e.mapOwnNone(1, {});
          }), a.case = "screen is no object like", a.shouldThrowError(function() {
            e.mapOwnNone({}, 1);
          }), a.case = "too much args", a.shouldThrowError(function() {
            e.mapOwnNone({}, {}, {});
          }), a.case = "src is not a map", a.shouldThrowError(function() {
            var a = {};
            Object.setPrototypeOf(a, {
              a: 1
            }), e.mapOwnNone(a, {
              a: 1
            });
          }), a.case = "screen is not a map", a.shouldThrowError(function() {
            var a = {};
            Object.setPrototypeOf(a, {
              a: 1
            }), e.mapOwnNone({
              a: 1
            }, a);
          }));
        }
        // --
        //
        // --
            }
    };
    a = wTestSuite(a), "undefined" == typeof module || module.parent || wTester.test(a.name);
  }();
  // == end of file MapTestS
}();