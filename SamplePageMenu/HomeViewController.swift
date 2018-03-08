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

class HomeViewController: UIViewController ,UIPopoverPresentationControllerDelegate,SttingPopOverHomeDelegate,UITableViewDelegate,UITableViewDataSource,UISearchBarDelegate,UISearchDisplayDelegate,UISearchResultsUpdating  {
    
    @IBOutlet weak var categorieTableView: UITableView!
    
    @IBOutlet weak var menuBarButton: UIBarButtonItem!
    
    @IBOutlet weak var settingsBarButton: UIBarButtonItem!
    

//    lazy var searchBar:UISearchBar = UISearchBar(frame: CGRect(x: 0, y: 0, width: 200, height: 20))
    
    lazy var searchBar = UISearchBar(frame: CGRect.zero)
    
    
    var filteredData: [String]!
    
    var searchController: UISearchController!
    
    var searchActive : Bool = false
    var data = ["Latest Posts","Categories","Event Posts"]
    var filtered:[String] = []
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate

    
    var pageMenu : CAPSPageMenu?
    
    
    var appVersion          : String = ""

    var loginStatusString    =   String()
    
    var bibleNav = false

    var sectionTittles = ["Church","Latest Posts","Categories","Event Posts"]
    
  //  var imageArray4 = [UIImage(named:"Bible apps"),UIImage(named:"Bible study"),UIImage(named:"Book shop"),UIImage(named:"Donation"),UIImage(named:"Doubts"),UIImage(named:"Events"),UIImage(named:"film"),UIImage(named:"Gospel messages"),UIImage(named:"Gospel"),UIImage(named:"help"),UIImage(named:"Holy bible"),UIImage(named:"Images"),UIImage(named:"Live"),UIImage(named:"Map"),UIImage(named:"Messages"),UIImage(named:"Movies"),UIImage(named:"pamphlet"),UIImage(named:"Quatation"),UIImage(named:"Scientific"),UIImage(named:"Songs"),UIImage(named:"Suggestion"),UIImage(named:"Sunday school"),UIImage(named:"Testimonial"),UIImage(named:"Videos"),UIImage(named:"ic_admin"),UIImage(named:"Languages"),UIImage(named:"Login"),UIImage(named:"pamphlet")]

    //  var namesarra1 = ["Bible apps","Bible study","Book shop","Donation","Doubts","Events","film","Gospel messages","Gospel","help","Holy bible","Images","live","Map","Messages","Movies","pamphlet","Quatation","Scientific","Songs","Suggestion","Sunday school","Testimonial","Videos","Admin","Languages","Login","pamphlet"]

    var imageArray = [UIImage(named:"Holy bible"),UIImage(named:"Bible apps"),UIImage(named:"Bible study"),UIImage(named:"Book shop"),UIImage(named:"Images"),UIImage(named:"Testimonial"),UIImage(named:"Holy bible"),UIImage(named:"Bible apps"),UIImage(named:"Bible study")]
    var imageNameArray = ["Holy bible","Bible apps","Bible study","Book shop","Images","Testimonial","Holy bible","Bible apps","Bible study"]
    
    var imageArray2 = [UIImage(named:"ic_admin"),UIImage(named:"Doubts"),UIImage(named:"Gospel messages"),UIImage(named:"Quatation"),UIImage(named:"Scientific"),UIImage(named:"Suggestion"),UIImage(named:"Sunday school"),UIImage(named:"Testimonial"),UIImage(named:"Languages"),UIImage(named:"Login")]
    var imageNameArray2 = ["Admin","Doubts","Gospel messages","Quatation","Scientific","Suggestion","Sunday school","Testimonial","Languages","Login"]
    
    var arrImages = Array<UIImage>()

    
    var imageArray3 = [UIImage(named:"Events"),UIImage(named:"UpComelogo"),UIImage(named:"film"),UIImage(named:"help"),UIImage(named:"Map"),UIImage(named:"Donation"),UIImage(named:"Movies"),UIImage(named:"Songs"),UIImage(named:"Videos"),UIImage(named:"Donation"),UIImage(named:"pamphlet")]
    var imageNameArray3 = ["Events","UpComingEvents","film","help","Map","Donation","Movies","Songs","Videos","Donation","pamphlet"]

    
       var namesarra1 = ["Holy Bible","Audio Bible","Bible Study","Songs","Scientific Proofs","Gospel Messages","Short Messages","Images","Login id Creation","Help to develop the small churches","Book Shop","Movies","Daily Quotations","Video Songs","Testimonials","Quotations","Sunday School","Cell numbers for daily messages(Bulk sms)","Bible Apps","Short Films","Jobs","Route maps buds numbers","Events","Donation","Live","Doubts","Suggetions","Pamplets","languages(Tel/Eng)","Admin can add multiple menu pages"]
    
    var PageIndex = 1
    var totalPages : Int? = 0
    var totalRecords : Int? = 0
    
    var bannerImageScrollArray:[BannerImageScrollResultVo] = Array<BannerImageScrollResultVo>()
    
    var bannerImageArr = Array<UIImage>()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.bannerImageScrollAPICall()
        
        searchBar = UISearchBar()
        searchBar.sizeToFit()
        
        searchBar.delegate = self as? UISearchBarDelegate
        
        filteredData = sectionTittles
        
        searchController = UISearchController(searchResultsController: nil)
        searchController.searchResultsUpdater = self
        
        searchController.dimsBackgroundDuringPresentation = false
        
        let nibName  = UINib(nibName: "CategorieHomeCell" , bundle: nil)
        categorieTableView.register(nibName, forCellReuseIdentifier: "CategorieHomeCell")
        
        let nibName2  = UINib(nibName: "ScrollImagesCell" , bundle: nil)
        categorieTableView.register(nibName2, forCellReuseIdentifier: "ScrollImagesCell")
        
        self.navigationController?.navigationBar.barTintColor = #colorLiteral(red: 0.4039215686, green: 0.6705882353, blue: 0.8156862745, alpha: 1)
        self.navigationItem.title = "Telugu Churches".localize()
        
        
        searchBar.placeholder = "Telugu Churches"
        
        self.searchController.searchBar.delegate = self
        searchController.searchResultsUpdater = self
        searchController.dimsBackgroundDuringPresentation = false
        // definesPresentationContext = true
//        navigationItem.titleView  = searchController.searchBar
        
         navigationItem.titleView = searchBar
        
        
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
        
         definesPresentationContext = true
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    override func viewWillDisappear(_ animated: Bool) {
        
        super.viewWillDisappear(animated)
        searchController.searchBar.resignFirstResponder()
        
        self.searchController.isActive = false
        
        
    }
    
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        self.searchBar.showsCancelButton = true
        
//        if let searchText = searchController.searchBar.text {
//            
//            filteredData = searchText.isEmpty ? sectionTittles : sectionTittles.filter({(dataString: String) -> Bool in
//                
//                return (dataString.range(of: searchText) != nil)
//            })
//            
//                        categorieTableView.reloadData()
//        }
    }
    
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        searchActive = false;
    }
    
    private func searchBarTextDidEndEditing(searchBar: UISearchBar) {
        searchActive = false;
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchActive = false;
    }
    
    @objc(searchBarBookmarkButtonClicked:) func searchBarBookmarkButtonClicked(_ rchBar: UISearchBar) {
        searchActive = false;
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        filtered = data.filter({ (text) -> Bool in
            let tmp: NSString = text as NSString
            let range = tmp.range(of: searchText, options: NSString.CompareOptions.caseInsensitive)
            return range.location != NSNotFound
        })
        if(filtered.count == 0){
            searchActive = false;
        } else {
            searchActive = true;
        }
        self.categorieTableView.reloadData()
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.showsCancelButton = false
        searchBar.text = ""
//        if(filtered.count == 0){
            searchActive = false
//        } else {
//            searchActive = true;
//        }
        self.categorieTableView.reloadData()
        searchBar.resignFirstResponder()
        
        
    }
    
     func updateSearchResults(for searchController: UISearchController) {
    
//    func updateSearchResultsForSearchController(searchController: UISearchController) {
        
        if let searchText = searchController.searchBar.text {
            
            filteredData = searchText.isEmpty ? sectionTittles : sectionTittles.filter({(dataString: String) -> Bool in
                
                return (dataString.range(of: searchText) != nil)
            })
            
//            categorieTableView.reloadData()
        }
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
        

    
     func numberOfSections(in tableView: UITableView) -> Int {
        
        return 2
        
    }
    
     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        
        if section == 0 {
            
            return 1
            
        }
        else {
            
            if(searchActive) {
                return filtered.count
            }
            else {
                
                return data.count;
            }
        }
        
        
    }
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return  UITableViewAutomaticDimension
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiom.pad) {
            if indexPath.section == 0 {
                
                return 175.0
            }
            
            return 200.0
        }else{
            
            if indexPath.section == 0 {
                
                return 175.0
            }
            
            return 180.0
        }
        
        
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
       // let listStr:BannerImageScrollResultVo = bannerImageScrollArray[indexPath.row]

        if indexPath.section == 0 {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "ScrollImagesCell", for: indexPath) as! ScrollImagesCell
            
            
            cell.offSet = 0
            cell.timer = Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(doSomeAnimation), userInfo: nil, repeats: true)
            
            if bannerImageArr.count > 0 {
                
                cell.pageController.numberOfPages = bannerImageArr.count
                cell.scrollView.isPagingEnabled = true
                cell.scrollView.contentSize.height = 100
                cell.scrollView.backgroundColor = UIColor.white
                cell.scrollView.contentSize.width = UIScreen.main.bounds.size.width * CGFloat(bannerImageArr.count)
                cell.scrollView.showsHorizontalScrollIndicator = false
                
                cell.scrollView.delegate = self
                
                
                
                for (index, image) in bannerImageArr.enumerated() {
                    let image = image
                    let imageView = UIImageView(image: image)
                    imageView.contentMode = .scaleAspectFill
                    imageView.frame.size.width = UIScreen.main.bounds.size.width
                    imageView.backgroundColor = UIColor.white
                    imageView.frame.size.height = 80
                    imageView.frame.origin.x = CGFloat(index) * UIScreen.main.bounds.size.width
                    print(UIScreen.main.bounds.size.width)
                    
                    cell.scrollView.addSubview(imageView)
                }
                
            }
            else {
                
               self.arrImages += [UIImage(named:"j1")!,UIImage(named: "j2")!, UIImage(named: "jesues")!, UIImage(named: "skyJSU")!, UIImage(named: "j3")!, UIImage(named: "j4")!, UIImage(named: "j6")!, UIImage(named: "jesues")!]
                
                self.bannerImageArr = self.arrImages
                
                self.categorieTableView.reloadData()
            }
            
            return cell
        }
        else {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "CategorieHomeCell", for: indexPath) as! CategorieHomeCell
            
            cell.homeCollectionView.register(UINib.init(nibName: "CategorieCollectionViewCell", bundle: nil),
                                             forCellWithReuseIdentifier: "CategorieCollectionViewCell")
            
            if indexPath.row == 0 {
                
                cell.homeCollectionView.tag = indexPath.row
                cell.homeCollectionView.collectionViewLayout.invalidateLayout()
                cell.homeCollectionView.delegate = self
                cell.homeCollectionView.dataSource = self
                cell.moreButton.addTarget(self, action: #selector(categorieOneClicked(_:)), for: UIControlEvents.touchUpInside)
                
            }
            else if indexPath.row == 1 {
                
                cell.homeCollectionView.tag = indexPath.row
                cell.homeCollectionView.collectionViewLayout.invalidateLayout()
                cell.homeCollectionView.delegate = self
                cell.homeCollectionView.dataSource = self
                cell.moreButton.addTarget(self, action: #selector(categorieTwoClicked(_:)), for: UIControlEvents.touchUpInside)
            }
            else if indexPath.row == 2 {
                
                cell.homeCollectionView.tag = indexPath.row
                cell.homeCollectionView.collectionViewLayout.invalidateLayout()
                cell.homeCollectionView.delegate = self
                cell.homeCollectionView.dataSource = self
                cell.moreButton.addTarget(self, action: #selector(categorieThreeClicked(_:)), for: UIControlEvents.touchUpInside)
            }
            
//            cell.homeCollectionView.tag = indexPath.section
//            cell.homeCollectionView.collectionViewLayout.invalidateLayout()
//            cell.homeCollectionView.delegate = self
//            cell.homeCollectionView.dataSource = self
//            cell.moreButton.addTarget(self, action: #selector(categorieThreeClicked(_:)), for: UIControlEvents.touchUpInside)
            //        cell.categoriesNameLabel.text = "Event Posts"
            
            
            if(searchActive){
                cell.categoriesNameLabel?.text = filtered[indexPath.row]
            } else {
                cell.categoriesNameLabel?.text = data[indexPath.row];
            }
            
            
             return cell
        }        
       
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
        
//        if indexPath.row == (bannerImageScrollArray.count) - 1 {
//            
//            if(self.totalPages! > PageIndex){
//                
//                PageIndex = PageIndex + 1
//                
//                bannerImageScrollAPICall()
//                
//                
//                
//            }
//        }
    }
    
    func doSomeAnimation() {
        
        let indexPath = IndexPath.init(row: 0, section: 0)

        if let cell = categorieTableView.cellForRow(at: indexPath) as? ScrollImagesCell {
        
        let imgsCount:CGFloat = CGFloat(bannerImageArr.count)
        let pageWidth:CGFloat = cell.scrollView.frame.width
        let maxWidth:CGFloat = pageWidth * imgsCount
        let contentOffset:CGFloat = cell.scrollView.contentOffset.x
        
        var slideToX = contentOffset + pageWidth
        
        if  contentOffset + pageWidth == maxWidth{
            slideToX = 0
        }
        let currentPage:CGFloat = slideToX / pageWidth
        
        // print(currentPage)
        // Change the indicator
        cell.pageController.currentPage = Int(currentPage)
        cell.scrollView.scrollRectToVisible(CGRect(x:slideToX, y:0, width:pageWidth, height:cell.scrollView.frame.height), animated: true)
    }
    }
    //MARK: UIScrollView Delegate
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        let indexPath = IndexPath.init(row: 1, section: 0)
        
        if let cell = categorieTableView.cellForRow(at: indexPath) as? ScrollImagesCell {
        
        let viewWidth: CGFloat = cell.scrollView.frame.size.width
        // content offset - tells by how much the scroll view has scrolled.
        let pageNumber = floor((cell.scrollView.contentOffset.x - viewWidth / 50) / viewWidth) + 1
        cell.pageController.currentPage = Int(pageNumber)
    }
        
        searchController.searchBar.resignFirstResponder()
    }
    //MARK: Page tap action
    func pageChanged() {
        let indexPath = IndexPath.init(row: 1, section: 0)
        
        if let cell = categorieTableView.cellForRow(at: indexPath) as? ScrollImagesCell {
        
        let pageNumber = cell.pageController.currentPage
        var frame = cell.scrollView.frame
        frame.origin.x = frame.size.width * CGFloat(pageNumber)
        frame.origin.y = 0
        cell.scrollView.scrollRectToVisible(frame, animated: true)
    }
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
        churchDetailsViewController.categorieImageArray = self.imageArray as! Array<UIImage>
        churchDetailsViewController.categorieNamesArray = self.imageNameArray
        //churchDetailsViewController.bibleString = bibleNav
        churchDetailsViewController.bibleInt = 10
                    self.navigationController?.pushViewController(churchDetailsViewController, animated: true)
        
        print("Eye Button Clicked......")
        
    
        
    }
    func  categorieTwoClicked(_ sendre:UIButton) {
        
        
        
        
        let churchDetailsViewController = self.storyboard?.instantiateViewController(withIdentifier: "CategoriesHomeViewController") as! CategoriesHomeViewController
        churchDetailsViewController.categorieImageArray = self.imageArray2 as! Array<UIImage>
        churchDetailsViewController.categorieNamesArray = self.imageNameArray2
        churchDetailsViewController.bibleInt = 11

        self.navigationController?.pushViewController(churchDetailsViewController, animated: true)
        

        
        
    }
    func  categorieThreeClicked(_ sendre:UIButton) {
        
        let churchDetailsViewController = self.storyboard?.instantiateViewController(withIdentifier: "CategoriesHomeViewController") as! CategoriesHomeViewController
        churchDetailsViewController.categorieImageArray = self.imageArray3 as! Array<UIImage>
        churchDetailsViewController.categorieNamesArray = self.imageNameArray3
        churchDetailsViewController.bibleInt = 12

        self.navigationController?.pushViewController(churchDetailsViewController, animated: true)
      
    }
    
    //MARK: -  BannerImageScroll API Call
    
    func bannerImageScrollAPICall(){
        
        
            let strUrl = BANNERIMAGESURL + "" + "null"
        
            serviceController.getRequest(strURL:strUrl, success:{(result) in
                DispatchQueue.main.async()
                    {
            print(result)
            
            let respVO:BannerImageScrollVo = Mapper().map(JSONObject: result)!
            
            let isSuccess = respVO.isSuccess
            print("StatusCode:\(String(describing: isSuccess))")
            
            
            //      self.churchNamesArray.removeAll()
            
            
            if isSuccess == true {
                
                //self.listResultArray = respVO.listResult!
                
                let listArr = respVO.listResult!
                
                
                for eachArray in listArr{
                    //  print(self.churchNamesArray)
                    // print(eachArray)
                    
                    let imgUrl = eachArray.bannerImage!
                    
                    let newString = imgUrl.replacingOccurrences(of: "\\", with: "//", options: .backwards, range: nil)
                    
                    print("filteredUrlString:\(newString)")
                    
                    
                        let url = URL(string:newString)
                    
                        
                        let dataImg = try? Data(contentsOf: url!)
                        
                        if dataImg != nil {
                            
                            self.bannerImageArr.append(UIImage(data: dataImg!)!)
                        }
                    
                        
                    
//                    self.bannerImageArr.append(eachArray.bannerImage!)
                    //  print(self.churchNamesArray)
                }
                
//                print(self.bannerImageScrollArray.count)
                
                
            }
                
                
                self.categorieTableView.reloadData()
               
            }
                
            
        }) { (failureMessage) in
            
            
            print(failureMessage)
            
        }
        
        
        
    }
    

}


extension HomeViewController : UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    
    
    

    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        
         if  collectionView.tag == 0 {
            
            return imageArray.count
            
       }else if collectionView.tag  == 1 {
        
        
        return imageArray2.count

        }
         else {
            
            return imageArray3.count
        }
        
        
        
        
        
    }
    
    
    
    
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        
        if collectionView.tag  == 0 {
            
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CategorieCollectionViewCell", for: indexPath) as! CategorieCollectionViewCell
            
            cell.collectionImgView.image = imageArray[ indexPath.row]
            cell.nameLabel.text = imageNameArray[indexPath.row]
            
            let nibName  = UINib(nibName: "CategorieHomeCell" , bundle: nil)
            
            return cell
            
            
        } else if collectionView.tag  == 1 {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CategorieCollectionViewCell", for: indexPath) as! CategorieCollectionViewCell
        
        cell.collectionImgView.image = imageArray2[ indexPath.row]
         cell.nameLabel.text = imageNameArray2[indexPath.row]
        
        let nibName  = UINib(nibName: "CategorieHomeCell" , bundle: nil)
        
        
        return cell
        
        }
        else {
            
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CategorieCollectionViewCell", for: indexPath) as! CategorieCollectionViewCell
        
          cell.collectionImgView.image = imageArray3[ indexPath.row]
         cell.nameLabel.text = imageNameArray3[indexPath.row]
        
        let nibName  = UINib(nibName: "CategorieHomeCell" , bundle: nil)
        
        
        return cell
        }
        
        
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
    
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // handle tap events
        print("You selected cell #\(indexPath.item)!")
        
        if collectionView.tag  == 0 {
            
            //if indexPath.item == 0 {
                
                let churchDetailsViewController = self.storyboard?.instantiateViewController(withIdentifier: "ChurchDetailsViewController") as! ChurchDetailsViewController
            churchDetailsViewController.appVersion = imageNameArray[indexPath.item]
                self.navigationController?.pushViewController(churchDetailsViewController, animated: true)
                
          // }
        }
        else if collectionView.tag == 1{
            
         //   if indexPath.item == 0 {

            let churchAdminViewController = self.storyboard?.instantiateViewController(withIdentifier: "ChurchAdminViewController") as! ChurchAdminViewController
            churchAdminViewController.appVersion = imageNameArray2[indexPath.item]
            self.navigationController?.pushViewController(churchAdminViewController, animated: true)
          //  }
        }
        else if collectionView.tag == 2{
            if indexPath.item == 0 {

                let eventViewController = self.storyboard?.instantiateViewController(withIdentifier: "EventViewController") as! EventViewController
            eventViewController.appVersion = imageNameArray3[indexPath.item]
                self.navigationController?.pushViewController(eventViewController, animated: true)
                

            }
            if indexPath.item == 1 {
                
                let upConingEventInfoViewController = self.storyboard?.instantiateViewController(withIdentifier: "UpConingEventInfoViewController") as! UpConingEventInfoViewController
                upConingEventInfoViewController.appVersion = imageNameArray3[indexPath.item]
                self.navigationController?.pushViewController(upConingEventInfoViewController, animated: true)
                
                
            }

        }

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
}
}


