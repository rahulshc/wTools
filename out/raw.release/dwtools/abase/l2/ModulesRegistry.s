!function ModulesRegistryS() {
  // == begin of file ModulesRegistryS
  !function _ModulesRegistry_s_() {
    "use strict";
    /**
 * @typedef {Object} ModulesRegistry - Map that contains info about modules, is uses by {@link wTools.include}.
 * @memberof wTools
 */
    // --
    // helper
    // --
    function includeAny(e, o) {
      return n.assert(2 === arguments.length), [ "../../" + e, e, o ];
    }
    // --
    // include map
    // --
    // base / l3
    // let wNameTools =
    // {
    //   includeAny : includeAny( 'abase/l3/NameTools.s', 'wNameTools' ),
    //   isIncluded : function(){ return !!_global.wTools && !!_global.wTools.idWithInt; },
    // }
        let e = _global_, n = e.wTools;
    Object.hasOwnProperty.call(e, "ModuleRegistry") || (e.ModulesRegistry = Object.create(null));
    let o = e.ModulesRegistry, l = (includeAny("abase/l3/Entity.s", "wentityfundamentals"), 
    {
      includeAny: includeAny("abase/l3/Looker.s", "wlooker"),
      isIncluded: function() {
        return !!e.wTools && !!e.wTools.look;
      }
    }), i = {
      includeAny: includeAny("abase/l3/Path.s", "wpathfundamentals"),
      isIncluded: function() {
        return !!e.wTools && !!e.wTools.path;
      }
    }, s = {
      includeAny: includeAny("abase/l3/RoutineFundamentals.s", "wroutinefundamentals"),
      isIncluded: function() {
        return !!e.wTools && !!e.wTools.exec;
      }
    }, r = {
      includeAny: includeAny("abase/l3/Proto.s", "wProto"),
      isIncluded: function() {
        return !!e.wTools && !!e.wTools.mixinDelcare;
      }
    }, t = {
      includeAny: includeAny("abase/l3/Stringer.s", "wstringer"),
      isIncluded: function() {
        return !!e.wTools && !!e.wTools.Stringer;
      }
    }, u = {
      // base / l3
      wLooker: l,
      wPathFundamentals: i,
      wRoutineFundamentals: s,
      wProto: r,
      // base / l4
      wReplicator: {
        includeAny: includeAny("abase/l4/Replicator.s", "wreplicator"),
        isIncluded: function() {
          return !!e.wTools && !!e.wTools.replicate;
        }
      },
      wLookerExtra: {
        includeAny: includeAny("abase/l4/LookerExtra.s", "wlookerextra"),
        isIncluded: function() {
          return !!e.wTools && !!e.wTools.entitySearch;
        }
      },
      wArraySorted: {
        includeAny: includeAny("abase/l4/ArraySorted.s", "warraysorted"),
        isIncluded: function() {
          return !!e.wTools && !!e.wTools.sorted;
        }
      },
      wArraySparse: {
        includeAny: includeAny("abase/l4/ArraySparse.s", "warraysparse"),
        isIncluded: function() {
          return !!e.wTools && !!e.wTools.sparse;
        }
      },
      wExternalFundamentals: {
        includeAny: includeAny("abase/l4/External.s", "wexternalfundamentals"),
        isIncluded: function() {
          return !!e.wTools && !!e.wTools.shell;
        }
      },
      wUriFundamentals: {
        includeAny: includeAny("abase/l4/Uri.s", "wurifundamentals"),
        isIncluded: function() {
          return !!e.wTools && !!e.wTools.uri;
        }
      },
      wTraverser: {
        includeAny: includeAny("abase/l4/Traverser.s", "wtraverser"),
        isIncluded: function() {
          return !!e.wTools && !!e.wTools._traverse;
        }
      },
      wStringer: t,
      wRoutineTransform: {
        includeAny: includeAny("abase/l4/RoutineTransform.s", "wroutinetransform"),
        isIncluded: function() {
          return !!e.wTools && !!e.wTools.routineNew;
        }
      },
      // base / l5
      wSelector: {
        includeAny: includeAny("abase/l5/Selector.s", "wselector"),
        isIncluded: function() {
          return !!e.wTools && !!e.wTools.select;
        }
      },
      wWebUriFundamentals: {
        includeAny: includeAny("abase/l5/WebUri.s", "wweburifundamentals"),
        isIncluded: function() {
          return !!e.wTools && !!e.wTools.weburi;
        }
      },
      wCloner: {
        includeAny: includeAny("abase/l5/Cloner.s", "wcloner"),
        isIncluded: function() {
          return !!e.wTools && !!e.wTools._clone;
        }
      },
      wStringsExtra: {
        includeAny: includeAny("abase/l5/StringTools.s", "wstringsextra"),
        isIncluded: function() {
          return !!e.wTools && !!e.wTools.strSorterParse;
        }
      },
      // base / l6
      wComparator: {
        includeAny: includeAny("abase/l6/LookerComparator.s", "wcomparator"),
        isIncluded: function() {
          return !!e.wTools && !!e.wTools.entityIdentical;
        }
      },
      wSelectorExtra: {
        includeAny: includeAny("abase/l6/SelectorExtra.s", "wselectorextra"),
        isIncluded: function() {
          return !!e.wTools && !!e.wTools.entityProbe;
        }
      },
      // base / l7_mixin
      wConsequizer: {
        includeAny: includeAny("abase/l7_mixin/Consequizer.", "wconsequizer"),
        isIncluded: function() {
          return !!e.wTools && !!e.wTools.Consequizer;
        }
      },
      wCopyable: {
        includeAny: includeAny("abase/l7_mixin/Copyable.s", "wCopyable"),
        isIncluded: function() {
          return !!e.wTools && !!e.wTools.Copyable;
        }
      },
      wInstancing: {
        includeAny: includeAny("abase/l7_mixin/Instancing.s", "winstancing"),
        isIncluded: function() {
          return !!e.wTools && !!e.wTools.Instancing;
        }
      },
      wEventHandler: {
        includeAny: includeAny("abase/l7_mixin/EventHandler.s", "wEventHandler"),
        isIncluded: function() {
          return !!e.wTools && !!e.wTools.EventHandler;
        }
      },
      wFieldsStack: {
        includeAny: includeAny("abase/l7_mixin/FieldsStack.s", "wfieldsstack"),
        isIncluded: function() {
          return !!e.wTools && !!e.wTools.FieldsStack;
        }
      },
      // base / l8
      wProcedure: {
        includeAny: includeAny("abase/l8/Procedure.s", "wprocedure"),
        isIncluded: function() {
          return !!e.wTools && !!e.wTools.procedure;
        }
      },
      wGdfStrategy: {
        includeAny: includeAny("abase/l8/GdfConverter.s", "wgdfstrategy"),
        isIncluded: function() {
          return !!e.wTools && !!e.wTools.Gdf;
        }
      },
      wBaseEncoder: {
        includeAny: includeAny("abase/l4/Encoder.s", "wbaseencoder"),
        isIncluded: function() {
          return !!e.wTools && !!e.wTools.encode;
        }
      },
      // base / l9
      wLogger: {
        includeAny: includeAny("abase/l9/printer/top/Logger.s", "wLogger"),
        isIncluded: function() {
          return !!e.wTools && !!e.wTools.Logger;
        }
      },
      wPrinterToFile: {
        includeAny: includeAny("abase/l9/printer/top/ToFile.ss", "wloggertofile"),
        isIncluded: function() {
          return !!e.wTools && !!e.wTools.PrinterToFile;
        }
      },
      wPrinterToJs: {
        includeAny: includeAny("abase/l9/printer/top/ToJstructure.s", "wloggertojs"),
        isIncluded: function() {
          return !!e.wTools && !!e.wTools.PrinterToJs;
        }
      },
      wConsequence: {
        includeAny: includeAny("abase/l9/consequence/Consequence.s", "wConsequence"),
        isIncluded: function() {
          return !!e.wTools && !!e.wTools.Consequence;
        }
      },
      // base_dom
      wDomBaseLayer1: {
        includeAny: includeAny("abase_dom/l1/Common.js", "wdombaselayer1"),
        isIncluded: function() {
          return !!e.wTools && !!e.wTools._domBaselayer1Loaded;
        }
      },
      wDomBaseLayer3: {
        includeAny: includeAny("abase_dom/l3/Common.js", "wdombaselayer3"),
        isIncluded: function() {
          return !!e.wTools && !!e.wTools._domBaselayer3Loaded;
        }
      },
      wDomBaseLayer5: {
        includeAny: includeAny("abase_dom/l5/Common.js", "wdombasel5"),
        isIncluded: function() {
          return !!e.wTools && !!e.wTools._domBasel5Loaded;
        }
      },
      // mid
      wRegexpObject: {
        includeAny: includeAny("amid/bclass/RegexpObject.s", "wRegexpObject"),
        isIncluded: function() {
          return !!e.wTools && !!e.wTools.RegexpObject;
        }
      },
      wColor: {
        includeAny: includeAny("amid/color/Color.s", "wColor"),
        isIncluded: function() {
          return !!e.wTools && !!e.wTools.ColorMap;
        }
      },
      wColor256: {
        includeAny: includeAny("amid/color/Color256.s", "wColor256"),
        isIncluded: function() {
          return !!e.wTools && !!e.wTools.ColorMap && Object.keys(e.wTools.ColorMap).length > 100;
        }
      },
      wChangeTransactor: {
        includeAny: includeAny("amid/changes/ChangeTransactor.s", "wChangeTransactor"),
        isIncluded: function() {
          return !!e.wTools && !!e.wTools.ChangeTransactor;
        }
      },
      wVocabulary: {
        includeAny: includeAny("amid/bclass/Vocabulary.s", "wvocabulary"),
        isIncluded: function() {
          return !!e.wTools && !!e.wTools.Vocabulary;
        }
      },
      wCommandsAggregator: {
        includeAny: includeAny("amid/l7/Commands/CommandsAggregator.s", "wcommandsaggregator"),
        isIncluded: function() {
          return !!e.wTools && !!e.wTools.CommandsAggregator;
        }
      },
      wCommandsConfig: {
        includeAny: includeAny("amid/l7/commands/mixin/CommandsConfig.s", "wcommandsconfig"),
        isIncluded: function() {
          return !!e.wTools && !!e.wTools.CommandsConfig;
        }
      },
      wFiles: {
        includeAny: includeAny("amid/files/UseTop.s", "wFiles"),
        isIncluded: function() {
          return !!e.wTools && !!e.wTools.fileProvider;
        }
      },
      wFilesArchive: {
        includeAny: includeAny("amid/files/IncludeArchive.s", "wfilesarchive"),
        isIncluded: function() {
          return !!e.wTools && !!e.wTools.FilesArchive;
        }
      },
      wFilesEncoders: {
        includeAny: includeAny("amid/files/l1/EncodersExtended.s", "wfilesencoders"),
        isIncluded: function() {
          return !!e.wTools && !!e.wTools.FileReadEncoders && !!e.wTools.FileReadEncoders.yml;
        }
      },
      wFilesSvn: {
        includeAny: includeAny("amid/files/fprovider/pSvn.ss", "wFilesSvn"),
        isIncluded: function() {
          return !!e.wTools && !!e.wTools.fileProvider.Svn;
        }
      },
      wTimeMarker: {
        includeAny: includeAny("amid/amixin/TimeMarker.s", "wtimemarker"),
        isIncluded: function() {
          return !!e.wTools && !!e.wTools.TimeMarker;
        }
      },
      wVerbal: {
        includeAny: includeAny("amid/amixin/Verbal.s", "wverbal"),
        isIncluded: function() {
          return !!e.wTools && !!e.wTools.Verbal;
        }
      },
      wStateStorage: {
        includeAny: includeAny("amid/amixin/aStateStorage.s", "wstatestorage"),
        isIncluded: function() {
          return !!e.wTools && !!e.wTools.StateStorage;
        }
      },
      wStateSession: {
        includeAny: includeAny("amid/amixin/StateSession.s", "wstatesession"),
        isIncluded: function() {
          return !!e.wTools && !!e.wTools.StateSession;
        }
      },
      wStager: {
        includeAny: includeAny("amid/l3/stager/Stager.s", "wstager"),
        isIncluded: function() {
          return !!e.wTools && !!e.wTools.Stager;
        }
      },
      wFileExecutor: {
        includeAny: includeAny("amid/l7/executor/FileExecutor.s", "wFileExecutor"),
        isIncluded: function() {
          return !!e.wTools && !!e.wTools.wFileExecutor;
        }
      },
      wFileExecutorHtmlFormatters: {
        includeAny: includeAny("amid/l7/executor/HtmlFormatters.s", "wFileExecutorHtmlFormatters"),
        isIncluded: function() {
          return !!e.wTools && !!e.wTools.FileExecutorHtmlFormatters;
        }
      },
      wPathTranslator: {
        includeAny: includeAny("amid/l5_mapper/PathTranslator.s", "wpathtranslator"),
        isIncluded: function() {
          return !!e.wTools && !!e.wTools.PathTranslator;
        }
      },
      wNameMapper: {
        includeAny: includeAny("amid/l5_mapper/NameMapper.s", "wnamemapper"),
        isIncluded: function() {
          return !!e.wTools && !!e.wTools.NameMapper;
        }
      },
      wTemplateTreeResolver: {
        includeAny: includeAny("amid/l5_mapper/TemplateTreeAresolver.s", "wtemplatetreeresolver"),
        isIncluded: function() {
          return !!e.wTools && !!e.wTools.TemplateTreeResolver;
        }
      },
      wTemplateTreeEnvironment: {
        includeAny: includeAny("amid/l5_mapper/TemplateTreeEnvironment.s", "wtemplatetreeenvironment"),
        isIncluded: function() {
          return !!e.wTools && !!e.wTools.TemplateTreeEnvironment;
        }
      },
      wTemplateFileWriter: {
        includeAny: includeAny("amid/l5_mapper/TemplateFileWriter.s", "wtemplatefilewriter"),
        isIncluded: function() {
          return !!e.wTools && !!e.wTools.TemplateFileWriter;
        }
      },
      wGraph: {
        includeAny: includeAny("amid/agraph/UseTop.s", "wgraphbase"),
        isIncluded: function() {
          return !!e.wTools && !!e.wTools.graph;
        }
      },
      wGraphLive: {
        includeAny: includeAny("amid/agraph/UseLive.s", "wgraphlive"),
        isIncluded: function() {
          return !!e.wTools && !!e.wTools.LiveSystem;
        }
      },
      wSchema: {
        includeAny: includeAny("amid/schema/Top.s", "wSchema"),
        isIncluded: function() {
          return !!e.wTools && !!e.wTools.schema;
        }
      },
      wScriptLauncher: {
        includeAny: includeAny("amid/launcher/ScriptLauncher.s", "wscriptlauncher"),
        isIncluded: function() {
          return !!e.wTools && !!e.wTools.ScriptLauncher;
        }
      },
      wExchangePoint: {
        includeAny: includeAny("amid/exchangePoint/ExchangePoint.s", "wExchangePoint"),
        isIncluded: function() {
          return !!e.wTools && !!e.wTools.ExchangePoint;
        }
      },
      wCommunicator: {
        includeAny: includeAny("amid/communicator/Communicator.s", "wCommunicator"),
        isIncluded: function() {
          return !!e.wTools && !!e.wTools.Communicator;
        }
      },
      wIncubator: {
        includeAny: includeAny("amid/worker/Incubator.s", "wIncubator"),
        isIncluded: function() {
          return !!e.wTools && !!e.wTools.Incubator;
        }
      },
      wCollectionOfInstances: {
        includeAny: includeAny("amid/container/CollectionOfInstances.s", "wcollectionofinstances"),
        isIncluded: function() {
          return !!e.wTools && !!e.wTools.CollectionOfInstances;
        }
      },
      wStarterMaker: {
        includeAny: includeAny("amid/starter/StarterMaker.s", "wstartermaker"),
        isIncluded: function() {
          return !!e.wTools && !!e.wTools.StarterMaker;
        }
      },
      // amid / l5
      wBitmask: {
        includeAny: includeAny("amid/l5_mapper/Bitmask.s", "wBitmask"),
        isIncluded: function() {
          return !!e.wTools && !!e.wTools.Bitmask;
        }
      },
      // math
      wMathScalar: {
        includeAny: includeAny("amath/l1/Scalar.s", "wmathscalar"),
        isIncluded: function() {
          return !!e.wTools && !!e.wTools.clamp;
        }
      },
      wMathVector: {
        includeAny: includeAny("amath/l3_vector/Main.s", "wmathvector"),
        isIncluded: function() {
          return !!e.wTools && !!e.wTools.vector;
        }
      },
      wMathSpace: {
        includeAny: includeAny("amath/l5_space/Main.s", "wmathspace"),
        isIncluded: function() {
          return !!e.wTools && !!e.wTools.Space;
        }
      },
      wMathConcepts: {
        includeAny: includeAny("amath/l8/Concepts.ss", "wmathconcepts"),
        isIncluded: function() {
          return !!e.wTools && !!e.wTools.box;
        }
      },
      // top
      wTesting: {
        includeAny: includeAny("atop/tester/MainTop.s", "wTesting"),
        isIncluded: function() {
          return _realGlobal_.wTester && _realGlobal_.wTester._isReal_;
        }
      },
      wTranspilationStrategy: {
        includeAny: includeAny("atop/transpilationStrategy/MainBase.s", "wtranspilationstrategy"),
        isIncluded: function() {
          return !!e.wTools && !!e.wTools.TranspilationStrategy;
        }
      },
      wFilesOperationsDirector: {
        includeAny: includeAny("atop/files/OperationsDirector.s", "wfilesoperationsdirector"),
        isIncluded: function() {
          return !!e.wTools && !!e.wTools.FilesOperationsDirector;
        }
      },
      wFilesLinker: {
        includeAny: includeAny("atop/files/Linker.s", "wfileslinker"),
        isIncluded: function() {
          return !!e.wTools && !!e.wTools.FilesLinker;
        }
      },
      wBaker: {
        includeAny: includeAny("atop/baker/Baker.s", "wBaker"),
        isIncluded: function() {
          return !!e.wTools && !!e.wTools.Baker;
        }
      },
      wBakerWithFileExecutor: {
        includeAny: includeAny("atop/baker/BakerWithFileExecutor.s", "wBakerWithFileExecutor"),
        isIncluded: function() {
          return !!e.wTools && !!e.wTools.wBakerWithFileExecutor;
        }
      },
      wMaker: {
        includeAny: includeAny("atop/maker/Maker.s", "wMaker"),
        isIncluded: function() {
          return !!e.wTools && !!e.wTools.Maker;
        }
      },
      wServlet: {
        includeAny: includeAny("atop/servlet/Servlet.ss", "wServlet"),
        isIncluded: function() {
          return !!e.wTools && !!e.wTools.servlet;
        }
      }
    };
    Object.assign(o, u), 
    // --
    // export
    // --
    "undefined" != typeof module && null !== module && (module.exports = o);
  }();
  // == end of file ModulesRegistryS
}();