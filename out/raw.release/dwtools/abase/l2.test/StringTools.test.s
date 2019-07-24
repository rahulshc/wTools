!function StringToolsTestS() {
  // == begin of file StringToolsTestS
  !function _StringTools_test_s_() {
    "use strict";
    "undefined" != typeof module && require("../Layer2.s").include("wTesting"), _global_;
    var e = _global_.wTools, t = {
      name: "Tools/base/l2/String",
      silencing: 1,
      enabled: 1,
      tests: {
        strRemoveBegin: 
        // --
        //
        // --
        function strRemoveBegin(t) {
          /* - */
          t.case = "returns string with removed occurrence from start";
          var i = e.strRemoveBegin("example", "exa"), n = "mple";
          t.identical(i, n), t.case = "returns original if no occurrence found", i = e.strRemoveBegin("mple", "exa"), 
          n = "mple", t.identical(i, n), t.case = "returns original if occurence is not at the beginning", 
          i = e.strRemoveBegin("example", "ple"), n = "example", t.identical(i, n), 
          /* - */
          t.case = "other", 
          /**/
          i = e.strRemoveBegin("", ""), n = "", t.identical(i, n), 
          /**/
          i = e.strRemoveBegin("", "x"), n = "", t.identical(i, n), 
          /**/
          i = e.strRemoveBegin("abc", "a"), n = "bc", t.identical(i, n), 
          /**/
          i = e.strRemoveBegin("abc", "ab"), n = "c", t.identical(i, n), 
          /**/
          i = e.strRemoveBegin("abc", "x"), n = "abc", t.identical(i, n), 
          /**/
          i = e.strRemoveBegin("abc", "abc"), n = "", t.identical(i, n), 
          /**/
          i = e.strRemoveBegin("abc", ""), n = "abc", t.identical(i, n), 
          /**/
          i = e.strRemoveBegin("abc", [ "a", "b", "c" ]), n = "bc", t.identical(i, n), 
          /**/
          i = e.strRemoveBegin("abc", [ "b", "c", "a" ]), n = "bc", t.identical(i, n), 
          /**/
          i = e.strRemoveBegin("aabbcc", [ "a", "b", "c" ]), n = "abbcc", t.identical(i, n), 
          /**/
          i = e.strRemoveBegin("abcabc", [ "a", "b", "c" ]), n = "bcabc", t.identical(i, n), 
          /**/
          i = e.strRemoveBegin("abc", [ "", "a" ]), n = "abc", t.identical(i, n), 
          /**/
          i = e.strRemoveBegin("abc", [ "abc", "a" ]), n = "", t.identical(i, n), 
          /**/
          i = e.strRemoveBegin([ "abc", "bca", "cab" ], [ "a", "d" ]), n = [ "bc", "bca", "cab" ], 
          t.identical(i, n), 
          /**/
          i = e.strRemoveBegin([ "abc", "bca", "cab" ], [ "a", "b", "c" ]), n = [ "bc", "ca", "ab" ], 
          t.identical(i, n), 
          /**/
          i = e.strRemoveBegin([ "abcabc", "bcabca", "cabcab" ], [ "a", "b", "c" ]), n = [ "bcabc", "cabca", "abcab" ], 
          t.identical(i, n), 
          /**/
          i = e.strRemoveBegin([ "abcabc", "bcabca", "cabcab" ], [ "b", "c", "a" ]), n = [ "bcabc", "cabca", "abcab" ], 
          t.identical(i, n), 
          /**/
          i = e.strRemoveBegin([ "a", "b", "c" ], [ "x" ]), n = [ "a", "b", "c" ], t.identical(i, n), 
          /**/
          i = e.strRemoveBegin([ "a", "b", "c" ], [ "a", "b", "c" ]), n = [ "", "", "" ], 
          t.identical(i, n), 
          /**/
          i = e.strRemoveBegin([ "a", "b", "c" ], []), n = [ "a", "b", "c" ], t.identical(i, n), 
          /* - */
          t.case = "RegExp", 
          /**/
          i = e.strRemoveBegin("example", /ex/), n = "ample", t.identical(i, n), 
          /**/
          i = e.strRemoveBegin([ "example", "examplex" ], /ex\z/), n = [ "example", "examplex" ], 
          t.identical(i, n), 
          /**/
          i = e.strRemoveBegin([ "example", "1example", "example2", "exam3ple" ], /\d/), n = [ "example", "example", "example2", "exam3ple" ], 
          t.identical(i, n), 
          /**/
          i = e.strRemoveBegin("example", [ /am/ ]), n = "example", t.identical(i, n), 
          /**/
          i = e.strRemoveBegin("example", [ /ex/, /\w/ ]), n = "ample", t.identical(i, n), 
          /**/
          i = e.strRemoveBegin("example", [ /\w/, /ex/ ]), n = "xample", t.identical(i, n), 
          /**/
          i = e.strRemoveBegin("example", /[axe]/), n = "xample", t.identical(i, n), 
          /**/
          i = e.strRemoveBegin("example", /\w{4}/), n = "ple", t.identical(i, n), t.shouldThrowError(() => e.strRemoveBegin(1, "")), 
          t.shouldThrowError(() => e.strRemoveBegin("a", 1)), t.shouldThrowError(() => e.strRemoveBegin()), 
          t.shouldThrowError(() => e.strRemoveBegin(void 0, void 0)), t.shouldThrowError(() => e.strRemoveBegin(null, null)), 
          t.case = "invalid arguments count", t.shouldThrowError(function() {
            e.strRemoveBegin("abcd", "a", "a");
          }), t.case = "no arguments", t.shouldThrowError(function() {
            e.strRemoveBegin();
          }), t.case = "first argument is wrong", t.shouldThrowError(function() {
            e.strRemoveBegin(1, "2");
          }), t.case = "second argument is wrong", t.shouldThrowError(function() {
            e.strRemoveBegin("1", 2);
          }), t.case = "second argument is array with wrong element", t.shouldThrowError(function() {
            e.strRemoveBegin("1", [ " a", 2 ]);
          });
        }
        //
        ,
        strRemoveEnd: function strRemoveEnd(t) {
          t.case = "returns string with removed occurrence from end";
          var i = e.strRemoveEnd("example", "mple"), n = "exa";
          t.identical(i, n), t.case = "returns original if no occurrence found ", i = e.strRemoveEnd("example", ""), 
          n = "example", t.identical(i, n), t.case = "returns original if occurrence is not at the end ", 
          i = e.strRemoveEnd("example", "exa"), n = "example", t.identical(i, n), 
          /* - */
          t.case = "other", 
          /**/
          i = e.strRemoveEnd("", ""), n = "", t.identical(i, n), 
          /**/
          i = e.strRemoveEnd("", "x"), n = "", t.identical(i, n), 
          /**/
          i = e.strRemoveEnd("abc", "c"), n = "ab", t.identical(i, n), 
          /**/
          i = e.strRemoveEnd("abc", "bc"), n = "a", t.identical(i, n), 
          /**/
          i = e.strRemoveEnd("abc", "x"), n = "abc", t.identical(i, n), 
          /**/
          i = e.strRemoveEnd("abc", "abc"), n = "", t.identical(i, n), 
          /**/
          i = e.strRemoveEnd("abc", ""), n = "abc", t.identical(i, n), 
          /**/
          i = e.strRemoveEnd("abc", [ "a", "b", "c" ]), n = "ab", t.identical(i, n), 
          /**/
          i = e.strRemoveEnd("abc", [ "", "a" ]), n = "abc", t.identical(i, n), 
          /**/
          i = e.strRemoveEnd("abc", [ "", "c" ]), n = "abc", t.identical(i, n), 
          /**/
          i = e.strRemoveEnd("abc", [ "abc", "a" ]), n = "", t.identical(i, n), 
          /**/
          i = e.strRemoveEnd([ "abc", "bca", "cab" ], [ "a", "d" ]), n = [ "abc", "bc", "cab" ], 
          t.identical(i, n), 
          /**/
          i = e.strRemoveEnd([ "abc", "bca", "cab" ], [ "a", "b", "c" ]), n = [ "ab", "bc", "ca" ], 
          t.identical(i, n), 
          /**/
          i = e.strRemoveEnd([ "a", "b", "c" ], [ "x" ]), n = [ "a", "b", "c" ], t.identical(i, n), 
          /**/
          i = e.strRemoveEnd([ "a", "b", "c" ], [ "a", "b", "c" ]), n = [ "", "", "" ], t.identical(i, n), 
          /**/
          i = e.strRemoveEnd([ "a", "b", "c" ], []), n = [ "a", "b", "c" ], t.identical(i, n), 
          /* - */
          t.case = "RegExp", 
          /**/
          i = e.strRemoveEnd("example", /ple/), n = "exam", t.identical(i, n), 
          /**/
          i = e.strRemoveEnd("example", /le$/), n = "examp", t.identical(i, n), 
          /**/
          i = e.strRemoveEnd("example", /^le/), n = "example", t.identical(i, n), 
          /**/
          i = e.strRemoveEnd("example", /\d/), n = "example", t.identical(i, n), 
          /**/
          i = e.strRemoveEnd("example", /am/), n = "example", t.identical(i, n), 
          /**/
          i = e.strRemoveEnd("example", /[axe]/), n = "exampl", t.identical(i, n), 
          /**/
          i = e.strRemoveEnd("example", /\w{4}/), n = "exa", t.identical(i, n), 
          /**/
          i = e.strRemoveEnd([ "example", "1example", "example2", "exam3ple" ], [ /\d/, /e/, /^3/ ]), 
          n = [ "exampl", "1exampl", "example", "exam3pl" ], t.identical(i, n), t.shouldThrowError(() => e.strRemoveEnd(1, "")), 
          t.shouldThrowError(() => e.strRemoveEnd("a", 1)), t.shouldThrowError(() => e.strRemoveEnd()), 
          t.shouldThrowError(() => e.strRemoveEnd(void 0, void 0)), t.shouldThrowError(() => e.strRemoveEnd(null, null)), 
          t.case = "invalid arguments count", t.shouldThrowError(function() {
            e.strRemoveEnd("one", "two", "three");
          }), t.case = "no arguments", t.shouldThrowError(function() {
            e.strRemoveEnd();
          }), t.case = "first argument is wrong", t.shouldThrowError(function() {
            e.strRemoveEnd(1, "second");
          }), t.case = "second argument is wrong", t.shouldThrowError(function() {
            e.strRemoveEnd("first", 2);
          });
        }
        //
        ,
        strRemove: function strRemove(t) {
          t.case = "returns string with removed occurrence at the beggining";
          var i = e.strRemove("One example", "On"), n = "e example";
          t.identical(i, n), t.case = "returns string with removed occurrence at the end", 
          i = e.strRemove("One example", "ple"), n = "One exam", t.identical(i, n), t.case = "returns string with removed occurrence in the middle", 
          i = e.strRemove("One example", "ne examp"), n = "Ole", t.identical(i, n), t.case = "returns string with removed first occurrence", 
          i = e.strRemove("One example", "e"), n = "On example", t.identical(i, n), t.case = "returns original if no occurrence found ", 
          i = e.strRemove("example", "y"), n = "example", t.identical(i, n), t.case = "returns original if no occurrence found ", 
          i = e.strRemove("example", "ma"), n = "example", t.identical(i, n), 
          /* - */
          t.case = "other", 
          /**/
          i = e.strRemove("", ""), n = "", t.identical(i, n), 
          /**/
          i = e.strRemove("", "x"), n = "", t.identical(i, n), 
          /**/
          i = e.strRemove("cacbc", "c"), n = "acbc", t.identical(i, n), 
          /**/
          i = e.strRemove("abca", "bc"), n = "aa", t.identical(i, n), 
          /**/
          i = e.strRemove("abc", "x"), n = "abc", t.identical(i, n), 
          /**/
          i = e.strRemove("abcabc", "abc"), n = "abc", t.identical(i, n), 
          /**/
          i = e.strRemove("abc", ""), n = "abc", t.identical(i, n), 
          /**/
          i = e.strRemove("abc", [ "a", "b", "c" ]), n = "", t.identical(i, n), 
          /**/
          i = e.strRemove("bcabca", [ "", "a" ]), n = "bcbca", t.identical(i, n), 
          /**/
          i = e.strRemove("abc", [ "abc", "a" ]), n = "", t.identical(i, n), 
          /**/
          i = e.strRemove([ "abc", "bca", "cab" ], [ "a", "d" ]), n = [ "bc", "bc", "cb" ], 
          t.identical(i, n), 
          /**/
          i = e.strRemove([ "abc", "bca", "cab" ], [ "a", "b", "c" ]), n = [ "", "", "" ], 
          t.identical(i, n), 
          /**/
          i = e.strRemove([ "a", "b", "c" ], [ "x" ]), n = [ "a", "b", "c" ], t.identical(i, n), 
          /**/
          i = e.strRemove([ "a", "b", "c" ], []), n = [ "a", "b", "c" ], t.identical(i, n), 
          /* - */
          t.case = "RegExp", 
          /**/
          i = e.strRemove("One example", /e/), n = "On example", t.identical(i, n), 
          /**/
          i = e.strRemove("le example", /le$/), n = "le examp", t.identical(i, n), 
          /**/
          i = e.strRemove("example", /^le/), n = "example", t.identical(i, n), 
          /**/
          i = e.strRemove("example", /\d/), n = "example", t.identical(i, n), 
          /**/
          i = e.strRemove("ex1am2pl3e4", /\d/), n = "exam2pl3e4", t.identical(i, n), 
          /**/
          i = e.strRemove("example", /[axe]/), n = "xample", t.identical(i, n), 
          /**/
          i = e.strRemove("example", /[a-z]/), n = "xample", t.identical(i, n), 
          /**/
          i = e.strRemove([ "example", "1example", "example2", "xam3ple" ], [ /\d/, /e/, /^3/ ]), 
          n = [ "xample", "xample", "xample", "xampl" ], t.identical(i, n), t.shouldThrowError(() => e.strRemove(1, "")), 
          t.shouldThrowError(() => e.strRemove("a", 1)), t.shouldThrowError(() => e.strRemove()), 
          t.shouldThrowError(() => e.strRemove(void 0, void 0)), t.shouldThrowError(() => e.strRemove(null, null)), 
          t.case = "invalid arguments count", t.shouldThrowError(function() {
            e.strRemove("one", "two", "three");
          }), t.case = "no arguments", t.shouldThrowError(function() {
            e.strRemove();
          }), t.case = "first argument is wrong", t.shouldThrowError(function() {
            e.strRemove(1, "second");
          }), t.case = "second argument is wrong", t.shouldThrowError(function() {
            e.strRemove("first", 2);
          });
        }
        //
        ,
        strReplaceBegin: function strReplaceBegin(t) {
          /**/
          var i, n;
          i = e.strReplaceBegin("", "", ""), n = "", t.identical(i, n), i = e.strReplaceBegin("", "", "a"), 
          n = "a", t.identical(i, n), i = e.strReplaceBegin("a", "a", "b"), n = "b", t.identical(i, n), 
          i = e.strReplaceBegin("a", "x", "b"), n = "a", t.identical(i, n), i = e.strReplaceBegin("abc", "ab", "c"), 
          n = "cc", t.identical(i, n), i = e.strReplaceBegin("abc", "", "c"), n = "cabc", 
          t.identical(i, n), i = e.strReplaceBegin([], "", ""), n = [], t.identical(i, n), 
          i = e.strReplaceBegin([ "a", "b", "c" ], "a", "c"), n = [ "c", "b", "c" ], t.identical(i, n), 
          i = e.strReplaceBegin([ "a", "b", "c" ], [ "a", "b", "c" ], "c"), n = [ "c", "c", "c" ], 
          t.identical(i, n), i = e.strReplaceBegin([ "a", "b", "c" ], [ "a", "b", "c" ], [ "x", "y", "z" ]), 
          n = [ "x", "y", "z" ], t.identical(i, n), i = e.strReplaceBegin([ "aa", "bb", "cc" ], [ "a", "b", "c" ], [ "x", "y", "z" ]), 
          n = [ "xa", "yb", "zc" ], t.identical(i, n), i = e.strReplaceBegin([ "aa", "bb", "cc" ], [ "y", "z", "c" ], [ "x", "y", "z" ]), 
          n = [ "aa", "bb", "zc" ], t.identical(i, n), i = e.strReplaceBegin([ "a", "b", "c" ], [ "x", "y", "z" ], "c"), 
          n = [ "a", "b", "c" ], t.identical(i, n), i = e.strReplaceBegin([ "a", "ab", "ac" ], "a", [ "x", "y", "z" ]), 
          n = [ "x", "xb", "xc" ], t.identical(i, n), /* - */
          /**/
          t.case = "RegExp", 
          /**/
          i = e.strReplaceBegin("example", /exa/, "si"), n = "simple", t.identical(i, n), 
          i = e.strReplaceBegin("example", /ex$/, "no"), n = "example", t.identical(i, n), 
          i = e.strReplaceBegin([ "example", "lexical" ], [ /^le/, /ex$/, /\w{3}/ ], [ "a", "b", "si" ]), 
          n = [ "simple", "axical" ], t.identical(i, n), i = e.strReplaceBegin([ "example", "lexical" ], [ /^le/, /ex$/, /\w{3}/ ], "si"), 
          n = [ "simple", "sixical" ], t.identical(i, n), i = e.strReplaceBegin([ "example1", "3example", "exam4ple" ], /\d/, "2"), 
          n = [ "example1", "2example", "exam4ple" ], t.identical(i, n), i = e.strReplaceBegin([ "example", "1example", "example2", "exam3ple" ], [ /\d/, /e/, /^3/ ], [ "3", "2", "1" ]), 
          n = [ "2xample", "3example", "2xample2", "2xam3ple" ], t.identical(i, n), 
          /**/
          t.case = "Null", 
          /**/
          i = e.strReplaceBegin(null, /exa/, "si"), n = [], t.identical(i, n), i = e.strReplaceBegin("example", null, "no"), 
          n = "example", t.identical(i, n), t.shouldThrowError(() => e.strReplaceBegin()), 
          t.shouldThrowError(() => e.strReplaceBegin(1, "", "")), t.shouldThrowError(() => e.strReplaceBegin("")), 
          t.shouldThrowError(() => e.strReplaceBegin(1, "", "", "")), t.shouldThrowError(() => e.strReplaceBegin("a", 1, "")), 
          t.shouldThrowError(() => e.strReplaceBegin("a", "a", 1)), t.shouldThrowError(() => e.strReplaceBegin("a", [ "x", 1 ], "a")), 
          t.shouldThrowError(() => e.strReplaceBegin("a", [ "b", "a" ], [ "x", 1 ])), t.shouldThrowError(() => e.strReplaceBegin("a", [ "a" ], [ "x", "1" ])), 
          t.shouldThrowError(() => e.strReplaceBegin("string", "begin", null)), t.shouldThrowError(() => e.strReplaceBegin("string", "begin", void 0)), 
          t.shouldThrowError(() => e.strReplaceBegin("string", void 0, "ins")), t.shouldThrowError(() => e.strReplaceBegin(void 0, "begin", "ins"));
        }
        //
        ,
        strReplaceEnd: function strReplaceEnd(t) {
          /**/
          var i, n;
          i = e.strReplaceEnd("", "", ""), n = "", t.identical(i, n), i = e.strReplaceEnd("", "", "a"), 
          n = "a", t.identical(i, n), i = e.strReplaceEnd("a", "a", "b"), n = "b", t.identical(i, n), 
          i = e.strReplaceEnd("a", "x", "b"), n = "a", t.identical(i, n), i = e.strReplaceEnd("abc", "bc", "c"), 
          n = "ac", t.identical(i, n), i = e.strReplaceEnd("abc", "", "c"), n = "abcc", t.identical(i, n), 
          i = e.strReplaceEnd([], "", ""), n = [], t.identical(i, n), i = e.strReplaceEnd([ "a", "b", "c" ], "a", "c"), 
          n = [ "c", "b", "c" ], t.identical(i, n), i = e.strReplaceEnd([ "a", "b", "c" ], [ "a", "b", "c" ], "c"), 
          n = [ "c", "c", "c" ], t.identical(i, n), i = e.strReplaceEnd([ "a", "b", "c" ], [ "a", "b", "c" ], [ "x", "y", "z" ]), 
          n = [ "x", "y", "z" ], t.identical(i, n), i = e.strReplaceEnd([ "aa", "bb", "cc" ], [ "a", "b", "c" ], [ "x", "y", "z" ]), 
          n = [ "ax", "by", "cz" ], t.identical(i, n), i = e.strReplaceEnd([ "aa", "bb", "cc" ], [ "y", "z", "c" ], [ "x", "y", "z" ]), 
          n = [ "aa", "bb", "cz" ], t.identical(i, n), i = e.strReplaceEnd([ "a", "b", "c" ], [ "x", "y", "z" ], "c"), 
          n = [ "a", "b", "c" ], t.identical(i, n), i = e.strReplaceEnd([ "a", "ab", "ca" ], "a", [ "x", "y", "z" ]), 
          n = [ "x", "ab", "cx" ], t.identical(i, n), 
          /**/
          t.case = "RegExp", 
          /**/
          i = e.strReplaceEnd("example", /ple/, "en"), n = "examen", t.identical(i, n), i = e.strReplaceEnd("example", /^le/, "no"), 
          n = "example", t.identical(i, n), i = e.strReplaceEnd([ "example", "lexical" ], [ /^le/, /ex$/, /\w{3}/ ], [ "a", "b", "en" ]), 
          n = [ "examen", "lexien" ], t.identical(i, n), i = e.strReplaceEnd([ "example", "lexical" ], [ /al$/, /ex$/, /\w{3}/ ], "en"), 
          n = [ "examen", "lexien" ], t.identical(i, n), i = e.strReplaceEnd([ "example1", "3example", "exam4ple" ], /\d/, "2"), 
          n = [ "example2", "3example", "exam4ple" ], t.identical(i, n), i = e.strReplaceEnd([ "example", "1example", "example2", "exam2ple" ], [ /\d/, /e/, /^3/ ], [ "3", "2", "1" ]), 
          n = [ "exampl2", "1exampl2", "example3", "exam2pl2" ], t.identical(i, n), 
          /**/
          t.case = "Null", 
          /**/
          i = e.strReplaceEnd(null, /le/, "si"), n = [], t.identical(i, n), i = e.strReplaceEnd("example", null, "no"), 
          n = "example", t.identical(i, n), t.shouldThrowError(() => e.strReplaceEnd()), t.shouldThrowError(() => e.strReplaceEnd(1, "", "")), 
          t.shouldThrowError(() => e.strReplaceEnd("")), t.shouldThrowError(() => e.strReplaceEnd(1, "", "", "")), 
          t.shouldThrowError(() => e.strReplaceEnd("a", 1, "")), t.shouldThrowError(() => e.strReplaceEnd("a", "a", 1)), 
          t.shouldThrowError(() => e.strReplaceEnd("a", [ "x", 1 ], "a")), t.shouldThrowError(() => e.strReplaceEnd("a", [ "a" ], [ 1 ])), 
          t.shouldThrowError(() => e.strReplaceEnd("a", [ "b", "c" ], [ "c" ])), t.shouldThrowError(() => e.strReplaceEnd("string", "end", null)), 
          t.shouldThrowError(() => e.strReplaceEnd("string", "end", void 0)), t.shouldThrowError(() => e.strReplaceEnd("string", void 0, "ins")), 
          t.shouldThrowError(() => e.strReplaceEnd(void 0, "end", "ins"));
        }
        //
        ,
        strReplace: function strReplace(t) {
          /**/
          var i, n;
          i = e.strReplace("", "", ""), n = "", t.identical(i, n), i = e.strReplace("", "", "a"), 
          n = "a", t.identical(i, n), i = e.strReplace("a", "a", "b"), n = "b", t.identical(i, n), 
          i = e.strReplace("a", "x", "b"), n = "a", t.identical(i, n), i = e.strReplace("bcabcabc", "bc", "c"), 
          n = "cabcabc", t.identical(i, n), i = e.strReplace([], "", ""), n = [], t.identical(i, n), 
          i = e.strReplace([ "aaa", "ba", "c" ], "a", "c"), n = [ "caa", "bc", "c" ], t.identical(i, n), 
          i = e.strReplace([ "abc", "cab", "cba" ], [ "a", "b", "c" ], [ "c", "c", "c" ]), 
          n = [ "ccc", "ccc", "ccc" ], t.identical(i, n), i = e.strReplace([ "a", "b", "c" ], [ "a", "b", "c" ], [ "x", "y", "z" ]), 
          n = [ "x", "y", "z" ], t.identical(i, n), i = e.strReplace([ "ab", "bc", "ca" ], [ "a", "b", "c" ], [ "x", "y", "z" ]), 
          n = [ "xy", "yz", "zx" ], t.identical(i, n), i = e.strReplace([ "aa", "bb", "cc" ], [ "y", "z", "c" ], [ "x", "y", "z" ]), 
          n = [ "aa", "bb", "zc" ], t.identical(i, n), i = e.strReplace([ "a", "b", "c" ], [ "x", "y", "z" ], [ "1", "2", "3" ]), 
          n = [ "a", "b", "c" ], t.identical(i, n), i = e.strReplace([ "a", "bab", "ca" ], "a", "x"), 
          n = [ "x", "bxb", "cx" ], t.identical(i, n), 
          /**/
          t.case = "RegExp", 
          /**/
          i = e.strReplace("example", /ple/, "en"), n = "examen", t.identical(i, n), i = e.strReplace("example", /^le/, "no"), 
          n = "example", t.identical(i, n), i = e.strReplace([ "example", "lex11ical" ], [ /^le/, /ex$/, /\d{2}/ ], [ "a", "b", "en" ]), 
          n = [ "example", "axenical" ], t.identical(i, n), i = e.strReplace([ "example", "lexical" ], [ /al$/, /^ex/ ], [ "1", "2" ]), 
          n = [ "2ample", "lexic1" ], t.identical(i, n), i = e.strReplace([ "example1", "3example", "exam4ple" ], /\d/, "2"), 
          n = [ "example2", "2example", "exam2ple" ], t.identical(i, n), i = e.strReplace([ "3example", "1example", "example2", "exam2ple" ], [ /\d/, /e/, /^3/ ], [ "3", "2", "1" ]), 
          n = [ "12xample", "12xample", "2xample3", "2xam3ple" ], t.identical(i, n), t.shouldThrowError(() => e.strReplace()), 
          t.shouldThrowError(() => e.strReplace(1, "", "")), t.shouldThrowError(() => e.strReplace("")), 
          t.shouldThrowError(() => e.strReplace(1, "", "", "")), t.shouldThrowError(() => e.strReplace("a", 1, "")), 
          t.shouldThrowError(() => e.strReplace("a", "a", 1)), t.shouldThrowError(() => e.strReplace("a", [ "x", 1 ], "a")), 
          t.shouldThrowError(() => e.strReplace("a", [ "a" ], [ 1 ])), t.shouldThrowError(() => e.strReplace("a", [ "b", "c" ], [ "c" ])), 
          t.shouldThrowError(() => e.strReplace("string", "sub", null)), t.shouldThrowError(() => e.strReplace("string", "sub", void 0)), 
          t.shouldThrowError(() => e.strReplace("string", null, "ins")), t.shouldThrowError(() => e.strReplace("string", void 0, "ins")), 
          t.shouldThrowError(() => e.strReplace(null, "sub", "ins")), t.shouldThrowError(() => e.strReplace(void 0, "sub", "ins"));
        }
        //
        ,
        strPrependOnce: function strPrependOnce(t) {
          var i, n;
          /* - */          t.case = "strPrependOnce", 
          /**/
          i = e.strPrependOnce("", ""), n = "", t.identical(i, n), 
          /**/
          i = e.strPrependOnce("", "a"), n = "a", t.identical(i, n), 
          /**/
          i = e.strPrependOnce("ab", "a"), n = "ab", t.identical(i, n), 
          /**/
          i = e.strPrependOnce("ab", "ab"), n = "ab", t.identical(i, n), 
          /**/
          i = e.strPrependOnce("ab", "x"), n = "xab", t.identical(i, n), 
          /**/
          i = e.strPrependOnce("ab", ""), n = "ab", t.identical(i, n), 
          /**/
          i = e.strPrependOnce("morning", "Good "), n = "Good morning", t.identical(i, n), 
          /**/
          i = e.strPrependOnce("Good morning", "Good "), n = "Good morning", t.identical(i, n), 
          t.shouldThrowError(() => e.strPrependOnce()), t.shouldThrowError(() => e.strPrependOnce(null, "")), 
          t.shouldThrowError(() => e.strPrependOnce("", null)), t.shouldThrowError(() => e.strPrependOnce(NaN, "")), 
          t.shouldThrowError(() => e.strPrependOnce("", NaN)), t.shouldThrowError(() => e.strPrependOnce(3, "")), 
          t.shouldThrowError(() => e.strPrependOnce("", 3)), t.shouldThrowError(() => e.strPrependOnce([], "")), 
          t.shouldThrowError(() => e.strPrependOnce("", []));
        }
        //
        ,
        strAppendOnce: function strAppendOnce(t) {
          var i, n;
          /* - */          t.case = "strAppendOnce", 
          /**/
          i = e.strAppendOnce("", ""), n = "", t.identical(i, n), 
          /**/
          i = e.strAppendOnce("", "a"), n = "a", t.identical(i, n), 
          /**/
          i = e.strAppendOnce("ab", "a"), n = "aba", t.identical(i, n), 
          /**/
          i = e.strAppendOnce("ab", "ab"), n = "ab", t.identical(i, n), 
          /**/
          i = e.strAppendOnce("ab", "x"), n = "abx", t.identical(i, n), 
          /**/
          i = e.strAppendOnce("ab", ""), n = "ab", t.identical(i, n), 
          /**/
          i = e.strAppendOnce("Good ", "morning"), n = "Good morning", t.identical(i, n), 
          /**/
          i = e.strAppendOnce("Good morning", "morning"), n = "Good morning", t.identical(i, n), 
          t.shouldThrowError(() => e.strAppendOnce()), t.shouldThrowError(() => e.strAppendOnce(null, "")), 
          t.shouldThrowError(() => e.strAppendOnce("", null)), t.shouldThrowError(() => e.strAppendOnce(NaN, "")), 
          t.shouldThrowError(() => e.strAppendOnce("", NaN)), t.shouldThrowError(() => e.strAppendOnce(3, "")), 
          t.shouldThrowError(() => e.strAppendOnce("", 3)), t.shouldThrowError(() => e.strAppendOnce([], "")), 
          t.shouldThrowError(() => e.strAppendOnce("", []));
        }
        // --
        //
        // --
        ,
        /* - */
        strForRange: function strForRange(t) {
          t.case = "returns string representing the range of numbers";
          var i = e.strForRange([ 1, 10 ]), n = "[ 1..10 ]";
          t.identical(i, n), t.case = "returns string representing the range of symbols", 
          i = e.strForRange([ "a", "z" ]), n = "[ a..z ]", t.identical(i, n), t.case = "no arguments", 
          t.shouldThrowError(function() {
            e.strForRange();
          }), t.case = "argument is wrong", t.shouldThrowError(function() {
            e.strForRange("wrong argument");
          }), t.case = "too many arguments", t.shouldThrowError(function() {
            e.strForRange([ 1, 10 ], "redundant argument");
          });
        },
        strCapitalize: 
        //
        function strCapitalize(t) {
          t.case = "first letter is upper case";
          var i = e.strCapitalize("object"), n = "Object";
          t.identical(i, n), t.case = "single word", i = e.strCapitalize("one"), n = "One", 
          t.identical(i, n), t.case = "two words", i = e.strCapitalize("one two"), n = "One two", 
          t.identical(i, n), t.case = "invalid arguments length", t.shouldThrowError(function() {
            e.strCapitalize("first", "wrond argument");
          }), t.case = "wrong type of argument", t.shouldThrowError(function() {
            e.strCapitalize(777);
          }), t.case = "no argument provided", t.shouldThrowError(function() {
            e.strCapitalize();
          }), t.case = "no arguments", t.shouldThrowError(function() {
            e.strCapitalize();
          }), t.case = "argument is wrong", t.shouldThrowError(function() {
            e.strCapitalize(33);
          }), t.case = "too many arguments", t.shouldThrowError(function() {
            e.strCapitalize("object", "redundant argument");
          });
        }
        //
        ,
        strIndentation: function strIndentation(t) {
          var i, n;
          /* - */          t.case = "single line", 
          /**/
          i = e.strIndentation("", "_"), n = "_", t.identical(i, n), 
          /* no new lines, returns tab + source */
          i = e.strIndentation("abc", "_"), n = "_abc", t.identical(i, n), 
          /* - */
          t.case = "multiline", 
          /**/
          i = e.strIndentation("a\nb", "_"), n = "_a\n_b", t.identical(i, n), 
          /* tab before first and each new line */
          i = e.strIndentation("\na\nb\nc", "_"), n = "_\n_a\n_b\n_c", t.identical(i, n), 
          /* tabs count = new lines count + 1 for first line */
          i = e.strIndentation("\n\n\n", "_"), n = "_\n_\n_\n_", t.identical(i, n), 
          /**/
          i = e.strIndentation("a\nb\nc", "\t"), n = "\ta\n\tb\n\tc", t.identical(i, n), 
          /* - */
          t.case = "array", 
          /**/
          i = e.strIndentation([ "a", "b", "c" ], "_"), n = "_a\n_b\n_c", t.identical(i, n), 
          i = e.strIndentation([ "a\nb", "b\nc", "c\nd" ].join("\n"), "_"), n = "_a\n_b\n_b\n_c\n_c\n_d", 
          t.identical(i, n), t.case = "invalid arguments count", t.shouldThrowError(function() {
            e.strIndentation("one", "two", "three");
          }), t.case = "no arguments", t.shouldThrowError(function() {
            e.strIndentation();
          }), t.case = "first argument type is wrong", t.shouldThrowError(function() {
            e.strIndentation(123, "second");
          }), t.case = "second argument type is wrong", t.shouldThrowError(function() {
            e.strIndentation("first", 321);
          });
        }
        //
        ,
        strSplitsCoupledGroup: function strSplitsCoupledGroup(t) {
          t.open("trivial"), t.case = "empty";
          var i = e.strSplitsCoupledGroup({
            splits: [ "aa", ">>", "<<-", "dd" ],
            prefix: ">>",
            postfix: /^<</
          }), n = [ "aa", [ ">>", "<<-" ], "dd" ];
          t.identical(i, n), t.case = "middle", i = e.strSplitsCoupledGroup({
            splits: [ "aa", ">>", "bb", "cc", "<<-", "dd" ],
            prefix: ">>",
            postfix: /^<</
          }), n = [ "aa", [ ">>", "bb", "cc", "<<-" ], "dd" ], t.identical(i, n), t.case = "left", 
          i = e.strSplitsCoupledGroup({
            splits: [ ">>", "bb", "cc", "<<-", "dd" ],
            prefix: ">>",
            postfix: /^<</
          }), n = [ [ ">>", "bb", "cc", "<<-" ], "dd" ], t.identical(i, n), t.case = "right", 
          i = e.strSplitsCoupledGroup({
            splits: [ "aa", ">>", "bb", "cc", "<<-" ],
            prefix: ">>",
            postfix: /^<</
          }), n = [ "aa", [ ">>", "bb", "cc", "<<-" ] ], t.identical(i, n), 
          /* - */
          t.close("trivial"), t.open("several"), 
          /* - */
          t.case = "empty", i = e.strSplitsCoupledGroup({
            splits: [ "aa", ">>", "<<-", ">>", "<<-", "dd" ],
            prefix: ">>",
            postfix: /^<</
          }), n = [ "aa", [ ">>", "<<-" ], [ ">>", "<<-" ], "dd" ], t.identical(i, n), t.case = "middle", 
          i = e.strSplitsCoupledGroup({
            splits: [ "aa", ">>", "bb", "cc", "<<-", "dd", ">>", "ee", "ff", "<<-", "gg" ],
            prefix: ">>",
            postfix: /^<</
          }), n = [ "aa", [ ">>", "bb", "cc", "<<-" ], "dd", [ ">>", "ee", "ff", "<<-" ], "gg" ], 
          t.identical(i, n), t.case = "left", i = e.strSplitsCoupledGroup({
            splits: [ ">>", "bb", "cc", "<<-", ">>", "ee", "ff", "<<-", "gg" ],
            prefix: ">>",
            postfix: /^<</
          }), n = [ [ ">>", "bb", "cc", "<<-" ], [ ">>", "ee", "ff", "<<-" ], "gg" ], t.identical(i, n), 
          t.case = "right", i = e.strSplitsCoupledGroup({
            splits: [ "aa", ">>", "bb", "cc", "<<-", ">>", "ee", "ff", "<<-" ],
            prefix: ">>",
            postfix: /^<</
          }), n = [ "aa", [ ">>", "bb", "cc", "<<-" ], [ ">>", "ee", "ff", "<<-" ] ], t.identical(i, n), 
          t.close("several"), t.open("recursion"), 
          /* - */
          t.case = "empty", i = e.strSplitsCoupledGroup({
            splits: [ "aa", ">>", ">>", "<<=", "<<-", "dd" ],
            prefix: ">>",
            postfix: /^<</
          }), n = [ "aa", [ ">>", [ ">>", "<<=" ], "<<-" ], "dd" ], t.identical(i, n), t.case = "middle", 
          i = e.strSplitsCoupledGroup({
            splits: [ "aa", ">>", "bb", ">>", "cc", "dd", "<<=", "ee", "<<-", "ff" ],
            prefix: ">>",
            postfix: /^<</
          }), n = [ "aa", [ ">>", "bb", [ ">>", "cc", "dd", "<<=" ], "ee", "<<-" ], "ff" ], 
          t.identical(i, n), t.case = "left", i = e.strSplitsCoupledGroup({
            splits: [ ">>", ">>", "cc", "dd", "<<=", "ee", "<<-", "ff" ],
            prefix: ">>",
            postfix: /^<</
          }), n = [ [ ">>", [ ">>", "cc", "dd", "<<=" ], "ee", "<<-" ], "ff" ], t.identical(i, n), 
          t.case = "right", i = e.strSplitsCoupledGroup({
            splits: [ "aa", ">>", "bb", ">>", "cc", "dd", "<<=", "<<-" ],
            prefix: ">>",
            postfix: /^<</
          }), n = [ "aa", [ ">>", "bb", [ ">>", "cc", "dd", "<<=" ], "<<-" ] ], t.identical(i, n), 
          t.close("recursion"), t.open("uncoupled prefix"), 
          /* - */
          t.case = "empty", i = e.strSplitsCoupledGroup({
            splits: [ "aa", ">>", ">>", "<<-", "dd" ],
            prefix: ">>",
            postfix: /^<</,
            allowingUncoupledPrefix: 1
          }), n = [ "aa", ">>", [ ">>", "<<-" ], "dd" ], t.identical(i, n), t.case = "middle", 
          i = e.strSplitsCoupledGroup({
            splits: [ "aa", "bb", ">>", "cc", ">>", "dd", "<<=", "ee", "ff" ],
            prefix: ">>",
            postfix: /^<</,
            allowingUncoupledPrefix: 1
          }), n = [ "aa", "bb", ">>", "cc", [ ">>", "dd", "<<=" ], "ee", "ff" ], t.identical(i, n), 
          t.case = "left", i = e.strSplitsCoupledGroup({
            splits: [ ">>", ">>", "dd", "<<=", "ee", "ff" ],
            prefix: ">>",
            postfix: /^<</,
            allowingUncoupledPrefix: 1
          }), n = [ ">>", [ ">>", "dd", "<<=" ], "ee", "ff" ], t.identical(i, n), t.case = "right", 
          i = e.strSplitsCoupledGroup({
            splits: [ "aa", "bb", ">>", "cc", ">>", "<<=" ],
            prefix: ">>",
            postfix: /^<</,
            allowingUncoupledPrefix: 1
          }), n = [ "aa", "bb", ">>", "cc", [ ">>", "<<=" ] ], t.identical(i, n), 
          /* - */
          t.close("uncoupled prefix"), t.open("uncoupled postfix"), 
          /* - */
          t.case = "empty", i = e.strSplitsCoupledGroup({
            splits: [ "aa", ">>", "<<=", "<<-", "dd" ],
            prefix: ">>",
            postfix: /^<</,
            allowingUncoupledPostfix: 1
          }), n = [ "aa", [ ">>", "<<=" ], "<<-", "dd" ], t.identical(i, n), t.case = "middle", 
          i = e.strSplitsCoupledGroup({
            splits: [ "aa", "bb", ">>", "cc", "dd", "<<=", "ee", "<<-", "ff" ],
            prefix: ">>",
            postfix: /^<</,
            allowingUncoupledPostfix: 1
          }), n = [ "aa", "bb", [ ">>", "cc", "dd", "<<=" ], "ee", "<<-", "ff" ], t.identical(i, n), 
          t.case = "left", i = e.strSplitsCoupledGroup({
            splits: [ ">>", "cc", "dd", "<<=", "ee", "<<-", "ff" ],
            prefix: ">>",
            postfix: /^<</,
            allowingUncoupledPostfix: 1
          }), n = [ [ ">>", "cc", "dd", "<<=" ], "ee", "<<-", "ff" ], t.identical(i, n), t.case = "right", 
          i = e.strSplitsCoupledGroup({
            splits: [ "aa", "bb", ">>", "cc", "dd", "<<=", "<<-" ],
            prefix: ">>",
            postfix: /^<</,
            allowingUncoupledPostfix: 1
          }), n = [ "aa", "bb", [ ">>", "cc", "dd", "<<=" ], "<<-" ], t.identical(i, n), 
          /* - */
          t.close("uncoupled postfix"), t.open("throwing")
          /* - */ , t.case = "uncoupled postfix", t.shouldThrowError(() => {
            e.strSplitsCoupledGroup({
              splits: [ "aa", ">>", "<<=", "<<-", "dd" ],
              prefix: ">>",
              postfix: /^<</
            });
          }), t.case = "uncoupled prefix", t.shouldThrowError(() => {
            e.strSplitsCoupledGroup({
              splits: [ "aa", ">>", ">>", "<<=", "dd" ],
              prefix: ">>",
              postfix: /^<</
            });
          }), t.close("throwing");
        }
        //
        ,
        strSplitFast: function strSplitFast(t) {
          t.case = "trivial";
          var i = e.strSplitFast("", ""), n = [];
          t.identical(i, n), i = e.strSplitFast("abc", ""), n = [ "a", "", "b", "", "c" ], 
          t.identical(i, n), i = e.strSplitFast("", "a"), n = [ "" ], t.identical(i, n), i = e.strSplitFast("test test test"), 
          n = [ "test", " ", "test", " ", "test" ], t.identical(i, n), t.case = "split string into an array of strings", 
          i = e.strSplitFast(" test   test   test "), n = [ "", " ", "test", " ", "", " ", "", " ", "test", " ", "", " ", "", " ", "test", " ", "" ], 
          t.identical(i, n), t.case = "returns an array of strings", i = e.strSplitFast(" test   test   test ", "something"), 
          n = [ " test   test   test " ], t.identical(i, n), t.case = "returns an array of strings", 
          i = e.strSplitFast(" test <delimteter>  test<delimteter>   test ", "<delimteter>"), 
          n = [ " test ", "<delimteter>", "  test", "<delimteter>", "   test " ], t.identical(i, n), 
          t.case = "simple string, default options", i = e.strSplitFast("a b c d"), n = [ "a", " ", "b", " ", "c", " ", "d" ], 
          t.identical(i, n);
          /*
    preservingEmpty : 1,
    preservingDelimeters : 0,
  */
          var r, s = {
            preservingEmpty: 1,
            preservingDelimeters: 0
          }
          /* */;
          t.case = "empty both", (r = e.mapExtend(null, s)).src = "", r.delimeter = "", i = e.strSplitFast(r), 
          n = [], t.identical(i, n), t.case = "empty delimeter", (r = e.mapExtend(null, s)).src = "abc", 
          r.delimeter = "", i = e.strSplitFast(r), n = [ "a", "b", "c" ], t.identical(i, n), 
          t.case = "empty src", (r = e.mapExtend(null, s)).src = "", r.delimeter = "a", i = e.strSplitFast(r), 
          n = [ "" ], t.identical(i, n), t.case = "has empty element in result", (r = e.mapExtend(null, s)).src = "a b  c", 
          i = e.strSplitFast(r), n = [ "a", "b", "", "c" ], t.identical(i, n), t.case = "returns an array of strings", 
          (r = e.mapExtend(null, s)).src = "test test test", i = e.strSplitFast(r), n = [ "test", "test", "test" ], 
          t.identical(i, n), t.case = "split string into an array of strings", (r = e.mapExtend(null, s)).src = " test   test   test ", 
          i = e.strSplitFast(r), n = [ "", "test", "", "", "test", "", "", "test", "" ], t.identical(i, n), 
          t.case = "split with delimeter which src does not have", (r = e.mapExtend(null, s)).src = " test   test   test ", 
          r.delimeter = "x", i = e.strSplitFast(r), n = [ " test   test   test " ], t.identical(i, n), 
          t.case = "custom delimeter", (r = e.mapExtend(null, s)).src = " test <delimteter>  test<delimteter>   test ", 
          r.delimeter = "<delimteter>", i = e.strSplitFast(r), n = [ " test ", "  test", "   test " ], 
          t.identical(i, n), t.case = "simple string, default options", (r = e.mapExtend(null, s)).src = "a b c d", 
          i = e.strSplitFast(r), n = [ "a", "b", "c", "d" ], t.identical(i, n), t.case = "arguments as map", 
          (r = e.mapExtend(null, s)).src = "a,b,c,d", r.delimeter = ",", i = e.strSplitFast(r), 
          n = [ "a", "b", "c", "d" ], t.identical(i, n), t.case = "delimeter as array", (r = e.mapExtend(null, s)).src = "a,b.c.d", 
          r.delimeter = [ ",", "." ], i = e.strSplitFast(r), n = [ "a", "b", "c", "d" ], t.identical(i, n), 
          t.case = "zero delimeter length", (r = e.mapExtend(null, s)).src = "a,b.c.d", r.delimeter = [], 
          i = e.strSplitFast(r), n = [ "a,b.c.d" ], t.identical(i, n), t.case = "stripping off", 
          (r = e.mapExtend(null, s)).src = "    a,b,c,d   ", r.delimeter = [ "," ], i = e.strSplitFast(r), 
          n = [ "    a", "b", "c", "d   " ], t.identical(i, n), 
          /* */
          t.case = "many delimeters, delimeter on the begin", (r = e.mapExtend(null, s)).src = ".content", 
          r.delimeter = [ ".", "#" ], i = e.strSplitFast(r), n = [ "", "content" ], t.identical(i, n), 
          t.case = "many delimeters, delimeter on the end", (r = e.mapExtend(null, s)).src = "content.", 
          r.delimeter = [ ".", "#" ], i = e.strSplitFast(r), n = [ "content", "" ], t.identical(i, n), 
          t.case = "many delimeters having common", (r = e.mapExtend(null, s)).src = "Aa <<! <<- Bb", 
          r.delimeter = [ "->>>", "<<<-", "->>", "<<-", "!>>", "<<!", ">>", "<<", " " ], n = [ "Aa", "", "", "", "", "Bb" ], 
          i = e.strSplitFast(r), t.identical(i, n), t.case = "many delimeters having common", 
          (r = e.mapExtend(null, s)).src = "Aa <<! <<- Bb", r.delimeter = [ "->>>", "<<<-", "->>", "<<-", "!>>", "<<!", ">>", "<<" ], 
          n = [ "Aa ", " ", " Bb" ], i = e.strSplitFast(r), t.identical(i, n), t.case = "having long common", 
          (r = e.mapExtend(null, s)).src = "Aa <<<- Bb", r.delimeter = [ "->>>", "<<<-", "->>", "<<-", "!>>", "<<!", ">>", "<<" ], 
          n = [ "Aa ", " Bb" ], i = e.strSplitFast(r), t.identical(i, n), t.case = "having long common 2", 
          (r = e.mapExtend(null, s)).src = "a1 a2 a3 <<<- Bb", r.delimeter = [ "->>>", "<<<-", "->>", "<<-", "!>>", "<<!", ">>", "<<", " " ], 
          n = [ "a1", "a2", "a3", "", "", "Bb" ], i = e.strSplitFast(r), t.identical(i, n), 
          t.case = "delimeter not exist in src", (r = e.mapExtend(null, s)).src = "a,b,c", 
          r.delimeter = [ "." ], n = [ "a,b,c" ], i = e.strSplitFast(r), t.identical(i, n), 
          /**/
          t.case = "several delimeters", (r = e.mapExtend(null, s)).src = "a ., b ., c ., d", 
          r.delimeter = [ ",", "." ], n = [ "a ", "", " b ", "", " c ", "", " d" ], i = e.strSplitFast(r), 
          t.identical(i, n), t.case = "one delimeters", (r = e.mapExtend(null, s)).src = "a , b , c , d", 
          r.delimeter = ",", n = [ "a ", " b ", " c ", " d" ], i = e.strSplitFast(r), t.identical(i, n), 
          t.case = "delimeters equal src", (r = e.mapExtend(null, s)).src = ",", r.delimeter = ",", 
          n = [ "", "" ], i = e.strSplitFast(r), t.identical(i, n), t.case = "src is triplet of delimeter", 
          (r = e.mapExtend(null, s)).src = ",,,", r.delimeter = ",", n = [ "", "", "", "" ], 
          i = e.strSplitFast(r), t.identical(i, n), 
          /* */
          t.case = "quoted at edges", (r = e.mapExtend(null, s)).src = '"a b" "" c"', r.delimeter = [ '"' ], 
          i = e.strSplitFast(r), n = [ "", "a b", " ", "", " c", "" ], t.identical(i, n), 
          t.case = "quoted in the middle", (r = e.mapExtend(null, s)).src = '"a b" "" c', 
          r.delimeter = [ "a b", " c" ], i = e.strSplitFast(r), n = [ '"', '" ""', "" ], t.identical(i, n), 
          t.case = "quoted in the middle with space first", (r = e.mapExtend(null, s)).src = '"a b" "" c', 
          r.delimeter = [ "a b", " ", " c", '"' ], i = e.strSplitFast(r), n = [ "", "", "", "", "", "", "", "c" ], 
          t.identical(i, n), t.case = "quoted in the middle with space last", (r = e.mapExtend(null, s)).src = '"a b" "" c', 
          r.delimeter = [ "a b", " c", '"', " " ], i = e.strSplitFast(r), n = [ "", "", "", "", "", "", "", "" ], 
          t.identical(i, n), t.case = "delimeter with empty string at the beginning of array", 
          (r = e.mapExtend(null, s)).src = '"a b" "" c', r.delimeter = [ "", "a b", " ", "", " c" ], 
          i = e.strSplitFast(r), n = [ '"', "a", " ", "b", '"', " ", '"', '"', " ", "c" ], 
          t.identical(i, n), t.case = "quoted in the middle", (r = e.mapExtend(null, s)).src = '"a b" x "" c', 
          r.delimeter = [ "a b", " ", " c", '"', "" ], i = e.strSplitFast(r), n = [ "", "", "", "", "x", "", "", "", "", "c" ], 
          t.identical(i, n), s = {
            preservingEmpty: 0,
            preservingDelimeters: 0
          }
          /* */ , t.case = "empty both", (r = e.mapExtend(null, s)).src = "", r.delimeter = "", 
          i = e.strSplitFast(r), n = [], t.identical(i, n), t.case = "empty delimeter", (r = e.mapExtend(null, s)).src = "abc", 
          r.delimeter = "", i = e.strSplitFast(r), n = [ "a", "b", "c" ], t.identical(i, n), 
          t.case = "empty src", (r = e.mapExtend(null, s)).src = "", r.delimeter = "a", i = e.strSplitFast(r), 
          n = [], t.identical(i, n), t.case = "has empty element in result", (r = e.mapExtend(null, s)).src = "a b  c", 
          i = e.strSplitFast(r), n = [ "a", "b", "c" ], t.identical(i, n), t.case = "returns an array of strings", 
          (r = e.mapExtend(null, s)).src = "test test test", i = e.strSplitFast(r), n = [ "test", "test", "test" ], 
          t.identical(i, n), t.case = "split string into an array of strings", (r = e.mapExtend(null, s)).src = " test   test   test ", 
          i = e.strSplitFast(r), n = [ "test", "test", "test" ], t.identical(i, n), t.case = "split with delimeter which src does not have", 
          (r = e.mapExtend(null, s)).src = " test   test   test ", r.delimeter = "x", i = e.strSplitFast(r), 
          n = [ " test   test   test " ], t.identical(i, n), t.case = "custom delimeter", 
          (r = e.mapExtend(null, s)).src = " test <delimteter>  test<delimteter>   test ", 
          r.delimeter = "<delimteter>", i = e.strSplitFast(r), n = [ " test ", "  test", "   test " ], 
          t.identical(i, n), t.case = "simple string, default options", (r = e.mapExtend(null, s)).src = "a b c d", 
          i = e.strSplitFast(r), n = [ "a", "b", "c", "d" ], t.identical(i, n), t.case = "arguments as map", 
          (r = e.mapExtend(null, s)).src = "a,b,c,d", r.delimeter = ",", i = e.strSplitFast(r), 
          n = [ "a", "b", "c", "d" ], t.identical(i, n), t.case = "delimeter as array", (r = e.mapExtend(null, s)).src = "a,b.c.d", 
          r.delimeter = [ ",", "." ], i = e.strSplitFast(r), n = [ "a", "b", "c", "d" ], t.identical(i, n), 
          t.case = "zero delimeter length", (r = e.mapExtend(null, s)).src = "a,b.c.d", r.delimeter = [], 
          i = e.strSplitFast(r), n = [ "a,b.c.d" ], t.identical(i, n), t.case = "stripping off", 
          (r = e.mapExtend(null, s)).src = "    a,b,c,d   ", r.delimeter = [ "," ], i = e.strSplitFast(r), 
          n = [ "    a", "b", "c", "d   " ], t.identical(i, n), 
          /* */
          t.case = "many delimeters, delimeter on the begin", (r = e.mapExtend(null, s)).src = ".content", 
          r.delimeter = [ ".", "#" ], i = e.strSplitFast(r), n = [ "content" ], t.identical(i, n), 
          t.case = "many delimeters, delimeter on the end", (r = e.mapExtend(null, s)).src = "content.", 
          r.delimeter = [ ".", "#" ], i = e.strSplitFast(r), n = [ "content" ], t.identical(i, n), 
          t.case = "many delimeters having common", (r = e.mapExtend(null, s)).src = "Aa <<! <<- Bb", 
          r.delimeter = [ "->>>", "<<<-", "->>", "<<-", "!>>", "<<!", ">>", "<<", " " ], n = [ "Aa", "Bb" ], 
          i = e.strSplitFast(r), t.identical(i, n), t.case = "many delimeters having common", 
          (r = e.mapExtend(null, s)).src = "Aa <<! <<- Bb", r.delimeter = [ "->>>", "<<<-", "->>", "<<-", "!>>", "<<!", ">>", "<<" ], 
          n = [ "Aa ", " ", " Bb" ], i = e.strSplitFast(r), t.identical(i, n), t.case = "having long common", 
          (r = e.mapExtend(null, s)).src = "Aa <<<- Bb", r.delimeter = [ "->>>", "<<<-", "->>", "<<-", "!>>", "<<!", ">>", "<<" ], 
          n = [ "Aa ", " Bb" ], i = e.strSplitFast(r), t.identical(i, n), t.case = "having long common 2", 
          (r = e.mapExtend(null, s)).src = "a1 a2 a3 <<<- Bb", r.delimeter = [ "->>>", "<<<-", "->>", "<<-", "!>>", "<<!", ">>", "<<", " " ], 
          n = [ "a1", "a2", "a3", "Bb" ], i = e.strSplitFast(r), t.identical(i, n), t.case = "delimeter not exist in src", 
          (r = e.mapExtend(null, s)).src = "a,b,c", r.delimeter = [ "." ], n = [ "a,b,c" ], 
          i = e.strSplitFast(r), t.identical(i, n), 
          /**/
          t.case = "several delimeters", (r = e.mapExtend(null, s)).src = "a ., b ., c ., d", 
          r.delimeter = [ ",", "." ], n = [ "a ", " b ", " c ", " d" ], i = e.strSplitFast(r), 
          t.identical(i, n), t.case = "one delimeters", (r = e.mapExtend(null, s)).src = "a , b , c , d", 
          r.delimeter = ",", n = [ "a ", " b ", " c ", " d" ], i = e.strSplitFast(r), t.identical(i, n), 
          t.case = "delimeters equal src", (r = e.mapExtend(null, s)).src = ",", r.delimeter = ",", 
          n = [], i = e.strSplitFast(r), t.identical(i, n), t.case = "src is triplet of delimeter", 
          (r = e.mapExtend(null, s)).src = ",,,", r.delimeter = ",", n = [], i = e.strSplitFast(r), 
          t.identical(i, n), 
          /* */
          t.case = "quoted at edges", (r = e.mapExtend(null, s)).src = '"a b" "" c"', r.delimeter = [ '"' ], 
          i = e.strSplitFast(r), n = [ "a b", " ", " c" ], t.identical(i, n), t.case = "quoted in the middle", 
          (r = e.mapExtend(null, s)).src = '"a b" "" c', r.delimeter = [ "a b", " c" ], i = e.strSplitFast(r), 
          n = [ '"', '" ""' ], t.identical(i, n), t.case = "quoted in the middle with space first", 
          (r = e.mapExtend(null, s)).src = '"a b" "" c', r.delimeter = [ "a b", " ", " c", '"' ], 
          i = e.strSplitFast(r), n = [ "c" ], t.identical(i, n), t.case = "quoted in the middle with space last", 
          (r = e.mapExtend(null, s)).src = '"a b" "" c', r.delimeter = [ "a b", " c", '"', " " ], 
          i = e.strSplitFast(r), n = [], t.identical(i, n), t.case = "delimeter with empty string at the beginning of array", 
          (r = e.mapExtend(null, s)).src = '"a b" "" c', r.delimeter = [ "", "a b", " ", "", " c" ], 
          i = e.strSplitFast(r), n = [ '"', "a", " ", "b", '"', " ", '"', '"', " ", "c" ], 
          t.identical(i, n), t.case = "quoted in the middle", (r = e.mapExtend(null, s)).src = '"a b" x "" c', 
          r.delimeter = [ "a b", " ", " c", '"', "" ], i = e.strSplitFast(r), n = [ "x", "c" ], 
          t.identical(i, n), s = {
            preservingEmpty: 1,
            preservingDelimeters: 1
          }
          /* */ , t.case = "empty both", (r = e.mapExtend(null, s)).src = "", r.delimeter = "", 
          i = e.strSplitFast(r), n = [], t.identical(i, n), t.case = "empty delimeter", (r = e.mapExtend(null, s)).src = "abc", 
          r.delimeter = "", i = e.strSplitFast(r), n = [ "a", "", "b", "", "c" ], t.identical(i, n), 
          t.case = "empty src", (r = e.mapExtend(null, s)).src = "", r.delimeter = "a", i = e.strSplitFast(r), 
          n = [ "" ], t.identical(i, n), t.case = "has empty element in result", (r = e.mapExtend(null, s)).src = "a b  c", 
          i = e.strSplitFast(r), n = [ "a", " ", "b", " ", "", " ", "c" ], t.identical(i, n), 
          t.case = "returns an array of strings", (r = e.mapExtend(null, s)).src = "test test test", 
          i = e.strSplitFast(r), n = [ "test", " ", "test", " ", "test" ], t.identical(i, n), 
          t.case = "split string into an array of strings", (r = e.mapExtend(null, s)).src = " test   test   test ", 
          i = e.strSplitFast(r), n = [ "", " ", "test", " ", "", " ", "", " ", "test", " ", "", " ", "", " ", "test", " ", "" ], 
          t.identical(i, n), t.case = "split with delimeter which src does not have", (r = e.mapExtend(null, s)).src = " test   test   test ", 
          r.delimeter = "x", i = e.strSplitFast(r), n = [ " test   test   test " ], t.identical(i, n), 
          t.case = "custom delimeter", (r = e.mapExtend(null, s)).src = " test <delimteter>  test<delimteter>   test ", 
          r.delimeter = "<delimteter>", i = e.strSplitFast(r), n = [ " test ", "<delimteter>", "  test", "<delimteter>", "   test " ], 
          t.identical(i, n), t.case = "simple string, default options", (r = e.mapExtend(null, s)).src = "a b c d", 
          i = e.strSplitFast(r), n = [ "a", " ", "b", " ", "c", " ", "d" ], t.identical(i, n), 
          t.case = "arguments as map", (r = e.mapExtend(null, s)).src = "a,b,c,d", r.delimeter = ",", 
          i = e.strSplitFast(r), n = [ "a", ",", "b", ",", "c", ",", "d" ], t.identical(i, n), 
          t.case = "delimeter as array", (r = e.mapExtend(null, s)).src = "a,b.c.d", r.delimeter = [ ",", "." ], 
          i = e.strSplitFast(r), n = [ "a", ",", "b", ".", "c", ".", "d" ], t.identical(i, n), 
          t.case = "zero delimeter length", (r = e.mapExtend(null, s)).src = "a,b.c.d", r.delimeter = [], 
          i = e.strSplitFast(r), n = [ "a,b.c.d" ], t.identical(i, n), t.case = "stripping off", 
          (r = e.mapExtend(null, s)).src = "    a,b,c,d   ", r.delimeter = [ "," ], i = e.strSplitFast(r), 
          n = [ "    a", ",", "b", ",", "c", ",", "d   " ], t.identical(i, n), 
          /* */
          t.case = "many delimeters, delimeter on the begin", (r = e.mapExtend(null, s)).src = ".content", 
          r.delimeter = [ ".", "#" ], i = e.strSplitFast(r), n = [ "", ".", "content" ], t.identical(i, n), 
          t.case = "many delimeters, delimeter on the end", (r = e.mapExtend(null, s)).src = "content.", 
          r.delimeter = [ ".", "#" ], i = e.strSplitFast(r), n = [ "content", ".", "" ], t.identical(i, n), 
          t.case = "many delimeters having common", (r = e.mapExtend(null, s)).src = "Aa <<! <<- Bb", 
          r.delimeter = [ "->>>", "<<<-", "->>", "<<-", "!>>", "<<!", ">>", "<<", " " ], n = [ "Aa", " ", "", "<<!", "", " ", "", "<<-", "", " ", "Bb" ], 
          i = e.strSplitFast(r), t.identical(i, n), t.case = "many delimeters having common", 
          (r = e.mapExtend(null, s)).src = "Aa <<! <<- Bb", r.delimeter = [ "->>>", "<<<-", "->>", "<<-", "!>>", "<<!", ">>", "<<" ], 
          n = [ "Aa ", "<<!", " ", "<<-", " Bb" ], i = e.strSplitFast(r), t.identical(i, n), 
          t.case = "having long common", (r = e.mapExtend(null, s)).src = "Aa <<<- Bb", r.delimeter = [ "->>>", "<<<-", "->>", "<<-", "!>>", "<<!", ">>", "<<" ], 
          n = [ "Aa ", "<<<-", " Bb" ], i = e.strSplitFast(r), t.identical(i, n), t.case = "having long common 2", 
          (r = e.mapExtend(null, s)).src = "a1 a2 a3 <<<- Bb", r.delimeter = [ "->>>", "<<<-", "->>", "<<-", "!>>", "<<!", ">>", "<<", " " ], 
          n = [ "a1", " ", "a2", " ", "a3", " ", "", "<<<-", "", " ", "Bb" ], i = e.strSplitFast(r), 
          t.identical(i, n), t.case = "delimeter not exist in src", (r = e.mapExtend(null, s)).src = "a,b,c", 
          r.delimeter = [ "." ], n = [ "a,b,c" ], i = e.strSplitFast(r), t.identical(i, n), 
          /**/
          t.case = "several delimeters", (r = e.mapExtend(null, s)).src = "a ., b ., c ., d", 
          r.delimeter = [ ",", "." ], n = [ "a ", ".", "", ",", " b ", ".", "", ",", " c ", ".", "", ",", " d" ], 
          i = e.strSplitFast(r), t.identical(i, n), t.case = "one delimeters", (r = e.mapExtend(null, s)).src = "a , b , c , d", 
          r.delimeter = ",", n = [ "a ", ",", " b ", ",", " c ", ",", " d" ], i = e.strSplitFast(r), 
          t.identical(i, n), t.case = "delimeters equal src", (r = e.mapExtend(null, s)).src = ",", 
          r.delimeter = ",", n = [ "", ",", "" ], i = e.strSplitFast(r), t.identical(i, n), 
          t.case = "src is triplet of delimeter", (r = e.mapExtend(null, s)).src = ",,,", 
          r.delimeter = ",", n = [ "", ",", "", ",", "", ",", "" ], i = e.strSplitFast(r), 
          t.identical(i, n), 
          /* */
          t.case = "quoted at edges", (r = e.mapExtend(null, s)).src = '"a b" "" c"', r.delimeter = [ '"' ], 
          i = e.strSplitFast(r), n = [ "", '"', "a b", '"', " ", '"', "", '"', " c", '"', "" ], 
          t.identical(i, n), t.case = "quoted in the middle", (r = e.mapExtend(null, s)).src = '"a b" "" c', 
          r.delimeter = [ "a b", " c" ], i = e.strSplitFast(r), n = [ '"', "a b", '" ""', " c", "" ], 
          t.identical(i, n), t.case = "quoted in the middle with space first", (r = e.mapExtend(null, s)).src = '"a b" "" c', 
          r.delimeter = [ "a b", " ", " c", '"' ], i = e.strSplitFast(r), n = [ "", '"', "", "a b", "", '"', "", " ", "", '"', "", '"', "", " ", "c" ], 
          t.identical(i, n), t.case = "quoted in the middle with space last", (r = e.mapExtend(null, s)).src = '"a b" "" c', 
          r.delimeter = [ "a b", " c", '"', " " ], i = e.strSplitFast(r), n = [ "", '"', "", "a b", "", '"', "", " ", "", '"', "", '"', "", " c", "" ], 
          t.identical(i, n), t.case = "delimeter with empty string at the beginning of array", 
          (r = e.mapExtend(null, s)).src = '"a b" "" c', r.delimeter = [ "", "a b", " ", "", " c" ], 
          i = e.strSplitFast(r), n = [ '"', "", "a", "", " ", "", "b", "", '"', "", " ", "", '"', "", '"', "", " ", "", "c" ], 
          t.identical(i, n), t.case = "quoted in the middle", (r = e.mapExtend(null, s)).src = '"a b" x "" c', 
          r.delimeter = [ "a b", " ", " c", '"', "" ], i = e.strSplitFast(r), n = [ "", '"', "", "a b", "", '"', "", " ", "x", "", "", " ", "", '"', "", '"', "", " ", "c" ], 
          t.identical(i, n), s = {
            preservingEmpty: 0,
            preservingDelimeters: 1
          }
          /* */ , t.case = "empty both", (r = e.mapExtend(null, s)).src = "", r.delimeter = "", 
          i = e.strSplitFast(r), n = [], t.identical(i, n), t.case = "empty delimeter", (r = e.mapExtend(null, s)).src = "abc", 
          r.delimeter = "", i = e.strSplitFast(r), n = [ "a", "b", "c" ], t.identical(i, n), 
          t.case = "empty src", (r = e.mapExtend(null, s)).src = "", r.delimeter = "a", i = e.strSplitFast(r), 
          n = [], t.identical(i, n), t.case = "has empty element in result", (r = e.mapExtend(null, s)).src = "a b  c", 
          i = e.strSplitFast(r), n = [ "a", " ", "b", " ", " ", "c" ], t.identical(i, n), 
          t.case = "returns an array of strings", (r = e.mapExtend(null, s)).src = "test test test", 
          i = e.strSplitFast(r), n = [ "test", " ", "test", " ", "test" ], t.identical(i, n), 
          t.case = "split string into an array of strings", (r = e.mapExtend(null, s)).src = " test   test   test ", 
          i = e.strSplitFast(r), n = [ " ", "test", " ", " ", " ", "test", " ", " ", " ", "test", " " ], 
          t.identical(i, n), t.case = "split with delimeter which src does not have", (r = e.mapExtend(null, s)).src = " test   test   test ", 
          r.delimeter = "x", i = e.strSplitFast(r), n = [ " test   test   test " ], t.identical(i, n), 
          t.case = "custom delimeter", (r = e.mapExtend(null, s)).src = " test <delimteter>  test<delimteter>   test ", 
          r.delimeter = "<delimteter>", i = e.strSplitFast(r), n = [ " test ", "<delimteter>", "  test", "<delimteter>", "   test " ], 
          t.identical(i, n), t.case = "simple string, default options", (r = e.mapExtend(null, s)).src = "a b c d", 
          i = e.strSplitFast(r), n = [ "a", " ", "b", " ", "c", " ", "d" ], t.identical(i, n), 
          t.case = "arguments as map", (r = e.mapExtend(null, s)).src = "a,b,c,d", r.delimeter = ",", 
          i = e.strSplitFast(r), n = [ "a", ",", "b", ",", "c", ",", "d" ], t.identical(i, n), 
          t.case = "delimeter as array", (r = e.mapExtend(null, s)).src = "a,b.c.d", r.delimeter = [ ",", "." ], 
          i = e.strSplitFast(r), n = [ "a", ",", "b", ".", "c", ".", "d" ], t.identical(i, n), 
          t.case = "zero delimeter length", (r = e.mapExtend(null, s)).src = "a,b.c.d", r.delimeter = [], 
          i = e.strSplitFast(r), n = [ "a,b.c.d" ], t.identical(i, n), t.case = "stripping off", 
          (r = e.mapExtend(null, s)).src = "    a,b,c,d   ", r.delimeter = [ "," ], i = e.strSplitFast(r), 
          n = [ "    a", ",", "b", ",", "c", ",", "d   " ], t.identical(i, n), 
          /* */
          t.case = "many delimeters, delimeter on the begin", (r = e.mapExtend(null, s)).src = ".content", 
          r.delimeter = [ ".", "#" ], i = e.strSplitFast(r), n = [ ".", "content" ], t.identical(i, n), 
          t.case = "many delimeters, delimeter on the end", (r = e.mapExtend(null, s)).src = "content.", 
          r.delimeter = [ ".", "#" ], i = e.strSplitFast(r), n = [ "content", "." ], t.identical(i, n), 
          t.case = "many delimeters having common", (r = e.mapExtend(null, s)).src = "Aa <<! <<- Bb", 
          r.delimeter = [ "->>>", "<<<-", "->>", "<<-", "!>>", "<<!", ">>", "<<", " " ], n = [ "Aa", " ", "<<!", " ", "<<-", " ", "Bb" ], 
          i = e.strSplitFast(r), t.identical(i, n), t.case = "many delimeters having common", 
          (r = e.mapExtend(null, s)).src = "Aa <<! <<- Bb", r.delimeter = [ "->>>", "<<<-", "->>", "<<-", "!>>", "<<!", ">>", "<<" ], 
          n = [ "Aa ", "<<!", " ", "<<-", " Bb" ], i = e.strSplitFast(r), t.identical(i, n), 
          t.case = "having long common", (r = e.mapExtend(null, s)).src = "Aa <<<- Bb", r.delimeter = [ "->>>", "<<<-", "->>", "<<-", "!>>", "<<!", ">>", "<<" ], 
          n = [ "Aa ", "<<<-", " Bb" ], i = e.strSplitFast(r), t.identical(i, n), t.case = "having long common 2", 
          (r = e.mapExtend(null, s)).src = "a1 a2 a3 <<<- Bb", r.delimeter = [ "->>>", "<<<-", "->>", "<<-", "!>>", "<<!", ">>", "<<", " " ], 
          n = [ "a1", " ", "a2", " ", "a3", " ", "<<<-", " ", "Bb" ], i = e.strSplitFast(r), 
          t.identical(i, n), t.case = "delimeter not exist in src", (r = e.mapExtend(null, s)).src = "a,b,c", 
          r.delimeter = [ "." ], n = [ "a,b,c" ], i = e.strSplitFast(r), t.identical(i, n), 
          /**/
          t.case = "several delimeters", (r = e.mapExtend(null, s)).src = "a ., b ., c ., d", 
          r.delimeter = [ ",", "." ], n = [ "a ", ".", ",", " b ", ".", ",", " c ", ".", ",", " d" ], 
          i = e.strSplitFast(r), t.identical(i, n), t.case = "one delimeters", (r = e.mapExtend(null, s)).src = "a , b , c , d", 
          r.delimeter = ",", n = [ "a ", ",", " b ", ",", " c ", ",", " d" ], i = e.strSplitFast(r), 
          t.identical(i, n), t.case = "delimeters equal src", (r = e.mapExtend(null, s)).src = ",", 
          r.delimeter = ",", n = [ "," ], i = e.strSplitFast(r), t.identical(i, n), t.case = "src is triplet of delimeter", 
          (r = e.mapExtend(null, s)).src = ",,,", r.delimeter = ",", n = [ ",", ",", "," ], 
          i = e.strSplitFast(r), t.identical(i, n), 
          /* */
          t.case = "quoted at edges", (r = e.mapExtend(null, s)).src = '"a b" "" c"', r.delimeter = [ '"' ], 
          i = e.strSplitFast(r), n = [ '"', "a b", '"', " ", '"', '"', " c", '"' ], t.identical(i, n), 
          t.case = "quoted in the middle", (r = e.mapExtend(null, s)).src = '"a b" "" c', 
          r.delimeter = [ "a b", " c" ], i = e.strSplitFast(r), n = [ '"', "a b", '" ""', " c" ], 
          t.identical(i, n), t.case = "quoted in the middle with space first", (r = e.mapExtend(null, s)).src = '"a b" "" c', 
          r.delimeter = [ "a b", " ", " c", '"' ], i = e.strSplitFast(r), n = [ '"', "a b", '"', " ", '"', '"', " ", "c" ], 
          t.identical(i, n), t.case = "quoted in the middle with space last", (r = e.mapExtend(null, s)).src = '"a b" "" c', 
          r.delimeter = [ "a b", " c", '"', " " ], i = e.strSplitFast(r), n = [ '"', "a b", '"', " ", '"', '"', " c" ], 
          t.identical(i, n), t.case = "delimeter with empty string at the beginning of array", 
          (r = e.mapExtend(null, s)).src = '"a b" "" c', r.delimeter = [ "", "a b", " ", "", " c" ], 
          i = e.strSplitFast(r), n = [ '"', "a", " ", "b", '"', " ", '"', '"', " ", "c" ], 
          t.identical(i, n), t.case = "quoted in the middle", (r = e.mapExtend(null, s)).src = '"a b" x "" c', 
          r.delimeter = [ "a b", " ", " c", '"', "" ], i = e.strSplitFast(r), n = [ '"', "a b", '"', " ", "x", " ", '"', '"', " ", "c" ], 
          t.identical(i, n), t.case = "no arguments", t.shouldThrowError(function() {
            e.strSplitFast();
          }), t.case = "argument is wrong", t.shouldThrowError(function() {
            e.strSplitFast([]);
          }), t.case = "argument is wrong", t.shouldThrowError(function() {
            e.strSplitFast(13);
          }), t.case = "invalid arguments count", t.shouldThrowError(function() {
            e.strSplitFast("1", "2", "3");
          }), t.case = "invalid argument type", t.shouldThrowError(function() {
            e.strSplitFast(123);
          }), t.case = "invalid option type", t.shouldThrowError(function() {
            e.strSplitFast({
              src: 3
            });
          }), t.case = "invalid option defined", t.shouldThrowError(function() {
            e.strSplitFast({
              src: "word",
              delimeter: 0,
              left: 1
            });
          }), t.case = "no arguments", t.shouldThrowError(function() {
            e.strSplitFast();
          });
        }
        //
        ,
        strSplitFastRegexp: function strSplitFastRegexp(t) {
          t.case = "trivial";
          var i = e.strSplitFast("a b c", new RegExp(" ")), n = [ "a", " ", "b", " ", "c" ];
          t.identical(i, n), i = e.strSplitFast("abc", new RegExp("")), n = [ "a", "", "b", "", "c" ], 
          t.identical(i, n), i = e.strSplitFast("", new RegExp("")), n = [], t.identical(i, n), 
          i = e.strSplitFast("", "a"), n = [ "" ], t.identical(i, n), t.case = "returns an array of strings", 
          i = e.strSplitFast(" test <delimteter>  test<delimteter>   test ", /<delimteter>/), 
          n = [ " test ", "<delimteter>", "  test", "<delimteter>", "   test " ], t.identical(i, n);
          /*
    preservingEmpty : 1,
    preservingDelimeters : 0,
  */
          var r, s = {
            preservingEmpty: 1,
            preservingDelimeters: 0
          }
          /* */;
          t.case = "empty both", (r = e.mapExtend(null, s)).src = "", r.delimeter = new RegExp(""), 
          i = e.strSplitFast(r), n = [], t.identical(i, n), t.case = "empty delimeter", (r = e.mapExtend(null, s)).src = "abc", 
          r.delimeter = new RegExp(""), i = e.strSplitFast(r), n = [ "a", "b", "c" ], t.identical(i, n), 
          t.case = "empty src", (r = e.mapExtend(null, s)).src = "", r.delimeter = /a/, i = e.strSplitFast(r), 
          n = [ "" ], t.identical(i, n), t.case = "split with delimeter which src does not have", 
          (r = e.mapExtend(null, s)).src = " test   test   test ", r.delimeter = /x/, i = e.strSplitFast(r), 
          n = [ " test   test   test " ], t.identical(i, n), t.case = "custom delimeter", 
          (r = e.mapExtend(null, s)).src = " test <delimteter>  test<delimteter>   test ", 
          r.delimeter = /<delimteter>/, i = e.strSplitFast(r), n = [ " test ", "  test", "   test " ], 
          t.identical(i, n), t.case = "arguments as map", (r = e.mapExtend(null, s)).src = "a,b,c,d", 
          r.delimeter = /,/, i = e.strSplitFast(r), n = [ "a", "b", "c", "d" ], t.identical(i, n), 
          t.case = "delimeter as array", (r = e.mapExtend(null, s)).src = "a,b.c.d", r.delimeter = [ /,/, /\./ ], 
          i = e.strSplitFast(r), n = [ "a", "b", "c", "d" ], t.identical(i, n), t.case = "stripping off", 
          (r = e.mapExtend(null, s)).src = "    a,b,c,d   ", r.delimeter = [ /,/ ], i = e.strSplitFast(r), 
          n = [ "    a", "b", "c", "d   " ], t.identical(i, n), 
          /* */
          t.case = "many delimeters, delimeter on the begin", (r = e.mapExtend(null, s)).src = ".content", 
          r.delimeter = [ /\./, /#/ ], i = e.strSplitFast(r), n = [ "", "content" ], t.identical(i, n), 
          t.case = "many delimeters, delimeter on the end", (r = e.mapExtend(null, s)).src = "content.", 
          r.delimeter = [ /\./, /#/ ], i = e.strSplitFast(r), n = [ "content", "" ], t.identical(i, n), 
          t.case = "many delimeters having common", (r = e.mapExtend(null, s)).src = "Aa <<! <<- Bb", 
          r.delimeter = [ /->>>/, /<<<-/, /->>/, /<<-/, /!>>/, /<<!/, />>/, /<</, / / ], n = [ "Aa", "", "", "", "", "Bb" ], 
          i = e.strSplitFast(r), t.identical(i, n), t.case = "many delimeters having common", 
          (r = e.mapExtend(null, s)).src = "Aa <<! <<- Bb", r.delimeter = [ /->>>/, /<<<-/, /->>/, /<<-/, /!>>/, /<<!/, />>/, /<</ ], 
          n = [ "Aa ", " ", " Bb" ], i = e.strSplitFast(r), t.identical(i, n), t.case = "having long common", 
          (r = e.mapExtend(null, s)).src = "Aa <<<- Bb", r.delimeter = [ /->>>/, /<<<-/, /->>/, /<<-/, /!>>/, /<<!/, />>/, /<</ ], 
          n = [ "Aa ", " Bb" ], i = e.strSplitFast(r), t.identical(i, n), t.case = "having long common 2", 
          (r = e.mapExtend(null, s)).src = "a1 a2 a3 <<<- Bb", r.delimeter = [ /->>>/, /<<<-/, /->>/, /<<-/, /!>>/, /<<!/, />>/, /<</, / / ], 
          n = [ "a1", "a2", "a3", "", "", "Bb" ], i = e.strSplitFast(r), t.identical(i, n), 
          t.case = "delimeter not exist in src", (r = e.mapExtend(null, s)).src = "a,b,c", 
          r.delimeter = [ /\./ ], n = [ "a,b,c" ], i = e.strSplitFast(r), t.identical(i, n), 
          /**/
          t.case = "several delimeters", (r = e.mapExtend(null, s)).src = "a ., b ., c ., d", 
          r.delimeter = [ /,/, /\./ ], n = [ "a ", "", " b ", "", " c ", "", " d" ], i = e.strSplitFast(r), 
          t.identical(i, n), t.case = "one delimeters", (r = e.mapExtend(null, s)).src = "a , b , c , d", 
          r.delimeter = /,/, n = [ "a ", " b ", " c ", " d" ], i = e.strSplitFast(r), t.identical(i, n), 
          t.case = "delimeters equal src", (r = e.mapExtend(null, s)).src = ",", r.delimeter = /,/, 
          n = [ "", "" ], i = e.strSplitFast(r), t.identical(i, n), t.case = "src is triplet of delimeter", 
          (r = e.mapExtend(null, s)).src = ",,,", r.delimeter = /,/, n = [ "", "", "", "" ], 
          i = e.strSplitFast(r), t.identical(i, n), 
          /* */
          t.case = "quoted at edges", (r = e.mapExtend(null, s)).src = '"a b" "" c"', r.delimeter = [ /"/ ], 
          i = e.strSplitFast(r), n = [ "", "a b", " ", "", " c", "" ], t.identical(i, n), 
          t.case = "quoted in the middle", (r = e.mapExtend(null, s)).src = '"a b" "" c', 
          r.delimeter = [ /a b/, / c/ ], i = e.strSplitFast(r), n = [ '"', '" ""', "" ], t.identical(i, n), 
          t.case = "quoted in the middle with space first", (r = e.mapExtend(null, s)).src = '"a b" "" c', 
          r.delimeter = [ /a b/, / /, / c/, /"/ ], i = e.strSplitFast(r), n = [ "", "", "", "", "", "", "", "c" ], 
          t.identical(i, n), t.case = "quoted in the middle with space last", (r = e.mapExtend(null, s)).src = '"a b" "" c', 
          r.delimeter = [ /a b/, / c/, /"/, / / ], i = e.strSplitFast(r), n = [ "", "", "", "", "", "", "", "" ], 
          t.identical(i, n), t.case = "delimeter with empty string at the beginning of array", 
          (r = e.mapExtend(null, s)).src = '"a b" "" c', r.delimeter = [ new RegExp(), /a b/, / /, "", " c" ], 
          i = e.strSplitFast(r), n = [ '"', "a", " ", "b", '"', " ", '"', '"', " ", "c" ], 
          t.identical(i, n), t.case = "quoted in the middle", (r = e.mapExtend(null, s)).src = '"a b" x "" c', 
          r.delimeter = [ /a b/, / /, " c", '"', "" ], i = e.strSplitFast(r), n = [ "", "", "", "", "x", "", "", "", "", "c" ], 
          t.identical(i, n), s = {
            preservingEmpty: 0,
            preservingDelimeters: 0
          }
          /* */ , t.case = "empty both", (r = e.mapExtend(null, s)).src = "", r.delimeter = new RegExp(""), 
          i = e.strSplitFast(r), n = [], t.identical(i, n), t.case = "empty delimeter", (r = e.mapExtend(null, s)).src = "abc", 
          r.delimeter = new RegExp(""), i = e.strSplitFast(r), n = [ "a", "b", "c" ], t.identical(i, n), 
          t.case = "empty src", (r = e.mapExtend(null, s)).src = "", r.delimeter = /a/, i = e.strSplitFast(r), 
          n = [], t.identical(i, n), t.case = "split with delimeter which src does not have", 
          (r = e.mapExtend(null, s)).src = " test   test   test ", r.delimeter = /x/, i = e.strSplitFast(r), 
          n = [ " test   test   test " ], t.identical(i, n), t.case = "custom delimeter", 
          (r = e.mapExtend(null, s)).src = " test <delimteter>  test<delimteter>   test ", 
          r.delimeter = /<delimteter>/, i = e.strSplitFast(r), n = [ " test ", "  test", "   test " ], 
          t.identical(i, n), t.case = "arguments as map", (r = e.mapExtend(null, s)).src = "a,b,c,d", 
          r.delimeter = /,/, i = e.strSplitFast(r), n = [ "a", "b", "c", "d" ], t.identical(i, n), 
          t.case = "delimeter as array", (r = e.mapExtend(null, s)).src = "a,b.c.d", r.delimeter = [ /,/, /\./ ], 
          i = e.strSplitFast(r), n = [ "a", "b", "c", "d" ], t.identical(i, n), t.case = "stripping off", 
          (r = e.mapExtend(null, s)).src = "    a,b,c,d   ", r.delimeter = [ /,/ ], i = e.strSplitFast(r), 
          n = [ "    a", "b", "c", "d   " ], t.identical(i, n), 
          /* */
          t.case = "many delimeters, delimeter on the begin", (r = e.mapExtend(null, s)).src = ".content", 
          r.delimeter = [ ".", /#/ ], i = e.strSplitFast(r), n = [ "content" ], t.identical(i, n), 
          t.case = "many delimeters, delimeter on the end", (r = e.mapExtend(null, s)).src = "content.", 
          r.delimeter = [ ".", /#/ ], i = e.strSplitFast(r), n = [ "content" ], t.identical(i, n), 
          t.case = "many delimeters having common", (r = e.mapExtend(null, s)).src = "Aa <<! <<- Bb", 
          r.delimeter = [ /->>>/, /<<<-/, /->>/, /<<-/, /!>>/, /<<!/, />>/, /<</, / / ], n = [ "Aa", "Bb" ], 
          i = e.strSplitFast(r), t.identical(i, n), t.case = "many delimeters having common", 
          (r = e.mapExtend(null, s)).src = "Aa <<! <<- Bb", r.delimeter = [ /->>>/, /<<<-/, /->>/, /<<-/, /!>>/, /<<!/, />>/, /<</ ], 
          n = [ "Aa ", " ", " Bb" ], i = e.strSplitFast(r), t.identical(i, n), t.case = "having long common", 
          (r = e.mapExtend(null, s)).src = "Aa <<<- Bb", r.delimeter = [ /->>>/, /<<<-/, /->>/, /<<-/, /!>>/, /<<!/, />>/, /<</ ], 
          n = [ "Aa ", " Bb" ], i = e.strSplitFast(r), t.identical(i, n), t.case = "having long common 2", 
          (r = e.mapExtend(null, s)).src = "a1 a2 a3 <<<- Bb", r.delimeter = [ /->>>/, /<<<-/, /->>/, /<<-/, /!>>/, /<<!/, />>/, /<</, / / ], 
          n = [ "a1", "a2", "a3", "Bb" ], i = e.strSplitFast(r), t.identical(i, n), t.case = "delimeter not exist in src", 
          (r = e.mapExtend(null, s)).src = "a,b,c", r.delimeter = [ /\./ ], n = [ "a,b,c" ], 
          i = e.strSplitFast(r), t.identical(i, n), 
          /**/
          t.case = "several delimeters", (r = e.mapExtend(null, s)).src = "a ., b ., c ., d", 
          r.delimeter = [ /,/, /\./ ], n = [ "a ", " b ", " c ", " d" ], i = e.strSplitFast(r), 
          t.identical(i, n), t.case = "one delimeters", (r = e.mapExtend(null, s)).src = "a , b , c , d", 
          r.delimeter = /,/, n = [ "a ", " b ", " c ", " d" ], i = e.strSplitFast(r), t.identical(i, n), 
          t.case = "delimeters equal src", (r = e.mapExtend(null, s)).src = ",", r.delimeter = /,/, 
          n = [], i = e.strSplitFast(r), t.identical(i, n), t.case = "src is triplet of delimeter", 
          (r = e.mapExtend(null, s)).src = ",,,", r.delimeter = /,/, n = [], i = e.strSplitFast(r), 
          t.identical(i, n), 
          /* */
          t.case = "quoted at edges", (r = e.mapExtend(null, s)).src = '"a b" "" c"', r.delimeter = [ /"/ ], 
          i = e.strSplitFast(r), n = [ "a b", " ", " c" ], t.identical(i, n), t.case = "quoted in the middle", 
          (r = e.mapExtend(null, s)).src = '"a b" "" c', r.delimeter = [ /a b/, / c/ ], i = e.strSplitFast(r), 
          n = [ '"', '" ""' ], t.identical(i, n), t.case = "quoted in the middle with space first", 
          (r = e.mapExtend(null, s)).src = '"a b" "" c', r.delimeter = [ /a b/, / /, / c/, /"/ ], 
          i = e.strSplitFast(r), n = [ "c" ], t.identical(i, n), t.case = "quoted in the middle with space last", 
          (r = e.mapExtend(null, s)).src = '"a b" "" c', r.delimeter = [ /a b/, / c/, /"/, / / ], 
          i = e.strSplitFast(r), n = [], t.identical(i, n), t.case = "delimeter with empty string at the beginning of array", 
          (r = e.mapExtend(null, s)).src = '"a b" "" c', r.delimeter = [ "", /a b/, / /, new RegExp(""), / c/ ], 
          i = e.strSplitFast(r), n = [ '"', "a", " ", "b", '"', " ", '"', '"', " ", "c" ], 
          t.identical(i, n), t.case = "quoted in the middle", (r = e.mapExtend(null, s)).src = '"a b" x "" c', 
          r.delimeter = [ /a b/, / /, / c/, /"/, "" ], i = e.strSplitFast(r), n = [ "x", "c" ], 
          t.identical(i, n), s = {
            preservingEmpty: 1,
            preservingDelimeters: 1
          }
          /* */ , t.case = "empty both", (r = e.mapExtend(null, s)).src = "", r.delimeter = new RegExp(""), 
          i = e.strSplitFast(r), n = [], t.identical(i, n), t.case = "empty delimeter", (r = e.mapExtend(null, s)).src = "abc", 
          r.delimeter = new RegExp(""), i = e.strSplitFast(r), n = [ "a", "", "b", "", "c" ], 
          t.identical(i, n), t.case = "empty src", (r = e.mapExtend(null, s)).src = "", r.delimeter = /a/, 
          i = e.strSplitFast(r), n = [ "" ], t.identical(i, n), t.case = "split with delimeter which src does not have", 
          (r = e.mapExtend(null, s)).src = " test   test   test ", r.delimeter = /x/, i = e.strSplitFast(r), 
          n = [ " test   test   test " ], t.identical(i, n), t.case = "custom delimeter", 
          (r = e.mapExtend(null, s)).src = " test <delimteter>  test<delimteter>   test ", 
          r.delimeter = /<delimteter>/, i = e.strSplitFast(r), n = [ " test ", "<delimteter>", "  test", "<delimteter>", "   test " ], 
          t.identical(i, n), t.case = "arguments as map", (r = e.mapExtend(null, s)).src = "a,b,c,d", 
          r.delimeter = /,/, i = e.strSplitFast(r), n = [ "a", ",", "b", ",", "c", ",", "d" ], 
          t.identical(i, n), t.case = "delimeter as array", (r = e.mapExtend(null, s)).src = "a,b.c.d", 
          r.delimeter = [ /,/, /\./ ], i = e.strSplitFast(r), n = [ "a", ",", "b", ".", "c", ".", "d" ], 
          t.identical(i, n), t.case = "zero delimeter length", (r = e.mapExtend(null, s)).src = "a,b.c.d", 
          r.delimeter = [], i = e.strSplitFast(r), n = [ "a,b.c.d" ], t.identical(i, n), t.case = "stripping off", 
          (r = e.mapExtend(null, s)).src = "    a,b,c,d   ", r.delimeter = [ /,/ ], i = e.strSplitFast(r), 
          n = [ "    a", ",", "b", ",", "c", ",", "d   " ], t.identical(i, n), 
          /* */
          t.case = "many delimeters, delimeter on the begin", (r = e.mapExtend(null, s)).src = ".content", 
          r.delimeter = [ ".", /#/ ], i = e.strSplitFast(r), n = [ "", ".", "content" ], t.identical(i, n), 
          t.case = "many delimeters, delimeter on the end", (r = e.mapExtend(null, s)).src = "content.", 
          r.delimeter = [ ".", /#/ ], i = e.strSplitFast(r), n = [ "content", ".", "" ], t.identical(i, n), 
          t.case = "many delimeters having common", (r = e.mapExtend(null, s)).src = "Aa <<! <<- Bb", 
          r.delimeter = [ /->>>/, /<<<-/, /->>/, /<<-/, /!>>/, /<<!/, />>/, /<</, / / ], n = [ "Aa", " ", "", "<<!", "", " ", "", "<<-", "", " ", "Bb" ], 
          i = e.strSplitFast(r), t.identical(i, n), t.case = "many delimeters having common", 
          (r = e.mapExtend(null, s)).src = "Aa <<! <<- Bb", r.delimeter = [ /->>>/, /<<<-/, /->>/, /<<-/, /!>>/, /<<!/, />>/, /<</ ], 
          n = [ "Aa ", "<<!", " ", "<<-", " Bb" ], i = e.strSplitFast(r), t.identical(i, n), 
          t.case = "having long common", (r = e.mapExtend(null, s)).src = "Aa <<<- Bb", r.delimeter = [ /->>>/, /<<<-/, /->>/, /<<-/, /!>>/, /<<!/, />>/, /<</ ], 
          n = [ "Aa ", "<<<-", " Bb" ], i = e.strSplitFast(r), t.identical(i, n), t.case = "having long common 2", 
          (r = e.mapExtend(null, s)).src = "a1 a2 a3 <<<- Bb", r.delimeter = [ /->>>/, /<<<-/, /->>/, /<<-/, /!>>/, /<<!/, />>/, /<</, / / ], 
          n = [ "a1", " ", "a2", " ", "a3", " ", "", "<<<-", "", " ", "Bb" ], i = e.strSplitFast(r), 
          t.identical(i, n), t.case = "delimeter not exist in src", (r = e.mapExtend(null, s)).src = "a,b,c", 
          r.delimeter = [ /\./ ], n = [ "a,b,c" ], i = e.strSplitFast(r), t.identical(i, n), 
          /**/
          t.case = "several delimeters", (r = e.mapExtend(null, s)).src = "a ., b ., c ., d", 
          r.delimeter = [ /,/, /\./ ], n = [ "a ", ".", "", ",", " b ", ".", "", ",", " c ", ".", "", ",", " d" ], 
          i = e.strSplitFast(r), t.identical(i, n), t.case = "one delimeters", (r = e.mapExtend(null, s)).src = "a , b , c , d", 
          r.delimeter = /,/, n = [ "a ", ",", " b ", ",", " c ", ",", " d" ], i = e.strSplitFast(r), 
          t.identical(i, n), t.case = "delimeters equal src", (r = e.mapExtend(null, s)).src = ",", 
          r.delimeter = /,/, n = [ "", ",", "" ], i = e.strSplitFast(r), t.identical(i, n), 
          t.case = "src is triplet of delimeter", (r = e.mapExtend(null, s)).src = ",,,", 
          r.delimeter = /,/, n = [ "", ",", "", ",", "", ",", "" ], i = e.strSplitFast(r), 
          t.identical(i, n), 
          /* */
          t.case = "quoted at edges", (r = e.mapExtend(null, s)).src = '"a b" "" c"', r.delimeter = [ /"/ ], 
          i = e.strSplitFast(r), n = [ "", '"', "a b", '"', " ", '"', "", '"', " c", '"', "" ], 
          t.identical(i, n), t.case = "quoted in the middle", (r = e.mapExtend(null, s)).src = '"a b" "" c', 
          r.delimeter = [ /a b/, / c/ ], i = e.strSplitFast(r), n = [ '"', "a b", '" ""', " c", "" ], 
          t.identical(i, n), t.case = "quoted in the middle with space first", (r = e.mapExtend(null, s)).src = '"a b" "" c', 
          r.delimeter = [ /a b/, / /, / c/, /"/ ], i = e.strSplitFast(r), n = [ "", '"', "", "a b", "", '"', "", " ", "", '"', "", '"', "", " ", "c" ], 
          t.identical(i, n), t.case = "quoted in the middle with space last", (r = e.mapExtend(null, s)).src = '"a b" "" c', 
          r.delimeter = [ /a b/, / c/, /"/, / / ], i = e.strSplitFast(r), n = [ "", '"', "", "a b", "", '"', "", " ", "", '"', "", '"', "", " c", "" ], 
          t.identical(i, n), t.case = "delimeter with empty string at the beginning of array", 
          (r = e.mapExtend(null, s)).src = '"a b" "" c', r.delimeter = [ "", /a b/, / /, new RegExp(""), / c/ ], 
          i = e.strSplitFast(r), n = [ '"', "", "a", "", " ", "", "b", "", '"', "", " ", "", '"', "", '"', "", " ", "", "c" ], 
          t.identical(i, n), t.case = "quoted in the middle", (r = e.mapExtend(null, s)).src = '"a b" x "" c', 
          r.delimeter = [ /a b/, / /, / c/, /"/, "" ], i = e.strSplitFast(r), n = [ "", '"', "", "a b", "", '"', "", " ", "x", "", "", " ", "", '"', "", '"', "", " ", "c" ], 
          t.identical(i, n), s = {
            preservingEmpty: 0,
            preservingDelimeters: 1
          }
          /* */ , t.case = "empty both", (r = e.mapExtend(null, s)).src = "", r.delimeter = new RegExp(""), 
          i = e.strSplitFast(r), n = [], t.identical(i, n), t.case = "empty delimeter", (r = e.mapExtend(null, s)).src = "abc", 
          r.delimeter = new RegExp(""), i = e.strSplitFast(r), n = [ "a", "b", "c" ], t.identical(i, n), 
          t.case = "empty src", (r = e.mapExtend(null, s)).src = "", r.delimeter = /a/, i = e.strSplitFast(r), 
          n = [], t.identical(i, n), t.case = "has empty element in result", (r = e.mapExtend(null, s)).src = "a b  c", 
          i = e.strSplitFast(r), n = [ "a", " ", "b", " ", " ", "c" ], t.identical(i, n), 
          t.case = "returns an array of strings", (r = e.mapExtend(null, s)).src = "test test test", 
          i = e.strSplitFast(r), n = [ "test", " ", "test", " ", "test" ], t.identical(i, n), 
          t.case = "split string into an array of strings", (r = e.mapExtend(null, s)).src = " test   test   test ", 
          i = e.strSplitFast(r), n = [ " ", "test", " ", " ", " ", "test", " ", " ", " ", "test", " " ], 
          t.identical(i, n), t.case = "split with delimeter which src does not have", (r = e.mapExtend(null, s)).src = " test   test   test ", 
          r.delimeter = /x/, i = e.strSplitFast(r), n = [ " test   test   test " ], t.identical(i, n), 
          t.case = "custom delimeter", (r = e.mapExtend(null, s)).src = " test <delimteter>  test<delimteter>   test ", 
          r.delimeter = /<delimteter>/, i = e.strSplitFast(r), n = [ " test ", "<delimteter>", "  test", "<delimteter>", "   test " ], 
          t.identical(i, n), t.case = "simple string, default options", (r = e.mapExtend(null, s)).src = "a b c d", 
          i = e.strSplitFast(r), n = [ "a", " ", "b", " ", "c", " ", "d" ], t.identical(i, n), 
          t.case = "arguments as map", (r = e.mapExtend(null, s)).src = "a,b,c,d", r.delimeter = /,/, 
          i = e.strSplitFast(r), n = [ "a", ",", "b", ",", "c", ",", "d" ], t.identical(i, n), 
          t.case = "delimeter as array", (r = e.mapExtend(null, s)).src = "a,b.c.d", r.delimeter = [ /,/, /\./ ], 
          i = e.strSplitFast(r), n = [ "a", ",", "b", ".", "c", ".", "d" ], t.identical(i, n), 
          t.case = "zero delimeter length", (r = e.mapExtend(null, s)).src = "a,b.c.d", r.delimeter = [], 
          i = e.strSplitFast(r), n = [ "a,b.c.d" ], t.identical(i, n), t.case = "stripping off", 
          (r = e.mapExtend(null, s)).src = "    a,b,c,d   ", r.delimeter = [ /,/ ], i = e.strSplitFast(r), 
          n = [ "    a", ",", "b", ",", "c", ",", "d   " ], t.identical(i, n), 
          /* */
          t.case = "many delimeters, delimeter on the begin", (r = e.mapExtend(null, s)).src = ".content", 
          r.delimeter = [ ".", /#/ ], i = e.strSplitFast(r), n = [ ".", "content" ], t.identical(i, n), 
          t.case = "many delimeters, delimeter on the end", (r = e.mapExtend(null, s)).src = "content.", 
          r.delimeter = [ ".", /#/ ], i = e.strSplitFast(r), n = [ "content", "." ], t.identical(i, n), 
          t.case = "many delimeters having common", (r = e.mapExtend(null, s)).src = "Aa <<! <<- Bb", 
          r.delimeter = [ /->>>/, /<<<-/, /->>/, /<<-/, /!>>/, /<<!/, />>/, /<</, / / ], n = [ "Aa", " ", "<<!", " ", "<<-", " ", "Bb" ], 
          i = e.strSplitFast(r), t.identical(i, n), t.case = "many delimeters having common", 
          (r = e.mapExtend(null, s)).src = "Aa <<! <<- Bb", r.delimeter = [ /->>>/, /<<<-/, /->>/, /<<-/, /!>>/, /<<!/, />>/, /<</ ], 
          n = [ "Aa ", "<<!", " ", "<<-", " Bb" ], i = e.strSplitFast(r), t.identical(i, n), 
          t.case = "having long common", (r = e.mapExtend(null, s)).src = "Aa <<<- Bb", r.delimeter = [ /->>>/, /<<<-/, /->>/, /<<-/, /!>>/, /<<!/, />>/, /<</ ], 
          n = [ "Aa ", "<<<-", " Bb" ], i = e.strSplitFast(r), t.identical(i, n), t.case = "having long common 2", 
          (r = e.mapExtend(null, s)).src = "a1 a2 a3 <<<- Bb", r.delimeter = [ /->>>/, /<<<-/, /->>/, /<<-/, /!>>/, /<<!/, />>/, /<</, / / ], 
          n = [ "a1", " ", "a2", " ", "a3", " ", "<<<-", " ", "Bb" ], i = e.strSplitFast(r), 
          t.identical(i, n), t.case = "delimeter not exist in src", (r = e.mapExtend(null, s)).src = "a,b,c", 
          r.delimeter = [ /\./ ], n = [ "a,b,c" ], i = e.strSplitFast(r), t.identical(i, n), 
          /**/
          t.case = "several delimeters", (r = e.mapExtend(null, s)).src = "a ., b ., c ., d", 
          r.delimeter = [ /,/, /\./ ], n = [ "a ", ".", ",", " b ", ".", ",", " c ", ".", ",", " d" ], 
          i = e.strSplitFast(r), t.identical(i, n), t.case = "one delimeters", (r = e.mapExtend(null, s)).src = "a , b , c , d", 
          r.delimeter = /,/, n = [ "a ", ",", " b ", ",", " c ", ",", " d" ], i = e.strSplitFast(r), 
          t.identical(i, n), t.case = "delimeters equal src", (r = e.mapExtend(null, s)).src = ",", 
          r.delimeter = /,/, n = [ "," ], i = e.strSplitFast(r), t.identical(i, n), t.case = "src is triplet of delimeter", 
          (r = e.mapExtend(null, s)).src = ",,,", r.delimeter = /,/, n = [ ",", ",", "," ], 
          i = e.strSplitFast(r), t.identical(i, n), 
          /* */
          t.case = "quoted at edges", (r = e.mapExtend(null, s)).src = '"a b" "" c"', r.delimeter = [ /"/ ], 
          i = e.strSplitFast(r), n = [ '"', "a b", '"', " ", '"', '"', " c", '"' ], t.identical(i, n), 
          t.case = "quoted in the middle", (r = e.mapExtend(null, s)).src = '"a b" "" c', 
          r.delimeter = [ /a b/, / c/ ], i = e.strSplitFast(r), n = [ '"', "a b", '" ""', " c" ], 
          t.identical(i, n), t.case = "quoted in the middle with space first", (r = e.mapExtend(null, s)).src = '"a b" "" c', 
          r.delimeter = [ /a b/, / /, / c/, /"/ ], i = e.strSplitFast(r), n = [ '"', "a b", '"', " ", '"', '"', " ", "c" ], 
          t.identical(i, n), t.case = "quoted in the middle with space last", (r = e.mapExtend(null, s)).src = '"a b" "" c', 
          r.delimeter = [ /a b/, / c/, /"/, / / ], i = e.strSplitFast(r), n = [ '"', "a b", '"', " ", '"', '"', " c" ], 
          t.identical(i, n), t.case = "delimeter with empty string at the beginning of array", 
          (r = e.mapExtend(null, s)).src = '"a b" "" c', r.delimeter = [ "", /a b/, / /, new RegExp(""), / c/ ], 
          i = e.strSplitFast(r), n = [ '"', "a", " ", "b", '"', " ", '"', '"', " ", "c" ], 
          t.identical(i, n), t.case = "quoted in the middle", (r = e.mapExtend(null, s)).src = '"a b" x "" c', 
          r.delimeter = [ /a b/, / /, / c/, /"/, "" ], i = e.strSplitFast(r), n = [ '"', "a b", '"', " ", "x", " ", '"', '"', " ", "c" ], 
          t.identical(i, n), t.case = "invalid arguments count", t.shouldThrowError(function() {
            e.strSplitFast(/1/, /2/, "3");
          });
        }
        //
        ,
        strSplit: function strSplit(t) {
          /* - */
          t.open("empty");
          var i = e.strSplit("", ""), n = [];
          t.identical(i, n), i = e.strSplit("abc", ""), n = [ "a", "", "b", "", "c" ], t.identical(i, n), 
          i = e.strSplit({
            src: "abc",
            delimeter: "",
            preservingEmpty: 1,
            preservingDelimeters: 1,
            stripping: 0,
            quoting: 0
          }), n = [ "a", "", "b", "", "c" ], t.identical(i, n), i = e.strSplit({
            src: "abc",
            delimeter: "",
            preservingEmpty: 1,
            preservingDelimeters: 0,
            stripping: 0,
            quoting: 0
          }), n = [ "a", "b", "c" ], t.identical(i, n), i = e.strSplit({
            src: "abc",
            delimeter: "",
            preservingEmpty: 0,
            preservingDelimeters: 0,
            stripping: 0,
            quoting: 0
          }), n = [ "a", "b", "c" ], t.identical(i, n), i = e.strSplit({
            src: "abc",
            delimeter: "",
            preservingEmpty: 0,
            preservingDelimeters: 0,
            stripping: 0,
            quoting: 1
          }), n = [ "a", "b", "c" ], t.identical(i, n), i = e.strSplit({
            src: "abc",
            delimeter: "",
            preservingEmpty: 0,
            preservingDelimeters: 0,
            stripping: 1,
            quoting: 0
          }), n = [ "a", "b", "c" ], t.identical(i, n), i = e.strSplit({
            src: "abc",
            delimeter: "",
            preservingEmpty: 0,
            preservingDelimeters: 0,
            stripping: 1,
            quoting: 1
          }), n = [ "a", "b", "c" ], t.identical(i, n), n = [ "a", "b", "c" ], t.identical(i, n), 
          i = e.strSplit("", "a"), n = [ "" ], t.identical(i, n), t.close("empty"), 
          /* - */
          t.open("trivial"), i = e.strSplit("test test test"), n = [ "test", "", "test", "", "test" ], 
          t.identical(i, n), i = e.strSplit(" test   test   test "), n = [ "", "", "test", "", "", "", "", "", "test", "", "", "", "", "", "test", "", "" ], 
          t.identical(i, n), i = e.strSplit(" test   test   test ", "something"), n = [ "test   test   test" ], 
          t.identical(i, n), i = e.strSplit(" test <delimteter>  test<delimteter>   test ", "<delimteter>"), 
          n = [ "test", "<delimteter>", "test", "<delimteter>", "test" ], t.identical(i, n), 
          i = e.strSplit("a b c d"), n = [ "a", "", "b", "", "c", "", "d" ], t.identical(i, n), 
          t.close("trivial"), 
          /* - */
          t.open("trivial, pe:0"), i = e.strSplit({
            src: "test test test",
            preservingEmpty: 0
          }), n = [ "test", "test", "test" ], t.identical(i, n), i = e.strSplit({
            src: " test   test   test ",
            preservingEmpty: 0
          }), n = [ "test", "test", "test" ], t.identical(i, n), i = e.strSplit({
            src: " test   test   test ",
            delimeter: "something",
            preservingEmpty: 0
          }), n = [ "test   test   test" ], t.identical(i, n), i = e.strSplit({
            src: " test <delimteter>  test<delimteter>   test ",
            delimeter: "<delimteter>",
            preservingEmpty: 0
          }), n = [ "test", "<delimteter>", "test", "<delimteter>", "test" ], t.identical(i, n), 
          i = e.strSplit({
            src: "a b c d",
            preservingEmpty: 0
          }), n = [ "a", "b", "c", "d" ], t.identical(i, n), t.close("trivial, pe:0"), 
          /* - */
          t.open('d:" " trivial'), t.case = " space at the beginning", i = e.strSplit(" aa b#b cc", " "), 
          n = [ "", "", "aa", "", "b#b", "", "cc" ], t.identical(i, n), t.case = "space in the end", 
          i = e.strSplit("aa b#b cc ", " "), n = [ "aa", "", "b#b", "", "cc", "", "" ], t.identical(i, n), 
          t.case = "space on the beginning and the end", i = e.strSplit(" aa b#b cc ", " "), 
          n = [ "", "", "aa", "", "b#b", "", "cc", "", "" ], t.identical(i, n), t.close('d:" " trivial'), 
          /* - */
          t.open('d:"#" trivial'), t.case = " space at the beginning", i = e.strSplit(" aa b#b cc", "#"), 
          n = [ "aa b", "#", "b cc" ], t.identical(i, n), t.case = "space in the end", i = e.strSplit("aa b#b cc ", "#"), 
          n = [ "aa b", "#", "b cc" ], t.identical(i, n), t.case = "space on the beginning and the end", 
          i = e.strSplit(" aa b#b cc ", "#"), n = [ "aa b", "#", "b cc" ], t.identical(i, n), 
          t.close('d:"#" trivial'), 
          /* - */
          t.open("s:1 q:0 pe:0");
          var r = {
            stripping: 1,
            quoting: 0,
            preservingEmpty: 0
          };
          t.case = "empty both", (a = e.mapExtend(null, r)).src = "", a.delimeter = "", i = e.strSplit(a), 
          n = [], t.identical(i, n), t.case = "empty delimeter", (a = e.mapExtend(null, r)).src = "abc", 
          a.delimeter = "", i = e.strSplit(a), n = [ "a", "b", "c" ], t.identical(i, n), t.case = "empty src", 
          (a = e.mapExtend(null, r)).src = "", a.delimeter = "a", i = e.strSplit(a), n = [], 
          t.identical(i, n), t.case = "has empty element in result", (a = e.mapExtend(null, r)).src = "a b  c", 
          i = e.strSplit(a), n = [ "a", "b", "c" ], t.identical(i, n), t.case = "returns an array of strings", 
          (a = e.mapExtend(null, r)).src = "test test test", i = e.strSplit(a), n = [ "test", "test", "test" ], 
          t.identical(i, n), t.case = "split string into an array of strings", (a = e.mapExtend(null, r)).src = " test   test   test ", 
          i = e.strSplit(a), n = [ "test", "test", "test" ], t.identical(i, n), t.case = "split with delimeter which src does not have", 
          (a = e.mapExtend(null, r)).src = " test   test   test ", a.delimeter = "x", i = e.strSplit(a), 
          n = [ "test   test   test" ], t.identical(i, n), t.case = "custom delimeter", (a = e.mapExtend(null, r)).src = " test <delimteter>  test<delimteter>   test ", 
          a.delimeter = "<delimteter>", i = e.strSplit(a), n = [ "test", "<delimteter>", "test", "<delimteter>", "test" ], 
          t.identical(i, n), t.case = "simple string, default options", (a = e.mapExtend(null, r)).src = "a b c d", 
          i = e.strSplit(a), n = [ "a", "b", "c", "d" ], t.identical(i, n), t.case = "arguments as map", 
          (a = e.mapExtend(null, r)).src = "a,b,c,d", a.delimeter = ",", i = e.strSplit(a), 
          n = [ "a", ",", "b", ",", "c", ",", "d" ], t.identical(i, n), t.case = "delimeter as array", 
          (a = e.mapExtend(null, r)).src = "a,b.c.d", a.delimeter = [ ",", "." ], i = e.strSplit(a), 
          n = [ "a", ",", "b", ".", "c", ".", "d" ], t.identical(i, n), t.case = "zero delimeter length", 
          (a = e.mapExtend(null, r)).src = "a,b.c.d", a.delimeter = [], i = e.strSplit(a), 
          n = [ "a,b.c.d" ], t.identical(i, n), t.case = "stripping off", (a = e.mapExtend(null, r)).src = "    a,b,c,d   ", 
          a.delimeter = [ "," ], i = e.strSplit(a), n = [ "a", ",", "b", ",", "c", ",", "d" ], 
          t.identical(i, n), 
          /* */
          t.case = "many delimeters, delimeter on the begin", (a = e.mapExtend(null, r)).src = ".content", 
          a.delimeter = [ ".", "#" ], i = e.strSplit(a), n = [ ".", "content" ], t.identical(i, n), 
          t.case = "many delimeters, delimeter on the end", (a = e.mapExtend(null, r)).src = "content.", 
          a.delimeter = [ ".", "#" ], i = e.strSplit(a), n = [ "content", "." ], t.identical(i, n), 
          t.case = "many delimeters having common", (a = e.mapExtend(null, r)).src = "Aa <<! <<- Bb", 
          a.delimeter = [ "->>>", "<<<-", "->>", "<<-", "!>>", "<<!", ">>", "<<", " " ], n = [ "Aa", "<<!", "<<-", "Bb" ], 
          i = e.strSplit(a), t.identical(i, n), t.case = "many delimeters having common", 
          (a = e.mapExtend(null, r)).src = "Aa <<! <<- Bb", a.delimeter = [ "->>>", "<<<-", "->>", "<<-", "!>>", "<<!", ">>", "<<" ], 
          n = [ "Aa", "<<!", "<<-", "Bb" ], i = e.strSplit(a), t.identical(i, n), t.case = "having long common", 
          (a = e.mapExtend(null, r)).src = "Aa <<<- Bb", a.delimeter = [ "->>>", "<<<-", "->>", "<<-", "!>>", "<<!", ">>", "<<" ], 
          n = [ "Aa", "<<<-", "Bb" ], i = e.strSplit(a), t.identical(i, n), t.case = "having long common 2", 
          (a = e.mapExtend(null, r)).src = "a1 a2 a3 <<<- Bb", a.delimeter = [ "->>>", "<<<-", "->>", "<<-", "!>>", "<<!", ">>", "<<", " " ], 
          n = [ "a1", "a2", "a3", "<<<-", "Bb" ], i = e.strSplit(a), t.identical(i, n), t.case = "delimeter not exist in src", 
          (a = e.mapExtend(null, r)).src = "a,b,c", a.delimeter = [ "." ], n = [ "a,b,c" ], 
          i = e.strSplit(a), t.identical(i, n), 
          /* */
          t.case = "several delimeters", (a = e.mapExtend(null, r)).src = "a ., b ., c ., d", 
          a.delimeter = [ ",", "." ], n = [ "a", ".", ",", "b", ".", ",", "c", ".", ",", "d" ], 
          i = e.strSplit(a), t.identical(i, n), t.case = "one delimeters", (a = e.mapExtend(null, r)).src = "a , b , c , d", 
          a.delimeter = ",", n = [ "a", ",", "b", ",", "c", ",", "d" ], i = e.strSplit(a), 
          t.identical(i, n), t.case = "delimeters equal src", (a = e.mapExtend(null, r)).src = ",", 
          a.delimeter = ",", n = [ "," ], i = e.strSplit(a), t.identical(i, n), t.case = "src is triplet of delimeter", 
          (a = e.mapExtend(null, r)).src = ",,,", a.delimeter = ",", n = [ ",", ",", "," ], 
          i = e.strSplit(a), t.identical(i, n), 
          /* */
          t.case = "quoted at edges", (a = e.mapExtend(null, r)).src = '"a b" "" c"', a.delimeter = [ '"' ], 
          i = e.strSplit(a), n = [ '"', "a b", '"', '"', '"', "c", '"' ], t.identical(i, n), 
          t.case = "quoted in the middle", (a = e.mapExtend(null, r)).src = '"a b" "" c', 
          a.delimeter = [ "a b", " c" ], i = e.strSplit(a), n = [ '"', "a b", '" ""', "c" ], 
          t.identical(i, n), t.case = "quoted in the middle with space first", (a = e.mapExtend(null, r)).src = '"a b" "" c', 
          a.delimeter = [ "a b", " ", " c", '"' ], i = e.strSplit(a), n = [ '"', "a b", '"', '"', '"', "c" ], 
          t.identical(i, n), t.case = "quoted in the middle with space last", (a = e.mapExtend(null, r)).src = '"a b" "" c', 
          a.delimeter = [ "a b", " c", '"', " " ], i = e.strSplit(a), n = [ '"', "a b", '"', '"', '"', "c" ], 
          t.identical(i, n), t.case = "delimeter with empty string at the beginning of array", 
          (a = e.mapExtend(null, r)).src = '"a b" "" c', a.delimeter = [ "", "a b", " ", "", " c" ], 
          i = e.strSplit(a), n = [ '"', "a", "b", '"', '"', '"', "c" ], t.identical(i, n), 
          t.case = "quoted in the middle", (a = e.mapExtend(null, r)).src = '"a b" x "" c', 
          a.delimeter = [ "a b", " ", " c", '"', "" ], i = e.strSplit(a), n = [ '"', "a b", '"', "x", '"', '"', "c" ], 
          t.identical(i, n), t.close("s:1 q:0 pe:0"), 
          /* - */
          t.open("s:1 q:0 pe:1"), r = {
            stripping: 1,
            quoting: 0,
            preservingEmpty: 1
          }, t.case = "empty both", (a = e.mapExtend(null, r)).src = "", a.delimeter = "", 
          i = e.strSplit(a), n = [], t.identical(i, n), t.case = "empty delimeter", (a = e.mapExtend(null, r)).src = "abc", 
          a.delimeter = "", i = e.strSplit(a), n = [ "a", "", "b", "", "c" ], t.identical(i, n), 
          t.case = "empty src", (a = e.mapExtend(null, r)).src = "", a.delimeter = "a", i = e.strSplit(a), 
          n = [ "" ], t.identical(i, n), t.case = "has empty element in result", (a = e.mapExtend(null, r)).src = "a b  c", 
          i = e.strSplit(a), n = [ "a", "", "b", "", "", "", "c" ], t.identical(i, n), t.case = "returns an array of strings", 
          (a = e.mapExtend(null, r)).src = "test test test", i = e.strSplit(a), n = [ "test", "", "test", "", "test" ], 
          t.identical(i, n), t.case = "split string into an array of strings", (a = e.mapExtend(null, r)).src = " test   test   test ", 
          i = e.strSplit(a), n = [ "", "", "test", "", "", "", "", "", "test", "", "", "", "", "", "test", "", "" ], 
          t.identical(i, n), t.case = "split with delimeter which src does not have", (a = e.mapExtend(null, r)).src = " test   test   test ", 
          a.delimeter = "x", i = e.strSplit(a), n = [ "test   test   test" ], t.identical(i, n), 
          t.case = "custom delimeter", (a = e.mapExtend(null, r)).src = " test <delimteter>  test<delimteter>   test ", 
          a.delimeter = "<delimteter>", i = e.strSplit(a), n = [ "test", "<delimteter>", "test", "<delimteter>", "test" ], 
          t.identical(i, n), t.case = "simple string, default options", (a = e.mapExtend(null, r)).src = "a b c d", 
          i = e.strSplit(a), n = [ "a", "", "b", "", "c", "", "d" ], t.identical(i, n), t.case = "arguments as map", 
          (a = e.mapExtend(null, r)).src = "a,b,c,d", a.delimeter = ",", i = e.strSplit(a), 
          n = [ "a", ",", "b", ",", "c", ",", "d" ], t.identical(i, n), t.case = "delimeter as array", 
          (a = e.mapExtend(null, r)).src = "a,b.c.d", a.delimeter = [ ",", "." ], i = e.strSplit(a), 
          n = [ "a", ",", "b", ".", "c", ".", "d" ], t.identical(i, n), t.case = "zero delimeter length", 
          (a = e.mapExtend(null, r)).src = "a,b.c.d", a.delimeter = [], i = e.strSplit(a), 
          n = [ "a,b.c.d" ], t.identical(i, n), t.case = "stripping off", (a = e.mapExtend(null, r)).src = "    a,b,c,d   ", 
          a.delimeter = [ "," ], i = e.strSplit(a), n = [ "a", ",", "b", ",", "c", ",", "d" ], 
          t.identical(i, n), 
          /* */
          t.case = "many delimeters, delimeter on the begin", (a = e.mapExtend(null, r)).src = ".content", 
          a.delimeter = [ ".", "#" ], i = e.strSplit(a), n = [ "", ".", "content" ], t.identical(i, n), 
          t.case = "many delimeters, delimeter on the end", (a = e.mapExtend(null, r)).src = "content.", 
          a.delimeter = [ ".", "#" ], i = e.strSplit(a), n = [ "content", ".", "" ], t.identical(i, n), 
          t.case = "many delimeters having common", (a = e.mapExtend(null, r)).src = "Aa <<! <<- Bb", 
          a.delimeter = [ "->>>", "<<<-", "->>", "<<-", "!>>", "<<!", ">>", "<<", " " ], n = [ "Aa", "", "", "<<!", "", "", "", "<<-", "", "", "Bb" ], 
          i = e.strSplit(a), t.identical(i, n), t.case = "many delimeters having common", 
          (a = e.mapExtend(null, r)).src = "Aa <<! <<- Bb", a.delimeter = [ "->>>", "<<<-", "->>", "<<-", "!>>", "<<!", ">>", "<<" ], 
          n = [ "Aa", "<<!", "", "<<-", "Bb" ], i = e.strSplit(a), t.identical(i, n), t.case = "having long common", 
          (a = e.mapExtend(null, r)).src = "Aa <<<- Bb", a.delimeter = [ "->>>", "<<<-", "->>", "<<-", "!>>", "<<!", ">>", "<<" ], 
          n = [ "Aa", "<<<-", "Bb" ], i = e.strSplit(a), t.identical(i, n), t.case = "having long common 2", 
          (a = e.mapExtend(null, r)).src = "a1 a2 a3 <<<- Bb", a.delimeter = [ "->>>", "<<<-", "->>", "<<-", "!>>", "<<!", ">>", "<<", " " ], 
          n = [ "a1", "", "a2", "", "a3", "", "", "<<<-", "", "", "Bb" ], i = e.strSplit(a), 
          t.identical(i, n), t.case = "delimeter not exist in src", (a = e.mapExtend(null, r)).src = "a,b,c", 
          a.delimeter = [ "." ], n = [ "a,b,c" ], i = e.strSplit(a), t.identical(i, n), 
          /* */
          t.case = "several delimeters", (a = e.mapExtend(null, r)).src = "a ., b ., c ., d", 
          a.delimeter = [ ",", "." ], n = [ "a", ".", "", ",", "b", ".", "", ",", "c", ".", "", ",", "d" ], 
          i = e.strSplit(a), t.identical(i, n), t.case = "one delimeters", (a = e.mapExtend(null, r)).src = "a , b , c , d", 
          a.delimeter = ",", n = [ "a", ",", "b", ",", "c", ",", "d" ], i = e.strSplit(a), 
          t.identical(i, n), t.case = "delimeters equal src", (a = e.mapExtend(null, r)).src = ",", 
          a.delimeter = ",", n = [ "", ",", "" ], i = e.strSplit(a), t.identical(i, n), t.case = "src is triplet of delimeter", 
          (a = e.mapExtend(null, r)).src = ",,,", a.delimeter = ",", n = [ "", ",", "", ",", "", ",", "" ], 
          i = e.strSplit(a), t.identical(i, n), 
          /* */
          t.case = "quoted at edges", (a = e.mapExtend(null, r)).src = '"a b" "" c"', a.delimeter = [ '"' ], 
          i = e.strSplit(a), n = [ "", '"', "a b", '"', "", '"', "", '"', "c", '"', "" ], 
          t.identical(i, n), t.case = "quoted in the middle", (a = e.mapExtend(null, r)).src = '"a b" "" c', 
          a.delimeter = [ "a b", " c" ], i = e.strSplit(a), n = [ '"', "a b", '" ""', "c", "" ], 
          t.identical(i, n), t.case = "quoted in the middle with space first", (a = e.mapExtend(null, r)).src = '"a b" "" c', 
          a.delimeter = [ "a b", " ", " c", '"' ], i = e.strSplit(a), n = [ "", '"', "", "a b", "", '"', "", "", "", '"', "", '"', "", "", "c" ], 
          t.identical(i, n), t.case = "quoted in the middle with space last", (a = e.mapExtend(null, r)).src = '"a b" "" c', 
          a.delimeter = [ "a b", " c", '"', " " ], i = e.strSplit(a), n = [ "", '"', "", "a b", "", '"', "", "", "", '"', "", '"', "", "c", "" ], 
          t.identical(i, n), t.case = "delimeter with empty string at the beginning of array", 
          (a = e.mapExtend(null, r)).src = '"a b" "" c', a.delimeter = [ "", "a b", " ", "", " c" ], 
          i = e.strSplit(a), n = [ '"', "", "a", "", "", "", "b", "", '"', "", "", "", '"', "", '"', "", "", "", "c" ], 
          t.identical(i, n), t.case = "quoted in the middle", (a = e.mapExtend(null, r)).src = '"a b" x "" c', 
          a.delimeter = [ "", '"', "", "a b", "", '"', "", "", "x", "", "", "", "", '"', "", '"', "", "", "c" ], 
          i = e.strSplit(a), n = [ '"', "", "a", "", "", "", "b", "", '"', "", "", "", "x", "", "", "", '"', "", '"', "", "", "", "c" ], 
          t.identical(i, n), t.close("s:1 q:0 pe:1"), 
          /* - */
          t.open("s:1 q:1 pe:0"), r = {
            stripping: 1,
            quoting: 1,
            preservingEmpty: 0
          }, t.case = "empty both", (a = e.mapExtend(null, r)).src = "", a.delimeter = "", 
          i = e.strSplit(a), n = [], t.identical(i, n), t.case = "empty delimeter", (a = e.mapExtend(null, r)).src = "abc", 
          a.delimeter = "", i = e.strSplit(a), n = [ "a", "b", "c" ], t.identical(i, n), t.case = "empty src", 
          (a = e.mapExtend(null, r)).src = "", a.delimeter = "a", i = e.strSplit(a), n = [], 
          t.identical(i, n), t.case = "has empty element in result", (a = e.mapExtend(null, r)).src = "a b  c", 
          i = e.strSplit(a), n = [ "a", "b", "c" ], t.identical(i, n), t.case = "returns an array of strings", 
          (a = e.mapExtend(null, r)).src = "test test test", i = e.strSplit(a), n = [ "test", "test", "test" ], 
          t.identical(i, n), t.case = "split string into an array of strings", (a = e.mapExtend(null, r)).src = " test   test   test ", 
          i = e.strSplit(a), n = [ "test", "test", "test" ], t.identical(i, n), t.case = "split with delimeter which src does not have", 
          (a = e.mapExtend(null, r)).src = " test   test   test ", a.delimeter = "x", i = e.strSplit(a), 
          n = [ "test   test   test" ], t.identical(i, n), t.case = "custom delimeter", (a = e.mapExtend(null, r)).src = " test <delimteter>  test<delimteter>   test ", 
          a.delimeter = "<delimteter>", i = e.strSplit(a), n = [ "test", "<delimteter>", "test", "<delimteter>", "test" ], 
          t.identical(i, n), t.case = "simple string, default options", (a = e.mapExtend(null, r)).src = "a b c d", 
          i = e.strSplit(a), n = [ "a", "b", "c", "d" ], t.identical(i, n), t.case = "arguments as map", 
          (a = e.mapExtend(null, r)).src = "a,b,c,d", a.delimeter = ",", i = e.strSplit(a), 
          n = [ "a", ",", "b", ",", "c", ",", "d" ], t.identical(i, n), t.case = "delimeter as array", 
          (a = e.mapExtend(null, r)).src = "a,b.c.d", a.delimeter = [ ",", "." ], i = e.strSplit(a), 
          n = [ "a", ",", "b", ".", "c", ".", "d" ], t.identical(i, n), t.case = "zero delimeter length", 
          (a = e.mapExtend(null, r)).src = "a,b.c.d", a.delimeter = [], i = e.strSplit(a), 
          n = [ "a,b.c.d" ], t.identical(i, n), t.case = "stripping off", (a = e.mapExtend(null, r)).src = "    a,b,c,d   ", 
          a.delimeter = [ "," ], i = e.strSplit(a), n = [ "a", ",", "b", ",", "c", ",", "d" ], 
          t.identical(i, n), 
          /* */
          t.case = "many delimeters, delimeter on the begin", (a = e.mapExtend(null, r)).src = ".content", 
          a.delimeter = [ ".", "#" ], i = e.strSplit(a), n = [ ".", "content" ], t.identical(i, n), 
          t.case = "many delimeters, delimeter on the end", (a = e.mapExtend(null, r)).src = "content.", 
          a.delimeter = [ ".", "#" ], i = e.strSplit(a), n = [ "content", "." ], t.identical(i, n), 
          t.case = "many delimeters having common", (a = e.mapExtend(null, r)).src = "Aa <<! <<- Bb", 
          a.delimeter = [ "->>>", "<<<-", "->>", "<<-", "!>>", "<<!", ">>", "<<", " " ], n = [ "Aa", "<<!", "<<-", "Bb" ], 
          i = e.strSplit(a), t.identical(i, n), t.case = "many delimeters having common", 
          (a = e.mapExtend(null, r)).src = "Aa <<! <<- Bb", a.delimeter = [ "->>>", "<<<-", "->>", "<<-", "!>>", "<<!", ">>", "<<" ], 
          n = [ "Aa", "<<!", "<<-", "Bb" ], i = e.strSplit(a), t.identical(i, n), t.case = "having long common", 
          (a = e.mapExtend(null, r)).src = "Aa <<<- Bb", a.delimeter = [ "->>>", "<<<-", "->>", "<<-", "!>>", "<<!", ">>", "<<" ], 
          n = [ "Aa", "<<<-", "Bb" ], i = e.strSplit(a), t.identical(i, n), t.case = "having long common 2", 
          (a = e.mapExtend(null, r)).src = "a1 a2 a3 <<<- Bb", a.delimeter = [ "->>>", "<<<-", "->>", "<<-", "!>>", "<<!", ">>", "<<", " " ], 
          n = [ "a1", "a2", "a3", "<<<-", "Bb" ], i = e.strSplit(a), t.identical(i, n), t.case = "delimeter not exist in src", 
          (a = e.mapExtend(null, r)).src = "a,b,c", a.delimeter = [ "." ], n = [ "a,b,c" ], 
          i = e.strSplit(a), t.identical(i, n), 
          /**/
          t.case = "several delimeters", (a = e.mapExtend(null, r)).src = "a ., b ., c ., d", 
          a.delimeter = [ ",", "." ], n = [ "a", ".", ",", "b", ".", ",", "c", ".", ",", "d" ], 
          i = e.strSplit(a), t.identical(i, n), t.case = "one delimeters", (a = e.mapExtend(null, r)).src = "a , b , c , d", 
          a.delimeter = ",", n = [ "a", ",", "b", ",", "c", ",", "d" ], i = e.strSplit(a), 
          t.identical(i, n), t.case = "delimeters equal src", (a = e.mapExtend(null, r)).src = ",", 
          a.delimeter = ",", n = [ "," ], i = e.strSplit(a), t.identical(i, n), t.case = "src is triplet of delimeter", 
          (a = e.mapExtend(null, r)).src = ",,,", a.delimeter = ",", n = [ ",", ",", "," ], 
          i = e.strSplit(a), t.identical(i, n), 
          /* */
          t.case = "complex quoted at edges", (a = e.mapExtend(null, r)).src = '"a b" " c"', 
          a.delimeter = [ '"' ], i = e.strSplit(a), n = [ '"a b" " c"' ], t.identical(i, n), 
          t.case = "quoted in the middle", (a = e.mapExtend(null, r)).src = '"a b" "" c', 
          a.delimeter = [ "a b", " c" ], i = e.strSplit(a), n = [ '"a b" ""', "c" ], t.identical(i, n), 
          t.case = "quoted in the middle with space first", (a = e.mapExtend(null, r)).src = '"a b" "" c', 
          a.delimeter = [ "a b", " ", " c", '"' ], i = e.strSplit(a), n = [ '"a b"', '""', "c" ], 
          t.identical(i, n), t.case = "quoted in the middle with space last", (a = e.mapExtend(null, r)).src = '"a b" "" c', 
          a.delimeter = [ "a b", " c", '"', " " ], i = e.strSplit(a), n = [ '"a b"', '""', "c" ], 
          t.identical(i, n), t.case = "delimeter with empty string at the beginning of array", 
          (a = e.mapExtend(null, r)).src = '"a b" "" c', a.delimeter = [ "", "a b", " ", "", " c" ], 
          i = e.strSplit(a), n = [ '"a b"', '""', "c" ], t.identical(i, n), t.case = "quoted in the middle", 
          (a = e.mapExtend(null, r)).src = '"a b" x "" c', a.delimeter = [ "a b", " ", " c", '"', "" ], 
          i = e.strSplit(a), n = [ '"a b"', "x", '""', "c" ], t.identical(i, n), 
          /* special quoting tests */
          t.case = "quoted at edges, delimeter : #", (a = e.mapExtend(null, r)).src = '"aa"bb"cc"', 
          a.delimeter = [ "#" ], i = e.strSplit(a), n = [ '"aa"bb"cc"' ], t.identical(i, n), 
          t.close("s:1 q:1 pe:0"), 
          /* - */
          t.open("s:1 q:1 pe:0 pq:1 iq:0 delimeter:#"), r = {
            stripping: 1,
            quoting: 1,
            preservingEmpty: 0,
            preservingQuoting: 1,
            inliningQuoting: 0,
            delimeter: "#"
          }, t.case = 'quoted at edges"', (a = e.mapExtend(null, r)).src = '"aa"bb"cc"', i = e.strSplit(a), 
          n = [ '"aa"', "bb", '"cc"' ], t.identical(i, n), t.case = 'quoted at edges with extra quote inside "', 
          (a = e.mapExtend(null, r)).src = '"aa"bb""cc"', i = e.strSplit(a), n = [ '"aa"', "bb", '""', 'cc"' ], 
          t.identical(i, n), t.case = 'quoted at edges with # inside the first quoted text"', 
          (a = e.mapExtend(null, r)).src = '"a#a"bb""cc"', i = e.strSplit(a), n = [ '"a#a"', "bb", '""', 'cc"' ], 
          t.identical(i, n), t.case = 'quoted at edges with # inside not quoted text"', (a = e.mapExtend(null, r)).src = '"aa"b#b""cc"', 
          i = e.strSplit(a), n = [ '"aa"', "b", "#", "b", '""', 'cc"' ], t.identical(i, n), 
          t.case = 'quoted at edges with # inside the last quoted text"', (a = e.mapExtend(null, r)).src = '"aa"bb""c#c"', 
          i = e.strSplit(a), n = [ '"aa"', "bb", '""', "c", "#", 'c"' ], t.identical(i, n), 
          t.case = 'quoted at edges with # inside all 3 text splits"', (a = e.mapExtend(null, r)).src = '"a#a"b#b""c#c"', 
          i = e.strSplit(a), n = [ '"a#a"', "b", "#", "b", '""', "c", "#", 'c"' ], t.identical(i, n), 
          t.case = "quoted at edges with extra spaces on edges", (a = e.mapExtend(null, r)).src = ' "aa"bb"cc" ', 
          i = e.strSplit(a), n = [ '"aa"', "bb", '"cc"' ], t.identical(i, n), t.close("s:1 q:1 pe:0 pq:1 iq:0 delimeter:#"), 
          /* - */
          t.open("s:1 q:1 pe:0 pq:0 iq:1 delimeter:#"), r = {
            stripping: 1,
            quoting: 1,
            preservingEmpty: 0,
            preservingQuoting: 0,
            inliningQuoting: 1,
            delimeter: "#"
          }, t.case = 'quoted at edges"', (a = e.mapExtend(null, r)).src = '"aa"bb"cc"', i = e.strSplit(a), 
          n = [ "aabbcc" ], t.identical(i, n), t.case = 'quoted at edges with extra quote inside "', 
          (a = e.mapExtend(null, r)).src = '"aa"bb""cc"', i = e.strSplit(a), n = [ 'aabbcc"' ], 
          t.identical(i, n), t.case = 'quoted at edges with # inside the first quoted text"', 
          (a = e.mapExtend(null, r)).src = '"a#a"bb""cc"', i = e.strSplit(a), n = [ 'a#abbcc"' ], 
          t.identical(i, n), t.case = 'quoted at edges with # inside not quoted text"', (a = e.mapExtend(null, r)).src = '"aa"b#b""cc"', 
          i = e.strSplit(a), n = [ "aab", "#", 'bcc"' ], t.identical(i, n), t.case = 'quoted at edges with # inside the last quoted text"', 
          (a = e.mapExtend(null, r)).src = '"aa"bb""c#c"', i = e.strSplit(a), n = [ "aabbc", "#", 'c"' ], 
          t.identical(i, n), t.case = 'quoted at edges with # inside all 3 text splits"', 
          (a = e.mapExtend(null, r)).src = '"a#a"b#b""c#c"', i = e.strSplit(a), n = [ "a#ab", "#", "bc", "#", 'c"' ], 
          t.identical(i, n), t.case = "quoted at edges with extra spaces on edges", (a = e.mapExtend(null, r)).src = ' "aa"bb"cc" ', 
          i = e.strSplit(a), n = [ "aabbcc" ], t.identical(i, n), t.close("s:1 q:1 pe:0 pq:0 iq:1 delimeter:#"), 
          /* - */
          t.open("complex");
          var s = 'Test check // ( Tools/base/l2/String / strSplit / delimeter:" " > space on the beginning and the end <  ) # 3 ... failed';
          t.case = "s:0 q:1 pe:1 pd:1 pq:0 iq:0";
          var a = {
            stripping: 0,
            quoting: 1,
            preservingEmpty: 1,
            preservingDelimeters: 1,
            preservingQuoting: 0,
            inliningQuoting: 0,
            delimeter: [ " > ", " < ", "/" ],
            src: s
          };
          i = e.strSplit(a), n = [ "Test check ", "/", "", "/", " ( Tools", "/", "base", "/", "l2", "/", "String ", "/", " strSplit ", "/", " delimeter:", " ", "", " > ", "space on the beginning and the end", " < ", " ) # 3 ... failed" ], 
          t.identical(i, n), t.case = "s:0 q:1 pe:1 pd:1 pq:1 iq:0", a = {
            stripping: 0,
            quoting: 1,
            preservingEmpty: 1,
            preservingDelimeters: 1,
            preservingQuoting: 1,
            inliningQuoting: 0,
            delimeter: [ " > ", " < ", "/" ],
            src: s
          }, i = e.strSplit(a), n = [ "Test check ", "/", "", "/", " ( Tools", "/", "base", "/", "l2", "/", "String ", "/", " strSplit ", "/", " delimeter:", '" "', "", " > ", "space on the beginning and the end", " < ", " ) # 3 ... failed" ], 
          t.identical(i, n), t.case = "s:0 q:1 pe:1 pd:1 pq:0 iq:1", a = {
            stripping: 0,
            quoting: 1,
            preservingEmpty: 1,
            preservingDelimeters: 1,
            preservingQuoting: 0,
            inliningQuoting: 1,
            delimeter: [ " > ", " < ", "/" ],
            src: s
          }, i = e.strSplit(a), n = [ "Test check ", "/", "", "/", " ( Tools", "/", "base", "/", "l2", "/", "String ", "/", " strSplit ", "/", " delimeter: ", " > ", "space on the beginning and the end", " < ", " ) # 3 ... failed" ], 
          t.identical(i, n), t.case = "s:0 q:1 pe:1 pd:1 pq:1 iq:1", a = {
            stripping: 0,
            quoting: 1,
            preservingEmpty: 1,
            preservingDelimeters: 1,
            preservingQuoting: 1,
            inliningQuoting: 1,
            delimeter: [ " > ", " < ", "/" ],
            src: s
          }, i = e.strSplit(a), n = [ "Test check ", "/", "", "/", " ( Tools", "/", "base", "/", "l2", "/", "String ", "/", " strSplit ", "/", ' delimeter:" "', " > ", "space on the beginning and the end", " < ", " ) # 3 ... failed" ], 
          t.identical(i, n), t.case = "s:0 q:0 pe:0 pd:0", a = {
            stripping: 0,
            quoting: 0,
            preservingEmpty: 0,
            preservingDelimeters: 0,
            delimeter: [ " > ", " < ", "/" ],
            src: s
          }, i = e.strSplit(a), n = [ "Test check ", " ( Tools", "base", "l2", "String ", " strSplit ", ' delimeter:" "', "space on the beginning and the end", " ) # 3 ... failed" ], 
          t.identical(i, n), t.case = "s:0 q:0 pe:0 pd:1", a = {
            stripping: 0,
            quoting: 0,
            preservingEmpty: 0,
            preservingDelimeters: 1,
            delimeter: [ " > ", " < ", "/" ],
            src: s
          }, i = e.strSplit(a), n = [ "Test check ", "/", "/", " ( Tools", "/", "base", "/", "l2", "/", "String ", "/", " strSplit ", "/", ' delimeter:" "', " > ", "space on the beginning and the end", " < ", " ) # 3 ... failed" ], 
          t.identical(i, n), t.case = "s:0 q:0 pe:1 pd:0", a = {
            stripping: 0,
            quoting: 0,
            preservingEmpty: 1,
            preservingDelimeters: 0,
            delimeter: [ " > ", " < ", "/" ],
            src: s
          }, i = e.strSplit(a), n = [ "Test check ", "", " ( Tools", "base", "l2", "String ", " strSplit ", ' delimeter:" "', "space on the beginning and the end", " ) # 3 ... failed" ], 
          t.identical(i, n), t.case = "s:0 q:0 pe:1 pd:1", a = {
            stripping: 0,
            quoting: 0,
            preservingEmpty: 1,
            preservingDelimeters: 1,
            delimeter: [ " > ", " < ", "/" ],
            src: s
          }, i = e.strSplit(a), n = [ "Test check ", "/", "", "/", " ( Tools", "/", "base", "/", "l2", "/", "String ", "/", " strSplit ", "/", ' delimeter:" "', " > ", "space on the beginning and the end", " < ", " ) # 3 ... failed" ], 
          t.identical(i, n), t.case = "s:0 q:1 pe:0 pd:0", a = {
            stripping: 0,
            quoting: 1,
            preservingEmpty: 0,
            preservingDelimeters: 0,
            delimeter: [ " > ", " < ", "/" ],
            src: s
          }, i = e.strSplit(a), n = [ "Test check ", " ( Tools", "base", "l2", "String ", " strSplit ", ' delimeter:" "', "space on the beginning and the end", " ) # 3 ... failed" ], 
          t.identical(i, n), t.case = "s:0 q:1 pe:0 pd:1", a = {
            stripping: 0,
            quoting: 1,
            preservingEmpty: 0,
            preservingDelimeters: 1,
            delimeter: [ " > ", " < ", "/" ],
            src: s
          }, i = e.strSplit(a), n = [ "Test check ", "/", "/", " ( Tools", "/", "base", "/", "l2", "/", "String ", "/", " strSplit ", "/", ' delimeter:" "', " > ", "space on the beginning and the end", " < ", " ) # 3 ... failed" ], 
          t.identical(i, n), t.case = "s:0 q:1 pe:0 pd:1 pq:1", a = {
            stripping: 0,
            quoting: 1,
            preservingEmpty: 0,
            preservingDelimeters: 1,
            preservingQuoting: 1,
            delimeter: [ " > ", " < ", "/" ],
            src: s
          }, i = e.strSplit(a), n = [ "Test check ", "/", "/", " ( Tools", "/", "base", "/", "l2", "/", "String ", "/", " strSplit ", "/", ' delimeter:" "', " > ", "space on the beginning and the end", " < ", " ) # 3 ... failed" ], 
          t.identical(i, n), t.case = "s:0 q:1 pe:1 pd:0", a = {
            stripping: 0,
            quoting: 1,
            preservingEmpty: 1,
            preservingDelimeters: 0,
            delimeter: [ " > ", " < ", "/" ],
            src: s
          }, i = e.strSplit(a), n = [ "Test check ", "", " ( Tools", "base", "l2", "String ", " strSplit ", ' delimeter:" "', "space on the beginning and the end", " ) # 3 ... failed" ], 
          t.identical(i, n), t.case = "s:1 q:0 pe:0 pd:0", a = {
            stripping: 1,
            quoting: 0,
            preservingEmpty: 0,
            preservingDelimeters: 0,
            delimeter: [ " > ", " < ", "/" ],
            src: s
          }, i = e.strSplit(a), n = [ "Test check", "( Tools", "base", "l2", "String", "strSplit", 'delimeter:" "', "space on the beginning and the end", ") # 3 ... failed" ], 
          t.identical(i, n), t.case = "s:1 q:0 pe:0 pd:1", a = {
            stripping: 1,
            quoting: 0,
            preservingEmpty: 0,
            preservingDelimeters: 1,
            delimeter: [ " > ", " < ", "/" ],
            src: s
          }, i = e.strSplit(a), n = [ "Test check", "/", "/", "( Tools", "/", "base", "/", "l2", "/", "String", "/", "strSplit", "/", 'delimeter:" "', ">", "space on the beginning and the end", "<", ") # 3 ... failed" ], 
          t.identical(i, n), t.case = "s:1 q:0 pe:1 pd:0", a = {
            stripping: 1,
            quoting: 0,
            preservingEmpty: 1,
            preservingDelimeters: 0,
            delimeter: [ " > ", " < ", "/" ],
            src: s
          }, i = e.strSplit(a), n = [ "Test check", "", "( Tools", "base", "l2", "String", "strSplit", 'delimeter:" "', "space on the beginning and the end", ") # 3 ... failed" ], 
          t.identical(i, n), t.case = "s:1 q:0 pe:1 pd:1", a = {
            stripping: 1,
            quoting: 0,
            preservingEmpty: 1,
            preservingDelimeters: 1,
            delimeter: [ " > ", " < ", "/" ],
            src: s
          }, i = e.strSplit(a), n = [ "Test check", "/", "", "/", "( Tools", "/", "base", "/", "l2", "/", "String", "/", "strSplit", "/", 'delimeter:" "', ">", "space on the beginning and the end", "<", ") # 3 ... failed" ], 
          t.identical(i, n), t.case = "s:1 q:1 pe:0 pd:0", a = {
            stripping: 1,
            quoting: 1,
            preservingEmpty: 0,
            preservingDelimeters: 0,
            delimeter: [ " > ", " < ", "/" ],
            src: s
          }, i = e.strSplit(a), n = [ "Test check", "( Tools", "base", "l2", "String", "strSplit", 'delimeter:" "', "space on the beginning and the end", ") # 3 ... failed" ], 
          t.identical(i, n), t.case = "s:1 q:1 pe:0 pd:1", a = {
            stripping: 1,
            quoting: 1,
            preservingEmpty: 0,
            preservingDelimeters: 1,
            delimeter: [ " > ", " < ", "/" ],
            src: s
          }, i = e.strSplit(a), n = [ "Test check", "/", "/", "( Tools", "/", "base", "/", "l2", "/", "String", "/", "strSplit", "/", 'delimeter:" "', ">", "space on the beginning and the end", "<", ") # 3 ... failed" ], 
          t.identical(i, n), t.case = "s:1 q:1 pe:1 pd:0", a = {
            stripping: 1,
            quoting: 1,
            preservingEmpty: 1,
            preservingDelimeters: 0,
            delimeter: [ " > ", " < ", "/" ],
            src: s
          }, i = e.strSplit(a), n = [ "Test check", "", "( Tools", "base", "l2", "String", "strSplit", 'delimeter:" "', "space on the beginning and the end", ") # 3 ... failed" ], 
          t.identical(i, n), t.case = "s:1 q:1 pe:1 pd:1", a = {
            stripping: 1,
            quoting: 1,
            preservingEmpty: 1,
            preservingDelimeters: 1,
            delimeter: [ " > ", " < ", "/" ],
            src: s
          }, i = e.strSplit(a), n = [ "Test check", "/", "", "/", "( Tools", "/", "base", "/", "l2", "/", "String", "/", "strSplit", "/", 'delimeter:" "', ">", "space on the beginning and the end", "<", ") # 3 ... failed" ], 
          t.identical(i, n), s = '\n= Org\n\n- Q: "Where?"\n- A1: "Here."\n\n- A2: "There."\n', 
          t.case = "s:1 q:1 pe:1 pd:0 pq:1 iq:1", a = {
            stripping: 1,
            quoting: 1,
            preservingEmpty: 1,
            preservingDelimeters: 0,
            preservingQuoting: 1,
            inliningQuoting: 1,
            delimeter: [ "\n" ],
            src: s
          }, i = e.strSplit(a), n = [ "", "= Org", "", '- Q: "Where?"', '- A1: "Here."', "", '- A2: "There."', "" ], 
          t.identical(i, n), t.case = "s:1 q:1 pe:1 pd:0 pq:1 iq:0", a = {
            stripping: 1,
            quoting: 1,
            preservingEmpty: 1,
            preservingDelimeters: 0,
            preservingQuoting: 1,
            inliningQuoting: 0,
            delimeter: [ "\n" ],
            src: s
          }, i = e.strSplit(a), n = [ "", "= Org", "", "- Q:", '"Where?"', "", "- A1:", '"Here."', "", "", "- A2:", '"There."', "", "" ], 
          t.identical(i, n), t.case = "s:1 q:1 pe:1 pd:0 pq:0 iq:1", a = {
            stripping: 1,
            quoting: 1,
            preservingEmpty: 1,
            preservingDelimeters: 0,
            preservingQuoting: 0,
            inliningQuoting: 1,
            delimeter: [ "\n" ],
            src: s
          }, i = e.strSplit(a), n = [ "", "= Org", "", "- Q: Where?", "- A1: Here.", "", "- A2: There.", "" ], 
          t.identical(i, n), t.case = "s:1 q:1 pe:1 pd:0 pq:0 iq:0", a = {
            stripping: 1,
            quoting: 1,
            preservingEmpty: 1,
            preservingDelimeters: 0,
            preservingQuoting: 0,
            inliningQuoting: 0,
            delimeter: [ "\n" ],
            src: s
          }, i = e.strSplit(a), n = [ "", "= Org", "", "- Q:", "Where?", "", "- A1:", "Here.", "", "", "- A2:", "There.", "", "" ], 
          t.identical(i, n), t.case = "quoted at edges, s:1 q:1 pe:1 pd:0 pq:0 iq:0", a = {
            stripping: 0,
            quoting: 1,
            preservingEmpty: 1,
            preservingDelimeters: 0,
            preservingQuoting: 0,
            inliningQuoting: 0,
            delimeter: [ '"' ],
            src: '"a b" " c"'
          }, n = [ "", "a b", " ", " c", "" ], i = e.strSplit(a), t.identical(i, n), t.case = "quoted at edges, s:1 q:1 pe:1 pd:0 pq:0 iq:1", 
          a = {
            stripping: 0,
            quoting: 1,
            preservingEmpty: 1,
            preservingDelimeters: 0,
            preservingQuoting: 0,
            inliningQuoting: 1,
            delimeter: [ '"' ],
            src: '"a b" " c"'
          }, n = [ "a b  c" ], i = e.strSplit(a), t.identical(i, n), t.case = "quoted at edges, s:1 q:1 pe:1 pd:0 pq:1 iq:0", 
          a = {
            stripping: 0,
            quoting: 1,
            preservingEmpty: 1,
            preservingDelimeters: 0,
            preservingQuoting: 1,
            inliningQuoting: 0,
            delimeter: [ '"' ],
            src: '"a b" " c"'
          }, n = [ "", '"a b"', " ", '" c"', "" ], i = e.strSplit(a), t.identical(i, n), t.case = "quoted at edges, s:1 q:1 pe:1 pd:0 pq:1 iq:1", 
          a = {
            stripping: 0,
            quoting: 1,
            preservingEmpty: 1,
            preservingDelimeters: 0,
            preservingQuoting: 1,
            inliningQuoting: 1,
            delimeter: [ '"' ],
            src: '"a b" " c"'
          }, n = [ '"a b" " c"' ], i = e.strSplit(a), t.identical(i, n), t.case = "quoted in the middle, s:1 q:1 pe:1 pd:0 pq:1 iq:1", 
          a = {
            stripping: 0,
            quoting: 1,
            preservingEmpty: 1,
            preservingDelimeters: 0,
            preservingQuoting: 1,
            inliningQuoting: 1,
            delimeter: [ '"' ],
            src: '"a b" """x" c'
          }, n = [ '"a b" """x" c' ], i = e.strSplit(a), t.identical(i, n), t.case = "quoted in the middle, s:1 q:1 pe:1 pd:0 pq:1 iq:0", 
          a = {
            stripping: 0,
            quoting: 1,
            preservingEmpty: 1,
            preservingDelimeters: 0,
            preservingQuoting: 1,
            inliningQuoting: 0,
            delimeter: [ '"' ],
            src: '"a b" """x" c'
          }, n = [ "", '"a b"', " ", '""', "", '"x"', " c" ], i = e.strSplit(a), t.identical(i, n), 
          t.case = "quoted in the middle, s:1 q:1 pe:1 pd:0 pq:0 iq:1", a = {
            stripping: 0,
            quoting: 1,
            preservingEmpty: 1,
            preservingDelimeters: 0,
            preservingQuoting: 0,
            inliningQuoting: 1,
            delimeter: [ '"' ],
            src: '"a b" """x" c'
          }, n = [ "a b x c" ], i = e.strSplit(a), t.identical(i, n), t.case = "quoted in the middle, s:1 q:1 pe:1 pd:0 pq:0 iq:0", 
          a = {
            stripping: 0,
            quoting: 1,
            preservingEmpty: 1,
            preservingDelimeters: 0,
            preservingQuoting: 0,
            inliningQuoting: 0,
            delimeter: [ '"' ],
            src: '"a b" """x" c'
          }, n = [ "", "a b", " ", "", "", "x", " c" ], i = e.strSplit(a), t.identical(i, n), 
          /* */
          t.case = "extra quote, s:1 q:1 pe:1 pd:0 pq:1 iq:1", a = {
            stripping: 0,
            quoting: 1,
            preservingEmpty: 1,
            preservingDelimeters: 0,
            preservingQuoting: 1,
            inliningQuoting: 1,
            delimeter: [ "#" ],
            src: '"aa"bb""cc"'
          }, i = e.strSplit(a), n = [ '"aa"bb""cc"' ], t.identical(i, n), t.case = "extra quote, s:1 q:1 pe:1 pd:0 pq:0 iq:1", 
          a = {
            stripping: 0,
            quoting: 1,
            preservingEmpty: 1,
            preservingDelimeters: 0,
            preservingQuoting: 0,
            inliningQuoting: 1,
            delimeter: [ "#" ],
            src: '"aa"bb""cc"'
          }, i = e.strSplit(a), n = [ 'aabbcc"' ], t.identical(i, n), t.case = "extra quote, s:1 q:1 pe:1 pd:0 pq:1 iq:0", 
          a = {
            stripping: 0,
            quoting: 1,
            preservingEmpty: 1,
            preservingDelimeters: 0,
            preservingQuoting: 1,
            inliningQuoting: 0,
            delimeter: [ "#" ],
            src: '"aa"bb""cc"'
          }, i = e.strSplit(a), n = [ "", '"aa"', "bb", '""', 'cc"' ], t.identical(i, n), 
          t.case = "extra quote, s:1 q:1 pe:1 pd:0 pq:0 iq:0", a = {
            stripping: 0,
            quoting: 1,
            preservingEmpty: 1,
            preservingDelimeters: 0,
            preservingQuoting: 0,
            inliningQuoting: 0,
            delimeter: [ "#" ],
            src: '"aa"bb""cc"'
          }, i = e.strSplit(a), n = [ "", "aa", "bb", "", 'cc"' ], t.identical(i, n), 
          /* */
          t.case = "extra quote as delimeter, s:1 q:1 pe:1 pd:1 pq:1 iq:1", a = {
            stripping: 0,
            quoting: 1,
            preservingEmpty: 1,
            preservingDelimeters: 1,
            preservingQuoting: 1,
            inliningQuoting: 1,
            delimeter: [ "#", '"' ],
            src: '"aa"bb""cc"'
          }, i = e.strSplit(a), n = [ '"aa"bb""cc', '"', "" ], t.identical(i, n), t.case = "extra quote as delimeter, s:1 q:1 pe:1 pd:1 pq:0 iq:1", 
          a = {
            stripping: 0,
            quoting: 1,
            preservingEmpty: 1,
            preservingDelimeters: 1,
            preservingQuoting: 0,
            inliningQuoting: 1,
            delimeter: [ "#", '"' ],
            src: '"aa"bb""cc"'
          }, i = e.strSplit(a), n = [ "aabbcc", '"', "" ], t.identical(i, n), t.case = "extra quote as delimeter, s:1 q:1 pe:1 pd:1 pq:1 iq:0", 
          a = {
            stripping: 0,
            quoting: 1,
            preservingEmpty: 1,
            preservingDelimeters: 1,
            preservingQuoting: 1,
            inliningQuoting: 0,
            delimeter: [ "#", '"' ],
            src: '"aa"bb""cc"'
          }, i = e.strSplit(a), n = [ "", '"aa"', "bb", '""', "cc", '"', "" ], t.identical(i, n), 
          t.case = "extra quote as delimeter, s:1 q:1 pe:1 pd:1 pq:0 iq:0", a = {
            stripping: 0,
            quoting: 1,
            preservingEmpty: 1,
            preservingDelimeters: 1,
            preservingQuoting: 0,
            inliningQuoting: 0,
            delimeter: [ "#", '"' ],
            src: '"aa"bb""cc"'
          }, i = e.strSplit(a), n = [ "", "aa", "bb", "", "cc", '"', "" ], t.identical(i, n), 
          /* - */
          t.close("complex");
        }
        // //
        //
        // function strSplitNaive( test )
        // {
        //
        //   test.case = 'returns an array of strings';
        //   debugger;
        //   var got = _.strSplitNaive( 'test test test' );
        //   debugger;
        //   var expected = [ 'test', 'test', 'test' ];
        //   test.identical( got, expected );
        //
        //   test.case = 'split string into an array of strings';
        //   var got = _.strSplitNaive( ' test   test   test ' );
        //   var expected = [ 'test', 'test', 'test' ];
        //   test.identical( got, expected );
        //
        //   test.case = 'returns an array of strings';
        //   var got = _.strSplitNaive( ' test   test   test ', 'redundant argument' );
        //   var expected = [ 'test   test   test' ];
        //   test.identical( got, expected );
        //
        //   test.case = 'returns an array of strings';
        //   var got = _.strSplitNaive( ' test <delimteter>  test<delimteter>   test ', '<delimteter>' );
        //   var expected = [ 'test', 'test', 'test' ];
        //   test.identical( got, expected );
        //
        //   test.case = 'simple string, default options';
        //   var got = _.strSplitNaive( 'a b c d' );
        //   var expected = [ 'a', 'b', 'c', 'd' ];
        //   test.identical( got, expected );
        //
        //   test.case = 'arguments as map';
        //   var got = _.strSplitNaive( { src : 'a,b,c,d', delimeter : ','  } );
        //   var expected = [ 'a', 'b', 'c', 'd' ];
        //   test.identical( got, expected );
        //
        //   test.case = 'delimeter as array';
        //   var got = _.strSplitNaive( { src : 'a,b.c.d', delimeter : [ ',', '.' ]  } );
        //   var expected = [ 'a', 'b', 'c', 'd' ];
        //   test.identical( got, expected );
        //
        //   test.case = 'zero delimeter length';
        //   var got = _.strSplitNaive( { src : 'a,b.c.d', delimeter : []  } );
        //   var expected = [ 'a,b.c.d' ];
        //   test.identical( got, expected );
        //
        //   test.case = 'stripping off';
        //   var got = _.strSplitNaive( { src : '    a,b,c,d   ', delimeter : [ ',' ], stripping : 0  } );
        //   var expected = [ '    a', 'b', 'c', 'd   ' ];
        //   test.identical( got, expected );
        //
        //   /* */
        //
        //   test.case = 'preserving delimeters, many delimeters, delimeter on the begin';
        //   var got = _.strSplitNaive({ src : '.content', preservingDelimeters : 1, delimeter : [ '.','#' ] })
        //   var expected = [ '.','content' ];
        //   test.identical( got, expected );
        //
        //   test.case = 'preserving delimeters, many delimeters, delimeter on the end';
        //   var got = _.strSplitNaive({ src : 'content.', preservingDelimeters : 1, delimeter : [ '.','#' ] })
        //   var expected = [ 'content','.' ];
        //   test.identical( got, expected );
        //
        //   /* */
        //
        //   test.case = 'many delimeters having common, preserving empty';
        //   var src = 'Aa <<! <<- Bb';
        //   var expected = [ 'Aa',' ','','<<!','',' ','','<<-','',' ','Bb' ];
        //   var got = _.strSplitNaive
        //   ({
        //     src,
        //     delimeter : [ '->>>','<<<-','->>','<<-','!>>','<<!','>>','<<',' ' ],
        //     preservingEmpty : 1,
        //     preservingDelimeters : 1,
        //     stripping : 0,
        //   });
        //
        //   test.identical( got, expected );
        //   test.case = 'many delimeters having common, removing empty';
        //   var src = 'Aa <<! <<- Bb';
        //   var expected = [ 'Aa',' ','<<!',' ','<<-',' ','Bb' ];
        //   var got = _.strSplitNaive
        //   ({
        //     src,
        //     delimeter : [ '->>>','<<<-','->>','<<-','!>>','<<!','>>','<<',' ' ],
        //     preservingEmpty : 0,
        //     preservingDelimeters : 1,
        //     stripping : 0,
        //   });
        //   test.identical( got, expected );
        //
        //   /* */
        //
        //   test.case = 'having long common';
        //   var src = 'Aa <<<- Bb';
        //   var expected = [ 'Aa',' ','','<<<-','',' ','Bb' ];
        //   var got = _.strSplitNaive
        //   ({
        //     src,
        //     delimeter : [ '->>>','<<<-','->>','<<-','!>>','<<!','>>','<<',' ' ],
        //     preservingEmpty : 1,
        //     preservingDelimeters : 1,
        //     stripping : 0,
        //   });
        //   test.identical( got, expected );
        //
        //   /* */
        //
        //   test.case = 'having long common 2';
        //   var src = 'a1 a2 a3 <<<- Bb';
        //   var expected = [ 'a1',' ','a2',' ','a3',' ','','<<<-','',' ','Bb' ];
        //   var got = _.strSplitNaive
        //   ({
        //     src,
        //     delimeter : [ '->>>','<<<-','->>','<<-','!>>','<<!','>>','<<',' ' ],
        //     preservingEmpty : 1,
        //     preservingDelimeters : 1,
        //     stripping : 0,
        //   });
        //   test.identical( got, expected );
        //
        //   /*delimeter not exist in src*/
        //
        //   var src = 'a,b,c';
        //   var expected = [ 'a,b,c' ];
        //   var got = _.strSplitNaive
        //   ({
        //     src,
        //     delimeter : [ '.' ],
        //     preservingDelimeters : 1
        //   });
        //   test.identical( got, expected );
        //
        //   /*delimeter not exist in src*/
        //
        //   var src = 'a,b,c';
        //   var expected = [ 'a,b,c' ];
        //   var got = _.strSplitNaive
        //   ({
        //     src,
        //     delimeter : [ '.' ],
        //     preservingDelimeters : 1
        //   });
        //   test.identical( got, expected );
        //
        //   /**/
        //
        //   test.case = 'preservingEmpty';
        //
        //   var src = 'a ., b ., c ., d';
        //   var expected = [ 'a', '', 'b', '', 'c', '', 'd' ];
        //   var got = _.strSplitNaive
        //   ({
        //     src,
        //     delimeter : [ ',', '.' ],
        //     preservingEmpty : 1
        //   });
        //   test.identical( got, expected );
        //
        //   /**/
        //
        //   var src = 'a , b , c , d';
        //   var expected = [ 'a', 'b', 'c', 'd' ];
        //   var got = _.strSplitNaive
        //   ({
        //     src,
        //     delimeter : ',',
        //     preservingEmpty : 1
        //   });
        //   test.identical( got, expected );
        //
        //
        //   /**/
        //
        //   var src = ',';
        //   var expected = [ '', '' ];
        //   var got = _.strSplitNaive
        //   ({
        //     src,
        //     delimeter : ',',
        //     preservingEmpty : 1
        //   });
        //   test.identical( got, expected );
        //
        //   /**/
        //
        //   var src = ',,,';
        //   var expected = [];
        //   var got = _.strSplitNaive
        //   ({
        //     src,
        //     delimeter : ',',
        //     preservingEmpty : 0
        //   });
        //   test.identical( got, expected );
        //
        //   /* take into acount text inside " " */
        //
        //   test.case = 'take into acount text inside ""';
        //
        //   var o =
        //   {
        //     src : '"/path/with space/" a b c',
        //     quoting : 1,
        //     preservingEmpty : 1,
        //   }
        //   var got = _.strSplitNaive( o );
        //   var expected = [ '/path/with space/', '', 'a', '', 'b', '', 'c' ];
        //   test.identical( got, expected );
        //
        //   test.case = 'take into acount text inside ""';
        //
        //   var o =
        //   {
        //     src : '"/path/with space/" a b c',
        //     quoting : 1,
        //     preservingEmpty : 0,
        //   }
        //   var got = _.strSplitNaive( o );
        //   var expected = [ '/path/with space/', 'a', 'b', 'c' ];
        //   test.identical( got, expected );
        //
        //   /**/
        //
        //   var o =
        //   {
        //     src : 'a "/path with/empty space/" a',
        //     quoting : 1
        //   }
        //   var got = _.strSplitNaive( o );
        //   var expected = [ 'a', '/path with/empty space/', 'a' ];
        //   test.identical( got, expected );
        //
        //   /**/
        //
        //   var o =
        //   {
        //     src : '"a b c" "a b c" "a b c"',
        //     quoting : 1
        //   }
        //   var got = _.strSplitNaive( o );
        //   var expected = [ 'a b c', 'a b c', 'a b c' ];
        //   test.identical( got, expected );
        //
        //   /**/
        //
        //   var o =
        //   {
        //     src : '"a b c" "a b c" "a b c"',
        //     quoting : 1,
        //     preservingEmpty : 1
        //   }
        //   var got = _.strSplitNaive( o );
        //   var expected = [ 'a b c', '', 'a b c', '', 'a b c' ];
        //   test.identical( got, expected );
        //
        //   /**/
        //
        //   var o =
        //   {
        //     src : '"a b c"x"a b c"x"a b c"',
        //     quoting : 1,
        //     delimeter : [ 'x' ],
        //     preservingEmpty : 1,
        //     preservingDelimeters : 1
        //   }
        //   var got = _.strSplitNaive( o );
        //   var expected = [ 'a b c', 'x', 'a b c', 'x', 'a b c' ];
        //   test.identical( got, expected );
        //
        //   /**/
        //
        //   var o =
        //   {
        //     src : '"a b" "" c"',
        //     quoting : 0,
        //     delimeter : [ '"' ],
        //     stripping : 1,
        //     preservingEmpty : 1,
        //     preservingDelimeters : 1
        //   }
        //   var got = _.strSplitNaive( o );
        //   var expected = [ '', '\"', 'a b', '\"', '', '\"', '', '\"', 'c', '\"', '' ]
        //   test.identical( got, expected );
        //
        //   /**/
        //
        //   var o =
        //   {
        //     src : '"a b" "" c',
        //     quoting : 0,
        //     delimeter : [ '"' ],
        //     stripping : 0,
        //     preservingEmpty : 1,
        //     preservingDelimeters : 1
        //   }
        //   var got = _.strSplitNaive( o );
        //   var expected = [ '', '\"', 'a b', '\"', ' ', '\"', '', '\"', ' c' ];
        //   test.identical( got, expected );
        //
        //   var o =
        //   {
        //     src : '"a b" "" c',
        //     quoting : 1,
        //     delimeter : [ '"' ],
        //     stripping : 0,
        //     preservingEmpty : 1,
        //     preservingDelimeters : 1
        //   }
        //   var got = _.strSplitNaive( o );
        //   var expected = [ 'a b', ' ', '', ' c' ];
        //   test.identical( got, expected );
        //
        //   /**/
        //
        //   var o =
        //   {
        //     src : '"a b" "" c',
        //     quoting : 1,
        //     delimeter : [ '"' ],
        //     stripping : 0,
        //     preservingEmpty : 1,
        //     preservingDelimeters : 1
        //   }
        //   var got = _.strSplitNaive( o );
        //   var expected = [ 'a b', ' ', '', ' c' ];
        //   test.identical( got, expected );
        //
        //   /**/
        //
        //   var o =
        //   {
        //     src : '"a b" "" c',
        //     quoting : 1,
        //     delimeter : [ '"' ],
        //     stripping : 1,
        //     preservingEmpty : 1,
        //     preservingDelimeters : 1
        //   }
        //   var got = _.strSplitNaive( o );
        //   var expected = [ 'a b', '', '', 'c' ];
        //   test.identical( got, expected );
        //
        //   /**/
        //
        //   var o =
        //   {
        //     src : '"a b" "" c"',
        //     quoting : 1,
        //     delimeter : [ '"' ],
        //     stripping : 1,
        //     preservingEmpty : 1,
        //     preservingDelimeters : 1
        //   }
        //   var got = _.strSplitNaive( o );
        //   var expected = [ 'a b', '', '', 'c' ];
        //   test.identical( got, expected );
        //
        //   /**/
        //
        //   var o =
        //   {
        //     src : '"a b" "" c"',
        //     quoting : 1,
        //     delimeter : [ '"' ],
        //     stripping : 0,
        //     preservingEmpty : 1,
        //     preservingDelimeters : 1
        //   }
        //   var got = _.strSplitNaive( o );
        //   var expected = [ 'a b', ' ', '', ' c' ];
        //   test.identical( got, expected );
        //
        //   /*
        //     stripping : 1,
        //     quoting : 1,
        //     preservingEmpty : 0,
        //   */
        //
        //   var op =
        //   {
        //     stripping : 1,
        //     quoting : 1,
        //     preservingEmpty : 0,
        //   }
        //
        //   /* */
        //
        //   if( !Config.debug )
        //   return;
        //
        //   test.case = 'no arguments';
        //   test.shouldThrowError( function( )
        //   {
        //     _.strSplitNaive( );
        //   } );
        //
        //   test.case = 'argument is wrong';
        //   test.shouldThrowError( function( )
        //   {
        //     _.strSplitNaive( [  ] );
        //   } );
        //
        //   test.case = 'argument is wrong';
        //   test.shouldThrowError( function( )
        //   {
        //     _.strSplitNaive( 13 );
        //   } );
        //
        //   test.case = 'invalid arguments count';
        //   test.shouldThrowError( function()
        //   {
        //     _.strSplitNaive( '1', '2', '3' );
        //   });
        //
        //   test.case = 'invalid argument type';
        //   test.shouldThrowError( function()
        //   {
        //     _.strSplitNaive( 123 );
        //   });
        //
        //   test.case = 'invalid option type';
        //   test.shouldThrowError( function()
        //   {
        //     _.strSplitNaive( { src : 3 } );
        //   });
        //
        //   test.case = 'invalid option defined';
        //   test.shouldThrowError( function()
        //   {
        //     _.strSplitNaive( { src : 'word', delimeter : 0, left : 1 } );
        //   });
        //
        //   test.case = 'no arguments';
        //   test.shouldThrowError( function()
        //   {
        //     _.strSplitNaive();
        //   });
        //
        // }
        //
        ,
        // strSplitNaive,
        strSplitStrNumber: function strSplitStrNumber(t) {
          t.case = "returns object with one property";
          var i = e.strSplitStrNumber("abcdef"), n = {
            str: "abcdef"
          };
          t.identical(i, n), t.case = "returns object with two properties", i = e.strSplitStrNumber("abc3def"), 
          n = {
            str: "abc",
            number: 3
          }, t.identical(i, n), t.case = "no arguments", t.shouldThrowError(function() {
            e.strSplitStrNumber();
          }), t.case = "argument is wrong", t.shouldThrowError(function() {
            e.strSplitStrNumber([]);
          }), t.case = "argument is wrong", t.shouldThrowError(function() {
            e.strSplitStrNumber(13);
          }), t.case = "too many arguments", t.shouldThrowError(function() {
            e.strSplitStrNumber("abc3", "redundant argument");
          });
        }
        //
        ,
        strStrip: 
        //
        /* qqq : uncover it please */
        function strStrip(t) {
          /**/
          for (var i = [ {
            description: "defaults, src is a string"
          }, {
            src: "",
            expected: ""
          }, {
            src: "a",
            expected: "a"
          }, {
            src: "   a   ",
            expected: "a"
          }, {
            src: " \0 a \0 ",
            expected: "a"
          }, {
            src: "\r\n\t\f\v a \v\r\n\t\f",
            expected: "a"
          }, {
            src: "\r\n\t\f\v hello world \v\r\n\t\f",
            expected: "hello world"
          }, {
            description: "stripper contains regexp special symbols"
          }, {
            src: {
              src: "\\s\\s",
              stripper: "\\s"
            },
            expected: ""
          }, {
            src: {
              src: "(x)(x)",
              stripper: "(x)"
            },
            expected: ""
          }, {
            src: {
              src: "abc",
              stripper: "[abc]"
            },
            expected: "abc"
          }, {
            src: {
              src: "[abc]",
              stripper: "[abc]"
            },
            expected: ""
          }, {
            src: {
              src: "abc",
              stripper: "[^abc]"
            },
            expected: "abc"
          }, {
            src: {
              src: "abc",
              stripper: "[a-c]"
            },
            expected: "abc"
          }, {
            src: {
              src: "[a-c]",
              stripper: "[a-c]"
            },
            expected: ""
          }, {
            src: {
              src: "ab(a|b)",
              stripper: "(a|b)"
            },
            expected: "ab"
          }, {
            src: {
              src: "gp",
              stripper: "a+"
            },
            expected: "gp"
          }, {
            src: {
              src: "hp",
              stripper: "b{3}"
            },
            expected: "hp"
          }, {
            src: {
              src: "acbc",
              stripper: "^[ab]c$"
            },
            expected: "acbc"
          }, {
            description: "stripper is regexp"
          }, {
            src: {
              src: " abc",
              stripper: /[abc]/
            },
            expected: " bc"
          }, {
            src: {
              src: "abc",
              stripper: /\D/
            },
            expected: "bc"
          }, {
            src: {
              src: "abc",
              stripper: /[abc]$/
            },
            expected: "ab"
          }, {
            src: {
              src: "abc",
              stripper: /abc/
            },
            expected: ""
          }, {
            src: {
              src: "hello",
              stripper: /lo?/
            },
            expected: "helo"
          }, {
            description: "defaults, src is an array",
            src: [ "", "a", "   a   ", " \0 a \0 ", "\r\n\t\f\v a \v\r\n\t\f" ],
            expected: [ "", "a", "a", "a", "a" ]
          }, {
            description: "src array of strings, custom stripper",
            src: {
              src: [ "", "a", " a ", "  a  ", " \n ", " a b c " ],
              stripper: " "
            },
            expected: [ "", "a", "a", "a", "\n", "abc" ]
          }, {
            description: "src array of strings, custom stripper as regexp",
            src: {
              src: [ "x", "xx", "axbxc", "x\nx" ],
              stripper: new RegExp("x")
            },
            expected: [ "", "x", "abxc", "\nx" ]
          }, {
            description: "src array of strings, custom stripper as regexp",
            src: {
              src: [ "abc", "acb", "bac", "cab" ],
              stripper: /abc|[abc]/
            },
            expected: [ "", "cb", "ac", "ab" ]
          }, {
            description: "src array of strings, custom stripper as regexp",
            src: {
              src: [ "abc", "acb", "bac", "bca", "cba", "cab" ],
              stripper: /[abc]/g
            },
            expected: [ "", "", "", "", "", "" ]
          }, {
            description: "src string, stripper array of strings",
            src: {
              src: "xxyy",
              stripper: [ "x", "y" ]
            },
            expected: ""
          }, {
            src: {
              src: "jjkk",
              stripper: [ "x", "y" ]
            },
            expected: "jjkk"
          }, {
            description: "invalid type",
            args: 0,
            err: !0
          }, {
            description: "too many arguments",
            args: [ "a", "" ],
            err: !0
          }, {
            description: "null argument",
            args: [ null ],
            err: !0
          }, {
            description: "NaN arguments",
            args: [ NaN ],
            err: !0
          }, {
            description: "one string has invalid type",
            args: [ [ "a", 0, "b" ] ],
            err: !0
          }, {
            description: "stripper has invalid type",
            args: [ {
              src: "a",
              stripper: 0
            } ],
            err: !0
          }, {
            description: "stripper has invalid type",
            args: [ {
              src: "a",
              stripper: [ "a", 0 ]
            } ],
            err: !0
          }, {
            description: "null stripper",
            args: [ {
              src: [ "a", "b" ],
              stripper: null
            } ],
            err: !0
          }, {
            description: "NaN stripper",
            args: [ {
              src: [ "a", "b" ],
              stripper: NaN
            } ],
            err: !0
          } ], n = 0; n < i.length; n++) {
            var r = i[n];
            if (r.description && (t.case = r.description), r.err && t.shouldThrowError(() => e.strStrip.apply(e, e.arrayAs(r.args))), 
            r.src && !t.identical(e.strStrip(r.src), r.expected)) {
              debugger;
              t.identical(e.strStrip(r.src), r.expected);
              debugger;
            }
          }
        }
        //
        ,
        strStripLeft: function strStripLeft(t) {
          /**/
          for (var i = [ {
            description: "defaults, src is a string"
          }, {
            src: "   a   ",
            expected: "a   "
          }, {
            src: " \0 a \0 ",
            expected: "a \0 "
          }, {
            src: "\r\v a \v\r\n\t\f",
            expected: "a \v\r"
          }, {
            src: "\0 hello world \0",
            expected: "hello world \0"
          }, {
            description: "defaults, src is an array",
            src: [ "", "a", "   a   ", " \0 a \0 ", "\r\n\t\f\v a \v\r" ],
            expected: [ "", "a", "a   ", "a \0 ", "a \v\r" ]
          }, {
            description: "invalid type",
            args: 0,
            err: !0
          }, {
            description: "too many arguments",
            args: [ "a", "" ],
            err: !0
          }, {
            description: "null argument",
            args: [ null ],
            err: !0
          }, {
            description: "NaN arguments",
            args: [ NaN ],
            err: !0
          }, {
            description: "one string has invalid type",
            args: [ [ "a", 0, "b" ] ],
            err: !0
          } ], n = 0; n < i.length; n++) {
            var r = i[n];
            if (r.description && (t.case = r.description), r.err && t.shouldThrowError(() => e.strStripLeft.apply(e, e.arrayAs(r.args))), 
            r.src && !t.identical(e.strStripLeft(r.src), r.expected)) {
              debugger;
              t.identical(e.strStripLeft(r.src), r.expected);
              debugger;
            }
          }
        }
        //
        ,
        strStripRight: function strStripRight(t) {
          /**/
          for (var i = [ {
            description: "defaults, src is a string"
          }, {
            src: "   ul   ",
            expected: "   ul"
          }, {
            src: " \0 om \0 ",
            expected: " \0 om"
          }, {
            src: "\r\v a \v\n\t\f\r",
            expected: "\r\v a"
          }, {
            src: "\0 hello world \0",
            expected: "\0 hello world"
          }, {
            description: "defaults, src is an array",
            src: [ "", "a", "   a   ", " \0 a \0 ", "\r\v a \v\n\t\f\r" ],
            expected: [ "", "a", "   a", " \0 a", "\r\v a" ]
          }, {
            description: "invalid type",
            args: 0,
            err: !0
          }, {
            description: "too many arguments",
            args: [ "a", "" ],
            err: !0
          }, {
            description: "null argument",
            args: [ null ],
            err: !0
          }, {
            description: "NaN arguments",
            args: [ NaN ],
            err: !0
          }, {
            description: "one string has invalid type",
            args: [ [ "a", 0, "b" ] ],
            err: !0
          } ], n = 0; n < i.length; n++) {
            var r = i[n];
            if (r.description && (t.case = r.description), r.err && t.shouldThrowError(() => e.strStripRight.apply(e, e.arrayAs(r.args))), 
            r.src && !t.identical(e.strStripRight(r.src), r.expected)) {
              debugger;
              t.identical(e.strStripRight(r.src), r.expected);
              debugger;
            }
          }
        }
        //
        ,
        strRemoveAllSpaces: function strRemoveAllSpaces(t) {
          t.case = "removes the spaces from the borders";
          var i = e.strRemoveAllSpaces("  abcdef  "), n = "abcdef";
          t.identical(i, n), t.case = "removes the spaces from the given string", i = e.strRemoveAllSpaces("a b c d e f"), 
          n = "abcdef", t.identical(i, n), t.case = "replaces the all spaces with the commas", 
          i = e.strRemoveAllSpaces("a b c d e f", ","), n = "a,b,c,d,e,f", t.identical(i, n), 
          t.case = "simple string, default options", i = e.strRemoveAllSpaces("a b c d e"), 
          n = "abcde", t.identical(i, n), t.case = "sub defined", i = e.strRemoveAllSpaces("a b c d e", ", "), 
          n = "a, b, c, d, e", t.identical(i, n), t.case = "empty string", i = e.strRemoveAllSpaces(" "), 
          n = "", t.identical(i, n), t.case = "sub as word", i = e.strRemoveAllSpaces("a b c", " and "), 
          n = "a and b and c", t.identical(i, n), t.case = "sub as number", i = e.strRemoveAllSpaces("a b c", 0), 
          n = "a0b0c", t.identical(i, n), t.case = "sub as array", i = e.strRemoveAllSpaces("a b c d e", [ 5, 6 ]), 
          n = "a5,6b5,6c5,6d5,6e", t.identical(i, n), t.case = "sub as null", i = e.strRemoveAllSpaces("a b c d e", null), 
          n = "anullbnullcnulldnulle", t.identical(i, n), t.case = "sub as NaN", i = e.strRemoveAllSpaces("a b c d e", NaN), 
          n = "aNaNbNaNcNaNdNaNe", t.identical(i, n), t.case = "sub as regexp", i = e.strRemoveAllSpaces("a b c d e", /a$/), 
          n = "a/a$/b/a$/c/a$/d/a$/e", t.identical(i, n), t.case = "vectorized input", i = e.strRemoveAllSpaces([ "  a b ", "c  d ", " e f " ]), 
          n = [ "ab", "cd", "ef" ], t.identical(i, n), t.case = "vectorized input", i = e.strRemoveAllSpaces([ "  a b ", "c  d ", " e f " ], "-"), 
          n = [ "--a-b-", "c--d-", "-e-f-" ], t.identical(i, n), t.case = "vectorized input", 
          i = e.strRemoveAllSpaces([ "  a b ", "c  d ", " e f " ], 3), n = [ "33a3b3", "c33d3", "3e3f3" ], 
          t.identical(i, n), t.case = "vectorized input", i = e.strRemoveAllSpaces([ "a b", "cd ", " ef" ], [ 0, 1 ]), 
          n = [ "a0,1b", "cd0,1", "0,1ef" ], t.identical(i, n), t.case = "invalid arguments count", 
          t.shouldThrowError(function() {
            e.strRemoveAllSpaces("1", "2", "3");
          }), t.case = "invalid argument type", t.shouldThrowError(function() {
            e.strRemoveAllSpaces(123);
          }), t.case = "no arguments", t.shouldThrowError(function() {
            e.strRemoveAllSpaces();
          }), t.case = "argument is wrong", t.shouldThrowError(function() {
            e.strRemoveAllSpaces(13);
          }), t.case = "too many arguments", t.shouldThrowError(function() {
            e.strRemoveAllSpaces("a b c d e f", ",", "redundant argument");
          }), t.case = "Null argument", t.shouldThrowError(function() {
            e.strRemoveAllSpaces(null);
          }), t.case = "NaN argument", t.shouldThrowError(function() {
            e.strRemoveAllSpaces(NaN);
          }), t.case = "Regexp argument", t.shouldThrowError(function() {
            e.strRemoveAllSpaces(/^a/);
          });
        }
        //
        ,
        strStripEmptyLines: function strStripEmptyLines(t) {
          t.case = "simple string";
          var i = e.strStripEmptyLines("line_one\n\nline_two"), n = "line_one\nline_two";
          t.identical(i, n), t.case = "empty string", i = e.strStripEmptyLines(""), n = "", 
          t.identical(i, n), t.case = "single line", i = e.strStripEmptyLines("b"), n = "b", 
          t.identical(i, n), t.case = "multiple breaklines", i = e.strStripEmptyLines("\n\na\n\nb\n\n\n"), 
          n = "a\nb", t.identical(i, n), t.case = "Lines with spaces", i = e.strStripEmptyLines(" line one\n\n line two \n\n line 3 \n"), 
          n = " line one\n line two \n line 3 ", t.identical(i, n), t.case = "Lines with spaces and tabs", 
          i = e.strStripEmptyLines(" line one\n\t\n\n line \t two \n\n line 3 \n"), n = " line one\n line \t two \n line 3 ", 
          t.identical(i, n), t.case = "Array input", i = e.strStripEmptyLines([ "  a \n\n b ", " \nc  d \n\n\n " ]), 
          n = [ "  a \n b ", "c  d " ], t.identical(i, n), t.case = "Empty array input", i = e.strStripEmptyLines([]), 
          n = [], t.identical(i, n), t.case = "invalid arguments count", t.shouldThrowError(function() {
            e.strStripEmptyLines("1", "2", "3");
          }), t.case = "invalid argument type", t.shouldThrowError(function() {
            e.strStripEmptyLines(123);
          }), t.case = "no arguments", t.shouldThrowError(function() {
            e.strStripEmptyLines();
          }), t.case = "null argument", t.shouldThrowError(function() {
            e.strStripEmptyLines(null);
          }), t.case = "NaN argument", t.shouldThrowError(function() {
            e.strStripEmptyLines(NaN);
          }), t.case = "Regexp argument", t.shouldThrowError(function() {
            e.strStripEmptyLines(/a?$/);
          }), t.case = "Array with wrong arguments", t.shouldThrowError(function() {
            e.strStripEmptyLines([ null, NaN, 3, /a?$/ ]);
          });
        }
        //
        ,
        strSub: function strSub(t) {
          t.case = "simple string - get all";
          var i = e.strSub("Hello", [ 0, 5 ]), n = "Hello";
          t.identical(i, n), t.case = "simple string - range bigger than length", i = e.strSub("Hello", [ 0, 8 ]), 
          n = "Hello", t.identical(i, n), t.case = "simple string - get subString", i = e.strSub("Hello", [ 0, 4 ]), 
          n = "Hell", t.identical(i, n), t.case = "simple string - get end of string", i = e.strSub("Hello", [ 3, 5 ]), 
          n = "lo", t.identical(i, n), t.case = "simple string - range reversed", i = e.strSub("Hello", [ 4, 0 ]), 
          n = "Hell", t.identical(i, n), t.case = "simple string - range in the middle of the string", 
          i = e.strSub("Hello", [ 2, 3 ]), n = "l", t.identical(i, n), t.case = "empty string", 
          i = e.strSub("", [ 2, 3 ]), n = "", t.identical(i, n), t.case = "Input array", i = e.strSub([ "Hello", "World" ], [ 3, 4 ]), 
          n = [ "l", "l" ], t.identical(i, n), t.case = "no arguments", t.shouldThrowError(function() {
            e.strSub();
          }), t.case = "Too many arguments", t.shouldThrowError(function() {
            e.strSub("1", "2", "3");
          }), t.case = "Too many ranges", t.shouldThrowError(function() {
            e.strSub("Hello world", [ 0, 1 ], [ 2, 3 ]);
          }), t.case = "Not enough arguments", t.shouldThrowError(function() {
            e.strSub("1");
          }), t.case = "invalid argument type", t.shouldThrowError(function() {
            e.strSub(123, [ 0, 1 ]);
          }), t.case = "null argument", t.shouldThrowError(function() {
            e.strSub(null, [ 0, 1 ]);
          }), t.case = "NaN argument", t.shouldThrowError(function() {
            e.strSub(NaN, [ 0, 1 ]);
          }), t.case = "Regexp argument", t.shouldThrowError(function() {
            e.strSub(/a?$/, [ 0, 1 ]);
          }), t.case = "invalid argument range", t.shouldThrowError(function() {
            e.strSub("hi ", 123);
          }), t.case = "null range", t.shouldThrowError(function() {
            e.strSub("good morning", null);
          }), t.case = "NaN range", t.shouldThrowError(function() {
            e.strSub("good afternoon", NaN);
          }), t.case = "Regexp range", t.shouldThrowError(function() {
            e.strSub("good night", /a?$/);
          }), t.case = "Array with wrong arguments", t.shouldThrowError(function() {
            e.strSub([ null, NaN, 3, /a?$/ ], [ 0, 1 ]);
          }), t.case = "Range array with wrong arguments", t.shouldThrowError(function() {
            e.strSub([ "Hello", "world" ], [ null, NaN ]);
          }), t.case = "Range array empty", t.shouldThrowError(function() {
            e.strSub([ "Hello", "world" ], []);
          }), t.case = "Range array with not enough arguments", t.shouldThrowError(function() {
            e.strSub([ "Hello", "world" ], [ 2 ]);
          }), t.case = "Range array with too many arguments", t.shouldThrowError(function() {
            e.strSub([ "Hello", "world" ], [ 2, 3, 4 ]);
          });
        }
        //
        ,
        strReplaceWords: function strReplaceWords(t) {
          t.case = "simple string";
          var i = e.strReplaceWords("a b c d", [ "b", "c" ], [ "x", "y" ]), n = "a x y d";
          t.identical(i, n), t.case = "escaping string", i = e.strReplaceWords("\na b \n c d", [ "b", "c" ], [ "x", "y" ]), 
          n = "\na x \n y d", t.identical(i, n), t.case = "invalid arguments count", t.shouldThrowError(function() {
            e.strReplaceWords("1", "2");
          }), t.case = "invalid argument type", t.shouldThrowError(function() {
            e.strReplaceWords(123, [], []);
          }), t.case = "invalid arrays length", t.shouldThrowError(function() {
            e.strReplaceWords("one two", [ "one" ], [ "one", "two" ]);
          }), t.case = "invalid second arg type", t.shouldThrowError(function() {
            e.strReplaceWords("one two", 5, [ "one", "two" ]);
          }), t.case = "no arguments", t.shouldThrowError(function() {
            e.strReplaceWords();
          });
        }
        //
        ,
        strJoin: function strJoin(t) {
          /* - */
          t.open("single argument"), t.case = "join nothing";
          var i = e.strJoin([]), n = [];
          t.identical(i, n), t.case = "join empty vector", i = e.strJoin([ [] ]), n = [], 
          t.identical(i, n), t.case = "join empty vectors", i = e.strJoin([ [], [] ]), n = [], 
          t.identical(i, n), t.case = "join empty vector and string", i = e.strJoin([ [], "abc" ]), 
          n = [], t.identical(i, n), 
          // test.case = 'join empty vector and strings';
          // var got = _.strJoin([ [], [ 'abc', 'def' ] ]);
          // var expected = [];
          // test.identical( got, expected );
          t.case = "join numbers", i = e.strJoin([ 1, 2, 3 ]), n = "123", t.identical(i, n), 
          t.case = "join strings", i = e.strJoin([ "1", "2", "3" ]), n = "123", t.identical(i, n), 
          t.case = "join two arrays", i = e.strJoin([ [ "b", "c" ], [ "x", "y" ] ]), n = [ "bx", "cy" ], 
          t.identical(i, n), t.case = "join string + number", i = e.strJoin([ 1, 2, "3" ]), 
          n = "123", t.identical(i, n), t.case = "join array + string", i = e.strJoin([ [ 1, 2 ], "3" ]), 
          n = [ "13", "23" ], t.identical(i, n), t.case = "join array + number", i = e.strJoin([ [ 1, 2 ], 3 ]), 
          n = [ "13", "23" ], t.identical(i, n), t.case = "one argument", i = e.strJoin([ "1" ]), 
          n = "1", t.identical(i, n), t.case = "NaN argument", i = e.strJoin([ "1", NaN ]), 
          n = "1NaN", t.identical(i, n), t.case = "different types", i = e.strJoin([ 1, "2", [ "3", 4 ], 5, "6" ]), 
          n = [ "12356", "12456" ], t.identical(i, n), t.case = "different types with two arrays", 
          i = e.strJoin([ "1", 2, [ 3, 4, 5 ], [ 6, 7, 8 ] ]), n = [ "1236", "1247", "1258" ], 
          t.identical(i, n), t.close("single argument"), 
          /* - */
          t.open("two arguments"), t.case = "join number array with joiner", i = e.strJoin([ 1, 2 ], "3"), 
          n = "132", t.identical(i, n), t.case = "join string array with joiner", i = e.strJoin([ "b", "c" ], "0"), 
          n = "b0c", t.identical(i, n), t.case = "join string array with joiner", i = e.strJoin([ "Hello", "world", "!" ], " "), 
          n = "Hello world !", t.identical(i, n), t.case = "join array and joiner", i = e.strJoin([ 0, [ "1", "2" ] ], "3"), 
          n = [ "031", "032" ], t.identical(i, n), t.case = "join arrays and joiner", i = e.strJoin([ 0, [ "1", "2" ], [ "a", "b" ] ], "-"), 
          n = [ "0-1-a", "0-2-b" ], t.identical(i, n), t.case = "join umber arrays and joiner", 
          i = e.strJoin([ [ 0, 3, 6 ], [ 1, 4, 7 ], [ 2, 5, 8 ] ], "x"), n = [ "0x1x2", "3x4x5", "6x7x8" ], 
          t.identical(i, n), t.case = "join array + string + joiner", i = e.strJoin([ [ 1, 2 ], "3" ], "__"), 
          n = [ "1__3", "2__3" ], t.identical(i, n), t.case = "Undefined joiner", i = e.strJoin([ [ 1, 2 ], "3" ], void 0), 
          n = [ "13", "23" ], t.identical(i, n), t.close("two arguments"), t.case = "No arguments", 
          t.shouldThrowError(function() {
            e.strJoin();
          }), t.case = "Too many arguments", t.shouldThrowError(function() {
            e.strJoin("1", "2", "3");
          }), t.case = "Empty arguments", t.shouldThrowError(function() {
            e.strJoin([], []);
          }), t.case = "invalid argument type in array", t.shouldThrowError(function() {
            e.strJoin([ {
              a: 1
            }, [ 1 ], [ 2 ] ]);
          }), t.case = "null argument in array", t.shouldThrowError(function() {
            e.strJoin([ "1", null ]);
          }), t.case = "null argument in array", t.shouldThrowError(function() {
            e.strJoin([ "1", void 0 ]);
          }), t.case = "RegExp argument in array", t.shouldThrowError(function() {
            e.strJoin([ "1", /a?/ ]);
          }), t.case = "arrays with different lengths in array", t.shouldThrowError(function() {
            e.strJoin([ [ 1, 2 ], [ 1 ], [ 2 ] ]);
          }), t.case = "invalid argument type", t.shouldThrowError(function() {
            e.strJoin({
              a: 1
            }, [ 1 ]);
          }), t.case = "null argument", t.shouldThrowError(function() {
            e.strJoin([ "1" ], null, null);
          }), t.case = "NaN argument", t.shouldThrowError(function() {
            e.strJoin([ "1" ], NaN);
          }), t.case = "Wrong argument", t.shouldThrowError(function() {
            e.strJoin("1", 2);
          }), t.case = "RegExp argument", t.shouldThrowError(function() {
            e.strJoin("1", /a?/);
          }), t.case = "arrays with different length", t.shouldThrowError(function() {
            e.strJoin([ 1, 2 ], [ 1 ]);
          });
        }
        //
        ,
        strJoinPath: function strJoinPath(t) {
          // Simple
          t.case = "Empty";
          var i = e.strJoinPath([], ""), n = "";
          t.identical(i, n), t.case = "join string array with joiner", i = e.strJoinPath([ "b", "c" ], "0"), 
          n = "b0c", t.identical(i, n), t.case = "join string array with joiner", i = e.strJoinPath([ "Hello", "world", "!" ], " "), 
          n = "Hello world !", t.identical(i, n), t.case = "join array with joiner", i = e.strJoinPath([ "1", "2", "4" ], "/"), 
          n = "1/2/4", t.identical(i, n), t.case = "join array with joiner ( only numbers )", 
          i = e.strJoinPath([ 1, 2, 4 ], "/"), n = "1/2/4", t.identical(i, n), t.case = "join array with joiner ( string and numbers )", 
          i = e.strJoinPath([ 1, "4 is smaller than 2", 4 ], "/"), n = "1/4 is smaller than 2/4", 
          t.identical(i, n), t.case = "join array and joiner", i = e.strJoinPath([ "0", [ "1", "2" ] ], "3"), 
          n = [ "031", "032" ], t.identical(i, n), t.case = "join arrays and joiner", i = e.strJoinPath([ "0", [ "1", "2" ], [ "a", "b" ] ], "-"), 
          n = [ "0-1-a", "0-2-b" ], t.identical(i, n), t.case = "join arrays and joiner", 
          i = e.strJoinPath([ [ "0", "3", "6" ], [ "1", "4", "7" ], [ "2", "5", "8" ] ], "x"), 
          n = [ "0x1x2", "3x4x5", "6x7x8" ], t.identical(i, n), t.case = "join array + string + joiner", 
          i = e.strJoinPath([ [ "1", "2" ], "3" ], "__"), n = [ "1__3", "2__3" ], t.identical(i, n), 
          t.case = "join array + string + joiner ( with numbers )", i = e.strJoinPath([ [ 1, 2 ], 3, "string" ], "__"), 
          n = [ "1__3__string", "2__3__string" ], t.identical(i, n), 
          //Joiner in src strings
          t.case = "String does not end with joiner", i = e.strJoinPath([ "Hi,", "world" ], "/"), 
          n = "Hi,/world", t.identical(i, n), t.case = "String ends with joiner", i = e.strJoinPath([ "Hi,", "world" ], ","), 
          n = "Hi,world", t.identical(i, n), t.case = "String ends with joiner", i = e.strJoinPath([ "Hi,", "world", 2 ], ","), 
          n = "Hi,world,2", t.identical(i, n), t.case = "String does not begin with joiner", 
          i = e.strJoinPath([ "Hi", ",world" ], "/"), n = "Hi/,world", t.identical(i, n), 
          t.case = "String begins with joiner", i = e.strJoinPath([ "Hi", ",world" ], ","), 
          n = "Hi,world", t.identical(i, n), t.case = "String begins and ends with joiner", 
          i = e.strJoinPath([ "/1/", "/2/", "/3/", 4, "/5/" ], "/"), n = "/1/2/3/4/5/", t.identical(i, n), 
          t.case = "String begins and ends with joiner", i = e.strJoinPath([ "/1//", "/2//", "//4/" ], "/"), 
          n = "/1//2///4/", t.identical(i, n), t.case = "No arguments", t.shouldThrowError(function() {
            e.strJoinPath();
          }), t.case = "Too few arguments", t.shouldThrowError(function() {
            e.strJoinPath([ "1" ]);
          }), t.case = "Too many arguments", t.shouldThrowError(function() {
            e.strJoinPath([ "1" ], "2", "3");
          }), t.case = "invalid argument type in array", t.shouldThrowError(function() {
            e.strJoinPath([ {
              a: 1
            }, [ "1" ], [ "2" ] ], "/");
          }), t.case = "null argument in array", t.shouldThrowError(function() {
            e.strJoinPath([ "1", null ], "/");
          }), t.case = "null argument in array", t.shouldThrowError(function() {
            e.strJoinPath([ "1", void 0 ], "/");
          }), t.case = "RegExp argument in array", t.shouldThrowError(function() {
            e.strJoinPath([ "1", /a?/ ], "/");
          }), t.case = "arrays with different lengths in array", t.shouldThrowError(function() {
            e.strJoinPath([ [ 1, 2 ], [ 1 ], [ 2 ] ], "/");
          }), t.case = "invalid argument type", t.shouldThrowError(function() {
            e.strJoinPath({
              a: 1
            }, [ 1 ]);
          }), t.case = "null argument", t.shouldThrowError(function() {
            e.strJoinPath([ "1" ], null);
          }), t.case = "NaN argument", t.shouldThrowError(function() {
            e.strJoinPath([ "1" ], NaN);
          }), t.case = "Wrong argument", t.shouldThrowError(function() {
            e.strJoinPath("1", 2);
          }), t.case = "RegExp argument", t.shouldThrowError(function() {
            e.strJoinPath("1", /a?/);
          }), t.case = "arrays with different length", t.shouldThrowError(function() {
            e.strJoinPath([ [ 1, 2 ], [ 1 ] ], "/");
          });
        }
        //
        ,
        strUnjoin: function strUnjoin(t) {
          var i = e.strUnjoin.any;
          t.case = "case 1";
          var n = e.strUnjoin("prefix_something_postfix", [ "prefix", i, "postfix" ]), r = [ "prefix", "_something_", "postfix" ];
          t.identical(n, r), t.case = "case 2a", n = e.strUnjoin("prefix_something_postfix", [ i, "something", "postfix" ]), 
          r = void 0, t.identical(n, r), t.case = "case 2b", n = e.strUnjoin("prefix_something_postfix", [ i, "something", i, "postfix" ]), 
          r = [ "prefix_", "something", "_", "postfix" ], t.identical(n, r), t.case = "case 3a", 
          n = e.strUnjoin("prefix_something_postfix", [ "something", "postfix", i ]), r = void 0, 
          t.identical(n, r), t.case = "case 3b", n = e.strUnjoin("prefix_something_postfix", [ i, "something", i, "postfix", i ]), 
          r = [ "prefix_", "something", "_", "postfix", "" ], t.identical(n, r), t.case = "case 4", 
          n = e.strUnjoin("abc", [ i ]), r = [ "abc" ], t.identical(n, r), t.case = "case 5", 
          n = e.strUnjoin("abc", [ "a", i ]), r = [ "a", "bc" ], t.identical(n, r), t.case = "case 5b", 
          n = e.strUnjoin("abc", [ i, "a" ]), r = void 0, t.identical(n, r), t.case = "case 6", 
          n = e.strUnjoin("abc", [ "b", i ]), r = void 0, t.identical(n, r), t.case = "case 6b", 
          n = e.strUnjoin("abc", [ i, "b" ]), r = void 0, t.identical(n, r), t.case = "case 7", 
          n = e.strUnjoin("abc", [ i, "c" ]), r = [ "ab", "c" ], t.identical(n, r), t.case = "case 7b", 
          n = e.strUnjoin("abc", [ "c", i ]), r = void 0, t.identical(n, r), t.case = "case 8", 
          n = e.strUnjoin("abc", [ "a", i, "c" ]), r = [ "a", "b", "c" ], t.identical(n, r), 
          t.case = "case 9", n = e.strUnjoin("abc", [ i, "b", i ]), r = [ "a", "b", "c" ], 
          t.identical(n, r), t.case = "case 9b", n = e.strUnjoin("abc", [ i, "c", i ]), r = [ "ab", "c", "" ], 
          t.identical(n, r), t.case = "no arguments", t.shouldThrowError(function() {
            e.strUnjoin();
          }), t.case = "Not enough arguments", t.shouldThrowError(function() {
            e.strUnjoin("1");
          }), t.case = "Too many arguments", t.shouldThrowError(function() {
            e.strUnjoin("1", "2", "3");
          }), t.case = "invalid first argument type", t.shouldThrowError(function() {
            e.strUnjoin(123, []);
          }), t.case = "invalid second arg type", t.shouldThrowError(function() {
            e.strUnjoin("one two", 123);
          }), t.case = "invalid array element type", t.shouldThrowError(function() {
            e.strUnjoin("one two", [ 1, "two" ]);
          }), t.case = "null first argument type", t.shouldThrowError(function() {
            e.strUnjoin(null, []);
          }), t.case = "null second arg type", t.shouldThrowError(function() {
            e.strUnjoin("one two", null);
          }), t.case = "null array element type", t.shouldThrowError(function() {
            e.strUnjoin("one two", [ null, "two" ]);
          }), t.case = "NaN first argument type", t.shouldThrowError(function() {
            e.strUnjoin(NaN, []);
          }), t.case = "NaN second arg type", t.shouldThrowError(function() {
            e.strUnjoin("one two", NaN);
          }), t.case = "NaN array element type", t.shouldThrowError(function() {
            e.strUnjoin("one two", [ NaN, "two" ]);
          }), t.case = "RegExp first argument type", t.shouldThrowError(function() {
            e.strUnjoin(/\d$/, []);
          }), t.case = "RegExp second arg type", t.shouldThrowError(function() {
            e.strUnjoin("one two", /\D$/);
          }), t.case = "RegExp array element type", t.shouldThrowError(function() {
            e.strUnjoin("one two", [ /^\d/, "two" ]);
          });
        }
        //
        ,
        strUnicodeEscape: function strUnicodeEscape(t) {
          t.case = "simple string";
          var i = e.strUnicodeEscape("prefix"), n = "\\u0070\\u0072\\u0065\\u0066\\u0069\\u0078";
          t.identical(i, n), t.case = "escaping", i = e.strUnicodeEscape("\npostfix//"), n = "\\u000a\\u0070\\u006f\\u0073\\u0074\\u0066\\u0069\\u0078\\u002f\\u002f", 
          t.identical(i, n), t.case = "empty string", i = e.strUnicodeEscape(""), n = "", 
          t.identical(i, n), t.case = "invalid arguments count", t.shouldThrowError(function() {
            e.strUnicodeEscape("1", "2", "3");
          }), t.case = "invalid  argument type", t.shouldThrowError(function() {
            e.strUnicodeEscape(123);
          }), t.case = "no arguments", t.shouldThrowError(function() {
            e.strUnicodeEscape();
          });
        }
        //
        ,
        strCount: function strCount(t) {
          t.open("string"), t.case = "none";
          var i = e.strCount("abc", "z"), n = 0;
          t.identical(i, n), t.case = "nl", i = e.strCount("abc\ndef\nghi", "\n"), n = 2, 
          t.identical(i, n), t.case = "simple string", i = e.strCount("ababacabacabaaba", "aba"), 
          n = 4, t.identical(i, n), t.case = "empty src", i = e.strCount("", "abc"), n = 0, 
          t.identical(i, n), t.case = "empty ins", i = e.strCount("abc", ""), n = 3, t.identical(i, n), 
          t.close("string"), 
          /* */
          t.open("regexp"), t.case = "none", i = e.strCount("abc", /z/), n = 0, t.identical(i, n), 
          t.case = "nl", i = e.strCount("abc\ndef\nghi", /\n/m), n = 2, t.identical(i, n), 
          t.case = "simple string", i = e.strCount("ababacabacabaaba", /aba/), n = 4, t.identical(i, n), 
          t.case = "empty src", i = e.strCount("", /a/), n = 0, t.identical(i, n), t.case = "empty ins", 
          i = e.strCount("abc", RegExp("")), n = 3, t.identical(i, n), t.close("regexp"), 
          t.case = "no arguments", t.shouldThrowError(function() {
            e.strCount();
          }), t.case = "first argument is wrong", t.shouldThrowError(function() {
            e.strCount([], "\n");
          }), t.case = "second argument is wrong", t.shouldThrowError(function() {
            e.strCount("abc\ndef\nghi", 13);
          }), t.case = "not enough arguments", t.shouldThrowError(function() {
            e.strCount("abc\ndef\nghi");
          }), t.case = "invalid arguments count", t.shouldThrowError(function() {
            e.strCount("1", "2", "3");
          }), t.case = "invalid first argument type", t.shouldThrowError(function() {
            e.strCount(123, "1");
          }), t.case = "invalid second arg type", t.shouldThrowError(function() {
            e.strCount("one two", 123);
          }), t.case = "no arguments", t.shouldThrowError(function() {
            e.strCount();
          });
        }
        //
        ,
        strDup: function strDup(t) {
          t.case = "srcString  and number of times remain unchanged";
          var i = e.strDup("Hi, ", 3), n = "Hi, Hi, Hi, ";
          t.identical(i, n), t.identical("Hi, ", "Hi, "), t.identical(3, 3), t.case = "concatenation test", 
          i = e.strDup("a", 2), n = "aa", t.identical(i, n), t.case = "simple string", i = e.strDup("ab", 2), 
          n = "abab", t.identical(i, n), t.case = "invalid times value", i = e.strDup("a", -2), 
          n = "", t.identical(i, n), t.case = "zero times", i = e.strDup("a", 0), n = "", 
          t.identical(i, n), t.case = "returns the empty string", i = e.strDup("abc ", 0), 
          n = "", t.identical(i, n), t.case = "Second argument NaN", i = e.strDup("abc", NaN), 
          n = "", t.identical(i, n), t.case = "Two words with a spaces", i = e.strDup("Hi world ", 2), 
          n = "Hi world Hi world ", t.identical(i, n), t.case = "one space", i = e.strDup(" ", 2), 
          n = "  ", t.identical(i, n), t.case = "returns the first copy of the given string", 
          i = e.strDup("abc", 1), n = "abc", t.identical(i, n), t.case = "copies and concatenates first argument three times", 
          i = e.strDup("abc", 3), n = "abcabcabc", t.identical(i, n), t.case = "copies and concatenates first argument 10 times", 
          i = e.strDup("1", 10), n = "1111111111", t.identical(i, n), t.case = "vectorized input concatenated negative times", 
          i = e.strDup([ "ab", "cd", "ef" ], -2), n = [ "", "", "" ], t.identical(i, n), t.case = "vectorized input concatenated zero times", 
          i = e.strDup([ "ab", "cd", "ef" ], 0), n = [ "", "", "" ], t.identical(i, n), t.case = "vectorized input concatenated one time", 
          i = e.strDup([ "ab", "cd", "ef" ], 1), n = [ "ab", "cd", "ef" ], t.identical(i, n), 
          t.case = "vectorized input concatenated 3 times", i = e.strDup([ "ab", "cd", "ef" ], 3), 
          n = [ "ababab", "cdcdcd", "efefef" ], t.identical(i, n), t.case = "Empty vectorized input", 
          i = e.strDup([], 3), n = [], t.identical(i, n), t.case = "no arguments", t.shouldThrowError(function() {
            e.strDup();
          }), t.case = "second argument is not provided", t.shouldThrowError(function() {
            e.strDup("a");
          }), t.case = "first argument is not provided", t.shouldThrowError(function() {
            e.strDup(3);
          }), t.case = "invalid arguments count", t.shouldThrowError(function() {
            e.strDup("1");
          }), t.case = "invalid arguments count", t.shouldThrowError(function() {
            e.strDup("1", "2", 3);
          }), t.case = "invalid arguments count", t.shouldThrowError(function() {
            e.strDup("1", "2", "3");
          }), t.case = "invalid first argument type", t.shouldThrowError(function() {
            e.strDup(123, 1);
          }), t.case = "times is not number", t.shouldThrowError(function() {
            e.strDup("ab", [ 3, 4 ]);
          }), t.case = "invalid second arg type", t.shouldThrowError(function() {
            e.strDup("one", "two");
          }), t.case = "second argument is wrong", t.shouldThrowError(function() {
            e.strDup("a", "wrong argument");
          }), t.case = "invalid first argument type", t.shouldThrowError(function() {
            e.strDup(1, 2);
          }), t.case = "invalid first argument type", t.shouldThrowError(function() {
            e.strDup([ 1, 2 ], 2);
          }), t.case = "invalid first argument type", t.shouldThrowError(function() {
            e.strDup([ "1", 2 ], 2);
          }), t.case = "invalid second argument type", t.shouldThrowError(function() {
            e.strDup("1", "2");
          }), t.case = "null argument", t.shouldThrowError(function() {
            e.strDup(null, 2);
          }), t.case = "null second argument", t.shouldThrowError(function() {
            e.strDup("2", null);
          }), t.case = "undefined argument", t.shouldThrowError(function() {
            e.strDup(void 0, 2);
          }), t.case = "undefined second argument", t.shouldThrowError(function() {
            e.strDup("2", void 0);
          }), t.case = "NaN argument", t.shouldThrowError(function() {
            e.strDup(NaN, 2);
          }), t.case = "Regexp argument", t.shouldThrowError(function() {
            e.strDup(/^\d/, 2);
          }), t.case = "regExp second argument", t.shouldThrowError(function() {
            e.strDup("2", /^\d/);
          });
        }
        //
        ,
        strLinesSelect: function strLinesSelect(t) {
          var i = "a\nb\nc\nd";
          /* */
          t.case = "single line selection", 
          /**/
          r = e.strLinesSelect("", 1), s = "", t.identical(r, s), 
          /**/
          r = e.strLinesSelect("abc", 1), s = "abc", t.identical(r, s), 
          /**/
          r = e.strLinesSelect("abc", 0), s = "", t.identical(r, s), 
          /**/
          r = e.strLinesSelect(i, 1), s = "a", t.identical(r, s), 
          /**/
          r = e.strLinesSelect(i, 2), s = "b", t.identical(r, s), 
          /**/
          r = e.strLinesSelect(i, -1), s = "", t.identical(r, s), 
          /* line number bigger then actual count of lines */
          r = e.strLinesSelect(i, 99), s = "", t.identical(r, s), 
          /**/
          r = e.strLinesSelect(i, 1, 2), s = "a", t.identical(r, s), 
          /**/
          r = e.strLinesSelect(i, [ 1, 2 ]), s = "a", t.identical(r, s), 
          /**/
          r = e.strLinesSelect(i, [ -1, 2 ]), s = "a", t.identical(r, s), 
          /* - */
          t.case = "multiline selection", 
          /**/
          r = e.strLinesSelect(i, [ -1, -1 ]), s = "", t.identical(r, s), 
          /**/
          r = e.strLinesSelect("", [ 1, 3 ]), s = "", t.identical(r, s), 
          /**/
          r = e.strLinesSelect(i, [ 1, 3 ]), s = "a\nb", t.identical(r, s), 
          /**/
          r = e.strLinesSelect(i, [ -1, 2 ]), s = "a", t.identical(r, s), 
          /**/
          r = e.strLinesSelect(i, [ 1, 4 ]), s = "a\nb\nc", t.identical(r, s), 
          /**/
          r = e.strLinesSelect(i, [ 99, 4 ]), s = "", t.identical(r, s), 
          /**/
          r = e.strLinesSelect(i, [ 1, 99 ]), s = i, t.identical(r, s), 
          /**/
          r = e.strLinesSelect(i, [ 2, 5 ]), s = "b\nc\nd", t.identical(r, s), 
          /**/
          r = e.strLinesSelect({
            src: i,
            range: [ 2, 5 ],
            zero: 4
          }), s = "a", t.identical(r, s), 
          /* - */
          t.case = "selection without range provided, selectMode : center", 
          /**/
          r = e.strLinesSelect({
            src: i,
            line: 2,
            numberOfLines: 3,
            selectMode: "center",
            zero: 1
          }), s = "a\nb\nc", t.identical(r, s), 
          /**/
          r = e.strLinesSelect({
            src: i,
            line: 1,
            numberOfLines: 3,
            selectMode: "center",
            zero: 1
          }), s = "a\nb", t.identical(r, s), 
          /**/
          r = e.strLinesSelect({
            src: i,
            line: 1,
            numberOfLines: 1,
            selectMode: "center",
            zero: 1
          }), s = "a", t.identical(r, s), 
          /**/
          r = e.strLinesSelect({
            src: i,
            line: 1,
            numberOfLines: 99,
            selectMode: "center",
            zero: 1
          }), s = i, t.identical(r, s), i = "a\nb\nc\nd", r = e.strLinesSelect({
            src: i,
            line: 1,
            numberOfLines: -1,
            selectMode: "center",
            zero: 1
          }), s = "", t.identical(r, s), 
          /**/
          r = e.strLinesSelect({
            src: i,
            line: 0,
            numberOfLines: 1,
            selectMode: "center",
            zero: 1
          }), s = "", t.identical(r, s), r = e.strLinesSelect({
            src: "",
            line: 1,
            numberOfLines: 1,
            selectMode: "center",
            zero: 1
          }), s = "", t.identical(r, s), 
          /* - */
          t.case = "selection without range provided, selectMode : begin", 
          /*two lines from begining of the string*/
          r = e.strLinesSelect({
            src: i,
            line: 1,
            numberOfLines: 2,
            selectMode: "begin",
            zero: 1
          }), s = "a\nb", t.identical(r, s), 
          /**/
          r = e.strLinesSelect({
            src: i,
            line: -1,
            numberOfLines: 2,
            selectMode: "begin",
            zero: 1
          }), s = "", t.identical(r, s), 
          /**/
          r = e.strLinesSelect({
            src: i,
            line: 1,
            numberOfLines: 0,
            selectMode: "begin",
            zero: 1
          }), s = "", t.identical(r, s), 
          /**/
          r = e.strLinesSelect({
            src: i,
            line: 1,
            numberOfLines: 99,
            selectMode: "begin",
            zero: 1
          }), s = i, t.identical(r, s), 
          /* zero > range[ 0 ] */
          r = e.strLinesSelect({
            src: i,
            line: 1,
            numberOfLines: 5,
            selectMode: "begin",
            zero: 2
          }), s = i, t.identical(r, s), 
          /* - */
          t.case = "selection without range provided, selectMode : end", 
          /**/
          r = e.strLinesSelect({
            src: i,
            line: 4,
            numberOfLines: 2,
            selectMode: "end"
          }), s = "c\nd", t.identical(r, s), 
          /**/
          r = e.strLinesSelect({
            src: i,
            line: -1,
            numberOfLines: 2,
            selectMode: "end"
          }), s = "", t.identical(r, s), 
          /**/
          r = e.strLinesSelect({
            src: i,
            line: 1,
            numberOfLines: 0,
            selectMode: "end"
          }), s = "", t.identical(r, s), 
          /**/
          r = e.strLinesSelect({
            src: i,
            line: 1,
            numberOfLines: 99,
            selectMode: "end"
          }), s = "a", t.identical(r, s), 
          /* zero > range[ 0 ] */
          r = e.strLinesSelect({
            src: i,
            line: 1,
            numberOfLines: 5,
            selectMode: "end",
            zero: 2
          }), s = "", t.identical(r, s), 
          /* - */
          t.case = "custom new line";
          var n = "a b c d"
          /**/;
          r = e.strLinesSelect({
            src: n,
            range: [ 1, 3 ],
            delimteter: " "
          }), s = "a b", t.identical(r, s), 
          /**/
          r = e.strLinesSelect({
            src: n,
            range: [ 1, 3 ],
            delimteter: "x"
          }), s = n, t.identical(r, s), 
          /* - */
          t.case = "number"
          /**/ , r = e.strLinesSelect({
            src: i,
            range: [ 1, 3 ],
            number: 1
          }), s = "1 : a\n2 : b", t.identical(r, s), i = "Lorem\n  ipsum dolor\n  sit amet,\n  consectetur\n  adipisicing\n  elit", 
          /* - */
          t.case = "first line";
          var r = e.strLinesSelect(i, 1), s = "Lorem";
          t.identical(r, s), 
          /* - */
          t.case = "first two lines", r = e.strLinesSelect(i, 1, 3), s = "Lorem\n  ipsum dolor", 
          t.identical(r, s), 
          /* - */
          t.case = "range as array", r = e.strLinesSelect(i, [ 1, 3 ]), s = "Lorem\n  ipsum dolor", 
          t.identical(r, s), t.case = "custom new line", n = "Lorem||ipsum dolor||sit amet||consectetur", 
          r = e.strLinesSelect({
            src: n,
            range: [ 3, 5 ],
            zero: 1,
            delimteter: "||"
          }), s = "sit amet||consectetur", t.identical(r, s), 
          /* - */
          t.case = "empty line, out of range", r = e.strLinesSelect({
            src: "",
            range: [ 1, 1 ]
          }), s = "", t.identical(r, s), 
          /* - */
          t.case = "empty line", r = e.strLinesSelect({
            src: "",
            range: [ 0, 1 ]
          }), s = "", t.identical(r, s), 
          /* - */
          t.case = "incorrect range", r = e.strLinesSelect({
            src: i,
            range: [ 2, 1 ]
          }), s = "", t.identical(r, s), t.case = "invalid first argument type", t.shouldThrowError(function() {
            e.strLinesSelect(1, 1);
          }), t.case = "invalid second argument type", t.shouldThrowError(function() {
            e.strLinesSelect("lorem\nipsum\n", "second");
          }), t.case = "no arguments", t.shouldThrowError(function() {
            e.strLinesSelect();
          }), t.case = "unknown property provided", t.shouldThrowError(function() {
            e.strLinesSelect({
              src: "lorem\nipsum\n",
              range: [ 0, 1 ],
              x: 1
            });
          });
        }
        //
        ,
        strLinesStrip: function strLinesStrip(t) {
          t.case = "Argument is only one string", t.case = "Src stays unchanged";
          var i = e.strLinesStrip("\na\n\nbc\ndef\n"), n = "a\nbc\ndef";
          t.identical(i, n), t.identical("\na\n\nbc\ndef\n", "\na\n\nbc\ndef\n"), t.case = "Empty string", 
          i = e.strLinesStrip(""), n = "", t.identical(i, n), t.case = "Only escape sequences", 
          i = e.strLinesStrip("\n\t\r"), n = "", t.identical(i, n), t.case = "String without escape sequences and begin/end spaces", 
          i = e.strLinesStrip("Hello world"), n = "Hello world", t.identical(i, n), t.case = "String with begin/end spaces", 
          i = e.strLinesStrip("  Hello world   "), n = "Hello world", t.identical(i, n), t.case = "String with begin/end escape sequences", 
          i = e.strLinesStrip("\t\r\nHello world\r\n\t"), n = "Hello world", t.identical(i, n), 
          t.case = "String with escape sequences", i = e.strLinesStrip("\n\tHello\r\n\tworld\r\n"), 
          n = "Hello\nworld", t.identical(i, n), t.case = "String with escape sequences", 
          i = e.strLinesStrip("\n\tHello\r\n\t\t\r\nworld\r\n"), n = "Hello\nworld", t.identical(i, n), 
          t.case = "String with escape sequences and spaces", i = e.strLinesStrip("\n\tHello  \r\n\t\t\r\n World \t\r\n! \r\n\t"), 
          n = "Hello\nWorld\n!", t.identical(i, n), 
          //
          t.case = "Argument is only one array", t.case = "Src stays unchanged";
          var r = [ "\na\n\nbc\ndef\n" ];
          i = e.strLinesStrip(r), n = [ "a\n\nbc\ndef" ], t.identical(i, n), t.identical(r, [ "\na\n\nbc\ndef\n" ]), 
          t.case = "Empty array", i = e.strLinesStrip([]), n = [], t.identical(i, n), t.case = "Empty array with empty string", 
          i = e.strLinesStrip([ "" ]), n = [], t.identical(i, n), t.case = "Only escape sequences", 
          i = e.strLinesStrip([ "", "\t\r\n" ]), n = [], t.identical(i, n), t.case = "String without escape sequences and begin/end spaces", 
          i = e.strLinesStrip([ "Hello world", "", "\t\r\n" ]), n = [ "Hello world" ], t.identical(i, n), 
          t.case = "String with begin/end spaces", i = e.strLinesStrip([ "  Hello ", " world   " ]), 
          n = [ "Hello", "world" ], t.identical(i, n), t.case = "String with begin/end escape sequences", 
          i = e.strLinesStrip([ "\t\r\nHello  ", "  world\r\n\t" ]), n = [ "Hello", "world" ], 
          t.identical(i, n), t.case = "String with escape sequences", i = e.strLinesStrip([ "\n\tHello\r\n\tworld\r\n" ]), 
          n = [ "Hello\r\n\tworld" ], t.identical(i, n), t.case = "String with escape sequences", 
          i = e.strLinesStrip("\n\tHello\r\n\t\t\r\nworld\r\n"), n = "Hello\nworld", t.identical(i, n), 
          t.case = "String with escape sequences and spaces", i = e.strLinesStrip([ "\n\tHello  \r\n\t\t\r\n World \t\r\n! \r\n\t", "  \nHow are you?  \r  \n  \t  " ]), 
          n = [ "Hello  \r\n\t\t\r\n World \t\r\n!", "How are you?" ], t.identical(i, n), 
          //
          t.case = "Several arguments", t.case = "Several strings", i = e.strLinesStrip("\n\tHello  \r\n\t\t\r\n", " World \t\r\n! \r\n\t", " \nHow are you?  "), 
          n = [ "Hello", "World\n!", "How are you?" ], t.identical(i, n), t.case = "Several arrays", 
          i = e.strLinesStrip([ "\n\tHello  \r\n\t\t\r\n", " World \t\r\n! \r\n\t" ], [ " \n\nHow  ", " \r\nare\t", " you \n ?  \r" ], [ "  \n\r\t " ]), 
          n = [ [ "Hello", "World \t\r\n!" ], [ "How", "are", "you \n ?" ], [] ], t.identical(i, n), 
          t.case = "Several strings and arrays", i = e.strLinesStrip("\n\tHello  \r\n\t\t\r\n", [ " World \t\r\n ", " ! \r\n\t" ], [ " \n\nHow  ", " \r\nare\t", " you \n ?  \r" ], " I am \n\r\t good \n\n "), 
          n = [ "Hello", [ "World", "!" ], [ "How", "are", "you \n ?" ], "I am\ngood" ], t.identical(i, n), 
          //
          t.case = "Compare input string and input array", t.case = "Input String";
          var s = "\n\tHello  \r\n\t\t\r\n World \t\r\n! \r\n\t\nHow are you?  ", a = e.strLinesStrip(s);
          n = [ "Hello", "World", "!", "How are you?" ], t.identical(a.split("\n"), n), t.case = "Input Array";
          var c = (s = "\n\tHello  \r\n\t\t\r\n World \t\r\n! \r\n\t\nHow are you?  ").split("\n"), l = e.strLinesStrip(c);
          n = [ "Hello", "World", "!", "How are you?" ], t.identical(l, n), t.case = "Input one line string and array", 
          c = [ s = "\tHello  World \t! \r" ], a = e.strLinesStrip(s), l = e.strLinesStrip(c), 
          t.identical(l[0], a), t.case = "Input string and array", c = (s = "\n\tHello  \r\n\t\t\r\n World \t\r\n! \r\n\t").split("\n"), 
          a = e.strLinesStrip(s), l = e.strLinesStrip(c), t.identical(l, a.split("\n")), t.case = "Several Inputs string and array";
          var d = "\n\tHello  \r\n\t\t\r\n World \t\r\n! \r\n\t", o = d.split("\n"), p = "  How \n\n Are \r\n\t you   today \t\r\n? \r\n", m = p.split("\n"), u = "\n\t  I \t am \r\n\t \t\r\n Great ! ", b = u.split("\n");
          a = e.strLinesStrip(d, p, u), l = e.strLinesStrip(o, m, b), t.identical(l[0], a[0].split("\n")), 
          t.identical(l[1], a[1].split("\n")), t.identical(l[2], a[2].split("\n")), t.case = "no arguments", 
          t.shouldThrowError(() => e.strLinesStrip()), t.case = "Wrong type of argument", 
          t.shouldThrowError(() => e.strLinesStrip(null)), t.shouldThrowError(() => e.strLinesStrip(void 0)), 
          t.shouldThrowError(() => e.strLinesStrip(NaN)), t.shouldThrowError(() => e.strLinesStrip(3)), 
          t.shouldThrowError(() => e.strLinesStrip([ 3 ])), t.shouldThrowError(() => e.strLinesStrip(/^a/));
        }
        //
        ,
        strLinesNumber: function strLinesNumber(t) {
          t.case = "trivial", t.case = "returns the object";
          var i = e.strLinesNumber("abc\ndef\nghi"), n = "1 : abc\n2 : def\n3 : ghi";
          t.identical(i, n), t.case = "returns the object", i = e.strLinesNumber([]), n = "", 
          t.identical(i, n), 
          /* - */
          t.case = "string", 
          /**/
          i = e.strLinesNumber(""), n = "1 : ", t.identical(i, n), 
          /**/
          i = e.strLinesNumber("a"), n = "1 : a", t.identical(i, n), 
          /**/
          i = e.strLinesNumber("a\nb"), n = "1 : a\n2 : b", t.identical(i, n), 
          /**/
          i = e.strLinesNumber("a\nb", 2), n = "2 : a\n3 : b", t.identical(i, n), 
          /**/
          i = e.strLinesNumber("line1\nline2\nline3"), n = [ "1 : line1", "2 : line2", "3 : line3" ].join("\n"), 
          t.identical(i, n), 
          /**/
          i = e.strLinesNumber("\n\n"), n = [ "1 : ", "2 : ", "3 : " ].join("\n"), t.identical(i, n), 
          /* - */
          t.case = "array", 
          /**/
          i = e.strLinesNumber([ "line1", "line2", "line3" ]), n = [ "1 : line1", "2 : line2", "3 : line3" ].join("\n"), 
          /**/
          i = e.strLinesNumber([ "line", "line", "line" ], 2), n = [ "2 : line", "3 : line", "4 : line" ].join("\n"), 
          /**/
          i = e.strLinesNumber([ "line\n", "line\n", "line\n" ]), n = [ "1 : line\n", "2 : line\n", "3 : line\n" ].join("\n"), 
          t.case = "no arguments", t.shouldThrowError(function() {
            e.strLinesNumber();
          }), t.case = "argument is wrong", t.shouldThrowError(function() {
            e.strLinesNumber(13);
          }), t.case = "invalid  argument type", t.shouldThrowError(function() {
            e.strLinesNumber(123);
          }), t.case = "no arguments", t.shouldThrowError(function() {
            e.strLinesNumber();
          });
        }
        //
        ,
        strLinesCount: function strLinesCount(t) {
          t.case = "returns 1";
          var i = "function( x, y ) { return x + y; }", n = e.strLinesCount(i), r = 1;
          t.identical(n, r), t.case = "returns 4", i = "function( x, y ) \n { \n   return x + y; \n }", 
          n = e.strLinesCount(i), r = 4, t.identical(n, r), t.case = "one line string test", 
          n = e.strLinesCount("one line"), r = 1, t.identical(n, r), t.case = "multiline string test", 
          n = e.strLinesCount("first line\nsecond line\nthird line"), r = 3, t.identical(n, r), 
          t.case = "multiline  text test", n = e.strLinesCount("one\n                             two\n                             three"), 
          r = 3, t.identical(n, r), t.case = "invalid arguments count", t.shouldThrowError(function() {
            e.strLinesCount("1", "2");
          }), t.case = "invalid argument type", t.shouldThrowError(function() {
            e.strLinesCount(123);
          }), t.case = "no arguments", t.shouldThrowError(function() {
            e.strLinesCount();
          }), t.case = "no arguments", t.shouldThrowError(function() {
            e.strLinesCount();
          }), t.case = "argument is wrong", t.shouldThrowError(function() {
            e.strLinesCount([ 1, "\n", 2 ]);
          }), t.case = "argument is wrong", t.shouldThrowError(function() {
            e.strLinesCount(13);
          }), t.case = "too many arguments", t.shouldThrowError(function() {
            e.strLinesCount("function( x, y ) \n { \n   return x + y; \n }", "redundant argument");
          });
        }
        //
        ,
        strLinesNearest: function strLinesNearest(t) {
          var i = "\na\nbc\ndef\nghij\n\n";
          /* - */          t.open("Range is a number"), 
          /*  */
          t.open("numberOfLines : 0");
          var n = 6, r = e.strSub(i, [ n, n + 1 ]), s = [ "", "d", "" ], a = [ 6, 6, 7, 7 ], c = e.strLinesNearest({
            src: i,
            charsRange: n,
            numberOfLines: 0
          });
          t.will = "check strLinesNearest", t.identical(c.splits, s), t.identical(c.spans, a), 
          t.will = "check strSub", t.identical(r, "d"), t.close("numberOfLines : 0"), 
          /*  */
          t.open("numberOfLines : 1"), n = 6, s = [ "", "d", "ef" ], a = [ 6, 6, 7, 9 ], c = e.strLinesNearest({
            src: i,
            charsRange: n,
            numberOfLines: 1
          }), t.will = "check strLinesNearest", t.identical(c.splits, s), t.identical(c.spans, a), 
          t.close("numberOfLines : 1"), 
          /*  */
          t.open("numberOfLines : 2"), n = 6, s = [ "bc\n", "d", "ef" ], a = [ 3, 6, 7, 9 ], 
          c = e.strLinesNearest({
            src: i,
            charsRange: n,
            numberOfLines: 2
          }), t.will = "check strLinesNearest", t.identical(c.splits, s), t.identical(c.spans, a), 
          t.close("numberOfLines : 2"), 
          /*  */
          t.open("numberOfLines : 8 ( > all lines )"), n = 6, s = [ "\na\nbc\n", "d", "ef\nghij\n\n" ], 
          a = [ 0, 6, 7, 16 ], c = e.strLinesNearest({
            src: i,
            charsRange: n,
            numberOfLines: 8
          }), t.will = "check strLinesNearest", t.identical(c.splits, s), t.identical(c.spans, a), 
          t.close("numberOfLines : 8 ( > all lines )"), 
          /*  */
          t.open("NaN range"), n = NaN, s = [ "", "", "" ], a = [ NaN, NaN, NaN, NaN ], c = e.strLinesNearest({
            src: i,
            charsRange: n,
            numberOfLines: 8
          }), t.will = "check strLinesNearest", t.identical(c.splits, s), t.identical(c.spans, a), 
          t.close("NaN range"), 
          /*  */
          t.close("Range is a number"), 
          /* - */
          t.open("aligned range, single line"), 
          /*  */
          t.open("numberOfLines not defined ( = 3 )"), n = [ 3, 5 ], s = [ "a\n", "bc", "\ndef" ], 
          a = [ 1, 3, 5, 9 ], c = e.strLinesNearest({
            src: i,
            charsRange: n,
            numberOfLines: void 0
          }), t.will = "check strLinesNearest", t.identical(c.splits, s), t.identical(c.spans, a), 
          t.close("numberOfLines not defined ( = 3 )"), 
          /*  */
          t.open("numberOfLines : NaN"), n = [ 3, 5 ], s = [ "\na\n", "bc", "\ndef\nghij\n\n" ], 
          a = [ void 0, 3, 5, void 0 ], c = e.strLinesNearest({
            src: i,
            charsRange: n,
            numberOfLines: NaN
          }), t.will = "check strLinesNearest", t.identical(c.splits, s), t.identical(c.spans, a), 
          t.close("numberOfLines : NaN"), 
          /*  */
          t.open("numberOfLines : null"), n = [ 3, 5 ], s = [ "", "bc", "bc" ], a = [ 3, 3, 5, 3 ], 
          c = e.strLinesNearest({
            src: i,
            charsRange: n,
            numberOfLines: null
          }), t.will = "check strLinesNearest", t.identical(c.splits, s), t.identical(c.spans, a), 
          t.close("numberOfLines : null"), 
          /*  */
          t.open("numberOfLines : 0"), n = [ 6, 9 ], r = e.strSub(i, n), s = [ "", "def", "" ], 
          a = [ 6, 6, 9, 9 ], c = e.strLinesNearest({
            src: i,
            charsRange: n,
            numberOfLines: 0
          }), t.will = "check strLinesNearest", t.identical(c.splits, s), t.identical(c.spans, a), 
          t.will = "check strSub", t.identical(r, "def"), t.close("numberOfLines : 0"), 
          /*  */
          t.open("numberOfLines : 1"), n = [ 6, 9 ], r = e.strSub(i, n), s = [ "", "def", "" ], 
          a = [ 6, 6, 9, 9 ], c = e.strLinesNearest({
            src: i,
            charsRange: n,
            numberOfLines: 1
          }), t.will = "check strLinesNearest", t.identical(c.splits, s), t.identical(c.spans, a), 
          t.will = "check strSub", t.identical(r, "def"), t.close("numberOfLines : 1"), 
          /* */
          t.open("numberOfLines : 2"), n = [ 6, 9 ], r = e.strSub(i, n), s = [ "bc\n", "def", "" ], 
          a = [ 3, 6, 9, 9 ], c = e.strLinesNearest({
            src: i,
            charsRange: n,
            numberOfLines: 2
          }), t.will = "check strLinesNearest", t.identical(c.splits, s), t.identical(c.spans, a), 
          t.will = "check strSub", t.identical(r, "def"), t.close("numberOfLines : 2"), 
          /* */
          t.open("numberOfLines : 3"), n = [ 6, 9 ], r = e.strSub(i, n), s = [ "bc\n", "def", "\nghij" ], 
          a = [ 3, 6, 9, 14 ], c = e.strLinesNearest({
            src: i,
            charsRange: n,
            numberOfLines: 3
          }), t.will = "check strLinesNearest", t.identical(c.splits, s), t.identical(c.spans, a), 
          t.will = "check strSub", t.identical(r, "def"), t.close("numberOfLines : 3"), 
          /* */
          t.open("numberOfLines : 4"), n = [ 6, 9 ], r = e.strSub(i, n), s = [ "a\nbc\n", "def", "\nghij" ], 
          a = [ 1, 6, 9, 14 ], c = e.strLinesNearest({
            src: i,
            charsRange: n,
            numberOfLines: 4
          }), t.will = "check strLinesNearest", t.identical(c.splits, s), t.identical(c.spans, a), 
          t.will = "check strSub", t.identical(r, "def"), t.close("numberOfLines : 4"), 
          /* - */
          t.close("aligned range, single line"), 
          /* - */
          t.open("not aligned range, several lines"), 
          /*  */
          t.open("numberOfLines : 0"), n = [ 4, 11 ], r = e.strSub(i, n), s = [ "", "c\ndef\ng", "" ], 
          a = [ 4, 4, 11, 11 ], c = e.strLinesNearest({
            src: i,
            charsRange: n,
            numberOfLines: 0
          }), t.will = "check strLinesNearest", t.identical(c.splits, s), t.identical(c.spans, a), 
          t.will = "check strSub", t.identical(r, "c\ndef\ng"), t.close("numberOfLines : 0"), 
          /*  */
          t.open("numberOfLines : 1"), n = [ 4, 11 ], r = e.strSub(i, n), s = [ "b", "c\ndef\ng", "hij" ], 
          a = [ 3, 4, 11, 14 ], c = e.strLinesNearest({
            src: i,
            charsRange: n,
            numberOfLines: 1
          }), t.will = "check strLinesNearest", t.identical(c.splits, s), t.identical(c.spans, a), 
          t.will = "check strSub", t.identical(r, "c\ndef\ng"), t.close("numberOfLines : 1"), 
          /* */
          t.open("numberOfLines : 2"), n = [ 4, 11 ], r = e.strSub(i, n), s = [ "a\nb", "c\ndef\ng", "hij" ], 
          a = [ 1, 4, 11, 14 ], c = e.strLinesNearest({
            src: i,
            charsRange: n,
            numberOfLines: 2
          }), t.will = "check strLinesNearest", t.identical(c.splits, s), t.identical(c.spans, a), 
          t.will = "check strSub", t.identical(r, "c\ndef\ng"), t.close("numberOfLines : 2"), 
          /* */
          t.open("numberOfLines : 3"), n = [ 4, 11 ], r = e.strSub(i, n), s = [ "a\nb", "c\ndef\ng", "hij\n" ], 
          a = [ 1, 4, 11, 15 ], c = e.strLinesNearest({
            src: i,
            charsRange: n,
            numberOfLines: 3
          }), t.will = "check strLinesNearest", t.identical(c.splits, s), t.identical(c.spans, a), 
          t.will = "check strSub", t.identical(r, "c\ndef\ng"), t.close("numberOfLines : 3"), 
          /* */
          t.open("numberOfLines : 4"), n = [ 4, 11 ], r = e.strSub(i, n), s = [ "\na\nb", "c\ndef\ng", "hij\n" ], 
          a = [ 0, 4, 11, 15 ], c = e.strLinesNearest({
            src: i,
            charsRange: n,
            numberOfLines: 4
          }), t.will = "check strLinesNearest", t.identical(c.splits, s), t.identical(c.spans, a), 
          t.will = "check strSub", t.identical(r, "c\ndef\ng"), t.close("numberOfLines : 4"), 
          /* - */
          t.close("not aligned range, several lines");
          debugger;
          console.log("done1"), logger.log("done2"), t.open("Wrong range"), n = [ 4, 11, 12 ], 
          t.shouldThrowErrorSync(() => e.strLinesNearest({
            src: i,
            charsRange: n,
            numberOfLines: 4
          })), t.shouldThrowErrorSync(() => e.strLinesNearest({
            src: i,
            charsRange: null,
            numberOfLines: 4
          })), t.shouldThrowErrorSync(() => e.strLinesNearest({
            src: i,
            charsRange: "crange",
            numberOfLines: 4
          })), t.shouldThrowErrorSync(() => e.strLinesNearest({
            src: i,
            numberOfLines: 4
          })), t.close("Wrong range"), 
          /*  */
          t.open("Wrong src"), n = [ 4, 11 ], t.shouldThrowErrorSync(() => e.strLinesNearest({
            charsRange: n,
            numberOfLines: 4
          })), t.shouldThrowErrorSync(() => e.strLinesNearest({
            src: null,
            charsRange: n,
            numberOfLines: 4
          })), t.shouldThrowErrorSync(() => e.strLinesNearest({
            src: NaN,
            charsRange: n,
            numberOfLines: 4
          })), t.shouldThrowErrorSync(() => e.strLinesNearest({
            src: void 0,
            charsRange: n,
            numberOfLines: 4
          })), t.shouldThrowErrorSync(() => e.strLinesNearest({
            src: 3,
            charsRange: n,
            numberOfLines: 4
          })), t.shouldThrowErrorSync(() => e.strLinesNearest({
            src: [ "abd", "ef" ],
            charsRange: n,
            numberOfLines: 4
          })), t.close("Wrong src"), 
          /*  */
          t.open("Wrong arg"), t.shouldThrowErrorSync(() => e.strLinesNearest(3)), t.shouldThrowErrorSync(() => e.strLinesNearest([ 3, 4 ])), 
          t.shouldThrowErrorSync(() => e.strLinesNearest(null)), t.shouldThrowErrorSync(() => e.strLinesNearest(void 0)), 
          t.shouldThrowErrorSync(() => e.strLinesNearest(NaN)), t.shouldThrowErrorSync(() => e.strLinesNearest("args"));
          let l = {
            src: [ "abd", "ef" ],
            charsRange: n,
            numberOfLines: 4
          };
          t.shouldThrowErrorSync(() => e.strLinesNearest()), t.shouldThrowErrorSync(() => e.strLinesNearest(l, l)), 
          t.close("Wrong arg");
        }
        //
        ,
        strLinesRangeWithCharRange: function strLinesRangeWithCharRange(t) {
          t.open("embraced by empty lines");
          var i = "\na\nbc\ndef\nghij\n\n";
          t.case = "single line in the middle";
          /* */
          var n = [ 3, 5 ], r = e.strSub(i, n), s = e.strLinesRangeWithCharRange(i, n);
          t.identical(s, [ 2, 3 ]), t.identical(r, "bc"), t.case = "line in the middle with NL", 
          n = [ 3, 6 ], r = e.strSub(i, n), s = e.strLinesRangeWithCharRange(i, n), t.identical(s, [ 2, 4 ]), 
          t.identical(r, "bc\n"), t.case = "single line in the beginning", n = [ 1, 2 ], r = e.strSub(i, n), 
          s = e.strLinesRangeWithCharRange(i, n), t.identical(s, [ 1, 2 ]), t.identical(r, "a"), 
          t.case = "line in the beginning with NL", n = [ 1, 3 ], r = e.strSub(i, n), s = e.strLinesRangeWithCharRange(i, n), 
          t.identical(s, [ 1, 3 ]), t.identical(r, "a\n"), t.case = "single line in the end", 
          n = [ 10, 14 ], r = e.strSub(i, n), s = e.strLinesRangeWithCharRange(i, n), t.identical(s, [ 4, 5 ]), 
          t.identical(r, "ghij"), t.case = "line in the end with NL", n = [ 10, 15 ], r = e.strSub(i, n), 
          s = e.strLinesRangeWithCharRange(i, n), t.identical(s, [ 4, 6 ]), t.identical(r, "ghij\n"), 
          t.case = "not aligned range with multiple lines", n = [ 4, 11 ], r = e.strSub(i, n), 
          s = e.strLinesRangeWithCharRange(i, n), t.identical(s, [ 2, 5 ]), t.identical(r, "c\ndef\ng"), 
          t.case = "empty line in the beginning", n = [ 0, 0 ], r = e.strSub(i, n), s = e.strLinesRangeWithCharRange(i, n), 
          t.identical(s, [ 0, 1 ]), t.identical(r, ""), t.case = "empty line in the end", 
          n = [ 15, 15 ], r = e.strSub(i, n), s = e.strLinesRangeWithCharRange(i, n), t.identical(s, [ 5, 6 ]), 
          t.identical(r, ""), t.close("embraced by empty lines"), 
          /* */
          t.open("not embraced by empty lines"), i = "a\nbc\ndef\nghij", t.case = "single line in the middle", 
          n = [ 2, 4 ], r = e.strSub(i, n), s = e.strLinesRangeWithCharRange(i, n), t.identical(s, [ 1, 2 ]), 
          t.identical(r, "bc"), t.case = "line in the middle with NL", n = [ 2, 5 ], r = e.strSub(i, n), 
          s = e.strLinesRangeWithCharRange(i, n), t.identical(s, [ 1, 3 ]), t.identical(r, "bc\n"), 
          t.case = "single line in the beginning", n = [ 0, 1 ], r = e.strSub(i, n), s = e.strLinesRangeWithCharRange(i, n), 
          t.identical(s, [ 0, 1 ]), t.identical(r, "a"), t.case = "line in the beginning with NL", 
          n = [ 0, 2 ], r = e.strSub(i, n), s = e.strLinesRangeWithCharRange(i, n), t.identical(s, [ 0, 2 ]), 
          t.identical(r, "a\n"), t.case = "single line in the end", n = [ 9, 13 ], r = e.strSub(i, n), 
          s = e.strLinesRangeWithCharRange(i, n), t.identical(s, [ 3, 4 ]), t.identical(r, "ghij"), 
          t.case = "line in the end with NL", n = [ 9, 14 ], r = e.strSub(i, n), s = e.strLinesRangeWithCharRange(i, n), 
          t.identical(s, [ 3, 4 ]), t.identical(r, "ghij"), t.case = "not aligned range with multiple lines", 
          n = [ 3, 10 ], r = e.strSub(i, n), s = e.strLinesRangeWithCharRange(i, n), t.identical(s, [ 1, 4 ]), 
          t.identical(r, "c\ndef\ng"), t.close("not embraced by empty lines");
        }
        //
        ,
        strStrShort: function strStrShort(t) {
          t.case = "simple string";
          var i = e.strStrShort("string", 4), n = "'st' ... 'ng'";
          t.identical(i, n), t.case = "string with escaping", i = e.strStrShort("s\ntring", 4), 
          n = "'s' ... 'ng'", t.identical(i, n), t.case = "limit 0", i = e.strStrShort("string", 0), 
          n = "string", t.identical(i, n), t.case = "limit 1", i = e.strStrShort("string", 1), 
          n = "'s'", t.identical(i, n), t.case = "string wih spaces", i = e.strStrShort("source and", 5), 
          n = "'sou' ... 'nd'", t.identical(i, n), t.case = "one argument call", i = e.strStrShort({
            src: "string",
            limit: 4,
            wrap: "'"
          }), n = "'st' ... 'ng'", t.identical(i, n), t.case = "string with whitespaces", 
          i = e.strStrShort({
            src: "  simple string   ",
            limit: 4,
            wrap: "'"
          }), n = "'  ' ... '  '", t.identical(i, n), t.case = "wrap 0", i = e.strStrShort({
            src: "simple",
            limit: 4,
            wrap: 0
          }), n = "si ... le", t.identical(i, n), t.case = "escaping 0", i = e.strStrShort({
            src: "simple",
            limit: 5,
            wrap: '"',
            escaping: 0
          }), n = '"si" ... "le"', t.identical(i, n), t.case = "escaping 1", i = e.strStrShort({
            src: "string",
            limit: 4,
            wrap: '"'
          }), n = '"s" ... "ng"', t.identical(i, n), t.case = "invalid first argument type", 
          t.shouldThrowError(function() {
            e.strStrShort(1, 5);
          }), t.case = "invalid second argument type", t.shouldThrowError(function() {
            e.strStrShort("string", "0");
          }), t.case = "no arguments", t.shouldThrowError(function() {
            e.strStrShort();
          }), t.case = "unknown property provided", t.shouldThrowError(function() {
            e.strStrShort({
              src: "string",
              limit: 4,
              wrap: 0,
              fixed: 5
            });
          });
        }
        //
        ,
        strCommonLeft: function strCommonLeft(t) {
          t.case = "no args";
          var i = e.strCommonLeft(), n = "";
          t.identical(i, n), t.case = "one argument", i = e.strCommonLeft("abc"), n = "abc", 
          t.identical(i, n), t.case = "ins is empty string", i = e.strCommonLeft("", "a", "b"), 
          n = "", t.identical(i, n), t.case = "one string is empty", i = e.strCommonLeft("abc", "", "abc", "ada"), 
          n = "", t.identical(i, n), t.case = "no match", i = e.strCommonLeft("abcd", "abc", "d"), 
          n = "", t.identical(i, n), t.case = "several strings", i = e.strCommonLeft("abc", "abd", "abc", "ada"), 
          n = "a", t.identical(i, n), t.case = "several strings", i = e.strCommonLeft("abcd", "ab", "abc", "a"), 
          n = "a", t.identical(i, n), t.case = "Several character string", i = e.strCommonLeft("abc", "abcd", "abcde", "abcdef"), 
          n = "abc", t.identical(i, n), t.case = "Several character string", i = e.strCommonLeft("abcdef", "abcd", "abcde", "abc"), 
          n = "abc", t.identical(i, n), t.case = "Several character string", i = e.strCommonLeft("abcd", "abc", "abcd"), 
          n = "abc", t.identical(i, n), t.case = "One arg is not a string", i = e.strCommonLeft("abcd", "abc", 3), 
          n = "", t.identical(i, n), t.case = "One arg is not a string", i = e.strCommonLeft("abcd", "abc", NaN), 
          n = "", t.identical(i, n), t.case = "One arg is not a string", i = e.strCommonLeft("abcd", "ab", "abc", [ 3 ]), 
          n = "", t.identical(i, n), t.case = "One arg is not a string", i = e.strCommonLeft("abcd", "ab", "abc", /a/), 
          n = "", t.identical(i, n), t.case = "One arg is not a string", i = e.strCommonLeft("abcd", "ab", "abc", [ "abc" ]), 
          n = "", t.identical(i, n), t.case = "no match case", i = e.strCommonLeft("abcd", "ab", "Abc"), 
          n = "", t.identical(i, n), t.case = "ins is array", t.shouldThrowError(function() {
            e.strCommonLeft([ "a", "b", "c" ], "abd", "abc", "ada");
          }), t.case = "ins is number", t.shouldThrowError(function() {
            e.strCommonLeft(3, "abd", "abc", "ada");
          }), t.case = "ins is regExp", t.shouldThrowError(function() {
            e.strCommonLeft(/^a/, "abd", "abc", "ada");
          }), t.case = "ins is NaN", t.shouldThrowError(function() {
            e.strCommonLeft(NaN, "abd", "abc", "ada");
          }), t.case = "ins is null", t.shouldThrowError(function() {
            e.strCommonLeft(null, "abd", "abc", "ada");
          }), t.case = "One arg null", t.shouldThrowError(function() {
            e.strCommonLeft("abd", "abc", "ada", null);
          }), t.case = "ins is undefined", t.shouldThrowError(function() {
            e.strCommonLeft(void 0, "abd", "abc", "ada");
          }), t.case = "One arg undefined", t.shouldThrowError(function() {
            e.strCommonLeft("abd", "abc", "ada", void 0);
          });
        }
        //
        ,
        strCommonRight: function strCommonRight(t) {
          t.case = "no args";
          var i = e.strCommonRight(), n = "";
          t.identical(i, n), t.case = "one argument", i = e.strCommonRight("abc"), n = "abc", 
          t.identical(i, n), t.case = "ins is empty string", i = e.strCommonRight("", "ab", "b"), 
          n = "", t.identical(i, n), t.case = "one string is empty", i = e.strCommonRight("abc", "", "abc", "bc"), 
          n = "", t.identical(i, n), t.case = "no match", i = e.strCommonRight("abcd", "abc", "d"), 
          n = "", t.identical(i, n), t.case = "several strings", i = e.strCommonRight("a", "cba", "dba", "ada"), 
          n = "a", t.identical(i, n), t.case = "several strings", i = e.strCommonRight("abcd", "cd", "abcd", "d"), 
          n = "d", t.identical(i, n), t.case = "Several character string", i = e.strCommonRight("cdef", "abcdef", "def", "bcdef"), 
          n = "def", t.identical(i, n), t.case = "Several character string", i = e.strCommonRight("abcdef", "bcdef", "cdef", "def"), 
          n = "def", t.identical(i, n), t.case = "Several character string", i = e.strCommonRight("abcd", "bcd", "abcd"), 
          n = "bcd", t.identical(i, n), t.case = "One arg is not a string", i = e.strCommonRight("abc", "abc", 3), 
          n = "", t.identical(i, n), t.case = "One arg is not a string", i = e.strCommonRight("acde", "bcde", NaN), 
          n = "", t.identical(i, n), t.case = "One arg is not a string", i = e.strCommonRight("abcd", "abd", "ad", [ 3 ]), 
          n = "", t.identical(i, n), t.case = "One arg is not a string", i = e.strCommonRight("c", "bc", "abc", /c/), 
          n = "", t.identical(i, n), t.case = "One arg is not a string", i = e.strCommonRight("abcd", "cd", "bcd", [ "abcd" ]), 
          n = "", t.identical(i, n), t.case = "no match case", i = e.strCommonRight("abcd", "cD", "AbcD"), 
          n = "", t.identical(i, n), t.case = "ins is array", t.shouldThrowError(function() {
            e.strCommonRight([ "a", "b", "c" ], "abd", "abc", "ada");
          }), t.case = "ins is number", t.shouldThrowError(function() {
            e.strCommonRight(3, "abd", "abc", "ada");
          }), t.case = "ins is regExp", t.shouldThrowError(function() {
            e.strCommonRight(/^a/, "abd", "abc", "ada");
          }), t.case = "ins is NaN", t.shouldThrowError(function() {
            e.strCommonRight(NaN, "abd", "abc", "ada");
          }), t.case = "ins is null", t.shouldThrowError(function() {
            e.strCommonRight(null, "abd", "abc", "ada");
          }), t.case = "One arg null", t.shouldThrowError(function() {
            e.strCommonRight("abd", "abc", "ada", null);
          }), t.case = "ins is undefined", t.shouldThrowError(function() {
            e.strCommonRight(void 0, "abd", "abc", "ada");
          }), t.case = "One arg undefined", t.shouldThrowError(function() {
            e.strCommonRight("abd", "abc", "ada", void 0);
          });
        }
        //
        ,
        strExtractInlined: function strExtractInlined(t) {
          function onInlined(e) {
            var t = e.split(":");
            if (2 === t.length) return t;
          }
          /* */          t.case = "empty";
          var i = "", n = e.strExtractInlined(i), r = [ "" ];
          t.identical(n, r), 
          /* */
          t.case = "without inlined text", i = "a", n = e.strExtractInlined(i), r = [ "a" ], 
          t.identical(n, r), 
          /* */
          t.case = "default options", i = "ab#cd#ef", n = e.strExtractInlined(i), r = [ "ab", [ "cd" ], "ef" ], 
          t.identical(n, r), 
          /* */
          t.case = "trivial case", i = "this #background:red#is#background:default# text and is not", 
          n = e.strExtractInlined({
            src: i,
            onInlined: onInlined
          }), r = [ "this ", [ "background", "red" ], "is", [ "background", "default" ], " text and is not" ], 
          t.identical(n, r), 
          /* */
          t.case = "openning delimeter # does not have closing", i = "this #background:red#is#background:default# text and # is not", 
          n = e.strExtractInlined({
            src: i,
            onInlined: onInlined
          }), r = [ "this ", [ "background", "red" ], "is", [ "background", "default" ], " text and # is not" ], 
          t.identical(n, r), 
          /* */
          t.case = "two inlined substrings is not in fact inlined", i = "#simple # text #background:red#is#background:default# text and # is not#", 
          n = e.strExtractInlined({
            src: i,
            onInlined: onInlined
          }), r = [ "#simple # text ", [ "background", "red" ], "is", [ "background", "default" ], " text and # is not#" ], 
          t.identical(n, r), 
          /* */
          t.case = "inlined at the beginning and false inlined", i = "#background:red#i#s#background:default##text", 
          n = e.strExtractInlined({
            src: i,
            onInlined: onInlined
          }), r = [ "", [ "background", "red" ], "i#s", [ "background", "default" ], "#text" ], 
          t.identical(n, r), 
          /* */
          t.case = "inlined at the beginning and the end", i = "#background:red#i#s#background:default#", 
          n = e.strExtractInlined({
            src: i,
            onInlined: onInlined
          }), r = [ "", [ "background", "red" ], "i#s", [ "background", "default" ], "" ], 
          t.identical(n, r), 
          /* */
          t.case = "inlined at the beginning and the end with preservingEmpty:0", i = "#background:red#i#s#background:default#", 
          n = e.strExtractInlined({
            src: i,
            onInlined: onInlined,
            preservingEmpty: 0
          }), r = [ [ "background", "red" ], "i#s", [ "background", "default" ] ], t.identical(n, r), 
          /* */
          t.case = "wrapped by inlined text", i = "#background:red#text#background:default#", 
          n = e.strExtractInlined({
            src: i,
            onInlined: onInlined
          }), r = [ "", [ "background", "red" ], "text", [ "background", "default" ], "" ], 
          t.identical(n, r), 
          /* */ //
          t.case = "preservingEmpty:0, no empty", i = "#inline1#ordinary#inline2#", n = e.strExtractInlined({
            src: i,
            preservingEmpty: 0
          }), r = [ [ "inline1" ], "ordinary", [ "inline2" ] ], t.identical(n, r), 
          /* */
          t.case = "preservingEmpty:0, empty left", i = "##ordinary#inline2#", n = e.strExtractInlined({
            src: i,
            preservingEmpty: 0
          }), r = [ [ "" ], "ordinary", [ "inline2" ] ], t.identical(n, r), 
          /* */
          t.case = "preservingEmpty:0, empty right", i = "#inline1#ordinary##", n = e.strExtractInlined({
            src: i,
            preservingEmpty: 0
          }), r = [ [ "inline1" ], "ordinary", [ "" ] ], t.identical(n, r), 
          /* */
          t.case = "preservingEmpty:0, empty middle", i = "#inline1##inline2#", n = e.strExtractInlined({
            src: i,
            preservingEmpty: 0
          }), r = [ [ "inline1" ], [ "inline2" ] ], t.identical(n, r), 
          /* */
          t.case = "preservingEmpty:0, empty all", i = "####", n = e.strExtractInlined({
            src: i,
            preservingEmpty: 0
          }), r = [ [ "" ], [ "" ] ], t.identical(n, r), 
          /* */
          t.case = "preservingEmpty:0, empty all", i = "", n = e.strExtractInlined({
            src: i,
            preservingEmpty: 0
          }), r = [], t.identical(n, r), 
          /* */ //
          t.case = "preservingEmpty:0, onInlined:null no empty", i = "#inline1#ordinary#inline2#", 
          n = e.strExtractInlined({
            src: i,
            preservingEmpty: 0,
            onInlined: null
          }), r = [ "inline1", "ordinary", "inline2" ], t.identical(n, r), 
          /* */
          t.case = "preservingEmpty:0, onInlined:null, empty left", i = "##ordinary#inline2#", 
          n = e.strExtractInlined({
            src: i,
            preservingEmpty: 0,
            onInlined: null
          }), r = [ "ordinary", "inline2" ], t.identical(n, r), 
          /* */
          t.case = "preservingEmpty:0, onInlined:null, empty right", i = "#inline1#ordinary##", 
          n = e.strExtractInlined({
            src: i,
            preservingEmpty: 0,
            onInlined: null
          }), r = [ "inline1", "ordinary" ], t.identical(n, r), 
          /* */
          t.case = "preservingEmpty:0, onInlined:null, empty middle", i = "#inline1##inline2#", 
          n = e.strExtractInlined({
            src: i,
            preservingEmpty: 0,
            onInlined: null
          }), r = [ "inline1", "inline2" ], t.identical(n, r), 
          /* */
          t.case = "preservingEmpty:0, onInlined:null, empty all", i = "####", n = e.strExtractInlined({
            src: i,
            preservingEmpty: 0,
            onInlined: null
          }), r = [], t.identical(n, r), 
          /* */
          t.case = "preservingEmpty:0, onInlined:null, empty all", i = "", n = e.strExtractInlined({
            src: i,
            preservingEmpty: 0,
            onInlined: null
          }), r = [], t.identical(n, r), t.case = "too many arguments", t.shouldThrowError(() => {
            debugger;
            e.strExtractInlined("", {}, "");
          });
        }
        //
        ,
        strExtractInlinedStereo: function strExtractInlinedStereo(t) {
          var i, n;
          t.case = "default", 
          /* nothing */
          i = e.strExtractInlinedStereo(""), n = [ "" ], t.identical(i, n);
          /* prefix/postfix # by default*/
          debugger;
          i = e.strExtractInlinedStereo("#abc#");
          debugger;
          n = [ "", "abc", "" ], t.identical(i, n), 
          /* - */
          t.case = "with options", 
          /* pre/post are same*/
          i = e.strExtractInlinedStereo({
            prefix: "/",
            postfix: "/",
            src: "/abc/"
          }), n = [ "", "abc", "" ], t.identical(i, n), 
          /**/
          i = e.strExtractInlinedStereo({
            prefix: "/",
            postfix: "/",
            src: "//abc//"
          }), n = [ "", "", "abc", "", "" ], t.identical(i, n), 
          /* different pre/post */
          i = e.strExtractInlinedStereo({
            prefix: "/#",
            postfix: "#",
            src: "/#abc#"
          }), n = [ "abc" ], t.identical(i, n), 
          /* postfix appears in source two times */
          i = e.strExtractInlinedStereo({
            prefix: "/",
            postfix: "#",
            src: "/ab#c#"
          }), n = [ "ab", "c#" ], t.identical(i, n), i = e.strExtractInlinedStereo({
            onInlined: 
            /* onInlined #1 */
            function onInlined1(e) {
              if (e.length) return e;
            },
            src: "#abc#"
          }), n = [ "#abc#" ], t.identical(i, n), i = e.strExtractInlinedStereo({
            prefix: "/",
            postfix: "#",
            onInlined: 
            /* onInlined #2 */
            function onInlined2(e) {
              return e + e;
            },
            src: "/abc#"
          }), n = [ "abcabc" ], t.identical(i, n);
        }
        //
            }
    };
    t = wTestSuite(t), "undefined" == typeof module || module.parent || wTester.test(t.name);
  }();
  // == end of file StringToolsTestS
}();