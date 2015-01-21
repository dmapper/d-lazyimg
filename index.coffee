module.exports = (app, images) ->
  Dataimg = require('./dataimg')(images)
  app.component Dataimg
  app.component require('./lazyimg')(Dataimg)
  app.derby.util.serverRequire(module, './server')? app
