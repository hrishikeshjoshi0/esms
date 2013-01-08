package com.esms.model.party;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Id;
import javax.persistence.Inheritance;
import javax.persistence.InheritanceType;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.Lob;
import javax.persistence.OneToMany;

@javax.persistence.Entity(name="PM_PARTY")
@Inheritance(strategy=InheritanceType.JOINED)
public class Party implements Serializable {

	private static final long serialVersionUID = 1L;

	@Id
	@Column(name = "PM_PARTY_ID", unique = true, nullable = false)
	private int partyId;

	@Lob()
	@Column(name = "PM_DESCRIPTION", length = 100)
	private String description;

	@Column(name = "PM_EXTERNAL_ID", length = 50)
	private String externalId;

	@Column(name = "PM_STATUS", length = 50)
	private String status;
	
	@Column(name = "PM_RELATIONSHIP_TYPE", length = 50)
	private String relationshipType;
	
	@Column(name = "PM_PARTY_TYPE", length = 50)
	private String partyType;

	@OneToMany(cascade = {CascadeType.ALL})
	@JoinTable(name = "PM_PARTY_ADDRESS", joinColumns = { @JoinColumn(name = "PM_PARTY_ID", unique = true) }, inverseJoinColumns = { @JoinColumn(name = "AB_ADDRESS_ID") })
	private List<Address> addresses = new ArrayList<Address>();
	
	@OneToMany(cascade = {CascadeType.ALL})
	@JoinColumn(name = "PM_PARTY_ID", nullable = false)
	private List<PartyContactMech> partyContactMechs = new ArrayList<PartyContactMech>();
	
	public Party() {
	}

	public int getPartyId() {
		return partyId;
	}

	public void setPartyId(int partyId) {
		this.partyId = partyId;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getExternalId() {
		return externalId;
	}

	public void setExternalId(String externalId) {
		this.externalId = externalId;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getRelationshipType() {
		return relationshipType;
	}

	public void setRelationshipType(String relationshipType) {
		this.relationshipType = relationshipType;
	}

	public String getPartyType() {
		return partyType;
	}

	public void setPartyType(String partyType) {
		this.partyType = partyType;
	}
	
	public List<Address> getAddresses() {
		return addresses;
	}

	public void setAddresses(List<Address> addresses) {
		this.addresses = addresses;
	}
	
	public void addAddress(Address address) {
		if(address == null) {
			return;
		}
		addresses.add(address);
	}
	
	public List<PartyContactMech> getPartyContactMechs() {
		return partyContactMechs;
	}

	public void setPartyContactMechs(List<PartyContactMech> partyContactMeches) {
		this.partyContactMechs = partyContactMeches;
	}

	public void addPartyContactMech(PartyContactMech contactMech) {
		if (contactMech == null) {
			return;
		}

		this.partyContactMechs.add(contactMech);
	}
}