//
//  InfoChurchViewController.swift
//  Telugu Churches
//
//  Created by Manoj on 20/02/18.
//  Copyright © 2018 Mac OS. All rights reserved.
//

import UIKit

class InfoChurchViewControllers: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    
    @IBOutlet weak var infoChurchView: UIView!
    
    @IBOutlet weak var infoChurchTableView: UITableView!
    
    var delegate: churchChangeSubtitleOfIndexDelegate?
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate

    var appVersion          : String = ""

    
    var listResultArray:[GetChurchByIDResultVo]?
    var churchNamesString = ""
   // var churchIDArray = Array<Int>()
    var villageNamesString = ""
    var phoneNoString = ""
    var regNoString = ""
    var emailString = ""
    var nameString = ""
    var timeString = ""
    var descriptionString = ""


    let utillites =  Utilities()

    var ChurchDetailsAry  = ["REG001".localize(),"Aishwarya Satish".localize(),"Church@crist.com".localize(),"1234567898".localize(),"9AM-5Pm".localize()]
    
    var ChurchInfoAry  = ["1".localize(),"REG001".localize(),"Holv Church".localize(),"LandMark".localize(),"Aishwarya Sateesh".localize(),"Contact No".localize(),"Church@gmail.com".localize()]
    
    var churchID      : Int = 0

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        infoChurchTableView.delegate = self
        infoChurchTableView.dataSource = self
        
//        infoChurchView.layer.cornerRadius = 6.0
//        
//        infoChurchView.layer.borderWidth = 1
//        infoChurchView.layer.borderColor = UIColor(red: 122.0/255.0, green: 186.0/255.0, blue: 208.0/255.0, alpha: 1.0).cgColor
        
        
//        self.churchID = UserDefaults.standard.value(forKey: kchurchID) as! Int
//        UserDefaults.standard.synchronize()
//        
        
     //   print(self.churchID)
        
        let nibName1  = UINib(nibName: "HeadImgTableViewCell" , bundle: nil)
        infoChurchTableView.register(nibName1, forCellReuseIdentifier: "HeadImgTableViewCell")
        let nibName2  = UINib(nibName: "InformationTableViewCell" , bundle: nil)
        infoChurchTableView.register(nibName2, forCellReuseIdentifier: "InformationTableViewCell")
        let nibName3  = UINib(nibName: "InfoMapTableViewCell" , bundle: nil)
        infoChurchTableView.register(nibName3, forCellReuseIdentifier: "InfoMapTableViewCell")
        let nibName4  = UINib(nibName: "AboutInfoTableViewCell" , bundle: nil)
        infoChurchTableView.register(nibName4, forCellReuseIdentifier: "AboutInfoTableViewCell")
        
        getChurchuByIDAPIService()

        // Do any additional setup after loading the view.
    }

    
   

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
     //  self.navigationController?.navigationBar.isHidden = true

        
      //  Utilities.setChurchuInfoViewControllerNavBarColorInCntrWithColor(backImage: "icons8-arrows_long_left", cntr:self, titleView: nil, withText: "Churchu Details".localize(), backTitle: "Churchu Details".localize(), rightImage: appVersion, secondRightImage: "Up", thirdRightImage: "Up")
        


    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
       
        
    }
    

func getChurchuByIDAPIService(){
    
    if(appDelegate.checkInternetConnectivity()){
        
        
        
        let strUrl = GETCHURCHEBYID + "" + "\(churchID)"
        
        
        serviceController.getRequest(strURL:strUrl, success:{(result) in
            DispatchQueue.main.async()
                {
                    
                    //  let respVO:LoginVo = Mapper().map(JSONObject: result)!
                    
                    print("result:\(result)")
                    
                    let respVO:GetChurchByIDVo = Mapper().map(JSONObject: result)!
                    
                    print("responseString = \(respVO)")
                    
                    
                    let isSuccess = respVO.isSuccess
                    print("StatusCode:\(String(describing: isSuccess))")
                    
                    if isSuccess == true {
                        
                        if !(respVO.listResult!.isEmpty){
                            
                        let successMsg = respVO.endUserMessage

                        self.listResultArray = respVO.listResult!
                        
                        self.churchNamesString = (respVO.listResult?[0].name)!
                        self.phoneNoString = (respVO.listResult?[0].userContactNumbar)!
                        self.regNoString = (respVO.listResult?[0].registrationNumber)!
                        self.emailString = (respVO.listResult?[0].email)!
                        self.nameString = (respVO.listResult?[0].pasterUser)!
                        self.timeString = ( (respVO.listResult?[0].openingTime)! + "-" + (respVO.listResult?[0].closingTime)!)
                        self.descriptionString = (respVO.listResult?[0].description)!

                       //  self.timeArray = ("\(respVO.listResult?[0].openingTime)" + "-" + "\(respVO.listResult?[0].openingTime)")

                     print(self.timeString)
                    print(self.churchNamesString)
                        self.appDelegate.window?.makeToast(successMsg!, duration:kToastDuration, position:CSToastPositionCenter)
                    self.infoChurchTableView.reloadData()
                        }else{
                            
                            print("Nil Value")
                        }

                        
                        
                    }
                        
                    else {
                        
                        
                        
                    }
                    
  
                    
                    
                    
                    
                    
                    
            }
        }, failure:  {(error) in
            
            print(error)
            
            if(error == "unAuthorized"){
                
                
                self.showAlertViewWithTitle("Alert".localize(), message: error, buttonTitle: "Ok".localize())
                
                
            }
            
            
            
        })
        
    }
    else {
        
        appDelegate.window?.makeToast(kNetworkStatusMessage, duration:kToastDuration, position:CSToastPositionCenter)
        return
    }
    
}

    func numberOfSections(in tableView: UITableView) -> Int {
        
        
        return 1
    }



    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 4
        
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        
        
        if indexPath.row == 0 {
            
            return 137
        }else if indexPath.row == 1{
            
            return 131
        }else if indexPath.row == 2{
            
            return 124
        }
        
        return 218
    }


    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if (indexPath.row == 0) {
            
        let cell = tableView.dequeueReusableCell(withIdentifier: "HeadImgTableViewCell", for: indexPath) as! HeadImgTableViewCell
            
        
        cell.churchNameLabel.text = churchNamesString

            return cell

        }
        else if (indexPath.row == 1) {

            
            let cell1 = tableView.dequeueReusableCell(withIdentifier: "InformationTableViewCell", for: indexPath) as! InformationTableViewCell
            
            cell1.REGLabelOutLet.text = regNoString
            cell1.authorNameLabel.text = nameString
            cell1.emailLabel.text = emailString
            cell1.phoneNumberLabel.text = phoneNoString
           cell1.timeLabel.text = timeString

            
         //   cell.nameLabel.text = ChurchDetailsAry[indexPath.row]
            

            return cell1
//
        }
        else if (indexPath.row == 2){
            
            let cell2 = tableView.dequeueReusableCell(withIdentifier: "InfoMapTableViewCell", for: indexPath) as! InfoMapTableViewCell
            
           //   cell.nameLabel.text = ChurchDetailsAry[indexPath.row]
            
        return cell2
            
        }
        
        let cell3 = tableView.dequeueReusableCell(withIdentifier: "AboutInfoTableViewCell", for: indexPath) as! AboutInfoTableViewCell
        
           cell3.aboutTextView.text = descriptionString
        
        
        return cell3
//

        
    }
    func showAlertViewWithTitle(_ title:String,message:String,buttonTitle:String)
    {
        let alertView:UIAlertView = UIAlertView();
        alertView.title=title
        alertView.message=message
        alertView.addButton(withTitle: buttonTitle)
        alertView.show()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
