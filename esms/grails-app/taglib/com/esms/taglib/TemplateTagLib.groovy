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
	
	def header = { attrs,body->
		out << 
		"""
		<div class="row form-header">
			<div class="col-md-1">
				<a href="#" class="thumbnail"> <img
					src="${g.resource(dir: 'images/icons', file: 'user_icon.png')}" />
				</a>
			</div>
			
			<div class="col-md-10">
				<div class="">
					<h1>${attrs.heading}</h1>
					<h4>
						${attrs.subheading?attrs.subheading:''}
					</h4>
				</div>
			</div>
		</div>
		"""
	}
}
