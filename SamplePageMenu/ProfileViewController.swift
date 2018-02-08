//
//  ProfileViewController.swift
//  Telugu Churches
//
//  Created by praveen dole on 2/2/18.
//  Copyright © 2018 Mac OS. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController,UITableViewDelegate,UITableViewDataSource,UITextFieldDelegate,UINavigationControllerDelegate,UIImagePickerControllerDelegate {

    let appDelegate = UIApplication.shared.delegate as! AppDelegate

    var appVersion          : String = ""

    var showNav = false
    let isActive : Bool = true

    
    @IBOutlet weak var editProfileTableView: UITableView!
    
    
    var placeholdersAry  = ["First Name","Middle Name","Last Name","Mobile No","Email ID"]
    
    var firstName   : String = ""
    var middleName  : String = ""
    var lastName    : String = ""
    var mobileNumber    : String = ""
    var email       : String = ""
    var loginid      : String = ""
    var password       : String = ""
    
    var activeTextField = UITextField()
    
    let picker = UIImagePickerController()
    
    var isImageSave:Bool = false
    var sectionsTitle : [String] = [""]
    
    var imgVW = UIImageView()

    var image:UIImage = UIImage()
    var pickerData : Array<String> = Array()

     var selectedtitleTypeStr  = ""
      var titletypeIdAry = Array<String>()
    var titleTypeID    : Int    = 0

    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        
        let nibName  = UINib(nibName: "EditProfileTableViewCell" , bundle: nil)
        editProfileTableView.register(nibName, forCellReuseIdentifier: "EditProfileTableViewCell")
        
        let nibName1  = UINib(nibName: "menuTableViewCell" , bundle: nil)
        editProfileTableView.register(nibName1, forCellReuseIdentifier: "menuTableViewCell")
        
        let nibName2  = UINib(nibName: "HeaderProfileCell" , bundle: nil)
        editProfileTableView.register(nibName2, forCellReuseIdentifier: "HeaderProfileCell")
        
        
        self.firstName = (UserDefaults.standard.value(forKey: kfirstName) as? String)!
        self.middleName = (UserDefaults.standard.value(forKey: kmiddleName) as? String)!
        self.lastName = (UserDefaults.standard.value(forKey: klastName) as? String)!
        self.mobileNumber = (UserDefaults.standard.value(forKey: kmobileNumber) as? String)!
        self.email = (UserDefaults.standard.value(forKey: kemail) as? String)!
        self.loginid = (UserDefaults.standard.value(forKey: kLoginId) as? String)!
        self.password = (UserDefaults.standard.value(forKey: kpassword) as? String)!
        
        
        
        
        editProfileTableView.dataSource = self
        editProfileTableView.delegate = self
        activeTextField.delegate = self

     

        
      //  Utilities.setEditProfileViewControllerNavBarColorInCntrWithColor(backImage: "icons8-arrows_long_left", cntr:self, titleView: nil, withText: "Edit Profile", backTitle: "", rightImage: appVersion, secondRightImage: "Up", thirdRightImage: "Up")
        
        // Do any additional setup after loading the view.
    }

    
    
    override func viewWillAppear(_ animated: Bool) {
        
        super.viewWillAppear(animated)
        
        
        
        print(showNav)
        
        self.navigationController?.navigationBar.isHidden = false

        
        Utilities.setProfileViewControllerNavBarColorInCntrWithColor(backImage: "icons8-arrows_long_left", cntr:self, titleView: nil, withText: "Edit Profile", backTitle: " Edit Profile", rightImage: appVersion, secondRightImage: "Up", thirdRightImage: "Up")
        
        //   self.navigationItem.hidesBackButton = false
        
        //        Utilities.setSignUpViewControllerNavBarColorInCntrWithColor(backImage: "icons8-hand_right_filled-1", cntr:self, titleView: nil, withText: "", backTitle: " InspectionPro", rightImage: appVersion, secondRightImage: "Up", thirdRightImage: "Up")
        //
        //        //navigationItem.leftBarButtonItems = []
        
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        
        super.viewDidDisappear(animated)
        
      //  self.navigationController?.navigationBar.isHidden = !showNav
      //  Utilities.setLoginViewControllerNavBarColorInCntrWithColor(backImage: "icons8-arrows_long_left", cntr:self, titleView: nil, withText: "", backTitle: " ", rightImage: appVersion, secondRightImage: "Up", thirdRightImage: "Up")
        
        
        // print(showNav)
        
     //   self.navigationController?.navigationBar.isHidden = false
        
        
        
        //   self.navigationItem.hidesBackButton = false
        
        //        Utilities.setSignUpViewControllerNavBarColorInCntrWithColor(backImage: "icons8-hand_right_filled-1", cntr:self, titleView: nil, withText: "", backTitle: " InspectionPro", rightImage: appVersion, secondRightImage: "Up", thirdRightImage: "Up")
        //
        //        //navigationItem.leftBarButtonItems = []
        
    }
    
    

    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        
        
        activeTextField = textField
        
        
        
        if activeTextField.tag == 0 {
            
            textField.maxLengthTextField = 20
            textField.clearButtonMode = .never
            textField.keyboardType = .alphabet
        }
            
        else if activeTextField.tag == 1{
            
            textField.maxLengthTextField = 20
            textField.clearButtonMode = .never
            textField.keyboardType = .alphabet
            
        }
            
        else if activeTextField.tag == 2{
            
            textField.maxLengthTextField = 20
            textField.clearButtonMode = .never
            textField.keyboardType = .default
            
        }
        else if activeTextField.tag == 3{
            
            textField.maxLengthTextField = 10
            textField.clearButtonMode = .never
            textField.keyboardType = .numberPad
            
        }
        else if activeTextField.tag == 4{
            
            textField.maxLengthTextField = 40
            textField.clearButtonMode = .never
            textField.keyboardType = .emailAddress
            
        }
        
    }
    
    
    
    
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
       
        if !string.canBeConverted(to: String.Encoding.ascii){
            return false
        }
        
        
        return true
    }
    
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        
        if let newRegCell : EditProfileTableViewCell = textField.superview?.superview as? EditProfileTableViewCell {
            
            
            
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
            
        else if activeTextField.tag == 1 {
            
            middleName = textField.text!
            
        }
            
        else if activeTextField.tag == 2{
            
            lastName = textField.text!
            
        }
        else if activeTextField.tag == 3{
            
            mobileNumber = textField.text!
            
            
        }
            
        else if activeTextField.tag == 4{
            
            
            email = textField.text!
            
            
        }
        
        
        
    }
    
    
    
    
    
    
    //MARK:- UITableView Delegate & DataSource
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 2
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if section == 0 {
            return 1
        }
        return 5
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat{
        
        return UITableViewAutomaticDimension
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return UITableViewAutomaticDimension
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
     return sectionsTitle[section]
     }
     
     
   /*  func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
     if (section == 1){
     // UIView Creation...........
     let headerView = UIView(frame: CGRect(x:0, y:0, width:tableView.frame.size.width, height:100))
     headerView.backgroundColor =  UIColor(red: 248.0/255.0, green: 248.0/255.0, blue: 248.0/255.0, alpha: 1.0)
     // UILabel Creation...........
     
     
     let section1HeaderLabel2 = UILabel(frame: CGRect(x: 120, y: -3, width:100, height: 35))
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
     
        if section == 0 {
            
            return 0.0
        }
        
         return 44.0
     
     } */

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        
        if indexPath.section == 0 {
            
            let profileCell = tableView.dequeueReusableCell(withIdentifier: "menuTableViewCell", for: indexPath) as! menuTableViewCell
            
            profileCell.selectionStyle = .none
            
            if indexPath.row == 0{
                
                profileCell.cameraOutLet.addTarget(self, action: #selector(self.editBtnClicked), for: .touchDown)
                
                
                profileCell.progileImageView.layer.cornerRadius = profileCell.progileImageView.frame.size.height/2;
                
                profileCell.progileImageView.layer.borderColor = UIColor.gray.cgColor
                profileCell.progileImageView.layer.borderWidth = 1
                profileCell.progileImageView.clipsToBounds = true
                
                profileCell.progileImageView.image = image
                
                
                
            }
            
            return profileCell
            
        } else{
            
            
            
            let signUPCell = tableView.dequeueReusableCell(withIdentifier: "EditProfileTableViewCell", for: indexPath) as! EditProfileTableViewCell
            
            signUPCell.editProfileTF.delegate = self
            
            signUPCell.editProfileTF.tag = indexPath.row
            
            
        
        
        if indexPath.row == 0{
            
            signUPCell.editProfileTF.placeholder = "First Name"
            signUPCell.editProfileTF.text = self.firstName
            
            
        }
            
        else if indexPath.row == 1{
            
            
            signUPCell.editProfileTF.placeholder = "Middle Name"
            signUPCell.editProfileTF.text = self.middleName
            
            
            
        }
        else if indexPath.row == 2{
            
            
            signUPCell.editProfileTF.placeholder = "Last Name"
            signUPCell.editProfileTF.text = self.lastName
            
            
            
        }
        else if indexPath.row == 3{
            
            signUPCell.editProfileTF.placeholder = "Mobile No"
            
            signUPCell.editProfileTF.text = self.mobileNumber
            
            
        }
            
        else if indexPath.row == 4{
            
            signUPCell.editProfileTF.placeholder = "Email ID"
            signUPCell.editProfileTF.text = self.email
            
            
        }
        
        return signUPCell
    }
        
    }
    
    
    func editBtnClicked(_ sender: UIButton?)  {
        
        print("I Clicked a button")
        
        
        let alert:UIAlertController=UIAlertController(title: "ChoosemenuImgView", message: nil, preferredStyle: UIAlertControllerStyle.actionSheet)
        let cameraAction = UIAlertAction(title: "FromCamera", style: UIAlertActionStyle.default)
        {
            UIAlertAction in
            self.openCamera()
        }
        let gallaryAction = UIAlertAction(title: "FromGallery", style: UIAlertActionStyle.default)
        {
            UIAlertAction in
            self.openGallary()
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.cancel)
        {
            UIAlertAction in
        }
        // Add the actions
        picker.delegate = self
        alert.addAction(cameraAction)
        alert.addAction(gallaryAction)
        alert.addAction(cancelAction)
        // Present the controller
        self.present(alert, animated: true, completion: nil)
        
        
    }
    
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        
        dismiss(animated: true, completion: nil)
        image = (info[UIImagePickerControllerOriginalImage] as? UIImage)!
        editProfileTableView.reloadData()
    }

    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        
        if section == 1 {
         
            let headerProfileCell = tableView.dequeueReusableCell(withIdentifier: "HeaderProfileCell") as! HeaderProfileCell
            
            
            return headerProfileCell
            
        }
        return nil
        }
        
    
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
        if section == 0 {
            
            return 0.0
        }
        
        return 44.0
        
    }
    
    
    func saveProfileAPICall(){
    
    
        let  updateProfileAPI : String = EDITPROFILEURL
        
        
        let updateProfiledictParams = [
            "Id": self.loginid,
            "UserId": "",
            "FirstName": self.firstName,
            "MiddleName": self.middleName,
            "LastName": self.lastName,
            "ContactNumber": "2457561545",
            "MobileNumber":"",
            "UserName": "",
            "Password": "",
            "RoleId": 1,
            "Email": email,
            "IsActive": isActive,
            "CreatedByUserId": 1,
            "CreatedDate": "2018-01-31T10:43:28.8319786+05:30",
            "UpdatedByUserId": 1,
            "UpdatedDate": "2018-01-31T10:43:28.8329795+05:30"
            ] as [String : Any]
        
        print(updateProfiledictParams)
        
        let dictHeaders = ["":"","":""] as NSDictionary
        
        
        serviceController.signUpRequestPOSTURL(strURL: updateProfileAPI as NSString, postParams: updateProfiledictParams as NSDictionary, postHeaders: dictHeaders, successHandler: { (result) in
            
            DispatchQueue.main.async()
                {
                    
                    print("result:\(result)")
            
            }
            
        }, failureHandler: {(error) in
        
    
            
            
            
        })
    
    }
    
    
    
    
    @IBAction func saveBtnAction(_ sender: Any) {
        
        if self.validateAllFields()
        {
            
        saveProfileAPICall()
            
        }
        else {
            
            print("biscute Code")
            
            return
            
        }
        
        print("Submit Button Clicked......")
        
        
    }
    
    //MARK:- validateAllFields
    
    func validateAllFields() -> Bool
    {
        
        var errorMessage:NSString?
        
        let firstName:NSString = self.firstName   as NSString
        
        let middleName:NSString =  self.middleName  as NSString
        
        let lastName:NSString =  self.lastName  as NSString
        
        let mobileNumber:NSString =  self.mobileNumber  as NSString
        
        let emailID:NSString = self.email as NSString
        
        
        
        
        
        if (firstName.length <= 2){
            errorMessage=GlobalSupportingClass.blankFirstNameErrorMessage() as String as String as NSString?
            
        }
            
//        else if (middleName.length<=2) {
//            errorMessage=GlobalSupportingClass.blankMiddleNameErrorMessage() as String as String as NSString?
//        }
        else  if (lastName.length <= 2){
            errorMessage=GlobalSupportingClass.blankLastNameErrorMessage() as String as String as NSString?
            
        }
        else if (mobileNumber.length <= 0){
            
            errorMessage=GlobalSupportingClass.blankMobileNumberErrorMessage() as String as String as NSString?
            
        }
        else if (mobileNumber.length <= 9) {
            
            errorMessage=GlobalSupportingClass.invalidMobileNumberErrorMessage() as String as String as NSString?
        }
            
        else if (emailID.length<=0) {
            errorMessage=GlobalSupportingClass.blankEmailIDErrorMessage() as String as String as NSString?
        }
            
        else  if (emailID.length<=4) {
            errorMessage=GlobalSupportingClass.miniCharEmailIDErrorMessage() as String as String as NSString?
        }
        else  if(!GlobalSupportingClass.isValidEmail(emailID as NSString))
        {
            errorMessage=GlobalSupportingClass.invalidEmaildIDFormatErrorMessage() as String as String as NSString?
        }
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
    
    
    @IBAction func imgBtnAction(_ sender: Any) {
    }
    
    //MARK:- openCamera
    
    
    func openCamera() {
        picker.allowsEditing = true
        //      picker.sourceType = .PhotoLibrary
        picker.sourceType = .camera
        present(picker, animated: true, completion: nil)
        
    }
    
    //MARK:- openGallary
    
    
    func openGallary() {
        picker.allowsEditing = true
        picker.sourceType = .photoLibrary
        //      picker.sourceType = .Camera
        present(picker, animated: true, completion: nil)
        
    }
    
    
    //MARK:- saveImage
    
    
    func saveImage (_ image: UIImage, path: String ) -> Bool{
        
        isImageSave = true
        
        //let pngImageData = UIImagePNGRepresentation(image)
        let jpgImageData = UIImageJPEGRepresentation(image, 1.0)   // if you want to save as JPEG
        let result = (try? jpgImageData!.write(to: URL(fileURLWithPath: path), options: [.atomic])) != nil
        
        return result
    }
    

    
    
    @IBAction func backLeftButtonTapped(_ sender:UIButton) {
        
        //   navigationItem.leftBarButtonItems = []
        
        UserDefaults.standard.removeObject(forKey: "1")
        UserDefaults.standard.removeObject(forKey: KFirstTimeLogin)
        UserDefaults.standard.removeObject(forKey: kLoginSucessStatus)
        UserDefaults.standard.synchronize()
        
        let rootController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SWRevealViewController") as! SWRevealViewController
        
        appDelegate.window?.rootViewController = rootController
        
        
        print("Back Button Clicked......")
        
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
