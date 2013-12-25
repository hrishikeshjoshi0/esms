if (typeof jQuery !== 'undefined') {
	(function($) {
		/*$('#spinner').ajaxStart(function() {
			$(this).fadeIn();
		}).ajaxStop(function() {
			$(this).fadeOut();
		});*/
		
	   $(document).ajaxSuccess(function() {
		   configureDropdowns();
	   });
		
	   
       $(document).ready(function() {
			var autocompleteQueryField = $('input[name="q"]');
			autocompleteQueryField.attr('placeholder','Search Customer...');

			configureDropdowns();
				
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
	    	
	    	$('.expandableTable').expandable();
	    	
	    	/*$('.yui-content').slimScroll({
	    	});*/
	    	
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

function openModalBox() {
	var loadingDiv = $('#spinner').clone();
	loadingDiv.attr('style','text-align:center');
	
	$.ajax({
	  url: $(link).attr('href'),
	}).done(function(data) {
 	  $('#expandedRow').html(data);
	});
}

function configureDropdowns() {
	var p = $("select:not([name^='filter.'])");
	$(p).chosen();
}
