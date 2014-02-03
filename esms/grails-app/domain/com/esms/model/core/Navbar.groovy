package com.esms.model.core

class Navbar {
	
	String code
	
	Module module
	
	static hasMany = [navbarLinks:NavbarLink]

    static constraints = {
		code nullable:false,blank:false
    }
}
