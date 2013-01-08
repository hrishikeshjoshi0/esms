/**
 * 
 */
package com.esms.model.lead;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Inheritance;
import javax.persistence.InheritanceType;
import javax.persistence.Lob;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

/**
 * @author hrishi
 *
 */

@Entity(name="L_ENQUIRY")
@Inheritance(strategy=InheritanceType.JOINED)
public class Enquiry implements Serializable {

	private static final long serialVersionUID = 1L;

	@Id
	@Column(name = "EN_ENQUIRY_ID", unique = true, nullable = false)
	private int enquiryId;
	
	@Column(name = "EN_ENQUIRY_NUMBER", nullable = true)
	private String enquiryNumber;
	
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "EN_ENQUIRY_DATE", nullable = true)
	private Date enquiryDate;
	
	@Column(name = "EN_PARTY_EXTERNAL_ID", nullable = true)
	private String partyExternalId;
	
	@Column(name = "EN_ENQUIRY_TYPE", nullable = true)
	private String enquiryType;
	
	@Column(name = "EN_ASSIGNED_TO_ID", nullable = true)
	private String assignedTo;
	
	@Column(name = "EN_ENQUIRY_STATUS", nullable = true)
	private String status;
	
	@Lob()
	@Column(name = "PM_COMMENTS", length = 500, nullable = true)
	private String comments;

	public int getEnquiryId() {
		return enquiryId;
	}

	public void setEnquiryId(int enquiryId) {
		this.enquiryId = enquiryId;
	}

	public String getEnquiryNumber() {
		return enquiryNumber;
	}

	public void setEnquiryNumber(String enquiryNumber) {
		this.enquiryNumber = enquiryNumber;
	}

	public Date getEnquiryDate() {
		return enquiryDate;
	}

	public void setEnquiryDate(Date enquiryDate) {
		this.enquiryDate = enquiryDate;
	}

	public String getPartyExternalId() {
		return partyExternalId;
	}

	public void setPartyExternalId(String partyExternalId) {
		this.partyExternalId = partyExternalId;
	}

	public String getEnquiryType() {
		return enquiryType;
	}

	public void setEnquiryType(String enquiryType) {
		this.enquiryType = enquiryType;
	}

	public String getAssignedTo() {
		return assignedTo;
	}

	public void setAssignedTo(String assignedTo) {
		this.assignedTo = assignedTo;
	}

	public String getComments() {
		return comments;
	}

	public void setComments(String comments) {
		this.comments = comments;
	}
}
