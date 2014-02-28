<% import grails.persistence.Event %>
<%=packageName%>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="bootstrap3">
		<g:set var="entityName" value="\${message(code: '${domainClass.propertyName}.label', default: '${className}')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<div class="row">
			<div class="col-md-12">
				<%
					excludedProps = Event.allEvents.toList() << 'id' << 'version'
					allowedNames = domainClass.persistentProperties*.name << 'dateCreated' << 'lastUpdated'
					props = domainClass.properties.findAll { allowedNames.contains(it.name) && !excludedProps.contains(it.name) && it.type != null && !Collection.isAssignableFrom(it.type) }
				%>
				<filterpane:filterPane domain="\${domainClass.fullName}"
					filterProperties="\${${allowedNames}}"
					titleKey="default.filterPane.header" dialog="yes" visible="n"
					showSortPanel="y" showTitle="y" showButtons="y"
					fullAssociationPathFieldNames="false" />

				<div class="table-responsive">
					<table class="table table-striped table-condensed table-bordered table-hover">
						<thead>
							<tr>
							<%  Collections.sort(props, comparator.constructors[0].newInstance([domainClass] as Object[]))
								props.eachWithIndex { p, i ->
									if (i < 6) {
										if (p.isAssociation()) { %>
								<th class="header"><g:message code="${domainClass.propertyName}.${p.name}.label" default="${p.naturalName}" /></th>
							<%      } else { %>
								<g:sortableColumn property="${p.name}" title="\${message(code: '${domainClass.propertyName}.${p.name}.label', default: '${p.naturalName}')}" />
							<%  }   }   } %>
								<th></th>
							</tr>
						</thead>
						<tbody>
						<g:each in="\${${propertyName}List}" var="${propertyName}">
							<tr>
							<%  props.eachWithIndex { p, i ->
							        if (i < 6) {
										if (p.type == Boolean || p.type == boolean) { %>
								<td><g:formatBoolean boolean="\${${propertyName}.${p.name}}" /></td>
							<%          } else if (p.type == Date || p.type == java.sql.Date || p.type == java.sql.Time || p.type == Calendar) { %>
								<td><g:formatDate date="\${${propertyName}.${p.name}}" /></td>
							<%          } else { %>
								<td>\${fieldValue(bean: ${propertyName}, field: "${p.name}")}</td>
							<%  }   }   } %>
								<td class="link">
									<g:link action="show" id="\${${propertyName}.id}">Show &raquo;</g:link>
								</td>
							</tr>
						</g:each>
						</tbody>
					</table>
					<div class="pgn">
						<bootstrap:paginate total="\${${propertyName}Total}" params="\${filterParams}" />
					</div>
				</div>
			</div>
		</div>
	</body>
</html>
