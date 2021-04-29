//
//  RegistrationViewController.swift
//  Studentor
//
//  Created by Еркебулан on 28.04.2021.
//

import UIKit

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
        self.dismiss(animated: true, completion: nil)
    }
    
}
