//
//  ReviewImageCollectionViewCell.swift
//  tanda
//
//  Created by Адлет Зейнекен on 17.07.2020.
//  Copyright © 2020 Kuanysh Anarbay. All rights reserved.
//

import UIKit

class ReviewImageCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!
    var image: String = "" {
        didSet {
            imageView.setImage(from: URL(string: image))
//            imageView.layer.cornerRadius = 14
        }
    }
    override class func awakeFromNib() {
        super.awakeFromNib()
    }
}
