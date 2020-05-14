//
//  AppsyncQuery.swift
//  SWE ios
//
//  Created by YR on 5/8/20.
//  Copyright © 2020 swe ios. All rights reserved.
//

import UIKit
import AWSAppSync

class Queries {
    
    //retrieve notif from database and force sync
       
    static func consultationQuery(VC: UIViewController, completion: @escaping ((_:[GetConsultationQuery.Data.GetConsultation?])->())){


        var appSyncClient: AWSAppSyncClient?{
            let appDelegate = UIApplication.shared.delegate as? AppDelegate
            let client = appDelegate?.appSyncClient
            return client
        }
    
        appSyncClient?.fetch(query: GetConsultationQuery(placeHolder: ""), cachePolicy: .fetchIgnoringCacheData)  {(result, error) in
              if error != nil {
                  print(error?.localizedDescription ?? "")
 
                  return
              }
            

        guard let rawCacheNotif = result?.data?.getConsultation else {return}
        completion(rawCacheNotif)
        
 
            
    }
   }
    
    
    static func billQuery(VC: UIViewController, completion: @escaping ((_:[GetBillQuery.Data.GetBill?])->())){


           var appSyncClient: AWSAppSyncClient?{
               let appDelegate = UIApplication.shared.delegate as? AppDelegate
               let client = appDelegate?.appSyncClient
               return client
           }
       
           appSyncClient?.fetch(query: GetBillQuery(placeHolder: ""), cachePolicy: .fetchIgnoringCacheData)  {(result, error) in
                 if error != nil {
                     print(error?.localizedDescription ?? "")
    
                     return
                 }
               

           guard let rawCacheNotif = result?.data?.getBill else {return}
           completion(rawCacheNotif)
           
    
               
       }
      }
    
    static func patientQuery(VC: UIViewController, completion: @escaping ((_:[GetPatientsQuery.Data.GetPatient?])->())){


           var appSyncClient: AWSAppSyncClient?{
               let appDelegate = UIApplication.shared.delegate as? AppDelegate
               let client = appDelegate?.appSyncClient
               return client
           }
       
           appSyncClient?.fetch(query: GetPatientsQuery(placeHolder: ""), cachePolicy: .fetchIgnoringCacheData)  {(result, error) in
                 if error != nil {
                     print(error?.localizedDescription ?? "")
    
                     return
                 }
               

           guard let rawCacheNotif = result?.data?.getPatients else {return}
           completion(rawCacheNotif)
           
    
               
       }
      }
}
