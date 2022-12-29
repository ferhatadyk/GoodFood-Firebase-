//
//  orderLastDetailsViewController.swift
//  GoodFood
//
//  Created by Ferhat Adiyeke on 25.11.2022.
//

import UIKit
import Firebase

class orderLastDetailsViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    // MARK: -outlets
    @IBOutlet weak var addressLbl: UILabel!
    @IBOutlet weak var selectionBtn: UIButton!
    @IBOutlet weak var pcikerView: UIPickerView!
    let card = ["Online Credit Card/Debit Card", "Cash", "Pay at the door", "Food Card"]
    
    // MARK: -variables
    let databaseRef = Database.database(url: "https://goodfood-718da-default-rtdb.europe-west1.firebasedatabase.app/").reference()

    // MARK: -lifeCycle
    override func viewDidLoad() {
        pcikerView.isHidden = true
        pcikerView.delegate = self
        pcikerView.dataSource = self
        super.viewDidLoad()
        databaseRef.child("users").queryOrdered(byChild: "uid").queryEqual(toValue: Auth.auth().currentUser!.uid).observeSingleEvent(of: .value)  { (snapshot) in
            for child in snapshot.children{
                let snap = child as! DataSnapshot
                let dict = snap.value as! NSDictionary
                var address = ""
                address += dict["address"] as! String + "\n"
                self.addressLbl.text = address
            }
        }
    }
    
    
    
    
    
    
    
    // MARK: -button
    
    @IBAction func selectionPressed(_ sender: UIButton) {
        
        if pcikerView.isHidden {
            pcikerView.isHidden = false
        }
    }
    
    // MARK: -PICKER

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
        
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return card.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return card[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent: Int) {
        selectionBtn.setTitle(card[row], for: .normal)
        pcikerView.isHidden = true
    }
    
    
    @IBAction func adressEdit(_ sender: UIButton) {
        performSegue(withIdentifier: "deliveryAddressVC", sender: nil)
    }
    
    @IBAction func temazsızSwitch(_ sender: UISwitch) {
    }
    
    @IBAction func cardAddBtn(_ sender: UIButton) {
        performSegue(withIdentifier: "paymentChangeVC", sender: nil)
    }
    
    @IBAction func agreementSwitch(_ sender: UISwitch) {
    }
    
    @IBAction func createOrder(_ sender: UIButton) {
        performSegue(withIdentifier: "TrackingVC", sender: nil)
    }
    
}
