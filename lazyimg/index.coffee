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
      @tag.style.backgroundImage = @getImage(@src)
    else
      @img.src = @getImage(@src)

  destroy: ->
    clearTimeout @timeout