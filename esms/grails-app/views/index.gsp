<!doctype html>
<html>
<head>
<meta name="layout" content="bootstrap" />
<title>EMS | Home</title>
</head>

<body>
	<div class="row-fluid">
		<aside id="application-status" class="span3">
			<div class="well sidebar-nav">
				<%--<h5>Application Status</h5>
					<ul>
						<li>App version: <g:meta name="app.version"/></li>
						<li>Grails version: <g:meta name="app.grails.version"/></li>
						<li>Groovy version: ${org.codehaus.groovy.runtime.InvokerHelper.getVersion()}</li>
						<li>JVM version: ${System.getProperty('java.version')}</li>
						<li>Controllers: ${grailsApplication.controllerClasses.size()}</li>
						<li>Domains: ${grailsApplication.domainClasses.size()}</li>
						<li>Services: ${grailsApplication.serviceClasses.size()}</li>
						<li>Tag Libraries: ${grailsApplication.tagLibClasses.size()}</li>
					</ul>
					<h5>Installed Plugins</h5>
					<ul>
						<g:each var="plugin" in="${applicationContext.getBean('pluginManager').allPlugins}">
							<li>${plugin.name} - ${plugin.version}</li>
						</g:each>
					</ul>
				--%>
			</div>
		</aside>

		<br/>
		<section id="main" class="span9">
			<div class="row-fluid">
				<div class="span12">
					<h1>Welcome to ESMS</h1>

				</div>
			</div>

		</section>
	</div>
</body>
</html>
