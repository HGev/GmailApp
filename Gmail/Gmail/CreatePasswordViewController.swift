//
//  CreatePasswordViewController.swift
//  Gmail
//
//  Created by appler on 29.06.23.
//

import UIKit

class CreatePasswordViewController: UIViewController {
    
    @IBOutlet weak var errorOutlet: UILabel!
    @IBOutlet weak var enterPasswordOutlet: UITextField!
    @IBOutlet weak var confirmPasswordOutlet: UITextField!
    @IBOutlet weak var showPasswordCheckMarkOutlet: UIImageView!
    @IBOutlet weak var labelOutlet: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpLabel()
        addTapGestureToCheckMark()
    }
    
    private func setUpLabel(){
        labelOutlet.numberOfLines = 0
        labelOutlet.lineBreakMode = .byTruncatingTail
    }
    private func addTapGestureToCheckMark() {
        enterPasswordOutlet.isSecureTextEntry = true
        confirmPasswordOutlet.isSecureTextEntry = true
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(showPasswordTapped))
        showPasswordCheckMarkOutlet.isUserInteractionEnabled = true
        showPasswordCheckMarkOutlet.addGestureRecognizer(tapGesture)
    }
    
    @objc private func showPasswordTapped() {
        enterPasswordOutlet.isSecureTextEntry.toggle()
        confirmPasswordOutlet.isSecureTextEntry.toggle()
        let imageName = enterPasswordOutlet.isSecureTextEntry ? "square" : "checkmark.square"
        showPasswordCheckMarkOutlet.image = UIImage(systemName: imageName)
    }
    
    
    @IBAction func savePasswordAction(_ sender: Any) {
        guard let password = enterPasswordOutlet.text,
               let confirmPassword = confirmPasswordOutlet.text,
               !password.isEmpty, !confirmPassword.isEmpty else {
             return
         }

         if password == confirmPassword {
             UserDefaults.standard.set(password, forKey: "password")
             let signInViewController = storyboard?.instantiateViewController(withIdentifier: "SignInViewController") as! SignInViewController
             navigationController?.pushViewController(signInViewController, animated: true)
            
         } else {
             errorOutlet.isHidden = false
         }
    }
}
