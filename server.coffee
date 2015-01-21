urify = require 'urify'

module.exports = (app) ->

  app.once 'bundle', (b) ->
    b.transform urify