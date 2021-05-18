//
//  MentorViewController.swift
//  Studentor
//
//  Created by Еркебулан on 30.04.2021.
//

import UIKit

class MentorViewController: UIViewController {

    @IBOutlet weak var findMentorTextField: UITextField!
    @IBOutlet weak var findButton: UIButton!
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        findButton.layer.cornerRadius = 8
        findButton.layer.masksToBounds = true
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.register(UINib(nibName: MentorTableView.identifier, bundle: Bundle(for: MentorTableView.self)), forCellReuseIdentifier: MentorTableView.identifier)
//        tableView.rowHeight = UITableView.automaticDimension
//        tableView.estimatedRowHeight = 600
    }

    @IBAction func findButtonPressed(_ sender: UIButton) {
        
    }
}

extension MentorViewController: UITableViewDelegate {
    
}

extension MentorViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MentorTableView.identifier, for: indexPath) as! MentorTableView
        if indexPath.row % 2 == 0 {
            cell.backgroundColor = UIColor(red: 218, green: 159, blue: 249, alpha: 100)
        } else {
            cell.backgroundColor = UIColor(red: 176, green: 136, blue: 249, alpha: 100)
        }
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 246
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
