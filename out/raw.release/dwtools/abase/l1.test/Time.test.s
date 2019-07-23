!function TimeTestS() {
  // == begin of file TimeTestS
  !function _Time_test_s_() {
    "use strict";
    "undefined" != typeof module && require("../Layer2.s").include("wTesting");
    var e = wTools, a = {
      name: "Tools/base/l1/Time",
      silencing: 1,
      tests: {
        timeReadyJoin: 
        // --
        // tests
        // --
        function timeReadyJoin(a) {
          function r1() {
            return r += 1, console.log(arguments), 1 === r ? a.equivalent(arguments, [ "arg1", "arg2" ]) : 2 === r ? a.equivalent(arguments, [ "arg1", "arg3", "arg4" ]) : 3 === r ? a.equivalent(arguments, [ "arg5", "arg6", "arg7", "arg8" ]) : 4 === r && a.equivalent(arguments, [ "arg5", "arg6", "arg9" ]), 
            4 === r && t.take(r), arguments;
          }
          let r = 0, t = _testerGlobal_.wTools.Consequence(), n = e.timeReadyJoin(void 0, r1, [ "arg1" ]);
          n("arg2"), n("arg3", "arg4");
          let i = e.timeReadyJoin(void 0, r1, [ "arg5", "arg6" ]);
          return i("arg7", "arg8"), i("arg9"), t;
        }
        // --
        // declare
        // --
            }
    };
    a = wTestSuite(a), "undefined" == typeof module || module.parent || wTester.test(a.name);
  }();
  // == end of file TimeTestS
}();