package com.esms.model.party.lead

import com.esms.model.party.Contact
import com.esms.model.party.Party
import com.esms.model.quote.Quote

class Lead extends Party {
	
	static hasMany = [contacts : Contact, quotes : Quote]

    static constraints = {
		contacts nullable:true
		quotes nullable:true
    }
}
