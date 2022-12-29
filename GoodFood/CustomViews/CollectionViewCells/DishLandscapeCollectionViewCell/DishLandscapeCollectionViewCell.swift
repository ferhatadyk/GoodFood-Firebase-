//
//  DishLandscapeCollectionViewCell.swift
//  GoodFood
//
//  Created by Ferhat Adiyeke on 30.10.2022.
//

import UIKit

class DishLandscapeCollectionViewCell: UICollectionViewCell {
    
    
    // MARK: -outlets
    @IBOutlet weak var dishImageView: UIImageView!
    @IBOutlet weak var descLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    
    // MARK: -variables
    static let identifier = String(describing: DishLandscapeCollectionViewCell.self)

    
    // MARK: -functions
    func setup(dish: Dish) {
        dishImageView.image = dish.image
        titleLabel.text = dish.name
        descLabel.text = dish.description
    }
   
    // MARK: -button
    @IBAction func AddBtn(_ sender: UIButton) {
    }
    

}
