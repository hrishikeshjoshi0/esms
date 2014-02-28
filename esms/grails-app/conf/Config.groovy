import grails.plugin.springsecurity.SecurityConfigType

import org.springframework.web.context.request.RequestContextHolder

// locations to search for config files that get merged into the main config;
// config files can be ConfigSlurper scripts, Java properties files, or classes
// in the classpath in ConfigSlurper format

// grails.config.locations = [ "classpath:${appName}-config.properties",
//                             "classpath:${appName}-config.groovy",
//                             "file:${userHome}/.grails/${appName}-config.properties",
//                             "file:${userHome}/.grails/${appName}-config.groovy"]

// if (System.properties["${appName}.config.location"]) {
//    grails.config.locations << "file:" + System.properties["${appName}.config.location"]
// }

grails.project.groupId = appName // change this to alter the default package name and Maven publishing destination
grails.mime.file.extensions = true // enables the parsing of file extensions from URLs into the request format
grails.mime.use.accept.header = false
grails.mime.types = [
    all:           '*/*',
    atom:          'application/atom+xml',
    css:           'text/css',
    csv:           'text/csv',
    form:          'application/x-www-form-urlencoded',
    html:          ['text/html','application/xhtml+xml'],
    js:            'text/javascript',
    json:          ['application/json', 'text/json'],
    multipartForm: 'multipart/form-data',
    rss:           'application/rss+xml',
    text:          'text/plain',
    xml:           ['text/xml', 'application/xml']
]

// URL Mapping Cache Max Size, defaults to 5000
//grails.urlmapping.cache.maxsize = 1000

// What URL patterns should be processed by the resources plugin
grails.resources.adhoc.patterns = ['/images/*', '/css/*', '/js/*', '/plugins/*']

// The default codec used to encode data with ${}
grails.views.default.codec = "none" // none, html, base64
grails.views.gsp.encoding = "UTF-8"
grails.converters.encoding = "UTF-8"
// enable Sitemesh preprocessing of GSP pages
grails.views.gsp.sitemesh.preprocess = true
// scaffolding templates configuration
grails.scaffolding.templates.domainSuffix = 'Instance'

// Set to false to use the new Grails 1.2 JSONBuilder in the render method
grails.json.legacy.builder = false
// enabled native2ascii conversion of i18n properties files
grails.enable.native2ascii = true
// packages to include in Spring bean scanning
grails.spring.bean.packages = []
// whether to disable processing of multi part requests
grails.web.disable.multipart=false

// request parameters to mask when logging exceptions
grails.exceptionresolver.params.exclude = ['password']

// configure auto-caching of queries by default (if false you can cache individual queries with 'cache: true')
grails.hibernate.cache.queries = false

grails.plugins.remotepagination.max=10
//EnableBootstrap here when using twitter bootstrap, default is set to false.
grails.plugins.remotepagination.enableBootstrap=true

environments {
    development {
        grails.logging.jul.usebridge = true
    }
    production {
        grails.logging.jul.usebridge = false
        // TODO: grails.serverURL = "http://www.changeme.com"
    }
}

// log4j configuration
log4j = {
    // Example of changing the log pattern for the default console appender:
    //
    //appenders {
    //    console name:'stdout', layout:pattern(conversionPattern: '%c{2} %m%n')
    //}

    error  'org.codehaus.groovy.grails.web.servlet',        // controllers
           'org.codehaus.groovy.grails.web.pages',          // GSP
           'org.codehaus.groovy.grails.web.sitemesh',       // layouts
           'org.codehaus.groovy.grails.web.mapping.filter', // URL mapping
           'org.codehaus.groovy.grails.web.mapping',        // URL mapping
           'org.codehaus.groovy.grails.commons',            // core / classloading
           'org.codehaus.groovy.grails.plugins',            // plugins
           'org.codehaus.groovy.grails.orm.hibernate',      // hibernate integration
           'org.springframework',
           'org.hibernate',
           'net.sf.ehcache.hibernate'
}

grails.resources.modules = {
	chosen {
		resource url: '/js/chosen.jquery.min.js'
		resource url: '/css/chosen.css'
	}

	core {
		resource url:'/js/jquery-1.7.1.min.js', disposition: 'head'
		resource url: '/js/jquery-ui-1.8.18.custom.min.js'
		resource url: '/js/jquery-ui-timepicker-addon.js'
		resource url: '/js/jquery.qtip.min.js'
	}

	fullCalendar {
		dependsOn 'core'
		resource url:'/js/fullcalendar.min.js'
		resource url:'/css/fullcalendar.css'
	}

	calendar {
		dependsOn 'fullCalendar'
		resource url: '/js/calendar.js'
		resource url: '/js/bootstrapx-clickover.js'
		resource url: '/css/calendar.css'
	}
}

// Added by the Spring Security Core plugin:
grails.plugin.springsecurity.userLookup.userDomainClassName = 'com.esms.model.security.SecUser'
grails.plugin.springsecurity.userLookup.authorityJoinClassName = 'com.esms.model.security.SecUserSecRole'
grails.plugin.springsecurity.authority.className = 'com.esms.model.security.SecRole'

grails.plugin.springsecurity.securityConfigType = SecurityConfigType.InterceptUrlMap
grails.plugin.springsecurity.interceptUrlMap = [
	'/login/**': ['IS_AUTHENTICATED_ANONYMOUSLY'],
	'/static/**': ['IS_AUTHENTICATED_ANONYMOUSLY'],
	'/register/**': ['IS_AUTHENTICATED_ANONYMOUSLY'],
	'/**': ['ROLE_USER','ROLE_ADMIN'],
	'/login/bootstrap/css/bootstrap.min.css': ['ROLE_USER','ROLE_ADMIN'],
	'/login/bootstrap/css/bootstrap-responsive.min.css': ['ROLE_USER','ROLE_ADMIN']
]

/**
 *  Updated the last login date.
 */

grails.plugin.springsecurity.useSecurityEventListener = true

grails.plugin.springsecurity.onInteractiveAuthenticationSuccessEvent = { e, appCtx ->
	def currentRequest = RequestContextHolder.requestAttributes
	if(currentRequest) { // we have been called from a web request processing thread
	  currentRequest.session["lastLoginDate"] = new Date()
	}
	
	/*SecUser.withTransaction {
		def user = SecUser.findById(appCtx.springSecurityService.principal.id)
		if(!user.isAttached()) {
			user.attach()
		}
		user.lastLoginDate = new Date()
		user.save(flush: true, failOnError: true)
	}*/
	 
}	


fileuploader {
	docs {
		maxSize = 1000 * 1024 * 4 //4 mbytes
		allowedExtensions = ["doc", "docx", "pdf", "rtf"]
		path = "/tmp/docs/"
	}
	
	importer {
		maxSize = 1000 * 1024 * 4 //4 mbytes
		allowedExtensions = ["xls"]
		path = "/tmp/docs/"
	}
}


esms {
	settings {
		max = "10"
	}
}

importer {
	configLocation = "importer/BootstrapData.xls"
	
	product = true
	organization = true
}

// Added by the Spring Security Core plugin:
grails.plugin.springsecurity.userLookup.userDomainClassName = 'com.esms.model.security.SecUser'
grails.plugin.springsecurity.userLookup.authorityJoinClassName = 'com.esms.model.security.SecUserSecRole'
grails.plugin.springsecurity.authority.className = 'com.esms.model.security.SecRole'
grails.plugin.springsecurity.controllerAnnotations.staticRules = [
	'/':                              ['permitAll'],
	'/index':                         ['permitAll'],
	'/register/**':                   ['permitAll'],
	'/index.gsp':                     ['permitAll'],
	'/**/js/**':                      ['permitAll'],
	'/**/css/**':                     ['permitAll'],
	'/**/images/**':                  ['permitAll'],
	'/**/favicon.ico':                ['permitAll']
]

grails.plugin.springsecurity.useHttpSessionEventPublisher = true
// Uncomment and edit the following lines to start using Grails encoding & escaping improvements

/* remove this line 
// GSP settings
grails {
    views {
        gsp {
            encoding = 'UTF-8'
            htmlcodec = 'xml' // use xml escaping instead of HTML4 escaping
            codecs {
                expression = 'html' // escapes values inside null
                scriptlet = 'none' // escapes output from scriptlets in GSPs
                taglib = 'none' // escapes output from taglibs
                staticparts = 'none' // escapes output from static template parts
            }
        }
        // escapes all not-encoded output at final stage of outputting
        filteringCodecForContentType {
            //'text/html' = 'html'
        }
    }
}
remove this line */
