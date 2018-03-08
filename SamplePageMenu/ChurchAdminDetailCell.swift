//
//  ChurchAdminDetailCell.swift
//  Telugu Churches
//
//  Created by praveen dole on 2/22/18.
//  Copyright © 2018 Mac OS. All rights reserved.
//

import UIKit

class ChurchAdminDetailCell: UITableViewCell {

    @IBOutlet weak var backGroundView: UIView!
    @IBOutlet weak var adminNameLabel: UILabel!
    
    @IBOutlet weak var adminImageView: UIImageView!
    
    @IBOutlet weak var churchName: UILabel!
    
    @IBOutlet weak var mobileNumber: UILabel!
    
    @IBOutlet weak var email: UILabel!
    @IBOutlet weak var subscribeButtton: UIButton!
    
    
    
    override func awakeFromNib() {
        
        
        backGroundView.layer.cornerRadius = 3.0
        backGroundView.layer.shadowColor = UIColor(red: 113.0/255.0, green: 173.0/255.0, blue: 208.0/255.0, alpha: 1.0).cgColor
        backGroundView.layer.shadowOffset = CGSize(width: 0, height: 3)
        backGroundView.layer.shadowOpacity = 0.6
        backGroundView.layer.shadowRadius = 2.0

        
      //  adminImageView.layer.borderWidth = 1
//        // menuImgView.layer.borderColor = UIColor.black.cgColor
//        adminImageView.layer.cornerRadius = adminImageView.frame.height/2
//        adminImageView.clipsToBounds = true
//        
        adminImageView.layer.masksToBounds = false
        adminImageView.layer.cornerRadius = adminImageView.frame.height/2
        adminImageView.clipsToBounds = true
        adminImageView.layer.shadowColor = UIColor.lightGray.cgColor
        adminImageView.layer.shadowOffset = CGSize(width: 0, height: 3)
        adminImageView.layer.shadowOpacity = 0.6
        adminImageView.layer.shadowRadius = 0.5
      //  imageView.layer.cornerRadius = image.frame.size.width/2
        
        subscribeButtton.layer.cornerRadius = 1.0
        subscribeButtton.layer.borderWidth = 1
        subscribeButtton.layer.borderColor = UIColor.white.cgColor

        
        
        
        subscribeButtton.layer.cornerRadius = 3.0
        subscribeButtton.layer.shadowColor = UIColor(red: 113.0/255.0, green: 173.0/255.0, blue: 208.0/255.0, alpha: 1.0).cgColor
        subscribeButtton.layer.shadowOffset = CGSize(width: 0, height: 3)
        subscribeButtton.layer.shadowOpacity = 0.6
        subscribeButtton.layer.shadowRadius = 2.0

        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
