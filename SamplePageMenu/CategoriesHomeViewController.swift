//
//  CategoriesHomeViewController.swift
//  Telugu Churches
//
//  Created by praveen dole on 3/1/18.
//  Copyright © 2018 Mac OS. All rights reserved.
//

import UIKit

class CategoriesHomeViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{

    

// this Importent

 @IBOutlet weak var collectionView: UICollectionView!
    
    
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
     var categorieImageArray = Array<UIImage>()
    var categorieNamesArray = Array<String>()

    var pageMenu : CAPSPageMenu?
    
    var bibleString = Bool()
    var bibleInt = Int()

    var appVersion          : String = ""
    
    var loginStatusString    =   String()
    

        var imageArray = [UIImage(named:"Bible apps"),UIImage(named:"Bible study"),UIImage(named:"Book shop"),UIImage(named:"Donation"),UIImage(named:"Doubts"),UIImage(named:"Events"),UIImage(named:"film"),UIImage(named:"Gospel messages"),UIImage(named:"Gospel"),UIImage(named:"help"),UIImage(named:"Holy bible"),UIImage(named:"Images"),UIImage(named:"Live"),UIImage(named:"Map"),UIImage(named:"Messages"),UIImage(named:"Movies"),UIImage(named:"pamphlet"),UIImage(named:"Quatation"),UIImage(named:"Scientific"),UIImage(named:"Songs"),UIImage(named:"Suggestion"),UIImage(named:"Sunday school"),UIImage(named:"Testimonial"),UIImage(named:"Videos"),UIImage(named:"ic_admin"),UIImage(named:"Languages"),UIImage(named:"Login"),UIImage(named:"pamphlet")]
    
    
    
       // var namesarra1 = ["Bible apps","Bible study","Book shop","Donation","Doubts","Events","film","Gospel messages","Gospel","help","Holy bible","Images","live","Map","Messages","Movies","pamphlet","Quatation","Scientific","Songs","Suggestion","Sunday school","Testimonial","Videos","Admin","Languages","Login","pamphlet"]
    
      //  var namesarra1 = ["Bible apps".localize(),"Bible study".localize(),"Book shop".localize(),"Donation".localize(),"Doubts".localize(),"Events".localize(),"film".localize(),"Gospel messages".localize(),"Gospel".localize(),"help".localize(),"Holy bible".localize(),"Images".localize(),"Languages".localize(),"Live".localize(),"Login".localize(),"Map".localize(),"Messages".localize(),"Movies".localize(),"pamphlet".localize(),"Quatation".localize(),"Scientific".localize(),"Songs".localize(),"Suggestion".localize(),"Sunday school".localize(),"Testimonial".localize(),"Videos".localize()]
    
    
    
    
    
    
        override func viewDidLoad() {
            super.viewDidLoad()
    
            print(kLoginSucessStatus)
    
    
            let defaults = UserDefaults.standard
    
            if let loginSucess = defaults.string(forKey: kLoginSucessStatus) {
                print(loginSucess)
                self.appDelegate.window?.makeToast(loginSucess, duration:kToastDuration, position:CSToastPositionCenter)
    
                print("defaults savedString: \(loginSucess)")
    
            }
            let cellColl = UINib(nibName: "homeCollectionViewCell", bundle: nil)
            collectionView.register(cellColl, forCellWithReuseIdentifier: "homeCollectionViewCell")
            collectionView.dataSource = self
            collectionView.delegate = self
            self.navigationController?.isNavigationBarHidden = false
    
        }

    

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        
        Utilities.categoriesViewControllerNavBarColorInCntrWithColor(backImage: "icons8-arrows_long_left", cntr:self, titleView: nil, withText: "Bible Posts", backTitle: " Bible Posts", rightImage: appVersion, secondRightImage: "Up", thirdRightImage: "Up")

        if bibleInt == 10 {
            
            Utilities.categoriesViewControllerNavBarColorInCntrWithColor(backImage: "icons8-arrows_long_left", cntr:self, titleView: nil, withText: "Bible Posts", backTitle: " Bible Posts", rightImage: appVersion, secondRightImage: "Up", thirdRightImage: "Up")

        }
        if bibleInt == 11 {
            
            Utilities.categoriesViewControllerNavBarColorInCntrWithColor(backImage: "icons8-arrows_long_left", cntr:self, titleView: nil, withText: "Categories", backTitle: " Categories", rightImage: appVersion, secondRightImage: "Up", thirdRightImage: "Up")
            
        }
        if bibleInt == 12 {
            
            Utilities.categoriesViewControllerNavBarColorInCntrWithColor(backImage: "icons8-arrows_long_left", cntr:self, titleView: nil, withText: "Events", backTitle: " Events", rightImage: appVersion, secondRightImage: "Up", thirdRightImage: "Up")
            
        }
    }





    func numberOfSections(in collectionView: UICollectionView) -> Int {

        return 1
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {

        return categorieImageArray.count



    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {



        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "homeCollectionViewCell", for: indexPath) as! homeCollectionViewCell

        cell.collectionImgView.image = categorieImageArray[ indexPath.row]
        cell.nameLabel.text = categorieNamesArray[indexPath.row]

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

        if indexPath.item == 0{
            
            if bibleInt == 10 {
                
                let churchDetailsViewController = self.storyboard?.instantiateViewController(withIdentifier: "ChurchDetailsViewController") as! ChurchDetailsViewController
                churchDetailsViewController.appVersion = categorieNamesArray[indexPath.item]
                self.navigationController?.pushViewController(churchDetailsViewController, animated: true)
                
                
            }
            if bibleInt == 11 {
                let churchDetailsViewController = self.storyboard?.instantiateViewController(withIdentifier: "ChurchAdminViewController") as! ChurchAdminViewController
                churchDetailsViewController.appVersion = categorieNamesArray[indexPath.item]

                self.navigationController?.pushViewController(churchDetailsViewController, animated: true)
                
            }
            if bibleInt == 12 {
                
                let holyBibleViewController = self.storyboard?.instantiateViewController(withIdentifier: "EventViewController") as! EventViewController
                holyBibleViewController.appVersion = categorieNamesArray[indexPath.item]

                self.navigationController?.pushViewController(holyBibleViewController, animated: true)
                
            }
            
        }
   
    }

    
    @IBAction func backLeftButtonTapped(_ sender:UIButton) {
        
        
        UserDefaults.standard.removeObject(forKey: kuserId)
        UserDefaults.standard.synchronize()
        
        //   navigationItem.leftBarButtonItems = []
        let rootController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SWRevealViewController") as! SWRevealViewController
        
        appDelegate.window?.rootViewController = rootController
        
        
        print("Back Button Clicked......")
        
    }
}
