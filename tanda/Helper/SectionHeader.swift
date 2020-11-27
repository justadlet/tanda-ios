//
//  SectionHeader.swift
//  Qolzhetimdi
//
//  Created by Kuanysh Anarbay on 5/8/20.
//  Copyright © 2020 Kuanysh Anarbay. All rights reserved.
//

import UIKit

protocol SectionHeaderProtocol {
    func buttonPressed(_ section: Int)
}
class SectionHeader: UITableViewHeaderFooterView {
    @IBOutlet weak var bottomSeparator: UIView!
    @IBOutlet weak var topSeparator: UIView!
    @IBOutlet weak var backView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var topView: UIView!
    @IBOutlet weak var bottomView: UIView!
    @IBOutlet weak var arrayImage: UIImageView!
    var section: Int = 0
    var delegate: SectionHeaderProtocol?
    
    
    @IBAction func buttonPressed(_ sender: Any) {
        delegate?.buttonPressed(section)
    }
    
}
