//
//  HomeViewController.swift
//  SamplePageMenu
//
//  Created by Mac OS on 05/01/18.
//  Copyright © 2018 Mac OS. All rights reserved.
//

import UIKit

protocol changeSubtitleOfIndexDelegate {
    func nameOfItem(indexNumber: Int, countText : String)
}

class HomeViewController: UIViewController ,CAPSPageMenuDelegate,changeSubtitleOfIndexDelegate  {
    
    
    @IBOutlet weak var menuBarButton: UIBarButtonItem!
    
    @IBOutlet weak var settingsBarButton: UIBarButtonItem!
    
    var pageMenu : CAPSPageMenu?
    
    private var controllersArray: [UIViewController] = []
    var subTitlesArray          : Array<String>     = Array()
    
    
    var allOffersVC : AllOffersViewController?
    var rechargesVC : RechargesViewController?
    var detAndBillsVC : DetAndBillsViewController?
    var mearchantVC : MearchantViewController?
  

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
      //  navigationController?.navigationBar.barTintColor = UIColor.green
        
        self.navigationController?.navigationBar.barTintColor = #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)
        self.navigationItem.title = "Telugu Churches"
        self.createPageMenu()

        sideMenu()
    }

    
    func sideMenu(){
        
        if revealViewController() != nil{
            
            menuBarButton.target = revealViewController()
            menuBarButton.action = #selector(revealViewController().revealToggle(_:))
            
            revealViewController().rearViewRevealWidth = 270
            
       //    revealViewController().rightViewRevealWidth = 160
            
            
            
            
        }
        
    }
    
    private func createPageMenu() {
        
        
        allOffersVC = AllOffersViewController(nibName: "AllOffersViewController", bundle: nil)
        allOffersVC?.title = "Videos"
        allOffersVC?.delegate  = self
        //   allOffersVC?.getLabelForPendingOrders()
        
   
        
      //  allOffersVC?.loadingImg.image = UIImage(named: String("Video"))
        
        
        
        rechargesVC = RechargesViewController(nibName: "RechargesViewController",
                                              bundle: nil)
        rechargesVC?.title = "Events"
        rechargesVC?.delegate  = self
        //   rechargesVC?.getLabelForShippedOrders()
        
        
        detAndBillsVC = DetAndBillsViewController(nibName: "DetAndBillsViewController",
                                                  bundle: nil)
        detAndBillsVC?.title = "Books"
        detAndBillsVC?.delegate  = self
        //     detAndBillsVC?.getLabelForAllOrders()
        
        mearchantVC = MearchantViewController(nibName: "MearchantViewController",
                                              bundle: nil)
        mearchantVC?.title = "Live"
        mearchantVC?.delegate  = self
        //     mearchantVC?.getLabelForAllOrders()
        
        controllersArray.append(allOffersVC!)
        controllersArray.append(rechargesVC!)
        controllersArray.append(detAndBillsVC!)
        controllersArray.append(mearchantVC!)
        
        
        
        let parameters : [CAPSPageMenuOption] = [CAPSPageMenuOption.scrollMenuBackgroundColor(UIColor.clear),
                                                 CAPSPageMenuOption.viewBackgroundColor(UIColor.clear),
                                                 CAPSPageMenuOption.bottomMenuHairlineColor(UIColor(red: 170.0/255.0, green: 170.0/255.0, blue: 170.0/255.0, alpha: 0.5)),
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
        
        pageMenu = CAPSPageMenu(viewControllers: controllersArray,subTitles:self.subTitlesArray,
                                frame: CGRect.init(x: 0.0, y: 64.0, width: self.view.frame.size.width, height: self.view.frame.size.height ),
                                pageMenuOptions: parameters)
        revealViewController().addChildViewController(pageMenu!)
        pageMenu?.delegate = self
       // self.view.addSubview((pageMenu?.view)!)
        self.view.addSubview((pageMenu?.view)!)
        //self.navigationController?.view.addSubview((pageMenu?.view)!)
        pageMenu?.didMove(toParentViewController: self)
        
    }
    
    
    func nameOfItem(indexNumber: Int, countText :String ){
        let menuItem = pageMenu?.menuItems[indexNumber]
        menuItem?.subtitleLabel?.text = "  " + countText + "  "
        menuItem?.subtitleLabel?.textAlignment = .left
        menuItem?.subtitleLabel?.sizeToFit()
        menuItem?.subtitleLabel?.center = CGPoint(x: (menuItem?.bounds.midX)!, y: (menuItem?.bounds.midY)! + 8)
        
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
