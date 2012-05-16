class ImageController
  constructor: ->
    $ =>
      @imageControllers = $("select.img_select")
      @initImageControllers()
      @initPreviouslyAddedImages()

  initImageControllers: ->
    for select in @imageControllers
      img_container = $("<div class='images_container'></div>")
      $(select).parent().append img_container
      $(select).find('option').bind 'click', (e) =>
        self = $(e.currentTarget)
        id = self.val()
        if self.is(':selected')
          if img_container.find("img[data-id=\"#{id}\"]").length == 0
            $.post "/images/thumb_path/#{id}", (path) =>
              img = $("<img src='#{path}' data-id='#{id}'>")
              img_container.append(img)
              img.bind 'click', (e) =>
                self = $(e.currentTarget)
                @imageControllers.find("option[value=\"#{self.data('id')}\"]").removeAttr("selected")
                img.remove()
        else
          img_container.find("img[data-id=\"#{id}\"]").remove()

  initPreviouslyAddedImages: ->
    @imageControllers.find('option').click()

new ImageController()