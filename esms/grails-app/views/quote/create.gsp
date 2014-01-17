<%@ page import="com.esms.model.quote.Quote" %>
<%@page import="com.esms.model.product.Product"%>
<!doctype html>
<html>
<head>
<meta name="layout" content="bootstrap3">
<g:set var="entityName"
	value="${message(code: 'quote.label', default: 'Quote')}" />
<title><g:message code="default.create.label" args="[entityName]" /></title>
</head>
<body>
	<div class="row">
		<div class="col-md-12">
			<g:hasErrors bean="${quoteInstance}">
				<bootstrap:alert class="alert-danger">
					<ul>
						<g:eachError bean="${quoteInstance}" var="error">
							<li
								<g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message
									error="${error}" /></li>
						</g:eachError>
					</ul>
				</bootstrap:alert>
			</g:hasErrors>

			<div class="page-header">
				<h3>
					Create ${quoteInstance?.type?.toLowerCase()?.capitalize()} Quote
				</h3>
			</div>
			
			<div class="well">
				<g:form class="form-horizontal" action="create">
					<fieldset>
						<g:render template="form"></g:render>
						
						<!-- Quote Items -->
						<g:if test="${params.contractQuote}">
							<div class="page-header">
								<h5>
									Quote Line Items
								</h5>
							</div>
							
							<div class="table-responsive">
								<g:hiddenField name="quoteLinesTotal" value="${quoteLinesTotal}" />
								<table
									class="table table-striped table-condensed table-bordered">
									<thead>
										<tr>
											<g:sortableColumn property="lineNumber"
												title="${message(code: 'quoteItem.lineNumber.label', default: 'Line Number')}" />

											<g:sortableColumn property="productNumber"
												title="${message(code: 'quoteItem.productNumber.label', default: 'Product')}" />

											<g:sortableColumn property="quantity"
												title="${message(code: 'quoteItem.quantity.label', default: 'Quantity')}" />

											<g:sortableColumn property="unitPrice"
												title="${message(code: 'quoteItem.unitPrice.label', default: 'Unit Price')}" />

											<g:sortableColumn property="tax"
												title="${message(code: 'quoteItem.tax.label', default: 'Tax')}" />

											<g:sortableColumn property="discount"
												title="${message(code: 'quoteItem.discount.label', default: 'Discount')}" />

											<g:sortableColumn property="lineTotalAmount"
												title="${message(code: 'quoteItem.lineTotalAmount.label', default: 'Line Total Amount')}" />

										</tr>
									</thead>
									<tbody>
										<g:each in="${quoteInstance.quoteItems?.sort{a,b -> a.lineNumber <=> b.lineNumber}}"
											var="quoteItemInstance" status="index">
											<tr>
												<td><g:textField readonly="readonly"
														name="quoteItem[${index}].lineNumber"
														value="${quoteItemInstance.lineNumber}" size="3"
														class="col-md-12" /></td>

												<td>
													<g:hiddenField name="quoteItem[${index}].productNumber" value="${quoteItemInstance.productNumber}"/>
													<%--<g:textField id="productNumber${index}"
														data-index="${index}" readonly="readonly"
														name="quoteItem[${index}].productNumber"
														value="${quoteItemInstance.productNumber}" size="3"
														class="input-sm col-md-12 calc" /><br /> <g:set var="product"
														value="${Product.findByProductNumber(quoteItemInstance.productNumber)}" />
													--%>
													${Product.findByProductNumber(quoteItemInstance.productNumber)?.productName}
												</td>

												<td>
													<g:field type="number" step="any" id="quantity${index}"
														data-index="${index}" readonly="readonly"
														name="quoteItem[${index}].quantity"
														value="${quoteItemInstance.quantity}"
														class="input-sm col-md-12 calc" />
												</td>

												<td><g:field type="number" step="any" id="unitPrice${index}"
														data-index="${index}" name="quoteItem[${index}].unitPrice"
														value="${quoteItemInstance.unitPrice}" size="3"
														class="input-sm col-md-12 calc" /></td>

												<td><g:field type="number" step="any" id="tax${index}" data-index="${index}"
														name="quoteItem[${index}].tax"
														value="${quoteItemInstance.tax}" size="3"
														class="input-sm col-md-12 calc" /></td>

												<td><g:field type="number" step="any" id="discount${index}"
														data-index="${index}" name="quoteItem[${index}].discount"
														value="${quoteItemInstance.discount}" size="3"
														class="input-sm col-md-12 calc" /></td>

												<td><g:field type="number" step="any" id="lineTotalAmount${index}"
														readonly="readonly"
														name="quoteItem[${index}].lineTotalAmount"
														value="${quoteItemInstance.lineTotalAmount}" size="3"
														class="input-sm col-md-12" /></td>
											</tr>
										</g:each>
									</tbody>
								</table>
							</div>
						</g:if>

						<div class="form-group">
							<div class="col-md-10">
								<button type="submit" class="btn btn-primary">
									<g:if test="${params.contractQuote}">
									Save
								</g:if>
									<g:else>
									Save And Add Lines
								</g:else>
								</button>
							</div>
						</div>
					</fieldset>
				</g:form>
			</div>				
		</div>
	</div>
</body>
</html>
