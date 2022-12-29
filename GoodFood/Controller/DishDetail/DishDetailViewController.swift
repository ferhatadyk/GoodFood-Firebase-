//
//  DishDetailViewController.swift
//  GoodFood
//
//  Created by Ferhat Adiyeke on 1.11.2022.
//

import UIKit

class DishDetailViewController: UIViewController {

    // MARK: -outlets
    
    @IBOutlet weak var dishImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var descriptionlbl: UILabel!
    @IBOutlet weak var noteTextField: UITextField!

    // MARK: -variables
    
    var dish: Dish!
    
    
    // MARK: -lifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
            populatedView()
    }
    // MARK: -functions
    
    private func populatedView() {
        
        dishImageView.image = dish.image
        titleLabel.text = dish.name
        descriptionlbl.text = dish.description
        priceLabel.text = dish.formattedPrice
    }
    // MARK: -button
    
    @IBAction func close(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func addClicked(_ sender: UIButton) {
       

        
        
    }
    
}
