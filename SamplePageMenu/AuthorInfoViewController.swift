//
//  AuthorInfoViewController.swift
//  Telugu Churches
//
//  Created by N@n!'$ Mac on 13/03/18.
//  Copyright © 2018 Mac OS. All rights reserved.
//

import UIKit

class AuthorInfoViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    
    @IBOutlet weak var authorInfoTableView: UITableView!
    
    var delegate: authorChangeSubtitleOfIndexDelegate?
    
    var authorDetailsArray  : [AuthorDetailsListResultVO] = Array<AuthorDetailsListResultVO>()

    
    var authorID : Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.authorInfoTableView.delegate = self
        self.authorInfoTableView.dataSource = self
        
        let nibName1  = UINib(nibName: "HeadImgTableViewCell" , bundle: nil)
        authorInfoTableView.register(nibName1, forCellReuseIdentifier: "HeadImgTableViewCell")
        let nibName2  = UINib(nibName: "InformationTableViewCell" , bundle: nil)
        authorInfoTableView.register(nibName2, forCellReuseIdentifier: "InformationTableViewCell")
        let nibName3  = UINib(nibName: "InfoMapTableViewCell" , bundle: nil)
        authorInfoTableView.register(nibName3, forCellReuseIdentifier: "InfoMapTableViewCell")
        let nibName4  = UINib(nibName: "AboutInfoTableViewCell" , bundle: nil)
        authorInfoTableView.register(nibName4, forCellReuseIdentifier: "AboutInfoTableViewCell")
        
        let nibName5  = UINib(nibName: "InfoHeaderCell" , bundle: nil)
        authorInfoTableView.register(nibName5, forCellReuseIdentifier: "InfoHeaderCell")
        
        
        
        getAuthorDetailsAPICall()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    
    func getAuthorDetailsAPICall(){
        
        
        let authorDetailsAPI = AUTHORDETAILS + String(authorID)
        
        
        serviceController.getRequest(strURL: authorDetailsAPI, success: { (result) in
            
            
            if result.count > 0 {
                
                
                print(result)
                
                let respVO:AuthorDetailsVO = Mapper().map(JSONObject: result)!
                
                
                let isSuccess = respVO.isSuccess
                if isSuccess == true {
                    
                    
                  //  let authorDetails = respVO.listResult!
                    
                    for authorDetails in respVO.listResult!{
                    
                    self.authorDetailsArray.append(authorDetails)
                    }
                    
                    print(self.authorDetailsArray)
                    
                }
                
                else{
                
                
                }
                
                
            }
            
            
        }) { (failureMassege) in
            
            
            
            
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
                
                
//                cell.churchNameLabel.text = churchNamesString
//                
//                if(churchImageLogoArray.count >= indexPath.section){
//                    if let url = URL(string:churchImageLogoString) {
//                        cell.churchImage.sd_setImage(with:url , placeholderImage: #imageLiteral(resourceName: "Church-logo"))
//                    }else{
//                        cell.churchImage.image = #imageLiteral(resourceName: "Church-logo")
//                    }
//                }
                
                return cell
                
            }
            
            
            return cell
            
        }
        else if (indexPath.section == 1) {
            
            let cell1 = tableView.dequeueReusableCell(withIdentifier: "InformationTableViewCell", for: indexPath) as! InformationTableViewCell
            
            if indexPath.row == 0 {
                
                cell1.infoLabel.text = "Registration Number"
                
               // cell1.addressLabel.text = regNoString
                
                
                
            } else if indexPath.row == 1 {
                
                cell1.infoLabel.text = "Name"
                
                
              //  cell1.addressLabel.text = churchNamesString
                
                
            } else if indexPath.row == 2 {
                
                cell1.infoLabel.text = "Description"
                
             //   cell1.addressLabel.text =  descriptionString
                
                
            }else if indexPath.row == 3 {
                
                cell1.infoLabel.text = "Vision"
                
                
              //  cell1.addressLabel.text = VissionString
                
                
            }else if indexPath.row == 4 {
                
                cell1.infoLabel.text = "Mission"
                
                
              //  cell1.addressLabel.text = MissionString
                
                
            }
            
            
            
            return cell1
        }
            
        else if (indexPath.section == 2){
            
            let cell3 = tableView.dequeueReusableCell(withIdentifier: "InformationTableViewCell", for: indexPath) as! InformationTableViewCell
            
            
            
            if indexPath.row == 0 {
                
                cell3.infoLabel.text = "Address"
                
              //  cell3.addressLabel.text = address1String
               
            } else if indexPath.row == 1 {
                
                cell3.infoLabel.text = "Email"
                
                
              //  cell3.addressLabel.text =  emailString
                
                
                
            } else if indexPath.row == 2 {
                
                cell3.infoLabel.text = "Web Address"
                
              /// cell3.addressLabel.text =  wedAddressString
                
                
                
                
            }else if indexPath.row == 3 {
                
                cell3.infoLabel.text = "LandMark"
                
                
             //   cell3.addressLabel.text = landMarkString
                
                
                
            }else if indexPath.row == 4 {
                
                cell3.infoLabel.text = "State"
                
                
              //  cell3.addressLabel.text = stateString
                
                
                
                
                
                
            }
            else if indexPath.row == 5 {
                
                cell3.infoLabel.text = "District"
                
                
              //  cell3.addressLabel.text = districtString
                
                
            }
            else if indexPath.row == 6 {
                
                cell3.infoLabel.text = "Mandal"
                
               // cell3.addressLabel.text = mandalNameString
                
            }
            else if indexPath.row == 7 {
                
                cell3.infoLabel.text = "Village"
                
              //  cell3.addressLabel.text = villageString
                
                
                
            }
            else if indexPath.row == 8 {
                
                cell3.infoLabel.text = "Pin Code"
                
              //  cell3.addressLabel.text = pinCodeString
                
            }
            
            
            
            return cell3
            
            
        }
        else if (indexPath.section == 3){
            
            let cell2 = tableView.dequeueReusableCell(withIdentifier: "InformationTableViewCell", for: indexPath) as! InformationTableViewCell
            if indexPath.row == 0 {
                
                cell2.infoLabel.text = "Author Name"
                
              //  cell2.addressLabel.text = authorNameString
                
                
            } else if indexPath.row == 1 {
                
                cell2.infoLabel.text = "Email"
                
              //  cell2.addressLabel.text =  emailString
                
                
            } else if indexPath.row == 2 {
                
                cell2.infoLabel.text = "Contact Number"
                
               // cell2.addressLabel.text =  contactNumberString
                
                
            }else if indexPath.row == 3 {
                
                cell2.infoLabel.text = "DOB"
                
              //  cell2.addressLabel.text = dobString
                
                
            }else if indexPath.row == 4 {
                
                cell2.infoLabel.text = "Gender"
                
              //  cell2.addressLabel.text = genderString
                
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
            
            infoHeaderCell.headerLabel.text = "Church Details"
            return infoHeaderCell
            
        }else if section == 2 {
            
            let infoHeaderCell = tableView.dequeueReusableCell(withIdentifier: "InfoHeaderCell") as! InfoHeaderCell
            
            infoHeaderCell.headerLabel.text = "Address"
            return infoHeaderCell
            
        }
        else if section == 3 {
            
            let infoHeaderCell = tableView.dequeueReusableCell(withIdentifier: "InfoHeaderCell") as! InfoHeaderCell
            
            infoHeaderCell.headerLabel.text = "Church Author"
            return infoHeaderCell
            
        }
            
        else if section == 4 {
            
            let infoHeaderCell = tableView.dequeueReusableCell(withIdentifier: "InfoHeaderCell") as! InfoHeaderCell
            
            infoHeaderCell.headerLabel.text = "Map"
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
    

   
}
