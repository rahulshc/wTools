!function cErrS() {
  // == begin of file cErrS
  !function _cErr_s_() {
    "use strict";
    //
    // function diagnosticVariate( o )
    // {
    //   _.routineOptions( diagnosticVariate,o );
    //
    //   if( _.arrayIs( o.routine ) )
    //   {
    //     _.assert( _.routineIs( o.routine[ 1 ] ) );
    //     if( !o.variates && o.routine[ 1 ].variates )
    //     o.variates = o.routine[ 1 ].variates;
    //     o.routine = _.routineJoin.apply( _,o.routine );
    //   }
    //
    //   _.assert( _.routineIs( o.routine ) );
    //   _.assert( _.objectIs( o.variates ) );
    //
    //   let vals = _.mapExtend( null,o.variates );
    //   vals = _.proxyNoUndefined( vals );
    //
    //   if( o.test === null )
    //   o.test = function vtest( got,o )
    //   {
    //     return _.entityEquivalent( got,o.expected,{ /*eps*/accuracy : o./*eps*/accuracy } );
    //   }
    //
    //   let found = 0;
    //   let nsamples = _.eachSample
    //   ({
    //
    //     onEach : function( sample,i )
    //     {
    //       let got = o.routine( sample );
    //       let res = o.test( got,o );
    //       if( res )
    //       found += 1;
    //       if( res || !o.printingValidOnly )
    //       {
    //         logger.log( 'routine',o.routine.name,'gave',got,'expected',o.expected,'#',i );
    //         if( res )
    //         {
    //           logger.log( 'sample :',sample );
    //           logger.log( got );
    //         }
    //       }
    //     },
    //
    //     sets : o.variates,
    //     sample : vals,
    //     result : null,
    //
    //   });
    //
    //   logger.log( 'Found',found,'/',nsamples );
    //
    // }
    //
    // diagnosticVariate.defaults =
    // {
    //   routine : null,
    //   test : null,
    //
    //   expected : null,
    //   variates : null,
    //   accuracy : 1e-3,
    //   printingValidOnly : 1,
    // }
    // --
    // diagnostics
    // --
    // function _diagnosticStripPath( src )
    // {
    //   _.assert( arguments.length === 1, 'Expects single argument' );
    //
    //   if( _.strIs( src ) )
    //   {
    //     src = src.replace( /^\s+/,'' );
    //     // src = src.replace( /^at/,'' );
    //     // src = src.replace( /^\s+/,'' );
    //   }
    //
    //   return src;
    // }
    //
    // function diagnosticScript( path )
    // {
    //
    //   if( typeof document !== 'undefined' && document.scripts )
    //   {
    //     let scripts = document.scripts;
    //     for( let s = 0 ; s < scripts.length ; s++ )
    //     if( scripts[ s ].src === path )
    //     return scripts[ s ];
    //   }
    //   else
    //   {
    //     debugger;
    //   }
    //
    // }
    //
    function diagnosticLocation(e) {
      /* end */
      function end() {
        let t = e.location.path;
        /* full */
        // if( path )
                /* name */
        if (e.location.full = t || "", void 0 !== e.location.line && (e.location.full += ":" + e.location.line), 
        /* name long */
        e.location.full && (e.location.fullWithRoutine = e.location.routine + " @ " + e.location.full), 
        t) {
          let n = t, r = n.lastIndexOf("/");
          -1 !== r && (n = n.substr(r + 1)), e.location.name = n;
        }
        /* name long */        if (t) {
          let t = e.location.name;
          void 0 !== e.location.line && (t += ":" + e.location.line, void 0 !== e.location.col && (t += ":" + e.location.col)), 
          e.location.nameLong = t;
        }
        return e.location;
      }
      /* routine from stack */      
      /* path from stack */
      function fromStack(n) {
        let r;
        if (n) {
          if (t.strIs(n) && (n = n.split("\n")), r = n[e.level], !t.strIs(r)) return end();
          r = (r = (r = (r = (r = r.replace(/^\s+/, "")).replace(/^\w+@/, "")).replace(/^at/, "")).replace(/^\s+/, "")).replace(/\s+$/, "");
          var o = /^.*\((.*)\)$/.exec(r);
          // if( _.strEnds( path,')' ) )
          // path = _.strIsolateInsideOrAll( path,'(',')' )[ 2 ];
          return o && (r = o[1]), r;
        }
      }
      /* line / col number from path */      function lineColFromPath(t) {
        let n, r, o = /(.+?):(\d+)(?::(\d+))?[^:/]*$/.exec(t);
        return o && (t = o[1], n = o[2], r = o[3]), 
        // let postfix = /:(\d+)$/;
        // colNumber = postfix.exec( o.location.path );
        // if( colNumber )
        // {
        //   o.location.path = _.strRemoveEnd( o.location.path,colNumber[ 0 ] );
        //   colNumber = colNumber[ 1 ];
        //   lineNumber = postfix.exec( o.location.path );
        //   if( lineNumber )
        //   {
        //     o.location.path = _.strRemoveEnd( o.location.path,lineNumber[ 0 ] );
        //     lineNumber = lineNumber[ 1 ];
        //   }
        //   else
        //   {
        //     lineNumber = colNumber;
        //     colNumber = undefined;
        //   }
        // }
        n = parseInt(n), r = parseInt(r), isNaN(e.location.line) && !isNaN(n) && (e.location.line = n), 
        isNaN(e.location.col) && !isNaN(r) && (e.location.col = r), t;
      }
      t.numberIs(e) ? e = {
        level: e
      } : t.strIs(e) ? e = {
        stack: e,
        level: 0
      } : t.errIs(e) ? e = {
        error: e,
        level: 0
      } : void 0 === e && (e = {
        stack: t.diagnosticStack([ 1, Infinity ])
      })
      /* */;
      for (let t in e) if (void 0 === diagnosticLocation.defaults[t]) throw Error("Unknown option " + t);
      for (let t in diagnosticLocation.defaults) void 0 === e[t] && (e[t] = diagnosticLocation.defaults[t]);
      if (0 !== arguments.length && 1 !== arguments.length) throw Error("Expects single argument or none");
      if (!t.objectIs(e)) throw Error("Expects options map");
      // _.routineOptions( diagnosticLocation,o );
      // _.assert( arguments.length === 0 || arguments.length === 1 );
      // _.assert( _.objectIs( o ),'diagnosticLocation expects integer {-level-} or string ( stack ) or object ( options )' );
      /* */      
      /* */
      if (e.location || (e.location = Object.create(null)), e.error) {
        let n = e.error.location || Object.create(null);
        if (e.location.path = t.arrayLeftDefined([ n.path, e.location.path, e.error.filename, e.error.fileName ]).element, 
        e.location.line = t.arrayLeftDefined([ n.line, e.location.line, e.error.line, e.error.linenumber, e.error.lineNumber, e.error.lineNo, e.error.lineno ]).element, 
        e.location.col = t.arrayLeftDefined([ n.col, e.location.col, e.error.col, e.error.colnumber, e.error.colNumber, e.error.colNo, e.error.colno ]).element, 
        e.location.path && t.numberIs(e.location.line)) return end();
      }
      /* */      e.stack || (e.error ? e.stack = t.diagnosticStack(e.error, void 0) : (e.stack = t.diagnosticStack(), 
      e.level += 1)), function routineFromStack(n) {
        let r;
        if (!n) return;
        if (t.strIs(n) && (n = n.split("\n")), r = n[e.level], !t.strIs(r)) return "(-routine anonymous-)";
        // debugger;
                let o = /^\s*(at\s+)?([\w\.]+)\s*.+/.exec(r);
        o && (r = o[2] || ""), t.strEnds(r, ".") && (r += "?"), e.location.routine = r, 
        e.location.service = 0, 0 === e.location.service && (t.strBegins(r, "__") || -1 !== r.indexOf(".__")) && (e.location.service = 2), 
        0 === e.location.service && (t.strBegins(r, "_") || -1 !== r.indexOf("._")) && (e.location.service = 1);
      }(e.stack);
      let n = !!e.location.path;
      if (n || (e.location.path = fromStack(e.stack)), !t.strIs(e.location.path)) return end();
      if (t.numberIs(e.location.line) || (e.location.path = lineColFromPath(e.location.path)), 
      !t.numberIs(e.location.line) && n) {
        let t = fromStack(e.stack);
        t && lineColFromPath(t);
      }
      return end();
    }
    function diagnosticCode(e) {
      /* */
      function end(e) {
        return r -= 1, e;
      }
      if (t.routineOptions(diagnosticCode, e), t.assert(0 === arguments.length || 1 === arguments.length), 
      !r) {
        r += 1;
        try {
          if (e.location || (e.error ? e.location = t.diagnosticLocation({
            error: e.error,
            level: e.level
          }) : e.location = t.diagnosticLocation({
            stack: e.stack,
            level: e.stack ? e.level : e.level + 1
          })), !t.numberIs(e.location.line)) return end();
          /* */          if (!e.sourceCode) {
            if (!e.location.path) return end();
            let n = t.codeProvider || t.fileProvider;
            if (!n) return end();
            try {
              // if( _global._starter_ )
              // debugger;
              // if( _global._starter_ )
              // _global._starter_.fileProvider.fileRead( _.weburi.parse( o.location.path ).localWebPath );
              // o.location.path = codeProvider.path.normalize( o.location.path );
              n.path.isAbsolute(n.path.normalize(e.location.path)) && (e.sourceCode = n.fileRead({
                filePath: e.location.path,
                sync: 1,
                throwing: 0
              }));
            } catch (n) {
              e.sourceCode = "CANT LOAD SOURCE CODE " + t.strQuote(e.location.path);
            }
            if (!e.sourceCode) return end();
          }
          /* */          let n = t.strLinesSelect({
            src: e.sourceCode,
            line: e.location.line,
            numberOfLines: e.numberOfLines,
            selectMode: e.selectMode,
            zero: 1,
            number: 1
          });
          return n && t.strIndentation && (n = e.identation + t.strIndentation(n, e.identation)), 
          e.withPath && (n = e.location.full + "\n" + n), end(n);
        } catch (e) {
          return void console.log(e.toString());
        }
      }
    }
    //
    /*

_.diagnosticWatchFields
({
  target : _global_,
  names : 'Uniforms',
});

_.diagnosticWatchFields
({
  target : state,
  names : 'filterColor',
});

_.diagnosticWatchFields
({
  target : _global_,
  names : 'Config',
});

_.diagnosticWatchFields
({
  target : _global_,
  names : 'logger',
});

_.diagnosticWatchFields
({
  target : self,
  names : 'catalogPath',
});

*/
    function diagnosticWatchFields(e) {
      void 0 !== arguments[1] && (e = {
        target: arguments[0],
        names: arguments[1]
      }), (e = t.routineOptions(diagnosticWatchFields, e)).names ? e.names = e.names : e.names = e.target, 
      t.assert(1 === arguments.length || 2 === arguments.length), t.assert(t.objectLike(e.target)), 
      t.assert(t.objectLike(e.names));
      for (let n in e.names) !function() {
        let r = n, o = (Symbol.for(n), e.target[n]);
        /* */
        if (e.debugging > 1) debugger;
        e.verbosity > 1 && console.log("watching for", r, "in", e.target), Object.defineProperty(e.target, r, {
          enumerable: !0,
          configurable: !0,
          get: 
          /* */
          function read() {
            //let result = o.target[ fieldSymbol ];
            let n = o;
            if (e.verbosity > 1 ? console.log("reading " + r + " " + t.toStr(n)) : console.log("reading " + r), 
            e.debugging > 1) debugger;
            return n;
          }
          /* */ ,
          set: function write(n) {
            if (e.verbosity > 1 ? console.log("writing " + r + " " + t.toStr(e.target[r]) + " -> " + t.toStr(n)) : console.log("writing " + r), 
            e.debugging) debugger;
            //o.target[ fieldSymbol ] = src;
                        o = n;
          }
        });
      }();
    }
    //
    /*

_.diagnosticProxyFields
({
  target : _.field,
});

_.diagnosticWatchFields
({
  target : _,
  names : 'field',
});

*/
    function diagnosticProxyFields(e) {
      void 0 !== arguments[1] && (e = {
        target: arguments[0],
        names: arguments[1]
      }), e = t.routineOptions(diagnosticWatchFields, e), 
      // if( o.names )
      // o.names = _.nameFielded( o.names );
      t.assert(1 === arguments.length || 2 === arguments.length), t.assert(t.objectLike(e.target)), 
      t.assert(t.objectLike(e.names) || null === e.names);
      let n = {
        set: function(n, r, o) {
          if (!e.names || r in e.names) {
            if (e.verbosity > 1 ? console.log("writing " + r + " " + t.toStr(e.target[r]) + " -> " + t.toStr(o)) : console.log("writing " + r), 
            e.debug) debugger;
            return n[r] = o, !0;
          }
        }
      }, r = new Proxy(e.target, n);
      if (e.verbosity > 1 && console.log("watching for", e.target), e.debug) debugger;
      return r;
    }
    //
    function diagnosticEachLongType(e) {
      let n = Object.create(null);
      t.routineIs(e) && (e = {
        onEach: e
      }), null === (e = t.routineOptions(diagnosticEachLongType, e)).onEach && (e.onEach = function onEach(e, t) {
        return e;
      }), t.assert(0 === arguments.length || 1 === arguments.length), t.assert(t.routineIs(e.onEach));
      // debugger;
      for (let r in t.LongDescriptor) {
        let o = t.LongDescriptor[r];
        n[o.name] = e.onEach(o.make, o);
      }
      // debugger;
            return n;
    }
    //
    function diagnosticEachElementComparator(e) {
      /* */
      function evaluator(e) {
        return t.assert(1 === e.length), e[0];
      }
      /* */      
      /* */
      function make(n) {
        t.assert(t.longIs(n));
        let r = [];
        for (let e = 0; e < n.length; e++) r[e] = [ n[e] ];
        return e.onMake(r);
      }
      let n = [];
      return void 0 !== arguments[1] ? e = {
        onMake: arguments[0],
        onEach: arguments[1]
      } : t.routineIs(arguments[0]) && (e = {
        onEach: arguments[1]
      }), null === (e = t.routineOptions(diagnosticEachElementComparator, e)).onEach && (e.onEach = function onEach(e, t, n) {
        return t;
      }), null === e.onMake && (e.onMake = function onMake(e) {
        return e;
      }), t.assert(1 === arguments.length || 2 === arguments.length), t.assert(t.routineIs(e.onEach)), 
      t.assert(t.routineIs(e.onMake)), n.push(e.onEach(e.onMake, void 0, "no evaluator")), 
      n.push(e.onEach(make, evaluator, "evaluator")), n.push(e.onEach(make, [ evaluator, evaluator ], "tandem of evaluators")), 
      n.push(e.onEach(make, function equalizer(e, n) {
        return t.assert(1 === e.length), t.assert(1 === n.length), e[0] === n[0];
      }, "equalizer")), n;
    }
    //
    function diagnosticsStructureGenerate(e) {
      t.assert(1 === arguments.length), t.routineOptions(diagnosticsStructureGenerate, e), 
      t.assert(t.numberIs(e.breadth)), t.assert(t.numberIs(e.depth)), t.assert(null === e._pre || t.routineIs(e._pre));
      /* qqq: pre */
      /**/
      let n = 0;
      // console.log( 'entitySize:', _.strMetricFormatBytes( o.size ) );
      return e.structure = 
      /*  */
      function structureMake() {
        /*  */
        function mapForSize(n, r) {
          let o = {};
          for (var i = 0; i < e.mapSize; i++) {
            let e = t.numberRandomInt(r);
            o[i] = n[e];
          }
          return o;
        }
        let r = Object.create(null), o = t.strDup("a", e.stringSize || e.fieldSize);
        (e.boolean || e.primitive) && (r.boolean = !0), (e.number || e.primitive) && (r.number = 0), 
        (e.signedNumber || e.primitive > 2) && (r["-0"] = -0, r["+0"] = 0), (e.string || e.primitive) && (r.string = o), 
        (e.null || e.primitive > 1) && (r.null = null), (e.infinity || e.primitive > 1) && (r["+infinity"] = Infinity, 
        r["-infinity"] = -Infinity), (e.nan || e.primitive > 1) && (r.nan = NaN), (e.undefined || e.primitive > 2) && (r[void 0] = void 0), 
        (e.date || e.primitive > 2) && (r.date = new Date()), (e.bigInt || e.primitive > 2) && "undefined" != typeof BigInt && (r.bigInt = BigInt(1)), 
        e.regexp && (r.regexp1 = /ab|cd/, r.regexp2 = /a[bc]d/, r.regexp3 = /ab{1,}bc/, 
        r.regexp4 = /\.js$/, r.regexp5 = /.regexp/), (e.regexpComplex || e.regexp > 1) && (r.complexRegexp0 = /^(?:(?!ab|cd).)+$/gm, 
        r.complexRegexp1 = /\/\*[\s\S]*?\*\/|\/\/.*/g, r.complexRegexp2 = /^[1-9]+[0-9]*$/gm, 
        r.complexRegexp3 = /aBc/i, r.complexRegexp4 = /^\d+/gm, r.complexRegexp5 = /^a.*c$/g, 
        r.complexRegexp6 = /[a-z]/m, r.complexRegexp7 = /^[A-Za-z0-9]$/);
        let i = t.arrayFillTimes([], e.bufferSize || e.fieldSize, 0);
        if ((e.bufferNode || e.buffer && 2 !== e.buffer) && "undefined" != typeof Buffer && (r.bufferNode = Buffer.from(i)), 
        (e.bufferRaw || e.buffer) && (r.bufferRaw = new ArrayBuffer(i)), (e.bufferBytes || e.buffer && 2 !== e.buffer) && (r.bufferBytes = new Uint8Array(i)), 
        e.map || e.structure) {
          let t = r.map = {
            0: o,
            1: 1,
            2: !0
          };
          e.mapSize && (r.map = mapForSize(t, [ 0, 3 ]));
        }
        if (e.mapComplex || e.structure > 1) {
          let t = r.mapComplex = {
            0: "1",
            1: {
              b: 2
            },
            2: [ 1, 2, 3 ]
          };
          e.mapSize && (r.mapComplex = mapForSize(t, [ 0, 3 ]));
        }
        if ((e.array || e.structure) && (r.array = t.arrayFillTimes([], e.arraySize || e.fieldSize, 0)), 
        e.arrayComplex || e.structure > 1) {
          let n = {
            a: "1",
            dir: {
              b: 2
            },
            c: [ 1, 2, 3 ]
          };
          r.arrayComplex = t.arrayFillTimes([], e.arraySize || e.fieldSize, n);
        }
        (e.recursion || e.structure > 2) && (r.recursion = r);
        /**/
        for (var a = t.mapExtend(null, r), l = 0; l < e.breadth; l++) r["breadth" + l] = t.mapExtend(null, a);
        /*  */        return n < e.depth - 1 && (r["depth" + (n += 1)] = structureMake()), 
        r;
      }(), e.size = t.entitySize(e.structure), e;
    }
    Array.prototype.slice, Function.prototype.bind, Object.prototype.toString, Object.hasOwnProperty, 
    Object.propertyIsEnumerable, Math.ceil, Math.floor;
    let e = _global_, t = e.wTools, n = (t._err, t);
    diagnosticLocation.defaults = {
      level: 0,
      stack: null,
      error: null,
      location: null
    };
    //
        let r = 0;
    diagnosticCode.defaults = {
      level: 0,
      numberOfLines: 3,
      withPath: 1,
      selectMode: "center",
      identation: "    ",
      stack: null,
      error: null,
      location: null,
      sourceCode: null
    }, diagnosticWatchFields.defaults = {
      target: null,
      names: null,
      verbosity: 2,
      debugging: 1
    }, diagnosticProxyFields.defaults = {}, diagnosticProxyFields.defaults.__proto__, 
    diagnosticWatchFields.defaults, diagnosticEachLongType.defaults = {
      onEach: null
    }, diagnosticEachElementComparator.defaults = {
      onMake: null,
      onEach: null
    }, diagnosticsStructureGenerate.defaults = {
      _pre: null,
      depth: null,
      breadth: null,
      /**/
      boolean: null,
      number: null,
      signedNumber: null,
      string: null,
      null: null,
      infinity: null,
      nan: null,
      undefined: null,
      date: null,
      bigInt: null,
      regexp: null,
      regexpComplex: null,
      bufferNode: null,
      bufferRaw: null,
      bufferBytes: null,
      array: null,
      arrayComplex: null,
      map: null,
      mapComplex: null,
      /*  */
      primitive: null,
      buffer: null,
      structure: null,
      /* */
      stringSize: null,
      bufferSize: null,
      regexpSize: null,
      arraySize: null,
      mapSize: null,
      fieldSize: 50
    };
    //
    /**
 * Return stack trace as string.
 * @example
  let stack;
  function function1()
  {
    function2();
  }

  function function2()
  {
    function3();
  }

  function function3()
  {
    stack = wTools.diagnosticStack();
  }

  function1();
  console.log( stack );
 //"    at function3 (<anonymous>:10:17)
 // at function2 (<anonymous>:6:2)
 // at function1 (<anonymous>:2:2)
 // at <anonymous>:1:1"
 *
 * @returns {String} Return stack trace from call point.
 * @function stack
 * @memberof wTools
 */
    // function diagnosticStack( stack, first, last )
        // --
    // errrors
    // --
    let o = {
      ErrorAbort: t.error_functor("ErrorAbort")
    }, i = {
      // _diagnosticStripPath,
      diagnosticLocation: diagnosticLocation,
      diagnosticCode: diagnosticCode,
      diagnosticStack: function diagnosticStack(e, n) {
        // if( last-first === 1 )
        // debugger;
        // if( _.numberIs( arguments[ 0 ] ) || arguments[ 0 ] === undefined )
        // {
        //
        //   first = arguments[ 0 ] ? arguments[ 0 ] + 1 : 1;
        //   last = arguments[ 1 ] >= 0 ? arguments[ 1 ] + 1 : arguments[ 1 ];
        //
        //   return diagnosticStack( new Error(), first, last );
        // }
        if (1 === arguments.length && (t.errIs(e) || (n = arguments[0], e = void 0)), void 0 === e && (e = new Error(), 
        void 0 === n && (n = [ 1, Infinity ])), void 0 === n && (n = [ 0, Infinity ]), 0 !== arguments.length && 1 !== arguments.length && 2 !== arguments.length) {
          debugger;
          throw Error("diagnosticStack : expects one or two or none arguments");
        }
        // if( !_.numberIs( first ) && first !== undefined )
        // {
        //   debugger;
        //   throw Error( 'diagnosticStack : expects number {-first-}, got ' + _.strType( first ) );
        // }
        //
        // if( !_.numberIs( last ) && last !== undefined )
        // {
        //   debugger;
        //   throw Error( 'diagnosticStack : expects number {-last-}, got ' + _.strType( last ) );
        // }
                if (!t.rangeIs(n)) {
          debugger;
          throw Error("diagnosticStack : expects range but, got " + t.strType(n));
        }
        let r = n[0], o = n[1];
        if (!t.numberIs(r)) {
          debugger;
          throw Error("diagnosticStack : expects number range[ 0 ], but got " + t.strType(r));
        }
        if (!t.numberIs(o)) {
          debugger;
          throw Error("diagnosticStack : expects number range[ 0 ], but got " + t.strType(o));
        }
        let i = 0;
        if (t.errIs(e) && (e = e.stack, i = 1), !e) return "";
        if (t.arrayIs(e) || t.strIs(e)) {
          if (!t.arrayIs(e) && !t.strIs(e)) {
            debugger;
            throw Error("diagnosticStack expects array or string");
          }
          // debugger;
                    /* xxx */
          if (t.arrayIs(e) || (e = e.split("\n"))
          /* remove redundant lines */ , i || console.debug("REMINDER : problem here if !errIs"), 
          !i) debugger;
          if (i) for (;e.length; ) {
            let t = 0;
            if (t |= -1 === e[0].indexOf("  at ") && -1 === e[0].indexOf("@"), t |= -1 !== e[0].indexOf("(vm.js:"), 
            t |= -1 !== e[0].indexOf("(module.js:"), !(t |= -1 !== e[0].indexOf("(internal/module.js:"))) break;
            e.splice(0, 1);
          }
          // if( stack[ 0 ].indexOf( '@' ) === -1 )
          // stack[ 0 ] = _.strIsolateLeftOrNone( stack[ 0 ],'@' )[ 1 ];
          // if( !stack[ 0 ] )
          // return '... stack is empty ...';
          // debugger;
                    if (e[0] && -1 === e[0].indexOf("at ") && -1 === e[0].indexOf("@")) {
            debugger;
            console.error("diagnosticStack : cant parse stack\n" + e);
          }
          /* */          return r = void 0 === r ? 0 : r, o = void 0 === o ? e.length : o, 
          t.numberIs(r) && r < 0 && (r = e.length + r), t.numberIs(o) && o < 0 && (o = e.length + o + 1), 
          /* */
          // if( last-first === 1 )
          // {
          //   debugger;
          //   // stack = stack[ first ];
          //   //
          //   // if( _.strIs( stack ) )
          //   // {
          //   //   stack = _._diagnosticStripPath( stack );
          //   // }
          //   //
          //   // return stack;
          // }
          0 === r && o === e.length || (e = e.slice(r || 0, o))
          /* */ , String(e.join("\n"));
        }
      }
      //
      ,
      diagnosticStackCondense: function diagnosticStackCondense(e) {
        if (1 !== arguments.length) throw Error("Expects single arguments");
        if (!t.strIs(e)) throw Error("Expects string");
        e = e.split("\n");
        for (let t = 1; t < e.length; t++) if (/(\w)_entry(\W|$)/.test(e[t])) {
          e.splice(t + 1, e.length);
          break;
        }
        for (let t = e.length - 1; t >= 1; t--) /(\W|^)__\w+/.test(e[t]) && e.splice(t, 1);
        return e.join("\n");
      }
      //
      ,
      diagnosticBeep: function diagnosticBeep() {
        console.log("");
      }
      //
      ,
      diagnosticApplicationEntryPointData: function diagnosticApplicationEntryPointData() {
        let n = Object.create(null);
        return void 0 !== e.process && (e.process.argv && (n.execPath = e.process.argv.join(" ")), 
        t.routineIs(e.process.cwd) && (n.currentPath = e.process.cwd())), n;
      }
      //
      ,
      diagnosticApplicationEntryPointInfo: function diagnosticApplicationEntryPointInfo() {
        /* */
        function join(e, t) {
          return n && (n += "\n"), n += e + " : " + t;
        }
        let e = t.diagnosticApplicationEntryPointData(), n = "";
        return e.currentPath && (n = join("Current path", e.currentPath)), e.execPath && (n = join("Exec path", e.execPath)), 
        n;
      },
      diagnosticWatchFields: diagnosticWatchFields,
      /* experimental */
      diagnosticProxyFields: diagnosticProxyFields,
      /* experimental */
      diagnosticEachLongType: diagnosticEachLongType,
      diagnosticEachElementComparator: diagnosticEachElementComparator,
      diagnosticsStructureGenerate: diagnosticsStructureGenerate
    };
    // --
    // declare
    // --
        Object.assign(n, i), Object.assign(n.error, o), 
    // --
    // export
    // --
    "undefined" != typeof module && null !== module && (module.exports = n);
  }();
  // == end of file cErrS
}();