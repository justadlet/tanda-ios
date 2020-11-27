//
//  ChefTableViewCell.swift
//  tanda
//
//  Created by Kuanysh Anarbay on 6/22/20.
//  Copyright © 2020 Kuanysh Anarbay. All rights reserved.
//

import UIKit

class ChefTableViewCell: UITableViewCell {

    @IBOutlet weak var mainImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    
    var chef: Chef = Chef() {
        didSet {
            self.mainImage.setImage(from: chef.imageURL)
            self.nameLabel.text = chef.name
            self.priceLabel.text = "\(chef.price)₸"
            self.ratingLabel.text = chef.averageRating ?? "0"
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        mainImage.layer.cornerRadius = 14
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}
