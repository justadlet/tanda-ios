//
//  RecipeCategoriesTableViewCell.swift
//  Tañda
//
//  Created by Kuanysh Anarbay on 6/22/20.
//  Copyright © 2020 Kuanysh Anarbay. All rights reserved.
//

import UIKit

class RecipeCategoriesTableViewCell: UITableViewCell {

    @IBOutlet weak var collectionView: UICollectionView!
    var productVC : UIViewController?
    var recipeCategories: [RecipeCategory] = [] {
        didSet {
            self.collectionView.reloadData()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()

//        collectionView.delegate = self
//        collectionView.dataSource = self
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}

extension RecipeCategoriesTableViewCell: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }

}
