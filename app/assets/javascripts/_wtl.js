/*
  Walk The Line Tattoo Co. - custom jquery
*/

/* Ready Function */
$(document).ready(function(){
  /*
    Add class to first LI elements of all submenus
  */
  $('#menu ul.sub_menu li:first-child').addClass('first');
  
  /* Setup fancybox for posts and store items */
  $('.post a, .item a').fancybox({
    overlayOpacity: .7,
	overlayColor: '#000000',
	onStart: function(){
	  $('#photo_loop').cycle('toggle');
	  $("#photo_loop_click").unbind('click');
	},
	onClosed: function(){
	  $('#photo_loop').cycle('toggle');
	  $("#photo_loop_click").click(photo_loop_click);
	},
	titlePosition: 'over',
	transitionIn: 'elastic',
	transitionOut: 'elastic'
  });//photo loop fancybox
  
  /*
    Photo Loop Cycle Plugin
  */
  $('#photo_loop').cycle({fx: 'uncover', speed: 1000, timeout: 3000});//cycle
  
  /* Pause slideshow on hover, resume on mouse out */
  $('#photo_loop_click').hover(function(){
    $('#photo_loop').cycle('toggle');
  }, function(){
    $('#photo_loop').cycle('toggle');
  });
  
  /* Setup fancybox for photo loop */
  $('#photo_loop a').fancybox({
    overlayOpacity: .7,
	overlayColor: '#000000',
	onStart: function(){
	  $('#photo_loop').cycle('toggle');
	  $("#photo_loop_click").unbind('click');
	},
	onClosed: function(){
	  $('#photo_loop').cycle('toggle');
	  $("#photo_loop_click").click(photo_loop_click);
	},
	titlePosition: 'over',
	transitionIn: 'elastic',
	transitionOut: 'elastic',
	orig:$('#photo_loop')
  });//photo loop fancybox
  
  /* setup photo_loop_click to fire on correct image underneath */
  $("#photo_loop_click").click(photo_loop_click);
  
  /* Menu click */
  speed = 300;
  $('#menu ul#main a.header.with_sub').click(function(){
    //slide up any active sub menus except the one we clicked
	$('#menu ul#main ul.sub_menu')
	  .not($(this).next('.sub_menu'))
	  .slideUp(speed)
	  .prev('a.header.with_sub')
	  .removeClass('active');
	
	//toggle this sub menu
    $(this).toggleClass('active')
	  .next('.sub_menu')
	  .slideToggle(speed);
	  
	return false;
  });//click

				// Initially set opacity on thumbs and add
				// additional styling for hover effect on thumbs
				var onMouseOutOpacity = 0.60;
				$('#thumbs ul.thumbs li, div.navigation a.pageLink').opacityrollover({
					mouseOutOpacity:   onMouseOutOpacity,
					mouseOverOpacity:  1.0,
					fadeSpeed:         'fast',
					exemptionSelector: '.selected'
				});
				
				// Initialize Advanced Galleriffic Gallery
				var gallery = $('#thumbs').galleriffic({
					delay:                     3000,
					numThumbs:                 7,
					preloadAhead:              -1,
					enableTopPager:            false,
					enableBottomPager:         false,
					imageContainerSel:         '#slideshow',
					controlsContainerSel:      '#controls',
					captionContainerSel:       '#caption',
					loadingContainerSel:       '#loading',
					renderSSControls:          true,
					renderNavControls:         true,
					playLinkText:              'Play Slideshow',
					pauseLinkText:             'Pause Slideshow',
					prevLinkText:              '&lsaquo;&lsaquo; Previous Photo',
					nextLinkText:              'Next Photo &rsaquo;&rsaquo;',
					nextPageLinkText:          'Next &rsaquo;',
					prevPageLinkText:          '&lsaquo; Prev',
					enableHistory:             true,
					autoStart:                 false,
					syncTransitions:           true,
					defaultTransitionDuration: 900,
					onSlideChangeOut: function(prevIndex) {
		              // 'this' refers to the gallery, which is an extension of $('#thumbs')
		              this.find('ul.thumbs').children()
			         .eq(prevIndex).fadeTo('fast', onMouseOutOpacity);
	               },
	               onSlideChangeIn: function(nextIndex) {
		             this.find('ul.thumbs').children()
			         .eq(nextIndex).fadeTo('fast', 1.0);
	               },
				   onPageTransitionOut: function(callback) {
		             this.find('ul').fadeTo('fast', 0.0, callback);
		           },
		           onPageTransitionIn: function(){
		             var prevPageLink = this.find('a.prev').css('visibility', 'hidden');
		             var nextPageLink = this.find('a.next').css('visibility', 'hidden');
						
		             // Show appropriate next / prev page links
		             if (this.displayedPage > 0)
		               prevPageLink.css('visibility', 'visible');

		             var lastPage = this.getNumPages() - 1;
		             if (this.displayedPage < lastPage)
		               nextPageLink.css('visibility', 'visible');

		             this.find('ul').fadeTo('fast', 1.0);
		           },
		           onTransitionIn: function(slide, caption, isSync) {
		             slide.fadeTo(this.getDefaultTransitionDuration(isSync), 1.0);
		             if(caption){
		               caption.fadeTo(this.getDefaultTransitionDuration(isSync), 1.0);
		             }
		           }
				});

				/**************** Event handlers for custom next / prev page links **********************/

				gallery.find('a.prev').click(function(e) {
					gallery.previousPage();
					e.preventDefault();
				});

				gallery.find('a.next').click(function(e) {
					gallery.nextPage();
					e.preventDefault();
				});

				/****************************************************************************************/
});//ready

/* fade in gallery after images load */
$(window).load(function(){
  $('#gallery_wrapper').fadeIn('slow');
});

/*
Photo loop click div
This function will trigger a click on the visible image
This is because images are placed behind the header image
*/
photo_loop_click = function(){
  $('#photo_loop a:visible').click();
  return false;
};