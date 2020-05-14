//
//  AppointmentsVC.swift
//  SWE ios
//
//  Created by YR on 5/8/20.
//  Copyright © 2020 swe ios. All rights reserved.
//

import UIKit

class AppointmentsVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet var feedTableView:UITableView!
    
    
    
    var lst:[AppointmentObject] = [AppointmentObject]()
    
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
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! AppointmentCell
        
        let obj = lst[indexPath.row]
        cell.setup(title: obj.patientFirstName, hour: obj.time, body: buildBody(obj))
        
        cell.selectionStyle = .none
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return RowHeight
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        DispatchQueue.main.async {
         
         let cell = tableView.cellForRow(at: indexPath) as! AppointmentCell
         
            let storyBoard : UIStoryboard = UIStoryboard(name: "TabBar", bundle:nil)
            let nextViewController = storyBoard.instantiateViewController(withIdentifier: "PopUpVC") as! PopUpVC
         
             nextViewController.titleTxt = "Appointment Info"
             nextViewController.bodyTxt = cell.body
            self.present(nextViewController, animated:true, completion:nil)
        }
    }
    
    
    
    
    
    func query(){
        
        Queries.consultationQuery(VC: self) { (result) in
            
            self.lst.removeAll()
            
            for item in result{
                
                let consultationID = item?.consultationId ?? ""
                let patientFirstName = item?.patientFirstName ?? ""
                let patientLastName = item?.patientLastName ?? ""
                let consultationPrognosis = item?.consultationPrognosis ?? ""
                let symptoms = item?.symptoms ?? ""
                let time = item?.time ?? ""
                
                let obj = AppointmentObject(consultationID: consultationID, patientFirstName: patientFirstName, patientLastName: patientLastName, consultationPrognosis: consultationPrognosis, symptoms: symptoms, time: time)
                
                self.lst.append(obj)
            }
            
            self.lst.sort { (first, second) -> Bool in
                Int(first.time.replacingOccurrences(of: "am", with: ""))! >= Int(first.time.replacingOccurrences(of: "am", with: ""))!
            }
            
            self.feedTableView.reloadData()
        }
        
    }
    
    
    
    func buildBody(_ obj: AppointmentObject?) -> String{
        let consultationID = obj?.consultationID ?? ""
        let patientFirstName = obj?.patientFirstName ?? ""
        let patientLastName = obj?.patientLastName ?? ""
        let consultationPrognosis = obj?.consultationPrognosis ?? ""
        let symptoms = obj?.symptoms ?? ""
        let time = obj?.time ?? ""
        
        
        let formattedText = "Consultation ID:   \(consultationID)\n\nPatient First Name:   \(patientFirstName)\n\nPatient Last Name:   \(patientLastName)\n\nPrognosis:   \(consultationPrognosis)\n\nSymptoms:   \(symptoms)\n\nTime:   \(time)"
        
        return formattedText
        
    }
    
}
