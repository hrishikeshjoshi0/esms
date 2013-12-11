package com.esms.service.product

import java.text.SimpleDateFormat

import com.esms.model.product.Product

class ProductService {
	
	def utilService
	
	static transactional = true

    def saveOrUpdateProduct(Product product) {
		if (!product.validate()) {
			return product 
		}
		
		product.save(flush: true)
		return product
    }
	
	def Product createNewProduct(params) {
		params.productNumber = utilService.newProductNumber()
		
		def product = new Product()
		product.properties = params
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		
		return product
	}
}
