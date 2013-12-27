(function($){
    $.fn.expandable = function() {
        var element = this;

        //On Row Click, Expand Row.
        $(element).find("tr").find('a.expandRow').click(function(e) {
            //$(this).next("tr").toggle();
        	e.preventDefault();
        	
        	var link = $(this);
        	link.toggleClass("expanded");
        	
        	var curRow = link.closest('tr');
        	
        	var cols = 0;
            $(curRow).find('td').each(function () {            
            	var cspan = $(this).attr('colspan');
                if (!cspan) cspan = 1;
                cols += parseInt(cspan, 10); 
            });
        	
        	var loadingDiv = $('#spinner').clone();
        	loadingDiv.attr('style','text-align:center');
        	
        	var numRand = Math.floor(Math.random()*101)
        	var id = "expandedRow"+numRand;
        	
        	if(link.hasClass("expanded")) {
        		var detailRow = $('<tr><td id="' + id + '" colspan="' + cols + '"></td></tr>');
        		$(curRow).after(detailRow);
        		
        		var div = $('#' + id);
        		div.html(loadingDiv);
        		
        		$.ajax({
	      		  url: $(link).attr('href'),
	      		}).done(function(data) {
	      			div.html(data);
	      		});
        		
        	} else {
        		$(curRow).next().remove();
        	}
        	
        	return false;
        });
    }    
})(jQuery); 