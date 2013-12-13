package com.esms.service.importer

import grails.converters.JSON;

import java.text.SimpleDateFormat

import com.esms.importer.OrganizationExcelImporter
import com.esms.importer.ProductExcelImporter
import com.esms.model.party.Address
import com.esms.model.party.Contact
import com.esms.model.party.PhoneBook
import com.esms.model.product.ProductPrice

class DataImportService {
	
	def productService
	
	def accountService
	
	def utilService

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
		
		int totalSize = organizations?.size()
		int insertedSize = 0
		
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
			
			params.designation = params.designation?.toUpperCase() 
			
			def organization = accountService.createNewAccount(params)
			
			def address = new Address(params)
			address.addressType = 'SHIPPING'
			address.postalCode = ''
			
			organization.addToAddresses(address)
			
			def contact = accountService.createNewContact(params)
			
			def phoneBook = new PhoneBook(params)
			
			
			contact.addToPhoneBooks(	phoneBook)
			
			organization.addToContacts(contact)
			
			organization = accountService.saveOrUpdateAccount(organization)
			
			if(organization.errors && !organization.errors?.errorCount != 0) {
				insertedSize++
				//Create Service Contract
				accountService.createNewServiceContract(organization,params.contractType, params.contractFromDate, params.contractToDate, params.contractCost?.toBigDecimal())
			} else {
				println organization.errors
			}
			
			println '----------'
			println 'Inserted ' + insertedSize + ' rows out of ' + totalSize + '.'
		}
	}
}
