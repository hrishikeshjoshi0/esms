package com.esms.model.core

import grails.rest.Resource;

@Resource
class Module {
	
	String name
	String comments
	String url
	String controller
	String action
	boolean active = true
	String displayText
	
	static hasOne = [navbar:Navbar]

    static constraints = {
		name nullable:false,blank:false
		active nullable:true,blank:true
		url nullable:false,blank:false
		controller nullable:false,blank:false
		action nullable:false,blank:false
		comments nullable:true,blank:true
    }
}
