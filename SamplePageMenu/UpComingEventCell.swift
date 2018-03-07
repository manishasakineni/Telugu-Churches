//
//  UpComingEventCell.swift
//  Telugu Churches
//
//  Created by praveen dole on 3/7/18.
//  Copyright © 2018 Mac OS. All rights reserved.
//

import UIKit

class UpComingEventCell: UITableViewCell {

    @IBOutlet weak var chuechName: UILabel!
    
    @IBOutlet weak var eventTitle: UILabel!
    
    @IBOutlet weak var eventStart: UILabel!
    
    @IBOutlet weak var eventEndDate: UILabel!
    @IBOutlet weak var registrationNumber: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
