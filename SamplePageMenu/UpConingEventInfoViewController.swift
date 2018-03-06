//
//  UpConingEventInfoViewController.swift
//  Telugu Churches
//
//  Created by praveen dole on 3/6/18.
//  Copyright © 2018 Mac OS. All rights reserved.
//

import UIKit
import FSCalendar
class UpConingEventInfoViewController: UIViewController,FSCalendarDelegate,FSCalendarDataSource,FSCalendarDelegateAppearance {
    
    
    
    @IBOutlet weak var upComingCalender: FSCalendar!
    let appDelegate = UIApplication.shared.delegate as! AppDelegate

    var calendarEvents : [FSCalendar] = []
    var febDatesWithEvent = ["2018-03-03", "2018-03-06", "2018-03-12", "2018-03-25"]
    var datesWithMultipleEvents = ["2018-03-08", "2018-03-16", "2018-03-20", "2018-03-28","2018-04-07", "2018-04-08", "2018-04-14", "2018-024-01", "2018-04-12", "2018-04-25"]
    
    var event = ""
    var feb = ""
    var appVersion          : String = ""

    var eventDateArray = Array<String>()
    var eventTitleArray = Array<String>()
    var eventStartDateArray = Array<String>()
    var eventEndDateArray = Array<String>()
    var eventChurchNameArray = Array<String>()
    var contactNumberArray = Array<String>()
    var registrationNumberArray = Array<String>()
    var numberEvent = ["AAA", "BBB", "CCC", "DDD"]
    var febEvent = ["Steve", "Jobs", "Pall", "Iphone"]
    
    //  let day: Int! = self.gregorian.component(.day, from: date)
    
    var holidays:  [Date] = []
    let events:    [Date] = []
    let birthdays: [Date] = []
    
    var somedays : Array = [String]()
   // var upComingCalender : [FSCalendar] = []
    
    
    //    fileprivate lazy var dateFormatter2: DateFormatter = {
    //        let formatter = DateFormatter()
    //        formatter.dateFormat = "yyyy-MM-dd"
    //        return formatter
    //    }()
    //
    
    
    fileprivate let gregorian: Calendar = Calendar(identifier: .gregorian)
    fileprivate lazy var dateFormatter1: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        return formatter
    }()
    
    
    fileprivate lazy var dateFormatter2: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        return formatter
    }()
    let codedLabel:UILabel = UILabel()
    
    
    //    let listArray = "aaaaa"
    override func viewDidLoad() {
        super.viewDidLoad()
        
        event = "\(numberEvent.count)"
        
        
        upComingCalender.dataSource = self
        upComingCalender.delegate = self
        
        
        
        color()
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewDidAppear(true)
//        UserDefaults.standard.set("1", forKey: "1")
//        UserDefaults.standard.synchronize()
        Utilities.setUpComingEentInfoEventViewControllerNavBarColorInCntrWithColor(backImage: "icons8-arrows_long_left", cntr:self, titleView: nil, withText: appVersion.localize(), backTitle: appVersion.localize(), rightImage: appVersion, secondRightImage: "Up", thirdRightImage: "Up")

        getUpComingEventInfo()

    }
  
    func color(){
        
        
        //  upComingCalender.scope = .week
        upComingCalender.scope = .month
        upComingCalender.appearance.weekdayTextColor = UIColor.red
        upComingCalender.appearance.headerTitleColor = UIColor.red
        // upComingCalender.appearance.eventColor = UIColor.green
        upComingCalender.appearance.selectionColor = UIColor.lightGray
        upComingCalender.appearance.todayColor = UIColor.orange
        upComingCalender.appearance.todaySelectionColor = UIColor.black
        
        upComingCalender.allowsMultipleSelection = true
        upComingCalender.firstWeekday = 2
        
        // calendar.appearance.borderRadius = 0
        
    }
    
    
    func getUpComingEventInfo(){
        if(appDelegate.checkInternetConnectivity()){
        let strUrl = GETUPCOMIMGEVENTSINFO
            
            print(strUrl)
            serviceController.getRequest(strURL:strUrl, success:{(result) in
                DispatchQueue.main.async()
                    {
                        
                          let respVO:GetUpComingEventInfo = Mapper().map(JSONObject: result)!
                        let isSuccess = respVO.isSuccess
                        print("StatusCode:\(String(describing: isSuccess))")
                        
                        if isSuccess == true {
                            
                            let successMsg = respVO.endUserMessage
                            
                            
                            for eventsList in respVO.listResult!{
                                
                                self.eventTitleArray.append(eventsList.title!)
                                self.eventStartDateArray.append(eventsList.startDate!)
                                self.eventEndDateArray.append(eventsList.endDate!)
                                self.eventChurchNameArray.append(eventsList.churchName!)
                                self.registrationNumberArray.append(eventsList.registrationNumber!)
                                self.contactNumberArray.append(eventsList.contactNumber!)

//                                let dateString = self.returnDateWithoutTime(selectedDateString: eventsList.eventDate!)
//                                self.eventDateArray.append(dateString)
//                                let eventsCountsString = eventsList.eventsCount
//                                self.eventsCountsArray.append(eventsCountsString!)
                            }
                            
//                            print("self.eventDateArray,Count", self.eventDateArray.count)
//                            print("self.eventsCountsArray", self.eventsCountsArray)
//                            
                            
                            self.upComingCalender.reloadData()
                            
                            
                            self.appDelegate.window?.makeToast(successMsg!, duration:kToastDuration, position:CSToastPositionCenter)
                            
                            
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
    }
    func calendar(_ calendar: FSCalendar, subtitleFor date: Date) -> String? {
        
        let dateString = self.dateFormatter2.string(from: date)
        
        
        //        if self.datesWithEvent.contains(dateString) {
        //            return "Event"
        //        }
        
        if self.datesWithMultipleEvents.contains(dateString) {
            
            return self.event
        }
        return nil
    }
    
    
    
    func calendar(_ calendar: FSCalendar, boundingRectWillChange bounds: CGRect, animated: Bool) {
        // calendar.snp.updateConstraints { (make) in
        //    make.height.equalTo(bounds.height)
        // Do other updates
        
        //  }
        self.view.layoutIfNeeded()
    }
    
    
//    func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
//        print("did select date \(self.dateFormatter2.string(from: date))")
//        let selectedDateString = self.dateFormatter2.string(from: date)
//        if(datesWithMultipleEvents.contains(selectedDateString)){
//            let reOrderPopOverVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "DatePopUpViewController") as! DatePopUpViewController
//            reOrderPopOverVC.eventsLisrArray = self.numberEvent
//            reOrderPopOverVC.eventsDateString = selectedDateString
//            // reOrderPopOverVC.delegate = self
//            
//            //    reOrderPopOverVC. singleSelection =
//            //   var imagesArray : Array<UIImage> = Array()
//            self.addChildViewController(reOrderPopOverVC)
//            reOrderPopOverVC.view.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height)
//            self.view.addSubview(reOrderPopOverVC.view)
//            reOrderPopOverVC.didMove(toParentViewController: self)
//            
//            print(numberEvent)
//        }
//        
//        
//        
//    }
    
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
        upComingCalender.visibleCells().forEach { (cell) in
            let date = upComingCalender.date(for: cell)
            let position = upComingCalender.monthPosition(for: cell)
            // self.configure(cell: cell, for: date!, at: position)
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
    
}
