//
//  OrdersViewController.swift
//  GoodFood
//
//  Created by Ferhat Adiyeke on 27.10.2022.
//

import UIKit

class OrdersViewController: UIViewController {

    
    // MARK: -outlets
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var totalLbl: UILabel!
    // MARK: -variables
    var orders: [Order] = [
        .init(id: "id", name: "Ferhat adiyeke", dish:   .init(id: "id1", name: "Tonno Pizza", description: "Domates sos, mozzarella peyniri, ton balığı, yeşilbiber, mısır", image: #imageLiteral(resourceName: "pizzeria"), price: 75)),
        .init(id: "id", name: "Ferhat adiyeke", dish:   .init(id: "id1", name: "Cheeseburger", description: "Domates sos, mozzarella peyniri, ton balığı, yeşilbiber, mısır", image: #imageLiteral(resourceName: "pizzeria"), price: 75))]
    
    var total = "150"
    // MARK: -lifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        registerCells()
        title = "Orders"
        totalLbl.text = total
    }
    
    // MARK: -functions
    private func registerCells() {
        tableView.register(UINib(nibName: DishListTableViewCell.identifier, bundle: nil), forCellReuseIdentifier: DishListTableViewCell.identifier)
    }
    // MARK: -button
    @IBAction func switchBtn(_ sender: UISwitch) {
    }
    @IBAction func AddOrderBtn(_ sender: UIButton) {
        performSegue(withIdentifier: "orderLastDetailsVC", sender: nil)
    }
}
// MARK: -extension
extension OrdersViewController: UITableViewDelegate, UITableViewDataSource {
    
    // MARK: -tableview
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return orders.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: DishListTableViewCell.identifier) as! DishListTableViewCell
        cell .setup(order: orders[indexPath.row])
        return cell
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            orders.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: UITableView.RowAnimation.fade)
        }
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let controller = DishDetailViewController.instantiate()
        controller.dish = orders[indexPath.row].dish
        tabBarController?.present(controller, animated: true, completion: nil)
    }
}
