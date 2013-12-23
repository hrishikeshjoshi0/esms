

<%@ page import="com.esms.model.order.PurchaseOrder" %>
<!doctype html>
<html>
<head>
<meta name="layout" content="bootstrap3">
<g:set var="entityName"
	value="${message(code: 'purchaseOrder.label', default: 'PurchaseOrder')}" />
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
				<g:form>
					<g:hiddenField name="id" value="${purchaseOrderInstance?.id}" />
					<g:link class="btn btn-default btn-sm" action="edit"
						id="${purchaseOrderInstance?.id}">

						<g:message code="default.button.edit.label" default="Edit" />
					</g:link>
					<button class="btn btn-sm btn-default" type="submit"
						name="_action_delete">

						<g:message code="default.button.delete.label" default="Delete" />
					</button>
				</g:form>
			</div>

			<div class="col-md-12">
				<richui:tabView id="tabView">
					<richui:tabLabels>
						<richui:tabLabel title="Description" />
					</richui:tabLabels>
	
					<richui:tabContents>
						<richui:tabContent>
							${purchaseOrderInstance?.description}
						</richui:tabContent>
					</richui:tabContents>
				</richui:tabView>
			</div>

		</div>
	</div>
</body>
</html>
