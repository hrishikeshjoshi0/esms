<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Login</title>

<!-- Bootstrap framework -->
<link rel="stylesheet" href="bootstrap/css/bootstrap.min.css" />
<link rel="stylesheet" href="bootstrap/css/bootstrap-responsive.min.css" />
<link rel="stylesheet"
	href="${resource(dir: 'bootstrap3', file: 'esms.css')}" media="screen">

<!-- Favicons and the like (avoid using transparent .png) -->
<link rel="shortcut icon" href="favicon.ico" />
<link rel="apple-touch-glyphicon glyphicon-precomposed" href="icon.png" />

<link href='http://fonts.googleapis.com/css?family=PT+Sans'
	rel='stylesheet' type='text/css'>

<!--[if lte IE 8]>
            <script src="js/ie/html5.js"></script>
			<script src="js/ie/respond.min.js"></script>
        <![endif]-->
</head>
<body>
	<div class="row">
		<div class="col-md-12">

			<div class="row">
				<div class="col-md-4 col-md-offset-4">
					<g:if test='${flash.message}'>
						<div class='has-errors'>
							${flash.message}
						</div>
					</g:if>

					<div class="well">
						<form class="form-horizontal"
							action="${resource(file: 'j_spring_security_check')}"
							method="post" id="login_form">
							<fieldset>
								<legend>
									Please Login To Continue...
								</legend>
								<div class="form-group">
									<div class="col-md-12">
										<input type="text" id="j_username" name="j_username" class="col-md-12" autocomplete="off"
											placeholder="Username" />
									</div>
								</div>

								<div class="form-group">
									<div class="col-md-12">
										<input type="password" id="j_password" name="j_password" class="col-md-12"
											placeholder="Password" />
									</div>
								</div>

								<div class="form-group">
									<div class="col-md-10 col-md-offset-2">
										<button class="btn btn-primary pull-right" type="submit">Sign In</button>
									</div>
								</div>
							</fieldset>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>