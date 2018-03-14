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
        
        authorInfoTableView.isHidden = true
        
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
                
                self.authorInfoTableView.isHidden = false
                print(result)
                
                let respVO:AuthorDetailsVO = Mapper().map(JSONObject: result)!
                
                
                let isSuccess = respVO.isSuccess
                if isSuccess == true {
                    
                  self.authorDetailsArray = respVO.listResult!
                
                }
                
                self.authorInfoTableView.reloadData()
            }
            
            
        }) { (failureMassege) in
            
            
            
            
        }
        
        
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if section == 0 {
            
            return 1
        }
        
        else if section == 1 {
            
            
            return 5
            
            
            
        }else if section == 2 {
            
            return 8
            
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
            
       
        
        
        return UITableViewAutomaticDimension
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if(authorDetailsArray.count > 0){
            let authorDetails:AuthorDetailsListResultVO = authorDetailsArray[0]
            
            if (indexPath.section == 0) {
                
                let cell = tableView.dequeueReusableCell(withIdentifier: "HeadImgTableViewCell", for: indexPath) as! HeadImgTableViewCell
                
                
                
                var churchImageLogoString = authorDetails.churchImage
                
                 churchImageLogoString = churchImageLogoString?.replacingOccurrences(of: "\\", with: "//", options: .backwards, range: nil)
         
                if(authorDetailsArray.count >= indexPath.section){
                    
                    cell.churchNameLabel.text = authorDetails.churchName
                    
                    if let url = URL(string:churchImageLogoString!) {
                        
                            cell.churchImage.sd_setImage(with:url , placeholderImage: #imageLiteral(resourceName: "Church-logo"))
                      }
                    else {
                        
                            cell.churchImage.image = #imageLiteral(resourceName: "Church-logo")
                        }
                                    
                    
                    return cell
                    
                }
                
                
                return cell
                
            }
                
                
            else if (indexPath.section == 1){
                
                
                
                let cell2 = tableView.dequeueReusableCell(withIdentifier: "InformationTableViewCell", for: indexPath) as! InformationTableViewCell
                if indexPath.row == 0 {
                    
                    
                    
                    cell2.infoLabel.text = "Author Name"
                    
                    cell2.addressLabel.text = authorDetails.authorName
                    
                    
                    
                } else if indexPath.row == 1 {
                    
                    cell2.infoLabel.text = "Email"
                    
                    cell2.addressLabel.text =  authorDetails.authorEmail
                    
                    
                } else if indexPath.row == 2 {
                    
                    cell2.infoLabel.text = "Contact Number"
                    
                    cell2.addressLabel.text =  authorDetails.authorContactNumbar
                    
                    
                }else if indexPath.row == 3 {
                    
                    cell2.infoLabel.text = "DOB"
                    
                    cell2.addressLabel.text = authorDetails.dob
                    
                    
                }else if indexPath.row == 4 {
                    
                    cell2.infoLabel.text = "Gender"
                    
                    cell2.addressLabel.text = authorDetails.gender
                    
                }
                
                
                return cell2
                
            }
                
                
            else if (indexPath.section == 2){
                
                let cell3 = tableView.dequeueReusableCell(withIdentifier: "InformationTableViewCell", for: indexPath) as! InformationTableViewCell
                
                
                
                if indexPath.row == 0 {
                    
                    cell3.infoLabel.text = "Church Name"
                    
                    cell3.addressLabel.text = authorDetails.churchName
                    
                } else if indexPath.row == 1 {
                    
                    cell3.infoLabel.text = "Church Registration Number"
                    
                    
                    cell3.addressLabel.text =  authorDetails.registrationNumber
                    
                    
                    
                } else if indexPath.row == 2 {
                    
                    cell3.infoLabel.text = "State"
                    
                    cell3.addressLabel.text =  authorDetails.stateName
                    
                    
                    
                    
                }else if indexPath.row == 3 {
                    
                    cell3.infoLabel.text = "District"
                    
                    
                    cell3.addressLabel.text = authorDetails.districtName
                    
                    
                    
                }else if indexPath.row == 4 {
                    
                    cell3.infoLabel.text = "Mandal"
                    
                    
                    cell3.addressLabel.text = authorDetails.mandalName
                    
                    
                    
                }
                else if indexPath.row == 5 {
                    
                    cell3.infoLabel.text = "Village"
                    
                    
                    cell3.addressLabel.text = authorDetails.villageName
                    
                    
                    
                }
                else if indexPath.row == 6 {
                    
                    cell3.infoLabel.text = "Pin Code"
                    
                    
                    cell3.addressLabel.text = String(describing: authorDetails.pinCode!)
                    
                    
                    
                }
                else if indexPath.row == 7 {
                    
                    cell3.infoLabel.text = "Country"
                    
                    
                    cell3.addressLabel.text = authorDetails.countryName
                    
                    
                    
                }
                
                
                return cell3
                
                
            }
            
            
            
            let cell3 = tableView.dequeueReusableCell(withIdentifier: "AboutInfoTableViewCell", for: indexPath) as! AboutInfoTableViewCell
            
            //    cell3.aboutLabel.text = descriptionString
            
            
            
            
            
            return cell3
            

        }
        return UITableViewCell()
        
        
        
    }

    
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        
        let infoHeaderCell = tableView.dequeueReusableCell(withIdentifier: "InfoHeaderCell") as! InfoHeaderCell
        
        if section == 1 {
            
           
            infoHeaderCell.subscribeBtn.isHidden = false
            infoHeaderCell.headerLabel.text = "Author Details"
            infoHeaderCell.subscribeBtn.addTarget(self, action: #selector(subscribeBtnClicked), for: .touchUpInside)
            return infoHeaderCell
            
        }else if section == 2 {
            
            
            infoHeaderCell.subscribeBtn.isHidden = true
            infoHeaderCell.headerLabel.text = "Church Details"
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
    

    func subscribeBtnClicked(sender: UIButton){
    
    
    print("--->>subscribeBtnClicked")
    
    
    
    
    }
   
}
