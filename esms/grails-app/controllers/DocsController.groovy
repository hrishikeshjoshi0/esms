import com.esms.model.party.Party
import com.lucastex.grails.fileuploader.UFile

class DocsController {

    def index = { 
		log.debug "Uploaded file with id=${params.ufileId}"
		[files: UFile.list(), params:params]
	}
	
	def upload = {
		[params:params]
	}
	
	def createDocument = {
		def ufile = UFile.get(params.ufileId)
		def party = Party.get(params.partyId?.toLong())
		party.documents.add(ufile)
		party.save(flush:true)
		redirect(controller:'organization',action:'show',id:party.id)
	}
	
	def delete = {
		def ufile = UFile.get(params.id)
		ufile.delete()
		redirect action:index
	}
}
