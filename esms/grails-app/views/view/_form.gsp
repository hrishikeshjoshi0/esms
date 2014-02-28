<%@ page import="com.esms.model.core.ui.View" %>



	
			<div class="form-group fieldcontain ${hasErrors(bean: viewInstance, field: 'name', 'error')} ">
				<label for="name" class="col-md-3 col-sm-3 control-label"><g:message code="view.name.label" default="Name" /></label>
				<div class="col-md-9">
					<g:textField name="name" value="${viewInstance?.name}"/>
					<span class="help-inline">${hasErrors(bean: viewInstance, field: 'name', 'error')}</span>
				</div>
			</div>

			<div class="form-group fieldcontain ${hasErrors(bean: viewInstance, field: 'url', 'error')} ">
				<label for="url" class="col-md-3 col-sm-3 control-label"><g:message code="view.url.label" default="Url" /></label>
				<div class="col-md-9">
					<g:textField name="url" value="${viewInstance?.url}"/>
					<span class="help-inline">${hasErrors(bean: viewInstance, field: 'url', 'error')}</span>
				</div>
			</div>

			<div class="form-group fieldcontain ${hasErrors(bean: viewInstance, field: 'controller', 'error')} ">
				<label for="controller" class="col-md-3 col-sm-3 control-label"><g:message code="view.controller.label" default="Controller" /></label>
				<div class="col-md-9">
					<g:textField name="paramController" value="${viewInstance?.controller}"/>
					<span class="help-inline">${hasErrors(bean: viewInstance, field: 'controller', 'error')}</span>
				</div>
			</div>

			<div class="form-group fieldcontain ${hasErrors(bean: viewInstance, field: 'action', 'error')} ">
				<label for="action" class="col-md-3 col-sm-3 control-label"><g:message code="view.action.label" default="Action" /></label>
				<div class="col-md-9">
					<g:textField name="paramAction" value="${viewInstance?.action}"/>
					<span class="help-inline">${hasErrors(bean: viewInstance, field: 'action', 'error')}</span>
				</div>
			</div>

			<div class="form-group fieldcontain ${hasErrors(bean: viewInstance, field: 'enabled', 'error')} ">
				<label for="enabled" class="col-md-3 col-sm-3 control-label"><g:message code="view.enabled.label" default="Enabled" /></label>
				<div class="col-md-9">
					<g:checkBox name="enabled" value="${viewInstance?.enabled}" />
					<span class="help-inline">${hasErrors(bean: viewInstance, field: 'enabled', 'error')}</span>
				</div>
			</div>

			<div class="form-group fieldcontain ${hasErrors(bean: viewInstance, field: 'title', 'error')} ">
				<label for="title" class="col-md-3 col-sm-3 control-label"><g:message code="view.title.label" default="Title" /></label>
				<div class="col-md-9">
					<g:textField name="title" value="${viewInstance?.title}"/>
					<span class="help-inline">${hasErrors(bean: viewInstance, field: 'title', 'error')}</span>
				</div>
			</div>

			<div class="form-group fieldcontain ${hasErrors(bean: viewInstance, field: 'header', 'error')} ">
				<label for="header" class="col-md-3 col-sm-3 control-label"><g:message code="view.header.label" default="Header" /></label>
				<div class="col-md-9">
					<g:textField name="header" value="${viewInstance?.header}"/>
					<span class="help-inline">${hasErrors(bean: viewInstance, field: 'header', 'error')}</span>
				</div>
			</div>

			<div class="form-group fieldcontain ${hasErrors(bean: viewInstance, field: 'actionsTemplate', 'error')} ">
				<label for="actionsTemplate" class="col-md-3 col-sm-3 control-label"><g:message code="view.actionsTemplate.label" default="Actions Template" /></label>
				<div class="col-md-9">
					<g:textField name="actionsTemplate" value="${viewInstance?.actionsTemplate}"/>
					<span class="help-inline">${hasErrors(bean: viewInstance, field: 'actionsTemplate', 'error')}</span>
				</div>
			</div>

			<div class="form-group fieldcontain ${hasErrors(bean: viewInstance, field: 'icon', 'error')} ">
				<label for="icon" class="col-md-3 col-sm-3 control-label"><g:message code="view.icon.label" default="Icon" /></label>
				<div class="col-md-9">
					<g:textField name="icon" value="${viewInstance?.icon}"/>
					<span class="help-inline">${hasErrors(bean: viewInstance, field: 'icon', 'error')}</span>
				</div>
			</div>

