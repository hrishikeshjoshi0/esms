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
        	
        	console.log(cols);
        	
        	var loadingDiv = $('#spinner').clone();
        	
        	if(link.hasClass("expanded")) {
        		var detailRow = $('<tr><td id="expandedRow" colspan="' + cols + '"></td></tr>');
        		$(curRow).after(detailRow);
        		
        		loadingDiv.attr('style','text-align:center');
        		
        		$('#expandedRow').html(loadingDiv);
        		
        		$.ajax({
	      		  url: $(link).attr('href'),
	      		}).done(function(data) {
	      			$('#expandedRow').html(data);
	      		});
        		
        	} else {
        		$(curRow).next().remove();
        	}
        	
        	return false;
        });
    }    
})(jQuery); 