//
//  PatientObject.swift
//  SWE ios
//
//  Created by YR on 5/8/20.
//  Copyright © 2020 swe ios. All rights reserved.
//

import Foundation

class PatientObject {
    
   let patientID: String
   let firstName: String
   let lastName: String
   let CIN: String
   let dob: String
   let placeOfBirth: String
   let maritalStatus: String
   let phoneNumber: String
   let address: String
   let emergencyContact: String
   let chronicDiseases: String
    
    init(patientID: String, firstName: String, lastName: String, CIN: String, dob: String, placeOfBirth: String, maritalStatus: String, phoneNumber: String, emergencyContact: String, chronicDiseases: String, address: String) {
        self.patientID = patientID
        self.firstName = firstName
        self.lastName = lastName
        
        self.CIN = CIN
        self.dob = dob
        self.placeOfBirth = placeOfBirth
        self.maritalStatus = maritalStatus
        self.phoneNumber = phoneNumber
        self.address = address
        self.emergencyContact = emergencyContact
        self.chronicDiseases = chronicDiseases
    }

    
}

