//
//  Cell.swift
//  SWE ios
//
//  Created by YR on 5/8/20.
//  Copyright © 2020 swe ios. All rights reserved.
//

import UIKit

class AppointmentCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var hourLabel: UILabel!
    
    var body: String!
    func setup(title: String, hour: String, body: String){
        self.titleLabel.text = title
        self.hourLabel.text = hour
        
        self.body = body
        
        
    }
}
