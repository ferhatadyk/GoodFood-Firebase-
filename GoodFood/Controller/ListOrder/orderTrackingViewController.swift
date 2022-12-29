//
//  orderTrackingViewController.swift
//  GoodFood
//
//  Created by Ferhat Adiyeke on 25.11.2022.
//

import UIKit

class orderTrackingViewController: UIViewController {

   
    
    // MARK: -lifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: -button
    @IBAction func backHome(_ sender: UIButton) {
        performSegue(withIdentifier: "backHomeVC", sender: nil)
        
    }
    
    @IBAction func liveOrderBtn(_ sender: UIButton) {
        performSegue(withIdentifier: "liveOrderTracking", sender: nil)
    }
    
    @IBAction func supportBtn(_ sender: UIButton) {
        performSegue(withIdentifier: "HelpingVC", sender: nil)
    }
    
    @IBAction func close(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    
}
