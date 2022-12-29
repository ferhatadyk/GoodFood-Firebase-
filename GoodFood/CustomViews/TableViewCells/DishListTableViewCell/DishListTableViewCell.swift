//
//  DishListTableViewCell.swift
//  GoodFood
//
//  Created by Ferhat Adiyeke on 1.11.2022.
//

import UIKit

class DishListTableViewCell: UITableViewCell {
    
    
    
    // MARK: -outlets
    
    @IBOutlet weak var dishImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionlbl: UILabel!
    
    // MARK: -variables
    static let identifier = "DishListTableViewCell"
    
    
    // MARK: -functions
    
    func setup(dish: Dish) {
        dishImageView.image = dish.image
        titleLabel.text = dish.name
        descriptionlbl.text = dish.description
    }
    
    func setup(order: Order) {
        dishImageView.image = order.dish?.image
        titleLabel.text = order.dish?.name
        descriptionlbl.text = order.dish?.description
    }
    
    
}
