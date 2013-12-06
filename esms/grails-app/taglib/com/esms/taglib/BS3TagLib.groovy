package com.esms.taglib

import grails.util.GrailsNameUtils;

class BS3TagLib {
	
	static namespace = "bs3"
	
	/**
	 * <b>Tag</b> : pageHeader <br/>
	 * <b>Attributes</b> : <br/>
	 * pageHeaderLabel : The argument would be passed to the i18n resource file for the header name. 
	 * The format for the header label would be pageHeaderLabel.label
	 */
	def pageHeader = { attrs ->
		out << """<div class="page-header"><h3>"""
		out << attrs.pageHeaderLabel
		out << 	"""</h3></div>"""		
	}

	/**
	 * <b>Tag</b> : paginate <br/>
	 * <b>Attributes</b> : <br/>
	 * params : params. <br/>
	 * total : total number of records. 
	 */
	def paginate = { attrs ->
		if (attrs.total == null) {
			throwTagError("Tag [paginate] is missing required attribute [total]")
		}
		out << bootstrap.paginate(params:attrs.params,total:attrs.total) 
	}
	
	
	def table = { attrs,body ->
		def style = attrs.style?attrs.style:" "
		def columns = attrs.columns
		if (attrs.total == null) {
			throwTagError("Tag [table] is missing required attribute [columns]")
		}
		
		out << 	"""<div class="table-responsive">
				<table class="table table-striped table-hover table-condensed table-bordered ${style}">"""
		out << """<thead>"""
		out << """<tr>"""
		
		columns?.each {  it ->
			if(it?.empty) {
				out << """<th></th>"""
			} else {
				out << sortableColumn(property:it,title:message(code: it+ '.label', default: GrailsNameUtils.getNaturalName(it))) 
			}
		}
		
		out << """</tr>"""				
		out << """</thead>"""
		out << """<tbody>"""
		
		out << body()			
						
		out << """</tbody>"""
		out << """</table>"""	
		
		out << paginate(params:attrs.filterParams,total:attrs.total) 
		out << """</div>"""		
	}
	
	def form = { attrs ->
		def template = attrs.template?attrs.template:"form"
		def id = attrs.bean?.id
		
		out << """<div class="well">
					<g:form class="form-horizontal" action="${attrs.action}">
						<fieldset>"""
		out << render(template:template)
		out << """		<div class="form-group">
								<div class="col-lg-10 col-lg-offset-2">
									<button type="submit" class="btn btn-sm btn-primary">
										${message(code:"default.button.${attrs.action}.label",default:"${GrailsNameUtils.getNaturalName(attrs.action)}")}
									</button>
								</div>"""
								if(attrs.action == 'edit') {
									out << """<button type="submit" class="btn btn-danger"
												 name="_action_delete" formnovalidate>
												 <i class="icon-trash icon-white"></i>
												 <g:message code="default.button.delete.label" default="Delete" />
											</button>"""
								}

		out <<	"""</div>
						</fieldset>
					</g:form>
				</div>"""
	}
	
	def modalLink = { attrs,body ->
		def cls = attrs.class
		def id = attrs.id
		def title =  attrs.title
		def href = attrs.href
		
		def modalDialog = id + "Dialog"
		def modalLink = id + "ModalLink"
		def modalHeader = id + "ModalHeader"
		def modalBody = id + "ModalBody"
		
		out << """
				<a id="${modalLink}" class="btn btn-default btn-xs ${cls}" 
						href="${href}">${title}</a>
				
				<!-- Modal -->
				<div id="${modalDialog}" class="modal fade modal-wide" id="${id}" tabindex="-1" role="dialog" 
					aria-labelledby="myModalLabel_${id}" aria-hidden="true">
				    <div class="modal-dialog">
				        <div class="modal-content modal-wide">
				            <div class="modal-header">
				                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
				                 <h4 class="modal-title" id="myModalLabel_${id}">
									${title}
								 </h4>
				            </div>
				            <div id="${modalBody}" class="modal-body">
								
							</div>            
				        </div>
				        <!-- /.modal-content -->
				    </div>
				    <!-- /.modal-dialog -->
				</div>
				<!-- /.modal -->"""
		out << """
				<script type="text/javascript">
					\$('document').ready(function(){
					    var link = \$('#${modalLink}');
						\$(link).click(function(e) {
							e.preventDefault();

                            \$("#${modalBody}").load("${href}", function( response, status, xhr ) {
								if ( status == "error" ) {
								  var msg = "Sorry but there was an error:" + xhr.status + " " + xhr.statusText;
								  alert(msg);
								}
							});

							\$('#${modalDialog}').modal('show');
						});

						\$('#${modalBody}').on('hidden.bs.modal', function () {
							\$('#${modalDialog}').modal('hide');
						});


                        //Wide Modal
						\$('#${modalDialog}').on("show.bs.modal", function() {
						  var height = \$(window).height() - 150;
						  \$(this).find(".modal-body").css("max-height", height);
						});
					});
				</script>
				"""				
	}
	
}
