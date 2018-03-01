//
//  HomeViewController.swift
//  SamplePageMenu
//
//  Created by Mac OS on 05/01/18.
//  Copyright © 2018 Mac OS. All rights reserved.
//

import UIKit

//protocol changeSubtitleOfIndexDelegate {
//    func nameOfItem(indexNumber: Int, countText : String)
//}

protocol SttingPopOverHomeDelegate {
    func helpClicked()
    func aboutUS()
    func notificationClicked()
}

class HomeViewController: UIViewController ,UIPopoverPresentationControllerDelegate,SttingPopOverHomeDelegate,UITableViewDelegate,UITableViewDataSource  {
    
    @IBOutlet weak var categorieTableView: UITableView!
    
    @IBOutlet weak var menuBarButton: UIBarButtonItem!
    
    @IBOutlet weak var settingsBarButton: UIBarButtonItem!
    
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate

    
    var pageMenu : CAPSPageMenu?
    
    
    var appVersion          : String = ""

    var loginStatusString    =   String()
    
    
    var sectionTittles = ["Latest Posts","Categories","Event Posts"]
    


    var imageArray = [UIImage(named:"holybible"),UIImage(named:"Audio"),UIImage(named:"Seminor"),UIImage(named:"Songs"),UIImage(named:"books"),UIImage(named:"Churches"),UIImage(named:"live"),UIImage(named:"Seminor-1"),UIImage(named:"rootmap"),UIImage(named:"Science"),UIImage(named:"movies"),UIImage(named:"language"),UIImage(named:"jobs")]
    var imageArray2 = [UIImage(named:"donation"),UIImage(named:"bookshop"),UIImage(named:"Vedio"),UIImage(named:"holybible"),UIImage(named:"Audio"),UIImage(named:"Seminor"),UIImage(named:"Songs"),UIImage(named:"books"),UIImage(named:"Churches"),UIImage(named:"live"),UIImage(named:"Seminor-1"),UIImage(named:"rootmap"),UIImage(named:"Science"),UIImage(named:"movies"),UIImage(named:"language"),UIImage(named:"jobs"),UIImage(named:"donation")]
    
    //   var namesarra1 = ["Holy Bible","Audio Bible","Bible Study","Songs","Scientific Proofs","Gospel Messages","Short Messages","Images","Login id Creation","Help to develop the small churches","Book Shop","Movies","Daily Quotations","Video Songs","Testimonials","Quotations","Sunday School","Cell numbers for daily messages(Bulk sms)","Bible Apps","Short Films","Jobs","Route maps buds numbers","Events","Donation","Live","Doubts","Suggetions","Pamplets","languages(Tel/Eng)","Admin can add multiple menu pages"]
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let nibName  = UINib(nibName: "CategorieHomeCell" , bundle: nil)
        categorieTableView.register(nibName, forCellReuseIdentifier: "CategorieHomeCell")
        
        
        
        self.navigationController?.navigationBar.barTintColor = #colorLiteral(red: 0.4039215686, green: 0.6705882353, blue: 0.8156862745, alpha: 1)
        self.navigationItem.title = "Telugu Churches".localize()
        
        
        
        
        print(kLoginSucessStatus)
        
        
        let defaults = UserDefaults.standard
        
        if let loginSucess = defaults.string(forKey: kLoginSucessStatus) {
            print(loginSucess)
            self.appDelegate.window?.makeToast(loginSucess, duration:kToastDuration, position:CSToastPositionCenter)
            
            print("defaults savedString: \(loginSucess)")
            
        }
        
        categorieTableView.dataSource = self
        categorieTableView.delegate = self
        
        
        sideMenu()
        
        //  self.navigationController?.isNavigationBarHidden = true
        
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
        func sideMenu(){
    
            if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiom.pad) {
    
            if revealViewController() != nil{
    
                menuBarButton.target = revealViewController()
                menuBarButton.action = #selector(revealViewController().revealToggle(_:))
    
                revealViewController().rearViewRevealWidth = 330
    
           //    revealViewController().rightViewRevealWidth = 160
    
    
    
    
            }
            }else{
    
    
                if revealViewController() != nil{
    
                    menuBarButton.target = revealViewController()
                    menuBarButton.action = #selector(revealViewController().revealToggle(_:))
    
                    revealViewController().rearViewRevealWidth = 270
    
                    //    revealViewController().rightViewRevealWidth = 160
    
    
    
    
                }
    
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
        

    
    public func numberOfSections(in tableView: UITableView) -> Int {
        
        
        return sectionTittles.count
        
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        
        if section == 0 {
            
            return 1
            
        }
        return 1
        
    }
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return  UITableViewAutomaticDimension
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        
        
        return 150.0
        
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        
        
        if indexPath.section == 0 {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "CategorieHomeCell", for: indexPath) as! CategorieHomeCell
            
            cell.homeCollectionView.register(UINib.init(nibName: "CategorieCollectionViewCell", bundle: nil),
                                             forCellWithReuseIdentifier: "CategorieCollectionViewCell")
            cell.homeCollectionView.tag = indexPath.row
            cell.homeCollectionView.collectionViewLayout.invalidateLayout()
            cell.homeCollectionView.delegate = self
            cell.homeCollectionView.dataSource = self
            cell.moreButton.addTarget(self, action: #selector(categorieOneClicked(_:)), for: UIControlEvents.touchUpInside)
            cell.categoriesNameLabel.text = "Latest Posts"

            return cell
        }
        else if indexPath.section == 1 {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "CategorieHomeCell", for: indexPath) as! CategorieHomeCell
            
            cell.homeCollectionView.register(UINib.init(nibName: "CategorieCollectionViewCell", bundle: nil),
                                             forCellWithReuseIdentifier: "CategorieCollectionViewCell")
            cell.homeCollectionView.tag = indexPath.row
            cell.homeCollectionView.collectionViewLayout.invalidateLayout()
            cell.homeCollectionView.delegate = self
            cell.homeCollectionView.dataSource = self
            cell.moreButton.addTarget(self, action: #selector(categorieOneClicked(_:)), for: UIControlEvents.touchUpInside)

            cell.categoriesNameLabel.text = "Categories"

            
            return cell

        }
        let cell = tableView.dequeueReusableCell(withIdentifier: "CategorieHomeCell", for: indexPath) as! CategorieHomeCell
        
        cell.homeCollectionView.register(UINib.init(nibName: "CategorieCollectionViewCell", bundle: nil),
                                         forCellWithReuseIdentifier: "CategorieCollectionViewCell")
        cell.homeCollectionView.tag = indexPath.row
        cell.homeCollectionView.collectionViewLayout.invalidateLayout()
        cell.homeCollectionView.delegate = self
        cell.homeCollectionView.dataSource = self
        cell.moreButton.addTarget(self, action: #selector(categorieOneClicked(_:)), for: UIControlEvents.touchUpInside)
        cell.categoriesNameLabel.text = "Event Posts"


        
        return cell
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
    
 
    func  categorieOneClicked(_ sendre:UIButton) {
        
        
                    let churchDetailsViewController = self.storyboard?.instantiateViewController(withIdentifier: "CategoriesHomeViewController") as! CategoriesHomeViewController
                    self.navigationController?.pushViewController(churchDetailsViewController, animated: true)
        
        print("Eye Button Clicked......")
        
    
        
    }
}


extension HomeViewController : UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    
    
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        
        if section == 0 {
            
            return imageArray.count
            
        }
        
        return imageArray2.count
        
        
        
    }
    
    
    
    
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        
        if indexPath.section == 0 {
            
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CategorieCollectionViewCell", for: indexPath) as! CategorieCollectionViewCell
            
            cell.collectionImgView.image = imageArray[ indexPath.row]
            //   cell.nameLabel.text = namesarra1[indexPath.row]
            
            let nibName  = UINib(nibName: "CategorieHomeCell" , bundle: nil)
            
            return cell
            
            
        }
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CategorieCollectionViewCell", for: indexPath) as! CategorieCollectionViewCell
        
        cell.collectionImgView.image = imageArray2[ indexPath.row]
        // cell.nameLabel.text = namesarra1[indexPath.row]
        
        let nibName  = UINib(nibName: "CategorieHomeCell" , bundle: nil)
        
        
        return cell
        
        
        
        
        
        
        
        
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        
        let cellsPerRow = 3
        
        let flowLayout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        let marginsAndInsets = flowLayout.sectionInset.left + flowLayout.sectionInset.right + flowLayout.minimumInteritemSpacing * CGFloat(cellsPerRow - 1)
        let itemWidth = ((collectionView.bounds.size.width - marginsAndInsets) / CGFloat(cellsPerRow)).rounded(.down)
        return CGSize(width: itemWidth, height: itemWidth)
    }
    
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
}
}


