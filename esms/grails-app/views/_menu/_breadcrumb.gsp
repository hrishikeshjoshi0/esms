<%@page import="com.esms.model.party.Organization"%>
<ul class="breadcrumb">
	<g:if
		test="${params.controller == 'home' || params.controller == 'dashboard' }">
		<li><g:link controller="dashboard">
				
				HOME
			</g:link></li>
	</g:if>
	<g:else>
		<li><g:link controller="dashboard">
				HOME</g:link></li>

		<!--  -->
		<g:if
			test="${params.controller == 'organization' && organizationInstance}">
			<li> <g:link controller="organization"
					action="show" id="${organizationInstance?.id}">
					${organizationInstance?.name?.toUpperCase()}
				</g:link></li>

		</g:if>
		<g:elseif test="${params.controller == 'product' && productInstance}">
			<li> <g:link controller="product"
					action="show" id="${productInstance?.id}">
					${productInstance?.productName?.toUpperCase()}
				</g:link></li>

		</g:elseif>
		<g:elseif test="${params.controller == 'quote' && quoteInstance}">
			<li> <g:link controller="organization"
					action="show" id="${quoteInstance?.organization?.id}">
					${quoteInstance?.organization?.name?.toUpperCase()}
				</g:link></li>

		</g:elseif>
		<g:elseif test="${params.controller == 'order' && orderInstance}">
			<li> <g:link controller="organization"
					action="show" id="${orderInstance?.organization?.id}">
					${orderInstance?.organization?.name?.toUpperCase()}
				</g:link></li>
		</g:elseif>
		<g:elseif test="${params.controller == 'invoice' && invoiceInstance}">
			<li> <g:link controller="organization"
					action="show" id="${invoiceInstance?.organization?.id}">
					${invoiceInstance?.organization?.name?.toUpperCase()}
				</g:link></li>
		</g:elseif>
		<g:elseif
			test="${params.controller == 'lead' && organizationInstance}">
			<li> <g:link controller="organization"
					action="show" id="${orderInstance?.organization?.id}">
					${organizationInstance?.name?.toUpperCase()}
				</g:link></li>
		</g:elseif>
		<g:elseif test="${params.controller == 'payment' && paymentInstance}">
			<li> <g:link controller="organization"
					action="show" id="${paymentInstance?.organization?.id}">
					${paymentInstance?.organization?.name?.toUpperCase()}
				</g:link></li>
		</g:elseif>
		<g:elseif test="${params.controller == 'employee' && paymentInstance}">
			<li> <g:link controller="employee"
					action="show" id="${employeeInstance?.id}">
					${employeeInstance?.firstName?.toUpperCase() + " " + employeeInstance?.lastName?.toUpperCase()}
				</g:link></li>
		</g:elseif>
		<!--  -->
		<li><g:link controller="${params.controller}">
				
				${params.controller?.toUpperCase()}
			</g:link></li>
		<li>
			${params.action?.toUpperCase()}
		</li>

	</g:else>
</ul>