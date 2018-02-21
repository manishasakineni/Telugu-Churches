//
//  InfoMapTableViewCell.swift
//  Telugu Churches
//
//  Created by Manoj on 21/02/18.
//  Copyright © 2018 Mac OS. All rights reserved.
//

import UIKit
import MapKit

class InfoMapTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var mapViewOutLet: MKMapView!
    
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
