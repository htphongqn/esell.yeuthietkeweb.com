//Scripts click Toggle
$(document).ready(function() {
var notH = 1,
    $pop = $('.contentEGP').hover(function(){notH^=1;});

$(document).on('mouseup keyup', function( e ){
  if(notH||e.which==27) $pop.stop().hide();
});
/////// CALL POPUP 
$('.filter_name').click(function(){
	jQuery(this).find('.contentEGP').slideDown("fast").end().siblings().find('.contentEGP').hide('fast');							 
	event.stopPropagation();  
});

//Nivo Slide Responsive
$('#slider').nivoSlider();	
});        


$( function(){    			
//Left Menu		
//var columns    = 3,
//	setColumns = function() { columns = $( window ).width() > 750 ? 3 : $( window ).width() > 500 ? 2 : 1; };
//	setColumns();
//	    $( window ).resize( setColumns );	
//		$('.m_li').bind('mouseenter', function () {
//
//            $(this).find('.list_categories').stop(true, true).fadeIn(200);
//				var columns    = 3,
//				setColumns = function() { columns = $( window ).width() > 750 ? 3 : $( window ).width() > 500 ? 2 : 1; };
//				setColumns();
//	   				$( window ).resize( setColumns );	
//        		$( '.subcatwrapper' ).masonry(
//	    		{
//	        	itemSelector: '.pc_menu',
//	        	columnWidth:  function( containerWidth ) { return containerWidth / columns; }
//	    	});
//        }).bind('mouseleave', function () {
//
//            //$(this).find('.list_categories').stop(true, true).fadeOut(200, function () {
//
//            //});
//        });		
		
//CarouFedsel   	
		//$('#slide_viewed_P ul').carouFredSel({
//					prev: '#prev_viewedP',
//					next: '#next_viewedP',
//					auto: { pauseDuration: 4000, duration: 1000 },
//					direction: 'up',
//					scroll : {
//						items	: 1,
//			            pauseOnHover: true
//        			},
//					speed: 2000,
//					duration: 8000,	
//					items: {
//						height: 50,				
//						visible: {
//							min: 1,
//							max: 3
//						}
//					}
//				});					
		
		$('#popular_products ul').carouFredSel({					
					prev: '#prev_popP',
					next: '#next_popP',					
					auto: { pauseDuration: 3000, duration: 1500 },	
					scroll : {
						items	: 4,
			            pauseOnHover: true
        			},
					speed: 2000,
					duration: 4000,
					items: {			
						visible: {
							min: 1,
							max: 4
						}
					}
				});
		
		$('#thesame_products ul').carouFredSel({					
					prev: '#prev_thesameP',
					next: '#next_thesameP',					
					auto: { pauseDuration: 3000, duration: 1500 },	
					scroll : {
						items	: 1,
			            pauseOnHover: true
        			},
					speed: 2000,
					duration: 4000,
					items: {			
						visible: {
							min: 1,
							max: 4
						}
					}
				});
		
		$('.zoom-desc ul').carouFredSel({					
					prev: '#prev_thumb',
					next: '#next_thumb',					
					auto: { pauseDuration: 20000, duration: 1000 },
					direction: 'up',
					scroll : {
						items	: 1,
			            pauseOnHover: true
        			},
					speed: 2000,
					duration: 8000,	
					items: {						
						visible: {
							min: 1,
							max: 5
						}
					}
				});
		
		$('#bestselling_products ul').carouFredSel({					
					prev: '#prev_bestsellP',
					next: '#next_bestsellP',					
					auto: { pauseDuration: 4000, duration: 1500 },	
					scroll : {
						items	: 1,
			            pauseOnHover: true
        			},
					speed: 2000,
					duration: 4000,
					items: {			
						visible: {
							min: 1,
							max: 5
						}
					}
				});	
		
		$('#slide_viewed_P ul').carouFredSel({					
					prev: '#prev_viewedP',
					next: '#next_viewedP',
					auto: { pauseDuration: 5000, duration: 1500 },	
					scroll : {
						items	: 1,
			            pauseOnHover: true
        			},
					speed: 2000,
					duration: 4000,
					items: {			
						visible: {
							min: 1,
							max: 8
						}
					}
				});			
				
				$('#sl_trademark ul').carouFredSel({					
					prev: '#prev_trademark',
					next: '#next_trademark',
					auto: { pauseDuration: 5000, duration: 1500 },	
					scroll : {
						items	: 1,
			            pauseOnHover: true
        			},
					speed: 2000,
					duration: 4000,
					items: {			
						visible: {
							min: 1,
							max: 8
						}
					}
				});			
		
});	
///home_menu la class add o trang chu

$(".home_menu").closest(".show_menu").find(".tab_cate").hide();
$(".home_menu").closest(".show_menu").find(".tab_cate").hide();
//
$(".show_menu").closest(".top_main").find(".info_header").hide();


//$( ".t_menu" ).hover(
//			function() {
//					$( this ).addClass( "hover" );
//			} 
//	);
//	
	
	$( ".home_menu .t_menu" ).mouseover(function() {
	//	$(this).addClass('ttop');
	//$('.list_categories').removeClass('hover');
	$('.m_li').removeClass('active');
	$(this).closest('.m_li').addClass('active');
	//$(this).closest('.m_li.active').find('.list_categories').show();
	//$(this).closest('.m_li.active').find('.list_categories').css('display','block');
	//$(this).closest('.m_li.active').find('.list_categories').addClass('hover');
//	$('.m_li.active').find('.list_categories').show();
$('.m_li').find('.list_categories').css('display','none');
			$('.m_li.active').find('.list_categories').css('display','block');
	});
	//mouseleave
	$( ".home_menu .t_menu" ).mouseleave(function() {
		
		$('.m_li').removeClass('active');
		$(this).closest('.m_li').addClass('active');
		//$('.m_li.active').find('.list_categories').show();
		$('.m_li').find('.list_categories').css('display','none');
			$('.m_li.active').find('.list_categories').css('display','block');
			});
			
			
			
			
			
//	$( ".home_menu .t_menu" )
//  .mouseover(function() {
//   	$(this).closest('.m_li').find('.list_categories').show();
//	$(this).closest('.m_li').find('.list_categories').css('display','block');
//	$(this).closest('.m_li').find('.list_categories').addClass('hover');
//  })
//  .mouseout(function() {
//    $('.list_categories').removeClass('hover');
//  });
 
//	$(".home_menu .t_menu").mouseleave(function(){
//   $('.list_categories').removeClass('hover');
//});