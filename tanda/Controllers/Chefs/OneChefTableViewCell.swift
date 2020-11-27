//
//  OneChefTableViewCell.swift
//  tanda
//
//  Created by Адлет Зейнекен on 14.07.2020.
//  Copyright © 2020 Kuanysh Anarbay. All rights reserved.
//

import UIKit

class OneChefTableViewCell: UITableViewCell {
    
    @IBOutlet weak var chefImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var aboutLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var ordersLabel: UILabel!
    @IBOutlet weak var recipesLabel: UILabel!
    @IBOutlet weak var lessonsLabel: UILabel!
    
    var chef = Chef() {
        didSet {
            chefImage.setImage(from: chef.imageURL)
            nameLabel.text = chef.name
            aboutLabel.text = chef.about
            ratingLabel.text = chef.averageRating ?? "0"
            ordersLabel.text = "\(chef.orders)"
            recipesLabel.text = "\(chef.recipes)"
            lessonsLabel.text = "\(chef.lessons)"
            chefImage.layer.cornerRadius = 14
        }
    }
    override class func awakeFromNib() {
        super.awakeFromNib()
    }
}
