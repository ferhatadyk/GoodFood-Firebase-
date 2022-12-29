//
//  Route.swift
//  GoodFood
//
//  Created by Ferhat Adiyeke on 6.12.2022.
//

import Foundation

enum Route {
    static let baseURL = ""
    
    case temp
    var description: String  {
        switch self {
        case .temp: return "/temp"
            
        }
        
    }
    
}
