//
//  accountViewController.swift
//  GoodFood
//
//  Created by Ferhat Adiyeke on 25.11.2022.
//

import UIKit
import Firebase

class accountViewController: UIViewController {
    
   
    
    // MARK: -outlets
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var mailLbl: UILabel!
    @IBOutlet weak var passwordLbl: UILabel!
    @IBOutlet weak var telLbl: UILabel!
    
    // MARK: -variables
    let databaseRef = Database.database(url: "https://goodfood-718da-default-rtdb.europe-west1.firebasedatabase.app/").reference()
    
    // MARK: -lifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        databaseRef.child("users").queryOrdered(byChild: "uid").queryEqual(toValue: Auth.auth().currentUser!.uid).observeSingleEvent(of: .value)  { (snapshot) in
            for child in snapshot.children{
                let snap = child as! DataSnapshot
                let dict = snap.value as! NSDictionary
                
                var name = ""
                name += dict["name"] as! String + "\n"
                self.nameLbl.text = name
                
               var mail = ""
                mail += dict["eposta"] as! String + "\n"
                self.mailLbl.text = mail
                
                var password = ""
                password += dict["password"] as! String + "\n"
                self.passwordLbl.text = password
                
                var phone = ""
                phone += dict["phone"] as! String + "\n"
                self.telLbl.text = phone
            }
        }
    }
    // MARK: -button
    @IBAction func editButton(_ sender: UIButton) {
    performSegue(withIdentifier: "accountDetailsVc", sender: nil)
    }
    
    @IBAction func accountDeleteBtn(_ sender: UIButton) {
        let alert = UIAlertController(title: "Delete", message: "Account Delete", preferredStyle: .alert)
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
    
    @IBAction func closeBtn(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
}
