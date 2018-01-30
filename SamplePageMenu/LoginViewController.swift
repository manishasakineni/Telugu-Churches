//
//  ViewController.swift
//  SamplePageMenu
//
//  Created by Mac OS on 05/01/18.
//  Copyright © 2018 Mac OS. All rights reserved.
//

import UIKit
import TextFieldEffects

class LoginViewController: UIViewController, UITextFieldDelegate {
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    

    
    @IBOutlet weak var mobileEmailTF: AkiraTextField!
    
    @IBOutlet weak var passwordTF: AkiraTextField!

    @IBOutlet weak var remembermeBtn: UIButton!
    
    
    var email = ""
    var password = ""

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        mobileEmailTF.delegate = self
        passwordTF.delegate = self
        
        
        //  mobileEmailTF.keyboardType = .emailAddress
        mobileEmailTF.borderStyle = UITextBorderStyle.roundedRect
        passwordTF.borderStyle = UITextBorderStyle.roundedRect
        
        mobileEmailTF.maxLengthTextField = 40
        mobileEmailTF.keyboardType = .emailAddress
        passwordTF.maxLengthTextField = 15
        passwordTF.keyboardType = .emailAddress
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    override func viewWillAppear(_ animated: Bool) {
        
        super.viewWillAppear(animated)
        
        self.navigationController?.navigationBar.isHidden = true
        
        
//        Utilities.setSignUpViewControllerNavBarColorInCntrWithColor(backImage: "icons8-hand_right_filled-1", cntr:self, titleView: nil, withText: "", backTitle: " InspectionPro", rightImage: appVersion, secondRightImage: "Up", thirdRightImage: "Up")
//        
//        //navigationItem.leftBarButtonItems = []
        
    }
    override func viewWillDisappear(_ animated: Bool) {
        
        super.viewWillDisappear(animated)
        self.navigationController?.navigationBar.isHidden = false

    }
    
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        
        if textField == mobileEmailTF{
            email = mobileEmailTF.text!
            
        }
            
        else if textField == passwordTF{
            
            password = passwordTF.text!
            
        }
        
    }
    
    
    //    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
    //
    //        if textField == mobileEmailTF {
    //            if string.characters.count > 0 {
    //                let allowedCharacters = CharacterSet.decimalDigits
    //
    //                let unwantedStr = string.trimmingCharacters(in: allowedCharacters)
    //                return unwantedStr.characters.count == 0
    //            }
    //
    //            return true
    //        }
    //        return true
    //
    //    }
    
    
    
    //MARK: -  validate pgone number
    
    func validatePhoneNumber(phoneNumber: String) -> Bool {
        
        
        let EmailTest = NSPredicate(format: "SELF MATCHES %@", "^(?=.*[a-z])(?=.*[$@$#!%*?&])[A-Za-z\\d$@$#!%*?&]{8,}")
        
        return EmailTest.evaluate(with: email)
    }
    
    
    //MARK: -  validate password
    
    func isPasswordValid(_ password : String) -> Bool{
        let passwordTest = NSPredicate(format: "SELF MATCHES %@", "^(?=.*[a-z])(?=.*[$@$#!%*?&])[A-Za-z\\d$@$#!%*?&]{8,}")
        return passwordTest.evaluate(with: password)
    }
    
    
    @IBAction func loginClicked(_ sender: Any) {
        
        

       
        
        self.view.endEditing(true)
        
        mobileEmailTF.text = mobileEmailTF.text!.trimmingCharacters(in: CharacterSet.whitespaces)
        passwordTF.text = passwordTF.text!.trimmingCharacters(in: CharacterSet.whitespaces)
        
        var errorMessage:NSString?
        
        
        
        if email.isEmpty && password.isEmpty{
            
            Utilities.sharedInstance.alertWithOkButtonAction(vc: self, alertTitle: "Message", messege: "Please Enter Requiredfields", clickAction: {
                
                
            })
            
        }
            
            
        else if (email.isEmpty) {
            
            Utilities.sharedInstance.alertWithOkButtonAction(vc: self, alertTitle: "Message", messege: "Please Enter your Mobilenumber or Email", clickAction: {
                
                
            })
            
        }
        else if (password.isEmpty) {
            
            Utilities.sharedInstance.alertWithOkButtonAction(vc: self, alertTitle: "Message", messege: "Please Enter Your Password", clickAction: {
                
                
            })
            
        }
            
        else if (  email.characters.count <= 9){
            
            Utilities.sharedInstance.alertWithOkButtonAction(vc: self, alertTitle: "Warning", messege: "Email or MobileNumber Should be10digits", clickAction: {
                
            })
            
        }
            
            
        else if(!GlobalSupportingClass.capitalOnly(password: passwordTF.text! as String)) {
            
            errorMessage=GlobalSupportingClass.capitalLetterMessage() as String as String as NSString?
        }
        else if(!GlobalSupportingClass.numberOnly(password: passwordTF.text! as String)) {
            
            errorMessage=GlobalSupportingClass.numberMessage() as String as String as NSString?
        }
        else if(!GlobalSupportingClass.specialCharOnly(password: passwordTF.text! as String)) {
            
            errorMessage=GlobalSupportingClass.specialCharacterMessage() as String as String as NSString?
        }
        
        if let errorMsg = errorMessage{
            
            Utilities.sharedInstance.alertWithOkButtonAction(vc: self, alertTitle: "Alert", messege: errorMsg as String, clickAction: {
            })
            
        }
        else {
            
            Utilities.sharedInstance.alertWithOkButtonAction(vc: self, alertTitle: "Warning", messege: "Please Check Your Internetconnection!", clickAction: {
                
                
            })
            
        }

//        let rootController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SWRevealViewController") as! SWRevealViewController
//        
//        
//         appDelegate.window?.rootViewController = rootController
//        
        
            //       let rootController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SWRevealViewController") as! SWRevealViewController
            //
            //         appDelegate.window?.rootViewController = rootController
            //
        
        
        

        
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        //        self.view.endEditing(true)
        return true
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        /// 1. replacementString is NOT empty means we are entering text or pasting text: perform the logic
        /// 2. replacementString is empty means we are deleting text: return true
        
        
        
        if textField == mobileEmailTF{
            
            if string.characters.count > 0 {
                
                let currentCharacterCount = textField.text?.characters.count ?? 0
                if (range.length + range.location > currentCharacterCount){
                    return false
                }
                let newLength = currentCharacterCount + string.characters.count - range.length
                
                let allowedCharacters = CharacterSet.decimalDigits
                
                let unwantedStr = string.trimmingCharacters(in: allowedCharacters)
                
                return newLength <= 40 && unwantedStr.characters.count == 0
                
            }
            
        }
        
        return true
    }
    func validateAllFields() -> Bool
    {
        mobileEmailTF.text = mobileEmailTF.text!.trimmingCharacters(in: CharacterSet.whitespaces)
        passwordTF.text = passwordTF.text!.trimmingCharacters(in: CharacterSet.whitespaces)
        
        let mnumb:NSString = mobileEmailTF.text! as NSString
        let pasword:NSString = passwordTF.text! as NSString
        
        
        //Check whether textField are left empty or not
        var errorMessage:NSString?
        
        if (mnumb.length<=0) {
            errorMessage=GlobalSupportingClass.blankPhoneNumberErrorMessage() as String as String as NSString?
        }
        else if (mnumb.length<=9) {
            errorMessage=GlobalSupportingClass.invalidPhoneNumberErrorMessage() as String as String as NSString?
        }
            
        else if (pasword.length<=0) {
            errorMessage=GlobalSupportingClass.blankPasswordErrorMessage() as String as String as NSString?
        }
    
 

        
        return true
    }
    
    

    
    @IBAction func forgotPasswordClicked(_ sender: Any) {
    }

    @IBAction func remembermeClicked(_ sender: Any) {
        
        
        
        
    }
    
    
    @IBAction func registerClicked(_ sender: Any) {
        
//        let appDelegate = UIApplication.shared.delegate as! AppDelegate
//        
//        let rootController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SWRevealViewController") as! SWRevealViewController
//        
//        appDelegate.window?.rootViewController = rootController
        
//        let signUpVc  : SignUpViewController = self.storyboard?.instantiateViewController(withIdentifier: "SignUpViewController") as! SignUpViewController
//        
//        self.navigationController?.pushViewController(signUpVc, animated: true)
//        
        
        
        
        
        
       // let  signUpViewController = SignUpViewController(nibName: "SignUpViewController", bundle: nil)
        
        let signUpViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SignUpViewController") as! SignUpViewController
        
//        failedViewController.deficencyCorrectiveModelArray = deficencyCorrectiveModelArray
//        failedViewController.operationArray = operationsModelArray
//        
        self.navigationController?.pushViewController(signUpViewController, animated: true)
        

        
//
//        let rootController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SignUpViewController") as! SignUpViewController
//        
//        appDelegate.window?.rootViewController = rootController
        
        
        
    }
    

}



