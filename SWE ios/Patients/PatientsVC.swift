//
//  PatientsVC.swift
//  SWE ios
//
//  Created by YR on 5/8/20.
//  Copyright © 2020 swe ios. All rights reserved.
//

import UIKit

class PatientsVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    @IBOutlet var feedTableView:UITableView!
    
    
     var lst: [PatientObject] = [PatientObject]()
    
    
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
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! PatientsCell
        
        let obj = lst[indexPath.row]
        cell.setup(title: obj.firstName + " " + obj.lastName, body: buildBody(obj))
        
        cell.selectionStyle = .none
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return RowHeight
    }
    
    
   func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       DispatchQueue.main.async {
        
        let cell = tableView.cellForRow(at: indexPath) as! PatientsCell
        
           let storyBoard : UIStoryboard = UIStoryboard(name: "TabBar", bundle:nil)
           let nextViewController = storyBoard.instantiateViewController(withIdentifier: "PopUpVC") as! PopUpVC
        
            nextViewController.titleTxt = "Patient Info"
            nextViewController.bodyTxt = cell.body
           self.present(nextViewController, animated:true, completion:nil)
       }
   }
    
    
    func query(){
        
        Queries.patientQuery(VC: self) { (result) in
            
            self.lst.removeAll()
            
            for item in result{
                
                let patientID: String = item?.patientId ?? ""
                let firstName: String = item?.firstName ?? ""
                let lastName: String = item?.lastName ?? ""
                
                
                let CIN: String = item?.cin ?? ""
                let dob: String = item?.dob ?? ""
                let placeOfBirth: String = item?.placeOfBirth ?? ""
                let maritalStatus: String = item?.maritalStatus ?? ""
                let phoneNumber: String = item?.phoneNumber ?? ""
                let address: String = item?.address ?? ""
                let emergencyContact: String = item?.emergencyContact ?? ""
                let chronicDiseases: String = item?.chronicDiseases ?? ""
                
                let obj = PatientObject(patientID: patientID, firstName: firstName, lastName: lastName, CIN: CIN, dob: dob, placeOfBirth: placeOfBirth, maritalStatus: maritalStatus, phoneNumber: phoneNumber, emergencyContact: emergencyContact, chronicDiseases: chronicDiseases, address: address)
                
                
                self.lst.append(obj)
            }
            
            self.feedTableView.reloadData()
        }
        
    }
    
    
    func buildBody(_ obj: PatientObject?) -> String{
        let patientID: String = obj?.patientID ?? ""
        let firstName: String = obj?.firstName ?? ""
        let lastName: String = obj?.lastName ?? ""
        
        let CIN: String = obj?.CIN ?? ""
        let dob: String = obj?.dob ?? ""
        let placeOfBirth: String = obj?.placeOfBirth ?? ""
        let maritalStatus: String = obj?.maritalStatus ?? ""
        let phoneNumber: String = obj?.phoneNumber ?? ""
        let address: String = obj?.address ?? ""
        let emergencyContact: String = obj?.emergencyContact ?? ""
        let chronicDiseases: String = obj?.chronicDiseases ?? ""
         
    
        let formattedText = "Patient ID: \(patientID)\n\nFirst Name: \(firstName)\n\nLast Name: \(lastName)\n\nCIN: \(CIN)\n\nDOB \(dob)\n\nPlace Of Birth: \(placeOfBirth)\n\nMarital Status: \(maritalStatus)\n\nPhone Number: \(phoneNumber)\n\nAddress: \(address)\n\nEmergency Contact \(emergencyContact)\n\nChronic Diseases \(chronicDiseases)"
        
        return formattedText
        
    }
    
}
