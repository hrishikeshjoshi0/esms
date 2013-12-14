package com.esms.service.importer

import grails.converters.JSON;

import java.text.SimpleDateFormat

import com.esms.importer.OrganizationExcelImporter
import com.esms.importer.ProductExcelImporter
import com.esms.model.party.Address
import com.esms.model.party.Contact
import com.esms.model.party.PhoneBook
import com.esms.model.product.ProductPrice
import com.esms.service.invoice.InvoiceService;

class DataImportService {
	
	def productService
	
	def accountService
	
	def invoiceService
	
	def utilService

    def importProductData(InputStream is) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		
		ProductExcelImporter importer = new ProductExcelImporter(is)
		def products = importer.getProducts()
		
		def totalSize = products?.size()
		
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
		
		println '----------'
		println 'Products Inserted :' + totalSize + '.'
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
				def order = accountService.createNewServiceContract(organization,params.contractType, params.contractFromDate, params.contractToDate, params.contractCost?.toBigDecimal())
				
				/*if(!order?.errors || order?.errors.empty) {
					//If there is no pending amount, create an invoice and a payment.
					
					if(params.expiryDate && (params.pendingAmount && params.pendingAmount >= 0)) {
						def invoicedAmount = order.pendingInvoiceGrandTotal - params.pendingAmount 
						def invoice = invoiceService.invoiceServiceContract(order,invoicedAmount,params.expiryDate)
					} else {
						def invoice = invoiceService.invoiceServiceContract(order,order.pendingInvoiceGrandTotal,null)
					}
				}*/
				
			} else {
				println organization.errors
			}
			
			//println '----------'
			//println 'Inserted ' + insertedSize + ' rows out of ' + totalSize + '.'
		}
		
		println '----------'
		println 'Organizations Inserted :' + totalSize + '.'
	}
}
