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
	String buildingType
	String drive
	String driveMake
	String driveCapacity
	String gateType
	String retiringCamType
	String lockType
	String servicePeriod

	Organization organization 
    
	static constraints = {
		liftMake nullable:true,blank:true
		liftControlSystem(blank:true,nullable:true)
		lastServiceProvider(blank:true,nullable:true)
		lastContractEndDate (blank:true,nullable:true)
		typeOfEnquiry(InList:['INSTALLATION','MAINTENANCE','MODERNISATION','REPAIR'])
		buildingType(InList:['RESIDENTIAL','INDUSTRIAL','COMMERCIAL','OTHER'])
		gateType(InList:['COLLAPSIBLE','AUTO DOOR','SWING DOOR RIGHT CLOSING','SWING DOOR LEFT CLOSING','ACCORDION DOOR','OTHER'])
		retiringCamType(InList:['OTIS','BHARAT BIJLEE'])
		lockType(InList:['OTIS','BHARAT BIJLEE','EROS EXCEL'])
    }
}
