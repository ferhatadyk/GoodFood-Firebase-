//
//  HomeViewController.swift
//  GoodFood
//
//  Created by Ferhat Adiyeke on 27.10.2022.
//

import UIKit
import Firebase

class HomeViewController: UIViewController {
    
    // MARK: -outlets
    @IBOutlet var categoryCollectionView: UICollectionView!
    @IBOutlet weak var popularCollectionsView: UICollectionView!
    @IBOutlet weak var allMealsCollectionView: UICollectionView!
    @IBOutlet weak var navName: UILabel!
    
    // MARK: -variables
    let databaseRef = Database.database(url: "https://goodfood-718da-default-rtdb.europe-west1.firebasedatabase.app/").reference()
    
    var categories: [DishCategory] = [
        .init(id: "id1", name: "Pizza", image: #imageLiteral(resourceName: "pizzeria") ),
        .init(id: "id1", name: "Hamburger", image: #imageLiteral(resourceName: "burger2")),
        .init(id: "id1", name: "Kebap", image: #imageLiteral(resourceName: "turk")),
        .init(id: "id1", name: "Coffee", image: #imageLiteral(resourceName: "coffee")),
        .init(id: "id1", name: "Cake", image: #imageLiteral(resourceName: "kebap"))]
    
    var populars: [Dish] = [
        .init(id: "id1", name: "Pizza", description: "Domates sos, mozzarella peyniri, ton balığı, yeşilbiber, ", image: #imageLiteral(resourceName: "pizzeria"), price: 75),
        .init(id: "id1", name: "Hamburger", description: "Domates sos, mozzarella peyniri, ton balığı, yeşilbiber", image: #imageLiteral(resourceName: "pizzeria"), price: 45),
        .init(id: "id1", name: "Lahmacun", description: "Domates sos, mozzarella peyniri, ton balığı, yeşilbiber", image: #imageLiteral(resourceName: "pizzeria"), price: 67)]
        
    var specials: [Dish] = [
        .init(id: "id1", name: "Tonno Pizza", description: "Domates sos, mozzarella peynıri, ton balığı, yeşilbiber", image: #imageLiteral(resourceName: "pizzeria"), price: 75),
        .init(id: "id1", name: "Hamburger", description: "Domates sos, mozzarella peyniri, ton balığı, yeşilbiber, mısır", image: #imageLiteral(resourceName: "pizzeria"), price: 45),
        .init(id: "id1", name: "Lahmacun", description: "Domates sos, mozzarella peyniri, ton balığı, yeşilbiber, mısır", image: #imageLiteral(resourceName: "pizzeria"), price: 67)]
    
    // MARK: -lifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        registerCells()
        databaseRef.child("users").queryOrdered(byChild: "uid").queryEqual(toValue: Auth.auth().currentUser!.uid).observeSingleEvent(of: .value)  { (snapshot) in
            for child in snapshot.children{
                let snap = child as! DataSnapshot
                let dict = snap.value as! NSDictionary
                var address = ""
                address += dict["address"] as! String + "\n"
                self.navName.text = address
            }
        }
    }
    // MARK: -functions
     func registerCells() {
        categoryCollectionView.register(UINib(nibName: CategoryCollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: CategoryCollectionViewCell.identifier)
        popularCollectionsView.register(UINib(nibName: DishPortraitCollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: DishPortraitCollectionViewCell.identifier)
        allMealsCollectionView.register(UINib(nibName: DishLandscapeCollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: DishLandscapeCollectionViewCell.identifier)
        
    }
}
// MARK: -extension

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch collectionView {
        case categoryCollectionView:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoryCollectionViewCell.identifier, for: indexPath) as! CategoryCollectionViewCell
            cell.setup(category: categories[indexPath.row])
            return cell
        case popularCollectionsView:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DishPortraitCollectionViewCell.identifier, for: indexPath) as! DishPortraitCollectionViewCell
            cell.setup(dish: populars[indexPath.row])
            
            return cell
        case allMealsCollectionView:
            let cell =  collectionView.dequeueReusableCell(withReuseIdentifier: DishLandscapeCollectionViewCell.identifier, for: indexPath) as! DishLandscapeCollectionViewCell
            cell.setup(dish: specials[indexPath.row])
            return cell
        default: return UICollectionViewCell()
        }
     }
    // MARK:  -collectioniview
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch collectionView {
        case categoryCollectionView:
            return categories.count
        case popularCollectionsView:
            return populars.count
        case allMealsCollectionView:
            return specials.count
        default: return 0
        }
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if  collectionView == categoryCollectionView {
            let controller =
            ListDishesViewController.instantiate()
            controller.dish = categories[indexPath.row]
            tabBarController?.present(controller, animated: true)
        } else {
            let
            controller = DishDetailViewController.instantiate()
            controller.dish = collectionView == popularCollectionsView ? populars[indexPath.row] : specials[indexPath.row]
            controller.modalPresentationStyle = .fullScreen
            tabBarController?.present(controller, animated: true, completion: nil)
        }
    }
}
