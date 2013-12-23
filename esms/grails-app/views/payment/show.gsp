

<%@ page import="com.esms.model.payment.Payment"%>
<!doctype html>
<html>
<head>
<meta name="layout" content="bootstrap3">
<g:set var="entityName"
	value="${message(code: 'payment.label', default: 'Payment')}" />
<title>
	Payment::${invoiceInstance?.invoiceNumber}:${paymentInstance?.organization?.name}
</title>
</head>
<body>
	<div class="row">
			<div class="col-md-12">
				<div class="page-header">
					<h3>
						Payment
						${paymentInstance?.paymentNumber}
						:
						<g:link controller="organization" action="show"
							id="${paymentInstance?.organization?.id}">
							${paymentInstance?.organization?.name}
						</g:link>
					</h3>
				</div>
	
				<div class="well">
					<g:form>
						<g:hiddenField name="id" value="${paymentInstance?.id}" />
						<div class="form-group">
							<g:link class="btn btn-primary btn-sm" action="updateClearanceDate"
								id="${paymentInstance?.id}">
								<g:message code="default.button.updateClearanceDate.label"
									default="Update Clearance Date" />
							</g:link>
							<g:link class="btn btn-default btn-sm" action="edit" id="${paymentInstance?.id}">
								<g:message code="default.button.edit.label" default="Edit" />
							</g:link>
							<button class="btn btn-sm btn-default" type="submit" name="_action_delete">
								<g:message code="default.button.delete.label" default="Delete" />
							</button>
						</div>
					</g:form>
				</div>

				<div class="panel panel-default">
				  <div class="panel-body">
					<dl class="dl-horizontal">

						<dt>
							<g:message code="payment.paymentNumber.label"
								default="Payment Number" />
						</dt>

						<dd>
							<g:fieldValue bean="${paymentInstance}" field="paymentNumber" />
						</dd>


						<dt>
							<g:message code="payment.paymentMethod.label"
								default="Payment Type" />
						</dt>

						<dd>
							<g:fieldValue bean="${paymentInstance}" field="paymentMethod" />
						</dd>


						<dt>
							<g:message code="payment.chequeNumber.label"
								default="Cheque Number" />
						</dt>

						<dd>
							<g:fieldValue bean="${paymentInstance}" field="chequeNumber" />
						</dd>


						<dt>
							<g:message code="payment.bank.label" default="Bank" />
						</dt>

						<dd>
							<g:fieldValue bean="${paymentInstance}" field="bank" />
						</dd>


						<dt>
							<g:message code="payment.branch.label" default="Branch" />
						</dt>

						<dd>
							<g:fieldValue bean="${paymentInstance}" field="branch" />
						</dd>

						<!-- Cheque Issue Date -->
						<g:if test="${paymentInstance.clearanceDate}">
							<dt>
								<g:message code="payment.clearanceDate.label"
									default="Clearance Date" />
							</dt>

							<dd>
								<g:formatDate date="${paymentInstance?.clearanceDate}"  />
							</dd>
						</g:if>
						<g:else>
							<dt>
								<g:message code="payment.clearanceDate.label"
									default="Clearance Date" />
							</dt>

							<dd>Not Cleared</dd>
						</g:else>

						<dt>
							<g:message code="payment.chequeIssueDate.label"
								default="Cheque Issue Date" />
						</dt>

						<dd>
							<g:formatDate date="${paymentInstance?.chequeIssueDate}"  />
						</dd>

						<dt>
							<g:message code="payment.description.label" default="Description" />
						</dt>

						<dd>
							<g:fieldValue bean="${paymentInstance}" field="description" />
						</dd>


						<dt>
							<g:message code="payment.totalAmount.label"
								default="Total Amount" />
						</dt>

						<dd>
							<g:fieldValue bean="${paymentInstance}" field="totalAmount" />
						</dd>


						<dt>
							<g:message code="payment.balanceAmount.label"
								default="Balance Amount" />
						</dt>

						<dd>
							<g:fieldValue bean="${paymentInstance}" field="balanceAmount" />
						</dd>


						<dt>
							<g:message code="payment.matchedAmount.label"
								default="Matched Amount" />
						</dt>

						<dd>
							<g:fieldValue bean="${paymentInstance}" field="matchedAmount" />
						</dd>
					</dl>
				</div>
				</div>	
			</div>
		</div>
		
		<div class="row">
			<div class="col-md-12">
	
				<!--  -->
				<richui:tabView id="tabView">
					<richui:tabLabels>
						<richui:tabLabel selected="true" title="Lines" />
					</richui:tabLabels>
	
					<richui:tabContents>
						<richui:tabContent>
							<g:render template="paymentItemList" />
						</richui:tabContent>
	
					</richui:tabContents>
				</richui:tabView>
			</div>
		</div>
</body>
</html>
