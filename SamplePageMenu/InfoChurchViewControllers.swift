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


    var ChurchDetailsAry  = ["ID".localize(),"Reg No".localize(),"Name".localize(),"LandMark".localize(),"PasterUser".localize(),"Contact No".localize(),"Email Id".localize()]
    
    var ChurchInfoAry  = ["1".localize(),"REG001".localize(),"Holv Church".localize(),"LandMark".localize(),"Aishwarya Sateesh".localize(),"Contact No".localize(),"Church@gmail.com".localize()]
    

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        infoChurchTableView.delegate = self
        infoChurchTableView.dataSource = self
        
        infoChurchView.layer.cornerRadius = 6.0
        
        infoChurchView.layer.borderWidth = 1
        infoChurchView.layer.borderColor = UIColor(red: 122.0/255.0, green: 186.0/255.0, blue: 208.0/255.0, alpha: 1.0).cgColor
        
        
        infoChurchTableView.register(UINib.init(nibName: "InfoTableViewCell", bundle: nil),
                                        forCellReuseIdentifier: "InfoTableViewCell")
    

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return ChurchDetailsAry.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "InfoTableViewCell", for: indexPath) as! InfoTableViewCell
        
        cell.iDLabel.text = ChurchDetailsAry[indexPath.row]
        cell.valueLabel.text = ChurchInfoAry[indexPath.row]


        return cell
        
    }
    

    
}
