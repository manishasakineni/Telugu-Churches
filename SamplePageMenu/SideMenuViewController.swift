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
    
    

    var menuArray = ["EditProfile","ChangePassWord","LogOut"]
    
    let imageView = ["EditProfile","ChangePSW","LogOutlightGray"]
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
//        
//        let nibName1  = UINib(nibName: "menuTableViewCell" , bundle: nil)
//        menuTableView.register(nibName1, forCellReuseIdentifier: "menuTableViewCell")
//        
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
        
//        if indexPath.row == 0 {
//            
//            let cell = tableView.dequeueReusableCell(withIdentifier: "menuTableViewCell")
//                as!menuTableViewCell
//        
//            
//            return cell
//        }
        
        let cell1 = tableView.dequeueReusableCell(withIdentifier: "menuNameTableViewCell")
            as!menuNameTableViewCell
        
        
        cell1.menuNameImg.image = UIImage(named: String(imageView[indexPath.row]))
        
        cell1.menuNameLabel.text! = menuArray[indexPath.row]
        
        
        
        return cell1
        
    }
    
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        
        
        
        
        
        let revealviewcontroller:SWRevealViewController = self.revealViewController()
        
        let cell:menuNameTableViewCell = tableView.cellForRow(at: indexPath) as!menuNameTableViewCell
        
        if indexPath.row == 0
        {
            
            let mainstoryboard:UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            
            
            let desController = mainstoryboard.instantiateViewController(withIdentifier: "ProfileViewController") as!ProfileViewController
            
          //  desController.showNav = true
            
            let newController = UINavigationController.init(rootViewController:desController)
            
            revealviewcontroller.pushFrontViewController(newController, animated: true)
        }
        else if indexPath.row == 1{
            
       
            
           // revealviewcontroller.pushFrontViewController(desController, animated: true)
            
            
            
            
            let reOrderPopOverVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ChangePassWordViewController") as! ChangePassWordViewController
            // reOrderPopOverVC.delegate = self
            
            //    reOrderPopOverVC. singleSelection =
            //   var imagesArray : Array<UIImage> = Array()
            
            
            revealviewcontroller.addChildViewController(reOrderPopOverVC)
            
            reOrderPopOverVC.view.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height)
            revealviewcontroller.view.addSubview(reOrderPopOverVC.view)
            reOrderPopOverVC.didMove(toParentViewController: self)
      self.revealViewController().revealToggle(animated: true)
         

            
        }else  if indexPath.row == 2{
          
            
            UserDefaults.standard.removePersistentDomain(forName: Bundle.main.bundleIdentifier!)
            UserDefaults.standard.synchronize()
            
           /* UserDefaults.standard.removeObject(forKey: KFirstTimeLogin)
            UserDefaults.standard.removeObject(forKey: "1")
            UserDefaults.standard.removeObject(forKey: kuserId)
            UserDefaults.standard.removeObject(forKey: kLoginSucessStatus)
            UserDefaults.standard.removeObject(forKey: kRegisterSucessStatus)
            UserDefaults.standard.synchronize() */
            
            let mainstoryboard:UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let desController = mainstoryboard.instantiateViewController(withIdentifier: "LoginViewController") as!LoginViewController
            desController.showNav = true
            let newController = UINavigationController.init(rootViewController:desController)
            revealviewcontroller.pushFrontViewController(newController, animated: true)
        }
   
        
   
        
        
    }
    
    
    
    
}
