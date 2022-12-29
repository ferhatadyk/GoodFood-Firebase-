//
//  Address.swift
//  GoodFood
//
//  Created by Ferhat Adiyeke on 25.12.2022.
//

import Foundation


struct AddressBig {
    var type: String
    var address: String
    var district: String
    var city: String
    
    init(type: String, address: String, district: String, city: String) {
        self.type = type
        self.address = address
        self.district = district
        self.city = city
    }
}
