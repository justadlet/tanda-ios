//
//  PriceTableViewCell.swift
//  tanda
//
//  Created by Kuanysh Anarbay on 6/25/20.
//  Copyright © 2020 Kuanysh Anarbay. All rights reserved.
//

import UIKit

class PriceTableViewCell: UITableViewCell {

    
    @IBOutlet weak var sumLabel: UILabel!
    @IBOutlet weak var deliveryLabel: UILabel!
    @IBOutlet weak var couponLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
