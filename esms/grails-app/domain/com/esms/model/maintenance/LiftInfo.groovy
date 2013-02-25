package com.esms.model.maintenance

import com.esms.model.party.Organization;

class LiftInfo {
	
	int numberOfLifts
	int noOfFloors
	String liftMake
	String liftControlSystem
	String lastServiceProvider
	Date lastContractEndDate
	String typeOfEnquiry

	static belongsTo = [organization : Organization]
    
	static constraints = {
		liftMake nullable:true,blank:true
		liftControlSystem(blank:true,nullable:true)
		lastServiceProvider(blank:true,nullable:true)
		lastContractEndDate (blank:true,nullable:true)
		typeOfEnquiry(InList:['AMC','REPAIR','BOTH'])
    }
}
