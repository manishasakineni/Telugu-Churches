//
//  InfoChurchViewController.swift
//  Telugu Churches
//
//  Created by Manoj on 20/02/18.
//  Copyright © 2018 Mac OS. All rights reserved.
//

import UIKit

class InfoChurchViewControllers: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    
    @IBOutlet weak var infoChurchView: UIView!
    
    @IBOutlet weak var infoChurchTableView: UITableView!
    
    var delegate: churchChangeSubtitleOfIndexDelegate?


    var ChurchDetailsAry  = ["REG001".localize(),"Aishwarya Satish".localize(),"Church@crist.com".localize(),"1234567898".localize(),"9AM-5Pm".localize()]
    
    var ChurchInfoAry  = ["1".localize(),"REG001".localize(),"Holv Church".localize(),"LandMark".localize(),"Aishwarya Sateesh".localize(),"Contact No".localize(),"Church@gmail.com".localize()]
    

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        infoChurchTableView.delegate = self
        infoChurchTableView.dataSource = self
        
//        infoChurchView.layer.cornerRadius = 6.0
//        
//        infoChurchView.layer.borderWidth = 1
//        infoChurchView.layer.borderColor = UIColor(red: 122.0/255.0, green: 186.0/255.0, blue: 208.0/255.0, alpha: 1.0).cgColor
//        
        infoChurchTableView.register(UINib.init(nibName: "HeadImgTableViewCell", bundle: nil),
                                     forCellReuseIdentifier: "HeadImgTableViewCell")
        

        
        
        infoChurchTableView.register(UINib.init(nibName: "InformationTableViewCell", bundle: nil),
                                        forCellReuseIdentifier: "InformationTableViewCell")
        
        infoChurchTableView.register(UINib.init(nibName: "InfoMapTableViewCell", bundle: nil),
                                     forCellReuseIdentifier: "InfoMapTableViewCell")
        
        infoChurchTableView.register(UINib.init(nibName: "AboutInfoTableViewCell", bundle: nil),
                                     forCellReuseIdentifier: "AboutInfoTableViewCell")
        

    

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        
        return 1
    }

    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 4
        
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 140
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if (indexPath.row == 0) {
            
        let cell = tableView.dequeueReusableCell(withIdentifier: "HeadImgTableViewCell", for: indexPath) as! HeadImgTableViewCell
        
      //  cell.nameLabel.text = ChurchDetailsAry[indexPath.row]

            return cell

        }
        else if (indexPath.row == 1) {

            
            let cell1 = tableView.dequeueReusableCell(withIdentifier: "InformationTableViewCell", for: indexPath) as! InformationTableViewCell
            
         //   cell.nameLabel.text = ChurchDetailsAry[indexPath.row]
            

            return cell1

            
        } else if (indexPath.row == 2){
            
            
            let cell2 = tableView.dequeueReusableCell(withIdentifier: "InfoMapTableViewCell", for: indexPath) as! InfoMapTableViewCell
            
            //   cell.nameLabel.text = ChurchDetailsAry[indexPath.row]
            
            
        return cell2

        }
        
        let cell3 = tableView.dequeueReusableCell(withIdentifier: "AboutInfoTableViewCell", for: indexPath) as! AboutInfoTableViewCell
        
        //   cell.nameLabel.text = ChurchDetailsAry[indexPath.row]
        
        
        return cell3


        
    }
    

    
}
