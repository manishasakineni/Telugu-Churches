//
//  ChurchDetailsViewController.swift
//  Telugu Churches
//
//  Created by N@n!'$ Mac on 19/02/18.
//  Copyright © 2018 Mac OS. All rights reserved.
//

import UIKit
import SDWebImage

class ChurchDetailsViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    @IBOutlet weak var churchDetailsTableView: UITableView!
    
    
    var listResultArray = Array<Any>()
    var churchNamesArray = Array<String>()
    var churchIDArray = Array<Int>()
    var villageNamesArray = Array<String>()
    var phoneNoArray = Array<String>()
    
    
    var imageArray = [UIImage(named:"7"),UIImage(named:"5"),UIImage(named:"4"),UIImage(named:"7"),UIImage(named:"5"),UIImage(named:"4"),UIImage(named:"7"),UIImage(named:"4")]
    
    var AreanamesArray = ["Kukatpally","Uppal","Ameerpet","JNTU","MGPS","PUNG","KPHP","MYP"]
    
   
    var TimingsArray = ["OPEN5AM Close5PM ","OPEN6AM Close5PM","OPEN7AM Close8PM","OPEN8AM Close5PM","OPEN9AM Close4PM","OPEN5AM Close5PM","OPEN7AM Close5PM","OPEN6AM Close5PM"]
    


    
    var PageIndex = 1
    var totalPages : Int? = 0
    var totalRecords : Int? = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.churchDetailsTableView.delegate = self
        self.churchDetailsTableView.dataSource = self

        churchDetailsTableView.register(UINib.init(nibName: "ChurchDetailsTableViewCell", bundle: nil),
                              forCellReuseIdentifier: "ChurchDetailsTableViewCell")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        
      
       getChurchDetailsAPICall()
        
       churchDetailsTableView.isHidden = true
        
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        churchDetailsTableView.isHidden = false
        
    }
    
    
//MARK: -  Church Details API Call
    
   func getChurchDetailsAPICall(){
    
    
    
      let paramsDict = [ "pasterUserId": 0,
                       "pageIndex": PageIndex,
                       "pageSize": 10,
                       "sortbyColumnName": "UpdatedDate",
                       "sortDirection": "desc",
                       "searchName": ""
                      ] as [String : Any]
    
      let dictHeaders = ["":"","":""] as NSDictionary
    
    
     serviceController.postRequest(strURL: GETALLCHURCHES as NSString, postParams: paramsDict as NSDictionary, postHeaders: dictHeaders, successHandler: { (result) in
    
       print(result)
    
       let respVO:ChurchDetailsJsonVO = Mapper().map(JSONObject: result)!
        
//        let churchID = respVO.listResult?[0].Id
//        print("churchID" ,churchID!)
//        
//        let defaults = UserDefaults.standard
//        defaults.set(churchID, forKey: kchurchID)
//        UserDefaults.standard.synchronize()
        
    
        let isSuccess = respVO.isSuccess
        print("StatusCode:\(String(describing: isSuccess))")
        
        if isSuccess == true {
            
            
            
        self.listResultArray = respVO.listResult!
            
           
            
            
        let pageCout  = (respVO.totalRecords)! / 10
            
            let remander = (respVO.totalRecords)! % 10
            
           self.totalPages = pageCout
            
            if remander != 0 {
            
            self.totalPages = self.totalPages! + 1
            
            }
            
           
            for church in respVO.listResult!{
                
                self.churchNamesArray.append(church.name!)
                self.villageNamesArray.append(church.villageName!)
                self.phoneNoArray.append(church.contactNumber!)
                self.churchIDArray.append(church.Id!)
                
            }
    
            
            print(self.churchNamesArray)
            
            
            
            self.churchDetailsTableView.reloadData()
            
            
        
        
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
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiom.pad) {
        
        return 180
        
        }
        
        else {
        
        return 140
        
        }
    }
    
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
        if indexPath.row == churchNamesArray.count - 1 {
            
            if(self.totalPages! > PageIndex){
                
                
                PageIndex = PageIndex + 1
                
                getChurchDetailsAPICall()
                
                
                
            }
        }
        
        
    
        
        
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ChurchDetailsTableViewCell", for: indexPath) as! ChurchDetailsTableViewCell
        
        cell.churchNameLbl.text = churchNamesArray[indexPath.row]
        cell.areaNameLabel.text = villageNamesArray[indexPath.row]
    
        cell.phNoLabel.text     = phoneNoArray[indexPath.row]
//        cell.churchImage.sd_setImage(with: URL(string: "http://www.pravoslavie.ru/sas/image/102063/206387.b.jpg?mtime=1434361516"), placeholderImage: UIImage(named: "5"))
        
        
        
//        cell.churchImage.image = imageArray[ indexPath.row]
//
//        cell.areaNameLabel.text = AreanamesArray[indexPath.row]
//        cell.phNoLabel.text = PhNumberArray[indexPath.row]
//        cell.timeLabel.text = TimingsArray[indexPath.row]
//x
        
        print(churchNamesArray.count)
        
        return cell
        
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
       
        let holyBibleViewController = self.storyboard?.instantiateViewController(withIdentifier: "ChurchesInformaationViewControllers") as! ChurchesInformaationViewControllers
        
        
        holyBibleViewController.churchID = churchIDArray[indexPath.row]
        
        
        
        self.navigationController?.pushViewController(holyBibleViewController, animated: true)
        
    }
}
