if (typeof jQuery !== 'undefined') {
	(function($) {
		$('#spinner').ajaxStart(function() {
			$(this).fadeIn();
		}).ajaxStop(function() {
			$(this).fadeOut();
		});
		
		$("select").chosen();
		
	   $(".slidingDiv").hide();
       $(".show_hide").show();
 
       $('.show_hide').click(function(){
    	   $(".slidingDiv").slideToggle();
	   });

	})(jQuery);
}
