//
//  ViewController.swift
//  SamplePageMenu
//
//  Created by Mac OS on 05/01/18.
//  Copyright © 2018 Mac OS. All rights reserved.
//

import UIKit
import TextFieldEffects

class LoginViewController: UIViewController {
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    

    
    @IBOutlet weak var mobileEmailTF: UITextField!
    
    @IBOutlet weak var passwordTF: UITextField!

    @IBOutlet weak var remembermeBtn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    override func viewWillAppear(_ animated: Bool) {
        
        super.viewWillAppear(animated)
        
        self.navigationController?.navigationBar.isHidden = true
        
        
//        Utilities.setSignUpViewControllerNavBarColorInCntrWithColor(backImage: "icons8-hand_right_filled-1", cntr:self, titleView: nil, withText: "", backTitle: " InspectionPro", rightImage: appVersion, secondRightImage: "Up", thirdRightImage: "Up")
//        
//        //navigationItem.leftBarButtonItems = []
        
    }
    override func viewWillDisappear(_ animated: Bool) {
        
        super.viewWillDisappear(animated)
        self.navigationController?.navigationBar.isHidden = false


        
    }
    
    @IBAction func loginClicked(_ sender: Any) {
        
        

       let rootController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SWRevealViewController") as! SWRevealViewController
        
         appDelegate.window?.rootViewController = rootController

        
    }
    
    @IBAction func forgotPasswordClicked(_ sender: Any) {
    }

    @IBAction func remembermeClicked(_ sender: Any) {
        
        
        
        
    }
    
    
    @IBAction func registerClicked(_ sender: Any) {
        
//        let appDelegate = UIApplication.shared.delegate as! AppDelegate
//        
//        let rootController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SWRevealViewController") as! SWRevealViewController
//        
//        appDelegate.window?.rootViewController = rootController
        
//        let signUpVc  : SignUpViewController = self.storyboard?.instantiateViewController(withIdentifier: "SignUpViewController") as! SignUpViewController
//        
//        self.navigationController?.pushViewController(signUpVc, animated: true)
//        
        
        
        
        
        
       // let  signUpViewController = SignUpViewController(nibName: "SignUpViewController", bundle: nil)
        
        let signUpViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SignUpViewController") as! SignUpViewController
        
//        failedViewController.deficencyCorrectiveModelArray = deficencyCorrectiveModelArray
//        failedViewController.operationArray = operationsModelArray
//        
        self.navigationController?.pushViewController(signUpViewController, animated: true)
        

        
//
//        let rootController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SignUpViewController") as! SignUpViewController
//        
//        appDelegate.window?.rootViewController = rootController
        
        
        
    }
    

}

