//
//  AdminDetailsViewController.swift
//  Telugu Churches
//
//  Created by N@n!'$ Mac on 13/03/18.
//  Copyright © 2018 Mac OS. All rights reserved.
//

import UIKit

protocol authorChangeSubtitleOfIndexDelegate {
    func nameOfItem(indexNumber: Int, countText : String)
}

class AuthorDetailsViewController: UIViewController,CAPSPageMenuDelegate,authorChangeSubtitleOfIndexDelegate {
    
    
    var pageMenu : CAPSPageMenu?
    
    var authorInfoVC : AuthorInfoViewController?
    var authorEventsVC : AuthorEventsViewController?
    var authorPostsVC : AuthorPostsViewController?
    private var controllersArray: [UIViewController] = []
    
    var authorID : Int = 0
    var authorName : String = ""
    var appVersion  : String = ""

    
    override func viewDidLoad() {
        super.viewDidLoad()

        createPageMenu()
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
       
    }
    

    override func viewWillAppear(_ animated: Bool) {
        
        super.viewWillAppear(animated)
        
        Utilities.authorDetailsViewControllerNavBarColorInCntrWithColor(backImage: "icons8-arrows_long_left", cntr: self, titleView: nil, withText: "", backTitle: authorName, rightImage: appVersion, secondRightImage: "Up", thirdRightImage: "Up")
    
    }
    
    
    private func createPageMenu() {
        
        
        authorInfoVC = AuthorInfoViewController(nibName: "AuthorInfoViewController", bundle: nil)
        authorInfoVC?.title = "Information"
        authorInfoVC?.delegate  = self
        authorInfoVC?.authorID = authorID
       // authorInfoVC?.churchID = churchID
        
        
      
        
        authorEventsVC = AuthorEventsViewController(nibName: "AuthorEventsViewController", bundle: nil)
        authorEventsVC?.title = "Events"
        authorEventsVC?.authorID = authorID
        authorEventsVC?.delegate  = self
        //eventInfoVC?.churchID = churchID
        
        authorPostsVC = AuthorPostsViewController(nibName: "AuthorPostsViewController", bundle: nil)
        authorPostsVC?.title = "Posts"
        authorPostsVC?.authorID = authorID
        authorPostsVC?.delegate  = self
        
        controllersArray.append(authorInfoVC!)
        controllersArray.append(authorEventsVC!)
        controllersArray.append(authorPostsVC!)
        
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
        
        
        
        
        pageMenu = CAPSPageMenu(viewControllers: controllersArray,
                                frame: CGRect.init(x: 0.0, y: 0.0, width: self.view.frame.size.width, height: self.view.frame.size.height),
                                pageMenuOptions: parameters)
        pageMenu?.delegate = self
        self.addChildViewController(pageMenu!)
        
        view.addSubview((pageMenu?.view)!)
        pageMenu?.didMove(toParentViewController: self)
        

        
    }
    
    func nameOfItem(indexNumber: Int, countText :String ){
        let menuItem = pageMenu?.menuItems[indexNumber]
        menuItem?.subtitleLabel?.text = "  " + countText + "  "
        menuItem?.subtitleLabel?.textAlignment = .left
        menuItem?.subtitleLabel?.sizeToFit()
        menuItem?.subtitleLabel?.center = CGPoint(x: (menuItem?.bounds.midX)!, y: (menuItem?.bounds.midY)! + 8)
        
    }
    
    @IBAction func backLeftButtonTapped(_ sender:UIButton) {
        
        
        
        UserDefaults.standard.removeObject(forKey: "1")
        UserDefaults.standard.removeObject(forKey: kLoginSucessStatus)
        UserDefaults.standard.synchronize()
        
        
        self.navigationController?.popViewController(animated: true)
        
        
        
        //   navigationItem.leftBarButtonItems = []
        //   let loginViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
        
        //
        //        UserDefaults.standard.set("1", forKey: "1")
        //        UserDefaults.standard.synchronize()
        //
        //        self.navigationController?.popViewController(animated: true)
        print("Back Button Clicked......")
        
    }
    

}
