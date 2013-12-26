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

function onLoading(elem) {
	var loadingDiv = $('#spinner').clone();
	loadingDiv.attr('style','text-align:center');
	$(elem).html(loadingDiv);
}

function openModalBox(data,title) {
	var modalTemplate = $('#modalTemplate').clone();
	$(modalTemplate).find('.modal-title').html(title);
	
	onLoading($(modalTemplate).find('.modal-body'));
	
	$(modalTemplate).find('.modal-body').html(data);
	
	$(modalTemplate).on("show.bs.modal", function() {
		var height = $(window).height() - 150;
		$(this).find(".modal-body").css("max-height", height);
	});
	
	modalTemplate.modal('show');
}

function configureDropdowns() {
	var p = $("select:not([name^='filter.'])");
	$(p).chosen();
}
