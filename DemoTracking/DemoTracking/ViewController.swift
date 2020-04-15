//
//  ViewController.swift
//  eeeq
//
//  Created by Tanay Bhattacharjee on 18/03/20.
//  Copyright © 2020 Tanay Bhattacharjee. All rights reserved.
//

import UIKit
import intempt
class ViewController: UIViewController, UITextFieldDelegate {
    
    
    @IBOutlet var emailTxt: UITextField!
    @IBOutlet  var pwdTxt: UITextField!
    
    @IBOutlet var tanay: UIButton!
    @IBOutlet var lbl: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
    }
    
    @IBAction func ButtonPressed( sender: AnyObject? ) {
        
        if emailTxt.text == ""
        {
            self.showAlertWithOneAction(title:
                "Alert", actionTtitle: "Ok", style: .cancel, actionMethod: {
                    
            }, message: "Enter Your EmailId")
        }
        else if !self.isValidEmail(testStr: emailTxt.text!)
        {
            self.showAlertWithOneAction(title:
                "Alert", actionTtitle: "Ok", style: .cancel, actionMethod: {
                    
            }, message: "Not Valid Email Address. Email address should have @ symbol.")
        }
            
        else      if pwdTxt.text == ""
        {
            
            self.showAlertWithOneAction(title:
                "Alert", actionTtitle: "Ok", style: .cancel, actionMethod: {
                    
            }, message: "Enter Your Password")
        }
            
        else      if  pwdTxt.text == "123456"
            
        {
            
            //identify visitor///
            Intempt.identify("\(emailTxt.text!)", withProperties: nil, error: nil)
            ///---------------//
            let s =  self.storyboard?.instantiateViewController(identifier: "next") as! nextViewController
            self.navigationController?.pushViewController(s, animated: true)
            
        }
            
        else
        {
            self.showAlertWithOneAction(title:
                "Alert", actionTtitle: "Ok", style: .cancel, actionMethod: {
                    
            }, message: "Your email or Password not match.")
            
            
        }
        
    }
    
    func isValidEmail(testStr:String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: testStr)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool
    {
        
        textField.resignFirstResponder()
        return true
    }
}


