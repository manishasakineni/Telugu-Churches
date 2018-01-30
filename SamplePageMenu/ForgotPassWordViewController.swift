//
//  ForgotPassWordViewController.swift
//  Telugu Churches
//
//  Created by Mac OS on 30/01/18.
//  Copyright © 2018 Mac OS. All rights reserved.
//

import UIKit

class ForgotPassWordViewController: UIViewController,UITableViewDelegate,UITableViewDataSource,UITextFieldDelegate {
    
    
    
    
    @IBOutlet weak var forgotPasswordTableView: UITableView!
    
    var sectionsTitle : [String] = [" "]

    var activeTextField = UITextField()
    var passWordString : String = ""


    override func viewDidLoad() {
        super.viewDidLoad()

        
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
            
            textField.maxLengthTextField = 15
            textField.clearButtonMode = .never
            textField.keyboardType = .default
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

    
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        
        activeTextField = textField
        
        
        //        if let newRegCell : SignUPTableViewCell = textField.superview?.superview as? SignUPTableViewCell {
        
        
        //            if (newRegCell.registrationTextfield.text != nil)  {
        //
        //                newRegCell.registrationTextfield.isHidden = false
        //
        //                newRegCell.registrationTextfield.textColor = UIColor.lightGray
        //            }
        
        //            else{
        //
        //             //   newRegCell.addNewAddressLabel.isHidden = false
        //
        //            }
        
        if activeTextField.tag == 0{
            
           // activeTextField.textColor = UIColor.red
            passWordString = textField.text!
            
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        
        
        return 2
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        return sectionsTitle[section]
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
            section1HeaderLabel2.text = "Create New Password"
            section1HeaderLabel2.textAlignment = .center
            // section1HeaderLabel2.backgroundColor = UIColor.purple
            section1HeaderLabel2.font = UIFont(name: "HelveticaNeue-Bold", size: 13.0)!
            
            //            let section1HeaderLabel3 = UILabel(frame: CGRect(x: 180, y: 1, width:80, height: 27))
            //            // section1HeaderLabel.text = sectionsTitle[section]
            //            section1HeaderLabel3.textColor = UIColor.black
            //            section1HeaderLabel3.text = "Ship Date"
            //            section1HeaderLabel3.textAlignment = .center
            //           // section1HeaderLabel3.backgroundColor = UIColor.purple
            //            section1HeaderLabel3.font = UIFont(name: "HelveticaNeue-Bold", size: 15.0)!
            //
            
            
            headerView.addSubview(section1HeaderLabel2)
            //  headerView.addSubview(section1HeaderLabel3)
            
            return headerView
        }
        return nil
    }
    
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
        return 40
        
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat{
        
        return UITableViewAutomaticDimension
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return UITableViewAutomaticDimension
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        
        
        
        
        if indexPath.row == 0 {
          
            let forgotPasswordCell = tableView.dequeueReusableCell(withIdentifier: "ForgotPasswordCell", for: indexPath) as! ForgotPasswordCell
            
            forgotPasswordCell.resetPasswordTF.delegate = self
            //
            forgotPasswordCell.resetPasswordTF.tag = indexPath.row

              //  forgotPasswordCell.resetPasswordTF.placeholder = "User Name"
                forgotPasswordCell.resetPasswordTF.text = passWordString
                
                
            return forgotPasswordCell
        }
        
        let conformButtonPassWordCell = tableView.dequeueReusableCell(withIdentifier: "ConformButtonPassWordCell", for: indexPath) as! ConformButtonPassWordCell
        
      //  conformButtonPassWordCell.confirmBtn.addTarget(self, action: #selector(ForgotPassWordViewController.selectClicked), for: .touchUpInside)
        

           conformButtonPassWordCell.confirmBtn.addTarget(self, action: #selector(confirmButtonClicked(_:)), for: UIControlEvents.touchUpInside)

        
        conformButtonPassWordCell.cancelBtn.addTarget(self, action: #selector(cancelButtonClicked(_:)), for: UIControlEvents.touchUpInside)

        
        
        return conformButtonPassWordCell
    }
    
    
    func validateAllFields() -> Bool
    {
        
        var errorMessage:NSString?
//        print("userNameEmpty",userNameEmpty)
//        let userNameStr:NSString = userNameEmpty as NSString
//        print("userNameStr",userNameStr)
//        let emailIDStr:NSString = emailIDEmpty as NSString
//        let mobileNumberStr:NSString =  mobileNumberEmpty  as NSString
        let resetPassWord:NSString = passWordString   as NSString
      //  let confirmPassWord:NSString =  confirmpassWordEmpty  as NSString
        
         if (resetPassWord.length<=0) {
            errorMessage=GlobalSupportingClass.blankResetPasswordErrorMessage() as String as String as NSString?
        }
        else if(!GlobalSupportingClass.capitalOnly(password: resetPassWord as String)) {
            
            errorMessage=GlobalSupportingClass.capitalLetterMessage() as String as String as NSString?
        }
        else if(!GlobalSupportingClass.numberOnly(password: resetPassWord as String)) {
            
            errorMessage=GlobalSupportingClass.numberMessage() as String as String as NSString?
        }
        else if(!GlobalSupportingClass.specialCharOnly(password: resetPassWord as String)) {
            
            errorMessage=GlobalSupportingClass.specialCharacterMessage() as String as String as NSString?
        }
        else if (resetPassWord.length <= 14) {
            
            errorMessage=GlobalSupportingClass.invalidPassWordErrorMessage() as String as String as NSString?
        }
        
        if let errorMsg = errorMessage{
            
            self.showAlertViewWithTitle("Alert", message: errorMsg as String, buttonTitle: "Retry")
            return false;
        }
        
        return true
    }
    
   func  confirmButtonClicked(_ sendre:UIButton) {

    
    if self.validateAllFields()
    {
        
        //   navigationItem.leftBarButtonItems = []
        let loginViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
        
        
        
        
        self.navigationController?.pushViewController(loginViewController, animated: true)
        
        removeAnimate()

        //            let LoginNav : UINavigationController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "rootloginVC") as! UINavigationController
        //
        //            appDelegate.window?.rootViewController = LoginNav
        //
        
        
        print("Registerd")
        //  updateProfileAPIService()
    }
    else {
        
        // self.appDelegate.window?.makeToast(kNetworkStatusMessage, duration:kToastDuration, position:CSToastPositionCenter)
        
        print("biscute Code")
        
        return
        
    }
    

    
    
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
