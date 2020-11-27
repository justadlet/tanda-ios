//
//  IngredientTableViewCell.swift
//  tanda
//
//  Created by Kuanysh Anarbay on 6/24/20.
//  Copyright © 2020 Kuanysh Anarbay. All rights reserved.
//

import UIKit

class IngredientTableViewCell: UITableViewCell {

    @IBOutlet weak var backLeading: NSLayoutConstraint!
    @IBOutlet weak var backView: UIView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var quantityLabel: UILabel!
    @IBOutlet weak var extraView: UIView!
    @IBOutlet weak var extraLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        
        extraView.layer.cornerRadius = 12
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
