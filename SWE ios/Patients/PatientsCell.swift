//
//  PatientsCell.swift
//  SWE ios
//
//  Created by YR on 5/8/20.
//  Copyright © 2020 swe ios. All rights reserved.
//

import UIKit

class PatientsCell: UITableViewCell {
    
    
    @IBOutlet weak var titleLabel: UILabel!
    
    var body: String!
    
    func setup(title: String, body: String){
        self.titleLabel.text = title
        
        
        self.body = body
    }
}
