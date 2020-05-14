//
//  PopUpVC.swift
//  SWE ios
//
//  Created by YR on 5/8/20.
//  Copyright © 2020 swe ios. All rights reserved.
//

import UIKit

class PopUpVC: UIViewController {
    
    
    @IBOutlet weak var titleField: UILabel!
    @IBOutlet weak var bodyField: UITextView!
    
    var titleTxt:String?
    var bodyTxt: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.titleField.text = titleTxt
        self.bodyField.text = bodyTxt
    }
}
