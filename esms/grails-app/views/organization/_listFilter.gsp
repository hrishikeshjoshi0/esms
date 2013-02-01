<g:form action="list" class="form-inline">
	<g:hiddenField name="search" value="${params.search}"/>
	<div style="width:150px;">
	<richui:autoComplete name="name" value="${params.name}" class="input-medium"  
			action="${createLinkTo('dir': 'organization/searchAJAX')}"
			forceSelection="false" typeAhead="true" shadow="true" minQueryLength ="2"/>
	</div>
	
	<g:select name="salesStatus" class="input-medium"
			from="${['LEAD','CUSTOMER']}"
			value="${params.salesStatus}"
			valueMessagePrefix="organization.salesStatus" noSelection="['': '']" />

    <button type="submit" class="btn">
    	<i class="icon-search"></i>
    	Search
    </button>
</g:form>