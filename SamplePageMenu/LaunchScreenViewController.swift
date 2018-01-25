//
//  ViewController.swift
//  LunchingScreen
//
//  Created by Mac OS on 24/01/18.
//  Copyright © 2018 Mac OS. All rights reserved.
//

import UIKit

class LaunchScreenViewController: UIViewController {

    @IBOutlet weak var quotationLabel: UILabel!
   
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        quotationLabel.animate(newText:"The first paragraph of the body should contain the strongest argument, most significant example, cleverest illustration, or an obvious beginning point.", characterDelay: 0.1)

        
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func skipClicked(_ sender: Any) {
        
        
        
        let LoginNav : LoginViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
        
        appDelegate.window?.rootViewController = LoginNav
        
        
        
    }

}

extension UILabel {
    
    func animate(newText: String, characterDelay: TimeInterval) {
        
        DispatchQueue.main.async {
            
            self.text = ""
            
            for (index, character) in newText.characters.enumerated() {
                DispatchQueue.main.asyncAfter(deadline: .now() + characterDelay * Double(index)) {
                    self.text?.append(character)
                }
            }
        }
    }
    
}
