//
//  ViewController.swift
//  SWE ios
//
//  Created by YR on 5/8/20.
//  Copyright © 2020 swe ios. All rights reserved.
//
import Foundation
import UIKit
import AWSMobileClient

import AWSAppSync


class ViewController: UIViewController{
    
//    @IBOutlet weak var termsTxtView: UITextView!

   
    

    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var signinBtn: UIButton!
    @IBOutlet weak var registerBtn: DesignableButton!
    

    
    let topMargin:CGFloat = CGFloat(70)
    
    
    var appSyncClient: AWSAppSyncClient?
    
    
    var user: AWSCognitoIdentityUser?
    var pool: AWSCognitoIdentityUserPool?
    var response: AWSCognitoIdentityUserGetDetailsResponse?
    
    

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let appDelegate = UIApplication.shared.delegate as? AppDelegate
        appSyncClient = appDelegate?.appSyncClient
        

        handleKeyboard()
        initializeState()
        
       
    }

    
    func transitionToDashboard() {
        DispatchQueue.main.async{
            [weak self] in
            if let strongSelf = self{
                let storyboard = UIStoryboard(name: "TabBar", bundle: nil)
                if let controller = storyboard.instantiateViewController(withIdentifier: "TabBarVC") as? UITabBarController{

                    strongSelf.present(controller, animated: true, completion: nil)
                }
            }
        }
        
    }
    
    

    
    @IBAction func transitionToSignUp(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Register", bundle: nil)
        if let controller = storyboard.instantiateViewController(withIdentifier: "RegisterVC") as? RegisterVC{
            controller.modalPresentationStyle = .fullScreen
            present(controller, animated: true, completion: nil)
        }


    }
    
    
    
    @IBAction func onSigninClicked(_ sender: Any) {
       
        view.endEditing(true)
        
        let email = ((emailField.text)?.trimmingCharacters(in: .whitespaces))?.lowercased()
        let password = (passwordField.text)
        
        if(!(email?.isValidEmail() ?? true)){
            AuthPopUps.popUpInvalidEmail(VC: self)
            return
        }
        
        if(email != "" && password != "" ){
            
            signInUser(email ?? "", password ?? "")
        }else{
            AuthPopUps.popUpEmptyField(VC: self)
            return
            
        }
    }
    
    
    
    
    func signInUser(_ email: String, _ password: String) {
    
       
   
        AWSMobileClient.sharedInstance().signIn(username: email , password: password) { [weak self] (signInResult, error) in
            if let error = error  {
                print("\(error.localizedDescription)")
                
                DispatchQueue.main.async {
                    if let strongSelf = self{
                        
                      
                        AuthPopUps.popUpAccountNotFound(VC: strongSelf)
                        
//                        strongSelf.stopAnimation(animationView: strongSelf.animationView)
                    }
                }
               
            } else if let signInResult = signInResult {
                
                //user signed in manually after clicking the button
                switch (signInResult.signInState) {
                    
                case .signedIn:
                    
                    print("User is signed in")
                    
                     DispatchQueue.main.async {
                        if let strongSelf = self{
                            
                            
                            strongSelf.transitionToDashboard()
                        }
                     print("User is signed in.")
                     }
                    
                case .smsMFA:
                    if let strongSelf = self{
                        print("SMS message sent to \(signInResult.codeDetails?.destination)")
                        
                    }
                default:
                    DispatchQueue.main.async {
                        if let strongSelf = self{
                            
                            
                            
                        }
                    }
                    print("Sign In needs info which is not et supported.")
                }
            }
        }
        
    }
    
    
    func initializeState() -> Void {
        AWSMobileClient.sharedInstance().initialize { [weak self](userState, error) in
            if let userState = userState {
                print("UserState: \(userState.rawValue)")
                
                switch (userState){
                case .signedIn:
                    DispatchQueue.main.async {

                        if let strongSelf = self{
                            
                            
                                    strongSelf.transitionToDashboard()
                                
//                                strongSelf.transitionToDashboard()
                            
                        }
                    }
                    break
                case .signedOut:
                    break
                case .signedOutFederatedTokensInvalid:
                    
                    
                    
                    break
                case .signedOutUserPoolsTokenInvalid:
                    break
                case .guest:
                    break
                case .unknown:
                    break
                }
            } else if let error = error {
                print("error: \(error.localizedDescription)")
                
                if let strongSelf = self{
                   
                    AuthPopUps.popUpNetworkError(VC: strongSelf)
                }
            }
        }
        // Do any additional setup after loading the view, typically from a nib.
    }
    
  
}






class TermsViewController: UIViewController{
    
    
    
    @IBAction func dimissBtnExecute(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
}
