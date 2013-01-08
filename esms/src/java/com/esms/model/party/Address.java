/**
 * 
 */
package com.esms.model.party;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * @author hrishi
 *
 */

@Entity
@Table(name="PM_PARTY_ADDRESS")
public class Address implements Serializable {

	private static final long serialVersionUID = 1L;

	@Id
	@Column(name = "PA_ADDRESS_BOOK_ID", unique = true, nullable = false)
	private int addressBookId;
	
	@Column(name="PA_TO_NAME", nullable=true, length=100)
	private String toName;
	
	@Column(name="PA_ATTN_NAME", nullable=true, length=100)
	private String attnName;
	
	@Column(name="PA_BUILDING_NAME", nullable=true, length=100)
	private String buildingName;
	
	@Column(name="PA_ADDRESS_1", nullable=true, length=100)
	private String address1;
	
	@Column(name="PA_ADDRESS_2", nullable=true, length=100)
	private String address2;
	
	@Column(name="PA_DIRECTIONS", nullable=true, length=100)
	private String directions;
	
	@Column(name="PA_CITY", nullable=true, length=100)
	private String city;
	
	@Column(name="PA_POSTAL_CODE", nullable=true, length=100)
	private String postalCode;
	
	@Column(name="PA_POSTAL_CODE_EXT", nullable=true, length=100)
	private String postalCodeExt;
	
	@Column(name="PA_COUNTRY", nullable=true, length=100)
	private String country;
	
	@Column(name="PA_STATE_PROVINCE", nullable=true, length=100)
	private String stateProvince;
	
	@Column(name="PA_ADDRESS_TYPE", nullable=false, length=100)
	private String addressType;
	
	public int getAddressBookId() {
		return addressBookId;
	}

	public void setAddressBookId(int addressBookId) {
		this.addressBookId = addressBookId;
	}

	public String getToName() {
		return toName;
	}

	public void setToName(String toName) {
		this.toName = toName;
	}

	public String getAttnName() {
		return attnName;
	}

	public void setAttnName(String attnName) {
		this.attnName = attnName;
	}

	public String getAddress1() {
		return address1;
	}

	public void setAddress1(String address1) {
		this.address1 = address1;
	}

	public String getAddress2() {
		return address2;
	}

	public void setAddress2(String address2) {
		this.address2 = address2;
	}

	public String getDirections() {
		return directions;
	}

	public void setDirections(String directions) {
		this.directions = directions;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getPostalCode() {
		return postalCode;
	}

	public void setPostalCode(String postalCode) {
		this.postalCode = postalCode;
	}

	public String getPostalCodeExt() {
		return postalCodeExt;
	}

	public void setPostalCodeExt(String postalCodeExt) {
		this.postalCodeExt = postalCodeExt;
	}

	public String getCountry() {
		return country;
	}

	public void setCountry(String country) {
		this.country = country;
	}

	public String getStateProvince() {
		return stateProvince;
	}

	public void setStateProvince(String stateProvince) {
		this.stateProvince = stateProvince;
	}

	public String getAddressType() {
		return addressType;
	}

	public void setAddressType(String addressType) {
		this.addressType = addressType;
	}

	public String getBuildingName() {
		return buildingName;
	}

	public void setBuildingName(String buildingName) {
		this.buildingName = buildingName;
	}
}
