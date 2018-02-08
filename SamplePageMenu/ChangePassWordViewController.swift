//
//  ForgotPassWordViewController.swift
//  Telugu Churches
//
//  Created by Mac OS on 30/01/18.
//  Copyright © 2018 Mac OS. All rights reserved.
//

import UIKit

class ChangePassWordViewController: UIViewController,UITableViewDelegate,UITableViewDataSource,UITextFieldDelegate {
    
    var appDelegate = AppDelegate()
    let sharedController = ServiceController()
    
     let utillites =  Utilities()
    
    
    @IBOutlet weak var backGroundView: UIView!
    
    @IBOutlet weak var forgotPasswordTableView: UITableView!
    
    var sectionsTitle : [String] = [" "]

    var activeTextField = UITextField()
    
    var userId:String = ""
    var oldPassWordString : String = ""
    var newPassWordString : String = ""
    var confirmPassWordString : String = ""
    

   // var passWordTypeString = ["Old PassWord","New PassWord","Confirm PassWord"]
  //  var passWordTypePlaceHolderString = ["Old PassWord","New PassWord","Confirm PassWord"]


    override func viewDidLoad() {
        super.viewDidLoad()

        let defaults = UserDefaults.standard
        
        if let uid = defaults.string(forKey: kuserId) {
            
            userId = uid
            
            print("defaults savedString: \(userId)")
            
        }
        
        backGroundView.layer.cornerRadius = 3.0
        backGroundView.layer.shadowColor = UIColor.lightGray.cgColor
        backGroundView.layer.shadowOffset = CGSize(width: 0, height: 3)
        backGroundView.layer.shadowOpacity = 0.6
        backGroundView.layer.shadowRadius = 2.0
        
        
        forgotPasswordTableView.delegate = self
        forgotPasswordTableView.dataSource = self
        activeTextField.delegate = self
        
        self.view.backgroundColor = UIColor.black.withAlphaComponent(0.4)

        
        let nibName1  = UINib(nibName: "ForgotPasswordCell" , bundle: nil)
        forgotPasswordTableView.register(nibName1, forCellReuseIdentifier: "ForgotPasswordCell")
        
        
        let nibName2  = UINib(nibName: "ConformButtonPassWordCell" , bundle: nil)
        forgotPasswordTableView.register(nibName2, forCellReuseIdentifier: "ConformButtonPassWordCell")
        
        
        
        
        
        // Do any additional setup after loading the view.
    }

    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        
        
        activeTextField = textField
        
        
        if activeTextField.tag == 0 {
            
            textField.maxLengthTextField = 50
            textField.clearButtonMode = .never
            textField.keyboardType = .default
           // oldPassWordString = textField.text!

        }
        else if activeTextField.tag == 1 {
            
            textField.maxLengthTextField = 50
            textField.clearButtonMode = .never
            textField.keyboardType = .default
           // newPassWordString = textField.text!

        }
        else if activeTextField.tag == 2 {
            
            textField.maxLengthTextField = 50
            textField.clearButtonMode = .never
            textField.keyboardType = .default
          //  confirmPassWordString = textField.text!

        }

        
        
    }
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        
        if let newRegCell : SignUPTableViewCell = textField.superview?.superview as? SignUPTableViewCell {
            
            
            //            if newRegCell.registrationTextfield.text == nil {
            //
            //                newRegCell.registrationTextfield.isHidden = true
            //                newRegCell.registrationTextfield.isHidden = false
            //
            //
            //            }
        }
        return true
    }

    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        
        if !string.canBeConverted(to: String.Encoding.ascii){
            return false
        }
        
        
        return true
    }
    
    
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        
        activeTextField = textField
        
        
        if activeTextField.tag == 0{
            
           // activeTextField.textColor = UIColor.red
            oldPassWordString = textField.text!
            
        }
        else if activeTextField.tag == 1{
            
            // activeTextField.textColor = UIColor.red
            newPassWordString = textField.text!
            
        }
        else if activeTextField.tag == 2{
            
            // activeTextField.textColor = UIColor.red
            confirmPassWordString = textField.text!
            
        }
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        
        if section == 0 {
            
            return 3
        }
        
        return 1
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        if section == 0 {
            return sectionsTitle[section]

            
        }
        return nil
    }
    
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if (section == 0){
            // UIView Creation...........
            let headerView = UIView(frame: CGRect(x:0, y:0, width:tableView.frame.size.width, height:100))
            headerView.backgroundColor =  UIColor(red: 122.0/255.0, green: 186.0/255.0, blue: 217.0/255.0, alpha: 1.0)
            // UILabel Creation...........
            
            
            let section1HeaderLabel2 = UILabel(frame: CGRect(x: 90, y: -3, width:150, height: 35))
            // section1HeaderLabel.text = sectionsTitle[section]
            section1HeaderLabel2.textColor = UIColor.white
            section1HeaderLabel2.text = "Change Password"
            section1HeaderLabel2.textAlignment = .center
            // section1HeaderLabel2.backgroundColor = UIColor.purple
            section1HeaderLabel2.font = UIFont(name: "HelveticaNeue-Bold", size: 13.0)!
            headerView.addSubview(section1HeaderLabel2)
            //  headerView.addSubview(section1HeaderLabel3)
            
            return headerView
        }
        return nil
    }
    
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
        if section == 0 {
            
            return 40
        }
        return 0
        
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat{
        
        return UITableViewAutomaticDimension
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return UITableViewAutomaticDimension
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        
        
        
        
        if indexPath.section == 0 {
          
            let forgotPasswordCell = tableView.dequeueReusableCell(withIdentifier: "ForgotPasswordCell", for: indexPath) as! ForgotPasswordCell
            
            forgotPasswordCell.resetPasswordTF.delegate = self
            forgotPasswordCell.resetPasswordTF.tag = indexPath.row
            if indexPath.row == 0 {
               
                forgotPasswordCell.resetPasswordTF.placeholder = "Old PassWord"
                forgotPasswordCell.resetPasswordTF.text = oldPassWordString
                
                return forgotPasswordCell
            }
            else if indexPath.row == 1 {
                
               
                forgotPasswordCell.resetPasswordTF.placeholder = "New PassWord"
                forgotPasswordCell.resetPasswordTF.text = newPassWordString
                
                
                return forgotPasswordCell
            }
            else if indexPath.row == 2 {
      
                forgotPasswordCell.resetPasswordTF.placeholder = "Confirm PassWord"
                forgotPasswordCell.resetPasswordTF.text = confirmPassWordString
                
                
                return forgotPasswordCell
            }
            
          
        }
        
        let conformButtonPassWordCell = tableView.dequeueReusableCell(withIdentifier: "ConformButtonPassWordCell", for: indexPath) as! ConformButtonPassWordCell
        
      //  conformButtonPassWordCell.confirmBtn.addTarget(self, action: #selector(ForgotPassWordViewController.selectClicked), for: .touchUpInside)
        

           conformButtonPassWordCell.confirmBtn.addTarget(self, action: #selector(confirmButtonClicked(_:)), for: UIControlEvents.touchUpInside)

        
        conformButtonPassWordCell.cancelBtn.addTarget(self, action: #selector(cancelButtonClicked(_:)), for: UIControlEvents.touchUpInside)

        
        
        return conformButtonPassWordCell
    }
    
    

    
   func  confirmButtonClicked(_ sendre:UIButton) {

    
    
    if(appDelegate.checkInternetConnectivity()){
        
        if self.validateAllFields()
        {
            
            
            changePassWordAPIService()
        }
    }
    else {
        
        self.appDelegate.window?.makeToast(kNetworkStatusMessage, duration:kToastDuration, position:CSToastPositionCenter)
        return
        
    }
    
    
    print("Confirm Button Clicked......")
    
   
    }
    
    
    func validateAllFields() -> Bool
    {
        
        var errorMessage:NSString?
        let oldePassWordStr:NSString = oldPassWordString as NSString
        let newPassWordStr:NSString = newPassWordString as NSString
        let confirmPassWordStr : NSString = confirmPassWordString as NSString
        
        
        
      
        if (oldePassWordStr.length<=0) {
            errorMessage=GlobalSupportingClass.blankOldPasswordErrorMessage() as String as String as NSString?
        }
            
        else if (newPassWordStr.length<=0) {
            errorMessage=GlobalSupportingClass.blankPasswordErrorMessage() as String as String as NSString?
        }
        else if(!GlobalSupportingClass.capitalOnly(password: newPassWordStr as String)) {
            
            errorMessage=GlobalSupportingClass.capitalLetterMessage() as String as String as NSString?
        }
        else if(!GlobalSupportingClass.numberOnly(password: newPassWordStr as String)) {
            
            errorMessage=GlobalSupportingClass.numberMessage() as String as String as NSString?
        }
        else if(!GlobalSupportingClass.specialCharOnly(password: newPassWordStr as String)) {
            
            errorMessage=GlobalSupportingClass.specialCharacterMessage() as String as String as NSString?
        }
        else if (newPassWordStr.length < 8) {
            
            errorMessage=GlobalSupportingClass.invalidPassWordErrorMessage() as String as String as NSString?
        }
            
        else if(confirmPassWordStr.length<8){
            errorMessage=GlobalSupportingClass.blankConfirmPasswordErrorMessage() as String as String as NSString?
        }
            
        else if(newPassWordStr.length<5||confirmPassWordStr.length<5)
        {
            errorMessage = GlobalSupportingClass.invalidDigitsInPasswordErrorMessage() as String as String as NSString?
        }
        else if(!newPassWordStr.isEqual(to: confirmPassWordStr as String)){
            errorMessage=GlobalSupportingClass.passwordMissMatchErrorMessage() as String as String as NSString?
        }
        
        if let errorMsg = errorMessage{
            
            self.showAlertViewWithTitle("Alert", message: errorMsg as String, buttonTitle: "Retry")
            return false;
        }
            
            
    /*    else if (newPassWordStr.length<=0) {
            errorMessage=GlobalSupportingClass.blankPasswordErrorMessage() as String as String as NSString?
        }
        else if(!GlobalSupportingClass.capitalOnly(password: newPassWordStr as String)) {
            
            errorMessage=GlobalSupportingClass.capitalLetterMessage() as String as String as NSString?
        }
        else if(!GlobalSupportingClass.numberOnly(password: newPassWordStr as String)) {
            
            errorMessage=GlobalSupportingClass.numberMessage() as String as String as NSString?
        }
        else if(!GlobalSupportingClass.specialCharOnly(password: newPassWordStr as String)) {
            
            errorMessage=GlobalSupportingClass.specialCharacterMessage() as String as String as NSString?
        }
        else if (newPassWordStr.length <= 14) {
            
            errorMessage=GlobalSupportingClass.invalidPassWordErrorMessage() as String as String as NSString?
        }
            
        else if(confirmPassWordStr.length<=0){
            errorMessage=GlobalSupportingClass.blankConfirmPasswordErrorMessage() as String as String as NSString?
        }
            
        else if(newPassWordStr.length<5||confirmPassWordStr.length<5)
        {
            errorMessage = GlobalSupportingClass.invalidDigitsInPasswordErrorMessage() as String as String as NSString?
        }
        else if(!newPassWordStr.isEqual(to: confirmPassWordStr as String)){
            errorMessage=GlobalSupportingClass.passwordMissMatchErrorMessage() as String as String as NSString?
        }
        if let errorMsg = errorMessage{
            
            self.showAlertViewWithTitle("Alert", message: errorMsg as String, buttonTitle: "Retry")
            return false;
        } */
        
        return true
    }
    
    // MARK :- SigneUpAPIService
    
    func changePassWordAPIService(){
        
        let  strUrl = CHANGEPASSWORDURL
        
        
        let dictParams = [
            "UserId": userId,
            "OldPassword": oldPassWordString,
            "NewPassword": newPassWordString,
            "ConfirmPassword": confirmPassWordString
            ] as [String : Any]
        
        print("dic params \(dictParams)")
        let dictHeaders = ["":"","":""] as NSDictionary
        
        print("dictHeader:\(dictHeaders)")

        
      
 
        
        
        serviceController.signUpRequestPOSTURL(strURL: strUrl as NSString, postParams: dictParams as NSDictionary, postHeaders: dictHeaders, successHandler:{(result) in
            DispatchQueue.main.async()
                {
                    
                    print("\(result)")
                    
                   let respVO:PSWMessageTypeResult = Mapper().map(JSONObject: result)!
                    let statusMessage = respVO.modelState?.errorMessage
                    print(statusMessage!)
                    if  statusMessage! == ["Incorrect password."] {
                        
                        print(statusMessage!)
                        self.showAlertViewWithTitle("Alert", message: "\(statusMessage!)", buttonTitle: "Ok")
 


                    }else{
                        
                        print("sucess")

                        
                    }
                    
                     
                     
                    
               /*     print("responseString = \(respVO)")
                    
                    
                    let statusCode = respVO.message
                    
                    print("StatusCode:\(String(describing: statusCode))")
                    
                    
                    
                    if statusCode == true
                    {
                        
 Old PassWord Given wrong => Failed
 statusCode:400
 ["modelState": {
 errorMessage =     (
 "Incorrect password."
 );
 }, "message": The request is invalid.]
                     
                     
                     
                Old PassWord Change Given wrong => Sucess Full
                     statusCode:200
                     ["errors": <__NSArrayM 0x608000640de0>(
                     
                     )
                     , "succeeded": 1]
                     
 
                        //   self.showAlertViewWithTitle("Success", message: successMsg!, buttonTitle: "Ok")
                        
                        
                        
                        //                        self.utillites.alertWithOkAndCancelButtonAction(vc: self, alertTitle: "Sucess", messege: successMsg!, clickAction: {
                        //
                        //                            let signUpVc  : LoginViewController = self.storyboard?.instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
                        //
                        //                            self.navigationController?.pushViewController(signUpVc, animated: true)
                        //
                        //                        })
                        
                        // alertWithOkButtonAction
                        
                        self.utillites.alertWithOkButtonAction(vc: self, alertTitle: "Success", messege: successMsg!, clickAction: {
                            let signUpVc  : LoginViewController = self.storyboard?.instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
                            
                            self.navigationController?.pushViewController(signUpVc, animated: true)
                        })
                        
                        //self.navigationController?.popViewController(animated: true)
                        
                    }
                    else {
                        
                        let failMsg = respVO.
                        print(failMsg)
                        
                        self.showAlertViewWithTitle("Alert", message: failMsg!, buttonTitle: "Ok")
                        
                        return
                        
                    } */
                    
                    
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
    
    
    
    func  cancelButtonClicked(_ sendre:UIButton) {
     
      
        removeAnimate()


        
    }
    
    
    
    
    
    func showAlertViewWithTitle(_ title:String,message:String,buttonTitle:String)
    {
        let alertView:UIAlertView = UIAlertView();
        alertView.title=title
        alertView.message=message
        alertView.addButton(withTitle: buttonTitle)
        alertView.show()
    }
    
    func removeAnimate()
    {
        UIView.animate(withDuration: 0.25, animations: {
            self.view.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
            self.view.alpha = 0.0;
        }, completion:{(finished : Bool)  in
            if (finished)
            {
                self.view.removeFromSuperview()
            }
        });
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
