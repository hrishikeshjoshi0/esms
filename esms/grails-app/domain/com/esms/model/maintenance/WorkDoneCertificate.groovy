package com.esms.model.maintenance

import com.esms.model.calendar.Event

class WorkDoneCertificate {
	
	Date date
	String customerName
	String contract
	String machineNumber
	String routeNumber
	String location
	Boolean routineService
	Boolean serviceCodeAttended
	Boolean breakDownCall
	Boolean callBackCodeAttended
	Date arrivalTime
	Boolean repairs
	Date repairsWorkCompleted
	Boolean ind_T_S_OrderExecution
	Date ind_T_S_OrderExecutionWorkStarted
	Date ind_T_S_OrderExecutionWorkCompleted
	String majorRepairs_Adjustment_ExtraExamination
	String examinerName
	String customerSignedOffBy
	String customerRemark
	
	Boolean machineRoom = false
	Boolean rideQuality = false
	Boolean carFanLight = false
	Boolean doorOperation = false
	Boolean carOperatingPanel = false
	Boolean carEntrance = false
	Boolean doorProtection = false
	Boolean floorLevels = false
	Boolean emergencyAlarm = false
	Boolean entrance = false
	Boolean buttonsAndSignals = false
	
	Event event

    static constraints = {
		date(nullable: false, blank: false)
		customerName(nullable: false, blank: false)
		contract(nullable: true, blank: true)
		machineNumber(nullable: true, blank: true)
		routeNumber(nullable: true, blank: true)
		location(nullable: true, blank: true)
		routineService(nullable: true, blank: true)
		serviceCodeAttended(nullable: true, blank: true)
		breakDownCall(nullable: true, blank: true)
		callBackCodeAttended(nullable: true, blank: true)
		arrivalTime(nullable: true, blank: true)
		repairs(nullable: true, blank: true)
		repairsWorkCompleted(nullable: true, blank: true)
		ind_T_S_OrderExecution(nullable: true, blank: true)
		ind_T_S_OrderExecutionWorkStarted(nullable: true, blank: true)
		ind_T_S_OrderExecutionWorkCompleted(nullable: true, blank: true)
		majorRepairs_Adjustment_ExtraExamination(nullable: true, blank: true)
		examinerName(nullable: true, blank: true)
		customerSignedOffBy(nullable: true, blank: true)
		customerRemark(nullable: true, blank: true)
		
		majorRepairs_Adjustment_ExtraExamination(nullable: true,blank:true,type:'text')
    }
}
