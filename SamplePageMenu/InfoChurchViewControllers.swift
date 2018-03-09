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
    var churchCountryArray = Array<String>()
    var churchStateArray = Array<String>()
    var churchDistrictNameArray = Array<String>()
    var churchVillageNameArray = Array<String>()
    var churchImageLogoArray = Array<String>()
    var churchImageLogoString = ""
    var landMarkString = ""
    var address1String = ""
    var address2String = ""
    var openTimeString = ""
    var closeTimeString = ""
    var contactNumberString = ""
    var mandalNameString = ""

   // var churchCountryArray = Array<String>()

    var villageNamesString = ""
    var phoneNoString = ""
    var regNoString = ""
    var emailString = ""
    var nameString = ""
    var timeString = ""
    var descriptionString = ""
    
    var MissionString = ""
    var VissionString = ""


    let utillites =  Utilities()

    var ChurchDetailsAry  = ["REG001".localize(),"Aishwarya Satish".localize(),"Church@crist.com".localize(),"1234567898".localize(),"9AM-5Pm".localize()]
    
    var ChurchInfoAry  = ["1".localize(),"REG001".localize(),"Holv Church".localize(),"LandMark".localize(),"Aishwarya Sateesh".localize(),"Contact No".localize(),"Church@gmail.com".localize()]
    
    var churchID      : Int = 0

    let array = ["","ssss","ddddd","gggg"]
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        infoChurchTableView.delegate = self
        infoChurchTableView.dataSource = self
        
        infoChurchTableView.rowHeight = UITableViewAutomaticDimension
        infoChurchTableView.estimatedRowHeight = 44
        infoChurchTableView.reloadData()
        
     
        
        let nibName1  = UINib(nibName: "HeadImgTableViewCell" , bundle: nil)
        infoChurchTableView.register(nibName1, forCellReuseIdentifier: "HeadImgTableViewCell")
        let nibName2  = UINib(nibName: "InformationTableViewCell" , bundle: nil)
        infoChurchTableView.register(nibName2, forCellReuseIdentifier: "InformationTableViewCell")
        let nibName3  = UINib(nibName: "InfoMapTableViewCell" , bundle: nil)
        infoChurchTableView.register(nibName3, forCellReuseIdentifier: "InfoMapTableViewCell")
        let nibName4  = UINib(nibName: "AboutInfoTableViewCell" , bundle: nil)
        infoChurchTableView.register(nibName4, forCellReuseIdentifier: "AboutInfoTableViewCell")
        
        let nibName5  = UINib(nibName: "InfoHeaderCell" , bundle: nil)
        infoChurchTableView.register(nibName5, forCellReuseIdentifier: "InfoHeaderCell")
        
        
        

        
        getChurchuByIDAPIService()

        // Do any additional setup after loading the view.
    }

    
   

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
     //  self.navigationController?.navigationBar.isHidden = true

        
        


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
                    
                    self.churchCountryArray.removeAll()
                    self.churchStateArray.removeAll()
                    self.churchDistrictNameArray.removeAll()
                    self.churchVillageNameArray.removeAll()

                    if isSuccess == true {
                        
                        if !(respVO.listResult!.isEmpty){
                            
                        let successMsg = respVO.endUserMessage

                        self.listResultArray = respVO.listResult!
                        
                        self.churchNamesString = (respVO.listResult?[0].name == nil ? "" : respVO.listResult?[0].name)!
                        self.phoneNoString = (respVO.listResult?[0].userContactNumbar == nil ? "" : respVO.listResult?[0].userContactNumbar)!
                        self.regNoString = (respVO.listResult?[0].registrationNumber == nil ? "" : respVO.listResult?[0].registrationNumber)!
                        self.emailString = (respVO.listResult?[0].email == nil ? "" : respVO.listResult?[0].email)!
                        self.nameString = (respVO.listResult?[0].pasterUser == nil ? "" : respVO.listResult?[0].pasterUser)!
                     //   self.timeString = ( (respVO.listResult?[0].openingTime)! + "-" + (respVO.listResult?[0].closingTime)!)
                        self.descriptionString = (respVO.listResult?[0].description == nil ? "" : respVO.listResult?[0].description)!
                         //  self.churchImageLogoString = (respVO.listResult?[0].churchImage)!
                            self.churchImageLogoString = (respVO.listResult?[0].churchImage == nil ? "" : respVO.listResult?[0].churchImage!.replacingOccurrences(of: "\\", with: "//"))!
                            
                            self.landMarkString = (respVO.listResult?[0].landMark == nil ? "" : respVO.listResult?[0].landMark)!
                            self.address1String = (respVO.listResult?[0].address1 == nil ? "" : respVO.listResult?[0].address1)!
                            self.address2String = (respVO.listResult?[0].address2 == nil ? "" : respVO.listResult?[0].address2)!
                            self.openTimeString = (respVO.listResult?[0].openingTime == nil ? "" : respVO.listResult?[0].openingTime)!
                            self.closeTimeString = (respVO.listResult?[0].closingTime == nil ? "" : respVO.listResult?[0].closingTime)!
                            self.contactNumberString = (respVO.listResult?[0].contactNumber == nil ? "" : respVO.listResult?[0].contactNumber)!
                            self.mandalNameString = (respVO.listResult?[0].mandalName == nil ? "" : respVO.listResult?[0].mandalName)!
                            self.timeString = self.amAppend(str: ( (respVO.listResult?[0].openingTime == nil ? "" : respVO.listResult?[0].openingTime)! + "-" + (respVO.listResult?[0].closingTime == nil ? "" : respVO.listResult?[0].closingTime)!))
                            
                            self.MissionString = (respVO.listResult?[0].mission == nil ? "" : (respVO.listResult?[0].mission)!)
                            
                            self.VissionString = (respVO.listResult?[0].vision == nil ? "" : (respVO.listResult?[0].vision)!)


                       //  self.timeArray = ("\(respVO.listResult?[0].openingTime)" + "-" + "\(respVO.listResult?[0].openingTime)")
                        
                            
                            
                       
                            for countryName in (respVO.listResult)!{
                                
                                let countryNameString = countryName.countryName
                                self.churchCountryArray.append(countryNameString!)
                                let stateNameString = countryName.stateName
                                self.churchStateArray.append(stateNameString!)
                                let districNameString = countryName.districtName
                                self.churchDistrictNameArray.append(districNameString!)
                                let VillageNameString = countryName.villageName
                                self.churchVillageNameArray.append(VillageNameString!)
                                
                               // self.churchImageLogoArray.append(countryName.churchImage == nil ? "" : countryName.churchImage!.replacingOccurrences(of: "\\", with: "//"))

                                
                            }

                            
                            print(self.churchCountryArray)
                            

                     print(self.timeString)
                    print(self.churchNamesString)
//self.appDelegate.window?.makeToast(successMsg!, duration:kToastDuration, position:CSToastPositionCenter)
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
        
        
        return 6
    }



    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if section == 0 {
            
            return 1
        }else if section == 1 {
            
     
                return 10
            
          

        }else if section == 1 {
            
            return 1
            
        }
        return 1
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        
        
        if indexPath.section == 0 {
            
            return 137
        }else if indexPath.section == 1{
            
            return 45
        }else if indexPath.section == 2{
            
            return 124
            
       }
        
        
//            else if indexPath.section == 3{
//            
//            return 124
//        }
//        else if indexPath.section == 4{
//            
//            return 124
//        }
//        else if indexPath.section == 5{
//            
//            return 124
//
//        }

        return UITableViewAutomaticDimension
    }


    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if (indexPath.section == 0) {
            
        let cell = tableView.dequeueReusableCell(withIdentifier: "HeadImgTableViewCell", for: indexPath) as! HeadImgTableViewCell
            
            if indexPath.row == 0 {

        
            cell.churchNameLabel.text = churchNamesString
            
            if(churchImageLogoArray.count >= indexPath.section){
                if let url = URL(string:churchImageLogoString) {
                    cell.churchImage.sd_setImage(with:url , placeholderImage: #imageLiteral(resourceName: "Church-logo"))
                }else{
                    cell.churchImage.image = #imageLiteral(resourceName: "Church-logo")
                }
            }
            
                return cell

            }
            

            return cell

        }
        else if (indexPath.section == 1) {
            
            let cell1 = tableView.dequeueReusableCell(withIdentifier: "InformationTableViewCell", for: indexPath) as! InformationTableViewCell

            if indexPath.row == 0 {
                
                cell1.infoLabel.text = "Country Name"
                if(churchCountryArray.count >= indexPath.section){
                    cell1.addressLabel.text = "\(churchCountryArray[indexPath.section - 1])"
                }else{
                    cell1.addressLabel.text =  " "
                }
                
            } else if indexPath.row == 1 {
                
                cell1.infoLabel.text = "State Name"
                
                if(churchCountryArray.count >= indexPath.section){
                        cell1.addressLabel.text =  "\(churchStateArray[indexPath.section - 1])"
                }else{
                         cell1.addressLabel.text =  " "
                }
           
            } else if indexPath.row == 2 {
                
                cell1.infoLabel.text = "District Name"
                if(churchCountryArray.count >= indexPath.section){
                    cell1.addressLabel.text =  "\(churchDistrictNameArray[indexPath.section - 1])"
                }else{
                     cell1.addressLabel.text =  " "
                }
                
               
            }else if indexPath.row == 3 {
                
                cell1.infoLabel.text = "Mandal Name"
                
                if(churchCountryArray.count >= indexPath.section){
                    cell1.addressLabel.text = self.mandalNameString
                }else{
                    cell1.addressLabel.text =   " "
                }
                
                
            }else if indexPath.row == 4 {
                
                cell1.infoLabel.text = "Village Name"
               
                if(churchCountryArray.count >= indexPath.section){
                    cell1.addressLabel.text = "\(churchVillageNameArray[indexPath.section - 1])"
                }else{
                    cell1.addressLabel.text =  " "
                }
                
            }else if indexPath.row == 5 {
                
                cell1.infoLabel.text = "Address 1"
                
                if(churchCountryArray.count >= indexPath.section){
                    cell1.addressLabel.text =   address1String
                }else{
                    cell1.addressLabel.text =  " "
                }
                
            }else if indexPath.row == 6 {
                
                cell1.infoLabel.text = "Address 2"
                
                if(churchCountryArray.count >= indexPath.section){
                    cell1.addressLabel.text =  address2String
                }else{
                    cell1.addressLabel.text =  " "
                }
                
            }else if indexPath.row == 7 {
                
                cell1.infoLabel.text = "LandMark"
                
                if(churchCountryArray.count >= indexPath.section){
                    cell1.addressLabel.text =  landMarkString
                }else{
                    cell1.addressLabel.text =  " "
                }
                
                
            }else if indexPath.row == 8 {
                
                cell1.infoLabel.text = "Contact Number"
                
                if(churchCountryArray.count >= indexPath.section){
                    cell1.addressLabel.text =  contactNumberString
                }else{
                    cell1.addressLabel.text = " "
                }
                
            }else {
               
                cell1.infoLabel.text = "Opening Time - Closing Time"
                
                if(churchCountryArray.count >= indexPath.section){
                    
                    cell1.addressLabel.text =  self.timeString
                }else{
                    cell1.addressLabel.text =  " "
                }
                

            }
            
            

     return cell1
        }
            
        else if (indexPath.section == 2){
            
            let cell2 = tableView.dequeueReusableCell(withIdentifier: "InfoMapTableViewCell", for: indexPath) as! InfoMapTableViewCell
            
            
        return cell2
            
        }
        
         else if (indexPath.section == 3){
            
        let cell3 = tableView.dequeueReusableCell(withIdentifier: "AboutInfoTableViewCell", for: indexPath) as! AboutInfoTableViewCell
            
            
        
           cell3.aboutLabel.text = MissionString
            
            return cell3
            
        
        }
        
        else if (indexPath.section == 4){
        
        
            let cell3 = tableView.dequeueReusableCell(withIdentifier: "AboutInfoTableViewCell", for: indexPath) as! AboutInfoTableViewCell
         
            cell3.aboutLabel.text = VissionString
            
            
            return cell3
        
        }
        
        let cell3 = tableView.dequeueReusableCell(withIdentifier: "AboutInfoTableViewCell", for: indexPath) as! AboutInfoTableViewCell
     
        cell3.aboutLabel.text = descriptionString
        
        
            

        
        return cell3
//

        
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        
        if section == 1 {
            
            let infoHeaderCell = tableView.dequeueReusableCell(withIdentifier: "InfoHeaderCell") as! InfoHeaderCell
            
            infoHeaderCell.headerLabel.text = "Address Details"
            return infoHeaderCell
            
        }else if section == 2 {
            
                let infoHeaderCell = tableView.dequeueReusableCell(withIdentifier: "InfoHeaderCell") as! InfoHeaderCell
                
                infoHeaderCell.headerLabel.text = "Map"
                return infoHeaderCell
                
        }
        else if section == 3 {
            
            let infoHeaderCell = tableView.dequeueReusableCell(withIdentifier: "InfoHeaderCell") as! InfoHeaderCell
            
            infoHeaderCell.headerLabel.text = "Mission"
            return infoHeaderCell
            
        }
        
        else if section == 4 {
            
            let infoHeaderCell = tableView.dequeueReusableCell(withIdentifier: "InfoHeaderCell") as! InfoHeaderCell
            
            infoHeaderCell.headerLabel.text = "Vision"
            return infoHeaderCell
            
        }
        else if section == 5 {
            
            let infoHeaderCell = tableView.dequeueReusableCell(withIdentifier: "InfoHeaderCell") as! InfoHeaderCell
            
            infoHeaderCell.headerLabel.text = "About"
            return infoHeaderCell
            
        }
        return nil
    }
    
    
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
        if section == 0 {
            
            return 0.0
        }
        
        return 44.0
        
    }

    func showAlertViewWithTitle(_ title:String,message:String,buttonTitle:String)
    {
        let alertView:UIAlertView = UIAlertView();
        alertView.title=title
        alertView.message=message
        alertView.addButton(withTitle: buttonTitle)
        alertView.show()
    }

    func amAppend(str:String) -> String{
        
        var newDateStr = ""
        var newDateStr1 = ""

                    if(str != ""){
                        let invDtArray = str.components(separatedBy: "-")
                        let dateString1 = invDtArray[0]
                        let dateString2 = invDtArray[1]
                        if(dateString1 != ""){

                        let dateFormatter = DateFormatter()
                        dateFormatter.dateStyle = .medium
                        dateFormatter.dateFormat = "HH:mm:ss"
                        let dateFromString = dateFormatter.date(from: dateString1)
                        dateFormatter.dateFormat = "hh:mm aa"
                        let newDateString = dateFormatter.string(from: dateFromString!)
                        newDateStr = newDateString
                        print(newDateStr)
                        }
                         if(dateString2 != ""){
                            
                            let dateFormatter = DateFormatter()
                            dateFormatter.dateStyle = .medium
                            dateFormatter.dateFormat = "HH:mm:ss"
                            let dateFromString = dateFormatter.date(from: dateString2)
                            dateFormatter.dateFormat = "hh:mm aa"
                            let newDateString = dateFormatter.string(from: dateFromString!)
                            newDateStr1 = newDateString
                            print(newDateStr1)
                        }
                    }
        return newDateStr + "-" + newDateStr1
    }
    
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
