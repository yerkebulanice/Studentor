//
//  NewQuestionViewController.swift
//  Studentor
//
//  Created by Еркебулан on 18.05.2021.
//

import UIKit

class NewQuestionViewController: UIViewController {

    @IBOutlet weak var addedQuestionReminderView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func askQuestionButtonPressed(_ sender: Any) {
        if addedQuestionReminderView.isHidden == false {
            addedQuestionReminderView.isHidden = true
        } else {
            addedQuestionReminderView.isHidden = false
        }
    }
}
