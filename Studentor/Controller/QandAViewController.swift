//
//  QandAViewController.swift
//  Studentor
//
//  Created by Еркебулан on 30.04.2021.
//

import UIKit
import FirebaseAuth
import FirebaseDatabase
class QandAViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: GeneralQuestionsCell.identifier, bundle: Bundle(for: GeneralQuestionsCell.self)), forCellReuseIdentifier: GeneralQuestionsCell.identifier)
    }
    private let questionDB = Database.database().reference().child("Questions")
    private var questions: [QuestionEntity] = []
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        fetchQuestionsFromFirebase()
    }
    
}

extension QandAViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return questions.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: GeneralQuestionsCell.identifier, for: indexPath) as! GeneralQuestionsCell
        cell.senderLabel.text = questions[indexPath.row].sender
        cell.questionLabel.text = questions[indexPath.row].question
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 180
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        headerView.backgroundColor = view.backgroundColor
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 20
    }
    
}

extension QandAViewController {
    private func fetchQuestionsFromFirebase() {
            questionDB.observe(.childAdded) { [weak self] (snapshot) in
                if let values = snapshot.value as? [String: String] {
                    guard let sender = values["sender"] else { return }
                    guard let courseName = values["courseName"] else { return }
                    guard let question = values["question"] else { return }
                    guard let deadlineDate = values["deadlineDate"] else { return }
                    guard let deadlineTime = values["deadlineTime"] else { return }
                    self?.questions.append(QuestionEntity(sender: sender, courseName: courseName, question: question, date: deadlineDate, time: deadlineTime))
                    self?.tableView.reloadData()
//                    self?.scrollToLastMessage()
                }
            }
        }
}
