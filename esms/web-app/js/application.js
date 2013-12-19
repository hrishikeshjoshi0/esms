if (typeof jQuery !== 'undefined') {
	(function($) {
		/*$('#spinner').ajaxStart(function() {
			$(this).fadeIn();
		}).ajaxStop(function() {
			$(this).fadeOut();
		});*/
		
	   
       $(document).ready(function() {
			var autocompleteQueryField = $('input[name="q"]');
			autocompleteQueryField.attr('placeholder','Search Customer...');
			//resize();

			var p = $("select:not([name^='filter.'])");
			$(p).chosen();
				
		    var loadUrl = $('#new_tasks').attr('data-url');
		    $.ajaxSetup ({  
		       cache: true
		    });
		    
		    var ajax_load = "";  
		    $("#new_tasks").html(ajax_load).load(loadUrl);
		    
		    //
	    	$('#quicklinks').affix({
	    		offset: {
	    		   top: 240, 
	    		   bottom: 
	    			   function () {
	    		     return (this.bottom = $('#footer').outerHeight(true))
	    		   }
	    		}
	        });
	   });
       
       $(window).resize(function () { 
    	    var h = parseInt($('#main-navbar').css("height"));
    	    $('body').css('padding-top', h-h/2-3);
    	});

    	$(window).load(function () { 
    		var h = parseInt($('#main-navbar').css("height"));
    	    $('body').css('padding-top', h-h/2-3);        
    	});
	})(jQuery);
}

function resize() {
	//Resize
	var  dheight = $('body').height(),
    cbody = $('.bs-docs-sidenav').height(),
    wheight = $(window).height(),
    cheight = wheight - dheight + cbody;
    
    if (wheight > dheight){
        $('.bs-docs-sidenav').height(cheight);
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
               $('.bs-docs-sidenav').height(wheight-dheight+cbody);
       }
        
    }
}
