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
	String drive = 'YES'
	String driveMake
	String driveCapacity
	String driveSerialNumber
	String gateType
	String gateTypeOther
	String retiringCamType
	String lockType
	String servicePeriod
	
	String buildingOpening
	int carCapacity
	String typeOfElevator
	String motorHP
	String motorCurrent
	String motorRpm
	String governerSpeed
	String trippingSpeed
	String machineMake
	String pulleyDiameter
	String numberOfGrooves
	String ropeSize
	String numberOfRopes
	
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
		drive(InList:['YES','NO'])
		driveCapacity nullable:true,blank:true
		driveSerialNumber nullable:true,blank:true
		buildingOpening nullable:true,blank:true
		carCapacity nullable:true,blank:true
		typeOfElevator nullable:true,blank:true
		motorHP nullable:true,blank:true
		motorCurrent nullable:true,blank:true
		motorRpm nullable:true,blank:true
		governerSpeed nullable:true,blank:true
		trippingSpeed nullable:true,blank:true
		machineMake nullable:true,blank:true
		pulleyDiameter nullable:true,blank:true
		numberOfGrooves nullable:true,blank:true
		ropeSize nullable:true,blank:true
		numberOfRopes nullable:true,blank:true
		gateTypeOther nullable:true,blank:true
    }
}
