package com.esms.model.party

class Person extends Party {
	
	String salutation;

	String firstName;

	String middleName;

	String lastName;

	String suffix;

	String nickname;

	String gender;

	Date birthDate;

	Date deceasedDate;

	String maritalStatus;

	String socialSecurityNumber;

	String passportNumber;

	Date passportExpireDate;

    static constraints = {
    }
}
