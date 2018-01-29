//
//  SignUpViewController.swift
//  Telugu Churches
//
//  Created by N@n!'$ Mac on 24/01/18.
//  Copyright © 2018 Mac OS. All rights reserved.
//

import UIKit
import TextFieldEffects

class SignUpViewController: UIViewController,UITableViewDelegate,UITableViewDataSource,UITextFieldDelegate {
    
    
    @IBOutlet weak var signUpTableView: UITableView!
    
    
    var appVersion          : String = ""

    var toolBar = UIToolbar()
    var activeTextField = UITextField()
    
    
    var userName    : String = ""
    var emailID    : String = ""
    var mobileNumber    : String = ""
    var passWord    : String = ""
    var confirmpassWord    : String = ""

    
    var userNameEmpty = ""
    var emailIDEmpty  = ""
    var mobileNumberEmpty = ""
    var passWordEmpty     =  ""
    var confirmpassWordEmpty  = ""
    
    
    var sectionsTitle : [String] = [" "]
     var signUpTFPlaceholdersArray = ["User Name","E-Mail","Mobile Number","Password","Confirm Password"]

    override func viewDidLoad() {
        super.viewDidLoad()

        signUpTableView.delegate = self
        signUpTableView.dataSource = self
        
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
        
        Utilities.setSignUpViewControllerNavBarColorInCntrWithColor(backImage: "icons8-arrows_long_left", cntr:self, titleView: nil, withText: "", backTitle: " InspectionPro", rightImage: appVersion, secondRightImage: "Up", thirdRightImage: "Up")
        
        //navigationItem.leftBarButtonItems = []
        
    }
    
    //MARK:- textFieldShouldEndEditing
    
    
    
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        
        
        activeTextField = textField
        
        //        if  TVC1.firstNameTF.text != nil{
        //
        //            TVC1.FNLbl.isHidden = false
        //        }
        
        
        if let newRegCell : SignUPTableViewCell = textField.superview?.superview as? SignUPTableViewCell {
            
            if textField == newRegCell.registrationTextfield {
                
                
                if (newRegCell.registrationTextfield.text != nil)  {
                    
                    newRegCell.registrationTextfield.isHidden = false
                    newRegCell.registrationTextfield.textColor = UIColor(red: 128.0/255.0, green: 0.0/255.0, blue: 0.0/255.0, alpha: 1.0)
                    
                }
                    
                else{
                    
                    newRegCell.registrationTextfield.isHidden = true
                    
                    
                }
            }
        }
      
            
        else if textField.tag == 0 {
            
            textField.clearButtonMode = .never
            textField.keyboardType = .default
        }
            
        else if textField.tag == 1{
            
            textField.clearButtonMode = .never
            textField.keyboardType = .default
            
        }
            
        else if textField.tag == 2{
            
            textField.clearButtonMode = .never
            textField.keyboardType = .default
            
        }
        else if textField.tag == 3{
            
            textField.clearButtonMode = .never
            textField.keyboardType = .default
            
        }
        else if textField.tag == 4{
            
            textField.clearButtonMode = .never
            textField.keyboardType = .default
            
        }
       
    }
    
    
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        
        if let newRegCell : SignUPTableViewCell = textField.superview?.superview as? SignUPTableViewCell {
            
            
            if newRegCell.registrationTextfield.text == nil {
                
                newRegCell.registrationTextfield.isHidden = true
                newRegCell.registrationTextfield.isHidden = false
                
                
            }
        }
        return true
    }
    
    
    //MARK:- textFieldDidEndEditing
    
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        
        
        
        if let newRegCell : SignUPTableViewCell = textField.superview?.superview as? SignUPTableViewCell {
            
            
            if (newRegCell.registrationTextfield.text != nil)  {
                
                newRegCell.registrationTextfield.isHidden = false
                
                newRegCell.registrationTextfield.textColor = UIColor.lightGray
            }
            
            //            else{
            //
            //             //   newRegCell.addNewAddressLabel.isHidden = false
            //
            //            }
            
        if textField.tag == 0{
                
                userName = textField.text!
                
            }
                
            else if textField.tag == 1 {
                
                emailID = textField.text!
                
            }
                
            else if textField.tag == 2{
                
                mobileNumber = textField.text!
                
            }
            else if textField.tag == 3{
                
                passWord = textField.text!
                
                
            }
                
            else if textField.tag == 4{
                
                
                confirmpassWord = textField.text!
                
            
            }
                
        }
        
    }
  
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
 
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        
        
        return 5
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sectionsTitle[section]
    }
    
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if (section == 0){
            // UIView Creation...........
            let headerView = UIView(frame: CGRect(x:0, y:0, width:tableView.frame.size.width, height:100))
            headerView.backgroundColor =  UIColor(red: 248.0/255.0, green: 248.0/255.0, blue: 248.0/255.0, alpha: 1.0)
            // UILabel Creation...........
           
            
            let section1HeaderLabel2 = UILabel(frame: CGRect(x: 110, y: -3, width:100, height: 35))
            // section1HeaderLabel.text = sectionsTitle[section]
            section1HeaderLabel2.textColor = UIColor.black
            section1HeaderLabel2.text = "Registration"
            section1HeaderLabel2.textAlignment = .center
            // section1HeaderLabel2.backgroundColor = UIColor.purple
            section1HeaderLabel2.font = UIFont(name: "HelveticaNeue-Bold", size: 15.0)!
            
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
        
        let signUPCell = tableView.dequeueReusableCell(withIdentifier: "SignUPTableViewCell", for: indexPath) as! SignUPTableViewCell
        
     //   signUPCell.registrationTextfield.placeholder = signUpTFPlaceholdersArray[indexPath.row]
        
//        signUPCell.selectionStyle = .none
//        signUPCell.registrationTextfield.delegate = self
//        
//        signUPCell.registrationTextfield.tag = indexPath.row
//        signUPCell.registrationTextfield.layer.borderWidth = 0.5
//        signUPCell.registrationTextfield.layer.borderColor = UIColor.lightGray.cgColor
//        signUPCell.registrationTextfield.layer.cornerRadius = 3
//        signUPCell.registrationTextfield.layer.sublayerTransform = CATransform3DMakeTranslation(5, 0, 5)
     //   delegate?.textChanged(text: signUPCell.detailsLbl?.text)

        //signUPCell.registrationTextfield.spellCheckingType = .no
        
        if indexPath.row == 0{
            
            signUPCell.registrationTextfield.text = userName
            signUPCell.registrationTextfield.keyboardType = .namePhonePad
           // signUPCell.registrationTextfield?.text = "app.UserName".localize()
            signUPCell.registrationTextfield.placeholder = signUpTFPlaceholdersArray[indexPath.row]
            
        }
            
        else if indexPath.row == 1{
            
            signUPCell.registrationTextfield.text = emailID
            signUPCell.registrationTextfield.keyboardType = .emailAddress

           // signUPCell.registrationTextfield?.text = "app.Address1".localize()
            signUPCell.registrationTextfield.placeholder = signUpTFPlaceholdersArray[indexPath.row]
            
            
        }
        else if indexPath.row == 2{
            
            signUPCell.registrationTextfield.text = mobileNumber
            signUPCell.registrationTextfield.keyboardType = .numberPad

           // signUPCell.registrationTextfield?.text = "app.Address2".localize()
            signUPCell.registrationTextfield.placeholder = signUpTFPlaceholdersArray[indexPath.row]
            
            
            
        }
        else if indexPath.row == 3{
            
            signUPCell.registrationTextfield.text = passWord
            signUPCell.registrationTextfield.keyboardType = .emailAddress
           // signUPCell.registrationTextfield?.text = "app.Landmark".localize()
            signUPCell.registrationTextfield.placeholder = signUpTFPlaceholdersArray[indexPath.row]
            
        }
      
        else if indexPath.row == 4{
            
            signUPCell.registrationTextfield.text = passWord
            signUPCell.registrationTextfield.keyboardType = .emailAddress
            // signUPCell.registrationTextfield?.text = "app.Landmark".localize()
            signUPCell.registrationTextfield.placeholder = signUpTFPlaceholdersArray[indexPath.row]
            
            
            
        }

        return signUPCell
    }
    


    
    @IBAction func backLeftButtonTapped(_ sender:UIButton) {
        
        //   navigationItem.leftBarButtonItems = []
        let loginViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
        
        
        
        
        self.navigationController?.pushViewController(loginViewController, animated: true)
        
        
        print("Back Button Clicked......")
        
    }

    @IBAction func submitButtonClicked(_ sender: Any) {
        
        if self.validateAllFields()
        {
            
            print("Registerd")
          //  updateProfileAPIService()
        }
    else {
    
   // self.appDelegate.window?.makeToast(kNetworkStatusMessage, duration:kToastDuration, position:CSToastPositionCenter)
            
            print("biscute Code")

    return
    
    }
    
        print("Submit Button Clicked......")

    
    }

    //MARK:- validateAllFields
    
    func validateAllFields() -> Bool
    {
        
        var errorMessage:NSString?
        
        let userName:NSString = userNameEmpty as NSString
        let emailID:NSString = emailIDEmpty as NSString
        let mobileNumber:NSString =  mobileNumberEmpty  as NSString
        let passWord:NSString = passWordEmpty   as NSString
        let confirmpassWord:NSString =  confirmpassWordEmpty  as NSString
        
        
        
        
        
        if (userName.length <= 0){
            
            errorMessage=GlobalSupportingClass.blankUserNameErrorMessage() as String as String as NSString?
            
        }
        else if (mobileNumber.length <= 0){
            
            errorMessage=GlobalSupportingClass.blankMobileNumberErrorMessage() as String as String as NSString?
            
        }
        else if (mobileNumber.length <= 9) {
            
            errorMessage=GlobalSupportingClass.miniCharMobileNumberErrorMessage() as String as String as NSString?
        }
            
        else  if(!GlobalSupportingClass.isOnlyNumbers(mobileNumber as NSString))
        {
            errorMessage=GlobalSupportingClass.invalidMobileNumberErrorMessage() as String as String as NSString?
        }
            
        else if (emailID.length<=0) {
            errorMessage=GlobalSupportingClass.blankEmailIDErrorMessage() as String as String as NSString?
        }
            
        else  if (emailID.length<=3) {
            errorMessage=GlobalSupportingClass.miniCharEmailIDErrorMessage() as String as String as NSString?
        }
        else  if(!GlobalSupportingClass.isValidEmail(emailID as NSString))
        {
            errorMessage=GlobalSupportingClass.invalidEmaildIDFormatErrorMessage() as String as String as NSString?
        }
            
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
        else if (confirmpassWord.length<=0) {
            errorMessage=GlobalSupportingClass.blankPasswordErrorMessage() as String as String as NSString?
        }
//        else if(!GlobalSupportingClass.capitalOnly(confirmpassWord: confirmpassWord as String)) {
//            
//            errorMessage=GlobalSupportingClass.capitalLetterMessage() as String as String as NSString?
//        }
//        else if(!GlobalSupportingClass.numberOnly(confirmpassWord: confirmpassWord as String)) {
//            
//            errorMessage=GlobalSupportingClass.numberMessage() as String as String as NSString?
//        }
//        else if(!GlobalSupportingClass.specialCharOnly(confirmpassWord: confirmpassWord as String)) {
//            
//            errorMessage=GlobalSupportingClass.specialCharacterMessage() as String as String as NSString?
//        }
        
                if let errorMsg = errorMessage{
        
                    self.showAlertViewWithTitle("Alert", message: errorMsg as String, buttonTitle: "Retry")
                    return false;
                }
        return true
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

