//
//  Dish.swift
//  GoodFood
//
//  Created by Ferhat Adiyeke on 30.10.2022.
//

import UIKit
struct Dish {
    let id: String?
    let name: String?
    let description: String?
    let image: UIImage?
    let price: Int?
    
    var formattedPrice: String {
        return "\(price ?? 0) ₺"
        
        
    }
    
}
