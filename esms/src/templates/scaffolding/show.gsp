<% import grails.persistence.Event %>
<%=packageName%>
<!doctype html>
<html>
<head>
<meta name="layout" content="bootstrap3">
<g:set var="entityName"
	value="\${message(code: '${domainClass.propertyName}.label', default: '${className}')}" />
<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>
<body>
	<div class="row">
		<div class="col-md-12">
			<div class="panel-body">
				<div class="row form-header">
				  <div class="col-md-1">
				    <a href="#" class="thumbnail">
				      <img src="\${resource(dir: 'images/icons', file: 'user_icon.png')}" />
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
								<%  excludedProps = Event.allEvents.toList() << 'id' << 'version'
									allowedNames = domainClass.persistentProperties*.name << 'dateCreated' << 'lastUpdated'
									props = domainClass.properties.findAll { allowedNames.contains(it.name) && !excludedProps.contains(it.name) }
									Collections.sort(props, comparator.constructors[0].newInstance([domainClass] as Object[]))
									props.each { p -> %>
											<dt><g:message code="${domainClass.propertyName}.${p.name}.label" default="${p.naturalName}" /></dt>
										<%  if (p.isEnum()) { %>
											<dd><g:fieldValue bean="\${${propertyName}}" field="${p.name}"/></dd>
										<%  } else if (p.type == Boolean || p.type == boolean) { %>
											<dd><g:formatBoolean boolean="\${${propertyName}?.${p.name}}" /></dd>
										<%  } else if (p.type == Date || p.type == java.sql.Date || p.type == java.sql.Time || p.type == Calendar) { %>
											<dd><g:formatDate date="\${${propertyName}?.${p.name}}" /></dd>
										<%  } else if(!p.type.isArray()) { %>
											<dd><g:fieldValue bean="\${${propertyName}}" field="${p.name}"/></dd>
										<%  } %>
								<%  } %>
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
