class ImageController
  constructor: ->
    $ =>
      @imageController = $("select.img_select")
      @initImageControllers()
      @initPreviouslyAddedImages()

  initImageControllers: ->
    img_container = $("<div class='images_container'></div>")
    @imageController.parent().append img_container
    @imageController.bind 'change', (e) =>
      options = @imageController.find("option").map( -> { img_id: $(@).val(), is_selected: $(@).is(':selected') } )
      for opt in options
        image = img_container.find("img[data-id=\"#{opt.img_id}\"]")
        console.log image
        if image.length == 0 and opt.is_selected
          $.getJSON "/images/thumb_path/#{opt.img_id}", (i) =>
            img = $("<img src='#{i.url}' data-id='#{i.id}'>")
            img_container.append img
            @bindImageClick(img)
        else if image.length > 0 and not opt.is_selected
          image.remove()

  bindImageClick: (img) ->
    img.bind 'click', (e) =>
      self = $(e.currentTarget)
      @imageController.find("option[value=\"#{self.data('id')}\"]").removeAttr("selected")
      self.remove()

  initPreviouslyAddedImages: ->
    @imageController.trigger 'change'

new ImageController()