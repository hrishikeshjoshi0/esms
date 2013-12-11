package com.esms.util

import com.esms.model.product.Product

class UtilService {
	
	def prefixMap = ["Product":"PROD"]
	
	def String newProductNumber() {
		def count = Product.count();
		int no = (count?count:0) + 1;
		String productNumber = prefixMap."Product" + String.format("%05d", no)
		return productNumber
    }
}
