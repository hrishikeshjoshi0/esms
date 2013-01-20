<%@ page import="com.esms.model.quote.Quote"%>

<div
	class="control-group fieldcontain ${hasErrors(bean: quoteInstance, field: 'organization', 'error')} required">
	<label for="organization" class="control-label"><g:message
			code="quote.organization.label" default="Organization" /><span
		class="required-indicator">*</span></label>
	<div class="controls">
		<g:hiddenField name="organization.id" value="${quoteInstance?.organization?.id}"/>
		<richui:autoComplete name="organizationId" onItemSelect="document.getElementById('organization.id').value=id;"
			action="${createLinkTo('dir': 'organization/searchAJAX')}"
			forceSelection="true" typeAhead="true" shadow="true" minQueryLength ="2"/>
		<span class="help-inline">
			${hasErrors(bean: quoteInstance, field: 'organization', 'error')}
		</span>
	</div>
</div>

<div
	class="control-group fieldcontain ${hasErrors(bean: quoteInstance, field: 'quoteName', 'error')} required">
	<label for="quoteName" class="control-label"><g:message
			code="quote.quoteName.label" default="Quote Name" /><span
		class="required-indicator">*</span></label>
	<div class="controls">
		<g:textField name="quoteName" required=""
			value="${quoteInstance?.quoteName}" />
		<span class="help-inline">
			${hasErrors(bean: quoteInstance, field: 'quoteName', 'error')}
		</span>
	</div>
</div>

<div
	class="control-group fieldcontain ${hasErrors(bean: quoteInstance, field: 'status', 'error')} ">
	<label for="status" class="control-label"><g:message
			code="quote.status.label" default="Status" /></label>
	<div class="controls">
		<g:select name="status"
			from="${quoteInstance.constraints.status.inList}"
			value="${quoteInstance?.status}" valueMessagePrefix="quote.status"
			noSelection="['': '']" />
		<span class="help-inline">
			${hasErrors(bean: quoteInstance, field: 'status', 'error')}
		</span>
	</div>
</div>

<div
	class="control-group fieldcontain ${hasErrors(bean: quoteInstance, field: 'type', 'error')} required">
	<label for="type" class="control-label"><g:message
			code="quote.type.label" default="Type" /><span
		class="required-indicator">*</span></label>
	<div class="controls">
		<g:textField name="type" required="" value="${quoteInstance?.type}" />
		<span class="help-inline">
			${hasErrors(bean: quoteInstance, field: 'type', 'error')}
		</span>
	</div>
</div>

<div
	class="control-group fieldcontain ${hasErrors(bean: quoteInstance, field: 'salesChannel', 'error')} required">
	<label for="salesChannel" class="control-label"><g:message
			code="quote.salesChannel.label" default="Sales Channel" /><span
		class="required-indicator">*</span></label>
	<div class="controls">
		<g:textField name="salesChannel" required=""
			value="${quoteInstance?.salesChannel}" />
		<span class="help-inline">
			${hasErrors(bean: quoteInstance, field: 'salesChannel', 'error')}
		</span>
	</div>
</div>

<div
	class="control-group fieldcontain ${hasErrors(bean: quoteInstance, field: 'description', 'error')} ">
	<label for="description" class="control-label"><g:message
			code="quote.description.label" default="Description" /></label>
	<div class="controls">
		<g:textField name="description" value="${quoteInstance?.description}" />
		<span class="help-inline">
			${hasErrors(bean: quoteInstance, field: 'description', 'error')}
		</span>
	</div>
</div>

<div
	class="control-group fieldcontain ${hasErrors(bean: quoteInstance, field: 'issueDate', 'error')} required">
	<label for="issueDate" class="control-label"><g:message
			code="quote.issueDate.label" default="Issue Date" /><span
		class="required-indicator">*</span></label>
	<div class="controls">
		<bootstrap:jqDatePicker name="issueDate"
			value="${quoteInstance?.issueDate}" />
		<span class="help-inline">
			${hasErrors(bean: quoteInstance, field: 'issueDate', 'error')}
		</span>
	</div>
</div>

<div
	class="control-group fieldcontain ${hasErrors(bean: quoteInstance, field: 'expiryDate', 'error')} ">
	<label for="expiryDate" class="control-label"><g:message
			code="quote.expiryDate.label" default="Expiry Date" /></label>
	<div class="controls">
		<bootstrap:jqDatePicker name="expiryDate"
			value="${quoteInstance?.expiryDate}" />
		<span class="help-inline">
			${hasErrors(bean: quoteInstance, field: 'expiryDate', 'error')}
		</span>
	</div>
</div>

<div
	class="control-group fieldcontain ${hasErrors(bean: quoteInstance, field: 'contactName', 'error')} ">
	<label for="contactName" class="control-label"><g:message
			code="quote.contactName.label" default="Contact Name" /></label>
	<div class="controls">
		<g:textField name="contactName" value="${quoteInstance?.contactName}" />
		<span class="help-inline">
			${hasErrors(bean: quoteInstance, field: 'contactName', 'error')}
		</span>
	</div>
</div>

<%--<div
	class="control-group fieldcontain ${hasErrors(bean: quoteInstance, field: 'totalAmount', 'error')} required">
	<label for="totalAmount" class="control-label"><g:message
			code="quote.totalAmount.label" default="Total Amount" /><span
		class="required-indicator">*</span></label>
	<div class="controls">
		<g:field type="number" name="totalAmount" step="any" required=""
			value="${quoteInstance.totalAmount}" />
		<span class="help-inline">
			${hasErrors(bean: quoteInstance, field: 'totalAmount', 'error')}
		</span>
	</div>
</div>

<div
	class="control-group fieldcontain ${hasErrors(bean: quoteInstance, field: 'totalTax', 'error')} required">
	<label for="totalTax" class="control-label"><g:message
			code="quote.totalTax.label" default="Total Tax" /><span
		class="required-indicator">*</span></label>
	<div class="controls">
		<g:field type="number" name="totalTax" step="any" required=""
			value="${quoteInstance.totalTax}" />
		<span class="help-inline">
			${hasErrors(bean: quoteInstance, field: 'totalTax', 'error')}
		</span>
	</div>
</div>

<div
	class="control-group fieldcontain ${hasErrors(bean: quoteInstance, field: 'totalDiscount', 'error')} required">
	<label for="totalDiscount" class="control-label"><g:message
			code="quote.totalDiscount.label" default="Total Discount" /><span
		class="required-indicator">*</span></label>
	<div class="controls">
		<g:field type="number" name="totalDiscount" step="any" required=""
			value="${quoteInstance.totalDiscount}" />
		<span class="help-inline">
			${hasErrors(bean: quoteInstance, field: 'totalDiscount', 'error')}
		</span>
	</div>
</div>

<div
	class="control-group fieldcontain ${hasErrors(bean: quoteInstance, field: 'grandTotal', 'error')} required">
	<label for="grandTotal" class="control-label"><g:message
			code="quote.grandTotal.label" default="Grand Total" /><span
		class="required-indicator">*</span></label>
	<div class="controls">
		<g:field type="number" name="grandTotal" step="any" required=""
			value="${quoteInstance.grandTotal}" />
		<span class="help-inline">
			${hasErrors(bean: quoteInstance, field: 'grandTotal', 'error')}
		</span>
	</div>
</div>

--%><%--<div
	class="control-group fieldcontain ${hasErrors(bean: quoteInstance, field: 'organization', 'error')} required">
	<label for="organization" class="control-label"><g:message
			code="quote.organization.label" default="Organization" /><span
		class="required-indicator">*</span></label>
	<div class="controls">
		<g:select id="organization" name="organization.id"
			from="${com.esms.model.party.Organization.list()}" optionKey="id"
			required="" value="${quoteInstance?.organization?.id}"
			class="many-to-one" />
		<span class="help-inline">
			${hasErrors(bean: quoteInstance, field: 'organization', 'error')}
		</span>
	</div>
</div>

--%><%--<div
	class="control-group fieldcontain ${hasErrors(bean: quoteInstance, field: 'quoteItems', 'error')} ">
	<label for="quoteItems" class="control-label"><g:message
			code="quote.quoteItems.label" default="Quote Items" /></label>
	<div class="controls">

		<ul class="one-to-many">
			<g:each in="${quoteInstance?.quoteItems?}" var="q">
				<li><g:link controller="quoteItem" action="show" id="${q.id}">
						${q?.encodeAsHTML()}
					</g:link></li>
			</g:each>
			<li class="add"><g:link controller="quoteItem" action="create"
					params="['quote.id': quoteInstance?.id]">
					${message(code: 'default.add.label', args: [message(code: 'quoteItem.label', default: 'QuoteItem')])}
				</g:link></li>
		</ul>

		<span class="help-inline">
			${hasErrors(bean: quoteInstance, field: 'quoteItems', 'error')}
		</span>
	</div>
</div>

--%>