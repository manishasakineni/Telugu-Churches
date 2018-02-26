//
//  ChurchAdminViewController.swift
//  Telugu Churches
//
//  Created by praveen dole on 2/22/18.
//  Copyright © 2018 Mac OS. All rights reserved.
//

import UIKit

class ChurchAdminViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    @IBOutlet weak var churchAdminTableView: UITableView!
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate

    
    var appVersion          : String = ""
    
    var listResultArray = Array<Any>()
    var churchNamesArray = Array<String>()
    var churchAdminNameArray = Array<String>()
    var mobileNumberArray = Array<String>()
    var emailArray = Array<String>()

    var churchAdmin = Array<String>()
    
    var PageIndex = 1
    var totalPages : Int? = 0
    var totalRecords : Int? = 0
    

    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        let nibName1  = UINib(nibName: "ChurchAdminDetailCell" , bundle: nil)
        churchAdminTableView.register(nibName1, forCellReuseIdentifier: "ChurchAdminDetailCell")
        
        getChurchAdminDetailsAPICall()

        // Do any additional setup after loading the view.
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        
            super.viewWillAppear(animated)
            Utilities.setChurchuAdminInfoViewControllerNavBarColorInCntrWithColor(backImage: "icons8-arrows_long_left", cntr:self, titleView: nil, withText: "Admin List".localize(), backTitle: "Admin List".localize(), rightImage: appVersion, secondRightImage: "Up", thirdRightImage: "Up")
            
            
        
        
     //   churchAdminTableView.isHidden = true
        
        
        
        
    }

    
    
    //MARK: -  Church Details API Call
    
    func getChurchAdminDetailsAPICall(){
        
        
        
        let paramsDict = [ "pageIndex": PageIndex,
                           "pageSize": 10,
                           "sortbyColumnName": "UpdatedDate",
                           "sortDirection": "desc",
            ] as [String : Any]
        
        let dictHeaders = ["":"","":""] as NSDictionary
        
        
        serviceController.postRequest(strURL: GETALLCHURCHEADMINS as NSString, postParams: paramsDict as NSDictionary, postHeaders: dictHeaders, successHandler: { (result) in
            
            print(result)
            
            let respVO:GetAllChurchAdminsVo = Mapper().map(JSONObject: result)!
            
            
            let isSuccess = respVO.isSuccess
            print("StatusCode:\(String(describing: isSuccess))")
            
            if isSuccess == true {
                
                let successMsg = respVO.endUserMessage

                
                self.listResultArray = respVO.listResult!
                
                
                
                
                let pageCout  = (respVO.totalRecords)! / 10
                
                let remander = (respVO.totalRecords)! % 10
                
                self.totalPages = pageCout
                
                if remander != 0 {
                    
                    self.totalPages = self.totalPages! + 1
                    
                }
                
                
                for church in respVO.listResult!{
                    
                    self.churchNamesArray.append(church.churchName!)
                       self.churchAdminNameArray.append(church.churchAdmin!)
                    self.mobileNumberArray.append(church.mobileNumber!)
                    self.emailArray.append(church.email!)


                  //  self.churchAdmin.append(church.contactNumber!)
//                    self.churchIDArray.append(church.Id!)
                    
                }
                
                
                print("churchNamesArray", self.churchNamesArray)
                print("churchNamesArray.Count", self.churchNamesArray.count)

                

                self.churchAdminTableView.reloadData()
                
                self.appDelegate.window?.makeToast(successMsg!, duration:kToastDuration, position:CSToastPositionCenter)

                
                
            }
                
            else {
                
                
                
            }
            
            
            
            
        }) { (failureMessage) in
            
            
            print(failureMessage)
            
        }
        
        
        
    }

            
            
            
    
    //MARK: -  churchDetailsTableView delegate methods
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        
        return churchNamesArray.count
        
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return UITableViewAutomaticDimension
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
//        if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiom.pad) {
//            
//            return 180
//            
//        }
//            
//        else {
//            
//            return 140
//            
//        }
        
        return UITableViewAutomaticDimension
    }
    
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
        if indexPath.row == churchNamesArray.count - 1 {
            
            if(self.totalPages! > PageIndex){
                
                
                PageIndex = PageIndex + 1
                
                getChurchAdminDetailsAPICall()
                
                
                
            }
        }
        
        
        
        
        
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ChurchAdminDetailCell", for: indexPath) as! ChurchAdminDetailCell
        cell.adminNameLabel.text = churchAdminNameArray[indexPath.row]
        cell.churchName.text = churchNamesArray[indexPath.row]
        cell.mobileNumber.text = mobileNumberArray[indexPath.row]
        cell.email.text = emailArray[indexPath.row]

      //  cell.adminNameLabel.text = churchNamesArray[indexPath.row]

        return cell
        
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        

        
    }
    
    @IBAction func backLeftButtonTapped(_ sender:UIButton) {
        
        
        
        UserDefaults.standard.removeObject(forKey: "1")
        UserDefaults.standard.removeObject(forKey: kLoginSucessStatus)
        UserDefaults.standard.synchronize()
        
        
        let rootController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SWRevealViewController") as! SWRevealViewController
        
        appDelegate.window?.rootViewController = rootController
        
        
        
        //   navigationItem.leftBarButtonItems = []
        //   let loginViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
        
        //
        //        UserDefaults.standard.set("1", forKey: "1")
        //        UserDefaults.standard.synchronize()
        //
        //        self.navigationController?.popViewController(animated: true)
        //
        //
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
