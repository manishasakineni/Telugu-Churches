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

protocol SttingPopOverHomeDelegate {
    func helpClicked()
    func aboutUS()
    func notificationClicked()
}

class HomeViewController: UIViewController ,CAPSPageMenuDelegate,changeSubtitleOfIndexDelegate,UIPopoverPresentationControllerDelegate,SttingPopOverHomeDelegate,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout  {
    
    
    @IBOutlet weak var menuBarButton: UIBarButtonItem!
    
    @IBOutlet weak var settingsBarButton: UIBarButtonItem!
    
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate

    
    var pageMenu : CAPSPageMenu?
    
    
    var appVersion          : String = ""

    var loginStatusString    =   String()
    
    
    
    @IBOutlet weak var collectionView: UICollectionView!
    private var controllersArray: [UIViewController] = []
    var subTitlesArray          : Array<String>     = Array()
    
    
    var allOffersVC : AllOffersViewController?
    var rechargesVC : RechargesViewController?
    var detAndBillsVC : DetAndBillsViewController?
    var mearchantVC : MearchantViewController?
  
 //   @IBOutlet weak var hometableview: UITableView!
    
    
    
    
    var imageArray = [UIImage(named:"jes2"),UIImage(named:"jes4"),UIImage(named:"jes1png"),UIImage(named:"jes5"),UIImage(named:"jes7"),UIImage(named:"jes8"),UIImage(named:"jes4"),UIImage(named:"jes9"),UIImage(named:"jes4"),UIImage(named:"jes5"),UIImage(named:"jes6"),UIImage(named:"jes3"),UIImage(named:"jes8"),UIImage(named:"jes4"),UIImage(named:"jes1png"),UIImage(named:"jes3"),UIImage(named:"jes7"),UIImage(named:"jes2"),UIImage(named:"jes4"),UIImage(named:"jes9"),UIImage(named:"jes4"),UIImage(named:"jes5"),UIImage(named:"jes6"),UIImage(named:"jes5")]
    
    var namesarra1 = ["Videos","Bible Study","Audio Bible","Songs","Jesues","Live","Books","Images","Bible Images","Bible Quotes","Book Shop","Movies","Videos","Audio Bible","Bible Study","Songs","Scientific Proofs","Gospel Messages","Short Messages","Images","Audio Bible    ","Bible Quotes","Book Shop","Movies"]
    

    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        print(kLoginSucessStatus)
        
        
        let defaults = UserDefaults.standard
        
        if let loginSucess = defaults.string(forKey: kLoginSucessStatus) {
            print(loginSucess)
            self.appDelegate.window?.makeToast(loginSucess, duration:kToastDuration, position:CSToastPositionCenter)
            
            print("defaults savedString: \(loginSucess)")
            
        }
        

        
        // Do any additional setup after loading the view.
      //  navigationController?.navigationBar.barTintColor = UIColor.green
        
        self.navigationController?.navigationBar.barTintColor = #colorLiteral(red: 0.4039215686, green: 0.6705882353, blue: 0.8156862745, alpha: 1)
       self.navigationItem.title = "Telugu Churches"
        
        
        
        
        
        let cellColl = UINib(nibName: "homeCollectionViewCell", bundle: nil)
        collectionView.register(cellColl, forCellWithReuseIdentifier: "homeCollectionViewCell")
        
        
        
        collectionView.dataSource = self
        collectionView.delegate = self
        
        
        self.navigationController?.isNavigationBarHidden = false
        
        
        

        
     //   settingsBarButton.addTarget(self, action: #selector(HomeViewController.methodName), for: .touchUpInside)

        
    //    self.createPageMenu()

        sideMenu()
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
    
    
    
    func sideMenu(){
        
        if revealViewController() != nil{
            
            menuBarButton.target = revealViewController()
            menuBarButton.action = #selector(revealViewController().revealToggle(_:))
            
            revealViewController().rearViewRevealWidth = 270
            
       //    revealViewController().rightViewRevealWidth = 160
            
            
            
            
        }
        
    }
    
    
    

    
    @IBAction func settingClicked(_ sender: UIBarButtonItem) {
        
       // hometableview.endEditing(true)


        let popController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SettingViewController") as! SettingViewController
        popController.delegate = self
        

        // set the presentation style
        popController.modalPresentationStyle = UIModalPresentationStyle.popover
        popController.preferredContentSize = CGSize(width: 120, height: 120)
        //  popController.delegate = self
        let popover = popController.popoverPresentationController!
        popover.delegate = self
        popover.permittedArrowDirections = .up
        popover.sourceView = self.navigationController?.view
        
        popover.sourceRect = CGRect(x: UIScreen.main.bounds.size.width - 5 , y: 25, width:20, height: 30)
        
        // present the popover
        self.present(popController, animated: true, completion: nil)
        
      //  hometableview.reloadData()
        

        
    }
    
    
    
    @IBAction func settingBarButtonTapped(_ sender: Any) {
        
        
      //  print("Setting Clicked........")
        
      //  let settingViewController:UIViewController =  (self.storyboard?.instantiateViewController(withIdentifier: "SettingViewController") as? SettingViewController)!
        
    //    self.navigationController?.pushViewController(settingViewController, animated: true)
        
        
    }
    
    // UIPopoverPresentationControllerDelegate method
    func adaptivePresentationStyle(for controller: UIPresentationController, traitCollection: UITraitCollection) -> UIModalPresentationStyle {
        // return UIModalPresentationStyle.FullScreen
        return UIModalPresentationStyle.none
    }
    
    func helpClicked(){
        print("editProfileClicked")
    }
    
    func aboutUS(){
        print("changePassWordClicked")
        
        
    }
    func notificationClicked(){
        print("notificationClicked")

    }

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return imageArray.count
        
        
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "homeCollectionViewCell", for: indexPath) as! homeCollectionViewCell
        
        cell.collectionImgView.image = imageArray[ indexPath.row]
        cell.nameLabel.text = namesarra1[indexPath.row]
        
        let nibName  = UINib(nibName: "homeTableViewCell" , bundle: nil)
        return cell
  
    }
    
    
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiom.pad) {
            
            let cellsPerRow = 5
            
            let flowLayout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
            let marginsAndInsets = flowLayout.sectionInset.left + flowLayout.sectionInset.right + flowLayout.minimumInteritemSpacing * CGFloat(cellsPerRow - 1)
            let itemWidth = ((collectionView.bounds.size.width - marginsAndInsets) / CGFloat(cellsPerRow)).rounded(.down)
            return CGSize(width: itemWidth, height: itemWidth)
        }
        else {
            
            
            let cellsPerRow = 3
            
            let flowLayout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
            let marginsAndInsets = flowLayout.sectionInset.left + flowLayout.sectionInset.right + flowLayout.minimumInteritemSpacing * CGFloat(cellsPerRow - 1)
            let itemWidth = ((collectionView.bounds.size.width - marginsAndInsets) / CGFloat(cellsPerRow)).rounded(.down)
            return CGSize(width: itemWidth, height: itemWidth)
        }
        
        
    }
    
    
    
    
  /*  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        
        
        let cellsPerRow = 3
        let flowLayout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        let marginsAndInsets = flowLayout.sectionInset.left + flowLayout.sectionInset.right + flowLayout.minimumInteritemSpacing * CGFloat(cellsPerRow - 1)
        let itemWidth = ((collectionView.bounds.size.width - marginsAndInsets) / CGFloat(cellsPerRow)).rounded(.down)
        return CGSize(width: itemWidth, height: itemWidth)
    } */
    
    
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // handle tap events
        print("You selected cell #\(indexPath.item)!")
        
       if indexPath.item == 0 {
            
          //  let holyBibleViewController = self.storyboard?.instantiateViewController(withIdentifier: "HolyBibleViewController") as! HolyBibleViewController
          //  self.navigationController?.pushViewController(holyBibleViewController, animated: true)
        
        
        let  failedViewController = AllOffersViewController(nibName: "AllOffersViewController", bundle: nil)
        
        
        self.navigationController?.pushViewController(failedViewController, animated: true)
        
      
        
        
        }
        
     // return true
    }
 
    
    private func createPageMenu() {
        
        
        allOffersVC = AllOffersViewController(nibName: "AllOffersViewController", bundle: nil)
        allOffersVC?.title = "Videos"
        allOffersVC?.delegate  = self
        //   allOffersVC?.getLabelForPendingOrders()
        
   
        
      //  allOffersVC?.loadingImg.image = UIImage(named: String("Video"))
        
        
        
        rechargesVC = RechargesViewController(nibName: "RechargesViewController",
                                              bundle: nil)
        rechargesVC?.title = "Audio"
        rechargesVC?.delegate  = self
        //   rechargesVC?.getLabelForShippedOrders()
        
        
        detAndBillsVC = DetAndBillsViewController(nibName: "DetAndBillsViewController",
                                                  bundle: nil)
        detAndBillsVC?.title = "Books"
        detAndBillsVC?.delegate  = self
        //     detAndBillsVC?.getLabelForAllOrders()
        
        mearchantVC = MearchantViewController(nibName: "MearchantViewController",
                                              bundle: nil)
        mearchantVC?.title = "Events"
        mearchantVC?.delegate  = self
        //     mearchantVC?.getLabelForAllOrders()
        
        /*controllersArray.append(allOffersVC!)
        controllersArray.append(rechargesVC!)
        controllersArray.append(detAndBillsVC!)
        controllersArray.append(mearchantVC!)*/
        
        
        
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
        
      /*  pageMenu = CAPSPageMenu(viewControllers: controllersArray,subTitles:self.subTitlesArray,
                                frame: CGRect.init(x: 0.0, y: 64.0, width: self.view.frame.size.width, height: self.view.frame.size.height ),
                                pageMenuOptions: parameters)*/
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
