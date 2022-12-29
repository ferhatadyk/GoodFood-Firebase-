//
//  paymentViewController.swift
//  GoodFood
//
//  Created by Ferhat Adiyeke on 25.11.2022.
//

import UIKit
import Firebase


class paymentViewController: UIViewController{
  
    // MARK: -outlets
    @IBOutlet weak var tableView: UITableView!
   
    // MARK: -variables
    let databaseRef = Database.database(url: "https://goodfood-718da-default-rtdb.europe-west1.firebasedatabase.app/").reference()
    var cardNo = [String]()
    var Dname = [String]()

    
    // MARK: -lifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        

        databaseRef.child("Card").queryOrdered(byChild: "uid").queryEqual(toValue: Auth.auth().currentUser!.uid).observeSingleEvent(of: .value)  { (snapshot) in
            for child in snapshot.children{
                let snap = child as! DataSnapshot
                let dict = snap.value as! NSDictionary
                
                var cardNo = ""
                cardNo += dict["cardNo"] as! String + "\n"
                cardNo = cardNo
                
               var Dname = ""
                Dname += dict["Dname"] as! String + "\n"
                Dname = Dname
                
              
            }
        }
        self.tableView.reloadData()
    }
    
    // MARK: -button
    @IBAction func close(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
   
    @IBAction func addCardBtn(_ sender: UIButton) {
        performSegue(withIdentifier: "addPaymentVC", sender: nil)
    }
    
}


// MARK: -extension
extension paymentViewController: UITableViewDelegate, UITableViewDataSource {
// MARK: -tableview
func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return cardNo.count
}

func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
    cell.textLabel?.text = cardNo[indexPath.row]
    cell.detailTextLabel?.text = Dname[indexPath.row]

    
    return cell
}

func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    let segueIdentifier: String
    switch indexPath.row {
    case 0:
        segueIdentifier = "paymentVC"
    case 1:
        segueIdentifier = "paymentVC"
    default:
        segueIdentifier = "paymentVC"
    }
    self.performSegue(withIdentifier: segueIdentifier, sender: self)
}
//performSegue(withIdentifier: "accountVC", sender: nil)

}
