package com.esms.importer
import org.grails.plugins.excelimport.AbstractExcelImporter
import org.grails.plugins.excelimport.ExcelImportService
import org.grails.plugins.excelimport.ExpectedPropertyType


class OrganizationExcelImporter extends AbstractExcelImporter {
	
	static Map CONFIG_BOOK_COLUMN_MAP = [
			sheet:'Customer',
			startRow: 2	,
			columnMap:  [
					'A':'name',
					'B':'contact.designation',
					'C':'contact.firstName',
					'D':'contact.lastName',
					'E':'phoneBook.email',
					'F':'phoneBook.mobilePhone',
					'G':'phoneBook.officePhone',
					'H':'address.landmark',
					'I':'address.address1',
					'J':'address.adderss2',
					'K':'address.buildingName',
					'L':'groupName',
					'M':'address.city',
					'N':'address.state',
					'O':'address.country',
					'P':'address.area',
					'Q':'address.route',
					'R':'address.postalCode',
					'S':'contractCost',
					'T':'contractType',
					'U':'contractFromDate',
					'V':'contractToDate',
					'W':'expiryDate',
					'X':'pendingAmount'
			]
	]

    public OrganizationExcelImporter(String fileName){
	  this.read(fileName)
	}
	
	public OrganizationExcelImporter(InputStream is){
		this.read(is)
	}
	
	def getOrganizations(){
	  def organizationsList = ExcelImportService.getService().columns(workbook, CONFIG_BOOK_COLUMN_MAP)
	  return organizationsList
	}
}
