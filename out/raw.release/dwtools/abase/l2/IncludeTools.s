!function IncludeToolsS() {
  // == begin of file IncludeToolsS
  !function _IncludeTools_s_() {
    "use strict";
    //
        //
    function _usePathGlobally(e, n, t) {
      if (l.assert(3 === arguments.length, "Expects exactly three arguments"), l.assert(l.arrayIs(n)), 
      -1 === t.indexOf(e)) {
        i || (i = require("module"));
        for (let e = 0; e < n.length; e++) -1 === i.globalPaths.indexOf(n[e]) && i.globalPaths.push(n[e]);
        // [].push.apply( Module.globalPaths, paths );
        /* patch parents */        for (;e; ) _usePathGloballyChildren(e, n, t), e = e.parent;
      }
    }
    //
        function _usePathGloballyChildren(e, n, t) {
      if (l.assert(3 === arguments.length, "Expects exactly three arguments"), l.assert(l.arrayIs(n)), 
      -1 === t.indexOf(e)) {
        t.push(e);
        for (let t = 0; t < n.length; t++) -1 === e.paths.indexOf(n[t]) && e.paths.push(n[t]);
        // [].push.apply( _module.paths, paths );
        /* patch parents */        if (e.children) for (var r = 0; r < e.children.length; r++) _usePathGloballyChildren(e.children[r], n, t);
      }
    }
    //
        function _includeWithRequireAct(n) {
      /* console.log( '_includeWithRequireAct', '"' + src + '"' ); */
      if (l.assert(1 === arguments.length, "Expects single argument"), l.assert(l.strIs(n), "include expects string"), 
      "undefined" == typeof module) throw l.err('Cant include, no "require".');
      try {
        // if( _.strHas( src, 'Consequence' ) )
        // debugger;
        return e(n);
      } catch (e) {
        debugger;
        throw l.err(e, "\n", "Cant require", n);
      }
    }
    //
        function _includeAct(e) {
      var n, t;
      if (l.assert(1 === arguments.length, "Expects single argument"), l.assert(l.strIs(e)), 
      r.ModulesRegistry[e] && (n = r.ModulesRegistry[e]), !n) return _includeWithRequireAny(e);
      /* */      if (n.isIncluded && n.isIncluded()) return n.returned;
      if (n.include) t = _includeWithRequire(n.include); else {
        if (!n.includeAny) throw l.err("Handler does not has ( include ) neither ( includeAny ).\nCant use the handler to include file", e);
        l.assert(l.arrayIs(n.includeAny), "include handler expect an array ( includeAny ) if present"), 
        t = _includeWithRequireAny.apply(l, n.includeAny);
      }
      return n.returned = t, t;
    }
    //
        function _includeAnyAct(t) {
      l.assert(1 === arguments.length, "Expects single argument"), l.assert(l.longIs(t));
      for (
      /* */
      var i = [], u = 0; u < t.length; u++) {
        var a = t[u], s = r.ModulesRegistry[a];
        if (s) {
          if (s.isIncluded && s.isIncluded()) return s.returned;
          if (s.include) {
            i.push({
              path: s.include,
              handler: s
            });
            debugger;
          } else {
            if (!s.includeAny) throw l.err("Handler does not has ( include ) neither ( includeAny ).\nCant use the handler to include file", a);
            l.assert(l.arrayIs(s.includeAny), "include handler expect an array ( includeAny ) if present");
            for (var d = 0; d < s.includeAny.length; d++) i.push({
              path: s.includeAny[d],
              handler: s
            });
          }
        } else i.push({
          path: a
        });
      }
      /* */      for (var c = 0; c < i.length; c++) {
        if ("" !== (a = i[c].path)) try {
          a = e.resolve(a);
        } catch (e) {
          if (c !== i.length - 1 && !n) continue;
        }
        if (c === i.length - 1 && "" === a) return;
        var h = _includeWithRequireAct(a);
        return i[c].handler && (i[c].handler.returned = h), h;
      }
      /* */      debugger;
      throw l.err("Can include none of file", t);
    }
    //
        function _includeWithRequire(e) {
      if (1 !== arguments.length) return _includeWithRequire(arguments);
      if (l.longIs(e)) {
        var n = [];
        e = l.arrayFlatten([], e);
        for (var t = 0; t < e.length; t++) n[t] = _includeWithRequireAct(e[t]);
        return n;
      }
      return _includeWithRequireAct(e);
    }
    //
        //
    function _includeWithRequireAny(t) {
      for (var r = 0; r < arguments.length; r++) {
        var i;
        if ("" !== (t = arguments[r])) try {
          i = e.resolve(t);
          // src = resolved;
                } catch (e) {
          if (r !== arguments.length - 1 && !n) continue;
        }
        if (r === arguments.length - 1 && "" === t) return;
        return _includeWithRequireAct(i || arguments[0]);
      }
      l.assert(0, "unexpected");
    }
    //
        var e, n = 0, t = _global_.wTools, r = _global_, l = _global_.wTools, i = (r = _global_, 
    null);
    "undefined" != typeof require ? e = require : "undefined" != typeof importScripts ? e = importScripts : r._remoteRequire && (e = r._remoteRequire), 
    r.ModulesRegistry = r.ModulesRegistry || Object.create(null);
    // --
    // declare
    // --
    var u = {
      /* xxx qqq : comment out maybe !!! */
      usePath: 
      // _global.ModulesRegistry.ModulesRegistry =
      // {
      //   includeAny : [ '../../abase/l3/ModulesRegistry.s','l3/ModulesRegistry.s','wmodulesregistry' ],
      //   isIncluded : function(){ return Object.keys( _global.ModulesRegistry ).length > 3 },
      // }
      // --
      // routines
      // --
      function usePath(e) {
        l.assert(1 === arguments.length, "Expects single argument"), l.assert(l.strIs(e)), 
        l.path && l.path.refine && (e = l.path.refine(e)), "undefined" != typeof module && module.paths && -1 === module.paths.indexOf(e) && module.paths.push(e);
      }
      //
      ,
      usePathGlobally: function usePathGlobally(e) {
        l.strIs(e) && (e = [ e ]), l.assert(1 === arguments.length, "Expects single argument"), 
        l.assert(l.arrayIs(e));
        debugger;
        if (l.path.nativize && l.path.refine) for (var n = 0; n < e.length; n++) e[n] = l.path.nativize(l.path.resolve(e[n])), 
        console.log("usePathGlobally", e[n]);
        return _usePathGlobally(module, e, []);
      },
      _usePathGlobally: _usePathGlobally,
      _usePathGloballyChildren: _usePathGloballyChildren,
      //
      _includeWithRequireAct: _includeWithRequireAct,
      _includeAct: _includeAct,
      _includeAnyAct: _includeAnyAct,
      _includeWithRequire: _includeWithRequire,
      include: function include(e) {
        if (1 !== arguments.length) return _includeAct(arguments);
        if (l.longIs(e)) {
          var n = [];
          e = l.arrayFlatten([], e);
          for (var t = 0; t < e.length; t++) n[t] = _includeAct(e[t]);
          return n;
        }
        return _includeAct(e);
      },
      _includeWithRequireAny: _includeWithRequireAny,
      includeAny: function includeAny() {
        return _includeAnyAct(arguments);
      }
      //
      ,
      isIncluded: function isIncluded(e) {
        var n;
        return r.ModulesRegistry[e] && (n = r.ModulesRegistry[e]), !!n && !!n.isIncluded && n.isIncluded();
      }
    };
    l.mapExtend(t, u), l.usePath && "undefined" != typeof __dirname && l.usePath(__dirname + "/../.."), 
    // --
    // export
    // --
    "undefined" != typeof module && null !== module && (module.exports = t);
  }();
  // == end of file IncludeToolsS
}();