<richui:tabView id="tabView">
	<richui:tabLabels>
		<richui:tabLabel selected="true" title="User" />
		<richui:tabLabel title="Roles" />
	</richui:tabLabels>

	<richui:tabContents>
		<richui:tabContent>
			<!-- User Form -->
			<fieldset>
				<div class="row">
					<div class="col-md-6">
						<div class="row">
							<div
								class="form-group fieldcontain ${hasErrors(bean: user, field: 'username', 'error')} required">
								<label for="user" class="col-md-3 control-label"><g:message
										code="user.username.label" default="Username" /><span
									class="required-indicator">*</span></label>
								<div class="col-md-9">
									<g:textField name="username" required="" class="form-control"
										value="${user?.username}" />
									<span class="help-inline"> ${hasErrors(bean: user, field: 'username', 'error')}
									</span>
								</div>
							</div>
						</div>
						
						<div class="row">
							<div
								class="form-group fieldcontain ${hasErrors(bean: user, field: 'password', 'error')} required">
								<label for="user" class="col-md-3 control-label"><g:message
										code="user.password.label" default="Password" /><span
									class="required-indicator">*</span></label>
								<div class="col-md-9">
									<g:passwordField name="password" required="" class="form-control"
										value="${user?.password}" />
									<span class="help-inline"> ${hasErrors(bean: user, field: 'password', 'error')}
									</span>
								</div>
							</div>
						</div>
						
						<div class="row">
							<div class="checkbox col-md-12">
								<label class="col-md-3 control-label">
									<g:checkBox
										name="enabled" value="${user?.enabled}" /> 
									<g:message
										code="user.enabled.label" default="Enabled" />
								</label>
								
								<label class="col-md-3 control-label">
									<g:checkBox
										name="accountExpired" value="${user?.accountExpired}" /> 
									<g:message
										code="user.accountExpired.label" default="Account Expired" />
								</label>
								
								<label class="col-md-3 control-label"> 
									<g:checkBox
										name="accountLocked" value="${user?.accountLocked}" />
									<g:message
										code="user.accountLocked.label" default="Account Locked" />
								</label>
								
								<label class="col-md-3 control-label"> 
									<g:checkBox
										name="passwordExpired" value="${user?.passwordExpired}" />
									<g:message
										code="user.passwordExpired.label" default="Password Expired" />
								</label>
							</div>
						</div>
					</div>
				</div>
			</fieldset>
		</richui:tabContent>

		<richui:tabContent>
			<g:if test="${params.action == 'create' }">
				<g:each var="auth" in="${authorityList}">
					<div class="checkbox col-md-12">
						<label class="col-md-3 control-label"> <g:checkBox
								name="${auth.authority}" /> <g:link controller='role'
								action='edit' id='${auth.id}'>
								${auth.authority.encodeAsHTML()}
							</g:link>
						</label>
					</div>
				</g:each>
			</g:if>
			<g:elseif test="${params.action == 'edit' }">
				<g:each var="entry" in="${roleMap}">
					<div class="checkbox col-md-12">
						<label class="col-md-3 control-label"> <g:checkBox
								name="${entry.key.authority}" value="${entry.value}" /> <g:link controller='role'
								action='edit' id='${entry.key.id}'>
								${entry.key.authority.encodeAsHTML()}
							</g:link>
						</label>
					</div>
				</g:each>
			</g:elseif>
		</richui:tabContent>
	</richui:tabContents>
</richui:tabView>