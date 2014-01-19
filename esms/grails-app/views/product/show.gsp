<%@ page import="com.esms.model.product.Product"%>
<!doctype html>
<html>
<head>
<meta name="layout" content="bootstrap3">
<g:set var="entityName"
	value="${message(code: 'product.label', default: 'Product')}" />
<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>
<body>
	<div class="row">
		<div class="col-md-12">
			<div class="page-header">
				<h2>
					<g:fieldValue bean="${productInstance}" field="productName" />
				</h2>
			</div>

			<div class="well">
					<g:hiddenField name="id" value="${productInstance?.id}" />
					<g:if
						test="${productInstance?.isVirtual == false && productInstance?.requiresInventory == null}">
						<g:link class="btn btn-default btn-sm" action="create"
							controller="productInventory"
							param="['product.id':productInstance?.id]">
									Add Inventory
						</g:link>
					</g:if>
					
					<bs3:modalLink
						href="${createLink(controller:'product',action:'createPrice',id:productInstance?.id)}"
						class="btn-primary" id="createPrice" title="New Price" />
						
					<g:link class="btn btn-default btn-sm" action="edit" id="${productInstance?.id}">
							<g:message code="default.button.edit.label" default="Edit" />
					</g:link>
					
					<g:link class="btn btn-default btn-sm deleteBtn" action="delete" id="${productInstance?.id}">
							<g:message code="default.button.delete.label" default="Delete" />
					</g:link>
			</div>

			<div class="panel panel-default">
				<div class="panel-body">
					<dl class="dl-horizontal">

						<dt>
							<g:message code="product.productName.label"
								default="Product Name" />
						</dt>

						<dd>
							<g:fieldValue bean="${productInstance}" field="productName" />
						</dd>


						<dt>
							<g:message code="product.productType.label"
								default="Product Type" />
						</dt>

						<dd>
							<g:fieldValue bean="${productInstance}" field="productType" />
						</dd>


						<dt>
							<g:message code="product.manufacturer.label"
								default="Manufacturer" />
						</dt>

						<dd>
							<g:fieldValue bean="${productInstance}" field="manufacturer" />
						</dd>


						<dt>
							<g:message code="product.introductionDate.label"
								default="Introduction Date" />
						</dt>

						<dd>
							<g:formatDate date="${productInstance?.introductionDate}" />
						</dd>


						<dt>
							<g:message code="product.supportDiscontinuationDate.label"
								default="Support Discontinuation Date" />
						</dt>

						<dd>
							<g:formatDate
								date="${productInstance?.supportDiscontinuationDate}" />
						</dd>


						<dt>
							<g:message code="product.salesDiscontinuationDate.label"
								default="Sales Discontinuation Date" />
						</dt>

						<dd>
							<g:formatDate date="${productInstance?.salesDiscontinuationDate}" />
						</dd>


						<dt>
							<g:message code="product.requiresInventory.label"
								default="Requires Inventory" />
						</dt>

						<dd>
							<g:formatBoolean boolean="${productInstance?.requiresInventory}" />
						</dd>


						<dt>
							<g:message code="product.taxable.label" default="Taxable" />
						</dt>

						<dd>
							<g:formatBoolean boolean="${productInstance?.taxable}" />
						</dd>


						<dt>
							<g:message code="product.isVirtual.label" default="Is Virtual" />
						</dt>

						<dd>
							<g:formatBoolean boolean="${productInstance?.isVirtual}" />
						</dd>
						
						<dt>
							<g:message code="product.serviceContract.label" default="Is Service Contract" />
						</dt>

						<dd>
							<g:formatBoolean boolean="${productInstance?.serviceContract}" />
						</dd>
					</dl>
				</div>
			</div>
		</div>

		<div class="col-md-12">
			<richui:tabView id="tabView">
				<richui:tabLabels>
					<richui:tabLabel selected="true" title="Price List" />
					<g:if
						test="${productInstance?.isVirtual == false || productInstance?.isVirtual == null}">
						<richui:tabLabel title="Inventory" />
						<richui:tabLabel title="Inventory Journal" />
					</g:if>
					<richui:tabLabel title="Comments" />
				</richui:tabLabels>

				<richui:tabContents>
					<richui:tabContent>
						<g:render template="priceList" />
					</richui:tabContent>

					<g:if
						test="${productInstance?.isVirtual == false || productInstance?.isVirtual == null}">
						<richui:tabContent>
							<g:render template="inventory" />
						</richui:tabContent>

						<richui:tabContent>
							<g:render template="inventoryJournal" />
						</richui:tabContent>
					</g:if>

					<richui:tabContent>
						<g:fieldValue bean="${productInstance}" field="comments" />
					</richui:tabContent>
				</richui:tabContents>
			</richui:tabView>
			<%--
			<ul class="nav nav-tabs">
                <li class="active"><a href="#priceList" data-toggle="tab">Price List</a></li>
				<g:if
					test="${productInstance?.isVirtual == false || productInstance?.isVirtual == null}">
					<li><a href="#inventory" data-toggle="tab">Inventory</a></li>
					<li><a href="#inventoryJournal" data-toggle="tab">Inventory Journal</a></li>
				</g:if>
				<li><a href="#comments" data-toggle="tab">Comments</a></li>
              </ul>
			<div id="myTabContent" class="tab-content">
				<div class="tab-pane fade active in" id="priceList">
					<g:render template="priceList" />
				</div>
				<g:if
					test="${productInstance?.isVirtual == false || productInstance?.isVirtual == null}">
					<div class="tab-pane fade" id="inventory">
						<g:render template="inventory" />
					</div>
					<div class="tab-pane fade" id="inventoryJournal">
						<g:render template="inventoryJournal" />
					</div>
				</g:if>
				<div class="tab-pane fade" id="comments">
					<g:fieldValue bean="${productInstance}" field="comments" />
				</div>				
			</div>
			--%>
		</div>
	</div>
</body>
</html>
