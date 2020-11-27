//
//  Chefs.swift
//  tanda
//
//  Created by Адлет Зейнекен on 10.07.2020.
//  Copyright © 2020 Kuanysh Anarbay. All rights reserved.
//

import Foundation

class Chef: Codable {
    var name: String = ""
    var about: String = ""
    var image: String = ""
    var _id:  String =  ""
    var price: Int = 0
    var rating: [Int] = []
    var recipes: Int = 0
    var orders: Int = 0
    var lessons: Int = 0
    var imageURL: URL? {
        get {
            return URL(string: self.image)
        }
    }
    var averageRating: String? {
        get {
            let sum = rating[0] + rating[1] * 2 + rating[2] * 3  + rating[3] * 4 + rating[4] * 5
            let size = rating[0] + rating[1] + rating[2] + rating[3] + rating[4]
            return String(format: "%.1f", Double(Double(sum) / Double(size)))
        }
    }
}
