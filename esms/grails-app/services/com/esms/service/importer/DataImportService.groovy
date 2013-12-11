package com.esms.service.importer

import java.text.SimpleDateFormat

import com.esms.importer.ProductExcelImporter
import com.esms.model.product.ProductPrice

class DataImportService {
	
	def productService

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
}
