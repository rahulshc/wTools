!function TypingTestS() {
  // == begin of file TypingTestS
  !function _Typing_test_s_() {
    "use strict";
    "undefined" != typeof module && require("../Layer2.s").include("wTesting"), _global_;
    var e = _global_.wTools, i = {
      name: "Tools/base/l1/Typing",
      silencing: 1,
      tests: {
        objectLike: 
        //
        function objectLike(i) {
          debugger;
          i.description = "array-like entities should not overlap with array-like entities set", 
          i.identical(e.objectLike(new ArrayBuffer(10)), !1), i.identical(e.objectLike(new Float32Array(10)), !1), 
          i.identical(e.objectLike(new Int32Array(10)), !1), i.identical(e.objectLike(new DataView(new ArrayBuffer(10))), !1), 
          i.identical(e.objectLike(new Array(10)), !1), i.identical(e.objectLike([ 1, 2, 3 ]), !1), 
          i.identical(e.objectLike(new Map()), !1), i.description = "this entities are object-like", 
          i.identical(e.objectLike(_global_), !0), i.identical(e.objectLike(new Object()), !0), 
          i.identical(e.objectLike({}), !0), i.identical(e.objectLike(Object.create(null)), !0);
          debugger;
        }
        //
        ,
        promiseIs: function promiseIs(i) {
          i.case = "check if entity is a Promise", i.is(!e.promiseIs()), i.is(!e.promiseIs({})), 
          i.is(!e.promiseIs(new function Promise() {}())), i.is(e.promiseIs(Promise.resolve(0)));
          var n = new Promise((e, i) => {
            e(0);
          });
          i.is(e.promiseIs(n));
        }
        //
        ,
        consequenceLike: function consequenceLike(i) {
          if (i.case = "check if entity is a consequenceLike", !e.consequenceLike) return i.identical(!0, !0);
          i.is(!e.consequenceLike()), i.is(!e.consequenceLike({})), i.is(e.consequenceLike(Promise.resolve(0)));
          var n = new Promise((e, i) => {
            e(0);
          });
          i.is(e.consequenceLike(n));
        }
        //
            }
    };
    //
    i = wTestSuite(i), "undefined" == typeof module || module.parent || wTester.test(i.name);
  }();
  // == end of file TypingTestS
}();