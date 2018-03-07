//
//  UpConingEventInfoViewController.swift
//  Telugu Churches
//
//  Created by praveen dole on 3/6/18.
//  Copyright © 2018 Mac OS. All rights reserved.
//

import UIKit
class UpConingEventInfoViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    
    @IBOutlet weak var upComingTableView: UITableView!
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate

    var appVersion          : String = ""
    var upComingEventinfoArray:[GetUpComingEventInfoResultVo] = Array<GetUpComingEventInfoResultVo>()

    var eventDateArray = Array<String>()
    var eventTitleArray = Array<String>()
    var eventStartDateArray = Array<String>()
    var eventEndDateArray = Array<String>()
    var eventChurchNameArray = Array<String>()
    var contactNumberArray = Array<String>()
    var registrationNumberArray = Array<String>()
    
    
    //  let day: Int! = self.gregorian.component(.day, from: date)
  
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        upComingTableView.dataSource = self
        upComingTableView.delegate = self
        
        let nibName1  = UINib(nibName: "UpComingEventCell" , bundle: nil)
        upComingTableView.register(nibName1, forCellReuseIdentifier: "UpComingEventCell")
        
        
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewDidAppear(true)
//        UserDefaults.standard.set("1", forKey: "1")
//        UserDefaults.standard.synchronize()
        Utilities.setUpComingEentInfoEventViewControllerNavBarColorInCntrWithColor(backImage: "icons8-arrows_long_left", cntr:self, titleView: nil, withText: appVersion.localize(), backTitle: appVersion.localize(), rightImage: appVersion, secondRightImage: "Up", thirdRightImage: "Up")
        upComingEventinfoArray.removeAll()
        getUpComingEventInfo()

    }
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        
        return upComingEventinfoArray.count
        
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
    
//    
//    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
//        
//        if indexPath.row == churchAdminArray.count - 1 {
//            
//            if(self.totalPages! > PageIndex){
//                
//                
//                PageIndex = PageIndex + 1
//                
//                getChurchAdminDetailsAPICall()
//                
//                
//                
//            }
//        }
//        
    
        
        
        
  //  }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let listStr:GetUpComingEventInfoResultVo = upComingEventinfoArray[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "UpComingEventCell", for: indexPath) as! UpComingEventCell
        
        
        if let chuechName =  listStr.churchName {
            cell.chuechName.text = "ChurchName:" + " " + chuechName
        }else{
            cell.chuechName.text = "ChurchName:"
        }
        
        if let eventTitle =  listStr.title {
            cell.eventTitle.text = "EventTitle:" + " " + eventTitle
        }else{
            cell.eventTitle.text = "EventTitle:"
        }
        
        if let eventStart =  listStr.startDate {
            
            cell.eventStart.text = "EventStartDate:" + " " + returnEventDateWithoutTime(selectedDateString : eventStart)
        }else{
            cell.eventStart.text = "EventStartDate:"
        }
        
        if let eventEndDate =  listStr.endDate {
            
            //amAppend(str: "\(listStr.openingTime!)" + "-" + "\(listStr.closingTime!)" )
            cell.eventEndDate.text = "EventEndDate:" + " " + returnEventDateWithoutTime(selectedDateString : eventEndDate)
        }else{
            cell.eventEndDate.text = "EventEndDate:"
        }
        if let registrationNumber = listStr.registrationNumber {
            cell.registrationNumber.text = "RegNumber:" + " " + registrationNumber
        }else{
            cell.registrationNumber.text = "RegNumber:"
        }
        
        
               
        
        //  cell.adminNameLabel.text = churchNamesArray[indexPath.row]
        
        return cell
        
    }
    

    
    func getUpComingEventInfo(){
        
        
        
        let fromDate      : Int = 10
         let fromMonth      : Int = 03
        let fromYear      : Int = 2018
        let toDate      : Int = 18
        let toMonth      : Int = 03
        let toYear      : Int = 2018

        // var year       : Int = 2018
//        var userid      : Int = 7
//        var month      : Int = 03
//        var year       : Int = 2018
//

        if(appDelegate.checkInternetConnectivity()){
        let strUrl = GETUPCOMIMGEVENTSINFO
            
            print(strUrl)
            let dictParams = [
                "fromDate": "\(fromYear)" + "-" + "\(fromMonth)" + "-" + "\(fromDate)",
                "toDate": "\(toYear)" + "-" + "\(toMonth)" + "-" + "\(toDate)",
                ] as [String : Any]
            
            print("dic params \(dictParams)")
            let dictHeaders = ["":"","":""] as NSDictionary
            
            print("dictHeader:\(dictHeaders)")
            
            
            
            
            
            
            serviceController.postRequest(strURL: strUrl as NSString, postParams: dictParams as NSDictionary, postHeaders: dictHeaders, successHandler:{(result) in
                DispatchQueue.main.async()
                    {
                          let respVO:GetUpComingEventInfo = Mapper().map(JSONObject: result)!
                        let isSuccess = respVO.isSuccess
                        print("StatusCode:\(String(describing: isSuccess))")
                        
                        if isSuccess == true {
                            
                            let successMsg = respVO.endUserMessage
                            
                            
                            for eventsList in respVO.listResult!{
                                
                               self.upComingEventinfoArray.append(eventsList)
//                                self.eventStartDateArray.append(eventsList.startDate!)
//                                self.eventEndDateArray.append(eventsList.endDate!)
//                                self.eventChurchNameArray.append(eventsList.churchName!)
//                                self.registrationNumberArray.append(eventsList.registrationNumber!)
//                                self.contactNumberArray.append(eventsList.contactNumber!)
//

                            }
                            
//                            print("self.eventDateArray,Count", self.eventDateArray.count)
//                            print("self.eventsCountsArray", self.eventsCountsArray)
//                            
                            
                            self.upComingTableView.reloadData()
                            print("upComingEventinfoArray And Count:",self.upComingEventinfoArray , self.upComingEventinfoArray.count)
                           

                            self.appDelegate.window?.makeToast(successMsg!, duration:kToastDuration, position:CSToastPositionCenter)
                            
                            
                        }

                        
                }
            }, failureHandler:  {(error) in
                
                print(error)
                
                if(error == "unAuthorized"){
                    
                    
                    
                    
                }
                
                
                
            })
            
        }
        else {
            
            appDelegate.window?.makeToast(kNetworkStatusMessage, duration:kToastDuration, position:CSToastPositionCenter)
            return
        }
    }
    
    
    
    
    
      
    @IBAction func backLeftButtonTapped(_ sender:UIButton) {
        Utilities.setUpComingEentInfoEventViewControllerNavBarColorInCntrWithColor(backImage: "", cntr:self, titleView: nil, withText: "", backTitle: "", rightImage: appVersion, secondRightImage: "Up", thirdRightImage: "Up")

        UserDefaults.standard.removeObject(forKey: kuserId)
        UserDefaults.standard.synchronize()
        self.navigationController?.popViewController(animated: true)

        //   navigationItem.leftBarButtonItems = []
//        let rootController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SWRevealViewController") as! SWRevealViewController
//        
//        appDelegate.window?.rootViewController = rootController

        print("Back Button Clicked......")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func returnEventDateWithoutTime(selectedDateString : String) -> String{
        var newDateStr = ""
        var newDateStr1 = ""
        
        if(selectedDateString != ""){
            let invDtArray = selectedDateString.components(separatedBy: "T")
            let dateString = invDtArray[0]
            let dateString1 = invDtArray[1]
            print(dateString1)
            let invDtArray2 = dateString1.components(separatedBy: ".")
            let dateString3 = invDtArray2[0]
            
            print(dateString1)
            //   let timeString = invDtArray[1]
            //  print(timeString)
            
            if(dateString != "" || dateString != "."){
                let dateFormatter = DateFormatter()
                dateFormatter.dateFormat = "yyyy-MM-dd"
                let dateFromString = dateFormatter.date(from: dateString)
                dateFormatter.dateFormat = "yyyy-MM-dd"
                let newDateString = dateFormatter.string(from: dateFromString!)
                newDateStr = newDateString
                print(newDateStr)
            }
            if(dateString3 != "" || dateString != "."){
                
                let dateFormatter = DateFormatter()
                dateFormatter.dateStyle = .medium
                dateFormatter.dateFormat = "HH:mm:ss"
                let dateFromString = dateFormatter.date(from: dateString3)
                dateFormatter.dateFormat = "hh:mm aa"
                let newDateString = dateFormatter.string(from: dateFromString!)
                newDateStr1 = newDateString
                print(newDateStr1)
            }
        }
        return newDateStr + "," + newDateStr1
    }

}
