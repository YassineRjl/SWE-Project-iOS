//
//  RegisterVC.swift
//  SWE ios
//
//  Created by YR on 5/8/20.
//  Copyright © 2020 swe ios. All rights reserved.



import UIKit
import AWSMobileClient

import AWSAppSync

import PhoneNumberKit

//import Lottie

class RegisterVC: UIViewController, UITextFieldDelegate, UIImagePickerControllerDelegate & UINavigationControllerDelegate {



    var appSyncClient: AWSAppSyncClient!
    
    let topMargin:CGFloat = CGFloat(10)
    
    var user: AWSCognitoIdentityUser?
    var pool: AWSCognitoIdentityUserPool?
    var response: AWSCognitoIdentityUserGetDetailsResponse?
    
  
    
    @IBOutlet weak var backBtn: UIButton!
    @IBOutlet weak var Name: UITextField!
    @IBOutlet weak var Email: UITextField!
    @IBOutlet weak var Password: UITextField!
    @IBOutlet weak var signUpBtn: UIButton!
    @IBOutlet weak var retypePassword: UITextField!
    @IBOutlet weak var phoneNumber: PhoneNumberTextField!
    
    
  override func viewWillAppear(_ animated: Bool) {
         super.viewWillAppear(animated)
     
     }
     
    override func viewDidLoad() {
        super.viewDidLoad()

        let appDelegate = UIApplication.shared.delegate as? AppDelegate
        appSyncClient = appDelegate?.appSyncClient
        
        
        phoneNumber.withFlag = true
        phoneNumber.withPrefix = true
        phoneNumber.withExamplePlaceholder = true

        handleKeyboard()
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }

    
    
    @IBAction func backTapped(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }

    
   
    
    
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        guard let text = textField.text else { return true }
        let count = text.count + string.count - range.length
        return count <= 60
    }
   

    
    

    
    @IBAction func onRegisterClicked(_ sender: Any) {
        view.endEditing(true)
        
        
        
       
        

        let name_text:String = ((Name.text ?? "").TrimTrailingSpaces()).lowercased()
        let email_text = ((Email.text ?? "").TrimTrailingSpaces()).lowercased()
        let password_text = (Password.text ?? "")
        let retypedPassword_text = retypePassword.text ?? ""
        let mobilePhone_text = phoneNumber.text ?? ""
        
        
        if(!(email_text.isValidEmail())){
            AuthPopUps.popUpInvalidEmail(VC: self)
            return
        }
        
        
        if(password_text.count < 6){
            AuthPopUps.popUpPasswordWeak(VC: self)
            return
        }
        
        if(retypedPassword_text != password_text){
            AuthPopUps.popUpPasswordMatch(VC: self)
            return
        }
        
    
      
        
        if(email_text != "" && password_text != "" && name_text != "" && retypedPassword_text != "" && mobilePhone_text != ""){
            var mobilePh = mobilePhone_text.replacingOccurrences(of: " ", with: "")
            mobilePh = mobilePh.replacingOccurrences(of: "-", with: "")
            mobilePh = mobilePh.replacingOccurrences(of: "(", with: "")
            mobilePh = mobilePh.replacingOccurrences(of: ")", with: "")
            
            registerNewUser(email: email_text, password: password_text, name: name_text, phone: mobilePh)
        }else{
            AuthPopUps.popUpEmptyField(VC: self)
            return
            
        }
    }
    
    
    //Register new user
    
    func registerNewUser(email: String, password: String, name: String, phone: String){

        
        
        print("passed varables : +",email," ",password," ",name, " ", phone)
        self.view.endEditing(true)
        AWSMobileClient.default().signUp(username: email,
            password: password,
            userAttributes: ["email":email, "preferred_username": name, "phone_number": phone]) {[weak self] (signUpResult, error) in
                if let signUpResult = signUpResult {
                    switch(signUpResult.signUpConfirmationState) {
                    case .confirmed:
                        DispatchQueue.main.async {
                            if let strongSelf =  self{
                        
                          
                                print("signing in user...")
                                strongSelf.signInUser(email, password, completion: {
                                    done in
                              
                                
                                    strongSelf.getUserID { (userID) in
                                        print("uploading user profile img...")
                                        
                                        if let userID = userID{
                                      
                                              
                                                
                                        strongSelf.presentToDashboard()
                                            
                                                
                                          
                                        }
                                        
                                    }
                                })
                                
                                

                            }
                        }
                    
                        break
                    
                    case .unconfirmed:
                        //Unconfirmed email
                        if let strongSelf =  self{
                            
                        }
                        print("User is not confirmed and needs verification via \(signUpResult.codeDeliveryDetails?.deliveryMedium) sent at \(signUpResult.codeDeliveryDetails?.destination)")
                        
                    case .unknown:

                        
                        if let strongSelf =  self{
                            
                            
//                            strongSelf.stopAnimation(animationView: strongSelf.animationView)
                            AuthPopUps.popUpNetworkError(VC: strongSelf)
                            print("Unexpected case")
                            }
                        break
                    }
                } else if let error = error {
                    if let error = error as? AWSMobileClientError {
                        switch(error) {
                        case .usernameExists(let message):
                            print(message)
                            
                            if let strongSelf =  self{

                                AuthPopUps.popUpEmailUsed(VC: strongSelf)
                            }
                        default:
                            if let strongSelf =  self{
                                DispatchQueue.main.async {
                                    AuthPopUps.popUpSignupError(VC: strongSelf)
                                }
                            }
                            break
                        }
                    }
                    print("\(error.localizedDescription)")
      
                }else{
                    if let strongSelf =  self{
                    }
                }
        }
    }
    
    
    
    func getUserID(completion: @escaping ( (_ userID: String?)->() )){
    
            pool = AWSCognitoIdentityUserPool.default()
            user = pool?.currentUser()
    
    
            print("user \(user) and pool\(pool)")
        
            self.user?.getDetails().continueOnSuccessWith {[weak self] (task) -> AnyObject in // handle all auth setup
                DispatchQueue.main.async(execute: {
                    self?.response = task.result // AWSCognitoIdentityUserGetDetailsResponse
    
                    print("the response: response\(task.result)")
                    
                    if let attributes = task.result?.userAttributes {
                        //print("printing the attributes", attributes)//?.dictionaryValue["username"])
    
                        for attribute in attributes {
                            print("attributes")
                            if attribute.name == "sub" {
                                let userID = attribute.value ?? ""
                                print("found userID attribute: \(userID)")
                                completion(userID)
                            }
                        }
                    }else{
                        completion(nil)
                        print("coulddn't get credentials...")
                    }
    
                })
    
                return task
            }
    
    
        }
        
    
    
    func presentToDashboard() {
            DispatchQueue.main.async{
                [weak self] in
                if let strongSelf = self{
                    let storyboard = UIStoryboard(name: "TabBar", bundle: nil)
                    if let controller = storyboard.instantiateViewController(withIdentifier: "TabBarVC") as? UITabBarController{
    //                    controller.isModalInPresentation = true
    //                    controller.modalPresentationStyle = .fullScreen
                        strongSelf.present(controller, animated: true, completion: nil)
                    }
                }
            }
            
        }
    
    
    
    func signInUser(_ email: String, _ password: String, completion: @escaping ((_ done: Bool)->())) {

        
        
        
        AWSMobileClient.default().signIn(username: email , password: password) { [weak self] (signInResult, error) in
            
            if let strongSelf =  self{
            
            if let error = error  {
                print("\(error.localizedDescription)")
                
                completion(false)
                AuthPopUps.popUpAccountNotFound(VC: strongSelf)
            } else if let signInResult = signInResult {
                
                //user signed in manually after clicking the button
                switch (signInResult.signInState) {
                    
                case .signedIn:
                    
                    print("User is signed in")
                    
                  
                    DispatchQueue.main.async {
                        if let strongSelf =  self{
            
                            completion(true)
//                            }
                        }
                        
                        print("User is signed in.")
                    }
                    
                case .smsMFA:
                    print("SMS message sent to \(signInResult.codeDetails?.destination)")
                default:
                    DispatchQueue.main.async {
                        if let strongSelf =  self{
                             
//                            strongSelf.stopAnimation(animationView: strongSelf.animationView)
                        }
                    }
                    completion(false)
                    print("Sign In needs info which is not et supported.")
                }
            }
        }
        }
        
    }

   
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        Password.resignFirstResponder()
        return true
    }
    

    
}

