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
    
    var datesWithEvent = ["2018-01-03", "2018-01-06", "2018-01-12", "2018-01-25"]
    var datesWithMultipleEvents = ["2018-01-08", "2018-01-16", "2018-01-20", "2018-01-28"]

    var event = ""
    var numberEvent = ["AAA", "BBB", "CCC", "DDD"]
  //  let day: Int! = self.gregorian.component(.day, from: date)

    var holidays:  [Date] = []
    let events:    [Date] = []
    let birthdays: [Date] = []

    var somedays : Array = [String]()
    var calendarEvents : [FSCalendar] = []

    
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
     
        // In loadView or viewDidLoad
//        let calendar = FSCalendar(frame: CGRect(x: 0, y: 0, width: 320, height: 300))
        calendar.dataSource = self
        calendar.delegate = self
    //    view.addSubview(calendar)
      //  self.calendar = calendar
//        
//        codedLabel.frame = CGRect(x: 100, y: 100, width: 200, height: 200)
//        codedLabel.textAlignment = .center
//       // codedLabel.text = alertText
//        codedLabel.numberOfLines=1
//        codedLabel.textColor=UIColor.red
//        self.codedLabel.text = "event"
//        codedLabel.font=UIFont.systemFont(ofSize: 22)
//        codedLabel.backgroundColor=UIColor.lightGray
//        self.view.addSubview(codedLabel)
//        
        
        color()
        
        // Do any additional setup after loading the view, typically from a nib.
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
//        if self.datesWithMultipleEvents.contains(dateString) {
//            
//            return 3
//        }
//        
//        return 0
//    }
    
 
    
    
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

   
    
//    func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
//        let dateString = self.dateFormatter2.string(from: date)
//
//        if monthPosition == .previous || monthPosition == .next {
//            calendar.setCurrentPage(date, animated: true)
//            
//            print("title date",date)
//        }
//
//        
//        
//        
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
        if(datesWithMultipleEvents.contains(selectedDateString)){
            //                let reOrderPopOverVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "DatePopUpViewController") as! DatePopUpViewController
            //               // reOrderPopOverVC.delegate = self
            //
            //                    //    reOrderPopOverVC. singleSelection =
            //                    //   var imagesArray : Array<UIImage> = Array()
            //                        self.addChildViewController(reOrderPopOverVC)
            //                        reOrderPopOverVC.view.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height)
            //                        self.view.addSubview(reOrderPopOverVC.view)
            //                        reOrderPopOverVC.didMove(toParentViewController: self)
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
    
    
//    func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
//      //  if monthPosition == .next {
//            calendar.setCurrentPage(date, animated: true)
//        
//    
//            
//            print("title date",date)
//      //  }
//    }
    // MARK: - Private functions
    
  
    
   
//    func calendar(_ calendar: FSCalendar, appearance: FSCalendarAppearance, titleSelectionColorFor date: Date) -> UIColor? {
//    
//        let dateString = self.dateFormatter2.string(from: date)
//        
//        if self.datesWithEvent.contains(dateString) {
//            return UIColor.yellow
//        }
//        
//        if self.datesWithMultipleEvents.contains(dateString) {
//            
//            return UIColor.purple
//        }
//        return nil
//    }
    // FSCalendarDataSource
//    func calendar(_ calendar: FSCalendar, imageFor date: Date) -> UIImage? {
//        
//        return UIImage(named: "\(image)")
//    }
    
 
//     func calendar(_ calendar: FSCalendar, imageFor date: Date) -> UIImage? {
//
//        if holidays.contains(date) {
//            return [01-01-2018].contains(01-01-2018) ? UIImage(named: "camera") : nil
//        } else if events.contains(date) {
//            return events.contains(date) ? UIImage(named: "ChangePassWord") : nil
//        } else if birthdays.contains(date) {
//            return birthdays.contains(date) ? UIImage(named: "jesues") : nil
//        } 
//        
//        return nil
//    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

