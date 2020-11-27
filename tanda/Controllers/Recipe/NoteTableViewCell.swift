//
//  NoteTableViewCell.swift
//  tanda
//
//  Created by Kuanysh Anarbay on 6/24/20.
//  Copyright © 2020 Kuanysh Anarbay. All rights reserved.
//

import UIKit

class NoteTableViewCell: UITableViewCell {

    @IBOutlet weak var countView: UIView!
    @IBOutlet weak var backView: UIView!
    @IBOutlet weak var noteLabel: UILabel!
    @IBOutlet weak var adVIew: UIView!
    @IBOutlet weak var adImage: UIImageView!
    @IBOutlet weak var adNameLabel: UILabel!
    @IBOutlet weak var adDetailLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        countView.layer.cornerRadius = 12
        backView.layer.shadowColor = UIColor(named: "Shadow")?.cgColor
        backView.layer.shadowOpacity = 1
        backView.layer.shadowRadius = 10
        backView.layer.cornerRadius = 10
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
