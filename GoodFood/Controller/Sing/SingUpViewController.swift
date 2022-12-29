//
//  SingUpViewController.swift
//  GoodFood
//
//  Created by Ferhat Adiyeke on 26.10.2022.
//

import UIKit
import Firebase
import FirebaseDatabase
class SingUpViewController: UIViewController {
    
    
    // MARK: -outlets
    @IBOutlet var nameSurnameTxtField: UITextField!
    @IBOutlet var singUpEmailTextField: UITextField!
    @IBOutlet var singUpAdressTextfield: UITextField!
    @IBOutlet var singUpPasswordTextField: UITextField!
    @IBOutlet var telTextField: UITextField!
    
    // MARK: -variables
    let databaseRef = Database.database(url: "https://goodfood-718da-default-rtdb.europe-west1.firebasedatabase.app/").reference()

    // MARK: -lifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        if FirebaseApp.app() == nil {
             FirebaseApp.configure()
         }
        let keyboardRecognizer = UITapGestureRecognizer(target: self, action: #selector(keyboardSecret))
        view.addGestureRecognizer(keyboardRecognizer)
    }
    
    // MARK: -functions
    @objc func keyboardSecret() {
        view.endEditing(true)
    }
    
   private func errorMessage(titleInput: String, messageInput: String) {
        let alert  = UIAlertController(title: titleInput, message: messageInput, preferredStyle: UIAlertController.Style.alert)
        let OKBtn = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
        alert .addAction(OKBtn)
        self.present(alert, animated: true, completion: nil)
    }
    
    // MARK: -button
    @IBAction func singUpClicked(_ sender: UIButton) {
        
        let name = nameSurnameTxtField.text!
        let eposta = singUpEmailTextField.text!
        let address = singUpAdressTextfield.text!
        let password = singUpPasswordTextField.text!
        let phone = telTextField.text!
       
        if nameSurnameTxtField.text != "" && singUpAdressTextfield.text != "" && singUpEmailTextField.text != "" &&
            telTextField.text != "" &&
            singUpPasswordTextField.text != "" {
            Auth.auth().createUser(withEmail: singUpEmailTextField.text!, password: singUpPasswordTextField.text!) { (authdataresult, error) in
                
                if error != nil {
                self.errorMessage(titleInput: "Error", messageInput: error?.localizedDescription ?? "You got an error please try again.")
                }else{
                    let userData = ["uid":Auth.auth().currentUser!.uid,
                                    "name":name,
                                    "eposta":eposta,
                                    "address":address,
                                    "password":password,
                                    "phone":phone]
                    self.databaseRef.child("users").childByAutoId().setValue(userData)
                    self.performSegue(withIdentifier: "doneSingUp", sender: nil)
                }
            }
        }else{
            errorMessage(titleInput: "Error!", messageInput: "Please enter your information.")
        }
    }
    
    @IBAction func toSingInDont(_ sender: UIButton) {
        performSegue(withIdentifier: "toAlreadySingIn", sender: nil)
    }
    
}
