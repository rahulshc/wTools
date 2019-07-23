!function DiagnosticsTestS() {
  // == begin of file DiagnosticsTestS
  !function _Diagnostics_test_s_() {
    "use strict";
    //
    function err(r) {
      var a = "some error message", s = new Error("err obj for tesst"), n = s.message, t = new Error("Error #3"), c = t.message;
      r.case = "single string passed as args property : result should be Error obj";
      var i = e.err(a);
      r.identical(i instanceof Error, !0), r.case = "single string passed as args property : result message should contains passed string";
      var o = new RegExp(a);
      r.identical(o.test(i.message), !0), r.case = "single string passed as args property : result message should contains file name";
      var l = new RegExp("Diagnostics.test.s");
      r.identical(l.test(i.message), !0), r.case = "single error instance passed as args property : result should be Error obj", 
      i = e.err(s), r.identical(i instanceof Error, !0), r.case = "single error instance passed as args property : result message should contains passed string", 
      o = new RegExp(n), r.identical(o.test(i.message), !0), r.case = "single error instance passed as args property : result message should contains file name", 
      r.identical(e.strHas(i.message, s.location.path), !0), r.case = "several error instances/messages passed as args property : result should be Error obj", 
      i = e.err(t, a), r.identical(i instanceof Error, !0), r.case = "several error instances/messages passed as args : result message should contains all passed string";
      var d = new RegExp(c), g = new RegExp(a);
      r.identical([ d.test(i.message), g.test(i.message) ], [ !0, !0 ]), r.case = "several error instances/messages passed as args property : result message should contains file name", 
      l = new RegExp("Diagnostics.test.s"), r.identical(l.test(i.message), !0);
    }
    "undefined" != typeof module && require("../Layer2.s").include("wTesting"), _global_;
    var e = _global_.wTools, r = {
      name: "Tools/base/l1/Diagnostics",
      silencing: 1,
      tests: {
        _err: 
        //
        function _err(r) {
          var a = new Error("err obj for tesst"), s = a.message, n = "some error message", t = new Error("Error #3"), c = t.message, i = {
            level: 1,
            args: [ a ]
          }, o = {
            level: 3,
            args: [ n, t ]
          };
          /* - */
          r.case = "single string passed as args property : result should be Error obj";
          var l = {
            level: 1,
            args: [ n ]
          }, d = e._err(l);
          r.identical(d instanceof Error, !0), r.case = "single string passed as args property : result message should contains passed string";
          var g = new RegExp(n);
          r.identical(g.test(d.message), !0), r.case = "single string passed as args property : result message should contains file name";
          var m = new RegExp("Diagnostics.test.s");
          r.identical(m.test(d.message), !0), r.case = "single error instance passed as args property : result should be Error obj", 
          d = e._err(i), r.identical(d instanceof Error, !0), r.case = "single error instance passed as args property : result message should contains passed string", 
          g = new RegExp(s), r.identical(g.test(d.message), !0), r.case = "single error instance passed as args property : result message should contains file name", 
          r.identical(e.strHas(d.message, a.location.path), !0), 
          /* - */
          r.open("several error instances/messages passed as args property"), d = e._err(o), 
          r.identical(d instanceof Error, !0), r.case = "result message should contains all passed string";
          var u = new RegExp(c), p = new RegExp(n);
          r.identical([ u.test(d.message), p.test(d.message) ], [ !0, !0 ]), r.case = "result message should contains file name", 
          m = new RegExp("Diagnostics.test.s"), r.identical(m.test(d.message), !0), r.close("several error instances/messages passed as args property");
          /* - */
          var b = {
            level: 1,
            args: null
          };
          r.case = "missed argument", r.shouldThrowError(function() {
            e._err();
          }), r.case = "extra argument", r.shouldThrowError(function() {
            e._err(b, l);
          }), r.case = "options.args not array", r.shouldThrowError(function() {
            e._err(b);
          });
        },
        err: err,
        errLog: 
        //
        function errLog(r) {
          var a = new Error("err obj for tesst"), s = a.message;
          r.case = "single string passed as args property : result should be Error obj";
          var n = e.errLog("some error message");
          r.identical(n instanceof Error, !0), r.case = "single string passed as args property : result message should contains passed string";
          var t = new RegExp("some error message");
          r.identical(t.test(n.message), !0), r.case = "single string passed as args property : result message should contains file name";
          var c = new RegExp("Diagnostics.test.s");
          r.identical(c.test(n.message), !0), r.case = "single error instance passed as args property : result should be Error obj", 
          n = e.errLog(a), r.identical(n instanceof Error, !0), r.case = "single error instance passed as args property : result message should contains passed string", 
          t = new RegExp(s), r.identical(t.test(n.message), !0), r.case = "single error instance passed as args property : result message should contains file name", 
          r.identical(e.strHas(n.message, a.location.path), !0);
        }
        //
        ,
        // test sureMap*
        sureMapHasExactly: function sureMapHasExactly(r) {
          r.case = "correct input";
          var a = {
            "a": 13,
            "b": 77,
            "c": 3,
            "d": "Mikle"
          }, s = {
            "a": 13,
            "b": 77,
            "c": 3,
            "d": "Mikle"
          }, n = function() {
            return a.a + t.b;
          };
          r.identical(e.sureMapHasExactly(a, s), !0), r.identical(e.sureMapHasExactly(a, s, n), !0), 
          r.identical(e.sureMapHasExactly(a, s, n, "msg"), !0), r.identical(e.sureMapHasExactly(a, s, () => "This is explanation"), !0), 
          r.case = "check error message, no msg", a = {
            "a": 13,
            "b": 77,
            "c": 3,
            "d": "Mikle"
          };
          var t = {
            "a": 13,
            "b": 77,
            "c": 3,
            "name": "Hello"
          };
          try {
            e.sureMapHasExactly(a, t);
          } catch (e) {
            err = e;
          }
          r.identical(err instanceof Error, !0), r.identical(e.strHas(err.message, 'Object should have no fields : "d"'), !0), 
          r.case = "check error message, msg routine", a = {
            "a": 13,
            "b": 77,
            "c": 3,
            "d": "Mikle"
          }, t = {
            "a": 13,
            "b": 77,
            "c": 3,
            "name": "Hello"
          }, n = function() {
            return a.a + t.b;
          };
          try {
            e.sureMapHasExactly(a, t, n);
          } catch (e) {
            err = e;
          }
          r.identical(err instanceof Error, !0), r.identical(e.strHas(err.message, '90 "d"'), !0), 
          r.case = "check error message, msg string", a = {
            "a": 13,
            "b": 77,
            "c": 3,
            "d": "Mikle"
          }, t = {
            "a": 13,
            "b": 77,
            "c": 3,
            "name": "Hello"
          }, n = function() {
            return a.a + t.b;
          };
          try {
            e.sureMapHasExactly(a, t, "msg");
          } catch (e) {
            err = e;
          }
          r.identical(err instanceof Error, !0), r.identical(e.strHas(err.message, 'msg "d"'), !0), 
          r.case = "check error message, msg string & msg routine", a = {
            "a": 13,
            "b": 77,
            "c": 3,
            "d": "Mikle"
          }, t = {
            "a": 13,
            "b": 77,
            "c": 3,
            "name": "Hello"
          }, n = function() {
            return a.a + t.b;
          };
          try {
            e.sureMapHasExactly(a, t, "msg", n);
          } catch (e) {
            err = e;
          }
          r.identical(err instanceof Error, !0), r.identical(e.strHas(err.message, 'msg 90 "d"'), !0), 
          r.case = "check error message, msg routine", a = {
            "a": 13,
            "b": 77,
            "c": 3,
            "d": "Mikle"
          }, t = {
            "a": 13,
            "b": 77,
            "c": 3,
            "name": "Hello"
          }, n = function() {
            return a.a + t.b;
          };
          try {
            e.sureMapHasExactly(a, t, () => "This is explanation");
          } catch (e) {
            err = e;
          }
          r.identical(err instanceof Error, !0), r.identical(e.strHas(err.message, 'This is explanation "d"'), !0), 
          r.case = "check error message, five or more arguments", a = {
            "a": 13,
            "b": 77,
            "c": 3,
            "d": "Mikle"
          }, t = {
            "a": 13,
            "b": 77,
            "c": 3,
            "name": "Hello"
          }, n = function() {
            return a.a + t.b;
          };
          try {
            e.sureMapHasExactly(a, t, n, "msg", "msg");
          } catch (e) {
            err = e;
          }
          r.identical(err instanceof Error, !0), r.identical(e.strHas(err.message, "Expects two, three or four arguments"), !0);
        }
        //
        ,
        sureMapOwnExactly: function sureMapOwnExactly(r) {
          r.case = "correct input";
          var a = {
            "a": 13,
            "b": 77,
            "c": 3,
            "d": "Mikle"
          }, s = {
            "a": 13,
            "b": 77,
            "c": 3,
            "d": "Mikle"
          }, n = function() {
            return a.a + t.b;
          };
          r.identical(e.sureMapOwnExactly(a, s), !0), r.identical(e.sureMapOwnExactly(a, s, n), !0), 
          r.identical(e.sureMapOwnExactly(a, s, n, "msg"), !0), r.identical(e.sureMapOwnExactly(a, s, () => "This is explanation"), !0), 
          r.case = "check error message, no msg", a = {
            "a": 13,
            "b": 77,
            "c": 3,
            "d": "Mikle"
          };
          var t = {
            "a": 13,
            "b": 77,
            "c": 3,
            "name": "Hello"
          };
          try {
            e.sureMapOwnExactly(a, t);
          } catch (e) {
            err = e;
          }
          r.identical(err instanceof Error, !0), r.identical(e.strHas(err.message, 'Object should own no fields : "d"'), !0), 
          r.case = "check error message, msg routine", a = {
            "a": 13,
            "b": 77,
            "c": 3,
            "d": "Mikle"
          }, t = {
            "a": 13,
            "b": 77,
            "c": 3,
            "name": "Hello"
          }, n = function() {
            return a.a + t.b;
          };
          try {
            e.sureMapOwnExactly(a, t, n);
          } catch (e) {
            err = e;
          }
          r.identical(err instanceof Error, !0), r.identical(e.strHas(err.message, '90 "d"'), !0), 
          r.case = "check error message, msg string", a = {
            "a": 13,
            "b": 77,
            "c": 3,
            "d": "Mikle"
          }, t = {
            "a": 13,
            "b": 77,
            "c": 3,
            "name": "Hello"
          }, n = function() {
            return a.a + t.b;
          };
          try {
            e.sureMapOwnExactly(a, t, "msg");
          } catch (e) {
            err = e;
          }
          r.identical(err instanceof Error, !0), r.identical(e.strHas(err.message, 'msg "d"'), !0), 
          r.case = "check error message, msg string & msg routine", a = {
            "a": 13,
            "b": 77,
            "c": 3,
            "d": "Mikle"
          }, t = {
            "a": 13,
            "b": 77,
            "c": 3,
            "name": "Hello"
          }, n = function() {
            return a.a + t.b;
          };
          try {
            e.sureMapOwnExactly(a, t, "msg", n);
          } catch (e) {
            err = e;
          }
          r.identical(err instanceof Error, !0), r.identical(e.strHas(err.message, 'msg 90 "d"'), !0), 
          r.case = "check error message, msg routine", a = {
            "a": 13,
            "b": 77,
            "c": 3,
            "d": "Mikle"
          }, t = {
            "a": 13,
            "b": 77,
            "c": 3,
            "name": "Hello"
          }, n = function() {
            return a.a + t.b;
          };
          try {
            e.sureMapOwnExactly(a, t, () => "This is explanation");
          } catch (e) {
            err = e;
          }
          r.identical(err instanceof Error, !0), r.identical(e.strHas(err.message, 'This is explanation "d"'), !0), 
          r.case = "check error message, five or more arguments", a = {
            "a": 13,
            "b": 77,
            "c": 3,
            "d": "Mikle"
          }, t = {
            "a": 13,
            "b": 77,
            "c": 3,
            "name": "Hello"
          }, n = function() {
            return a.a + t.b;
          };
          try {
            e.sureMapOwnExactly(a, t, n, "msg", "msg");
          } catch (e) {
            err = e;
          }
          r.identical(err instanceof Error, !0), r.identical(e.strHas(err.message, "Expects two, three or four arguments"), !0);
        }
        //
        ,
        sureMapHasOnly: function sureMapHasOnly(r) {
          r.case = "correct input";
          var a = {
            "a": 13,
            "b": 77,
            "c": 3,
            "d": "Mikle"
          }, s = {
            "a": 13,
            "b": 77,
            "c": 3,
            "d": "Mikle"
          }, n = function() {
            return a.a + t.b;
          };
          r.identical(e.sureMapHasOnly(a, s), !0), r.identical(e.sureMapHasOnly(a, s, n), !0), 
          r.identical(e.sureMapHasOnly(a, s, n, "msg"), !0), r.identical(e.sureMapHasOnly(a, s, () => "This is explanation"), !0), 
          r.case = "check error message, no msg", a = {
            "a": 13,
            "b": 77,
            "c": 3,
            "d": "Mikle"
          }, s = {
            "a": 13,
            "b": 77,
            "c": 3,
            "d": "Mikle"
          }, n = function() {
            return a.a + t.b;
          }, a = {
            "a": 13,
            "b": 77,
            "c": 3,
            "d": "Mikle"
          };
          var t = {
            "a": 13,
            "b": 77,
            "c": 3,
            "name": "Hello"
          };
          try {
            e.sureMapHasOnly(a, t);
          } catch (e) {
            err = e;
          }
          r.identical(err instanceof Error, !0), r.identical(e.strHas(err.message, 'Object should have no fields : "d"'), !0), 
          r.case = "check error message, msg routine", a = {
            "a": 13,
            "b": 77,
            "c": 3,
            "d": "Mikle"
          }, s = {
            "a": 13,
            "b": 77,
            "c": 3,
            "d": "Mikle"
          }, n = function() {
            return a.a + t.b;
          };
          try {
            e.sureMapHasOnly(a, t, n);
          } catch (e) {
            err = e;
          }
          r.identical(err instanceof Error, !0), r.identical(e.strHas(err.message, '90 "d"'), !0), 
          r.case = "check error message, msg string", a = {
            "a": 13,
            "b": 77,
            "c": 3,
            "d": "Mikle"
          }, s = {
            "a": 13,
            "b": 77,
            "c": 3,
            "d": "Mikle"
          }, n = function() {
            return a.a + t.b;
          };
          try {
            e.sureMapHasOnly(a, t, "msg");
          } catch (e) {
            err = e;
          }
          r.identical(err instanceof Error, !0), r.identical(e.strHas(err.message, 'msg "d"'), !0), 
          r.case = "check error message, msg string & msg routine", a = {
            "a": 13,
            "b": 77,
            "c": 3,
            "d": "Mikle"
          }, s = {
            "a": 13,
            "b": 77,
            "c": 3,
            "d": "Mikle"
          }, n = function() {
            return a.a + t.b;
          };
          try {
            e.sureMapHasOnly(a, t, "msg", n);
          } catch (e) {
            err = e;
          }
          r.identical(err instanceof Error, !0), r.identical(e.strHas(err.message, 'msg 90 "d"'), !0), 
          r.case = "check error message, msg routine", a = {
            "a": 13,
            "b": 77,
            "c": 3,
            "d": "Mikle"
          }, s = {
            "a": 13,
            "b": 77,
            "c": 3,
            "d": "Mikle"
          }, n = function() {
            return a.a + t.b;
          };
          try {
            e.sureMapHasOnly(a, t, () => "This is explanation");
          } catch (e) {
            err = e;
          }
          r.identical(err instanceof Error, !0), r.identical(e.strHas(err.message, 'This is explanation "d"'), !0), 
          r.case = "check error message, five or more arguments", a = {
            "a": 13,
            "b": 77,
            "c": 3,
            "d": "Mikle"
          }, s = {
            "a": 13,
            "b": 77,
            "c": 3,
            "d": "Mikle"
          }, n = function() {
            return a.a + t.b;
          };
          try {
            e.sureMapHasOnly(a, t, n, "msg", "msg");
          } catch (e) {
            err = e;
          }
          r.identical(err instanceof Error, !0), r.identical(e.strHas(err.message, "Expects two, three or four arguments"), !0);
        }
        //
        ,
        sureMapOwnOnly: function sureMapOwnOnly(r) {
          r.case = "correct input";
          var a = {
            "a": 13,
            "b": 77,
            "c": 3,
            "d": "Mikle"
          }, s = {
            "a": 13,
            "b": 77,
            "c": 3,
            "d": "Mikle"
          }, n = function() {
            return a.a + t.b;
          };
          r.identical(e.sureMapOwnOnly(a, s), !0), r.identical(e.sureMapOwnOnly(a, s, n), !0), 
          r.identical(e.sureMapOwnOnly(a, s, n, "msg"), !0), r.identical(e.sureMapOwnOnly(a, s, () => "This is explanation"), !0), 
          r.case = "check error message, no msg", a = {
            "a": 13,
            "b": 77,
            "c": 3,
            "d": "Mikle"
          };
          var t = {
            "a": 13,
            "b": 77,
            "c": 3,
            "name": "Hello"
          };
          try {
            e.sureMapOwnOnly(a, t);
          } catch (e) {
            err = e;
          }
          r.identical(err instanceof Error, !0), r.identical(e.strHas(err.message, 'Object should own no fields : "d"'), !0), 
          r.case = "check error message, msg routine", a = {
            "a": 13,
            "b": 77,
            "c": 3,
            "d": "Mikle"
          }, t = {
            "a": 13,
            "b": 77,
            "c": 3,
            "name": "Hello"
          }, n = function() {
            return a.a + t.b;
          };
          try {
            e.sureMapOwnOnly(a, t, n);
          } catch (e) {
            err = e;
          }
          r.identical(err instanceof Error, !0), r.identical(e.strHas(err.message, '90 "d"'), !0), 
          r.case = "check error message, msg string", a = {
            "a": 13,
            "b": 77,
            "c": 3,
            "d": "Mikle"
          }, t = {
            "a": 13,
            "b": 77,
            "c": 3,
            "name": "Hello"
          }, n = function() {
            return a.a + t.b;
          };
          try {
            e.sureMapOwnOnly(a, t, "msg");
          } catch (e) {
            err = e;
          }
          r.identical(err instanceof Error, !0), r.identical(e.strHas(err.message, 'msg "d"'), !0), 
          r.case = "check error message, msg string & msg routine", a = {
            "a": 13,
            "b": 77,
            "c": 3,
            "d": "Mikle"
          }, t = {
            "a": 13,
            "b": 77,
            "c": 3,
            "name": "Hello"
          }, n = function() {
            return a.a + t.b;
          };
          try {
            e.sureMapOwnOnly(a, t, "msg", n);
          } catch (e) {
            err = e;
          }
          r.identical(err instanceof Error, !0), r.identical(e.strHas(err.message, 'msg 90 "d"'), !0), 
          r.case = "check error message, msg routine", a = {
            "a": 13,
            "b": 77,
            "c": 3,
            "d": "Mikle"
          }, t = {
            "a": 13,
            "b": 77,
            "c": 3,
            "name": "Hello"
          }, n = function() {
            return a.a + t.b;
          };
          try {
            e.sureMapOwnOnly(a, t, () => "This is explanation");
          } catch (e) {
            err = e;
          }
          r.identical(err instanceof Error, !0), r.identical(e.strHas(err.message, 'This is explanation "d"'), !0), 
          r.case = "check error message, five or more arguments", a = {
            "a": 13,
            "b": 77,
            "c": 3,
            "d": "Mikle"
          }, t = {
            "a": 13,
            "b": 77,
            "c": 3,
            "name": "Hello"
          }, n = function() {
            return a.a + t.b;
          };
          try {
            e.sureMapOwnOnly(a, t, n, "msg", "msg");
          } catch (e) {
            err = e;
          }
          r.identical(err instanceof Error, !0), r.identical(e.strHas(err.message, "Expects two, three or four arguments"), !0);
        }
        //
        ,
        sureMapHasAll: function sureMapHasAll(r) {
          r.case = "correct input";
          var a = {
            "a": 13,
            "b": 77,
            "c": 3,
            "d": "Mikle"
          }, s = {
            "a": 13,
            "b": 77,
            "c": 3,
            "d": "Mikle"
          }, n = function() {
            return a.a + t.b;
          };
          r.identical(e.sureMapHasAll(a, s), !0), r.identical(e.sureMapHasAll(a, s, n), !0), 
          r.identical(e.sureMapHasAll(a, s, n, "msg"), !0), r.identical(e.sureMapHasAll(a, s, () => "This is explanation"), !0), 
          r.case = "check error message, no msg", a = {
            "a": 13,
            "b": 77,
            "c": 3,
            "d": "Mikle"
          };
          var t = {
            "a": 13,
            "b": 77,
            "c": 3,
            "name": "Hello"
          };
          try {
            e.sureMapHasAll(a, t);
          } catch (e) {
            err = e;
          }
          r.identical(err instanceof Error, !0), r.identical(e.strHas(err.message, 'Object should have fields : "name"'), !0), 
          r.case = "check error message, msg routine", a = {
            "a": 13,
            "b": 77,
            "c": 3,
            "d": "Mikle"
          }, t = {
            "a": 13,
            "b": 77,
            "c": 3,
            "name": "Hello"
          }, n = function() {
            return a.a + t.b;
          };
          try {
            e.sureMapHasAll(a, t, n);
          } catch (e) {
            err = e;
          }
          r.identical(err instanceof Error, !0), r.identical(e.strHas(err.message, '90 "name"'), !0), 
          r.case = "check error message, msg string", a = {
            "a": 13,
            "b": 77,
            "c": 3,
            "d": "Mikle"
          }, t = {
            "a": 13,
            "b": 77,
            "c": 3,
            "name": "Hello"
          }, n = function() {
            return a.a + t.b;
          };
          try {
            e.sureMapHasAll(a, t, "msg");
          } catch (e) {
            err = e;
          }
          r.identical(err instanceof Error, !0), r.identical(e.strHas(err.message, 'msg "name"'), !0), 
          r.case = "check error message, msg string & msg routine", a = {
            "a": 13,
            "b": 77,
            "c": 3,
            "d": "Mikle"
          }, t = {
            "a": 13,
            "b": 77,
            "c": 3,
            "name": "Hello"
          }, n = function() {
            return a.a + t.b;
          };
          try {
            e.sureMapHasAll(a, t, "msg", n);
          } catch (e) {
            err = e;
          }
          r.identical(err instanceof Error, !0), r.identical(e.strHas(err.message, 'msg 90 "name"'), !0), 
          r.case = "check error message, msg routine", a = {
            "a": 13,
            "b": 77,
            "c": 3,
            "d": "Mikle"
          }, t = {
            "a": 13,
            "b": 77,
            "c": 3,
            "name": "Hello"
          }, n = function() {
            return a.a + t.b;
          };
          try {
            e.sureMapHasAll(a, t, () => "This is explanation");
          } catch (e) {
            err = e;
          }
          r.identical(err instanceof Error, !0), r.identical(e.strHas(err.message, 'This is explanation "name"'), !0), 
          r.case = "check error message, five or more arguments", a = {
            "a": 13,
            "b": 77,
            "c": 3,
            "d": "Mikle"
          }, t = {
            "a": 13,
            "b": 77,
            "c": 3,
            "name": "Hello"
          }, n = function() {
            return a.a + t.b;
          };
          try {
            e.sureMapHasAll(a, t, n, "msg", "msg");
          } catch (e) {
            err = e;
          }
          r.identical(err instanceof Error, !0), r.identical(e.strHas(err.message, "Expects two, three or four arguments"), !0);
        }
        //
        ,
        sureMapOwnAll: function sureMapOwnAll(r) {
          r.case = "correct input";
          var a = {
            "a": 13,
            "b": 77,
            "c": 3,
            "d": "Mikle"
          }, s = {
            "a": 13,
            "b": 77,
            "c": 3,
            "d": "Mikle"
          }, n = function() {
            return a.a + t.b;
          };
          r.identical(e.sureMapOwnAll(a, s), !0), r.identical(e.sureMapOwnAll(a, s, n), !0), 
          r.identical(e.sureMapOwnAll(a, s, n, "msg"), !0), r.identical(e.sureMapOwnAll(a, s, () => "This is explanation"), !0), 
          r.case = "check error message, no msg", a = {
            "a": 13,
            "b": 77,
            "c": 3,
            "d": "Mikle"
          };
          var t = {
            "a": 13,
            "b": 77,
            "c": 3,
            "name": "Hello"
          };
          try {
            e.sureMapOwnAll(a, t);
          } catch (e) {
            err = e;
          }
          r.identical(err instanceof Error, !0), r.identical(e.strHas(err.message, 'Object should own fields : "name"'), !0), 
          r.case = "check error message, msg routine", a = {
            "a": 13,
            "b": 77,
            "c": 3,
            "d": "Mikle"
          }, t = {
            "a": 13,
            "b": 77,
            "c": 3,
            "name": "Hello"
          }, n = function() {
            return a.a + t.b;
          };
          try {
            e.sureMapOwnAll(a, t, n);
          } catch (e) {
            err = e;
          }
          r.identical(err instanceof Error, !0), r.identical(e.strHas(err.message, '90 "name"'), !0), 
          r.case = "check error message, msg string", a = {
            "a": 13,
            "b": 77,
            "c": 3,
            "d": "Mikle"
          }, t = {
            "a": 13,
            "b": 77,
            "c": 3,
            "name": "Hello"
          }, n = function() {
            return a.a + t.b;
          };
          try {
            e.sureMapOwnAll(a, t, "msg");
          } catch (e) {
            err = e;
          }
          r.identical(err instanceof Error, !0), r.identical(e.strHas(err.message, 'msg "name"'), !0), 
          r.case = "check error message, msg string & msg routine", a = {
            "a": 13,
            "b": 77,
            "c": 3,
            "d": "Mikle"
          }, t = {
            "a": 13,
            "b": 77,
            "c": 3,
            "name": "Hello"
          }, n = function() {
            return a.a + t.b;
          };
          try {
            e.sureMapOwnAll(a, t, "msg", n);
          } catch (e) {
            err = e;
          }
          r.identical(err instanceof Error, !0), r.identical(e.strHas(err.message, 'msg 90 "name"'), !0), 
          r.case = "check error message, msg routine", a = {
            "a": 13,
            "b": 77,
            "c": 3,
            "d": "Mikle"
          }, t = {
            "a": 13,
            "b": 77,
            "c": 3,
            "name": "Hello"
          }, n = function() {
            return a.a + t.b;
          };
          try {
            e.sureMapOwnAll(a, t, () => "This is explanation");
          } catch (e) {
            err = e;
          }
          r.identical(err instanceof Error, !0), r.identical(e.strHas(err.message, 'This is explanation "name"'), !0), 
          r.case = "check error message, five or more arguments", a = {
            "a": 13,
            "b": 77,
            "c": 3,
            "d": "Mikle"
          }, t = {
            "a": 13,
            "b": 77,
            "c": 3,
            "name": "Hello"
          }, n = function() {
            return a.a + t.b;
          };
          try {
            e.sureMapOwnAll(a, t, n, "msg", "msg");
          } catch (e) {
            err = e;
          }
          r.identical(err instanceof Error, !0), r.identical(e.strHas(err.message, "Expects two, three or four arguments"), !0);
        }
        //
        ,
        sureMapHasNone: function sureMapHasNone(r) {
          r.case = "correct input";
          var a = {
            "a": 13,
            "b": 77,
            "c": 3,
            "d": "Mikle"
          }, s = {
            "e": 13,
            "f": 77,
            "g": 3,
            "h": "Mikle"
          }, n = function() {
            return a.a + t.b;
          };
          r.identical(e.sureMapHasNone(a, s), !0), r.identical(e.sureMapHasNone(a, s, n), !0), 
          r.identical(e.sureMapHasNone(a, s, n, "msg"), !0), r.identical(e.sureMapHasNone(a, s, () => "This is explanation"), !0), 
          r.case = "check error message, no msg", a = {
            "a": 13,
            "b": 77,
            "c": 3,
            "d": "Mikle"
          };
          var t = {
            "a": 13,
            "b": 77,
            "c": 3,
            "name": "Hello"
          };
          try {
            e.sureMapHasNone(a, t);
          } catch (e) {
            err = e;
          }
          r.identical(err instanceof Error, !0), r.identical(e.strHas(err.message, 'Object should have no fields : "a", "b", "c"'), !0), 
          r.case = "check error message, msg routine", a = {
            "a": 13,
            "b": 77,
            "c": 3,
            "d": "Mikle"
          }, t = {
            "a": 13,
            "b": 77,
            "c": 3,
            "name": "Hello"
          }, n = function() {
            return a.a + t.b;
          };
          try {
            e.sureMapHasNone(a, t, n);
          } catch (e) {
            err = e;
          }
          r.identical(err instanceof Error, !0), r.identical(e.strHas(err.message, '90 "a", "b", "c"'), !0), 
          r.case = "check error message, msg string", a = {
            "a": 13,
            "b": 77,
            "c": 3,
            "d": "Mikle"
          }, t = {
            "a": 13,
            "b": 77,
            "c": 3,
            "name": "Hello"
          }, n = function() {
            return a.a + t.b;
          };
          try {
            e.sureMapHasNone(a, t, "msg");
          } catch (e) {
            err = e;
          }
          r.identical(err instanceof Error, !0), r.identical(e.strHas(err.message, 'msg "a", "b", "c"'), !0), 
          r.case = "check error message, msg string & msg routine", a = {
            "a": 13,
            "b": 77,
            "c": 3,
            "d": "Mikle"
          }, t = {
            "a": 13,
            "b": 77,
            "c": 3,
            "name": "Hello"
          }, n = function() {
            return a.a + t.b;
          };
          try {
            e.sureMapHasNone(a, t, "msg", n);
          } catch (e) {
            err = e;
          }
          r.identical(err instanceof Error, !0), r.identical(e.strHas(err.message, 'msg 90 "a", "b", "c"'), !0), 
          r.case = "check error message, msg routine", a = {
            "a": 13,
            "b": 77,
            "c": 3,
            "d": "Mikle"
          }, t = {
            "a": 13,
            "b": 77,
            "c": 3,
            "name": "Hello"
          }, n = function() {
            return a.a + t.b;
          };
          try {
            e.sureMapHasNone(a, t, () => "This is explanation");
          } catch (e) {
            err = e;
          }
          r.identical(err instanceof Error, !0), r.identical(e.strHas(err.message, 'This is explanation "a", "b", "c"'), !0), 
          r.case = "check error message, five or more arguments", a = {
            "a": 13,
            "b": 77,
            "c": 3,
            "d": "Mikle"
          }, t = {
            "a": 13,
            "b": 77,
            "c": 3,
            "name": "Hello"
          }, n = function() {
            return a.a + t.b;
          };
          try {
            e.sureMapHasNone(a, t, n, "msg", "msg");
          } catch (e) {
            err = e;
          }
          r.identical(err instanceof Error, !0), r.identical(e.strHas(err.message, "Expects two, three or four arguments"), !0);
        }
        //
        ,
        sureMapOwnNone: function sureMapOwnNone(r) {
          r.case = "correct input";
          var a = {
            "a": 13,
            "b": 77,
            "c": 3,
            "d": "Mikle"
          }, s = {
            "e": 13,
            "f": 77,
            "g": 3,
            "h": "Mikle"
          }, n = function() {
            return a.a + t.b;
          };
          r.identical(e.sureMapOwnNone(a, s), !0), r.identical(e.sureMapOwnNone(a, s, n), !0), 
          r.identical(e.sureMapOwnNone(a, s, n, "msg"), !0), r.identical(e.sureMapOwnNone(a, s, () => "This is explanation"), !0), 
          r.case = "check error message, no msg", a = {
            "a": 13,
            "b": 77,
            "c": 3,
            "d": "Mikle"
          };
          var t = {
            "a": 13,
            "b": 77,
            "c": 3,
            "name": "Hello"
          };
          try {
            e.sureMapOwnNone(a, t);
          } catch (e) {
            err = e;
          }
          r.identical(err instanceof Error, !0), r.identical(e.strHas(err.message, 'Object should own no fields : "a", "b", "c"'), !0), 
          r.case = "check error message, msg routine", a = {
            "a": 13,
            "b": 77,
            "c": 3,
            "d": "Mikle"
          }, t = {
            "a": 13,
            "b": 77,
            "c": 3,
            "name": "Hello"
          }, n = function() {
            return a.a + t.b;
          };
          try {
            e.sureMapOwnNone(a, t, n);
          } catch (e) {
            err = e;
          }
          r.identical(err instanceof Error, !0), r.identical(e.strHas(err.message, '90 "a", "b", "c"'), !0), 
          r.case = "check error message, msg string", a = {
            "a": 13,
            "b": 77,
            "c": 3,
            "d": "Mikle"
          }, t = {
            "a": 13,
            "b": 77,
            "c": 3,
            "name": "Hello"
          }, n = function() {
            return a.a + t.b;
          };
          try {
            e.sureMapOwnNone(a, t, "msg");
          } catch (e) {
            err = e;
          }
          r.identical(err instanceof Error, !0), r.identical(e.strHas(err.message, 'msg "a", "b", "c"'), !0), 
          r.case = "check error message, msg string & msg routine", a = {
            "a": 13,
            "b": 77,
            "c": 3,
            "d": "Mikle"
          }, t = {
            "a": 13,
            "b": 77,
            "c": 3,
            "name": "Hello"
          }, n = function() {
            return a.a + t.b;
          };
          try {
            e.sureMapOwnNone(a, t, "msg", n);
          } catch (e) {
            err = e;
          }
          r.identical(err instanceof Error, !0), r.identical(e.strHas(err.message, 'msg 90 "a", "b", "c"'), !0), 
          r.case = "check error message, msg routine", a = {
            "a": 13,
            "b": 77,
            "c": 3,
            "d": "Mikle"
          }, t = {
            "a": 13,
            "b": 77,
            "c": 3,
            "name": "Hello"
          }, n = function() {
            return a.a + t.b;
          };
          try {
            e.sureMapOwnNone(a, t, () => "This is explanation");
          } catch (e) {
            err = e;
          }
          r.identical(err instanceof Error, !0), r.identical(e.strHas(err.message, 'This is explanation "a", "b", "c"'), !0), 
          r.case = "check error message, five or more arguments", a = {
            "a": 13,
            "b": 77,
            "c": 3,
            "d": "Mikle"
          }, t = {
            "a": 13,
            "b": 77,
            "c": 3,
            "name": "Hello"
          }, n = function() {
            return a.a + t.b;
          };
          try {
            e.sureMapOwnNone(a, t, n, "msg", "msg");
          } catch (e) {
            err = e;
          }
          r.identical(err instanceof Error, !0), r.identical(e.strHas(err.message, "Expects two, three or four arguments"), !0);
        }
        //
        ,
        sureMapHasNoUndefine: function sureMapHasNoUndefine(r) {
          r.case = "correct input";
          var a = {
            "a": 13,
            "b": 77,
            "c": 3,
            "d": "Mikle"
          }, s = function() {
            return a.a + a.b;
          };
          r.identical(e.sureMapHasNoUndefine(a), !0), r.identical(e.sureMapHasNoUndefine(a, s), !0), 
          r.identical(e.sureMapHasNoUndefine(a, s, "msg"), !0), r.identical(e.sureMapHasNoUndefine(a, () => "This is explanation"), !0), 
          r.case = "check error message, no msg";
          var n = {
            "d": void 0
          };
          try {
            e.sureMapHasNoUndefine(n);
          } catch (e) {
            err = e;
          }
          r.identical(err instanceof Error, !0), r.identical(e.strHas(err.message, 'Object should have no undefines, but has : "d"'), !0), 
          r.case = "check error message, msg routine", n = {
            "d": void 0
          }, s = function() {
            return a.a + a.b;
          };
          try {
            e.sureMapHasNoUndefine(n, s);
          } catch (e) {
            err = e;
          }
          r.identical(err instanceof Error, !0), r.identical(e.strHas(err.message, '90 "d"'), !0), 
          r.case = "check error message, msg string", n = {
            "d": void 0
          };
          try {
            e.sureMapHasNoUndefine(n, "msg");
          } catch (e) {
            err = e;
          }
          r.identical(err instanceof Error, !0), r.identical(e.strHas(err.message, 'msg "d"'), !0), 
          r.case = "check error message, msg string & msg routine", n = {
            "d": void 0
          }, s = function() {
            return a.a + a.b;
          };
          try {
            e.sureMapHasNoUndefine(n, "msg", s);
          } catch (e) {
            err = e;
          }
          r.identical(err instanceof Error, !0), r.identical(e.strHas(err.message, 'msg 90 "d"'), !0), 
          r.case = "check error message, msg routine", n = {
            "d": void 0
          }, s = function() {
            return a.a + a.b;
          };
          try {
            e.sureMapHasNoUndefine(n, () => "This is explanation");
          } catch (e) {
            err = e;
          }
          r.identical(err instanceof Error, !0), r.identical(e.strHas(err.message, 'This is explanation "d"'), !0), 
          r.case = "check error message, four or more arguments", n = {
            "d": void 0
          }, s = function() {
            return a.a + a.b;
          };
          try {
            e.sureMapHasNoUndefine(a, s, "msg", "msg");
          } catch (e) {
            err = e;
          }
          r.identical(err instanceof Error, !0), r.identical(e.strHas(err.message, "Expects one, two or three arguments"), !0);
        }
        //
        ,
        // test assertMap*  
        assertMapHasFields: function assertMapHasFields(r) {
          r.case = "correct input";
          var a = {
            "a": 13,
            "b": 77,
            "c": 3,
            "d": "Mikle"
          }, s = {
            "a": 13,
            "b": 77,
            "c": 3,
            "d": "Mikle"
          }, n = function() {
            return a.a + t.b;
          };
          r.identical(e.assertMapHasFields(a, s), !0), r.identical(e.assertMapHasFields(a, s, n), !0), 
          r.identical(e.assertMapHasFields(a, s, n, "msg"), !0), r.identical(e.assertMapHasFields(a, s, () => "This is explanation"), !0), 
          r.case = "check error message, no msg", a = {
            "a": 13,
            "b": 77,
            "c": 3,
            "d": "Mikle"
          };
          var t = {
            "a": 13,
            "b": 77,
            "c": 3,
            "name": "Hello"
          };
          try {
            e.assertMapHasFields(a, t);
          } catch (e) {
            err = e;
          }
          r.identical(err instanceof Error, !0), r.identical(e.strHas(err.message, 'Object should have no fields : "d"'), !0), 
          r.case = "check error message, msg routine", a = {
            "a": 13,
            "b": 77,
            "c": 3,
            "d": "Mikle"
          }, t = {
            "a": 13,
            "b": 77,
            "c": 3,
            "name": "Hello"
          }, n = function() {
            return a.a + t.b;
          };
          try {
            e.assertMapHasFields(a, t, n);
          } catch (e) {
            err = e;
          }
          r.identical(err instanceof Error, !0), r.identical(e.strHas(err.message, '90 "d"'), !0), 
          r.case = "check error message, msg string", a = {
            "a": 13,
            "b": 77,
            "c": 3,
            "d": "Mikle"
          }, t = {
            "a": 13,
            "b": 77,
            "c": 3,
            "name": "Hello"
          }, n = function() {
            return a.a + t.b;
          };
          try {
            e.assertMapHasFields(a, t, "msg");
          } catch (e) {
            err = e;
          }
          r.identical(err instanceof Error, !0), r.identical(e.strHas(err.message, 'msg "d"'), !0), 
          r.case = "check error message, msg string & msg routine", a = {
            "a": 13,
            "b": 77,
            "c": 3,
            "d": "Mikle"
          }, t = {
            "a": 13,
            "b": 77,
            "c": 3,
            "name": "Hello"
          }, n = function() {
            return a.a + t.b;
          };
          try {
            e.assertMapHasFields(a, t, "msg", n);
          } catch (e) {
            err = e;
          }
          r.identical(err instanceof Error, !0), r.identical(e.strHas(err.message, 'msg 90 "d"'), !0), 
          r.case = "check error message, msg routine", a = {
            "a": 13,
            "b": 77,
            "c": 3,
            "d": "Mikle"
          }, t = {
            "a": 13,
            "b": 77,
            "c": 3,
            "name": "Hello"
          }, n = function() {
            return a.a + t.b;
          };
          try {
            e.assertMapHasFields(a, t, () => "This is explanation");
          } catch (e) {
            err = e;
          }
          r.identical(err instanceof Error, !0), r.identical(e.strHas(err.message, 'This is explanation "d"'), !0), 
          r.case = "check error message, five or more arguments", a = {
            "a": 13,
            "b": 77,
            "c": 3,
            "d": "Mikle"
          }, t = {
            "a": 13,
            "b": 77,
            "c": 3,
            "name": "Hello"
          }, n = function() {
            return a.a + t.b;
          };
          try {
            e.assertMapHasFields(a, t, n, "msg", "msg");
          } catch (e) {
            err = e;
          }
          r.identical(err instanceof Error, !0), r.identical(e.strHas(err.message, "Expects two, three or four arguments"), !0);
        }
        //
        ,
        assertMapOwnFields: function assertMapOwnFields(r) {
          r.case = "correct input";
          var a = {
            "a": 13,
            "b": 77,
            "c": 3,
            "d": "Mikle"
          }, s = {
            "a": 13,
            "b": 77,
            "c": 3,
            "d": "Mikle"
          }, n = function() {
            return a.a + t.b;
          };
          r.identical(e.assertMapOwnFields(a, s), !0), r.identical(e.assertMapOwnFields(a, s, n), !0), 
          r.identical(e.assertMapOwnFields(a, s, n, "msg"), !0), r.identical(e.assertMapOwnFields(a, s, () => "This is explanation"), !0), 
          r.case = "check error message, no msg", a = {
            "a": 13,
            "b": 77,
            "c": 3,
            "d": "Mikle"
          };
          var t = {
            "a": 13,
            "b": 77,
            "c": 3,
            "name": "Hello"
          };
          try {
            e.assertMapOwnFields(a, t);
          } catch (e) {
            err = e;
          }
          r.identical(err instanceof Error, !0), r.identical(e.strHas(err.message, 'Object should own no fields : "d"'), !0), 
          r.case = "check error message, msg routine", a = {
            "a": 13,
            "b": 77,
            "c": 3,
            "d": "Mikle"
          }, t = {
            "a": 13,
            "b": 77,
            "c": 3,
            "name": "Hello"
          }, n = function() {
            return a.a + t.b;
          };
          try {
            e.assertMapOwnFields(a, t, n);
          } catch (e) {
            err = e;
          }
          r.identical(err instanceof Error, !0), r.identical(e.strHas(err.message, '90 "d"'), !0), 
          r.case = "check error message, msg string", a = {
            "a": 13,
            "b": 77,
            "c": 3,
            "d": "Mikle"
          }, t = {
            "a": 13,
            "b": 77,
            "c": 3,
            "name": "Hello"
          }, n = function() {
            return a.a + t.b;
          };
          try {
            e.assertMapOwnFields(a, t, "msg");
          } catch (e) {
            err = e;
          }
          r.identical(err instanceof Error, !0), r.identical(e.strHas(err.message, 'msg "d"'), !0), 
          r.case = "check error message, msg string & msg routine", a = {
            "a": 13,
            "b": 77,
            "c": 3,
            "d": "Mikle"
          }, t = {
            "a": 13,
            "b": 77,
            "c": 3,
            "name": "Hello"
          }, n = function() {
            return a.a + t.b;
          };
          try {
            e.assertMapOwnFields(a, t, "msg", n);
          } catch (e) {
            err = e;
          }
          r.identical(err instanceof Error, !0), r.identical(e.strHas(err.message, 'msg 90 "d"'), !0), 
          r.case = "check error message, msg routine", a = {
            "a": 13,
            "b": 77,
            "c": 3,
            "d": "Mikle"
          }, t = {
            "a": 13,
            "b": 77,
            "c": 3,
            "name": "Hello"
          }, n = function() {
            return a.a + t.b;
          };
          try {
            e.assertMapOwnFields(a, t, () => "This is explanation");
          } catch (e) {
            err = e;
          }
          r.identical(err instanceof Error, !0), r.identical(e.strHas(err.message, 'This is explanation "d"'), !0), 
          r.case = "check error message, five or more arguments", a = {
            "a": 13,
            "b": 77,
            "c": 3,
            "d": "Mikle"
          }, t = {
            "a": 13,
            "b": 77,
            "c": 3,
            "name": "Hello"
          }, n = function() {
            return a.a + t.b;
          };
          try {
            e.assertMapOwnFields(a, t, n, "msg", "msg");
          } catch (e) {
            err = e;
          }
          r.identical(err instanceof Error, !0), r.identical(e.strHas(err.message, "Expects two, three or four arguments"), !0);
        }
        //
        ,
        assertMapHasOnly: function assertMapHasOnly(r) {
          r.case = "correct input";
          var a = {
            "a": 13,
            "b": 77,
            "c": 3,
            "d": "Mikle"
          }, s = {
            "a": 13,
            "b": 77,
            "c": 3,
            "d": "Mikle"
          }, n = function() {
            return a.a + t.b;
          };
          r.identical(e.assertMapHasOnly(a, s), !0), r.identical(e.assertMapHasOnly(a, s, n), !0), 
          r.identical(e.assertMapHasOnly(a, s, n, "msg"), !0), r.identical(e.assertMapHasOnly(a, s, () => "This is explanation"), !0), 
          r.case = "check error message, no msg", a = {
            "a": 13,
            "b": 77,
            "c": 3,
            "d": "Mikle"
          };
          var t = {
            "a": 13,
            "b": 77,
            "c": 3,
            "name": "Hello"
          };
          try {
            e.assertMapHasOnly(a, t);
          } catch (e) {
            err = e;
          }
          r.identical(err instanceof Error, !0), r.identical(e.strHas(err.message, 'Object should have no fields : "d"'), !0), 
          r.case = "check error message, msg routine", a = {
            "a": 13,
            "b": 77,
            "c": 3,
            "d": "Mikle"
          }, t = {
            "a": 13,
            "b": 77,
            "c": 3,
            "name": "Hello"
          }, n = function() {
            return a.a + t.b;
          };
          try {
            e.assertMapHasOnly(a, t, n);
          } catch (e) {
            err = e;
          }
          r.identical(err instanceof Error, !0), r.identical(e.strHas(err.message, '90 "d"'), !0), 
          r.case = "check error message, msg string", a = {
            "a": 13,
            "b": 77,
            "c": 3,
            "d": "Mikle"
          }, t = {
            "a": 13,
            "b": 77,
            "c": 3,
            "name": "Hello"
          }, n = function() {
            return a.a + t.b;
          };
          try {
            e.assertMapHasOnly(a, t, "msg");
          } catch (e) {
            err = e;
          }
          r.identical(err instanceof Error, !0), r.identical(e.strHas(err.message, 'msg "d"'), !0), 
          r.case = "check error message, msg string & msg routine", a = {
            "a": 13,
            "b": 77,
            "c": 3,
            "d": "Mikle"
          }, t = {
            "a": 13,
            "b": 77,
            "c": 3,
            "name": "Hello"
          }, n = function() {
            return a.a + t.b;
          };
          try {
            e.assertMapHasOnly(a, t, "msg", n);
          } catch (e) {
            err = e;
          }
          r.identical(err instanceof Error, !0), r.identical(e.strHas(err.message, 'msg 90 "d"'), !0), 
          r.case = "check error message, msg routine", a = {
            "a": 13,
            "b": 77,
            "c": 3,
            "d": "Mikle"
          }, t = {
            "a": 13,
            "b": 77,
            "c": 3,
            "name": "Hello"
          }, n = function() {
            return a.a + t.b;
          };
          try {
            e.assertMapHasOnly(a, t, () => "This is explanation");
          } catch (e) {
            err = e;
          }
          r.identical(err instanceof Error, !0), r.identical(e.strHas(err.message, 'This is explanation "d"'), !0), 
          r.case = "check error message, five or more arguments", a = {
            "a": 13,
            "b": 77,
            "c": 3,
            "d": "Mikle"
          }, t = {
            "a": 13,
            "b": 77,
            "c": 3,
            "name": "Hello"
          }, n = function() {
            return a.a + t.b;
          };
          try {
            e.assertMapHasOnly(a, t, n, "msg", "msg");
          } catch (e) {
            err = e;
          }
          r.identical(err instanceof Error, !0), r.identical(e.strHas(err.message, "Expects two, three or four arguments"), !0);
        }
        //
        ,
        assertMapOwnOnly: function assertMapOwnOnly(r) {
          r.case = "correct input";
          var a = {
            "a": 13,
            "b": 77,
            "c": 3,
            "d": "Mikle"
          }, s = {
            "a": 13,
            "b": 77,
            "c": 3,
            "d": "Mikle"
          }, n = function() {
            return a.a + t.b;
          };
          r.identical(e.assertMapOwnOnly(a, s), !0), r.identical(e.assertMapOwnOnly(a, s, n), !0), 
          r.identical(e.assertMapOwnOnly(a, s, n, "msg"), !0), r.identical(e.assertMapOwnOnly(a, s, () => "This is explanation"), !0), 
          r.case = "check error message, no msg", a = {
            "a": 13,
            "b": 77,
            "c": 3,
            "d": "Mikle"
          };
          var t = {
            "a": 13,
            "b": 77,
            "c": 3,
            "name": "Hello"
          };
          try {
            e.assertMapOwnOnly(a, t);
          } catch (e) {
            err = e;
          }
          r.identical(err instanceof Error, !0), r.identical(e.strHas(err.message, 'Object should own no fields : "d"'), !0), 
          r.case = "check error message, msg routine", a = {
            "a": 13,
            "b": 77,
            "c": 3,
            "d": "Mikle"
          }, t = {
            "a": 13,
            "b": 77,
            "c": 3,
            "name": "Hello"
          }, n = function() {
            return a.a + t.b;
          };
          try {
            e.assertMapOwnOnly(a, t, n);
          } catch (e) {
            err = e;
          }
          r.identical(err instanceof Error, !0), r.identical(e.strHas(err.message, '90 "d"'), !0), 
          r.case = "check error message, msg string", a = {
            "a": 13,
            "b": 77,
            "c": 3,
            "d": "Mikle"
          }, t = {
            "a": 13,
            "b": 77,
            "c": 3,
            "name": "Hello"
          }, n = function() {
            return a.a + t.b;
          };
          try {
            e.assertMapOwnOnly(a, t, "msg");
          } catch (e) {
            err = e;
          }
          r.identical(err instanceof Error, !0), r.identical(e.strHas(err.message, 'msg "d"'), !0), 
          r.case = "check error message, msg string & msg routine", a = {
            "a": 13,
            "b": 77,
            "c": 3,
            "d": "Mikle"
          }, t = {
            "a": 13,
            "b": 77,
            "c": 3,
            "name": "Hello"
          }, n = function() {
            return a.a + t.b;
          };
          try {
            e.assertMapOwnOnly(a, t, "msg", n);
          } catch (e) {
            err = e;
          }
          r.identical(err instanceof Error, !0), r.identical(e.strHas(err.message, 'msg 90 "d"'), !0), 
          r.case = "check error message, msg routine", a = {
            "a": 13,
            "b": 77,
            "c": 3,
            "d": "Mikle"
          }, t = {
            "a": 13,
            "b": 77,
            "c": 3,
            "name": "Hello"
          }, n = function() {
            return a.a + t.b;
          };
          try {
            e.assertMapOwnOnly(a, t, () => "This is explanation");
          } catch (e) {
            err = e;
          }
          r.identical(err instanceof Error, !0), r.identical(e.strHas(err.message, 'This is explanation "d"'), !0), 
          r.case = "check error message, five or more arguments", a = {
            "a": 13,
            "b": 77,
            "c": 3,
            "d": "Mikle"
          }, t = {
            "a": 13,
            "b": 77,
            "c": 3,
            "name": "Hello"
          }, n = function() {
            return a.a + t.b;
          };
          try {
            e.assertMapOwnOnly(a, t, n, "msg", "msg");
          } catch (e) {
            err = e;
          }
          r.identical(err instanceof Error, !0), r.identical(e.strHas(err.message, "Expects two, three or four arguments"), !0);
        }
        //
        ,
        assertMapHasNone: function assertMapHasNone(r) {
          r.case = "correct input";
          var a = {
            "a": 13,
            "b": 77,
            "c": 3,
            "d": "Mikle"
          }, s = {
            "e": 13,
            "f": 77,
            "g": 3,
            "h": "Mikle"
          }, n = function() {
            return a.a + t.b;
          };
          r.identical(e.assertMapHasNone(a, s), !0), r.identical(e.assertMapHasNone(a, s, n), !0), 
          r.identical(e.assertMapHasNone(a, s, n, "msg"), !0), r.identical(e.assertMapHasNone(a, s, () => "This is explanation"), !0), 
          r.case = "check error message, no msg", a = {
            "a": 13,
            "b": 77,
            "c": 3,
            "d": "Mikle"
          };
          var t = {
            "a": 13,
            "b": 77,
            "c": 3,
            "name": "Hello"
          };
          try {
            e.assertMapHasNone(a, t);
          } catch (e) {
            err = e;
          }
          r.identical(err instanceof Error, !0), r.identical(e.strHas(err.message, 'Object should have no fields : "a", "b", "c"'), !0), 
          r.case = "check error message, msg routine", a = {
            "a": 13,
            "b": 77,
            "c": 3,
            "d": "Mikle"
          }, t = {
            "a": 13,
            "b": 77,
            "c": 3,
            "name": "Hello"
          }, n = function() {
            return a.a + t.b;
          };
          try {
            e.assertMapHasNone(a, t, n);
          } catch (e) {
            err = e;
          }
          r.identical(err instanceof Error, !0), r.identical(e.strHas(err.message, '90 "a", "b", "c"'), !0), 
          r.case = "check error message, msg string", a = {
            "a": 13,
            "b": 77,
            "c": 3,
            "d": "Mikle"
          }, t = {
            "a": 13,
            "b": 77,
            "c": 3,
            "name": "Hello"
          }, n = function() {
            return a.a + t.b;
          };
          try {
            e.assertMapHasNone(a, t, "msg");
          } catch (e) {
            err = e;
          }
          r.identical(err instanceof Error, !0), r.identical(e.strHas(err.message, 'msg "a", "b", "c"'), !0), 
          r.case = "check error message, msg string & msg routine", a = {
            "a": 13,
            "b": 77,
            "c": 3,
            "d": "Mikle"
          }, t = {
            "a": 13,
            "b": 77,
            "c": 3,
            "name": "Hello"
          }, n = function() {
            return a.a + t.b;
          };
          try {
            e.assertMapHasNone(a, t, "msg", n);
          } catch (e) {
            err = e;
          }
          r.identical(err instanceof Error, !0), r.identical(e.strHas(err.message, 'msg 90 "a", "b", "c"'), !0), 
          r.case = "check error message, msg routine", a = {
            "a": 13,
            "b": 77,
            "c": 3,
            "d": "Mikle"
          }, t = {
            "a": 13,
            "b": 77,
            "c": 3,
            "name": "Hello"
          }, n = function() {
            return a.a + t.b;
          };
          try {
            e.assertMapHasNone(a, t, () => "This is explanation");
          } catch (e) {
            err = e;
          }
          r.identical(err instanceof Error, !0), r.identical(e.strHas(err.message, 'This is explanation "a", "b", "c"'), !0), 
          r.case = "check error message, five or more arguments", a = {
            "a": 13,
            "b": 77,
            "c": 3,
            "d": "Mikle"
          }, t = {
            "a": 13,
            "b": 77,
            "c": 3,
            "name": "Hello"
          }, n = function() {
            return a.a + t.b;
          };
          try {
            e.assertMapHasNone(a, t, n, "msg", "msg");
          } catch (e) {
            err = e;
          }
          r.identical(err instanceof Error, !0), r.identical(e.strHas(err.message, "Expects two, three or four arguments"), !0);
        }
        //
        ,
        assertMapOwnNone: function assertMapOwnNone(r) {
          r.case = "correct input";
          var a = {
            "a": 13,
            "b": 77,
            "c": 3,
            "d": "Mikle"
          }, s = {
            "e": 13,
            "f": 77,
            "g": 3,
            "h": "Mikle"
          }, n = function() {
            return a.a + t.b;
          };
          r.identical(e.assertMapOwnNone(a, s), !0), r.identical(e.assertMapOwnNone(a, s, n), !0), 
          r.identical(e.assertMapOwnNone(a, s, n, "msg"), !0), r.identical(e.assertMapOwnNone(a, s, () => "This is explanation"), !0), 
          r.case = "check error message, no msg", a = {
            "a": 13,
            "b": 77,
            "c": 3,
            "d": "Mikle"
          };
          var t = {
            "a": 13,
            "b": 77,
            "c": 3,
            "name": "Hello"
          };
          try {
            e.assertMapOwnNone(a, t);
          } catch (e) {
            err = e;
          }
          r.identical(err instanceof Error, !0), r.identical(e.strHas(err.message, 'Object should own no fields : "a", "b", "c"'), !0), 
          r.case = "check error message, msg routine", a = {
            "a": 13,
            "b": 77,
            "c": 3,
            "d": "Mikle"
          }, t = {
            "a": 13,
            "b": 77,
            "c": 3,
            "name": "Hello"
          }, n = function() {
            return a.a + t.b;
          };
          try {
            e.assertMapOwnNone(a, t, n);
          } catch (e) {
            err = e;
          }
          r.identical(err instanceof Error, !0), r.identical(e.strHas(err.message, '90 "a", "b", "c"'), !0), 
          r.case = "check error message, msg string", a = {
            "a": 13,
            "b": 77,
            "c": 3,
            "d": "Mikle"
          }, t = {
            "a": 13,
            "b": 77,
            "c": 3,
            "name": "Hello"
          }, n = function() {
            return a.a + t.b;
          };
          try {
            e.assertMapOwnNone(a, t, "msg");
          } catch (e) {
            err = e;
          }
          r.identical(err instanceof Error, !0), r.identical(e.strHas(err.message, 'msg "a", "b", "c"'), !0), 
          r.case = "check error message, msg string & msg routine", a = {
            "a": 13,
            "b": 77,
            "c": 3,
            "d": "Mikle"
          }, t = {
            "a": 13,
            "b": 77,
            "c": 3,
            "name": "Hello"
          }, n = function() {
            return a.a + t.b;
          };
          try {
            e.assertMapOwnNone(a, t, "msg", n);
          } catch (e) {
            err = e;
          }
          r.identical(err instanceof Error, !0), r.identical(e.strHas(err.message, 'msg 90 "a", "b", "c"'), !0), 
          r.case = "check error message, msg routine", a = {
            "a": 13,
            "b": 77,
            "c": 3,
            "d": "Mikle"
          }, t = {
            "a": 13,
            "b": 77,
            "c": 3,
            "name": "Hello"
          }, n = function() {
            return a.a + t.b;
          };
          try {
            e.assertMapOwnNone(a, t, () => "This is explanation");
          } catch (e) {
            err = e;
          }
          r.identical(err instanceof Error, !0), r.identical(e.strHas(err.message, 'This is explanation "a", "b", "c"'), !0), 
          r.case = "check error message, five or more arguments", a = {
            "a": 13,
            "b": 77,
            "c": 3,
            "d": "Mikle"
          }, t = {
            "a": 13,
            "b": 77,
            "c": 3,
            "name": "Hello"
          }, n = function() {
            return a.a + t.b;
          };
          try {
            e.assertMapOwnNone(a, t, n, "msg", "msg");
          } catch (e) {
            err = e;
          }
          r.identical(err instanceof Error, !0), r.identical(e.strHas(err.message, "Expects two, three or four arguments"), !0);
        }
        //
        ,
        assertMapHasNoUndefine: function assertMapHasNoUndefine(r) {
          r.case = "correct input";
          var a = {
            "a": 13,
            "b": 77,
            "c": 3,
            "d": "Mikle"
          }, s = function() {
            return a.a + a.b;
          };
          r.identical(e.assertMapHasNoUndefine(a), !0), r.identical(e.assertMapHasNoUndefine(a, s), !0), 
          r.identical(e.assertMapHasNoUndefine(a, s, "msg"), !0), r.identical(e.assertMapHasNoUndefine(a, () => "This is explanation"), !0), 
          r.case = "check error message, no msg";
          var n = {
            "d": void 0
          };
          try {
            e.assertMapHasNoUndefine(n);
          } catch (e) {
            err = e;
          }
          r.identical(err instanceof Error, !0), r.identical(e.strHas(err.message, 'Object should have no undefines, but has : "d"'), !0), 
          r.case = "check error message, msg routine", n = {
            "d": void 0
          }, s = function() {
            return a.a + a.b;
          };
          try {
            e.assertMapHasNoUndefine(n, s);
          } catch (e) {
            err = e;
          }
          r.identical(err instanceof Error, !0), r.identical(e.strHas(err.message, '90 "d"'), !0), 
          r.case = "check error message, msg string", n = {
            "d": void 0
          };
          try {
            e.assertMapHasNoUndefine(n, "msg");
          } catch (e) {
            err = e;
          }
          r.identical(err instanceof Error, !0), r.identical(e.strHas(err.message, 'msg "d"'), !0), 
          r.case = "check error message, msg string & msg routine", n = {
            "d": void 0
          }, s = function() {
            return a.a + a.b;
          };
          try {
            e.assertMapHasNoUndefine(n, "msg", s);
          } catch (e) {
            err = e;
          }
          r.identical(err instanceof Error, !0), r.identical(e.strHas(err.message, 'msg 90 "d"'), !0), 
          r.case = "check error message, msg routine", n = {
            "d": void 0
          }, s = function() {
            return a.a + a.b;
          };
          try {
            e.assertMapHasNoUndefine(n, () => "This is explanation");
          } catch (e) {
            err = e;
          }
          r.identical(err instanceof Error, !0), r.identical(e.strHas(err.message, 'This is explanation "d"'), !0), 
          r.case = "check error message, four or more arguments", n = {
            "d": void 0
          }, s = function() {
            return a.a + a.b;
          };
          try {
            e.assertMapHasNoUndefine(a, s, "msg", "msg");
          } catch (e) {
            err = e;
          }
          r.identical(err instanceof Error, !0), r.identical(e.strHas(err.message, "Expects one, two or three arguments"), !0);
        }
        //
        ,
        //
        assert: function assert(r) {
          var a, s = "short error description", n = new RegExp(s);
          r.case = "assert successful condition";
          var t = e.assert(!0);
          r.identical(t, !0), r.case = "passed failure condition : should generates exception";
          try {
            e.assert(!1);
          } catch (e) {
            a = e;
          }
          r.identical(a instanceof Error, !0), r.case = "passed failure condition with passed message : should generates exception with message";
          try {
            e.assert(!1, s);
          } catch (e) {
            a = e;
          }
          r.identical(n.test(a.message), !0);
        },
        diagnosticStack: 
        //
        function diagnosticStack(r) {
          /* - */
          r.case = "trivial";
          var a = function function1() {
            return function function2() {
              return function function3() {
                debugger;
                return e.diagnosticStack();
              }();
            }();
          }();
          a = a.split("\n");
          debugger;
          [ "function3", "function2", "function1", "Diagnostics.test.s" ].forEach(function(e, s) {
            var n = new RegExp(e);
            r.description = e, r.identical(n.test(a[s]), !0);
          });
          debugger;
          /* - */
          // test.case = 'second';
          // var got = function1();
          // debugger;
          // got = got.split( '\n' ).slice( -5, -1 ).join( '\n' );
          // debugger;
          // expectedTrace.forEach( function( expectedStr, i )
          // {
          //   var expectedRegexp = new RegExp( expectedStr );
          //   test.identical( expectedRegexp.test( got[ i ] ), true );
          // });
                }
      }
    };
    r = wTestSuite(r), "undefined" == typeof module || module.parent || wTester.test(r.name);
  }();
  // == end of file DiagnosticsTestS
}();