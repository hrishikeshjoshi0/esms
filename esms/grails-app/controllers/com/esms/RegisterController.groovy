package com.esms

import grails.plugin.springsecurity.authentication.dao.NullSaltSource
import grails.plugin.springsecurity.ui.RegisterCommand
import grails.plugin.springsecurity.ui.RegistrationCode

import com.esms.model.security.SecRole;
import com.esms.model.security.SecUser
import com.esms.model.security.SecUserSecRole;

class RegisterController extends grails.plugin.springsecurity.ui.RegisterController {

	def register(RegisterCommand command) {
		if (command.hasErrors()) {
			flash.error = command.errors
			flash.chainedParams = params
			chain controller:'login',action: 'auth', model:[command: command,registered:false,errorMessage:message(code: 'spring.security.ui.register.miscError'),error:true]
			return
		}

		String salt = saltSource instanceof NullSaltSource ? null : command.username
		def user = new SecUser(username: command.username,accountLocked: true, enabled: false)

		RegistrationCode registrationCode = springSecurityUiService.register(user, command.password, salt)
		if (registrationCode == null || registrationCode.hasErrors()) {
			// null means problem creating the user
			flash.error = message(code: 'spring.security.ui.register.miscError')
			flash.chainedParams = params
			chain controller:'login',action: 'auth', model:[registered:false,errorMessage:message(code: 'spring.security.ui.register.miscError'),error:true]
			return
		}
		/*
		 String url = generateLink('verifyRegistration', [t: registrationCode.token])
		 def conf = SpringSecurityUtils.securityConfig
		 def body = conf.ui.register.emailBody
		 if (body.contains('$')) {
		 body = evaluate(body, [user: user, url: url])
		 }
		 mailService.sendMail {
		 to command.email
		 from conf.ui.register.emailFrom
		 subject conf.ui.register.emailSubject
		 html body.toString()
		 }*/
		
		def userRole = SecRole.findByAuthority('ROLE_USER')
		SecUserSecRole.create user, userRole
		
		chain controller:'login',action: 'auth', model:[registered:true,registeredMessage:'Registration process initiated! A system administrator can enable your account.']
	}
}
