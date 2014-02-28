
<%@ page import="com.esms.model.core.ui.View" %>
<!doctype html>
<html>
<head>
<meta name="layout" content="bootstrap3">
<g:set var="entityName"
	value="${message(code: 'view.label', default: 'View')}" />
<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>
<body>
	<div class="row">
		<div class="col-md-12">
			<div class="panel-body">
				<div class="row form-header">
				  <div class="col-md-1">
				    <a href="#" class="thumbnail">
				      <img src="${resource(dir: 'images/icons', file: 'user_icon.png')}" />
				    </a>
				  </div>
				  
				  <div class="col-md-10">
				  	<div class="">
						<h1>
							<!-- Page Primary Header -->
							<g:message code="default.show.label" args="[entityName]" />
						</h1>
						<h4>
							<!-- Page Secondary Header -->
						</h4>
					</div>
				  </div>
				</div>

				<!--  Detail View  -->
				<div class="col-md-10 detailView">
					<div class="tab-content">
						<div class="tab-pane active" id="summary">
							<dl class="dl-horizontal">
								
											<dt><g:message code="view.name.label" default="Name" /></dt>
										
											<dd><g:fieldValue bean="${viewInstance}" field="name"/></dd>
										
								
											<dt><g:message code="view.url.label" default="Url" /></dt>
										
											<dd><g:fieldValue bean="${viewInstance}" field="url"/></dd>
										
								
											<dt><g:message code="view.controller.label" default="Controller" /></dt>
										
											<dd><g:fieldValue bean="${viewInstance}" field="controller"/></dd>
										
								
											<dt><g:message code="view.action.label" default="Action" /></dt>
										
											<dd><g:fieldValue bean="${viewInstance}" field="action"/></dd>
										
								
											<dt><g:message code="view.enabled.label" default="Enabled" /></dt>
										
											<dd><g:formatBoolean boolean="${viewInstance?.enabled}" /></dd>
										
								
											<dt><g:message code="view.title.label" default="Title" /></dt>
										
											<dd><g:fieldValue bean="${viewInstance}" field="title"/></dd>
										
								
											<dt><g:message code="view.header.label" default="Header" /></dt>
										
											<dd><g:fieldValue bean="${viewInstance}" field="header"/></dd>
										
								
											<dt><g:message code="view.actionsTemplate.label" default="Actions Template" /></dt>
										
											<dd><g:fieldValue bean="${viewInstance}" field="actionsTemplate"/></dd>
										
								
											<dt><g:message code="view.icon.label" default="Icon" /></dt>
										
											<dd><g:fieldValue bean="${viewInstance}" field="icon"/></dd>
										
								
							</dl>	
						</div>
					</div>
					<!-- Many Child Tabs -->
			    </div>
			    <!-- Tab Buttons -->
				<div class="col-md-2">
					<ul class="nav nav-pills nav-stacked tabLinks">
						<li class="active"><a href="#summary">Summary</a></li>
						<!-- Add Next Tabs Here -->
					</ul>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
