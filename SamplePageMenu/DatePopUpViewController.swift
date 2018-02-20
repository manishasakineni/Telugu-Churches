//
//  DatePopUpViewController.swift
//  CustomCalender
//
//  Created by praveen dole on 2/16/18.
//  Copyright © 2018 praveen dole. All rights reserved.
//

import UIKit

class DatePopUpViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    
    @IBOutlet weak var datePopUpTableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        datePopUpTableView.delegate = self
        datePopUpTableView.dataSource = self
        
        let nibName1  = UINib(nibName: "EventInformationCell" , bundle: nil)
        datePopUpTableView.register(nibName1, forCellReuseIdentifier: "EventInformationCell")
        datePopUpTableView.register(UINib.init(nibName: "EventHeaderCell", bundle: nil),
                                          forCellReuseIdentifier: "EventHeaderCell")

        
        self.view.backgroundColor = UIColor.black.withAlphaComponent(0.4)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        
        if section == 0{
            
            return 3

        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat{
        
        return UITableViewAutomaticDimension
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return UITableViewAutomaticDimension
    }
  
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let eventHeaderCell = tableView.dequeueReusableCell(withIdentifier: "EventHeaderCell") as! EventHeaderCell
        
       
        
        return eventHeaderCell
        
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
        return 44.0
        
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        
       // if indexPath.section == 0 {
            
            let allOffersCell = tableView.dequeueReusableCell(withIdentifier: "EventInformationCell", for: indexPath) as! EventInformationCell
            
            return allOffersCell
       // }
       
    }
    
    
    
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        
//        
//        self.player.load(withVideoId: self.videoIDArray[1],playerVars: playerVars)
//        
//        
//    }
//    
    
   

}
