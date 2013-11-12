

<%@ page import="com.esms.model.product.Product"%>
<!doctype html>
<html>
<head>
<meta name="layout" content="bootstrap">
<g:set var="entityName"
	value="${message(code: 'product.label', default: 'Product')}" />
<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>
<body>
	<div class="row-fluid">
		<div class="span12">
			<div class="page-header">
				<h1>
					<%--<g:message code="default.show.label" args="[entityName]" />--%>
					<g:fieldValue bean="${productInstance}" field="productName" />
				</h1>
			</div>

			<g:form>
				<g:hiddenField name="id" value="${productInstance?.id}" />
				<div class="form-actions">
					<%--<g:link class="btn" action="edit" id="${productInstance?.id}">
						<i class="icon-pencil"></i>
						<g:message code="default.button.edit.label" default="Edit" />
					</g:link>
					--%>
					<g:link class="btn" action="create" controller="productInventory"
						param="['product.id':productInstance?.id]">
						<i class="icon-pencil"></i>
						Add Inventory
					</g:link>
					<button class="btn btn-danger" type="submit" name="_action_delete">
						<i class="icon-trash icon-white"></i>
						<g:message code="default.button.delete.label" default="Delete" />
					</button>
				</div>
			</g:form>

			<dl class="dl-horizontal">

				<dt>
					<g:message code="product.productName.label" default="Product Name" />
				</dt>

				<dd>
					<g:fieldValue bean="${productInstance}" field="productName" />
				</dd>


				<dt>
					<g:message code="product.productType.label" default="Product Type" />
				</dt>

				<dd>
					<g:fieldValue bean="${productInstance}" field="productType" />
				</dd>


				<dt>
					<g:message code="product.manufacturer.label" default="Manufacturer" />
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
					<g:formatDate date="${productInstance?.supportDiscontinuationDate}" />
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
					<g:message code="product.serviceContract.label" default="Is Service Contract?" />
				</dt>

				<dd>
					<g:formatBoolean boolean="${productInstance?.serviceContract}" />
				</dd>
			</dl>
		</div>

		<div class="span12">
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
		</div>
	</div>
</body>
</html>
