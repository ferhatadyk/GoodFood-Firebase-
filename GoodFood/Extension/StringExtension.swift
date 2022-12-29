//
//  StringExtension.swift
//  GoodFood
//
//  Created by Ferhat Adiyeke on 29.10.2022.
//

import Foundation


extension  String {
    var asUrl: URL? {
        return URL(string: self)
    }
}
