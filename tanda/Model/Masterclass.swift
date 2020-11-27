//
//  Masterclass.swift
//  tanda
//
//  Created by Адлет Зейнекен on 19.07.2020.
//  Copyright © 2020 Kuanysh Anarbay. All rights reserved.
//

import Foundation

class Masterclass: Codable {
    var _id:  String =  ""
    var name: String = ""
    var date: String = ""
    var recipe_id: String? = ""
//    var date: Date = Date()
    var limit: Int = 0
    var members: Int = 0
    var duration: Int = 0
    var price: Int = 0
    var image: String = ""
    var platform: [String : String] = [:]
    var terms: [String] = []
    var requirement: [[String : String]] = [[:]]
    var author_id: String = ""
    var imageURL: URL? {
        get {
            return URL(string: self.image)
        }
    }
    var getRequirements: String? {
        return "requirements"
    }
    
    init() {
        
    }
    
    init(_id: String, name: String, date: String, recipe_id: String, limit: Int, members: Int, duration: Int, price: Int, image: String, platform: [String : String], terms : [String], requirement: [[String : String]], author_id: String) {
        self._id = _id
        self.name = name
        self.date = date
        self.recipe_id = recipe_id
        self.limit = limit
        self.members = members
        self.duration = duration
        self.price = price
        self.image = image
        self.platform = platform
        self.terms = terms
        self.requirement = requirement
        self.author_id = author_id
    }

}
