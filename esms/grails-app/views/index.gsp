<!doctype html>
<html>
<head>
<meta name="layout" content="bootstrap" />
<title>Venus CRM</title>
</head>
<body>
	<div class="container" style="margin: 20px;">
		<div class="row">
			<div class="span2 home-icon">
				<div class="thumb-pad">
					<g:link controller="lead" action="list" class="thumbnail">
						<img src="${resource(dir: 'images/home', file: 'leads.png')}"
						alt="">
					</g:link>
					<div class="thumb-pad-info">
						Leads
					</div>
				</div>
			</div>
			<div class="span2 home-icon">
				<div class="thumb-pad">
					<g:link controller="organization" action="list" class="thumbnail">
						<img src="${resource(dir: 'images/home', file: 'customers.png')}"
						alt="">
					</g:link>
					<div class="thumb-pad-info">
						Customers
					</div>
				</div>
			</div>
			<div class="span2 home-icon">
				<div class="thumb-pad">
					<g:link controller="quote" action="list" class="thumbnail">
						<img src="${resource(dir: 'images/home', file: 'quote.png')}"
						alt="">
					</g:link>
					<div class="thumb-pad-info">
						Quotes
					</div>
				</div>
			</div>
			<div class="span2 home-icon">
				<div class="thumb-pad">
					<g:link controller="order" action="list" class="thumbnail">
						<img src="${resource(dir: 'images/home', file: 'orders.png')}"
						alt="">
					</g:link>
					<div class="thumb-pad-info">
						Orders
					</div>
				</div>
			</div>
		</div>
		
		<div class="row">
			<div class="span10">
				<hr/>
			</div>
		</div>
		
		<div class="row">
			<div class="span2 home-icon">
				<div class="thumb-pad">
					<g:link controller="payment" action="list" class="thumbnail">
						<img src="${resource(dir: 'images/home', file: 'payments.png')}"
						alt="">
					</g:link>
					<div class="thumb-pad-info">
						Payments
					</div>
				</div>
			</div>
			<div class="span2 home-icon">
				<div class="thumb-pad">
					<a href="#" class="thumbnail">
						<img src="${resource(dir: 'images/home', file: 'inventory.png')}"
						alt="">
					</a>
					<div class="thumb-pad-info">
						Inventory
					</div>
				</div>
			</div>
			<div class="span2 home-icon">
				<div class="thumb-pad">
					<g:link controller="event" action="list" class="thumbnail">
						<img src="${resource(dir: 'images/home', file: 'calendar.png')}"
						alt="">
					</g:link>
					<div class="thumb-pad-info">
						Events
					</div>
				</div>
			</div>
			<div class="span2 home-icon">
				<div class="thumb-pad">
					<g:link controller="product" action="list" class="thumbnail">
						<img src="${resource(dir: 'images/home', file: 'products.png')}"
						alt="">
					</g:link>
					<div class="thumb-pad-info">
						Products
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
