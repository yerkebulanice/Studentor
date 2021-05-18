//
//  MentorTableView.swift
//  Studentor
//
//  Created by Еркебулан on 30.04.2021.
//

import UIKit

class MentorTableView: UITableViewCell {
    public static let identifier: String = "MentorTableView"
    @IBOutlet weak var contentViewChange: UIView!
    @IBOutlet weak var selectMentorButton: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        contentViewChange.layer.cornerRadius = 8
        contentViewChange.layer.masksToBounds = true
        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10))
        selectMentorButton.layer.cornerRadius = 8
        selectMentorButton.layer.masksToBounds = true
    }

}
