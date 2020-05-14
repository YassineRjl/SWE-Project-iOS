//
//  BillObject.swift
//  SWE ios
//
//  Created by YR on 5/8/20.
//  Copyright © 2020 swe ios. All rights reserved.
//

import Foundation



class BillObject {
    
    let billID: String
    let billAmount: Float
    let billReason: String
    let billPatient: String
    let insuranceName: String
    
    init(billID: String, billAmount: Float, billReason: String, billPatient: String, insuranceName: String) {
        self.billID = billID
        self.billAmount = billAmount
        self.billReason = billReason
        self.billPatient = billPatient
        self.insuranceName = insuranceName
    }

    
}
