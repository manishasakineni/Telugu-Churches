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
    
    
    var listResultArray = Array<Any>()
    var churchNamesArray = Array<String>()
   // var churchIDArray = Array<Int>()
    var villageNamesArray = Array<String>()
    var phoneNoArray = Array<String>()
    var regNoArray = Array<String>()
    var emailArray = Array<String>()
    var nameArray = Array<String>()
    var timeArray = Array<String>()


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
        
        
        infoChurchTableView.register(UINib.init(nibName: "HeadImgTableViewCell", bundle: nil),
                                     forCellReuseIdentifier: "HeadImgTableViewCell")
        

        
        
        infoChurchTableView.register(UINib.init(nibName: "InformationTableViewCell", bundle: nil),
                                        forCellReuseIdentifier: "InformationTableViewCell")
        
        infoChurchTableView.register(UINib.init(nibName: "InfoMapTableViewCell", bundle: nil),
                                     forCellReuseIdentifier: "InfoMapTableViewCell")
        
        infoChurchTableView.register(UINib.init(nibName: "AboutInfoTableViewCell", bundle: nil),
                                     forCellReuseIdentifier: "AboutInfoTableViewCell")
        
    

        // Do any additional setup after loading the view.
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        getChurchuAPIService()

    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
       
        
    }
    

func getChurchuAPIService(){
    
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
                        
                        
                        
                        self.listResultArray = respVO.listResult!
                        
                        
                        
//                        
//                        let pageCout  = (respVO.totalRecords)! / 10
//                        
//                        let remander = (respVO.totalRecords)! % 10
//                        
//                        self.totalPages = pageCout
//                        
//                        if remander != 0 {
//                            
//                            self.totalPages = self.totalPages! + 1
//                            
//                        }
                        
                        
                        for church in respVO.listResult!{
                            
                            self.churchNamesArray.append(church.name!)
                            self.villageNamesArray.append(church.villageName!)
                            self.phoneNoArray.append(church.contactNumber!)
                         //   self.churchIDArray.append(church.Id!)
                            self.regNoArray.append(church.registrationNumber!)
                            self.nameArray.append(church.pasterUser!)
                            self.emailArray.append(church.email!)
                            self.timeArray.append("\(church.openingTime!)" + "-" + "\(church.closingTime!)" )
                            print("churchNamesArray" ,self.churchNamesArray)
                            print("villageNamesArray" ,self.villageNamesArray)
                            print("phoneNoArray" ,self.phoneNoArray)
                           // print("churchIDArray" ,self.churchIDArray)
                            print("regNoArray" ,self.regNoArray)
                            print("nameArray" ,self.nameArray)
                            print("emailArray" ,self.emailArray)
                            print("timeArray" ,self.timeArray)

                            
                        }
                        
                        
                        print(self.churchNamesArray)
                        
                        
                        
                        self.infoChurchTableView.reloadData()
                        
                        
                        
                        
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
        
        return 140
    }


    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if (indexPath.row == 0) {
            
        let cell = tableView.dequeueReusableCell(withIdentifier: "HeadImgTableViewCell", for: indexPath) as! HeadImgTableViewCell
        
      //  cell.nameLabel.text = ChurchDetailsAry[indexPath.row]

            return cell

        }
        else if (indexPath.row == 1) {

            
            let cell1 = tableView.dequeueReusableCell(withIdentifier: "InformationTableViewCell", for: indexPath) as! InformationTableViewCell
            
         //   cell.nameLabel.text = ChurchDetailsAry[indexPath.row]
            

            return cell1

            
        } else if (indexPath.row == 2){
            
            
            let cell2 = tableView.dequeueReusableCell(withIdentifier: "InfoMapTableViewCell", for: indexPath) as! InfoMapTableViewCell
            
            //   cell.nameLabel.text = ChurchDetailsAry[indexPath.row]
            
            
        return cell2

        }
        
        let cell3 = tableView.dequeueReusableCell(withIdentifier: "AboutInfoTableViewCell", for: indexPath) as! AboutInfoTableViewCell
        
        //   cell.nameLabel.text = ChurchDetailsAry[indexPath.row]
        
        
        return cell3


        
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
