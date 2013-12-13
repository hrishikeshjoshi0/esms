package com.esms.importer
import org.grails.plugins.excelimport.AbstractExcelImporter
import org.grails.plugins.excelimport.ExcelImportService
import org.grails.plugins.excelimport.ExpectedPropertyType


class OrganizationExcelImporter extends AbstractExcelImporter {
	
	static propertyConfigurationMap = [
			name:([expectedType: ExpectedPropertyType.StringType, defaultValue:null]),
			designation:([expectedType: ExpectedPropertyType.StringType, defaultValue:0]),
			firstName:[expectedType: ExpectedPropertyType.StringType, defaultValue:null],
			lastName:[expectedType: ExpectedPropertyType.StringType, defaultValue:null],
			email:[expectedType: ExpectedPropertyType.StringType, defaultValue:null],
			mobilePhone:[expectedType: ExpectedPropertyType.StringType, defaultValue:null],
			officePhone:[expectedType: ExpectedPropertyType.StringType, defaultValue:null],
			landmark:[expectedType: ExpectedPropertyType.StringType, defaultValue:null],
			address1:[expectedType: ExpectedPropertyType.StringType, defaultValue:null],
			address2:[expectedType: ExpectedPropertyType.StringType, defaultValue:null],
			buildingName:[expectedType: ExpectedPropertyType.StringType, defaultValue:null],
			groupName:[expectedType: ExpectedPropertyType.StringType, defaultValue:null],
			city:[expectedType: ExpectedPropertyType.StringType, defaultValue:null],
			state:[expectedType: ExpectedPropertyType.StringType, defaultValue:null],
			country:[expectedType: ExpectedPropertyType.StringType, defaultValue:null],
			area:[expectedType: ExpectedPropertyType.StringType, defaultValue:null],
			route:[expectedType: ExpectedPropertyType.StringType, defaultValue:null],
			postalCode:[expectedType: ExpectedPropertyType.StringType, defaultValue:null],
			contractCost:[expectedType: ExpectedPropertyType.StringType, defaultValue:null],
			contractType:[expectedType: ExpectedPropertyType.StringType, defaultValue:null],
			contractFromDate:[expectedType: ExpectedPropertyType.DateType, defaultValue:null],
			contractToDate:[expectedType: ExpectedPropertyType.DateType, defaultValue:null],
			expiryDate:[expectedType: ExpectedPropertyType.DateType, defaultValue:null],
			pendingAmount:[expectedType: ExpectedPropertyType.StringType, defaultValue:0]
	 ]
	
	static CONFIG_BOOK_COLUMN_MAP = [
			sheet:'Customer',
			startRow: 1	,
			columnMap:  [
					'A':'name',
					'B':'designation',
					'C':'firstName',
					'D':'lastName',
					'E':'email',
					'F':'mobilePhone',
					'G':'officePhone',
					'H':'landmark',
					'I':'address1',
					'J':'address2',
					'K':'buildingName',
					'L':'groupName',
					'M':'city',
					'N':'state',
					'O':'country',
					'P':'area',
					'Q':'route',
					'R':'postalCode',
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
	  def organizationsList = ExcelImportService.getService().columns(workbook, CONFIG_BOOK_COLUMN_MAP,null,propertyConfigurationMap)
	  return organizationsList
	}
}
