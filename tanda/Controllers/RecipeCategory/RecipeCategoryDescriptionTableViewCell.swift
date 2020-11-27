//
//  CategoryDescriptionTableViewCell.swift
//  tanda
//
//  Created by Адлет Зейнекен on 12.07.2020.
//  Copyright © 2020 Kuanysh Anarbay. All rights reserved.
//

import UIKit

class RecipeCategoryDescriptionTableViewCell: UITableViewCell {
    
    @IBOutlet weak var recipeCategoryNameLabel: UILabel!
    @IBOutlet weak var recipeCategoryDescriptionLabel: UILabel!
    @IBOutlet weak var recipeCategoryCountLabel: UILabel!
    
    override class func awakeFromNib() {
        super.awakeFromNib()
    }
}
