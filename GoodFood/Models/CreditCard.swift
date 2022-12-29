//
//  CreditCard.swift
//  GoodFood
//
//  Created by Ferhat Adiyeke on 24.12.2022.
//

import Foundation


struct CreditCard {
    var cardNo: String
    var MonthYear: String
    var CVV: String
    var holderName: String
    
    init(cardNo: String, MonthYear: String, CVV: String, holderName: String) {
        self.cardNo = cardNo
        self.MonthYear = MonthYear
        self.CVV = CVV
        self.holderName = holderName
    }
}
