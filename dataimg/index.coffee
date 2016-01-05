module.exports = (images) -> class Dataimg
  view: require('./index.jade')

  init: ->
    @src = @model.get 'src'
    unless images[@src]
      console.error 'No datauri of minified image found for ' + @src

  getImage: (src) ->
    # If src is not provided get data-uri
    img = src ? images[@src]
    if @model.get('tag')
      bg = "url('#{ img }')"
      # tag can have additional backgrounds in background-image
      if existingBg = @model.get('backgroundImage')
        bg = existingBg + ', ' + bg
      bg
    else
      img