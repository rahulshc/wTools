!function RegexpTestS() {
  // == begin of file RegexpTestS
  !function _Regexp_test_s_() {
    "use strict";
    "undefined" != typeof module && require("../Layer2.s").include("wTesting"), _global_;
    var e = _global_.wTools, r = {
      name: "Tools/base/l1/Regexp",
      silencing: 1,
      tests: {
        regexpIdentical: 
        // --
        // routines
        // --
        function regexpIdentical(r) {
          /* */
          r.case = "null";
          var s = !1, a = e.regexpIdentical(null, null);
          r.identical(a, s), 
          /* */
          r.case = "null and regexp", s = !1, a = e.regexpIdentical(/x/, null), r.identical(a, s), 
          /* */
          r.case = "same string", s = !1, a = e.regexpIdentical("x", "x"), r.identical(a, s), 
          /* */
          r.case = "same regexp", s = !0, a = e.regexpIdentical(/abc/iy, /abc/iy), r.identical(a, s), 
          /* */
          r.case = "not identical regexp, different flags", s = !1, a = e.regexpIdentical(/abc/i, /abc/), 
          r.identical(a, s), 
          /* */
          r.case = "not identical regexp, different source", s = !1, a = e.regexpIdentical(/abcd/i, /abc/i), 
          r.identical(a, s), 
          /* */
          r.case = "not identical regexp", s = !1, a = e.regexpIdentical(/abcd/y, /abc/i), 
          r.identical(a, s), r.case = "none argument", r.shouldThrowErrorSync(() => e.regexpIdentical()), 
          r.case = "too many arguments", r.shouldThrowErrorSync(() => e.regexpIdentical(/abc/i, /def/i, /a/i));
        }
        //
        ,
        regexpsSources: function regexpsSources(r) {
          /* */
          r.case = "empty";
          var s = {
            sources: [],
            flags: null,
            escaping: 0
          }, a = e.regexpsSources([]);
          r.identical(a, s), 
          /* */
          r.case = "single string";
          var n = "abc";
          s = {
            sources: [ "abc" ],
            flags: null,
            escaping: 0
          }, a = e.regexpsSources([ n ]), r.identical(a, s), 
          /* */
          r.case = "single regexp", n = /abc/i, s = {
            sources: [ "abc" ],
            flags: "i",
            escaping: 0
          }, a = e.regexpsSources([ n ]), r.identical(a, s), 
          /* */
          r.case = "all strings", n = "abc";
          var c = "def", i = ".+";
          s = {
            sources: [ "abc", "def", ".+" ],
            flags: null,
            escaping: 0
          }, a = e.regexpsSources([ n, c, i ]), r.identical(a, s), 
          /* */
          r.case = "strings with regexps", n = "abc", c = /def/, i = /.+/, s = {
            sources: [ "abc", "def", ".+" ],
            flags: "",
            escaping: 0
          }, a = e.regexpsSources([ n, c, i ]), r.identical(a, s), 
          /* */
          r.case = "strings with regexps and flags i", n = "abc", c = /def/i, i = /.+/i, s = {
            sources: [ "abc", "def", ".+" ],
            flags: "i",
            escaping: 0
          }, a = e.regexpsSources([ n, c, i ]), r.identical(a, s), 
          /* */
          r.case = "strings with regexps and flags iy", n = /abc/iy, c = "def", i = /.+/iy, 
          s = {
            sources: [ "abc", "def", ".+" ],
            flags: "iy",
            escaping: 0
          }, a = e.regexpsSources([ n, c, i ]), r.identical(a, s), 
          /* */
          r.case = "empty in map", s = {
            sources: [],
            flags: null,
            escaping: 0
          };
          var t = {
            sources: []
          };
          a = e.regexpsSources(t), r.identical(a, s), r.is(t === a), 
          /* */
          r.case = "strings with regexps and flags iy in map", s = {
            sources: [ "abc", "def", ".+" ],
            flags: "iy",
            escaping: 0
          }, t = {
            sources: [ n = /abc/iy, c = "def", i = /.+/iy ]
          }, a = e.regexpsSources(t), r.identical(a, s), r.is(t === a), 
          /* */
          r.case = "options map with flags", s = {
            sources: [ "abc", "def", ".+" ],
            flags: "i",
            escaping: 0
          }, t = {
            sources: [ n = /abc/i, c = "def", i = /.+/i ],
            flags: "i"
          }, a = e.regexpsSources(t), r.identical(a, s), r.is(t === a), r.case = "none argument", 
          r.shouldThrowErrorSync(() => e.regexpsSources()), r.case = "strings with different flags", 
          r.shouldThrowErrorSync(() => e.regexpsSources([ /abc/i, /def/iy ])), r.case = "too many arguments", 
          r.shouldThrowErrorSync(() => e.regexpsSources("ab", "cd")), r.case = "different flags in map", 
          r.shouldThrowErrorSync(() => e.regexpsSources({
            sources: [ /abc/i ],
            flags: "y"
          }));
        }
        //
        ,
        regexpsJoin: function regexpsJoin(r) {
          /* */
          r.case = "empty";
          var s = new RegExp("", ""), a = e.regexpsJoin([]);
          r.identical(a, s), 
          /* */
          r.case = "single string";
          var n = "abc";
          s = /abc/, a = e.regexpsJoin([ n ]), r.identical(a, s), 
          /* */
          r.case = "single regexp", n = /abc/i, s = /abc/i, a = e.regexpsJoin([ n ]), r.identical(a, s), 
          r.is(a === n), 
          /* */
          r.case = "all strings", n = "abc";
          var c = "def", i = ".+";
          s = /abcdef.+/, a = e.regexpsJoin([ n, c, i ]), r.identical(a, s), 
          /* */
          r.case = "strings with regexps", n = "abc", c = /def/, i = /.+/, s = /abcdef.+/, 
          a = e.regexpsJoin([ n, c, i ]), r.identical(a, s), 
          /* */
          r.case = "strings with regexps and flags i", n = "abc", c = /def/i, i = /.+/i, s = /abcdef.+/i, 
          a = e.regexpsJoin([ n, c, i ]), r.identical(a, s), 
          /* */
          r.case = "strings with regexps and flags iy", n = /abc/iy, c = "def", i = /.+/iy, 
          s = /abcdef.+/iy, a = e.regexpsJoin([ n, c, i ]), r.identical(a, s), 
          /* */
          r.case = "empty in map";
          var t = {
            sources: [],
            flags: null
          };
          s = new RegExp("", ""), a = e.regexpsJoin(t), r.identical(a, s), 
          /* */
          r.case = "strings with regexps and flags iy in map", s = /abcdef.+/iy, t = {
            sources: [ n = /abc/iy, c = "def", i = /.+/iy ]
          }, a = e.regexpsJoin(t), r.identical(a, s), 
          /* */
          r.case = "options map with flags", s = /abcdef.+/i, t = {
            sources: [ n = /abc/i, c = "def", i = /.+/i ],
            flags: "i"
          }, a = e.regexpsJoin(t), r.identical(a, s), r.case = "none argument", r.shouldThrowErrorSync(() => e.regexpsJoin()), 
          r.case = "strings with different flags", r.shouldThrowErrorSync(() => e.regexpsJoin([ /abc/i, /def/iy ])), 
          r.case = "too many arguments", r.shouldThrowErrorSync(() => e.regexpsJoin("ab", "cd")), 
          r.case = "different flags in map", r.shouldThrowErrorSync(() => e.regexpsJoin({
            sources: [ /abc/i ],
            flags: "y"
          }));
        }
        //
        ,
        regexpsAtLeastFirst: function regexpsAtLeastFirst(r) {
          r.case = "empty";
          var s = new RegExp(""), a = e.regexpsAtLeastFirst([]);
          r.identical(a, s), r.case = "single regexp";
          var n = /.+/i;
          s = /.+/i, a = e.regexpsAtLeastFirst([ n ]), r.identical(a, s), r.is(a === n), r.case = "strings", 
          n = "abc";
          var c = "def";
          s = /abc(?:def)?/, a = e.regexpsAtLeastFirst([ n, c ]), r.identical(a, s), r.case = "strings and regexps", 
          n = "abc", c = "def";
          var i = /.+/i;
          s = /abc(?:def(?:.+)?)?/i, a = e.regexpsAtLeastFirst([ n, c, i ]), r.identical(a, s), 
          r.case = "strings and regexps and flags", n = "abc", c = "def", i = /.+/i, s = /abc(?:def(?:.+)?)?/i, 
          a = e.regexpsAtLeastFirst({
            sources: [ n, c, i ],
            flags: "i"
          }), r.identical(a, s), r.case = "none argument", r.shouldThrowErrorSync(() => e.regexpsAtLeastFirst()), 
          r.case = "strings with different flags", r.shouldThrowErrorSync(() => e.regexpsAtLeastFirst([ /abc/i, /def/iy ])), 
          r.case = "too many arguments", r.shouldThrowErrorSync(() => e.regexpsAtLeastFirst("ab", "cd")), 
          r.case = "different flags in map", r.shouldThrowErrorSync(() => e.regexpsAtLeastFirst({
            sources: [ /abc/i ],
            flags: "y"
          }));
        }
        //
        ,
        regexpsNone: function regexpsNone(r) {
          r.case = "empty";
          var s = /^(?:(?!(?:)).)+$/, a = e.regexpsNone([]);
          r.identical(a, s), r.case = "single regexp";
          var n = /.+/i;
          s = /^(?:(?!(?:.+)).)+$/i, a = e.regexpsNone([ n ]), r.identical(a, s), r.is(a !== n), 
          r.case = "strings", n = "abc";
          var c = "def";
          s = /^(?:(?!(?:abc)|(?:def)).)+$/, a = e.regexpsNone([ n, c ]), r.identical(a, s), 
          r.case = "strings and regexps", n = "abc", c = "def";
          var i = /.+/i;
          s = /^(?:(?!(?:abc)|(?:def)|(?:.+)).)+$/i, a = e.regexpsNone([ n, c, i ]), r.identical(a, s), 
          r.case = "strings and regexps and flags", n = "abc", c = "def", i = /.+/i, s = /^(?:(?!(?:abc)|(?:def)|(?:.+)).)+$/i, 
          a = e.regexpsNone({
            sources: [ n, c, i ],
            flags: "i"
          }), r.identical(a, s), r.case = "none argument", r.shouldThrowErrorSync(() => e.regexpsNone()), 
          r.case = "strings with different flags", r.shouldThrowErrorSync(() => e.regexpsNone([ /abc/i, /def/iy ])), 
          r.case = "too many arguments", r.shouldThrowErrorSync(() => e.regexpsNone("ab", "cd")), 
          r.case = "different flags in map", r.shouldThrowErrorSync(() => e.regexpsNone({
            sources: [ /abc/i ],
            flags: "y"
          }));
        }
        //
        ,
        regexpsAny: function regexpsAny(r) {
          r.case = "empty";
          var s = /(?:)/, a = e.regexpsAny([]);
          r.identical(a, s), r.case = "single regexp";
          var n = /.+/i;
          s = /.+/i, a = e.regexpsAny([ n ]), r.identical(a, s), r.is(a === n), r.case = "strings", 
          n = "abc";
          var c = "def";
          s = /(?:abc)|(?:def)/, a = e.regexpsAny([ n, c ]), r.identical(a, s), r.case = "strings and regexps", 
          n = "abc", c = "def";
          var i = /.+/i;
          s = /(?:abc)|(?:def)|(?:.+)/i, a = e.regexpsAny([ n, c, i ]), r.identical(a, s), 
          r.case = "strings and regexps and flags", n = "abc", c = "def", i = /.+/i, s = /(?:abc)|(?:def)|(?:.+)/i, 
          a = e.regexpsAny({
            sources: [ n, c, i ],
            flags: "i"
          }), r.identical(a, s), r.case = "none argument", r.shouldThrowErrorSync(() => e.regexpsAny()), 
          r.case = "strings with different flags", r.shouldThrowErrorSync(() => e.regexpsAny([ /abc/i, /def/iy ])), 
          r.case = "too many arguments", r.shouldThrowErrorSync(() => e.regexpsAny("ab", "cd")), 
          r.case = "different flags in map", r.shouldThrowErrorSync(() => e.regexpsAny({
            sources: [ /abc/i ],
            flags: "y"
          }));
        }
        //
        ,
        regexpsAll: function regexpsAll(r) {
          r.case = "empty";
          var s = new RegExp(""), a = e.regexpsAll([]);
          r.identical(a, s), r.case = "single regexp";
          var n = /.+/i;
          s = /.+/i, a = e.regexpsAll([ n ]), r.identical(a, s), r.is(a === n), r.case = "strings", 
          n = "abc";
          var c = "def";
          s = /(?=abc)(?:def)/, a = e.regexpsAll([ n, c ]), r.identical(a, s), r.case = "strings and regexps", 
          n = "abc", c = "def";
          var i = /.+/i;
          s = /(?=abc)(?=def)(?:.+)/i, a = e.regexpsAll([ n, c, i ]), r.identical(a, s), r.case = "strings and regexps and flags", 
          n = "abc", c = "def", i = /.+/i, s = /(?=abc)(?=def)(?:.+)/i, a = e.regexpsAll({
            sources: [ n, c, i ],
            flags: "i"
          }), r.identical(a, s), r.case = "none argument", r.shouldThrowErrorSync(() => e.regexpsAll()), 
          r.case = "strings with different flags", r.shouldThrowErrorSync(() => e.regexpsAll([ /abc/i, /def/iy ])), 
          r.case = "too many arguments", r.shouldThrowErrorSync(() => e.regexpsAll("ab", "cd")), 
          r.case = "different flags in map", r.shouldThrowErrorSync(() => e.regexpsAll({
            sources: [ /abc/i ],
            flags: "y"
          }));
        }
        //
        ,
        _regexpTest: function _regexpTest(r) {
          r.case = "identical strings";
          var s = "abc", a = "abc", n = !0, c = e._regexpTest(s, a);
          r.identical(c, n), r.case = "different strings", s = "abc", a = "abcd", n = !1, 
          c = e._regexpTest(s, a), r.identical(c, n), r.case = "Regexp in string", s = /abc/, 
          a = "abcd", n = !0, c = e._regexpTest(s, a), r.identical(c, n), r.case = "Regexp not in string", 
          s = /.abc/, a = "abcd", n = !1, c = e._regexpTest(s, a), r.identical(c, n), r.case = "Conditional regexp in string", 
          s = /\d+(?!\.)/, a = "abcd3", n = !0, c = e._regexpTest(s, a), r.identical(c, n), 
          r.case = "Conditional regexp not in string", s = /\d+(?=\.)/, a = "abcd4", n = !1, 
          c = e._regexpTest(s, a), r.identical(c, n), r.case = "none argument", r.shouldThrowErrorSync(() => e._regexpTest()), 
          r.case = "not enough arguments", r.shouldThrowErrorSync(() => e._regexpTest("ab")), 
          r.case = "too many arguments", r.shouldThrowErrorSync(() => e._regexpTest("ab", "cd", "ef")), 
          r.case = "wrong order of arguments", r.shouldThrowErrorSync(() => e._regexpTest([ "Hello", /o/ ])), 
          r.case = "null", r.shouldThrowErrorSync(() => e._regexpTest([ null, "Hello" ])), 
          r.shouldThrowErrorSync(() => e._regexpTest([ "Hello", null ])), r.case = "NaN", 
          r.shouldThrowErrorSync(() => e._regexpTest([ "Hello", NaN ])), r.shouldThrowErrorSync(() => e._regexpTest([ NaN, "Hello" ])), 
          r.case = "array", r.shouldThrowErrorSync(() => e._regexpTest([ [], "s" ])), r.shouldThrowErrorSync(() => e._regexpTest([ /o/, [] ]));
        }
        //
        ,
        regexpTest: function regexpTest(r) {
          r.case = "identical strings";
          var s = "hi", a = "hi", n = !0, c = e.regexpTest(s, a);
          r.identical(c, n), r.case = "Regexp not in string", s = /^bc/, a = "abcd", n = !1, 
          c = e.regexpTest(s, a), r.identical(c, n), r.case = "Conditional regexp in string array", 
          s = /\d+(?!\.)/, a = [ "abcd3", "2", "dwq1!c" ], n = [ !0, !0, !0 ], c = e.regexpTest(s, a), 
          r.identical(c, n), r.case = "Conditional regexp in part of string array", s = /\d+(?=\.)/, 
          a = [ "abcd4", "1.5768", "Hi" ], n = [ !1, !0, !1 ], c = e.regexpTest(s, a), r.identical(c, n), 
          r.case = "Regexp not in string array", s = /^abc{2}$/, a = [ "abcc4", "1.5768", "bcc", "0abcc" ], 
          n = [ !1, !1, !1, !1 ], c = e.regexpTest(s, a), r.identical(c, n), r.case = "Regexp in string array once", 
          s = /^abc{2}$/, a = [ "abcc4", "1.5768", "bcc", "0abcc", "abcc" ], n = [ !1, !1, !1, !1, !0 ], 
          c = e.regexpTest(s, a), r.identical(c, n), r.case = "none argument", r.shouldThrowErrorSync(() => e.regexpTest()), 
          r.case = "not enough arguments", r.shouldThrowErrorSync(() => e.regexpTest("ab")), 
          r.case = "too many arguments", r.shouldThrowErrorSync(() => e.regexpTest("ab", "cd", "ef")), 
          r.case = "wrong order of arguments", r.shouldThrowErrorSync(() => e.regexpTest([ "Hello", /o/ ])), 
          r.case = "null", r.shouldThrowErrorSync(() => e.regexpTest([ null, "Hello" ])), 
          r.shouldThrowErrorSync(() => e.regexpTest([ "Hello", null ])), r.case = "NaN", r.shouldThrowErrorSync(() => e.regexpTest([ "Hello", NaN ])), 
          r.shouldThrowErrorSync(() => e.regexpTest([ NaN, "Hello" ])), r.case = "array", 
          r.shouldThrowErrorSync(() => e.regexpTest([ [], "s" ])), r.shouldThrowErrorSync(() => e.regexpTest([ /o/, [] ]));
        }
        //
        ,
        regexpTestAll: function regexpTestAll(r) {
          r.case = "identical strings";
          var s = "abc", a = "abc", n = !0, c = e.regexpTestAll(s, a);
          r.identical(c, n), r.case = "different strings", s = "abc", a = "abcd", n = !1, 
          c = e.regexpTestAll(s, a), r.identical(c, n), r.case = "identical strings array", 
          s = "abc", a = [ "abc", "abc" ], n = !0, c = e.regexpTestAll(s, a), r.identical(c, n), 
          r.case = "different strings array", s = "abc", a = [ "abc", "a", "b", "c" ], n = !1, 
          c = e.regexpTestAll(s, a), r.identical(c, n), r.case = "Regexp in string", s = /b/, 
          a = "abcd", n = !0, c = e.regexpTestAll(s, a), r.identical(c, n), r.case = "Regexp not in string", 
          s = /.a/, a = "abcd", n = !1, c = e.regexpTestAll(s, a), r.identical(c, n), r.case = "Regexp in string array", 
          s = /abc/, a = [ "dabcd", "efabcgh", "ijklabc" ], n = !0, c = e.regexpTestAll(s, a), 
          r.identical(c, n), r.case = "Regexp not in string array", s = /.abc/, a = [ "abcd", "efgh", "ijkl" ], 
          n = !1, c = e.regexpTestAll(s, a), r.identical(c, n), r.case = "Conditional regexp in string", 
          s = /\d|a/, a = "abcd3", n = !0, c = e.regexpTestAll(s, a), r.identical(c, n), r.case = "Conditional regexp not in string", 
          s = /\d(?=\.)/, a = "abcd4", n = !1, c = e.regexpTestAll(s, a), r.identical(c, n), 
          r.case = "Conditional regexp in string array", s = /\d+(?!\.)|\d+(?=\.)/, a = [ "abcd3", "abcd4", "2" ], 
          n = !0, c = e.regexpTestAll(s, a), r.identical(c, n), r.case = "Conditional regexp not in string array", 
          s = /[^fdh]/, a = [ "abcd4", "fd" ], n = !1, c = e.regexpTestAll(s, a), r.identical(c, n), 
          r.case = "none argument", r.shouldThrowErrorSync(() => e.regexpTestAll()), r.case = "not enough arguments", 
          r.shouldThrowErrorSync(() => e.regexpTestAll("ab")), r.case = "too many arguments", 
          r.shouldThrowErrorSync(() => e.regexpTestAll("ab", "cd", "ef")), r.case = "wrong order of arguments", 
          r.shouldThrowErrorSync(() => e.regexpTestAll([ "Hello", /o/ ])), r.case = "null", 
          r.shouldThrowErrorSync(() => e.regexpTestAll([ null, "Hello" ])), r.shouldThrowErrorSync(() => e.regexpTestAll([ "Hello", null ])), 
          r.case = "NaN", r.shouldThrowErrorSync(() => e.regexpTestAll([ "Hello", NaN ])), 
          r.shouldThrowErrorSync(() => e.regexpTestAll([ NaN, "Hello" ])), r.case = "array", 
          r.shouldThrowErrorSync(() => e.regexpTestAll([ [], "h" ]));
        }
        //
        ,
        regexpTestAny: function regexpTestAny(r) {
          r.case = "identical strings";
          var s = "abc", a = "abc", n = !0, c = e.regexpTestAny(s, a);
          r.identical(c, n), r.case = "different strings", s = "abc", a = "abcd", n = !1, 
          c = e.regexpTestAny(s, a), r.identical(c, n), r.case = "One identical string, array", 
          s = "abc", a = [ "abc", "abc" ], n = !0, c = e.regexpTestAny(s, a), r.identical(c, n), 
          r.case = "different strings array", s = "abc", a = [ "abd", "a", "b", "c" ], n = !1, 
          c = e.regexpTestAny(s, a), r.identical(c, n), r.case = "Regexp in string", s = /b/, 
          a = "abcd", n = !0, c = e.regexpTestAny(s, a), r.identical(c, n), r.case = "Regexp not in string", 
          s = /.a/, a = "abcd", n = !1, c = e.regexpTestAny(s, a), r.identical(c, n), r.case = "Regexp in string array", 
          s = /abc/, a = [ "dabcd", "efabcgh", "ijklabc" ], n = !0, c = e.regexpTestAny(s, a), 
          r.identical(c, n), r.case = "Regexp in only one string array", s = /.abc/, a = [ "dabcd", "efgh", "ijkl" ], 
          n = !0, c = e.regexpTestAny(s, a), r.identical(c, n), r.case = "Regexp not in string array", 
          s = /.abc/, a = [ "abcd", "efgh", "ijkl" ], n = !1, c = e.regexpTestAny(s, a), r.identical(c, n), 
          r.case = "Conditional regexp in string", s = /\d|a/, a = "abcd3", n = !0, c = e.regexpTestAny(s, a), 
          r.identical(c, n), r.case = "Conditional regexp not in string", s = /\d(?=\.)/, 
          a = "abcd4", n = !1, c = e.regexpTestAny(s, a), r.identical(c, n), r.case = "Conditional regexp in one string array", 
          s = /\d+(?!\.)|\d+(?=\.)/, a = [ "abcd3", "abcd", "fgh" ], n = !0, c = e.regexpTestAny(s, a), 
          r.identical(c, n), r.case = "Conditional regexp not in string array", s = /[^f-h]/, 
          a = [ "fg", "fh", "h" ], n = !1, c = e.regexpTestAny(s, a), r.identical(c, n), r.case = "none argument", 
          r.shouldThrowErrorSync(() => e.regexpTestAny()), r.case = "not enough arguments", 
          r.shouldThrowErrorSync(() => e.regexpTestAny("ab")), r.case = "too many arguments", 
          r.shouldThrowErrorSync(() => e.regexpTestAny("ab", "cd", "ef")), r.case = "wrong order of arguments", 
          r.shouldThrowErrorSync(() => e.regexpTestAny([ "Hello", /o/ ])), r.case = "null", 
          r.shouldThrowErrorSync(() => e.regexpTestAny([ null, "Hello" ])), r.shouldThrowErrorSync(() => e.regexpTestAny([ "Hello", null ])), 
          r.case = "NaN", r.shouldThrowErrorSync(() => e.regexpTestAny([ "Hello", NaN ])), 
          r.shouldThrowErrorSync(() => e.regexpTestAny([ NaN, "Hello" ])), r.case = "array", 
          r.shouldThrowErrorSync(() => e.regexpTestAny([ [], "h" ]));
        }
        //
        ,
        regexpTestNone: function regexpTestNone(r) {
          r.case = "identical strings";
          var s = "abc", a = "abc", n = !1, c = e.regexpTestNone(s, a);
          r.identical(c, n), r.case = "different strings", s = "c", a = "abcd", n = !0, c = e.regexpTestNone(s, a), 
          r.identical(c, n), r.case = "One identical string, array", s = "abc", a = [ "abc", "abcd" ], 
          n = !1, c = e.regexpTestNone(s, a), r.identical(c, n), r.case = "different strings array", 
          s = "abc", a = [ "abd", "a", "b", "c" ], n = !0, c = e.regexpTestNone(s, a), r.identical(c, n), 
          r.case = "Regexp in string", s = /b/, a = "abcd", n = !1, c = e.regexpTestNone(s, a), 
          r.identical(c, n), r.case = "Regexp not in string", s = /a+/, a = "bcd", n = !0, 
          c = e.regexpTestNone(s, a), r.identical(c, n), r.case = "Regexp in string array", 
          s = /abc/, a = [ "dabcd", "efabcgh", "ijklabc" ], n = !1, c = e.regexpTestNone(s, a), 
          r.identical(c, n), r.case = "Regexp in only one string array", s = /.abc/, a = [ "dabcd", "efgh", "ijkl" ], 
          n = !1, c = e.regexpTestNone(s, a), r.identical(c, n), r.case = "Regexp not in string array", 
          s = /.abc/, a = [ "abcd", "efgh", "ijkl" ], n = !0, c = e.regexpTestNone(s, a), 
          r.identical(c, n), r.case = "Conditional regexp in string", s = /\d|a/, a = "abcd3", 
          n = !1, c = e.regexpTestNone(s, a), r.identical(c, n), r.case = "Conditional regexp not in string", 
          s = /\d(?=\.)/, a = "abcd4", n = !0, c = e.regexpTestNone(s, a), r.identical(c, n), 
          r.case = "Conditional regexp in one string array", s = /\d+(?!\.)|\d+(?!\!)/, a = [ "abcd3", "abcd", "fgh" ], 
          n = !1, c = e.regexpTestNone(s, a), r.identical(c, n), r.case = "Conditional regexp not in string array", 
          s = /[^f-h]/, a = [ "fg", "fh", "h" ], n = !0, c = e.regexpTestNone(s, a), r.identical(c, n), 
          r.case = "none argument", r.shouldThrowErrorSync(() => e.regexpTestNone()), r.case = "not enough arguments", 
          r.shouldThrowErrorSync(() => e.regexpTestNone("ab")), r.case = "too many arguments", 
          r.shouldThrowErrorSync(() => e.regexpTestNone("ab", "cd", "ef")), r.case = "wrong order of arguments", 
          r.shouldThrowErrorSync(() => e.regexpTestNone([ "Hello", /o/ ])), r.case = "null", 
          r.shouldThrowErrorSync(() => e.regexpTestNone([ null, "Hello" ])), r.shouldThrowErrorSync(() => e.regexpTestNone([ "Hello", null ])), 
          r.case = "NaN", r.shouldThrowErrorSync(() => e.regexpTestNone([ "Hello", NaN ])), 
          r.shouldThrowErrorSync(() => e.regexpTestNone([ NaN, "Hello" ])), r.case = "array", 
          r.shouldThrowErrorSync(() => e.regexpTestNone([ [], "h" ]));
        }
        //
        ,
        regexpsTestAll: function regexpsTestAll(r) {
          r.case = "identical strings";
          var s = "abc", a = "abc", n = !0, c = e.regexpsTestAll(s, a);
          r.identical(c, n), r.case = "different strings", s = "abc", a = "abcd", n = !1, 
          c = e.regexpsTestAll(s, a), r.identical(c, n), r.case = "identical strings array", 
          s = [ "abc", "abc" ], a = "abc", n = !0, c = e.regexpsTestAll(s, a), r.identical(c, n), 
          r.case = "different strings array", s = [ "abc", "a", "b", "c" ], a = "abc", n = !1, 
          c = e.regexpsTestAll(s, a), r.identical(c, n), r.case = "regexps in string", s = /b/, 
          a = "abcd", n = !0, c = e.regexpsTestAll(s, a), r.identical(c, n), r.case = "regexps not in string", 
          s = /.a/, a = "abcd", n = !1, c = e.regexpsTestAll(s, a), r.identical(c, n), r.case = "regexps array in string", 
          s = [ /a/, /b/, /c/ ], a = "abc", n = !0, c = e.regexpsTestAll(s, a), r.identical(c, n), 
          r.case = "regexps array not in string", s = [ /a/, /b/, /c/, /d/, /e/ ], a = "abcd", 
          n = !1, c = e.regexpsTestAll(s, a), r.identical(c, n), r.case = "Conditional regexps in string", 
          s = /\d|a/, a = "abcd3", n = !0, c = e.regexpsTestAll(s, a), r.identical(c, n), 
          r.case = "Conditional regexps not in string", s = /\d(?=\.)/, a = "abcd4", n = !1, 
          c = e.regexpsTestAll(s, a), r.identical(c, n), r.case = "Conditional regexps array not in string", 
          s = [ /\d+(?!\.)/, /\d+(?=\.)/ ], a = "abcd3", n = !1, c = e.regexpsTestAll(s, a), 
          r.identical(c, n), r.case = "Conditional regexps array in string", s = [ /[^fdh]/, /\d+(?!\.)/ ], 
          a = "abcd4", n = !0, c = e.regexpsTestAll(s, a), r.identical(c, n), r.case = "Regexps array in string array", 
          s = [ /[^fdh]/, /\d+(?!\.)/ ], a = [ "abcd4", "d3,", "7" ], n = !0, c = e.regexpsTestAll(s, a), 
          r.identical(c, n), r.case = "Regexps array not in part of string array", s = [ /[^fdh]/, /\d+(?!\.)/ ], 
          a = [ "abcd4", "d3,", "7", "d" ], n = !1, c = e.regexpsTestAll(s, a), r.identical(c, n), 
          r.case = "none argument", r.shouldThrowErrorSync(() => e.regexpsTestAll()), r.case = "not enough arguments", 
          r.shouldThrowErrorSync(() => e.regexpsTestAll("ab")), r.case = "too many arguments", 
          r.shouldThrowErrorSync(() => e.regexpsTestAll("ab", "cd", "ef")), r.case = "wrong order of arguments", 
          r.shouldThrowErrorSync(() => e.regexpsTestAll([ "Hello", /o/ ])), r.case = "null", 
          r.shouldThrowErrorSync(() => e.regexpsTestAll([ null, "Hello" ])), r.shouldThrowErrorSync(() => e.regexpsTestAll([ "Hello", null ])), 
          r.case = "NaN", r.shouldThrowErrorSync(() => e.regexpsTestAll([ "Hello", NaN ])), 
          r.shouldThrowErrorSync(() => e.regexpsTestAll([ NaN, "Hello" ])), r.case = "array", 
          r.shouldThrowErrorSync(() => e.regexpsTestAll([ "h", [] ]));
        }
        //
        ,
        regexpsTestAny: function regexpsTestAny(r) {
          r.case = "One different regexp";
          var s = [ "abc", "def" ], a = "abc", n = !0, c = e.regexpsTestAny(s, a);
          r.identical(c, n), r.case = "Identical regexp and string arrays", s = [ "abc", "def" ], 
          a = [ "abc", "def" ], n = !0, c = e.regexpsTestAny(s, a), r.identical(c, n), r.case = "String array with one no- match", 
          s = [ "abc", "def" ], a = [ "abc", "def", "ghi" ], n = !0, c = e.regexpsTestAny(s, a), 
          r.identical(c, n), r.case = "different regexp array", s = [ "abd", "a", "b", "c" ], 
          a = "abc", n = !1, c = e.regexpsTestAny(s, a), r.identical(c, n), r.case = "regexps in string", 
          s = /b/, a = "abcd", n = !0, c = e.regexpsTestAny(s, a), r.identical(c, n), r.case = "regexps not in string", 
          s = /.a/, a = "abcd", n = !1, c = e.regexpsTestAny(s, a), r.identical(c, n), r.case = "regexps array with one no-match in string ", 
          s = [ /[abc]/, /.a/, /\d/ ], a = "dabcd", n = !0, c = e.regexpsTestAny(s, a), r.identical(c, n), 
          r.case = "No regexps in string -  array", s = [ /[abc]/, /.a/, /\d/ ], a = "ijkl", 
          n = !1, c = e.regexpsTestAny(s, a), r.identical(c, n), r.case = "Conditional regexps in one string array", 
          s = [ /\d+(?!\.)/, /\d+(?=\!)/ ], a = [ "abcd3", "abcd", "fg2!h" ], n = !0, c = e.regexpsTestAny(s, a), 
          r.identical(c, n), r.case = "Conditional regexps not in string array", s = [ /[^f-h]/, /[ab]/ ], 
          a = [ "fg", "fh", "h" ], n = !1, c = e.regexpsTestAny(s, a), r.identical(c, n), 
          r.case = "none argument", r.shouldThrowErrorSync(() => e.regexpsTestAny()), r.case = "not enough arguments", 
          r.shouldThrowErrorSync(() => e.regexpsTestAny("ab")), r.case = "too many arguments", 
          r.shouldThrowErrorSync(() => e.regexpsTestAny("ab", "cd", "ef")), r.case = "wrong order of arguments", 
          r.shouldThrowErrorSync(() => e.regexpsTestAny([ "Hello", /o/ ])), r.case = "null", 
          r.shouldThrowErrorSync(() => e.regexpsTestAny([ null, "Hello" ])), r.shouldThrowErrorSync(() => e.regexpsTestAny([ "Hello", null ])), 
          r.case = "NaN", r.shouldThrowErrorSync(() => e.regexpsTestAny([ "Hello", NaN ])), 
          r.shouldThrowErrorSync(() => e.regexpsTestAny([ NaN, "Hello" ])), r.case = "array", 
          r.shouldThrowErrorSync(() => e.regexpsTestAny([ "h", [] ]));
        }
        //
        ,
        regexpsTestNone: function regexpsTestNone(r) {
          r.case = "identical strings";
          var s = "abc", a = "abc", n = !1, c = e.regexpsTestNone(s, a);
          r.identical(c, n), r.case = "different strings", s = "c", a = "abcd", n = !0, c = e.regexpsTestNone(s, a), 
          r.identical(c, n), r.case = "One identical string, array", s = "abc", a = [ "abc", "abcd" ], 
          n = !1, c = e.regexpsTestNone(s, a), r.identical(c, n), r.case = "One identical string, array", 
          s = [ "abc", "abcd" ], a = "abc", n = !1, c = e.regexpsTestNone(s, a), r.identical(c, n), 
          r.case = "different strings array", s = [ "abc", /\d/ ], a = [ "abd", "a", "b", "c" ], 
          n = !0, c = e.regexpsTestNone(s, a), r.identical(c, n), r.case = "regexps in string", 
          s = [ /b/, /c$/ ], a = [ "abc", "hij", "6" ], n = !1, c = e.regexpsTestNone(s, a), 
          r.identical(c, n), r.case = "regexps not in string", s = [ /ba+/, /^\s/ ], a = [ "bcd", "a a", "7633.32" ], 
          n = !0, c = e.regexpsTestNone(s, a), r.identical(c, n), r.case = "one regexps in only one string array", 
          s = [ /.abc/, /\d$/ ], a = [ "dabcd", "efgh", "ijkl" ], n = !1, c = e.regexpsTestNone(s, a), 
          r.identical(c, n), r.case = "none argument", r.shouldThrowErrorSync(() => e.regexpsTestNone()), 
          r.case = "not enough arguments", r.shouldThrowErrorSync(() => e.regexpsTestNone("ab")), 
          r.case = "too many arguments", r.shouldThrowErrorSync(() => e.regexpsTestNone("ab", "cd", "ef")), 
          r.case = "wrong order of arguments", r.shouldThrowErrorSync(() => e.regexpsTestNone([ "Hello", /o/ ])), 
          r.case = "null", r.shouldThrowErrorSync(() => e.regexpsTestNone([ null, "Hello" ])), 
          r.shouldThrowErrorSync(() => e.regexpsTestNone([ "Hello", null ])), r.case = "NaN", 
          r.shouldThrowErrorSync(() => e.regexpsTestNone([ "Hello", NaN ])), r.shouldThrowErrorSync(() => e.regexpsTestNone([ NaN, "Hello" ])), 
          r.case = "array", r.shouldThrowErrorSync(() => e.regexpsTestNone([ "h", [] ]));
        }
        // --
        // suite definition
        // --
            }
    };
    r = wTestSuite(r), "undefined" == typeof module || module.parent || wTester.test(r.name);
  }();
  // == end of file RegexpTestS
}();