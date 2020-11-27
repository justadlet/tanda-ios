//
//  RecipeTopTableViewCell.swift
//  tanda
//
//  Created by Kuanysh Anarbay on 6/24/20.
//  Copyright © 2020 Kuanysh Anarbay. All rights reserved.
//

import UIKit

class RecipeTopTableViewCell: UITableViewCell {

    
    
    @IBOutlet weak var lessonButton: UIView!
    @IBOutlet weak var orderButton: UIView!
    @IBOutlet weak var authorImage: UIImageView!
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var backView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    
        orderButton.layer.cornerRadius = 8
        orderButton.layer.borderColor = UIColor.backgroundColor.cgColor
        orderButton.layer.borderWidth = 1
        lessonButton.layer.cornerRadius = 8
        lessonButton.layer.borderColor = UIColor.backgroundColor.cgColor
        lessonButton.layer.borderWidth = 1
        backView.layer.cornerRadius = 12
        backView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
