//
//  Utilities.swift
//  Telugu Churches
//
//  Created by Mac OS on 29/01/18.
//  Copyright © 2018 Mac OS. All rights reserved.
//

import UIKit

class Utilities: NSObject {
    
    
    
    static let sharedInstance : Utilities = Utilities()
    
    //MARK: - Nil Check
    
    func isObjectNull(_ object: AnyObject?) -> Bool {
        return !isNil(object) && !isNull(object)
    }
    
    private func isNull(_ object: AnyObject?) -> Bool {
        if !isNil(object) {
            if object!.isKind(of: NSNull.self) || object?.classForCoder == NSNull.classForCoder() {
                return true
            } else {
                return isStringNull(object)
            }
        }
        return false
    }
    
    private func isNil(_ object: AnyObject?) -> Bool {
        return object == nil
    }
    
    private func isStringNull(_ object: AnyObject?) -> Bool {
        guard isNil(object) && isNull(object) else {
            let str = object as? String ?? ""
            return str == "<NULL>"
        }
        return false
    }
    
    class func getTokenType() -> String {
        
        let tokenType = UserDefaults.standard.value(forKey: kTokenType) as? String
        
        if tokenType == nil {
            
            return ""
            
        } else {
            
            return tokenType!
        }
}
    
    
    
    
    
    class func setSignUpViewControllerNavBarColorInCntrWithColor(backImage: String?,cntr: UIViewController,titleView: UIView?, withText title: String, backTitle:String, rightImage: String, secondRightImage:String, thirdRightImage : String) {
        
        var titlelabel: UILabel? = cntr.navigationController?.navigationBar.viewWithTag(555) as? UILabel
        
        if (titlelabel == nil) {
            
            titlelabel = UILabel(frame: CGRect(x: 50.0, y: 0, width: ScreenSize.SCREEN_WIDTH - 100, height: 44.0))
            titlelabel?.tag = 555
            titlelabel!.backgroundColor = UIColor.clear
            titlelabel!.font =  UIFont(name: "HelveticaNeue", size: 15.0)
            titlelabel?.textAlignment = .center
            titlelabel!.textColor = UIColor.white
            titlelabel?.lineBreakMode = .byWordWrapping
            titlelabel?.numberOfLines = 0
            
            cntr.navigationController?.navigationBar.addSubview(titlelabel!)
        }
        
        titlelabel!.text = title
        
        if(cntr.navigationController != nil) {
            
            cntr.navigationController!.navigationBar.isTranslucent = false
            cntr.navigationController!.isNavigationBarHidden = false
            cntr.navigationController!.navigationBar.barTintColor = UIColor(red: 61.0/255.0, green: 61.0/255.0, blue: 61.0/255.0, alpha: 1.0)
            cntr.navigationController!.navigationBar.tintColor = UIColor.white
            //            cntr.navigationController?.navigationBar.barStyle = .black
        }
        
        
        let leftButtonImage: UIImage = UIImage(named: backImage!)!
        let leftButton: UIButton = UIButton(type: .custom)
        
        leftButton.frame = CGRect(x: 0, y: 0, width: leftButtonImage.size.width, height: leftButtonImage.size.height)
        leftButton.setTitle(backTitle, for: .normal)
        if backTitle.characters.count > 0 {
            
            leftButton.setImage(leftButtonImage, for: .normal)
        }
        leftButton.titleLabel?.font = UIFont(name: "Helvetica Neue", size: 12)
        leftButton.addTarget(cntr, action: #selector(SignUpViewController.backLeftButtonTapped(_:)), for: .touchUpInside)
        let barbuttonitem1: UIBarButtonItem = UIBarButtonItem(customView: leftButton)
        
        cntr.navigationItem.leftBarButtonItems = [barbuttonitem1]
        
        
    }
    
    
}
