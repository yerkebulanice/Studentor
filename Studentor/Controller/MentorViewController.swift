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
        tableView.register(UINib(nibName: MentorTableView.identifier, bundle: Bundle(for: MentorTableView.self)), forCellReuseIdentifier: MentorTableView.identifier)
    }

    @IBAction func findButtonPressed(_ sender: UIButton) {
        
    }
}

extension MentorViewController: UITableViewDelegate {
    
}

extension MentorViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MentorTableView.identifier, for: indexPath) as! MentorTableView
        return cell
    }
    
    
}
