var mime = require('mime')

module.exports = function (content) {
  this.cacheable()
  var mimetype = mime.lookup(this.resourcePath)
  return 'module.exports = ' + JSON.stringify(
      'data:' + (mimetype ? mimetype + ';' : '') + "base64," +
      content.toString('base64')
  )
}
module.exports.raw = true;