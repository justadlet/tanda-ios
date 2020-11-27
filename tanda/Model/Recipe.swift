//
//  Recipe.swift
//  tanda
//
//  Created by Адлет Зейнекен on 10.07.2020.
//  Copyright © 2020 Kuanysh Anarbay. All rights reserved.
//

import Foundation

class Recipe: Codable {
    var _id:  String =  ""
    var name: String = ""
    var likes: Int = 0
    var category: String = ""
    var chef_city: String = ""
    var chef_id: String = ""
    var order_price: Int = 0
    var consultation_price: Int = 0
    var images: [String] = []
    var imageURL: URL? {
        get {
            if images.count > 0 {
                return URL(string: self.images[0])
            }
            return URL(string: "")
        }
    }
}
