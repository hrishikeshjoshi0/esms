<%@ page defaultCodec="html" %>
<div class="form-group ${invalid ? 'error' : ''}">
	<label class="col-lg-2 control-label" for="${property}">${label}</label>
	<div class="col-lg-10">
		<%= widget %>
		<g:if test="${invalid}"><span class="help-inline">${errors.join('<br>')}</span></g:if>
	</div>
</div>