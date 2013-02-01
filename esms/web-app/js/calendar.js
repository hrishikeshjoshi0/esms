$(document).ready(function() {
    renderCalendar();
    setupDatePickers();
    setupRecurOptions();
    setupRecurSavePopups();
});

function renderCalendar() {
    $("#calendar").fullCalendar({
        events: 'list.json',
        header: {
            left: 'prev,next today',
            center: 'title',
            right: 'month,agendaWeek,agendaDay'
        },
        eventRender: function(event, element) {
            $(element).addClass(event.cssClass);

            /*var occurrenceStart = event.occurrenceStart;
            var occurrenceEnd = event.occurrenceEnd;

            var data = {id: event.id, occurrenceStart: occurrenceStart, occurrenceEnd: occurrenceEnd};

            $(element).qtip({
                content: {
                    text: 'Event:' + event.title,
                    ajax: {
                        url: "show",
                        method: 'GET',
                        data: data
                    }
                },
                show: {
                    event: 'click',
                    solo: true
                },
                hide: {
                    event: 'click'
                },
                style: {
                    width: '500px',
                    widget: true
                },
                position: {
                    my: 'bottom middle',
                    at: 'top middle',
                    viewport: true
                },
                tip : true
            });*/
        },
        eventClick: function(event, jsEvent, view) {
            //$this = $(this);
           /* $this.popover({
            	offset: 10,
            	html:true,
            	title:event.title,
            	trigger:'manual',
            	placement:'top',
            	content : showEventPopover(event),
            	template: '<div class="popover" onmouseover="clearTimeout(timeoutObj);$(this).mouseleave(function() {$(this).hide();});"><div class="arrow"></div><div class="popover-inner"><h3 class="popover-title"></h3><div class="popover-content"><p></p></div></div></div>'
            }).mouseenter(function(e) {
                $(this).popover('show');
            }).mouseleave(function(e) {
                var ref = $(this);
                timeoutObj = setTimeout(function(){
                    ref.popover('hide');
                }, 50);
            });*/
        	
        	var occurrenceStart = event.occurrenceStart;
            var occurrenceEnd = event.occurrenceEnd;
            var data = {id: event.id, occurrenceStart: occurrenceStart, occurrenceEnd: occurrenceEnd};
            
            var res;
            
        	$.ajax({
        		 url: "show",
        		 method: 'GET',
        		 data: data,
        		 async:false,
        		 success: function(d) {
        			res = d;
        	    }  
        	});
            
            $(this).clickover({
              placement:'top',
              html : true,
              content : res//showEventPopover(event)
            });
            
            //return false;            
        },
        eventMouseover: function(event, jsEvent, view) {
            $(this).addClass("active");
        },
        eventMouseout: function(event, jsEvent, view) {
           $(this).removeClass("active");
        }
    });
}

function showEventPopover(event) {
	var occurrenceStart = event.occurrenceStart;
    var occurrenceEnd = event.occurrenceEnd;
    var data = {id: event.id, occurrenceStart: occurrenceStart, occurrenceEnd: occurrenceEnd};
    
    var res;
    
	$.ajax({
		 url: "show",
		 method: 'GET',
		 data: data,
		 async:false,
		 success: function(d) {
			res = d;
	    }  
	});
    
    /*var html = "<div class='eventPopup'><h2>" + event.title + "</h2><p class='date'>" + event.start + "-" + event.end + "</p><p>" +
    "<a href='/event/show?id=" + event.id + "&occurrenceStart=" + event.occurrenceStart + 
	"&occurrenceEnd=" +  event.occurrenceEnd + "'>More details</a></p></div>"*/
	
	return res;
	//return $('#popoverDiv').html();
}

function setupDatePickers() {
    $("input.datetime").datetimepicker({
        ampm: true,
        stepMinute: 15
    });
}


function setupRecurSavePopups() {
    $(".delete.recurring").live('click', function() {
        $("#deletePopup").dialog({
            title: "Delete recurring event",
            width: 400,
            modal: true
         });

        return false;
    });

    var editPopup = $("#editPopup").dialog({
        title: "Update recurring event",
        width: 400,
        modal: true,
        autoOpen: false
    });

    $(".save.recurring").click(function() {
        var editTypeField = $("#editType");

        if ($(editTypeField).val() == "") {
            $(editPopup).dialog('open');
            return false;
        }
        else {
            return true;
        }
    });

    $("#editPopup button").click(function() {
        $("#editType").val($(this).val());
        $(editPopup).dialog('close');
        $(".save.recurring").trigger('click');
    });

}


function setupRecurOptions() {

    $("#isRecurring").change(function() {
        if ($(this).is(":checked")) {
            showRecurPopup();
            $("#editRecurringLink").show();
        }
        else {
            $("#editRecurringLink").hide();
        }

        updateRecurDescriptions();
    });


    $("#editRecurringLink").click(function() {
        showRecurPopup();
    });

    $("#recurType").change(function() {

        if ($(this).val() == "WEEKLY") {
            $("#weeklyOptions").show();
        }
        else {
            $("#weeklyOptions").hide();
        }

        updateRecurDescriptions();
    });

    $("#recurInterval, input[name='recurDaysOfWeek']").change(function() {
        updateRecurDescriptions();
    });


    $("input[name='recurEndOption']").click(function() {
        if ($(this).val() == "never") {
            $("#recurUntil").val('');
            $("#recurCount").val('');
        }
        if ($(this).val() == "occurrences") {
            $("#recurUntil").val('');
        }
        else {
            $("#recurCount").val('');
        }
        updateRecurDescriptions();
    });

    $("#recurUntil, #recurCount").focusout(function() {
        // Make sure correct option is checked
        var checkboxId = + $(this).parent("label").attr("for");
        $("#" + checkboxId).attr("checked", true);

        updateRecurDescriptions();
    });

    $("#recurUntil").datetimepicker({
        ampm: true,
        onSelect: function(dateText, inst) {
            // Make sure correct option is checked
            var checkboxId = + $(this).parent("label").attr("for");
            $("#" + checkboxId).attr("checked", true);

            updateRecurDescriptions();
        }
    });

    updateRecurDescriptions();
}

function showRecurPopup() {

    var recurPopup = $("#recurPopup").dialog({
        title: 'Repeat',
        width: 400,
        modal: true,
        open: function(event, ui) {
          $("#recurOptions").show().appendTo("#recurPopup");
        },
        close: function(event, ui) {
          $("#recurOptions").hide().appendTo("form.main");
        },
        buttons: {
            Ok: function() {
                $( this ).dialog( "close" );
            }
        }
    });

}


function getRecurDescription() {
    var description = ' ';
    var recurType = $("#recurType option:selected").text();
    var recurUntil = $("#recurUntil").val();
    var recurCount = $("#recurCount").val();
    var recurInterval = $("#recurInterval").val();

    if ($("#isRecurring").is(":checked")) {

        if (recurInterval == 1) {
            description += recurType;
        }
        else {
            description += "Every " + recurInterval + " " + getRecurTypeUnit(recurType);
        }

        if (recurType == "Weekly") {
            description += " on ";
            $("input[name='recurDaysOfWeek']:checked").each(function() {
                description += " " + $(this).attr("title") + ",";
            });

            // Remove last comma
            description = description.replace(/,$/,'');
        }

        if (recurCount) {
            description += ", " + recurCount + " times" ;
        }
        else if (recurUntil) {
            description += ", until " + recurUntil;
        }

    }
    else {
        description = "..." ;
    }

    return description;
}

function getRecurTypeUnit(recurType) {
    var result = "";

    switch(recurType)
    {
        case "Daily":
            result = "days";
            break;
        case "Weekly":
            result = "weeks";
            break;
        case "Monthly":
            result = "months";
            break;
        case "Yearly":
            result = "years";
    }
    return result;
}


function updateRecurDescriptions() {
    var recurType = $("#recurType option:selected").text();

    var description = getRecurDescription();
    $("#recurDescription").html(description);
    $("#recurSummary").html(description);

    var repeatType = getRecurTypeUnit(recurType);
    $("#repeatLabel").html(repeatType);
}
