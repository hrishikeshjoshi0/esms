

<%@ page import="com.esms.model.party.PhoneBook" %>
<!doctype html>
<html>
<head>
<meta name="layout" content="bootstrap3">
<g:set var="entityName"
	value="${message(code: 'phoneBook.label', default: 'PhoneBook')}" />
<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>
<body>
	<div class="row">
		<div class="col-md-12">
			<div class="page-header">
				<h3>
					Phone Book
				</h3>
			</div>
			
			<div class="well">
				<g:form>
					<g:hiddenField name="id" value="${phoneBookInstance?.id}" />
						<g:link class="btn btn-default btn-sm" action="edit" id="${phoneBookInstance?.id}">
							<g:message code="default.button.edit.label" default="Edit" />
						</g:link>
						<button class="btn btn-sm btn-default" type="submit" name="_action_delete">
							<g:message code="default.button.delete.label" default="Delete" />
						</button>
				</g:form>
			</div>

			<div class="panel panel-default">
				<div class="panel-body">
					<dl class="dl-horizontal">
						<dt>
							<g:message code="phoneBook.party.label" default="Party" />
						</dt>

						<dd>
							<g:if test="${phoneBookInstance?.party?.partyType == 'CONTACT'}">
								<g:link controller="contact" action="show"
									id="${phoneBookInstance?.party?.id}">
									${phoneBookInstance?.party?.firstName} ${phoneBookInstance?.party?.lastName}
								</g:link>
							</g:if>
							<g:if test="${phoneBookInstance?.party?.partyType == 'ORGANIZATION'}">
								<g:if test="${phoneBookInstance?.party?.salesStatus == 'LEAD'}">
									<g:link controller="organization" action="lead"
										id="${phoneBookInstance?.party?.id}">
										${phoneBookInstance?.party?.name}
									</g:link>
								</g:if>
								<g:else>
									<g:link controller="organization" action="show"
										id="${phoneBookInstance?.party?.party?.id}">
										${phoneBookInstance?.party?.name}
									</g:link>
								</g:else>
							</g:if>
							
							<g:if test="${phoneBookInstance?.party?.partyType == 'EMPLOYEE'}">
								<g:link controller="employee" action="show"
									id="${phoneBookInstance?.party?.id}">
									${phoneBookInstance?.party?.firstName} ${phoneBookInstance?.party?.lastName}
								</g:link>
							</g:if>
						</dd>

						<dt>
							<g:message code="phoneBook.homePhone.label" default="Home Phone" />
						</dt>

						<dd>
							<g:fieldValue bean="${phoneBookInstance}" field="homePhone" />
						</dd>


						<dt>
							<g:message code="phoneBook.mobilePhone.label"
								default="Mobile Phone" />
						</dt>

						<dd>
							<g:fieldValue bean="${phoneBookInstance}" field="mobilePhone" />
						</dd>


						<dt>
							<g:message code="phoneBook.officePhone.label"
								default="Office Phone" />
						</dt>

						<dd>
							<g:fieldValue bean="${phoneBookInstance}" field="officePhone" />
						</dd>


						<dt>
							<g:message code="phoneBook.otherPhone.label"
								default="Other Phone" />
						</dt>

						<dd>
							<g:fieldValue bean="${phoneBookInstance}" field="otherPhone" />
						</dd>
						
						<dt>
							<g:message code="phoneBook.email.label" default="Email" />
						</dt>

						<dd>
							<g:fieldValue bean="${phoneBookInstance}" field="email" />
						</dd>


						<dt>
							<g:message code="phoneBook.secondaryEmail.label"
								default="Secondary Email" />
						</dt>

						<dd>
							<g:fieldValue bean="${phoneBookInstance}" field="secondaryEmail" />
						</dd>


					</dl>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
