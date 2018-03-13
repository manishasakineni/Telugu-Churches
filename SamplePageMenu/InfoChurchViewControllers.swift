//
//  InfoChurchViewController.swift
//  Telugu Churches
//
//  Created by Manoj on 20/02/18.
//  Copyright © 2018 Mac OS. All rights reserved.
//

import UIKit
import Localize

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
    var stateString = ""
    
    var wedAddressString = ""
    var districtString = ""
    var villageString = ""
    var pinCodeString = ""
    
    var authorNameString = ""
    var dobString = ""
    var genderString = ""
    
    
    
    
    let utillites =  Utilities()
    
    var ChurchDetailsAry  = ["REG001".localize(),"Aishwarya Satish".localize(),"Church@crist.com".localize(),"1234567898".localize(),"9AM-5Pm".localize()]
    
    var ChurchInfoAry  = ["1".localize(),"REG001".localize(),"Holv Church".localize(),"LandMark".localize(),"Aishwarya Sateesh".localize(),"Contact No".localize(),"Church@gmail.com".localize()]
    
    var churchID      : Int = 0
    var churchName          : String = ""


    
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
                                self.descriptionString = (respVO.listResult?[0].description == nil ? "" : respVO.listResult?[0].description)!
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
                                
                                self.stateString = (respVO.listResult?[0].stateName == nil ? "" : (respVO.listResult?[0].stateName)!)
                                
                                
                                self.wedAddressString = (respVO.listResult?[0].websiteAddress == nil ? "" : (respVO.listResult?[0].websiteAddress)!)
                                
                                self.districtString = (respVO.listResult?[0].districtName == nil ? "" : (respVO.listResult?[0].districtName)!)
                                
                                self.villageString = (respVO.listResult?[0].villageName == nil ? "" : (respVO.listResult?[0].villageName)!)
                                
                                
                                
                                self.genderString = (respVO.listResult?[0].gender == nil ? "" : (respVO.listResult?[0].gender)!)
                                
                                
                                
                                self.authorNameString = (respVO.listResult?[0].userName == nil ? "" : (respVO.listResult?[0].userName)!)
                                
                                self.dobString = (respVO.listResult?[0].dob == nil ? "" : (respVO.listResult?[0].dob)!)
                                
                                
                                let stringgg = (respVO.listResult?[0].pinCode)
                                if stringgg != nil {
                                    self.pinCodeString = "\(stringgg!)"
                                    
                                }
                                
                                
                               
                                
                                
                                
                                
                                for countryName in (respVO.listResult)!{
                                    
                                    let countryNameString = countryName.countryName
                                    self.churchCountryArray.append(countryNameString!)
                                    let stateNameString = countryName.stateName
                                    self.churchStateArray.append(stateNameString!)
                                    let districNameString = countryName.districtName
                                    self.churchDistrictNameArray.append(districNameString!)
                                    let VillageNameString = countryName.villageName
                                    self.churchVillageNameArray.append(VillageNameString!)
                                    
                                    
                                    
                                    
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
        
        
        return 5
    }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if section == 0 {
            
            return 1
        }else if section == 1 {
            
            
            return 5
            
            
            
        }else if section == 2 {
            
            return 9
            
        }
        else if section == 3 {
            
            return 5
            
        }
        return 1
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        
        
        if indexPath.section == 0 {
            
            return 124
        }else if indexPath.section == 1{
            
            return UITableViewAutomaticDimension
        }
            
        else if indexPath.section == 2{
            
            return UITableViewAutomaticDimension
            
        }
            
            
        else if indexPath.section == 3{
            
            return UITableViewAutomaticDimension
        }
        else if indexPath.section == 4{
            
            return 150
        }
        
        
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
                
                cell1.infoLabel.text = "Registration Number".localize()
                
                cell1.addressLabel.text = regNoString
                
                
                
            } else if indexPath.row == 1 {
                
                cell1.infoLabel.text = "Name".localize()
                
                
                cell1.addressLabel.text = churchNamesString
               
            
            } else if indexPath.row == 2 {
                
                cell1.infoLabel.text = "Description".localize()
                
                cell1.addressLabel.text =  descriptionString
                
                
            }else if indexPath.row == 3 {
                
                cell1.infoLabel.text = "Vision".localize()
                
                
                cell1.addressLabel.text = VissionString
                
                
            }else if indexPath.row == 4 {
                
                cell1.infoLabel.text = "Mission".localize()
                
                
                cell1.addressLabel.text = MissionString
                
               
            }
            
            
            
            return cell1
        }
            
        else if (indexPath.section == 2){
            
            let cell3 = tableView.dequeueReusableCell(withIdentifier: "InformationTableViewCell", for: indexPath) as! InformationTableViewCell
            
            
            
            if indexPath.row == 0 {
                
                cell3.infoLabel.text = "Address".localize()
                
                cell3.addressLabel.text = address1String
                //
            } else if indexPath.row == 1 {
                
                cell3.infoLabel.text = "Email".localize()
                
                
                cell3.addressLabel.text =  emailString
                
                
                
            } else if indexPath.row == 2 {
                
                cell3.infoLabel.text = "Web Address".localize()
                
                cell3.addressLabel.text =  wedAddressString
                
                
                
                
            }else if indexPath.row == 3 {
                
                cell3.infoLabel.text = "Landmark".localize()
                
                
                cell3.addressLabel.text = landMarkString
                
                
                
            }else if indexPath.row == 4 {
                
                cell3.infoLabel.text = "State".localize()
                
                
                cell3.addressLabel.text = stateString
                
                
                
                
                
                
            }
            else if indexPath.row == 5 {
                
                cell3.infoLabel.text = "District".localize()
                
                
                cell3.addressLabel.text = districtString
                
                
            }
            else if indexPath.row == 6 {
                
                cell3.infoLabel.text = "Mandal".localize()
                
                cell3.addressLabel.text = mandalNameString
                
            }
            else if indexPath.row == 7 {
                
                cell3.infoLabel.text = "Village".localize()
                
                cell3.addressLabel.text = villageString
                
                
                
            }
            else if indexPath.row == 8 {
                
                cell3.infoLabel.text = "Pin Code".localize()
                
                cell3.addressLabel.text = pinCodeString
                
            }
            
            
            
            return cell3
            
            
        }
        else if (indexPath.section == 3){
            
            let cell2 = tableView.dequeueReusableCell(withIdentifier: "InformationTableViewCell", for: indexPath) as! InformationTableViewCell
            if indexPath.row == 0 {
                
                cell2.infoLabel.text = "Author Name".localize()
                
                cell2.addressLabel.text = authorNameString
                
                
            } else if indexPath.row == 1 {
                
                cell2.infoLabel.text = "Email".localize()
                
                cell2.addressLabel.text =  emailString
                
                
            } else if indexPath.row == 2 {
                
                cell2.infoLabel.text = "Contact Number".localize()
                
                cell2.addressLabel.text =  contactNumberString
                
                
            }else if indexPath.row == 3 {
                
                cell2.infoLabel.text = "Date Of Birth".localize()
                
                cell2.addressLabel.text = dobString
                
                
            }else if indexPath.row == 4 {
                
                cell2.infoLabel.text = "Gender".localize()
                
                cell2.addressLabel.text = genderString
                
            }
            
            
            return cell2
            
        }
            
            
            
        else if (indexPath.section == 4){
            
            
            
            
            let cell3 = tableView.dequeueReusableCell(withIdentifier: "InfoMapTableViewCell", for: indexPath) as! InfoMapTableViewCell
            
            //  cell3.aboutLabel.text = VissionString
            
            
            return cell3
            
        }
        
        let cell3 = tableView.dequeueReusableCell(withIdentifier: "AboutInfoTableViewCell", for: indexPath) as! AboutInfoTableViewCell
        
        //    cell3.aboutLabel.text = descriptionString
        
        
        
        
        
        return cell3
        
        
        
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        
        if section == 1 {
            
            let infoHeaderCell = tableView.dequeueReusableCell(withIdentifier: "InfoHeaderCell") as! InfoHeaderCell
            
            infoHeaderCell.headerLabel.text = "Churche Details".localize()
            return infoHeaderCell
            
        }else if section == 2 {
            
            let infoHeaderCell = tableView.dequeueReusableCell(withIdentifier: "InfoHeaderCell") as! InfoHeaderCell
            
            infoHeaderCell.headerLabel.text = "Address".localize()
            return infoHeaderCell
            
        }
        else if section == 3 {
            
            let infoHeaderCell = tableView.dequeueReusableCell(withIdentifier: "InfoHeaderCell") as! InfoHeaderCell
            
            infoHeaderCell.headerLabel.text = "Church Author".localize()
            return infoHeaderCell
            
        }
            
        else if section == 4 {
            
            let infoHeaderCell = tableView.dequeueReusableCell(withIdentifier: "InfoHeaderCell") as! InfoHeaderCell
            
            infoHeaderCell.headerLabel.text = "Map".localize()
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
