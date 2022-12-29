//
//  Users.swift
//  GoodFood
//
//  Created by Ferhat Adiyeke on 1.12.2022.
//

import Foundation

enum UserType {
    case gold
    case silver
    case bronz
}

class Users {
    
    var name: String
    var email: String
    var password: String
    var type: UserType
    
    init(name: String, email: String, password: String, type: UserType) {
        self.name = name
        self.email = email
        self.password = password
        self.type = type
    }

    }


    

