package com.esms.taglib

import org.codehaus.groovy.grails.web.pages.discovery.GrailsConventionGroovyPageLocator

class TemplateTagLib {
	
	def renderActions = { attrs,body->
		GrailsConventionGroovyPageLocator groovyPageLocator
		def defaultLayoutPath = "/layouts/actions/${params.controller}/${params.action}"
		
		if(groovyPageLocator.findTemplateByPath(defaultLayoutPath)) {
			g.render(template:defaultLayoutPath)
		} else{
			out << g.render(template: "/menu/sidebar")
		}
		
	}
}
