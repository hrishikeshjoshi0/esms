import com.esms.model.security.SecRole
import com.esms.model.security.SecUser
import com.esms.model.security.SecUserSecRole

class BootStrap {

	static final String PARAM_IMPORT_DATA = "importData"
	
	def springSecurityService
	
	def excelImportService
	
	def dataImportService
	
	def grailsApplication
	
    def init = { servletContext ->
		def userRole = SecRole.findByAuthority('ROLE_USER') ?: new SecRole(authority: 'ROLE_USER').save(failOnError: true)
		def adminRole = SecRole.findByAuthority('ROLE_ADMIN') ?: new SecRole(authority: 'ROLE_ADMIN').save(failOnError: true)

		def userUser = SecUser.findByUsername('test.user') ?: new SecUser(
			username: 'test.user',
			password: 'test',enabled: true).save(failOnError: true)

		if (!userUser.authorities.contains(userRole)) {
			SecUserSecRole.create userUser, userRole
		}
		
		def adminUser = SecUser.findByUsername('admin') ?: new SecUser(
			username: 'admin',
			password: 'admin',
			enabled: true).save(failOnError: true)

		if (!adminUser.authorities.contains(adminRole)) {
			SecUserSecRole.create adminUser, adminRole
		}
		
		//Import Data based on System Property -DimportData = true
		def importData = System.getProperty(PARAM_IMPORT_DATA)
		
		if(importData && Boolean.toBoolean(importData)) {
			def configLocation = grailsApplication.config.importer.configLocation
			
			if(configLocation) {
				println 'System Property "importData" set as true, Starting Data Imports from location: ' + configLocation + '.'
				println '======================================================================================'
				
				if(grailsApplication.config.importer.product) {
					println 'Importing Products Data'
					println '======================='
					dataImportService.importProductData(new FileInputStream(configLocation))
				}
				
				if(grailsApplication.config.importer.organization) {
					println 'Importing Organization Data'
					println '======================='
					//dataImportService.importCustomerData(fis)
					
					dataImportService.importCustomerData(new FileInputStream(configLocation))
				}
				
				
			}
			
		} else {
			println 'System Property "importData" set as False. Skipping all Data Imports.'
		}
    }
	
    def destroy = {
    }
}
