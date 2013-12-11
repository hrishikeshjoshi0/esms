package com.esms.utility.importer

import com.lucastex.grails.fileuploader.UFile


class DataImportController {
	
	def dataImportService
	
    def index() { }
	
	def importer() { 
		[params:params]
	}
	
	def importData() {
		def ufile = UFile.get(params.ufileId)
		def is = new FileInputStream(ufile.path)
		dataImportService.importProductData(is)
	}
}
