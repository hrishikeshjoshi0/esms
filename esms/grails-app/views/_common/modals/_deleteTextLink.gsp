<!-- 
This modal is used to show a button that initiates the delete action.
-->

<!-- Button to trigger modal if Javascript is available -->
	<a href="#DeleteModal" role="button" class="" data-toggle="modal" title="${message(code: 'default.button.delete.label', default: 'Delete')}">
		<g:message code="default.button.delete.label" default="Delete"/>
	</a>

	<g:render template="/_common/modals/deleteDialog" model="[item: item]"/>
