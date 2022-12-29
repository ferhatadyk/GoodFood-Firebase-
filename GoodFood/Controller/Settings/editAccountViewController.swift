//
//  editAccountViewController.swift
//  GoodFood
//
//  Created by Ferhat Adiyeke on 3.12.2022.
//

import UIKit
import Firebase

class editAccountViewController: UIViewController {
    
    // MARK: -outlets
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var mailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var telTextField: UITextField!
    
    // MARK: -variables
    var rowKey = ""
    let databaseRef = Database.database(url: "https://goodfood-718da-default-rtdb.europe-west1.firebasedatabase.app/").reference()

    // MARK: -lifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        databaseRef.child("users").queryOrdered(byChild: "uid").queryEqual(toValue: Auth.auth().currentUser!.uid).observeSingleEvent(of: .value)  { (snapshot) in
            for child in snapshot.children {
                let snap = child as! DataSnapshot
                let dict = snap.value as! NSDictionary
            
                self.rowKey = snap.key
                let name = dict["name"] as! String
                self.nameTextField.text = name
                
                let mail = dict["eposta"] as! String
                self.mailTextField.text = mail
                
                let password = dict["password"] as! String
                self.passwordTextField.text = password
                
                let tel = dict["phone"] as! String
                self.telTextField.text = tel
            }
        }
    }
    // MARK: -button
        @IBAction func save(_ sender: UIButton) {
            databaseRef.child("users").child(rowKey).child("name").setValue(self.nameTextField.text)
            performSegue(withIdentifier: "accountReturnVC", sender: nil)
        }
    
    @IBAction func kapat(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
}
