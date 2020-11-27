//
//  ProgressTableViewCell.swift
//  tanda
//
//  Created by Kuanysh Anarbay on 6/24/20.
//  Copyright © 2020 Kuanysh Anarbay. All rights reserved.
//

import UIKit

class ProgressTableViewCell: UITableViewCell {

    @IBOutlet weak var thirdStep: UIView!
    @IBOutlet weak var secondStep: UIView!
    @IBOutlet weak var firstStep: UIView!
    @IBOutlet weak var stateLabel: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        firstStep.layer.cornerRadius = 2.5
        secondStep.layer.cornerRadius = 2.5
        thirdStep.layer.cornerRadius = 2.5
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
