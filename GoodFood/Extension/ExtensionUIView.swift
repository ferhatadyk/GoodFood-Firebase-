//
//  ExtensionUIView.swift
//  GoodFood
//
//  Created by Ferhat Adiyeke on 24.10.2022.
//

import UIKit

extension UIView {
    @IBInspectable var cornerRadius: CGFloat {
        get {return cornerRadius}
        set {self.layer.cornerRadius  = newValue
        }
    }
}
