//
//  VehicleTableViewCell.swift
//  Presentation
//
//  Created by Matt Leon on 12/12/20.
//

import UIKit
import Domain

class VehicleTableViewCell: UITableViewCell {

    @IBOutlet weak var typeImage: UIImageView!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var plateLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func set (vehicle:Vehicle) {
        plateLabel.text = vehicle.getPlate()
        timeLabel.text = "\(String(describing: vehicle.getDayIn()))d"
        
            
            
    }
    
    
//    func setStatusImage(carStatus:String) {
//        if carStatus == "new" {
//            statusImage.image = UIImage(named: "newIcon")
//            statusImage.image = statusImage.image?.withRenderingMode(.alwaysTemplate)
//            statusImage.tintColor = UIColor(displayP3Red: 11/255, green: 176/255, blue: 26/255, alpha: 1)
//        }else {
//           statusImage.image = UIImage(named: "usedIcon")
//            statusImage.image = statusImage.image?.withRenderingMode(.alwaysTemplate)
//            statusImage.tintColor = UIColor(displayP3Red: 250/255, green: 120/255, blue: 24/255, alpha: 1)
//        }
//        
//    }

}
