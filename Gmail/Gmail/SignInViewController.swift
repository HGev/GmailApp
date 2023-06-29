//
//  SignInViewController.swift
//  Gmail
//
//  Created by appler on 28.06.23.
//

import UIKit
class SignInViewController: UIViewController {
    @IBOutlet weak var forgotEmailOutlet: UILabel!
    
    @IBOutlet weak var textFieldOutlet: UITextField!
    
    @IBOutlet weak var errorOutlet: UILabel!
    
    let notYourComputerLabel = UILabel()
    let createAccountbutton = UIButton()
    let nextButton = UIButton()
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpLabel()
        setUpNextButton()
        setUpCreateAccountButton()
    }

    private func setUpLabel() {
        notYourComputerLabel.font = UIFont.systemFont(ofSize: 15)
        notYourComputerLabel.text = "Not your computer? Use Private Browsing windows to sign in.Learn more"
        notYourComputerLabel.numberOfLines = 0
        notYourComputerLabel.lineBreakMode = .byTruncatingTail
        notYourComputerLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(notYourComputerLabel)
        NSLayoutConstraint.activate([
            notYourComputerLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25),
            notYourComputerLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            notYourComputerLabel.topAnchor.constraint(equalTo: forgotEmailOutlet.centerYAnchor, constant: 81)
        ])
    }
    private func setUpCreateAccountButton(){
        createAccountbutton.setTitle("Create account", for: .normal)
        createAccountbutton.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        createAccountbutton.setTitleColor(.blue, for: .normal)
        createAccountbutton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(createAccountbutton)
        NSLayoutConstraint.activate([
            createAccountbutton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25),
            createAccountbutton.topAnchor.constraint(equalTo: notYourComputerLabel.centerYAnchor, constant: 81)
        ])
        createAccountbutton.addTarget(self, action: #selector(createAccountButtonPressed), for: .touchUpInside)
    }
    @objc private func createAccountButtonPressed(){
        let createAccountViewController = (storyboard?.instantiateViewController(withIdentifier: "CreateAccountViewController"))!
            navigationController?.pushViewController(createAccountViewController, animated: true)
    }
    private func setUpNextButton() {
        nextButton.setTitle("Next", for: .normal)
        nextButton.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        nextButton.setTitleColor(.white, for: .normal)
        nextButton.backgroundColor = UIColor.blue
        nextButton.layer.cornerRadius = 5
        nextButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(nextButton)
        NSLayoutConstraint.activate([
            nextButton.widthAnchor.constraint(equalToConstant: 80),
            nextButton.heightAnchor.constraint(equalToConstant: 40),
            nextButton.topAnchor.constraint(equalTo: notYourComputerLabel.centerYAnchor, constant: 75),
            nextButton.trailingAnchor.constraint(equalTo: notYourComputerLabel.trailingAnchor)
        ])
        nextButton.addTarget(self, action: #selector(nextButtonPressed), for: .touchUpInside)
    }
    @objc private func nextButtonPressed(){
        guard let savedEmail = UserDefaults.standard.string(forKey: "email"),
              let enteredEmail = textFieldOutlet.text else {
            return
        }

        if enteredEmail == savedEmail {
            let nextViewController = storyboard?.instantiateViewController(withIdentifier: "NextViewController")
            navigationController?.pushViewController(nextViewController!, animated: true)
        } else {
            errorOutlet.isHidden = false
        }
    }
}
