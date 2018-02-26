//
//  ViewController.swift
//  CustomCalender
//
//  Created by praveen dole on 2/15/18.
//  Copyright © 2018 praveen dole. All rights reserved.
//

import UIKit
import FSCalendar


class EventViewController: UIViewController,FSCalendarDelegate,FSCalendarDataSource,FSCalendarDelegateAppearance {

    @IBOutlet weak var calendar: FSCalendar!
    
    var appVersion          : String = ""
    let appDelegate = UIApplication.shared.delegate as! AppDelegate

    
    var eventDateArray = Array<String>()
    var eventsCountsArray = Array<Int>()
    var eventTitleArray = Array<String>()
    var eventStartDateArray = Array<String>()
    var eventEndDateArray = Array<String>()

    
   // var febDatesWithEvent = ["2018-02-03", "2018-02-06", "2018-02-12", "2018-02-25"]
    var datesWithMultipleEvents = ["2018-01-08", "2018-01-16", "2018-01-20", "2018-01-28"]

    var feb = ""

    var numberEvent = ["AAA", "BBB", "CCC", "DDD"]
    var febEvent = ["Steve", "Jobs", "Pall", "Iphone"]
 var selectedDateString = ""

    var holidays:  [Date] = []
    let events:    [Date] = []
    let birthdays: [Date] = []

    var somedays : Array = [String]()
    var calendarEvents : [FSCalendar] = []


    fileprivate let gregorian: Calendar = Calendar(identifier: .gregorian)
    fileprivate lazy var dateFormatter1: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        formatter.timeZone = TimeZone(abbreviation: "GMT+0:00") //Current time zone

        return formatter
    }()
    
    
    fileprivate lazy var dateFormatter2: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        formatter.timeZone = TimeZone(abbreviation: "GMT+0:00") //Current time zone

        return formatter
    }()
    let codedLabel:UILabel = UILabel()

    
    override func viewDidLoad() {
        super.viewDidLoad()

       // event = "\(eventsCountsArray.count)"
     
        // In loadView or viewDidLoad
        calendar.dataSource = self
        calendar.delegate = self
        
        color()
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
 
    override func viewWillAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        
        Utilities.setEventViewControllerNavBarColorInCntrWithColor(backImage: "icons8-arrows_long_left", cntr:self, titleView: nil, withText: "Events".localize(), backTitle: "Events".localize(), rightImage: appVersion, secondRightImage: "Up", thirdRightImage: "Up")
        
        
        getEventByUserIdMonthYearAPIService()
        
    }

    func color(){
        
        
      //  calendar.scope = .week
        calendar.scope = .month
        calendar.appearance.weekdayTextColor = UIColor.red
        calendar.appearance.headerTitleColor = UIColor.red
       // calendar.appearance.eventColor = UIColor.green
        calendar.appearance.selectionColor = UIColor.lightGray
        calendar.appearance.todayColor = UIColor.orange
        calendar.appearance.todaySelectionColor = UIColor.black

        calendar.allowsMultipleSelection = true
        calendar.firstWeekday = 2
        
       // calendar.appearance.borderRadius = 0

    }
    
    
//    func calendar(_ calendar: FSCalendar, numberOfEventsFor date: Date) -> Int {
//        
//        let dateString = self.dateFormatter2.string(from: date)
//
//        if self.datesWithEvent.contains(dateString) {
//            return 1
//        }
//        
//        if self.eventDateArray.contains(dateString) {
//            
//            return 3
//        }
//        
//        return 0
//    }
//    
 
    
    
    
    
    
    func calendar(_ calendar: FSCalendar, subtitleFor date: Date) -> String? {
        
        let dateString = self.dateFormatter2.string(from: date)
        
        
        if self.eventDateArray.contains(dateString) {
            
            var event = ""
            
            if let i = self.eventDateArray.index(of: dateString) {
                                                        print("Jason is at index \(i)")
                                                        let prevEventCount = self.eventsCountsArray[i]
                                                         event = "\(prevEventCount)"
                
                                                    }
            
            
//            for eventcount in eventsCountsArray{
//            
//                event = "\(eventcount)"
//                print(event)
//                
//            }
            return event
        }
        return nil
    }

    
//    func calendar(_ calendar: FSCalendar!, imageFor date: Date!) -> UIImage! {
//        
//        let imageeee = UIImage(named: "5")
//    
//        return imageeee
//    
//    }
   func calendar(_ calendar: FSCalendar, boundingRectWillChange bounds: CGRect, animated: Bool) {
       // calendar.snp.updateConstraints { (make) in
        //    make.height.equalTo(bounds.height)
            // Do other updates

      //  }
        self.view.layoutIfNeeded()
    }
    
    
    func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
    print("did select date \(self.dateFormatter2.string(from: date))")
     let selectedDateString = self.dateFormatter2.string(from: date)
       
    //    if(datesWithMultipleEvents.contains(selectedDateString)){

        if(eventDateArray.contains(selectedDateString)){
            
            if(appDelegate.checkInternetConnectivity()){
                
                var userid      : Int = 3
                // var month      : Int = 02
                // var year       : Int = 2018
                
                let strUrl = GETEVENTBYDATEANDUSERID + "" + "\(selectedDateString)" + "/" + "\(userid)"
                
                print(strUrl)
                serviceController.getRequest(strURL:strUrl, success:{(result) in
                    DispatchQueue.main.async()
                        {
                            
                            //  let respVO:LoginVo = Mapper().map(JSONObject: result)!
                            
                            print("result:\(result)")
                            
                            
                           let respVO:GetEventByDateAndUserIdVo = Mapper().map(JSONObject: result)!
                            
                            
                            let isSuccess = respVO.isSuccess
                            print("StatusCode:\(String(describing: isSuccess))")
                            
                            self.eventTitleArray.removeAll()
                            self.eventStartDateArray.removeAll()
                            self.eventEndDateArray.removeAll()

                            if isSuccess == true {
                                
                                let successMsg = respVO.endUserMessage
                                

                                
                                for eventsTitleList in respVO.listResult!{
                                    
                                    let eventTitle = eventsTitleList.eventTitle
                                    self.eventTitleArray.append(eventTitle!)
                                    
                                    let eventStartDate = eventsTitleList.startDate
                                    self.eventStartDateArray.append(eventStartDate!)
                                    
                                    let eventEndDate = eventsTitleList.endDate
                                    self.eventEndDateArray.append(eventEndDate!)

                                    print( self.eventEndDateArray)

                                    }
                                
                                print(self.eventTitleArray)
                                print(self.eventStartDateArray)
                                print( self.eventEndDateArray)


                            
                    let reOrderPopOverVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "DatePopUpViewController") as! DatePopUpViewController
                                
                                var params : Dictionary = Dictionary<String,Any>()
                                params.updateValue(self.eventTitleArray, forKey: selectedDateString)
                                params.updateValue(self.eventStartDateArray, forKey: selectedDateString)
                                params.updateValue(self.eventEndDateArray, forKey: selectedDateString)

                                print(params)
                                
                        reOrderPopOverVC.eventsLisrArray = self.eventTitleArray
                        reOrderPopOverVC.eventStartDateLisrArray = self.eventStartDateArray
                        reOrderPopOverVC.eventEndDateLisrArray = self.eventEndDateArray

                                
                                
                        reOrderPopOverVC.eventsDateString = selectedDateString
                        // reOrderPopOverVC.delegate = self
                        self.addChildViewController(reOrderPopOverVC)
                        reOrderPopOverVC.view.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height)
                        self.view.addSubview(reOrderPopOverVC.view)
                        reOrderPopOverVC.didMove(toParentViewController: self)
                                
                        self.calendar.reloadData()
                                
                            //    self.appDelegate.window?.makeToast(successMsg!, duration:kToastDuration, position:CSToastPositionCenter)

                            
                            }
                            
                            

                            
                    }
                }, failure:  {(error) in
                    
                    print(error)
                    
                    if(error == "unAuthorized"){
                        
                        
                        
                        
                    }
                    
                    
                    
                })
                
            }
            else {
                
                appDelegate.window?.makeToast(kNetworkStatusMessage, duration:kToastDuration, position:CSToastPositionCenter)
                return
            }


            
            print(numberEvent)
        }
        

        
    }
    
    func calendar(_ calendar: FSCalendar, didDeselect date: Date) {
        print("did deselect date \(self.dateFormatter2.string(from: date))")
        self.configureVisibleCells()
    }
    func calendar(_ calendar: FSCalendar, appearance: FSCalendarAppearance, eventDefaultColorsFor date: Date) -> [UIColor]? {
        if self.gregorian.isDateInToday(date) {
            return [UIColor.orange]
        }
        return [appearance.eventDefaultColor]
    }
    
    // MARK: - Private functions
    
    private func configureVisibleCells() {
        calendar.visibleCells().forEach { (cell) in
            let date = calendar.date(for: cell)
            let position = calendar.monthPosition(for: cell)
           // self.configure(cell: cell, for: date!, at: position)
        }
    }
    
    
    func getEventByUserIdMonthYearAPIService(){
        
        if(appDelegate.checkInternetConnectivity()){
            
            var userid      : Int = 3
            var month      : Int = 02
            var year       : Int = 2018
            
            let strUrl = GETEVENTBYUSERIDMONTHYEAR + "" + "\(userid)" + "/" + "\(month)" + "/" + "\(year)"
            
            print(strUrl)
            serviceController.getRequest(strURL:strUrl, success:{(result) in
                DispatchQueue.main.async()
                    {
                        
                        //  let respVO:LoginVo = Mapper().map(JSONObject: result)!
                        
                        print("result:\(result)")
                        
                        let respVO:GetEventByUserIdMonthYearVo = Mapper().map(JSONObject: result)!
                        
                        let isSuccess = respVO.isSuccess
                        print("StatusCode:\(String(describing: isSuccess))")
                        
                        if isSuccess == true {
                            
                            let successMsg = respVO.endUserMessage
                            

                        for eventsList in respVO.listResult!{
                            
                            let dateString = self.returnDateWithoutTime(selectedDateString: eventsList.eventDate!)
                            self.eventDateArray.append(dateString)
                            let eventsCountsString = eventsList.eventsCount
                            self.eventsCountsArray.append(eventsCountsString!)
                        }

                        print("self.eventDateArray,Count", self.eventDateArray.count)
                        print("self.eventsCountsArray", self.eventsCountsArray)
                        
                     
                        self.calendar.reloadData()
                        
                            
                            self.appDelegate.window?.makeToast(successMsg!, duration:kToastDuration, position:CSToastPositionCenter)

                            
                        }
                        
                        
                }
            }, failure:  {(error) in
                
                print(error)
                
                if(error == "unAuthorized"){
                    
                    
                  //  self.showAlertViewWithTitle("Alert".localize(), message: error, buttonTitle: "Ok".localize())
                    
                    
                }
                
                
                
            })
            
        }
        else {
            
            appDelegate.window?.makeToast(kNetworkStatusMessage, duration:kToastDuration, position:CSToastPositionCenter)
            return
        }
        
    }
   
    
    func returnDateWithoutTime(selectedDateString : String) -> String{
        var newDateStr = ""
        if(selectedDateString != ""){
            let invDtArray = selectedDateString.components(separatedBy: "T")
            let dateString = invDtArray[0]
         //   let timeString = invDtArray[1]
          //  print(timeString)

            if(dateString != ""){
                let dateFormatter = DateFormatter()
                dateFormatter.dateFormat = "yyyy-MM-dd"
                let dateFromString = dateFormatter.date(from: dateString)
                dateFormatter.dateFormat = "yyyy-MM-dd"
                let newDateString = dateFormatter.string(from: dateFromString!)
                newDateStr = newDateString
                print(newDateStr)
            }
//            if(timeString != ""){
//                let dateFormatter = DateFormatter()
//                dateFormatter.dateStyle = .medium
//                dateFormatter.dateFormat = "HH:mm:ss"
//                let dateFromString = dateFormatter.date(from: timeString)
//                dateFormatter.dateFormat = "hh:mm aa"
//                let newDateString = dateFormatter.string(from: dateFromString!)
//                newDateStr = newDateString
//                print(newDateStr)
//            }
        }
        return newDateStr
    }
    
    @IBAction func backLeftButtonTapped(_ sender:UIButton) {
        UserDefaults.standard.removeObject(forKey: "1")
        UserDefaults.standard.removeObject(forKey: kLoginSucessStatus)
        UserDefaults.standard.synchronize()
        let rootController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SWRevealViewController") as! SWRevealViewController
        appDelegate.window?.rootViewController = rootController
        print("Back Button Clicked......")
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

