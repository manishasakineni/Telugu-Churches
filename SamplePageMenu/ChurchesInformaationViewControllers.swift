//
//  ChurchesInformaationViewController.swift
//  Telugu Churches
//
//  Created by Manoj on 20/02/18.
//  Copyright © 2018 Mac OS. All rights reserved.
//

import UIKit

protocol churchChangeSubtitleOfIndexDelegate {
    func nameOfItem(indexNumber: Int, countText : String)
}

class ChurchesInformaationViewControllers: UIViewController,CAPSPageMenuDelegate,churchChangeSubtitleOfIndexDelegate {
    
    
    var pageMenu : CAPSPageMenu?

    var allOffersVC : InfoChurchViewControllers?
    var rechargesVC : RechargesViewController?
    var detAndBillsVC : DetAndBillsViewController?
    private var controllersArray: [UIViewController] = []
    
    var appVersion          : String = ""

   

    override func viewDidLoad() {
        super.viewDidLoad()
        
    
        
       createPageMenu()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        super.viewWillAppear(animated)
        
    //    Utilities.setSignUpViewControllerNavBarColorInCntrWithColor(backImage: "icons8-arrows_long_left", cntr:self, titleView: nil, withText: "Registration".localize(), backTitle: " Registration".localize(), rightImage: appVersion, secondRightImage: "Up", thirdRightImage: "Up")
        
        //navigationItem.leftBarButtonItems = []
        
    }
    

    @IBAction func backLeftButtonTapped(_ sender:UIButton) {
        
        //   navigationItem.leftBarButtonItems = []
        //   let loginViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
        
        
        UserDefaults.standard.set("1", forKey: "1")
        UserDefaults.standard.synchronize()
        
        self.navigationController?.popViewController(animated: true)
        
        
        print("Back Button Clicked......")
        
    }

    
    private func createPageMenu() {
        
        
        allOffersVC = InfoChurchViewControllers(nibName: "InfoChurchViewControllers", bundle: nil)
        allOffersVC?.title = "Info"
        allOffersVC?.delegate  = self
        
        
        rechargesVC = RechargesViewController(nibName: "RechargesViewController",
                                              bundle: nil)
        rechargesVC?.title = "Event"
        rechargesVC?.delegate  = self
        
        
        detAndBillsVC = DetAndBillsViewController(nibName: "DetAndBillsViewController",
                                                  bundle: nil)
        detAndBillsVC?.title = "Posts"
        detAndBillsVC?.delegate  = self
        
        controllersArray.append(allOffersVC!)
         controllersArray.append(rechargesVC!)
         controllersArray.append(detAndBillsVC!)
        
        let parameters : [CAPSPageMenuOption] = [CAPSPageMenuOption.scrollMenuBackgroundColor(UIColor.clear),
                                                 CAPSPageMenuOption.viewBackgroundColor(UIColor.clear),
                                                 CAPSPageMenuOption.bottomMenuHairlineColor(UIColor(red: 103.0/255.0, green: 171.0/255.0, blue: 208.0/255.0, alpha: 1.0)),
                                                 CAPSPageMenuOption.menuItemFont( UIFont(name: "HelveticaNeue", size: 13.0)!),
                                                 CAPSPageMenuOption.menuHeight(36),
                                                 CAPSPageMenuOption.centerMenuItems(true),
                                                 CAPSPageMenuOption.selectedMenuItemLabelColor(UIColor.black),
                                                 CAPSPageMenuOption.unselectedMenuItemLabelColor(UIColor.lightGray),
                                                 CAPSPageMenuOption.selectionIndicatorHeight(2.5),
                                                 CAPSPageMenuOption.menuItemMargin(0.0),
                                                 CAPSPageMenuOption.useMenuLikeSegmentedControl(true),
                                                 CAPSPageMenuOption.menuItemSeparatorWidth(0.0),
                                                 CAPSPageMenuOption.menuItemSeparatorColor(UIColor.white),
                                                 CAPSPageMenuOption.enableHorizontalBounce(false),
                                                 CAPSPageMenuOption.addBottomMenuHairline(true),
                                                 CAPSPageMenuOption.menuItemWidthBasedOnTitleTextWidth(false),CAPSPageMenuOption.hideSubTitle(false)]
        
   // revealViewController().addChildViewController(pageMenu!)
     //   pageMenu?.delegate = self
  //  self.view.addSubview((pageMenu?.view)!)
        pageMenu = CAPSPageMenu(viewControllers: controllersArray, frame: CGRect(x:0.0, y:64.0, width:self.view.frame.width, height:self.view.frame.height), pageMenuOptions: parameters)
        
        // Lastly add page menu as subview of base view controller view
        // or use pageMenu controller in you view hierachy as desired
        self.view.addSubview(pageMenu!.view)
    //pageMenu?.didMove(toParentViewController: self)
        
    }
    
    
    func nameOfItem(indexNumber: Int, countText :String ){
        let menuItem = pageMenu?.menuItems[indexNumber]
        menuItem?.subtitleLabel?.text = "  " + countText + "  "
        menuItem?.subtitleLabel?.textAlignment = .left
        menuItem?.subtitleLabel?.sizeToFit()
        menuItem?.subtitleLabel?.center = CGPoint(x: (menuItem?.bounds.midX)!, y: (menuItem?.bounds.midY)! + 8)
        
    }
    

    
    
    
    
    
    
}
