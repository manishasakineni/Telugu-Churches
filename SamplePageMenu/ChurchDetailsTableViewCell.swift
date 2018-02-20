//
//  ChurchDetailsTableViewCell.swift
//  Telugu Churches
//
//  Created by N@n!'$ Mac on 19/02/18.
//  Copyright © 2018 Mac OS. All rights reserved.
//

import UIKit

class ChurchDetailsTableViewCell: UITableViewCell {

    @IBOutlet weak var churchImage: UIImageView!
    @IBOutlet weak var churchNameLbl: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        churchImage.layer.borderWidth = 1
        churchImage.layer.masksToBounds = false
        
       
        churchImage.clipsToBounds = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}