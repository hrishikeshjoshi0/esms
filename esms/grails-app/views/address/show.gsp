

<%@ page import="com.esms.model.party.Address"%>
<!doctype html>
<html>
<head>
<meta name="layout" content="bootstrap3">
<g:set var="entityName"
	value="${message(code: 'address.label', default: 'Address')}" />
<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>
<body>
	<div class="row">
		<div class="col-md-12">
			<div class="page-header">
				<h3>
					<g:message code="default.show.label" args="[entityName]" />
				</h3>
			</div>
			
			<div class="well">
				<div class="form-group">
					<g:link class="btn btn-default btn-sm" action="edit"
						id="${addressInstance?.id}">
						<g:message code="default.button.edit.label" default="Edit" />
					</g:link>
					<g:link class="btn btn-default btn-sm deleteBtn" action="delete"
						id="${addressInstance?.id}">
						<g:message code="default.button.delete.label" default="Delete" />
					</g:link>
				</div>
			</div>

			<div class="panel panel-default">
				<div class="panel-body">

					<dl class="dl-horizontal">
					
						<dt>
							<g:if test="${addressInstance?.party?.partyType == 'CONTACT' }">
								Contact
							</g:if>
							<g:if test="${addressInstance?.party?.partyType == 'ORGANIZATION' }">
								Organization
							</g:if>
							<g:if test="${addressInstance?.party?.partyType == 'EMPLOYEE' }">
								Employee
							</g:if>
						</dt>

						<dd>
							<g:if test="${addressInstance?.party?.partyType == 'CONTACT' }">
								<g:link controller="contact" action="show"
									id="${addressInstance?.party?.id}">
									${addressInstance?.party?.firstName} ${addressInstance?.party?.lastName}
								</g:link>							
							</g:if>
							<g:if test="${addressInstance?.party?.partyType == 'ORGANIZATION' }">
								<g:if test="${addressInstance?.party?.salesStatus == 'LEAD'}">
									<g:link controller="lead" action="show"
										id="${addressInstance?.party?.id}">
										${addressInstance?.party?.name}
									</g:link>
								</g:if>
								<g:else>
									<g:link controller="organization" action="show"
										id="${addressInstance?.party?.id}">
										${addressInstance?.party?.name}
									</g:link>
								</g:else>
							</g:if>
							<g:if test="${addressInstance?.party?.partyType == 'EMPLOYEE' }">
								<g:link controller="employee" action="show"
									id="${addressInstance?.party?.id}">
									${addressInstance?.party?.firstName} ${addressInstance?.party?.lastName}
								</g:link>
							</g:if>
						</dd>

						<dt>
							<g:message code="address.address1.label" default="Address1" />
						</dt>

						<dd>
							<g:fieldValue bean="${addressInstance}" field="address1" />
						</dd>


						<dt>
							<g:message code="address.addressType.label"
								default="Address Type" />
						</dt>

						<dd>
							<g:fieldValue bean="${addressInstance}" field="addressType" />
						</dd>


						<dt>
							<g:message code="address.address2.label" default="Address2" />
						</dt>

						<dd>
							<g:fieldValue bean="${addressInstance}" field="address2" />
						</dd>


						<dt>
							<g:message code="address.buildingName.label"
								default="Building Name" />
						</dt>

						<dd>
							<g:fieldValue bean="${addressInstance}" field="buildingName" />
						</dd>


						<dt>
							<g:message code="address.city.label" default="City" />
						</dt>

						<dd>
							<g:fieldValue bean="${addressInstance}" field="city" />
						</dd>


						<dt>
							<g:message code="address.country.label" default="Country" />
						</dt>

						<dd>
							<g:fieldValue bean="${addressInstance}" field="country" />
						</dd>

						<dt>
							<g:message code="address.postalCode.label" default="Postal Code" />
						</dt>

						<dd>
							<g:fieldValue bean="${addressInstance}" field="postalCode" />
						</dd>


						<dt>
							<g:message code="address.state.label" default="State" />
						</dt>

						<dd>
							<g:fieldValue bean="${addressInstance}" field="state" />
						</dd>


					</dl>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
