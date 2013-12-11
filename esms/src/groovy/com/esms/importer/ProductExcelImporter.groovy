package com.esms.importer
import org.grails.plugins.excelimport.AbstractExcelImporter
import org.grails.plugins.excelimport.ExcelImportService
import org.grails.plugins.excelimport.ExpectedPropertyType

class ProductExcelImporter extends AbstractExcelImporter {
	
	static Map propertyConfigurationMap = [
			fromDate:([expectedType: ExpectedPropertyType.StringType, defaultValue:null]),
			toDate:([expectedType: ExpectedPropertyType.StringType, defaultValue:null])
	 ]
	
	static Map CONFIG_BOOK_COLUMN_MAP = [
			sheet:'Product',
			startRow: 1	,
			columnMap:  [
					'A':'productName',
					'B':'productType',
					'C':'requiresInventory',
					'D':'introductionDate',
					'E':'manufacturer',
					'F':'comments',
					'G':'fromDate',
					'H':'toDate',
					'I':'price',
					'J':'uom'
			]
	]

    public ProductExcelImporter(String fileName){
	  this.read(fileName)
	}
	
	public ProductExcelImporter(InputStream is){
		this.read(is)
	}
	
	def getProducts(){
	  def productsList = ExcelImportService.getService().columns(workbook, CONFIG_BOOK_COLUMN_MAP)
	  return productsList
	}
}
