import com.esms.model.security.SecRole
import com.esms.model.security.SecUser
import com.esms.model.security.SecUserSecRole

class BootStrap {
	
	def springSecurityService
	
	def excelImportService
	
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
		
		StudentImportXLS importer = new StudentImportXLS("test/data/Example.xls")
		println importer.getStudents() 
    }
	
    def destroy = {
    }
}
