//
//  ChurchDetailsViewController.swift
//  Telugu Churches
//
//  Created by N@n!'$ Mac on 19/02/18.
//  Copyright © 2018 Mac OS. All rights reserved.
//

import UIKit

class ChurchDetailsViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    @IBOutlet weak var churchDetailsTableView: UITableView!
    
    
    var listResultArray = Array<Any>()
    var churchNamesArray = Array<String>()
    
    
    var imageArray = [UIImage(named:"7"),UIImage(named:"5"),UIImage(named:"4"),UIImage(named:"7"),UIImage(named:"5"),UIImage(named:"4"),UIImage(named:"7"),UIImage(named:"4")]
    
      var AreanamesArray = ["Kukatpally","Uppal","Ameerpet","JNTU","MGPS","PUNG","KPHP","MYP"]
    
    var PhNumberArray = ["9999999999","22222222222","2444444444","2323232323","3434343434","4545454545","6767676767","5858585858"]
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
        
        
    }
    
    
   func getChurchDetailsAPICall(){
    
    
    
      let paramsDict = [ "pasterUserId": 0,
                       "pageIndex": PageIndex,
                       "pageSize": 3,
                       "sortbyColumnName": "UpdatedDate",
                       "sortDirection": "desc",
                       "searchName": ""
                      ] as [String : Any]
    
      let dictHeaders = ["":"","":""] as NSDictionary
    
    
     serviceController.postRequest(strURL: GETALLCHURCHES as NSString, postParams: paramsDict as NSDictionary, postHeaders: dictHeaders, successHandler: { (result) in
    
       print(result)
    
       let respVO:ChurchDetailsJsonVO = Mapper().map(JSONObject: result)!
        
        
        let isSuccess = respVO.isSuccess
        print("StatusCode:\(String(describing: isSuccess))")
        
        if isSuccess == true {
            
            
        self.listResultArray = respVO.listResult!
            
        let pageCout  = (respVO.totalRecords)! / 3
            
            let remander = (respVO.totalRecords)! % 3
            
           self.totalPages = pageCout
            
            if remander != 0 {
            
            self.totalPages = self.totalPages! + 1
            
            }
            
           
            for churchName in respVO.listResult!{
                
                self.churchNamesArray.append(churchName.name!)
                
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
//        cell.churchImage.image = imageArray[ indexPath.row]
//
//        cell.areaNameLabel.text = AreanamesArray[indexPath.row]
//        cell.phNoLabel.text = PhNumberArray[indexPath.row]
//        cell.timeLabel.text = TimingsArray[indexPath.row]
//x
        return cell
        
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let holyBibleViewController = self.storyboard?.instantiateViewController(withIdentifier: "ChurchesInformaationViewControllers") as! ChurchesInformaationViewControllers
        self.navigationController?.pushViewController(holyBibleViewController, animated: true)
        
    }
}
