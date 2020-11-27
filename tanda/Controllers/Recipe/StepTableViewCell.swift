//
//  StepTableViewCell.swift
//  tanda
//
//  Created by Kuanysh Anarbay on 6/24/20.
//  Copyright © 2020 Kuanysh Anarbay. All rights reserved.
//

import UIKit

class StepTableViewCell: UITableViewCell {

    @IBOutlet weak var stepView: UIView!
    @IBOutlet weak var backView: UIView!
    @IBOutlet weak var stepLabel: UILabel!
    @IBOutlet weak var mainImage: UIImageView!
    @IBOutlet weak var countLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        stepView.layer.cornerRadius = 12
        
        backView.layer.shadowColor = UIColor(named: "Shadow")?.cgColor
        backView.layer.shadowOpacity = 1
        backView.layer.shadowRadius = 10
        backView.layer.cornerRadius = 10
        mainImage.layer.cornerRadius = 10
        mainImage.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
