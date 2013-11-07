if (typeof jQuery !== 'undefined') {
	(function($) {
		$('#spinner').ajaxStart(function() {
			$(this).fadeIn();
		}).ajaxStop(function() {
			$(this).fadeOut();
		});
		
	   $("select").chosen();
		
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
			resize();
	   });

	})(jQuery);
}


function resize() {
	//Resize
	var  dheight = $('body').height(),
    cbody = $('#maincontainer').height(),
    wheight = $(window).height(),
    cheight = wheight - dheight + cbody;
    
    if (wheight > dheight){
        $('#maincontainer').height(cheight);
    }
    
    $(window).resize(function(){
        wheight = $(window).height();
        noscroll();
        changepush();
    });

    function noscroll(){
       if (wheight > dheight) {
            $('body').addClass('noscroll');
       }

        else if (wheight <= dheight) {
            $('body').removeClass('noscroll');
        }
        
        else {}

    }

    function changepush(){
       if (wheight > dheight) {
               $('#maincontainer').height(wheight-dheight+cbody);
       }
        
    }
}
