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
    
    @IBOutlet weak var eyeBtnOutlet: UIButton!
    
    var email : String? = ""
    var password : String? = ""

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        mobileEmailTF.delegate = self
        passwordTF.delegate = self
        
      //  eyeBtnOutlet.isHidden = true

        
        //  mobileEmailTF.keyboardType = .emailAddress
//        mobileEmailTF.borderStyle = UITextBorderStyle.roundedRect
//        passwordTF.borderStyle = UITextBorderStyle.roundedRect
//        
        mobileEmailTF.maxLengthTextField = 10
        mobileEmailTF.keyboardType = .default
        passwordTF.maxLengthTextField = 15
        passwordTF.keyboardType = .emailAddress
        
        remembermeBtn.setBackgroundImage(UIImage(named: "icons8-checked_filled-1"), for: UIControlState.normal)

        
        
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
    
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        
         if textField == passwordTF{
            
            passwordTF.isSecureTextEntry = true
            
        }
        
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
        
        

       
        if self.validateAllFields(){
            
            if(appDelegate.checkInternetConnectivity()){
                
              loginAPIService()
            }
            else{
                appDelegate.window?.makeToast(kNetworkStatusMessage, duration:kToastDuration, position:CSToastPositionCenter)
                return
            }
            
        }

        
    }
    
    
    
    func validateAllFields() -> Bool
    {
    
        self.view.endEditing(true)
        
        mobileEmailTF.text = mobileEmailTF.text!.trimmingCharacters(in: CharacterSet.whitespaces)
        passwordTF.text = passwordTF.text!.trimmingCharacters(in: CharacterSet.whitespaces)
        
      //  var errorMessage:NSString?
        
        
        
        if email!.isEmpty && password!.isEmpty{
            
            Utilities.sharedInstance.alertWithOkButtonAction(vc: self, alertTitle: "Message", messege: "Please Enter Requiredfields", clickAction: {
                
                
            })
            
        }
            

        else {
            
//            let rootController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SWRevealViewController") as! SWRevealViewController
//                appDelegate.window?.rootViewController = rootController
//            
            print("Home Page Navigate")

            
            //            Utilities.sharedInstance.alertWithOkButtonAction(vc: self, alertTitle: "Warning", messege: "Please Check Your Internetconnection!", clickAction: {
            //
            //
            //            })
            
        }
        
     return true
    }
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        //        self.view.endEditing(true)
        return true
    }
//    
//    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
//        /// 1. replacementString is NOT empty means we are entering text or pasting text: perform the logic
//        /// 2. replacementString is empty means we are deleting text: return true
//        
//        
//        
//        
//        if textField == mobileEmailTF{
//            
//            if string.characters.count > 0 {
//                
//                let currentCharacterCount = textField.text?.characters.count ?? 0
//                if (range.length + range.location > currentCharacterCount){
//                    return false
//                }
//                let newLength = currentCharacterCount + string.characters.count - range.length
//                
//                let allowedCharacters = CharacterSet.decimalDigits
//                
//                let unwantedStr = string.trimmingCharacters(in: allowedCharacters)
//                
//                return newLength <= 40 && unwantedStr.characters.count == 0
//                
//            }
//            
//        }
//        
//        return true
//    }

    
    func loginAPIService(){
        
        if(appDelegate.checkInternetConnectivity()){
            
            if !(email!.isEmpty && password!.isEmpty) {
                
                let strUrl = LOGINURL + "" + email! + "/" + password!
                
                
                serviceController.requestGETURL(strURL:strUrl, success:{(result) in
                    DispatchQueue.main.async()
                        {
                            
                            let respVO:LoginVo = Mapper().map(JSONObject: result)!
                            
                            
                      //      let isActive = respVO.IsSuccess
                            
//                            
//                            if(isActive == true){
//                                
//                                let listResultVo = respVO.Result
//                                
//                                if (listResultVo?.Name) != nil {
//                                    
//                                    self.name = (listResultVo?.Name)!
//                                }
//                                if (listResultVo?.AddressLine1) != nil {
//                                    
//                                    self.address1 = (listResultVo?.AddressLine1)!
//                                }
//                                if (listResultVo?.Id) != nil {
//                                    
//                                    self.idd = (listResultVo?.Id)!
//                                }
//                                
//                                if (listResultVo?.AddressLine2) != nil {
//                                    
//                                    self.address2 = (listResultVo?.AddressLine2)!
//                                    
//                                }
//                                if (listResultVo?.Landmark) != nil {
//                                    
//                                    self.landmark = (listResultVo?.Landmark)!
//                                }
//                                if (listResultVo?.MobileNumber) != nil {
//                                    
//                                    self.mobileNo = (listResultVo?.MobileNumber)!
//                                }
//                                if (listResultVo?.ProvinceName) != nil {
//                                    
//                                    self.selectedProvinceStr = (listResultVo?.ProvinceName)!
//                                }
//                                if (listResultVo?.DistrictName) != nil {
//                                    
//                                    self.selectedDistrictStr = (listResultVo?.DistrictName)!
//                                }
//                                if (listResultVo?.MandalName) != nil {
//                                    
//                                    self.selectedMandalStr = (listResultVo?.MandalName)!
//                                }
//                                if (listResultVo?.VillageName) != nil {
//                                    
//                                    self.selectedVillageStr = (listResultVo?.VillageName)!
//                                }
//                                if (listResultVo?.VillageId) != nil {
//                                    
//                                    self.villageID = (listResultVo?.VillageId)!
//                                    
//                                    self.saveBtnStr = "app.UpdateAddress".localize()
//                                    
//                                    self.saveBtn.setTitle(self.saveBtnStr,for: .normal)
//                                }
//                                if (listResultVo?.PostCode) != nil {
//                                    
//                                    let pinC = (listResultVo?.PostCode)!
//                                    
//                                    self.pinCode = String(pinC)
//                                }
//                                
//                                
//                                //                                self.addressResultListArr = [listResultVo!]
//                                
//                                
//                                DispatchQueue.main.async(execute: { () -> Void in
//                                    
//                                    self.addNewAddressTableView.reloadData()
//                                })
//                                
//                                
//                            }else if(isActive == false) {
//                                
//                                self.view.makeToast("Service not found", duration:kToastDuration, position:CSToastPositionCenter)
//                                
//                            }
                            
                            print("success")

                            
                    }
                }, failure:  {(error) in
                    
                    print("error")
                    
//                    if(error == "unAuthorized"){
//                        
//                        serviceController.refreshTokenForLogin(successHandler:{(result) in
//                            DispatchQueue.main.async()
//                                {
//                                    
//                                    self.getAddressByAddressIdAPIService()
//                                    
//                            }
//                        }, failureHandler:  {(error) in
//                            
//                            DispatchQueue.main.async()
//                                {
//                                    
//                                    let mainStoryboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
//                                    
//                                    let viewController = mainStoryboard.instantiateViewController(withIdentifier: "ViewController") as! ViewController
//                                    let appDelegate = UIApplication.shared.delegate as! AppDelegate
//                                    appDelegate.window?.rootViewController = viewController
//                                    
//                            }
//                            
//                            
//                        })
//                    }
                    
                    
                    
                })
            }
        }
        else {
            
            appDelegate.window?.makeToast(kNetworkStatusMessage, duration:kToastDuration, position:CSToastPositionCenter)
            return
        }
        
    }
    
    @IBAction func forgotPasswordClicked(_ sender: Any) {
        
        
        let reOrderPopOverVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ForgotPassWordViewController") as! ForgotPassWordViewController
       // reOrderPopOverVC.delegate = self
        
            //    reOrderPopOverVC. singleSelection =
            //   var imagesArray : Array<UIImage> = Array()
            
        
                self.addChildViewController(reOrderPopOverVC)
                
                reOrderPopOverVC.view.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height)
                self.view.addSubview(reOrderPopOverVC.view)
                reOrderPopOverVC.didMove(toParentViewController: self)
        
        
        
        
    }

    @IBAction func remembermeClicked(_ sender: Any) {
        
        if (remembermeBtn.isSelected == true)
        {
          //  remembermeBtn.setBackgroundImage(UIImage(named: "unselectedBox"), for: UIControlState.normal)
            remembermeBtn.setBackgroundImage(UIImage(named: "icons8-checked_filled-1"), for: UIControlState.normal)
            
            
            
            remembermeBtn.isSelected = false
        }
        else
        {
         //   remembermeBtn.setBackgroundImage(UIImage(named: "ic_check_circle"), for: UIControlState.normal)
            remembermeBtn.setBackgroundImage(UIImage(named: "icons8-unchecked_circle_filled"), for: UIControlState.normal)
            
            remembermeBtn.isSelected = true
            
        }
        
        
        
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
    

    @IBAction func eyeBtnAction(_ sender: Any) {
        
        if eyeBtnOutlet.tag == 0
        {
            passwordTF.isSecureTextEntry = false
            eyeBtnOutlet.tag = 1
        }
        else{
            
            passwordTF.isSecureTextEntry = true
            eyeBtnOutlet.tag = 0
            
            
        }
        
    }
}


//func validateAllFields() -> Bool
//{
//    
//    self.view.endEditing(true)
//    
//    mobileEmailTF.text = mobileEmailTF.text!.trimmingCharacters(in: CharacterSet.whitespaces)
//    passwordTF.text = passwordTF.text!.trimmingCharacters(in: CharacterSet.whitespaces)
//    
//    var errorMessage:NSString?
//    
//    
//    
//    if email.isEmpty && password.isEmpty{
//        
//        Utilities.sharedInstance.alertWithOkButtonAction(vc: self, alertTitle: "Message", messege: "Please Enter Requiredfields", clickAction: {
//            
//            
//        })
//        
//    }
//        
//        
//    else if (email.isEmpty) {
//        
//        Utilities.sharedInstance.alertWithOkButtonAction(vc: self, alertTitle: "Message", messege: "Please Enter your Mobilenumber or Email", clickAction: {
//            
//            
//        })
//        
//    }
//    else if (password.isEmpty) {
//        
//        Utilities.sharedInstance.alertWithOkButtonAction(vc: self, alertTitle: "Message", messege: "Please Enter Your Password", clickAction: {
//            
//            
//        })
//        
//    }
//        
//    else if (  email.characters.count <= 9){
//        
//        Utilities.sharedInstance.alertWithOkButtonAction(vc: self, alertTitle: "Warning", messege: "Invalid EmailID or MobileNumber", clickAction: {
//            
//        })
//        
//    }
//        
//        
//    else if(!GlobalSupportingClass.capitalOnly(password: passwordTF.text! as String)) {
//        
//        errorMessage=GlobalSupportingClass.capitalLetterMessage() as String as String as NSString?
//    }
//    else if(!GlobalSupportingClass.numberOnly(password: passwordTF.text! as String)) {
//        
//        errorMessage=GlobalSupportingClass.numberMessage() as String as String as NSString?
//    }
//    else if(!GlobalSupportingClass.specialCharOnly(password: passwordTF.text! as String)) {
//        
//        errorMessage=GlobalSupportingClass.specialCharacterMessage() as String as String as NSString?
//    }
//    
//    if let errorMsg = errorMessage{
//        
//        Utilities.sharedInstance.alertWithOkButtonAction(vc: self, alertTitle: "Alert", messege: errorMsg as String, clickAction: {
//        })
//        
//    }
//    else {
//        
//        
//        print("Bulide Sucesss")
//        
//        
//        //            let rootController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SWRevealViewController") as! SWRevealViewController
//        //                appDelegate.window?.rootViewController = rootController
//        
//        //            Utilities.sharedInstance.alertWithOkButtonAction(vc: self, alertTitle: "Warning", messege: "Please Check Your Internetconnection!", clickAction: {
//        //
//        //
//        //            })
//        
//    }
//    
//    
//    print("Send Sucesss")
//    
//    
//    //            let rootController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SWRevealViewController") as! SWRevealViewController
//    //                appDelegate.window?.rootViewController = rootController
//    
//    //        let rootController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SWRevealViewController") as! SWRevealViewController
//    //
//    //
//    //         appDelegate.window?.rootViewController = rootController
//    //
//    
//    //       let rootController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SWRevealViewController") as! SWRevealViewController
//    //
//    //         appDelegate.window?.rootViewController = rootController
//    //
//    
//    
//    return true
//}

