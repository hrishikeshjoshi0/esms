<div class="row">
	<div class="col-md-6">
		<div class="row">
			<div
				class="form-group fieldcontain ${hasErrors(bean: command, field: 'username', 'error')} required">
				<label for="user" class="col-md-3 control-label"><g:message
						code="user.username.label" default="Username" /><span
					class="required-indicator">*</span></label>
				<div class="col-md-9">
					<g:textField name="username" required="" class="form-control"
						value="${command?.username}" />
					<span class="help-inline"> ${hasErrors(bean: command, field: 'username', 'error')}
					</span>
				</div>
			</div>
		</div>

		<div class="row">
			<div
				class="form-group fieldcontain ${hasErrors(bean: command, field: 'password', 'error')} required">
				<label for="user" class="col-md-3 control-label"><g:message
						code="user.password.label" default="Password" /><span
					class="required-indicator">*</span></label>
				<div class="col-md-9">
					<g:passwordField name="password" required="" class="form-control"
						value="${command?.password}" />
					<span class="help-inline"> ${hasErrors(bean: command, field: 'password', 'error')}
					</span>
				</div>
			</div>
		</div>

		<div class="row">
			<div
				class="form-group fieldcontain ${hasErrors(bean: command, field: 'password2', 'error')} required">
				<label for="user" class="col-md-3 control-label"><g:message
						code="user.password2.label" default="Password" /><span
					class="required-indicator">*</span></label>
				<div class="col-md-9">
					<g:passwordField name="password2" required="" class="form-control"
						value="${command?.password2}" />
					<span class="help-inline"> ${hasErrors(bean: command, field: 'password2', 'error')}
					</span>
				</div>
			</div>
		</div>
	</div>
</div>