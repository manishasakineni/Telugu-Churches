//
//  ViewController.swift
//  SamplePageMenu
//
//  Created by Mac OS on 05/01/18.
//  Copyright © 2018 Mac OS. All rights reserved.
//

import UIKit

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
        
               let rootController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SignUpViewController") as! SignUpViewController
        
        appDelegate.window?.rootViewController = rootController
        
        
        
    }
    

}

