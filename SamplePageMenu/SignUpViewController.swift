//
//  SignUpViewController.swift
//  Telugu Churches
//
//  Created by N@n!'$ Mac on 24/01/18.
//  Copyright © 2018 Mac OS. All rights reserved.
//

import UIKit
import TextFieldEffects

class SignUpViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    
    @IBOutlet weak var signUpTableView: UITableView!
    
    
    var appVersion          : String = ""

    
    
    var sectionsTitle : [String] = [" "]
     var signUpTFPlaceholdersArray = ["Full Name","E-Mail","Mobile Number","Password","Confirm Password"]

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
        
        Utilities.setSignUpViewControllerNavBarColorInCntrWithColor(backImage: "icons8-hand_right_filled-1", cntr:self, titleView: nil, withText: "", backTitle: " InspectionPro", rightImage: appVersion, secondRightImage: "Up", thirdRightImage: "Up")
        
        //navigationItem.leftBarButtonItems = []
        
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
        
        signUPCell.registrationTextfield.placeholder = signUpTFPlaceholdersArray[indexPath.row]
        
        //signUPCell.registrationTextfield.spellCheckingType = .no
        
        return signUPCell
    }
    

    
    
    @IBAction func backLeftButtonTapped(_ sender:UIButton) {
        
        //   navigationItem.leftBarButtonItems = []
//        
//        failedTableView.resignFirstResponder()
//        failedTableView.endEditing(true)
//        let poppedVC = navigationController?.popViewController(animated: true)
//        print(poppedVC as Any)
        
        print("Back Button Tapped......")
        
    }

    

}
