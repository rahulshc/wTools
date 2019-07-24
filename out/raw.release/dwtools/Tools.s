!function ToolsS() {
  // == begin of file ToolsS
  if ("undefined" != typeof module) {
    if ("undefined" == typeof _global_ || !_global_.wBase) {
      let e = "./Base.s", o = 0;
      try {
        e = require.resolve(e);
      } catch (e) {
        o = 1, require("wTools");
      }
      o || require(e);
    }
    module.exports = _global_.wTools;
  }
  // == end of file ToolsS
}();