//
//  addressViewController.swift
//  GoodFood
//
//  Created by Ferhat Adiyeke on 25.11.2022.

/*
import UIKit
import Firebase

class addressViewController: UIViewController {
    // MARK: -outlets
 
    @IBOutlet weak var tableView: UITableView!
  
    
 
    // MARK: -variables
 
 
    let databaseRef = Database.database(url: "https://goodfood-718da-default-rtdb.europe-west1.firebasedatabase.app/").reference()
    
    var toType = [String]()
    var adresss = [String]()
    // MARK: -lifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
     
        databaseRef.child("Address").queryOrdered(byChild: "uid").queryEqual(toValue: Auth.auth().currentUser!.uid).observeSingleEvent(of: .value)  { (snapshot) in
            for child in snapshot.children{
                let snap = child as! DataSnapshot
                let dict = snap.value as! NSDictionary
                
                var toType = ""
                toType += dict["addressType"] as! String + "\n"
                self.toType = toType
                
               var adress = ""
                adress += dict["adress"] as! String + "\n"
                self.adresss.text = adress
            }
        }
        self.tableView.reloadData()
    }
    // MARK: -button
    @IBAction func close(_ sender: UIButton) {
     dismiss(animated: true, completion: nil)
    }
    @IBAction func addAdressBtn(_ sender: UIButton) {
        performSegue(withIdentifier: "addAdressVC", sender: nil)
    }
}
// MARK: -extension
extension addressViewController: UITableViewDelegate, UITableViewDataSource {
// MARK: -tableview
func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return adresss.count
}
func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
    cell.textLabel?.text = toType[indexPath.row]
    cell.detailTextLabel?.text = adresss[indexPath.row]
    return cell
}
func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    let segueIdentifier: String
    switch indexPath.row {
    case 0:
        segueIdentifier = "addAdressVC"
    case 1:
        segueIdentifier = "addAdressVC"
    default:
        segueIdentifier = "addAdressVC"
    }
    self.performSegue(withIdentifier: segueIdentifier, sender: self)
    }
 }
 /**/*/
