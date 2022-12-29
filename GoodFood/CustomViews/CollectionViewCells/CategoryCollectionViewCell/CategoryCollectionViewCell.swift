//
//  CategoryCollectionViewCell.swift
//  GoodFood
//
//  Created by Ferhat Adiyeke on 28.10.2022.
//

import UIKit
import Firebase

class CategoryCollectionViewCell: UICollectionViewCell {

    
   
    // MARK: -outlets
    @IBOutlet var categoryImageView: UIImageView!
    @IBOutlet var categoryTitleLabel: UILabel!
    
    
    // MARK: -variables
    static let identifier = String(describing: CategoryCollectionViewCell.self)
    
    
    // MARK: -functions
    
    func setup(category: DishCategory) {
        categoryTitleLabel.text = category.name
        categoryImageView.image = category.image
        
    }
}


