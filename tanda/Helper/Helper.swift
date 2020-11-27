//
//  Helper.swift
//  tanda
//
//  Created by Kuanysh Anarbay on 6/22/20.
//  Copyright © 2020 Kuanysh Anarbay. All rights reserved.
//

import Foundation


public struct Callback: Codable {
    var status: Int = 200
    var message: String = ""
    
    init(_ status: Int, _ message: String) {
        self.status = status
        self.message = message
    }
}
