

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
					--%><g:link class="btn" action="create" controller="productInventory" param="['product.id':productInstance?.id]">
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
			</dl>
		</div>
		
		<div class="span12">
			<!--  -->
			<ul class="nav nav-tabs" id="product_show_tab">
			  <li class="active"><a href="#priceListTabsPane" data-toggle="tab">Price List</a></li>
			  <g:if test="${productInstance?.isVirtual == false || productInstance?.isVirtual == null}">
			  	<li><a href="#inventoryTabsPane" data-toggle="tab">Inventory</a></li>
				<li><a href="#inventoryJournalTabsPane" data-toggle="tab">Inventory Journal</a></li>
			  </g:if>
			  <li><a href="#commentsTabsPane" data-toggle="tab">Comments</a></li>
			</ul>
			 
			<div class="tab-content">
			  <div class="tab-pane active" id="priceListTabsPane">
			  	<g:render template="priceList" />
			  </div>
			  <g:if test="${productInstance?.isVirtual == false || productInstance?.isVirtual == null}">
				  <div class="tab-pane" id="inventoryTabsPane">
				  	<g:render template="inventory" />
				  </div>
				  <div class="tab-pane" id="inventoryJournalTabsPane">
					<g:render template="inventoryJournal" />
				  </div>
			  </g:if>
			  <div class="tab-pane" id="commentsTabsPane">
				<g:fieldValue bean="${productInstance}" field="comments" />
			  </div>
			</div> 
		</div>

		<%--<div class="span12">
			<div class="accordion" id="detailViewAccordion">
				<!-- Contacts -->
				<div class="accordion-group">
					<div class="accordion-heading">
						<a class="accordion-toggle" data-toggle="collapse"
							href="#collapseContact"> <span class="left"> <i
								class="icon-tag"></i> Prices
								<div class="pull-right">
									<i class="icon-plus"></i>
								</div>
						</span>
						</a>
					</div>
					<div id="collapseContact" class="accordion-body collapse in">
						<div class="accordion-inner">
							<g:render template="priceList" />
						</div>
					</div>
				</div>
			</div>
		</div>
	--%></div>
</body>
</html>
