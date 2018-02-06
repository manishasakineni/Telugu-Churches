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
    
    var appVersion          : String = ""

    
    @IBOutlet weak var mobileEmailTF: AkiraTextField!
    
    @IBOutlet weak var passwordTF: AkiraTextField!

    @IBOutlet weak var remembermeBtn: UIButton!
    
    @IBOutlet weak var eyeBtnOutlet: UIButton!
    @IBOutlet weak var loginBtnOutLet: UIButton!
    
    
    var email : String? = ""
    var password : String? = ""
    
    var showNav = false

    let utillites =  Utilities()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        

      /*  let defaults = UserDefaults.standard
        
        if let gst : String = defaults.value(forKey: "1") as? String {
        
        if gst == "1" {}
        
        else {
        
        if let registerSucess = defaults.string(forKey: kRegisterSucessStatus) {
            print(registerSucess)
            self.appDelegate.window?.makeToast(registerSucess, duration:kToastDuration, position:CSToastPositionCenter)
            
            print("defaults savedString: \(registerSucess)")
            
        }
            }
        } */
        loginBtnOutLet.layer.borderWidth = 1.0
        loginBtnOutLet.layer.cornerRadius = 6.0
        loginBtnOutLet.layer.borderColor = UIColor(red: 122.0/255.0, green: 186.0/255.0, blue: 208.0/255.0, alpha: 1.0).cgColor
        
        
        mobileEmailTF.delegate = self
        passwordTF.delegate = self
        mobileEmailTF.maxLengthTextField = 10
        mobileEmailTF.keyboardType = .default
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
        
        
        
        print(showNav)
        
        
        
        self.navigationController?.navigationBar.isHidden = !showNav
           Utilities.setLoginViewControllerNavBarColorInCntrWithColor(backImage: "icons8-arrows_long_left", cntr:self, titleView: nil, withText: "", backTitle: " ", rightImage: appVersion, secondRightImage: "Up", thirdRightImage: "Up")
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
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        
        if !string.canBeConverted(to: String.Encoding.ascii){
            return false
        }
        
        
        return true
    }
    
    
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        
        if textField == mobileEmailTF{
            email = mobileEmailTF.text!
            
        }
            
        else if textField == passwordTF{
            
            password = passwordTF.text!
            
        }
        
    }
    
    
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
        
        
      //  let rootController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SWRevealViewController") as! SWRevealViewController
        
     //   appDelegate.window?.rootViewController = rootController
        
        if(appDelegate.checkInternetConnectivity()){

            if self.validateAllFields(){
            
            
              loginAPIService()
            }
            
        }else{
            appDelegate.window?.makeToast(kNetworkStatusMessage, duration:kToastDuration, position:CSToastPositionCenter)
            return
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
            
        }
        
     return true
    }
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        //        self.view.endEditing(true)
        return true
    }
    func loginAPIService(){
        
        if(appDelegate.checkInternetConnectivity()){
            
            if !(email!.isEmpty && password!.isEmpty) {
                
                let strUrl = LOGINURL + "" + email! + "/" + password!
                
                
                serviceController.requestGETURL(strURL:strUrl, success:{(result) in
                    DispatchQueue.main.async()
                        {
                            
                          //  let respVO:LoginVo = Mapper().map(JSONObject: result)!
                            
                            print("result:\(result)")
                            
                            let respVO:LoginVo = Mapper().map(JSONObject: result)!
                            
                           print("responseString = \(respVO)")
                            
                            
                            let statusCode = respVO.isSuccess
                            
                            print("StatusCode:\(String(describing: statusCode))")
                            
                            
                            
                            if statusCode == true
                            {
                                
                                
                                let successMsg = respVO.endUserMessage
                                print(successMsg)
                                
                                let userid = respVO.listResult?[0].userId
                                let defaults = UserDefaults.standard
                                defaults.set(userid, forKey: kuserId)
                                UserDefaults.standard.synchronize()
                                
                                let loginStatus = successMsg
                                let loginStatusDefaults = UserDefaults.standard
                                loginStatusDefaults.set(loginStatus, forKey: kLoginSucessStatus)
                                UserDefaults.standard.synchronize()
                                
                                defaults.set("true", forKey: KFirstTimeLogin)
                                UserDefaults.standard.synchronize()
                              
                                self.appDelegate.window?.makeToast(successMsg!, duration:kToastDuration, position:CSToastPositionCenter)
                                let rootController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SWRevealViewController") as! SWRevealViewController
                                self.appDelegate.window?.rootViewController = rootController
                            }
                            else {
                                
                                let failMsg = respVO.endUserMessage
                                
                                self.showAlertViewWithTitle("Alert", message: failMsg!, buttonTitle: "Ok")
                                
                                return
                                
                            }
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
        
        
        let reOrderPopOverVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ChangePassWordViewController") as! ChangePassWordViewController
       // reOrderPopOverVC.delegate = self
        
            //    reOrderPopOverVC. singleSelection =
            //   var imagesArray : Array<UIImage> = Array()
        
        
                self.addChildViewController(reOrderPopOverVC)
                
                reOrderPopOverVC.view.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height)
                self.view.addSubview(reOrderPopOverVC.view)
                reOrderPopOverVC.didMove(toParentViewController: self)
        
        
        
        
    }

    
    
    @IBAction func registerClicked(_ sender: Any) {
        
        let signUpViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SignUpViewController") as! SignUpViewController
        
        self.navigationController?.pushViewController(signUpViewController, animated: true)
        
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
    
    
    
    
    
    @IBAction func backLeftButtonTapped(_ sender:UIButton) {
        
        //   navigationItem.leftBarButtonItems = []
        let rootController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SWRevealViewController") as! SWRevealViewController
        
        appDelegate.window?.rootViewController = rootController
        
        
        print("Back Button Clicked......")
        
    }
    
     func showAlertViewWithTitle(_ title:String,message:String,buttonTitle:String)
    {
        let alertView:UIAlertView = UIAlertView();
        alertView.title=title
        alertView.message=message
        alertView.addButton(withTitle: buttonTitle)
        alertView.show()
    }
    
    
}

