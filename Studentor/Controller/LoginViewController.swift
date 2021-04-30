//
//  LoginViewController.swift
//  Studentor
//
//  Created by Еркебулан on 30.04.2021.
//

import UIKit
import Firebase
class LoginViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var forwardButton: UIButton!
  
    override func viewDidLoad() {
        super.viewDidLoad()
        forwardButton.layer.cornerRadius = 16
        forwardButton.layer.masksToBounds = true
    }
    
    @IBAction func forwardButtonPressed(_ sender: UIButton) {
        guard let email = emailTextField.text else { return }
        guard let password = passwordTextField.text else { return }
        
        Auth.auth().signIn(withEmail: email, password: password) { [weak self]
            (result, error) in
            if error != nil {
                print("Failed to login in, \(error!)")
            } else {
                let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
                if let vc = storyboard.instantiateViewController(withIdentifier: "TabBarController") as? TabBarController {
                    vc.modalPresentationStyle = .fullScreen
                    self?.present(vc, animated: false, completion: nil)
            }
        }
        }
    }
    
    @IBAction func goToRegistrationButtonPressed(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        if let vc = storyboard.instantiateViewController(withIdentifier: "RegistrationViewController") as? RegistrationViewController {
            vc.modalPresentationStyle = .fullScreen
            self.present(vc, animated: true, completion: nil)
        }
    }
}
