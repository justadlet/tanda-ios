//
//  RecipeCategory.swift
//  Tañda
//
//  Created by Kuanysh Anarbay on 6/22/20.
//  Copyright © 2020 Kuanysh Anarbay. All rights reserved.
//

import Foundation

class RecipeCategory: Codable {
    var name: String = ""
    var description: String = ""
    var image: String = ""
    var _id:  String =  ""
    var count: Int = 0
    var imageURL: URL? {
        get {
            return URL(string: self.image)
        }
    }
    
}
