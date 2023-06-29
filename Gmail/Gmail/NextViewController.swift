//
//  ViewController.swift
//  Gmail
//
//  Created by appler on 28.06.23.
//

import UIKit

class NextViewController: UIViewController {
    @IBOutlet weak var enterPasswordOutlet: UITextField!
    
    @IBOutlet weak var myGmailOutlet: UIButton!
    
    @IBOutlet weak var showPasswordCheckMarkOutlet: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        passwordTextFieldSetUp()
        addTapGestureToCheckMark()
        myGmailSetUp()
    }
    private func myGmailSetUp(){
        if let savedEmail = UserDefaults.standard.string(forKey: "email") {
               myGmailOutlet.setTitle(savedEmail, for: .normal)
           }
    }
    private func passwordTextFieldSetUp(){
        enterPasswordOutlet.isSecureTextEntry = true
    }
    private func addTapGestureToCheckMark() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(showPasswordTapped))
        showPasswordCheckMarkOutlet.isUserInteractionEnabled = true
        showPasswordCheckMarkOutlet.addGestureRecognizer(tapGesture)
    }
    
    @objc private func showPasswordTapped() {
        enterPasswordOutlet.isSecureTextEntry.toggle()
        let imageName = enterPasswordOutlet.isSecureTextEntry ? "square" : "checkmark.square"
        showPasswordCheckMarkOutlet.image = UIImage(systemName: imageName)
    }
    
    @IBAction func nextButtonPressedAction(_ sender: UIButton) {
        let password = UserDefaults.standard.string(forKey: "password")
            
            if let enteredPassword = enterPasswordOutlet.text, enteredPassword == password {
                
                
            } else {
                print("wrong password")
            }
    }
}

