<!-- Flash Message -->
<g:if test="${flash.message}">
	<g:set var="messageLevel" value="alert-info" />
	<g:if test="${flash.isWarning}">
		<g:set var="messageLevel" value="alert-warning" />
	</g:if>
	<g:elseif test="${flash.isDanger}">
		<g:set var="messageLevel" value="alert-danger" />
	</g:elseif>
	<g:elseif test="${flash.isSuccess}">
		<g:set var="messageLevel" value="alert-success" />
	</g:elseif>
	<g:elseif test="${flash.isInfo}">
		<g:set var="messageLevel" value="alert-info" />
	</g:elseif>
	<bootstrap:alert class="${messageLevel}">
		${flash.message}
	</bootstrap:alert>
</g:if>