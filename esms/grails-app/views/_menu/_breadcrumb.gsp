<%@page import="com.esms.model.party.Organization"%>
<ol class="breadcrumb" style="color: #222; margin-top: 0px; font: 14px;">
	<g:if
		test="${params.controller == 'home' || params.controller == 'dashboard' }">
		<li>
			<g:link controller="dashboard">
				<i class="icon-home"></i>
				HOME
			</g:link>
		</li>
	</g:if>
	<g:else>
		<li><g:link controller="dashboard"><i class="icon-home"></i>HOME</g:link></li>
		<li>></li>
		<!--  -->
		<g:if test="${params.controller == 'organization' && organizationInstance}">
			<li>
				<i class="icon-user"></i>
				<g:link controller="organization" action="show" id="${organizationInstance?.id}">
					${organizationInstance?.name?.toUpperCase()}
				</g:link>
			</li>
			<li>></li>
		</g:if>
		<g:elseif test="${params.controller == 'product' && productInstance}">
			<li>
				<i class="icon-user"></i>
				<g:link controller="product" action="show" id="${productInstance?.id}">
					${productInstance?.productName?.toUpperCase()}
				</g:link>
			</li>
			<li>></li>
		</g:elseif>
		<g:elseif test="${params.controller == 'quote' && quoteInstance}">
			<li>
				<i class="icon-user"></i>
				<g:link controller="organization" action="show" id="${quoteInstance?.organization?.id}">
					${quoteInstance?.organization?.name?.toUpperCase()}
				</g:link>
			</li>
			<li>></li>
		</g:elseif>
		<g:elseif test="${params.controller == 'order' && orderInstance}">
			<li>
				<i class="icon-user"></i>
				<g:link controller="organization" action="show"  id="${orderInstance?.organization?.id}">
					${orderInstance?.organization?.name?.toUpperCase()}
				</g:link>
			</li>
			<li>></li>
		</g:elseif>
		<g:elseif test="${params.controller == 'invoice' && invoiceInstance}">
			<li>
				<i class="icon-user"></i>
				<g:link controller="organization" action="show"  id="${invoiceInstance?.organization?.id}">
					${invoiceInstance?.organization?.name?.toUpperCase()}
				</g:link>
			</li>
			<li>></li>
		</g:elseif>
		<g:elseif test="${params.controller == 'lead' && organizationInstance}">
			<li>
				<i class="icon-user"></i>
				<g:link controller="organization" action="show" id="${orderInstance?.organization?.id}">
					${organizationInstance?.name?.toUpperCase()}
				</g:link>
			</li>
			<li>></li>
		</g:elseif>
		<g:elseif test="${params.controller == 'payment' && paymentInstance}">
			<li>
				<i class="icon-user"></i>
				<g:link controller="organization" action="show" id="${paymentInstance?.organization?.id}">
					${paymentInstance?.organization?.name?.toUpperCase()}
				</g:link>
			</li>
			<li>></li>
		</g:elseif>
		<g:elseif test="${params.controller == 'employee' && paymentInstance}">
			<li>
				<i class="icon-user"></i>
				<g:link controller="employee" action="show" id="${employeeInstance?.id}">
					${employeeInstance?.firstName?.toUpperCase() + " " + employeeInstance?.lastName?.toUpperCase()}
				</g:link>
			</li>
			<li>></li>
		</g:elseif>
		<!--  -->
		<li><g:link controller="${params.controller}">
				<i class="icon-th"></i>
				${params.controller?.toUpperCase()}
			</g:link>
		</li>
		<li>></li>
		<li>
			${params.action?.toUpperCase()}
		</li>
		
	</g:else>
</ol>