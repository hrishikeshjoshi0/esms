<%@ page import="com.esms.model.payment.Payment" %>
<%@ page import="com.esms.model.order.Order" %>
<!doctype html>
<html>
<head>
<meta name="layout" content="bootstrap">
<g:set var="entityName"
	value="${message(code: 'payment.label', default: 'Payment')}" />
<title><g:message code="default.create.label"
		args="[entityName]" /></title>
<script type="text/javascript">
	function addAddr(tblId)
	{
	  var tblBody = document.getElementById(tblId).tBodies[0];
	  var newNode = tblBody.rows[0].cloneNode(true);

	  var count = parseInt(document.getElementById("addrCount").value);
	  count++;
	  document.getElementById("addrCount").value = count;
	  var cells = newNode.cells;
	  
	  for (var i=0; i<cells.length; i++) {
		  cells[i].firstElementChild.value = "";
		  cells[i].firstElementChild.readOnly = "";
		  		  
	      if (cells[i].firstElementChild.id.indexOf("amount") != -1) {
	          cells[i].firstElementChild.id = "paymentItems["+(count-1)+"].amount";
	          cells[i].firstElementChild.name = "paymentItems["+(count-1)+"].amount";
	      } else if (cells[i].firstElementChild.id.indexOf("order.id") != -1) {
	          cells[i].firstElementChild.id = "paymentItems["+(count-1)+"].order.id";
	          cells[i].firstElementChild.name = "paymentItems["+(count-1)+"].order.id";
	      } else if (cells[i].firstElementChild.id.indexOf("description") != -1) {
	          cells[i].firstElementChild.id = "paymentItems["+(count-1)+"].description";
	          cells[i].firstElementChild.name = "paymentItems["+(count-1)+"].description";
	      } else if (cells[i].firstElementChild.id.indexOf("exists") != -1) {
	          cells[i].firstElementChild.id = "paymentItems["+(count-1)+"].exists";
	          cells[i].firstElementChild.name = "paymentItems["+(count-1)+"].id";
	      } 
	  }
	  tblBody.appendChild(newNode);
	}
</script>
		
</head>
<body>
	<div class="row-fluid">
		<div class="span12">
			<g:hasErrors bean="${paymentInstance}">
				<bootstrap:alert class="alert-error">
					<ul>
						<g:eachError bean="${paymentInstance}" var="error">
							<li
								<g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message
									error="${error}" /></li>
						</g:eachError>
					</ul>
				</bootstrap:alert>
			</g:hasErrors>

			<div class="page-header">
				<h1>
					<g:message code="default.create.label" args="[entityName]" />
				</h1>
			</div>

			<fieldset>
				<g:form class="form-horizontal" action="edit">
					<g:hiddenField name="addrCount"   value="1" />
					<g:hiddenField name="id" value="${paymentInstance?.id}"/>
					
					<fieldset>
						<g:render template="form"></g:render>
						
						<div class="page-header">
							<h3>
								Lines
							</h3>
						</div>
						<div class="pull-right">
							<a href="#" onClick="addAddr('addrtable');" 
								role="button" class="btn"> <i class="icon-plus"></i> Add Line
							</a>
						</div>
						
						<br/>
						<table id="addrtable" class="table table-striped">
							<thead>
								<tr>
									<th>
										Amount
									</th>
									<th>
										Order
									</th>
									<th>
										Description
									</th>
								</tr>
							</thead>
							<tbody>
								<g:if test="${!paymentInstance?.paymentItems || paymentInstance?.paymentItems?.size() == 0}">
									<tr id="dummy" class="prop">
										<td valign="top" class="value">
											<input type="text" id="paymentItems[0].amount" name="paymentItems[0].amount" />
										</td>
										<td valign="top" class="value">
											<g:select id="paymentItems[0].order.id" name="paymentItems[0].order.id" from="${Order.list()}"
												optionKey="id" optionValue="orderNumber"/>
										</td>
										<td valign="top" class="value"><input type="text"
											id="addresses[0].description"
											name="paymentItems[0].description" /></td>
									</tr>
								</g:if>
								<g:else>
									<g:each in="${paymentInstance?.paymentItems}"
										var="paymentItemInstance" status="i">
										<tr class="<%= paymentItemInstance.id? '  ' : '' %>">
											<g:hiddenField id="paymentItems[${i}].exists" name="paymentItems[${i}].id"
												value="${paymentItemInstance?.id}" />
												
											<td valign="top" class="value">
												<input type="text"
												id="paymentItems[${i}].amount"
												name="paymentItems[${i}].amount"
												value="${paymentItemInstance?.amount}" readonly="readonly"/></td>
											<td valign="top" class="value">
												<g:select id="paymentItems[0].order.id" name="paymentItems[0].order.id" from="${Order.list()}" readonly="readOnly"
												optionKey="id" optionValue="orderNumber" value="${paymentItemInstance?.order.id}"/>
											</td>
											<td valign="top" class="value"><input type="text"
												id="paymentItems[${i}].description" readonly="readonly"
												name="paymentItems[${i}].description"
												value="${paymentItemInstance?.description}" /></td>
										</tr>
									</g:each>
								</g:else>
							</tbody>
						</table>
						
						<br/>
						
						<div class="page-header">
							<h3>
								Description
							</h3>
						</div>
						
						<div
							class="control-group fieldcontain ${hasErrors(bean: paymentInstance, field: 'description', 'error')} ">
							<label for="description" class="control-label"><g:message
									code="payment.description.label" default="Description" /></label>
							<div class="controls">
								<g:textArea name="description"  cols="5" rows="10" style="width:60%;"
									value="${paymentInstance?.description}" />
								<span class="help-inline">
									${hasErrors(bean: paymentInstance, field: 'description', 'error')}
								</span>
							</div>
						</div>
						<div class="form-actions">
							<button type="submit" class="btn btn-primary">
								<i class="icon-ok icon-white"></i>
								<g:message code="default.button.matchLines.label" default="Save and Continue" />
							</button>
						</div>
					</fieldset>
					
				</g:form>
			</fieldset>
		</div>
	</div>
</body>
</html>