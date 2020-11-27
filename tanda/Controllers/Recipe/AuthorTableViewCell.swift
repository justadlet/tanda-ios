//
//  AuthorTableViewCell.swift
//  tanda
//
//  Created by Kuanysh Anarbay on 6/24/20.
//  Copyright © 2020 Kuanysh Anarbay. All rights reserved.
//

import UIKit

class AuthorTableViewCell: UITableViewCell {

    @IBOutlet weak var backView: UIView!
    @IBOutlet weak var aboutLabel: UILabel!
    @IBOutlet weak var authorImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var starLabel: UILabel!
    @IBOutlet weak var recipeLabel: UILabel!
    @IBOutlet weak var orderLabel: UILabel!
    @IBOutlet weak var lessonLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    
        
        aboutLabel.text = "Кондитер с Дипломом 👩🏻‍🎓Если вы любите вкусно печь и готовить то вам СЮДАLorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolorIn awe of the magical landscape that is Joshua Tree. I am a desert dreamer a photographer, photo editor, teacher, producer, rep, and a maker of candles and hand balms. I love to travel, laugh and enjoy everyday to the fullest."
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
