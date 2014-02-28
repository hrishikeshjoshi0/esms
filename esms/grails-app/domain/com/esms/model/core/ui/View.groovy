package com.esms.model.core.ui

class View {

	String name
	String url
	String controller
	String action
	boolean enabled = true
	String title
	String header
	String icon
	String actionsTemplate
	
	static constraints = {
		name nullable:true,blank:true
		url nullable:true,blank:true
		controller nullable:true,blank:true
		action nullable:true,blank:true
		enabled nullable:true,blank:true
		title nullable:true,blank:true
    	header nullable:true,blank:true
    	actionsTemplate nullable:true,blank:true
    	icon nullable:true,blank:true
    }
}
