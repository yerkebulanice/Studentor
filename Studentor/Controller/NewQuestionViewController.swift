//
//  NewQuestionViewController.swift
//  Studentor
//
//  Created by Еркебулан on 18.05.2021.
//

import UIKit
import FirebaseAuth
import FirebaseDatabase

class NewQuestionViewController: UIViewController {

    @IBOutlet weak var courseNameTextField: UITextField!
    @IBOutlet weak var questionTextField: UITextField!
    @IBOutlet weak var deadlineDateTextField: UITextField!
    @IBOutlet weak var deadlineTimeTextField: UITextField!
    @IBOutlet weak var addedQuestionReminderView: UIView!
    @IBOutlet weak var askQuestionButton: UIButton!
    
    private let messageDB = Database.database().reference().child("Questions")
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func askQuestionButtonPressed(_ sender: Any) {
        sendQuestionToFirebase()
        if addedQuestionReminderView.isHidden == false {
            addedQuestionReminderView.isHidden = true
        } else {
            addedQuestionReminderView.isHidden = false
        }
    }
    
    @IBAction func closeButtonInViewPressed(_ sender: Any) {
        addedQuestionReminderView.isHidden = true
        courseNameTextField.text = ""
        questionTextField.text = ""
        deadlineDateTextField.text = ""
        deadlineTimeTextField.text = ""
    }
}

extension NewQuestionViewController {
    private func sendQuestionToFirebase() {
        guard let email = Auth.auth().currentUser?.email else { return }
        guard let courseName = courseNameTextField.text else { return }
        guard let question = questionTextField.text else { return }
        guard let deadlineDate = deadlineDateTextField.text else { return }
        guard let deadlineTime = deadlineTimeTextField.text else { return }
        let messageDict: [String: String] = ["sender": email, "courseName": courseName, "question": question, "deadlineDate": deadlineDate, "deadlineTime": deadlineTime]
        messageDB.childByAutoId().setValue(messageDict) { [weak self] (error, reference) in
            if error != nil {
                print("Failed to send message, \(error!)")
            } else {
                self?.askQuestionButton.isEnabled = true
            }
        }
        addedQuestionReminderView.isHidden = true
        courseNameTextField.text = ""
        questionTextField.text = ""
        deadlineDateTextField.text = ""
        deadlineTimeTextField.text = ""
    }
}
