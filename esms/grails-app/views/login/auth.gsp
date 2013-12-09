<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Login</title>
</head>
<body>
	<div class="row">
		<div class="col-md-12">

			<div class="row">
				<div class="center-block">
					<div class="col-md-4 col-md-offset-4">

						<g:if test='${flash.message}'>
							<div class='has-errors'>
								${flash.message}
							</div>
						</g:if>

						<div class="well">
							<form class="form-horizontal"
								action="${resource(file: 'j_spring_security_check')}"
								method="post">
								<fieldset>
									<legend> Please Login To Continue... </legend>
									<div class="form-group">
										<label for="j_username" class="col-md-3 control-label">
											User Name </label>
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
			</div>
		</div>
	</div>
</body>
</html>