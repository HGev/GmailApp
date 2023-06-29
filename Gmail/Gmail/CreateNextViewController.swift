//
//  CreateNextViewController.swift
//  Gmail
//
//  Created by appler on 29.06.23.
//

import UIKit

class CreateNextViewController: UIViewController {
    @IBOutlet weak var genderTextFieldOutlet: UITextField!
    
    @IBOutlet weak var dateTextFieldOutlet: UITextField!
    
    @IBOutlet weak var monthTextFieldOutlet: UITextField!
    
    @IBOutlet weak var errorLabelOutlet: UILabel!
    
    @IBOutlet weak var yearTextFieldOutlet: UITextField!
    let dateRange = 1...30
    let monthRange = 1...12
    let yearRange = 1900...2023
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    

    @IBAction func nextButtonAction(_ sender: Any) {
        if dateTextFieldOutlet.text == nil || monthTextFieldOutlet.text == nil || yearTextFieldOutlet.text == nil || genderTextFieldOutlet.text == nil || genderTextFieldOutlet.text != "male" || genderTextFieldOutlet.text == "female" || !dateRange.contains(Int(dateTextFieldOutlet.text!)!) || !monthRange.contains(Int(monthTextFieldOutlet.text!)!) || !yearRange.contains(Int(yearTextFieldOutlet.text!)!) {
            errorLabelOutlet.isHidden = false
            errorLabelOutlet.numberOfLines = 0
            errorLabelOutlet.lineBreakMode = .byTruncatingTail
            errorLabelOutlet.text = "Not all fields are filled,or are filled incorrectly"
        }else {
            let CreateYourEmailViewController = (storyboard?.instantiateViewController(withIdentifier: "CreateYourEmailViewController"))!
            navigationController?.pushViewController(CreateYourEmailViewController, animated: true)
        }
    }
}
