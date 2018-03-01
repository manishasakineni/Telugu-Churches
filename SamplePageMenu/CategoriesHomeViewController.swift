//
//  CategoriesHomeViewController.swift
//  Telugu Churches
//
//  Created by praveen dole on 3/1/18.
//  Copyright © 2018 Mac OS. All rights reserved.
//

import UIKit

class CategoriesHomeViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    
    @IBOutlet weak var categorieTableView: UITableView!
    
    
    var imageArray = [UIImage(named:"holybible"),UIImage(named:"Audio"),UIImage(named:"Seminor"),UIImage(named:"Songs"),UIImage(named:"books"),UIImage(named:"Churches"),UIImage(named:"live"),UIImage(named:"Seminor-1"),UIImage(named:"rootmap"),UIImage(named:"Science"),UIImage(named:"movies"),UIImage(named:"language"),UIImage(named:"jobs")]
    var imageArray2 = [UIImage(named:"donation"),UIImage(named:"bookshop"),UIImage(named:"Vedio"),UIImage(named:"holybible"),UIImage(named:"Audio"),UIImage(named:"Seminor"),UIImage(named:"Songs"),UIImage(named:"books"),UIImage(named:"Churches"),UIImage(named:"live"),UIImage(named:"Seminor-1"),UIImage(named:"rootmap"),UIImage(named:"Science"),UIImage(named:"movies"),UIImage(named:"language"),UIImage(named:"jobs"),UIImage(named:"donation")]
    
    //   var namesarra1 = ["Holy Bible","Audio Bible","Bible Study","Songs","Scientific Proofs","Gospel Messages","Short Messages","Images","Login id Creation","Help to develop the small churches","Book Shop","Movies","Daily Quotations","Video Songs","Testimonials","Quotations","Sunday School","Cell numbers for daily messages(Bulk sms)","Bible Apps","Short Films","Jobs","Route maps buds numbers","Events","Donation","Live","Doubts","Suggetions","Pamplets","languages(Tel/Eng)","Admin can add multiple menu pages"]
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let nibName  = UINib(nibName: "CategorieHomeCell" , bundle: nil)
        categorieTableView.register(nibName, forCellReuseIdentifier: "CategorieHomeCell")
        
        
        
        
        
        categorieTableView.dataSource = self
        categorieTableView.delegate = self
        
        
        //  self.navigationController?.isNavigationBarHidden = true
        
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
    public func numberOfSections(in tableView: UITableView) -> Int {
        
        
        return 2
        
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
        }
        let cell = tableView.dequeueReusableCell(withIdentifier: "CategorieHomeCell", for: indexPath) as! CategorieHomeCell
        
        cell.homeCollectionView.register(UINib.init(nibName: "CategorieCollectionViewCell", bundle: nil),
                                         forCellWithReuseIdentifier: "CategorieCollectionViewCell")
        cell.homeCollectionView.tag = indexPath.row
        
        
        cell.homeCollectionView.collectionViewLayout.invalidateLayout()
        
        
        cell.homeCollectionView.delegate = self
        cell.homeCollectionView.dataSource = self
        
        
        
        return cell
    }
    
    
    
}


extension CategoriesHomeViewController : UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    
    
    
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
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
