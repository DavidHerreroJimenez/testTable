// Package: testTable,
// File name: VehiculoTableViewCell.swift,
// Created by David Herrero on 14/11/2019.

import UIKit

class VehiculoTableViewCell: UITableViewCell {

    @IBOutlet weak var vehiculoTitleLabel: UILabel!
    @IBOutlet weak var vehiculoTextLabel: UILabel!
    @IBOutlet weak var vehiculoImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
