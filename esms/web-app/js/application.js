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
       
       
       var loadUrl = $('#new_tasks').attr('data-url');
       $.ajaxSetup ({  
           cache: false  
       });  
       var ajax_load = "Loading";  
       $("#new_tasks").html(ajax_load).load(loadUrl);  
       
       /*$('.modal').live('hidden', function(e) {
    	    location.reload();
    	});*/
       
       $(document).ready(function() {
			var autocompleteQueryField = $('input[name="q"]');
			autocompleteQueryField.attr('placeholder','Search Customer...');
			//$('.yui-ac').prepend("<span class='add-on'><i class='icon-user'></i></span>");
	   });

	})(jQuery);
}
