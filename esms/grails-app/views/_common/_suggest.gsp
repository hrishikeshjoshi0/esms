<script src="${resource(dir: 'js/typeahead', file: 'typeahead.min.js')}"></script>

<%--<script type="text/javascript">
	$('.typeahead').typeahead([ 
        {
			name : 'organizations',
			remote : '${createLink(controller:'organization',action:'suggest')}' + '?q=%QUERY'
			template : '<p><strong>{{name}}</strong> – {{externalId}}</p>',
			engine : Hogan
		}
	]).on('typeahead:selected', function(event, datum) {
	    window.location =  '${createLinkTo(dir: 'organization/show')}/' + datum.id
	});
</script>
--%>

<g:form>
	<input class="typeahead col-md-12" id="string-typeahead"
		spellcheck="false" type="text" autocomplete="off" placeholder="Search..." />
		
	<%--<richui:autoComplete name="q"
		action="${createLinkTo('dir': 'organization/search')}"
		class="col-md-12" shadow="true" minQueryLength="1"
		onItemSelect="document.location.href = '${createLinkTo(dir: 'organization/show')}/' + id;" />
	--%>
</g:form>