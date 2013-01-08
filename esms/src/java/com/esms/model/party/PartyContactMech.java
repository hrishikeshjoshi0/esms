package com.esms.model.party;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name="PM_PARTY_CONTACT_MECH")
public class PartyContactMech implements Serializable {
	
	private static final long serialVersionUID = 1L;

	@Id
	@Column(name="PM_CONTACT_MECH_ID")
	private int partyContactMechId;
	
	@Column(name="PM_CONTACT_MECH_PURPOSE", nullable=false, length=50)
	private String contactMechPurpose;

	@Column(name="PM_CONTACT_MECH_TYPE", nullable=false, length=50)
	private String contactMechType;

	@Column(name="PM_INFO_STRING", nullable=false, length=100)
	private String infoString;
	
	@ManyToOne
	@JoinColumn(name="PM_PARTY_ID",insertable=false,updatable=false)
	private Party party;

	public PartyContactMech(String contactMechPurpose, String contactMechType,
			String infoString) {
		super();
		this.contactMechPurpose = contactMechPurpose;
		this.contactMechType = contactMechType;
		this.infoString = infoString;
	}
	
	public PartyContactMech() {
    }

	public String getContactMechPurpose() {
		return contactMechPurpose;
	}

	public void setContactMechPurpose(String contactMechPurpose) {
		this.contactMechPurpose = contactMechPurpose;
	}

	public String getContactMechType() {
		return contactMechType;
	}

	public void setContactMechType(String contactMechType) {
		this.contactMechType = contactMechType;
	}

	public String getInfoString() {
		return infoString;
	}

	public void setInfoString(String infoString) {
		this.infoString = infoString;
	}

	public int getPartyContactMechId() {
		return partyContactMechId;
	}

	public void setPartyContactMechId(int partyContactMechId) {
		this.partyContactMechId = partyContactMechId;
	}

	public Party getParty() {
		return party;
	}

	public void setParty(Party party) {
		this.party = party;
	}
	
}