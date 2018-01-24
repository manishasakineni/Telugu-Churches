//
//  SideMenuViewController.swift
//  SamplePageMenu
//
//  Created by Manoj on 09/01/18.
//  Copyright © 2018 Mac OS. All rights reserved.
//

import UIKit

class SideMenuViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    @IBOutlet weak var menuTableView: UITableView!
    
    

    var menuArray = ["","Library","Sermons","Events","Sound Cloud","maps","Subscriptions","Donations","settings"]
    
    let imageView = ["","ibrary-50","speech","event","sound","Maps","Subscriptions","Subscriptions","Settings"]
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let nibName1  = UINib(nibName: "menuTableViewCell" , bundle: nil)
        menuTableView.register(nibName1, forCellReuseIdentifier: "menuTableViewCell")
        
        let nibName2  = UINib(nibName: "menuNameTableViewCell" , bundle: nil)
        menuTableView.register(nibName2, forCellReuseIdentifier: "menuNameTableViewCell")
        

        
        menuTableView.delegate = self
        menuTableView.dataSource = self
        
        

        
        
        // Do any additional setup after loading the view.
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        
        
        return 1
    }
    
    
   

    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
       
       
        
       return menuArray.count
        
        
    }
    
    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat{
        
        
        return UITableViewAutomaticDimension
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
       
        return UITableViewAutomaticDimension

    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        
        if indexPath.row == 0 {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "menuTableViewCell")
                as!menuTableViewCell
        
            
            return cell
        }
        
        let cell1 = tableView.dequeueReusableCell(withIdentifier: "menuNameTableViewCell")
            as!menuNameTableViewCell
        
        
        cell1.menuNameImg.image = UIImage(named: String(imageView[indexPath.row]))
        
        cell1.menuNameLabel.text! = menuArray[indexPath.row]
        
        
        
        return cell1
        
    }
    
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        
        
        
    }
    
    
    
    
}
