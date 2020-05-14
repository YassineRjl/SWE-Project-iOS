//
//  AuthPopUps.swift
//  SWE ios
//
//  Created by YR on 5/8/20.
//  Copyright © 2020 swe ios. All rights reserved.
//


import Foundation
import UIKit


class AuthPopUps{
    

    
    
    static func popUpPasswordMatch(VC: UIViewController){
    
        DispatchQueue.main.async {
             let alert = UIAlertController(title: "Passwords don't match", message: "Please check your passwords again", preferredStyle: .alert)
             alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { action in
                 switch action.style{
                 case .default:
                     print("default")
                 case .cancel:
                     print("cancel")
                     
                 case .destructive:
                     print("destructive")
                     
                     
                 }}))
         
         
             VC.present(alert, animated: true, completion: nil)
             
         }
        
    }
    
    
    
    
    
    
    
    static func popUpEmptyField(VC: UIViewController){
    
        DispatchQueue.main.async {
             let alert = UIAlertController(title: "Empty field", message: "Please fill in all the required fields", preferredStyle: .alert)
             alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { action in
                 switch action.style{
                 case .default:
                     print("default")
                 case .cancel:
                     print("cancel")
                     
                 case .destructive:
                     print("destructive")
                     
                     
                 }}))
         
         
             VC.present(alert, animated: true, completion: nil)
             
         }
        
    }
    
    
    
    
    static func popUpInvalidEmail(VC: UIViewController){
    
        DispatchQueue.main.async {
             let alert = UIAlertController(title: "Invalid Email", message: "Please enter a valid email address", preferredStyle: .alert)
             alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { action in
                 switch action.style{
                 case .default:
                     print("default")
                 case .cancel:
                     print("cancel")
                     
                 case .destructive:
                     print("destructive")
                     
                     
                 }}))
         
         
             VC.present(alert, animated: true, completion: nil)
             
         }
        
    }
    
    
  
    
    
    
    
    
    
    
    static func popUpPasswordWeak(VC: UIViewController){
        DispatchQueue.main.async {
            let alert = UIAlertController(title: "Weak Password", message: "Please choose a password of at least 6 characters", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Alright!", style: .default, handler: { action in
                switch action.style{
                case .default:
                    print("default")
                case .cancel:
                    
                    print("cancel")
                    
                case .destructive:
                    print("destructive")
                    
                    
                }}))
        
        
            VC.present(alert, animated: true, completion: nil)
        }
       
        
    }
    
    
    static func popUpNetworkError(VC: UIViewController){
        DispatchQueue.main.async {
            let alert = UIAlertController(title: "Error", message: "please check your internet connection and try again", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Alright!", style: .default, handler: { action in
                switch action.style{
                case .default:
                    print("default")
                case .cancel:
                    
                    print("cancel")
                    
                case .destructive:
                    print("destructive")
                    
                    
                }}))
            
        
        
        
            VC.present(alert, animated: true, completion: nil)
        }
    }
    
    
    static func popUpAccountNotFound(VC: UIViewController){
        DispatchQueue.main.async {
            let alert = UIAlertController(title: "Error", message: "Please check your password/email and try again", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Alright!", style: .default, handler: { action in
                switch action.style{
                case .default:
                    print("default")
                case .cancel:
                    
                    print("cancel")
                    
                case .destructive:
                    print("destructive")
                    
                    
                }}))
            
            
            
           
                VC.present(alert, animated: true, completion: nil)
        }
    }
    
    
    static func popUpSignupError(VC: UIViewController){
           DispatchQueue.main.async {
               let alert = UIAlertController(title: "Error", message: "Please check your phone number and try again", preferredStyle: .alert)
               alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { action in
                   switch action.style{
                   case .default:
                       print("default")
                   case .cancel:
                       
                       print("cancel")
                       
                   case .destructive:
                       print("destructive")
                       
                       
                   }}))
               
               
               
              
                   VC.present(alert, animated: true, completion: nil)
           }
       }
    
    
    static func popUpEmailUsed(VC: UIViewController){
        
        DispatchQueue.main.async {
            let alert = UIAlertController(title: "Email Already Used", message: "You have already registered your account, please tap on \"forgot password\" to reset it", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Alright!", style: .default, handler: { action in
                switch action.style{
                case .default:
                    print("default")
                case .cancel:
                    
                    print("cancel")
                    
                case .destructive:
                    print("destructive")
                    
                    
                }}))
            
        
        
        
            VC.present(alert, animated: true, completion: nil)
        }
    }
    
    
    static func emailRequiredForReset(VC: UIViewController){
        
        DispatchQueue.main.async {
            let alert = UIAlertController(title: "Your Email", message: "Please enter your email address", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Alright!", style: .default, handler: { action in
                switch action.style{
                case .default:
                    print("default")
                case .cancel:
                    
                    print("cancel")
                    
                case .destructive:
                    print("destructive")
                    
                    
                }}))
            
            
            
            
            VC.present(alert, animated: true, completion: nil)
        }
    }
    
    static func checkEmailAndTryAgain(VC: UIViewController){
        
        DispatchQueue.main.async {
            let alert = UIAlertController(title: "Error", message: "Please check your email and try again", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Alright!", style: .default, handler: { action in
                switch action.style{
                case .default:
                    print("default")
                case .cancel:
                    
                    print("cancel")
                    
                case .destructive:
                    print("destructive")
                    
                    
                }}))
            
            
            
            
            VC.present(alert, animated: true, completion: nil)
        }
    }
    
    
    static func resettingPassword(VC: UIViewController, email: String){
        
        DispatchQueue.main.async {
            let alert = UIAlertController(title: "Password Reset", message: "We have sent you a code to \"\(email)\", please check your emails", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Alright!", style: .default, handler: { action in
                switch action.style{
                case .default:
                    print("default")
//
//                    3EVC.ToResetPassword(scroll: .right)
                    
                case .cancel:
                    
                    print("cancel")
                    
                case .destructive:
                    print("destructive")
                    
                    
                }}))
            
            alert.addAction(UIAlertAction(title: "Nevermind", style: .cancel, handler: { action in
                switch action.style{
                case .default:
                    print("default")
                case .cancel:
                    print("cancel")
                    
                    
                case .destructive:
                    print("destructive")
                    
                    
                }}))
            
            
            
            
            VC.present(alert, animated: true, completion: nil)
        }
    }
    
}
