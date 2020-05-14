//
//  Extensions.swift
//  SWE ios
//
//  Created by YR on 5/8/20.
//  Copyright © 2020 swe ios. All rights reserved.
//

import Foundation
import UIKit
import QuartzCore


extension UIView {
    
    //cornerRadius: CGFloat(4), shadowRadius: CGFloat(5)
    func launchShadow() {
        self.backgroundColor = .clear
        self.layer.shadowColor = UIColor.black.cgColor// UIColor(red: 0, green: 0, blue: 0, alpha: 0.15).cgColor
//        self.clipsToBounds = true
        self.layer.shadowOffset = CGSize(width: 0.0, height: 4)//2.25)
        self.layer.shadowOpacity = 0.25//1.0
        self.layer.shadowRadius = 2//shadowRadius
//        self.layer.masksToBounds = false
//        self.layer.cornerRadius = self.frame.height/4 //cornerRadius
    }

    public func addBottomBorder(color: UIColor, width: CGFloat) {
        let border = CALayer()
        border.backgroundColor = color.cgColor
        var Selfwidth = self.frame.size.width
        if( self.frame.size.width >= ((UIScreen.main.bounds).width ) ){
            Selfwidth = 0
        }
        border.frame = CGRect(x: 0, y: self.frame.size.height - 2, width: Selfwidth, height: 2)
        self.layer.addSublayer(border)
    }
    
    
    func setRadius(radius: CGFloat? = nil) {
        
//        self.layer.masksToBounds = true;
        
        DispatchQueue.main.async{
            self.layer.cornerRadius = radius ?? self.frame.width / 2;
            self.clipsToBounds = false
            self.launchShadow()
        }
        
        
    }
    
    func roundCorners(corners: UIRectCorner, radius: CGFloat) {
        let path = UIBezierPath(roundedRect: bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        layer.mask = mask
    }
    
}








@IBDesignable
class DesignableView: UIView {
}

@IBDesignable
class DesignableButton: UIButton {
}

@IBDesignable
class DesignableLabel: UILabel {
}

@IBDesignable
class DesignableImageView: UIImageView {
}

extension UIView {
    
    @IBInspectable
    var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            print("the new value \(newValue)")
            
        
                layer.cornerRadius = newValue
            
            
        }
    }

    @IBInspectable
    var borderWidth: CGFloat {
        get {
            return layer.borderWidth
        }
        set {
            layer.borderWidth = newValue
        }
    }
    
    @IBInspectable
    var borderColor: UIColor? {
        get {
            if let color = layer.borderColor {
                return UIColor(cgColor: color)
            }
            return nil
        }
        set {
            if let color = newValue {
                layer.borderColor = color.cgColor
            } else {
                layer.borderColor = nil
            }
        }
    }
    
    @IBInspectable
    var shadowRadius: CGFloat {
        get {
            return layer.shadowRadius
        }
        set {
            layer.shadowRadius = newValue
        }
    }
    
    @IBInspectable
    var shadowOpacity: Float {
        get {
            return layer.shadowOpacity
        }
        set {
            layer.shadowOpacity = newValue
        }
    }
    
    @IBInspectable
    var shadowOffset: CGSize {
        get {
            return layer.shadowOffset
        }
        set {
            layer.shadowOffset = newValue
        }
    }
    
    @IBInspectable
    var shadowColor: UIColor? {
        get {
            if let color = layer.shadowColor {
                return UIColor(cgColor: color)
            }
            return nil
        }
        set {
            if let color = newValue {
                layer.shadowColor = color.cgColor
            } else {
                layer.shadowColor = nil
            }
        }
    }
    
    
    
    
    func toggleViewToRight(){
        
        DispatchQueue.main.async {
            let selfFrame = self.frame
             let newFrame = CGRect(x: selfFrame.origin.x + 100, y: selfFrame.origin.y, width: selfFrame.width, height: selfFrame.height)
             
             UIView.animate(withDuration: 0.2, animations: {
                     self.frame = newFrame
                    self.layoutIfNeeded()
                }, completion: { _ in
                 
             
                 UIView.animate(withDuration: 0.2, animations: {
                          self.frame = selfFrame
                         self.layoutIfNeeded()
                     }, completion: { _ in
                      
                     
                 })
            })
        }
        
    }
    
    
    
    func toggleViewToLeft(){
        DispatchQueue.main.async {
        let selfFrame = self.frame
        let newFrame = CGRect(x: selfFrame.origin.x - 100, y: selfFrame.origin.y, width: selfFrame.width, height: selfFrame.height)
        
        UIView.animate(withDuration: 0.2, animations: {
                 self.frame = newFrame
                self.layoutIfNeeded()
            }, completion: { _ in
             
            
               
                UIView.animate(withDuration: 0.2, animations: {
                        self.frame = selfFrame
                       self.layoutIfNeeded()
                   }, completion: { _ in
                })
        })
        }
            
    }
    
    
    
    
    
    
}



extension UIView {
    /// Returns the first constraint with the given identifier, if available.
    ///
    /// - Parameter identifier: The constraint identifier.
    func constraintsWithIdentifier(_ identifier: String) -> [NSLayoutConstraint] {
           return self.constraints.filter { $0.identifier == identifier }
       }

   func recursiveConstraintsWithIdentifier(_ identifier: String) -> [NSLayoutConstraint] {
       var constraintsArray: [NSLayoutConstraint] = []

       var subviews: [UIView] = [self]

       while !subviews.isEmpty {
           constraintsArray += subviews.flatMap { $0.constraintsWithIdentifier(identifier) }
           subviews = subviews.flatMap { $0.subviews }
       }

       return constraintsArray
   }
    
  
    func rotateView_90(to originTransform: CGAffineTransform?) {
        
        DispatchQueue.main.async{
            UIView.animate(withDuration: 0.5, delay: 0, options: .curveLinear, animations: { () -> Void in
                   self.transform = originTransform ?? self.transform.rotated(by: .pi)
               }) { (finished) -> Void in
                   self.setNeedsLayout()
                   self.layoutIfNeeded()
               }
        }
       
    }
    
}






extension UIViewController{
    func handleKeyboard(heightFraction: CGFloat = CGFloat(1.5)){
          NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
           NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
       }
     
       
       @objc func keyboardWillShow(notification: NSNotification) {
           if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
               if self.view.frame.origin.y == 0 {
                   
                    self.view.frame.origin.y -= keyboardSize.height/2
                
                   
                   
               }
           }
       }
       

       @objc func keyboardWillHide(notification: NSNotification) {
           if self.view.frame.origin.y != 0 {
               self.view.frame.origin.y = 0
           }
       }
       
       
       func hideKeyboardWhenTappedAround() {
           let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
           tap.cancelsTouchesInView = false
           view.addGestureRecognizer(tap)
       }

       @objc func dismissKeyboard() {
           view.endEditing(true)
       }
       
       
}

extension String {
    func isValidEmail() -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"

        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: self)
    }
    
    func TrimTrailingSpaces() -> String {
        var newString = self
        
        while newString.first?.isWhitespace == true {
            newString = String(newString.dropFirst())
        }
        
        while newString.last?.isWhitespace == true {
            newString = String(newString.dropLast())
        }
        
        return newString
    }
}
