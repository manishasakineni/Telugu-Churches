//
//  ProfileViewController.swift
//  Telugu Churches
//
//  Created by praveen dole on 2/2/18.
//  Copyright © 2018 Mac OS. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {

    
    var appVersion          : String = ""

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        

           //self.navigationController?.navigationBar.isHidden = !showNav
        
        
     

        
      //  Utilities.setEditProfileViewControllerNavBarColorInCntrWithColor(backImage: "icons8-arrows_long_left", cntr:self, titleView: nil, withText: "Edit Profile", backTitle: "", rightImage: appVersion, secondRightImage: "Up", thirdRightImage: "Up")
        
        // Do any additional setup after loading the view.
    }

    
    
    override func viewWillAppear(_ animated: Bool) {
        
        super.viewWillAppear(animated)
        
        
        
       // print(showNav)
        
      //  self.navigationController?.navigationBar.isHidden = false

        
      //  Utilities.setEditProfileViewControllerNavBarColorInCntrWithColor(backImage: "icons8-arrows_long_left", cntr:self, titleView: nil, withText: "Edit Profile", backTitle: " Edit Profile", rightImage: appVersion, secondRightImage: "Up", thirdRightImage: "Up")
        
        //   self.navigationItem.hidesBackButton = false
        
        //        Utilities.setSignUpViewControllerNavBarColorInCntrWithColor(backImage: "icons8-hand_right_filled-1", cntr:self, titleView: nil, withText: "", backTitle: " InspectionPro", rightImage: appVersion, secondRightImage: "Up", thirdRightImage: "Up")
        //
        //        //navigationItem.leftBarButtonItems = []
        
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        
        super.viewDidDisappear(animated)
        
        
        
        // print(showNav)
        
     //   self.navigationController?.navigationBar.isHidden = false
        
        
        
        //   self.navigationItem.hidesBackButton = false
        
        //        Utilities.setSignUpViewControllerNavBarColorInCntrWithColor(backImage: "icons8-hand_right_filled-1", cntr:self, titleView: nil, withText: "", backTitle: " InspectionPro", rightImage: appVersion, secondRightImage: "Up", thirdRightImage: "Up")
        //
        //        //navigationItem.leftBarButtonItems = []
        
    }
    
    
    @IBAction func backLeftButtonTapped(_ sender:UIButton) {
        
        
       // self.navigationController?.navigationBar.isHidden = false

        
        let revealviewcontroller:SWRevealViewController = self.revealViewController()
        
        
        
            let mainstoryboard:UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            
            
            let desController = mainstoryboard.instantiateViewController(withIdentifier: "SWRevealViewController") as!SWRevealViewController
            
       //     desController.showNav = true
            
            let newController = UINavigationController.init(rootViewController:desController)
            
            revealviewcontroller.pushFrontViewController(newController, animated: true)
        

        
       // let rootController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SWRevealViewController") as! SWRevealViewController
        
      //  appDelegate.window?.rootViewController = rootController
        
        
        
        //   navigationItem.leftBarButtonItems = []
       // let loginViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SWRevealViewController") as! SWRevealViewController
        
        
        
        
     //   self.navigationController?.pushViewController(loginViewController, animated: true)
        
        
        print("Back Button Clicked......")
        
        
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
