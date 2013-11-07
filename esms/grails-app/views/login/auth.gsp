<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>Login</title>
    
        <!-- Bootstrap framework -->
            <link rel="stylesheet" href="bootstrap/css/bootstrap.min.css" />
            <link rel="stylesheet" href="bootstrap/css/bootstrap-responsive.min.css" />
        <!-- theme color-->
            <link rel="stylesheet" href="css/blue.css" />
        <!-- tooltip -->    
			<link rel="stylesheet" href="lib/qtip2/jquery.qtip.min.css" />
        <!-- main styles -->
            <link rel="stylesheet" href="css/style.css" />
    
        <!-- Favicons and the like (avoid using transparent .png) -->
            <link rel="shortcut icon" href="favicon.ico" />
            <link rel="apple-touch-icon-precomposed" href="icon.png" />
    
        <link href='http://fonts.googleapis.com/css?family=PT+Sans' rel='stylesheet' type='text/css'>
    
        <!--[if lte IE 8]>
            <script src="js/ie/html5.js"></script>
			<script src="js/ie/respond.min.js"></script>
        <![endif]-->
    </head>
    <body>
    	<div class="row-fluid">
			<div class="span2 pull-left">
				
			</div>
			
			<div class="span8">
				<center>
					<img src="${resource(dir: 'images', file: 'venus_crm_logo.png')}" alt="${meta(name:'app.name')}" />
				</center>	
				
				<br/><br/>
				
				<div class="login_box">
					<form action="${resource(file: 'j_spring_security_check')}" method="post" id="login_form">
						<div class="top_b">
							Sign in to Venus CRM
						</div>
						<g:if test='${flash.message}'>
							<div class='login_message'>${flash.message}</div>
						</g:if>	    
						<div class="cnt_b">
							<div class="formRow">
								<div class="input-prepend">
									<span class="add-on"><i class="icon-user"></i></span>
										<input type="text" id="j_username" name="j_username" placeholder="Username" />
								</div>
							</div>
							<div class="formRow">
								<div class="input-prepend">
									<span class="add-on"><i class="icon-lock"></i></span><input type="password" id="j_password" name="j_password" placeholder="Password"/>
								</div>
							</div>
						</div>
						<div class="btm_b clearfix">
							<button class="btn btn-inverse pull-right" type="submit">Sign In</button>
						</div>  
					</form>
				</div>
				
				<br/><br/>
			</div>
		</div>	
        
        <script src="js/jquery.min.js"></script>
        <script src="js/jquery.actual.min.js"></script>
        <script src="lib/validation/jquery.validate.min.js"></script>
		<script src="bootstrap/js/bootstrap.min.js"></script>
        <script>
            $(document).ready(function(){
                
				//* boxes animation
				form_wrapper = $('.login_box');
                $('.linkform a,.link_reg a').on('click',function(e){
					var target	= $(this).attr('href'),
						target_height = $(target).actual('height');
					$(form_wrapper).css({
						'height'		: form_wrapper.height()
					});	
					$(form_wrapper.find('form:visible')).fadeOut(400,function(){
						form_wrapper.stop().animate({
                            height	: target_height
                        },500,function(){
                            $(target).fadeIn(400);
                            $('.links_btm .linkform').toggle();
							$(form_wrapper).css({
								'height'		: ''
							});	
                        });
					});
					e.preventDefault();
				});
				
				//* validation
				$('#login_form').validate({
					onkeyup: false,
					errorClass: 'error',
					validClass: 'valid',
					rules: {
						username: { required: true, minlength: 3 },
						password: { required: true, minlength: 3 }
					},
					highlight: function(element) {
						$(element).closest('div').addClass("f_error");
					},
					unhighlight: function(element) {
						$(element).closest('div').removeClass("f_error");
					},
					errorPlacement: function(error, element) {
						$(element).closest('div').append(error);
					}
				});
            });
        </script>
    </body>
</html>