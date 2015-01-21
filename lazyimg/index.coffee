module.exports = (Dataimg) -> class Lazyimg extends Dataimg
  view: __dirname
  style: __dirname

  init: ->
    super
    if window?
      @fullImg = new Image()
      @fullImg.onload = @imageLoad.bind(@)
      @fullImg.src = @src

  create: ->
    if @readyToSwitch
      @switchImage()
    else
      @created = true

  imageLoad: ->
    if @created
      @switchImage()
    else
      @readyToSwitch = true

  switchImage: ->
    if @model.get('tag')
      @tagimg.style.backgroundImage = @getImage(@src)
      @timeout = setTimeout =>
        requestAnimationFrame =>
          requestAnimationFrame =>
            @tag.style.backgroundImage = 'none'
      , 500
    else
      @img.src = @getImage(@src)

  destroy: ->
    clearTimeout @timeout