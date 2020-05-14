//
//  AppointmentObject.swift
//  SWE ios
//
//  Created by YR on 5/8/20.
//  Copyright © 2020 swe ios. All rights reserved.
//

import Foundation


class AppointmentObject {
    let consultationID: String
    let patientFirstName: String
    let patientLastName: String
    let consultationPrognosis: String
    let symptoms: String
    let time: String
    
    init(consultationID: String, patientFirstName: String, patientLastName: String, consultationPrognosis: String, symptoms: String, time: String) {
        self.consultationID = consultationID
        self.patientFirstName = patientFirstName
        self.patientLastName = patientLastName
        self.consultationPrognosis = consultationPrognosis
        self.symptoms = symptoms
        self.time = time
   }

    
}
