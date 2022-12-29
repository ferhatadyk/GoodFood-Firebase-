//
//  ListDishesViewController.swift
//  GoodFood
//
//  Created by Ferhat Adiyeke on 1.11.2022.
//

import UIKit

class ListDishesViewController: UIViewController {
    
    // MARK: -outlets
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: -variables
    var dish: DishCategory!
    var dishes: [Dish] = [
        .init(id: "id1", name: "Pizza", description: "Ücretsiz teslimat", image: #imageLiteral(resourceName: "pizzeria"), price: 75),
        .init(id: "id1", name: "Hamburger", description: "Ücretsiz teslimat", image: #imageLiteral(resourceName: "pizzeria"), price: 45),
        .init(id: "id1", name: "Lahmacun", description: "Ücretsiz teslimat", image: #imageLiteral(resourceName: "pizzeria"), price: 67),
        .init(id: "id1", name: "Coffee", description: "Ücretsiz teslimat", image: #imageLiteral(resourceName: "pizzeria"), price: 34)]

    // MARK: -lifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        registerCells()
    }
    // MARK: -functions
    
    private func registerCells() {
        tableView.register(UINib(nibName: DishListTableViewCell.identifier, bundle: nil), forCellReuseIdentifier: DishListTableViewCell.identifier)
    }
}
// MARK: -extension

extension ListDishesViewController: UITableViewDelegate, UITableViewDataSource {
    
    // MARK: -tableview
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dishes.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell  = tableView.dequeueReusableCell(withIdentifier: DishListTableViewCell.identifier) as! DishListTableViewCell
        cell.setup(dish: dishes[indexPath.row])
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let controller = DishDetailViewController.instantiate()
        controller.dish = dishes[indexPath.row]
    }
    
}

