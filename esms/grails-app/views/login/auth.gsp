 <!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Login</title>
</head>
<body>
	<div class="container">
		<div class="row">
			<div class="col-md-5 col-md-offset-3">
				<div class="well">
					<g:if test='${flash.message || (error!= null && error == true && command?.hasErrors()==false)}'>
						<bootstrap:alert class="alert-danger">
							${flash.message}
							<g:hasErrors bean="${command}">
									<ul>
										<g:eachError bean="${command}" var="error">
											<li
												<g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>>
												<g:message error="${error}" />
											</li>
										</g:eachError>
									</ul>
							</g:hasErrors>
						</bootstrap:alert>
					</g:if>
					<g:if test='${registered == true}'>
						<bootstrap:alert class="alert-success">
							<ul>
								<li>
									${registeredMessage}
								</li>
							</ul>
						</bootstrap:alert>
					</g:if>
	
					<div class="bs-example bs-example-tabs">
						<ul id="myTab" class="nav nav-tabs">
							<li class="active"><a href="#login" data-toggle="tab">Login</a></li>
							<li><a href="#register" data-toggle="tab">Register</a></li>
							<li><a href="#about" data-toggle="tab">About</a></li>
						</ul>
						<div id="myTabContent" class="tab-content">
							<div class="tab-pane fade in active" id="login">
								<div class="panel panel-default">
									<div class="panel-body">
										<form class="form-horizontal"
											action="${resource(file: 'j_spring_security_check')}"
											method="post">
											<fieldset>
												<div class="form-group">
													<label for="j_username" class="col-md-3 control-label">
														Username </label>
													<div class="col-md-9">
														<input type="text" id="j_username" name="j_username"
															class="col-md-12" autocomplete="off" placeholder="Username" />
													</div>
												</div>
			
												<div class="form-group">
													<label for="j_password" class="col-md-3 control-label">
														Password </label>
													<div class="col-md-9">
														<input type="password" id="j_password" name="j_password"
															class="col-md-12" placeholder="Password" />
													</div>
												</div>
			
												<div class="form-group">
													<div class="col-md-10 col-md-offset-2">
														<button class="btn btn-primary" type="submit">Sign
															In</button>
													</div>
												</div>
											</fieldset>
										</form>
									</div>
								</div>		
							</div>
							
							<div class="tab-pane fade" id="register">
								<div class="panel panel-default">
									<div class="panel-body">
										<g:if test="${!registered}">
											<div>
												<bootstrap:alert class="alert-info">
													 <p>The password should match the below conditions:</p>
													 <ul>
														<li>
															It should not be the same as the username.
														</li>
														<li>
															It should be between 8-64 characters.
														</li>
														<li>
															It should be a combination of uppercase and lowercase characters,numbers and special characters among "!@#$%^&".
														</li>
													</ul>
												</bootstrap:alert>	
											</div>
										</g:if>
										<form class="form-horizontal"
											action="${createLink(controller:'register',action:'register')}"
											method="post">
											<fieldset>
												<div class="form-group">
													<label for="username" class="col-md-3 control-label">
														Username </label>
													<div class="col-md-9">
														<input type="text" id="username" name="username"
															class="col-md-12" autocomplete="off"
															placeholder="Username" />
													</div>
												</div>

												<div class="form-group">
													<label for="password" class="col-md-3 control-label">
														Password </label>
													<div class="col-md-9">
														<input type="password" id="password" name="password"
															class="col-md-12" placeholder="Password" />
													</div>
												</div>

												<div class="form-group">
													<label for="password2" class="col-md-3 control-label">
														Password (again)</label>
													<div class="col-md-9">
														<input type="password" id="password2" name="password2"
															class="col-md-12" placeholder="Password (again)" />
													</div>
												</div>

												<div class="form-group">
													<div class="col-md-10 col-md-offset-2">
														<button class="btn btn-primary" type="submit">Register</button>
													</div>
												</div>
											</fieldset>
										</form>
									</div>
								</div>
							</div>
							
							<div class="tab-pane fade" id="about">
								<div class="panel panel-default">
										<div class="panel-body">
											<div class="row">
												<div class="col-md-4">
													<b>Version:</b> <g:meta name="app.version" />
												</div>
											</div>
										</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<g:if test='${flash.message || (error!= null && error == true && command?.hasErrors()==false)}'>
		<script>
			$(document).ready(function() {
				$('#myTab a[href="#register"]').tab('show'); // Select tab by name
			});
		</script>
	</g:if>
</body>
</html>