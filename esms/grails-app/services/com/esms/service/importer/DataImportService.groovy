package com.esms.service.importer

import java.text.SimpleDateFormat

import com.esms.importer.OrganizationExcelImporter
import com.esms.importer.ProductExcelImporter
import com.esms.model.party.Organization
import com.esms.model.product.ProductPrice
import com.esms.service.account.AccountService;
import com.esms.util.UtilService;

class DataImportService {
	
	def productService
	
	def accountService

    def importProductData(InputStream is) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		
		ProductExcelImporter importer = new ProductExcelImporter(is)
		def products = importer.getProducts()
		products?.each { Map prodParams ->
			
			if(prodParams.introductionDate) {
				prodParams.introductionDate = sdf.parse(prodParams.introductionDate?.toString())
			}
			
			if(prodParams.fromDate) {
				def fromDate = prodParams.fromDate.toString()
				prodParams.fromDate = sdf.parse(fromDate)
			}
			
			if(prodParams.toDate) {
				def toDate = prodParams.toDate.toString()
				prodParams.toDate = sdf.parse(toDate)
			}
			
			if(!prodParams.uom) {
				prodParams.uom = "EACH"
			}
			
			def product = productService.createNewProduct(prodParams)
			
			//Price
			def productPrice = new ProductPrice(prodParams)
			productPrice.product = product
			
			
			product.addToPrices(productPrice)
			
			productService.saveOrUpdateProduct(product)
		}
    }
	
	def importCustomerData(InputStream is) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		
		OrganizationExcelImporter importer = new OrganizationExcelImporter(is)
		def organizations = importer.getOrganizations()
		organizations?.each { Map params ->
			
			if(params.contractFromDate) {
				def fromDate = params.contractFromDate.toString()
				params.contractFromDate = sdf.parse(fromDate)
			}
			
			if(params.contractToDate) {
				def toDate = params.contractToDate.toString()
				params.contractToDate = sdf.parse(toDate)
			}
			
			if(params.expiryDate) {
				def expiryDate = params.expiryDate.toString()
				params.expiryDate = sdf.parse(expiryDate)
			}
			
			def organization = new Organization(params)
			organization.externalId = accountService.createNewAccount(params)
			
			println organization
		}
	}
}
