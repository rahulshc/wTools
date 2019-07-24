!function StringTestS() {
  // == begin of file StringTestS
  !function _String_test_s_() {
    "use strict";
    "undefined" != typeof module && require("../Layer2.s").include("wTesting"), _global_;
    var a = _global_.wTools, c = {
      name: "Tools/base/l1/String",
      silencing: 1,
      tests: {
        strLeft: 
        // --
        //
        // --
        function strLeft(c) {
          /* - */
          c.open("string"), 
          /* - */
          c.case = "begin";
          var b = {
            index: 0,
            entry: "aa"
          }, e = a.strLeft("aa_aa_bb_bb_cc_cc", "aa");
          c.identical(e, b), c.case = "middle", b = {
            index: 6,
            entry: "bb"
          }, e = a.strLeft("aa_aa_bb_bb_cc_cc", "bb"), c.identical(e, b), c.case = "end", 
          b = {
            index: 12,
            entry: "cc"
          }, e = a.strLeft("aa_aa_bb_bb_cc_cc", "cc"), c.identical(e, b), 
          /* */
          c.case = "begin, several entry", b = {
            index: 0,
            entry: "aa"
          }, e = a.strLeft("aa_aa_bb_bb_cc_cc", [ "aa", "bb" ]), c.identical(e, b), b = {
            index: 0,
            entry: "aa"
          }, e = a.strLeft("aa_aa_bb_bb_cc_cc", [ "bb", "aa" ]), c.identical(e, b), c.case = "middle, several entry", 
          b = {
            index: 6,
            entry: "bb"
          }, e = a.strLeft("aa_aa_bb_bb_cc_cc", [ "bb", "cc" ]), c.identical(e, b), b = {
            index: 6,
            entry: "bb"
          }, e = a.strLeft("aa_aa_bb_bb_cc_cc", [ "cc", "bb" ]), c.identical(e, b), c.case = "end, several entry", 
          b = {
            index: 12,
            entry: "cc"
          }, e = a.strLeft("aa_aa_bb_bb_cc_cc", [ "cc", "dd" ]), c.identical(e, b), b = {
            index: 12,
            entry: "cc"
          }, e = a.strLeft("aa_aa_bb_bb_cc_cc", [ "dd", "cc" ]), c.identical(e, b), 
          /* */
          c.case = "begin, several entry, several sources", b = [ {
            index: 0,
            entry: "aa"
          }, {
            index: 6,
            entry: "bb"
          } ], e = a.strLeft([ "aa_aa_bb_bb_cc_cc", "cc_cc_bb_bb_aa_aa" ], [ "aa", "bb" ]), 
          c.identical(e, b), b = [ {
            index: 0,
            entry: "aa"
          }, {
            index: 6,
            entry: "bb"
          } ], e = a.strLeft([ "aa_aa_bb_bb_cc_cc", "cc_cc_bb_bb_aa_aa" ], [ "bb", "aa" ]), 
          c.identical(e, b), c.case = "middle, several entry, several sources", b = [ {
            index: 6,
            entry: "bb"
          }, {
            index: 0,
            entry: "cc"
          } ], e = a.strLeft([ "aa_aa_bb_bb_cc_cc", "cc_cc_bb_bb_aa_aa" ], [ "bb", "cc" ]), 
          c.identical(e, b), b = [ {
            index: 6,
            entry: "bb"
          }, {
            index: 0,
            entry: "cc"
          } ], e = a.strLeft([ "aa_aa_bb_bb_cc_cc", "cc_cc_bb_bb_aa_aa" ], [ "cc", "bb" ]), 
          c.identical(e, b), c.case = "end, several entry, several sources", b = [ {
            index: 12,
            entry: "cc"
          }, {
            index: 0,
            entry: "cc"
          } ], e = a.strLeft([ "aa_aa_bb_bb_cc_cc", "cc_cc_bb_bb_aa_aa" ], [ "cc", "dd" ]), 
          c.identical(e, b), b = [ {
            index: 12,
            entry: "cc"
          }, {
            index: 0,
            entry: "cc"
          } ], e = a.strLeft([ "aa_aa_bb_bb_cc_cc", "cc_cc_bb_bb_aa_aa" ], [ "dd", "cc" ]), 
          c.identical(e, b), 
          /* */
          c.case = "with window", b = [ {
            index: 0,
            entry: "aa"
          }, {
            index: 6,
            entry: "bb"
          } ], e = a.strLeft([ "aa_aa_bb_bb_cc_cc", "cc_cc_bb_bb_aa_aa" ], [ "aa", "bb" ], -17), 
          c.identical(e, b), b = [ {
            index: 3,
            entry: "aa"
          }, {
            index: 6,
            entry: "bb"
          } ], e = a.strLeft([ "aa_aa_bb_bb_cc_cc", "cc_cc_bb_bb_aa_aa" ], [ "aa", "bb" ], -15), 
          c.identical(e, b), b = [ {
            index: 9,
            entry: "bb"
          }, {
            index: 9,
            entry: "bb"
          } ], e = a.strLeft([ "aa_aa_bb_bb_cc_cc", "cc_cc_bb_bb_aa_aa" ], [ "aa", "bb" ], -10), 
          c.identical(e, b), b = [ {
            index: 17,
            entry: void 0
          }, {
            index: 17,
            entry: void 0
          } ], e = a.strLeft([ "aa_aa_bb_bb_cc_cc", "cc_cc_bb_bb_aa_aa" ], [ "aa", "bb" ], -1), 
          c.identical(e, b), b = [ {
            index: 17,
            entry: void 0
          }, {
            index: 15,
            entry: "aa"
          } ], e = a.strLeft([ "aa_aa_bb_bb_cc_cc", "cc_cc_bb_bb_aa_aa" ], [ "aa", "bb" ], -2), 
          c.identical(e, b), b = [ {
            index: 0,
            entry: "aa"
          }, {
            index: 6,
            entry: "bb"
          } ], e = a.strLeft([ "aa_aa_bb_bb_cc_cc", "cc_cc_bb_bb_aa_aa" ], [ "aa", "bb" ], 0), 
          c.identical(e, b), b = [ {
            index: 3,
            entry: "aa"
          }, {
            index: 6,
            entry: "bb"
          } ], e = a.strLeft([ "aa_aa_bb_bb_cc_cc", "cc_cc_bb_bb_aa_aa" ], [ "aa", "bb" ], 1), 
          c.identical(e, b), b = [ {
            index: 3,
            entry: "aa"
          }, {
            index: 6,
            entry: "bb"
          } ], e = a.strLeft([ "aa_aa_bb_bb_cc_cc", "cc_cc_bb_bb_aa_aa" ], [ "aa", "bb" ], 3), 
          c.identical(e, b), b = [ {
            index: 6,
            entry: "bb"
          }, {
            index: 6,
            entry: "bb"
          } ], e = a.strLeft([ "aa_aa_bb_bb_cc_cc", "cc_cc_bb_bb_aa_aa" ], [ "aa", "bb" ], 6), 
          c.identical(e, b), b = [ {
            index: 9,
            entry: "bb"
          }, {
            index: 9,
            entry: "bb"
          } ], e = a.strLeft([ "aa_aa_bb_bb_cc_cc", "cc_cc_bb_bb_aa_aa" ], [ "aa", "bb" ], 7), 
          c.identical(e, b), b = [ {
            index: 17,
            entry: void 0
          }, {
            index: 12,
            entry: "aa"
          } ], e = a.strLeft([ "aa_aa_bb_bb_cc_cc", "cc_cc_bb_bb_aa_aa" ], [ "aa", "bb" ], 10), 
          c.identical(e, b), b = [ {
            index: 0,
            entry: "aa"
          }, {
            index: 17,
            entry: void 0
          } ], e = a.strLeft([ "aa_aa_bb_bb_cc_cc", "cc_cc_bb_bb_aa_aa" ], [ "aa", "bb" ], -17, -15), 
          c.identical(e, b), b = [ {
            index: 17,
            entry: void 0
          }, {
            index: 17,
            entry: void 0
          } ], e = a.strLeft([ "aa_aa_bb_bb_cc_cc", "cc_cc_bb_bb_aa_aa" ], [ "aa", "bb" ], -17, -16), 
          c.identical(e, b), b = [ {
            index: 0,
            entry: "aa"
          }, {
            index: 17,
            entry: void 0
          } ], e = a.strLeft([ "aa_aa_bb_bb_cc_cc", "cc_cc_bb_bb_aa_aa" ], [ "aa", "bb" ], -17, -10), 
          c.identical(e, b), b = [ {
            index: 0,
            entry: "aa"
          }, {
            index: 6,
            entry: "bb"
          } ], e = a.strLeft([ "aa_aa_bb_bb_cc_cc", "cc_cc_bb_bb_aa_aa" ], [ "aa", "bb" ], -17, -9), 
          c.identical(e, b), b = [ {
            index: 3,
            entry: "aa"
          }, {
            index: 17,
            entry: void 0
          } ], e = a.strLeft([ "aa_aa_bb_bb_cc_cc", "cc_cc_bb_bb_aa_aa" ], [ "aa", "bb" ], -15, -12), 
          c.identical(e, b), b = [ {
            index: 3,
            entry: "aa"
          }, {
            index: 6,
            entry: "bb"
          } ], e = a.strLeft([ "aa_aa_bb_bb_cc_cc", "cc_cc_bb_bb_aa_aa" ], [ "aa", "bb" ], -15, -9), 
          c.identical(e, b), b = [ {
            index: 17,
            entry: void 0
          }, {
            index: 15,
            entry: "aa"
          } ], e = a.strLeft([ "aa_aa_bb_bb_cc_cc", "cc_cc_bb_bb_aa_aa" ], [ "aa", "bb" ], -2, 17), 
          c.identical(e, b), b = [ {
            index: 0,
            entry: "aa"
          }, {
            index: 17,
            entry: void 0
          } ], e = a.strLeft([ "aa_aa_bb_bb_cc_cc", "cc_cc_bb_bb_aa_aa" ], [ "aa", "bb" ], 0, 2), 
          c.identical(e, b), b = [ {
            index: 3,
            entry: "aa"
          }, {
            index: 17,
            entry: void 0
          } ], e = a.strLeft([ "aa_aa_bb_bb_cc_cc", "cc_cc_bb_bb_aa_aa" ], [ "aa", "bb" ], 1, 7), 
          c.identical(e, b), b = [ {
            index: 3,
            entry: "aa"
          }, {
            index: 6,
            entry: "bb"
          } ], e = a.strLeft([ "aa_aa_bb_bb_cc_cc", "cc_cc_bb_bb_aa_aa" ], [ "aa", "bb" ], 1, 8), 
          c.identical(e, b), b = [ {
            index: 0,
            entry: "aa"
          }, {
            index: 17,
            entry: void 0
          } ], e = a.strLeft([ "aa_aa_bb_bb_cc_cc", "cc_cc_bb_bb_aa_aa" ], [ "aa", "bb" ], void 0, -15), 
          c.identical(e, b), b = [ {
            index: 17,
            entry: void 0
          }, {
            index: 17,
            entry: void 0
          } ], e = a.strLeft([ "aa_aa_bb_bb_cc_cc", "cc_cc_bb_bb_aa_aa" ], [ "aa", "bb" ], void 0, -16), 
          c.identical(e, b), b = [ {
            index: 0,
            entry: "aa"
          }, {
            index: 17,
            entry: void 0
          } ], e = a.strLeft([ "aa_aa_bb_bb_cc_cc", "cc_cc_bb_bb_aa_aa" ], [ "aa", "bb" ], void 0, -10), 
          c.identical(e, b), b = [ {
            index: 0,
            entry: "aa"
          }, {
            index: 6,
            entry: "bb"
          } ], e = a.strLeft([ "aa_aa_bb_bb_cc_cc", "cc_cc_bb_bb_aa_aa" ], [ "aa", "bb" ], void 0, -9), 
          c.identical(e, b), b = [ {
            index: 0,
            entry: "aa"
          }, {
            index: 17,
            entry: void 0
          } ], e = a.strLeft([ "aa_aa_bb_bb_cc_cc", "cc_cc_bb_bb_aa_aa" ], [ "aa", "bb" ], void 0, -12), 
          c.identical(e, b), b = [ {
            index: 0,
            entry: "aa"
          }, {
            index: 6,
            entry: "bb"
          } ], e = a.strLeft([ "aa_aa_bb_bb_cc_cc", "cc_cc_bb_bb_aa_aa" ], [ "aa", "bb" ], void 0, 17), 
          c.identical(e, b), b = [ {
            index: 0,
            entry: "aa"
          }, {
            index: 17,
            entry: void 0
          } ], e = a.strLeft([ "aa_aa_bb_bb_cc_cc", "cc_cc_bb_bb_aa_aa" ], [ "aa", "bb" ], void 0, 2), 
          c.identical(e, b), b = [ {
            index: 0,
            entry: "aa"
          }, {
            index: 17,
            entry: void 0
          } ], e = a.strLeft([ "aa_aa_bb_bb_cc_cc", "cc_cc_bb_bb_aa_aa" ], [ "aa", "bb" ], void 0, 7), 
          c.identical(e, b), b = [ {
            index: 0,
            entry: "aa"
          }, {
            index: 6,
            entry: "bb"
          } ], e = a.strLeft([ "aa_aa_bb_bb_cc_cc", "cc_cc_bb_bb_aa_aa" ], [ "aa", "bb" ], void 0, 8), 
          c.identical(e, b), b = [ {
            index: 0,
            entry: "aa"
          }, {
            index: 17,
            entry: void 0
          } ], e = a.strLeft([ "aa_aa_bb_bb_cc_cc", "cc_cc_bb_bb_aa_aa" ], [ "aa", "bb" ], 0, -15), 
          c.identical(e, b), b = [ {
            index: 17,
            entry: void 0
          }, {
            index: 17,
            entry: void 0
          } ], e = a.strLeft([ "aa_aa_bb_bb_cc_cc", "cc_cc_bb_bb_aa_aa" ], [ "aa", "bb" ], 0, -16), 
          c.identical(e, b), b = [ {
            index: 0,
            entry: "aa"
          }, {
            index: 17,
            entry: void 0
          } ], e = a.strLeft([ "aa_aa_bb_bb_cc_cc", "cc_cc_bb_bb_aa_aa" ], [ "aa", "bb" ], 0, -10), 
          c.identical(e, b), b = [ {
            index: 0,
            entry: "aa"
          }, {
            index: 6,
            entry: "bb"
          } ], e = a.strLeft([ "aa_aa_bb_bb_cc_cc", "cc_cc_bb_bb_aa_aa" ], [ "aa", "bb" ], 0, -9), 
          c.identical(e, b), b = [ {
            index: 0,
            entry: "aa"
          }, {
            index: 17,
            entry: void 0
          } ], e = a.strLeft([ "aa_aa_bb_bb_cc_cc", "cc_cc_bb_bb_aa_aa" ], [ "aa", "bb" ], 0, -12), 
          c.identical(e, b), b = [ {
            index: 0,
            entry: "aa"
          }, {
            index: 6,
            entry: "bb"
          } ], e = a.strLeft([ "aa_aa_bb_bb_cc_cc", "cc_cc_bb_bb_aa_aa" ], [ "aa", "bb" ], 0, 17), 
          c.identical(e, b), b = [ {
            index: 0,
            entry: "aa"
          }, {
            index: 17,
            entry: void 0
          } ], e = a.strLeft([ "aa_aa_bb_bb_cc_cc", "cc_cc_bb_bb_aa_aa" ], [ "aa", "bb" ], 0, 2), 
          c.identical(e, b), b = [ {
            index: 0,
            entry: "aa"
          }, {
            index: 17,
            entry: void 0
          } ], e = a.strLeft([ "aa_aa_bb_bb_cc_cc", "cc_cc_bb_bb_aa_aa" ], [ "aa", "bb" ], 0, 7), 
          c.identical(e, b), b = [ {
            index: 0,
            entry: "aa"
          }, {
            index: 6,
            entry: "bb"
          } ], e = a.strLeft([ "aa_aa_bb_bb_cc_cc", "cc_cc_bb_bb_aa_aa" ], [ "aa", "bb" ], 0, 8), 
          c.identical(e, b), 
          /* */
          c.case = "no entry", b = {
            index: 17,
            entry: void 0
          }, e = a.strLeft("aa_aa_bb_bb_cc_cc", []), c.identical(e, b), c.case = "not found", 
          b = {
            index: 17,
            entry: void 0
          }, e = a.strLeft("aa_aa_bb_bb_cc_cc", "dd"), c.identical(e, b), c.case = "empty entry", 
          b = {
            index: 0,
            entry: ""
          }, e = a.strLeft("aa_aa_bb_bb_cc_cc", ""), c.identical(e, b), c.case = "empty entry, empty src", 
          b = {
            index: 0,
            entry: ""
          }, e = a.strLeft("", ""), c.identical(e, b), c.case = "empty src", b = {
            index: 0,
            entry: void 0
          }, e = a.strLeft("", "aa"), c.identical(e, b), 
          /* - */
          c.close("string"), c.open("regexp"), 
          /* - */
          c.case = "begin", b = {
            index: 0,
            entry: "aa"
          }, e = a.strLeft("aa_aa_bb_bb_cc_cc", /a+/), c.identical(e, b), c.case = "middle", 
          b = {
            index: 6,
            entry: "bb"
          }, e = a.strLeft("aa_aa_bb_bb_cc_cc", /b+/), c.identical(e, b), c.case = "end", 
          b = {
            index: 12,
            entry: "cc"
          }, e = a.strLeft("aa_aa_bb_bb_cc_cc", /c+/), c.identical(e, b), 
          /* */
          c.case = "begin smeared", b = {
            index: 0,
            entry: "xa"
          }, e = a.strLeft("xaax_xaax_xbbx_xbbx_xccx_xccx", /\wa/), c.identical(e, b), c.case = "middle smeared", 
          b = {
            index: 10,
            entry: "xb"
          }, e = a.strLeft("xaax_xaax_xbbx_xbbx_xccx_xccx", /\wb/), c.identical(e, b), c.case = "end ", 
          b = {
            index: 20,
            entry: "xc"
          }, e = a.strLeft("xaax_xaax_xbbx_xbbx_xccx_xccx", /\wc/), c.identical(e, b), 
          /* */
          c.case = "begin, several entry", b = {
            index: 0,
            entry: "aa"
          }, e = a.strLeft("aa_aa_bb_bb_cc_cc", [ /a+/, /b+/ ]), c.identical(e, b), b = {
            index: 0,
            entry: "aa"
          }, e = a.strLeft("aa_aa_bb_bb_cc_cc", [ /b+/, /a+/ ]), c.identical(e, b), c.case = "middle, several entry", 
          b = {
            index: 6,
            entry: "bb"
          }, e = a.strLeft("aa_aa_bb_bb_cc_cc", [ /b+/, /c+/ ]), c.identical(e, b), b = {
            index: 6,
            entry: "bb"
          }, e = a.strLeft("aa_aa_bb_bb_cc_cc", [ /c+/, /b+/ ]), c.identical(e, b), c.case = "end, several entry", 
          b = {
            index: 12,
            entry: "cc"
          }, e = a.strLeft("aa_aa_bb_bb_cc_cc", [ /c+/, /d+/ ]), c.identical(e, b), b = {
            index: 12,
            entry: "cc"
          }, e = a.strLeft("aa_aa_bb_bb_cc_cc", [ /d+/, /c+/ ]), c.identical(e, b), 
          /* */
          c.case = "begin, several entry, several sources", b = [ {
            index: 0,
            entry: "aa"
          }, {
            index: 6,
            entry: "bb"
          } ], e = a.strLeft([ "aa_aa_bb_bb_cc_cc", "cc_cc_bb_bb_aa_aa" ], [ /a+/, /b+/ ]), 
          c.identical(e, b), b = [ {
            index: 0,
            entry: "aa"
          }, {
            index: 6,
            entry: "bb"
          } ], e = a.strLeft([ "aa_aa_bb_bb_cc_cc", "cc_cc_bb_bb_aa_aa" ], [ /b+/, /a+/ ]), 
          c.identical(e, b), c.case = "middle, several entry, several sources", b = [ {
            index: 6,
            entry: "bb"
          }, {
            index: 0,
            entry: "cc"
          } ], e = a.strLeft([ "aa_aa_bb_bb_cc_cc", "cc_cc_bb_bb_aa_aa" ], [ /b+/, /c+/ ]), 
          c.identical(e, b), b = [ {
            index: 6,
            entry: "bb"
          }, {
            index: 0,
            entry: "cc"
          } ], e = a.strLeft([ "aa_aa_bb_bb_cc_cc", "cc_cc_bb_bb_aa_aa" ], [ /c+/, /b+/ ]), 
          c.identical(e, b), c.case = "end, several entry, several sources", b = [ {
            index: 12,
            entry: "cc"
          }, {
            index: 0,
            entry: "cc"
          } ], e = a.strLeft([ "aa_aa_bb_bb_cc_cc", "cc_cc_bb_bb_aa_aa" ], [ /c+/, /d+/ ]), 
          c.identical(e, b), b = [ {
            index: 12,
            entry: "cc"
          }, {
            index: 0,
            entry: "cc"
          } ], e = a.strLeft([ "aa_aa_bb_bb_cc_cc", "cc_cc_bb_bb_aa_aa" ], [ /d+/, /c+/ ]), 
          c.identical(e, b), 
          /* */
          c.case = "with window, mixed", b = [ {
            index: 0,
            entry: "aa"
          }, {
            index: 6,
            entry: "bb"
          } ], e = a.strLeft([ "aa_aa_bb_bb_cc_cc", "cc_cc_bb_bb_aa_aa" ], [ /a+/, "bb" ], -17), 
          c.identical(e, b), b = [ {
            index: 3,
            entry: "aa"
          }, {
            index: 6,
            entry: "bb"
          } ], e = a.strLeft([ "aa_aa_bb_bb_cc_cc", "cc_cc_bb_bb_aa_aa" ], [ /a+/, "bb" ], -15), 
          c.identical(e, b), b = [ {
            index: 9,
            entry: "bb"
          }, {
            index: 9,
            entry: "bb"
          } ], e = a.strLeft([ "aa_aa_bb_bb_cc_cc", "cc_cc_bb_bb_aa_aa" ], [ /a+/, "bb" ], -10), 
          c.identical(e, b), b = [ {
            index: 17,
            entry: void 0
          }, {
            index: 16,
            entry: "a"
          } ], e = a.strLeft([ "aa_aa_bb_bb_cc_cc", "cc_cc_bb_bb_aa_aa" ], [ /a+/, "bb" ], -1), 
          c.identical(e, b), b = [ {
            index: 17,
            entry: void 0
          }, {
            index: 15,
            entry: "aa"
          } ], e = a.strLeft([ "aa_aa_bb_bb_cc_cc", "cc_cc_bb_bb_aa_aa" ], [ /a+/, "bb" ], -2), 
          c.identical(e, b), b = [ {
            index: 0,
            entry: "aa"
          }, {
            index: 6,
            entry: "bb"
          } ], e = a.strLeft([ "aa_aa_bb_bb_cc_cc", "cc_cc_bb_bb_aa_aa" ], [ /a+/, "bb" ], 0), 
          c.identical(e, b), b = [ {
            index: 0,
            entry: "aa"
          }, {
            index: 17,
            entry: void 0
          } ], e = a.strLeft([ "aa_aa_bb_bb_cc_cc", "cc_cc_bb_bb_aa_aa" ], [ /a+/, "bb" ], -17, -15), 
          c.identical(e, b), b = [ {
            index: 0,
            entry: "aa"
          }, {
            index: 17,
            entry: void 0
          } ], e = a.strLeft([ "aa_aa_bb_bb_cc_cc", "cc_cc_bb_bb_aa_aa" ], [ /a+/, "bb" ], 0, 2), 
          c.identical(e, b), b = [ {
            index: 1,
            entry: "a"
          }, {
            index: 17,
            entry: void 0
          } ], e = a.strLeft([ "aa_aa_bb_bb_cc_cc", "cc_cc_bb_bb_aa_aa" ], [ /a+/, "bb" ], 1, 7), 
          c.identical(e, b), b = [ {
            index: 1,
            entry: "a"
          }, {
            index: 6,
            entry: "bb"
          } ], e = a.strLeft([ "aa_aa_bb_bb_cc_cc", "cc_cc_bb_bb_aa_aa" ], [ /a+/, "bb" ], 1, 8), 
          c.identical(e, b), b = [ {
            index: 0,
            entry: "aa"
          }, {
            index: 17,
            entry: void 0
          } ], e = a.strLeft([ "aa_aa_bb_bb_cc_cc", "cc_cc_bb_bb_aa_aa" ], [ /a+/, "bb" ], void 0, -15), 
          c.identical(e, b), b = [ {
            index: 0,
            entry: "a"
          }, {
            index: 17,
            entry: void 0
          } ], e = a.strLeft([ "aa_aa_bb_bb_cc_cc", "cc_cc_bb_bb_aa_aa" ], [ /a+/, "bb" ], void 0, -16), 
          c.identical(e, b), b = [ {
            index: 0,
            entry: "aa"
          }, {
            index: 17,
            entry: void 0
          } ], e = a.strLeft([ "aa_aa_bb_bb_cc_cc", "cc_cc_bb_bb_aa_aa" ], [ /a+/, "bb" ], void 0, 7), 
          c.identical(e, b), b = [ {
            index: 0,
            entry: "aa"
          }, {
            index: 6,
            entry: "bb"
          } ], e = a.strLeft([ "aa_aa_bb_bb_cc_cc", "cc_cc_bb_bb_aa_aa" ], [ /a+/, "bb" ], void 0, 8), 
          c.identical(e, b), b = [ {
            index: 0,
            entry: "aa"
          }, {
            index: 17,
            entry: void 0
          } ], e = a.strLeft([ "aa_aa_bb_bb_cc_cc", "cc_cc_bb_bb_aa_aa" ], [ /a+/, "bb" ], 0, 7), 
          c.identical(e, b), b = [ {
            index: 0,
            entry: "aa"
          }, {
            index: 6,
            entry: "bb"
          } ], e = a.strLeft([ "aa_aa_bb_bb_cc_cc", "cc_cc_bb_bb_aa_aa" ], [ /a+/, "bb" ], 0, 8), 
          c.identical(e, b), 
          /* */
          c.case = "no entry", b = {
            index: 17,
            entry: void 0
          }, e = a.strLeft("aa_aa_bb_bb_cc_cc", []), c.identical(e, b), c.case = "not found", 
          b = {
            index: 17,
            entry: void 0
          }, e = a.strLeft("aa_aa_bb_bb_cc_cc", /d+/), c.identical(e, b), c.case = "empty entry", 
          b = {
            index: 0,
            entry: ""
          }, e = a.strLeft("aa_aa_bb_bb_cc_cc", new RegExp("")), c.identical(e, b), c.case = "empty entry, empty src", 
          b = {
            index: 0,
            entry: ""
          }, e = a.strLeft("", new RegExp("")), c.identical(e, b), c.case = "empty src", b = {
            index: 0,
            entry: void 0
          }, e = a.strLeft("", /a+/), c.identical(e, b), 
          /* - */
          c.close("regexp"), c.open("throwing"), c.shouldThrowErrorSync(() => a.strLeft("abc", "b", -100)), 
          c.shouldThrowErrorSync(() => a.strLeft("abc", "b", 100)), c.shouldThrowErrorSync(() => a.strLeft("abc", "b", 0, -100)), 
          c.shouldThrowErrorSync(() => a.strLeft("abc", "b", 0, 100)), c.shouldThrowErrorSync(() => a.strLeft(/a/, /a+/)), 
          c.shouldThrowErrorSync(() => a.strLeft("abc", /a+/, "")), c.shouldThrowErrorSync(() => a.strLeft("abc")), 
          c.shouldThrowErrorSync(() => a.strLeft("123", 1)), c.shouldThrowErrorSync(() => a.strLeft("123", [ 1 ])), 
          c.shouldThrowErrorSync(() => a.strLeft()), c.close("throwing");
        }
        //
        ,
        strRight: function strRight(c) {
          /* - */
          c.open("string"), 
          /* - */
          c.case = "begin";
          var b = {
            index: 3,
            entry: "aa"
          }, e = a.strRight("aa_aa_bb_bb_cc_cc", "aa");
          c.identical(e, b), c.case = "middle", b = {
            index: 9,
            entry: "bb"
          }, e = a.strRight("aa_aa_bb_bb_cc_cc", "bb"), c.identical(e, b), c.case = "end", 
          b = {
            index: 15,
            entry: "cc"
          }, e = a.strRight("aa_aa_bb_bb_cc_cc", "cc"), c.identical(e, b), 
          /* */
          c.case = "begin, several entry", b = {
            index: 9,
            entry: "bb"
          }, e = a.strRight("aa_aa_bb_bb_cc_cc", [ "aa", "bb" ]), c.identical(e, b), b = {
            index: 9,
            entry: "bb"
          }, e = a.strRight("aa_aa_bb_bb_cc_cc", [ "bb", "aa" ]), c.identical(e, b), c.case = "middle, several entry", 
          b = {
            index: 15,
            entry: "cc"
          }, e = a.strRight("aa_aa_bb_bb_cc_cc", [ "bb", "cc" ]), c.identical(e, b), b = {
            index: 15,
            entry: "cc"
          }, e = a.strRight("aa_aa_bb_bb_cc_cc", [ "cc", "bb" ]), c.identical(e, b), c.case = "end, several entry", 
          b = {
            index: 15,
            entry: "cc"
          }, e = a.strRight("aa_aa_bb_bb_cc_cc", [ "cc", "dd" ]), c.identical(e, b), b = {
            index: 15,
            entry: "cc"
          }, e = a.strRight("aa_aa_bb_bb_cc_cc", [ "dd", "cc" ]), c.identical(e, b), 
          /* */
          c.case = "begin, several entry, several sources", b = [ {
            index: 9,
            entry: "bb"
          }, {
            index: 15,
            entry: "aa"
          } ], e = a.strRight([ "aa_aa_bb_bb_cc_cc", "cc_cc_bb_bb_aa_aa" ], [ "aa", "bb" ]), 
          c.identical(e, b), b = [ {
            index: 9,
            entry: "bb"
          }, {
            index: 15,
            entry: "aa"
          } ], e = a.strRight([ "aa_aa_bb_bb_cc_cc", "cc_cc_bb_bb_aa_aa" ], [ "bb", "aa" ]), 
          c.identical(e, b), c.case = "middle, several entry, several sources", b = [ {
            index: 15,
            entry: "cc"
          }, {
            index: 9,
            entry: "bb"
          } ], e = a.strRight([ "aa_aa_bb_bb_cc_cc", "cc_cc_bb_bb_aa_aa" ], [ "bb", "cc" ]), 
          c.identical(e, b), b = [ {
            index: 15,
            entry: "cc"
          }, {
            index: 9,
            entry: "bb"
          } ], e = a.strRight([ "aa_aa_bb_bb_cc_cc", "cc_cc_bb_bb_aa_aa" ], [ "cc", "bb" ]), 
          c.identical(e, b), c.case = "end, several entry, several sources", b = [ {
            index: 15,
            entry: "cc"
          }, {
            index: 3,
            entry: "cc"
          } ], e = a.strRight([ "aa_aa_bb_bb_cc_cc", "cc_cc_bb_bb_aa_aa" ], [ "cc", "dd" ]), 
          c.identical(e, b), b = [ {
            index: 15,
            entry: "cc"
          }, {
            index: 3,
            entry: "cc"
          } ], e = a.strRight([ "aa_aa_bb_bb_cc_cc", "cc_cc_bb_bb_aa_aa" ], [ "dd", "cc" ]), 
          c.identical(e, b), 
          /* */
          c.case = "with window", b = [ {
            index: 9,
            entry: "bb"
          }, {
            index: 15,
            entry: "aa"
          } ], e = a.strRight([ "aa_aa_bb_bb_cc_cc", "cc_cc_bb_bb_aa_aa" ], [ "aa", "bb" ], -17), 
          c.identical(e, b), b = [ {
            index: 9,
            entry: "bb"
          }, {
            index: 15,
            entry: "aa"
          } ], e = a.strRight([ "aa_aa_bb_bb_cc_cc", "cc_cc_bb_bb_aa_aa" ], [ "aa", "bb" ], -15), 
          c.identical(e, b), b = [ {
            index: 9,
            entry: "bb"
          }, {
            index: 15,
            entry: "aa"
          } ], e = a.strRight([ "aa_aa_bb_bb_cc_cc", "cc_cc_bb_bb_aa_aa" ], [ "aa", "bb" ], -10), 
          c.identical(e, b), b = [ {
            index: -1,
            entry: void 0
          }, {
            index: -1,
            entry: void 0
          } ], e = a.strRight([ "aa_aa_bb_bb_cc_cc", "cc_cc_bb_bb_aa_aa" ], [ "aa", "bb" ], -1), 
          c.identical(e, b), b = [ {
            index: -1,
            entry: void 0
          }, {
            index: 15,
            entry: "aa"
          } ], e = a.strRight([ "aa_aa_bb_bb_cc_cc", "cc_cc_bb_bb_aa_aa" ], [ "aa", "bb" ], -2), 
          c.identical(e, b), b = [ {
            index: 9,
            entry: "bb"
          }, {
            index: 15,
            entry: "aa"
          } ], e = a.strRight([ "aa_aa_bb_bb_cc_cc", "cc_cc_bb_bb_aa_aa" ], [ "aa", "bb" ], 0), 
          c.identical(e, b), b = [ {
            index: 9,
            entry: "bb"
          }, {
            index: 15,
            entry: "aa"
          } ], e = a.strRight([ "aa_aa_bb_bb_cc_cc", "cc_cc_bb_bb_aa_aa" ], [ "aa", "bb" ], 1), 
          c.identical(e, b), b = [ {
            index: 9,
            entry: "bb"
          }, {
            index: 15,
            entry: "aa"
          } ], e = a.strRight([ "aa_aa_bb_bb_cc_cc", "cc_cc_bb_bb_aa_aa" ], [ "aa", "bb" ], 3), 
          c.identical(e, b), b = [ {
            index: 9,
            entry: "bb"
          }, {
            index: 15,
            entry: "aa"
          } ], e = a.strRight([ "aa_aa_bb_bb_cc_cc", "cc_cc_bb_bb_aa_aa" ], [ "aa", "bb" ], 6), 
          c.identical(e, b), b = [ {
            index: 9,
            entry: "bb"
          }, {
            index: 15,
            entry: "aa"
          } ], e = a.strRight([ "aa_aa_bb_bb_cc_cc", "cc_cc_bb_bb_aa_aa" ], [ "aa", "bb" ], 7), 
          c.identical(e, b), b = [ {
            index: -1,
            entry: void 0
          }, {
            index: 15,
            entry: "aa"
          } ], e = a.strRight([ "aa_aa_bb_bb_cc_cc", "cc_cc_bb_bb_aa_aa" ], [ "aa", "bb" ], 10), 
          c.identical(e, b), b = [ {
            index: 0,
            entry: "aa"
          }, {
            index: -1,
            entry: void 0
          } ], e = a.strRight([ "aa_aa_bb_bb_cc_cc", "cc_cc_bb_bb_aa_aa" ], [ "aa", "bb" ], -17, -15), 
          c.identical(e, b), b = [ {
            index: -1,
            entry: void 0
          }, {
            index: -1,
            entry: void 0
          } ], e = a.strRight([ "aa_aa_bb_bb_cc_cc", "cc_cc_bb_bb_aa_aa" ], [ "aa", "bb" ], -17, -16), 
          c.identical(e, b), b = [ {
            index: 3,
            entry: "aa"
          }, {
            index: -1,
            entry: void 0
          } ], e = a.strRight([ "aa_aa_bb_bb_cc_cc", "cc_cc_bb_bb_aa_aa" ], [ "aa", "bb" ], -17, -10), 
          c.identical(e, b), b = [ {
            index: 6,
            entry: "bb"
          }, {
            index: 6,
            entry: "bb"
          } ], e = a.strRight([ "aa_aa_bb_bb_cc_cc", "cc_cc_bb_bb_aa_aa" ], [ "aa", "bb" ], -17, -9), 
          c.identical(e, b), b = [ {
            index: 3,
            entry: "aa"
          }, {
            index: -1,
            entry: void 0
          } ], e = a.strRight([ "aa_aa_bb_bb_cc_cc", "cc_cc_bb_bb_aa_aa" ], [ "aa", "bb" ], -15, -12), 
          c.identical(e, b), b = [ {
            index: 6,
            entry: "bb"
          }, {
            index: 6,
            entry: "bb"
          } ], e = a.strRight([ "aa_aa_bb_bb_cc_cc", "cc_cc_bb_bb_aa_aa" ], [ "aa", "bb" ], -15, -9), 
          c.identical(e, b), b = [ {
            index: -1,
            entry: void 0
          }, {
            index: 15,
            entry: "aa"
          } ], e = a.strRight([ "aa_aa_bb_bb_cc_cc", "cc_cc_bb_bb_aa_aa" ], [ "aa", "bb" ], -2, 17), 
          c.identical(e, b), b = [ {
            index: 0,
            entry: "aa"
          }, {
            index: -1,
            entry: void 0
          } ], e = a.strRight([ "aa_aa_bb_bb_cc_cc", "cc_cc_bb_bb_aa_aa" ], [ "aa", "bb" ], 0, 2), 
          c.identical(e, b), b = [ {
            index: 3,
            entry: "aa"
          }, {
            index: -1,
            entry: void 0
          } ], e = a.strRight([ "aa_aa_bb_bb_cc_cc", "cc_cc_bb_bb_aa_aa" ], [ "aa", "bb" ], 1, 7), 
          c.identical(e, b), b = [ {
            index: 6,
            entry: "bb"
          }, {
            index: 6,
            entry: "bb"
          } ], e = a.strRight([ "aa_aa_bb_bb_cc_cc", "cc_cc_bb_bb_aa_aa" ], [ "aa", "bb" ], 1, 8), 
          c.identical(e, b), b = [ {
            index: 0,
            entry: "aa"
          }, {
            index: -1,
            entry: void 0
          } ], e = a.strRight([ "aa_aa_bb_bb_cc_cc", "cc_cc_bb_bb_aa_aa" ], [ "aa", "bb" ], void 0, -15), 
          c.identical(e, b), b = [ {
            index: -1,
            entry: void 0
          }, {
            index: -1,
            entry: void 0
          } ], e = a.strRight([ "aa_aa_bb_bb_cc_cc", "cc_cc_bb_bb_aa_aa" ], [ "aa", "bb" ], void 0, -16), 
          c.identical(e, b), b = [ {
            index: 3,
            entry: "aa"
          }, {
            index: -1,
            entry: void 0
          } ], e = a.strRight([ "aa_aa_bb_bb_cc_cc", "cc_cc_bb_bb_aa_aa" ], [ "aa", "bb" ], void 0, -10), 
          c.identical(e, b), b = [ {
            index: 6,
            entry: "bb"
          }, {
            index: 6,
            entry: "bb"
          } ], e = a.strRight([ "aa_aa_bb_bb_cc_cc", "cc_cc_bb_bb_aa_aa" ], [ "aa", "bb" ], void 0, -9), 
          c.identical(e, b), b = [ {
            index: 3,
            entry: "aa"
          }, {
            index: -1,
            entry: void 0
          } ], e = a.strRight([ "aa_aa_bb_bb_cc_cc", "cc_cc_bb_bb_aa_aa" ], [ "aa", "bb" ], void 0, -12), 
          c.identical(e, b), b = [ {
            index: 9,
            entry: "bb"
          }, {
            index: 15,
            entry: "aa"
          } ], e = a.strRight([ "aa_aa_bb_bb_cc_cc", "cc_cc_bb_bb_aa_aa" ], [ "aa", "bb" ], void 0, 17), 
          c.identical(e, b), b = [ {
            index: 0,
            entry: "aa"
          }, {
            index: -1,
            entry: void 0
          } ], e = a.strRight([ "aa_aa_bb_bb_cc_cc", "cc_cc_bb_bb_aa_aa" ], [ "aa", "bb" ], void 0, 2), 
          c.identical(e, b), b = [ {
            index: 3,
            entry: "aa"
          }, {
            index: -1,
            entry: void 0
          } ], e = a.strRight([ "aa_aa_bb_bb_cc_cc", "cc_cc_bb_bb_aa_aa" ], [ "aa", "bb" ], void 0, 7), 
          c.identical(e, b), b = [ {
            index: 6,
            entry: "bb"
          }, {
            index: 6,
            entry: "bb"
          } ], e = a.strRight([ "aa_aa_bb_bb_cc_cc", "cc_cc_bb_bb_aa_aa" ], [ "aa", "bb" ], void 0, 8), 
          c.identical(e, b), b = [ {
            index: 0,
            entry: "aa"
          }, {
            index: -1,
            entry: void 0
          } ], e = a.strRight([ "aa_aa_bb_bb_cc_cc", "cc_cc_bb_bb_aa_aa" ], [ "aa", "bb" ], 0, -15), 
          c.identical(e, b), b = [ {
            index: -1,
            entry: void 0
          }, {
            index: -1,
            entry: void 0
          } ], e = a.strRight([ "aa_aa_bb_bb_cc_cc", "cc_cc_bb_bb_aa_aa" ], [ "aa", "bb" ], 0, -16), 
          c.identical(e, b), b = [ {
            index: 3,
            entry: "aa"
          }, {
            index: -1,
            entry: void 0
          } ], e = a.strRight([ "aa_aa_bb_bb_cc_cc", "cc_cc_bb_bb_aa_aa" ], [ "aa", "bb" ], 0, -10), 
          c.identical(e, b), b = [ {
            index: 6,
            entry: "bb"
          }, {
            index: 6,
            entry: "bb"
          } ], e = a.strRight([ "aa_aa_bb_bb_cc_cc", "cc_cc_bb_bb_aa_aa" ], [ "aa", "bb" ], 0, -9), 
          c.identical(e, b), b = [ {
            index: 3,
            entry: "aa"
          }, {
            index: -1,
            entry: void 0
          } ], e = a.strRight([ "aa_aa_bb_bb_cc_cc", "cc_cc_bb_bb_aa_aa" ], [ "aa", "bb" ], 0, -12), 
          c.identical(e, b), b = [ {
            index: 9,
            entry: "bb"
          }, {
            index: 15,
            entry: "aa"
          } ], e = a.strRight([ "aa_aa_bb_bb_cc_cc", "cc_cc_bb_bb_aa_aa" ], [ "aa", "bb" ], 0, 17), 
          c.identical(e, b), b = [ {
            index: 0,
            entry: "aa"
          }, {
            index: -1,
            entry: void 0
          } ], e = a.strRight([ "aa_aa_bb_bb_cc_cc", "cc_cc_bb_bb_aa_aa" ], [ "aa", "bb" ], 0, 2), 
          c.identical(e, b), b = [ {
            index: 3,
            entry: "aa"
          }, {
            index: -1,
            entry: void 0
          } ], e = a.strRight([ "aa_aa_bb_bb_cc_cc", "cc_cc_bb_bb_aa_aa" ], [ "aa", "bb" ], 0, 7), 
          c.identical(e, b), b = [ {
            index: 6,
            entry: "bb"
          }, {
            index: 6,
            entry: "bb"
          } ], e = a.strRight([ "aa_aa_bb_bb_cc_cc", "cc_cc_bb_bb_aa_aa" ], [ "aa", "bb" ], 0, 8), 
          c.identical(e, b), 
          /* */
          c.case = "no entry", b = {
            index: -1,
            entry: void 0
          }, e = a.strRight("aa_aa_bb_bb_cc_cc", []), c.identical(e, b), c.case = "not found", 
          b = {
            index: -1,
            entry: void 0
          }, e = a.strRight("aa_aa_bb_bb_cc_cc", "dd"), c.identical(e, b), c.case = "empty entry", 
          b = {
            index: 17,
            entry: ""
          }, e = a.strRight("aa_aa_bb_bb_cc_cc", ""), c.identical(e, b), c.case = "empty entry, empty src", 
          b = {
            index: 0,
            entry: ""
          }, e = a.strRight("", ""), c.identical(e, b), c.case = "empty src", b = {
            index: -1,
            entry: void 0
          }, e = a.strRight("", "aa"), c.identical(e, b), 
          /* - */
          c.close("string"), c.open("regexp"), 
          /* - */
          c.case = "begin", b = {
            index: 3,
            entry: "aa"
          }, e = a.strRight("aa_aa_bb_bb_cc_cc", /a+/), c.identical(e, b), c.case = "middle", 
          b = {
            index: 9,
            entry: "bb"
          }, e = a.strRight("aa_aa_bb_bb_cc_cc", /b+/), c.identical(e, b), c.case = "end", 
          b = {
            index: 15,
            entry: "cc"
          }, e = a.strRight("aa_aa_bb_bb_cc_cc", /c+/), c.identical(e, b), 
          /* */
          c.case = "begin smeared", b = {
            index: 7,
            entry: "ax"
          }, e = a.strRight("xaax_xaax_xbbx_xbbx_xccx_xccx", /a\w/), c.identical(e, b), c.case = "middle smeared", 
          b = {
            index: 17,
            entry: "bx"
          }, e = a.strRight("xaax_xaax_xbbx_xbbx_xccx_xccx", /b\w/), c.identical(e, b), c.case = "end ", 
          b = {
            index: 27,
            entry: "cx"
          }, e = a.strRight("xaax_xaax_xbbx_xbbx_xccx_xccx", /c\w/), c.identical(e, b), 
          /* */
          c.case = "begin, several entry", b = {
            index: 9,
            entry: "bb"
          }, e = a.strRight("aa_aa_bb_bb_cc_cc", [ /a+/, /b+/ ]), c.identical(e, b), b = {
            index: 9,
            entry: "bb"
          }, e = a.strRight("aa_aa_bb_bb_cc_cc", [ /b+/, /a+/ ]), c.identical(e, b), c.case = "middle, several entry", 
          b = {
            index: 15,
            entry: "cc"
          }, e = a.strRight("aa_aa_bb_bb_cc_cc", [ /b+/, /c+/ ]), c.identical(e, b), b = {
            index: 15,
            entry: "cc"
          }, e = a.strRight("aa_aa_bb_bb_cc_cc", [ /c+/, /b+/ ]), c.identical(e, b), c.case = "end, several entry", 
          b = {
            index: 15,
            entry: "cc"
          }, e = a.strRight("aa_aa_bb_bb_cc_cc", [ /c+/, /d+/ ]), c.identical(e, b), b = {
            index: 15,
            entry: "cc"
          }, e = a.strRight("aa_aa_bb_bb_cc_cc", [ /d+/, /c+/ ]), c.identical(e, b), 
          /* */
          c.case = "begin, several entry, several sources", b = [ {
            index: 9,
            entry: "bb"
          }, {
            index: 15,
            entry: "aa"
          } ], e = a.strRight([ "aa_aa_bb_bb_cc_cc", "cc_cc_bb_bb_aa_aa" ], [ /a+/, /b+/ ]), 
          c.identical(e, b), b = [ {
            index: 9,
            entry: "bb"
          }, {
            index: 15,
            entry: "aa"
          } ], e = a.strRight([ "aa_aa_bb_bb_cc_cc", "cc_cc_bb_bb_aa_aa" ], [ /b+/, /a+/ ]), 
          c.identical(e, b), c.case = "middle, several entry, several sources", b = [ {
            index: 15,
            entry: "cc"
          }, {
            index: 9,
            entry: "bb"
          } ], e = a.strRight([ "aa_aa_bb_bb_cc_cc", "cc_cc_bb_bb_aa_aa" ], [ /b+/, /c+/ ]), 
          c.identical(e, b), b = [ {
            index: 15,
            entry: "cc"
          }, {
            index: 9,
            entry: "bb"
          } ], e = a.strRight([ "aa_aa_bb_bb_cc_cc", "cc_cc_bb_bb_aa_aa" ], [ /c+/, /b+/ ]), 
          c.identical(e, b), c.case = "end, several entry, several sources", b = [ {
            index: 15,
            entry: "cc"
          }, {
            index: 3,
            entry: "cc"
          } ], e = a.strRight([ "aa_aa_bb_bb_cc_cc", "cc_cc_bb_bb_aa_aa" ], [ /c+/, /d+/ ]), 
          c.identical(e, b), b = [ {
            index: 15,
            entry: "cc"
          }, {
            index: 3,
            entry: "cc"
          } ], e = a.strRight([ "aa_aa_bb_bb_cc_cc", "cc_cc_bb_bb_aa_aa" ], [ /d+/, /c+/ ]), 
          c.identical(e, b), 
          /* */
          c.case = "with window, mixed", b = [ {
            index: 9,
            entry: "bb"
          }, {
            index: 15,
            entry: "aa"
          } ], e = a.strRight([ "aa_aa_bb_bb_cc_cc", "cc_cc_bb_bb_aa_aa" ], [ /a+/, "bb" ], -17), 
          c.identical(e, b), b = [ {
            index: 9,
            entry: "bb"
          }, {
            index: 15,
            entry: "aa"
          } ], e = a.strRight([ "aa_aa_bb_bb_cc_cc", "cc_cc_bb_bb_aa_aa" ], [ /a+/, "bb" ], -15), 
          c.identical(e, b), b = [ {
            index: 9,
            entry: "bb"
          }, {
            index: 15,
            entry: "aa"
          } ], e = a.strRight([ "aa_aa_bb_bb_cc_cc", "cc_cc_bb_bb_aa_aa" ], [ /a+/, "bb" ], -10), 
          c.identical(e, b), b = [ {
            index: -1,
            entry: void 0
          }, {
            index: 16,
            entry: "a"
          } ], e = a.strRight([ "aa_aa_bb_bb_cc_cc", "cc_cc_bb_bb_aa_aa" ], [ /a+/, "bb" ], -1), 
          c.identical(e, b), b = [ {
            index: -1,
            entry: void 0
          }, {
            index: 15,
            entry: "aa"
          } ], e = a.strRight([ "aa_aa_bb_bb_cc_cc", "cc_cc_bb_bb_aa_aa" ], [ /a+/, "bb" ], -2), 
          c.identical(e, b), b = [ {
            index: 9,
            entry: "bb"
          }, {
            index: 15,
            entry: "aa"
          } ], e = a.strRight([ "aa_aa_bb_bb_cc_cc", "cc_cc_bb_bb_aa_aa" ], [ /a+/, "bb" ], 0), 
          c.identical(e, b), b = [ {
            index: 0,
            entry: "aa"
          }, {
            index: -1,
            entry: void 0
          } ], e = a.strRight([ "aa_aa_bb_bb_cc_cc", "cc_cc_bb_bb_aa_aa" ], [ /a+/, "bb" ], -17, -15), 
          c.identical(e, b), b = [ {
            index: 0,
            entry: "aa"
          }, {
            index: -1,
            entry: void 0
          } ], e = a.strRight([ "aa_aa_bb_bb_cc_cc", "cc_cc_bb_bb_aa_aa" ], [ /a+/, "bb" ], 0, 2), 
          c.identical(e, b), b = [ {
            index: 3,
            entry: "aa"
          }, {
            index: -1,
            entry: void 0
          } ], e = a.strRight([ "aa_aa_bb_bb_cc_cc", "cc_cc_bb_bb_aa_aa" ], [ /a+/, "bb" ], 1, 7), 
          c.identical(e, b), b = [ {
            index: 6,
            entry: "bb"
          }, {
            index: 6,
            entry: "bb"
          } ], e = a.strRight([ "aa_aa_bb_bb_cc_cc", "cc_cc_bb_bb_aa_aa" ], [ /a+/, "bb" ], 1, 8), 
          c.identical(e, b), b = [ {
            index: 0,
            entry: "aa"
          }, {
            index: -1,
            entry: void 0
          } ], e = a.strRight([ "aa_aa_bb_bb_cc_cc", "cc_cc_bb_bb_aa_aa" ], [ /a+/, "bb" ], void 0, -15), 
          c.identical(e, b), b = [ {
            index: 0,
            entry: "a"
          }, {
            index: -1,
            entry: void 0
          } ], e = a.strRight([ "aa_aa_bb_bb_cc_cc", "cc_cc_bb_bb_aa_aa" ], [ /a+/, "bb" ], void 0, -16), 
          c.identical(e, b), b = [ {
            index: 3,
            entry: "aa"
          }, {
            index: -1,
            entry: void 0
          } ], e = a.strRight([ "aa_aa_bb_bb_cc_cc", "cc_cc_bb_bb_aa_aa" ], [ /a+/, "bb" ], void 0, 7), 
          c.identical(e, b), b = [ {
            index: 6,
            entry: "bb"
          }, {
            index: 6,
            entry: "bb"
          } ], e = a.strRight([ "aa_aa_bb_bb_cc_cc", "cc_cc_bb_bb_aa_aa" ], [ /a+/, "bb" ], void 0, 8), 
          c.identical(e, b), b = [ {
            index: 3,
            entry: "aa"
          }, {
            index: -1,
            entry: void 0
          } ], e = a.strRight([ "aa_aa_bb_bb_cc_cc", "cc_cc_bb_bb_aa_aa" ], [ /a+/, "bb" ], 0, 7), 
          c.identical(e, b), b = [ {
            index: 6,
            entry: "bb"
          }, {
            index: 6,
            entry: "bb"
          } ], e = a.strRight([ "aa_aa_bb_bb_cc_cc", "cc_cc_bb_bb_aa_aa" ], [ /a+/, "bb" ], 0, 8), 
          c.identical(e, b), 
          /* */
          c.case = "no entry", b = {
            index: -1,
            entry: void 0
          }, e = a.strRight("aa_aa_bb_bb_cc_cc", []), c.identical(e, b), c.case = "not found", 
          b = {
            index: -1,
            entry: void 0
          }, e = a.strRight("aa_aa_bb_bb_cc_cc", /d+/), c.identical(e, b), c.case = "empty entry", 
          b = {
            index: 17,
            entry: ""
          }, e = a.strRight("aa_aa_bb_bb_cc_cc", new RegExp("")), c.identical(e, b), c.case = "empty entry, empty src", 
          b = {
            index: 0,
            entry: ""
          }, e = a.strRight("", new RegExp("")), c.identical(e, b), c.case = "empty src", 
          b = {
            index: -1,
            entry: void 0
          }, e = a.strRight("", /a+/), c.identical(e, b), 
          /* - */
          c.close("regexp"), c.open("throwing"), c.shouldThrowErrorSync(() => a.strRight("abc", "b", -100)), 
          c.shouldThrowErrorSync(() => a.strRight("abc", "b", 100)), c.shouldThrowErrorSync(() => a.strRight("abc", "b", 0, -100)), 
          c.shouldThrowErrorSync(() => a.strRight("abc", "b", 0, 100)), c.shouldThrowErrorSync(() => a.strRight(/a/, /a+/)), 
          c.shouldThrowErrorSync(() => a.strRight("abc", /a+/, "")), c.shouldThrowErrorSync(() => a.strRight("abc")), 
          c.shouldThrowErrorSync(() => a.strRight("123", 1)), c.shouldThrowErrorSync(() => a.strRight("123", [ 1 ])), 
          c.shouldThrowErrorSync(() => a.strRight()), c.close("throwing");
        }
        //
        ,
        strEquivalent: function strEquivalent(c) {
          /* - */
          c.open("true"), c.case = "strings";
          var b = a.strEquivalent("abc", "abc");
          c.identical(b, !0), c.case = "regexp and string", b = a.strEquivalent(/\w+/, "abc"), 
          c.identical(b, !0), c.case = "string and regexp", b = a.strEquivalent("abc", /\w+/), 
          c.identical(b, !0), c.case = "regexp and regexp", b = a.strEquivalent(/\w+/, /\w+/), 
          c.identical(b, !0), c.close("true"), 
          /* - */
          c.open("false"), c.case = "strings", b = a.strEquivalent("abd", "abc"), c.identical(b, !1), 
          c.case = "regexp and string", b = a.strEquivalent(/\s+/, "abc"), c.identical(b, !1), 
          c.case = "regexp and string", b = a.strEquivalent(/\w/, "abc"), c.identical(b, !1), 
          c.case = "string and regexp", b = a.strEquivalent("abc", /\s+/), c.identical(b, !1), 
          c.case = "string and regexp", b = a.strEquivalent("abc", /\w/), c.identical(b, !1), 
          c.case = "regexp and regexp", b = a.strEquivalent(/\w*/, /\w+/), c.identical(b, !1), 
          c.case = "regexp and regexp", b = a.strEquivalent(/\w+/g, /\w+/), c.identical(b, !1), 
          c.case = "regexp and regexp", b = a.strEquivalent(/\w+/g, /\w+/gi), c.identical(b, !1), 
          c.close("false");
        }
        //
        ,
        strsEquivalent: function strsEquivalent(c) {
          /* - */
          c.open("scalar, true"), c.case = "strings";
          var b = a.strsEquivalent("abc", "abc");
          c.identical(b, !0), c.case = "regexp and string", b = a.strsEquivalent(/\w+/, "abc"), 
          c.identical(b, !0), c.case = "string and regexp", b = a.strsEquivalent("abc", /\w+/), 
          c.identical(b, !0), c.case = "regexp and regexp", b = a.strsEquivalent(/\w+/, /\w+/), 
          c.identical(b, !0), c.close("scalar, true"), 
          /* - */
          c.open("scalar, false"), c.case = "strings", b = a.strsEquivalent("abd", "abc"), 
          c.identical(b, !1), c.case = "regexp and string", b = a.strsEquivalent(/\s+/, "abc"), 
          c.identical(b, !1), c.case = "regexp and string", b = a.strsEquivalent(/\w/, "abc"), 
          c.identical(b, !1), c.case = "string and regexp", b = a.strsEquivalent("abc", /\s+/), 
          c.identical(b, !1), c.case = "string and regexp", b = a.strsEquivalent("abc", /\w/), 
          c.identical(b, !1), c.case = "regexp and regexp", b = a.strsEquivalent(/\w*/, /\w+/), 
          c.identical(b, !1), c.case = "regexp and regexp", b = a.strsEquivalent(/\w+/g, /\w+/), 
          c.identical(b, !1), c.case = "regexp and regexp", b = a.strsEquivalent(/\w+/g, /\w+/gi), 
          c.identical(b, !1), c.close("scalar, false"), 
          /* - */
          c.open("vector, true"), c.case = "vector, vector";
          var e = [ "abc", /\w+/, "abc", /\w+/ ], t = [ "abc", "abc", /\w+/, /\w+/ ];
          b = a.strsEquivalent(e, t), c.identical(b, [ !0, !0, !0, !0 ]), c.case = "vector, scalar", 
          e = [ "abc", /\w+/, "abc", /\w+/ ], t = "abc", b = a.strsEquivalent(e, t), c.identical(b, [ !0, !0, !0, !0 ]), 
          c.case = "scalar, vector", e = "abc", t = [ "abc", /\w+/, "abc", /\w+/ ], b = a.strsEquivalent(e, t), 
          c.identical(b, [ !0, !0, !0, !0 ]), c.close("vector, true"), 
          /* - */
          c.open("vector, false"), c.case = "vector, vector", e = [ "abd", /\s+/, /\w/, "abc", "abc", /\w*/, /\w+/g, /\w+/g ], 
          t = [ "abc", "abc", "abc", /\s+/, /\w/, /\w+/, /\w+/, /\w+/gi ], b = a.strsEquivalent(e, t), 
          c.identical(b, [ !1, !1, !1, !1, !1, !1, !1, !1 ]), c.case = "vector, scalar", e = [ "abd", /\s+/, /\w/, "abc", "abc", /\w*/, /\w+/g, /\w+/gi ], 
          t = "abc", b = a.strsEquivalent(e, t), c.identical(b, [ !1, !1, !1, !0, !0, !0, !0, !0 ]), 
          c.case = "scalar, vector", e = "abc", t = [ "abd", /\s+/, /\w/, "abc", "abc", /\w*/, /\w+/g, /\w+/gi ], 
          b = a.strsEquivalent(e, t), c.identical(b, [ !1, !1, !1, !0, !0, !0, !0, !0 ]), 
          c.close("vector, false");
        }
        //
        ,
        strsEquivalentAll: function strsEquivalentAll(c) {
          /* - */
          c.open("scalar, true"), c.case = "strings";
          var b = a.strsEquivalentAll("abc", "abc");
          c.identical(b, !0), c.case = "regexp and string", b = a.strsEquivalentAll(/\w+/, "abc"), 
          c.identical(b, !0), c.case = "string and regexp", b = a.strsEquivalentAll("abc", /\w+/), 
          c.identical(b, !0), c.case = "regexp and regexp", b = a.strsEquivalentAll(/\w+/, /\w+/), 
          c.identical(b, !0), c.close("scalar, true"), 
          /* - */
          c.open("scalar, false"), c.case = "strings", b = a.strsEquivalentAll("abd", "abc"), 
          c.identical(b, !1), c.case = "regexp and string", b = a.strsEquivalentAll(/\s+/, "abc"), 
          c.identical(b, !1), c.case = "regexp and string", b = a.strsEquivalentAll(/\w/, "abc"), 
          c.identical(b, !1), c.case = "string and regexp", b = a.strsEquivalentAll("abc", /\s+/), 
          c.identical(b, !1), c.case = "string and regexp", b = a.strsEquivalentAll("abc", /\w/), 
          c.identical(b, !1), c.case = "regexp and regexp", b = a.strsEquivalentAll(/\w*/, /\w+/), 
          c.identical(b, !1), c.case = "regexp and regexp", b = a.strsEquivalentAll(/\w+/g, /\w+/), 
          c.identical(b, !1), c.case = "regexp and regexp", b = a.strsEquivalentAll(/\w+/g, /\w+/gi), 
          c.identical(b, !1), c.close("scalar, false"), 
          /* - */
          c.open("vectors"), c.case = "vector, vector";
          var e = [ "abc", /\w+/, "abc", /\w+/ ], t = [ "abc", "abc", /\w+/, /\w+/ ];
          b = a.strsEquivalentAll(e, t), c.identical(b, !0), c.case = "vector, scalar", e = [ "abc", /\w+/, "abc", /\w+/ ], 
          t = "abc", b = a.strsEquivalentAll(e, t), c.identical(b, !0), c.case = "scalar, vector", 
          e = "abc", t = [ "abc", /\w+/, "abc", /\w+/ ], b = a.strsEquivalentAll(e, t), c.identical(b, !0), 
          c.case = "vector, vector", e = [ "abd", /\s+/, /\w/, "abc", "abc", /\w*/, /\w+/g, /\w+/g ], 
          t = [ "abc", "abc", "abc", /\s+/, /\w/, /\w+/, /\w+/, /\w+/gi ], b = a.strsEquivalentAll(e, t), 
          c.identical(b, !1), c.case = "vector, vector", e = [ "abd", /\s+/, /\w/, "abc", "abc", /\w*/, /\w+/g, /\w+/g ], 
          t = [ "abc", "abc", "abc", /\s+/, /\w/, /\w+/, /\w+/, /\w+/g ], b = a.strsEquivalentAll(e, t), 
          c.identical(b, !1), c.case = "vector, scalar", e = [ "abd", /\s+/, /\w/, "abc", "abc", /\w*/, /\w+/g, /\w+/gi ], 
          t = "abc", b = a.strsEquivalentAll(e, t), c.identical(b, !1), c.case = "vector, scalar", 
          e = [ "abd", /\s+/ ], t = "abc", b = a.strsEquivalentAll(e, t), c.identical(b, !1), 
          c.case = "vector, scalar", e = [ /\w+/g, /\w+/gi ], t = "abc", b = a.strsEquivalentAll(e, t), 
          c.identical(b, !0), c.case = "scalar, vector", e = "abc", t = [ "abd", /\s+/, /\w/, "abc", "abc", /\w*/, /\w+/g, /\w+/gi ], 
          b = a.strsEquivalentAll(e, t), c.identical(b, !1), c.case = "scalar, vector", e = "abc", 
          t = [ "abd", /\s+/ ], b = a.strsEquivalentAll(e, t), c.identical(b, !1), c.case = "scalar, vector", 
          e = "abc", t = [ /\w+/g, /\w+/gi ], b = a.strsEquivalentAll(e, t), c.identical(b, !0), 
          c.close("vectors");
        }
        //
        ,
        strsEquivalentAny: function strsEquivalentAny(c) {
          /* - */
          c.open("scalar, true"), c.case = "strings";
          var b = a.strsEquivalentAny("abc", "abc");
          c.identical(b, !0), c.case = "regexp and string", b = a.strsEquivalentAny(/\w+/, "abc"), 
          c.identical(b, !0), c.case = "string and regexp", b = a.strsEquivalentAny("abc", /\w+/), 
          c.identical(b, !0), c.case = "regexp and regexp", b = a.strsEquivalentAny(/\w+/, /\w+/), 
          c.identical(b, !0), c.close("scalar, true"), 
          /* - */
          c.open("scalar, false"), c.case = "strings", b = a.strsEquivalentAny("abd", "abc"), 
          c.identical(b, !1), c.case = "regexp and string", b = a.strsEquivalentAny(/\s+/, "abc"), 
          c.identical(b, !1), c.case = "regexp and string", b = a.strsEquivalentAny(/\w/, "abc"), 
          c.identical(b, !1), c.case = "string and regexp", b = a.strsEquivalentAny("abc", /\s+/), 
          c.identical(b, !1), c.case = "string and regexp", b = a.strsEquivalentAny("abc", /\w/), 
          c.identical(b, !1), c.case = "regexp and regexp", b = a.strsEquivalentAny(/\w*/, /\w+/), 
          c.identical(b, !1), c.case = "regexp and regexp", b = a.strsEquivalentAny(/\w+/g, /\w+/), 
          c.identical(b, !1), c.case = "regexp and regexp", b = a.strsEquivalentAny(/\w+/g, /\w+/gi), 
          c.identical(b, !1), c.close("scalar, false"), 
          /* - */
          c.open("vectors"), c.case = "vector, vector";
          var e = [ "abc", /\w+/, "abc", /\w+/ ], t = [ "abc", "abc", /\w+/, /\w+/ ];
          b = a.strsEquivalentAny(e, t), c.identical(b, !0), c.case = "vector, scalar", e = [ "abc", /\w+/, "abc", /\w+/ ], 
          t = "abc", b = a.strsEquivalentAny(e, t), c.identical(b, !0), c.case = "scalar, vector", 
          e = "abc", t = [ "abc", /\w+/, "abc", /\w+/ ], b = a.strsEquivalentAny(e, t), c.identical(b, !0), 
          c.case = "vector, vector", e = [ "abd", /\s+/, /\w/, "abc", "abc", /\w*/, /\w+/g, /\w+/g ], 
          t = [ "abc", "abc", "abc", /\s+/, /\w/, /\w+/, /\w+/, /\w+/gi ], b = a.strsEquivalentAny(e, t), 
          c.identical(b, !1), c.case = "vector, vector", e = [ "abd", /\s+/, /\w/, "abc", "abc", /\w*/, /\w+/g, /\w+/g ], 
          t = [ "abc", "abc", "abc", /\s+/, /\w/, /\w+/, /\w+/, /\w+/g ], b = a.strsEquivalentAny(e, t), 
          c.identical(b, !0), c.case = "vector, scalar", e = [ "abd", /\s+/, /\w/, "abc", "abc", /\w*/, /\w+/g, /\w+/gi ], 
          t = "abc", b = a.strsEquivalentAny(e, t), c.identical(b, !0), c.case = "vector, scalar", 
          e = [ "abd", /\s+/ ], t = "abc", b = a.strsEquivalentAny(e, t), c.identical(b, !1), 
          c.case = "vector, scalar", e = [ /\w+/g, /\w+/gi ], t = "abc", b = a.strsEquivalentAny(e, t), 
          c.identical(b, !0), c.case = "scalar, vector", e = "abc", t = [ "abd", /\s+/, /\w/, "abc", "abc", /\w*/, /\w+/g, /\w+/gi ], 
          b = a.strsEquivalentAny(e, t), c.identical(b, !0), c.case = "scalar, vector", e = "abc", 
          t = [ "abd", /\s+/ ], b = a.strsEquivalentAny(e, t), c.identical(b, !1), c.case = "scalar, vector", 
          e = "abc", t = [ /\w+/g, /\w+/gi ], b = a.strsEquivalentAny(e, t), c.identical(b, !0), 
          c.close("vectors");
        }
        //
        ,
        strsEquivalentNone: function strsEquivalentNone(c) {
          /* - */
          c.open("scalar, not true"), c.case = "strings";
          var b = a.strsEquivalentNone("abc", "abc");
          c.identical(b, !1), c.case = "regexp and string", b = a.strsEquivalentNone(/\w+/, "abc"), 
          c.identical(b, !1), c.case = "string and regexp", b = a.strsEquivalentNone("abc", /\w+/), 
          c.identical(b, !1), c.case = "regexp and regexp", b = a.strsEquivalentNone(/\w+/, /\w+/), 
          c.identical(b, !1), c.close("scalar, not true"), 
          /* - */
          c.open("scalar, not false"), c.case = "strings", b = a.strsEquivalentNone("abd", "abc"), 
          c.identical(b, !0), c.case = "regexp and string", b = a.strsEquivalentNone(/\s+/, "abc"), 
          c.identical(b, !0), c.case = "regexp and string", b = a.strsEquivalentNone(/\w/, "abc"), 
          c.identical(b, !0), c.case = "string and regexp", b = a.strsEquivalentNone("abc", /\s+/), 
          c.identical(b, !0), c.case = "string and regexp", b = a.strsEquivalentNone("abc", /\w/), 
          c.identical(b, !0), c.case = "regexp and regexp", b = a.strsEquivalentNone(/\w*/, /\w+/), 
          c.identical(b, !0), c.case = "regexp and regexp", b = a.strsEquivalentNone(/\w+/g, /\w+/), 
          c.identical(b, !0), c.case = "regexp and regexp", b = a.strsEquivalentNone(/\w+/g, /\w+/gi), 
          c.identical(b, !0), c.close("scalar, not false"), 
          /* - */
          c.open("vectors"), c.case = "vector, vector";
          var e = [ "abc", /\w+/, "abc", /\w+/ ], t = [ "abc", "abc", /\w+/, /\w+/ ];
          b = a.strsEquivalentNone(e, t), c.identical(b, !1), c.case = "vector, scalar", e = [ "abc", /\w+/, "abc", /\w+/ ], 
          t = "abc", b = a.strsEquivalentNone(e, t), c.identical(b, !1), c.case = "scalar, vector", 
          e = "abc", t = [ "abc", /\w+/, "abc", /\w+/ ], b = a.strsEquivalentNone(e, t), c.identical(b, !1), 
          c.case = "vector, vector", e = [ "abd", /\s+/, /\w/, "abc", "abc", /\w*/, /\w+/g, /\w+/g ], 
          t = [ "abc", "abc", "abc", /\s+/, /\w/, /\w+/, /\w+/, /\w+/gi ], b = a.strsEquivalentNone(e, t), 
          c.identical(b, !0), c.case = "vector, vector", e = [ "abd", /\s+/, /\w/, "abc", "abc", /\w*/, /\w+/g, /\w+/g ], 
          t = [ "abc", "abc", "abc", /\s+/, /\w/, /\w+/, /\w+/, /\w+/g ], b = a.strsEquivalentNone(e, t), 
          c.identical(b, !1), c.case = "vector, scalar", e = [ "abd", /\s+/, /\w/, "abc", "abc", /\w*/, /\w+/g, /\w+/gi ], 
          t = "abc", b = a.strsEquivalentNone(e, t), c.identical(b, !1), c.case = "vector, scalar", 
          e = [ "abd", /\s+/ ], t = "abc", b = a.strsEquivalentNone(e, t), c.identical(b, !0), 
          c.case = "vector, scalar", e = [ /\w+/g, /\w+/gi ], t = "abc", b = a.strsEquivalentNone(e, t), 
          c.identical(b, !1), c.case = "scalar, vector", e = "abc", t = [ "abd", /\s+/, /\w/, "abc", "abc", /\w*/, /\w+/g, /\w+/gi ], 
          b = a.strsEquivalentNone(e, t), c.identical(b, !1), c.case = "scalar, vector", e = "abc", 
          t = [ "abd", /\s+/ ], b = a.strsEquivalentNone(e, t), c.identical(b, !0), c.case = "scalar, vector", 
          e = "abc", t = [ /\w+/g, /\w+/gi ], b = a.strsEquivalentNone(e, t), c.identical(b, !1), 
          c.close("vectors");
        }
        //
        ,
        strBeginOf: 
        //
        function strBeginOf(c) {
          var b, e;
          /**/          c.case = "strBeginOf", 
          /**/
          b = a.strBeginOf("abc", ""), e = "", c.identical(b, e)
          /**/ , b = a.strBeginOf("abc", "c"), e = !1, c.identical(b, e)
          /**/ , b = a.strBeginOf("abc", "bc"), e = !1, c.identical(b, e)
          /**/ , b = a.strBeginOf("abc", " c"), e = !1, c.identical(b, e)
          /* end.length > src.length */ , b = a.strBeginOf("abc", "abcd"), e = !1, c.identical(b, e)
          /* same length, not equal*/ , b = a.strBeginOf("abc", "cba"), e = !1, c.identical(b, e)
          /* equal */ , b = a.strBeginOf("abc", "abc"), e = "abc", c.identical(b, e)
          /* array */ , b = a.strBeginOf("abc", []), e = !1, c.identical(b, e)
          /**/ , b = a.strBeginOf("abc", [ "" ]), e = "", c.identical(b, e)
          /**/ , b = a.strBeginOf("abccc", [ "c", "ccc" ]), e = !1, c.identical(b, e)
          /**/ , b = a.strBeginOf("abc", [ "a", "ab", "abc" ]), e = "a", c.identical(b, e)
          /**/ , b = a.strBeginOf("abc", [ "x", "y", "c" ]), e = !1, c.identical(b, e)
          /**/ , b = a.strBeginOf("abc", [ "x", "y", "z" ]), e = !1, c.identical(b, e), c.shouldThrowError(() => a.strBeginOf(1, "")), 
          c.shouldThrowError(() => a.strBeginOf("abc", 1)), c.shouldThrowError(() => a.strBeginOf()), 
          c.shouldThrowError(() => a.strBeginOf(void 0, void 0)), c.shouldThrowError(() => a.strBeginOf(null, null));
        }
        //
        ,
        strEndOf: function strEndOf(c) {
          var b, e;
          //
                    c.case = "strEndOf", 
          /**/
          b = a.strEndOf("abc", ""), e = "", c.identical(b, e)
          /**/ , b = a.strEndOf("abc", "a"), e = !1, c.identical(b, e)
          /**/ , b = a.strEndOf("abc", "ab"), e = !1, c.identical(b, e)
          /**/ , b = a.strEndOf("abc", " a"), e = !1, c.identical(b, e)
          /* end.length > src.length */ , b = a.strEndOf("abc", "abcd"), e = !1, c.identical(b, e)
          /* same length */ , b = a.strEndOf("abc", "cba"), e = !1, c.identical(b, e)
          /* equal */ , b = a.strEndOf("abc", "abc"), e = "abc", c.identical(b, e)
          /* array */ , b = a.strEndOf("abc", []), e = !1, c.identical(b, e)
          /**/ , b = a.strEndOf("abc", [ "" ]), e = "", c.identical(b, e)
          /**/ , b = a.strEndOf("abccc", [ "a", "ab" ]), e = !1, c.identical(b, e)
          /**/ , b = a.strEndOf("abc", [ "ab", "abc" ]), e = "abc", c.identical(b, e)
          /**/ , b = a.strEndOf("abc", [ "x", "y", "a" ]), e = !1, c.identical(b, e)
          /**/ , b = a.strEndOf("abc", [ "x", "y", "z" ]), e = !1, c.identical(b, e), c.shouldThrowError(() => a.strEndOf(1, "")), 
          c.shouldThrowError(() => a.strEndOf("abc", 1)), c.shouldThrowError(() => a.strEndOf()), 
          c.shouldThrowError(() => a.strEndOf(void 0, void 0)), c.shouldThrowError(() => a.strEndOf(null, null));
        }
        //
        ,
        strBegins: function strBegins(c) {
          var b, e;
          //
                    c.case = "strBegins", 
          /**/
          b = a.strBegins("", ""), e = !0, c.identical(b, e), 
          /**/
          b = a.strBegins("a", ""), e = !0, c.identical(b, e), 
          /**/
          b = a.strBegins("a", "a"), e = !0, c.identical(b, e), 
          /**/
          b = a.strBegins("a", "b"), e = !1, c.identical(b, e), 
          /**/
          b = a.strBegins("abc", "ab"), e = !0, c.identical(b, e), 
          /**/
          b = a.strBegins("abc", "abc"), e = !0, c.identical(b, e), 
          /**/
          b = a.strBegins("abc", " a"), e = !1, c.identical(b, e), 
          /**/
          b = a.strBegins("abc", [ "x", "y", "ab" ]), e = !0, c.identical(b, e), 
          /**/
          b = a.strBegins("abc", [ "" ]), e = !0, c.identical(b, e), 
          /**/
          b = a.strBegins("abc", []), e = !1, c.identical(b, e), 
          /**/
          b = a.strBegins("abc", [ "1", "b", "a" ]), e = !0, c.identical(b, e), c.shouldThrowError(() => a.strBegins(1, "")), 
          c.shouldThrowError(() => a.strBegins("a", 1)), c.shouldThrowError(() => a.strBegins("abc", [ 1, "b", "a" ]));
        }
        //
        ,
        strEnds: function strEnds(c) {
          var b, e;
          //
                    c.case = "strEnds", 
          /**/
          b = a.strEnds("", ""), e = !0, c.identical(b, e), 
          /**/
          b = a.strEnds("a", ""), e = !0, c.identical(b, e), 
          /**/
          b = a.strEnds("a", "a"), e = !0, c.identical(b, e), 
          /**/
          b = a.strEnds("a", "b"), e = !1, c.identical(b, e), 
          /**/
          b = a.strEnds("abc", "bc"), e = !0, c.identical(b, e), 
          /**/
          b = a.strEnds("abc", "abc"), e = !0, c.identical(b, e), 
          /**/
          b = a.strEnds("abc", [ "x", "y", "bc" ]), e = !0, c.identical(b, e), 
          /**/
          b = a.strEnds("abc", [ "" ]), e = !0, c.identical(b, e), 
          /**/
          b = a.strEnds("abc", []), e = !1, c.identical(b, e), 
          /**/
          b = a.strEnds("abc", [ "1", "b", "c" ]), e = !0, c.identical(b, e), c.shouldThrowError(() => a.strEnds(1, "")), 
          c.shouldThrowError(() => a.strEnds("a", 1));
        }
        //
        ,
        // converter
        strShort: function strShort(c) {
          c.case = "undefined";
          var b = void 0, e = "undefined", t = a.strShort(b);
          c.identical(t, e), c.case = "null", b = null, e = "null", t = a.strShort(b), c.identical(t, e), 
          c.case = "number", b = 13, e = "13", t = a.strShort(b), c.identical(t, e), c.case = "boolean", 
          b = !1, e = "false", t = a.strShort(b), c.identical(t, e), c.case = "string", b = "abc", 
          e = "abc", t = a.strShort(b), c.identical(t, e);
        }
        //
        ,
        strPrimitive: function strPrimitive(c) {
          c.case = "undefined";
          var b = void 0, e = void 0, t = a.strPrimitive(b);
          c.identical(t, e), c.case = "null", b = null, e = void 0, t = a.strPrimitive(b), 
          c.identical(t, e), c.case = "number", b = 13, e = "13", t = a.strPrimitive(b), c.identical(t, e), 
          c.case = "boolean", b = !1, e = "false", t = a.strPrimitive(b), c.identical(t, e), 
          c.case = "string", b = "abc", e = "abc", t = a.strPrimitive(b), c.identical(t, e);
        }
        //
        ,
        strIsolateLeftOrNone: function strIsolateLeftOrNone(c) {
          var b, e;
          /* - */          c.case = "single delimeter", 
          /**/
          b = a.strIsolateLeftOrNone("", ""), e = [ "", "", "" ], c.identical(b, e), 
          /**/
          b = a.strIsolateLeftOrNone("", [ "" ]), e = [ "", "", "" ], c.identical(b, e), 
          /**/
          b = a.strIsolateLeftOrNone("abc", [ "" ]), e = [ "", "", "abc" ], c.identical(b, e), 
          /* empty delimeters array */
          b = a.strIsolateLeftOrNone("abca", []), e = [ "", void 0, "abca" ], c.identical(b, e), 
          /**/
          b = a.strIsolateLeftOrNone("", "a"), e = [ "", void 0, "" ], c.identical(b, e), 
          /**/
          b = a.strIsolateLeftOrNone("", [ "a" ]), e = [ "", void 0, "" ], c.identical(b, e), 
          /**/
          b = a.strIsolateLeftOrNone("abca", "a"), e = [ "", "a", "bca" ], c.identical(b, e), 
          /**/
          b = a.strIsolateLeftOrNone("abca", [ "a" ]), e = [ "", "a", "bca" ], c.identical(b, e), 
          /* number 1 by default, no cut, just returns src */
          b = a.strIsolateLeftOrNone("abca", "d"), e = [ "", void 0, "abca" ], c.identical(b, e), 
          /* number 1 by default, no cut, just returns src */
          b = a.strIsolateLeftOrNone("abca", [ "d" ]), e = [ "", void 0, "abca" ], c.identical(b, e), 
          /* - */
          c.case = "single delimeter, number", b = a.strIsolateLeftOrNone("abca", "", 2), 
          e = [ "a", "", "bca" ], c.identical(b, e), 
          /* cut on second occurrence */
          b = a.strIsolateLeftOrNone("abca", "a", 2), e = [ "abc", "a", "" ], c.identical(b, e), 
          /* cut on second occurrence */
          b = a.strIsolateLeftOrNone("abca", [ "a" ], 2), e = [ "abc", "a", "" ], c.identical(b, e), 
          /* cut on third occurrence */
          b = a.strIsolateLeftOrNone("abcaca", "a", 3), e = [ "abcac", "a", "" ], c.identical(b, e), 
          /* cut on third occurrence */
          b = a.strIsolateLeftOrNone("abcaca", [ "a" ], 3), e = [ "abcac", "a", "" ], c.identical(b, e), 
          /**/
          b = a.strIsolateLeftOrNone("abcaca", "a", 4), e = [ "abcaca", void 0, "" ], c.identical(b, e), 
          /**/
          b = a.strIsolateLeftOrNone("abcaca", [ "a" ], 4), e = [ "abcaca", void 0, "" ], 
          c.identical(b, e), 
          /* - */
          c.case = "several delimeters", 
          /**/
          b = a.strIsolateLeftOrNone("abca", [ "a", "c" ]), e = [ "", "a", "bca" ], c.identical(b, e), 
          /**/
          b = a.strIsolateLeftOrNone("abca", [ "c", "a" ]), e = [ "", "a", "bca" ], c.identical(b, e), 
          /**/
          b = a.strIsolateLeftOrNone("abca", [ "x", "y" ]), e = [ "", void 0, "abca" ], c.identical(b, e), 
          /**/
          b = a.strIsolateLeftOrNone("abca", [ "x", "y", "a" ]), e = [ "", "a", "bca" ], c.identical(b, e), 
          /* - */
          c.case = "several delimeters, number", 
          /* empty delimeters array */
          b = a.strIsolateLeftOrNone("abca", [], 2), e = [ "", void 0, "abca" ], c.identical(b, e), 
          /**/
          b = a.strIsolateLeftOrNone("abca", [ "a", "c" ], 2), e = [ "ab", "c", "a" ], c.identical(b, e), 
          /**/
          b = a.strIsolateLeftOrNone("abcbc", [ "c", "a" ], 2), e = [ "ab", "c", "bc" ], c.identical(b, e), 
          /**/
          b = a.strIsolateLeftOrNone("cbcbc", [ "c", "a" ], 3), e = [ "cbcb", "c", "" ], c.identical(b, e), 
          /**/
          b = a.strIsolateLeftOrNone("cbcbc", [ "c", "a" ], 4), e = [ "cbcbc", void 0, "" ], 
          c.identical(b, e), 
          /**/
          b = a.strIsolateLeftOrNone("jj", [ "c", "a" ], 4), e = [ "", void 0, "jj" ], c.identical(b, e), 
          /* - */
          c.case = "one of delimeters contains other", 
          /* - */
          b = a.strIsolateLeftOrNone("ab", [ "a", "ab" ]), e = [ "", "a", "b" ], c.identical(b, e), 
          /**/
          b = a.strIsolateLeftOrNone("ab", [ "ab", "a" ]), e = [ "", "ab", "" ], c.identical(b, e), 
          /**/
          b = a.strIsolateLeftOrNone("ab", [ "b", "ab" ]), e = [ "", "ab", "" ], c.identical(b, e), 
          /**/
          b = a.strIsolateLeftOrNone("ab", [ "ab", "b" ]), e = [ "", "ab", "" ], c.identical(b, e), 
          /**/
          b = a.strIsolateLeftOrNone("a b c", " ", 1), e = [ "a", " ", "b c" ], c.identical(b, e), 
          /* - */
          c.case = "single delimeter"
          /* cut on first appear */ , b = a.strIsolateLeftOrNone("abca", "a", 1), e = [ "", "a", "bca" ], 
          c.identical(b, e), 
          /* no occurrences */
          b = a.strIsolateLeftOrNone("jj", "a", 1), e = [ "", void 0, "jj" ], c.identical(b, e), 
          /* cut on second appear */
          b = a.strIsolateLeftOrNone("abca", "a", 2), e = [ "abc", "a", "" ], c.identical(b, e), 
          /* 5 attempts */
          b = a.strIsolateLeftOrNone("abca", "a", 5), e = [ "abca", void 0, "" ], c.identical(b, e), 
          /* - */
          c.case = "multiple delimeter"
          /**/ , b = a.strIsolateLeftOrNone("abca", [ "a", "c" ], 1), e = [ "", "a", "bca" ], 
          c.identical(b, e), 
          /**/
          b = a.strIsolateLeftOrNone("abca", [ "a", "c" ], 2), e = [ "ab", "c", "a" ], c.identical(b, e), 
          /**/
          b = a.strIsolateLeftOrNone("abca", [ "a", "c" ], 3), e = [ "abc", "a", "" ], c.identical(b, e), 
          /* no occurrences */
          b = a.strIsolateLeftOrNone("jj", [ "a", "c" ], 1), e = [ "", void 0, "jj" ], c.identical(b, e), 
          /* no occurrences */
          b = a.strIsolateLeftOrNone("jj", [ "a" ], 1), e = [ "", void 0, "jj" ], c.identical(b, e), 
          /* - */
          c.case = "options as map", 
          /**/
          b = a.strIsolateLeftOrNone({
            src: "abca",
            delimeter: "a",
            times: 1
          }), e = [ "", "a", "bca" ], c.identical(b, e), 
          /* number option is missing */
          b = a.strIsolateLeftOrNone({
            src: "abca",
            delimeter: "a"
          }), e = [ "", "a", "bca" ], c.identical(b, e), 
          /* - */
          c.case = "number option check", 
          /* number is zero */
          b = a.strIsolateLeftOrNone("abca", "a", 0), e = [ "", void 0, "abca" ], c.identical(b, e), 
          /* number is negative */
          b = a.strIsolateLeftOrNone("abca", "a", -1), e = [ "", void 0, "abca" ], c.identical(b, e), 
          /* - */
          c.open("abaaca with strings"), b = a.strIsolateLeftOrNone("abaaca", "a", 0), e = [ "", void 0, "abaaca" ], 
          c.identical(b, e), b = a.strIsolateLeftOrNone("abaaca", "a", 1), e = [ "", "a", "baaca" ], 
          c.identical(b, e), b = a.strIsolateLeftOrNone("abaaca", "a", 2), e = [ "ab", "a", "aca" ], 
          c.identical(b, e), b = a.strIsolateLeftOrNone("abaaca", "a", 3), e = [ "aba", "a", "ca" ], 
          c.identical(b, e), b = a.strIsolateLeftOrNone("abaaca", "a", 4), e = [ "abaac", "a", "" ], 
          c.identical(b, e), b = a.strIsolateLeftOrNone("abaaca", "a", 5), e = [ "abaaca", void 0, "" ], 
          c.identical(b, e), c.close("abaaca with strings"), c.open("abababa with strings"), 
          b = a.strIsolateLeftOrNone("abababa", "aba", 1), e = [ "", "aba", "baba" ], c.identical(b, e), 
          b = a.strIsolateLeftOrNone("abababa", "aba", 2), e = [ "ab", "aba", "ba" ], c.identical(b, e), 
          b = a.strIsolateLeftOrNone("abababa", "aba", 3), e = [ "abab", "aba", "" ], c.identical(b, e), 
          b = a.strIsolateLeftOrNone("abababa", "aba", 4), e = [ "abababa", void 0, "" ], 
          c.identical(b, e), c.close("abababa with strings")
          /* - */ , c.open("abaaca with regexp"), b = a.strIsolateLeftOrNone("abaaca", /a+/, 0), 
          e = [ "", void 0, "abaaca" ], c.identical(b, e), b = a.strIsolateLeftOrNone("abaaca", /a+/, 1), 
          e = [ "", "a", "baaca" ], c.identical(b, e), b = a.strIsolateLeftOrNone("abaaca", /a+/, 2), 
          e = [ "ab", "aa", "ca" ], c.identical(b, e), b = a.strIsolateLeftOrNone("abaaca", /a+/, 3), 
          e = [ "aba", "a", "ca" ], c.identical(b, e), b = a.strIsolateLeftOrNone("abaaca", /a+/, 4), 
          e = [ "abaac", "a", "" ], c.identical(b, e), b = a.strIsolateLeftOrNone("abaaca", /a+/, 5), 
          e = [ "abaaca", void 0, "" ], c.identical(b, e), c.close("abaaca with regexp"), 
          c.open("abababa with regexp"), b = a.strIsolateLeftOrNone("abababa", /aba/, 1), 
          e = [ "", "aba", "baba" ], c.identical(b, e), b = a.strIsolateLeftOrNone("abababa", /aba/, 2), 
          e = [ "ab", "aba", "ba" ], c.identical(b, e), b = a.strIsolateLeftOrNone("abababa", /aba/, 3), 
          e = [ "abab", "aba", "" ], c.identical(b, e), b = a.strIsolateLeftOrNone("abababa", /aba/, 4), 
          e = [ "abababa", void 0, "" ], c.identical(b, e), c.close("abababa with regexp")
          /* - */ , c.case = "single argument but object expected", c.shouldThrowErrorSync(function() {
            a.strIsolateLeftOrNone("abc");
          }), c.case = "invalid option", c.shouldThrowErrorSync(function() {
            a.strIsolateLeftOrNone({
              src: "abc",
              delimeter: "a",
              x: "a"
            });
          }), c.case = "changing of left option not allowed", c.shouldThrowErrorSync(function() {
            a.strIsolateLeftOrNone({
              src: "abc",
              delimeter: "a",
              left: 0
            });
          });
        }
        //
        ,
        strIsolateLeftOrAll: function strIsolateLeftOrAll(c) {
          var b, e;
          c.case = "cut in most left position", 
          /* nothing */
          b = a.strIsolateLeftOrAll("", "b"), e = [ "", void 0, "" ], c.identical(b, e), 
          /* nothing */
          b = a.strIsolateLeftOrAll("", ""), e = [ "", "", "" ], c.identical(b, e), 
          /**/
          b = a.strIsolateLeftOrAll("appc", "p"), e = [ "a", "p", "pc" ], c.identical(b, e), 
          /**/
          b = a.strIsolateLeftOrAll("appc", "c"), e = [ "app", "c", "" ], c.identical(b, e), 
          /**/
          b = a.strIsolateLeftOrAll("appc", "a"), e = [ "", "a", "ppc" ], c.identical(b, e), 
          /**/
          b = a.strIsolateLeftOrAll("jj", "a"), e = [ "jj", void 0, "" ], c.identical(b, e), 
          /* - */
          c.open("abaaca with strings"), b = a.strIsolateLeftOrAll("abaaca", "a", 0), e = [ "", void 0, "abaaca" ], 
          c.identical(b, e), b = a.strIsolateLeftOrAll("abaaca", "a", 1), e = [ "", "a", "baaca" ], 
          c.identical(b, e), b = a.strIsolateLeftOrAll("abaaca", "a", 2), e = [ "ab", "a", "aca" ], 
          c.identical(b, e), b = a.strIsolateLeftOrAll("abaaca", "a", 3), e = [ "aba", "a", "ca" ], 
          c.identical(b, e), b = a.strIsolateLeftOrAll("abaaca", "a", 4), e = [ "abaac", "a", "" ], 
          c.identical(b, e), b = a.strIsolateLeftOrAll("abaaca", "a", 5), e = [ "abaaca", void 0, "" ], 
          c.identical(b, e), c.close("abaaca with strings"), c.open("abababa with strings"), 
          b = a.strIsolateLeftOrAll("abababa", "aba", 1), e = [ "", "aba", "baba" ], c.identical(b, e), 
          b = a.strIsolateLeftOrAll("abababa", "aba", 2), e = [ "ab", "aba", "ba" ], c.identical(b, e), 
          b = a.strIsolateLeftOrAll("abababa", "aba", 3), e = [ "abab", "aba", "" ], c.identical(b, e), 
          b = a.strIsolateLeftOrAll("abababa", "aba", 4), e = [ "abababa", void 0, "" ], c.identical(b, e), 
          c.close("abababa with strings")
          /* - */ , c.open("abaaca with regexp"), b = a.strIsolateLeftOrAll("abaaca", /a+/, 0), 
          e = [ "", void 0, "abaaca" ], c.identical(b, e), b = a.strIsolateLeftOrAll("abaaca", /a+/, 1), 
          e = [ "", "a", "baaca" ], c.identical(b, e), b = a.strIsolateLeftOrAll("abaaca", /a+/, 2), 
          e = [ "ab", "aa", "ca" ], c.identical(b, e), b = a.strIsolateLeftOrAll("abaaca", /a+/, 3), 
          e = [ "aba", "a", "ca" ], c.identical(b, e), b = a.strIsolateLeftOrAll("abaaca", /a+/, 4), 
          e = [ "abaac", "a", "" ], c.identical(b, e), b = a.strIsolateLeftOrAll("abaaca", /a+/, 5), 
          e = [ "abaaca", void 0, "" ], c.identical(b, e), c.close("abaaca with regexp"), 
          c.open("abababa with regexp"), b = a.strIsolateLeftOrAll("abababa", /aba/, 1), e = [ "", "aba", "baba" ], 
          c.identical(b, e), b = a.strIsolateLeftOrAll("abababa", /aba/, 2), e = [ "ab", "aba", "ba" ], 
          c.identical(b, e), b = a.strIsolateLeftOrAll("abababa", /aba/, 3), e = [ "abab", "aba", "" ], 
          c.identical(b, e), b = a.strIsolateLeftOrAll("abababa", /aba/, 4), e = [ "abababa", void 0, "" ], 
          c.identical(b, e), c.close("abababa with regexp")
          /* - */ , c.case = "delimeter must be a String", c.shouldThrowErrorSync(function() {
            a.strIsolateLeftOrAll("jj", 1);
          }), c.case = "source must be a String", c.shouldThrowErrorSync(function() {
            a.strIsolateLeftOrAll(1, "1");
          });
        }
        //
        ,
        strIsolateRightOrNone: function strIsolateRightOrNone(c) {
          var b, e;
          /* - */          c.case = "single delimeter", 
          /**/
          b = a.strIsolateRightOrNone("", ""), e = [ "", "", "" ], c.identical(b, e), 
          /**/
          b = a.strIsolateRightOrNone("", [ "" ]), e = [ "", "", "" ], c.identical(b, e), 
          b = a.strIsolateRightOrNone("abc", [ "" ]), e = [ "abc", "", "" ], c.identical(b, e), 
          /* empty delimeters array */
          b = a.strIsolateRightOrNone("abca", []), e = [ "abca", void 0, "" ], c.identical(b, e), 
          /**/
          b = a.strIsolateRightOrNone("", "a"), e = [ "", void 0, "" ], c.identical(b, e), 
          /**/
          b = a.strIsolateRightOrNone("", [ "a" ]), e = [ "", void 0, "" ], c.identical(b, e), 
          /**/
          b = a.strIsolateRightOrNone("abca", "a"), e = [ "abc", "a", "" ], c.identical(b, e), 
          /**/
          b = a.strIsolateRightOrNone("abca", [ "a" ]), e = [ "abc", "a", "" ], c.identical(b, e), 
          /* number 1 by default, no cut, just returns src */
          b = a.strIsolateRightOrNone("abca", "d"), e = [ "abca", void 0, "" ], c.identical(b, e), 
          /* number 1 by default, no cut, just returns src */
          b = a.strIsolateRightOrNone("abca", [ "d" ]), e = [ "abca", void 0, "" ], c.identical(b, e), 
          /* - */
          c.case = "single delimeter, number", b = a.strIsolateRightOrNone("abca", "", 2), 
          e = [ "abc", "", "a" ], c.identical(b, e), 
          /* cut on second occurrence */
          b = a.strIsolateRightOrNone("abca", "a", 2), e = [ "", "a", "bca" ], c.identical(b, e), 
          /* cut on second occurrence */
          b = a.strIsolateRightOrNone("abca", [ "a" ], 2), e = [ "", "a", "bca" ], c.identical(b, e), 
          /* cut on third occurrence */
          b = a.strIsolateRightOrNone("abcaca", "a", 3), e = [ "", "a", "bcaca" ], c.identical(b, e), 
          /* cut on third occurrence */
          b = a.strIsolateRightOrNone("abcaca", [ "a" ], 3), e = [ "", "a", "bcaca" ], c.identical(b, e), 
          /**/
          b = a.strIsolateRightOrNone("abcaca", "a", 4), e = [ "", void 0, "abcaca" ], c.identical(b, e), 
          /**/
          b = a.strIsolateRightOrNone("abcaca", [ "a" ], 4), e = [ "", void 0, "abcaca" ], 
          c.identical(b, e), 
          /* - */
          c.case = "several delimeters", 
          /**/
          b = a.strIsolateRightOrNone("abca", [ "a", "c" ]), e = [ "abc", "a", "" ], c.identical(b, e), 
          /**/
          b = a.strIsolateRightOrNone("abca", [ "c", "a" ]), e = [ "abc", "a", "" ], c.identical(b, e), 
          /**/
          b = a.strIsolateRightOrNone("abca", [ "x", "y" ]), e = [ "abca", void 0, "" ], c.identical(b, e), 
          /**/
          b = a.strIsolateRightOrNone("abca", [ "x", "y", "a" ]), e = [ "abc", "a", "" ], 
          c.identical(b, e), 
          /* - */
          c.case = "several delimeters, number", 
          /* empty delimeters array */
          b = a.strIsolateRightOrNone("abca", [], 2), e = [ "abca", void 0, "" ], c.identical(b, e), 
          /**/
          b = a.strIsolateRightOrNone("abca", [ "a", "c" ], 1), e = [ "abc", "a", "" ], c.identical(b, e), 
          b = a.strIsolateRightOrNone("abca", [ "a", "c" ], 2), e = [ "ab", "c", "a" ], c.identical(b, e), 
          /**/
          b = a.strIsolateRightOrNone("abcbc", [ "c", "a" ], 2), e = [ "ab", "c", "bc" ], 
          c.identical(b, e), 
          /**/
          b = a.strIsolateRightOrNone("cbcbc", [ "c", "a" ], 3), e = [ "", "c", "bcbc" ], 
          c.identical(b, e), 
          /**/
          b = a.strIsolateRightOrNone("cbcbc", [ "c", "a" ], 4), e = [ "", void 0, "cbcbc" ], 
          c.identical(b, e), 
          /**/
          b = a.strIsolateRightOrNone("jj", [ "c", "a" ], 4), e = [ "jj", void 0, "" ], c.identical(b, e), 
          /* - */
          c.case = "one of delimeters contains other", 
          /* - */
          b = a.strIsolateRightOrNone("ab", [ "a", "ab" ]), e = [ "", "a", "b" ], c.identical(b, e), 
          /**/
          b = a.strIsolateRightOrNone("ab", [ "ab", "a" ]), e = [ "", "ab", "" ], c.identical(b, e), 
          /**/
          b = a.strIsolateRightOrNone("ab", [ "b", "ab" ]), e = [ "a", "b", "" ], c.identical(b, e), 
          /**/
          b = a.strIsolateRightOrNone("ab", [ "ab", "b" ]), e = [ "a", "b", "" ], c.identical(b, e), 
          /* - */
          c.case = "defaults"
          /**/ , b = a.strIsolateRightOrNone("a b c", " ", 1), e = [ "a b", " ", "c" ], c.identical(b, e), 
          /* - */
          c.case = "single delimeter"
          /* cut on first appear */ , b = a.strIsolateRightOrNone("abca", "a", 1), e = [ "abc", "a", "" ], 
          c.identical(b, e), 
          /* no occurrences */
          b = a.strIsolateRightOrNone("jj", "a", 1), e = [ "jj", void 0, "" ], c.identical(b, e), 
          /* cut on second appear */
          b = a.strIsolateRightOrNone("abca", "a", 2), e = [ "", "a", "bca" ], c.identical(b, e), 
          /**/
          b = a.strIsolateRightOrNone("abca", "a", 5), e = [ "", void 0, "abca" ], c.identical(b, e), 
          /* - */
          c.case = "multiple delimeter"
          /**/ , b = a.strIsolateRightOrNone("abca", [ "a", "c" ], 1), e = [ "abc", "a", "" ], 
          c.identical(b, e), 
          /**/
          b = a.strIsolateRightOrNone("abca", [ "a", "c" ], 2), e = [ "ab", "c", "a" ], c.identical(b, e), 
          /**/
          b = a.strIsolateRightOrNone("abca", [ "a", "c" ], 3), e = [ "", "a", "bca" ], c.identical(b, e), 
          /* no occurrences */
          b = a.strIsolateRightOrNone("jj", [ "a", "c" ], 1), e = [ "jj", void 0, "" ], c.identical(b, e), 
          /* no occurrences */
          b = a.strIsolateRightOrNone("jj", [ "a" ], 1), e = [ "jj", void 0, "" ], c.identical(b, e), 
          /* - */
          c.case = "options as map", 
          /**/
          b = a.strIsolateRightOrNone({
            src: "abca",
            delimeter: "a",
            times: 1
          }), e = [ "abc", "a", "" ], c.identical(b, e), 
          /* number option is missing */
          b = a.strIsolateRightOrNone({
            src: "abca",
            delimeter: "a"
          }), e = [ "abc", "a", "" ], c.identical(b, e), 
          /* - */
          c.case = "number option check", 
          /* number is zero */
          b = a.strIsolateRightOrNone("abca", "a", 0), e = [ "abca", void 0, "" ], c.identical(b, e), 
          /* number is negative */
          b = a.strIsolateRightOrNone("abca", "a", -1), e = [ "abca", void 0, "" ], c.identical(b, e), 
          /* */
          b = a.strIsolateRightOrNone("acbca", [ "a", "c" ], 1), e = [ "acbc", "a", "" ], 
          c.identical(b, e), b = a.strIsolateRightOrNone("acbca", [ "a", "c" ], 2), e = [ "acb", "c", "a" ], 
          c.identical(b, e), b = a.strIsolateRightOrNone("abababa", "aba", 1), e = [ "abab", "aba", "" ], 
          c.identical(b, e), b = a.strIsolateRightOrNone("abababa", "aba", 2), e = [ "ab", "aba", "ba" ], 
          c.identical(b, e), b = a.strIsolateRightOrNone("abababa", "aba", 3), e = [ "", "aba", "baba" ], 
          c.identical(b, e), b = a.strIsolateRightOrNone("abababa", "aba", 4), e = [ "", void 0, "abababa" ], 
          c.identical(b, e), 
          /* - */
          c.open("abaaca with strings"), b = a.strIsolateRightOrNone("abaaca", "a", 0), e = [ "abaaca", void 0, "" ], 
          c.identical(b, e), b = a.strIsolateRightOrNone("abaaca", "a", 1), e = [ "abaac", "a", "" ], 
          c.identical(b, e), b = a.strIsolateRightOrNone("abaaca", "a", 2), e = [ "aba", "a", "ca" ], 
          c.identical(b, e), b = a.strIsolateRightOrNone("abaaca", "a", 3), e = [ "ab", "a", "aca" ], 
          c.identical(b, e), b = a.strIsolateRightOrNone("abaaca", "a", 4), e = [ "", "a", "baaca" ], 
          c.identical(b, e), b = a.strIsolateRightOrNone("abaaca", "a", 5), e = [ "", void 0, "abaaca" ], 
          c.identical(b, e), c.close("abaaca with strings"), c.open("abababa with strings"), 
          b = a.strIsolateRightOrNone("abababa", "aba", 1), e = [ "abab", "aba", "" ], c.identical(b, e), 
          b = a.strIsolateRightOrNone("abababa", "aba", 2), e = [ "ab", "aba", "ba" ], c.identical(b, e), 
          b = a.strIsolateRightOrNone("abababa", "aba", 3), e = [ "", "aba", "baba" ], c.identical(b, e), 
          b = a.strIsolateRightOrNone("abababa", "aba", 4), e = [ "", void 0, "abababa" ], 
          c.identical(b, e), c.close("abababa with strings")
          /* - */ , c.open("abaaca with regexp"), b = a.strIsolateRightOrNone("abaaca", /a+/, 0), 
          e = [ "abaaca", void 0, "" ], c.identical(b, e), b = a.strIsolateRightOrNone("abaaca", /a+/, 1), 
          e = [ "abaac", "a", "" ], c.identical(b, e), b = a.strIsolateRightOrNone("abaaca", /a+/, 2), 
          e = [ "ab", "aa", "ca" ], c.identical(b, e), b = a.strIsolateRightOrNone("abaaca", /a+/, 3), 
          e = [ "ab", "a", "aca" ], c.identical(b, e), b = a.strIsolateRightOrNone("abaaca", /a+/, 4), 
          e = [ "", "a", "baaca" ], c.identical(b, e), b = a.strIsolateRightOrNone("abaaca", /a+/, 5), 
          e = [ "", void 0, "abaaca" ], c.identical(b, e), c.close("abaaca with regexp"), 
          c.open("abababa with regexp"), b = a.strIsolateRightOrNone("abababa", /aba/, 1), 
          e = [ "abab", "aba", "" ], c.identical(b, e), b = a.strIsolateRightOrNone("abababa", /aba/, 2), 
          e = [ "ab", "aba", "ba" ], c.identical(b, e), b = a.strIsolateRightOrNone("abababa", /aba/, 3), 
          e = [ "", "aba", "baba" ], c.identical(b, e), b = a.strIsolateRightOrNone("abababa", /aba/, 4), 
          e = [ "", void 0, "abababa" ], c.identical(b, e), c.close("abababa with regexp")
          /* */ , c.case = "single argument but object expected", c.shouldThrowErrorSync(function() {
            a.strIsolateRightOrNone("abc");
          }), c.case = "invalid option", c.shouldThrowErrorSync(function() {
            a.strIsolateRightOrNone({
              src: "abc",
              delimeter: "a",
              x: "a"
            });
          }), c.case = "changing of left option not allowed", c.shouldThrowErrorSync(function() {
            a.strIsolateRightOrNone({
              src: "abc",
              delimeter: "a",
              left: 0
            });
          });
        }
        //
        ,
        strIsolateRightOrAll: function strIsolateRightOrAll(c) {
          var b, e;
          c.case = "cut in most right position", 
          /* nothing */
          b = a.strIsolateRightOrAll("", ""), e = [ "", "", "" ], c.identical(b, e), 
          /* nothing */
          b = a.strIsolateRightOrAll("", "b"), e = [ "", void 0, "" ], c.identical(b, e), 
          /**/
          b = a.strIsolateRightOrAll("ahpc", "h"), e = [ "a", "h", "pc" ], c.identical(b, e), 
          /**/
          b = a.strIsolateRightOrAll("ahpc", "c"), e = [ "ahp", "c", "" ], c.identical(b, e), 
          /**/
          b = a.strIsolateRightOrAll("appbb", "b"), e = [ "appb", "b", "" ], c.identical(b, e), 
          /**/
          b = a.strIsolateRightOrAll("jj", "a"), e = [ "", void 0, "jj" ], c.identical(b, e), 
          /* */
          b = a.strIsolateRightOrAll("acbca", [ "a", "c" ], 1), e = [ "acbc", "a", "" ], c.identical(b, e), 
          b = a.strIsolateRightOrAll("acbca", [ "a", "c" ], 2), e = [ "acb", "c", "a" ], c.identical(b, e), 
          b = a.strIsolateRightOrAll("abababa", "aba", 1), e = [ "abab", "aba", "" ], c.identical(b, e), 
          b = a.strIsolateRightOrAll("abababa", "aba", 2), e = [ "ab", "aba", "ba" ], c.identical(b, e), 
          b = a.strIsolateRightOrAll("abababa", "aba", 3), e = [ "", "aba", "baba" ], c.identical(b, e), 
          b = a.strIsolateRightOrAll("abababa", "aba", 4), e = [ "", void 0, "abababa" ], 
          c.identical(b, e), 
          /* - */
          c.open("abaaca with strings"), b = a.strIsolateRightOrAll("abaaca", "a", 0), e = [ "abaaca", void 0, "" ], 
          c.identical(b, e), b = a.strIsolateRightOrAll("abaaca", "a", 1), e = [ "abaac", "a", "" ], 
          c.identical(b, e), b = a.strIsolateRightOrAll("abaaca", "a", 2), e = [ "aba", "a", "ca" ], 
          c.identical(b, e), b = a.strIsolateRightOrAll("abaaca", "a", 3), e = [ "ab", "a", "aca" ], 
          c.identical(b, e), b = a.strIsolateRightOrAll("abaaca", "a", 4), e = [ "", "a", "baaca" ], 
          c.identical(b, e), b = a.strIsolateRightOrAll("abaaca", "a", 5), e = [ "", void 0, "abaaca" ], 
          c.identical(b, e), c.close("abaaca with strings"), c.open("abababa with strings"), 
          b = a.strIsolateRightOrAll("abababa", "aba", 1), e = [ "abab", "aba", "" ], c.identical(b, e), 
          b = a.strIsolateRightOrAll("abababa", "aba", 2), e = [ "ab", "aba", "ba" ], c.identical(b, e), 
          b = a.strIsolateRightOrAll("abababa", "aba", 3), e = [ "", "aba", "baba" ], c.identical(b, e), 
          b = a.strIsolateRightOrAll("abababa", "aba", 4), e = [ "", void 0, "abababa" ], 
          c.identical(b, e), c.close("abababa with strings")
          /* - */ , c.open("abaaca with regexp"), b = a.strIsolateRightOrAll("abaaca", /a+/, 0), 
          e = [ "abaaca", void 0, "" ], c.identical(b, e), b = a.strIsolateRightOrAll("abaaca", /a+/, 1), 
          e = [ "abaac", "a", "" ], c.identical(b, e), b = a.strIsolateRightOrAll("abaaca", /a+/, 2), 
          e = [ "ab", "aa", "ca" ], c.identical(b, e), b = a.strIsolateRightOrAll("abaaca", /a+/, 3), 
          e = [ "ab", "a", "aca" ], c.identical(b, e), b = a.strIsolateRightOrAll("abaaca", /a+/, 4), 
          e = [ "", "a", "baaca" ], c.identical(b, e), b = a.strIsolateRightOrAll("abaaca", /a+/, 5), 
          e = [ "", void 0, "abaaca" ], c.identical(b, e), c.close("abaaca with regexp"), 
          c.open("abababa with regexp"), b = a.strIsolateRightOrAll("abababa", /aba/, 1), 
          e = [ "abab", "aba", "" ], c.identical(b, e), b = a.strIsolateRightOrAll("abababa", /aba/, 2), 
          e = [ "ab", "aba", "ba" ], c.identical(b, e), b = a.strIsolateRightOrAll("abababa", /aba/, 3), 
          e = [ "", "aba", "baba" ], c.identical(b, e), b = a.strIsolateRightOrAll("abababa", /aba/, 4), 
          e = [ "", void 0, "abababa" ], c.identical(b, e), c.close("abababa with regexp")
          /* */ , c.case = "delimeter must be a String", c.shouldThrowErrorSync(function() {
            a.strIsolateRightOrAll("jj", 1);
          }), c.case = "source must be a String", c.shouldThrowErrorSync(function() {
            a.strIsolateRightOrAll(1, "1");
          });
        }
        //
        ,
        strIsolateInsideOrNone: function strIsolateInsideOrNone(c) {
          /* - */
          c.open("string"), 
          /* - */
          c.case = "begin";
          var b = [ "", "aa", "_aa_bb_", "bb", "_cc_cc" ], e = a.strIsolateInsideOrNone("aa_aa_bb_bb_cc_cc", "aa", "bb");
          c.identical(e, b), c.case = "middle", b = [ "aa_aa_", "bb", "_bb_cc_", "cc", "" ], 
          e = a.strIsolateInsideOrNone("aa_aa_bb_bb_cc_cc", "bb", "cc"), c.identical(e, b), 
          c.case = "end", b = void 0, e = a.strIsolateInsideOrNone("aa_aa_bb_bb_cc_cc", "cc", "dd"), 
          c.identical(e, b), b = [ "aa_aa_bb_bb_", "cc", "_cc", "", "" ], e = a.strIsolateInsideOrNone("aa_aa_bb_bb_cc_cc", "cc", ""), 
          c.identical(e, b), 
          /* */
          c.case = "begin, several entry", b = [ "", "aa", "_aa_bb_", "bb", "_cc_cc" ], e = a.strIsolateInsideOrNone("aa_aa_bb_bb_cc_cc", [ "aa", "bb" ], [ "aa", "bb" ]), 
          c.identical(e, b), b = [ "", "aa", "_aa_bb_", "bb", "_cc_cc" ], e = a.strIsolateInsideOrNone("aa_aa_bb_bb_cc_cc", [ "bb", "aa" ], [ "bb", "aa" ]), 
          c.identical(e, b), c.case = "middle, several entry", b = [ "aa_aa_", "bb", "_bb_cc_", "cc", "" ], 
          e = a.strIsolateInsideOrNone("aa_aa_bb_bb_cc_cc", [ "bb", "cc" ], [ "bb", "cc" ]), 
          c.identical(e, b), b = [ "aa_aa_", "bb", "_bb_cc_", "cc", "" ], e = a.strIsolateInsideOrNone("aa_aa_bb_bb_cc_cc", [ "cc", "bb" ], [ "cc", "bb" ]), 
          c.identical(e, b), c.case = "end, several entry", b = [ "aa_aa_bb_bb_", "cc", "_", "cc", "" ], 
          e = a.strIsolateInsideOrNone("aa_aa_bb_bb_cc_cc", [ "cc", "dd" ], [ "cc", "dd" ]), 
          c.identical(e, b), b = [ "aa_aa_bb_bb_", "cc", "_", "cc", "" ], e = a.strIsolateInsideOrNone("aa_aa_bb_bb_cc_cc", [ "dd", "cc" ], [ "dd", "cc" ]), 
          c.identical(e, b), b = [ "aa_aa_bb_bb_", "cc", "_cc", "", "" ], e = a.strIsolateInsideOrNone("aa_aa_bb_bb_cc_cc", [ "dd", "cc" ], [ "", "" ]), 
          c.identical(e, b), 
          /* */
          c.case = "begin, several entry, several sources", b = [ [ "", "aa", "_aa_bb_", "bb", "_cc_cc" ], [ "cc_cc_", "bb", "_bb_aa_", "aa", "" ] ], 
          e = a.strIsolateInsideOrNone([ "aa_aa_bb_bb_cc_cc", "cc_cc_bb_bb_aa_aa" ], [ "aa", "bb" ], [ "aa", "bb" ]), 
          c.identical(e, b), b = [ [ "", "aa", "_aa_bb_", "bb", "_cc_cc" ], [ "cc_cc_", "bb", "_bb_aa_", "aa", "" ] ], 
          e = a.strIsolateInsideOrNone([ "aa_aa_bb_bb_cc_cc", "cc_cc_bb_bb_aa_aa" ], [ "bb", "aa" ], [ "bb", "aa" ]), 
          c.identical(e, b), c.case = "middle, several entry, several sources", b = [ [ "aa_aa_", "bb", "_bb_cc_", "cc", "" ], [ "", "cc", "_cc_bb_", "bb", "_aa_aa" ] ], 
          e = a.strIsolateInsideOrNone([ "aa_aa_bb_bb_cc_cc", "cc_cc_bb_bb_aa_aa" ], [ "bb", "cc" ], [ "bb", "cc" ]), 
          c.identical(e, b), b = [ [ "aa_aa_", "bb", "_bb_cc_", "cc", "" ], [ "", "cc", "_cc_bb_", "bb", "_aa_aa" ] ], 
          e = a.strIsolateInsideOrNone([ "aa_aa_bb_bb_cc_cc", "cc_cc_bb_bb_aa_aa" ], [ "cc", "bb" ], [ "cc", "bb" ]), 
          c.identical(e, b), c.case = "end, several entry, several sources", b = [ [ "aa_aa_bb_bb_", "cc", "_", "cc", "" ], [ "", "cc", "_", "cc", "_bb_bb_aa_aa" ] ], 
          e = a.strIsolateInsideOrNone([ "aa_aa_bb_bb_cc_cc", "cc_cc_bb_bb_aa_aa" ], [ "cc", "dd" ], [ "cc", "dd" ]), 
          c.identical(e, b), b = [ [ "aa_aa_bb_bb_", "cc", "_", "cc", "" ], [ "", "cc", "_", "cc", "_bb_bb_aa_aa" ] ], 
          e = a.strIsolateInsideOrNone([ "aa_aa_bb_bb_cc_cc", "cc_cc_bb_bb_aa_aa" ], [ "dd", "cc" ], [ "dd", "cc" ]), 
          c.identical(e, b), b = [ [ "aa_aa_bb_bb_", "cc", "_cc", "", "" ], [ "", "cc", "_cc_bb_bb_aa_aa", "", "" ] ], 
          e = a.strIsolateInsideOrNone([ "aa_aa_bb_bb_cc_cc", "cc_cc_bb_bb_aa_aa" ], [ "dd", "cc" ], [ "", "" ]), 
          c.identical(e, b), 
          /* */
          c.case = "no entry", b = void 0, e = a.strIsolateInsideOrNone("aa_aa_bb_bb_cc_cc", [], []), 
          c.identical(e, b), c.case = "not found", b = void 0, e = a.strIsolateInsideOrNone("aa_aa_bb_bb_cc_cc", "dd", "dd"), 
          c.identical(e, b), c.case = "not found begin", b = void 0, e = a.strIsolateInsideOrNone("aa_aa_bb_bb_cc_cc", "dd", ""), 
          c.identical(e, b), c.case = "not found end", b = void 0, e = a.strIsolateInsideOrNone("aa_aa_bb_bb_cc_cc", "", "dd"), 
          c.identical(e, b), c.case = "empty entry", b = [ "", "", "aa_aa_bb_bb_cc_cc", "", "" ], 
          e = a.strIsolateInsideOrNone("aa_aa_bb_bb_cc_cc", "", ""), c.identical(e, b), c.case = "empty entry, empty src", 
          b = [ "", "", "", "", "" ], e = a.strIsolateInsideOrNone("", "", ""), c.identical(e, b), 
          c.case = "empty src", b = void 0, e = a.strIsolateInsideOrNone("", "aa", "bb"), 
          c.identical(e, b), 
          /* - */
          c.close("string"), c.open("regexp"), 
          /* */
          c.case = "begin smeared", b = [ "x", "aa", "x_xaax_xbbx_xb", "bx", "_xccx_xccx" ], 
          e = a.strIsolateInsideOrNone("xaax_xaax_xbbx_xbbx_xccx_xccx", /a\w/, /b\w/), c.identical(e, b), 
          c.case = "middle smeared", b = [ "xaax_xaax_x", "bb", "x_xbbx_xccx_xc", "cx", "" ], 
          e = a.strIsolateInsideOrNone("xaax_xaax_xbbx_xbbx_xccx_xccx", /b\w/, /c\w/), c.identical(e, b), 
          c.case = "end smeared", b = void 0, e = a.strIsolateInsideOrNone("xaax_xaax_xbbx_xbbx_xccx_xccx", /c\w/, /d\w/), 
          c.identical(e, b), b = [ "xaax_xaax_xbbx_xbbx_x", "cc", "x_xccx", "", "" ], e = a.strIsolateInsideOrNone("xaax_xaax_xbbx_xbbx_xccx_xccx", /c\w/, new RegExp("")), 
          c.identical(e, b), c.case = "begin", b = [ "", "aa", "_aa_bb_", "bb", "_cc_cc" ], 
          e = a.strIsolateInsideOrNone("aa_aa_bb_bb_cc_cc", /a+/, /b+/), c.identical(e, b), 
          c.case = "middle", b = [ "aa_aa_", "bb", "_bb_cc_", "cc", "" ], e = a.strIsolateInsideOrNone("aa_aa_bb_bb_cc_cc", /b+/, /c+/), 
          c.identical(e, b), c.case = "end", b = void 0, e = a.strIsolateInsideOrNone("aa_aa_bb_bb_cc_cc", /c+/, /d+/), 
          c.identical(e, b), b = [ "aa_aa_bb_bb_", "cc", "_cc", "", "" ], e = a.strIsolateInsideOrNone("aa_aa_bb_bb_cc_cc", /c+/, new RegExp("")), 
          c.identical(e, b), 
          /* */
          c.case = "begin, several entry", b = [ "", "aa", "_aa_bb_", "bb", "_cc_cc" ], e = a.strIsolateInsideOrNone("aa_aa_bb_bb_cc_cc", [ /a+/, /b+/ ], [ /a+/, /b+/ ]), 
          c.identical(e, b), b = [ "", "aa", "_aa_bb_", "bb", "_cc_cc" ], e = a.strIsolateInsideOrNone("aa_aa_bb_bb_cc_cc", [ /b+/, /a+/ ], [ /b+/, /a+/ ]), 
          c.identical(e, b), c.case = "middle, several entry", b = [ "aa_aa_", "bb", "_bb_cc_", "cc", "" ], 
          e = a.strIsolateInsideOrNone("aa_aa_bb_bb_cc_cc", [ /b+/, /c+/ ], [ /b+/, /c+/ ]), 
          c.identical(e, b), b = [ "aa_aa_", "bb", "_bb_cc_", "cc", "" ], e = a.strIsolateInsideOrNone("aa_aa_bb_bb_cc_cc", [ /c+/, /b+/ ], [ /c+/, /b+/ ]), 
          c.identical(e, b), c.case = "end, several entry", b = [ "aa_aa_bb_bb_", "cc", "_", "cc", "" ], 
          e = a.strIsolateInsideOrNone("aa_aa_bb_bb_cc_cc", [ /c+/, /d+/ ], [ /c+/, /d+/ ]), 
          c.identical(e, b), b = [ "aa_aa_bb_bb_", "cc", "_", "cc", "" ], e = a.strIsolateInsideOrNone("aa_aa_bb_bb_cc_cc", [ /d+/, /c+/ ], [ /d+/, /c+/ ]), 
          c.identical(e, b), b = [ "aa_aa_bb_bb_", "cc", "_cc", "", "" ], e = a.strIsolateInsideOrNone("aa_aa_bb_bb_cc_cc", [ /d+/, /c+/ ], [ new RegExp(""), new RegExp("") ]), 
          c.identical(e, b), 
          /* */
          c.case = "begin, several entry, several sources", b = [ [ "", "aa", "_aa_bb_", "bb", "_cc_cc" ], [ "cc_cc_", "bb", "_bb_aa_", "aa", "" ] ], 
          e = a.strIsolateInsideOrNone([ "aa_aa_bb_bb_cc_cc", "cc_cc_bb_bb_aa_aa" ], [ /a+/, /b+/ ], [ /a+/, /b+/ ]), 
          c.identical(e, b), b = [ [ "", "aa", "_aa_bb_", "bb", "_cc_cc" ], [ "cc_cc_", "bb", "_bb_aa_", "aa", "" ] ], 
          e = a.strIsolateInsideOrNone([ "aa_aa_bb_bb_cc_cc", "cc_cc_bb_bb_aa_aa" ], [ /b+/, /a+/ ], [ /b+/, /a+/ ]), 
          c.identical(e, b), c.case = "middle, several entry, several sources", b = [ [ "aa_aa_", "bb", "_bb_cc_", "cc", "" ], [ "", "cc", "_cc_bb_", "bb", "_aa_aa" ] ], 
          e = a.strIsolateInsideOrNone([ "aa_aa_bb_bb_cc_cc", "cc_cc_bb_bb_aa_aa" ], [ /b+/, /c+/ ], [ /b+/, /c+/ ]), 
          c.identical(e, b), b = [ [ "aa_aa_", "bb", "_bb_cc_", "cc", "" ], [ "", "cc", "_cc_bb_", "bb", "_aa_aa" ] ], 
          e = a.strIsolateInsideOrNone([ "aa_aa_bb_bb_cc_cc", "cc_cc_bb_bb_aa_aa" ], [ /c+/, /b+/ ], [ /c+/, /b+/ ]), 
          c.identical(e, b), c.case = "end, several entry, several sources", b = [ [ "aa_aa_bb_bb_", "cc", "_", "cc", "" ], [ "", "cc", "_", "cc", "_bb_bb_aa_aa" ] ], 
          e = a.strIsolateInsideOrNone([ "aa_aa_bb_bb_cc_cc", "cc_cc_bb_bb_aa_aa" ], [ /c+/, /d+/ ], [ /c+/, /d+/ ]), 
          c.identical(e, b), b = [ [ "aa_aa_bb_bb_", "cc", "_", "cc", "" ], [ "", "cc", "_", "cc", "_bb_bb_aa_aa" ] ], 
          e = a.strIsolateInsideOrNone([ "aa_aa_bb_bb_cc_cc", "cc_cc_bb_bb_aa_aa" ], [ /d+/, /c+/ ], [ /d+/, /c+/ ]), 
          c.identical(e, b), b = [ [ "aa_aa_bb_bb_", "cc", "_cc", "", "" ], [ "", "cc", "_cc_bb_bb_aa_aa", "", "" ] ], 
          e = a.strIsolateInsideOrNone([ "aa_aa_bb_bb_cc_cc", "cc_cc_bb_bb_aa_aa" ], [ /d+/, /c+/ ], [ new RegExp(""), new RegExp("") ]), 
          c.identical(e, b), 
          /* */
          c.case = "no entry", b = void 0, e = a.strIsolateInsideOrNone("aa_aa_bb_bb_cc_cc", [], []), 
          c.identical(e, b), c.case = "not found", b = void 0, e = a.strIsolateInsideOrNone("aa_aa_bb_bb_cc_cc", /d+/, /d+/), 
          c.identical(e, b), c.case = "not found begin", b = void 0, e = a.strIsolateInsideOrNone("aa_aa_bb_bb_cc_cc", /d+/, new RegExp("")), 
          c.identical(e, b), c.case = "not found end", b = void 0, e = a.strIsolateInsideOrNone("aa_aa_bb_bb_cc_cc", new RegExp(""), /d+/), 
          c.identical(e, b), c.case = "empty entry", b = [ "", "", "aa_aa_bb_bb_cc_cc", "", "" ], 
          e = a.strIsolateInsideOrNone("aa_aa_bb_bb_cc_cc", new RegExp(""), new RegExp("")), 
          c.identical(e, b), c.case = "empty entry, empty src", b = [ "", "", "", "", "" ], 
          e = a.strIsolateInsideOrNone("", new RegExp(""), new RegExp("")), c.identical(e, b), 
          c.case = "empty src", b = void 0, e = a.strIsolateInsideOrNone("", /a+/, /b+/), 
          c.identical(e, b), 
          /* - */
          c.close("regexp"), c.shouldThrowError(() => a.strIsolateInsideOrNone()), c.shouldThrowError(() => a.strIsolateInsideOrNone("")), 
          c.shouldThrowError(() => a.strIsolateInsideOrNone("", "")), c.shouldThrowError(() => a.strIsolateInsideOrNone("", "", "", "")), 
          c.shouldThrowError(() => a.strIsolateInsideOrNone(1, "", "")), c.shouldThrowError(() => a.strIsolateInsideOrNone("123", 1, "")), 
          c.shouldThrowError(() => a.strIsolateInsideOrNone("123", "", 3));
        }
        //
        ,
        strIsolateInsideOrAll: function strIsolateInsideOrAll(c) {
          /* - */
          c.open("string"), 
          /* - */
          c.case = "begin";
          var b = [ "", "aa", "_aa_bb_", "bb", "_cc_cc" ], e = a.strIsolateInsideOrAll("aa_aa_bb_bb_cc_cc", "aa", "bb");
          c.identical(e, b), c.case = "middle", b = [ "aa_aa_", "bb", "_bb_cc_", "cc", "" ], 
          e = a.strIsolateInsideOrAll("aa_aa_bb_bb_cc_cc", "bb", "cc"), c.identical(e, b), 
          c.case = "end", b = [ "aa_aa_bb_bb_", "cc", "_cc", "", "" ], e = a.strIsolateInsideOrAll("aa_aa_bb_bb_cc_cc", "cc", "dd"), 
          c.identical(e, b), b = [ "aa_aa_bb_bb_", "cc", "_cc", "", "" ], e = a.strIsolateInsideOrAll("aa_aa_bb_bb_cc_cc", "cc", ""), 
          c.identical(e, b), 
          /* */
          c.case = "begin, several entry", b = [ "", "aa", "_aa_bb_", "bb", "_cc_cc" ], e = a.strIsolateInsideOrAll("aa_aa_bb_bb_cc_cc", [ "aa", "bb" ], [ "aa", "bb" ]), 
          c.identical(e, b), b = [ "", "aa", "_aa_bb_", "bb", "_cc_cc" ], e = a.strIsolateInsideOrAll("aa_aa_bb_bb_cc_cc", [ "bb", "aa" ], [ "bb", "aa" ]), 
          c.identical(e, b), c.case = "middle, several entry", b = [ "aa_aa_", "bb", "_bb_cc_", "cc", "" ], 
          e = a.strIsolateInsideOrAll("aa_aa_bb_bb_cc_cc", [ "bb", "cc" ], [ "bb", "cc" ]), 
          c.identical(e, b), b = [ "aa_aa_", "bb", "_bb_cc_", "cc", "" ], e = a.strIsolateInsideOrAll("aa_aa_bb_bb_cc_cc", [ "cc", "bb" ], [ "cc", "bb" ]), 
          c.identical(e, b), c.case = "end, several entry", b = [ "aa_aa_bb_bb_", "cc", "_", "cc", "" ], 
          e = a.strIsolateInsideOrAll("aa_aa_bb_bb_cc_cc", [ "cc", "dd" ], [ "cc", "dd" ]), 
          c.identical(e, b), b = [ "aa_aa_bb_bb_", "cc", "_", "cc", "" ], e = a.strIsolateInsideOrAll("aa_aa_bb_bb_cc_cc", [ "dd", "cc" ], [ "dd", "cc" ]), 
          c.identical(e, b), b = [ "aa_aa_bb_bb_", "cc", "_cc", "", "" ], e = a.strIsolateInsideOrAll("aa_aa_bb_bb_cc_cc", [ "dd", "cc" ], [ "", "" ]), 
          c.identical(e, b), 
          /* */
          c.case = "begin, several entry, several sources", b = [ [ "", "aa", "_aa_bb_", "bb", "_cc_cc" ], [ "cc_cc_", "bb", "_bb_aa_", "aa", "" ] ], 
          e = a.strIsolateInsideOrAll([ "aa_aa_bb_bb_cc_cc", "cc_cc_bb_bb_aa_aa" ], [ "aa", "bb" ], [ "aa", "bb" ]), 
          c.identical(e, b), b = [ [ "", "aa", "_aa_bb_", "bb", "_cc_cc" ], [ "cc_cc_", "bb", "_bb_aa_", "aa", "" ] ], 
          e = a.strIsolateInsideOrAll([ "aa_aa_bb_bb_cc_cc", "cc_cc_bb_bb_aa_aa" ], [ "bb", "aa" ], [ "bb", "aa" ]), 
          c.identical(e, b), c.case = "middle, several entry, several sources", b = [ [ "aa_aa_", "bb", "_bb_cc_", "cc", "" ], [ "", "cc", "_cc_bb_", "bb", "_aa_aa" ] ], 
          e = a.strIsolateInsideOrAll([ "aa_aa_bb_bb_cc_cc", "cc_cc_bb_bb_aa_aa" ], [ "bb", "cc" ], [ "bb", "cc" ]), 
          c.identical(e, b), b = [ [ "aa_aa_", "bb", "_bb_cc_", "cc", "" ], [ "", "cc", "_cc_bb_", "bb", "_aa_aa" ] ], 
          e = a.strIsolateInsideOrAll([ "aa_aa_bb_bb_cc_cc", "cc_cc_bb_bb_aa_aa" ], [ "cc", "bb" ], [ "cc", "bb" ]), 
          c.identical(e, b), c.case = "end, several entry, several sources", b = [ [ "aa_aa_bb_bb_", "cc", "_", "cc", "" ], [ "", "cc", "_", "cc", "_bb_bb_aa_aa" ] ], 
          e = a.strIsolateInsideOrAll([ "aa_aa_bb_bb_cc_cc", "cc_cc_bb_bb_aa_aa" ], [ "cc", "dd" ], [ "cc", "dd" ]), 
          c.identical(e, b), b = [ [ "aa_aa_bb_bb_", "cc", "_", "cc", "" ], [ "", "cc", "_", "cc", "_bb_bb_aa_aa" ] ], 
          e = a.strIsolateInsideOrAll([ "aa_aa_bb_bb_cc_cc", "cc_cc_bb_bb_aa_aa" ], [ "dd", "cc" ], [ "dd", "cc" ]), 
          c.identical(e, b), b = [ [ "aa_aa_bb_bb_", "cc", "_cc", "", "" ], [ "", "cc", "_cc_bb_bb_aa_aa", "", "" ] ], 
          e = a.strIsolateInsideOrAll([ "aa_aa_bb_bb_cc_cc", "cc_cc_bb_bb_aa_aa" ], [ "dd", "cc" ], [ "", "" ]), 
          c.identical(e, b), 
          /* */
          c.case = "no entry", b = [ "", "", "aa_aa_bb_bb_cc_cc", "", "" ], e = a.strIsolateInsideOrAll("aa_aa_bb_bb_cc_cc", [], []), 
          c.identical(e, b), c.case = "not found", b = [ "", "", "aa_aa_bb_bb_cc_cc", "", "" ], 
          e = a.strIsolateInsideOrAll("aa_aa_bb_bb_cc_cc", "dd", "dd"), c.identical(e, b), 
          c.case = "not found begin", b = [ "", "", "aa_aa_bb_bb_cc_cc", "", "" ], e = a.strIsolateInsideOrAll("aa_aa_bb_bb_cc_cc", "dd", ""), 
          c.identical(e, b), c.case = "not found end", b = [ "", "", "aa_aa_bb_bb_cc_cc", "", "" ], 
          e = a.strIsolateInsideOrAll("aa_aa_bb_bb_cc_cc", "", "dd"), c.identical(e, b), c.case = "empty entry", 
          b = [ "", "", "aa_aa_bb_bb_cc_cc", "", "" ], e = a.strIsolateInsideOrAll("aa_aa_bb_bb_cc_cc", "", ""), 
          c.identical(e, b), c.case = "empty entry, empty src", b = [ "", "", "", "", "" ], 
          e = a.strIsolateInsideOrAll("", "", ""), c.identical(e, b), c.case = "empty src", 
          b = [ "", "", "", "", "" ], e = a.strIsolateInsideOrAll("", "aa", "bb"), c.identical(e, b), 
          /* - */
          c.close("string"), c.open("regexp"), 
          /* */
          c.case = "begin smeared", b = [ "x", "aa", "x_xaax_xbbx_xb", "bx", "_xccx_xccx" ], 
          e = a.strIsolateInsideOrAll("xaax_xaax_xbbx_xbbx_xccx_xccx", /a\w/, /b\w/), c.identical(e, b), 
          c.case = "middle smeared", b = [ "xaax_xaax_x", "bb", "x_xbbx_xccx_xc", "cx", "" ], 
          e = a.strIsolateInsideOrAll("xaax_xaax_xbbx_xbbx_xccx_xccx", /b\w/, /c\w/), c.identical(e, b), 
          c.case = "end smeared", b = [ "xaax_xaax_xbbx_xbbx_x", "cc", "x_xccx", "", "" ], 
          e = a.strIsolateInsideOrAll("xaax_xaax_xbbx_xbbx_xccx_xccx", /c\w/, /d\w/), c.identical(e, b), 
          b = [ "xaax_xaax_xbbx_xbbx_x", "cc", "x_xccx", "", "" ], e = a.strIsolateInsideOrAll("xaax_xaax_xbbx_xbbx_xccx_xccx", /c\w/, new RegExp("")), 
          c.identical(e, b), c.case = "begin", b = [ "", "aa", "_aa_bb_", "bb", "_cc_cc" ], 
          e = a.strIsolateInsideOrAll("aa_aa_bb_bb_cc_cc", /a+/, /b+/), c.identical(e, b), 
          c.case = "middle", b = [ "aa_aa_", "bb", "_bb_cc_", "cc", "" ], e = a.strIsolateInsideOrAll("aa_aa_bb_bb_cc_cc", /b+/, /c+/), 
          c.identical(e, b), c.case = "end", b = [ "aa_aa_bb_bb_", "cc", "_cc", "", "" ], 
          e = a.strIsolateInsideOrAll("aa_aa_bb_bb_cc_cc", /c+/, /d+/), c.identical(e, b), 
          b = [ "aa_aa_bb_bb_", "cc", "_cc", "", "" ], e = a.strIsolateInsideOrAll("aa_aa_bb_bb_cc_cc", /c+/, new RegExp("")), 
          c.identical(e, b), 
          /* */
          c.case = "begin, several entry", b = [ "", "aa", "_aa_bb_", "bb", "_cc_cc" ], e = a.strIsolateInsideOrAll("aa_aa_bb_bb_cc_cc", [ /a+/, /b+/ ], [ /a+/, /b+/ ]), 
          c.identical(e, b), b = [ "", "aa", "_aa_bb_", "bb", "_cc_cc" ], e = a.strIsolateInsideOrAll("aa_aa_bb_bb_cc_cc", [ /b+/, /a+/ ], [ /b+/, /a+/ ]), 
          c.identical(e, b), c.case = "middle, several entry", b = [ "aa_aa_", "bb", "_bb_cc_", "cc", "" ], 
          e = a.strIsolateInsideOrAll("aa_aa_bb_bb_cc_cc", [ /b+/, /c+/ ], [ /b+/, /c+/ ]), 
          c.identical(e, b), b = [ "aa_aa_", "bb", "_bb_cc_", "cc", "" ], e = a.strIsolateInsideOrAll("aa_aa_bb_bb_cc_cc", [ /c+/, /b+/ ], [ /c+/, /b+/ ]), 
          c.identical(e, b), c.case = "end, several entry", b = [ "aa_aa_bb_bb_", "cc", "_", "cc", "" ], 
          e = a.strIsolateInsideOrAll("aa_aa_bb_bb_cc_cc", [ /c+/, /d+/ ], [ /c+/, /d+/ ]), 
          c.identical(e, b), b = [ "aa_aa_bb_bb_", "cc", "_", "cc", "" ], e = a.strIsolateInsideOrAll("aa_aa_bb_bb_cc_cc", [ /d+/, /c+/ ], [ /d+/, /c+/ ]), 
          c.identical(e, b), b = [ "aa_aa_bb_bb_", "cc", "_cc", "", "" ], e = a.strIsolateInsideOrAll("aa_aa_bb_bb_cc_cc", [ /d+/, /c+/ ], [ new RegExp(""), new RegExp("") ]), 
          c.identical(e, b), 
          /* */
          c.case = "begin, several entry, several sources", b = [ [ "", "aa", "_aa_bb_", "bb", "_cc_cc" ], [ "cc_cc_", "bb", "_bb_aa_", "aa", "" ] ], 
          e = a.strIsolateInsideOrAll([ "aa_aa_bb_bb_cc_cc", "cc_cc_bb_bb_aa_aa" ], [ /a+/, /b+/ ], [ /a+/, /b+/ ]), 
          c.identical(e, b), b = [ [ "", "aa", "_aa_bb_", "bb", "_cc_cc" ], [ "cc_cc_", "bb", "_bb_aa_", "aa", "" ] ], 
          e = a.strIsolateInsideOrAll([ "aa_aa_bb_bb_cc_cc", "cc_cc_bb_bb_aa_aa" ], [ /b+/, /a+/ ], [ /b+/, /a+/ ]), 
          c.identical(e, b), c.case = "middle, several entry, several sources", b = [ [ "aa_aa_", "bb", "_bb_cc_", "cc", "" ], [ "", "cc", "_cc_bb_", "bb", "_aa_aa" ] ], 
          e = a.strIsolateInsideOrAll([ "aa_aa_bb_bb_cc_cc", "cc_cc_bb_bb_aa_aa" ], [ /b+/, /c+/ ], [ /b+/, /c+/ ]), 
          c.identical(e, b), b = [ [ "aa_aa_", "bb", "_bb_cc_", "cc", "" ], [ "", "cc", "_cc_bb_", "bb", "_aa_aa" ] ], 
          e = a.strIsolateInsideOrAll([ "aa_aa_bb_bb_cc_cc", "cc_cc_bb_bb_aa_aa" ], [ /c+/, /b+/ ], [ /c+/, /b+/ ]), 
          c.identical(e, b), c.case = "end, several entry, several sources", b = [ [ "aa_aa_bb_bb_", "cc", "_", "cc", "" ], [ "", "cc", "_", "cc", "_bb_bb_aa_aa" ] ], 
          e = a.strIsolateInsideOrAll([ "aa_aa_bb_bb_cc_cc", "cc_cc_bb_bb_aa_aa" ], [ /c+/, /d+/ ], [ /c+/, /d+/ ]), 
          c.identical(e, b), b = [ [ "aa_aa_bb_bb_", "cc", "_", "cc", "" ], [ "", "cc", "_", "cc", "_bb_bb_aa_aa" ] ], 
          e = a.strIsolateInsideOrAll([ "aa_aa_bb_bb_cc_cc", "cc_cc_bb_bb_aa_aa" ], [ /d+/, /c+/ ], [ /d+/, /c+/ ]), 
          c.identical(e, b), b = [ [ "aa_aa_bb_bb_", "cc", "_cc", "", "" ], [ "", "cc", "_cc_bb_bb_aa_aa", "", "" ] ], 
          e = a.strIsolateInsideOrAll([ "aa_aa_bb_bb_cc_cc", "cc_cc_bb_bb_aa_aa" ], [ /d+/, /c+/ ], [ new RegExp(""), new RegExp("") ]), 
          c.identical(e, b), 
          /* */
          c.case = "no entry", b = [ "", "", "aa_aa_bb_bb_cc_cc", "", "" ], e = a.strIsolateInsideOrAll("aa_aa_bb_bb_cc_cc", [], []), 
          c.identical(e, b), c.case = "not found", b = [ "", "", "aa_aa_bb_bb_cc_cc", "", "" ], 
          e = a.strIsolateInsideOrAll("aa_aa_bb_bb_cc_cc", /d+/, /d+/), c.identical(e, b), 
          c.case = "not found begin", b = [ "", "", "aa_aa_bb_bb_cc_cc", "", "" ], e = a.strIsolateInsideOrAll("aa_aa_bb_bb_cc_cc", /d+/, new RegExp("")), 
          c.identical(e, b), c.case = "not found end", b = [ "", "", "aa_aa_bb_bb_cc_cc", "", "" ], 
          e = a.strIsolateInsideOrAll("aa_aa_bb_bb_cc_cc", new RegExp(""), /d+/), c.identical(e, b), 
          c.case = "empty entry", b = [ "", "", "aa_aa_bb_bb_cc_cc", "", "" ], e = a.strIsolateInsideOrAll("aa_aa_bb_bb_cc_cc", new RegExp(""), new RegExp("")), 
          c.identical(e, b), c.case = "empty entry, empty src", b = [ "", "", "", "", "" ], 
          e = a.strIsolateInsideOrAll("", new RegExp(""), new RegExp("")), c.identical(e, b), 
          c.case = "empty src", b = [ "", "", "", "", "" ], e = a.strIsolateInsideOrAll("", /a+/, /b+/), 
          c.identical(e, b), 
          /* - */
          c.close("regexp"), c.shouldThrowError(() => a.strIsolateInsideOrAll()), c.shouldThrowError(() => a.strIsolateInsideOrAll("")), 
          c.shouldThrowError(() => a.strIsolateInsideOrAll("", "")), c.shouldThrowError(() => a.strIsolateInsideOrAll("", "", "", "")), 
          c.shouldThrowError(() => a.strIsolateInsideOrAll(1, "", "")), c.shouldThrowError(() => a.strIsolateInsideOrAll("123", 1, "")), 
          c.shouldThrowError(() => a.strIsolateInsideOrAll("123", "", 3));
        }
      }
    };
    c = wTestSuite(c), "undefined" == typeof module || module.parent || wTester.test(c.name);
  }();
  // == end of file StringTestS
}();