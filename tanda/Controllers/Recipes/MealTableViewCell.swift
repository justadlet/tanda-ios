//
//  MealTableViewCell.swift
//  tanda
//
//  Created by Kuanysh Anarbay on 6/22/20.
//  Copyright © 2020 Kuanysh Anarbay. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class MealTableViewCell: UITableViewCell {

    @IBOutlet weak var mainImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var avatarImage: UIImageView!
    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var likeButton: UIButton!
    @IBOutlet weak var saveButton: UIButton!
    @IBOutlet weak var cityLabel: UILabel!
    
    var chef: Chef = Chef() {
        didSet {
            self.authorLabel.text = chef.name
            self.avatarImage.setImage(from: chef.imageURL)
        }
    }
    var recipe: Recipe = Recipe() {
        didSet {
            self.mainImage.setImage(from: URL(string: recipe.images[0]))
            self.nameLabel.text = recipe.name
            self.categoryLabel.text = recipe.category
            self.cityLabel.text = recipe.chef_city
            self.likeButton.setTitle("\(recipe.likes)", for: .normal)
            let currentChefUrl = "\(Constants.chefsURL)/\(recipe.chef_id)"
            Alamofire.request(currentChefUrl).response(completionHandler: { (response) in
                if let data = response.data {
                    do {
                        self.chef = try JSONDecoder().decode(Chef.self, from: data)
//                        print(self.chef.name["first"])
//                        print(self.chef.name["last"])
//                        print(self.chef.fullName)
                    } catch {
                        print(currentChefUrl)
                        print("MealTableViewCell: Error while decoding chefs: \(error)")
                    }
                }
            })
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        
        mainImage.layer.cornerRadius = 14
        avatarImage.layer.cornerRadius = 14
        saveButton.layer.cornerRadius = 13
        likeButton.layer.cornerRadius = 13
//        saveButton.imageView = UIImage(systemName: "bookmark")
//        saveButton.imageView?.contentMode = .scaleAspectFit
        saveButton.imageEdgeInsets = UIEdgeInsets(top: 5, left: 7, bottom: 5, right: 7)
//        let currentUserId = User.currentUser?._id
//        if currentUserId == "" {
            saveButton.setImage(UIImage(systemName: "bookmark"), for: .normal)
//        } else {
//
//        }
    }

    
    @IBAction func savePressed(_ sender: Any) {
        UIView.animate(withDuration: 0.2) {
            self.saveButton.setImage(UIImage(systemName: "bookmark.fill"), for: .normal)
        }
    }
    
    
    @IBAction func likePressed(_ sender: Any) {
    }
    
    
}
