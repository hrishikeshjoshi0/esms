
<%@ page import="com.esms.model.order.Order"%>
<!doctype html>
<html>
<head>
<meta name="layout" content="bootstrap3">
<g:set var="entityName"
	value="${message(code: 'order.label', default: 'Order')}" />
<title><g:message code="default.list.label" args="[entityName]" /></title>
</head>
<body>
	<div class="row">
		<div class="col-md-12">

			<filterpane:currentCriteria domainBean="com.esms.model.order.Order"
				removeImgDir="images" removeImgFile="skin/database_delete.png"
				fullAssociationPathFieldNames="no" />

			<div class="slidingDiv">
				<div class="page-header">
					<h3>Search</h3>
				</div>
				<fieldset>
					<filterpane:filterPane domain="com.esms.model.order.Order"
						filterProperties="${['orderNumber', 'status','type','contactName']}"
						titleKey="default.filterPane.header" dialog="false" visible="y"
						showSortPanel="n" showTitle="n"
						fullAssociationPathFieldNames="false" />
				</fieldset>
			</div>

			<div class="page-header">
				<h3>Open Orders</h3>
			</div>

			<table class="table table-striped table-condensed table-bordered">
				<thead>
					<tr>
						<th>
							${message(code: 'order.orderNumber.label', default: 'Order Number')}
						</th>

						<th>
							${message(code: 'quote.organization.name.label', default: 'Organization')}
						</th>

						<th>
							${message(code: 'order.grandTotal.label', default: 'Grand Total')}
						</th>

						<th>
							${message(code: 'order.type.label', default: 'Order Type')}
						</th>

						<th></th>
					</tr>
				</thead>
				<tbody>
					<g:if
						test="${ordersPendingPayments != null && ordersPendingPayments.size() != 0}">
						<g:each in="${ordersPendingPayments}" var="orderInstance">
							<tr>
								<td>
									${fieldValue(bean: orderInstance, field: "orderNumber")}
								</td>

								<td><g:link controller="organization" action="show"
										id="${orderInstance?.organization?.id}">
										${fieldValue(bean: orderInstance, field: "organization.name")}
									</g:link></td>

								<td>
									${fieldValue(bean : orderInstance, field : "openGrandTotal") }
								</td>
								<td>
									${fieldValue(bean: orderInstance, field: "type")}
								</td>
								<td class="link"><g:link controller="order" action="show"
										id="${orderInstance.id}">Show &raquo;</g:link></td>
							</tr>
						</g:each>
					</g:if>
					<g:else>
						<tr>
							<th colspan="5">
								<h4 style="color: red;">No Records Found !</h4>
							</th>
						</tr>
					</g:else>
				</tbody>
			</table>
			
			<div class="pgn">
				<bootstrap:paginate params="${filterParams}"
					total="${orderInstanceTotal?orderInstanceTotal:ordersPendingPayments.size()}" />
			</div>
		</div>
	</div>
</body>
</html>