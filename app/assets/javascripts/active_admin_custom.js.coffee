class ImageController
  constructor: ->
    $ =>
      @form = $("form")
      @selectUI = $("<div id='selectUI'></div>").css("float", "left")
      @imgContainer = $("<div class='images_container'></div>")
      @imageSelect = $("select.img_select")
      @imgData = @imageSelect.find("option").map ->
        self = $(this)
        value: self.val(), descrption: null, imageSrc: self.attr("title"), selected: self.is(":selected")
      @inputName = @imageSelect.attr("name")
      @imageSelect.parent().html(@selectUI)
      @setupImageSelector()
      @displaySelectedImages()
      @form.append("<input type='hidden', name='#{@inputName}'/>")

  displaySelectedImages: ->
    for img in @imgData
      if img.selected
        img_tag = $("<img src='#{img.imageSrc}' data-id='#{img.value}'>")
        @imgContainer.append img_tag
        @form.append("<input type='hidden', name='#{@inputName}' value='#{img.value}'/>")
        @bindImgClick(img_tag)

  setupImageSelector: =>
    @selectUI.ddslick
      data: @imgData
      width: 488
      height: 250
      imagePosition: "left"
      selectText: "Add Image"
      onSelected: (data) =>
        @selectUI.find(".dd-selected").html("Add Image")
        existing_img = @imgContainer.find("img[data-id=\"#{data.selectedData.value}\"]")
        if existing_img.length == 0
          img = $("<img src='#{data.selectedData.imageSrc}' data-id='#{data.selectedData.value}'>")
          @imgContainer.append img
          @form.append("<input type='hidden', name='#{@inputName}' value='#{data.selectedData.value}'/>")
          @bindImgClick(img)
          $(@imgContainer).effect('highlight', 800)
    .before("<label>Images</label>").after(@imgContainer)

  bindImgClick: (img) ->
    img.bind 'click', (e) =>
      self = $(e.currentTarget)
      @form.find("input[name=\"#{@inputName}\"][value=\"#{self.data('id')}\"]").remove()
      self.remove()

new ImageController()