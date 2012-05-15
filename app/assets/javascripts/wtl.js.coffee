class Wtl
  @onMouseOutOpacity = 0.60
  @menuSpeed = 200

  constructor: ->
    $(window).load ->
      $('#gallery_wrapper').fadeIn('slow')
    $ =>
      @fancyBoxItems = $('.post a.img, .item a.img')
      @photoLoop = $('#photo_loop')
      @photoLoopClick = $("#photo_loop_click")
      @gallery = $('#thumbs')
      @opaqueElements = $('#thumbs ul.thumbs li, div.navigation a.pageLink')
      @fancyBoxPhotoLoopItems = @photoLoop.find('a')

      # order is important!
      @setupMenuClicks()
      @setupOpacityRollover()
      @setupGalleriffic() if @gallery.length > 0 && @gallery.find("ul.thumbs li").length > 0
      @setupCustomPrevNextGalleriffic()
      @setupCycle()
      @setupPhotoLoopHover()
      @setupPhotoLoopClick()
      @setupPhotoLoopFancyBox()
      @setupMenuItems()
      @setupFancyBox()

  setupMenuClicks: ->
    $('#menu ul#main a.header.with_sub').click (e) =>
      self = $(e.currentTarget)
      e.preventDefault()
      $('#menu ul#main ul.sub_menu')
        .not(self.next('.sub_menu'))
        .slideUp(@menuSpeed)
        .prev('a.header.with_sub')
        .removeClass('active')

      self.toggleClass('active')
        .next('.sub_menu')
        .slideToggle(@menuSpeed)

  setupOpacityRollover: ->
    @opaqueElements.opacityrollover
      mouseOutOpacity:   @onMouseOutOpacity
      mouseOverOpacity:  1.0
      fadeSpeed:         'fast'
      exemptionSelector: '.selected'

  setupCustomPrevNextGalleriffic: ->
      @gallery.find('a.prev').click (e) =>
        @gallery.previousPage()
        e.preventDefault()

      @gallery.find('a.next').click (e) =>
        @gallery.nextPage()
        e.preventDefault()

  setupGalleriffic: ->
    @gallery = @gallery.galleriffic
      delay:                     3000
      numThumbs:                 7
      preloadAhead:              -1
      enableTopPager:            false
      enableBottomPager:         false
      imageContainerSel:         '#slideshow'
      controlsContainerSel:      '#controls'
      captionContainerSel:       '#caption'
      loadingContainerSel:       '#loading'
      renderSSControls:          true
      renderNavControls:         true
      playLinkText:              'Play Slideshow'
      pauseLinkText:             'Pause Slideshow'
      prevLinkText:              '&lsaquo;&lsaquo; Previous Photo'
      nextLinkText:              'Next Photo &rsaquo;&rsaquo;'
      nextPageLinkText:          'Next &rsaquo;'
      prevPageLinkText:          '&lsaquo; Prev'
      enableHistory:             true
      autoStart:                 false
      syncTransitions:           true
      defaultTransitionDuration: 900
      onSlideChangeOut: (prevIndex) ->
        @.find('ul.thumbs').children().eq(prevIndex).fadeTo('fast', @onMouseOutOpacity)
      onSlideChangeIn: (nextIndex) ->
        @.find('ul.thumbs').children().eq(nextIndex).fadeTo('fast', 1.0)
      onPageTransitionOut: (callback) ->
        @.find('ul').fadeTo('fast', 0.0, callback)
      onPageTransitionIn: ->
        prevPageLink = @.find('a.prev').css('visibility', 'hidden')
        nextPageLink = @.find('a.next').css('visibility', 'hidden')
        prevPageLink.css('visibility', 'visible') if this.displayedPage > 0
        lastPage = this.getNumPages() - 1
        nextPageLink.css('visibility', 'visible') if this.displayedPage < lastPage
        @.find('ul').fadeTo('fast', 1.0)
      onTransitionIn: (slide, caption, isSync) ->
        slide.fadeTo(this.getDefaultTransitionDuration(isSync), 1.0)
        caption.fadeTo(this.getDefaultTransitionDuration(isSync), 1.0) if caption

  setupPhotoLoopClick: ->
    @photoLoopClick.click(@photo_loop_click);

  setupCycle: =>
    @photoLoop.cycle
      fx: 'uncover', speed: 1000, timeout: 3000

  setupMenuItems: ->
    $('#menu ul.sub_menu li:first-child').addClass 'first'

  setupFancyBox: ->
    @fancyBoxItems.fancybox
      overlayOpacity: .7
      overlayColor: '#000000'
      onStart: =>
        @photoLoop.cycle('toggle')
        @photoLoopClick.unbind('click')
      onClosed: =>
        @photoLoop.cycle('toggle')
        @photoLoopClick.click(@photo_loop_click)
      titlePosition: 'over'
      transitionIn: 'elastic'
      transitionOut: 'elastic'

  photo_loop_click: =>
    @photoLoop.find('a:visible').click()

  setupPhotoLoopHover: ->
    @photoLoopClick.hover( -> $('#photo_loop').cycle('toggle')
    -> $('#photo_loop').cycle('toggle') )

  setupPhotoLoopFancyBox: ->
    @fancyBoxPhotoLoopItems.fancybox
      overlayOpacity: .7
      overlayColor: '#000000'
      onStart: =>
        @photoLoop.cycle('toggle')
        @photoLoopClick.unbind('click')
      onClosed: =>
        @photoLoop.cycle('toggle')
        @photoLoopClick.click(@photo_loop_click)
      titlePosition: 'over'
      transitionIn: 'elastic'
      transitionOut: 'elastic'
      orig: @photoLoop

new Wtl()     