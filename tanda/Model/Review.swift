//
//  Review.swift
//  tanda
//
//  Created by Адлет Зейнекен on 17.07.2020.
//  Copyright © 2020 Kuanysh Anarbay. All rights reserved.
//

import Foundation

class Review: Decodable {
    var images: [String?] = []
    var _id:  String? =  ""
    var receiver_id: String? = ""
    var body: String? = ""
    var createdAt: Date? = Date()
    var updatedAt: Date? = Date()
    var author_id: String? = ""
    var reply_to: String? = ""
    var rating: Int? = 0
}
