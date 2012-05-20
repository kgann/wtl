class ImageController
  constructor: ->
    $ =>
      @form = $("form")
      @selectUI = $("<div id='selectUI'></div>").css("float", "left")
      @profileImageSelectUI = $("<div id='prfileImageSelectUI'></div>").css("float", "left")
      @imgContainer = $("<div class='images_container'></div>")
      @imageSelect = $("select.img_select")
      @profileImageSelect = $("#artist_profile_image_id")
      @profileImageSelectedImage = $("#artist_profile_image_id").val()
      @imgData = @imageSelect.find("option").map ->
        self = $(this)
        value: self.val(), descrption: null, imageSrc: self.attr("title"), selected: self.is(":selected")
      @profileImageData = @imgData.slice()
      @profileImageData.push(text: "Remove", value: "REMOVE")
      @inputName = @imageSelect.attr("name")
      @prfileImageInputName = @profileImageSelect.attr("name")
      @imageSelect.parent().html(@selectUI)
      @profileImageSelect.parent().html(@profileImageSelectUI)
      @setupImageSelector()
      @displaySelectedImages()
      @form.append("<input type='hidden', name='#{@inputName}'/>")

  displaySelectedImages: ->
    @profileImageSelectUI.find(".dd-option-value[value=\"#{@profileImageSelectedImage}\"]").next().click()
    @profileImageSelectUI.find(".dd-options").hide()
    @profileImageSelectUI.find("span.dd-pointer-up").removeClass("dd-pointer-up")
    for img in @imgData
      if img.selected
        img_tag = $("<img src='#{img.imageSrc}' data-id='#{img.value}'>")
        @imgContainer.append img_tag
        @form.append("<input type='hidden', name='#{@inputName}' value='#{img.value}'/>")
        @bindImgClick(img_tag)

  setupImageSelector: ->
    @profileImageSelectUI.ddslick
      data: @profileImageData
      width: "76%"
      height: 250
      imagePosition: "left"
      selectText: "Select Image"
      onSelected: (data) =>
        if data.selectedData.value == "REMOVE"
          @profileImageSelectUI.find(".dd-selected").html("Add Image")
          @profileImageSelectUI.find(".dd-selected-value").attr("value", null)
        else
          @profileImageSelectUI.find(".dd-selected-value").attr("name", @prfileImageInputName)
    .before("<label>Profile Image</label>").after(@imgContainer)

    @selectUI.ddslick
      data: @imgData
      width: "76%"
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
    .before("<label>Images</label>").after(@imgContainer)

  bindImgClick: (img) ->
    img.bind 'click', (e) =>
      self = $(e.currentTarget)
      @form.find("input[name=\"#{@inputName}\"][value=\"#{self.data('id')}\"]").remove()
      self.remove()

new ImageController()