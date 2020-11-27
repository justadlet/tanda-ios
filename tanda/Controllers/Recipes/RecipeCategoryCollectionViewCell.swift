//
//  RecipeCategoryCollectionViewCell.swift
//  Tañda
//
//  Created by Kuanysh Anarbay on 6/22/20.
//  Copyright © 2020 Kuanysh Anarbay. All rights reserved.
//

import UIKit

class RecipeCategoryCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var countLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    var recipeCategory: RecipeCategory = RecipeCategory() {
        didSet {
            self.countLabel.text = recipeCategory.count.declension
            self.nameLabel.text = recipeCategory.name
            self.imageView.setImage(from: recipeCategory.imageURL)
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        imageView.layer.cornerRadius = 14
    }
    
}
