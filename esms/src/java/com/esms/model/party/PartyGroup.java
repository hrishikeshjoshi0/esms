/**
 * 
 */
package com.esms.model.party;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Lob;
import javax.persistence.PrimaryKeyJoinColumn;

/**
 * @author hrishi
 * 
 */
@Entity(name="PM_PARTY_GROUP")
@PrimaryKeyJoinColumn(name="PM_PARTY_ID")
public class PartyGroup extends Party {
	
	private static final long serialVersionUID = 1L;

	@Column(name = "PM_GROUP_NAME", length = 50)
	private String groupName;
	
	@Column(name = "PM_OFFICE_SITE_NAME", length = 50)
	private String officeSiteName;
	
	@Lob
	@Column(name = "PM_COMMENTS", length = 100)
	private String comments;

	public String getGroupName() {
		return groupName;
	}

	public void setGroupName(String groupName) {
		this.groupName = groupName;
	}

	public String getOfficeSiteName() {
		return officeSiteName;
	}

	public void setOfficeSiteName(String officeSiteName) {
		this.officeSiteName = officeSiteName;
	}

	public String getComments() {
		return comments;
	}

	public void setComments(String comments) {
		this.comments = comments;
	}
	
}
