//
//  RegistrationViewController.swift
//  Studentor
//
//  Created by Еркебулан on 28.04.2021.
//

import UIKit
import Firebase
class RegistrationViewController: UIViewController {
    
    @IBOutlet weak var registrationTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var forwardButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        forwardButton.layer.cornerRadius = 16
        forwardButton.layer.masksToBounds = true
    }
    
    @IBAction func forwardButtonPressed(_ sender: UIButton) {
        guard let email = registrationTextField.text else { return }
        guard let password = passwordTextField.text else { return }
        
        Auth.auth().createUser(withEmail: email, password: password) { [weak self]
            (result, error) in
            if let error = error {
                print("Failed to create user, \(error)")
            } else {
//                self?.performSegue(withIdentifier: "goToChatFromRegistration", sender: nil)
                self?.dismiss(animated: true, completion: nil)
            }
        }
    }
    
}
