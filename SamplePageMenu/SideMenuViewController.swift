//
//  SideMenuViewController.swift
//  SamplePageMenu
//
//  Created by Manoj on 09/01/18.
//  Copyright © 2018 Mac OS. All rights reserved.
//

import UIKit
import Localize

class SideMenuViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    @IBOutlet weak var menuTableView: UITableView!
    
    
    @IBOutlet weak var chooseLanguageBtn: UIButton!

    var menuArray = [String]()
    let utillites =  Utilities()

    

    
    let imageView = ["EditProfile","ChangePSW","LogOutlightGray"]
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
//        
//        let nibName1  = UINib(nibName: "menuTableViewCell" , bundle: nil)
//        menuTableView.register(nibName1, forCellReuseIdentifier: "menuTableViewCell")
//        
        let nibName2  = UINib(nibName: "menuNameTableViewCell" , bundle: nil)
        menuTableView.register(nibName2, forCellReuseIdentifier: "menuNameTableViewCell")

        self.chooseLanguageBtn.setTitle("ChooseLanguage".localize(), for: .normal)

        
        menuTableView.delegate = self
        menuTableView.dataSource = self
        
        
        self.menuArray = ["EditProfile".localize(),"ChangePassword".localize(),"LogOut".localize()]

        borderColor()
        // Do any additional setup after loading the view.
        
    }
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        self.menuArray = ["EditProfile".localize(),"ChangePassword".localize(),"LogOut".localize()]

        
      //  menuTableView.reloadData()

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func borderColor(){
        
        
        chooseLanguageBtn.layer.cornerRadius = 3.0
        chooseLanguageBtn.layer.shadowColor = UIColor(red: 122.0/255.0, green: 186.0/255.0, blue: 208.0/255.0, alpha: 1.0).cgColor
        chooseLanguageBtn.layer.shadowOffset = CGSize(width: 0, height: 3)
        chooseLanguageBtn.layer.shadowOpacity = 0.6
        chooseLanguageBtn.layer.shadowRadius = 10.0
        
        chooseLanguageBtn.layer.cornerRadius = 5.0
        chooseLanguageBtn.layer.borderWidth = 1
        chooseLanguageBtn.layer.borderColor = UIColor(red: 122.0/255.0, green: 186.0/255.0, blue: 208.0/255.0, alpha: 1.0).cgColor
        
        
        
        //    collectionImgView.layer.cornerRadius = 3.0
        //  collectionImgView.layer.shadowColor = UIColor.lightGray.cgColor
        //   collectionImgView.layer.shadowOffset = CGSize(width: 0, height: 3)
        //  collectionImgView.layer.shadowOpacity = 0.6
        //   collectionImgView.layer.shadowRadius = 0.5
        
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
        
        
        let cell1 = tableView.dequeueReusableCell(withIdentifier: "menuNameTableViewCell")
            as!menuNameTableViewCell
        
        
        if(indexPath.row == menuArray.count - 1){
            cell1.menuNameImg.image = UIImage(named: String(imageView[indexPath.row]))
            
              if UserDefaults.standard.value(forKey: KFirstTimeLogin) as? String == "true" {
                  cell1.menuNameLabel.text! = "LogOut".localize()
              }else{
                  cell1.menuNameLabel.text! = "Login".localize()
            }
          
        }else{
            cell1.menuNameImg.image = UIImage(named: String(imageView[indexPath.row]))
            
            cell1.menuNameLabel.text! = menuArray[indexPath.row]
        }
        
    
        
        
        
        return cell1
        
    }
    
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        
        
      //  var menuArray = ["EditProfile","ChangePassWord","LogOut"]

        
        
        let revealviewcontroller:SWRevealViewController = self.revealViewController()
        
        let cell:menuNameTableViewCell = tableView.cellForRow(at: indexPath) as!menuNameTableViewCell
        

        if cell.menuNameLabel.text == "EditProfile".localize()
        {
            if UserDefaults.standard.value(forKey: KFirstTimeLogin) as? String == "true" {

            let mainstoryboard:UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            
            
            let desController = mainstoryboard.instantiateViewController(withIdentifier: "ProfileViewController") as!ProfileViewController
            
          //  desController.showNav = true
            
            let newController = UINavigationController.init(rootViewController:desController)
            
            revealviewcontroller.pushFrontViewController(newController, animated: true)
            
            }else{
                 utillites.alertWithOkAndCancelButtonAction(vc: self, alertTitle: "Alert".localize(), messege: "Please Login".localize(), clickAction: {
                    
                    UserDefaults.standard.set("1", forKey: "1")
                    UserDefaults.standard.synchronize()
                    let defaults = UserDefaults.standard
                    defaults.set("false", forKey: KFirstTimeLogin)
                    UserDefaults.standard.synchronize()
                    
                    let mainstoryboard:UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                    let desController = mainstoryboard.instantiateViewController(withIdentifier: "LoginViewController") as!LoginViewController
                    desController.showNav = true
                    let newController = UINavigationController.init(rootViewController:desController)
                    revealviewcontroller.pushFrontViewController(newController, animated: true)

                 })

                print("Cancel")
            }
        }
        else if cell.menuNameLabel.text == "ChangePassword".localize(){
            
       
            
           // revealviewcontroller.pushFrontViewController(desController, animated: true)
            
            if UserDefaults.standard.value(forKey: KFirstTimeLogin) as? String == "true" {

            if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiom.pad) {

                let reOrderPopOverVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ChangePassWordViewController") as! ChangePassWordViewController
                // reOrderPopOverVC.delegate = self
                
                //    reOrderPopOverVC. singleSelection =
                //   var imagesArray : Array<UIImage> = Array()
                
                
                revealviewcontroller.addChildViewController(reOrderPopOverVC)
                
                reOrderPopOverVC.view.center = CGPoint(x:UIScreen.main.bounds.size.width/2,y:UIScreen.main.bounds.size.height/1.5)
                
                revealviewcontroller.view.addSubview(reOrderPopOverVC.view)
                reOrderPopOverVC.didMove(toParentViewController: self)
                self.revealViewController().revealToggle(animated: true)
                

                
            }else{
                
                let reOrderPopOverVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ChangePassWordViewController") as! ChangePassWordViewController
                // reOrderPopOverVC.delegate = self
                
                //    reOrderPopOverVC. singleSelection =
                //   var imagesArray : Array<UIImage> = Array()
                
                
                revealviewcontroller.addChildViewController(reOrderPopOverVC)
                
                reOrderPopOverVC.view.center = CGPoint(x:UIScreen.main.bounds.size.width/2,y:UIScreen.main.bounds.size.height/2)
                
                revealviewcontroller.view.addSubview(reOrderPopOverVC.view)
                reOrderPopOverVC.didMove(toParentViewController: self)
                self.revealViewController().revealToggle(animated: true)
                
            }
            }else{
                utillites.alertWithOkAndCancelButtonAction(vc: self, alertTitle: "Alert".localize(), messege: "Please Login".localize(), clickAction: {
                    
                    UserDefaults.standard.set("1", forKey: "1")
                    UserDefaults.standard.synchronize()
                    let defaults = UserDefaults.standard
                    defaults.set("false", forKey: KFirstTimeLogin)
                    
                    UserDefaults.standard.synchronize()
                    let mainstoryboard:UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                    let desController = mainstoryboard.instantiateViewController(withIdentifier: "LoginViewController") as!LoginViewController
                    desController.showNav = true
                    let newController = UINavigationController.init(rootViewController:desController)
                    revealviewcontroller.pushFrontViewController(newController, animated: true)
                    
                })
                
                print("Cancel")
            }

            
            
        }
        else  if cell.menuNameLabel.text == "LogOut".localize() {
          
         //   if UserDefaults.standard.value(forKey: KFirstTimeLogin) as? String == "true" {

          //  UserDefaults.standard.removePersistentDomain(forName: Bundle.main.bundleIdentifier!)
           // UserDefaults.standard.synchronize()
            
            let defaults = UserDefaults.standard
            defaults.set("false", forKey: KFirstTimeLogin)
            UserDefaults.standard.synchronize()
            
            let mainstoryboard:UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let desController = mainstoryboard.instantiateViewController(withIdentifier: "LoginViewController") as!LoginViewController
            desController.showNav = true
            let newController = UINavigationController.init(rootViewController:desController)
            revealviewcontroller.pushFrontViewController(newController, animated: true)
                
                
           // }
        }
        else  if cell.menuNameLabel.text == "Login".localize() {
            
            //   if UserDefaults.standard.value(forKey: KFirstTimeLogin) as? String == "true" {
            
            //  UserDefaults.standard.removePersistentDomain(forName: Bundle.main.bundleIdentifier!)
            // UserDefaults.standard.synchronize()
            
            let defaults = UserDefaults.standard
            defaults.set("false", forKey: KFirstTimeLogin)
            UserDefaults.standard.synchronize()
            let mainstoryboard:UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let desController = mainstoryboard.instantiateViewController(withIdentifier: "LoginViewController") as!LoginViewController
            desController.showNav = true
            let newController = UINavigationController.init(rootViewController:desController)
            revealviewcontroller.pushFrontViewController(newController, animated: true)
            
            
            // }
        }

    }
    
    
    @IBAction func chooseLanguageClicked(_ sender: Any) {
        
        
        let actionSheet = UIAlertController(title: nil, message: "ChooseLanguage".localize(), preferredStyle: UIAlertControllerStyle.actionSheet)
        for language in Localize.availableLanguages() {
            let displayName = Localize.displayNameForLanguage(language)
            
            //  let ary : Array<String> = ["English","Sinhala","Tamil"]
            let languageAction = UIAlertAction(title: displayName, style: .default, handler: {
                (alert: UIAlertAction!) -> Void in
                Localize.update(language: language)
                self.chooseLanguageBtn.setTitle("ChooseLanguage".localize(), for: .normal)
                self.menuArray = ["EditProfile".localize(),"ChangePassword".localize(),"LogOut".localize()]
                self.menuTableView.reloadData()
            })
            actionSheet.addAction(languageAction)
        }
        let cancelAction = UIAlertAction(title: "Cancel".localize(), style: UIAlertActionStyle.cancel, handler: {
            (alert: UIAlertAction) -> Void in
        })
        actionSheet.addAction(cancelAction)
        
        
        if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiom.phone) {
            
            
            self.present(actionSheet, animated: true, completion: nil)
        }
            
        else{
            
            let popup = UIPopoverController.init(contentViewController: actionSheet)
            
            //            popup.present(from: CGRect(x:self.chooseLanguageBtn.frame.minX+self.chooseLanguageBtn.frame.size.width/2, y:self.chooseLanguageBtn.frame.maxY, width:0, height:0), in: self.view, permittedArrowDirections: UIPopoverArrowDirection.up, animated: true)
  popup.present(from: CGRect(x:self.chooseLanguageBtn.frame.midX - 50, y:self.chooseLanguageBtn.frame.maxY - self.chooseLanguageBtn.frame.height, width:0, height:0), in: self.chooseLanguageBtn, permittedArrowDirections: UIPopoverArrowDirection.down, animated: true)
         

            
            
            //newRegTableViewCell
        }
        
        
    }
    
    
    
}
