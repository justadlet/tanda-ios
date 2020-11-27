//
//  lessonTableViewCell.swift
//  tanda
//
//  Created by Адлет Зейнекен on 14.07.2020.
//  Copyright © 2020 Kuanysh Anarbay. All rights reserved.
//

import UIKit

class LessonTableViewCell: UITableViewCell {
    
    @IBOutlet weak var mainImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var durationLabel: UILabel!
    @IBOutlet weak var requirementsLabel: UILabel!
    
    var lesson = Masterclass() {
        didSet {
            mainImage.setImage(from: lesson.imageURL)
            mainImage.layer.cornerRadius = 14
            nameLabel.text = lesson.name
            dateLabel.text = lesson.date
            durationLabel.text = "\(lesson.duration) мин"
            requirementsLabel.text = lesson.getRequirements
        }
    }
    override class func awakeFromNib() {
        super.awakeFromNib()
        
    }
}
