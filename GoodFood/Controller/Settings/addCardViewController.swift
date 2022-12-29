//
//  addCardViewController.swift
//  GoodFood
//
//  Created by Ferhat Adiyeke on 29.11.2022.
//

import UIKit
import Firebase

class addCardViewController: UIViewController {
    
    // MARK: -outlets
    @IBOutlet weak var cardNoTextField: UITextField!
    @IBOutlet weak var dateTextField: UITextField!
    @IBOutlet weak var cardName: UITextField!
    @IBOutlet weak var cvvTextField: UITextField!
    // MARK: -variables
    var credit : CreditCard?
    let databaseRef = Database.database(url: "https://goodfood-718da-default-rtdb.europe-west1.firebasedatabase.app/").reference()
    
    
    // MARK: -lifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        if FirebaseApp.app() == nil {
            FirebaseApp.configure()
        }
        let keyboardRecognizer = UITapGestureRecognizer(target: self, action: #selector(keyboardSecret))
        view.addGestureRecognizer(keyboardRecognizer)
        
        cardNoTextField.text = credit?.cardNo
        dateTextField.text = credit?.MonthYear
        cardName.text = credit?.holderName
        cvvTextField.text = credit?.CVV
        
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
    @IBAction func close(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func fastPayBtn(_ sender: UISwitch) {
    }
    
    @IBAction func addNewCardBtn(_ sender: UIButton) {
        
        let cardNo = cardNoTextField.text!
        let date = dateTextField.text!
        let Dname = cardName.text!
        let cvv = cvvTextField.text!
        
        if cardNoTextField.text != "" && dateTextField.text != "" && cardName.text != "" && cvvTextField.text != "" {
            
            let cardData = ["uid":Auth.auth().currentUser!.uid,
                            "cardNo" : cardNo,
                            "date" : date,
                            "Dname" : Dname,
                            "cvv" : cvv] as [String : Any]
            self.databaseRef.child("Card").childByAutoId().setValue(cardData)
            //  self.performSegue(withIdentifier: "toPaymentMethodsVC", sender: nil)
            self.navigationController?.popViewController(animated: true)
        }
        
        else{
            errorMessage(titleInput: "Error!", messageInput: "Please enter your information.")
        }
    }
}
