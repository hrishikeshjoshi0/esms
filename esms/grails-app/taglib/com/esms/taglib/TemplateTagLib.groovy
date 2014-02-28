package com.esms.taglib

import com.esms.model.core.ui.*
import org.codehaus.groovy.grails.web.pages.discovery.GrailsConventionGroovyPageLocator

class TemplateTagLib {
	
	GrailsConventionGroovyPageLocator groovyPageLocator

	static namespace = "template"
	
	def renderActions = { attrs,body->
		def defaultLayoutPath = "/layouts/actions/${params.controller}/${params.action}"
		
		def view = View.findByControllerAndActionAndEnabled(params.controller,params.action,true)

		if(view) {
			if(groovyPageLocator.findTemplateByPath(view.actionsTemplate)) {
				out << """<div class=\"panel panel-default\"><div class=\"panel-body\">"""
				out << g.render(template:view.actionsTemplate)
				out << """</div></div>"""
			} 
		} else{
			def common = "/_common/actions/${params.action}"
			if(groovyPageLocator.findTemplateByPath(common)) {
				out << """<div class=\"panel panel-default\"><div class=\"panel-body\">"""
				out << g.render(template: common)
				out << """</div></div>"""
			}
		}		
	}
}
