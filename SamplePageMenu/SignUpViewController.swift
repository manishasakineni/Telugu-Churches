//
//  SignUpViewController.swift
//  Telugu Churches
//
//  Created by N@n!'$ Mac on 24/01/18.
//  Copyright © 2018 Mac OS. All rights reserved.
//

import UIKit
import TextFieldEffects

class SignUpViewController: BaseViewController,UITableViewDelegate,UITableViewDataSource,UITextFieldDelegate {
    
    
    @IBOutlet weak var signUpTableView: UITableView!
    
    
    let utillites =  Utilities()
    
    
    
    var appVersion          : String = ""

    var toolBar = UIToolbar()
    var activeTextField = UITextField()
    
    
//    var userName    : String = ""
//    var emailID    : String = ""
//    var mobileNumber    : String = ""
//    var passWord    : String = ""
//    var confirmpassWord    : String = ""
//    var firstNameEmpty:String = ""
//    var middleNameEmpty:String = ""
//    var lastnameEmpty    : String = ""
//    var userNameEmpty : String = ""
//    var emailIDEmpty  : String = ""
//    var mobileNumberEmpty : String = ""
//    var passWordEmpty     : String = ""
//    var confirmpassWordEmpty  : String = ""
//    
    
    
    
    
    
    
    var id:Int = 0
    var userId:String = ""

    var firstName:String = ""
   // var lastname    : String = ""
    var middleName:String = ""
    var lastName:String = ""
    var contactNumber:String = "2457561545"
    var mobileNumber  : String = ""
    var userName     : String = ""
    var password       : String = ""
    var confirmpassword       : String = ""
    var roleId   : Int = 1
    var email:String = ""
    var isActive:Bool = true
    var createdByUserId:Int = 1
    var createdDate : String = "2018-01-31T10:43:28.8319786+05:30"
    var updatedByUserId : Int = 1
   // var updatedByUserId : Int = 0
    var updatedDate:String =  "2018-01-31T10:43:28.8329795+05:30"
    
    var sectionsTitle : [String] = [" "]
     var signUpTFPlaceholdersArray = ["FirstNam","MiddleName","LastName","User Name","E-Mail","Mobile Number","Password","Confirm Password"]

    override func viewDidLoad() {
        super.viewDidLoad()

        signUpTableView.delegate = self
        signUpTableView.dataSource = self
        activeTextField.delegate = self
        registerTableViewCells()
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    private func registerTableViewCells() {

        
        let nibName1  = UINib(nibName: "SignUPTableViewCell" , bundle: nil)
        signUpTableView.register(nibName1, forCellReuseIdentifier: "SignUPTableViewCell")
        
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        
        super.viewWillAppear(animated)
        
        Utilities.setSignUpViewControllerNavBarColorInCntrWithColor(backImage: "icons8-arrows_long_left", cntr:self, titleView: nil, withText: "Registration", backTitle: " Registration", rightImage: appVersion, secondRightImage: "Up", thirdRightImage: "Up")
        
        //navigationItem.leftBarButtonItems = []
        
    }
    
    //MARK:- textFieldShouldEndEditing
    
    
    
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        
        
        activeTextField = textField
        
        //        if  TVC1.firstNameTF.text != nil{
        //
        //            TVC1.FNLbl.isHidden = false
        //        }
        
        
//        if let newRegCell : SignUPTableViewCell = textField.superview?.superview as? SignUPTableViewCell {
//            
//            if textField == newRegCell.registrationTextfield {
//                
//                
//                if (newRegCell.registrationTextfield.text != nil)  {
//                    
//                    newRegCell.registrationTextfield.isHidden = false
//                    newRegCell.registrationTextfield.textColor = UIColor(red: 128.0/255.0, green: 0.0/255.0, blue: 0.0/255.0, alpha: 1.0)
//                    
//                }
//                    
//                else{
//                    
//                    newRegCell.registrationTextfield.isHidden = true
//                    
//                    
//                }
//            }
//        }
        if activeTextField.tag == 0 {
            
            textField.maxLengthTextField = 50
            textField.clearButtonMode = .never
            textField.keyboardType = .alphabet
        }
        else if activeTextField.tag == 1 {
            
            textField.maxLengthTextField = 50
            textField.clearButtonMode = .never
            textField.keyboardType = .default
        }
        else if activeTextField.tag == 2 {
            
            textField.maxLengthTextField = 50
            textField.clearButtonMode = .never
            textField.keyboardType = .default
        }
         else if activeTextField.tag == 3 {
            
            textField.maxLengthTextField = 50
            textField.clearButtonMode = .never
            textField.keyboardType = .default
        }
            
        else if activeTextField.tag == 4{
            
            textField.maxLengthTextField = 50
            textField.clearButtonMode = .never
            textField.keyboardType = .emailAddress
            
        }
            
        else if activeTextField.tag == 5{
            
         //   textField.clearButtonMode = .never
            textField.maxLengthTextField = 10
            textField.keyboardType = .phonePad
            
        }
        else if activeTextField.tag == 6{
            
            textField.maxLengthTextField = 50
            textField.clearButtonMode = .never
            textField.keyboardType = .default
            
        }
        else if activeTextField.tag == 7{
            
            textField.maxLengthTextField = 50
            textField.clearButtonMode = .never
            textField.keyboardType = .default
            
        }
       
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        
        if !string.canBeConverted(to: String.Encoding.ascii){
            return false
        }
            
        activeTextField = textField
        if activeTextField.tag == 0 || activeTextField.tag == 1 || activeTextField.tag == 2{
            
            
            if string.characters.count > 0 {
                
                let currentCharacterCount = textField.text?.characters.count ?? 0
                if (range.length + range.location > currentCharacterCount){
                    return false
                }
                let newLength = currentCharacterCount + string.characters.count - range.length
                
                let allowedCharacters = CharacterSet.letters
                let unwantedStr = string.trimmingCharacters(in: allowedCharacters)
                return newLength <= 50 && unwantedStr.characters.count == 0
            }
            
        }
        return true
    }
    
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        
        
        
        
        if let newRegCell : SignUPTableViewCell = textField.superview?.superview as? SignUPTableViewCell {
            
            

        }
        return true
    }
    
 
    
    
    //MARK:- textFieldDidEndEditing
    
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        
        activeTextField = textField

        
        if activeTextField.tag == 0{
            
            //  activeTextField.textColor = UIColor.red
            firstName = textField.text!
            
        }
       else if activeTextField.tag == 1{
            
            //  activeTextField.textColor = UIColor.red
            middleName = textField.text!
            
        }
       else if activeTextField.tag == 2{
            
            //  activeTextField.textColor = UIColor.red
            lastName = textField.text!
            
        }
       else if activeTextField.tag == 3{
            
          //  activeTextField.textColor = UIColor.red
                userName = textField.text!
                
            }
                
            else if activeTextField.tag == 4 {
                
                email = textField.text!
                
            }
                
            else if activeTextField.tag == 5{
                
                mobileNumber = textField.text!
                
            }
            else if activeTextField.tag == 6{
                
                password = textField.text!
                
                
            }
                
            else if activeTextField.tag == 7{
                
                
                confirmpassword = textField.text!
                
            
            }
                
   //     }
        
    }
  
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
 
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        
        
        return signUpTFPlaceholdersArray.count
    }
    
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat{
        
        return UITableViewAutomaticDimension
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return UITableViewAutomaticDimension
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        
        let signUPCell = tableView.dequeueReusableCell(withIdentifier: "SignUPTableViewCell", for: indexPath) as! SignUPTableViewCell
        

        signUPCell.registrationTextfield.delegate = self
        
        signUPCell.registrationTextfield.tag = indexPath.row

        if indexPath.row == 0{
            
            //   signUPCell.registrationTextfield.keyboardType = .namePhonePad
            // signUPCell.registrationTextfield?.text = "app.UserName".localize()
            signUPCell.registrationTextfield.placeholder = "FirstName"
            signUPCell.registrationTextfield.text = firstName
            
            
        }
        else if indexPath.row == 1{
            
            //   signUPCell.registrationTextfield.keyboardType = .namePhonePad
            // signUPCell.registrationTextfield?.text = "app.UserName".localize()
            signUPCell.registrationTextfield.placeholder = "MiddleName"
            signUPCell.registrationTextfield.text = middleName
            
            
        }
        else if indexPath.row == 2{
            
            //   signUPCell.registrationTextfield.keyboardType = .namePhonePad
            // signUPCell.registrationTextfield?.text = "app.UserName".localize()
            signUPCell.registrationTextfield.placeholder = "LastNane"
            signUPCell.registrationTextfield.text = lastName
            
            
        }
        
       else if indexPath.row == 3{
            
         //   signUPCell.registrationTextfield.keyboardType = .namePhonePad
           // signUPCell.registrationTextfield?.text = "app.UserName".localize()
            signUPCell.registrationTextfield.placeholder = "UserName"
            signUPCell.registrationTextfield.text = userName

            
        }
            
        else if indexPath.row == 4{
            
            signUPCell.registrationTextfield.text = email
          //  signUPCell.registrationTextfield.keyboardType = .emailAddress

           // signUPCell.registrationTextfield?.text = "app.Address1".localize()
            signUPCell.registrationTextfield.placeholder = "E-Mail"
            
            
        }
        else if indexPath.row == 5{
            
            signUPCell.registrationTextfield.text = mobileNumber
          //  signUPCell.registrationTextfield.keyboardType = .numberPad

           // signUPCell.registrationTextfield?.text = "app.Address2".localize()
            signUPCell.registrationTextfield.placeholder = "Mobile Number"
            
            
            
        }
        else if indexPath.row == 6{
            
            signUPCell.registrationTextfield.text = password
          //  signUPCell.registrationTextfield.keyboardType = .emailAddress
           // signUPCell.registrationTextfield?.text = "app.Landmark".localize()
            signUPCell.registrationTextfield.placeholder = "Password"
            
        }
      
        else if indexPath.row == 7{
            
            signUPCell.registrationTextfield.text = confirmpassword
           // signUPCell.registrationTextfield.keyboardType = .emailAddress
            // signUPCell.registrationTextfield?.text = "app.Landmark".localize()
            signUPCell.registrationTextfield.placeholder = "Confirm Password"
            
            
            
        }

        return signUPCell
    }
    


    
    @IBAction func backLeftButtonTapped(_ sender:UIButton) {
        
        //   navigationItem.leftBarButtonItems = []
        let loginViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
        
        
        UserDefaults.standard.set("1", forKey: "1")
        UserDefaults.standard.synchronize()
        
        self.navigationController?.pushViewController(loginViewController, animated: true)
        
        
        print("Back Button Clicked......")
        
    }

    @IBAction func submitButtonClicked(_ sender: Any) {
        
        if(appDelegate.checkInternetConnectivity()){
            
            if self.validateAllFields()
            {
                
                
                       signeUpAPIService()
            }
        }
        else {
            
            self.appDelegate.window?.makeToast(kNetworkStatusMessage, duration:kToastDuration, position:CSToastPositionCenter)
            return
            
        }
        
        
        print("Submit Button Clicked......")

    
    }

    //MARK:- validateAllFields
    
    func validateAllFields() -> Bool
    {
        
        var errorMessage:NSString?
        let firstNameStr:NSString = firstName as NSString
        let middleNameStr:NSString = middleName as NSString
        let lastnameStr:NSString =  lastName  as NSString
        
        let userNameStr:NSString = userName as NSString
        let emailIDStr:NSString = email as NSString
        let mobileNumberStr:NSString =  mobileNumber  as NSString
        let passWord:NSString = password   as NSString
        let confirmPassWord:NSString =  confirmpassword  as NSString
        
        if (firstNameStr.length <= 0){
            errorMessage=GlobalSupportingClass.blankFirstNameErrorMessage() as String as String as NSString?
            
        }
//        else if (middleNameStr.length <= 0){
//            errorMessage=GlobalSupportingClass.blankMiddleNameErrorMessage() as String as String as NSString?
//            
//        }
        else if (lastnameStr.length <= 0){
            errorMessage=GlobalSupportingClass.blankLastNameErrorMessage() as String as String as NSString?
            
        }
        
        else if (userNameStr.length <= 0){
            errorMessage=GlobalSupportingClass.blankUserNameErrorMessage() as String as String as NSString?
            
        }
            
        else if (emailIDStr.length<=0) {
            errorMessage=GlobalSupportingClass.blankEmailIDErrorMessage() as String as String as NSString?
        }
            
        else  if (emailIDStr.length < 5) {
            errorMessage=GlobalSupportingClass.miniCharEmailIDErrorMessage() as String as String as NSString?
        }
        else  if(!GlobalSupportingClass.isValidEmail(emailIDStr as NSString))
        {
            errorMessage=GlobalSupportingClass.invalidEmaildIDFormatErrorMessage() as String as String as NSString?
        }
        else if (mobileNumberStr.length <= 0){
            
            errorMessage=GlobalSupportingClass.blankMobilenumberErrorMessage() as String as String as NSString?
            
        }
        else if (mobileNumberStr.length <= 9) {
            
            errorMessage=GlobalSupportingClass.invalidMobilenumberErrorMessage() as String as String as NSString?
        }
            
            
//        else if (mobileNumberStr.length > 9) {
//            
//            
//            errorMessage=GlobalSupportingClass.invalidPhoneNumberErrorMessage() as String as String as NSString?
//        }
            
        else if (passWord.length<=0) {
            errorMessage=GlobalSupportingClass.blankPasswordErrorMessage() as String as String as NSString?
        }
        else if(!GlobalSupportingClass.capitalOnly(password: passWord as String)) {
            
            errorMessage=GlobalSupportingClass.capitalLetterMessage() as String as String as NSString?
        }
        else if(!GlobalSupportingClass.numberOnly(password: passWord as String)) {
            
            errorMessage=GlobalSupportingClass.numberMessage() as String as String as NSString?
        }
        else if(!GlobalSupportingClass.specialCharOnly(password: passWord as String)) {
            
            errorMessage=GlobalSupportingClass.specialCharacterMessage() as String as String as NSString?
        }
       else if (passWord.length < 8) {
            
            errorMessage=GlobalSupportingClass.invalidPassWordErrorMessage() as String as String as NSString?
        }
            
        else if(confirmPassWord.length<8){
            errorMessage=GlobalSupportingClass.blankConfirmPasswordErrorMessage() as String as String as NSString?
        }
            
        else if(passWord.length<5||confirmPassWord.length<5)
        {
            errorMessage = GlobalSupportingClass.invalidDigitsInPasswordErrorMessage() as String as String as NSString?
        }
        else if(!passWord.isEqual(to: confirmPassWord as String)){
            errorMessage=GlobalSupportingClass.passwordMissMatchErrorMessage() as String as String as NSString?
        }

                if let errorMsg = errorMessage{
        
                    self.showAlertViewWithTitle("Alert", message: errorMsg as String, buttonTitle: "Retry")
                    return false;
                }
        return true
    }

// MARK :- SigneUpAPIService
    
    func signeUpAPIService(){

        let  strUrl = SIGNEUPURL

        let dictParams = [
            "Id": id,
            "UserId": userId,
            "FirstName": firstName,
            "MiddleName": middleName,
            "LastName": lastName,
            "ContactNumber": contactNumber,
            "MobileNumber":mobileNumber,
            "UserName": userName,
            "Password": password,
            "RoleId": roleId,
            "Email": email,
            "IsActive": isActive,
            "CreatedByUserId": createdByUserId,
            "CreatedDate": createdDate,
            "UpdatedByUserId": updatedByUserId,
            "UpdatedDate": updatedDate
        ] as [String : Any]
        
        print("dic params \(dictParams)")
        let dictHeaders = ["":"","":""] as NSDictionary

        print("dictHeader:\(dictHeaders)")

        
        
        serviceController.signUpRequestPOSTURL(strURL: strUrl as NSString, postParams: dictParams as NSDictionary, postHeaders: dictHeaders, successHandler:{(result) in
            DispatchQueue.main.async()
                {
                    
                    print("result:\(result)")
                    
                    let respVO:RegisterResultVo = Mapper().map(JSONObject: result)!
                    
                    
                    print("responseString = \(respVO)")
                    
                    
                    let statusCode = respVO.isSuccess
                    
                    print("StatusCode:\(String(describing: statusCode))")
                    
                    
                    
                    if statusCode == true
                    {
                        
                        
                        let successMsg = respVO.endUserMessage
                        
                        
                     /*   let registerStatus = successMsg
                        let registerStatusDefaults = UserDefaults.standard
                        registerStatusDefaults.set(registerStatus, forKey: kRegisterSucessStatus)
                        UserDefaults.standard.synchronize() */
                        
                    
         
                        
                        self.utillites.alertWithOkButtonAction(vc: self, alertTitle: "Success", messege: successMsg!, clickAction: {
                                let signUpVc  : LoginViewController = self.storyboard?.instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
                        
                        
                            self.navigationController?.pushViewController(signUpVc, animated: true)
                        })
                        
                        //self.navigationController?.popViewController(animated: true)
                        
                    }
                    else {
                        
                        let failMsg = respVO.endUserMessage
                        
                        self.showAlertViewWithTitle("Alert", message: failMsg!, buttonTitle: "Ok")
                        
                        return
                        
                    }
                    
                    
            }
        }, failureHandler: {(error) in
            
//            if(error == "unAuthorized"){
//                serviceController.refreshTokenForLogin(successHandler:{(result) in
//                    DispatchQueue.main.async()
//                        {
//                            
//                            self.updateProfileAPIService()
//                            
//                    }
//                }, failureHandler:  {(error) in
//                    
//                    DispatchQueue.main.async()
//                        {
//                            
//                            let mainStoryboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
//                            
//                            let viewController = mainStoryboard.instantiateViewController(withIdentifier: "ViewController") as! ViewController
//                            let appDelegate = UIApplication.shared.delegate as! AppDelegate
//                            appDelegate.window?.rootViewController = viewController
//                            
//                    }
//                    
//                    
//                })
//            }
        })
        
        
    }
    
    @IBAction func loginClicked(_ sender: Any) {
        
        
        let loginViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
        
        
        UserDefaults.standard.set("1", forKey: "1")
        UserDefaults.standard.synchronize()
        
        self.navigationController?.pushViewController(loginViewController, animated: true)
        
        
        
    }
    
   
}

