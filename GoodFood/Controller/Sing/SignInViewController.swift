//
//  SignInViewController.swift
//  GoodFood
//
//  Created by Ferhat Adiyeke on 26.10.2022.
//

import UIKit
import Firebase

class SignInViewController: UIViewController {
    
    // MARK: -outlets
    @IBOutlet var signInEmailTxtField: UITextField!
    @IBOutlet var signInPasswordTxtField: UITextField!
    
    // MARK: -lifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        let keyboardRecognizer = UITapGestureRecognizer(target: self, action: #selector(keyboardSecret))
        view.addGestureRecognizer(keyboardRecognizer)
    }
    // MARK: -button
    @IBAction func forgetBtn(_ sender: UIButton) {
        performSegue(withIdentifier: "toForget", sender: nil)
    }
    
    @IBAction func signInClick(_ sender: UIButton) {
        if signInEmailTxtField.text != "" && signInPasswordTxtField.text != "" {
            Auth.auth().signIn(withEmail: signInEmailTxtField.text!, password: signInPasswordTxtField.text!) { (authdataresult, error) in
                if error != nil {
                    self.errorMessage(titleInput: "Error", messageInput: error?.localizedDescription ?? "You got an error please try again.")
                }
                else {
                    self.performSegue(withIdentifier: "toHomeVC", sender: nil)
                }
            }
        } else {
            self.errorMessage(titleInput: "Error", messageInput: "Enter your email and password")
        }
    }
    
    @IBAction func singUpDont(_ sender: UIButton) {
        performSegue(withIdentifier: "toSingUp", sender: nil)
    }
    
    // MARK: -functions
    
    @objc func keyboardSecret() {
        view.endEditing(true)
    }
    
    func errorMessage(titleInput: String, messageInput: String) {
        let alert  = UIAlertController(title: titleInput, message: messageInput, preferredStyle: UIAlertController.Style.alert)
        let OKBtn = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
        alert .addAction(OKBtn)
        self.present(alert, animated: true, completion: nil)
    }
}
