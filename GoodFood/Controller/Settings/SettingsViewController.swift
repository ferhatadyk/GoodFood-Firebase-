//
//  SettingsViewController.swift
//  GoodFood
//
//  Created by Ferhat Adiyeke on 27.10.2022.
//

import UIKit
import Firebase

class SettingsViewController: UIViewController {
    
  
    // MARK: -outlets
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: -variables
   var data = [String]()
    
    // MARK: -lifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        data = ["Account","Payment Methods","Address "]
        tableView.delegate = self
        tableView.dataSource = self
        title = "Settings"
    }
    // MARK: -button
    @IBAction func logoutBtn(_ sender: UIButton) {
       
        let alert = UIAlertController(title: "Log Out", message: "Account Log Out", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { (UIAlertAction)  in
            do {
                    try Auth.auth().signOut()
                self.performSegue(withIdentifier: "exitToSingIn", sender: nil)
                  } catch {
                  print("Error")
                  }
            }))
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
}
    // MARK: -extension
extension SettingsViewController: UITableViewDelegate, UITableViewDataSource {
    // MARK: -tableview
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = data[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let segueIdentifier: String
        switch indexPath.row {
        case 0:
            segueIdentifier = "accountVC"
        case 1:
            segueIdentifier = "paymentVC"
        default:
            segueIdentifier = "addressVC"
        }
        self.performSegue(withIdentifier: segueIdentifier, sender: self)
    }
   //performSegue(withIdentifier: "accountVC", sender: nil)
    
}
