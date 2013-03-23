<%@ page import="com.esms.model.calendar.Event"%>
<%@ page import="com.esms.model.calendar.EventRecurType"%>
<%@ page import="org.joda.time.Instant"%>
<%@page import="com.esms.model.party.Organization"%>

<g:set var="entityName"
	value="${message(code: 'event.label', default: 'Event')}" />

<div
	class=" ${hasErrors(bean: eventInstance, field: 'party', 'error')}">
	
	<label for="organization" class="control-label"><g:message
			code="quote.organization.label" default="Organization" /></label>
	<br/>		
	<g:select name="party.id" from="${Organization.list()}"
			optionKey="id" optionValue="name" class="input-xxlarge"
			value="${eventInstance?.party?.id}" />
</div>

<div
	class="fieldcontain ${hasErrors(bean: eventInstance, field: 'eventType', 'error')}">
	<label for="eventType"><g:message code="event.eventType.label"
			default="Event Type" /></label>
	<g:select name="eventType"
		from="${eventInstance.constraints.eventType.inList}"
		value="${eventInstance?.eventType}"
		valueMessagePrefix="event.eventType" noSelection="['': '']" />
</div>

<div
	class="fieldcontain ${hasErrors(bean: eventInstance, field: 'title', 'error')}">
	<label for="title"><g:message code="event.title.label"
			default="Title" /></label>
	<g:textField name="title" value="${eventInstance?.title}" />
</div>

<div
	class="fieldcontain ${hasErrors(bean: eventInstance, field: 'description', 'error')}">
	<label for="description"><g:message
			code="event.description.label" default="Description" /></label>
	<g:textArea name="description" value="${eventInstance?.description}"
		rows="10" cols="100" />
</div>

<div
	class="fieldcontain ${hasErrors(bean: eventInstance, field: 'status', 'error')}">
	<label for="status"><g:message code="event.status.label"
			default="Status" /></label>
	<g:select name="status"
		from="${eventInstance.constraints.status.inList}"
		value="${eventInstance?.status}" valueMessagePrefix="event.status"
		noSelection="['': '']" />
</div>

<div
	class="fieldcontain ${hasErrors(bean: eventInstance, field: 'priority', 'error')}">
	<label for="priority"><g:message code="event.priority.label"
			default="Priority" /></label>
	<g:select name="priority"
		from="${eventInstance.constraints.priority.inList}"
		value="${eventInstance?.priority}" valueMessagePrefix="event.priority"
		noSelection="['': '']" />
</div>

<div
	class="fieldcontain ${hasErrors(bean: eventInstance, field: 'relatedTo', 'error')}">
	<label for="relatedTo"><g:message code="event.relatedTo.label"
			default="Related To" /></label>
	<g:select name="relatedTo"
		from="${eventInstance.constraints.relatedTo.inList}"
		value="${eventInstance?.relatedTo}"
		valueMessagePrefix="event.relatedTo" noSelection="['': '']" />
	<g:textField name="relatedTo" value="${eventInstance?.relatedToValue}" />
</div>

<div
	class="fieldcontain ${hasErrors(bean: eventInstance, field: 'startTime', 'error')}">
	<label for="startTime"><g:message code="event.startTime.label"
			default="Start Time" /></label>
	<g:datePicker name="startTime" value="${eventInstance?.startTime}" />
	<%--<g:textField name="startTime"
		value="${formatDate(date: occurrenceStart ? new Instant(occurrenceStart).toDate() : eventInstance?.startTime, format: 'MM/dd/yyyy hh:mm a')}"
		class="datetime" />
--%></div>


<div
	class="fieldcontain ${hasErrors(bean: eventInstance, field: 'endTime', 'error')}">
	<label for="endTime"><g:message code="event.endTime.label"
			default="End Time" /></label>
	<g:datePicker name="endTime" value="${eventInstance?.endTime}" />
	<%--<g:textField name="endTime"
		value="${formatDate(date: occurrenceEnd ? new Instant(occurrenceEnd).toDate() : eventInstance?.endTime, format: 'MM/dd/yyyy hh:mm a')}"
		class="datetime" />
--%></div>

<div
	class="fieldcontain ${hasErrors(bean: eventInstance, field: 'isRecurring', 'error')}">

	<label for="isRecurring"><g:message
			code="event.isRecurring.label" default="Repeat" /></label>
	<g:checkBox name="isRecurring" value="${eventInstance.isRecurring}" />
	<span id="recurDescription"></span> <a id="editRecurringLink"
		${eventInstance.isRecurring ?  "" : 'style="display:none"'} href="#">Edit</a>
</div>

<div id="recurPopup"></div>
<div id="recurOptions" style="display: none">
	<div>
		<label>Repeats:</label>
		<g:select name="recurType" from="${EventRecurType.values()}"
			optionValue="name" value="${eventInstance?.recurType}" />
	</div>

	<div>
		<label>Repeat every:</label>
		<g:select name="recurInterval" from="${1..30}"
			value="${eventInstance?.recurInterval}" />
		<span id="repeatLabel"></span>
	</div>

	<div id="weeklyOptions"
		${eventInstance.recurType != EventRecurType.WEEKLY ? 'style="display:none"' : ''}>
		<label>Repeat on: </label>
		<div class="options">
			<calendar:daysOfWeek name="recurDaysOfWeek"
				selectedDays="${eventInstance?.recurDaysOfWeek}" />
		</div>
	</div>

	<div>
		<label>Ends:</label>
		<div class="input">
			<input id="recurEndOption1" name="recurEndOption" type="radio"
				group="recurEndOption"
				${(!eventInstance.recurCount && !eventInstance.recurUntil) ? 'checked="checked"' : ''}
				value="never" /> <label for="recurEndOption1">Never</label><br />

			<input id="recurEndOption2" name="recurEndOption" type="radio"
				group="recurEndOption"
				${(eventInstance.recurCount) ? 'checked="checked"' : ''}
				value="occurrences" /> <label for="recurEndOption2">After <g:textField
					name="recurCount" size="3" value="${eventInstance?.recurCount}" />
				occurrences
			</label><br /> <input id="recurEndOption3" name="recurEndOption"
				type="radio" group="recurEndOption"
				${(!eventInstance.recurCount && eventInstance.recurUntil) ? 'checked="checked"' : ''}
				value="endDate" /> <label for="recurEndOption3">On <g:textField
					name="recurUntil" size="8"
					value="${formatDate(date: (eventInstance?.recurCount ? null : eventInstance?.recurUntil), format: 'MM/dd/yyyy hh:mm a')}" /></label>


		</div>
	</div>

	<div>
		<strong><span id="recurSummary"></span></strong>
	</div>

</div>
