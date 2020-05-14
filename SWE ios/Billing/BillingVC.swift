//
//  BillingVC.swift
//  SWE ios
//
//  Created by YR on 5/8/20.
//  Copyright © 2020 swe ios. All rights reserved.
//

import UIKit

class BillingVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var feedTableView: UITableView!
    
    var lst: [BillObject] = [BillObject]()
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        query()
    }
    
    
     override func viewDidLoad() {
           super.viewDidLoad()
           
           self.feedTableView.separatorStyle = .none
       }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return lst.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! BillingCell
        
        let obj = lst[indexPath.row]
        cell.setup(title: obj.billPatient, body: buildBody(obj))
        cell.selectionStyle = .none
        
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
       return RowHeight
   }
   func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       DispatchQueue.main.async {
        
        let cell = tableView.cellForRow(at: indexPath) as! BillingCell
        
           let storyBoard : UIStoryboard = UIStoryboard(name: "TabBar", bundle:nil)
           let nextViewController = storyBoard.instantiateViewController(withIdentifier: "PopUpVC") as! PopUpVC
        
            nextViewController.titleTxt = "Bill Info"
            nextViewController.bodyTxt = cell.body
           self.present(nextViewController, animated:true, completion:nil)
       }
   }
    
    
    
    func query(){
        
        Queries.billQuery(VC: self) { (result) in
            
            self.lst.removeAll()
            
            for item in result{
                
                let billID: String = item?.billId ?? ""
                let billAmount: Float = Float(item?.billAmount ?? 0)
                let billReason: String = item?.billReason ?? ""
                let billPatient: String = item?.billPatient ?? ""
                let insuranceName: String = item?.insuranceName ?? ""
                
                
                let obj = BillObject(billID: billID, billAmount: billAmount, billReason: billReason, billPatient: billPatient, insuranceName: insuranceName)
                
                self.lst.append(obj)
            }
            
            self.feedTableView.reloadData()
            
        }
        
    }
    
    
    func buildBody(_ obj: BillObject?) -> String{
        let billID = obj?.billID ?? ""
        let billAmount = obj?.billAmount ?? 0
        let billReason = obj?.billReason ?? ""
        let billPatient = obj?.billPatient ?? ""
        let insuranceName = obj?.insuranceName ?? ""
        
    
        let formattedText = "BillID: \(billID)\n\nBill Amount: \(billAmount)\n\nBill Reason: \(billReason)\n\nPatient Name: \(billPatient)\n\nInsuranceName \(insuranceName)"
        
        return formattedText
        
    }
    
    
}

