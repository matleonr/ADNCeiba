//
//  VehicleTableViewCell.swift
//  Presentation
//
//  Created by Matt Leon on 12/12/20.
//

import Domain
import UIKit

class VehicleTableViewCell: UITableViewCell {
    @IBOutlet var typeImage: UIImageView!
    @IBOutlet var plateLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    func set(vehicle: Vehicle) {
        plateLabel.text = vehicle.getPlate()
    }

    func setImageType(vehicleType: String) {
        if vehicleType == "car" {
            typeImage.image = UIImage(systemName: "car.fill")
        } else {
            typeImage.image = UIImage(named: "byke")
        }
    }
}
