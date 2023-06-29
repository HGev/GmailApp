//
//  CreateYourEmailViewController.swift
//  Gmail
//
//  Created by appler on 29.06.23.
//

import UIKit

class CreateYourEmailViewController: UIViewController {

    @IBOutlet weak var gmailAddressOutlet: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let savedEmail = UserDefaults.standard.string(forKey: "email") {
                    gmailAddressOutlet.text = savedEmail
                }
    }
    
    @IBAction func createYourPasswordNextButtonAction(_ sender: Any) {
        if let email = gmailAddressOutlet.text {
                    UserDefaults.standard.set(email, forKey: "email")
                }
        
    }
}
