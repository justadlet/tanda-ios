//
//  User.swift
//  tanda
//
//  Created by Kuanysh Anarbay on 6/22/20.
//  Copyright © 2020 Kuanysh Anarbay. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class User: Decodable {
    
    var phoneNumber: String = ""
    var name: String = ""
    var image: String = ""
    var token: String = ""
    var _id: String = ""
    static var currentUser: User? {
        get {
            if let user = UserDefaults.standard.dictionary(forKey: "user") as? [String: String] {
                let currentUser = User()
                currentUser.phoneNumber = user["phoneNumber"] ?? ""
                currentUser.name = user["name"] ?? ""
                currentUser.image = user["image"] ?? ""
                currentUser.token = user["token"] ?? ""
                currentUser._id = user["_id"] ?? ""
                
                return currentUser
            } else {
                return nil
            }
        }
    }
    
    init() {
        
    }
    
    init(_ json: [String: Any]) {
        self._id = json["_id"] as? String ?? ""
        self.phoneNumber = json["phoneNumber"] as? String ?? ""
        self.name = json["name"] as? String ?? ""
        self.image = json["image"] as? String ?? ""
        self.token = json["token"] as? String ?? ""
    }
    
    
    func save(){
        UserDefaults.standard.set([
            "name": self.name,
            "phoneNumber": self.phoneNumber,
            "token": self.token,
            "_id": self._id,
            "image": self.image,
        ], forKey: "user")
    }
    

    static func sendCode(_ phoneNumber: String, completion: @escaping(Callback) -> Void) {
        Alamofire.request("\(Constants.authURL)/phone", method: .post, parameters: ["phoneNumber": phoneNumber], encoding: JSONEncoding.default, headers: nil).response { (data) in
            if let response = data.response {
                if response.statusCode == 200 {
                    completion(Callback(200, "Добро пожаловать"))
                } else {
                    completion(Callback(404, "Возникла ошибка"))
                }
            } else {
                completion(Callback(404, "Нет соединения"))
            }
        }
    }
    
    static func confirmCode(_ phoneNumber: String, _ code: String, completion: @escaping(Callback, User?) -> Void) {
        Alamofire.request("\(Constants.authURL)/verify", method: .post, parameters: [
            "phoneNumber": phoneNumber,
            "code": code
        ], encoding: JSONEncoding.default, headers: nil).response { (data) in
            if let response = data.response {
                if let data = data.data {
                    do {
                        let json = try JSON(data: data)
                        if let dictionary = json.dictionaryObject {
                            let user = User(dictionary)
                            user.save()
                            completion(Callback(response.statusCode, "Добро пожаловать"), user)
                        } else {
                            completion(Callback(404, "Возникла ошибка"), nil)
                        }
                    } catch {
                        completion(Callback(404, "Нет соединения"), nil)
                    }
                } else {
                   completion(Callback(404, "Нет соединения"), nil)
                }
            } else {
                completion(Callback(404, "Нет соединения"), nil)
            }
        }
    }
}
