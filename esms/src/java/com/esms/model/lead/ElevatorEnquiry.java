/**
 * 
 */
package com.esms.model.lead;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Lob;
import javax.persistence.PrimaryKeyJoinColumn;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

/**
 * @author hrishi
 * 
 */
@Entity(name="L_ELEVATOR_ENQUIRY")
@PrimaryKeyJoinColumn(name="EN_ENQUIRY_ID")
public class ElevatorEnquiry extends Enquiry {
	
	private static final long serialVersionUID = 1L;

	@Column(name = "EE_NO_OF_ELEVATORS", nullable = true)
	private Long noOfElevators;

	@Column(name = "EE_NO_OF_FLOORS", nullable = true)
	private Long noOfFloors;
	
	@Column(name = "EE_MAKE", nullable = true)
	private String make;
	
	@Column(name = "EE_CONTROL_SYSTEM", nullable = true)
	private String controlSystem;
	
	@Column(name = "EE_CURRENT_SERVICE_PROVIDER", nullable = true)
	private String currentServiceProvider;
	
	@Temporal(TemporalType.DATE)
	@Column(name = "EE_CURRENT_SERVICE_END_DATE", nullable = true)
	private Date currentServiceEndDate;
	
	@Lob()
	@Column(name = "EE_REASON_FOR_CHANGE",length = 500,nullable = true)
	private String reasonForChange;
	
	public Long getNoOfElevators() {
		return noOfElevators;
	}

	public void setNoOfElevators(Long noOfElevators) {
		this.noOfElevators = noOfElevators;
	}

	public Long getNoOfFloors() {
		return noOfFloors;
	}

	public void setNoOfFloors(Long noOfFloors) {
		this.noOfFloors = noOfFloors;
	}

	public String getMake() {
		return make;
	}

	public void setMake(String make) {
		this.make = make;
	}

	public String getControlSystem() {
		return controlSystem;
	}

	public void setControlSystem(String controlSystem) {
		this.controlSystem = controlSystem;
	}

	public String getCurrentServiceProvider() {
		return currentServiceProvider;
	}

	public void setCurrentServiceProvider(String currentServiceProvider) {
		this.currentServiceProvider = currentServiceProvider;
	}

	public Date getCurrentServiceEndDate() {
		return currentServiceEndDate;
	}

	public void setCurrentServiceEndDate(Date currentServiceEndDate) {
		this.currentServiceEndDate = currentServiceEndDate;
	}

	public String getReasonForChange() {
		return reasonForChange;
	}

	public void setReasonForChange(String reasonForChange) {
		this.reasonForChange = reasonForChange;
	}
}
