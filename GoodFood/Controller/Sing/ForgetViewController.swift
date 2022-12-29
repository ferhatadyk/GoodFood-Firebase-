//
//  ForgetViewController.swift
//  GoodFood
//
//  Created by Ferhat Adiyeke on 27.10.2022.
//

import UIKit
import Firebase
import FirebaseAuth
import CryptoKit
import AuthenticationServices

class ForgetViewController: UIViewController {
    
    
    // MARK: -outlets
    @IBOutlet var forgetEmail: UITextField!
    
    // MARK: -lifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        let keyboardRecognizer = UITapGestureRecognizer(target: self, action: #selector(keyboardSecret))
        view.addGestureRecognizer(keyboardRecognizer)
        
    }
    // MARK: -functions
    @objc func keyboardSecret() {
        view.endEditing(true)
    }
    
    // MARK: -button
    @IBAction func confirmClicked(_ sender: UIButton) {
        let auth = Auth.auth()
        auth.sendPasswordReset(withEmail: forgetEmail.text!) { (error) in
            if let error = error {
              //  let alert = service.createAlertController(title: "Error", message: error.localizedDescription)
             //   self.present(alert, animated: true, completion: nil)
                return
            }
        }
       // performSegue(withIdentifier: "toForgetToSignIn", sender: nil)
    }
}
